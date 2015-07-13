=================================
31.8.?Diskless Operation with PXE
=================================

.. raw:: html

   <div class="navheader">

31.8.?Diskless Operation with PXE
`Prev <network-aggregation.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <network-ipv6.html>`__

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

31.8.?Diskless Operation with PXE
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated by Jean-Fran?ois Dock?s.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganized and enhanced by Alex Dupre.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Intel? Preboot eXecution Environment (PXE) allows an operating
system to boot over the network. For example, a FreeBSD system can boot
over the network and operate without a local disk, using file systems
mounted from an NFS server. PXE support is usually available in the
BIOS. To use PXE when the machine starts, select the
``Boot from network`` option in the BIOS setup or type a function key
during system initialization.

In order to provide the files needed for an operating system to boot
over the network, a PXE setup also requires properly configured DHCP,
TFTP, and NFS servers, where:

.. raw:: html

   <div class="itemizedlist">

-  Initial parameters, such as an IP address, executable boot filename
   and location, server name, and root path are obtained from the DHCP
   server.

-  The operating system loader file is booted using TFTP.

-  The file systems are loaded using NFS.

.. raw:: html

   </div>

When a computer PXE boots, it receives information over DHCP about where
to obtain the initial boot loader file. After the host computer receives
this information, it downloads the boot loader via TFTP and then
executes the boot loader. In FreeBSD, the boot loader file is
``/boot/pxeboot``. After ``/boot/pxeboot`` executes, the FreeBSD kernel
is loaded and the rest of the FreeBSD bootup sequence proceeds, as
described in `Chapter?13, *The FreeBSD Booting Process* <boot.html>`__.

This section describes how to configure these services on a FreeBSD
system so that other systems can PXE boot into FreeBSD. Refer to
`diskless(8) <http://www.FreeBSD.org/cgi/man.cgi?query=diskless&sektion=8>`__
for more information.

.. raw:: html

   <div class="caution" xmlns="">

Caution:
~~~~~~~~

As described, the system providing these services is insecure. It should
live in a protected area of a network and be untrusted by other hosts.

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

31.8.1.?Setting Up the PXE Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Craig Rodrigues.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The steps shown in this section configure the built-in NFS and TFTP
servers. The next section demonstrates how to install and configure the
DHCP server. In this example, the directory which will contain the files
used by PXE users is ``/b/tftpboot/FreeBSD/install``. It is important
that this directory exists and that the same directory name is set in
both ``/etc/inetd.conf`` and ``/usr/local/etc/dhcpd.conf``.

.. raw:: html

   <div class="procedure">

#. Create the root directory which will contain a FreeBSD installation
   to be NFS mounted:

   .. code:: screen

       # export NFSROOTDIR=/b/tftpboot/FreeBSD/install
       # mkdir -p ${NFSROOTDIR}

#. Enable the NFS server by adding this line to ``/etc/rc.conf``:

   .. code:: programlisting

       nfs_server_enable="YES"

#. Export the diskless root directory via NFS by adding the following to
   ``/etc/exports``:

   .. code:: programlisting

       /b -ro -alldirs

#. Start the NFS server:

   .. code:: screen

       # service nfsd start

#. Enable
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   by adding the following line to ``/etc/rc.conf``:

   .. code:: programlisting

       inetd_enable="YES"

#. Uncomment the following line in ``/etc/inetd.conf`` by making sure it
   does not start with a ``#`` symbol:

   .. code:: programlisting

       tftp dgram udp wait root /usr/libexec/tftpd tftpd -l -s /b/tftpboot

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Some PXE versions require the TCP version of TFTP. In this case,
   uncomment the second ``tftp`` line which contains ``stream tcp``.

   .. raw:: html

      </div>

#. Start
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__:

   .. code:: screen

       # service inetd start

#. Rebuild the FreeBSD kernel and userland (refer to `Section?24.6,
   “Rebuilding World” <makeworld.html>`__ for more detailed
   instructions):

   .. code:: screen

       # cd /usr/src
       # make buildworld
       # make buildkernel

#. Install FreeBSD into the directory mounted over NFS:

   .. code:: screen

       # make installworld DESTDIR=${NFSROOTDIR}
       # make installkernel DESTDIR=${NFSROOTDIR}
       # make distribution DESTDIR=${NFSROOTDIR}

#. Test that the TFTP server works and can download the boot loader
   which will be obtained via PXE:

   .. code:: screen

       # tftp localhost
       tftp> get FreeBSD/install/boot/pxeboot
       Received 264951 bytes in 0.1 seconds

#. Edit ``${NFSROOTDIR}/etc/fstab`` and create an entry to mount the
   root file system over NFS:

   .. code:: programlisting

       # Device                                         Mountpoint    FSType   Options  Dump Pass
       myhost.example.com:/b/tftpboot/FreeBSD/install       /         nfs      ro        0    0

   Replace *``myhost.example.com``* with the hostname or IP address of
   the NFS server. In this example, the root file system is mounted
   read-only in order to prevent NFS clients from potentially deleting
   the contents of the root file system.

#. Set the root password in the PXE environment for client machines
   which are PXE booting :

   .. code:: screen

       # chroot ${NFSROOTDIR}
       # passwd

#. If needed, enable
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
   root logins for client machines which are PXE booting by editing
   ``${NFSROOTDIR}/etc/ssh/sshd_config`` and enabling
   ``PermitRootLogin``. This option is documented in
   `sshd\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd_config&sektion=5>`__.

#. Perform any other needed customizations of the PXE environment in
   ``${NFSROOTDIR}``. These customizations could include things like
   installing packages or editing the password file with
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__.

.. raw:: html

   </div>

When booting from an NFS root volume, ``/etc/rc`` detects the NFS boot
and runs ``/etc/rc.initdiskless``. In this case, ``/etc`` and ``/var``
need to be memory backed file systems so that these directories are
writable but the NFS root directory is read-only:

.. code:: screen

    # chroot ${NFSROOTDIR}
    # mkdir -p conf/base
    # tar -c -v -f conf/base/etc.cpio.gz --format cpio --gzip etc
    # tar -c -v -f conf/base/var.cpio.gz --format cpio --gzip var

When the system boots, memory file systems for ``/etc`` and ``/var``
will be created and mounted and the contents of the ``cpio.gz`` files
will be copied into them.

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

31.8.2.?Configuring the DHCP Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The DHCP server does not need to be the same machine as the TFTP and NFS
server, but it needs to be accessible in the network.

DHCP is not part of the FreeBSD base system but can be installed using
the
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
port or package.

Once installed, edit the configuration file,
``/usr/local/etc/dhcpd.conf``. Configure the ``next-server``,
``filename``, and ``root-path`` settings as seen in this example:

.. code:: programlisting

    subnet 192.168.0.0 netmask 255.255.255.0 {
       range 192.168.0.2 192.168.0.3 ;
       option subnet-mask 255.255.255.0 ;
       option routers 192.168.0.1 ;
       option broadcast-address 192.168.0.255 ;
       option domain-name-servers 192.168.35.35, 192.168.35.36 ;
       option domain-name "example.com";

       # IP address of TFTP server
       next-server 192.168.0.1 ;

       # path of boot loader obtained via tftp
         filename "FreeBSD/install/boot/pxeboot" ;

       # pxeboot boot loader will try to NFS mount this directory for root FS
       option root-path "192.168.0.1:/b/tftpboot/FreeBSD/install/" ;

    }

The ``next-server`` directive is used to specify the IP address of the
TFTP server.

The ``filename`` directive defines the path to ``/boot/pxeboot``. A
relative filename is used, meaning that ``/b/tftpboot`` is not included
in the path.

The ``root-path`` option defines the path to the NFS root file system.

Once the edits are saved, enable DHCP at boot time by adding the
following line to ``/etc/rc.conf``:

.. code:: programlisting

    dhcpd_enable="YES"

Then start the DHCP service:

.. code:: screen

    # service isc-dhcpd start

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

31.8.3.?Debugging PXE Problems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once all of the services are configured and started, PXE clients should
be able to automatically load FreeBSD over the network. If a particular
client is unable to connect, when that client machine boots up, enter
the BIOS configuration menu and confirm that it is set to boot from the
network.

This section describes some troubleshooting tips for isolating the
source of the configuration problem should no clients be able to PXE
boot.

.. raw:: html

   <div class="procedure">

#. Use the
   `net/wireshark <http://www.freebsd.org/cgi/url.cgi?ports/net/wireshark/pkg-descr>`__
   package or port to debug the network traffic involved during the PXE
   booting process, which is illustrated in the diagram below.

   .. raw:: html

      <div class="figure">

   .. raw:: html

      <div class="figure-title">

   Figure?31.1.?PXE Booting Process with NFS Root Mount

   .. raw:: html

      </div>

   .. raw:: html

      <div class="figure-contents">

   .. raw:: html

      <div class="mediaobject">

   |PXE Booting Process with NFS Root Mount|

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | |1|                                  | Client broadcasts a ``DHCPDISCOVER`` |
   |                                      | message.                             |
   +--------------------------------------+--------------------------------------+
   | |2|                                  | The DHCP server responds with the IP |
   |                                      | address, ``next-server``,            |
   |                                      | ``filename``, and ``root-path``      |
   |                                      | values.                              |
   +--------------------------------------+--------------------------------------+
   | |3|                                  | The client sends a TFTP request to   |
   |                                      | ``next-server``, asking to retrieve  |
   |                                      | ``filename``.                        |
   +--------------------------------------+--------------------------------------+
   | |4|                                  | The TFTP server responds and sends   |
   |                                      | ``filename`` to client.              |
   +--------------------------------------+--------------------------------------+
   | |5|                                  | The client executes ``filename``,    |
   |                                      | which is                             |
   |                                      | `pxeboot(8) <http://www.FreeBSD.org/ |
   |                                      | cgi/man.cgi?query=pxeboot&sektion=8> |
   |                                      | `__,                                 |
   |                                      | which then loads the kernel. When    |
   |                                      | the kernel executes, the root file   |
   |                                      | system specified by ``root-path`` is |
   |                                      | mounted over NFS.                    |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

#. On the TFTP server, read ``/var/log/xferlog`` to ensure that
   ``pxeboot`` is being retrieved from the correct location. To test
   this example configuration:

   .. code:: screen

       # tftp 192.168.0.1
       tftp> get FreeBSD/install/boot/pxeboot
       Received 264951 bytes in 0.1 seconds

   The ``BUGS`` sections in
   `tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8>`__
   and
   `tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1>`__
   document some limitations with TFTP.

#. Make sure that the root file system can be mounted via NFS. To test
   this example configuration:

   .. code:: screen

       # mount -t nfs 192.168.0.1:/b/tftpboot/FreeBSD/install /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------------+-----------------------------------+
| `Prev <network-aggregation.html>`__?   | `Up <advanced-networking.html>`__   | ?\ `Next <network-ipv6.html>`__   |
+----------------------------------------+-------------------------------------+-----------------------------------+
| 31.7.?Link Aggregation and Failover?   | `Home <index.html>`__               | ?31.9.?IPv6                       |
+----------------------------------------+-------------------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |PXE Booting Process with NFS Root Mount| image:: advanced-networking/pxe-nfs.png
.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
