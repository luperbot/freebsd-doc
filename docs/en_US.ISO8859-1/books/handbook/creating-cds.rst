=================================
18.5.?Creating and Using CD Media
=================================

.. raw:: html

   <div class="navheader">

18.5.?Creating and Using CD Media
`Prev <usb-disks.html>`__?
Chapter?18.?Storage
?\ `Next <creating-dvds.html>`__

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

18.5.?Creating and Using CD Media
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Mike Meyer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Compact Disc (CD) media provide a number of features that differentiate
them from conventional disks. They are designed so that they can be read
continuously without delays to move the head between tracks. While CD
media do have tracks, these refer to a section of data to be read
continuously, and not a physical property of the disk. The ISO 9660 file
system was designed to deal with these differences.

The FreeBSD Ports Collection provides several utilities for burning and
duplicating audio and data CDs. This chapter demonstrates the use of
several command line utilities. For CD burning software with a graphical
utility, consider installing the
`sysutils/xcdroast <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/xcdroast/pkg-descr>`__
or
`sysutils/k3b <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/k3b/pkg-descr>`__
packages or ports.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.5.1.?Supported Devices
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``GENERIC`` kernel provides support for SCSI, USB, and ATAPI CD
readers and burners. If a custom kernel is used, the options that need
to be present in the kernel configuration file vary by the type of
device.

For a SCSI burner, make sure these options are present:

.. code:: programlisting

    device scbus    # SCSI bus (required for ATA/SCSI)
    device da   # Direct Access (disks)
    device pass # Passthrough device (direct ATA/SCSI access)
    device cd   # needed for CD and DVD burners

For a USB burner, make sure these options are present:

.. code:: programlisting

    device scbus    # SCSI bus (required for ATA/SCSI)
    device da   # Direct Access (disks)
    device pass # Passthrough device (direct ATA/SCSI access)
    device cd   # needed for CD and DVD burners
    device uhci # provides USB 1.x support
    device ohci # provides USB 1.x support
    device ehci # provides USB 2.0 support
    device xhci # provides USB 3.0 support
    device usb  # USB Bus (required)
    device umass    # Disks/Mass storage - Requires scbus and da

For an ATAPI burner, make sure these options are present:

.. code:: programlisting

    device ata  # Legacy ATA/SATA controllers
    device scbus    # SCSI bus (required for ATA/SCSI)
    device pass # Passthrough device (direct ATA/SCSI access)
    device cd   # needed for CD and DVD burners

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

On FreeBSD versions prior to 10.x, this line is also needed in the
kernel configuration file if the burner is an ATAPI device:

.. code:: programlisting

    device atapicam

Alternately, this driver can be loaded at boot time by adding the
following line to ``/boot/loader.conf``:

.. code:: programlisting

    atapicam_load="YES"

This will require a reboot of the system as this driver can only be
loaded at boot time.

.. raw:: html

   </div>

To verify that FreeBSD recognizes the device, run ``dmesg`` and look for
an entry for the device. On systems prior to 10.x, the device name in
the first line of the output will be ``acd0`` instead of ``cd0``.

.. code:: screen

    % dmesg | grep cd
    cd0 at ahcich1 bus 0 scbus1 target 0 lun 0
    cd0: <HL-DT-ST DVDRAM GU70N LT20> Removable CD-ROM SCSI-0 device
    cd0: Serial Number M3OD3S34152
    cd0: 150.000MB/s transfers (SATA 1.x, UDMA6, ATAPI 12bytes, PIO 8192bytes)
    cd0: Attempt to query device size failed: NOT READY, Medium not present - tray closed

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

18.5.2.?Burning a CD
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, ``cdrecord`` can be used to burn CDs. This command is
installed with the
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
package or port.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

FreeBSD 8.x includes the built-in ``burncd`` utility for burning CDs
using an ATAPI CD burner. Refer to the manual page for ``burncd`` for
usage examples.

.. raw:: html

   </div>

While ``cdrecord`` has many options, basic usage is simple. Specify the
name of the ISO file to burn and, if the system has multiple burner
devices, specify the name of the device to use:

.. code:: screen

    # cdrecord dev=device imagefile.iso

To determine the device name of the burner, use ``-scanbus`` which might
produce results like this:

.. code:: screen

    # cdrecord -scanbus
    ProDVD-ProBD-Clone 3.00 (amd64-unknown-freebsd10.0) Copyright (C) 1995-2010 J?rg Schilling
    Using libscg version 'schily-0.9'
    scsibus0:
            0,0,0     0) 'SEAGATE ' 'ST39236LW       ' '0004' Disk
            0,1,0     1) 'SEAGATE ' 'ST39173W        ' '5958' Disk
            0,2,0     2) *
            0,3,0     3) 'iomega  ' 'jaz 1GB         ' 'J.86' Removable Disk
            0,4,0     4) 'NEC     ' 'CD-ROM DRIVE:466' '1.26' Removable CD-ROM
            0,5,0     5) *
            0,6,0     6) *
            0,7,0     7) *
    scsibus1:
            1,0,0   100) *
            1,1,0   101) *
            1,2,0   102) *
            1,3,0   103) *
            1,4,0   104) *
            1,5,0   105) 'YAMAHA  ' 'CRW4260         ' '1.0q' Removable CD-ROM
            1,6,0   106) 'ARTEC   ' 'AM12S           ' '1.06' Scanner
            1,7,0   107) *

Locate the entry for the CD burner and use the three numbers separated
by commas as the value for ``dev``. In this case, the Yamaha burner
device is ``1,5,0``, so the appropriate input to specify that device is
``dev=1,5,0``. Refer to the manual page for ``cdrecord`` for other ways
to specify this value and for information on writing audio tracks and
controlling the write speed.

Alternately, run the following command to get the device address of the
burner:

.. code:: screen

    # camcontrol devlist
    <MATSHITA CDRW/DVD UJDA740 1.00>   at scbus1 target 0 lun 0 (cd0,pass0)

Use the numeric values for ``scbus``, ``target``, and ``lun``. For this
example, ``1,0,0`` is the device name to use.

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

18.5.3.?Writing Data to an ISO File System
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to produce a data CD, the data files that are going to make up
the tracks on the CD must be prepared before they can be burned to the
CD. In FreeBSD,
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
installs ``mkisofs``, which can be used to produce an ISO 9660 file
system that is an image of a directory tree within a UNIX? file system.
The simplest usage is to specify the name of the ISO file to create and
the path to the files to place into the ISO 9660 file system:

.. code:: screen

    # mkisofs -o imagefile.iso /path/to/tree

This command maps the file names in the specified path to names that fit
the limitations of the standard ISO 9660 file system, and will exclude
files that do not meet the standard for ISO file systems.

A number of options are available to overcome the restrictions imposed
by the standard. In particular, ``-R`` enables the Rock Ridge extensions
common to UNIX? systems and ``-J`` enables Joliet extensions used by
Microsoft? systems.

For CDs that are going to be used only on FreeBSD systems, ``-U`` can be
used to disable all filename restrictions. When used with ``-R``, it
produces a file system image that is identical to the specified FreeBSD
tree, even if it violates the ISO 9660 standard.

The last option of general use is ``-b``. This is used to specify the
location of a boot image for use in producing an “El Torito” bootable
CD. This option takes an argument which is the path to a boot image from
the top of the tree being written to the CD. By default, ``mkisofs``
creates an ISO image in “floppy disk emulation” mode, and thus expects
the boot image to be exactly 1200, 1440 or 2880?KB in size. Some boot
loaders, like the one used by the FreeBSD distribution media, do not use
emulation mode. In this case, ``-no-emul-boot`` should be used. So, if
``/tmp/myboot`` holds a bootable FreeBSD system with the boot image in
``/tmp/myboot/boot/cdboot``, this command would produce
``/tmp/bootable.iso``:

.. code:: screen

    # mkisofs -R -no-emul-boot -b boot/cdboot -o /tmp/bootable.iso /tmp/myboot

The resulting ISO image can be mounted as a memory disk with:

.. code:: screen

    # mdconfig -a -t vnode -f /tmp/bootable.iso -u 0
    # mount -t cd9660 /dev/md0 /mnt

One can then verify that ``/mnt`` and ``/tmp/myboot`` are identical.

There are many other options available for ``mkisofs`` to fine-tune its
behavior. Refer to
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
for details.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is possible to copy a data CD to an image file that is functionally
equivalent to the image file created with ``mkisofs``. To do so, use
``dd`` with the device name as the input file and the name of the ISO to
create as the output file:

.. code:: screen

    # dd if=/dev/cd0 of=file.iso bs=2048

The resulting image file can be burned to CD as described in
`Section?18.5.2, “Burning a CD” <creating-cds.html#cdrecord>`__.

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

18.5.4.?Using Data CDs
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once an ISO has been burned to a CD, it can be mounted by specifying the
file system type, the name of the device containing the CD, and an
existing mount point:

.. code:: screen

    # mount -t cd9660 /dev/cd0 /mnt

Since ``mount`` assumes that a file system is of type ``ufs``, a
Incorrect super block error will occur if ``-t       cd9660`` is not
included when mounting a data CD.

While any data CD can be mounted this way, disks with certain ISO 9660
extensions might behave oddly. For example, Joliet disks store all
filenames in two-byte Unicode characters. If some non-English characters
show up as question marks, specify the local charset with ``-C``. For
more information, refer to
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In order to do this character conversion with the help of ``-C``, the
kernel requires the ``cd9660_iconv.ko`` module to be loaded. This can be
done either by adding this line to ``loader.conf``:

.. code:: programlisting

    cd9660_iconv_load="YES"

and then rebooting the machine, or by directly loading the module with
``kldload``.

.. raw:: html

   </div>

Occasionally, Device not configured will be displayed when trying to
mount a data CD. This usually means that the CD drive thinks that there
is no disk in the tray, or that the drive is not visible on the bus. It
can take a couple of seconds for a CD drive to realize that a media is
present, so be patient.

Sometimes, a SCSI CD drive may be missed because it did not have enough
time to answer the bus reset. To resolve this, a custom kernel can be
created which increases the default SCSI delay. Add the following option
to the custom kernel configuration file and rebuild the kernel using the
instructions in `Section?9.5, “Building and Installing a Custom
Kernel” <kernelconfig-building.html>`__:

.. code:: programlisting

    options SCSI_DELAY=15000

This tells the SCSI bus to pause 15 seconds during boot, to give the CD
drive every possible chance to answer the bus reset.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is possible to burn a file directly to CD, without creating an ISO
9660 file system. This is known as burning a raw data CD and some people
do this for backup purposes.

This type of disk can not be mounted as a normal data CD. In order to
retrieve the data burned to such a CD, the data must be read from the
raw device node. For example, this command will extract a compressed tar
file located on the second CD device into the current working directory:

.. code:: screen

    # tar xzvf /dev/cd1

In order to mount a data CD, the data must be written using ``mkisofs``.

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

18.5.5.?Duplicating Audio CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To duplicate an audio CD, extract the audio data from the CD to a series
of files, then write these files to a blank CD.

`Procedure?18.1, “Duplicating an Audio
CD” <creating-cds.html#using-cdrecord>`__ describes how to duplicate and
burn an audio CD. If the FreeBSD version is less than 10.0 and the
device is ATAPI, the ``atapicam`` module must be first loaded using the
instructions in `Section?18.5.1, “Supported
Devices” <creating-cds.html#atapicam>`__.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?18.1.?Duplicating an Audio CD

.. raw:: html

   </div>

#. The
   `sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
   package or port installs ``cdda2wav``. This command can be used to
   extract all of the audio tracks, with each track written to a
   separate WAV file in the current working directory:

   .. code:: screen

       % cdda2wav -vall -B -Owav

   A device name does not need to be specified if there is only one CD
   device on the system. Refer to the ``cdda2wav`` manual page for
   instructions on how to specify a device and to learn more about the
   other options available for this command.

#. Use ``cdrecord`` to write the ``.wav`` files:

   .. code:: screen

       % cdrecord -v dev=2,0 -dao -useinfo  *.wav

   Make sure that *``2,0``* is set appropriately, as described in
   `Section?18.5.2, “Burning a CD” <creating-cds.html#cdrecord>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+---------------------------------------+
| `Prev <usb-disks.html>`__?   | `Up <disks.html>`__     | ?\ `Next <creating-dvds.html>`__      |
+------------------------------+-------------------------+---------------------------------------+
| 18.4.?USB Storage Devices?   | `Home <index.html>`__   | ?18.6.?Creating and Using DVD Media   |
+------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
