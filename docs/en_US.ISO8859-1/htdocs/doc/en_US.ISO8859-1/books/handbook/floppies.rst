=====================================
18.7.?Creating and Using Floppy Disks
=====================================

.. raw:: html

   <div class="navheader">

18.7.?Creating and Using Floppy Disks
`Prev <creating-dvds.html>`__?
Chapter?18.?Storage
?\ `Next <backup-basics.html>`__

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

18.7.?Creating and Using Floppy Disks
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section explains how to format a 3.5 inch floppy disk in FreeBSD.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?18.2.?Steps to Format a Floppy

.. raw:: html

   </div>

A floppy disk needs to be low-level formatted before it can be used.
This is usually done by the vendor, but formatting is a good way to
check media integrity. To low-level format the floppy disk on FreeBSD,
use
`fdformat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdformat&sektion=1>`__.
When using this utility, make note of any error messages, as these can
help determine if the disk is good or bad.

#. To format the floppy, insert a new 3.5 inch floppy disk into the
   first floppy drive and issue:

   .. code:: screen

       # /usr/sbin/fdformat -f 1440 /dev/fd0

#. After low-level formatting the disk, create a disk label as it is
   needed by the system to determine the size of the disk and its
   geometry. The supported geometry values are listed in
   ``/etc/disktab``.

   To write the disk label, use
   `bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__:

   .. code:: screen

       # /sbin/bsdlabel -B -w /dev/fd0 fd1440

#. The floppy is now ready to be high-level formatted with a file
   system. The floppy's file system can be either UFS or FAT, where FAT
   is generally a better choice for floppies.

   To format the floppy with FAT, issue:

   .. code:: screen

       # /sbin/newfs_msdos /dev/fd0

.. raw:: html

   </div>

The disk is now ready for use. To use the floppy, mount it with
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8>`__.
One can also install and use
`emulators/mtools <http://www.freebsd.org/cgi/url.cgi?ports/emulators/mtools/pkg-descr>`__
from the Ports Collection.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+------------------------------------+
| `Prev <creating-dvds.html>`__?        | `Up <disks.html>`__     | ?\ `Next <backup-basics.html>`__   |
+---------------------------------------+-------------------------+------------------------------------+
| 18.6.?Creating and Using DVD Media?   | `Home <index.html>`__   | ?18.8.?Backup Basics               |
+---------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
