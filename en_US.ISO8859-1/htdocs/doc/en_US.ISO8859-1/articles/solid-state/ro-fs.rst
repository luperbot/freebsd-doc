=============================================
3.?The rc Subsystem and Read-Only Filesystems
=============================================

.. raw:: html

   <div class="navheader">

3.?The ``rc`` Subsystem and Read-Only Filesystems
`Prev <kernel.html>`__?
?
?\ `Next <ar01s04.html>`__

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

3.?The ``rc`` Subsystem and Read-Only Filesystems
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The post-boot initialization of an embedded FreeBSD system is controlled
by ``/etc/rc.initdiskless``.

``/etc/rc.d/var`` mounts ``/var`` as a memory filesystem, makes a
configurable list of directories in ``/var`` with the
`mkdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkdir&sektion=1>`__
command, and changes modes on some of those directories. In the
execution of ``/etc/rc.d/var``, one other ``rc.conf`` variable comes
into play – ``varsize``. A ``/var`` partition is created by
``/etc/rc.d/var`` based on the value of this variable in ``rc.conf``:

.. code:: programlisting

    varsize=8192

Remember that this value is in sectors by default.

The fact that ``/var`` is a read-write filesystem is an important
distinction, as the ``/`` partition (and any other partitions you may
have on your flash media) should be mounted read-only. Remember that in
`Section?1, “Solid State Disk Devices” <index.html#intro>`__ we detailed
the limitations of flash memory - specifically the limited write
capability. The importance of not mounting filesystems on flash media
read-write, and the importance of not using a swap file, cannot be
overstated. A swap file on a busy system can burn through a piece of
flash media in less than one year. Heavy logging or temporary file
creation and destruction can do the same. Therefore, in addition to
removing the ``swap`` entry from your ``/etc/fstab``, you should also
change the Options field for each filesystem to ``ro`` as follows:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/ad0s1a             /               ufs     ro              1       1

A few applications in the average system will immediately begin to fail
as a result of this change. For instance, cron will not run properly as
a result of missing cron tabs in the ``/var`` created by
``/etc/rc.d/var``, and syslog and dhcp will encounter problems as well
as a result of the read-only filesystem and missing items in the
``/var`` that ``/etc/rc.d/var`` has created. These are only temporary
problems though, and are addressed, along with solutions to the
execution of other common software packages in `Section?5, “System
Strategies for Small and Read Only Environments” <strategies.html>`__.

An important thing to remember is that a filesystem that was mounted
read-only with ``/etc/fstab`` can be made read-write at any time by
issuing the command:

.. code:: screen

    # /sbin/mount -uw partition

and can be toggled back to read-only with the command:

.. code:: screen

    # /sbin/mount -ur partition

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+-------------------------------------------+
| `Prev <kernel.html>`__?   | ?                       | ?\ `Next <ar01s04.html>`__                |
+---------------------------+-------------------------+-------------------------------------------+
| 2.?Kernel Options?        | `Home <index.html>`__   | ?4.?Building a File System from Scratch   |
+---------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
