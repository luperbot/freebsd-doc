========================
31.6. Diskless Operation
========================

.. raw:: html

   <div class="navheader">

31.6. Diskless Operation
`????? <network-bridging.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-isdn.html>`__

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

31.6. Diskless Operation
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated by Jean-Francois Dock\`es.

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

A FreeBSD machine can boot over the network and operate without a local
disk, using file systems mounted from an NFS server. No system
modification is necessary, beyond standard configuration files. Such a
system is relatively easy to set up because all the necessary elements
are readily available:

.. raw:: html

   <div class="itemizedlist">

-  There are at least two possible methods to load the kernel over the
   network:

   .. raw:: html

      <div class="itemizedlist">

   -  PXE: The Intel(R) Preboot eXecution Environment system is a form
      of smart boot ROM built into some networking cards or
      motherboards. See
      `pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__
      for more details.

   -  The Etherboot port
      (`net/etherboot <http://www.freebsd.org/cgi/url.cgi?ports/net/etherboot/pkg-descr>`__)
      produces ROM-able code to boot kernels over the network. The code
      can be either burnt into a boot PROM on a network card, or loaded
      from a local floppy (or hard) disk drive, or from a running
      MS-DOS(R) system. Many network cards are supported.

   .. raw:: html

      </div>

-  A sample script (``/usr/share/examples/diskless/clone_root``) eases
   the creation and maintenance of the workstation's root file system on
   the server. The script will probably require a little customization
   but it will get you started very quickly.

-  Standard system startup files exist in ``/etc`` to detect and support
   a diskless system startup.

-  Swapping, if needed, can be done either to an NFS file or to a local
   disk.

.. raw:: html

   </div>

There are many ways to set up diskless workstations. Many elements are
involved, and most can be customized to suit local taste. The following
will describe variations on the setup of a complete system, emphasizing
simplicity and compatibility with the standard FreeBSD startup scripts.
The system described has the following characteristics:

.. raw:: html

   <div class="itemizedlist">

-  The diskless workstations use a shared read-only ``/`` file system,
   and a shared read-only ``/usr``.

   The root file system is a copy of a standard FreeBSD root (typically
   the server's), with some configuration files overridden by ones
   specific to diskless operation or, possibly, to the workstation they
   belong to.

   The parts of the root which have to be writable are overlaid with
   `md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
   file systems. Any changes will be lost when the system reboots.

-  The kernel is transferred and loaded either with Etherboot or PXE as
   some situations may mandate the use of either method.

.. raw:: html

   </div>

.. raw:: html

   <div class="caution" xmlns="">

???????:
~~~~~~~~

As described, this system is insecure. It should live in a protected
area of a network, and be untrusted by other hosts.

.. raw:: html

   </div>

All the information in this section has been tested using FreeBSD
5.2.1-RELEASE.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.6.1. Background Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setting up diskless workstations is both relatively straightforward and
prone to errors. These are sometimes difficult to diagnose for a number
of reasons. For example:

.. raw:: html

   <div class="itemizedlist">

-  Compile time options may determine different behaviors at runtime.

-  Error messages are often cryptic or totally absent.

.. raw:: html

   </div>

In this context, having some knowledge of the background mechanisms
involved is very useful to solve the problems that may arise.

Several operations need to be performed for a successful bootstrap:

.. raw:: html

   <div class="itemizedlist">

-  The machine needs to obtain initial parameters such as its IP
   address, executable filename, server name, root path. This is done
   using the DHCP or BOOTP protocols. DHCP is a compatible extension of
   BOOTP, and uses the same port numbers and basic packet format.

   It is possible to configure a system to use only BOOTP. The
   `bootpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bootpd&sektion=8>`__
   server program is included in the base FreeBSD system.

   However, DHCP has a number of advantages over BOOTP (nicer
   configuration files, possibility of using PXE, plus many others not
   directly related to diskless operation), and we will describe mainly
   a DHCP configuration, with equivalent examples using
   `bootpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bootpd&sektion=8>`__
   when possible. The sample configuration will use the ISC DHCP
   software package (release 3.0.1.r12 was installed on the test
   server).

-  The machine needs to transfer one or several programs to local
   memory. Either TFTP or NFS are used. The choice between TFTP and NFS
   is a compile time option in several places. A common source of error
   is to specify filenames for the wrong protocol: TFTP typically
   transfers all files from a single directory on the server, and would
   expect filenames relative to this directory. NFS needs absolute file
   paths.

-  The possible intermediate bootstrap programs and the kernel need to
   be initialized and executed. There are several important variations
   in this area:

   .. raw:: html

      <div class="itemizedlist">

   -  PXE will load
      `pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__,
      which is a modified version of the FreeBSD third stage loader. The
      `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
      will obtain most parameters necessary to system startup, and leave
      them in the kernel environment before transferring control. It is
      possible to use a ``GENERIC`` kernel in this case.

   -  Etherboot, will directly load the kernel, with less preparation.
      You will need to build a kernel with specific options.

   .. raw:: html

      </div>

   PXE and Etherboot work equally well; however, because kernels
   normally let the
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
   do more work for them, PXE is the preferred method.

   If your BIOS and network cards support PXE, you should probably use
   it.

-  Finally, the machine needs to access its file systems. NFS is used in
   all cases.

.. raw:: html

   </div>

See also
`diskless(8) <http://www.FreeBSD.org/cgi/man.cgi?query=diskless&sektion=8>`__
manual page.

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

31.6.2. Setup Instructions
~~~~~~~~~~~~~~~~~~~~~~~~~~

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

31.6.2.1. Configuration Using ISC DHCP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ISC DHCP server can answer both BOOTP and DHCP requests.

ISC DHCP 3.0 is not part of the base system. You will first need to
install the
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__
port or the corresponding package.

Once ISC DHCP is installed, it needs a configuration file to run
(normally named ``/usr/local/etc/dhcpd.conf``). Here follows a commented
example, where host ``margaux`` uses Etherboot and host ``corbieres``
uses PXE:

.. code:: programlisting

    default-lease-time 600;
    max-lease-time 7200;
    authoritative;

    option domain-name "example.com";
    option domain-name-servers 192.168.4.1;
    option routers 192.168.4.1;

    subnet 192.168.4.0 netmask 255.255.255.0 {
      use-host-decl-names on; 
      option subnet-mask 255.255.255.0;
      option broadcast-address 192.168.4.255;

      host margaux {
        hardware ethernet 01:23:45:67:89:ab;
        fixed-address margaux.example.com;
        next-server 192.168.4.4; 
        filename "/data/misc/kernel.diskless"; 
        option root-path "192.168.4.4:/data/misc/diskless"; 
      }
      host corbieres {
        hardware ethernet 00:02:b3:27:62:df;
        fixed-address corbieres.example.com;
        next-server 192.168.4.4;
        filename "pxeboot";
        option root-path "192.168.4.4:/data/misc/diskless";
      }
    }
              

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-dhcp-host-name>`__         | This option tells dhcpd to send the  |
|                                      | value in the ``host`` declarations   |
|                                      | as the hostname for the diskless     |
|                                      | host. An alternate way would be to   |
|                                      | add an                               |
|                                      | ``option host-name           margaux |
|                                      | ``                                   |
|                                      | inside the ``host`` declarations.    |
+--------------------------------------+--------------------------------------+
| `|2| <#co-dhcp-next-server>`__       | The ``next-server`` directive        |
|                                      | designates the TFTP or NFS server to |
|                                      | use for loading loader or kernel     |
|                                      | file (the default is to use the same |
|                                      | host as the DHCP server).            |
+--------------------------------------+--------------------------------------+
| `|3| <#co-dhcp-filename>`__          | The ``filename`` directive defines   |
|                                      | the file that Etherboot or PXE will  |
|                                      | load for the next execution step. It |
|                                      | must be specified according to the   |
|                                      | transfer method used. Etherboot can  |
|                                      | be compiled to use NFS or TFTP. The  |
|                                      | FreeBSD port configures NFS by       |
|                                      | default. PXE uses TFTP, which is why |
|                                      | a relative filename is used here     |
|                                      | (this may depend on the TFTP server  |
|                                      | configuration, but would be fairly   |
|                                      | typical). Also, PXE loads            |
|                                      | ``pxeboot``, not the kernel. There   |
|                                      | are other interesting possibilities, |
|                                      | like loading ``pxeboot`` from a      |
|                                      | FreeBSD CD-ROM ``/boot`` directory   |
|                                      | (as                                  |
|                                      | `pxeboot(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=pxeboot&sektion=8> |
|                                      | `__                                  |
|                                      | can load a ``GENERIC`` kernel, this  |
|                                      | makes it possible to use PXE to boot |
|                                      | from a remote CD-ROM).               |
+--------------------------------------+--------------------------------------+
| `|4| <#co-dhcp-root-path>`__         | The ``root-path`` option defines the |
|                                      | path to the root file system, in     |
|                                      | usual NFS notation. When using PXE,  |
|                                      | it is possible to leave off the      |
|                                      | host's IP as long as you do not      |
|                                      | enable the kernel option BOOTP. The  |
|                                      | NFS server will then be the same as  |
|                                      | the TFTP one.                        |
+--------------------------------------+--------------------------------------+

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

31.6.2.2. Configuration Using BOOTP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here follows an equivalent bootpd configuration (reduced to one client).
This would be found in ``/etc/bootptab``.

Please note that Etherboot must be compiled with the non-default option
``NO_DHCP_SUPPORT`` in order to use BOOTP, and that PXE *needs* DHCP.
The only obvious advantage of bootpd is that it exists in the base
system.

.. code:: programlisting

    .def100:\
      :hn:ht=1:sa=192.168.4.4:vm=rfc1048:\
      :sm=255.255.255.0:\
      :ds=192.168.4.1:\
      :gw=192.168.4.1:\
      :hd="/tftpboot":\
      :bf="/kernel.diskless":\
      :rp="192.168.4.4:/data/misc/diskless":

    margaux:ha=0123456789ab:tc=.def100
              

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

31.6.2.3. Preparing a Boot Program with Etherboot
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`Etherboot's Web site <http://etherboot.sourceforge.net>`__ contains
`extensive
documentation <http://etherboot.sourceforge.net/doc/html/userman/t1.html>`__
mainly intended for Linux systems, but nonetheless containing useful
information. The following will just outline how you would use Etherboot
on a FreeBSD system.

You must first install the
`net/etherboot <http://www.freebsd.org/cgi/url.cgi?ports/net/etherboot/pkg-descr>`__
package or port.

You can change the Etherboot configuration (i.e. to use TFTP instead of
NFS) by editing the ``Config`` file in the Etherboot source directory.

For our setup, we shall use a boot floppy. For other methods (PROM, or
MS-DOS(R) program), please refer to the Etherboot documentation.

To make a boot floppy, insert a floppy in the drive on the machine where
you installed Etherboot, then change your current directory to the
``src`` directory in the Etherboot tree and type:

.. code:: screen

    # gmake bin32/devicetype.fd0
        

*``devicetype``* depends on the type of the Ethernet card in the
diskless workstation. Refer to the ``NIC`` file in the same directory to
determine the right *``devicetype``*.

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

31.6.2.4. Booting with PXE
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, the
`pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__
loader loads the kernel via NFS. It can be compiled to use TFTP instead
by specifying the ``LOADER_TFTP_SUPPORT`` option in ``/etc/make.conf``.
See the comments in ``/usr/share/examples/etc/make.conf`` for
instructions.

There are two other ``make.conf`` options which may be useful for
setting up a serial console diskless machine:
``BOOT_PXELDR_PROBE_KEYBOARD``, and ``BOOT_PXELDR_ALWAYS_SERIAL``.

To use PXE when the machine starts, you will usually need to select the
``Boot from network`` option in your BIOS setup, or type a function key
during the PC initialization.

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

31.6.2.5. Configuring the TFTP and NFS Servers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are using PXE or Etherboot configured to use TFTP, you need to
enable tftpd on the file server:

.. raw:: html

   <div class="procedure">

#. Create a directory from which tftpd will serve the files, e.g.
   ``/tftpboot``.

#. Add this line to your ``/etc/inetd.conf``:

   .. code:: programlisting

       tftp    dgram   udp wait    root    /usr/libexec/tftpd  tftpd -l -s /tftpboot

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   It appears that at least some PXE versions want the TCP version of
   TFTP. In this case, add a second line, replacing ``dgram udp`` with
   ``stream         tcp``.

   .. raw:: html

      </div>

#. Tell inetd to reread its configuration file. The
   ``inetd_enable="YES"`` must be in the ``/etc/rc.conf`` file for this
   command to execute correctly:

   .. code:: screen

       # /etc/rc.d/inetd restart

.. raw:: html

   </div>

You can place the ``tftpboot`` directory anywhere on the server. Make
sure that the location is set in both ``inetd.conf`` and ``dhcpd.conf``.

In all cases, you also need to enable NFS and export the appropriate
file system on the NFS server.

.. raw:: html

   <div class="procedure">

#. Add this to ``/etc/rc.conf``:

   .. code:: programlisting

       nfs_server_enable="YES"

#. Export the file system where the diskless root directory is located
   by adding the following to ``/etc/exports`` (adjust the volume mount
   point and replace *``margaux corbieres``* with the names of the
   diskless workstations):

   .. code:: programlisting

       /data/misc -alldirs -ro margaux corbieres

#. Tell mountd to reread its configuration file. If you actually needed
   to enable NFS in ``/etc/rc.conf`` at the first step, you probably
   want to reboot instead.

   .. code:: screen

       # /etc/rc.d/mountd restart

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

31.6.2.6. Building a Diskless Kernel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If using Etherboot, you need to create a kernel configuration file for
the diskless client with the following options (in addition to the usual
ones):

.. code:: programlisting

    options     BOOTP          # Use BOOTP to obtain IP address/hostname
    options     BOOTP_NFSROOT  # NFS mount root file system using BOOTP info
        

You may also want to use ``BOOTP_NFSV3``, ``BOOT_COMPAT`` and
``BOOTP_WIRED_TO`` (refer to ``NOTES``).

These option names are historical and slightly misleading as they
actually enable indifferent use of DHCP and BOOTP inside the kernel (it
is also possible to force strict BOOTP or DHCP use).

Build the kernel (see `?????????9, *??????????? ??? ?????? ???
FreeBSD* <kernelconfig.html>`__), and copy it to the place specified in
``dhcpd.conf``.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

When using PXE, building a kernel with the above options is not strictly
necessary (though suggested). Enabling them will cause more DHCP
requests to be issued during kernel startup, with a small risk of
inconsistency between the new values and those retrieved by
`pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__
in some special cases. The advantage of using them is that the host name
will be set as a side effect. Otherwise you will need to set the host
name by another method, for example in a client-specific ``rc.conf``
file.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

In order to be loadable with Etherboot, a kernel needs to have the
device hints compiled in. You would typically set the following option
in the configuration file (see the ``NOTES`` configuration comments
file):

.. code:: programlisting

    hints     "GENERIC.hints"

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

31.6.2.7. Preparing the Root Filesystem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You need to create a root file system for the diskless workstations, in
the location listed as ``root-path`` in ``dhcpd.conf``.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.6.2.7.1. Using ``make world`` to populate root
'''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This method is quick and will install a complete virgin system (not only
the root file system) into ``DESTDIR``. All you have to do is simply
execute the following script:

.. code:: programlisting

    #!/bin/sh
    export DESTDIR=/data/misc/diskless
    mkdir -p ${DESTDIR}
    cd /usr/src; make buildworld && make buildkernel
    cd /usr/src/etc; make distribution

Once done, you may need to customize your ``/etc/rc.conf`` and
``/etc/fstab`` placed into ``DESTDIR`` according to your needs.

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

31.6.2.8. Configuring Swap
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If needed, a swap file located on the server can be accessed via NFS.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.6.2.8.1. NFS Swap
''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The kernel does not support enabling NFS swap at boot time. Swap must be
enabled by the startup scripts, by mounting a writable file system and
creating and enabling a swap file. To create a swap file of appropriate
size, you can do like this:

.. code:: screen

    # dd if=/dev/zero of=/path/to/swapfile bs=1k count=1 oseek=100000

To enable it you have to add the following line to your ``rc.conf``:

.. code:: programlisting

    swapfile=/path/to/swapfile

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

31.6.2.9. Miscellaneous Issues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.6.2.9.1. Running with a Read-only ``/usr``
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the diskless workstation is configured to run X, you will have to
adjust the XDM configuration file, which puts the error log on ``/usr``
by default.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.6.2.9.2. Using a Non-FreeBSD Server
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the server for the root file system is not running FreeBSD, you
will have to create the root file system on a FreeBSD machine, then copy
it to its destination, using ``tar`` or ``cpio``.

In this situation, there are sometimes problems with the special files
in ``/dev``, due to differing major/minor integer sizes. A solution to
this problem is to export a directory from the non-FreeBSD server, mount
this directory onto a FreeBSD machine, and use
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
to allocate device nodes transparently for the user.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------------+--------------------------------------+
| `????? <network-bridging.html>`__?   | `???? <advanced-networking.html>`__   | ?\ `??????? <network-isdn.html>`__   |
+--------------------------------------+---------------------------------------+--------------------------------------+
| 31.5. Bridging?                      | `???? <index.html>`__                 | ?31.7. ISDN                          |
+--------------------------------------+---------------------------------------+--------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
