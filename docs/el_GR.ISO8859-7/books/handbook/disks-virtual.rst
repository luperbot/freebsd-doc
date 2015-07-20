====================================================
19.11. Network, Memory, and File-Backed File Systems
====================================================

.. raw:: html

   <div class="navheader">

19.11. Network, Memory, and File-Backed File Systems
`????? <backup-basics.html>`__?
???????? 19. ???????????? ????
?\ `??????? <snapshots.html>`__

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

19.11. Network, Memory, and File-Backed File Systems
----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganized and enhanced by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In addition to physical disks such as floppies, CDs, and hard drives,
FreeBSD also supports *virtual disks*.

These include network file systems such as the `Network File
System <network-nfs.html>`__ and Coda, memory-based file systems, and
file-backed file systems.

According to the FreeBSD version, the tools used for the creation and
use of file-backed and memory-based file systems differ.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Use
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
to allocate device nodes transparently for the user.

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

19.11.1. File-Backed File System
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
is used to configure and enable memory disks,
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__, under
FreeBSD. To use
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__,
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ must
be first loaded. When using a custom kernel configuration file, ensure
it includes this line:

.. code:: programlisting

    device md

`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
supports several types of memory backed virtual disks: memory disks
allocated with
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
and memory disks using a file or swap space as backing. One possible use
is the mounting of CD images.

To mount an existing file system image:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 19.3. Using ``mdconfig`` to Mount an Existing File System
Image

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdconfig -a -t vnode -f diskimage -u 0
    # mount /dev/md0 /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

To create a new file system image with
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 19.4. Creating a New File-Backed Disk with ``mdconfig``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=/dev/zero of=newimage bs=1k count=5k
    5120+0 records in
    5120+0 records out
    # mdconfig -a -t vnode -f newimage -u 0
    # bsdlabel -w md0 auto
    # newfs md0a
    /dev/md0a: 5.0MB (10224 sectors) block size 16384, fragment size 2048
            using 4 cylinder groups of 1.25MB, 80 blks, 192 inodes.
    super-block backups (for fsck -b #) at:
     160, 2720, 5280, 7840
    # mount /dev/md0a /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md0a       4710    4  4330     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

If unit number is not specified with ``-u``,
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
uses the
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
automatic allocation to select an unused device. The name of the
allocated unit will be output to stdout, such as ``md4``. Refer to
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
for more details about.

While
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
is useful, it takes several command lines to create a file-backed file
system. FreeBSD also comes with
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__
which automatically configures a
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ disk
using
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__,
puts a UFS file system on it using
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__,
and mounts it using
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
For example, to create and mount the same file system image as above,
type the following:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 19.5. Configure and Mount a File-Backed Disk with ``mdmfs``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=/dev/zero of=newimage bs=1k count=5k
    5120+0 records in
    5120+0 records out
    # mdmfs -F newimage -s 5m md0 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md0        4718    4  4338     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

When ``md`` is used without a unit number,
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__
uses the
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
auto-unit feature to automatically select an unused device. For more
details about
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__,
refer to its manual page.

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

19.11.2. Memory-Based File System
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For a memory-based file system, ?swap backing? should normally be used.
This does not mean that the memory disk will be swapped out to disk by
default, but rather that the memory disk will be allocated from a memory
pool which can be swapped out to disk if needed. It is also possible to
create memory-based disks which are
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
backed, but using large malloc backed memory disks can result in a
system panic if the kernel runs out of memory.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 19.6. Creating a New Memory-Based Disk with ``mdconfig``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdconfig -a -t swap -s 5m -u 1
    # newfs -U md1
    /dev/md1: 5.0MB (10240 sectors) block size 16384, fragment size 2048
            using 4 cylinder groups of 1.27MB, 81 blks, 192 inodes.
            with soft updates
    super-block backups (for fsck -b #) at:
     160, 2752, 5344, 7936
    # mount /dev/md1 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md1        4718    4  4338     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 19.7. Creating a New Memory-Based Disk with ``mdmfs``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdmfs -s 5m md2 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md2        4846    2  4458     0%    /mnt

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

19.11.3. Detaching a Memory Disk from the System
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a memory-based or file-based file system is no longer in use, its
resources should be released back to the system. First, unmount the file
system, then use
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
to detach the disk from the system and release the resources.

For example, to detach and free all resources used by ``/dev/md4``:

.. code:: screen

    # mdconfig -d -u 4

It is possible to list information about configured
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
devices by running ``mdconfig -l``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+-----------------------------------+
| `????? <backup-basics.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <snapshots.html>`__   |
+-----------------------------------+-------------------------+-----------------------------------+
| 19.10. Backup Basics?             | `???? <index.html>`__   | ?19.12. File System Snapshots     |
+-----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
