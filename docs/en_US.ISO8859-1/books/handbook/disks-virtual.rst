==================
18.9.?Memory Disks
==================

.. raw:: html

   <div class="navheader">

18.9.?Memory Disks
`Prev <backup-basics.html>`__?
Chapter?18.?Storage
?\ `Next <snapshots.html>`__

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

18.9.?Memory Disks
------------------

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

In addition to physical disks, FreeBSD also supports the creation and
use of memory disks. One possible use for a memory disk is to access the
contents of an ISO file system without the overhead of first burning it
to a CD or DVD, then mounting the CD/DVD media.

In FreeBSD, the
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ driver
is used to provide support for memory disks. The ``GENERIC`` kernel
includes this driver. When using a custom kernel configuration file,
ensure it includes this line:

.. code:: programlisting

    device md

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.9.1.?Attaching and Detaching Existing Images
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To mount an existing file system image, use ``mdconfig`` to specify the
name of the ISO file and a free unit number. Then, refer to that unit
number to mount it on an existing mount point. Once mounted, the files
in the ISO will appear in the mount point. This example attaches
*``diskimage.iso``* to the memory device ``/dev/md0`` then mounts that
memory device on ``/mnt``:

.. code:: screen

    # mdconfig -f diskimage.iso -u 0
    # mount /dev/md0 /mnt

If a unit number is not specified with ``-u``, ``mdconfig`` will
automatically allocate an unused memory device and output the name of
the allocated unit, such as ``md4``. Refer to
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
for more details about this command and its options.

When a memory disk is no longer in use, its resources should be released
back to the system. First, unmount the file system, then use
``mdconfig`` to detach the disk from the system and release its
resources. To continue this example:

.. code:: screen

    # umount /mnt
    # mdconfig -d -u 0

To determine if any memory disks are still attached to the system, type
``mdconfig -l``.

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

18.9.2.?Creating a File- or Memory-Backed Memory Disk
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD also supports memory disks where the storage to use is allocated
from either a hard disk or an area of memory. The first method is
commonly referred to as a file-backed file system and the second method
as a memory-backed file system. Both types can be created using
``mdconfig``.

To create a new memory-backed file system, specify a type of ``swap``
and the size of the memory disk to create. Then, format the memory disk
with a file system and mount as usual. This example creates a 5M memory
disk on unit ``1``. That memory disk is then formatted with the UFS file
system before it is mounted:

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

To create a new file-backed memory disk, first allocate an area of disk
to use. This example creates an empty 5K file named ``newimage``:

.. code:: screen

    # dd if=/dev/zero of=newimage bs=1k count=5k
    5120+0 records in
    5120+0 records out

Next, attach that file to a memory disk, label the memory disk and
format it with the UFS file system, mount the memory disk, and verify
the size of the file-backed disk:

.. code:: screen

    # mdconfig -f newimage -u 0
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

It takes several commands to create a file- or memory-backed file system
using ``mdconfig``. FreeBSD also comes with ``mdmfs`` which
automatically configures a memory disk, formats it with the UFS file
system, and mounts it. For example, after creating *``newimage``* with
``dd``, this one command is equivalent to running the ``bsdlabel``,
``newfs``, and ``mount`` commands shown above:

.. code:: screen

    # mdmfs -F newimage -s 5m md0 /mnt

To instead create a new memory-based memory disk with ``mdmfs``, use
this one command:

.. code:: screen

    # mdmfs -s 5m md1 /mnt

If the unit number is not specified, ``mdmfs`` will automatically select
an unused memory device. For more details about ``mdmfs``, refer to
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+---------------------------------+
| `Prev <backup-basics.html>`__?   | `Up <disks.html>`__     | ?\ `Next <snapshots.html>`__    |
+----------------------------------+-------------------------+---------------------------------+
| 18.8.?Backup Basics?             | `Home <index.html>`__   | ?18.10.?File System Snapshots   |
+----------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
