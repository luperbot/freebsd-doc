===============================
29.3. Network File System (NFS)
===============================

.. raw:: html

   <div class="navheader">

29.3. Network File System (NFS)
`????? <network-inetd.html>`__?
???????? 29. ???????????? ???????
?\ `??????? <network-nis.html>`__

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

29.3. Network File System (NFS)
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganized and enhanced by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Among the many different file systems that FreeBSD supports is the
Network File System, also known as NFS. NFS allows a system to share
directories and files with others over a network. By using NFS, users
and programs can access files on remote systems almost as if they were
local files.

Some of the most notable benefits that NFS can provide are:

.. raw:: html

   <div class="itemizedlist">

-  Local workstations use less disk space because commonly used data can
   be stored on a single machine and still remain accessible to others
   over the network.

-  There is no need for users to have separate home directories on every
   network machine. Home directories could be set up on the NFS server
   and made available throughout the network.

-  Storage devices such as floppy disks, CDROM drives, and Zip(R) drives
   can be used by other machines on the network. This may reduce the
   number of removable media drives throughout the network.

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

29.3.1. How NFS Works
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NFS consists of at least two main parts: a server and one or more
clients. The client remotely accesses the data that is stored on the
server machine. In order for this to function properly a few processes
have to be configured and running.

The server has to be running the following daemons:

.. raw:: html

   <div class="informaltable">

+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| Daemon    | Description                                                                                                                                       |
+===========+===================================================================================================================================================+
| nfsd      | The NFS daemon which services requests from the NFS clients.                                                                                      |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| mountd    | The NFS mount daemon which carries out the requests that `nfsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsd&sektion=8>`__ passes on to it.   |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| rpcbind   | This daemon allows NFS clients to discover which port the NFS server is using.                                                                    |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

The client can also run a daemon, known as nfsiod. The nfsiod daemon
services the requests from the NFS server. This is optional, and
improves performance, but is not required for normal and correct
operation. See the
`nfsiod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsiod&sektion=8>`__
manual page for more information.

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

29.3.2. Configuring NFS
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NFS configuration is a relatively straightforward process. The processes
that need to be running can all start at boot time with a few
modifications to your ``/etc/rc.conf`` file.

On the NFS server, make sure that the following options are configured
in the ``/etc/rc.conf`` file:

.. code:: programlisting

    rpcbind_enable="YES"
    nfs_server_enable="YES"
    mountd_flags="-r"

mountd runs automatically whenever the NFS server is enabled.

On the client, make sure this option is present in ``/etc/rc.conf``:

.. code:: programlisting

    nfs_client_enable="YES"

The ``/etc/exports`` file specifies which file systems NFS should export
(sometimes referred to as ?share?). Each line in ``/etc/exports``
specifies a file system to be exported and which machines have access to
that file system. Along with what machines have access to that file
system, access options may also be specified. There are many such
options that can be used in this file but only a few will be mentioned
here. You can easily discover other options by reading over the
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5>`__
manual page.

Here are a few example ``/etc/exports`` entries:

The following examples give an idea of how to export file systems,
although the settings may be different depending on your environment and
network configuration. For instance, to export the ``/cdrom`` directory
to three example machines that have the same domain name as the server
(hence the lack of a domain name for each) or have entries in your
``/etc/hosts`` file. The ``-ro`` flag makes the exported file system
read-only. With this flag, the remote system will not be able to write
any changes to the exported file system.

.. code:: programlisting

    /cdrom -ro host1 host2 host3

The following line exports ``/home`` to three hosts by IP address. This
is a useful setup if you have a private network without a DNS server
configured. Optionally the ``/etc/hosts`` file could be configured for
internal hostnames; please review
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
for more information. The ``-alldirs`` flag allows the subdirectories to
be mount points. In other words, it will not mount the subdirectories
but permit the client to mount only the directories that are required or
needed.

.. code:: programlisting

    /home  -alldirs  10.0.0.2 10.0.0.3 10.0.0.4

The following line exports ``/a`` so that two clients from different
domains may access the file system. The ``-maproot=root`` flag allows
the ``root`` user on the remote system to write data on the exported
file system as ``root``. If the ``-maproot=root`` flag is not specified,
then even if a user has ``root`` access on the remote system, he will
not be able to modify files on the exported file system.

.. code:: programlisting

    /a  -maproot=root  host.example.com box.example.org

In order for a client to access an exported file system, the client must
have permission to do so. Make sure the client is listed in your
``/etc/exports`` file.

In ``/etc/exports``, each line represents the export information for one
file system to one host. A remote host can only be specified once per
file system, and may only have one default entry. For example, assume
that ``/usr`` is a single file system. The following ``/etc/exports``
would be invalid:

.. code:: programlisting

    # Invalid when /usr is one file system
    /usr/src   client
    /usr/ports client

One file system, ``/usr``, has two lines specifying exports to the same
host, ``client``. The correct format for this situation is:

.. code:: programlisting

    /usr/src /usr/ports  client

The properties of one file system exported to a given host must all
occur on one line. Lines without a client specified are treated as a
single host. This limits how you can export file systems, but for most
people this is not an issue.

The following is an example of a valid export list, where ``/usr`` and
``/exports`` are local file systems:

.. code:: programlisting

    # Export src and ports to client01 and client02, but only
    # client01 has root privileges on it
    /usr/src /usr/ports -maproot=root    client01
    /usr/src /usr/ports               client02
    # The client machines have root and can mount anywhere
    # on /exports. Anyone in the world can mount /exports/obj read-only
    /exports -alldirs -maproot=root      client01 client02
    /exports/obj -ro

The mountd daemon must be forced to recheck the ``/etc/exports`` file
whenever it has been modified, so the changes can take effect. This can
be accomplished either by sending a HUP signal to the running daemon:

.. code:: screen

    # kill -HUP `cat /var/run/mountd.pid`

or by invoking the ``mountd``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ script
with the appropriate parameter:

.. code:: screen

    # /etc/rc.d/mountd onereload

Please refer to `??????12.7, ???????????????? ?? ??????? rc ???
FreeBSD? <configtuning-rcd.html>`__ for more information about using rc
scripts.

Alternatively, a reboot will make FreeBSD set everything up properly. A
reboot is not necessary though. Executing the following commands as
``root`` should start everything up.

On the NFS server:

.. code:: screen

    # rpcbind
    # nfsd -u -t -n 4
    # mountd -r

On the NFS client:

.. code:: screen

    # nfsiod -n 4

Now everything should be ready to actually mount a remote file system.
In these examples the server's name will be ``server`` and the client's
name will be ``client``. If you only want to temporarily mount a remote
file system or would rather test the configuration, just execute a
command like this as ``root`` on the client:

.. code:: screen

    # mount server:/home /mnt

This will mount the ``/home`` directory on the server at ``/mnt`` on the
client. If everything is set up correctly you should be able to enter
``/mnt`` on the client and see all the files that are on the server.

If you want to automatically mount a remote file system each time the
computer boots, add the file system to the ``/etc/fstab`` file. Here is
an example:

.. code:: programlisting

    server:/home /mnt    nfs rw  0   0

The
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
manual page lists all the available options.

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

29.3.3. Locking
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some applications (e.g. mutt) require file locking to operate correctly.
In the case of NFS, rpc.lockd can be used for file locking. To enable
it, add the following to the ``/etc/rc.conf`` file on both client and
server (it is assumed that the NFS client and server are configured
already):

.. code:: programlisting

    rpc_lockd_enable="YES"
    rpc_statd_enable="YES"

Start the application by using:

.. code:: screen

    # /etc/rc.d/nfslocking start

If real locking between the NFS clients and NFS server is not required,
it is possible to let the NFS client do locking locally by passing
``-L`` to
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8>`__.
Refer to the
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8>`__
manual page for further details.

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

29.3.4. Practical Uses
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NFS has many practical uses. Some of the more common ones are listed
below:

.. raw:: html

   <div class="itemizedlist">

-  Set several machines to share a CDROM or other media among them. This
   is cheaper and often a more convenient method to install software on
   multiple machines.

-  On large networks, it might be more convenient to configure a central
   NFS server in which to store all the user home directories. These
   home directories can then be exported to the network so that users
   would always have the same home directory, regardless of which
   workstation they log in to.

-  Several machines could have a common ``/usr/ports/distfiles``
   directory. That way, when you need to install a port on several
   machines, you can quickly access the source without downloading it on
   each machine.

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

29.3.5. Automatic Mounts with amd
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Wylie Stilwell.

.. raw:: html

   </div>

.. raw:: html

   <div>

Rewritten by Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__ (the
automatic mounter daemon) automatically mounts a remote file system
whenever a file or directory within that file system is accessed.
Filesystems that are inactive for a period of time will also be
automatically unmounted by amd. Using amd provides a simple alternative
to permanent mounts, as permanent mounts are usually listed in
``/etc/fstab``.

amd operates by attaching itself as an NFS server to the ``/host`` and
``/net`` directories. When a file is accessed within one of these
directories, amd looks up the corresponding remote mount and
automatically mounts it. ``/net`` is used to mount an exported file
system from an IP address, while ``/host`` is used to mount an export
from a remote hostname.

An access to a file within ``/host/foobar/usr`` would tell amd to
attempt to mount the ``/usr`` export on the host ``foobar``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 29.2. Mounting an Export with amd

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

You can view the available mounts of a remote host with the
``showmount`` command. For example, to view the mounts of a host named
``foobar``, you can use:

.. code:: screen

    % showmount -e foobar
    Exports list on foobar:
    /usr                               10.10.10.0
    /a                                 10.10.10.0
    % cd /host/foobar/usr

.. raw:: html

   </div>

.. raw:: html

   </div>

As seen in the example, the ``showmount`` shows ``/usr`` as an export.
When changing directories to ``/host/foobar/usr``, amd attempts to
resolve the hostname ``foobar`` and automatically mount the desired
export.

amd can be started by the startup scripts by placing the following lines
in ``/etc/rc.conf``:

.. code:: programlisting

    amd_enable="YES"

Additionally, custom flags can be passed to amd from the ``amd_flags``
option. By default, ``amd_flags`` is set to:

.. code:: programlisting

    amd_flags="-a /.amd_mnt -l syslog /host /etc/amd.map /net /etc/amd.map"

The ``/etc/amd.map`` file defines the default options that exports are
mounted with. The ``/etc/amd.conf`` file defines some of the more
advanced features of amd.

Consult the
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__ and
`amd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=amd.conf&sektion=5>`__
manual pages for more information.

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

29.3.6. Problems Integrating with Other Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by John Lind.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Certain Ethernet adapters for ISA PC systems have limitations which can
lead to serious network problems, particularly with NFS. This difficulty
is not specific to FreeBSD, but FreeBSD systems are affected by it.

The problem nearly always occurs when (FreeBSD) PC systems are networked
with high-performance workstations, such as those made by Silicon
Graphics, Inc., and Sun Microsystems, Inc. The NFS mount will work fine,
and some operations may succeed, but suddenly the server will seem to
become unresponsive to the client, even though requests to and from
other systems continue to be processed. This happens to the client
system, whether the client is the FreeBSD system or the workstation. On
many systems, there is no way to shut down the client gracefully once
this problem has manifested itself. The only solution is often to reset
the client, because the NFS situation cannot be resolved.

Though the ?correct? solution is to get a higher performance and
capacity Ethernet adapter for the FreeBSD system, there is a simple
workaround that will allow satisfactory operation. If the FreeBSD system
is the *server*, include the option ``-w=1024`` on the mount from the
client. If the FreeBSD system is the *client*, then mount the NFS file
system with the option ``-r=1024``. These options may be specified using
the fourth field of the ``fstab`` entry on the client for automatic
mounts, or by using the ``-o`` parameter of the
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
command for manual mounts.

It should be noted that there is a different problem, sometimes mistaken
for this one, when the NFS servers and clients are on different
networks. If that is the case, make *certain* that your routers are
routing the necessary UDP information, or you will not get anywhere, no
matter what else you are doing.

In the following examples, ``fastws`` is the host (interface) name of a
high-performance workstation, and ``freebox`` is the host (interface)
name of a FreeBSD system with a lower-performance Ethernet adapter.
Also, ``/sharedfs`` will be the exported NFS file system (see
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5>`__),
and ``/project`` will be the mount point on the client for the exported
file system. In all cases, note that additional options, such as
``hard`` or ``soft`` and ``bg`` may be desirable in your application.

Examples for the FreeBSD system (``freebox``) as the client in
``/etc/fstab`` on ``freebox``:

.. code:: programlisting

    fastws:/sharedfs /project nfs rw,-r=1024 0 0

As a manual mount command on ``freebox``:

.. code:: screen

    # mount -t nfs -o -r=1024 fastws:/sharedfs /project

Examples for the FreeBSD system as the server in ``/etc/fstab`` on
``fastws``:

.. code:: programlisting

    freebox:/sharedfs /project nfs rw,-w=1024 0 0

As a manual mount command on ``fastws``:

.. code:: screen

    # mount -t nfs -o -w=1024 freebox:/sharedfs /project

Nearly any 16-bit Ethernet adapter will allow operation without the
above restrictions on the read or write size.

For anyone who cares, here is what happens when the failure occurs,
which also explains why it is unrecoverable. NFS typically works with a
?block? size of 8?K (though it may do fragments of smaller sizes). Since
the maximum Ethernet packet is around 1500?bytes, the NFS ?block? gets
split into multiple Ethernet packets, even though it is still a single
unit to the upper-level code, and must be received, assembled, and
*acknowledged* as a unit. The high-performance workstations can pump out
the packets which comprise the NFS unit one right after the other, just
as close together as the standard allows. On the smaller, lower capacity
cards, the later packets overrun the earlier packets of the same unit
before they can be transferred to the host and the unit as a whole
cannot be reconstructed or acknowledged. As a result, the workstation
will time out and try again, but it will try again with the entire 8?K
unit, and the process will be repeated, ad infinitum.

By keeping the unit size below the Ethernet packet size limitation, we
ensure that any complete Ethernet packet received can be acknowledged
individually, avoiding the deadlock situation.

Overruns may still occur when a high-performance workstations is
slamming data out to a PC system, but with the better cards, such
overruns are not guaranteed on NFS ?units?. When an overrun occurs, the
units affected will be retransmitted, and there will be a fair chance
that they will be received, assembled, and acknowledged.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-----------------------------------+----------------------------------------------+
| `????? <network-inetd.html>`__?   | `???? <network-servers.html>`__   | ?\ `??????? <network-nis.html>`__            |
+-----------------------------------+-----------------------------------+----------------------------------------------+
| 29.2. The inetd ?Super-Server??   | `???? <index.html>`__             | ?29.4. Network Information System (NIS/YP)   |
+-----------------------------------+-----------------------------------+----------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
