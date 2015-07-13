=======================================
FreeBSD/alpha 4.9-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.9-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.22.2.386 2003/10/19 18:33:34 bmah Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 4.9-RELEASE contain a summary of the
changes made to the FreeBSD base system since 4.8-RELEASE. Both changes
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
1 `Introduction <#INTRO>`__
2 `What's New <#NEW>`__
2.1 `Security Advisories <#SECURITY>`__
2.2 `Kernel Changes <#KERNEL>`__
2.2.1 `Platform-Specific Hardware Support <#PROC>`__
2.2.2 `Boot Loader Changes <#BOOT>`__
2.2.3 `Network Interface Support <#NET-IF>`__
2.2.4 `Network Protocols <#NET-PROTO>`__
2.2.5 `Disks and Storage <#DISKS>`__
2.2.6 `File Systems <#FS>`__
2.2.7 `PCCARD Support <#PCCARD>`__
2.2.8 `Multimedia Support <#MM>`__
2.3 `Userland Changes <#USERLAND>`__
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Ports/Packages Collection Infrastructure <#PORTS>`__
2.6 `Release Engineering and Integration <#RELENG>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 4.9-RELEASE on the
Alpha/AXP hardware platform. It describes new features of FreeBSD that
have been added (or changed) since 4.8-RELEASE. It also provides some
notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 4.9-RELEASE is a release distribution. It
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
------------

This section describes the most user-visible new or changed features in
FreeBSD since 4.8-RELEASE. Typical release note items document new
drivers or hardware support, new commands or options, major bugfixes, or
contributed software upgrades. Security advisories for the base system
that were issued after 4.8-RELEASE are also listed.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

A remotely-exploitable buffer overflow vulnerability in **sendmail** has
been fixed. For more details, see security advisory
`FreeBSD-SA-03:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:07.sendmail.asc>`__.
In FreeBSD 4.8-RELEASE, this vulnerability was fixed using a
vendor-supplied patch (but too late for inclusion in the release notes).
In FreeBSD 4.9-RELEASE, it has been fixed with the import of a new
version of **sendmail**.

A single-byte buffer overflow in
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+4.9-RELEASE>`__
has been fixed. See security advisory
`FreeBSD-SA-03:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:08.realpath.asc>`__.

A bug that could allow the kernel to attempt delivery of invalid signals
has been fixed. The bug could have led to a kernel panic. For more
information, see security advisory
`FreeBSD-SA-03:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:09.signal.asc>`__.

A bug in the iBCS2 emulation module, which could result in disclosing
the contents of kernel memory, has been fixed. This module is not
enabled in FreeBSD by default. For more information, see security
advisory
`FreeBSD-SA-03:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:10.ibcs2.asc>`__.

A programming error in the **sendmail** implementation of its \`\`DNS
maps'' feature has been fixed by the import of a new version of
**sendmail**. More information can be found in security advisory
`FreeBSD-SA-03:11 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:11.sendmail.asc>`__.
Note that this feature is not used by the default configuration files
shipped with FreeBSD.

A buffer management bug in **OpenSSH**, which could potentially cause a
crash, has been fixed. More information can be found in security
advisory
`FreeBSD-SA-03:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:12.openssh.asc>`__.

A buffer overflow in **sendmail** has been fixed. More information can
be found in security advisory
`FreeBSD-SA-03:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:13.sendmail.asc>`__.

A bug that could allow the kernel to cause resource starvation which
eventually results in a system panic in the ARP cache code has been
fixed. More information can be found in security advisory
`FreeBSD-SA-03:14 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:14.arp.asc>`__.

Several errors in the **OpenSSH** PAM challenge/authentication subsystem
have been fixed. The impacts of these bugs vary; details can be found in
security advisory
`FreeBSD-SA-03:15 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:15.openssh.asc>`__.

A bug in the
`readv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=readv&sektion=2&manpath=FreeBSD+4.9-RELEASE>`__
system call, which could potentially cause a system crash or privilege
escalation has been fixed. More information can be found in security
advisory
`FreeBSD-SA-03:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:16.filedesc.asc>`__.

A bug in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.9-RELEASE>`__
and
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.9-RELEASE>`__,
which could result in disclosing the contents of kernel memory, has been
fixed. More information can be found in security advisory
`FreeBSD-SA-03:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:17.procfs.asc>`__.

Four separate security flaws in **OpenSSL**, which could allow a remote
attacker to crash an **OpenSSL**-using application or to execute
arbitrary code with the privileges of the application, have been fixed.
More information can be found in security advisory
`FreeBSD-SA-03:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:18.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Platform-Specific Hardware Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Interface Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
now supports Broadcom 5705 based Gigabit Ethernet NICs.

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
driver once again transmits packets correctly through Davicom DC9102
cards.

The proatm driver has been added to support ProSum's ProATM
(IDT77252-based) interfaces. This driver is analogous to the patm driver
in FreeBSD-CURRENT.

`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
now supports SK-9521 V2.0 and 3COM 3C940 based Gigabit Ethernet NICs.

The suspend/resume support for the
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
driver now works correctly when the device is configured down.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

A bug in
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
limit rule processing that could cause various panics has been fixed.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
rules now support comma-separated address lists (such as 1.2.3.4,
5.6.7.8/30, 9.10.11.12/22), and allow spaces after commas to make lists
of addresses more readable.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
rules now support C++-style comments. Each comment is stored together
with its rule and appears using the
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
show command.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
can now modify
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
rules in set 31, which was read-only and used for the default rules.
They can be deleted by ``ipfw delete set 31`` command but are not
deleted by the ``ipfw flush`` command. This implements a flexible form
of \`\`persistent rules''. More details can be found in
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__.

Kernel support has been added for Protocol Independent Multicast
routing.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
driver no longer tries to send 6-byte commands to USB and Firewire
devices. Quirks for USB devices (which hopefully are now unnecessary)
have been disabled; to restore the old behavior, add options
DA\_OLD\_QUIRKS to the kernel configuration.

The
`twe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twe&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
driver now supports the 3ware generic API.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6 File Systems
^^^^^^^^^^^^^^^^^^

A new DIRECTIO kernel option enables support for read operations that
bypass the buffer cache and put data directly into a userland buffer.
This feature requires that the O\_DIRECT flag is set on the file
descriptor and that both the offset and length for the read operation
are multiples of the physical media sector size.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.7 PCCARD Support
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.8 Multimedia Support
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
now supports a -i option to limit the scope of the current operation to
the ARP entries on a particular interface. This option applies to the
display operations only. It should be useful on routers with numerous
network interfaces.

`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
now allows the optional setting of a user, primary group, or group list
to use inside the chroot environment via the -u, -g, and -G options
respectively.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
list and show command now support ranges of rule numbers.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
now supports a -n flag to test the syntax of commands without actually
changing anything.

The
`mount\_msdos(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdos&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
utility now supports a -M option to specify the maximum file permissions
for directories in the file system.

`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
now includes displays for IPv6 and ICMPv6 traffic.

`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
and
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
now support a -r flag for decoding raw (or broken) files that may be
missing the initial and possibly final framing lines.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**groff** has been updated from 1.18.1 to 1.19.

**lukemftpd** (not built by default) has been updated from a 1.2beta1 to
a 5 January 2003 snapshot from the NetBSD CVS repository.

**OpenSSL** has been updated from 0.9.7a to 0.9.7c.

**sendmail** has been updated to version 8.12.9.

**texinfo** has been updated from 4.5 to 4.6.

The timezone database has been updated from the ``tzdata2003a`` release
to the ``tzdata2003d`` release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
now supports a -C option, which allows packages to register a list of
other packages with which they conflict. They will refuse to install
(via
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__)
if one of the listed packages is already present. The -f flag to
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
overrides this conflict-checking.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported release of **GNOME** has been updated from 2.2 to 2.4.

The supported release of **KDE** has been updated from 3.1 to 3.1.4.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

If you're upgrading from a previous release of FreeBSD, you generally
will have three options:

-  Using the binary upgrade option of
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__.
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
   ``make world``'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__
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

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
