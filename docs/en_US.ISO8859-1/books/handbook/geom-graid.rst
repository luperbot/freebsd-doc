===========================
19.5.?Software RAID Devices
===========================

.. raw:: html

   <div class="navheader">

19.5.?Software RAID Devices
`Prev <geom-raid3.html>`__?
Chapter?19.?GEOM: Modular Disk Transformation Framework
?\ `Next <geom-ggate.html>`__

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

19.5.?Software RAID Devices
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally contributed by Warren Block.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some motherboards and expansion cards add some simple hardware, usually
just a ROM, that allows the computer to boot from a RAID array. After
booting, access to the RAID array is handled by software running on the
computer's main processor. This “hardware-assisted software RAID” gives
RAID arrays that are not dependent on any particular operating system,
and which are functional even before an operating system is loaded.

Several levels of RAID are supported, depending on the hardware in use.
See
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
for a complete list.

`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
requires the ``geom_raid.ko`` kernel module, which is included in the
``GENERIC`` kernel starting with FreeBSD?9.1. If needed, it can be
loaded manually with ``graid load``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.5.1.?Creating an Array
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Software RAID devices often have a menu that can be entered by pressing
special keys when the computer is booting. The menu can be used to
create and delete RAID arrays.
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
can also create arrays directly from the command line.

``graid label`` is used to create a new array. The motherboard used for
this example has an Intel software RAID chipset, so the Intel metadata
format is specified. The new array is given a label of ``gm0``, it is a
mirror (RAID1), and uses drives ``ada0`` and ``ada1``.

.. raw:: html

   <div class="caution" xmlns="">

Caution:
~~~~~~~~

Some space on the drives will be overwritten when they are made into a
new array. Back up existing data first!

.. raw:: html

   </div>

.. code:: screen

    # graid label Intel gm0 RAID1 ada0 ada1
    GEOM_RAID: Intel-a29ea104: Array Intel-a29ea104 created.
    GEOM_RAID: Intel-a29ea104: Disk ada0 state changed from NONE to ACTIVE.
    GEOM_RAID: Intel-a29ea104: Subdisk gm0:0-ada0 state changed from NONE to ACTIVE.
    GEOM_RAID: Intel-a29ea104: Disk ada1 state changed from NONE to ACTIVE.
    GEOM_RAID: Intel-a29ea104: Subdisk gm0:1-ada1 state changed from NONE to ACTIVE.
    GEOM_RAID: Intel-a29ea104: Array started.
    GEOM_RAID: Intel-a29ea104: Volume gm0 state changed from STARTING to OPTIMAL.
    Intel-a29ea104 created
    GEOM_RAID: Intel-a29ea104: Provider raid/r0 for volume gm0 created.

A status check shows the new mirror is ready for use:

.. code:: screen

    # graid status
       Name   Status  Components
    raid/r0  OPTIMAL  ada0 (ACTIVE (ACTIVE))
                      ada1 (ACTIVE (ACTIVE))

The array device appears in ``/dev/raid/``. The first array is called
``r0``. Additional arrays, if present, will be ``r1``, ``r2``, and so
on.

The BIOS menu on some of these devices can create arrays with special
characters in their names. To avoid problems with those special
characters, arrays are given simple numbered names like ``r0``. To show
the actual labels, like ``gm0`` in the example above, use
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__:

.. code:: screen

    # sysctl kern.geom.raid.name_format=1

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

19.5.2.?Multiple Volumes
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some software RAID devices support more than one *volume* on an array.
Volumes work like partitions, allowing space on the physical drives to
be split and used in different ways. For example, Intel software RAID
devices support two volumes. This example creates a 40?G mirror for
safely storing the operating system, followed by a 20?G RAID0 (stripe)
volume for fast temporary storage:

.. code:: screen

    # graid label -S 40G Intel gm0 RAID1 ada0 ada1
    # graid add -S 20G gm0 RAID0

Volumes appear as additional ``rX`` entries in ``/dev/raid/``. An array
with two volumes will show ``r0`` and ``r1``.

See
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
for the number of volumes supported by different software RAID devices.

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

19.5.3.?Converting a Single Drive to a Mirror
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Under certain specific conditions, it is possible to convert an existing
single drive to a
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
array without reformatting. To avoid data loss during the conversion,
the existing drive must meet these minimum requirements:

.. raw:: html

   <div class="itemizedlist">

-  The drive must be partitioned with the MBR partitioning scheme. GPT
   or other partitioning schemes with metadata at the end of the drive
   will be overwritten and corrupted by the
   `graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
   metadata.

-  There must be enough unpartitioned and unused space at the end of the
   drive to hold the
   `graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
   metadata. This metadata varies in size, but the largest occupies
   64?M, so at least that much free space is recommended.

.. raw:: html

   </div>

If the drive meets these requirements, start by making a full backup.
Then create a single-drive mirror with that drive:

.. code:: screen

    # graid label Intel gm0 RAID1 ada0 NONE

`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
metadata was written to the end of the drive in the unused space. A
second drive can now be inserted into the mirror:

.. code:: screen

    # graid insert raid/r0 ada1

Data from the original drive will immediately begin to be copied to the
second drive. The mirror will operate in degraded status until the copy
is complete.

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

19.5.4.?Inserting New Drives into the Array
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Drives can be inserted into an array as replacements for drives that
have failed or are missing. If there are no failed or missing drives,
the new drive becomes a spare. For example, inserting a new drive into a
working two-drive mirror results in a two-drive mirror with one spare
drive, not a three-drive mirror.

In the example mirror array, data immediately begins to be copied to the
newly-inserted drive. Any existing information on the new drive will be
overwritten.

.. code:: screen

    # graid insert raid/r0 ada1
    GEOM_RAID: Intel-a29ea104: Disk ada1 state changed from NONE to ACTIVE.
    GEOM_RAID: Intel-a29ea104: Subdisk gm0:1-ada1 state changed from NONE to NEW.
    GEOM_RAID: Intel-a29ea104: Subdisk gm0:1-ada1 state changed from NEW to REBUILD.
    GEOM_RAID: Intel-a29ea104: Subdisk gm0:1-ada1 rebuild start at 0.

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

19.5.5.?Removing Drives from the Array
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Individual drives can be permanently removed from a from an array and
their metadata erased:

.. code:: screen

    # graid remove raid/r0 ada1
    GEOM_RAID: Intel-a29ea104: Disk ada1 state changed from ACTIVE to OFFLINE.
    GEOM_RAID: Intel-a29ea104: Subdisk gm0:1-[unknown] state changed from ACTIVE to NONE.
    GEOM_RAID: Intel-a29ea104: Volume gm0 state changed from OPTIMAL to DEGRADED.

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

19.5.6.?Stopping the Array
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An array can be stopped without removing metadata from the drives. The
array will be restarted when the system is booted.

.. code:: screen

    # graid stop raid/r0

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

19.5.7.?Checking Array Status
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Array status can be checked at any time. After a drive was added to the
mirror in the example above, data is being copied from the original
drive to the new drive:

.. code:: screen

    # graid status
       Name    Status  Components
    raid/r0  DEGRADED  ada0 (ACTIVE (ACTIVE))
                       ada1 (ACTIVE (REBUILD 28%))

Some types of arrays, like ``RAID0`` or ``CONCAT``, may not be shown in
the status report if disks have failed. To see these partially-failed
arrays, add ``-ga``:

.. code:: screen

    # graid status -ga
              Name  Status  Components
    Intel-e2d07d9a  BROKEN  ada6 (ACTIVE (ACTIVE))

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

19.5.8.?Deleting Arrays
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Arrays are destroyed by deleting all of the volumes from them. When the
last volume present is deleted, the array is stopped and metadata is
removed from the drives:

.. code:: screen

    # graid delete raid/r0

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

19.5.9.?Deleting Unexpected Arrays
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Drives may unexpectedly contain
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
metadata, either from previous use or manufacturer testing.
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
will detect these drives and create an array, interfering with access to
the individual drive. To remove the unwanted metadata:

.. raw:: html

   <div class="procedure">

#. Boot the system. At the boot menu, select ``2`` for the loader
   prompt. Enter:

   .. code:: screen

       OK set kern.geom.raid.enable=0
       OK boot

   The system will boot with
   `graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
   disabled.

#. Back up all data on the affected drive.

#. As a workaround,
   `graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
   array detection can be disabled by adding

   .. code:: programlisting

       kern.geom.raid.enable=0

   to ``/boot/loader.conf``.

   To permanently remove the
   `graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8>`__
   metadata from the affected drive, boot a FreeBSD installation CD-ROM
   or memory stick, and select ``Shell``. Use ``status`` to find the
   name of the array, typically ``raid/r0``:

   .. code:: screen

       # graid status
          Name   Status  Components
       raid/r0  OPTIMAL  ada0 (ACTIVE (ACTIVE))
                         ada1 (ACTIVE (ACTIVE))

   Delete the volume by name:

   .. code:: screen

       # graid delete raid/r0

   If there is more than one volume shown, repeat the process for each
   volume. After the last array has been deleted, the volume will be
   destroyed.

   Reboot and verify data, restoring from backup if necessary. After the
   metadata has been removed, the ``kern.geom.raid.enable=0`` entry in
   ``/boot/loader.conf`` can also be removed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------+-------------------------+---------------------------------+
| `Prev <geom-raid3.html>`__?                                | `Up <geom.html>`__      | ?\ `Next <geom-ggate.html>`__   |
+------------------------------------------------------------+-------------------------+---------------------------------+
| 19.4.?RAID3 - Byte-level Striping with Dedicated Parity?   | `Home <index.html>`__   | ?19.6.?GEOM Gate Network        |
+------------------------------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
