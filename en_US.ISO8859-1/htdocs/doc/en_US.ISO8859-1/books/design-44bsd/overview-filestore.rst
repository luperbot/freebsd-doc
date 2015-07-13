===============
2.8.?Filestores
===============

.. raw:: html

   <div class="navheader">

2.8.?Filestores
`Prev <overview-filesystem.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-nfs.html>`__

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

2.8.?Filestores
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The operations defined for local filesystems are divided into two parts.
Common to all local filesystems are hierarchical naming, locking,
quotas, attribute management, and protection. These features are
independent of how the data will be stored. 4.4BSD has a single
implementation to provide these semantics.

The other part of the local filesystem is the organization and
management of the data on the storage media. Laying out the contents of
files on the storage media is the responsibility of the filestore.
4.4BSD supports three different filestore layouts:

.. raw:: html

   <div class="itemizedlist">

-  The traditional Berkeley Fast Filesystem

-  The log-structured filesystem, based on the Sprite operating-system
   design `[Rosenblum & Ousterhout,
   1992] <overview.html#biblio-rosenblum>`__

-  A memory-based filesystem

.. raw:: html

   </div>

Although the organizations of these filestores are completely different,
these differences are indistinguishable to the processes using the
filestores.

The Fast Filesystem organizes data into cylinder groups. Files that are
likely to be accessed together, based on their locations in the
filesystem hierarchy, are stored in the same cylinder group. Files that
are not expected to accessed together are moved into different cylinder
groups. Thus, files written at the same time may be placed far apart on
the disk.

The log-structured filesystem organizes data as a log. All data being
written at any point in time are gathered together, and are written at
the same disk location. Data are never overwritten; instead, a new copy
of the file is written that replaces the old one. The old files are
reclaimed by a garbage-collection process that runs when the filesystem
becomes full and additional free space is needed.

The memory-based filesystem is designed to store data in virtual memory.
It is used for filesystems that need to support fast but temporary data,
such as ``/tmp``. The goal of the memory-based filesystem is to keep the
storage packed as compactly as possible to minimize the usage of
virtual-memory resources.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+--------------------------+-----------------------------------+
| `Prev <overview-filesystem.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-nfs.html>`__   |
+----------------------------------------+--------------------------+-----------------------------------+
| 2.7.?Filesystems?                      | `Home <index.html>`__    | ?2.9.?Network Filesystem          |
+----------------------------------------+--------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
