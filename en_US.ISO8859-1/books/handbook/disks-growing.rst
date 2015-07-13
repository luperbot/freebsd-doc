================================
18.3.?Resizing and Growing Disks
================================

.. raw:: html

   <div class="navheader">

18.3.?Resizing and Growing Disks
`Prev <disks-adding.html>`__?
Chapter?18.?Storage
?\ `Next <usb-disks.html>`__

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

18.3.?Resizing and Growing Disks
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally contributed by Allan Jude.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A disk's capacity can increase without any changes to the data already
present. This happens commonly with virtual machines, when the virtual
disk turns out to be too small and is enlarged. Sometimes a disk image
is written to a USB memory stick, but does not use the full capacity.
Here we describe how to resize or *grow* disk contents to take advantage
of increased capacity.

Determine the device name of the disk to be resized by inspecting
``/var/run/dmesg.boot``. In this example, there is only one SATA disk in
the system, so the drive will appear as ``ada0``.

List the partitions on the disk to see the current configuration:

.. code:: screen

    # gpart show ada0
    =>      34  83886013  ada0  GPT  (48G) [CORRUPT]
            34       128     1  freebsd-boot  (64k)
           162  79691648     2  freebsd-ufs  (38G)
      79691810   4194236     3  freebsd-swap  (2G)
      83886046         1        - free -  (512B)

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If the disk was formatted with the
`GPT <http://en.wikipedia.org/wiki/GUID_Partition_Table>`__ partitioning
scheme, it may show as “corrupted” because the GPT backup partition
table is no longer at the end of the drive. Fix the backup partition
table with ``gpart``:

.. code:: screen

    # gpart recover ada0
    ada0 recovered

.. raw:: html

   </div>

Now the additional space on the disk is available for use by a new
partition, or an existing partition can be expanded:

.. code:: screen

    # gpart show ada0
    =>       34  102399933  ada0  GPT  (48G)
             34        128     1  freebsd-boot  (64k)
            162   79691648     2  freebsd-ufs  (38G)
       79691810    4194236     3  freebsd-swap  (2G)
       83886046   18513921        - free -  (8.8G)

Partitions can only be resized into contiguous free space. Here, the
last partition on the disk is the swap partition, but the second
partition is the one that needs to be resized. Swap partitions only
contain temporary data, so it can safely be unmounted, deleted, and then
recreated after resizing other partitions.

.. code:: screen

    # swapoff /dev/ada0p3
    # gpart delete -i 3 ada0
    ada0p3 deleted
    # gpart show ada0
    =>       34  102399933  ada0  GPT  (48G)
             34        128     1  freebsd-boot  (64k)
            162   79691648     2  freebsd-ufs  (38G)
       79691810   22708157        - free -  (10G)

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

There is risk of data loss when modifying the partition table of a
mounted file system. It is best to perform the following steps on an
unmounted file system while running from a live CD-ROM or USB device.
However, if absolutely necessary, a mounted file system can be resized
after disabling GEOM safety features:

.. code:: screen

    # sysctl kern.geom.debugflags=16

.. raw:: html

   </div>

Resize the partition, leaving room to recreate a swap partition of the
desired size. This only modifies the size of the partition. The file
system in the partition will be expanded in a separate step.

.. code:: screen

    # gpart resize -i 2 -a 4k -s 47G ada0
    ada0p2 resized
    # gpart show ada0
    =>       34  102399933  ada0  GPT  (48G)
             34        128     1  freebsd-boot  (64k)
            162   98566144     2  freebsd-ufs  (47G)
       98566306    3833661        - free -  (1.8G)

Recreate the swap partition:

.. code:: screen

    # gpart add -t freebsd-swap -a 4k ada0
    ada0p3 added
    # gpart show ada0
    =>       34  102399933  ada0  GPT  (48G)
             34        128     1  freebsd-boot  (64k)
            162   98566144     2  freebsd-ufs  (47G)
       98566306    3833661     3  freebsd-swap  (1.8G)
    # swapon /dev/ada0p3

Grow the UFS file system to use the new capacity of the resized
partition:

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Growing a live UFS file system is only possible in FreeBSD 10.0-RELEASE
and later. For earlier versions, the file system must not be mounted.

.. raw:: html

   </div>

.. code:: screen

    # growfs /dev/ada0p2
    Device is mounted read-write; resizing will result in temporary write suspension for /.
    It's strongly recommended to make a backup before growing the file system.
    OK to grow file system on /dev/ada0p2, mounted on /, from 38GB to 47GB? [Yes/No] Yes
    super-block backups (for fsck -b #) at:
     80781312, 82063552, 83345792, 84628032, 85910272, 87192512, 88474752,
     89756992, 91039232, 92321472, 93603712, 94885952, 96168192, 97450432

Both the partition and the file system on it have now been resized to
use the newly-available disk space.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+--------------------------------+
| `Prev <disks-adding.html>`__?   | `Up <disks.html>`__     | ?\ `Next <usb-disks.html>`__   |
+---------------------------------+-------------------------+--------------------------------+
| 18.2.?Adding Disks?             | `Home <index.html>`__   | ?18.4.?USB Storage Devices     |
+---------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
