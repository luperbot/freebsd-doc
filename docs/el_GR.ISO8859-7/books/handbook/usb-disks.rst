=========================
19.4. USB Storage Devices
=========================

.. raw:: html

   <div class="navheader">

19.4. USB Storage Devices
`????? <disks-adding.html>`__?
???????? 19. ???????????? ????
?\ `??????? <creating-cds.html>`__

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

19.4. USB Storage Devices
-------------------------

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

Many external storage solutions, such as hard drives, USB thumbdrives,
and CD/DVD burners, use the Universal Serial Bus (USB). FreeBSD provides
support for these devices.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.4.1. Configuration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The USB mass storage devices driver,
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__,
is built into the ``GENERIC`` kernel and provides support for USB
storage devices. For a custom kernel, be sure that the following lines
are present in the kernel configuration file:

.. code:: programlisting

    device scbus
    device da
    device pass
    device uhci
    device ohci
    device ehci
    device usb
    device umass

Since the
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__
driver uses the SCSI subsystem to access the USB storage devices, any
USB device will be seen as a SCSI device by the system. Depending on the
USB chipset on the motherboard, ``device uhci`` or ``device ohci`` is
used to provide USB 1.X support. Support for USB 2.0 controllers is
provided by ``device ehci``.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

If the USB device is a CD or DVD burner,
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4>`__, must
be added to the kernel via the line:

.. code:: programlisting

    device cd

Since the burner is seen as a SCSI drive, the driver
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
should not be used in the kernel configuration.

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

19.4.2. Testing the Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To test the USB configuration, plug in the USB device. In the system
message buffer,
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__,
the drive should appear as something like:

.. code:: screen

    umass0: USB Solid state disk, rev 1.10/1.00, addr 2
    GEOM: create disk da0 dp=0xc2d74850
    da0 at umass-sim0 bus 0 target 0 lun 0
    da0: <Generic Traveling Disk 1.11> Removable Direct Access SCSI-2 device
    da0: 1.000MB/s transfers
    da0: 126MB (258048 512 byte sectors: 64H 32S/T 126C)

The brand, device node (``da0``), and other details will differ
according to the device.

Since the USB device is seen as a SCSI one, ``camcontrol`` can be used
to list the USB storage devices attached to the system:

.. code:: screen

    # camcontrol devlist
    <Generic Traveling Disk 1.11>      at scbus0 target 0 lun 0 (da0,pass0)

If the drive comes with a file system, it can be mounted. Refer to
`??????19.3, ?Adding Disks? <disks-adding.html>`__ for instructions on
how to format and create partitions on the USB drive.

.. raw:: html

   <div class="warning" xmlns="">

?????????????:
~~~~~~~~~~~~~~

Allowing untrusted users to mount arbitrary media, by enabling
``vfs.usermount`` as described below, should not be considered safe from
a security point of view. Most file systems in FreeBSD were not built to
safeguard against malicious devices.

.. raw:: html

   </div>

To make the device mountable as a normal user, one solution is to make
all users of the device a member of the ``operator`` group using
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__. Next,
ensure that the ``operator`` group is able to read and write the device
by adding these lines to ``/etc/devfs.rules``:

.. code:: programlisting

    [localrules=5]
    add path 'da*' mode 0660 group operator

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

If SCSI disks are installed in the system, change the second line as
follows:

.. code:: programlisting

    add path 'da[3-9]*' mode 0660 group operator

This will exclude the first three SCSI disks (``da0`` to ``da2``)from
belonging to the ``operator`` group.

.. raw:: html

   </div>

Next, enable the
`devfs.rules(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.rules&sektion=5>`__
ruleset in ``/etc/rc.conf``:

.. code:: programlisting

    devfs_system_ruleset="localrules"

Next, instruct the running kernel to allow regular users to mount file
systems. The easiest way is to add the following line to
``/etc/sysctl.conf``:

.. code:: programlisting

    vfs.usermount=1

Since this only takes effect after the next reboot use
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
to set this variable now.

The final step is to create a directory where the file system is to be
mounted. This directory needs to be owned by the user that is to mount
the file system. One way to do that is for ``root`` to create a
subdirectory owned by that user as ``/mnt/username``. In the following
example, replace *``username``* with the login name of the user and
*``usergroup``* with the user's primary group:

.. code:: screen

    # mkdir /mnt/username
    # chown username:usergroup /mnt/username

Suppose a USB thumbdrive is plugged in, and a device ``/dev/da0s1``
appears. If the device is preformatted with a FAT file system, it can be
mounted using:

.. code:: screen

    % mount -t msdosfs -o -m=644,-M=755 /dev/da0s1 /mnt/username

Before the device can be unplugged, it *must* be unmounted first. After
device removal, the system message buffer will show messages similar to
the following:

.. code:: screen

    umass0: at uhub0 port 1 (addr 2) disconnected
    (da0:umass-sim0:0:0:0): lost device
    (da0:umass-sim0:0:0:0): removing device entry
    GEOM: destroy disk da0 dp=0xc2d74850
    umass0: detached

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

19.4.3. Further Reading
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beside the `Adding Disks <disks-adding.html>`__ and `Mounting and
Unmounting File Systems <mount-unmount.html>`__ sections, reading
various manual pages may also be useful:
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__,
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__,
and
`usbconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbconfig&sektion=8>`__
under FreeBSD? 8.X or
`usbdevs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdevs&sektion=8>`__
under earlier versions of FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+--------------------------------------+
| `????? <disks-adding.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <creating-cds.html>`__   |
+----------------------------------+-------------------------+--------------------------------------+
| 19.3. Adding Disks?              | `???? <index.html>`__   | ?19.5. Creating and Using CD Media   |
+----------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
