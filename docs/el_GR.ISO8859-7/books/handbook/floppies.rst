=====================================
19.7. Creating and Using Floppy Disks
=====================================

.. raw:: html

   <div class="navheader">

19.7. Creating and Using Floppy Disks
`????? <creating-dvds.html>`__?
???????? 19. ???????????? ????
?\ `??????? <backups-tapebackups.html>`__

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

19.7. Creating and Using Floppy Disks
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Original work by Julio Merino.

.. raw:: html

   </div>

.. raw:: html

   <div>

Rewritten by Martin Karlsson.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Storing data on floppy disks is sometimes useful, for example when one
does not have any other removable storage media or when one needs to
transfer small amounts of data to another computer.

This section explains how to use floppy disks in FreeBSD. It covers
formatting and usage of 3.5inch DOS floppies, but the concepts are
similar for other floppy disk formats.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.7.1. Formatting Floppies
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.7.1.1. The Device
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Floppy disks are accessed through entries in ``/dev``, just like other
devices. To access the raw floppy disk, simply use ``/dev/fdN``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.7.1.2. Formatting
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A floppy disk needs to be low-level formatted before it can be used.
This is usually done by the vendor, but formatting is a good way to
check media integrity. Although it is possible to force other disk
sizes, 1440kB is what most floppy disks are designed for.

To low-level format the floppy disk, use
`fdformat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdformat&sektion=1>`__.
This utility expects the device name as an argument.

Make note of any error messages, as these can help determine if the disk
is good or bad.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.7.1.2.1. Formatting Floppy Disks
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To format the floppy, insert a new 3.5inch floppy disk into the first
floppy drive and issue:

.. code:: screen

    # /usr/sbin/fdformat -f 1440 /dev/fd0

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

19.7.2. The Disk Label
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After low-level formatting the disk, a disk label needs to placed on it.
This disk label will be destroyed later, but it is needed by the system
to determine the size of the disk and its geometry.

The new disk label will take over the whole disk and will contain all
the proper information about the geometry of the floppy. The geometry
values for the disk label are listed in ``/etc/disktab``.

To write the disk label, use
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__:

.. code:: screen

    # /sbin/bsdlabel -B -w /dev/fd0 fd1440

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

19.7.3. The File System
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The floppy is now ready to be high-level formatted. This will place a
new file system on it so that FreeBSD can read and write to the disk.
Since creating the new file system destroys the disk label, the disk
label needs to be recreated whenever the disk is reformatted.

The floppy's file system can be either UFS or FAT. FAT is generally a
better choice for floppies.

To put a new file system on the floppy, issue:

.. code:: screen

    # /sbin/newfs_msdos /dev/fd0

The disk is now ready for use.

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

19.7.4. Using the Floppy
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To use the floppy, mount it with
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8>`__.
One can also use
`emulators/mtools <http://www.freebsd.org/cgi/url.cgi?ports/emulators/mtools/pkg-descr>`__
from the Ports Collection.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+---------------------------------------------+
| `????? <creating-dvds.html>`__?       | `???? <disks.html>`__   | ?\ `??????? <backups-tapebackups.html>`__   |
+---------------------------------------+-------------------------+---------------------------------------------+
| 19.6. Creating and Using DVD Media?   | `???? <index.html>`__   | ?19.8. Creating and Using Data Tapes        |
+---------------------------------------+-------------------------+---------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
