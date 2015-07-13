=============================
9.4.?Block Devices (Are Gone)
=============================

.. raw:: html

   <div class="navheader">

9.4.?Block Devices (Are Gone)
`Prev <driverbasics-char.html>`__?
Chapter?9.?Writing FreeBSD Device Drivers
?\ `Next <driverbasics-net.html>`__

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

9.4.?Block Devices (Are Gone)
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Other UNIX? systems may support a second type of disk device known as
block devices. Block devices are disk devices for which the kernel
provides caching. This caching makes block-devices almost unusable, or
at least dangerously unreliable. The caching will reorder the sequence
of write operations, depriving the application of the ability to know
the exact disk contents at any one instant in time. This makes
predictable and reliable crash recovery of on-disk data structures
(filesystems, databases etc.) impossible. Since writes may be delayed,
there is no way the kernel can report to the application which
particular write operation encountered a write error, this further
compounds the consistency problem. For this reason, no serious
applications rely on block devices, and in fact, almost all applications
which access disks directly take great pains to specify that character
(or “raw”) devices should always be used. Because the implementation of
the aliasing of each disk (partition) to two devices with different
semantics significantly complicated the relevant kernel code FreeBSD
dropped support for cached disk devices as part of the modernization of
the disk I/O infrastructure.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+------------------------------+---------------------------------------+
| `Prev <driverbasics-char.html>`__?   | `Up <driverbasics.html>`__   | ?\ `Next <driverbasics-net.html>`__   |
+--------------------------------------+------------------------------+---------------------------------------+
| 9.3.?Character Devices?              | `Home <index.html>`__        | ?9.5.?Network Drivers                 |
+--------------------------------------+------------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
