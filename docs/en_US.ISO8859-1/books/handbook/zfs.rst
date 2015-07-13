===================================
Chapter?20.?The Z File System (ZFS)
===================================

.. raw:: html

   <div class="navheader">

Chapter?20.?The Z File System (ZFS)
`Prev <geom-gjournal.html>`__?
Part?III.?System Administration
?\ `Next <zfs-quickstart.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?20.?The Z File System (ZFS)
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes, Allan Jude, Benedict Reuschling and Warren Block.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`20.1. What Makes ZFS Different <zfs.html#zfs-differences>`__
`20.2. Quick Start Guide <zfs-quickstart.html>`__
`20.3. ``zpool`` Administration <zfs-zpool.html>`__
`20.4. ``zfs`` Administration <zfs-zfs.html>`__
`20.5. Delegated Administration <zfs-zfs-allow.html>`__
`20.6. Advanced Topics <zfs-advanced.html>`__
`20.7. Additional Resources <zfs-links.html>`__
`20.8. ZFS Features and Terminology <zfs-term.html>`__

.. raw:: html

   </div>

The *Z File System*, or ZFS, is an advanced file system designed to
overcome many of the major problems found in previous designs.

Originally developed at Sun™, ongoing open source ZFS development has
moved to the `OpenZFS Project <http://open-zfs.org>`__.

ZFS has three major design goals:

.. raw:: html

   <div class="itemizedlist">

-  Data integrity: All data includes a
   `checksum <zfs-term.html#zfs-term-checksum>`__ of the data. When data
   is written, the checksum is calculated and written along with it.
   When that data is later read back, the checksum is calculated again.
   If the checksums do not match, a data error has been detected. ZFS
   will attempt to automatically correct errors when data redundancy is
   available.

-  Pooled storage: physical storage devices are added to a pool, and
   storage space is allocated from that shared pool. Space is available
   to all file systems, and can be increased by adding new storage
   devices to the pool.

-  Performance: multiple caching mechanisms provide increased
   performance. `ARC <zfs-term.html#zfs-term-arc>`__ is an advanced
   memory-based read cache. A second level of disk-based read cache can
   be added with `L2ARC <zfs-term.html#zfs-term-l2arc>`__, and
   disk-based synchronous write cache is available with
   `ZIL <zfs-term.html#zfs-term-zil>`__.

.. raw:: html

   </div>

A complete list of features and terminology is shown in `Section?20.8,
“ZFS Features and Terminology” <zfs-term.html>`__.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.1.?What Makes ZFS Different
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ZFS is significantly different from any previous file system because it
is more than just a file system. Combining the traditionally separate
roles of volume manager and file system provides ZFS with unique
advantages. The file system is now aware of the underlying structure of
the disks. Traditional file systems could only be created on a single
disk at a time. If there were two disks then two separate file systems
would have to be created. In a traditional hardware RAID configuration,
this problem was avoided by presenting the operating system with a
single logical disk made up of the space provided by a number of
physical disks, on top of which the operating system placed a file
system. Even in the case of software RAID solutions like those provided
by GEOM, the UFS file system living on top of the RAID transform
believed that it was dealing with a single device. ZFS's combination of
the volume manager and the file system solves this and allows the
creation of many file systems all sharing a pool of available storage.
One of the biggest advantages to ZFS's awareness of the physical layout
of the disks is that existing file systems can be grown automatically
when additional disks are added to the pool. This new space is then made
available to all of the file systems. ZFS also has a number of different
properties that can be applied to each file system, giving many
advantages to creating a number of different file systems and datasets
rather than a single monolithic file system.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------------+-------------------------------------+
| `Prev <geom-gjournal.html>`__?       | `Up <system-administration.html>`__   | ?\ `Next <zfs-quickstart.html>`__   |
+--------------------------------------+---------------------------------------+-------------------------------------+
| 19.8.?UFS Journaling Through GEOM?   | `Home <index.html>`__                 | ?20.2.?Quick Start Guide            |
+--------------------------------------+---------------------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
