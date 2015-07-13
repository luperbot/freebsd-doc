=====================
20.6.?Advanced Topics
=====================

.. raw:: html

   <div class="navheader">

20.6.?Advanced Topics
`Prev <zfs-zfs-allow.html>`__?
Chapter?20.?The Z File System (ZFS)
?\ `Next <zfs-links.html>`__

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

20.6.?Advanced Topics
---------------------

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

20.6.1.?Tuning
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a number of tunables that can be adjusted to make ZFS perform
best for different workloads.

.. raw:: html

   <div class="itemizedlist">

-  *``vfs.zfs.arc_max``* - Maximum size of the
   `ARC <zfs-term.html#zfs-term-arc>`__. The default is all RAM less
   1?GB, or one half of RAM, whichever is more. However, a lower value
   should be used if the system will be running any other daemons or
   processes that may require memory. This value can only be adjusted at
   boot time, and is set in ``/boot/loader.conf``.

-  *``vfs.zfs.arc_meta_limit``* - Limit the portion of the
   `ARC <zfs-term.html#zfs-term-arc>`__ that can be used to store
   metadata. The default is one fourth of ``vfs.zfs.arc_max``.
   Increasing this value will improve performance if the workload
   involves operations on a large number of files and directories, or
   frequent metadata operations, at the cost of less file data fitting
   in the `ARC <zfs-term.html#zfs-term-arc>`__. This value can only be
   adjusted at boot time, and is set in ``/boot/loader.conf``.

-  *``vfs.zfs.arc_min``* - Minimum size of the
   `ARC <zfs-term.html#zfs-term-arc>`__. The default is one half of
   ``vfs.zfs.arc_meta_limit``. Adjust this value to prevent other
   applications from pressuring out the entire
   `ARC <zfs-term.html#zfs-term-arc>`__. This value can only be adjusted
   at boot time, and is set in ``/boot/loader.conf``.

-  *``vfs.zfs.vdev.cache.size``* - A preallocated amount of memory
   reserved as a cache for each device in the pool. The total amount of
   memory used will be this value multiplied by the number of devices.
   This value can only be adjusted at boot time, and is set in
   ``/boot/loader.conf``.

-  *``vfs.zfs.min_auto_ashift``* - Minimum ``ashift`` (sector size) that
   will be used automatically at pool creation time. The value is a
   power of two. The default value of ``9`` represents ``2^9 = 512``, a
   sector size of 512 bytes. To avoid *write amplification* and get the
   best performance, set this value to the largest sector size used by a
   device in the pool.

   Many drives have 4?KB sectors. Using the default ``ashift`` of ``9``
   with these drives results in write amplification on these devices.
   Data that could be contained in a single 4?KB write must instead be
   written in eight 512-byte writes. ZFS tries to read the native sector
   size from all devices when creating a pool, but many drives with 4?KB
   sectors report that their sectors are 512 bytes for compatibility.
   Setting ``vfs.zfs.min_auto_ashift`` to ``12`` (``2^12 = 4096``)
   before creating a pool forces ZFS to use 4?KB blocks for best
   performance on these drives.

   Forcing 4?KB blocks is also useful on pools where disk upgrades are
   planned. Future disks are likely to use 4?KB sectors, and ``ashift``
   values cannot be changed after a pool is created.

   In some specific cases, the smaller 512-byte block size might be
   preferable. When used with 512-byte disks for databases, or as
   storage for virtual machines, less data is transferred during small
   random reads. This can provide better performance, especially when
   using a smaller ZFS record size.

-  *``vfs.zfs.prefetch_disable``* - Disable prefetch. A value of ``0``
   is enabled and ``1`` is disabled. The default is ``0``, unless the
   system has less than 4?GB of RAM. Prefetch works by reading larger
   blocks than were requested into the
   `ARC <zfs-term.html#zfs-term-arc>`__ in hopes that the data will be
   needed soon. If the workload has a large number of random reads,
   disabling prefetch may actually improve performance by reducing
   unnecessary reads. This value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.vdev.trim_on_init``* - Control whether new devices added
   to the pool have the ``TRIM`` command run on them. This ensures the
   best performance and longevity for SSDs, but takes extra time. If the
   device has already been secure erased, disabling this setting will
   make the addition of the new device faster. This value can be
   adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.vdev.max_pending``* - Limit the number of pending I/O
   requests per device. A higher value will keep the device command
   queue full and may give higher throughput. A lower value will reduce
   latency. This value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.top_maxinflight``* - Maxmimum number of outstanding I/Os
   per top-level `vdev <zfs-term.html#zfs-term-vdev>`__. Limits the
   depth of the command queue to prevent high latency. The limit is per
   top-level vdev, meaning the limit applies to each
   `mirror <zfs-term.html#zfs-term-vdev-mirror>`__,
   `RAID-Z <zfs-term.html#zfs-term-vdev-raidz>`__, or other vdev
   independently. This value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.l2arc_write_max``* - Limit the amount of data written to
   the `L2ARC <zfs-term.html#zfs-term-l2arc>`__ per second. This tunable
   is designed to extend the longevity of SSDs by limiting the amount of
   data written to the device. This value can be adjusted at any time
   with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.l2arc_write_boost``* - The value of this tunable is added
   to
   ```vfs.zfs.l2arc_write_max`` <zfs-advanced.html#zfs-advanced-tuning-l2arc_write_max>`__
   and increases the write speed to the SSD until the first block is
   evicted from the `L2ARC <zfs-term.html#zfs-term-l2arc>`__. This
   “Turbo Warmup Phase” is designed to reduce the performance loss from
   an empty `L2ARC <zfs-term.html#zfs-term-l2arc>`__ after a reboot.
   This value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.scrub_delay``* - Number of ticks to delay between each I/O
   during a ```scrub`` <zfs-term.html#zfs-term-scrub>`__. To ensure that
   a ``scrub`` does not interfere with the normal operation of the pool,
   if any other I/O is happening the ``scrub`` will delay between each
   command. This value controls the limit on the total IOPS (I/Os Per
   Second) generated by the ``scrub``. The granularity of the setting is
   determined by the value of ``kern.hz`` which defaults to 1000 ticks
   per second. This setting may be changed, resulting in a different
   effective IOPS limit. The default value is ``4``, resulting in a
   limit of: 1000?ticks/sec / 4 = 250?IOPS. Using a value of *``20``*
   would give a limit of: 1000?ticks/sec / 20 = 50?IOPS. The speed of
   ``scrub`` is only limited when there has been recent activity on the
   pool, as determined by
   ```vfs.zfs.scan_idle`` <zfs-advanced.html#zfs-advanced-tuning-scan_idle>`__.
   This value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.resilver_delay``* - Number of milliseconds of delay
   inserted between each I/O during a
   `resilver <zfs-term.html#zfs-term-resilver>`__. To ensure that a
   resilver does not interfere with the normal operation of the pool, if
   any other I/O is happening the resilver will delay between each
   command. This value controls the limit of total IOPS (I/Os Per
   Second) generated by the resilver. The granularity of the setting is
   determined by the value of ``kern.hz`` which defaults to 1000 ticks
   per second. This setting may be changed, resulting in a different
   effective IOPS limit. The default value is 2, resulting in a limit
   of: 1000?ticks/sec / 2 = 500?IOPS. Returning the pool to an
   `Online <zfs-term.html#zfs-term-online>`__ state may be more
   important if another device failing could
   `Fault <zfs-term.html#zfs-term-faulted>`__ the pool, causing data
   loss. A value of 0 will give the resilver operation the same priority
   as other operations, speeding the healing process. The speed of
   resilver is only limited when there has been other recent activity on
   the pool, as determined by
   ```vfs.zfs.scan_idle`` <zfs-advanced.html#zfs-advanced-tuning-scan_idle>`__.
   This value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.scan_idle``* - Number of milliseconds since the last
   operation before the pool is considered idle. When the pool is idle
   the rate limiting for ```scrub`` <zfs-term.html#zfs-term-scrub>`__
   and `resilver <zfs-term.html#zfs-term-resilver>`__ are disabled. This
   value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

-  *``vfs.zfs.txg.timeout``* - Maximum number of seconds between
   `transaction group <zfs-term.html#zfs-term-txg>`__\ s. The current
   transaction group will be written to the pool and a fresh transaction
   group started if this amount of time has elapsed since the previous
   transaction group. A transaction group my be triggered earlier if
   enough data is written. The default value is 5 seconds. A larger
   value may improve read performance by delaying asynchronous writes,
   but this may cause uneven performance when the transaction group is
   written. This value can be adjusted at any time with
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

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

20.6.2.?ZFS on i386
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some of the features provided by ZFS are memory intensive, and may
require tuning for maximum efficiency on systems with limited RAM.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.6.2.1.?Memory
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As a bare minimum, the total system memory should be at least one
gigabyte. The amount of recommended RAM depends upon the size of the
pool and which ZFS features are used. A general rule of thumb is 1?GB of
RAM for every 1?TB of storage. If the deduplication feature is used, a
general rule of thumb is 5?GB of RAM per TB of storage to be
deduplicated. While some users successfully use ZFS with less RAM,
systems under heavy load may panic due to memory exhaustion. Further
tuning may be required for systems with less than the recommended RAM
requirements.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.6.2.2.?Kernel Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Due to the address space limitations of the i386™ platform, ZFS users on
the i386™ architecture must add this option to a custom kernel
configuration file, rebuild the kernel, and reboot:

.. code:: programlisting

    options        KVA_PAGES=512

This expands the kernel address space, allowing the ``vm.kvm_size``
tunable to be pushed beyond the currently imposed limit of 1?GB, or the
limit of 2?GB for PAE. To find the most suitable value for this option,
divide the desired address space in megabytes by four. In this example,
it is ``512`` for 2?GB.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.6.2.3.?Loader Tunables
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``kmem`` address space can be increased on all FreeBSD
architectures. On a test system with 1?GB of physical memory, success
was achieved with these options added to ``/boot/loader.conf``, and the
system restarted:

.. code:: programlisting

    vm.kmem_size="330M"
    vm.kmem_size_max="330M"
    vfs.zfs.arc_max="40M"
    vfs.zfs.vdev.cache.size="5M"

For a more detailed list of recommendations for ZFS-related tuning, see
http://wiki.freebsd.org/ZFSTuningGuide.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+--------------------------------+
| `Prev <zfs-zfs-allow.html>`__?    | `Up <zfs.html>`__       | ?\ `Next <zfs-links.html>`__   |
+-----------------------------------+-------------------------+--------------------------------+
| 20.5.?Delegated Administration?   | `Home <index.html>`__   | ?20.7.?Additional Resources    |
+-----------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
