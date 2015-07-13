=======================================
FreeBSD/amd64 5.2-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/amd64 5.2-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.663.2.5 2004/01/09 17:08:32 bmah Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 5.2-RELEASE contain a summary of recent
changes made to the FreeBSD base system on the 5-CURRENT development
branch. This document lists applicable security advisories that were
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
2.2.1 `Platform-Specific Hardware Support <#PROC>`__
2.2.2 `Boot Loader Changes <#BOOT>`__
2.2.3 `Network Interface Support <#NET-IF>`__
2.2.4 `Network Protocols <#NET-PROTO>`__
2.2.5 `Disks and Storage <#DISKS>`__
2.2.6 `File Systems <#FS>`__
2.2.7 `Multimedia Support <#MM>`__
2.3 `Userland Changes <#USERLAND>`__
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

This document contains the release notes for FreeBSD 5.2-RELEASE on the
AMD64 hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

This distribution of FreeBSD 5.2-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `\`\`Obtaining FreeBSD''
appendix <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

Users who are new to the 5-CURRENT series of FreeBSD releases should
also read the \`\`Early Adopters Guide to FreeBSD 5.2-RELEASE''. This
document can generally be found in the same location as the release
notes (either as a part of a FreeBSD distribution or on the FreeBSD Web
site). It contains important information regarding the advantages and
disadvantages of using FreeBSD 5.2-RELEASE, as opposed to releases based
on the FreeBSD 4-STABLE development branch.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with \`\`late-breaking''
information discovered late in the release cycle or after the release.
Typically, it contains information on known bugs, security advisories,
and corrections to documentation. An up-to-date copy of the errata for
FreeBSD 5.2-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes many of the user-visible new or changed features
in FreeBSD since 5.1-RELEASE. It includes items that are unique to the
5-CURRENT branch, as well as some features that may have been recently
merged to other branches (after FreeBSD 5.1-RELEASE). The latter items
are marked as [MERGED].

Typical release note items document recent security advisories issued
after 5.1-RELEASE, new drivers or hardware support, new commands or
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

A single-byte buffer overflow in
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+5.2-RELEASE>`__
was fixed. Although the fix was committed prior to FreeBSD 5.1-RELEASE
(and thus 5.1-RELEASE was not affected), it was not noted in the release
documentation. See security advisory
`FreeBSD-SA-03:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:08.realpath.asc>`__.
[MERGED]

A bug that could allow the kernel to attempt delivery of invalid signals
has been fixed. The bug could have led to a kernel panic or, under some
circumstances, unauthorized modification of kernel memory. For more
information, see security advisory
`FreeBSD-SA-03:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:09.signal.asc>`__.
[MERGED]

A bug in the iBCS2 emulation module, which could result in disclosing
the contents of kernel memory, has been fixed. This module is not
enabled in FreeBSD by default. For more information, see security
advisory
`FreeBSD-SA-03:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:10.ibcs2.asc>`__.
[MERGED]

A buffer management bug in **OpenSSH**, which could potentially cause a
crash, has been fixed. More information can be found in security
advisory
`FreeBSD-SA-03:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:12.openssh.asc>`__.
[MERGED]

A buffer overflow in **sendmail** has been fixed. More information can
be found in security advisory
`FreeBSD-SA-03:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:13.sendmail.asc>`__.
[MERGED]

A bug that could allow the kernel to cause resource starvation which
eventually results in a system panic in the ARP cache code has been
fixed. More information can be found in security advisory
`FreeBSD-SA-03:14 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:14.arp.asc>`__.
[MERGED]

Several errors in the **OpenSSH** PAM challenge/response authentication
subsystem have been fixed. The impacts of these bugs vary; details can
be found in security advisory
`FreeBSD-SA-03:15 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:15.openssh.asc>`__.
[MERGED]

A bug in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__
and
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__,
which could result in disclosing the contents of kernel memory, has been
fixed. More information can be found in security advisory
`FreeBSD-SA-03:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:17.procfs.asc>`__.
[MERGED]

Four separate security flaws in **OpenSSL**, which could allow a remote
attacker to crash an **OpenSSL**-using application or to execute
arbitrary code with the privileges of the application, have been fixed.
More information can be found in security advisory
`FreeBSD-SA-03:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:18.openssl.asc>`__.
[MERGED]

A potential denial of service in **BIND** has been fixed. For more
information, see security advisory
`FreeBSD-SA-03:19 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:19.bind.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver's CPU component now supports idle states C1-C3 for both single
and SMP systems, providing power/heat savings when the processor is
idle, according to ACPI 2.0. Additionally, the throttling support has
been updated to ACPI 2.0.

The
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
\`\`dumb console'' driver has been added to provide a local and remote
console. It can be accessed over FireWire using the
`dcons\_crom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons_crom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver. A
`dconschat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dconschat&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility provides user access to
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
devices.

A multi-byte character set conversion method is now supported by the
LIBICONV kernel option.

The
`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
PCI Universal Communications driver now supports connecting parallel
ports to the
`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver.

The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver has been added to support various classes of UART (Universal
Asynchronous Receiver/Transmitter) devices. It is an analog of the
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver but supports a wider range of devices. This driver is necessary
to support serial ports on certain architectures, such as ia64 and
sparc64.

A kernel software watchdog facility has been implemented. For more
information, see
`watchdog(4) <http://www.FreeBSD.org/cgi/man.cgi?query=watchdog&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`watchdogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=watchdogd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__.

The swap pager has been revamped. Among user-visible changes are a
change in the layout policy (from fixed-width striping to a round-robin
across devices) for better I/O throughput, the elimination of
compile-time limits on the number of swap devices, and a reduction in
memory overheads.

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

The new
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`ath\_hal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath_hal&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers provide support for 802.11a/b/g devices based on the AR5210,
AR5211, and AR5212 chips.

The
`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver has been added to support Broadcom BCM4401 based Fast Ethernet
adapters.

`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
now supports Broadcom 5705 based Gigabit Ethernet NICs. [MERGED]

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver that prevented it from working correctly at 10 Mbps has been
fixed.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver now has support for tuning the interrupt delays using sysctl
tunables without recompiling the driver.

The
`fatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver has been added. This is a driver for NATM and NgATM that supports
Fore/Marconi PCA200 ATM cards.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver has been added. It provides support for the RealTek RTL8139C+,
RTL8169, RTL8169S and RTL8110S PCI Fast Ethernet and Gigabit Ethernet
controllers.

`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
now supports SK-9521 V2.0 and 3COM 3C940 based Gigabit Ethernet NICs.
[MERGED]

A new
`utopia(4) <http://www.FreeBSD.org/cgi/man.cgi?query=utopia&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver supports 25MBit/sec, 155MBit/sec and 622MBit/sec ATM physical
layer configuration, status and statistics reporting for the most
commonly used ATM-PHY chips.

The suspend/resume support for the
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver now works correctly when the device is configured down. [MERGED]

The
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver should once again work correctly with Lucent 802.11b interfaces.

The 802.11 support layer has been rewritten to allow for future growth
and new features.

The
`xe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver now supports CE2, CEM28, and CEM33 cards, and
`multicast(4) <http://www.FreeBSD.org/cgi/man.cgi?query=multicast&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
datagrams. Also several bugs in the driver have been fixed.

A number of network drivers have had their interrupt handlers marked as
MPSAFE, meaning they can run without the Giant lock. Among the drivers
so converted are:
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`sn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
and
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

The ip\_flow feature in the IPv4 protocol implementation has been
replaced by the ip\_fastforward feature. ip\_fastforward attempts to
speed up simple cases of packet forwarding, processing a forwarded
packet to an outgoing interface without queues or netisrs. If it cannot
handle a particular packet, it passes that packet to the normal
ip\_input routines for processing. This feature can be enabled by
setting the net.inet.ip.fastforwarding sysctl variable to 1.

The IP\_ONESBCAST option has been added to enable undirected
`ip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
broadcasts to be sent to specific network interfaces.

Enabling the options IPFILTER feature also requires enabling options
PFIL\_HOOKS.

A bug in
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
limit rule processing that could cause various panics has been fixed.
[MERGED]

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
rules now support comma-separated address lists (such as 1.2.3.4,
5.6.7.8/30, 9.10.11.12/22), and allow spaces after commas to make lists
of addresses more readable. [MERGED]

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
rules now support C++-style comments. Each comment is stored together
with its rule and appears using the
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
show command. [MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
can now modify
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
rules in set 31, which was read-only and used for the default rules.
They can be deleted by ``ipfw delete set 31`` command but are not
deleted by the ``ipfw flush`` command. This implements a flexible form
of \`\`persistent rules''. More details can be found in
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__.
[MERGED]

The
`ng\_atmpif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_atmpif&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
NetGraph node type has been added. It emulates a HARP physical
interface, and allows one to run the HARP ATM stack without real
hardware.

Kernel support has been added for Protocol Independent Multicast routing
(`pim(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pim&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__).
[MERGED]

The FreeBSD Bluetooth protocol stack has been updated:

-  **libsdp** has been re-implemented under a BSD style license. This is
   because the Linux BlueZ code is distributed under the GPL.

-  The
   `hccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hccontrol&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   utility now supports four new commands: Read/Write\_Page\_Scan\_Mode
   and Read/Write\_Page\_Scan\_Period\_Mode.

-  The
   `hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   daemon now stores link keys on a disk. It is no longer required to
   pair devices every time.

-  A NetGraph timeout problem in the
   `ng\_hci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   and
   `ng\_l2cap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2cap&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   kernel modules, which could cause access to a data structure that was
   already freed, has been fixed.

-  The
   `ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   module, which cannot be built on FreeBSD 5.1-RELEASE, has been fixed.

-  `rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
   and
   `rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   now support to query the RFCOMM channel via SDP from the server.
   Specifying the RFCOMM channel manually, this behavior can be disabled
   and these utilities will not use SDP query.

-  The
   `sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   utility, which is analogous to the sdptool utility in the Linux BlueZ
   SDP package, has been added.

A number of fixes and updates to the IPv6 and IPSec code have been
imported from the KAME Project.

Support for the IPv6 Advanced Sockets API now conforms to RFC 3542 (also
known as RFC 2292bis), rather than RFC 2292. Applications using this API
have been updated accordingly.

Support for the source address selection part of RFC 3484 has been
added. The
`ip6addrctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6addrctl&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility can be used to configure the address selection policy.

The tcp\_hostcache feature has been added to the TCP implementation. It
caches measured parameters of past TCP sessions to provide better
initial start values for following connections from or to the same
source or destination. Similar information that used to be stored in the
routing table has been removed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver now has system crashdump support. [MERGED]

A major rework of the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver has been committed. One of the more notable changes is that the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver is now out from under the Giant kernel lock. Note that ATA
software RAID systems must now include device ataraid in their kernel
configuration files, as it is no longer automatically implied by device
atadisk.

`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
can now operate on raw disks and other
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
providers.

The
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver no longer tries to send 6-byte commands to USB and FireWire
devices. The quirks for these devices (which hopefully are now
unnecessary) have been disabled; to restore the old behavior, add
options DA\_OLD\_QUIRKS to the kernel configuration. [MERGED]

Various
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
modules can now be loaded as kernel modules, namely: ``geom_apple``,
``geom_bde``, ``geom_bsd``, ``geom_gpt``, ``geom_mbr``, ``geom_pc98``,
``geom_sunlabel``, ``geom_vol_ffs``.

A GEOM\_FOX module has been added to detect and select between multiple
redundant paths to the same device.

The
`twe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver now supports the 3ware generic API. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6 File Systems
^^^^^^^^^^^^^^^^^^

Multi-byte character conversion with the cd9660, msdosfs, ntfs, and udf
filesystems is now supported by including the CD9660\_ICONV,
MSDOSFS\_ICONV, NTFS\_ICONV, and UDF\_ICONV kernel options,
respectively.

Some off-by-one errors in the smbfs that prevented it from working
correctly with 15-character NetBIOS names have been fixed.

The sizes of some members of the statfs structure have changed from 32
bits to 64 bits in order to better support multi-terabyte filesystems.

-  Users performing source upgrades across this change must ensure that
   their kernel and userland bits are in sync, by following the
   documented source upgrade procedures.

-  A backward compatibility version of the
   `statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2&manpath=FreeBSD+5.2-RELEASE>`__
   system call exists but only if the COMPAT\_FREEBSD4 kernel option is
   defined. Including this option in the kernel is strongly encouraged.

-  Programs that use the
   `statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2&manpath=FreeBSD+5.2-RELEASE>`__
   will need to be recompiled. Among the known examples are the
   ```devel/gnomevfs2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs2/pkg-descr>`__,
   ```mail/postfix`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/postfix/pkg-descr>`__,
   and
   ```security/cfg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/security/cfg/pkg-descr>`__
   ports.

Support for NFSv4 has been added with the import of the University of
Michigan's Citi NFSv4 client implementation. More information can be
found in the
`mount\_nfs4(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs4&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
and
`idmapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=idmapd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
manual pages.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.7 Multimedia Support
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

`acpiconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpiconf&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -i option to print battery information.

`acpidb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidb&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
an ACPI DSDT debugger, has been added.

`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -i option to limit the scope of the current operation to
the ARP entries on a particular interface. This option applies to the
display operations only. It should be useful on routers with numerous
network interfaces. [MERGED]

The
`atmconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atmconfig&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
program has been added for configuration of the ATM drivers and
IP-over-ATM functionality.

`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now allows the optional setting of a user, primary group, or group list
to use inside the chroot environment via the -u, -g, and -G options
respectively. [MERGED]

The ``compat4x.i386`` libraries have been updated to correspond to those
available in FreeBSD 4.9-RELEASE.

The dev\_mkdb utility is unnecessary due to the mandatory presence of
devfs, and has been removed.

`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now polls the state of network interfaces and only sends DHCP requests
on interfaces that are up. The polling interval can be controlled with
the -i option.

The default mode for the ``lost+found`` directory of
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
is now 0700 instead of 01777. [MERGED]

`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
and
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now create a ``.snap`` directory in the root directory of each
filesystem, with group ``operator``.
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
and
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
will write their filesystem snapshots to this directory. This change
avoids locking access to the root directory of a filesystem during
snapshot creation and also helps non-\ ``root`` users create snapshots.

The
`ffsinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ffsinfo&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility has been updated to understand UFS2 filesystems and has been
re-enabled.

The
`iasl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iasl&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility, a compiler/decompiler for ACPI Source Language (ASL) and ACPI
Machine language (AML), has been added.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now supports a staticarp option for an interface, which disables the
sending of ARP requests for that interface.

A fix in the
`initgroups(3) <http://www.FreeBSD.org/cgi/man.cgi?query=initgroups&sektion=3&manpath=FreeBSD+5.2-RELEASE>`__
library function now causes logins to fail if the login process is
unable to successfully set the process credentials to include *all*
groups defined for a user. The current kernel limit is 16 groups;
administrators may wish to check that users do not have more than 16
groups defined, or they will be unable to log in.

The
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
list and show commands now support ranges of rule numbers. [MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -n flag to test the syntax of commands without actually
changing anything. [MERGED]

`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -p option to display only the trace events corresponding
to a specific process, as well as a new -E flag to display timestamps
relative to the start of the dump.

`last(1) <http://www.FreeBSD.org/cgi/man.cgi?query=last&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -n flag to limit the number of lines in its output
report.

The ``libalias`` library,
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
and
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now support Cisco Skinny Station protocol, which is the protocol used by
Cisco IP phones to talk to Cisco Call Managers. Note that currently
having the Call Manager behind the NAT gateway is not supported.
[MERGED]

The ``libcipher`` DES cryptography library has been removed. All of its
functionality is provided by the ``libcrypto`` library, and all base
systems programs that used ``libcipher`` have been converted to use
``libcrypto`` instead.

The ``libkiconv`` library has been added to support working with
loadable character set conversion tables in the kernel.

``libwrap`` and
`tcpdchk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdchk&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
are now configured to support the extended **tcp\_wrappers** syntax by
default.

The
`locale(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locale&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
utility has been re-implemented and is now POSIX-compliant. A new -m
option shows all available codesets.

The
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility now supports to display the filesystem ID for each file system
in addition to the normal information when a -v flag is specified, and
the
`umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility now accepts the filesystem ID as well as the usual device and
path names. This allows to unambiguously specify which file system is to
be unmounted even when two or more file systems share the same device
and mount point names.

The
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
`mount\_ntfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_ntfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
and
`mount\_udf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_udf&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utilities now support a -C option to specify local character sets to
convert Unicode filenames. It is possible to specify multi-byte
character sets using this option.

The
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility now supports a -M option to specify the maximum file permissions
for directories in the file system. [MERGED]

The
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utility now supports a -D option to specify MS-DOS codepages and a -L
option to specify local character sets. They are used to convert
character sets of filenames. The ``/usr/libdata/msdosfs`` tables have
been retired.

The
`mount\_nwfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nwfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
`mount\_portalfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_portalfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
and
`mount\_smbfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_smbfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
utilities have been moved from ``/sbin`` to ``/usr/sbin``.

The
`nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
program has been reimplemented in C (it was formerly a shell script).

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__
variable ntpd\_flags for
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now includes -f /var/db/ntpd.drift by default.

The
`pam\_guest(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_guest&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
PAM module has been added to allow guest logins. It replaces the
pam\_ftp(8) module.

`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
and
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
now support a -H flag to display all kernel-visible threads in each
process.

A bug that
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
does not recognize removable Ethernet NICs has been fixed.

`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -n flag to display users and groups numerically.

`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
now includes \`\`libmap'' functionality by default; the WITH\_LIBMAP
compile knob is unnecessary and has been retired. More information can
be found in
`libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__.

`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -C flag that merely indicates the existence or absence of
a coredump file.

The symorder utility has been removed. It is unnecessary now that all
kernels use ELF format and there is no a.out format toolchain.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
now gives the ability to select an alternate MTA during installation.
Currently, **exim** and **Postfix** are supported.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
no longer supports system \`\`security profiles''; this feature has been
replaced by individual tuning knobs to enable and disable
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
and set the system securelevels.

`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
now includes displays for IPv6 and ICMPv6 traffic. [MERGED]

`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
now supports a -i flag to return the kernel identification. This name is
also available via the kern.ident sysctl variable.

A number of utilities available in ``/bin`` and ``/sbin`` are now
available as a statically-linked \`\`crunched'' binary that lives in
``/rescue``. This functionality is similar to the ``/stand`` directory
installed by
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
but ``/rescue`` includes more functionality and is updated as part of
buildworld/installworld operations. More details can be found in
`rescue(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rescue&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__.

Many executables in ``/bin`` and ``/sbin`` are now built using dynamic,
rather than static linking. This feature brings support for loadable PAM
and NSS modules to base system utilities located in those directories.
It also reduces the storage requirements for the root filesystem due to
the use of shared libraries. This feature can be disabled in a
buildworld by defining the Makefile variable NO\_DYNAMICROOT. Note that
statically-linked, crunched executables are available in the ``/rescue``
directory for use during system repair and recovery operations.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

The **ACPI-CA** code has been updated from the 20030228 snapshot to the
20030619 snapshot.

**amd** has been updated from 6.0.7 to 6.0.9.

**awk** from Bell Labs has been updated from a 14 March 2003 snapshot to
a 29 July 2003 snapshot.

**BIND** has been updated from 8.3.4 to 8.3.7. [MERGED]

**GCC** has been updated from 3.2.2 to a 3.3.3 post-release snapshot
from 6 November 2003.

.. raw:: html

   <div class="NOTE">

    **Note:** Previous versions of **GCC** generated incorrect code when
    -march=pentium4 optimization was enabled. This problem is believed
    to have been fixed with this upgrade, and the earlier workaround for
    the case of CPUTYPE=p4 has been removed.

.. raw:: html

   </div>

**GNU Readline** has been updated from 4.2 to 4.3.

**GNU Sort** has been updated from the version in textutils 2.0.21 to
the version in textutils 2.1.

**Heimdal Kerberos** has been updated from 0.5.1 to 0.6.

The **ISC DHCP** client has been updated from 3.0.1rc11 to 3.0.1rc12.

**lukemftp** has been updated from 1.6beta2 to a 11 November 2003
snapshot from NetBSD.

**OpenPAM** has been updated from the \`\`Dianthus'' release to the
\`\`Dogwood'' release.

**OpenSSL** has been updated from 0.9.7a to 0.9.7c. [MERGED]

**sendmail** has been updated from version 8.12.9 to version 8.12.10.
[MERGED]

**texinfo** has been updated from 4.5 to 4.6. [MERGED]

The timezone database has been updated from the ``tzdata2003a`` release
to the ``tzdata2003d`` release. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If ``GNU_CONFIGURE`` is defined, all instances of ``config.guess`` and
``config.sub`` found under ``WRKDIR`` are replaced with the master
versions from ``PORTSDIR``/Template. This allows old ports (which
contain old versions of these scripts) to build on newer architectures
like ia64 and amd64.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Floppy disk installation images are no longer built for the alpha,
amd64, and ia64 architectures.

The supported release of **GNOME** has been updated from 2.2.1 to 2.4.
[MERGED]

The supported release of **KDE** has been updated from 3.1.2 to 3.1.4.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7 Documentation
~~~~~~~~~~~~~~~~~

To reduce duplication of information (and subsequent difficulty in
maintaining consistency), many instances of specific devices supported
in the Hardware Notes have been moved to system manual pages. This
project is ongoing as of this release.

A Turkish (tr\_TR.ISO8859-9) translation project has been started.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

Users with existing FreeBSD systems are *highly* encouraged to read the
\`\`Early Adopter's Guide to FreeBSD 5.2-RELEASE''. This document
generally has the filename ``EARLY.TXT`` on the distribution media, or
any other place that the release notes can be found. It offers some
notes on upgrading, but more importantly, also discusses some of the
relative merits of upgrading to FreeBSD 5.X versus running FreeBSD 4.X.

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
