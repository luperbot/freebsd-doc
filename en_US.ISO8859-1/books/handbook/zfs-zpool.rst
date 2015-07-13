==========================
20.3.?zpool Administration
==========================

.. raw:: html

   <div class="navheader">

20.3.?\ ``zpool`` Administration
`Prev <zfs-quickstart.html>`__?
Chapter?20.?The Z File System (ZFS)
?\ `Next <zfs-zfs.html>`__

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

20.3.?\ ``zpool`` Administration
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ZFS administration is divided between two main utilities. The ``zpool``
utility controls the operation of the pool and deals with adding,
removing, replacing, and managing disks. The ```zfs`` <zfs-zfs.html>`__
utility deals with creating, destroying, and managing datasets, both
`file systems <zfs-term.html#zfs-term-filesystem>`__ and
`volumes <zfs-term.html#zfs-term-volume>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.3.1.?Creating and Destroying Storage Pools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Creating a ZFS storage pool (*zpool*) involves making a number of
decisions that are relatively permanent because the structure of the
pool cannot be changed after the pool has been created. The most
important decision is what types of vdevs into which to group the
physical disks. See the list of `vdev
types <zfs-term.html#zfs-term-vdev>`__ for details about the possible
options. After the pool has been created, most vdev types do not allow
additional disks to be added to the vdev. The exceptions are mirrors,
which allow additional disks to be added to the vdev, and stripes, which
can be upgraded to mirrors by attaching an additional disk to the vdev.
Although additional vdevs can be added to expand a pool, the layout of
the pool cannot be changed after pool creation. Instead, the data must
be backed up and the pool destroyed and recreated.

Create a simple mirror pool:

.. code:: screen

    # zpool create mypool mirror /dev/ada1 /dev/ada2
    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada1    ONLINE       0     0     0
                ada2    ONLINE       0     0     0

    errors: No known data errors

Multiple vdevs can be created at once. Specify multiple groups of disks
separated by the vdev type keyword, ``mirror`` in this example:

.. code:: screen

    # zpool create mypool mirror /dev/ada1 /dev/ada2 mirror /dev/ada3 /dev/ada4
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada1    ONLINE       0     0     0
                ada2    ONLINE       0     0     0
              mirror-1  ONLINE       0     0     0
                ada3    ONLINE       0     0     0
                ada4    ONLINE       0     0     0

    errors: No known data errors

Pools can also be constructed using partitions rather than whole disks.
Putting ZFS in a separate partition allows the same disk to have other
partitions for other purposes. In particular, partitions with bootcode
and file systems needed for booting can be added. This allows booting
from disks that are also members of a pool. There is no performance
penalty on FreeBSD when using a partition rather than a whole disk.
Using partitions also allows the administrator to *under-provision* the
disks, using less than the full capacity. If a future replacement disk
of the same nominal size as the original actually has a slightly smaller
capacity, the smaller partition will still fit, and the replacement disk
can still be used.

Create a `RAID-Z2 <zfs-term.html#zfs-term-vdev-raidz>`__ pool using
partitions:

.. code:: screen

    # zpool create mypool raidz2 /dev/ada0p3 /dev/ada1p3 /dev/ada2p3 /dev/ada3p3 /dev/ada4p3 /dev/ada5p3
    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              raidz2-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0
                ada4p3  ONLINE       0     0     0
                ada5p3  ONLINE       0     0     0

    errors: No known data errors

A pool that is no longer needed can be destroyed so that the disks can
be reused. Destroying a pool involves first unmounting all of the
datasets in that pool. If the datasets are in use, the unmount operation
will fail and the pool will not be destroyed. The destruction of the
pool can be forced with ``-f``, but this can cause undefined behavior in
applications which had open files on those datasets.

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

20.3.2.?Adding and Removing Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two cases for adding disks to a zpool: attaching a disk to an
existing vdev with ``zpool attach``, or adding vdevs to the pool with
``zpool add``. Only some `vdev types <zfs-term.html#zfs-term-vdev>`__
allow disks to be added to the vdev after creation.

A pool created with a single disk lacks redundancy. Corruption can be
detected but not repaired, because there is no other copy of the data.
The `copies <zfs-term.html#zfs-term-copies>`__ property may be able to
recover from a small failure such as a bad sector, but does not provide
the same level of protection as mirroring or RAID-Z. Starting with a
pool consisting of a single disk vdev, ``zpool attach`` can be used to
add an additional disk to the vdev, creating a mirror. ``zpool attach``
can also be used to add additional disks to a mirror group, increasing
redundancy and read performance. If the disks being used for the pool
are partitioned, replicate the layout of the first disk on to the
second, ``gpart backup`` and ``gpart restore`` can be used to make this
process easier.

Upgrade the single disk (stripe) vdev *``ada0p3``* to a mirror by
attaching *``ada1p3``*:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              ada0p3    ONLINE       0     0     0

    errors: No known data errors
    # zpool attach mypool ada0p3 ada1p3
    Make sure to wait until resilver is done before rebooting.

    If you boot from pool 'mypool', you may need to update
    boot code on newly attached disk 'ada1p3'.

    Assuming you use GPT partitioning and 'da0' is your new boot disk
    you may use the following command:

            gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 da0
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada1
    bootcode written to ada1
    # zpool status
      pool: mypool
     state: ONLINE
    status: One or more devices is currently being resilvered.  The pool will
            continue to function, possibly in a degraded state.
    action: Wait for the resilver to complete.
      scan: resilver in progress since Fri May 30 08:19:19 2014
            527M scanned out of 781M at 47.9M/s, 0h0m to go
            527M resilvered, 67.53% done
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0  (resilvering)

    errors: No known data errors
    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Fri May 30 08:15:58 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors

When adding disks to the existing vdev is not an option, as for RAID-Z,
an alternative method is to add another vdev to the pool. Additional
vdevs provide higher performance, distributing writes across the vdevs.
Each vdev is responsible for providing its own redundancy. It is
possible, but discouraged, to mix vdev types, like ``mirror`` and
``RAID-Z``. Adding a non-redundant vdev to a pool containing mirror or
RAID-Z vdevs risks the data on the entire pool. Writes are distributed,
so the failure of the non-redundant disk will result in the loss of a
fraction of every block that has been written to the pool.

Data is striped across each of the vdevs. For example, with two mirror
vdevs, this is effectively a RAID 10 that stripes writes across two sets
of mirrors. Space is allocated so that each vdev reaches 100% full at
the same time. There is a performance penalty if the vdevs have
different amounts of free space, as a disproportionate amount of the
data is written to the less full vdev.

When attaching additional devices to a boot pool, remember to update the
bootcode.

Attach a second mirror group (``ada2p3`` and ``ada3p3``) to the existing
mirror:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Fri May 30 08:19:35 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors
    # zpool add mypool mirror ada2p3 ada3p3
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada2
    bootcode written to ada2
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada3
    bootcode written to ada3
    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 0h0m with 0 errors on Fri May 30 08:29:51 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
              mirror-1  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0

    errors: No known data errors

Currently, vdevs cannot be removed from a pool, and disks can only be
removed from a mirror if there is enough remaining redundancy. If only
one disk in a mirror group remains, it ceases to be a mirror and reverts
to being a stripe, risking the entire pool if that remaining disk fails.

Remove a disk from a three-way mirror group:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 0h0m with 0 errors on Fri May 30 08:29:51 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0

    errors: No known data errors
    # zpool detach mypool ada2p3
    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 0h0m with 0 errors on Fri May 30 08:29:51 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors

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

20.3.3.?Checking the Status of a Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Pool status is important. If a drive goes offline or a read, write, or
checksum error is detected, the corresponding error count increases. The
``status`` output shows the configuration and status of each device in
the pool and the status of the entire pool. Actions that need to be
taken and details about the last
```scrub`` <zfs-zpool.html#zfs-zpool-scrub>`__ are also shown.

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 2h25m with 0 errors on Sat Sep 14 04:25:50 2013
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              raidz2-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0
                ada4p3  ONLINE       0     0     0
                ada5p3  ONLINE       0     0     0

    errors: No known data errors

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

20.3.4.?Clearing Errors
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When an error is detected, the read, write, or checksum counts are
incremented. The error message can be cleared and the counts reset with
``zpool clear       mypool``. Clearing the error state can be important
for automated scripts that alert the administrator when the pool
encounters an error. Further errors may not be reported if the old
errors are not cleared.

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

20.3.5.?Replacing a Functioning Device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a number of situations where it may be desirable to replace
one disk with a different disk. When replacing a working disk, the
process keeps the old disk online during the replacement. The pool never
enters a `degraded <zfs-term.html#zfs-term-degraded>`__ state, reducing
the risk of data loss. ``zpool replace`` copies all of the data from the
old disk to the new one. After the operation completes, the old disk is
disconnected from the vdev. If the new disk is larger than the old disk,
it may be possible to grow the zpool, using the new space. See `Growing
a Pool <zfs-zpool.html#zfs-zpool-online>`__.

Replace a functioning device in the pool:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors
    # zpool replace mypool ada1p3 ada2p3
    Make sure to wait until resilver is done before rebooting.

    If you boot from pool 'zroot', you may need to update
    boot code on newly attached disk 'ada2p3'.

    Assuming you use GPT partitioning and 'da0' is your new boot disk
    you may use the following command:

            gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 da0
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada2
    # zpool status
      pool: mypool
     state: ONLINE
    status: One or more devices is currently being resilvered.  The pool will
            continue to function, possibly in a degraded state.
    action: Wait for the resilver to complete.
      scan: resilver in progress since Mon Jun  2 14:21:35 2014
            604M scanned out of 781M at 46.5M/s, 0h0m to go
            604M resilvered, 77.39% done
    config:

            NAME             STATE     READ WRITE CKSUM
            mypool           ONLINE       0     0     0
              mirror-0       ONLINE       0     0     0
                ada0p3       ONLINE       0     0     0
                replacing-1  ONLINE       0     0     0
                  ada1p3     ONLINE       0     0     0
                  ada2p3     ONLINE       0     0     0  (resilvering)

    errors: No known data errors
    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Mon Jun  2 14:21:52 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0

    errors: No known data errors

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

20.3.6.?Dealing with Failed Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a disk in a pool fails, the vdev to which the disk belongs enters
the `degraded <zfs-term.html#zfs-term-degraded>`__ state. All of the
data is still available, but performance may be reduced because missing
data must be calculated from the available redundancy. To restore the
vdev to a fully functional state, the failed physical device must be
replaced. ZFS is then instructed to begin the
`resilver <zfs-term.html#zfs-term-resilver>`__ operation. Data that was
on the failed device is recalculated from available redundancy and
written to the replacement device. After completion, the vdev returns to
`online <zfs-term.html#zfs-term-online>`__ status.

If the vdev does not have any redundancy, or if multiple devices have
failed and there is not enough redundancy to compensate, the pool enters
the `faulted <zfs-term.html#zfs-term-faulted>`__ state. If a sufficient
number of devices cannot be reconnected to the pool, the pool becomes
inoperative and data must be restored from backups.

When replacing a failed disk, the name of the failed disk is replaced
with the GUID of the device. A new device name parameter for
``zpool replace`` is not required if the replacement device has the same
device name.

Replace a failed disk using ``zpool replace``:

.. code:: screen

    # zpool status
      pool: mypool
     state: DEGRADED
    status: One or more devices could not be opened.  Sufficient replicas exist for
            the pool to continue functioning in a degraded state.
    action: Attach the missing device and online it using 'zpool online'.
       see: http://illumos.org/msg/ZFS-8000-2Q
      scan: none requested
    config:

            NAME                    STATE     READ WRITE CKSUM
            mypool                  DEGRADED     0     0     0
              mirror-0              DEGRADED     0     0     0
                ada0p3              ONLINE       0     0     0
                316502962686821739  UNAVAIL      0     0     0  was /dev/ada1p3

    errors: No known data errors
    # zpool replace mypool 316502962686821739 ada2p3
    # zpool status
      pool: mypool
     state: DEGRADED
    status: One or more devices is currently being resilvered.  The pool will
            continue to function, possibly in a degraded state.
    action: Wait for the resilver to complete.
      scan: resilver in progress since Mon Jun  2 14:52:21 2014
            641M scanned out of 781M at 49.3M/s, 0h0m to go
            640M resilvered, 82.04% done
    config:

            NAME                        STATE     READ WRITE CKSUM
            mypool                      DEGRADED     0     0     0
              mirror-0                  DEGRADED     0     0     0
                ada0p3                  ONLINE       0     0     0
                replacing-1             UNAVAIL      0     0     0
                  15732067398082357289  UNAVAIL      0     0     0  was /dev/ada1p3/old
                  ada2p3                ONLINE       0     0     0  (resilvering)

    errors: No known data errors
    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Mon Jun  2 14:52:38 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0

    errors: No known data errors

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

20.3.7.?Scrubbing a Pool
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is recommended that pools be
`scrubbed <zfs-term.html#zfs-term-scrub>`__ regularly, ideally at least
once every month. The ``scrub`` operation is very disk-intensive and
will reduce performance while running. Avoid high-demand periods when
scheduling ``scrub`` or use
```vfs.zfs.scrub_delay`` <zfs-advanced.html#zfs-advanced-tuning-scrub_delay>`__
to adjust the relative priority of the ``scrub`` to prevent it
interfering with other workloads.

.. code:: screen

    # zpool scrub mypool
    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub in progress since Wed Feb 19 20:52:54 2014
            116G scanned out of 8.60T at 649M/s, 3h48m to go
            0 repaired, 1.32% done
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              raidz2-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0
                ada4p3  ONLINE       0     0     0
                ada5p3  ONLINE       0     0     0

    errors: No known data errors

In the event that a scrub operation needs to be cancelled, issue
``zpool scrub -s       mypool``.

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

20.3.8.?Self-Healing
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The checksums stored with data blocks enable the file system to
*self-heal*. This feature will automatically repair data whose checksum
does not match the one recorded on another device that is part of the
storage pool. For example, a mirror with two disks where one drive is
starting to malfunction and cannot properly store the data any more.
This is even worse when the data has not been accessed for a long time,
as with long term archive storage. Traditional file systems need to run
algorithms that check and repair the data like
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__.
These commands take time, and in severe cases, an administrator has to
manually decide which repair operation must be performed. When ZFS
detects a data block with a checksum that does not match, it tries to
read the data from the mirror disk. If that disk can provide the correct
data, it will not only give that data to the application requesting it,
but also correct the wrong data on the disk that had the bad checksum.
This happens without any interaction from a system administrator during
normal pool operation.

The next example demonstrates this self-healing behavior. A mirrored
pool of disks ``/dev/ada0`` and ``/dev/ada1`` is created.

.. code:: screen

    # zpool create healer mirror /dev/ada0 /dev/ada1
    # zpool status healer
      pool: healer
     state: ONLINE
      scan: none requested
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0     0

    errors: No known data errors
    # zpool list
    NAME     SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    healer   960M  92.5K   960M     0%  1.00x  ONLINE  -

Some important data that to be protected from data errors using the
self-healing feature is copied to the pool. A checksum of the pool is
created for later comparison.

.. code:: screen

    # cp /some/important/data /healer
    # zfs list
    NAME     SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    healer   960M  67.7M   892M     7%  1.00x  ONLINE  -
    # sha1 /healer > checksum.txt
    # cat checksum.txt
    SHA1 (/healer) = 2753eff56d77d9a536ece6694bf0a82740344d1f

Data corruption is simulated by writing random data to the beginning of
one of the disks in the mirror. To prevent ZFS from healing the data as
soon as it is detected, the pool is exported before the corruption and
imported again afterwards.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

This is a dangerous operation that can destroy vital data. It is shown
here for demonstrational purposes only and should not be attempted
during normal operation of a storage pool. Nor should this intentional
corruption example be run on any disk with a different file system on
it. Do not use any other disk device names other than the ones that are
part of the pool. Make certain that proper backups of the pool are
created before running the command!

.. raw:: html

   </div>

.. code:: screen

    # zpool export healer
    # dd if=/dev/random of=/dev/ada1 bs=1m count=200
    200+0 records in
    200+0 records out
    209715200 bytes transferred in 62.992162 secs (3329227 bytes/sec)
    # zpool import healer

The pool status shows that one device has experienced an error. Note
that applications reading data from the pool did not receive any
incorrect data. ZFS provided data from the ``ada0`` device with the
correct checksums. The device with the wrong checksum can be found
easily as the ``CKSUM`` column contains a nonzero value.

.. code:: screen

    # zpool status healer
        pool: healer
       state: ONLINE
      status: One or more devices has experienced an unrecoverable error.  An
              attempt was made to correct the error.  Applications are unaffected.
      action: Determine if the device needs to be replaced, and clear the errors
              using 'zpool clear' or replace the device with 'zpool replace'.
         see: http://www.sun.com/msg/ZFS-8000-9P
        scan: none requested
      config:

          NAME        STATE     READ WRITE CKSUM
          healer      ONLINE       0     0     0
            mirror-0  ONLINE       0     0     0
             ada0     ONLINE       0     0     0
             ada1     ONLINE       0     0     1

    errors: No known data errors

The error was detected and handled by using the redundancy present in
the unaffected ``ada0`` mirror disk. A checksum comparison with the
original one will reveal whether the pool is consistent again.

.. code:: screen

    # sha1 /healer >> checksum.txt
    # cat checksum.txt
    SHA1 (/healer) = 2753eff56d77d9a536ece6694bf0a82740344d1f
    SHA1 (/healer) = 2753eff56d77d9a536ece6694bf0a82740344d1f

The two checksums that were generated before and after the intentional
tampering with the pool data still match. This shows how ZFS is capable
of detecting and correcting any errors automatically when the checksums
differ. Note that this is only possible when there is enough redundancy
present in the pool. A pool consisting of a single device has no
self-healing capabilities. That is also the reason why checksums are so
important in ZFS and should not be disabled for any reason. No
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__ or
similar file system consistency check program is required to detect and
correct this and the pool was still available during the time there was
a problem. A scrub operation is now required to overwrite the corrupted
data on ``ada1``.

.. code:: screen

    # zpool scrub healer
    # zpool status healer
      pool: healer
     state: ONLINE
    status: One or more devices has experienced an unrecoverable error.  An
                attempt was made to correct the error.  Applications are unaffected.
    action: Determine if the device needs to be replaced, and clear the errors
                using 'zpool clear' or replace the device with 'zpool replace'.
       see: http://www.sun.com/msg/ZFS-8000-9P
      scan: scrub in progress since Mon Dec 10 12:23:30 2012
            10.4M scanned out of 67.0M at 267K/s, 0h3m to go
            9.63M repaired, 15.56% done
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0   627  (repairing)

    errors: No known data errors

The scrub operation reads data from ``ada0`` and rewrites any data with
an incorrect checksum on ``ada1``. This is indicated by the
``(repairing)`` output from ``zpool status``. After the operation is
complete, the pool status changes to:

.. code:: screen

    # zpool status healer
      pool: healer
     state: ONLINE
    status: One or more devices has experienced an unrecoverable error.  An
            attempt was made to correct the error.  Applications are unaffected.
    action: Determine if the device needs to be replaced, and clear the errors
                 using 'zpool clear' or replace the device with 'zpool replace'.
       see: http://www.sun.com/msg/ZFS-8000-9P
      scan: scrub repaired 66.5M in 0h2m with 0 errors on Mon Dec 10 12:26:25 2012
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0 2.72K

    errors: No known data errors

After the scrub operation completes and all the data has been
synchronized from ``ada0`` to ``ada1``, the error messages can be
`cleared <zfs-zpool.html#zfs-zpool-clear>`__ from the pool status by
running ``zpool clear``.

.. code:: screen

    # zpool clear healer
    # zpool status healer
      pool: healer
     state: ONLINE
      scan: scrub repaired 66.5M in 0h2m with 0 errors on Mon Dec 10 12:26:25 2012
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0     0

    errors: No known data errors

The pool is now back to a fully working state and all the errors have
been cleared.

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

20.3.9.?Growing a Pool
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The usable size of a redundant pool is limited by the capacity of the
smallest device in each vdev. The smallest device can be replaced with a
larger device. After completing a
`replace <zfs-zpool.html#zfs-zpool-replace>`__ or
`resilver <zfs-term.html#zfs-term-resilver>`__ operation, the pool can
grow to use the capacity of the new device. For example, consider a
mirror of a 1?TB drive and a 2?TB drive. The usable space is 1?TB. When
the 1?TB drive is replaced with another 2?TB drive, the resilvering
process copies the existing data onto the new drive. Because both of the
devices now have 2?TB capacity, the mirror's available space can be
grown to 2?TB.

Expansion is triggered by using ``zpool online -e`` on each device.
After expansion of all devices, the additional space becomes available
to the pool.

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

20.3.10.?Importing and Exporting Pools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Pools are *exported* before moving them to another system. All datasets
are unmounted, and each device is marked as exported but still locked so
it cannot be used by other disk subsystems. This allows pools to be
*imported* on other machines, other operating systems that support ZFS,
and even different hardware architectures (with some caveats, see
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__).
When a dataset has open files, `` zpool export -f`` can be used to force
the export of a pool. Use this with caution. The datasets are forcibly
unmounted, potentially resulting in unexpected behavior by the
applications which had open files on those datasets.

Export a pool that is not in use:

.. code:: screen

    # zpool export mypool

Importing a pool automatically mounts the datasets. This may not be the
desired behavior, and can be prevented with ``zpool import -N``.
``zpool import -o`` sets temporary properties for this import only.
``zpool import altroot=`` allows importing a pool with a base mount
point instead of the root of the file system. If the pool was last used
on a different system and was not properly exported, an import might
have to be forced with ``zpool import -f``. ``zpool import -a`` imports
all pools that do not appear to be in use by another system.

List all available pools for import:

.. code:: screen

    # zpool import
       pool: mypool
         id: 9930174748043525076
      state: ONLINE
     action: The pool can be imported using its name or numeric identifier.
     config:

            mypool      ONLINE
              ada2p3    ONLINE

Import the pool with an alternative root directory:

.. code:: screen

    # zpool import -o altroot=/mnt mypool
    # zfs list
    zfs list
    NAME                 USED  AVAIL  REFER  MOUNTPOINT
    mypool               110K  47.0G    31K  /mnt/mypool

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

20.3.11.?Upgrading a Storage Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After upgrading FreeBSD, or if a pool has been imported from a system
using an older version of ZFS, the pool can be manually upgraded to the
latest version of ZFS to support newer features. Consider whether the
pool may ever need to be imported on an older system before upgrading.
Upgrading is a one-way process. Older pools can be upgraded, but pools
with newer features cannot be downgraded.

Upgrade a v28 pool to support ``Feature Flags``:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
    status: The pool is formatted using a legacy on-disk format.  The pool can
            still be used, but some features are unavailable.
    action: Upgrade the pool using 'zpool upgrade'.  Once this is done, the
            pool will no longer be accessible on software that does not support feat
            flags.
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
            ada0    ONLINE       0     0     0
            ada1    ONLINE       0     0     0

    errors: No known data errors
    # zpool upgrade
    This system supports ZFS pool feature flags.

    The following pools are formatted with legacy version numbers and can
    be upgraded to use feature flags.  After being upgraded, these pools
    will no longer be accessible by software that does not support feature
    flags.

    VER  POOL
    ---  ------------
    28   mypool

    Use 'zpool upgrade -v' for a list of available legacy versions.
    Every feature flags pool has all supported features enabled.
    # zpool upgrade mypool
    This system supports ZFS pool feature flags.

    Successfully upgraded 'mypool' from version 28 to feature flags.
    Enabled the following features on 'mypool':
      async_destroy
      empty_bpobj
      lz4_compress
      multi_vdev_crash_dump

The newer features of ZFS will not be available until ``zpool upgrade``
has completed. ``zpool upgrade -v`` can be used to see what new features
will be provided by upgrading, as well as which features are already
supported.

Upgrade a pool to support additional feature flags:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
    status: Some supported features are not enabled on the pool. The pool can
            still be used, but some features are unavailable.
    action: Enable all features using 'zpool upgrade'. Once this is done,
            the pool may no longer be accessible by software that does not support
            the features. See zpool-features(7) for details.
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
            ada0    ONLINE       0     0     0
            ada1    ONLINE       0     0     0

    errors: No known data errors
    # zpool upgrade
    This system supports ZFS pool feature flags.

    All pools are formatted using feature flags.


    Some supported features are not enabled on the following pools. Once a
    feature is enabled the pool may become incompatible with software
    that does not support the feature. See zpool-features(7) for details.

    POOL  FEATURE
    ---------------
    zstore
          multi_vdev_crash_dump
          spacemap_histogram
          enabled_txg
          hole_birth
          extensible_dataset
          bookmarks
          filesystem_limits
    # zpool upgrade mypool
    This system supports ZFS pool feature flags.

    Enabled the following features on 'mypool':
      spacemap_histogram
      enabled_txg
      hole_birth
      extensible_dataset
      bookmarks
      filesystem_limits

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

The boot code on systems that boot from a pool must be updated to
support the new pool version. Use ``gpart bootcode`` on the partition
that contains the boot code. See
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__
for more information.

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

20.3.12.?Displaying Recorded Pool History
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Commands that modify the pool are recorded. Recorded actions include the
creation of datasets, changing properties, or replacement of a disk.
This history is useful for reviewing how a pool was created and which
user performed a specific action and when. History is not kept in a log
file, but is part of the pool itself. The command to review this history
is aptly named ``zpool history``:

.. code:: screen

    # zpool history
    History for 'tank':
    2013-02-26.23:02:35 zpool create tank mirror /dev/ada0 /dev/ada1
    2013-02-27.18:50:58 zfs set atime=off tank
    2013-02-27.18:51:09 zfs set checksum=fletcher4 tank
    2013-02-27.18:51:18 zfs create tank/backup

The output shows ``zpool`` and ``zfs`` commands that were executed on
the pool along with a timestamp. Only commands that alter the pool in
some way are recorded. Commands like ``zfs list`` are not included. When
no pool name is specified, the history of all pools is displayed.

``zpool history`` can show even more information when the options ``-i``
or ``-l`` are provided. ``-i`` displays user-initiated events as well as
internally logged ZFS events.

.. code:: screen

    # zpool history -i
    History for 'tank':
    2013-02-26.23:02:35 [internal pool create txg:5] pool spa 28; zfs spa 28; zpl 5;uts  9.1-RELEASE 901000 amd64
    2013-02-27.18:50:53 [internal property set txg:50] atime=0 dataset = 21
    2013-02-27.18:50:58 zfs set atime=off tank
    2013-02-27.18:51:04 [internal property set txg:53] checksum=7 dataset = 21
    2013-02-27.18:51:09 zfs set checksum=fletcher4 tank
    2013-02-27.18:51:13 [internal create txg:55] dataset = 39
    2013-02-27.18:51:18 zfs create tank/backup

More details can be shown by adding ``-l``. History records are shown in
a long format, including information like the name of the user who
issued the command and the hostname on which the change was made.

.. code:: screen

    # zpool history -l
    History for 'tank':
    2013-02-26.23:02:35 zpool create tank mirror /dev/ada0 /dev/ada1 [user 0 (root) on :global]
    2013-02-27.18:50:58 zfs set atime=off tank [user 0 (root) on myzfsbox:global]
    2013-02-27.18:51:09 zfs set checksum=fletcher4 tank [user 0 (root) on myzfsbox:global]
    2013-02-27.18:51:18 zfs create tank/backup [user 0 (root) on myzfsbox:global]

The output shows that the ``root`` user created the mirrored pool with
disks ``/dev/ada0`` and ``/dev/ada1``. The hostname ``myzfsbox`` is also
shown in the commands after the pool's creation. The hostname display
becomes important when the pool is exported from one system and imported
on another. The commands that are issued on the other system can clearly
be distinguished by the hostname that is recorded for each command.

Both options to ``zpool history`` can be combined to give the most
detailed information possible for any given pool. Pool history provides
valuable information when tracking down the actions that were performed
or when more detailed output is needed for debugging.

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

20.3.13.?Performance Monitoring
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A built-in monitoring system can display pool I/O statistics in real
time. It shows the amount of free and used space on the pool, how many
read and write operations are being performed per second, and how much
I/O bandwidth is currently being utilized. By default, all pools in the
system are monitored and displayed. A pool name can be provided to limit
monitoring to just that pool. A basic example:

.. code:: screen

    # zpool iostat
                   capacity     operations    bandwidth
    pool        alloc   free   read  write   read  write
    ----------  -----  -----  -----  -----  -----  -----
    data         288G  1.53T      2     11  11.3K  57.1K

To continuously monitor I/O activity, a number can be specified as the
last parameter, indicating a interval in seconds to wait between
updates. The next statistic line is printed after each interval. Press
**Ctrl**+**C** to stop this continuous monitoring. Alternatively, give a
second number on the command line after the interval to specify the
total number of statistics to display.

Even more detailed I/O statistics can be displayed with ``-v``. Each
device in the pool is shown with a statistics line. This is useful in
seeing how many read and write operations are being performed on each
device, and can help determine if any individual device is slowing down
the pool. This example shows a mirrored pool with two devices:

.. code:: screen

    # zpool iostat -v 
                                capacity     operations    bandwidth
    pool                     alloc   free   read  write   read  write
    -----------------------  -----  -----  -----  -----  -----  -----
    data                      288G  1.53T      2     12  9.23K  61.5K
      mirror                  288G  1.53T      2     12  9.23K  61.5K
        ada1                     -      -      0      4  5.61K  61.7K
        ada2                     -      -      1      4  5.04K  61.7K
    -----------------------  -----  -----  -----  -----  -----  -----

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

20.3.14.?Splitting a Storage Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A pool consisting of one or more mirror vdevs can be split into two
pools. Unless otherwise specified, the last member of each mirror is
detached and used to create a new pool containing the same data. The
operation should first be attempted with ``-n``. The details of the
proposed operation are displayed without it actually being performed.
This helps confirm that the operation will do what the user intends.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+-----------------------------------+
| `Prev <zfs-quickstart.html>`__?   | `Up <zfs.html>`__       | ?\ `Next <zfs-zfs.html>`__        |
+-----------------------------------+-------------------------+-----------------------------------+
| 20.2.?Quick Start Guide?          | `Home <index.html>`__   | ?20.4.?\ ``zfs`` Administration   |
+-----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
