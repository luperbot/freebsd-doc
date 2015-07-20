=========================
19.13. File System Quotas
=========================

.. raw:: html

   <div class="navheader">

19.13. File System Quotas
`????? <snapshots.html>`__?
???????? 19. ???????????? ????
?\ `??????? <disks-encrypting.html>`__

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

19.13. File System Quotas
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quotas are an optional feature of the operating system that can be used
to limit the amount of disk space or the number of files a user or
members of a group may allocate on a per-file system basis. This is used
most often on timesharing systems where it is desirable to limit the
amount of resources any one user or group of users may allocate. This
prevents one user or group of users from consuming all of the available
disk space.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.13.1. Configuring the System to Enable Disk Quotas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before using disk quotas, quota support must be added to the kernel by
adding the following line to the kernel configuration file:

.. code:: programlisting

    options QUOTA

Before FreeBSD?9.2, the ``GENERIC`` kernel usually did not include this
option. ``sysctl kern.features.ufs_quota`` can be used to test whether
the current kernel supports quotas. If the option is not present, a
custom kernel must be compiled. Refer to `?????????9, *??????????? ???
?????? ??? FreeBSD* <kernelconfig.html>`__ for more information on
kernel configuration.

Next, enable disk quotas in ``/etc/rc.conf``:

.. code:: programlisting

    quota_enable="YES"

For finer control over quota startup, an additional configuration
variable is available. Normally on bootup, the quota integrity of each
file system is checked by
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__.
This program insures that the data in the quota database properly
reflects the data on the file system. This is a time consuming process
that will significantly affect the time the system takes to boot. To
skip this step, add this variable to ``/etc/rc.conf``:

.. code:: programlisting

    check_quotas="NO"

Finally, edit ``/etc/fstab`` to enable disk quotas on a per-file system
basis. This is when user or group quotas can be enabled on the file
systems.

To enable per-user quotas on a file system, add ``userquota`` to the
options field in the ``/etc/fstab`` entry for the file system to enable
quotas on. For example:

.. code:: programlisting

    /dev/da1s2g   /home    ufs rw,userquota 1 2

To enable group quotas, instead use ``groupquota``. To enable both user
and group quotas, change the entry as follows:

.. code:: programlisting

    /dev/da1s2g    /home    ufs rw,userquota,groupquota 1 2

By default, the quota files are stored in the root directory of the file
system as ``quota.user`` and ``quota.group``. Refer to
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
for more information. Even though an alternate location for the quota
files can be specified, this is not recommended because the various
quota utilities do not seem to handle this properly.

Once the configuration is complete, reboot the system with the new
kernel. ``/etc/rc`` will automatically run the appropriate commands to
create the initial quota files for all of the quotas enabled in
``/etc/fstab``. There is no need to manually create any zero length
quota files.

In the normal course of operations, there should be no need to manually
run
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__,
`quotaon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaon&sektion=8>`__,
or
`quotaoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaoff&sektion=8>`__.
However, one should read their manual pages to be familiar with their
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

19.13.2. Setting Quota Limits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the system has been configured to enable quotas, verify they really
are enabled by running:

.. code:: screen

    # quota -v

There should be a one line summary of disk usage and current quota
limits for each file system that quotas are enabled on.

The system is now ready to be assigned quota limits with
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.

Several options are available to enforce limits on the amount of disk
space a user or group may allocate, and how many files they may create.
Allocations can be limited based on disk space (block quotas), number of
files (inode quotas), or a combination of both. Each limits is further
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

The following is an example output from
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.
When
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__
is invoked, the editor specified by ``EDITOR`` is opened in order to
edit the quota limits. The default editor is set to vi.

.. code:: screen

    # edquota -u test

.. code:: programlisting

    Quotas for user test:
    /usr: kbytes in use: 65, limits (soft = 50, hard = 75)
            inodes in use: 7, limits (soft = 50, hard = 60)
    /usr/var: kbytes in use: 0, limits (soft = 50, hard = 75)
            inodes in use: 0, limits (soft = 50, hard = 60)

There are normally two lines for each file system that has quotas
enabled. One line represents the block limits and the other represents
the inode limits. Change the value to modify the quota limit. For
example, to raise this user's block limit from a soft limit of 50 and a
hard limit of 75 to a soft limit of 500 and a hard limit of 600, change:

.. code:: programlisting

    /usr: kbytes in use: 65, limits (soft = 50, hard = 75)

to:

.. code:: programlisting

    /usr: kbytes in use: 65, limits (soft = 500, hard = 600)

The new quota limits take affect upon exiting the editor.

Sometimes it is desirable to set quota limits on a range of UIDs. This
can be done by passing ``-p`` to
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.
First, assign the desired quota limit to a user, then run
``edquota -p protouser startuid-enduid``. For example, if ``test`` has
the desired quota limits, the following command will duplicate those
quota limits for UIDs 10,000 through 19,999:

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

19.13.3. Checking Quota Limits and Disk Usage
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Either
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
or
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8>`__
can be used to check quota limits and disk usage. To check individual
user or group quotas and disk usage, use
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__.
A user may only examine their own quota and the quota of a group they
are a member of. Only the superuser may view all user and group quotas.
To get a summary of all quotas and disk usage for file systems with
quotas enabled, use
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8>`__.

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

Normally, file systems that the user is not using any disk space on will
not show in the output of
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__,
even if the user has a quota limit assigned for that file system. Use
``-v`` to display those file systems, such as ``/usr/var`` in the above
example.

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

19.13.4. Quotas over NFS
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quotas are enforced by the quota subsystem on the NFS server. The
`rpc.rquotad(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.rquotad&sektion=8>`__
daemon makes quota information available to
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
on NFS clients, allowing users on those machines to see their quota
statistics.

Enable ``rpc.rquotad`` in ``/etc/inetd.conf`` like so:

.. code:: programlisting

    rquotad/1      dgram rpc/udp wait root /usr/libexec/rpc.rquotad rpc.rquotad

Now restart ``inetd``:

.. code:: screen

    # service inetd restart

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+------------------------------------------+
| `????? <snapshots.html>`__?     | `???? <disks.html>`__   | ?\ `??????? <disks-encrypting.html>`__   |
+---------------------------------+-------------------------+------------------------------------------+
| 19.12. File System Snapshots?   | `???? <index.html>`__   | ?19.14. Encrypting Disk Partitions       |
+---------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
