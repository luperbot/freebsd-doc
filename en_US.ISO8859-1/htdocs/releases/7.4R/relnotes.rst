=================================
FreeBSD 7.4-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.4-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2011 The FreeBSD Documentation Project

| $FreeBSD: stable/7/release/doc/en\_US.ISO8859-1/relnotes/article.sgml
  219008 2011-02-24 19:22:59Z hrs $

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

SPARC, SPARC64, SPARCengine, and UltraSPARC are trademarks of SPARC
International, Inc in the United States and other countries. SPARC
International, Inc owns all of the SPARC trademarks and under licensing
agreements allows the proper use of these trademarks by its members.

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

The release notes for FreeBSD 7.4-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 7.4-STABLE development
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
2.2.1 `Hardware Support <#PROC>`__
2.2.2 `Network Protocols <#NET-PROTO>`__
2.2.3 `Disks and Storage <#DISKS>`__
2.2.4 `File Systems <#FS>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 ```/etc/rc.d`` Scripts <#RC-SCRIPTS>`__
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Release Engineering and Integration <#RELENG>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 7.4-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 7.4-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
7.4-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 7.3-RELEASE.

Typical release note items document recent security advisories issued
after 7.3-RELEASE, new drivers or hardware support, new commands or
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

Problems described in the following security advisories have been fixed.
For more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+----------------+----------------+---------------------------------------------+
| Advisory       | Date           | Topic                                       |
+================+================+=============================================+
| `SA-10:08.bzip | 20 September 2 | Integer overflow in bzip2 decompression     |
| 2 <http://secu | 010            |                                             |
| rity.freebsd.o |                |                                             |
| rg/advisories/ |                |                                             |
| FreeBSD-SA-10: |                |                                             |
| 08.bzip2.asc>` |                |                                             |
| __             |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-10:09.pseu | 10 October 201 | Spurious mutex unlock                       |
| dofs <http://s | 0              |                                             |
| ecurity.freebs |                |                                             |
| d.org/advisori |                |                                             |
| es/FreeBSD-SA- |                |                                             |
| 10:09.pseudofs |                |                                             |
| .asc>`__       |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-10:10.open | 29 November 20 | OpenSSL multiple vulnerabilities            |
| ssl <http://se | 10             |                                             |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 0:10.openssl.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

[sparc64] FreeBSD/sparc64 now supports reservation-based physical memory
allocation which provides better performance.

[sparc64] FreeBSD/sparc64 now supports UltraSPARC IV, IV+, and SPARC64 V
CPUs.

The
`alq(9) <http://www.FreeBSD.org/cgi/man.cgi?query=alq&sektion=9&manpath=FreeBSD+7.4-RELEASE>`__
support has been improved. The ``alq_writen()`` and ``alq_getn()`` KPIs
have been extended to support variable length messages, which is enabled
at ALQ creation time depending on the arguments passed to
``alq_open()``. Also, the ``ALQ_NOACTIVATE`` and ``ALQ_ORDERED`` flags
have been added to allow ALQ consumers to have more control over I/O
scheduling and resource acquisition respectively. These extensions are
fully backward compatible.

The
`alq(9) <http://www.FreeBSD.org/cgi/man.cgi?query=alq&sektion=9&manpath=FreeBSD+7.4-RELEASE>`__
support is now provided as a kernel module ``alq.ko``.

The FreeBSD
`memguard(9) <http://www.FreeBSD.org/cgi/man.cgi?query=memguard&sektion=9&manpath=FreeBSD+7.4-RELEASE>`__
framework has been improved to make it able to detect use-after-free of
allocated memories over a longer time. For more details, see
`memguard(9) <http://www.FreeBSD.org/cgi/man.cgi?query=memguard&sektion=9&manpath=FreeBSD+7.4-RELEASE>`__
manual page.

The following
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
variables have been added: ``vm.kmem_map_size`` for the current kmem map
size and ``vm.kmem_map_free`` for largest contiguous free range in kmem
map.[\ `r213554 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213554>`__,
`r213556 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213556>`__,
`r213560 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213560>`__]

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

[amd64, i386] The
`ichwd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ichwd&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports Intel NM10 Express chipset watchdog timer.

[amd64, i386] The qpi(4) pseudo bus driver has been added. This supports
extra PCI buses on Intel QPI chipsets where various hardware such as
memory controllers for each socket is connected.

.. raw:: html

   <div class="SECT4">

--------------

2.2.1.1 Multimedia Support
''''''''''''''''''''''''''

The
`acpi\_video(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_video&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been updated. LCD brightness control notify handler has been
implemented.

The
`acpi\_sony(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_sony&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
helper driver now supports default display brightness, wired LAN power,
and bass gain.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.1.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports Atheros AR8151/AR8152 PCIe Gigabit/Fast Ethernet
controllers.

The TX interrupt moderation timer in the
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been reduced from 50ms to 1ms. The 50ms timer resulted in a
poor UDP performance.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports BCM5718 x2 PCI Express dual-port gigabit Ethernet
controller family. This family is the successor to the BCM5714/BCM5715
family and supports IPv4/IPv6 checksum offloading, TSO, VLAN hardware
tagging, jumbo frames, MSI/MSIX, IOV, RSS and TSS. The current version
of the driver supports all hardware features except IOV and RSS/TSS.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports hardware MAC statistics in controller's internal
memory for BCM5705 or newer Broadcom controllers. These counters can be
accessed via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
variable ``dev.bge.N.stats.*`` and provide useful information to
diagnose driver issues.

A long-standing bug of ASF heartbeat sending in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been fixed.

UDP checksum offloading in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been disabled by default. This is because Broadcom
controllers have a bug which can generate UDP datagrams with checksum
value ``0`` when TX UDP checksum offloading is enabled. The checksum
offloading can be enabled by using the following loader tunable:

.. code:: PROGRAMLISTING

    dev.bge.N.forced_udpcsum

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver which prevented TSO from working in BCM57780 has been fixed.

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver that could lead to poor performance on a system with more than 4
GB RAM has been fixed. The cause was that all of Broadcom controllers
except the BCM5755 and later have a bug in 4 GB-boundary DMA processing
and used the bounce buffer in an inefficient way.

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports hardware filtering based on inspection of L2/L3/L4
headers. Filtering based on source IP address, destination IP address,
source port number, destination port number, 802.1q VLAN frame tag, UDP,
TCP, and MAC address is possible. The configuration can be done by the
cxgbtool(8) utility. Note that cxgbtool(8) is in
``src/usr.sbin/cxgbtool`` but not compiled by default.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been updated to version 7.1.9.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
and
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
drivers now provide statistics counters as
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
MIB objects.

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now exports the hardware MAC statistics via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
variables.

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports TSO over VLAN on i82550 and i82551 controllers.

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been updated to version 2.0.7.

The
`miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
has been rewritten for the generic IEEE 802.3 annex 31B full duplex flow
control support. The
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`cas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cas&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`gem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gem&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`stge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
and
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
drivers along with atphy(4), bmtphy(4), brgphy(4), e1000phy(4),
gentbi(4), inphy(4), ip1000phy(4), jmphy(4), nsgphy(4), nsphyter(4), and
`rgephy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rgephy&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
have been updated to support flow control via this facility.

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been improved:

-  It now supports 88E8059 (Marvell Yukon Optima) devices.

-  A rudimentary interrupt moderation with programmable countdown timer
   register has been implemented. The default parameter of the holdoff
   time is 100us and this can be changed via sysctl variable
   ``dev.mskc.0.int_holdoff``. Note that the interrupt moderation is
   shared resource on a dual-port controllers and it is impossible to
   use separate interrupt moderation values for each port.

A bug in the
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver that prevented TSO from working has been fixed.

The
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports WoL (Wake on LAN).

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now uses ``2048`` as PCIe Maximum Read Request Size. This
improves bulk transfer performance.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports 64-bit DMA addressing for RTL810xE/RTL8168/RTL8111
PCIe controllers.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports hardware interrupt moderation of TX completion
interrupts on RTL8169/RTL8168 controllers.

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports WoL (Wake on LAN) on RTL8139B or newer controllers.

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports a device hint to change a way of register access.
Although some newer RTL8139 controllers support memory-mapped register
access, it is difficult to detect the support automatically. For this
reason the driver uses I/O mapping by default and provides the following
device hint. If it is set to ``0``, the driver uses memory mapping for
register access.

.. code:: PROGRAMLISTING

    hint.rl.N.prefer_iomap="0"

Note that the default value is ``1``.

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has improved interrupt handling. It now has better TX performance
under high RX load.

The
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now disables TX checksum offloading by default. This is because
some revisions of the Yukon controller generate corrupted frames. The
checksum offloading can be enabled manually by using ``txcsum`` option
in the
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility.

A bug in the
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been fixed. It did not program the station address for Yukon
controllers and overriding the station address with
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
was not possible.

The
`sge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver for Silicon Integrated Systems SiS190/191 Fast/Gigabit Ethernet
has been added. This supports TSO and TSO over VLAN.

The
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports WoL (Wake on LAN) on NS DP8315 controller.

A tunable ``dev.sis.N.manual_pad`` for the
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been added. This controls whether padding with 0x00 for short
frames is done by CPU, rather than the controller. The reason why this
tunable has been added is that NS DP83815/DP83816 pads them with 0xff
though RFC 1042 specifies it should be 0x00. The tunable is disabled by
default, which means padding with 0xff is used because padding with 0x00
by software needs extra CPU cycles. Enabling ``manual_pad``, by setting
this
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
variable to a non-zero value, forces the use of software padding.

The
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports a device hint to change the device register access
mode. The driver uses memory-mapped register access by default, but this
caused stability problems with some old IC Plus Corp (formerly Sundace)
controllers. The following device hint makes the driver use I/O mapping
for register access:

.. code:: PROGRAMLISTING

    hint.ste.N.prefer_iomap="1"

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports WoL (Wake on LAN). Note that not all controllers
support this functionality and some need an additional remote wakeup
cable.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

An issue in the
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
pseudo interface and linkstate changes of the underlying interfaces has
been fixed. This happened when a
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
interface was created before the underlying interface and its linkstate
became ``UP``.

A new loader tunable ``net.link.ifqmaxlen`` has been added. It specifies
the default value of send interface queue length. The default value for
this parameter is ``50``.

The FreeBSD NFS subsystem now supports a timeout for the negative name
cache entries in the client. This avoids a bogus negative name cache
entry from persisting forever when another client creates an entry with
the same name within the same NFS server time of day clock tick. A
system-wide
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
sysctl variable ``vfs.nfs.negative_name_timeout`` can be used to adjust
the timeout. Setting this variable to ``0`` disables negative name
caching.

A new
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
node
`ng\_patch(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_patch&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
has been added. This performs data modification of packets passing
through. Modifications are restricted to a subset of C language
operations on unsigned integers of 8, 16, 32 or 64-bit size.

The TCP initial window increase in RFC 3390 which can be controlled by a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
variable ``net.inet.tcp.rfc3390`` now reduces the congestion window to
the restart window if a TCP connection has been idle for one retransmit
timeout or more. For more details, see RFC 5681 Section 4.1.

A bug in FreeBSD TCP Path MTU discovery which could lead to a wrong
calculation for an MTU smaller than 256 octets has been fixed. Note that
this bug did not affect MTUs equal to or larger than 256 octets.

The
`siftr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=siftr&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
Statistical Information For TCP Research (SIFTR) kernel module has been
added. This is a facility that logs a range of statistics on active TCP
connections to a log file. It provides the ability to make highly
granular measurements of TCP connection state, aimed at system
administrators, developers and researchers.

The FreeBSD TCP reassembly implementation has been improved. A
long-standing accounting bug affecting SMP systems has been fixed and
the ``net.inet.tcp.reass.maxqlen``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
variable has been retired in favor of a per-connection dynamic limit
based on the receive socket buffer size. FreeBSD receivers now handle
packet loss (particularly losses caused by queue overflows)
significantly better than before which improves connection throughput.

The
`tun(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tun&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
pseudo interface driver now supports explicit UP/DOWN linkstate.

The
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
pseudo interface now supports TSO (TCP Segmentation Offloading). The
capability flag is named as ``IFCAP_VLAN_HWTSO`` and it is separated
from ``IFCAP_VLAN_HWTAGGING``. The
`age(4) <http://www.FreeBSD.org/cgi/man.cgi?query=age&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`ale(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ale&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
and
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver support this feature.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been updated to version 1.20.00.19.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver now supports ``spindown`` facility of ATA disks. The
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility has a new subcommand ``spindown`` to support this from userland.

The
`gconcat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gconcat&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
GEOM class now supports kernel crash dump. The dumping is performed to
the component where a dump partition begins.

The
`gmultipath(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmultipath&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now supports ``destroy``, ``rotate``, ``getactive`` commands.

The
`ispfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ispfw&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__,
the firmware for
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been added.

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+7.4-RELEASE>`__
driver has been updated. The version number is 3.70.05.010.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 File Systems
^^^^^^^^^^^^^^^^^^

The inode number handling in
`ffs(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ffs&sektion=7&manpath=FreeBSD+7.4-RELEASE>`__
file system is now unsigned. Previously some large inode numbers can be
treated as negative, and this issue shows up at file systems with the
size of more than 16Tb in 16k block case. The
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility never create a file system with more than 2^32 inodes by cutting
back on the number of inodes per cylinder group if necessary to stay
under the limit.

A possible deadlock of ``zfs receive`` has been fixed.

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
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility has been improved. It now runs faster even when a single
interface has a number of aliases.

A bug in the
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
utility that prevented an ``-r`` option from handling arbitrary breaks
in a base64 encoded string has been fixed.

The
`chgrp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chgrp&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
and
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
now support a ``-x`` flag to make it not traverse across multiple mount
points for the recursive operation.

The
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
now supports a ``-x`` flag to make it not traverse across multiple mount
points for the recursive operation.

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now reports a reason for exiting and the 10-second period in
which the
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
ignores routing messages has been changed to start just after
``dhclient-script`` starts instead of just after it finished. This
change fixes a symptom that
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
silently exits under a certain condition.

A bug in
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
utility has been fixed. An option ``-newerXB`` was interpreted as the
same as ``-newerXm``.

The
`tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
and
`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utilities have been improved for better interoperability and they now
support RFC 1350, 2347, 2348, 2349, and 3617.

An accuracy issue in the
`jn(3) <http://www.FreeBSD.org/cgi/man.cgi?query=jn&sektion=3&manpath=FreeBSD+7.4-RELEASE>`__
and
`jnf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=jnf&sektion=3&manpath=FreeBSD+7.4-RELEASE>`__
functions in ``libm`` has been fixed.

The
`indent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=indent&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
utility now supports a ``-ta`` flag to treat all ``_t``-suffixed
identifiers as types.

The ``-p`` option in the
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now displays the ``rw`` mount option correctly as in the
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+7.4-RELEASE>`__
format.

The
`ncal(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ncal&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
utility has been updated. The option ``-b`` has been replaced with
``-C`` and ``-B number``. Options ``-3`` to show previous, current and
next month, and ``-A number`` to show months after current month have
been added. The option ``-m N YYYY`` now prints only the month, not the
whole year.

An issue in the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility has been fixed. A UFS1 file system created with 64KB blocksize
was incorrectly recognized as one with a broken superblock. This is
because the FreeBSD kernel checks a partition first for a UFS2
superblock at 64KB offset while it is possible that a UFS1 file systems
with 64KB blocksize has an alternative superblock at the same location.
For example, a file system created by ``newfs -U -O 1 -b 65536 -f 8192``
could lead to this symptom.

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility does not consider non-existence of a PID file as an error now. A
new flag ``-P`` reverts it to the old behavior.

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now supports an ``-S pidfile`` option to override the default
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
PID file.

The
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now supports a file and a network socket as a top source. A new
option ``-O filename`` specifies to send log output to ``filename``, and
another new option ``-R filename`` specifies to receive events from
``filename``. For a socket, the ``filename`` is in a form of
``ipaddr:port``. This allows top monitoring over TCP on a system with no
local symbols, for example.

The
`powerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=powerd&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now supports an ``-m freq`` and ``-M freq`` to control the
minimum and maximum frequency, respectively.

The
`ruptime(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ruptime&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
utility now displays hostnames longer than 12 characters.

The
`stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
utility now supports ``%Sf`` output specifier to display the file flags
symbolically.

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now supports a ``-i`` flag to ignore failures while retrieving
individual OIDs. This allows the same list of OIDs to be passed to
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
across different systems where particular OIDs may not exist, and still
get as much information as possible from them.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.4-RELEASE>`__
now supports a ``firewall_coscripts`` variable. This should contain a
list of commands which should be executed after firewall starts or
stops.

The ``rc.d/tmp`` script now uses a unique directory name prefixed with
``/tmp/.diskless`` instead of ``/tmp/.diskless`` itself. This fixes an
issue when ``/tmp/.diskless`` exists before the script runs.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**ISC BIND** has been updated to version 9.4-ESV-R4.

The GNU
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
program has been updated to version 2.8.

The
`less(1) <http://www.FreeBSD.org/cgi/man.cgi?query=less&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
program has been updated to version v436.

The **netcat** program has been updated to version 4.8.

**OpenSSL** has been updated to version 0.9.8q.

The
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+7.4-RELEASE>`__
program has been updated to version 6.17.00.

The timezone database has been updated to the **tzdata2010o** release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility now uses the following numbers for default and minimum partition
sizes: 1GB for ``/``, 4GB for ``/var``, and 1GB for ``/tmp``.

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated to 2.32.1.

The supported version of the **KDE** desktop environment
(```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
has been updated to 4.5.5.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

[amd64, i386] Beginning with FreeBSD 6.2-RELEASE, binary upgrades
between RELEASE versions (and snapshots of the various security
branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC or SMP kernels distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
utility requires that the host being upgraded has Internet connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.4-RELEASE>`__
menu on CDROM distribution media. This type of binary upgrade may be
useful on non-i386, non-amd64 machines or on systems with no Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported, according
to the instructions in ``/usr/src/UPDATING``.

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

All users of FreeBSD 7.4-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
