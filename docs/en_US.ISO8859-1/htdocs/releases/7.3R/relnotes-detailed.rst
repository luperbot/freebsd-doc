=================================
FreeBSD 7.3-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.3-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2010 The FreeBSD Documentation Project

| $FreeBSD:
  releng/7.3/release/doc/en\_US.ISO8859-1/relnotes/article.sgml 205387
  2010-03-20 16:39:28Z hrs $

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

The release notes for FreeBSD 7.3-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 7.3-STABLE development
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
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 7.3-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 7.3-RELEASE is a release distribution. It
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
7.3-RELEASE can be found on
http://www.FreeBSD.org/releases/7.3R/errata.html.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 7.2-RELEASE.

Typical release note items document recent security advisories issued
after 7.2-RELEASE, new drivers or hardware support, new commands or
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

+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                                   | Date           | Topic                                                                                                                                                         |
+============================================================================================================+================+===============================================================================================================================================================+
| `SA-09:09.pipe <http://security.freebsd.org/advisories/FreeBSD-SA-09:09.pipe.asc>`__                       | 10 June 2009   | Local information disclosure via direct pipe writes                                                                                                           |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:10.ipv6 <http://security.freebsd.org/advisories/FreeBSD-SA-09:10.ipv6.asc>`__                       | 10 June 2009   | Missing permission check on SIOCSIFINFO\_IN6 ioctl                                                                                                            |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:11.ntpd <http://security.freebsd.org/advisories/FreeBSD-SA-09:11.ntpd.asc>`__                       | 10 June 2009   | ntpd stack-based buffer-overflow vulnerability                                                                                                                |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:12.bind <http://security.freebsd.org/advisories/FreeBSD-SA-09:12.bind.asc>`__                       | 29 July 2009   | BIND `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+7.3-stable>`__ dynamic update message remote DoS                     |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:14.devfs <http://security.freebsd.org/advisories/FreeBSD-SA-09:14.devfs.asc>`__                     | 2 Oct 2009     | Devfs / VFS NULL pointer race condition                                                                                                                       |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:15.ssl <http://security.freebsd.org/advisories/FreeBSD-SA-09:15.ssl.asc>`__                         | 3 Dec 2009     | SSL protocol flaw                                                                                                                                             |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:16.rtld <http://security.freebsd.org/advisories/FreeBSD-SA-09:16.rtld.asc>`__                       | 3 Dec 2009     | Improper environment sanitization in `rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+7.3-stable>`__                         |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:17.freebsd-update <http://security.freebsd.org/advisories/FreeBSD-SA-09:17.freebsd-update.asc>`__   | 3 Dec 2009     | Inappropriate directory permissions in `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.3-stable>`__   |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:01.bind <http://security.freebsd.org/advisories/FreeBSD-SA-10:01.bind.asc>`__                       | 6 Jan 2010     | BIND `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+7.3-stable>`__ cache poisoning with DNSSEC validation                |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:02.ntpd <http://security.freebsd.org/advisories/FreeBSD-SA-10:02.ntpd.asc>`__                       | 6 Jan 2010     | ntpd mode 7 denial of service                                                                                                                                 |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:03.zfs <http://security.freebsd.org/advisories/FreeBSD-SA-10:03.zfs.asc>`__                         | 6 Jan 2010     | ZFS ZIL playback with insecure permissions                                                                                                                    |
+------------------------------------------------------------------------------------------------------------+----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The
`closefrom(2) <http://www.FreeBSD.org/cgi/man.cgi?query=closefrom&sektion=2&manpath=FreeBSD+7.3-stable>`__
system call has been added. This closes any open file descriptors which
are equal to or larger than the specified value. Note that this does not
fail with any errors and this is not multi-thread safe.

The
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+7.3-stable>`__
subcommands for
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8&manpath=FreeBSD+7.3-stable>`__
now supports pagination.

The
`futimes(2) <http://www.FreeBSD.org/cgi/man.cgi?query=futimes&sektion=2&manpath=FreeBSD+7.3-stable>`__,
`lutimes(2) <http://www.FreeBSD.org/cgi/man.cgi?query=lutimes&sektion=2&manpath=FreeBSD+7.3-stable>`__,
and
`utimes(2) <http://www.FreeBSD.org/cgi/man.cgi?query=utimes&sektion=2&manpath=FreeBSD+7.3-stable>`__
system call now support a sysctl variable ``vfs.timestamp_precision``.

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.3-stable>`__
subsystem now supports ``security.jail.ip4_saddrsel`` and
``security.jail.ip6_saddrsel`` sysctl variables to control whether to
use source address selection or the primary jail address for unbound
outgoing connections. The default is that the source address selection
is enabled. Also, the jail parameter ``ip4.saddrsel`` and
``ip6.saddrsel`` are boolean option to enable the source address
selection for IPv4 and IPv6, respectively. If the boolean parameters
``ip4.nosaddrsel`` and ``ip6.nosaddrsel`` are set, the child jails do
not inherit the address selection options of the parent.

[amd64] The ``kmem_map`` KVA space has been increased to 512GB.

The
`lindev(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lindev&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been added. This is for Linux-specific pseudo devices and
currently used only for ``/dev/full``.

FreeBSD Linux emulation layer now supports ``SO_PEERCRED`` socket
option, ``MSG_CMSG_CLOEXEC`` for ``recvmsg()``, and robust futex. The
futex has been reimplemented by using
`sx(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sx&sektion=9&manpath=FreeBSD+7.3-stable>`__
lock. Initial support of
`ktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ktr&sektion=4&manpath=FreeBSD+7.3-stable>`__
tracing has also been added.

A lock handling error has been fixed in interaction between
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+7.3-stable>`__
implementation and threading library. When a multi-threaded process
calls the
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2&manpath=FreeBSD+7.3-stable>`__
system call in a thread and the
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+7.3-stable>`__
function in another thread, it caused a deadlock in the child process.

PECOFF image activator support has been removed.

FreeBSD now supports POSIX semaphores (``P1003_1B_SEMAPHORES`` kernel
option) by default.

A deadlock in the
`sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+7.3-stable>`__
scheduler has been fixed. For more details, see
`EN-10:02.sched\_ule <http://security.freebsd.org/advisories/FreeBSD-EN-10:02.sched_ule.asc>`__.

The
`sglist(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sglist&sektion=9&manpath=FreeBSD+7.3-stable>`__
API to manage scatter/gather lists of physical addresses has been added.

FreeBSD ABI of some of the structures used by the System V IPC API has
been changed internally, and it now supports shared memory segments for
System V IPC which is larger than 2GB on 64-bit platforms. For new
kernel modules, the ``kern_msgctl()``, ``kern_semctl()``, and
``kern_shmctl()`` functions will be transparently renamed to the new
``kern_new_*()`` functions by using ABI shims. The old functions remain
as the old names to provide backward compatibility for older kernel
modules.

A new sysctl variable ``security.bsd.map_at_zero`` has been added and
set to ``1`` (allow) by default. This controls whether FreeBSD allows to
map an object at the address ``0``, which is part of the user-controlled
portion of the virtual address space. Disabling this has some effect on
preventing an attack which injects malicious code into that location and
triggers a NULL pointer dereference in the kernel.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

A new boot loader ``gptzfsboot``, which supports GPT and ZFS has been
added.

The boot loader ``zfsboot`` now always uses 64-bit LBAs and supports
more than seven drives in the ZFS pools.

A bug in ``zfsboot`` has been fixed. A ``/boot.config`` smaller than 512
bytes was ignored.

``zfsloader``, the final boot loader similar to
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+7.3-stable>`__
which supports ZFS has been added.

A bug in the boot loader has been fixed. It failed to recognize GPT
correctly when the system supports both of MBR and GPT and they are
synchronized with each other.

[pc98] The **boot2** program has been reimplemented based on the latest
version for i386.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The **amdsbwd(4)** driver for AMD SB600/SB7xx watchdog timer has been
added.

The
`cpuctl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuctl&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver now supports atomically setting/clearing individual bits of a MSR
register. Two new ioctl calls ``CPUCTL_MSRSBIT`` and ``CPUCTL_MSRCBIT``
treat the data field of struct in the argument passed as a mask and
set/clear bits of the MSR register according to the mask value. The
`cpucontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cpucontrol&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility also supports this feature. For more details, see Userland
Changes section.

The
`cpufreq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpufreq&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver now supports Phenom (Family 10h).

[amd64, i386] CPU cache flushing has been optimized when changing
caching attributes of pages by doing nothing for CPUs that support
self-snooping and using ``CLFLUSH`` instead of a full cache invalidate
when possible. FreeBSD does not use ``CLFLUSH`` on Intel CPUs due to
problems with flushing the local APIC range by default. This can be
controlled via the ``hw.clflush_disable`` loader tunable. A setting of
``1`` disables the use of ``CLFLUSH``. A setting of ``0`` allows
``CLFLUSH`` to be used for Intel CPUs when ``CPUID_SS`` is not present.
This fixes a kernel panic occurred on Xen which disables self-snooping.

[sparc64] The epic(4) driver for the front panel LEDs in Sun Fire
V215/V245 has been added.

[sparc64] The fire(4) driver for “Fire” JBus to PCIe bridges found in at
least the Sun Fire V215/V245 and Sun Ultra 25/45 machines has been
added.

[amd64, i386] The
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver for Hardware Performance Monitoring Counter support has been
added. This consists of the kernel driver,
`pmc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pmc&sektion=3&manpath=FreeBSD+7.3-stable>`__
interface library, and userland utilities
`pmcannotate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcannotate&sektion=8&manpath=FreeBSD+7.3-stable>`__,
`pmccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmccontrol&sektion=8&manpath=FreeBSD+7.3-stable>`__,
and
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+7.3-stable>`__,
and allows applications to use hardware performance counters to gather
performance data about specific processes or for the system as a whole.

Several bugs in the
`ipmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipmi&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver which prevents the watchdog timeout setting from working, have
been fixed.

The
`k8temp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=k8temp&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been renamed with
`amdtemp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amdtemp&sektion=4&manpath=FreeBSD+7.3-stable>`__.
The new driver supports AMD K10 and K11 as well as K8.

A loader tunable ``hw.mca.enabled`` has been added. This can be used to
enable/disable the machine check code. Disabled by default.

A sysctl variable ``hw.pagesizes`` has been added. This reports all of
the supported page sizes on the system.

PCI Express memory-mapped configuration space access, ACPI MCFG table
support, and BAR (Base Address Register) handling in the
`pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+7.3-stable>`__
subsystem has been improved. This is disabled by default and can be
enabled by setting a loader tunable ``hw.pci.mcfg`` to ``1``. This value
can be queried via a sysctl variable of the same name.

[amd64, i386] FreeBSD now supports VIA Nano processor family.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

**DRM** now supports Radeon HD 4200 (RS880), 4770 (RV740), and R6/7xx
3D, and Intel G41 chips.

The vgapci(4) driver for PCI VGA display devices which can attach
devices as the children now supports proxying of PCI MSI/MSI-X (Message
Signaled Interrupt) requests and bus interrupt requests for the child
devices. This allows child devices to use MSI/MSI-X interrupts.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver for Atheros AR8131/AR8132 PCIe Ethernet controller has been
added.

A bug in the
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been fixed. When adding a
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.3-stable>`__
interface on the system as a
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+7.3-stable>`__
member with the LACP aggregation protocol enabled network communication
via the
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.3-stable>`__
interface stopped completely. Although the
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.3-stable>`__
interface worked if it was not a
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+7.3-stable>`__
member, the incoming traffic statistics which can be found in
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+7.3-stable>`__
output was incorrect because every packet was recognized as full-sized
one.

Several bugs in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver have been fixed. It caused a panic when a lot of traffic is being
handled on the interface while the system is shutting down, and had a
DMA issue when buffer address crosses a multiple of the 4GB boundaries.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver now supports TSO (TCP segmentation offloading) for BCM5755 or
newer chips.

[sparc64] The
`cas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cas&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been added to provide support for Sun Cassini/Cassini+ and
National Semiconductor DP83065 Saturn Gigabit Ethernet devices.

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been upgraded to the latest version. The firmware version is
7.8.0.

The
`et(4) <http://www.FreeBSD.org/cgi/man.cgi?query=et&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver now supports IPv4/TCP/UDP Tx checksum offloading.

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been improved. The multicast filter re-programming is now
more robust. A bug which caused incorrect IP packet length in the header
when TSO (TCP segmentation offloading) is enabled has been fixed. This
fixes poor performance when TSO is enabled in the previous releases.

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been improved for robust operation. Also, it now supports
Yukon FE+ A0 including 88E8040, 88E8040T, 88E8042, 88E8048, 88E8057, and
88E8070.

Several bugs in the
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver have been fixed and the firmware version is now 1.4.48b. It could
lose the promiscuous flag on resetting and cause a kernel panic on the
hardware fault.

A bug in the
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been fixed. It caused buffer allocation failure for jumbo
frames.

The
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been improved and now works on all supported platforms. It
now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+7.3-stable>`__,
hardware checksum offloading for
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+7.3-stable>`__
tagged frames, WoL (Wake-on-Lan), jumbo frames, and PCI MWI (Memory
Write and Invalidate) commands. Hardware MAC statistics can be obtained
via a new sysctl variable ``dev.nge.N.stats``. Another new sysctl
variable ``dev.nge.N.int_holdoff`` has been added to control interrupt
moderation. The valid ranges are ``1`` (100us) to ``255``, and the
actual delivery of interrupt would be delayed based on this value. The
default is ``1``. For more details, see
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+7.3-stable>`__
manual page.

The
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been improved and now works on all supported platforms. It
now supports suspend/resume and WoL (Wake-on-Lan). Hardware MAC
statistics can be obtained via a new sysctl variable
``dev.ste.N.stats``. Another new sysctl variables
``dev.ste.N.int_rx_mod`` has been added to control RX interrupt
moderation time. The default value is ``150`` (150us). For more details,
see
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+7.3-stable>`__
manual page.

The
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been improved. It now supports hardware checksum offloading
for
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+7.3-stable>`__
tagged frames and WoL (Wake-on-Lan). Hardware MAC statistics can be
obtained via a new sysctl variable ``dev.vge.N.stats``. Another new
sysctl variables ``dev.nge.N.int_holdoff``, ``dev.nge.N.rx_coal_pkt``,
and ``dev.nge.N.tx_coal_pkt`` has been added to control interrupt
moderation. For more details, see
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+7.3-stable>`__
manual page.

A bug in the
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver which caused occasional watchdog timeouts has been fixed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

A bug in the
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+7.3-stable>`__
that EtherIP packets sent by combination of
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+7.3-stable>`__
and
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+7.3-stable>`__
have a reversed version field has been fixed. If you need to communicate
with older FreeBSD releases via EtherIP, use new flags
``accept_rev_ethip_ver`` and ``send_rev_ethip_ver`` to control handling
the reversed version field. These can be set by
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility to
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+7.3-stable>`__
interfaces. The EtherIP implementation found on FreeBSD 6.1, 6.2, 6.3,
7.0, 7.1, and 7.2 had an interoperability issue because it sent the
incorrect EtherIP packets and discarded the correct ones. For more
details, see
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+7.3-stable>`__
manual page.

IPcomp protocol is now enabled by default. This can be controlled by a
sysctl variable ``net.inet.ipcomp.ipcomp_enable``.

A bug in the
`ng\_iface(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_iface&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been fixed. An infinite loop happened when a packet passes
out via two different
`netgraph(3) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=3&manpath=FreeBSD+7.3-stable>`__
interfaces sequentially due to tunneling.

A kernel option ``IPFW_DEFAULT_TO_ACCEPT`` has been replaced with a new
loader tunable ``net.inet.ip.fw.default_to_accept``. The value can be
queried via a sysctl variable of the same name.

The
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+7.3-stable>`__
software network interface supports a new ioctl ``TAPGIFNAME``. This is
convenient shortcut ported from NetBSD to obtain network interface name
using file descriptor for character device.

The
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver is now enabled in the ``GENERIC`` kernel.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been synchronized with the latest official vendor driver.

The
`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver now supports Adaptec 39320LPE adapters.

ATA command timeout in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been increased. This value can be set by using a kernel
option ``ATA_REQUEST_TIMEOUT``.

A bug in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been fixed. It could generate an I/O request larger than
controller's maximum I/O size and caused a kernel panic.

An algorithm for ``load`` balancing mode in the
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8&manpath=FreeBSD+7.3-stable>`__
GEOM class has been changed and this mode is now set by default instead
of ``split``. The ``load`` mode uses averaged number of requests,
running on each drive instead of measuring last request execution time
for each drive and choosing one with smallest time.

A bug in the
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+7.3-stable>`__
GEOM class has been fixed. It could not handle a GPT header whose size
is greater than 92 bytes which is written by OpenSolaris.

The default stripe size of
`gstripe(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstripe&sektion=8&manpath=FreeBSD+7.3-stable>`__
GEOM class has been changed from 4KB to 64KB. This change will affect
users preferring the ``create`` command over the ``label`` command,
which will now need to explicitly specify the old stripe size (``-s``
``4096``) in order to use their old
`gstripe(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstripe&sektion=8&manpath=FreeBSD+7.3-stable>`__
volumes.

The
`hptrr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptrr&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver now supports a new loader tunable ``hw.hptrr.attach_generic`` to
prevent the driver from being attached to some Marvell chips which have
no HPT RAID BIOS.

The
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver now supports LSI MegaRAID SAS 1078 and Dell PERC6.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The
`ext2fs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ext2fs&sektion=5&manpath=FreeBSD+7.3-stable>`__
file system has been improved. A bug when the inode size is other than
128 has been fixed.

FreeBSD Network File System now supports caching of negative pathname
lookup in the NFS client, and uses 3 seconds timeout (30 seconds in the
prior releases) for caching attributes of a directory in the client.

The
`pseudofs(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pseudofs&sektion=9&manpath=FreeBSD+7.3-stable>`__
subsystem used in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+7.3-stable>`__
and
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+7.3-stable>`__
are now MPSAFE.

**UFS\_DIRHASH** (enabled by default) now supports removing the cache
data when the system memory is low (via ``vm_lowmem`` event handler). A
bug that the system caused a panic when decreasing a sysctl variable
``vfs.ufs.dirhash_maxmem`` below the current amount of memory used by
**UFS\_DIRHASH**, has been fixed.

A new sysctl variable for the
`VFS(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VFS&sektion=9&manpath=FreeBSD+7.3-stable>`__
subsystem ``vfs.flushbufqtarget`` has been added. This can fix issues in
``bufdaemon``, a kernel process responsible for flushing dirty buffers,
which can cause the process to deadlock in a certain workload. The value
of the variable determines the number of buffers will be flushed before
allocating a new buffer. The default value of the variable on
7.3-RELEASE is ``-1`` (disabled). The FreeBSD 8.0-RELEASE uses ``100``
by default.

ZFS has been updated from version 6 to version 13. This update includes
numerous new ZFS features, such as permitting non-\ ``root`` users to
perform some administrative functions, supporting additional disks for
caching or the ZFS Intent Log, and partial
`chflags(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=2&manpath=FreeBSD+7.3-stable>`__
support. It also includes some FreeBSD-specific additions, such as
booting from ZFS file systems, removal of ARC size limitations, ARC back
pressure (which allows ZFS to work without tunables on amd64), and many
bugfixes.

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
`acpidump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidump&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility now supports parsing SRAT (System Resource Affinity Table used
to describe affinity relationships between CPUs and memory.

The
`apropos(1) <http://www.FreeBSD.org/cgi/man.cgi?query=apropos&sektion=1&manpath=FreeBSD+7.3-stable>`__
command no longer sets the necessary directories to ``PATH`` variable.
This means if the caller does not have ``/bin`` and ``/usr/bin`` in
``PATH``, then it does not work.

The
`bluetooth(3) <http://www.FreeBSD.org/cgi/man.cgi?query=bluetooth&sektion=3&manpath=FreeBSD+7.3-stable>`__
library now supports Bluetooth HCI API.

The
`btpand(8) <http://www.FreeBSD.org/cgi/man.cgi?query=btpand&sektion=8&manpath=FreeBSD+7.3-stable>`__
daemon now supports Bluetooth device node names in a ``-d`` option.

A bug in the
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1&manpath=FreeBSD+7.3-stable>`__
``-h`` option has been fixed. It used link target's flags as the
original one.

The
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now preserves file flags on symbolic links when options ``-Rp``
are specified. It reported an error “function not implemented”.

The
`cpucontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cpucontrol&sektion=8&manpath=FreeBSD+7.3-stable>`__
command now allows user to perform atomic bitwise AND and OR operations
on MSR registers. Two new operations (``&=`` and ``|=``) have been
added. The first one applies bitwise AND operation between the current
contents of the MSR register and the mask, and the second performs
bitwise OR. The argument can be optionally prefixed with ``~`` inversion
operator. The following is an example to clear the second bit of TSC
MSR:

.. code:: SCREEN

    # cpucontrol -m 0x10&=~0x02

The
`cpuset(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuset&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now supports interrupt binding by a new option ``-x irq``.

The default
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5&manpath=FreeBSD+7.3-stable>`__
file no longer define a variable ``HOME``.

The
`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now uses human-readable output for inode counts when an ``-H``
or ``-h`` is specified.

A bug in the
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility when appending a NUL-terminated text provided by a DHCP server,
has been fixed.

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility now uses ``68`` (bootpc) as the source port for unicast
``DHCPREQUEST`` packets instead of allowing the protocol stack to pick a
random source port. This fixes the behavior where
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.3-stable>`__
would never transition from ``RENEWING`` to ``BOUND`` without going
through ``REBINDING`` in some networks which has a tight policy on DHCP
spoofing.

The
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility now supports size qualifiers (K, M, and G) and ``*`` for
automatic calculation in the ``p`` command.

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now supports HTTP digest authentication.

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now supports ``NO_PROXY`` and ``no_proxy`` environment variables
to disable use of HTTP proxy. For more details, see
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3&manpath=FreeBSD+7.3-stable>`__
manual page.

A bug in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+7.3-stable>`__
command that ``FTP_TIMEOUT`` and ``HTTP_TIMEOUT`` environment variables
were ignored, has been fixed.

A bug in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+7.3-stable>`__
command that default parameters such as connection timeout were not set
for HTTPS protocol, has been fixed. It now uses the same parameters as
HTTP.

A bug in the
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+7.3-stable>`__
command has been fixed. It ignored an ``-L`` option when ``-delete`` is
specified. The following command can be safely used to remove broken
links:

.. code:: SCREEN

    find -L . -type l -print0 | xargs rm -0

A bug in the
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+7.3-stable>`__
and
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1&manpath=FreeBSD+7.3-stable>`__
command has been fixed. When a symbolic link has ``uchg`` or ``uappend``
flag, the commands attempted to clear the target file, not the symbolic
link itself.

The
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now supports uncompressing files compressed by pack(1), which is
found in some commercial Unix systems.

The
`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+7.3-stable>`__
utility now supports a new ``KTRACE`` record for
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3&manpath=FreeBSD+7.3-stable>`__
invocations.

FreeBSD **libc** library now includes
`fdopendir(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fdopendir&sektion=3&manpath=FreeBSD+7.3-stable>`__
function.

FreeBSD **libc** library now includes
`feature\_present(3) <http://www.FreeBSD.org/cgi/man.cgi?query=feature_present&sektion=3&manpath=FreeBSD+7.3-stable>`__
function which checks to see if a named kernel feature is present by
checking the ``kern.features`` sysctl MIB.

FreeBSD **libc** library now includes
`getpagesize(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getpagesize&sektion=3&manpath=FreeBSD+7.3-stable>`__
function that returns either the number of page sizes supported by the
system or a specified subset of the supported page sizes.

The
`libradius(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libradius&sektion=3&manpath=FreeBSD+7.3-stable>`__
now supports simple embedded RADIUS server.

The
`lp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lp&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now supports ``-m`` option to send an email after the files have
been printed, and ``-t title`` option to write ``title`` on the banner
page of the output. These are required by POSIX standard.

The
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now correctly translates remote host names which contain
non-standard end-of-line characters.

The
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now supports manual pages in UTF-8.

The
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility now uses an ``-L`` option when it invokes
`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8&manpath=FreeBSD+7.3-stable>`__
command to follow symbolic links.

The
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility now supports ``DELETE_STALE_RC_FILES`` variable in
``mergemaster.rc`` file to delete stale rc.d scripts automatically.

A userland utility
`mfiutil(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mfiutil&sektion=8&manpath=FreeBSD+7.3-stable>`__
for the
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+7.3-stable>`__
devices has been added. This includes basic features to monitor
controller, array, and drive status, change basic attributes,
create/delete arrays and spares, and flush the controller firmware. Note
that this is a small utility, not a replacement of MegaCLI in the Ports
Collection which is supported officially and provides more
functionality.

A userland utility
`mptutil(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mptutil&sektion=8&manpath=FreeBSD+7.3-stable>`__
for the
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+7.3-stable>`__
devices has been added. This includes basic features to monitor
controller, array, and drive status, change basic attributes, and
create/delete arrays and spares.

The
`newfs\_msdos(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs_msdos&sektion=8&manpath=FreeBSD+7.3-stable>`__
command now supports media which have no CHS parameter.

The
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8&manpath=FreeBSD+7.3-stable>`__
daemon no longer tries to bind an IPv6 anycast address.

The
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now ignores itself and the ancestors when finding processes. An
``-a`` option has been added for backward compatible behavior.

A race condition in the
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+7.3-stable>`__
daemon has been fixed.

The
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now supports a new flag ``-p``. This displays descendant info
with the output similar to Linux's ``-H`` (or ``-f``).

The
`pwait(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pwait&sektion=1&manpath=FreeBSD+7.3-stable>`__
command, which waits for any process to terminate has been added.

The
`pwd\_mkdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pwd_mkdb&sektion=8&manpath=FreeBSD+7.3-stable>`__
now verifies login name length is shorter than ``MAXLOGNAME`` when a
``-C`` option is specified. Note that entries with oversized login names
are still allowed in the passwd database, and ``getpwent*()`` and
``getpwuid*()`` functions return them correctly. The ``getpwnam*()``
truncates them to ``MAXLOGNAME`` - 1 when reading the database. The
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+7.3-stable>`__
utility fails for the long names.

The FreeBSD runtime linker,
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+7.3-stable>`__
has been improved. The changes include:

-  The dynamic string token substitution in the ``rpath`` and ``soname``
   has been implemented. This can be enabled by setting ``-z origin``
   option of
   `ld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ld&sektion=1&manpath=FreeBSD+7.3-stable>`__.
   Currently, it recognizes ``$OSNAME``, ``$PLATFORM``, ``$OSREL``, and
   ``$ORIGIN`` tokens. This translation is unconditionally disabled for
   setuid/setgid processes.

-  PIE (Position Independent Executables) support has been improved. The
   runtime linker now calculates relocation base for the main object,
   and applies the relocation adjustment for all virtual addresses
   encoded into the ELF structures of it in order to make it possible to
   load PIE binaries at a non-zero base address.

-  The way the mapping of the ELF objects has been changed to make
   wiring of the address space possible. It now maps ``PROT_NONE``
   anonymous memory over the whole range first, and then mapping the
   segments of the object over it. It allocates ``.bss`` by changing the
   protection of the range instead of remapping, and unnecessary
   clearing of the text segment when its end is not page-aligned has
   been eliminated.

-  A new environment variable ``LD_ELF_HINTS_PATH`` for overriding the
   rtld hints file has been supported. This feature gives a convenient
   way of using a custom set of shared library that is not located in
   the default location and switch back. This environment variable is
   automatically unset if the process is tainted with setuid/setgid.

The
`strptime(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strptime&sektion=3&manpath=FreeBSD+7.3-stable>`__
function now supports ``%z`` format specifier.

The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility now supports a comma-separated list of network interfaces in
``netDev`` option in ``install.cfg``.

[ia64] The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility now uses 400MB for the EFI partition instead of 100MB in the
previous releases.

The
`tail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tail&sektion=1&manpath=FreeBSD+7.3-stable>`__
``-F`` flag now persists in trying to open files rather than giving up
when it encounters an error. ``ENOENT`` errors are not reported. This
behavior is consistent with the GNU version.

The
`tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1&manpath=FreeBSD+7.3-stable>`__
command now returns a correct exit status in the case of successful file
transfer.

The
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+7.3-stable>`__
program now uses in-kernel source address selection even in a
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.3-stable>`__
environment.

The
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+7.3-stable>`__
and
`traceroute6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute6&sektion=8&manpath=FreeBSD+7.3-stable>`__
now support an ``-a`` flag to display AS number corresponding to the
lookup IP address on each hop. It will query the number to WHOIS server
specified in ``-A`` option. If no ``-A`` is specified,
``whois.radb.net`` will be used as the default value.

The
`tzsetup(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tzsetup&sektion=8&manpath=FreeBSD+7.3-stable>`__
command now supports an ``-s`` option to skip the initial question about
adjusting the clock if not set to UTC.

The
`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+7.3-stable>`__
utility has been updated. A ``-d`` option has been removed because
``whois.nic.mil`` no longer exists, and it supports searching for IPv6
addresses just like it can do for IPv4 addresses without having to
explicitly specify that the ARIN server should be used to get the
initial information.

The
`yp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=yp&sektion=8&manpath=FreeBSD+7.3-stable>`__
utilities now support ``shadow.byname`` and ``shadow.byuid`` maps. These
requires privileged port access.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8&manpath=FreeBSD+7.3-stable>`__
command as an easy interface for the rc.d scripts has been added.

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.3-stable>`__
file now supports ``create_args_IF`` for interfaces created via
``cloned_interfaces``

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.3-stable>`__
file now supports ``vlans_IF`` for creating
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+7.3-stable>`__
interfaces. If a vlan interface is a number, then that number is treated
as the vlan tag for the interface and the interface will be named
“\ ``IF``.\ ``N``\ ”. Otherwise, the vlan tag must be provided via a
``vlan`` parameter in a ``create_args_IF`` variable.

The ``rc.d/fsck`` script now supports options for ``fsck_y_enable`` via
``fsck_y_flags``.

The ``rc.d/named`` script now supports zone file check by
`named-checkconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named-checkconf&sektion=8&manpath=FreeBSD+7.3-stable>`__
before the startup and the following options:

-  ``named_wait`` has the script loop until a specified hostname in
   ``named_wait_host`` (``localhost`` by default) can be successfully
   looked up. This is disabled by default.

-  ``named_auto_forward`` creates a forwarder configuration file based
   on the contents of ``/etc/resolv.conf``. This allows you to utilize a
   local resolver for better performance, less network traffic, custom
   zones, etc. while still relying on the benefits of your local network
   resolver. This is disabled by default.

The ``rc.d/savecore`` script now supports invoking
`crashinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=crashinfo&sektion=8&manpath=FreeBSD+7.3-stable>`__
automatically during boot. A new variable ``crashinfo_enable`` has been
added to enable it.

The ``rc.d/static_arp`` script has been added. This allows the
administrator to statically bind MAC to IPv4 address at boot time. An
example is as follows:

.. code:: PROGRAMLISTING

    static_arp_pairs="gw"
    static_arp_gw="192.168.1.1 00:01:02:03:04:05"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**ISC BIND** has been updated to version 9.4-ESV.

**sendmail** has been updated from version 8.14.3 to version 8.14.4.

The timezone database has been updated to the **tzdata2010b** release.

The timezone libraries (stdtime part of **libc**) and related binaries
(`zic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zic&sektion=8&manpath=FreeBSD+7.3-stable>`__
and
`zdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zdump&sektion=8&manpath=FreeBSD+7.3-stable>`__)
have been updated to the **tzcode2009k** release. Note that
`tzsetup(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tzsetup&sektion=8&manpath=FreeBSD+7.3-stable>`__
needs to be run after the installation.

**unifdef** has been updated to version 1.188.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A bug in the
`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+7.3-stable>`__
command which caused a segmentation fault when an invalid long option is
specified, has been fixed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD release ISO images now have “FreeBSD-” at the beginning of the
filenames.

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated to 2.28.2.

The supported version of the **KDE** desktop environment
(```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
has been updated to 4.3.5.

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
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC or SMP kernels distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility requires that the host being upgraded has Internet connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.3-stable>`__
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

All users of FreeBSD 7.3-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
