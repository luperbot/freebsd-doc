============================
19.12. File System Snapshots
============================

.. raw:: html

   <div class="navheader">

19.12. File System Snapshots
`????? <disks-virtual.html>`__?
???????? 19. ???????????? ????
?\ `??????? <quotas.html>`__

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

19.12. File System Snapshots
----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD offers a feature in conjunction with `Soft
Updates <configtuning-disk.html#soft-updates>`__: file system snapshots.

UFS snapshots allow a user to create images of specified file systems,
and treat them as a file. Snapshot files must be created in the file
system that the action is performed on, and a user may create no more
than 20 snapshots per file system. Active snapshots are recorded in the
superblock so they are persistent across unmount and remount operations
along with system reboots. When a snapshot is no longer required, it can
be removed using
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1>`__. While
snapshots may be removed in any order, all the used space may not be
acquired because another snapshot will possibly claim some of the
released blocks.

The un-alterable ``snapshot`` file flag is set by
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8>`__
after initial creation of a snapshot file.
`unlink(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unlink&sektion=1>`__
makes an exception for snapshot files since it allows them to be
removed.

Snapshots are created using
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
To place a snapshot of ``/var`` in the file ``/var/snapshot/snap``, use
the following command:

.. code:: screen

    # mount -u -o snapshot /var/snapshot/snap /var

Alternatively, use
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8>`__
to create the snapshot:

.. code:: screen

    # mksnap_ffs /var /var/snapshot/snap

One can find snapshot files on a file system, such as ``/var``, using
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__:

.. code:: screen

    # find /var -flags snapshot

Once a snapshot has been created, it has several uses:

.. raw:: html

   <div class="itemizedlist">

-  Some administrators will use a snapshot file for backup purposes,
   because the snapshot can be transferred to CDs or tape.

-  The file system integrity checker,
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__,
   may be run on the snapshot. Assuming that the file system was clean
   when it was mounted, this should always provide a clean and
   unchanging result.

-  Running
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   on the snapshot will produce a dump file that is consistent with the
   file system and the timestamp of the snapshot.
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   can also take a snapshot, create a dump image, and then remove the
   snapshot in one command by using ``-L``.

-  The snapshot can be mounted as a frozen image of the file system. To
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
   the snapshot ``/var/snapshot/snap`` run:

   .. code:: screen

       # mdconfig -a -t vnode -f /var/snapshot/snap -u 4
       # mount -r /dev/md4 /mnt

.. raw:: html

   </div>

The frozen ``/var`` is now available through ``/mnt``. Everything will
initially be in the same state it was during the snapshot creation time.
The only exception is that any earlier snapshots will appear as zero
length files. To unmount the snapshot, use:

.. code:: screen

    # umount /mnt
    # mdconfig -d -u 4

For more information about ``softupdates`` and file system snapshots,
including technical papers, visit Marshall Kirk McKusick's website at
``http://www.mckusick.com/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+-------------------------+--------------------------------+
| `????? <disks-virtual.html>`__?                         | `???? <disks.html>`__   | ?\ `??????? <quotas.html>`__   |
+---------------------------------------------------------+-------------------------+--------------------------------+
| 19.11. Network, Memory, and File-Backed File Systems?   | `???? <index.html>`__   | ?19.13. File System Quotas     |
+---------------------------------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
