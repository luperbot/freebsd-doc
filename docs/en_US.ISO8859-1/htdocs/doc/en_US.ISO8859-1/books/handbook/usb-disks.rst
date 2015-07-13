=========================
18.4.?USB Storage Devices
=========================

.. raw:: html

   <div class="navheader">

18.4.?USB Storage Devices
`Prev <disks-growing.html>`__?
Chapter?18.?Storage
?\ `Next <creating-cds.html>`__

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

18.4.?USB Storage Devices
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
and CD and DVD burners, use the Universal Serial Bus (USB). FreeBSD
provides support for USB 1.x, 2.0, and 3.0 devices.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

USB 3.0 support is not compatible with some hardware, including Haswell
(Lynx point) chipsets. If FreeBSD boots with a failed with error 19
message, disable xHCI/USB3 in the system BIOS.

.. raw:: html

   </div>

Support for USB storage devices is built into the ``GENERIC`` kernel.
For a custom kernel, be sure that the following lines are present in the
kernel configuration file:

.. code:: programlisting

    device scbus    # SCSI bus (required for ATA/SCSI)
    device da   # Direct Access (disks)
    device pass # Passthrough device (direct ATA/SCSI access)
    device uhci # provides USB 1.x support
    device ohci # provides USB 1.x support
    device ehci # provides USB 2.0 support
    device xhci # provides USB 3.0 support
    device usb  # USB Bus (required)
    device umass    # Disks/Mass storage - Requires scbus and da
    device cd   # needed for CD and DVD burners

FreeBSD uses the
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__
driver which uses the SCSI subsystem to access USB storage devices.
Since any USB device will be seen as a SCSI device by the system, if the
USB device is a CD or DVD burner, do *not* include ``device atapicam``
in a custom kernel configuration file.

The rest of this section demonstrates how to verify that a USB storage
device is recognized by FreeBSD and how to configure the device so that
it can be used.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.4.1.?Device Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To test the USB configuration, plug in the USB device. Use ``dmesg`` to
confirm that the drive appears in the system message buffer. It should
look something like this:

.. code:: screen

    umass0: <STECH Simple Drive, class 0/0, rev 2.00/1.04, addr 3> on usbus0
    umass0:  SCSI over Bulk-Only; quirks = 0x0100
    umass0:4:0:-1: Attached to scbus4
    da0 at umass-sim0 bus 0 scbus4 target 0 lun 0
    da0: <STECH Simple Drive 1.04> Fixed Direct Access SCSI-4 device
    da0: Serial Number WD-WXE508CAN263
    da0: 40.000MB/s transfers
    da0: 152627MB (312581808 512 byte sectors: 255H 63S/T 19457C)
    da0: quirks=0x2<NO_6_BYTE>

The brand, device node (``da0``), speed, and size will differ according
to the device.

Since the USB device is seen as a SCSI one, ``camcontrol`` can be used
to list the USB storage devices attached to the system:

.. code:: screen

    # camcontrol devlist
    <STECH Simple Drive 1.04>          at scbus4 target 0 lun 0 (pass3,da0)

Alternately, ``usbconfig`` can be used to list the device. Refer to
`usbconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbconfig&sektion=8>`__
for more information about this command.

.. code:: screen

    # usbconfig
    ugen0.3: <Simple Drive STECH> at usbus0, cfg=0 md=HOST spd=HIGH (480Mbps) pwr=ON (2mA)

If the device has not been formatted, refer to `Section?18.2, “Adding
Disks” <disks-adding.html>`__ for instructions on how to format and
create partitions on the USB drive. If the drive comes with a file
system, it can be mounted by ``root`` using the instructions in
`Section?4.7, “Mounting and Unmounting File
Systems” <mount-unmount.html>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Allowing untrusted users to mount arbitrary media, by enabling
``vfs.usermount`` as described below, should not be considered safe from
a security point of view. Most file systems were not built to safeguard
against malicious devices.

.. raw:: html

   </div>

To make the device mountable as a normal user, one solution is to make
all users of the device a member of the ``operator`` group using
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__. Next,
ensure that ``operator`` is able to read and write the device by adding
these lines to ``/etc/devfs.rules``:

.. code:: programlisting

    [localrules=5]
    add path 'da*' mode 0660 group operator

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If internal SCSI disks are also installed in the system, change the
second line as follows:

.. code:: programlisting

    add path 'da[3-9]*' mode 0660 group operator

This will exclude the first three SCSI disks (``da0`` to ``da2``)from
belonging to the ``operator`` group. Replace *``3``* with the number of
internal SCSI disks. Refer to
`devfs.rules(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.rules&sektion=5>`__
for more information about this file.

.. raw:: html

   </div>

Next, enable the ruleset in ``/etc/rc.conf``:

.. code:: programlisting

    devfs_system_ruleset="localrules"

Then, instruct the system to allow regular users to mount file systems
by adding the following line to ``/etc/sysctl.conf``:

.. code:: programlisting

    vfs.usermount=1

Since this only takes effect after the next reboot, use ``sysctl`` to
set this variable now:

.. code:: screen

    # sysctl vfs.usermount=1
    vfs.usermount: 0 -> 1

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
appears. If the device is formatted with a FAT file system, the user can
mount it using:

.. code:: screen

    % mount -t msdosfs -o -m=644,-M=755 /dev/da0s1 /mnt/username

Before the device can be unplugged, it *must* be unmounted first:

.. code:: screen

    % umount /mnt/username

After device removal, the system message buffer will show messages
similar to the following:

.. code:: screen

    umass0: at uhub3, port 2, addr 3 (disconnected)
    da0 at umass-sim0 bus 0 scbus4 target 0 lun 0
    da0: <STECH Simple Drive 1.04> s/n WD-WXE508CAN263          detached
    (da0:umass-sim0:0:0:0): Periph destroyed

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+--------------------------------------+
| `Prev <disks-growing.html>`__?      | `Up <disks.html>`__     | ?\ `Next <creating-cds.html>`__      |
+-------------------------------------+-------------------------+--------------------------------------+
| 18.3.?Resizing and Growing Disks?   | `Home <index.html>`__   | ?18.5.?Creating and Using CD Media   |
+-------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
