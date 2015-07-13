=================
2.?Kernel Options
=================

.. raw:: html

   <div class="navheader">

2.?Kernel Options
`Prev <index.html>`__?
?
?\ `Next <ro-fs.html>`__

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

2.?Kernel Options
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A few kernel options are of specific interest to those creating an
embedded FreeBSD system.

All embedded FreeBSD systems that use flash memory as system disk will
be interested in memory disks and memory filesystems. Because of the
limited number of writes that can be done to flash memory, the disk and
the filesystems on the disk will most likely be mounted read-only. In
this environment, filesystems such as ``/tmp`` and ``/var`` are mounted
as memory filesystems to allow the system to create logs and update
counters and temporary files. Memory filesystems are a critical
component to a successful solid state FreeBSD implementation.

You should make sure the following lines exist in your kernel
configuration file:

.. code:: programlisting

    options         MFS             # Memory Filesystem
    options         MD_ROOT         # md device usable as a potential root device
    pseudo-device   md              # memory disk

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+------------------------------------------------------+
| `Prev <index.html>`__?             | ?                       | ?\ `Next <ro-fs.html>`__                             |
+------------------------------------+-------------------------+------------------------------------------------------+
| FreeBSD and Solid State Devices?   | `Home <index.html>`__   | ?3.?The ``rc`` Subsystem and Read-Only Filesystems   |
+------------------------------------+-------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
