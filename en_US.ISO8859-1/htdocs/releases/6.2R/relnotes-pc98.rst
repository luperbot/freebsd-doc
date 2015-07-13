======================================
FreeBSD/pc98 6.2-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 6.2-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.883.2.52.2.7 2007/01/11 19:53:37 bmah Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of the FreeBSD Foundation.

IBM, AIX, EtherJet, Netfinity, OS/2, PowerPC, PS/2, S/390, and ThinkPad
are trademarks of International Business Machines Corporation in the
United States, other countries, or both.

IEEE, POSIX, and 802 are registered trademarks of Institute of
Electrical and Electronics Engineers, Inc. in the United States.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

Sparc, Sparc64, SPARCEngine, and UltraSPARC are trademarks of SPARC
International, Inc in the United States and other countries. Products
bearing SPARC trademarks are based upon architecture developed by Sun
Microsystems, Inc.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “®” symbol.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 6.2-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 6.2-STABLE development
line. This document lists applicable security advisories that were
issued since the last release, as well as significant changes to the
FreeBSD kernel and userland. Some brief remarks on upgrading are also
presented.

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
2.2.1 `Boot Loader Changes <#BOOT>`__
2.2.2 `Hardware Support <#PROC>`__
2.2.3 `Network Protocols <#NET-PROTO>`__
2.2.4 `Disks and Storage <#DISKS>`__
2.2.5 `File Systems <#FS>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 ```/etc/rc.d`` Scripts <#RC-SCRIPTS>`__
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Ports/Packages Collection Infrastructure <#PORTS>`__
2.6 `Release Engineering and Integration <#RELENG>`__
2.7 `Documentation <#DOC>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 6.2-RELEASE on the
NEC PC-98x1 hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

This distribution of FreeBSD 6.2-RELEASE is a release distribution. It
can be found at http://www.FreeBSD.org/snapshots/ or any of its mirrors.
More information on obtaining this (or other) release distributions of
FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
6.2-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 6.1-RELEASE.

Typical release note items document recent security advisories issued
after 6.1-RELEASE, new drivers or hardware support, new commands or
options, major bug fixes, or contributed software upgrades. They may
also list changes to major ports/packages or release engineering
practices. Clearly the release notes cannot list every single change
made to FreeBSD between releases; this document focuses primarily on
security advisories, user-visible changes, and major architectural
improvements.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

A bug in
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__,
which effectively disabled the ``/var/yp/securenets`` access control
mechanism, has been corrected. More details are available in security
advisory
`FreeBSD-SA-06:15.ypserv <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:15.ypserv.asc>`__.

A bug in the smbfs file system, which could allow an attacker to escape
out of
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+6.2-RELEASE>`__
environments on an smbfs mounted filesystem, has been fixed. For more
details, see security advisory
`FreeBSD-SA-06:16.smbfs <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:16.smbfs.asc>`__.

A potential denial of service problem in
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
caused by excessive recursion which leads to stack exhaustion when
attempting delivery of a malformed MIME message, has been fixed. For
more details, see security advisory
`FreeBSD-SA-06:17.sendmail <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:17.sendmail.asc>`__.

A potential buffer overflow condition in
`sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
has been corrected. For more details, see security advisory
`FreeBSD-SA-06:18.ppp <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:18.ppp.asc>`__.

An OpenSSL bug related to validation of PKCS#1 v1.5 signatures has been
fixed. For more details, see security advisory
`FreeBSD-SA-06:19.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:19.openssl.asc>`__.

A potential denial of service attack against
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
has been fixed. For more details, see security advisory
`FreeBSD-SA-06:20.bind <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:20.bind.asc>`__.

Several programming errors have been fixed in
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__.
They could have the effect of causing a crash or an infinite loop when
decompressing files. More information can be found in security advisory
`FreeBSD-SA-06:21.gzip <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:21.gzip.asc>`__.

Several vulnerabilities have been fixed in OpenSSH. More details can be
found in security advisory
`FreeBSD-SA-06:22.openssh <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:22.openssh.asc>`__.

Multiple errors in the OpenSSL
`crypto(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=3&manpath=FreeBSD+6.2-RELEASE>`__
library have been fixed. Potential effects are varied, and are
documented in more detail in security advisory
`FreeBSD-SA-06:23.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:23.openssl.asc>`__.

A bug that could permit corrupt archives to cause an infinite loop in
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+6.2-RELEASE>`__
and
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
has been fixed. More details are available in
`FreeBSD-SA-06:24.libarchive <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:24.libarchive.asc>`__.

A bug that could allow users in the ``operator`` group to read parts of
kernel memory has been corrected. For more details, consult security
advisory
`FreeBSD-SA-06:25.kmem <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:25.kmem.asc>`__.

A bug in the ``jail`` startup script that could permit privilege
escalation via a symlink attack has been fixed. More information is
available in
`FreeBSD-SA-07:01.jail <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:01.jail.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

Security event auditing is now supported in the FreeBSD kernel, and is
enabled by the ``AUDIT`` kernel configuration option. More information
can be found in the
`audit(4) <http://www.FreeBSD.org/cgi/man.cgi?query=audit&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
manual page.

Several workarounds for bugs in the
`tty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tty&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
layer have been added; these changes prevent a variety of observed
kernel panics.

A bug has been fixed in the statistics-keeping code in the kernel's UMA
memory allocator. This caused a count of memory allocation failures (as
shown by ``netstat -m``) to increase erroneously.

FreeBSD now runs on the Xbox, whose architecture is nearly identical to
the i386. For details of the latest development, see
http://www.FreeBSD.org/platforms/xbox.html.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

A bootable CDROM loader has been implemented for the pc98 platform.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The
`amdsmb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amdsmb&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been added. It provides support for the AMD-8111 SMBus 2.0
controller.

Support for the PadLock Security Co-processor in VIA C3, Eden, and C7
processors has been added to the
`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+6.2-RELEASE>`__
subsystem. More information can be found in the
`padlock(4) <http://www.FreeBSD.org/cgi/man.cgi?query=padlock&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
manual page.

The
`nfsmb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsmb&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver, which supports the NVIDIA nForce 2/3/4 SMBus 2.0 controller, has
been added.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been updated to HAL version 0.9.17.2.

Some improvements have been made to the
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver to improve its stability. One user-visible aspect of these
changes is that transmit-side checksum offload involving IP fragments
has been disabled, because it was not handled correctly by the hardware.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been updated to version 6.2.9 from Intel. Among other
changes, it adds support for a number of new adapters. Compiling the
driver with the ``EM_FAST_INTR`` preprocesor symbol defined will enable
optional “fast interrupt” processing. “Fast interrupt” processing, as
implemented in this version of the driver, has been shown to yield
significant performance improvements in some cases, but has been linked
to stability issues in other cases.

A number of improvements and bugfixes have been made to the
functionality of the
`iwi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwi&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver. This driver now requires the firmware image in the
```net/iwi-firmware-kmod`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/iwi-firmware-kmod/pkg-descr>`__
port/package; prior versions of this driver used the
```net/iwi-firmware`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/iwi-firmware/pkg-descr>`__
port/package.

The
`my(4) <http://www.FreeBSD.org/cgi/man.cgi?query=my&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver now has
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
support.

The
`nve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nve&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been updated to version 1.0-0310 (23-Nov-2005). It also now
has
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
support.

The
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver is now MPSAFE.

The
`stge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stge&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been added. It supports the Sundance/Tamarack TC9021 Gigabit
Ethernet controller and was ported from NetBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

Multiple copies of a packet received via different
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
listeners now all have identical timestamps.

The
`enc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=enc&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
IPsec filtering pseudo-device has been added. It allows firewall
packages using the
`pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9&manpath=FreeBSD+6.2-RELEASE>`__
framework to examine (and filter) IPsec traffic before outbound
encryption and after inbound decryption.

The sysctl variables ``net.inet.ip.portrange.reservedhigh`` and
``net.inet.ip.portrange.reservedlow`` can be used with IPv6 now.

The ``IPFIREWALL_FORWARD_EXTENDED`` kernel option has been removed. This
option was used to permit
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
to redirect packets with local destinations. This behavior is now always
enabled when the ``IPFIREWALL_FORWARD`` kernel option is enabled.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
packet filter now supports ``tag`` and ``untag`` rule keywords. When a
packet matches a rule with the ``tag`` keyword, the numeric tag for the
given number in the range from 0 to 65535 will be attached to the
packet. The tag acts as an internal marker (it is not sent out over the
wire) that can be used to identify these packets later on, for example,
by using ``tagged`` rule option. For more details, see
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__.

The
`ng\_ether(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ether&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
Netgraph node no longer overwrites the MAC address of outgoing frames by
default.

The
`ng\_tag(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_tag&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
Netgraph node has been added to support the manipulation of mbuf tags
attached to data in the kernel.

Support for
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+6.2-RELEASE>`__
operations has been added to the
`tun(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tun&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver.

FreeBSD 6.1-RELEASE contained a bug in the IPv6 implementation, which
caused spurious error messages to be printed for point-to-point
interfaces. This problem has been corrected.

IPv6 link-local addresses are now enabled only if ``ipv6_enable`` is set
in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.2-RELEASE>`__.

A bug that prevented
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
from working correctly in some IPv6 environments has been fixed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been updated to version 1.20.00.13.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver now supports USB mass storage class devices. To enable it, a line
``device atausb`` in the kernel configuration file or loading the
``atausb`` kernel module is needed. Note that this functionality cannot
coexist with the
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been updated to reflect the version in FreeBSD CURRENT.

`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
is now able to perform data integrity verification (data authentication)
of encrypted data stored on disk. Note that the encryption algorithm is
now specified to the
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
control program using the ``-e`` option; the ``-a`` option is now used
to specify the authentication algorithm.

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+6.2-RELEASE>`__
driver has been updated to reflect the version in FreeBSD CURRENT.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

Several bugs related to locking have been fixed in
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+6.2-RELEASE>`__.
These fixes prevent several observed deadlock conditions.

The
`linsysfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linsysfs&sektion=5&manpath=FreeBSD+6.2-RELEASE>`__
pseudo-filesystem driver has been added. It provides a subset of the
Linux ``sys`` filesystem, and is required for the correct operation of
some Linux binaries (such as the LSI MegaRAID SAS utility).

A deadlock observed when both quotas and snapshots were in use on a file
system on FreeBSD 6.1-RELEASE has been corrected.

A performance regression with NFS servers running FreeBSD 6.1-RELEASE,
caused by a leak of the Giant kernel lock, has been fixed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

The
`asf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=asf&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility has been revised and extended. Now it can operate via several
interfaces including
`kvm(3) <http://www.FreeBSD.org/cgi/man.cgi?query=kvm&sektion=3&manpath=FreeBSD+6.2-RELEASE>`__,
which supports not only live systems, but also kernel crash dumps.

The OpenBSM userland tools, including
`audit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=audit&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__,
`auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__,
`auditreduce(1) <http://www.FreeBSD.org/cgi/man.cgi?query=auditreduce&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__,
and
`praudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=praudit&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__,
have been added.

The
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports a ``-l`` option, which causes it to create
hardlinks to the source files instead of copying them.

The
`csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility has been imported. This is an implementation of a
CVSup-compatible client written in the C language. Note that it
currently supports checkout mode only.

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
program now sends the host's name in DHCP requests if it is not
specified in the configuration file.

The
`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
program now supports a ``-n`` flag, which causes it to ignore files and
directories with the ``nodump`` flag set.

The
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
program now supports ``-Btime`` and other related primaries, which can
be used to create expressions based on a file's creation time.

The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility, a tool for managing binary updates to the FreeBSD base system,
has been added.

The
`fsdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsdb&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports changing the birth time of files on UFS2 file
systems using the new ``btime`` command.

The
`fsdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsdb&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
program now supports a ``findblk`` command, which finds the inode(s)
owning a specific disk block.

The
`getent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getent&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility has been imported from NetBSD. It retrieves and displays
information from an administrative database (such as ``hosts``) using
the lookup order specified in
`nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5&manpath=FreeBSD+6.2-RELEASE>`__.

The
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports a ``-A`` flag to print process audit properties,
including the audit user id.

The
`iostat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iostat&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports a ``-x`` flag (inspired by Solaris) to print
extended disk statistics. If the new ``-z`` flag is also specified, no
output is made for disks with no activity.

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
program now supports a ``-s`` option to specify a jail's securelevel.

The
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports ``-u`` and ``-U`` flags to specify username
credentials under which a command should be executed.

The
`logger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logger&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports a ``-P``, which specifies the port to which syslog
messages should be sent.

The
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports an ``-U`` flag to use the file creation time for
sorting.

The
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports a ``late`` keyword in
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+6.2-RELEASE>`__,
along with a corresponding ``-l`` command-line option to specify that
these “late” file systems should be mounted.

The
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
command now supports a ``-W`` option to specify the maximum time to wait
for an echo reply.

The
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility (also known as
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__)
has been moved from ``/usr/bin`` to ``/bin`` so that it can be used by
startup scripts. Symbolic links from its former location have been
created for backward compatibliity.

An extensible implementation of
`printf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=3&manpath=FreeBSD+6.2-RELEASE>`__,
compatible with GLIBC, has been added to ``libc``. It is only used if
the environment variable ``USE_XPRINTF`` is defined, one of the
extension functions is called, or the global variable ``__use_xprintf``
is set to a value greater than ``0``. Five extensions are currently
supported: ``%H`` (hex dump), ``%T`` (``time_t`` and time-related
structures), ``%M`` (errno message), ``%Q`` (double-quoted, escaped
string), ``%V``
(`strvis(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strvis&sektion=3&manpath=FreeBSD+6.2-RELEASE>`__-format
string),

The DNS resolver library in FreeBSD's **libc** has been updated to that
from BIND 9.3.3.

The
`tail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tail&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports a ``-q`` flag to suppress header lines when
multiple files are specified.

The
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
program now supports a ``-D`` flag, which causes it to display the
differences between the sent and received packets.

The
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility now supports a ``-e`` option, which sets a fixed destination
port for probe packets. This can be useful for tracing behind
packet-filtering firewalls.

`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
now decodes the complete set of ICMP unreachable messages in its output.

The compiler toolchain is now capable of generating executables for
systems using the ARM processor.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``auditd`` script for OpenBSM
`auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
has been added.

A bug in the ``rc.d/jail`` startup script, which caused a number of
problems for users attempting to use jails on FreeBSD 6.1-RELEASE, has
been corrected.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**BIND** has been updated from 9.3.1 to 9.3.3.

**GCC** has been updated from 3.4.4 to 3.4.6.

**IPFilter** has been updated from 4.1.8 to 4.1.13.

**less** has been updated from v381 to v394.

**libpcap** has been updated from 0.9.1 to 0.9.4.

**lukemftpd** has been updated from a snapshot from NetBSD as of 9
August 2004 to a snapshot from NetBSD as of 31 August 2006.

**netcat** has been updated from the version in a 4 February 2005
OpenBSD snapshot to the version included in OpenBSD 3.9.

**OpenSSH** has been updated from 4.2p1 to 4.5p1.

**sendmail** has been updated from 8.13.6 to 8.13.8.

**tcpdump** has been updated from 3.9.1 to 3.9.4.

The timezone database has been updated from the **tzdata2005r** release
to the **tzdata2006g** release.

TrustedBSD **OpenBSM**, version 1.0 alpha 12, an implementation of the
documented Sun Basic Security Module (BSM) Audit API and file format, as
well as local extensions to support the Mac OS X and FreeBSD operating
systems has been added. This also includes command line tools for audit
trail reduction and conversion to text, as well as documentation of the
commands, file format, and APIs. For this functionality, the ``AUDIT``
kernel option, ``/var/audit`` directory, and ``audit`` group have been
added.

**zlib** has been updated from version 1.2.2 to version 1.2.3.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+6.2-RELEASE>`__
now supports an ``-F`` flag to disable checking whether the same package
is already installed or not.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
utility now displays the running FreeBSD version in menu titles.

The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
program contained a bug that could prevent it from installing a kernel
if no distribution was explicitly selected at install-time. This bug has
now been fixed.

A bug in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__
that sometimes prevented package installs from multiple CDROM volumes
has been fixed.

A ``/media`` directory has been added to contain mount points for
removable media such as CDROMs, floppy disks, USB drives, and so on.

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.12.3 to 2.16.1. As a part of this update, the
default prefix for **GNOME** (and some related programs) has moved from
``/usr/X11R6`` to ``/usr/local``. This version of **GNOME** also adds
support for the Hardware Abstraction Layer (HAL), which provides
features such as auto-mounting removable media, auto-playing CDs, and
more integrated power control.

The supported version of the **KDE** desktop environment
(```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
has been updated from 3.5.1 to 3.5.4.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7 Documentation
~~~~~~~~~~~~~~~~~

The manual pages for **NTP** have been updated to 4.2.0, to match the
version of code actually included in FreeBSD.

Documentation of existing functionality has been improved by the
addition of the following manual pages:
`nanobsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nanobsd&sektion=8&manpath=FreeBSD+6.2-RELEASE>`__,
`sysctl(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=9&manpath=FreeBSD+6.2-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

Source upgrades to FreeBSD 6.2-RELEASE are only supported from FreeBSD
5.3-RELEASE or later. Users of older systems wanting to upgrade
6.2-RELEASE will need to update to FreeBSD 5.3 or newer first, then to
FreeBSD 6.2-RELEASE.

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
http://www.FreeBSD.org/snapshots/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 6.2-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
