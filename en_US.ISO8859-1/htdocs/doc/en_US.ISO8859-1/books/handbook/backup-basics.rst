===================
18.8.?Backup Basics
===================

.. raw:: html

   <div class="navheader">

18.8.?Backup Basics
`Prev <floppies.html>`__?
Chapter?18.?Storage
?\ `Next <disks-virtual.html>`__

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

18.8.?Backup Basics
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Implementing a backup plan is essential in order to have the ability to
recover from disk failure, accidental file deletion, random file
corruption, or complete machine destruction, including destruction of
on-site backups.

The backup type and schedule will vary, depending upon the importance of
the data, the granularity needed for file restores, and the amount of
acceptable downtime. Some possible backup techniques include:

.. raw:: html

   <div class="itemizedlist">

-  Archives of the whole system, backed up onto permanent, off-site
   media. This provides protection against all of the problems listed
   above, but is slow and inconvenient to restore from, especially for
   non-privileged users.

-  File system snapshots, which are useful for restoring deleted files
   or previous versions of files.

-  Copies of whole file systems or disks which are sychronized with
   another system on the network using a scheduled
   `net/rsync <http://www.freebsd.org/cgi/url.cgi?ports/net/rsync/pkg-descr>`__.

-  Hardware or software RAID, which minimizes or avoids downtime when a
   disk fails.

.. raw:: html

   </div>

Typically, a mix of backup techniques is used. For example, one could
create a schedule to automate a weekly, full system backup that is
stored off-site and to supplement this backup with hourly ZFS snapshots.
In addition, one could make a manual backup of individual directories or
files before making file edits or deletions.

This section describes some of the utilities which can be used to create
and manage backups on a FreeBSD system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.8.1.?File System Backups
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The traditional UNIX? programs for backing up a file system are
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__,
which creates the backup, and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__,
which restores the backup. These utilities work at the disk block level,
below the abstractions of the files, links, and directories that are
created by file systems. Unlike other backup software, ``dump`` backs up
an entire file system and is unable to backup only part of a file system
or a directory tree that spans multiple file systems. Instead of writing
files and directories, ``dump`` writes the raw data blocks that comprise
files and directories.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If ``dump`` is used on the root directory, it will not back up
``/home``, ``/usr`` or many other directories since these are typically
mount points for other file systems or symbolic links into those file
systems.

.. raw:: html

   </div>

When used to restore data, ``restore`` stores temporary files in
``/tmp/`` by default. When using a recovery disk with a small ``/tmp``,
set ``TMPDIR`` to a directory with more free space in order for the
restore to succeed.

When using ``dump``, be aware that some quirks remain from its early
days in Version 6 of AT&T UNIX?,circa 1975. The default parameters
assume a backup to a 9-track tape, rather than to another type of media
or to the high-density tapes available today. These defaults must be
overridden on the command line.

It is possible to backup a file system across the network to a another
system or to a tape drive attached to another computer. While the
`rdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rdump&sektion=8>`__
and
`rrestore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rrestore&sektion=8>`__
utilities can be used for this purpose, they are not considered to be
secure.

Instead, one can use ``dump`` and ``restore`` in a more secure fashion
over an SSH connection. This example creates a full, compressed backup
of ``/usr`` and sends the backup file to the specified host over a SSH
connection.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?18.1.?Using ``dump`` over ssh

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

This example sets ``RSH`` in order to write the backup to a tape drive
on a remote system over a SSH connection:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?18.2.?Using ``dump`` over ssh with ``RSH`` Set

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

18.8.2.?Directory Backups
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several built-in utilities are available for backing up and restoring
specified files and directories as needed.

A good choice for making a backup of all of the files in a directory is
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__.
This utility dates back to Version 6 of AT&T UNIX? and by default
assumes a recursive backup to a local tape device. Switches can be used
to instead specify the name of a backup file.

This example creates a compressed backup of the current directory and
saves it to ``/tmp/mybackup.tgz``. When creating a backup file, make
sure that the backup is not saved to the same directory that is being
backed up.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?18.3.?Backing Up the Current Directory with ``tar``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # tar czvf /tmp/mybackup.tgz . 

.. raw:: html

   </div>

.. raw:: html

   </div>

To restore the entire backup, ``cd`` into the directory to restore into
and specify the name of the backup. Note that this will overwrite any
newer versions of files in the restore directory. When in doubt, restore
to a temporary directory or specify the name of the file within the
backup to restore.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?18.4.?Restoring Up the Current Directory with ``tar``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # tar xzvf /tmp/mybackup.tgz

.. raw:: html

   </div>

.. raw:: html

   </div>

There are dozens of available switches which are described in
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__.
This utility also supports the use of exclude patterns to specify which
files should not be included when backing up the specified directory or
restoring files from a backup.

To create a backup using a specified list of files and directories,
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__ is
a good choice. Unlike ``tar``, ``cpio`` does not know how to walk the
directory tree and it must be provided the list of files to backup.

For example, a list of files can be created using ``ls`` or ``find``.
This example creates a recursive listing of the current directory which
is then piped to ``cpio`` in order to create an output backup file named
``/tmp/mybackup.cpio``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?18.5.?Using\ ``ls`` and ``cpio`` to Make a Recursive Backup of
the Current Directory

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # ls -R | cpio -ovF /tmp/mybackup.cpio

.. raw:: html

   </div>

.. raw:: html

   </div>

A backup utility which tries to bridge the features provided by ``tar``
and ``cpio`` is
`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1>`__.
Over the years, the various versions of ``tar`` and ``cpio`` became
slightly incompatible. POSIX? created ``pax`` which attempts to read and
write many of the various ``cpio`` and ``tar`` formats, plus new formats
of its own.

The ``pax`` equivalent to the previous examples would be:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?18.6.?Backing Up the Current Directory with ``pax``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pax -wf /tmp/mybackup.pax .

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

18.8.3.?Using Data Tapes for Backups
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While tape technology has continued to evolve, modern backup systems
tend to combine off-site backups with local removable media. FreeBSD
supports any tape drive that uses SCSI, such as LTO or DAT. There is
limited support for SATA and USB tape drives.

For SCSI tape devices, FreeBSD uses the
`sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4>`__ driver
and the ``/dev/sa0``, ``/dev/nsa0``, and ``/dev/esa0`` devices. The
physical device name is ``/dev/sa0``. When ``/dev/nsa0`` is used, the
backup application will not rewind the tape after writing a file, which
allows writing more than one file to a tape. Using ``/dev/esa0`` ejects
the tape after the device is closed.

In FreeBSD, ``mt`` is used to control operations of the tape drive, such
as seeking through files on a tape or writing tape control marks to the
tape. For example, the first three files on a tape can be preserved by
skipping past them before writing a new file:

.. code:: screen

    # mt -f /dev/nsa0 fsf 3

This utility supports many operations. Refer to
`mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1>`__ for
details.

To write a single file to tape using ``tar``, specify the name of the
tape device and the file to backup:

.. code:: screen

    # tar cvf /dev/sa0 file

To recover files from a ``tar`` archive on tape into the current
directory:

.. code:: screen

    # tar xvf /dev/sa0

To backup a UFS file system, use ``dump``. This examples backs up
``/usr`` without rewinding the tape when finished:

.. code:: screen

    # dump -0aL -b64 -f /dev/nsa0 /usr

To interactively restore files from a ``dump`` file on tape into the
current directory:

.. code:: screen

    # restore -i -f /dev/nsa0

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

18.8.4.?Third-Party Backup Utilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD Ports Collection provides many third-party utilities which
can be used to schedule the creation of backups, simplify tape backup,
and make backups easier and more convenient. Many of these applications
are client/server based and can be used to automate the backups of a
single system or all of the computers in a network.

Popular utilities include Amanda, Bacula, rsync, and duplicity.

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

18.8.5.?Emergency Recovery
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In addition to regular backups, it is recommended to perform the
following steps as part of an emergency preparedness plan.

Create a print copy of the output of the following commands:

.. raw:: html

   <div class="itemizedlist">

-  ``gpart show``

-  ``more /etc/fstab``

-  ``dmesg``

.. raw:: html

   </div>

Store this printout and a copy of the installation media in a secure
location. Should an emergency restore be needed, boot into the
installation media and select ``Live CD`` to access a rescue shell. This
rescue mode can be used to view the current state of the system, and if
needed, to reformat disks and restore data from backups.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The installation media for FreeBSD/i386?9.3-RELEASE does not include a
rescue shell. For this version, instead download and burn a Livefs CD
image from
``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/ISO-IMAGES/9.3/FreeBSD-9.3-RELEASE-i386-livefs.iso``.

.. raw:: html

   </div>

Next, test the rescue shell and the backups. Make notes of the
procedure. Store these notes with the media, the printouts, and the
backups. These notes may prevent the inadvertent destruction of the
backups while under the stress of performing an emergency recovery.

For an added measure of security, store the latest backup at a remote
location which is physically separated from the computers and disk
drives by a significant distance.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+------------------------------------+
| `Prev <floppies.html>`__?                | `Up <disks.html>`__     | ?\ `Next <disks-virtual.html>`__   |
+------------------------------------------+-------------------------+------------------------------------+
| 18.7.?Creating and Using Floppy Disks?   | `Home <index.html>`__   | ?18.9.?Memory Disks                |
+------------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
