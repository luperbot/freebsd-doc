=================================
19.5. Creating and Using CD Media
=================================

.. raw:: html

   <div class="navheader">

19.5. Creating and Using CD Media
`????? <usb-disks.html>`__?
???????? 19. ???????????? ????
?\ `??????? <creating-dvds.html>`__

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

19.5. Creating and Using CD Media
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

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.5.1. Introduction
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CD media provide a number of features that differentiate them from
conventional disks. Initially, they were not writable by the user. They
are designed so that they can be read continuously without delays to
move the head between tracks. They are also much easier to transport
between systems.

CD media do have tracks, but this refers to a section of data to be read
continuously and not a physical property of the disk. For example, to
produce a CD on FreeBSD, prepare the data files that are going to make
up the tracks on the CD, then write the tracks to the CD.

The ISO 9660 file system was designed to deal with these differences. To
overcome the original file system limits, it provides an extension
mechanism that allows properly written CDs to exceed those limits while
still working with systems that do not support those extensions.

The
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
port includes
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
a program that can be used to produce a data file containing an ISO 9660
file system. It has options that support various extensions, and is
described below.

Which tool to use to burn the CD depends on whether the CD burner is
ATAPI or something else. ATAPI CD burners use ``burncd`` which is part
of the base system. SCSI and USB CD burners should use ``cdrecord`` from
the
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
port. It is also possible to use ``cdrecord`` and other tools for SCSI
drives on ATAPI hardware with the `ATAPI/CAM
module <creating-cds.html#atapicam>`__.

For CD burning software with a graphical user interface, consider
X-CD-Roast or K3b. These tools are available as packages or from the
`sysutils/xcdroast <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/xcdroast/pkg-descr>`__
and
`sysutils/k3b <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/k3b/pkg-descr>`__
ports. X-CD-Roast and K3b require the `ATAPI/CAM
module <creating-cds.html#atapicam>`__ with ATAPI hardware.

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

19.5.2. mkisofs
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
port also installs
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
which produces an ISO 9660 file system that is an image of a directory
tree in the UNIX(R) file system name space. The simplest usage is:

.. code:: screen

    # mkisofs -o imagefile.iso /path/to/tree

This command creates an *``imagefile.iso``* containing an ISO 9660 file
system that is a copy of the tree at *``/path/to/tree``*. In the
process, it maps the file names to names that fit the limitations of the
standard ISO 9660 file system, and will exclude files that have names
uncharacteristic of ISO file systems.

A number of options are available to overcome these restrictions. In
particular, ``-R`` enables the Rock Ridge extensions common to UNIX(R)
systems, ``-J`` enables Joliet extensions used by Microsoft systems, and
``-hfs`` can be used to create HFS file systems used by Mac?OS(R).

For CDs that are going to be used only on FreeBSD systems, ``-U`` can be
used to disable all filename restrictions. When used with ``-R``, it
produces a file system image that is identical to the specified FreeBSD
tree, though it may violate the ISO 9660 standard in a number of ways.

The last option of general use is ``-b``. This is used to specify the
location of the boot image for use in producing an ?El Torito? bootable
CD. This option takes an argument which is the path to a boot image from
the top of the tree being written to the CD. By default,
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
creates an ISO image in ?floppy disk emulation? mode, and thus expects
the boot image to be exactly 1200, 1440 or 2880?KB in size. Some boot
loaders, like the one used by the FreeBSD distribution disks, do not use
emulation mode. In this case, ``-no-emul-boot`` should be used. So, if
``/tmp/myboot`` holds a bootable FreeBSD system with the boot image in
``/tmp/myboot/boot/cdboot``, this command would produce the image of an
ISO 9660 file system as ``/tmp/bootable.iso``:

.. code:: screen

    # mkisofs -R -no-emul-boot -b boot/cdboot -o /tmp/bootable.iso /tmp/myboot

If ``md`` is configured in the kernel, the file system can be mounted as
a memory disk with:

.. code:: screen

    # mdconfig -a -t vnode -f /tmp/bootable.iso -u 0
    # mount -t cd9660 /dev/md0 /mnt

One can then verify that ``/mnt`` and ``/tmp/myboot`` are identical.

There are many other options available for
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
to fine-tune its behavior. Refer to
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
for details.

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

19.5.3. burncd
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For an ATAPI CD burner, ``burncd`` can be used to burn an ISO image onto
a CD. ``burncd`` is part of the base system, installed as
``/usr/sbin/burncd``. Usage is very simple, as it has few options:

.. code:: screen

    # burncd -f cddevice data imagefile.iso fixate

This command will burn a copy of *``imagefile.iso``* on *``cddevice``*.
The default device is ``/dev/acd0``. See
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8>`__
for options to set the write speed, eject the CD after burning, and
write audio data.

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

19.5.4. cdrecord
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For systems without an ATAPI CD burner, ``cdrecord`` can be used to burn
CDs. ``cdrecord`` is not part of the base system and must be installed
from either the
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
package or port. Changes to the base system can cause binary versions of
this program to fail, possibly resulting in a ?coaster?. It is
recommended to either upgrade the port when the system is upgraded, or
for users `tracking -STABLE <current-stable.html#stable>`__, to upgrade
the port when a new version becomes available.

While ``cdrecord`` has many options, basic usage is simple. Burning an
ISO 9660 image is done with:

.. code:: screen

    # cdrecord dev=device imagefile.iso

The tricky part of using ``cdrecord`` is finding the ``dev`` to use. To
find the proper setting, use ``-scanbus`` which might produce results
like this:

.. code:: screen

    # cdrecord -scanbus
    Cdrecord-Clone 2.01 (i386-unknown-freebsd7.0) Copyright (C) 1995-2004 J"org Schilling
    Using libscg version 'schily-0.1'
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

This lists the appropriate ``dev`` value for the devices on the list.
Locate the CD burner, and use the three numbers separated by commas as
the value for ``dev``. In this case, the CRW device is 1,5,0, so the
appropriate input is ``dev=1,5,0``. Refer to
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__
for easier ways to specify this value and for information on writing
audio tracks and controlling the write speed.

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

19.5.5. Duplicating Audio CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To duplicate an audio CD, extract the audio data from the CD to a series
of files, then write these files to a blank CD. The process is slightly
different for ATAPI and SCSI drives.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

???????????19.1.?SCSI Drives

.. raw:: html

   </div>

#. Use ``cdda2wav`` to extract the audio:

   .. code:: screen

       % cdda2wav -vall -D2,0 -B -Owav

#. Use ``cdrecord`` to write the ``.wav`` files:

   .. code:: screen

       % cdrecord -v dev=2,0 -dao -useinfo  *.wav

   Make sure that *``2,0``* is set appropriately, as described in
   `??????19.5.4, ?cdrecord? <creating-cds.html#cdrecord>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

???????????19.2.?ATAPI Drives

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

With the help of the `ATAPI/CAM module <creating-cds.html#atapicam>`__,
``cdda2wav`` can also be used on ATAPI drives. This tool is usually a
better choice for most of users, as it supports jitter correction and
endianness, than the method proposed below.

.. raw:: html

   </div>

#. The ATAPI CD driver makes each track available as ``/dev/acddtnn``,
   where *``d``* is the drive number, and *``nn``* is the track number
   written with two decimal digits, prefixed with zero as needed. So the
   first track on the first disk is ``/dev/acd0t01``, the second is
   ``/dev/acd0t02``, the third is ``/dev/acd0t03``, and so on.

   Make sure the appropriate files exist in ``/dev``. If the entries are
   missing, force the system to retaste the media:

   .. code:: screen

       # dd if=/dev/acd0 of=/dev/null count=1

#. Extract each track using
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__,
   making sure to specify a block size when extracting the files:

   .. code:: screen

       # dd if=/dev/acd0t01 of=track1.cdr bs=2352
       # dd if=/dev/acd0t02 of=track2.cdr bs=2352
       ...

#. Burn the extracted files to disk using ``burncd``. Specify that these
   are audio files, and that ``burncd`` should fixate the disk when
   finished:

   .. code:: screen

       # burncd -f /dev/acd0 audio track1.cdr track2.cdr ... fixate

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

19.5.6. Duplicating Data CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to copy a data CD to an image file that is functionally
equivalent to the image file created with
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
and then use it to duplicate any data CD. The example given here assumes
that the CD-ROM device is ``acd0``. Substitute the correct CD-ROM
device.

.. code:: screen

    # dd if=/dev/acd0 of=file.iso bs=2048

Now that there is an image, it can be burned to CD as described above.

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

19.5.7. Using Data CDs
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to mount and read the data on a standard data CD. By
default,
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
assumes that a file system is of type ``ufs``. Running this command:

.. code:: screen

    # mount /dev/cd0 /mnt

will generate an error about Incorrect super block, and will fail to
mount the CD. The CD does not use the ``UFS`` file system, so attempts
to mount it as such will fail. Instead, tell
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
that the file system is of type ``ISO9660`` by specifying ``-t cd9660``
to
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
For example, to mount the CD-ROM device, ``/dev/cd0``, under ``/mnt``,
use:

.. code:: screen

    # mount -t cd9660 /dev/cd0 /mnt

Replace ``/dev/cd0`` with the device name for the CD device. Also,
``-t cd9660`` executes
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8>`__,
meaning the above command is equivalent to:

.. code:: screen

    # mount_cd9660 /dev/cd0 /mnt

While data CD-ROMs from any vendor can be mounted this way, disks with
certain ISO 9660 extensions might behave oddly. For example, Joliet
disks store all filenames in two-byte Unicode characters. The FreeBSD
kernel does not speak Unicode, but the FreeBSD CD9660 driver is able to
convert Unicode characters on the fly. If some non-English characters
show up as question marks, specify the local charset with ``-C``. For
more information, refer to
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

In order to do this character conversion with the help of ``-C``, the
kernel requires the ``cd9660_iconv.ko`` module to be loaded. This can be
done either by adding this line to ``loader.conf``:

.. code:: programlisting

    cd9660_iconv_load="YES"

and then rebooting the machine, or by directly loading the module with
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.

.. raw:: html

   </div>

Occasionally, Device not configured will be displayed when trying to
mount a CD-ROM. This usually means that the CD-ROM drive thinks that
there is no disk in the tray, or that the drive is not visible on the
bus. It can take a couple of seconds for a CD-ROM drive to realize that
a media is present, so be patient.

Sometimes, a SCSI CD-ROM may be missed because it did not have enough
time to answer the bus reset. To resolve this, add the following option
to the kernel configuration and `rebuild the
kernel <kernelconfig-building.html>`__.

.. code:: programlisting

    options SCSI_DELAY=15000

This tells the SCSI bus to pause 15 seconds during boot, to give the
CD-ROM drive every possible chance to answer the bus reset.

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

19.5.8. Burning Raw Data CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to burn a file directly to CD, without creating an ISO
9660 file system. Some people do this for backup purposes. This command
runs more quickly than burning a standard CD:

.. code:: screen

    # burncd -f /dev/acd1 -s 12 data archive.tar.gz fixate

In order to retrieve the data burned to such a CD, the data must be read
from the raw device node:

.. code:: screen

    # tar xzvf /dev/acd1

This type of disk can not be mounted as a normal CD-ROM and the data
cannot be read under any operating system except FreeBSD. In order to
mount the CD, or to share the data with another operating system,
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
must be used as described above.

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

19.5.9. Using the ATAPI/CAM Driver
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

This driver allows ATAPI devices, such as CD/DVD drives, to be accessed
through the SCSI subsystem, and so allows the use of applications like
`sysutils/cdrdao <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrdao/pkg-descr>`__
or
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__.

To use this driver, add the following line to ``/boot/loader.conf``:

.. code:: programlisting

    atapicam_load="YES"

then, reboot the system.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Users who prefer to statically compile
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
support into the kernel, should add this line to the kernel
configuration file:

.. code:: programlisting

    device atapicam

Ensure the following lines are still in the kernel configuration file:

.. code:: programlisting

    device ata
    device scbus
    device cd
    device pass

Then rebuild, install the new kernel, and reboot the machine.

.. raw:: html

   </div>

During the boot process, the burner should show up, like so:

.. code:: screen

    acd0: CD-RW <MATSHITA CD-RW/DVD-ROM UJDA740> at ata1-master PIO4
    cd0 at ata1 bus 0 target 0 lun 0
    cd0: <MATSHITA CDRW/DVD UJDA740 1.00> Removable CD-ROM SCSI-0 device
    cd0: 16.000MB/s transfers
    cd0: Attempt to query device size failed: NOT READY, Medium not present - tray closed

The drive can now be accessed via the ``/dev/cd0`` device name. For
example, to mount a CD-ROM on ``/mnt``, type the following:

.. code:: screen

    # mount -t cd9660 /dev/cd0 /mnt

As ``root``, run the following command to get the SCSI address of the
burner:

.. code:: screen

    # camcontrol devlist
    <MATSHITA CDRW/DVD UJDA740 1.00>   at scbus1 target 0 lun 0 (pass0,cd0)

In this example, ``1,0,0`` is the SCSI address to use with
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__
and other SCSI applications.

For more information about ATAPI/CAM and SCSI system, refer to
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
and `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+---------------------------------------+
| `????? <usb-disks.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <creating-dvds.html>`__   |
+-------------------------------+-------------------------+---------------------------------------+
| 19.4. USB Storage Devices?    | `???? <index.html>`__   | ?19.6. Creating and Using DVD Media   |
+-------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
