==============================
Chapter?21.?Other File Systems
==============================

.. raw:: html

   <div class="navheader">

Chapter?21.?Other File Systems
`Prev <zfs-term.html>`__?
Part?III.?System Administration
?\ `Next <filesystems-linux.html>`__

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

Chapter?21.?Other File Systems
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

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

`21.1. Synopsis <filesystems.html#filesystems-synopsis>`__
`21.2. Linux? File Systems <filesystems-linux.html>`__

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

21.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

File systems are an integral part of any operating system. They allow
users to upload and store files, provide access to data, and make hard
drives useful. Different operating systems differ in their native file
system. Traditionally, the native FreeBSD file system has been the Unix
File System UFS which has been modernized as UFS2. Since FreeBSD?7.0,
the Z File System (ZFS) is also available as a native file system. See
`Chapter?20, *The Z File System (ZFS)* <zfs.html>`__ for more
information.

In addition to its native file systems, FreeBSD supports a multitude of
other file systems so that data from other operating systems can be
accessed locally, such as data stored on locally attached USB storage
devices, flash drives, and hard disks. This includes support for the
Linux? Extended File System (EXT) and the Reiser file system.

There are different levels of FreeBSD support for the various file
systems. Some require a kernel module to be loaded and others may
require a toolset to be installed. Some non-native file system support
is full read-write while others are read-only.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  The difference between native and supported file systems.

-  Which file systems are supported by FreeBSD.

-  How to enable, configure, access, and make use of non-native file
   systems.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand UNIX? and `FreeBSD basics <basics.html>`__.

-  Be familiar with the basics of `kernel configuration and
   compilation <kernelconfig.html>`__.

-  Feel comfortable `installing software <ports.html>`__ in FreeBSD.

-  Have some familiarity with `disks <disks.html>`__, storage, and
   device names in FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------------------+----------------------------------------+
| `Prev <zfs-term.html>`__?             | `Up <system-administration.html>`__   | ?\ `Next <filesystems-linux.html>`__   |
+---------------------------------------+---------------------------------------+----------------------------------------+
| 20.8.?ZFS Features and Terminology?   | `Home <index.html>`__                 | ?21.2.?Linux? File Systems             |
+---------------------------------------+---------------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
