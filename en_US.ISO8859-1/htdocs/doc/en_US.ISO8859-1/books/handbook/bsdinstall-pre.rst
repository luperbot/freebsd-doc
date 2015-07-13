===========================
2.3.?Pre-Installation Tasks
===========================

.. raw:: html

   <div class="navheader">

2.3.?Pre-Installation Tasks
`Prev <bsdinstall-hardware.html>`__?
Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
?\ `Next <bsdinstall-start.html>`__

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

2.3.?Pre-Installation Tasks
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once it has been determined that the system meets the minimum hardware
requirements for installing FreeBSD, the installation file should be
downloaded and the installation media prepared. Before doing this, check
that the system is ready for an installation by verifying the items in
this checklist:

.. raw:: html

   <div class="procedure">

#. **Back Up Important Data**

   Before installing any operating system, *always* backup all important
   data first. Do not store the backup on the system being installed.
   Instead, save the data to a removable disk such as a USB drive,
   another system on the network, or an online backup service. Test the
   backup before starting the installation to make sure it contains all
   of the needed files. Once the installer formats the system's disk,
   all data stored on that disk will be lost.

#. **Decide Where to Install FreeBSD**

   If FreeBSD will be the only operating system installed, this step can
   be skipped. But if FreeBSD will share the disk with another operating
   system, decide which disk or partition will be used for FreeBSD.

   In the i386 and amd64 architectures, disks can be divided into
   multiple partitions using one of two partitioning schemes. A
   traditional *Master Boot Record* (MBR) holds a partition table
   defining up to four *primary partitions*. For historical reasons,
   FreeBSD calls these primary partition *slices*. One of these primary
   partitions can be made into an *extended partition* containing
   multiple *logical partitions*. The *GUID Partition Table* (GPT) is a
   newer and simpler method of partitioning a disk. Common GPT
   implementations allow up to 128 partitions per disk, eliminating the
   need for logical partitions.

   .. raw:: html

      <div class="warning" xmlns="">

   Warning:
   ~~~~~~~~

   Some older operating systems, like Windows??XP, are not compatible
   with the GPT partition scheme. If FreeBSD will be sharing a disk with
   such an operating system, MBR partitioning is required.

   .. raw:: html

      </div>

   The FreeBSD boot loader requires either a primary or GPT partition.
   If all of the primary or GPT partitions are already in use, one must
   be freed for FreeBSD. To create a partition without deleting existing
   data, use a partition resizing tool to shrink an existing partition
   and create a new partition using the freed space.

   A variety of free and commercial partition resizing tools are listed
   at http://en.wikipedia.org/wiki/List_of_disk_partitioning_software.
   GParted Live (http://gparted.sourceforge.net/livecd.php) is a free
   live CD which includes the GParted partition editor. GParted is also
   included with many other Linux live CD distributions.

   .. raw:: html

      <div class="warning" xmlns="">

   Warning:
   ~~~~~~~~

   When used properly, disk shrinking utilities can safely create space
   for creating a new partition. Since the possibility of selecting the
   wrong partition exists, always backup any important data and verify
   the integrity of the backup before modifying disk partitions.

   .. raw:: html

      </div>

   Disk partitions containing different operating systems make it
   possible to install multiple operating systems on one computer. An
   alternative is to use virtualization (`Chapter?22,
   *Virtualization* <virtualization.html>`__) which allows multiple
   operating systems to run at the same time without modifying any disk
   partitions.

#. **Collect Network Information**

   Some FreeBSD installation methods require a network connection in
   order to download the installation files. After any installation, the
   installer will offer to setup the system's network interfaces.

   If the network has a DHCP server, it can be used to provide automatic
   network configuration. If DHCP is not available, the following
   network information for the system must be obtained from the local
   network administrator or Internet service provider:

   .. raw:: html

      <div class="orderedlist">

   .. raw:: html

      <div class="orderedlist-title">

   Required Network Information

   .. raw:: html

      </div>

   #. IP address

   #. Subnet mask

   #. IP address of default gateway

   #. Domain name of the network

   #. IP addresses of the network's DNS servers

   .. raw:: html

      </div>

#. **Check for FreeBSD Errata**

   Although the FreeBSD?Project strives to ensure that each release of
   FreeBSD is as stable as possible, bugs occasionally creep into the
   process. On very rare occasions those bugs affect the installation
   process. As these problems are discovered and fixed, they are noted
   in the FreeBSD Errata
   (`http://www.freebsd.org/releases/10.1R/errata.html <../../../../releases/10.1R/errata.html>`__)
   on the FreeBSD web site. Check the errata before installing to make
   sure that there are no problems that might affect the installation.

   Information and errata for all the releases can be found on the
   release information section of the FreeBSD web site
   (`http://www.freebsd.org/releases/index.html <../../../../releases/index.html>`__).

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

2.3.1.?Prepare the Installation Media
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD installer is not an application that can be run from within
another operating system. Instead, download a FreeBSD installation file,
burn it to the media associated with its file type and size (CD, DVD, or
USB), and boot the system to install from the inserted media.

FreeBSD installation files are available at
`www.freebsd.org/where.html#download <../../../../where.html#download>`__.
Each installation file's name includes the release version of FreeBSD,
the architecture, and the type of file. For example, to install FreeBSD
10.0 on an amd64 system from a DVD, download
``FreeBSD-10.0-RELEASE-amd64-dvd1.iso``, burn this file to a DVD, and
boot the system with the DVD inserted.

Several file types are available, though not all file types are
available for all architectures. The possible file types are:

.. raw:: html

   <div class="itemizedlist">

-  ``-bootonly.iso``: This is the smallest installation file as it only
   contains the installer. A working Internet connection is required
   during installation as the installer will download the files it needs
   to complete the FreeBSD installation. This file should be burned to a
   CD using a CD burning application.

-  ``-disc1.iso``: This file contains all of the files needed to install
   FreeBSD, its source, and the Ports Collection. It should be burned to
   a CD using a CD burning application.

-  ``-dvd1.iso``: This file contains all of the files needed to install
   FreeBSD, its source, and the Ports Collection. It also contains a set
   of popular binary packages for installing a window manager and some
   applications so that a complete system can be installed from media
   without requiring a connection to the Internet. This file should be
   burned to a DVD using a DVD burning application.

-  ``-memstick.img``: This file contains all of the files needed to
   install FreeBSD, its source, and the Ports Collection. It should be
   burned to a USB stick using the instructions below.

.. raw:: html

   </div>

Also download ``CHECKSUM.SHA256`` from the same directory as the image
file and use it to check the image file's integrity by calculating a
*checksum*. FreeBSD provides
`sha256(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha256&sektion=1>`__
for this, while other operating systems have similar programs. Compare
the calculated checksum with the one shown in ``CHECKSUM.SHA256``. The
checksums must match exactly. If the checksums do not match, the file is
corrupt and should be downloaded again.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1.1.?Writing an Image File to USB
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``*.img`` file is an *image* of the complete contents of a memory
stick. It *cannot* be copied to the target device as a file. Several
applications are available for writing the ``*.img`` to a USB stick.
This section describes two of these utilities.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Before proceeding, back up any important data on the USB stick. This
procedure will erase the existing data on the stick.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?2.1.?Using ``dd`` to Write the Image

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

This example uses ``/dev/da0`` as the target device where the image will
be written. Be *very careful* that the correct device is used as this
command will destroy the existing data on the specified target device.

.. raw:: html

   </div>

-  The `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
   command-line utility is available on BSD, Linux?, and Mac?OS?
   systems. To burn the image using ``dd``, insert the USB stick and
   determine its device name. Then, specify the name of the downloaded
   installation file and the device name for the USB stick. This example
   burns the amd64 installation image to the first USB device on an
   existing FreeBSD system.

   .. code:: screen

       # dd if=FreeBSD-10.0-RELEASE-amd64-memstick.img of=/dev/da0 bs=64k

   If this command fails, verify that the USB stick is not mounted and
   that the device name is for the disk, not a partition. Some operating
   systems might require this command to be run with
   `sudo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sudo&sektion=8>`__.
   Systems like Linux? might buffer writes. To force all writes to
   complete, use
   `sync(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sync&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?2.2.?Using Windows? to Write the Image

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Be sure to give the correct drive letter as the existing data on the
specified drive will be overwritten and destroyed.

.. raw:: html

   </div>

#. **Obtaining Image Writer for Windows?**

   Image Writer for Windows? is a free application that can correctly
   write an image file to a memory stick. Download it from
   ``https://launchpad.net/win32-image-writer/`` and extract it into a
   folder.

#. **Writing the Image with Image Writer**

   Double-click the Win32DiskImager icon to start the program. Verify
   that the drive letter shown under ``Device`` is the drive with the
   memory stick. Click the folder icon and select the image to be
   written to the memory stick. Click [?Save?] to accept the image file
   name. Verify that everything is correct, and that no folders on the
   memory stick are open in other windows. When everything is ready,
   click [?Write?] to write the image file to the memory stick.

.. raw:: html

   </div>

You are now ready to start installing FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------+---------------------------------------+
| `Prev <bsdinstall-hardware.html>`__?   | `Up <bsdinstall.html>`__   | ?\ `Next <bsdinstall-start.html>`__   |
+----------------------------------------+----------------------------+---------------------------------------+
| 2.2.?Minimum Hardware Requirements?    | `Home <index.html>`__      | ?2.4.?Starting the Installation       |
+----------------------------------------+----------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
