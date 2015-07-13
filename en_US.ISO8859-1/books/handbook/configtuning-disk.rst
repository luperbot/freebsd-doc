===================
12.10.?Tuning Disks
===================

.. raw:: html

   <div class="navheader">

12.10.?Tuning Disks
`Prev <configtuning-sysctl.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-kernel-limits.html>`__

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

12.10.?Tuning Disks
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following section will discuss various tuning mechanisms and options
which may be applied to disk devices. In many cases, disks with
mechanical parts, such as SCSI drives, will be the bottleneck driving
down the overall system performance. While a solution is to install a
drive without mechanical parts, such as a solid state drive, mechanical
drives are not going away anytime in the near future. When tuning disks,
it is advisable to utilize the features of the
`iostat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iostat&sektion=8>`__
command to test various changes to the system. This command will allow
the user to obtain valuable information on system IO.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.10.1.?Sysctl Variables
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

12.10.1.1.?\ ``vfs.vmiodirenable``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vfs.vmiodirenable``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable may be set to either ``0`` (off) or ``1`` (on). It is set to
``1`` by default. This variable controls how directories are cached by
the system. Most directories are small, using just a single fragment
(typically 1?K) in the file system and typically 512?bytes in the buffer
cache. With this variable turned off, the buffer cache will only cache a
fixed number of directories, even if the system has a huge amount of
memory. When turned on, this
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
allows the buffer cache to use the VM page cache to cache the
directories, making all the memory available for caching directories.
However, the minimum in-core memory used to cache a directory is the
physical page size (typically 4?K) rather than 512? bytes. Keeping this
option enabled is recommended if the system is running any services
which manipulate large numbers of files. Such services can include web
caches, large mail systems, and news systems. Keeping this option on
will generally not reduce performance, even with the wasted memory, but
one should experiment to find out.

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

12.10.1.2.?\ ``vfs.write_behind``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vfs.write_behind``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable defaults to ``1`` (on). This tells the file system to issue
media writes as full clusters are collected, which typically occurs when
writing large sequential files. This avoids saturating the buffer cache
with dirty buffers when it would not benefit I/O performance. However,
this may stall processes and under certain circumstances should be
turned off.

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

12.10.1.3.?\ ``vfs.hirunningspace``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vfs.hirunningspace``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable determines how much outstanding write I/O may be queued to disk
controllers system-wide at any given instance. The default is usually
sufficient, but on machines with many disks, try bumping it up to four
or five *megabytes*. Setting too high a value which exceeds the buffer
cache's write threshold can lead to bad clustering performance. Do not
set this value arbitrarily high as higher write values may add latency
to reads occurring at the same time.

There are various other buffer cache and VM page cache related
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
values. Modifying these values is not recommended as the VM system does
a good job of automatically tuning itself.

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

12.10.1.4.?\ ``vm.swap_idle_enabled``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vm.swap_idle_enabled``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable is useful in large multi-user systems with many active login
users and lots of idle processes. Such systems tend to generate
continuous pressure on free memory reserves. Turning this feature on and
tweaking the swapout hysteresis (in idle seconds) via
``vm.swap_idle_threshold1`` and ``vm.swap_idle_threshold2`` depresses
the priority of memory pages associated with idle processes more quickly
then the normal pageout algorithm. This gives a helping hand to the
pageout daemon. Only turn this option on if needed, because the tradeoff
is essentially pre-page memory sooner rather than later which eats more
swap and disk bandwidth. In a small system this option will have a
determinable effect, but in a large system that is already doing
moderate paging, this option allows the VM system to stage whole
processes into and out of memory easily.

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

12.10.1.5.?\ ``hw.ata.wc``
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Turning off IDE write caching reduces write bandwidth to IDE disks, but
may sometimes be necessary due to data consistency issues introduced by
hard drive vendors. The problem is that some IDE drives lie about when a
write completes. With IDE write caching turned on, IDE hard drives write
data to disk out of order and will sometimes delay writing some blocks
indefinitely when under heavy disk load. A crash or power failure may
cause serious file system corruption. Check the default on the system by
observing the ``hw.ata.wc``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable. If IDE write caching is turned off, one can set this read-only
variable to ``1`` in ``/boot/loader.conf`` in order to enable it at boot
time.

For more information, refer to
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4>`__.

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

12.10.1.6.?\ ``SCSI_DELAY`` (``kern.cam.scsi_delay``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``SCSI_DELAY`` kernel configuration option may be used to reduce
system boot times. The defaults are fairly high and can be responsible
for ``15`` seconds of delay in the boot process. Reducing it to ``5``
seconds usually works with modern drives. The ``kern.cam.scsi_delay``
boot time tunable should be used. The tunable and kernel configuration
option accept values in terms of *milliseconds* and *not* *seconds*.

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

12.10.2.?Soft Updates
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To fine-tune a file system, use
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__.
This program has many different options. To toggle Soft Updates on and
off, use:

.. code:: screen

    # tunefs -n enable /filesystem
    # tunefs -n disable /filesystem

A file system cannot be modified with
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
while it is mounted. A good time to enable Soft Updates is before any
partitions have been mounted, in single-user mode.

Soft Updates is recommended for UFS file systems as it drastically
improves meta-data performance, mainly file creation and deletion,
through the use of a memory cache. There are two downsides to Soft
Updates to be aware of. First, Soft Updates guarantee file system
consistency in the case of a crash, but could easily be several seconds
or even a minute behind updating the physical disk. If the system
crashes, unwritten data may be lost. Secondly, Soft Updates delay the
freeing of file system blocks. If the root file system is almost full,
performing a major update, such as ``make installworld``, can cause the
file system to run out of space and the update to fail.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.10.2.1.?More Details About Soft Updates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Meta-data updates are updates to non-content data like inodes or
directories. There are two traditional approaches to writing a file
system's meta-data back to disk.

Historically, the default behavior was to write out meta-data updates
synchronously. If a directory changed, the system waited until the
change was actually written to disk. The file data buffers (file
contents) were passed through the buffer cache and backed up to disk
later on asynchronously. The advantage of this implementation is that it
operates safely. If there is a failure during an update, meta-data is
always in a consistent state. A file is either created completely or not
at all. If the data blocks of a file did not find their way out of the
buffer cache onto the disk by the time of the crash,
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
recognizes this and repairs the file system by setting the file length
to ``0``. Additionally, the implementation is clear and simple. The
disadvantage is that meta-data changes are slow. For example, ``rm -r``
touches all the files in a directory sequentially, but each directory
change will be written synchronously to the disk. This includes updates
to the directory itself, to the inode table, and possibly to indirect
blocks allocated by the file. Similar considerations apply for unrolling
large hierarchies using ``tar -x``.

The second approach is to use asynchronous meta-data updates. This is
the default for a UFS file system mounted with ``mount -o async``. Since
all meta-data updates are also passed through the buffer cache, they
will be intermixed with the updates of the file content data. The
advantage of this implementation is there is no need to wait until each
meta-data update has been written to disk, so all operations which cause
huge amounts of meta-data updates work much faster than in the
synchronous case. This implementation is still clear and simple, so
there is a low risk for bugs creeping into the code. The disadvantage is
that there is no guarantee for a consistent state of the file system. If
there is a failure during an operation that updated large amounts of
meta-data, like a power failure or someone pressing the reset button,
the file system will be left in an unpredictable state. There is no
opportunity to examine the state of the file system when the system
comes up again as the data blocks of a file could already have been
written to the disk while the updates of the inode table or the
associated directory were not. It is impossible to implement a
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
which is able to clean up the resulting chaos because the necessary
information is not available on the disk. If the file system has been
damaged beyond repair, the only choice is to reformat it and restore
from backup.

The usual solution for this problem is to implement *dirty region
logging*, which is also referred to as *journaling*. Meta-data updates
are still written synchronously, but only into a small region of the
disk. Later on, they are moved to their proper location. Because the
logging area is a small, contiguous region on the disk, there are no
long distances for the disk heads to move, even during heavy operations,
so these operations are quicker than synchronous updates. Additionally,
the complexity of the implementation is limited, so the risk of bugs
being present is low. A disadvantage is that all meta-data is written
twice, once into the logging region and once to the proper location, so
performance “pessimization” might result. On the other hand, in case of
a crash, all pending meta-data operations can be either quickly rolled
back or completed from the logging area after the system comes up again,
resulting in a fast file system startup.

Kirk McKusick, the developer of Berkeley FFS, solved this problem with
Soft Updates. All pending meta-data updates are kept in memory and
written out to disk in a sorted sequence (“ordered meta-data updates”).
This has the effect that, in case of heavy meta-data operations, later
updates to an item “catch” the earlier ones which are still in memory
and have not already been written to disk. All operations are generally
performed in memory before the update is written to disk and the data
blocks are sorted according to their position so that they will not be
on the disk ahead of their meta-data. If the system crashes, an implicit
“log rewind” causes all operations which were not written to the disk
appear as if they never happened. A consistent file system state is
maintained that appears to be the one of 30 to 60 seconds earlier. The
algorithm used guarantees that all resources in use are marked as such
in their blocks and inodes. After a crash, the only resource allocation
error that occurs is that resources are marked as “used” which are
actually “free”.
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
recognizes this situation, and frees the resources that are no longer
used. It is safe to ignore the dirty state of the file system after a
crash by forcibly mounting it with ``mount -f``. In order to free
resources that may be unused,
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
needs to be run at a later time. This is the idea behind the *background
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__*:
at system startup time, only a *snapshot* of the file system is recorded
and
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__ is
run afterwards. All file systems can then be mounted “dirty”, so the
system startup proceeds in multi-user mode. Then, background
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__ is
scheduled for all file systems where this is required, to free resources
that may be unused. File systems that do not use Soft Updates still need
the usual foreground
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__.

The advantage is that meta-data operations are nearly as fast as
asynchronous updates and are faster than *logging*, which has to write
the meta-data twice. The disadvantages are the complexity of the code, a
higher memory consumption, and some idiosyncrasies. After a crash, the
state of the file system appears to be somewhat “older”. In situations
where the standard synchronous approach would have caused some
zero-length files to remain after the
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__,
these files do not exist at all with Soft Updates because neither the
meta-data nor the file contents have been written to disk. Disk space is
not released until the updates have been written to disk, which may take
place some time after running
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1>`__. This
may cause problems when installing large amounts of data on a file
system that does not have enough free space to hold all the files twice.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-------------------------------------------------+
| `Prev <configtuning-sysctl.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-kernel-limits.html>`__   |
+----------------------------------------+-------------------------------+-------------------------------------------------+
| 12.9.?Tuning with sysctl(8)?           | `Home <index.html>`__         | ?12.11.?Tuning Kernel Limits                    |
+----------------------------------------+-------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
