===============================
29.3.?Network File System (NFS)
===============================

.. raw:: html

   <div class="navheader">

29.3.?Network File System (NFS)
`Prev <network-inetd.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-nis.html>`__

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

29.3.?Network File System (NFS)
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

FreeBSD supports the Network File System (NFS), which allows a server to
share directories and files with clients over a network. With NFS, users
and programs can access files on remote systems as if they were stored
locally.

NFS has many practical uses. Some of the more common uses include:

.. raw:: html

   <div class="itemizedlist">

-  Data that would otherwise be duplicated on each client can be kept in
   a single location and accessed by clients on the network.

-  Several clients may need access to the ``/usr/ports/distfiles``
   directory. Sharing that directory allows for quick access to the
   source files without having to download them to each client.

-  On large networks, it is often more convenient to configure a central
   NFS server on which all user home directories are stored. Users can
   log into a client anywhere on the network and have access to their
   home directories.

-  Administration of NFS exports is simplified. For example, there is
   only one file system where security or backup policies must be set.

-  Removable media storage devices can be used by other machines on the
   network. This reduces the number of devices throughout the network
   and provides a centralized location to manage their security. It is
   often more convenient to install software on multiple machines from a
   centralized installation media.

.. raw:: html

   </div>

NFS consists of a server and one or more clients. The client remotely
accesses the data that is stored on the server machine. In order for
this to function properly, a few processes have to be configured and
running.

These daemons must be running on the server:

.. raw:: html

   <div class="informaltable">

+-----------+----------------------------------------------------------------------------------+
| Daemon    | Description                                                                      |
+===========+==================================================================================+
| nfsd      | The NFS daemon which services requests from NFS clients.                         |
+-----------+----------------------------------------------------------------------------------+
| mountd    | The NFS mount daemon which carries out requests received from nfsd.              |
+-----------+----------------------------------------------------------------------------------+
| rpcbind   | This daemon allows NFS clients to discover which port the NFS server is using.   |
+-----------+----------------------------------------------------------------------------------+

.. raw:: html

   </div>

Running
`nfsiod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsiod&sektion=8>`__
on the client can improve performance, but is not required.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.3.1.?Configuring the Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The file systems which the NFS server will share are specified in
``/etc/exports``. Each line in this file specifies a file system to be
exported, which clients have access to that file system, and any access
options. When adding entries to this file, each exported file system,
its properties, and allowed hosts must occur on a single line. If no
clients are listed in the entry, then any client on the network can
mount that file system.

The following ``/etc/exports`` entries demonstrate how to export file
systems. The examples can be modified to match the file systems and
client names on the reader's network. There are many options that can be
used in this file, but only a few will be mentioned here. See
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5>`__
for the full list of options.

This example shows how to export ``/cdrom`` to three hosts named
*``alpha``*, *``bravo``*, and *``charlie``*:

.. code:: programlisting

    /cdrom -ro alpha bravo charlie

The ``-ro`` flag makes the file system read-only, preventing clients
from making any changes to the exported file system. This example
assumes that the host names are either in DNS or in ``/etc/hosts``.
Refer to
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
if the network does not have a DNS server.

The next example exports ``/home`` to three clients by IP address. This
can be useful for networks without DNS or ``/etc/hosts`` entries. The
``-alldirs`` flag allows subdirectories to be mount points. In other
words, it will not automatically mount the subdirectories, but will
permit the client to mount the directories that are required as needed.

.. code:: programlisting

    /home  -alldirs  10.0.0.2 10.0.0.3 10.0.0.4

This next example exports ``/a`` so that two clients from different
domains may access that file system. The ``-maproot=root`` allows
``root`` on the remote system to write data on the exported file system
as ``root``. If ``-maproot=root`` is not specified, the client's
``root`` user will be mapped to the server's ``nobody`` account and will
be subject to the access limitations defined for ``nobody``.

.. code:: programlisting

    /a  -maproot=root  host.example.com box.example.org

A client can only be specified once per file system. For example, if
``/usr`` is a single file system, these entries would be invalid as both
entries specify the same host:

.. code:: programlisting

    # Invalid when /usr is one file system
    /usr/src   client
    /usr/ports client

The correct format for this situation is to use one entry:

.. code:: programlisting

    /usr/src /usr/ports  client

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

To enable the processes required by the NFS server at boot time, add
these options to ``/etc/rc.conf``:

.. code:: programlisting

    rpcbind_enable="YES"
    nfs_server_enable="YES"
    mountd_flags="-r"

The server can be started now by running this command:

.. code:: screen

    # service nfsd start

Whenever the NFS server is started, mountd also starts automatically.
However, mountd only reads ``/etc/exports`` when it is started. To make
subsequent ``/etc/exports`` edits take effect immediately, force mountd
to reread it:

.. code:: screen

    # service mountd reload

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

29.3.2.?Configuring the Client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable NFS clients, set this option in each client's
``/etc/rc.conf``:

.. code:: programlisting

    nfs_client_enable="YES"

Then, run this command on each NFS client:

.. code:: screen

    # service nfsclient start

The client now has everything it needs to mount a remote file system. In
these examples, the server's name is ``server`` and the client's name is
``client``. To mount ``/home`` on ``server`` to the ``/mnt`` mount point
on ``client``:

.. code:: screen

    # mount server:/home /mnt

The files and directories in ``/home`` will now be available on
``client``, in the ``/mnt`` directory.

To mount a remote file system each time the client boots, add it to
``/etc/fstab``:

.. code:: programlisting

    server:/home /mnt    nfs rw  0   0

Refer to
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
for a description of all available options.

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

29.3.3.?Locking
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some applications require file locking to operate correctly. To enable
locking, add these lines to ``/etc/rc.conf`` on both the client and
server:

.. code:: programlisting

    rpc_lockd_enable="YES"
    rpc_statd_enable="YES"

Then start the applications:

.. code:: screen

    # service lockd start
    # service statd start

If locking is not required on the server, the NFS client can be
configured to lock locally by including ``-L`` when running mount. Refer
to
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8>`__
for further details.

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

29.3.4.?Automating Mounts with `amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

The automatic mounter daemon, amd, automatically mounts a remote file
system whenever a file or directory within that file system is accessed.
File systems that are inactive for a period of time will be
automatically unmounted by amd.

This daemon provides an alternative to modifying ``/etc/fstab`` to list
every client. It operates by attaching itself as an NFS server to the
``/host`` and ``/net`` directories. When a file is accessed within one
of these directories, amd looks up the corresponding remote mount and
automatically mounts it. ``/net`` is used to mount an exported file
system from an IP address while ``/host`` is used to mount an export
from a remote hostname. For instance, an attempt to access a file within
``/host/foobar/usr`` would tell amd to mount the ``/usr`` export on the
host ``foobar``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?29.2.?Mounting an Export with amd

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

In this example, ``showmount -e`` shows the exported file systems that
can be mounted from the NFS server, ``foobar``:

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

The output from ``showmount`` shows ``/usr`` as an export. When changing
directories to ``/host/foobar/usr``, amd intercepts the request and
attempts to resolve the hostname ``foobar``. If successful, amd
automatically mounts the desired export.

To enable amd at boot time, add this line to ``/etc/rc.conf``:

.. code:: programlisting

    amd_enable="YES"

To start amd now:

.. code:: screen

    # service amd start

Custom flags can be passed to amd from the ``amd_flags`` environment
variable. By default, ``amd_flags`` is set to:

.. code:: programlisting

    amd_flags="-a /.amd_mnt -l syslog /host /etc/amd.map /net /etc/amd.map"

The default options with which exports are mounted are defined in
``/etc/amd.map``. Some of the more advanced features of amd are defined
in ``/etc/amd.conf``.

Consult
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__ and
`amd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=amd.conf&sektion=5>`__
for more information.

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

29.3.5.?Automating Mounts with `autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
automount facility is supported starting with FreeBSD?10.1-RELEASE. To
use the automounter functionality in older versions of FreeBSD, use
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__
instead. This chapter only describes the
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
automounter.

.. raw:: html

   </div>

The
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
facility is a common name for several components that, together, allow
for automatic mounting of remote and local filesystems whenever a file
or directory within that file system is accessed. It consists of the
kernel component,
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__,
and several userspace applications:
`automount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automount&sektion=8>`__,
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__
and
`autounmountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=autounmountd&sektion=8>`__.
It serves as an alternative for
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__ from
previous FreeBSD releases. Amd is still provided for backward
compatibility purposes, as the two use different map format; the one
used by autofs is the same as with other SVR4 automounters, such as the
ones in Solaris, MacOS X, and Linux.

The
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
virtual filesystem is mounted on specified mountpoints by
`automount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automount&sektion=8>`__,
usually invoked during boot.

Whenever a process attempts to access file within the
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
mountpoint, the kernel will notify
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__
daemon and pause the triggering process. The
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__
daemon will handle kernel requests by finding the proper map and
mounting the filesystem according to it, then signal the kernel to
release blocked process. The
`autounmountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=autounmountd&sektion=8>`__
daemon automatically unmounts automounted filesystems after some time,
unless they are still being used.

The primary autofs configuration file is ``/etc/auto_master``. It
assigns individual maps to top-level mounts. For an explanation of
``auto_master`` and the map syntax, refer to
`auto\_master(5) <http://www.FreeBSD.org/cgi/man.cgi?query=auto_master&sektion=5>`__.

There is a special automounter map mounted on ``/net``. When a file is
accessed within this directory,
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
looks up the corresponding remote mount and automatically mounts it. For
instance, an attempt to access a file within ``/net/foobar/usr`` would
tell
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__
to mount the ``/usr`` export from the host ``foobar``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?29.3.?Mounting an Export with
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

In this example, ``showmount -e`` shows the exported file systems that
can be mounted from the NFS server, ``foobar``:

.. code:: screen

    % showmount -e foobar
    Exports list on foobar:
    /usr                               10.10.10.0
    /a                                 10.10.10.0
    % cd /net/foobar/usr

.. raw:: html

   </div>

.. raw:: html

   </div>

The output from ``showmount`` shows ``/usr`` as an export. When changing
directories to ``/host/foobar/usr``,
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__
intercepts the request and attempts to resolve the hostname ``foobar``.
If successful,
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__
automatically mounts the source export.

To enable
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
at boot time, add this line to ``/etc/rc.conf``:

.. code:: programlisting

    autofs_enable="YES"

Then
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
can be started by running:

.. code:: screen

    # service automount start
    # service automountd start
    # service autounmountd start

The
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
map format is the same as in other operating systems, it might be
desirable to consult information from other operating systems, such as
the `Mac OS X
document <http://images.apple.com/business/docs/Autofs.pdf>`__.

Consult the
`automount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automount&sektion=8>`__,
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__,
`autounmountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=autounmountd&sektion=8>`__,
and
`auto\_master(5) <http://www.FreeBSD.org/cgi/man.cgi?query=auto_master&sektion=5>`__
manual pages for more information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------+-------------------------------------------+
| `Prev <network-inetd.html>`__?   | `Up <network-servers.html>`__   | ?\ `Next <network-nis.html>`__            |
+----------------------------------+---------------------------------+-------------------------------------------+
| 29.2.?The inetd Super-Server?    | `Home <index.html>`__           | ?29.4.?Network Information System (NIS)   |
+----------------------------------+---------------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
