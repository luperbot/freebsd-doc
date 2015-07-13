========================
4.?Setting Up Journaling
========================

.. raw:: html

   <div class="navheader">

4.?Setting Up Journaling
`Prev <reserve-space.html>`__?
?
?\ `Next <troubleshooting-gjournal.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.?Setting Up Journaling
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Executing ``gjournal``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Having prepared all the required partitions, it is quite easy to
configure journaling. We will need to switch to single user mode, so
login as ``root`` and type:

.. code:: screen

    # shutdown now

Press **Enter** to get the default shell. We will need to unmount the
partitions that will be journaled, in our example ``/usr`` and ``/var``:

.. code:: screen

    # umount /usr /var

Load the module required for journaling:

.. code:: screen

    # gjournal load

Now, use your notes to determine which partition will be used for each
journal. In our example, ``/usr`` is ``ad0s1f`` and its journal will be
``ad0s1g``, while ``/var`` is ``ad0s1d`` and will be journaled to
``ad0s1h``. The following commands are required:

.. code:: screen

    # gjournal label ad0s1f ad0s1g

    GEOM_JOURNAL: Journal 2948326772: ad0s1f contains data.
    GEOM_JOURNAL: Journal 2948326772: ad0s1g contains journal.

    # gjournal label ad0s1d ad0s1h

    GEOM_JOURNAL: Journal 3193218002: ad0s1d contains data.
    GEOM_JOURNAL: Journal 3193218002: ad0s1h contains journal.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If the last sector of either partition is used, ``gjournal`` will return
an error. You will have to run the command using the ``-f`` flag to
force an overwrite, i.e.:

.. code:: screen

    # gjournal label -f ad0s1d ad0s1h

Since this is a new installation, it is highly unlikely that anything
will be actually overwritten.

.. raw:: html

   </div>

At this point, two new devices are created, namely ``ad0s1d.journal``
and ``ad0s1f.journal``. These represent the ``/var`` and ``/usr``
partitions we have to mount. Before mounting, we must however set the
journal flag on them and clear the Soft Updates flag:

.. code:: screen

    # tunefs -J enable -n disable ad0s1d.journal

    tunefs: gjournal set
    tunefs: soft updates cleared

    # tunefs -J enable -n disable ad0s1f.journal

    tunefs: gjournal set
    tunefs: soft updates cleared

Now, mount the new devices manually at their respective places (note
that we can now use the ``async`` mount option):

.. code:: screen

    # mount -o async /dev/ad0s1d.journal /var
    # mount -o async /dev/ad0s1f.journal /usr

Edit ``/etc/fstab`` and update the entries for ``/usr`` and ``/var``:

.. code:: programlisting

    /dev/ad0s1f.journal     /usr            ufs     rw,async      2       2
    /dev/ad0s1d.journal     /var            ufs     rw,async      2       2

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Make sure the above entries are correct, or you will have trouble
starting up normally after you reboot!

.. raw:: html

   </div>

Finally, edit ``/boot/loader.conf`` and add the following line so the
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8>`__
module is loaded at every boot:

.. code:: programlisting

    geom_journal_load="YES"

Congratulations! Your system is now set for journaling. You can either
type **``exit``** to return to multi-user mode, or reboot to test your
configuration (recommended). During the boot you will see messages like
the following:

.. code:: screen

    ad0: 76293MB XEC XE800JD-00HBC0 08.02D08 at ata0-master SATA150
    GEOM_JOURNAL: Journal 2948326772: ad0s1g contains journal.
    GEOM_JOURNAL: Journal 3193218002: ad0s1h contains journal.
    GEOM_JOURNAL: Journal 3193218002: ad0s1d contains data.
    GEOM_JOURNAL: Journal ad0s1d clean.
    GEOM_JOURNAL: Journal 2948326772: ad0s1f contains data.
    GEOM_JOURNAL: Journal ad0s1f clean.

After an unclean shutdown, the messages will vary slightly, i.e.:

.. code:: screen

    GEOM_JOURNAL: Journal ad0s1d consistent.

This usually means that
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8>`__
used the information in the journal provider to return the file system
to a consistent state.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.?Journaling Newly Created Partitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While the above procedure is necessary for journaling partitions that
already contain data, journaling an empty partition is somewhat easier,
since both the data and the journal provider can be stored in the same
partition. For example, assume a new disk was installed, and a new
partition ``/dev/ad1s1d`` was created. Creating the journal would be as
simple as:

.. code:: screen

    # gjournal label ad1s1d

The journal size will be 1?GB by default. You may adjust it by using the
``-s`` option. The value can be given in bytes, or appended by ``K``,
``M`` or ``G`` to denote Kilobytes, Megabytes or Gigabytes respectively.
Note that ``gjournal`` will not allow you to create unsuitably small
journal sizes.

For example, to create a 2?GB journal, you could use the following
command:

.. code:: screen

    # gjournal label -s 2G ad1s1d

You can then create a file system on your new partition, and enable
journaling using the ``-J`` option:

.. code:: screen

    # newfs -J /dev/ad1s1d.journal

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.?Building Journaling into Your Custom Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you do not wish to load ``geom_journal`` as a module, you can build
its functions right into your kernel. Edit your custom kernel
configuration file, and make sure it includes these two lines:

.. code:: programlisting

    options UFS_GJOURNAL # Note: This is already in GENERIC

    options GEOM_JOURNAL # You will have to add this one

Rebuild and reinstall your kernel following the relevant `instructions
in the
FreeBSD?Handbook. <../../../../doc/en_US.ISO8859-1/books/handbook/kernelconfig.html>`__

Do not forget to remove the relevant “load” entry from
``/boot/loader.conf`` if you have previously used it.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <reserve-space.html>`__?                 | ?                       | ?\ `Next <troubleshooting-gjournal.html>`__   |
+------------------------------------------------+-------------------------+-----------------------------------------------+
| 3.?Steps During the Installation of FreeBSD?   | `Home <index.html>`__   | ?5.?Troubleshooting Journaling                |
+------------------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
