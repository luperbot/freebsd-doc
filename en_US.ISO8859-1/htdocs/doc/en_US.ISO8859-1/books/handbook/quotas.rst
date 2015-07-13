==================
18.11.?Disk Quotas
==================

.. raw:: html

   <div class="navheader">

18.11.?Disk Quotas
`Prev <snapshots.html>`__?
Chapter?18.?Storage
?\ `Next <disks-encrypting.html>`__

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

18.11.?Disk Quotas
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Disk quotas can be used to limit the amount of disk space or the number
of files a user or members of a group may allocate on a per-file system
basis. This prevents one user or group of users from consuming all of
the available disk space.

This section describes how to configure disk quotas for the UFS file
system. To configure quotas on the ZFS file system, refer to
`Section?20.4.8, “Dataset, User, and Group
Quotas” <zfs-zfs.html#zfs-zfs-quota>`__

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.11.1.?Enabling Disk Quotas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To determine if the FreeBSD kernel provides support for disk quotas:

.. code:: screen

    % sysctl kern.features.ufs_quota
    kern.features.ufs_quota: 1

In this example, the ``1`` indicates quota support. If the value is
instead ``0``, add the following line to a custom kernel configuration
file and rebuild the kernel using the instructions in `Chapter?9,
*Configuring the FreeBSD Kernel* <kernelconfig.html>`__:

.. code:: programlisting

    options QUOTA

Next, enable disk quotas in ``/etc/rc.conf``:

.. code:: programlisting

    quota_enable="YES"

Normally on bootup, the quota integrity of each file system is checked
by
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__.
This program insures that the data in the quota database properly
reflects the data on the file system. This is a time consuming process
that will significantly affect the time the system takes to boot. To
skip this step, add this variable to ``/etc/rc.conf``:

.. code:: programlisting

    check_quotas="NO"

Finally, edit ``/etc/fstab`` to enable disk quotas on a per-file system
basis. To enable per-user quotas on a file system, add ``userquota`` to
the options field in the ``/etc/fstab`` entry for the file system to
enable quotas on. For example:

.. code:: programlisting

    /dev/da1s2g   /home    ufs rw,userquota 1 2

To enable group quotas, use ``groupquota`` instead. To enable both user
and group quotas, separate the options with a comma:

.. code:: programlisting

    /dev/da1s2g    /home    ufs rw,userquota,groupquota 1 2

By default, quota files are stored in the root directory of the file
system as ``quota.user`` and ``quota.group``. Refer to
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
for more information. Specifying an alternate location for the quota
files is not recommended.

Once the configuration is complete, reboot the system and ``/etc/rc``
will automatically run the appropriate commands to create the initial
quota files for all of the quotas enabled in ``/etc/fstab``.

In the normal course of operations, there should be no need to manually
run
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__,
`quotaon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaon&sektion=8>`__,
or
`quotaoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaoff&sektion=8>`__.
However, one should read these manual pages to be familiar with their
operation.

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

18.11.2.?Setting Quota Limits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To verify that quotas are enabled, run:

.. code:: screen

    # quota -v

There should be a one line summary of disk usage and current quota
limits for each file system that quotas are enabled on.

The system is now ready to be assigned quota limits with ``edquota``.

Several options are available to enforce limits on the amount of disk
space a user or group may allocate, and how many files they may create.
Allocations can be limited based on disk space (block quotas), number of
files (inode quotas), or a combination of both. Each limit is further
broken down into two categories: hard and soft limits.

A hard limit may not be exceeded. Once a user reaches a hard limit, no
further allocations can be made on that file system by that user. For
example, if the user has a hard limit of 500 kbytes on a file system and
is currently using 490 kbytes, the user can only allocate an additional
10 kbytes. Attempting to allocate an additional 11 kbytes will fail.

Soft limits can be exceeded for a limited amount of time, known as the
grace period, which is one week by default. If a user stays over their
limit longer than the grace period, the soft limit turns into a hard
limit and no further allocations are allowed. When the user drops back
below the soft limit, the grace period is reset.

In the following example, the quota for the ``test`` account is being
edited. When ``edquota`` is invoked, the editor specified by ``EDITOR``
is opened in order to edit the quota limits. The default editor is set
to vi.

.. code:: screen

    # edquota -u test
    Quotas for user test:
    /usr: kbytes in use: 65, limits (soft = 50, hard = 75)
            inodes in use: 7, limits (soft = 50, hard = 60)
    /usr/var: kbytes in use: 0, limits (soft = 50, hard = 75)
            inodes in use: 0, limits (soft = 50, hard = 60)

There are normally two lines for each file system that has quotas
enabled. One line represents the block limits and the other represents
the inode limits. Change the value to modify the quota limit. For
example, to raise the block limit on ``/usr`` to a soft limit of ``500``
and a hard limit of ``600``, change the values in that line as follows:

.. code:: programlisting

    /usr: kbytes in use: 65, limits (soft = 500, hard = 600)

The new quota limits take affect upon exiting the editor.

Sometimes it is desirable to set quota limits on a range of users. This
can be done by first assigning the desired quota limit to a user. Then,
use ``-p`` to duplicate that quota to a specified range of user IDs
(UIDs). The following command will duplicate those quota limits for UIDs
``10,000`` through ``19,999``:

.. code:: screen

    # edquota -p test 10000-19999

For more information, refer to
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.

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

18.11.3.?Checking Quota Limits and Disk Usage
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To check individual user or group quotas and disk usage, use
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__.
A user may only examine their own quota and the quota of a group they
are a member of. Only the superuser may view all user and group quotas.
To get a summary of all quotas and disk usage for file systems with
quotas enabled, use
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8>`__.

Normally, file systems that the user is not using any disk space on will
not show in the output of ``quota``, even if the user has a quota limit
assigned for that file system. Use ``-v`` to display those file systems.
The following is sample output from ``quota -v`` for a user that has
quota limits on two file systems.

.. code:: programlisting

    Disk quotas for user test (uid 1002):
         Filesystem  usage    quota   limit   grace   files   quota   limit   grace
               /usr      65*     50      75   5days       7      50      60
           /usr/var       0      50      75               0      50      60

In this example, the user is currently 15 kbytes over the soft limit of
50 kbytes on ``/usr`` and has 5 days of grace period left. The asterisk
``*`` indicates that the user is currently over the quota limit.

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

18.11.4.?Quotas over NFS
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quotas are enforced by the quota subsystem on the NFS server. The
`rpc.rquotad(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.rquotad&sektion=8>`__
daemon makes quota information available to ``quota`` on NFS clients,
allowing users on those machines to see their quota statistics.

On the NFS server, enable ``rpc.rquotad`` by removing the ``#`` from
this line in ``/etc/inetd.conf``:

.. code:: programlisting

    rquotad/1      dgram rpc/udp wait root /usr/libexec/rpc.rquotad rpc.rquotad

Then, restart ``inetd``:

.. code:: screen

    # service inetd restart

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+---------------------------------------+
| `Prev <snapshots.html>`__?      | `Up <disks.html>`__     | ?\ `Next <disks-encrypting.html>`__   |
+---------------------------------+-------------------------+---------------------------------------+
| 18.10.?File System Snapshots?   | `Home <index.html>`__   | ?18.12.?Encrypting Disk Partitions    |
+---------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
