=========================================
FreeBSD Quickstart Guide for Linux? Users
=========================================

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

John Ferrell
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2008 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Linux is a registered trademark of Linus Torvalds.

Intel, Celeron, Centrino, Core, EtherExpress, i386, i486, Itanium,
Pentium, and Xeon are trademarks or registered trademarks of Intel
Corporation or its subsidiaries in the United States and other
countries.

Red Hat, RPM, are trademarks or registered trademarks of Red Hat, Inc.
in the United States and other countries.

UNIX is a registered trademark of The Open Group in the United States
and other countries.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

This document is intended to quickly familiarize intermediate to
advanced Linux? users with the basics of FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <#intro>`__
`2. Default Shell <#shells>`__
`3. Packages and Ports: Adding Software in FreeBSD <#software>`__
`4. System Startup <#startup>`__
`5. Network Configuration <#network>`__
`6. Firewall <#firewall>`__
`7. Updating FreeBSD <#updates>`__
`8. procfs: Gone But Not Forgotten <#procfs>`__
`9. Common Commands <#commands>`__
`10. Conclusion <#conclusion>`__

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

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document highlights some of the technical differences between
FreeBSD and Linux? so that intermediate to advanced Linux? users can
quickly familiarize themselves with the basics of FreeBSD.

This document assumes that FreeBSD is already installed. Refer to the
`Installing
FreeBSD <../../../../doc/en_US.ISO8859-1/books/handbook/bsdinstall.html>`__
chapter of the FreeBSD?Handbook for help with the installation process.

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

2.?Default Shell
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux? users are often surprised to find that Bash is not the default
shell in FreeBSD. In fact, Bash is not included in the default
installation. Instead, FreeBSD uses
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__ as
the default root shell, and the Bourne shell-compatible
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ as the
default user shell.
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ is
very similar to Bash but with a much smaller feature-set. Generally
shell scripts written for
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ will
run in Bash, but the reverse is not always true.

However, Bash and other shells are available for installation using the
FreeBSD `Packages and Ports
Collection <../../../../doc/en_US.ISO8859-1/books/handbook/ports.html>`__.

After installing another shell, use
`chsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chsh&sektion=1>`__ to
change a user's default shell. It is recommended that the ``root``
user's default shell remain unchanged since shells which are not
included in the base distribution are installed to ``/usr/local/bin``.
In the event of a problem, the file system where ``/usr/local/bin`` is
located may not be mounted. In this case, ``root`` would not have access
to its default shell, preventing ``root`` from logging in and fixing the
problem.

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

3.?Packages and Ports: Adding Software in FreeBSD
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides two methods for installing applications: binary
packages and compiled ports. Each method has its own benefits:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Binary Packages

.. raw:: html

   </div>

-  Faster installation as compared to compiling large applications.
-  Does not require an understanding of how to compile software.
-  No need to install a compiler.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ports

.. raw:: html

   </div>

-  Ability to customize installation options.
-  Custom patches can be applied.

.. raw:: html

   </div>

If an application installation does not require any customization,
installing the package is sufficient. Compile the port instead whenever
an application requires customization of the default options. If needed,
a custom package can be compiled from ports using ``make`` ``package``.

A complete list of all available ports and packages can be found
`here <http://www.freebsd.org/ports/master-index.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Packages
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Packages are pre-compiled applications, the FreeBSD equivalents of
``.deb`` files on Debian/Ubuntu based systems and ``.rpm`` files on
Red?Hat/Fedora based systems. Packages are installed using ``pkg``. For
example, the following command installs Apache 2.4:

.. code:: screen

    # pkg install apache24

For more information on packages refer to section 5.4 of the FreeBSD
Handbook: `Using pkgng for Binary Package
Management <../../../../doc/en_US.ISO8859-1/books/handbook/pkgng-intro.html>`__.

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

3.2.?Ports
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD Ports Collection is a framework of ``Makefiles`` and patches
specifically customized for installing applications from source on
FreeBSD. When installing a port, the system will fetch the source code,
apply any required patches, compile the code, and install the
application and any required dependencies.

The Ports Collection, sometimes referred to as the ports tree, can be
installed to ``/usr/ports`` using
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__.
Detailed instructions for installing the Ports Collection can be found
in `section
5.5 <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
of the FreeBSD Handbook.

To compile a port, change to the port's directory and start the build
process. The following example installs Apache 2.4 from the Ports
Collection:

.. code:: screen

    # cd /usr/ports/www/apache24
    # make install clean

A benefit of using ports to install software is the ability to customize
the installation options. This example specifies that the mod\_ldap
module should also be installed:

.. code:: screen

    # cd /usr/ports/www/apache24
    # make WITH_LDAP="YES" install clean

Refer to `Using the Ports
Collection <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
for more information.

.. raw:: html

   </div>

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

4.?System Startup
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many Linux? distributions use the SysV init system, whereas FreeBSD uses
the traditional BSD-style
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__.
Under the BSD-style
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
there are no run-levels and ``/etc/inittab`` does not exist. Instead,
startup is controlled by
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
scripts. At system boot, ``/etc/rc`` reads ``/etc/rc.conf`` and
``/etc/defaults/rc.conf`` to determine which services are to be started.
The specified services are then started by running the corresponding
service initialization scripts located in ``/etc/rc.d/`` and
``/usr/local/etc/rc.d/``. These scripts are similar to the scripts
located in ``/etc/init.d/`` on Linux? systems.

The scripts found in ``/etc/rc.d/`` are for applications that are part
of the “base” system, such as
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
and
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__.
The scripts in ``/usr/local/etc/rc.d/`` are for user-installed
applications such as Apache and Squid.

Since FreeBSD is developed as a complete operating system,
user-installed applications are not considered to be part of the “base”
system. User-installed applications are generally installed using
`Packages or
Ports <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__.
In order to keep them separate from the base system, user-installed
applications are installed under ``/usr/local/``. Therefore,
user-installed binaries reside in ``/usr/local/bin/``, configuration
files are in ``/usr/local/etc/``, and so on.

Services are enabled by adding an entry for the service in
``/etc/rc.conf`` . The system defaults are found in
``/etc/defaults/rc.conf`` and these default settings are overridden by
settings in ``/etc/rc.conf``. Refer to
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
for more information about the available entries. When installing
additional applications, review the application's install message to
determine how to enable any associated services.

The following entries in ``/etc/rc.conf`` enable
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
enable Apache 2.4, and specify that Apache should be started with SSL.

.. code:: programlisting

    # enable SSHD
    sshd_enable="YES"
    # enable Apache with SSL
    apache24_enable="YES"
    apache24_flags="-DSSL"

Once a service has been enabled in ``/etc/rc.conf``, it can be started
without rebooting the system:

.. code:: screen

    # service sshd start
    # service apache24 start

If a service has not been enabled, it can be started from the command
line using ``onestart``:

.. code:: screen

    # service sshd onestart

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

5.?Network Configuration
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Instead of a generic *ethX* identifier that Linux? uses to identify a
network interface, FreeBSD uses the driver name followed by a number.
The following output from
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
shows two Intel??Pro?1000 network interfaces (``em0`` and ``em1``):

.. code:: screen

    % ifconfig
    em0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            options=b<RXCSUM,TXCSUM,VLAN_MTU>
            inet 10.10.10.100 netmask 0xffffff00 broadcast 10.10.10.255
            ether 00:50:56:a7:70:b2
            media: Ethernet autoselect (1000baseTX <full-duplex>)
            status: active
    em1: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            options=b<RXCSUM,TXCSUM,VLAN_MTU>
            inet 192.168.10.222 netmask 0xffffff00 broadcast 192.168.10.255
            ether 00:50:56:a7:03:2b
            media: Ethernet autoselect (1000baseTX <full-duplex>)
            status: active

An IP address can be assigned to an interface using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
To remain persistent across reboots, the IP configuration must be
included in ``/etc/rc.conf``. The following ``/etc/rc.conf`` entries
specify the hostname, IP address, and default gateway:

.. code:: programlisting

    hostname="server1.example.com"
    ifconfig_em0="inet 10.10.10.100 netmask 255.255.255.0"
    defaultrouter="10.10.10.1"

Use the following entries to instead configure an interface for DHCP:

.. code:: programlisting

    hostname="server1.example.com"
    ifconfig_em0="DHCP"

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

6.?Firewall
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD does not use Linux? IPTABLES for its firewall. Instead, FreeBSD
offers a choice of three kernel level firewalls:

.. raw:: html

   <div class="itemizedlist">

-  `PF <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-pf.html>`__
-  `IPFILTER <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipf.html>`__
-  `IPFW <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipfw.html>`__

.. raw:: html

   </div>

PF is developed by the OpenBSD project and ported to FreeBSD. PF was
created as a replacement for IPFILTER and its syntax is similar to that
of IPFILTER. PF can be paired with
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__ to
provide QoS features.

This sample PF entry allows inbound SSH:

.. code:: programlisting

    pass in on $ext_if inet proto tcp from any to ($ext_if) port 22

IPFILTER is the firewall application developed by Darren Reed. It is not
specific to FreeBSD and has been ported to several operating systems
including NetBSD, OpenBSD, SunOS, HP/UX, and Solaris.

The IPFILTER syntax to allow inbound SSH is:

.. code:: programlisting

    pass in on $ext_if proto tcp from any to any port = 22

IPFW is the firewall developed and maintained by FreeBSD. It can be
paired with
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
to provide traffic shaping capabilities and simulate different types of
network connections.

The IPFW syntax to allow inbound SSH would be:

.. code:: programlisting

    ipfw add allow tcp from any to me 22 in via $ext_if

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

7.?Updating FreeBSD
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two methods for updating a FreeBSD system: from source or
binary updates.

Updating from source is the most involved update method, but offers the
greatest amount of flexibility. The process involves synchronizing a
local copy of the FreeBSD source code with the FreeBSD Subversion
servers. Once the local source code is up-to-date, a new version of the
kernel and userland can be compiled.

Binary updates are similar to using ``yum`` or ``apt-get`` to update a
Linux? system. In FreeBSD,
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
can be used fetch new binary updates and install them. These updates can
be scheduled using
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When using
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__ to
schedule updates, use ``freebsd-update cron`` in the
`crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1>`__
to reduce the possibility of a large number of machines all pulling
updates at the same time:

.. code:: programlisting

    0 3 * * * root /usr/sbin/freebsd-update cron

.. raw:: html

   </div>

For more information on source and binary updates, refer to `the chapter
on
updating <../../../../doc/en_US.ISO8859-1/books/handbook/updating-upgrading.html>`__
in the FreeBSD Handbook.

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

8.?procfs: Gone But Not Forgotten
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In some Linux? distributions, one could look at
``/proc/sys/net/ipv4/ip_forward`` to determine if IP forwarding is
enabled. In FreeBSD,
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
is instead used to view this and other system settings.

For example, use the following to determine if IP forwarding is enabled
on a FreeBSD system:

.. code:: screen

    % sysctl net.inet.ip.forwarding
    net.inet.ip.forwarding: 0

Use ``-a`` to list all the system settings:

.. code:: screen

    % sysctl -a | more

If an application requires procfs, add the following entry to
``/etc/fstab``:

.. code:: screen

    proc                /proc           procfs  rw,noauto       0       0

Including ``noauto`` will prevent ``/proc`` from being automatically
mounted at boot.

To mount the file system without rebooting:

.. code:: screen

    # mount /proc

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

9.?Common Commands
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some common command equivalents are as follows:

.. raw:: html

   <div class="informaltable">

+---------------------------------------------------------+-------------------------------+------------------------------------------+
| Linux? command (Red?Hat/Debian)                         | FreeBSD equivalent            | Purpose                                  |
+=========================================================+===============================+==========================================+
| ``yum install package`` / ``apt-get install package``   | ``pkg install package``       | Install package from remote repository   |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``rpm -ivh package`` / ``dpkg -i package``              | ``pkg add package``           | Install local package                    |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``rpm -qa`` / ``dpkg -l``                               | ``pkg info``                  | List installed packages                  |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``lspci``                                               | ``pciconf``                   | List PCI devices                         |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``lsmod``                                               | ``kldstat``                   | List loaded kernel modules               |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``modprobe``                                            | ``kldload`` / ``kldunload``   | Load/Unload kernel modules               |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``strace``                                              | ``truss``                     | Trace system calls                       |
+---------------------------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

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

10.?Conclusion
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document has provided an overview of FreeBSD. Refer to the
`FreeBSD?Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/index.html>`__
for more in-depth coverage of these topics as well as the many topics
not covered by this document.

.. raw:: html

   </div>

.. raw:: html

   </div>
