=======================
19.3.?RAID1 - Mirroring
=======================

.. raw:: html

   <div class="navheader">

19.3.?RAID1 - Mirroring
`Prev <geom-striping.html>`__?
Chapter?19.?GEOM: Modular Disk Transformation Framework
?\ `Next <geom-raid3.html>`__

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

19.3.?RAID1 - Mirroring
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

RAID1, or *mirroring*, is the technique of writing the same data to more
than one disk drive. Mirrors are usually used to guard against data loss
due to drive failure. Each drive in a mirror contains an identical copy
of the data. When an individual drive fails, the mirror continues to
work, providing data from the drives that are still functioning. The
computer keeps running, and the administrator has time to replace the
failed drive without user interruption.

Two common situations are illustrated in these examples. The first
creates a mirror out of two new drives and uses it as a replacement for
an existing single drive. The second example creates a mirror on a
single new drive, copies the old drive's data to it, then inserts the
old drive into the mirror. While this procedure is slightly more
complicated, it only requires one new drive.

Traditionally, the two drives in a mirror are identical in model and
capacity, but
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
does not require that. Mirrors created with dissimilar drives will have
a capacity equal to that of the smallest drive in the mirror. Extra
space on larger drives will be unused. Drives inserted into the mirror
later must have at least as much capacity as the smallest drive already
in the mirror.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

The mirroring procedures shown here are non-destructive, but as with any
major disk operation, make a full backup first.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

While
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__ is
used in these procedures to copy file systems, it does not work on file
systems with soft updates journaling. See
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
for information on detecting and disabling soft updates journaling.

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

19.3.1.?Metadata Issues
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many disk systems store metadata at the end of each disk. Old metadata
should be erased before reusing the disk for a mirror. Most problems are
caused by two particular types of leftover metadata: GPT partition
tables and old metadata from a previous mirror.

GPT metadata can be erased with
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__.
This example erases both primary and backup GPT partition tables from
disk ``ada8``:

.. code:: screen

    # gpart destroy -F ada8

A disk can be removed from an active mirror and the metadata erased in
one step using
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__.
Here, the example disk ``ada8`` is removed from the active mirror
``gm4``:

.. code:: screen

    # gmirror remove gm4 ada8

If the mirror is not running, but old mirror metadata is still on the
disk, use ``gmirror clear`` to remove it:

.. code:: screen

    # gmirror clear ada8

`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
stores one block of metadata at the end of the disk. Because GPT
partition schemes also store metadata at the end of the disk, mirroring
entire GPT disks with
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
is not recommended. MBR partitioning is used here because it only stores
a partition table at the start of the disk and does not conflict with
the mirror metadata.

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

19.3.2.?Creating a Mirror with Two New Disks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In this example, FreeBSD has already been installed on a single disk,
``ada0``. Two new disks, ``ada1`` and ``ada2``, have been connected to
the system. A new mirror will be created on these two disks and used to
replace the old single disk.

The ``geom_mirror.ko`` kernel module must either be built into the
kernel or loaded at boot- or run-time. Manually load the kernel module
now:

.. code:: screen

    # gmirror load

Create the mirror with the two new drives:

.. code:: screen

    # gmirror label -v gm0 /dev/ada1 /dev/ada2

``gm0`` is a user-chosen device name assigned to the new mirror. After
the mirror has been started, this device name appears in
``/dev/mirror/``.

MBR and bsdlabel partition tables can now be created on the mirror with
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__.
This example uses a traditional file system layout, with partitions for
``/``, swap, ``/var``, ``/tmp``, and ``/usr``. A single ``/`` and a swap
partition will also work.

Partitions on the mirror do not have to be the same size as those on the
existing disk, but they must be large enough to hold all the data
already present on ``ada0``.

.. code:: screen

    # gpart create -s MBR mirror/gm0
    # gpart add -t freebsd -a 4k mirror/gm0
    # gpart show mirror/gm0
    =>       63  156301423  mirror/gm0  MBR  (74G)
             63         63                    - free -  (31k)
            126  156301299                 1  freebsd  (74G)
      156301425         61                    - free -  (30k)

.. code:: screen

    # gpart create -s BSD mirror/gm0s1
    # gpart add -t freebsd-ufs  -a 4k -s 2g mirror/gm0s1
    # gpart add -t freebsd-swap -a 4k -s 4g mirror/gm0s1
    # gpart add -t freebsd-ufs  -a 4k -s 2g mirror/gm0s1
    # gpart add -t freebsd-ufs  -a 4k -s 1g mirror/gm0s1
    # gpart add -t freebsd-ufs  -a 4k       mirror/gm0s1
    # gpart show mirror/gm0s1
    =>        0  156301299  mirror/gm0s1  BSD  (74G)
              0          2                      - free -  (1.0k)
              2    4194304                   1  freebsd-ufs  (2.0G)
        4194306    8388608                   2  freebsd-swap  (4.0G)
       12582914    4194304                   4  freebsd-ufs  (2.0G)
       16777218    2097152                   5  freebsd-ufs  (1.0G)
       18874370  137426928                   6  freebsd-ufs  (65G)
      156301298          1                      - free -  (512B)

Make the mirror bootable by installing bootcode in the MBR and bsdlabel
and setting the active slice:

.. code:: screen

    # gpart bootcode -b /boot/mbr mirror/gm0
    # gpart set -a active -i 1 mirror/gm0
    # gpart bootcode -b /boot/boot mirror/gm0s1

Format the file systems on the new mirror, enabling soft-updates.

.. code:: screen

    # newfs -U /dev/mirror/gm0s1a
    # newfs -U /dev/mirror/gm0s1d
    # newfs -U /dev/mirror/gm0s1e
    # newfs -U /dev/mirror/gm0s1f

File systems from the original ``ada0`` disk can now be copied onto the
mirror with
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__.

.. code:: screen

    # mount /dev/mirror/gm0s1a /mnt
    # dump -C16 -b64 -0aL -f - / | (cd /mnt && restore -rf -)
    # mount /dev/mirror/gm0s1d /mnt/var
    # mount /dev/mirror/gm0s1e /mnt/tmp
    # mount /dev/mirror/gm0s1f /mnt/usr
    # dump -C16 -b64 -0aL -f - /var | (cd /mnt/var && restore -rf -)
    # dump -C16 -b64 -0aL -f - /tmp | (cd /mnt/tmp && restore -rf -)
    # dump -C16 -b64 -0aL -f - /usr | (cd /mnt/usr && restore -rf -)

Edit ``/mnt/etc/fstab`` to point to the new mirror file systems:

.. code:: programlisting

    # Device        Mountpoint  FStype  Options Dump    Pass#
    /dev/mirror/gm0s1a  /       ufs rw  1   1
    /dev/mirror/gm0s1b  none        swap    sw  0   0
    /dev/mirror/gm0s1d  /var        ufs rw  2   2
    /dev/mirror/gm0s1e  /tmp        ufs rw  2   2
    /dev/mirror/gm0s1f  /usr        ufs rw  2   2

If the ``geom_mirror.ko`` kernel module has not been built into the
kernel, ``/mnt/boot/loader.conf`` is edited to load the module at boot:

.. code:: programlisting

    geom_mirror_load="YES"

Reboot the system to test the new mirror and verify that all data has
been copied. The BIOS will see the mirror as two individual drives
rather than a mirror. Because the drives are identical, it does not
matter which is selected to boot.

See `Section?19.3.4,
“Troubleshooting” <geom-mirror.html#gmirror-troubleshooting>`__ if there
are problems booting. Powering down and disconnecting the original
``ada0`` disk will allow it to be kept as an offline backup.

In use, the mirror will behave just like the original single drive.

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

19.3.3.?Creating a Mirror with an Existing Drive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In this example, FreeBSD has already been installed on a single disk,
``ada0``. A new disk, ``ada1``, has been connected to the system. A
one-disk mirror will be created on the new disk, the existing system
copied onto it, and then the old disk will be inserted into the mirror.
This slightly complex procedure is required because ``gmirror`` needs to
put a 512-byte block of metadata at the end of each disk, and the
existing ``ada0`` has usually had all of its space already allocated.

Load the ``geom_mirror.ko`` kernel module:

.. code:: screen

    # gmirror load

Check the media size of the original disk with ``diskinfo``:

.. code:: screen

    # diskinfo -v ada0 | head -n3
    /dev/ada0
        512             # sectorsize
        1000204821504   # mediasize in bytes (931G)

Create a mirror on the new disk. To make certain that the mirror
capacity is not any larger than the original ``ada0`` drive,
`gnop(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gnop&sektion=8>`__ is
used to create a fake drive of the exact same size. This drive does not
store any data, but is used only to limit the size of the mirror. When
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
creates the mirror, it will restrict the capacity to the size of
``gzero.nop``, even if the new ``ada1`` drive has more space. Note that
the *``1000204821504``* in the second line is equal to ``ada0``'s media
size as shown by ``diskinfo`` above.

.. code:: screen

    # geom zero load
    # gnop create -s 1000204821504 gzero
    # gmirror label -v gm0 gzero.nop ada1
    # gmirror forget gm0

Since ``gzero.nop`` does not store any data, the mirror does not see it
as connected. The mirror is told to “forget” unconnected components,
removing references to ``gzero.nop``. The result is a mirror device
containing only a single disk, ``ada1``.

After creating ``gm0``, view the partition table on ``ada0``. This
output is from a 1?TB drive. If there is some unallocated space at the
end of the drive, the contents may be copied directly from ``ada0`` to
the new mirror.

However, if the output shows that all of the space on the disk is
allocated, as in the following listing, there is no space available for
the 512-byte mirror metadata at the end of the disk.

.. code:: screen

    # gpart show ada0
    =>        63  1953525105        ada0  MBR  (931G)
              63  1953525105           1  freebsd  [active]  (931G)

In this case, the partition table must be edited to reduce the capacity
by one sector on ``mirror/gm0``. The procedure will be explained later.

In either case, partition tables on the primary disk should be first
copied using ``gpart backup`` and ``gpart restore``.

.. code:: screen

    # gpart backup ada0 > table.ada0
    # gpart backup ada0s1 > table.ada0s1

These commands create two files, ``table.ada0`` and ``table.ada0s1``.
This example is from a 1?TB drive:

.. code:: screen

    # cat table.ada0
    MBR 4
    1 freebsd         63 1953525105   [active]

.. code:: screen

    # cat table.ada0s1
    BSD 8
    1  freebsd-ufs          0    4194304
    2 freebsd-swap    4194304   33554432
    4  freebsd-ufs   37748736   50331648
    5  freebsd-ufs   88080384   41943040
    6  freebsd-ufs  130023424  838860800
    7  freebsd-ufs  968884224  984640881

If no free space is shown at the end of the disk, the size of both the
slice and the last partition must be reduced by one sector. Edit the two
files, reducing the size of both the slice and last partition by one.
These are the last numbers in each listing.

.. code:: screen

    # cat table.ada0
    MBR 4
    1 freebsd         63 1953525104   [active]

.. code:: screen

    # cat table.ada0s1
    BSD 8
    1  freebsd-ufs          0    4194304
    2 freebsd-swap    4194304   33554432
    4  freebsd-ufs   37748736   50331648
    5  freebsd-ufs   88080384   41943040
    6  freebsd-ufs  130023424  838860800
    7  freebsd-ufs  968884224  984640880

If at least one sector was unallocated at the end of the disk, these two
files can be used without modification.

Now restore the partition table into ``mirror/gm0``:

.. code:: screen

    # gpart restore mirror/gm0 < table.ada0
    # gpart restore mirror/gm0s1 < table.ada0s1

Check the partition table with ``gpart show``. This example has
``gm0s1a`` for ``/``, ``gm0s1d`` for ``/var``, ``gm0s1e`` for ``/usr``,
``gm0s1f`` for ``/data1``, and ``gm0s1g`` for ``/data2``.

.. code:: screen

    # gpart show mirror/gm0
    =>        63  1953525104  mirror/gm0  MBR  (931G)
              63  1953525042           1  freebsd  [active]  (931G)
      1953525105          62              - free -  (31k)

    # gpart show mirror/gm0s1
    =>         0  1953525042  mirror/gm0s1  BSD  (931G)
               0     2097152             1  freebsd-ufs  (1.0G)
         2097152    16777216             2  freebsd-swap  (8.0G)
        18874368    41943040             4  freebsd-ufs  (20G)
        60817408    20971520             5  freebsd-ufs  (10G)
        81788928   629145600             6  freebsd-ufs  (300G)
       710934528  1242590514             7  freebsd-ufs  (592G)
      1953525042          63                - free -  (31k)

Both the slice and the last partition must have at least one free block
at the end of the disk.

Create file systems on these new partitions. The number of partitions
will vary to match the original disk, ``ada0``.

.. code:: screen

    # newfs -U /dev/mirror/gm0s1a
    # newfs -U /dev/mirror/gm0s1d
    # newfs -U /dev/mirror/gm0s1e
    # newfs -U /dev/mirror/gm0s1f
    # newfs -U /dev/mirror/gm0s1g

Make the mirror bootable by installing bootcode in the MBR and bsdlabel
and setting the active slice:

.. code:: screen

    # gpart bootcode -b /boot/mbr mirror/gm0
    # gpart set -a active -i 1 mirror/gm0
    # gpart bootcode -b /boot/boot mirror/gm0s1

Adjust ``/etc/fstab`` to use the new partitions on the mirror. Back up
this file first by copying it to ``/etc/fstab.orig``.

.. code:: screen

    # cp /etc/fstab /etc/fstab.orig

Edit ``/etc/fstab``, replacing ``/dev/ada0`` with ``mirror/gm0``.

.. code:: programlisting

    # Device       Mountpoint  FStype  Options Dump    Pass#
    /dev/mirror/gm0s1a  /       ufs rw  1   1
    /dev/mirror/gm0s1b  none        swap    sw  0   0
    /dev/mirror/gm0s1d  /var        ufs rw  2   2
    /dev/mirror/gm0s1e  /usr        ufs rw  2   2
    /dev/mirror/gm0s1f  /data1      ufs rw  2   2
    /dev/mirror/gm0s1g  /data2      ufs rw  2   2

If the ``geom_mirror.ko`` kernel module has not been built into the
kernel, edit ``/boot/loader.conf`` to load it at boot:

.. code:: programlisting

    geom_mirror_load="YES"

File systems from the original disk can now be copied onto the mirror
with
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__.
Each file system dumped with ``dump -L`` will create a snapshot first,
which can take some time.

.. code:: screen

    # mount /dev/mirror/gm0s1a /mnt
    # dump -C16 -b64 -0aL -f - /    | (cd /mnt && restore -rf -)
    # mount /dev/mirror/gm0s1d /mnt/var
    # mount /dev/mirror/gm0s1e /mnt/usr
    # mount /dev/mirror/gm0s1f /mnt/data1
    # mount /dev/mirror/gm0s1g /mnt/data2
    # dump -C16 -b64 -0aL -f - /usr | (cd /mnt/usr && restore -rf -)
    # dump -C16 -b64 -0aL -f - /var | (cd /mnt/var && restore -rf -)
    # dump -C16 -b64 -0aL -f - /data1 | (cd /mnt/data1 && restore -rf -)
    # dump -C16 -b64 -0aL -f - /data2 | (cd /mnt/data2 && restore -rf -)

Restart the system, booting from ``ada1``. If everything is working, the
system will boot from ``mirror/gm0``, which now contains the same data
as ``ada0`` had previously. See `Section?19.3.4,
“Troubleshooting” <geom-mirror.html#gmirror-troubleshooting>`__ if there
are problems booting.

At this point, the mirror still consists of only the single ``ada1``
disk.

After booting from ``mirror/gm0`` successfully, the final step is
inserting ``ada0`` into the mirror.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

When ``ada0`` is inserted into the mirror, its former contents will be
overwritten by data from the mirror. Make certain that ``mirror/gm0``
has the same contents as ``ada0`` before adding ``ada0`` to the mirror.
If the contents previously copied by
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__
are not identical to what was on ``ada0``, revert ``/etc/fstab`` to
mount the file systems on ``ada0``, reboot, and start the whole
procedure again.

.. raw:: html

   </div>

.. code:: screen

    # gmirror insert gm0 ada0
    GEOM_MIRROR: Device gm0: rebuilding provider ada0

Synchronization between the two disks will start immediately. Use
``gmirror status`` to view the progress.

.. code:: screen

    # gmirror status
          Name    Status  Components
    mirror/gm0  DEGRADED  ada1 (ACTIVE)
                          ada0 (SYNCHRONIZING, 64%)

After a while, synchronization will finish.

.. code:: screen

    GEOM_MIRROR: Device gm0: rebuilding provider ada0 finished.
    # gmirror status
          Name    Status  Components
    mirror/gm0  COMPLETE  ada1 (ACTIVE)
                          ada0 (ACTIVE)

``mirror/gm0`` now consists of the two disks ``ada0`` and ``ada1``, and
the contents are automatically synchronized with each other. In use,
``mirror/gm0`` will behave just like the original single drive.

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

19.3.4.?Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the system no longer boots, BIOS settings may have to be changed to
boot from one of the new mirrored drives. Either mirror drive can be
used for booting, as they contain identical data.

If the boot stops with this message, something is wrong with the mirror
device:

.. code:: screen

    Mounting from ufs:/dev/mirror/gm0s1a failed with error 19.

    Loader variables:
      vfs.root.mountfrom=ufs:/dev/mirror/gm0s1a
      vfs.root.mountfrom.options=rw

    Manual root filesystem specification:
      <fstype>:<device> [options]
          Mount <device> using filesystem <fstype>
          and with the specified (optional) option list.

        eg. ufs:/dev/da0s1a
            zfs:tank
            cd9660:/dev/acd0 ro
              (which is equivalent to: mount -t cd9660 -o ro /dev/acd0 /)

      ?               List valid disk boot devices
      .               Yield 1 second (for background tasks)
      <empty line>    Abort manual input

    mountroot>

Forgetting to load the ``geom_mirror.ko`` module in
``/boot/loader.conf`` can cause this problem. To fix it, boot from a
FreeBSD?9.0 or later installation media and choose ``Shell`` at the
first prompt. Then load the mirror module and mount the mirror device:

.. code:: screen

    # gmirror load
    # mount /dev/mirror/gm0s1a /mnt

Edit ``/mnt/boot/loader.conf``, adding a line to load the mirror module:

.. code:: programlisting

    geom_mirror_load="YES"

Save the file and reboot.

Other problems that cause error 19 require more effort to fix. Although
the system should boot from ``ada0``, another prompt to select a shell
will appear if ``/etc/fstab`` is incorrect. Enter ``ufs:/dev/ada0s1a``
at the boot loader prompt and press **Enter**. Undo the edits in
``/etc/fstab`` then mount the file systems from the original disk
(``ada0``) instead of the mirror. Reboot the system and try the
procedure again.

.. code:: screen

    Enter full pathname of shell or RETURN for /bin/sh:
    # cp /etc/fstab.orig /etc/fstab
    # reboot

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

19.3.5.?Recovering from Disk Failure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The benefit of disk mirroring is that an individual disk can fail
without causing the mirror to lose any data. In the above example, if
``ada0`` fails, the mirror will continue to work, providing data from
the remaining working drive, ``ada1``.

To replace the failed drive, shut down the system and physically replace
the failed drive with a new drive of equal or greater capacity.
Manufacturers use somewhat arbitrary values when rating drives in
gigabytes, and the only way to really be sure is to compare the total
count of sectors shown by ``diskinfo -v``. A drive with larger capacity
than the mirror will work, although the extra space on the new drive
will not be used.

After the computer is powered back up, the mirror will be running in a
“degraded” mode with only one drive. The mirror is told to forget drives
that are not currently connected:

.. code:: screen

    # gmirror forget gm0

Any old metadata should be cleared from the replacement disk using the
instructions in `Section?19.3.1, “Metadata
Issues” <geom-mirror.html#geom-mirror-metadata>`__. Then the replacement
disk, ``ada4`` for this example, is inserted into the mirror:

.. code:: screen

    # gmirror insert gm0 /dev/ada4

Resynchronization begins when the new drive is inserted into the mirror.
This process of copying mirror data to a new drive can take a while.
Performance of the mirror will be greatly reduced during the copy, so
inserting new drives is best done when there is low demand on the
computer.

Progress can be monitored with ``gmirror       status``, which shows
drives that are being synchronized and the percentage of completion.
During resynchronization, the status will be ``DEGRADED``, changing to
``COMPLETE`` when the process is finished.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+------------------------------------------------------------+
| `Prev <geom-striping.html>`__?   | `Up <geom.html>`__      | ?\ `Next <geom-raid3.html>`__                              |
+----------------------------------+-------------------------+------------------------------------------------------------+
| 19.2.?RAID0 - Striping?          | `Home <index.html>`__   | ?19.4.?RAID3 - Byte-level Striping with Dedicated Parity   |
+----------------------------------+-------------------------+------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
