=========================
21.2.?Linux? File Systems
=========================

.. raw:: html

   <div class="navheader">

21.2.?Linux? File Systems
`Prev <filesystems.html>`__?
Chapter?21.?Other File Systems
?\ `Next <virtualization.html>`__

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

21.2.?Linux? File Systems
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides built-in support for several Linux? file systems. This
section demonstrates how to load support for and how to mount the
supported Linux? file systems.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.2.1.?ext2
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kernel support for ext2 file systems has been available since
FreeBSD?2.2. In FreeBSD?8.x and earlier, the code is licensed under the
GPL. Since FreeBSD?9.0, the code has been rewritten and is now BSD
licensed.

The
`ext2fs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ext2fs&sektion=5>`__
driver allows the FreeBSD kernel to both read and write to ext2 file
systems.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This driver can also be used to access ext3 and ext4 file systems.
However, ext3 journaling, extended attributes, and inodes greater than
128-bytes are not supported. Support for ext4 is read-only.

.. raw:: html

   </div>

To access an ext file system, first load the kernel loadable module:

.. code:: screen

    # kldload ext2fs

Then, mount the ext volume by specifying its FreeBSD partition name and
an existing mount point. This example mounts ``/dev/ad1s1`` on ``/mnt``:

.. code:: screen

    # mount -t ext2fs /dev/ad1s1 /mnt

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

21.2.2.?ReiserFS
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides read-only support for The Reiser file system, ReiserFS.

To load the
`reiserfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=reiserfs&sektion=5>`__
driver:

.. code:: screen

    # kldload reiserfs

Then, to mount a ReiserFS volume located on ``/dev/ad1s1``:

.. code:: screen

    # mount -t reiserfs /dev/ad1s1 /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-----------------------------+-------------------------------------+
| `Prev <filesystems.html>`__?      | `Up <filesystems.html>`__   | ?\ `Next <virtualization.html>`__   |
+-----------------------------------+-----------------------------+-------------------------------------+
| Chapter?21.?Other File Systems?   | `Home <index.html>`__       | ?Chapter?22.?Virtualization         |
+-----------------------------------+-----------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
