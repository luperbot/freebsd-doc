====================
19.10. Backup Basics
====================

.. raw:: html

   <div class="navheader">

19.10. Backup Basics
`????? <backup-strategies.html>`__?
???????? 19. ???????????? ????
?\ `??????? <disks-virtual.html>`__

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

19.10. Backup Basics
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The major backup programs built into FreeBSD are
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__,
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__,
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__,
and `pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.10.1. Dump and Restore
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The traditional UNIX(R) backup programs are ``dump`` and ``restore``.
They operate on the drive as a collection of disk blocks, below the
abstractions of files, links and directories that are created by the
file systems. Unlike other backup software, ``dump`` backs up an entire
file system on a device. It is unable to backup only part of a file
system or a directory tree that spans more than one file system.
``dump`` does not write files and directories, but rather writes the raw
data blocks that comprise files and directories. When used to extract
data, ``restore`` stores temporary files in ``/tmp/`` by default. When
using a recovery disk with a small ``/tmp``, set ``TMPDIR`` to a
directory with more free space in order for the restore to succeed.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

If ``dump`` is used on the root directory, it will not back up
``/home``, ``/usr`` or many other directories since these are typically
mount points for other file systems or symbolic links into those file
systems.

.. raw:: html

   </div>

``dump`` has quirks that remain from its early days in Version 6 of AT&T
UNIX(R),circa 1975. The default parameters are suitable for 9-track
tapes (6250 bpi), not the high-density media available today (up to
62,182 ftpi). These defaults must be overridden on the command line to
utilize the capacity of current tape drives.

It is also possible to backup data across the network to a tape drive
attached to another computer with ``rdump`` and ``rrestore``. Both
programs rely upon
`rcmd(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rcmd&sektion=3>`__
and
`ruserok(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ruserok&sektion=3>`__
to access the remote tape drive. Therefore, the user performing the
backup must be listed in ``.rhosts`` on the remote computer. The
arguments to ``rdump`` and ``rrestore`` must be suitable to use on the
remote computer. For example, to ``rdump`` from a FreeBSD computer to an
Exabyte tape drive connected to a host called ``komodo``, use:

.. code:: screen

    # /sbin/rdump 0dsbfu 54000 13000 126 komodo:/dev/nsa8 /dev/da0a 2>&1

There are security implications to allowing ``.rhosts`` authentication,
so use with caution.

It is also possible to use ``dump`` and ``restore`` in a more secure
fashion over ``ssh``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 19.1. Using ``dump`` over ssh

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # /sbin/dump -0uan -f - /usr | gzip -2 | ssh -c blowfish \
              targetuser@targetmachine.example.com dd of=/mybigfiles/dump-usr-l0.gz

.. raw:: html

   </div>

.. raw:: html

   </div>

Or, use the built-in ``RSH``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 19.2. Using ``dump`` over ssh with ``RSH`` Set

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # env RSH=/usr/bin/ssh /sbin/dump -0uan -f targetuser@targetmachine.example.com:/dev/sa0 /usr

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

19.10.2. ``tar``
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ also
dates back to Version 6 of AT&T UNIX(R), circa 1975. ``tar`` operates in
cooperation with the file system and writes files and directories to
tape. ``tar`` does not support the full range of options that are
available from
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__,
but it does not require the unusual command pipeline that ``cpio`` uses.

To ``tar`` to an Exabyte tape drive connected to a host called
``komodo``:

.. code:: screen

    # tar cf - . | rsh komodo dd of=tape-device obs=20b

When backing up over an insecure network, instead use ``ssh``.

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

19.10.3. ``cpio``
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__ is
the original UNIX(R) file interchange tape program for magnetic media.
``cpio`` includes options to perform byte-swapping, write a number of
different archive formats, and pipe the data to other programs. This
last feature makes ``cpio`` an excellent choice for installation media.
``cpio`` does not know how to walk the directory tree and a list of
files must be provided through ``stdin``.

Since ``cpio`` does not support backups across the network, use a
pipeline and ``ssh`` to send the data to a remote tape drive.

.. code:: screen

    # for f in directory_list; do
    find $f >> backup.list
    done
    # cpio -v -o --format=newc < backup.list | ssh user@host "cat > backup_device"

Where *``directory_list``* is the list of directories to back up,
*``user``*\ @\ *``host``* is the user/hostname combination that will be
performing the backups, and *``backup_device``* is where the backups
should be written to, such as ``/dev/nsa0``).

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

19.10.4. ``pax``
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1>`__ is
the IEEE/POSIX(R) answer to ``tar`` and ``cpio``. Over the years the
various versions of ``tar`` and ``cpio`` have become slightly
incompatible. So rather than fight it out to fully standardize them,
POSIX(R) created a new archive utility. ``pax`` attempts to read and
write many of the various ``cpio`` and ``tar`` formats, plus new formats
of its own. Its command set more resembles ``cpio`` than ``tar``.

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

19.10.5. Amanda
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Amanda (Advanced Maryland Network Disk Archiver) is a client/server
backup system, rather than a single program. An Amanda server will
backup to a single tape drive any number of computers that have Amanda
clients and a network connection to the Amanda server. A common problem
at sites with a number of large disks is that the length of time
required to backup to data directly to tape exceeds the amount of time
available for the task. Amanda solves this problem by using a ?holding
disk? to backup several file systems at the same time. Amanda creates
?archive sets?: a group of tapes used over a period of time to create
full backups of all the file systems listed in Amanda's configuration
file. The ?archive set? also contains nightly incremental, or
differential, backups of all the file systems. Restoring a damaged file
system requires the most recent full backup and the incremental backups.

The configuration file provides fine grained control of backups and the
network traffic that Amanda generates. Amanda will use any of the above
backup programs to write the data to tape. Amanda is not installed by
but is available as either a port or package.

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

19.10.6. Do Nothing
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?Do nothing? is not a computer program, but it is the most widely used
backup strategy. There are no initial costs. There is no backup schedule
to follow. Just say no. If something happens to your data, grin and bear
it!

If your time and data is worth little to nothing, then ?Do nothing? is
the most suitable backup program for the computer. But beware, FreeBSD
is a useful tool and over time it can be used to create a valuable
collection of files.

?Do nothing? is the correct backup method for ``/usr/obj`` and other
directory trees that can be exactly recreated by the computer. An
example is the files that comprise the HTML or PostScript(R) version of
this Handbook. These document formats have been created from XML input
files. Creating backups of the HTML or PostScript(R) files is not
necessary if the XML files are backed up regularly.

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

19.10.7. Which Backup Program Is Best?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
*Period.* Elizabeth D. Zwicky torture tested all the backup programs
discussed here. The clear choice for preserving all your data and all
the peculiarities of UNIX(R) file systems is ``dump``. Elizabeth created
file systems containing a large variety of unusual conditions (and some
not so unusual ones) and tested each program by doing a backup and
restore of those file systems. The peculiarities included: files with
holes, files with holes and a block of nulls, files with funny
characters in their names, unreadable and unwritable files, devices,
files that change size during the backup, files that are created/deleted
during the backup and more. She presented the results at LISA V in Oct.
1991. See `torture-testing Backup and Archive
Programs <http://www.coredumps.de/doc/dump/zwicky/testdump.doc.html>`__.

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

19.10.8. Emergency Restore Procedure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

19.10.8.1. Before the Disaster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are four steps which should be performed in preparation for any
disaster that may occur.

First, print the bsdlabel of each disk using a command such as
``bsdlabel da0 | lpr``. Also print a copy of ``/etc/fstab`` and all boot
messages.

Second, burn a ?livefs? CD. This CD contains support for booting into a
FreeBSD ?livefs? rescue mode, allowing the user to perform many tasks
like running
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__,
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__,
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__,
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__,
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__,
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__,
and more. The livefs CD image for FreeBSD/i386?9.3-RELEASE is available
from
``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/ISO-IMAGES/9.3/FreeBSD-9.3-RELEASE-i386-livefs.iso``.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Livefs CD images are not available for FreeBSD?10.1-RELEASE and later.
In addition to the CD-ROM installation images, flash drive installation
images may be used to recover a system. The ?memstick? image for
FreeBSD/i386?10.1-RELEASE is available from
``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/i386/ISO-IMAGES/10.1/FreeBSD-10.1-RELEASE-i386-memstick.img``.

.. raw:: html

   </div>

Third, create backup tapes regularly. Any changes that made after the
last backup may be irretrievably lost. Write-protect the backup media.

Fourth, test the ?livefs? CD and the backups. Make notes of the
procedure. Store these notes with the CD, the printouts, and the
backups. These notes may prevent the inadvertent destruction of the
backups while under the stress of performing an emergency recovery.

For an added measure of security, store an extra ?livefs? CD and the
latest backup at a remote location, where a remote location is *not* the
basement of the same building. A remote location should be physically
separated from the computers and disk drives by a significant distance.

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

19.10.8.2. After the Disaster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, determine if the hardware survived. Thanks to regular, off-site
backups, there is no need to worry about the software.

If the hardware has been damaged, the parts should be replaced before
attempting to use the computer.

If the hardware is okay, insert the ?livefs? CD and boot the computer.
The original install menu will be displayed on the screen. Select the
correct country, then choose Fixit -- Repair mode with CD-ROM/DVD/floppy
or start a shell. then select CD-ROM/DVD -- Use the live filesystem
CD-ROM/DVD. ``restore`` and the other needed programs are located in
``/mnt2/rescue``.

Recover each file system separately.

Try to ``mount`` the root partition of the first disk using
``mount /dev/da0a         /mnt``. If the bsdlabel was damaged, use
``bsdlabel`` to re-partition and label the disk to match the label that
was printed and saved. Use ``newfs`` to re-create the file systems.
Re-mount the root partition of the disk read-write using
``mount -u -o rw /mnt``. Use the backups to recover the data for this
file system. Unmount the file system with ``umount /mnt``. Repeat for
each file system that was damaged.

Once the system is running, backup the data onto new media as whatever
caused the crash or data loss may strike again. Another hour spent now
may save further distress later.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+---------------------------------------------------------+
| `????? <backup-strategies.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <disks-virtual.html>`__                     |
+---------------------------------------+-------------------------+---------------------------------------------------------+
| 19.9. Backup Strategies?              | `???? <index.html>`__   | ?19.11. Network, Memory, and File-Backed File Systems   |
+---------------------------------------+-------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
