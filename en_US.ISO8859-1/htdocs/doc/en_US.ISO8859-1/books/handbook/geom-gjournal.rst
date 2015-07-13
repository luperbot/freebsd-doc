=================================
19.8.?UFS Journaling Through GEOM
=================================

.. raw:: html

   <div class="navheader">

19.8.?UFS Journaling Through GEOM
`Prev <geom-glabel.html>`__?
Chapter?19.?GEOM: Modular Disk Transformation Framework
?\ `Next <zfs.html>`__

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

19.8.?UFS Journaling Through GEOM
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginning with FreeBSD?7.0, support for journals on UFS file systems is
available. The implementation is provided through the GEOM subsystem and
is configured using ``gjournal``. Unlike other file system journaling
implementations, the ``gjournal`` method is block based and not
implemented as part of the file system. It is a GEOM extension.

Journaling stores a log of file system transactions, such as changes
that make up a complete disk write operation, before meta-data and file
writes are committed to the disk. This transaction log can later be
replayed to redo file system transactions, preventing file system
inconsistencies.

This method provides another mechanism to protect against data loss and
inconsistencies of the file system. Unlike Soft Updates, which tracks
and enforces meta-data updates, and snapshots, which create an image of
the file system, a log is stored in disk space specifically for this
task. For better performance, the journal may be stored on another disk.
In this configuration, the journal provider or storage device should be
listed after the device to enable journaling on.

The ``GENERIC`` kernel provides support for ``gjournal``. To
automatically load the ``geom_journal.ko`` kernel module at boot time,
add the following line to ``/boot/loader.conf``:

.. code:: programlisting

    geom_journal_load="YES"

If a custom kernel is used, ensure the following line is in the kernel
configuration file:

.. code:: programlisting

    options GEOM_JOURNAL

Once the module is loaded, a journal can be created on a new file system
using the following steps. In this example, ``da4`` is a new SCSI disk:

.. code:: screen

    # gjournal load
    # gjournal label /dev/da4

This will load the module and create a ``/dev/da4.journal`` device node
on ``/dev/da4``.

A UFS file system may now be created on the journaled device, then
mounted on an existing mount point:

.. code:: screen

    # newfs -O 2 -J /dev/da4.journal
    # mount /dev/da4.journal /mnt

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In the case of several slices, a journal will be created for each
individual slice. For instance, if ``ad4s1`` and ``ad4s2`` are both
slices, then ``gjournal`` will create ``ad4s1.journal`` and
``ad4s2.journal``.

.. raw:: html

   </div>

Journaling may also be enabled on current file systems by using
``tunefs``. However, *always* make a backup before attempting to alter
an existing file system. In most cases, ``gjournal`` will fail if it is
unable to create the journal, but this does not protect against data
loss incurred as a result of misusing ``tunefs``. Refer to
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8>`__
and
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
for more information about these commands.

It is possible to journal the boot disk of a FreeBSD system. Refer to
the article `Implementing UFS Journaling on a Desktop
PC <../../../../doc/en_US.ISO8859-1/articles/gjournal-desktop>`__ for
detailed instructions.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------------------+
| `Prev <geom-glabel.html>`__?   | `Up <geom.html>`__      | ?\ `Next <zfs.html>`__                 |
+--------------------------------+-------------------------+----------------------------------------+
| 19.7.?Labeling Disk Devices?   | `Home <index.html>`__   | ?Chapter?20.?The Z File System (ZFS)   |
+--------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
