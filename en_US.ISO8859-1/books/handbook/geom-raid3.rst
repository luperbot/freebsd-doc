=======================================================
19.4.?RAID3 - Byte-level Striping with Dedicated Parity
=======================================================

.. raw:: html

   <div class="navheader">

19.4.?RAID3 - Byte-level Striping with Dedicated Parity
`Prev <geom-mirror.html>`__?
Chapter?19.?GEOM: Modular Disk Transformation Framework
?\ `Next <geom-graid.html>`__

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

19.4.?RAID3 - Byte-level Striping with Dedicated Parity
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Mark Gladman and Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on documentation by Tom Rhodes and Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

RAID3 is a method used to combine several disk drives into a single
volume with a dedicated parity disk. In a RAID3 system, data is split up
into a number of bytes that are written across all the drives in the
array except for one disk which acts as a dedicated parity disk. This
means that disk reads from a RAID3 implementation access all disks in
the array. Performance can be enhanced by using multiple disk
controllers. The RAID3 array provides a fault tolerance of 1 drive,
while providing a capacity of 1 - 1/n times the total capacity of all
drives in the array, where n is the number of hard drives in the array.
Such a configuration is mostly suitable for storing data of larger sizes
such as multimedia files.

At least 3 physical hard drives are required to build a RAID3 array.
Each disk must be of the same size, since I/O requests are interleaved
to read or write to multiple disks in parallel. Also, due to the nature
of RAID3, the number of drives must be equal to 3, 5, 9, 17, and so on,
or 2^n + 1.

This section demonstrates how to create a software RAID3 on a FreeBSD
system.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

While it is theoretically possible to boot from a RAID3 array on
FreeBSD, that configuration is uncommon and is not advised.

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

19.4.1.?Creating a Dedicated RAID3 Array
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, support for RAID3 is implemented by the
`graid3(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid3&sektion=8>`__
GEOM class. Creating a dedicated RAID3 array on FreeBSD requires the
following steps.

.. raw:: html

   <div class="procedure">

#. First, load the ``geom_raid3.ko`` kernel module by issuing one of the
   following commands:

   .. code:: screen

       # graid3 load

   or:

   .. code:: screen

       # kldload geom_raid3

#. Ensure that a suitable mount point exists. This command creates a new
   directory to use as the mount point:

   .. code:: screen

       # mkdir /multimedia

#. Determine the device names for the disks which will be added to the
   array, and create the new RAID3 device. The final device listed will
   act as the dedicated parity disk. This example uses three
   unpartitioned ATA drives: ``ada1`` and ``ada2`` for data, and
   ``ada3`` for parity.

   .. code:: screen

       # graid3 label -v gr0 /dev/ada1 /dev/ada2 /dev/ada3
       Metadata value stored on /dev/ada1.
       Metadata value stored on /dev/ada2.
       Metadata value stored on /dev/ada3.
       Done.

#. Partition the newly created ``gr0`` device and put a UFS file system
   on it:

   .. code:: screen

       # gpart create -s GPT /dev/raid3/gr0
       # gpart add -t freebsd-ufs /dev/raid3/gr0
       # newfs -j /dev/raid3/gr0p1

   Many numbers will glide across the screen, and after a bit of time,
   the process will be complete. The volume has been created and is
   ready to be mounted:

   .. code:: screen

       # mount /dev/raid3/gr0p1 /multimedia/

   The RAID3 array is now ready to use.

.. raw:: html

   </div>

Additional configuration is needed to retain this setup across system
reboots.

.. raw:: html

   <div class="procedure">

#. The ``geom_raid3.ko`` module must be loaded before the array can be
   mounted. To automatically load the kernel module during system
   initialization, add the following line to ``/boot/loader.conf``:

   .. code:: programlisting

       geom_raid3_load="YES"

#. The following volume information must be added to ``/etc/fstab`` in
   order to automatically mount the array's file system during the
   system boot process:

   .. code:: programlisting

       /dev/raid3/gr0p1    /multimedia ufs rw  2   2

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+---------------------------------+
| `Prev <geom-mirror.html>`__?   | `Up <geom.html>`__      | ?\ `Next <geom-graid.html>`__   |
+--------------------------------+-------------------------+---------------------------------+
| 19.3.?RAID1 - Mirroring?       | `Home <index.html>`__   | ?19.5.?Software RAID Devices    |
+--------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
