=======================================
FreeBSD/alpha 4.8-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.8-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.22.2.346 2003/03/22 00:12:50 bmah Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 4.8-RELEASE contain a summary of the
changes made to the FreeBSD base system since 4.7-RELEASE. Both changes
for kernel and userland are listed, as well as applicable security
advisories for the base system that were issued since the last release.
Some brief remarks on upgrading are also presented.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Table of Contents**
1 `Introduction <#AEN14>`__
2 `What's New <#AEN22>`__
2.1 `Kernel Changes <#KERNEL>`__
2.1.1 `Processor/Motherboard Support <#AEN50>`__
2.1.2 `Boot Loaders <#AEN60>`__
2.1.3 `Network Interface Support <#AEN63>`__
2.1.4 `Network Protocols <#AEN73>`__
2.1.5 `Disks and Storage <#AEN97>`__
2.1.6 `Filesystems <#AEN129>`__
2.1.7 `PCCARD Support <#AEN132>`__
2.1.8 `Multimedia Support <#AEN135>`__
2.1.9 `Contributed Software <#AEN138>`__
2.2 `Security Advisories <#SECURITY>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 `Contributed Software <#AEN298>`__
2.3.2 `Ports/Packages Collection <#AEN330>`__
2.4 `Release Engineering and Integration <#AEN335>`__
3 `Upgrading from previous releases of FreeBSD <#AEN343>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This document contains the release notes for FreeBSD 4.8-RELEASE on the
Alpha/AXP hardware platform. It describes new features of FreeBSD that
have been added (or changed) since 4.7-RELEASE. It also provides some
notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 4.8-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
appendix in the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
============

This section describes the most user-visible new or changed features in
FreeBSD since 4.7-RELEASE. Typical release note items document new
drivers or hardware support, new commands or options, major bugfixes, or
contributed software upgrades. Security advisories for the base system
that were issued after 4.7-RELEASE are also listed.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Kernel Changes
------------------

A new in-kernel cryptographic framework (see
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
and
`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+4.8-RELEASE>`__)
has been imported from OpenBSD. It provides a consistent interface to
hardware and software implementations of cryptographic algorithms for
use by the kernel and access to cryptographic hardware for user-mode
applications. Hardware device drivers are provided to support hifn-based
cards
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__)
and Broadcom-based cards
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__).

The
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
driver, to support FTDI USB-to-serial devices, has been added.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1 Processor/Motherboard Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Users of AlphaServer 8200 and 8400 TurboLaser machines must explicitly
enable
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
for the serial console line after installation. If this is not done, the
system might appear hung as it will not output a login prompt. (See the
``zs0`` line in ``/etc/ttys``.)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2 Boot Loaders
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3 Network Interface Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The cm driver now supports IPX.

The
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
driver now supports network device
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4 Network Protocols
~~~~~~~~~~~~~~~~~~~~~~~

A ``FAST_IPSEC`` kernel option now allows the IPsec implementation to
use the kernel
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
framework, along with its support for hardware cryptographic
acceleration. More information can be found in the
`fast\_ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fast_ipsec&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
manual page.

.. raw:: html

   <div class="NOTE">

    **Note:** The ``FAST_IPSEC`` and ``IPSEC`` options are mutually
    exclusive.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Note:** The ``FAST_IPSEC`` option is, at the moment, not
    compatible with IPv6 or the ``INET6`` option.

.. raw:: html

   </div>

A
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
driver, which can encapsulate IP packets using GRE (RFC 1701) or minimal
IP encapsulation for Mobile IP (RFC 2004), has been added.

A bug in TCP NewReno, which caused premature exit from fast recovery
with NewReno enabled, has been fixed.

The IP fragment reassembly code behaves more gracefully when receiving a
large number of packet fragments (it is designed to be more resistant to
fragment-based denial of service attacks).

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5 Disks and Storage
~~~~~~~~~~~~~~~~~~~~~~~

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
driver now supports accessing ATA devices as SCSI devices via the CAM
layer and drivers
(`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__,
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__,
`st(4) <http://www.FreeBSD.org/cgi/man.cgi?query=st&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__,
and
`pass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pass&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__).
This feature requires ``device             atapicam`` in the kernel
configuration. More information can be found in
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__.

The
`targ(4) <http://www.FreeBSD.org/cgi/man.cgi?query=targ&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
driver has been rewritten and a new usermode has been added to
``/usr/share/examples/scsi_target`` that emulates a direct access
device.

The trm driver has been added to support SCSI adapters using the Tekram
TRM-S1040 SCSI chipset.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6 Filesystems
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7 PCCARD Support
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8 Multimedia Support
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

**IPFilter** has been updated to 3.4.31.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Security Advisories
-----------------------

Buffer overflows in kadmind(8) and k5admin have been corrected. More
details can be found in security advisory
`FreeBSD-SA-02:40 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:40.kadmind.asc>`__.

Multiple vulnerabilities in **BIND** have been fixed, as described in
`FreeBSD-SA-02:43 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:43.bind.asc>`__.

A file descriptor leak in the
`fpathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fpathconf&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__
system call, which could allow a local user to crash the system or cause
a privilege escalation, has been fixed. More details can be found in
security advisory
`FreeBSD-SA-02:44 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:44.filedesc.asc>`__.

A remotely exploitable vulnerability in **CVS** has been corrected with
the import of version 1.11.5. More details can be found in security
advisory
`FreeBSD-SA-03:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:01.cvs.asc>`__.

A timing-based attack on **OpenSSL**, which could allow a very powerful
attacker access to plaintext under certain circumstances, has been
prevented via an upgrade to **OpenSSL** 0.9.7. See security advisory
`FreeBSD-SA-03:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:02.openssl.asc>`__
for more details.

The security and performance of the \`\`syncookies'' feature has been
improved to decrease the chance of an attacker being able to spoof
connections. More details are given in security advisory
`FreeBSD-SA-03:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:03.syncookies.asc>`__.

A remotely-exploitable buffer overflow vulnerability in **sendmail** has
been fixed by updating **sendmail** to version 8.12.8. For more details,
see security advisory
`FreeBSD-SA-03:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:04.sendmail.asc>`__.

A bounds-checking bug in the XDR implementation, which could allow a
remote attacker to cause a denial-of-service, has been fixed. For more
details see security advisory
`FreeBSD-SA-03:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:05.xdr.asc>`__.

Two recently-publicized flaws in **OpenSSL** have been corrected. For
more details, see security advisory
`FreeBSD-SA-03:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:06.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
--------------------

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now accepts a value of ``max`` for its ``-s`` option to set the drive's
maximum write speed.

`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
now supports a ``speed`` command to set the maximum speed to be used by
the drive (the maximum possible speed can be selected setting the speed
to ``max``).

The ``compat4x`` distribution now includes the ``libcrypto.so.2`` and
``libssl.so.2`` libraries from FreeBSD 4.7-RELEASE.

The
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
utility has been added to help users access and control the FireWire
subsystem.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now supports a ``-h`` option to disable printing any host-specific
information, such as the
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
version or hostname, in server messages.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now supports a ``-P`` option to specify a port on which to listen in
daemon mode. The default data port number is now set to be one less than
the control port number, rather than being hard-coded.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now supports an extended format of the ``/etc/ftpchroot`` file. Please
refer to the
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5&manpath=FreeBSD+4.8-RELEASE>`__
manpage, which is now available, for details.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now supports login directory pathnames that specify simultaneously a
directory for
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__
and that to change to in the chrooted environment. The ``/./`` separator
is used for this purpose, like in other FTP daemons having this feature.
It may be used in both
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5&manpath=FreeBSD+4.8-RELEASE>`__
and
`passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+4.8-RELEASE>`__.

The
`getconf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getconf&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
utility has been added. It prints the values of POSIX or X/Open path or
system configuration variables.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now supports ``enable`` and ``disable`` commands to control various
aspects of the operation of
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
(including enabling and disabling the firewall itself). These provide a
more convenient and visible interface than the existing sysctl
variables.

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
now supports a ``-C`` flag to change to a given directory before
building its target(s).

`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now supports a ``-c`` to avoid doing a
`connect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=connect&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__
for UDP mount points. This option must be used if the server does not
reply to requests from the standard NFS port number 2049 or if it
replies to requests using a different IP address (which can occur if the
server is multi-homed). Setting the ``vfs.nfs.nfs_ip_paranoia`` sysctl
to ``0`` will make this option the default.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now supports a ``W`` flag to force previously-started compression jobs
for an entry (or group of entries specified with the ``G`` flag) to
finish before beginning a new one. This feature is designed to prevent
system overloads caused by starting several compression jobs on big
files simultaneously.

The
`pathchk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pathchk&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
utility, which checks pathnames for validity or portability between
POSIX systems, has been added.

`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
can now add a user whose name ends with a ``$`` character; this change
is intended to help administration of **Samba** services.

`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
now accepts a ``-t`` flag to specify an alternative directory to
``/tftpboot``.

The base64 capabilities of
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
and
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
can now be automatically enabled by invoking these utilities as
`b64encode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64encode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
and
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
respectively.

The definitions of the standard file streams (``stdin``, ``stdout``, and
``stderr``) have changed so that they are no longer compile-time
constants. Some older binaries may require updated 3.X compatability
libraries (for example, by setting ``COMPAT3X=yes`` for a
buildworld/installworld).

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

**BIND** has been updated to version 8.3.4.

All of the **bzip2** suite of applications is now installed in the base
system (in particular, ``bzip2recover`` is now built and installed).

**CVS** has been updated to 1.11.5.

**FILE** has been updated to 3.41.

**groff** and its related utilities have been updated to FSF version
1.18.1.

**Heimdal Kerberos** has been updated to 0.5.1.

The **ISC DHCP** client has been updated to 3.0.1RC11.

**libz** has been updated to 1.1.4.

**OpenSSH** has been updated to 3.5p1.

**OpenSSL** has been updated to release 0.9.7a. Among other features,
this release includes support for AES and takes advantage of
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
devices.

**sendmail** has been updated to version 8.12.8.

**tcpdump** has been updated to version 3.7.2.

The timezone database has been updated to the ``tzdata2002d`` release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2 Ports/Packages Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The one-line ``pkg-comment`` files have been eliminated from each port
skeleton; their contents have been moved into each port's ``Makefile``.
This change reduces the disk space and inodes used by the ports tree.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Release Engineering and Integration
---------------------------------------

The supported release of **GNOME** has been updated to 2.2.

The supported release of **KDE** has been updated to 3.1.

The supported release of **XFree86** has been updated to 4.3.0.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
=============================================

If you're upgrading from a previous release of FreeBSD, you generally
will have three options:

-  Using the binary upgrade option of
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__.
   This option is perhaps the quickest, although it presumes that your
   installation of FreeBSD uses no special compilation options.

-  Performing a complete reinstall of FreeBSD. Technically, this is not
   an upgrading method, and in any case is usually less convenient than
   a binary upgrade, in that it requires you to manually backup and
   restore the contents of ``/etc``. However, it may be useful in cases
   where you want (or need) to change the partitioning of your disks.

-  From source code in ``/usr/src``. This route is more flexible, but
   requires more disk space, time, and technical expertise. More
   information can be found in the `\`\`Using
   ``make             world``'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__
   section of the `FreeBSD
   Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.
   Upgrading from very old versions of FreeBSD may be problematic; in
   cases like this, it is usually more effective to perform a binary
   upgrade or a complete reinstall.

Please read the ``INSTALL.TXT`` file for more information, preferably
*before* beginning an upgrade. If you are upgrading from source, please
be sure to read ``/usr/src/UPDATING`` as well.

Finally, if you want to use one of various means to track the -STABLE or
-CURRENT branches of FreeBSD, please be sure to consult the
`\`\`-CURRENT vs.
-STABLE'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/current-stable.html>`__
section of the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

.. raw:: html

   <div class="IMPORTANT">

    **Important:** Upgrading FreeBSD should, of course, only be
    attempted after backing up *all* data and configuration files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
ftp://ftp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 4-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
