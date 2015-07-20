===================
12.12. Tuning Disks
===================

.. raw:: html

   <div class="navheader">

12.12. Tuning Disks
`????? <configtuning-sysctl.html>`__?
???????? 12. ??????? ??? ??????????????
?\ `??????? <configtuning-kernel-limits.html>`__

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

12.12. Tuning Disks
-------------------

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

12.12.1. Sysctl Variables
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

12.12.1.1. ``vfs.vmiodirenable``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vfs.vmiodirenable`` sysctl variable may be set to either 0 (off)
or 1 (on); it is 1 by default. This variable controls how directories
are cached by the system. Most directories are small, using just a
single fragment (typically 1?K) in the file system and less (typically
512?bytes) in the buffer cache. With this variable turned off (to 0),
the buffer cache will only cache a fixed number of directories even if
you have a huge amount of memory. When turned on (to 1), this sysctl
allows the buffer cache to use the VM Page Cache to cache the
directories, making all the memory available for caching directories.
However, the minimum in-core memory used to cache a directory is the
physical page size (typically 4?K) rather than 512? bytes. We recommend
keeping this option on if you are running any services which manipulate
large numbers of files. Such services can include web caches, large mail
systems, and news systems. Keeping this option on will generally not
reduce performance even with the wasted memory but you should experiment
to find out.

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

12.12.1.2. ``vfs.write_behind``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vfs.write_behind`` sysctl variable defaults to ``1`` (on). This
tells the file system to issue media writes as full clusters are
collected, which typically occurs when writing large sequential files.
The idea is to avoid saturating the buffer cache with dirty buffers when
it would not benefit I/O performance. However, this may stall processes
and under certain circumstances you may wish to turn it off.

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

12.12.1.3. ``vfs.hirunningspace``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vfs.hirunningspace`` sysctl variable determines how much
outstanding write I/O may be queued to disk controllers system-wide at
any given instance. The default is usually sufficient but on machines
with lots of disks you may want to bump it up to four or five
*megabytes*. Note that setting too high a value (exceeding the buffer
cache's write threshold) can lead to extremely bad clustering
performance. Do not set this value arbitrarily high! Higher write values
may add latency to reads occurring at the same time.

There are various other buffer-cache and VM page cache related sysctls.
We do not recommend modifying these values, the VM system does an
extremely good job of automatically tuning itself.

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

12.12.1.4. ``vm.swap_idle_enabled``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vm.swap_idle_enabled`` sysctl variable is useful in large
multi-user systems where you have lots of users entering and leaving the
system and lots of idle processes. Such systems tend to generate a great
deal of continuous pressure on free memory reserves. Turning this
feature on and tweaking the swapout hysteresis (in idle seconds) via
``vm.swap_idle_threshold1`` and ``vm.swap_idle_threshold2`` allows you
to depress the priority of memory pages associated with idle processes
more quickly then the normal pageout algorithm. This gives a helping
hand to the pageout daemon. Do not turn this option on unless you need
it, because the tradeoff you are making is essentially pre-page memory
sooner rather than later; thus eating more swap and disk bandwidth. In a
small system this option will have a determinable effect but in a large
system that is already doing moderate paging this option allows the VM
system to stage whole processes into and out of memory easily.

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

12.12.1.5. ``hw.ata.wc``
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD?4.3 flirted with turning off IDE write caching. This reduced
write bandwidth to IDE disks but was considered necessary due to serious
data consistency issues introduced by hard drive vendors. The problem is
that IDE drives lie about when a write completes. With IDE write caching
turned on, IDE hard drives not only write data to disk out of order, but
will sometimes delay writing some blocks indefinitely when under heavy
disk loads. A crash or power failure may cause serious file system
corruption. FreeBSD's default was changed to be safe. Unfortunately, the
result was such a huge performance loss that we changed write caching
back to on by default after the release. You should check the default on
your system by observing the ``hw.ata.wc`` sysctl variable. If IDE write
caching is turned off, you can turn it back on by setting the kernel
variable back to 1. This must be done from the boot loader at boot time.
Attempting to do it after the kernel boots will have no effect.

For more information, please see
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

12.12.1.6. ``SCSI_DELAY`` (``kern.cam.scsi_delay``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``SCSI_DELAY`` kernel config may be used to reduce system boot
times. The defaults are fairly high and can be responsible for ``15``
seconds of delay in the boot process. Reducing it to ``5`` seconds
usually works (especially with modern drives). Newer versions of FreeBSD
(5.0 and higher) should use the ``kern.cam.scsi_delay`` boot time
tunable. The tunable, and kernel config option accept values in terms of
*milliseconds* and *not* *seconds*.

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

12.12.2. Soft Updates
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
program can be used to fine-tune a file system. This program has many
different options, but for now we are only concerned with toggling Soft
Updates on and off, which is done by:

.. code:: screen

    # tunefs -n enable /filesystem
    # tunefs -n disable /filesystem

A filesystem cannot be modified with
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
while it is mounted. A good time to enable Soft Updates is before any
partitions have been mounted, in single-user mode.

Soft Updates drastically improves meta-data performance, mainly file
creation and deletion, through the use of a memory cache. We recommend
to use Soft Updates on all of your file systems. There are two downsides
to Soft Updates that you should be aware of: First, Soft Updates
guarantees filesystem consistency in the case of a crash but could very
easily be several seconds (even a minute!) behind updating the physical
disk. If your system crashes you may lose more work than otherwise.
Secondly, Soft Updates delays the freeing of filesystem blocks. If you
have a filesystem (such as the root filesystem) which is almost full,
performing a major update, such as ``make installworld``, can cause the
filesystem to run out of space and the update to fail.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.12.2.1. More Details about Soft Updates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two traditional approaches to writing a file systems meta-data
back to disk. (Meta-data updates are updates to non-content data like
inodes or directories.)

Historically, the default behavior was to write out meta-data updates
synchronously. If a directory had been changed, the system waited until
the change was actually written to disk. The file data buffers (file
contents) were passed through the buffer cache and backed up to disk
later on asynchronously. The advantage of this implementation is that it
operates safely. If there is a failure during an update, the meta-data
are always in a consistent state. A file is either created completely or
not at all. If the data blocks of a file did not find their way out of
the buffer cache onto the disk by the time of the crash,
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__ is
able to recognize this and repair the filesystem by setting the file
length to 0. Additionally, the implementation is clear and simple. The
disadvantage is that meta-data changes are slow. An ``rm -r``, for
instance, touches all the files in a directory sequentially, but each
directory change (deletion of a file) will be written synchronously to
the disk. This includes updates to the directory itself, to the inode
table, and possibly to indirect blocks allocated by the file. Similar
considerations apply for unrolling large hierarchies (``tar -x``).

The second case is asynchronous meta-data updates. This is the default
for Linux/ext2fs and ``mount -o async`` for \*BSD ufs. All meta-data
updates are simply being passed through the buffer cache too, that is,
they will be intermixed with the updates of the file content data. The
advantage of this implementation is there is no need to wait until each
meta-data update has been written to disk, so all operations which cause
huge amounts of meta-data updates work much faster than in the
synchronous case. Also, the implementation is still clear and simple, so
there is a low risk for bugs creeping into the code. The disadvantage is
that there is no guarantee at all for a consistent state of the
filesystem. If there is a failure during an operation that updated large
amounts of meta-data (like a power failure, or someone pressing the
reset button), the filesystem will be left in an unpredictable state.
There is no opportunity to examine the state of the filesystem when the
system comes up again; the data blocks of a file could already have been
written to the disk while the updates of the inode table or the
associated directory were not. It is actually impossible to implement a
``fsck`` which is able to clean up the resulting chaos (because the
necessary information is not available on the disk). If the filesystem
has been damaged beyond repair, the only choice is to use
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
on it and restore it from backup.

The usual solution for this problem was to implement *dirty region
logging*, which is also referred to as *journaling*, although that term
is not used consistently and is occasionally applied to other forms of
transaction logging as well. Meta-data updates are still written
synchronously, but only into a small region of the disk. Later on they
will be moved to their proper location. Because the logging area is a
small, contiguous region on the disk, there are no long distances for
the disk heads to move, even during heavy operations, so these
operations are quicker than synchronous updates. Additionally the
complexity of the implementation is fairly limited, so the risk of bugs
being present is low. A disadvantage is that all meta-data are written
twice (once into the logging region and once to the proper location) so
for normal work, a performance ?pessimization? might result. On the
other hand, in case of a crash, all pending meta-data operations can be
quickly either rolled-back or completed from the logging area after the
system comes up again, resulting in a fast filesystem startup.

Kirk McKusick, the developer of Berkeley FFS, solved this problem with
Soft Updates: all pending meta-data updates are kept in memory and
written out to disk in a sorted sequence (?ordered meta-data updates?).
This has the effect that, in case of heavy meta-data operations, later
updates to an item ?catch? the earlier ones if the earlier ones are
still in memory and have not already been written to disk. So all
operations on, say, a directory are generally performed in memory before
the update is written to disk (the data blocks are sorted according to
their position so that they will not be on the disk ahead of their
meta-data). If the system crashes, this causes an implicit ?log rewind?:
all operations which did not find their way to the disk appear as if
they had never happened. A consistent filesystem state is maintained
that appears to be the one of 30 to 60 seconds earlier. The algorithm
used guarantees that all resources in use are marked as such in their
appropriate bitmaps: blocks and inodes. After a crash, the only resource
allocation error that occurs is that resources are marked as ?used?
which are actually ?free?.
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
recognizes this situation, and frees the resources that are no longer
used. It is safe to ignore the dirty state of the filesystem after a
crash by forcibly mounting it with ``mount -f``. In order to free
resources that may be unused,
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
needs to be run at a later time. This is the idea behind the *background
fsck*: at system startup time, only a *snapshot* of the filesystem is
recorded. The ``fsck`` can be run later on. All file systems can then be
mounted ?dirty?, so the system startup proceeds in multiuser mode. Then,
background ``fsck``\ s will be scheduled for all file systems where this
is required, to free resources that may be unused. (File systems that do
not use Soft Updates still need the usual foreground ``fsck`` though.)

The advantage is that meta-data operations are nearly as fast as
asynchronous updates (i.e. faster than with *logging*, which has to
write the meta-data twice). The disadvantages are the complexity of the
code (implying a higher risk for bugs in an area that is highly
sensitive regarding loss of user data), and a higher memory consumption.
Additionally there are some idiosyncrasies one has to get used to. After
a crash, the state of the filesystem appears to be somewhat ?older?. In
situations where the standard synchronous approach would have caused
some zero-length files to remain after the ``fsck``, these files do not
exist at all with a Soft Updates filesystem because neither the
meta-data nor the file contents have ever been written to disk. Disk
space is not released until the updates have been written to disk, which
may take place some time after running ``rm``. This may cause problems
when installing large amounts of data on a filesystem that does not have
enough free space to hold all the files twice.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------------+----------------------------------------------------+
| `????? <configtuning-sysctl.html>`__?   | `???? <config-tuning.html>`__   | ?\ `??????? <configtuning-kernel-limits.html>`__   |
+-----------------------------------------+---------------------------------+----------------------------------------------------+
| 12.11. Tuning with sysctl?              | `???? <index.html>`__           | ?12.13. Tuning Kernel Limits                       |
+-----------------------------------------+---------------------------------+----------------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
