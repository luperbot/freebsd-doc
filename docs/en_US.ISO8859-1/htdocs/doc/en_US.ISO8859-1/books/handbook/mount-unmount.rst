=========================================
4.7.?Mounting and Unmounting File Systems
=========================================

.. raw:: html

   <div class="navheader">

4.7.?Mounting and Unmounting File Systems
`Prev <disk-organization.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <basics-processes.html>`__

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

4.7.?Mounting and Unmounting File Systems
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The file system is best visualized as a tree, rooted, as it were, at
``/``. ``/dev``, ``/usr``, and the other directories in the root
directory are branches, which may have their own branches, such as
``/usr/local``, and so on.

There are various reasons to house some of these directories on separate
file systems. ``/var`` contains the directories ``log/``, ``spool/``,
and various types of temporary files, and as such, may get filled up.
Filling up the root file system is not a good idea, so splitting
``/var`` from ``/`` is often favorable.

Another common reason to contain certain directory trees on other file
systems is if they are to be housed on separate physical disks, or are
separate virtual disks, such as Network File System mounts, described in
`Section?29.3, “Network File System (NFS)” <network-nfs.html>`__, or
CDROM drives.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.7.1.?The ``fstab`` File
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

During the boot process (`Chapter?13, *The FreeBSD Booting
Process* <boot.html>`__), file systems listed in ``/etc/fstab`` are
automatically mounted except for the entries containing ``noauto``. This
file contains entries in the following format:

.. code:: programlisting

    device       /mount-point fstype     options      dumpfreq     passno

.. raw:: html

   <div class="variablelist">

``device``
    An existing device name as explained in `Table?4.3, “Disk Device
    Names” <disk-organization.html#disks-naming>`__.

``mount-point``
    An existing directory on which to mount the file system.

``fstype``
    The file system type to pass to
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
    The default FreeBSD file system is ``ufs``.

``options``
    Either ``rw`` for read-write file systems, or ``ro`` for read-only
    file systems, followed by any other options that may be needed. A
    common option is ``noauto`` for file systems not normally mounted
    during the boot sequence. Other options are listed in
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.

``dumpfreq``
    Used by
    `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
    to determine which file systems require dumping. If the field is
    missing, a value of zero is assumed.

``passno``
    Determines the order in which file systems should be checked. File
    systems that should be skipped should have their ``passno`` set to
    zero. The root file system needs to be checked before everything
    else and should have its ``passno`` set to one. The other file
    systems should be set to values greater than one. If more than one
    file system has the same ``passno``,
    `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
    will attempt to check file systems in parallel if possible.

.. raw:: html

   </div>

Refer to
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
for more information on the format of ``/etc/fstab`` and its options.

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

4.7.2.?Using `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

File systems are mounted using
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
The most basic syntax is as follows:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mount device mountpoint

.. raw:: html

   </div>

This command provides many options which are described in
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__,
The most commonly used options include:

.. raw:: html

   <div class="variablelist">

.. raw:: html

   <div class="variablelist-title">

Mount Options

.. raw:: html

   </div>

``-a``
    Mount all the file systems listed in ``/etc/fstab``, except those
    marked as “noauto”, excluded by the ``-t`` flag, or those that are
    already mounted.

``-d``
    Do everything except for the actual mount system call. This option
    is useful in conjunction with the ``-v`` flag to determine what
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
    is actually trying to do.

``-f``
    Force the mount of an unclean file system (dangerous), or the
    revocation of write access when downgrading a file system's mount
    status from read-write to read-only.

``-r``
    Mount the file system read-only. This is identical to using
    ``-o ro``.

``-t`` *``fstype``*
    Mount the specified file system type or mount only file systems of
    the given type, if ``-a`` is included. “ufs” is the default file
    system type.

``-u``
    Update mount options on the file system.

``-v``
    Be verbose.

``-w``
    Mount the file system read-write.

.. raw:: html

   </div>

The following options can be passed to ``-o`` as a comma-separated list:

.. raw:: html

   <div class="variablelist">

nosuid
    Do not interpret setuid or setgid flags on the file system. This is
    also a useful security option.

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

4.7.3.?Using `umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To unmount a file system use
`umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__.
This command takes one parameter which can be a mountpoint, device name,
``-a`` or ``-A``.

All forms take ``-f`` to force unmounting, and ``-v`` for verbosity. Be
warned that ``-f`` is not generally a good idea as it might crash the
computer or damage data on the file system.

To unmount all mounted file systems, or just the file system types
listed after ``-t``, use ``-a`` or ``-A``. Note that ``-A`` does not
attempt to unmount the root file system.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+---------------------------------------+
| `Prev <disk-organization.html>`__?   | `Up <basics.html>`__    | ?\ `Next <basics-processes.html>`__   |
+--------------------------------------+-------------------------+---------------------------------------+
| 4.6.?Disk Organization?              | `Home <index.html>`__   | ?4.8.?Processes and Daemons           |
+--------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
