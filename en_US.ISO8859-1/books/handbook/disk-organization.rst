======================
4.6.?Disk Organization
======================

.. raw:: html

   <div class="navheader">

4.6.?Disk Organization
`Prev <dirstructure.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <mount-unmount.html>`__

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

4.6.?Disk Organization
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The smallest unit of organization that FreeBSD uses to find files is the
filename. Filenames are case-sensitive, which means that ``readme.txt``
and ``README.TXT`` are two separate files. FreeBSD does not use the
extension of a file to determine whether the file is a program,
document, or some other form of data.

Files are stored in directories. A directory may contain no files, or it
may contain many hundreds of files. A directory can also contain other
directories, allowing a hierarchy of directories within one another in
order to organize data.

Files and directories are referenced by giving the file or directory
name, followed by a forward slash, ``/``, followed by any other
directory names that are necessary. For example, if the directory
``foo`` contains a directory ``bar`` which contains the file
``readme.txt``, the full name, or *path*, to the file is
``foo/bar/readme.txt``. Note that this is different from Windows? which
uses ``\`` to separate file and directory names. FreeBSD does not use
drive letters, or other drive names in the path. For example, one would
not type ``c:\foo\bar\readme.txt`` on FreeBSD.

Directories and files are stored in a file system. Each file system
contains exactly one directory at the very top level, called the *root
directory* for that file system. This root directory can contain other
directories. One file system is designated the *root file system* or
``/``. Every other file system is *mounted* under the root file system.
No matter how many disks are on the FreeBSD system, every directory
appears to be part of the same disk.

Consider three file systems, called ``A``, ``B``, and ``C``. Each file
system has one root directory, which contains two other directories,
called ``A1``, ``A2`` (and likewise ``B1``, ``B2`` and ``C1``, ``C2``).

Call ``A`` the root file system. If
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ is
used to view the contents of this directory, it will show two
subdirectories, ``A1`` and ``A2``. The directory tree looks like this:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

A file system must be mounted on to a directory in another file system.
When mounting file system ``B`` on to the directory ``A1``, the root
directory of ``B`` replaces ``A1``, and the directories in ``B`` appear
accordingly:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

Any files that are in the ``B1`` or ``B2`` directories can be reached
with the path ``/A1/B1`` or ``/A1/B2`` as necessary. Any files that were
in ``/A1`` have been temporarily hidden. They will reappear if ``B`` is
*unmounted* from ``A``.

If ``B`` had been mounted on ``A2`` then the diagram would look like
this:

.. raw:: html

   <div class="mediaobject">

|image2|

.. raw:: html

   </div>

and the paths would be ``/A2/B1`` and ``/A2/B2`` respectively.

File systems can be mounted on top of one another. Continuing the last
example, the ``C`` file system could be mounted on top of the ``B1``
directory in the ``B`` file system, leading to this arrangement:

.. raw:: html

   <div class="mediaobject">

|image3|

.. raw:: html

   </div>

Or ``C`` could be mounted directly on to the ``A`` file system, under
the ``A1`` directory:

.. raw:: html

   <div class="mediaobject">

|image4|

.. raw:: html

   </div>

It is entirely possible to have one large root file system, and not need
to create any others. There are some drawbacks to this approach, and one
advantage.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Benefits of Multiple File Systems

.. raw:: html

   </div>

-  Different file systems can have different *mount options*. For
   example, the root file system can be mounted read-only, making it
   impossible for users to inadvertently delete or edit a critical file.
   Separating user-writable file systems, such as ``/home``, from other
   file systems allows them to be mounted *nosuid*. This option prevents
   the *suid*/*guid* bits on executables stored on the file system from
   taking effect, possibly improving security.

-  FreeBSD automatically optimizes the layout of files on a file system,
   depending on how the file system is being used. So a file system that
   contains many small files that are written frequently will have a
   different optimization to one that contains fewer, larger files. By
   having one big file system this optimization breaks down.

-  FreeBSD's file systems are robust if power is lost. However, a power
   loss at a critical point could still damage the structure of the file
   system. By splitting data over multiple file systems it is more
   likely that the system will still come up, making it easier to
   restore from backup as necessary.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Benefit of a Single File System

.. raw:: html

   </div>

-  File systems are a fixed size. If you create a file system when you
   install FreeBSD and give it a specific size, you may later discover
   that you need to make the partition bigger. This is not easily
   accomplished without backing up, recreating the file system with the
   new size, and then restoring the backed up data.

   .. raw:: html

      <div class="important" xmlns="">

   Important:
   ~~~~~~~~~~

   FreeBSD features the
   `growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8>`__
   command, which makes it possible to increase the size of file system
   on the fly, removing this limitation.

   .. raw:: html

      </div>

.. raw:: html

   </div>

File systems are contained in partitions. This does not have the same
meaning as the common usage of the term partition (for example, MS-DOS?
partition), because of FreeBSD's UNIX? heritage. Each partition is
identified by a letter from ``a`` through to ``h``. Each partition can
contain only one file system, which means that file systems are often
described by either their typical mount point in the file system
hierarchy, or the letter of the partition they are contained in.

FreeBSD also uses disk space for *swap space* to provide *virtual
memory*. This allows your computer to behave as though it has much more
memory than it actually does. When FreeBSD runs out of memory, it moves
some of the data that is not currently being used to the swap space, and
moves it back in (moving something else out) when it needs it.

Some partitions have certain conventions associated with them.

.. raw:: html

   <div class="informaltable">

+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Partition   | Convention                                                                                                                                                                                                                                |
+=============+===========================================================================================================================================================================================================================================+
| ``a``       | Normally contains the root file system.                                                                                                                                                                                                   |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``b``       | Normally contains swap space.                                                                                                                                                                                                             |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``c``       | Normally the same size as the enclosing slice. This allows utilities that need to work on the entire slice, such as a bad block scanner, to work on the ``c`` partition. A file system would not normally be created on this partition.   |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``d``       | Partition ``d`` used to have a special meaning associated with it, although that is now gone and ``d`` may work as any normal partition.                                                                                                  |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Disks in FreeBSD are divided into slices, referred to in Windows? as
partitions, which are numbered from 1 to 4. These are then divided into
partitions, which contain file systems, and are labeled using letters.

Slice numbers follow the device name, prefixed with an ``s``, starting
at 1. So “da0*s1*” is the first slice on the first SCSI drive. There can
only be four physical slices on a disk, but there can be logical slices
inside physical slices of the appropriate type. These extended slices
are numbered starting at 5, so “ada0*s5*” is the first extended slice on
the first SATA disk. These devices are used by file systems that expect
to occupy a slice.

Slices, “dangerously dedicated” physical drives, and other drives
contain *partitions*, which are represented as letters from ``a`` to
``h``. This letter is appended to the device name, so “da0*a*” is the
``a`` partition on the first ``da`` drive, which is “dangerously
dedicated”. “ada1s3*e*” is the fifth partition in the third slice of the
second SATA disk drive.

Finally, each disk on the system is identified. A disk name starts with
a code that indicates the type of disk, and then a number, indicating
which disk it is. Unlike slices, disk numbering starts at 0. Common
codes are listed in `Table?4.3, “Disk Device
Names” <disk-organization.html#disks-naming>`__.

When referring to a partition, include the disk name, ``s``, the slice
number, and then the partition letter. Examples are shown in
`Example?4.12, “Sample Disk, Slice, and Partition
Names” <disk-organization.html#basics-disk-slice-part>`__.

`Example?4.13, “Conceptual Model of a
Disk” <disk-organization.html#basics-concept-disk-model>`__ shows a
conceptual model of a disk layout.

When installing FreeBSD, configure the disk slices, create partitions
within the slice to be used for FreeBSD, create a file system or swap
space in each partition, and decide where each file system will be
mounted.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?4.3.?Disk Device Names

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Drive Type                                 | Drive Device Name                                                                                                                                                              |
+============================================+================================================================================================================================================================================+
| SATA and IDE hard drives                   | ``ada`` or ``ad``                                                                                                                                                              |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SCSI hard drives and USB storage devices   | ``da``                                                                                                                                                                         |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SATA and IDE CD-ROM drives                 | ``cd`` or ``acd``                                                                                                                                                              |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SCSI CD-ROM drives                         | ``cd``                                                                                                                                                                         |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Floppy drives                              | ``fd``                                                                                                                                                                         |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Assorted non-standard CD-ROM drives        | ``mcd`` for Mitsumi CD-ROM and ``scd`` for Sony CD-ROM devices                                                                                                                 |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SCSI tape drives                           | ``sa``                                                                                                                                                                         |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| IDE tape drives                            | ``ast``                                                                                                                                                                        |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RAID drives                                | Examples include ``aacd`` for Adaptec? AdvancedRAID, ``mlxd`` and ``mlyd`` for Mylex?, ``amrd`` for AMI MegaRAID?, ``idad`` for Compaq Smart RAID, ``twed`` for 3ware? RAID.   |
+--------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.12.?Sample Disk, Slice, and Partition Names

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------------------------------------------------------------------------+
| Name          | Meaning                                                                                       |
+===============+===============================================================================================+
| ``ada0s1a``   | The first partition (``a``) on the first slice (``s1``) on the first IDE disk (``ada0``).     |
+---------------+-----------------------------------------------------------------------------------------------+
| ``da1s2e``    | The fifth partition (``e``) on the second slice (``s2``) on the second SCSI disk (``da1``).   |
+---------------+-----------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.13.?Conceptual Model of a Disk

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This diagram shows FreeBSD's view of the first IDE disk attached to the
system. Assume that the disk is 4?GB in size, and contains two 2?GB
slices (MS-DOS? partitions). The first slice contains a MS-DOS? disk,
``C:``, and the second slice contains a FreeBSD installation. This
example FreeBSD installation has three data partitions, and a swap
partition.

The three partitions will each hold a file system. Partition ``a`` will
be used for the root file system, ``e`` for the ``/var/`` directory
hierarchy, and ``f`` for the ``/usr/`` directory hierarchy.

.. raw:: html

   <div class="mediaobject">

|image5|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+----------------------------------------------+
| `Prev <dirstructure.html>`__?   | `Up <basics.html>`__    | ?\ `Next <mount-unmount.html>`__             |
+---------------------------------+-------------------------+----------------------------------------------+
| 4.5.?Directory Structure?       | `Home <index.html>`__   | ?4.7.?Mounting and Unmounting File Systems   |
+---------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |image0| image:: install/example-dir1.png
.. |image1| image:: install/example-dir2.png
.. |image2| image:: install/example-dir3.png
.. |image3| image:: install/example-dir4.png
.. |image4| image:: install/example-dir5.png
.. |image5| image:: install/disk-layout.png
