===========================
3.3.?Pre-installation Tasks
===========================

.. raw:: html

   <div class="navheader">

3.3.?Pre-installation Tasks
`Prev <install-hardware.html>`__?
Chapter?3.?Installing FreeBSD?8.\ *``X``*
?\ `Next <install-start.html>`__

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

3.3.?Pre-installation Tasks
---------------------------

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

3.3.1.?Inventory the Computer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before installing FreeBSD it is recommended to inventory the components
in the computer. The FreeBSD installation routines will show components
such as hard disks, network cards, and CDROM drives with their model
number and manufacturer. FreeBSD will also attempt to determine the
correct configuration for these devices, including information about IRQ
and I/O port usage. Due to the vagaries of computer hardware, this
process is not always completely successful, and FreeBSD may need some
manual configuration.

If another operating system is already installed, use the facilities
provided by that operating systems to view the hardware configuration.
If the settings of an expansion card are not obvious, check if they are
printed on the card itself. Popular IRQ numbers are 3, 5, and 7, and I/O
port addresses are normally written as hexadecimal numbers, such as
``0x330``.

It is recommended to print or write down this information before
installing FreeBSD. It may help to use a table, as seen in this example:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?3.1.?Sample Device Inventory

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+-------+---------------+--------------------------------------------+
| Device Name            | IRQ   | I/O port(s)   | Notes                                      |
+========================+=======+===============+============================================+
| First hard disk        | N/A   | N/A           | 40?GB, made by Seagate, first IDE master   |
+------------------------+-------+---------------+--------------------------------------------+
| CDROM                  | N/A   | N/A           | First IDE slave                            |
+------------------------+-------+---------------+--------------------------------------------+
| Second hard disk       | N/A   | N/A           | 20?GB, made by IBM, second IDE master      |
+------------------------+-------+---------------+--------------------------------------------+
| First IDE controller   | 14    | 0x1f0         | ?                                          |
+------------------------+-------+---------------+--------------------------------------------+
| Network card           | N/A   | N/A           | Intel? 10/100                              |
+------------------------+-------+---------------+--------------------------------------------+
| Modem                  | N/A   | N/A           | 3Com? 56K faxmodem, on COM1                |
+------------------------+-------+---------------+--------------------------------------------+
| …                      | ?     | ?             | ?                                          |
+------------------------+-------+---------------+--------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the inventory of the components in the computer is complete, check
if it matches the hardware requirements of the FreeBSD release to
install.

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

3.3.2.?Make a Backup
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the computer contains valuable data, ensure it is backed up, and that
the backup has been tested before installing FreeBSD. The FreeBSD
installer will prompt before writing any data to disk, but once that
process has started, it cannot be undone.

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

3.3.3.?Decide Where to Install FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If FreeBSD is to be installed on the entire hard disk, skip this
section.

However, if FreeBSD will co-exist with other operating systems, a rough
understanding of how data is laid out on the disk is useful.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.3.1.?Disk Layouts for FreeBSD/i386
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A PC disk can be divided into discrete chunks known as *partitions*.
Since FreeBSD also has partitions, naming can quickly become confusing.
Therefore, these disk chunks are referred to as slices in FreeBSD. For
example, the FreeBSD version of
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__
refers to slices instead of partitions. By design, the PC only supports
four partitions per disk. These partitions are called *primary
partitions*. To work around this limitation and allow more than four
partitions, a new partition type was created, the *extended partition*.
A disk may contain only one extended partition. Special partitions,
called *logical partitions*, can be created inside this extended
partition.

Each partition has a *partition ID*, which is a number used to identify
the type of data on the partition. FreeBSD partitions have the partition
ID of ``165``.

In general, each operating system will identify partitions in a
particular way. For example, Windows?, assigns each primary and logical
partition a *drive letter*, starting with ``C:``.

FreeBSD must be installed into a primary partition. If there are
multiple disks, a FreeBSD partition can be created on all, or some, of
them. When FreeBSD is installed, at least one partition must be
available. This might be a blank partition or it might be an existing
partition whose data can be overwritten.

If all the partitions on all the disks are in use, free one of them for
FreeBSD using the tools provided by an existing operating system, such
as Windows? ``fdisk``.

If there is a spare partition, use that. If it is too small, shrink one
or more existing partitions to create more available space.

A minimal installation of FreeBSD takes as little as 100?MB of disk
space. However, that is a *very* minimal install, leaving almost no
space for files. A more realistic minimum is 250?MB without a graphical
environment, and 350?MB or more for a graphical user interface. If other
third-party software will be installed, even more space is needed.

You can use a tool such as GParted to resize your partitions and make
space for FreeBSD. GParted is known to work on NTFS and is available on
a number of Live CD Linux distributions, such as
`SystemRescueCD <http://www.sysresccd.org/>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Incorrect use of a shrinking tool can delete the data on the disk.
Always have a recent, working backup before using this type of tool.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?3.1.?Using an Existing Partition Unchanged

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Consider a computer with a single 4?GB disk that already has a version
of Windows? installed, where the disk has been split into two drive
letters, ``C:`` and ``D:``, each of which is 2?GB in size. There is 1?GB
of data on ``C:``, and 0.5?GB of data on ``D:``.

This disk has two partitions, one per drive letter. Copy all existing
data from ``D:`` to ``C:``, which will free up the second partition,
ready for FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?3.2.?Shrinking an Existing Partition

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Consider a computer with a single 4?GB disk that already has a version
of Windows? installed. When Windows? was installed, it created one large
partition, a ``C:`` drive that is 4?GB in size. Currently, 1.5?GB of
space is used, and FreeBSD should have 2?GB of space.

In order to install FreeBSD, either:

.. raw:: html

   <div class="orderedlist">

#. Backup the Windows? data and then reinstall Windows?, asking for a
   2?GB partition at install time.

#. Use one of the tools described above to shrink your Windows?
   partition.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

3.3.4.?Collect the Network Configuration Details
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before installing from an FTP site or an NFS server, make note of the
network configuration. The installer will prompt for this information so
that it can connect to the network to complete the installation.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.4.1.?Connecting to an Ethernet Network or Cable/DSL Modem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If using an Ethernet network or an Internet connection using an Ethernet
adapter via cable or DSL, the following information is needed:

.. raw:: html

   <div class="orderedlist">

#. IP address

#. IP address of the default gateway

#. Hostname

#. DNS server IP addresses

#. Subnet Mask

.. raw:: html

   </div>

If this information is unknown, ask the system administrator or service
provider. Make note if this information is assigned automatically using
*DHCP*.

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

3.3.4.2.?Connecting Using a Modem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If using a dialup modem, FreeBSD can still be installed over the
Internet, it will just take a very long time.

You will need to know:

.. raw:: html

   <div class="orderedlist">

#. The phone number to dial the Internet Service Provider (ISP)

#. The COM: port the modem is connected to

#. The username and password for the ISP account

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

3.3.5.?Check for FreeBSD Errata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Although the FreeBSD Project strives to ensure that each release of
FreeBSD is as stable as possible, bugs do occasionally creep into the
process. On rare occasions those bugs affect the installation process.
As these problems are discovered and fixed, they are noted in the
`FreeBSD Errata <http://www.FreeBSD.org/releases/10.1R/errata.html>`__,
which is found on the FreeBSD website. Check the errata before
installing to make sure that there are no late-breaking problems to be
aware of.

Information about all releases, including the errata for each release,
can be found on the `release
information <../../../../releases/index.html>`__ section of the `FreeBSD
website <../../../../index.html>`__.

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

3.3.6.?Obtain the FreeBSD Installation Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD installer can install FreeBSD from files located in any of
the following places:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Local Media

.. raw:: html

   </div>

-  A CDROM or DVD

-  A USB Memory Stick

-  A MS-DOS? partition on the same computer

-  Floppy disks (FreeBSD/pc98 only)

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Network

.. raw:: html

   </div>

-  An FTP site through a firewall or using an HTTP proxy

-  An NFS server

-  A dedicated parallel or serial connection

.. raw:: html

   </div>

If installing from a purchased FreeBSD CD/DVD, skip ahead to
`Section?3.3.7, “Prepare the Boot
Media” <install-pre.html#install-boot-media>`__.

To obtain the FreeBSD installation files, skip ahead to `Section?3.13,
“Preparing Custom Installation Media” <install-diff-media.html>`__ which
explains how to prepare the installation media. After reading that
section, come back here and read on to `Section?3.3.7, “Prepare the Boot
Media” <install-pre.html#install-boot-media>`__.

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

3.3.7.?Prepare the Boot Media
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD installation process is started by booting the computer into
the FreeBSD installer. It is not a program that can be run within
another operating system. The computer normally boots using the
operating system installed on the hard disk, but it can also be
configured to boot from a CDROM or from a USB disk.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If installing from a CD/DVD to a computer whose BIOS supports booting
from the CD/DVD, skip this section. The FreeBSD CD/DVD images are
bootable and can be used to install FreeBSD without any other special
preparation.

.. raw:: html

   </div>

To create a bootable memory stick, follow these steps:

.. raw:: html

   <div class="procedure">

#. **Acquire the Memory Stick Image**

   Memory stick images for FreeBSD?8.\ *``X``* can be downloaded from
   the ``ISO-IMAGES/`` directory at
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/arch``/ISO-IMAGES/*``version``*/FreeBSD-*``version``*-RELEASE-*``arch``*-memstick.img.
   Replace *``arch``* and *``version``* with the architecture and the
   version number to install. For example, the memory stick images for
   FreeBSD/i386?9.3-RELEASE are available from
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/ISO-IMAGES/9.3/FreeBSD-9.3-RELEASE-i386-memstick.img``.

   .. raw:: html

      <div class="tip" xmlns="">

   Tip:
   ~~~~

   A different directory path is used for FreeBSD?9.0-RELEASE and later
   versions. How to download and install FreeBSD?9.\ *``X``* is covered
   in `Chapter?2, *Installing FreeBSD?9.\ *``X``* and
   Later* <bsdinstall.html>`__.

   .. raw:: html

      </div>

   The memory stick image has a ``.img`` extension. The ``ISO-IMAGES/``
   directory contains a number of different images and the one to use
   depends on the version of FreeBSD and the type of media supported by
   the hardware being installed to.

   .. raw:: html

      <div class="important" xmlns="">

   Important:
   ~~~~~~~~~~

   Before proceeding, *back up* the data on the USB stick, as this
   procedure will *erase* it.

   .. raw:: html

      </div>

#. **Write the Image File to the Memory Stick**

   .. raw:: html

      <div class="procedure">

   .. raw:: html

      <div class="procedure-title">

   Procedure?3.1.?Using FreeBSD to Write the Image

   .. raw:: html

      </div>

   .. raw:: html

      <div class="warning" xmlns="">

   Warning:
   ~~~~~~~~

   The example below lists ``/dev/da0`` as the target device where the
   image will be written. Be very careful that you have the correct
   device as the output target, or you may destroy your existing data.

   .. raw:: html

      </div>

   -  **Writing the Image with
      `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__**

      The ``.img`` file is *not* a regular file that can just be copied
      to the memory stick. It is an image of the complete contents of
      the disk. This means that
      `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
      must be used to write the image directly to the disk:

      .. code:: screen

          # dd if=FreeBSD-9.3-RELEASE-i386-memstick.img of=/dev/da0 bs=64k

      If an ``Operation not           permitted`` error is displayed,
      make certain that the target device is not in use, mounted, or
      being automounted by another program. Then try again.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="procedure">

   .. raw:: html

      <div class="procedure-title">

   Procedure?3.2.?Using Windows? to Write the Image

   .. raw:: html

      </div>

   .. raw:: html

      <div class="warning" xmlns="">

   Warning:
   ~~~~~~~~

   Make sure to use the correct drive letter as the output target, as
   this command will overwrite and destroy any existing data on the
   specified device.

   .. raw:: html

      </div>

   #. **Obtaining Image Writer for Windows**

      Image Writer for Windows is a free application that can correctly
      write an image file to a memory stick. Download it from
      ``https://launchpad.net/win32-image-writer/`` and extract it into
      a folder.

   #. **Writing the Image with Image Writer**

      Double-click the Win32DiskImager icon to start the program. Verify
      that the drive letter shown under ``Device`` is the drive with the
      memory stick. Click the folder icon and select the image to be
      written to the memory stick. Click Save to accept the image file
      name. Verify that everything is correct, and that no folders on
      the memory stick are open in other windows. Finally, click Write
      to write the image file to the drive.

   .. raw:: html

      </div>

.. raw:: html

   </div>

To create the boot floppy images for a FreeBSD/pc98 installation, follow
these steps:

.. raw:: html

   <div class="procedure">

#. **Acquire the Boot Floppy Images**

   The FreeBSD/pc98 boot disks can be downloaded from the floppies
   directory,
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/pc98/version``-RELEASE/floppies/.
   Replace *``version``* with the version number to install.

   The floppy images have a ``.flp`` extension. ``floppies/`` contains a
   number of different images. Download ``boot.flp`` as well as the
   number of files associated with the type of installation, such as
   ``kern.small*`` or ``kern*``.

   .. raw:: html

      <div class="important" xmlns="">

   Important:
   ~~~~~~~~~~

   The FTP program must use *binary mode* to download these disk images.
   Some web browsers use *text* or *ASCII* mode, which will be apparent
   if the disks are not bootable.

   .. raw:: html

      </div>

#. **Prepare the Floppy Disks**

   Prepare one floppy disk per downloaded image file. It is imperative
   that these disks are free from defects. The easiest way to test this
   is to reformat the disks. Do not trust pre-formatted floppies. The
   format utility in Windows? will not tell about the presence of bad
   blocks, it simply marks them as “bad” and ignores them. It is advised
   to use brand new floppies.

   .. raw:: html

      <div class="important" xmlns="">

   Important:
   ~~~~~~~~~~

   If the installer crashes, freezes, or otherwise misbehaves, one of
   the first things to suspect is the floppies. Write the floppy image
   files to new disks and try again.

   .. raw:: html

      </div>

#. **Write the Image Files to the Floppy Disks**

   The ``.flp`` files are *not* regular files that can be copied to the
   disk. They are images of the complete contents of the disk. Specific
   tools must be used to write the images directly to the disk.

   FreeBSD provides a tool called ``rawrite`` for creating the floppies
   on a computer running Windows?. This tool can be downloaded from
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/pc98/           version``-RELEASE/tools/
   on the FreeBSD FTP site. Download this tool, insert a floppy, then
   specify the filename to write to the floppy drive:

   .. code:: screen

       C:\> rawrite boot.flp A:

   Repeat this command for each ``.flp`` file, replacing the floppy disk
   each time, being sure to label the disks with the name of the file.
   Adjust the command line as necessary, depending on where the ``.flp``
   files are located.

   When writing the floppies on a UNIX?-like system, such as another
   FreeBSD system, use
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__ to
   write the image files directly to disk. On FreeBSD, run:

   .. code:: screen

       # dd if=boot.flp of=/dev/fd0

   On FreeBSD, ``/dev/fd0`` refers to the first floppy disk. Other UNIX?
   variants might have different names for the floppy disk device, so
   check the documentation for the system as necessary.

.. raw:: html

   </div>

You are now ready to start installing FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+------------------------------------+
| `Prev <install-hardware.html>`__?   | `Up <install.html>`__   | ?\ `Next <install-start.html>`__   |
+-------------------------------------+-------------------------+------------------------------------+
| 3.2.?Hardware Requirements?         | `Home <index.html>`__   | ?3.4.?Starting the Installation    |
+-------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
