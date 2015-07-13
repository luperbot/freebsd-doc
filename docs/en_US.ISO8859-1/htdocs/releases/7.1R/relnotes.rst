=================================
FreeBSD 7.1-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.1-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 The
FreeBSD Documentation Project

| $FreeBSD:
  release/7.1.0/release/doc/en\_US.ISO8859-1/relnotes/article.sgml
  186643 2008-12-31 08:07:10Z hrs $

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

The release notes for FreeBSD 7.1-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 7.1-STABLE development
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
2.5 `Release Engineering and Integration <#RELENG>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 7.1-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 7.1-RELEASE is a release distribution. It
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
7.1-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 7.0-RELEASE.

Typical release note items document recent security advisories issued
after 7.0-RELEASE, new drivers or hardware support, new commands or
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

+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                           | Date               | Topic                                                                                                                                              |
+====================================================================================================+====================+====================================================================================================================================================+
| `SA-08:05.openssh <http://security.freebsd.org/advisories/FreeBSD-SA-08:05.openssh.asc>`__         | 17 April 2008      | OpenSSH X11-forwarding privilege escalation                                                                                                        |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:06.bind <http://security.freebsd.org/advisories/FreeBSD-SA-08:06.bind.asc>`__               | 13 July 2008       | DNS cache poisoning                                                                                                                                |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:07.amd64 <http://security.freebsd.org/advisories/FreeBSD-SA-08:07.amd64.asc>`__             | 3 September 2008   | amd64 swapgs local privilege escalation                                                                                                            |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:08.nmount <http://security.freebsd.org/advisories/FreeBSD-SA-08:08.nmount.asc>`__           | 3 September 2008   | `nmount(2) <http://www.FreeBSD.org/cgi/man.cgi?query=nmount&sektion=2&manpath=FreeBSD+7.1-RELEASE>`__ local arbitrary code execution               |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:09.icmp6 <http://security.freebsd.org/advisories/FreeBSD-SA-08:09.icmp6.asc>`__             | 3 September 2008   | Remote kernel panics on IPv6 connections                                                                                                           |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:10.nd6 <http://security.freebsd.org/advisories/FreeBSD-SA-08:10.nd6.asc>`__                 | 1 October 2008     | IPv6 Neighbor Discovery Protocol routing vulnerability                                                                                             |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:11.arc4random <http://security.freebsd.org/advisories/FreeBSD-SA-08:11.arc4random.asc>`__   | 24 November 2008   | `arc4random(9) <http://www.FreeBSD.org/cgi/man.cgi?query=arc4random&sektion=9&manpath=FreeBSD+7.1-RELEASE>`__ predictable sequence vulnerability   |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:12.ftpd <http://security.freebsd.org/advisories/FreeBSD-SA-08:12.ftpd.asc>`__               | 23 December 2008   | Cross-site request forgery in `ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__                    |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:13.protosw <http://security.freebsd.org/advisories/FreeBSD-SA-08:13.protosw.asc>`__         | 23 December 2008   | netgraph / bluetooth privilege escalation                                                                                                          |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+

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
`clock\_gettime(2) <http://www.FreeBSD.org/cgi/man.cgi?query=clock_gettime&sektion=2&manpath=FreeBSD+7.1-RELEASE>`__
and the related system calls now support a clock ID
``CLOCK_THREAD_CPUTIME_ID``, defined in POSIX.

The
`cpuset(2) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuset&sektion=2&manpath=FreeBSD+7.1-RELEASE>`__
system call has been added. This is an API for thread to CPU binding and
CPU resource grouping and assignment.

The DTrace, a comprehensive dynamic tracing framework and
`dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
userland utility have been imported from OpenSolaris. DTrace provides a
powerful infrastructure to permit administrators, developers, and
service personnel to concisely answer arbitrary questions about the
behavior of the operating system and user programs.

The
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
kernel debugger now has an output capture facility. Input and output
from
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
can now be captured to a memory buffer for later inspection using
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
or a textdump. The new ``capture`` command controls this feature.

The
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
debugger now supports a simple scripting facility, which supports a set
of named scripts consisting of a set of
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
commands. These commands can be managed from within
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
or with the use of the new
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility. More details can be found in the
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
manual page.

The
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
``ex`` command now supports an ``/S`` mode which interprets and prints
the value at the requested address as a symbol. For example, ex /S
``aio_swake`` prints the name of the function currently registered in
via ``aio_swake`` hook.

The
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
``show conifhk`` command has been added. This lists hooks currently
waiting for completion in ``run_interrupt_driven_config_hooks()``.

The
`fcntl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fcntl&sektion=2&manpath=FreeBSD+7.1-RELEASE>`__
system call now supports ``F_DUP2FD`` command. This is equivalent to
`dup(2) <http://www.FreeBSD.org/cgi/man.cgi?query=dup&sektion=2&manpath=FreeBSD+7.1-RELEASE>`__,
and compatible with Sun Solaris and IBM AIX.

The FreeBSD's
`linux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=linux&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
ABI support now implements ``sched_setaffinity()`` and
``get_setaffinity()`` using real CPU affinity setting primitives.

The client side functionality of
`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
has been implemented in FreeBSD kernel. This implementation provides the
correct semantics for
`flock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=flock&sektion=2&manpath=FreeBSD+7.1-RELEASE>`__
style locks which are used by the
`lockf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lockf&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
command line tool and the
`pidfile(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pidfile&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
library. It also implements recovery from server restarts and ensures
that dirty cache blocks are written to the server before obtaining locks
(allowing multiple clients to use file locking to safely share data).
Also, a new kernel option ``options NFSLOCKD`` has been added and
enabled by default. If the kernel support is enabled,
`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
automatically detects and uses the functionality.

The FreeBSD kernel now supports a new textdump format of kernel dumps. A
textdump provides higher-level information via mechanically
generated/extracted debugging output, rather than a simple memory dump.
This facility can be used to generate brief kernel bug reports that are
rich in debugging information, but are not dependent on kernel symbol
tables or precisely synchronized source code. More information can be
found in the
`textdump(4) <http://www.FreeBSD.org/cgi/man.cgi?query=textdump&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
manual page.

The
`wait4(2) <http://www.FreeBSD.org/cgi/man.cgi?query=wait4&sektion=2&manpath=FreeBSD+7.1-RELEASE>`__
system call now supports ``WNOWAIT`` flag to keep the process whose
status is returned in a waitable state and ``WSTOPPED`` which is
equivalent to ``WUNTRACED``.

[amd64, i386, sparc64] The FreeBSD kernel now supports initial support
of binding interrupts to CPUs.

[amd64, i386] The
`sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
scheduler is now the default process scheduler in ``GENERIC`` kernels.

The sysctl variables ``kern.features.compat_freebsd[456]`` have been
added. These are corresponding to the kernel options
``COMPAT_FREEBSD[456]``.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

[amd64, i386] The BTX kernel used by the boot loader has been changed to
invoke BIOS routines from real mode. This change makes it possible to
boot FreeBSD from USB devices.

[amd64, i386] A new gptboot boot loader has been added to support
booting from a GPT labeled disk. A new ``boot`` command has been added
to
`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__,
which makes a GPT disk bootable by writing the required bits of the boot
loader, creating a new boot partition if required.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The
`cmx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cmx&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver, a driver for Omnikey CardMan 4040 PCMCIA smartcard readers, has
been added.

[sparc64] The
`kbdmux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmux&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been added. The
`sunkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sunkbd&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
now supports
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
emulation like
`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__.

The ``nvram(4)`` driver is now MPSAFE.

An option of the
`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver ``PUC_FASTINTR`` has been no longer supported.

The
`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver now attempts detection of Synaptics touchpad before IntelliMouse.
Some touchpads will pretend to be IntelliMouse causing the IntelliMouse
probe to work and the Synaptics detection never to be done.

The
`uslcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uslcom&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver, a driver for Silicon Laboratories CP2101/CP2102-based USB serial
adapters, has been imported from OpenBSD.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver now supports Intel G33 and G45.

[i386] The ``dpms(4)`` driver has been added to use the VESA BIOS for
DPMS during suspend and resume.

The **DRM** kernel driver now supports i915 GME devices.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ale(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ale&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been added to provide support for Atheros
AR8121/AR8113/AR8114 Gigabit/Fast Ethernet controllers. This driver is
not enabled in ``GENERIC`` kernels for this release.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been split into two drivers with some common parts. The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver will continue to support adapters up to the 82575, as well as new
client/desktop adapters. A new
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver will support new server adapters.

The
`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been improved.

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been updated to version 1.6.2 from Intel.

A bug in some of the
`miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
supported drivers that IEEE 802.3 auto-negotiation was performed in a
wrong order, has been fixed. Now it chooses the correct technologies
supported by IEEE 802.3 in the order described in Annex 28B.3.

A workaround has been added for a bug in TCP/UDP hardware checksum
offload of the
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver for short frames. Note that for frames that requires hardware
VLAN tag insertion, the checksum offload workaround does not work due to
changes of checksum offset in mbuf after the VLAN tag. So disabling
hardware checksum offload for the VLAN interface is needed in such
cases.

The
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
NDIS miniport driver wrapper has been improved.

The
`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been improved and now supports checksum offloading.

The
`stge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stge&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver now supports WOL (Wake on LAN).

The
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been improved.

[amd64, i386] The
`wpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wpi&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been updated to include a number of stability fixes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

The
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports ``reject`` and ``blackhole`` keywords. In the entry
marked as ``reject``, traffic to the host will be discarded and the
sender will be notified the host is unreachable. In the entry marked as
``blackhole``, traffic is discarded but the sender is not notified.

The
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
now supports an ioctl ``BIOCSETFNR``. This is just like ``BIOCSETF`` but
it does not drop all the packets buffered on the descriptor and reset
the statistics.

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
now allow to limit the number of source MACs that can be behind a bridge
interface via ``ifmaxaddr`` parameter of
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__.

A bug in the
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
interface configuration which leads to a system panic has been fixed.

The
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
subsystem now supports ``fast`` mode operation which allows certain
packets to bypass the dummynet scheduler. This can achieve lower latency
and lower overhead when the packet flow is under the pipe bandwidth, and
eliminate recursion in the subsystem. The new sysctl variable
``net.inet.ip.dummynet.io_fast`` has been added to enable this feature.

The
`enc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=enc&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
now supports sysctl variables to control whether the firewalls or
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
will see inner and outer headers or just inner or outer headers for
incoming and outgoing IPsec packets.

The
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
now supports ioctls ``GRESKEY`` and ``GREGKEY`` which allows set or get
GRE key used for outgoing packets.

A bug in the
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
subsystem that PMTU was broken in those cases when there was a route
with a lower MTU than the MTU of the outgoing interface, has been fixed.

The netatm subsystem has been removed due to lacking of multiprocessor
support.

The
`ng\_nat(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_nat&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
now supports redirect functionality in ``libalias``. For more details,
see the manual page.

The
`ng\_pptpgre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_pptpgre&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
now supports multiple hooks like
`ng\_l2tp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2tp&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__,
to use one pair of pptpgre and ksocket nodes for all calls between two
peers.

The
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
now allows underscore in domain names. Although this is a violation of
RFC 1034 [STD 13], it is accepted by certain name servers as well as
other popular operating systems' resolver library.

A socket option ``TCP_CONGESTION`` for TCP socket has been added. This
is for setting and retrieving the congestion control algorithm. The name
used is to allow compatibility with Linux.

The
`rwlock(9) <http://www.FreeBSD.org/cgi/man.cgi?query=rwlock&sektion=9&manpath=FreeBSD+7.1-RELEASE>`__
has been used throughout the ``inpcbinfo`` and ``inpcb`` infrastructure,
and protocols that depend on that infrastructure, including UDP, TCP,
and IP raw sockets to reduce the lock contentions.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver now supports 64-bit array support for RAIDs larger than 2TB and
simultaneous opens of the device for issuing commands to the controller.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver now supports a loader variable ``hw.ata.ata_dma_check_80pin``.
This can be used to disable the 80pin cable check on broken systems such
as certain laptops and Soekris boards. The default value is ``1``.

A data corruption problem of the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver on ServerWorks HT1000 chipsets has been fixed.

The
`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver now supports a loader tunable ``hw.ciss.nop_message_heartbeat``
for NOP-message polling in ``ciss_periodic()``. This can be used as a
workaround for ``ADAPTER HEARTBEAT FAILED`` issue. The default value is
``0`` (disabled).

The ``geom_part`` GEOM class can be built as a kernel module.

The ``geom_linux_lvm`` GEOM class can be built as a kernel module.

The
`hptrr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptrr&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been updated to version 1.2 from Highpoint.

A buffer overflow in the
`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been fixed. This likely fixes a great number of weird
problems that have been reported with this driver.

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver now supports ``mpt_user`` personality.

The
`rr232x(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rr232x&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been superseded by
`hptrr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptrr&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver.

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
driver has been improved with regard to stability on machines with a
plenty of memory and high CPU load.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The
`fdescfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fdescfs&sektion=5&manpath=FreeBSD+7.1-RELEASE>`__
is now MPSAFE.

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports BSD disklabels (option ``GEOM_PART_BSD``) and VTOC8
disklabels (option ``GEOM_PART_VTOC8``).

The
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now accepts ``volume`` parameter when creating a plex.

A pathname lookup bug of a UNIX domain socket in the ``unionfs(7)`` has
been fixed.

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
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports a ``-M`` option to set the mode of a new user's
home directory.

The
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports a ``spindown`` command to set or report timeout
after which the device will be spun down.

The
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``-v`` flag for verbose output, a ``-f`` flag to ignore
errors, and ``-h`` to allow setting flags on symbolic links with the
same semantics as (for example)
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__.

The
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``-a`` flag, which is equivalent to ``-RpP`` flags.

A bug in the
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
utility which prevents POSIX.1e ACL (see also
`acl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=acl&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__)
from copying properly has been fixed.

The
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports ``-m`` flag which overrides the default mail
recipient for cron mails unless explicitly provided by ``MAILTO=`` line
in ``crontab`` file.

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports more options described in
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5&manpath=FreeBSD+7.1-RELEASE>`__.

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports ``is_default_interface()`` function which determines if
this interface is one with the default route.

A bug in the
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
that prevents removal of the default route from working has been fixed.

The
`environ(7) <http://www.FreeBSD.org/cgi/man.cgi?query=environ&sektion=7&manpath=FreeBSD+7.1-RELEASE>`__,
environment array of strings now supports unsetting a variable by
setting the first character to NULL. This is required by third-party
software such as **Dovecot** and **Postfix**.

The
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``-q`` flag to not display any warnings.

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
program and ``libfetch`` library now supports a ``NO_PROXY`` environment
variable. This specifies comma- or whitespace-separated list of host
names for which proxies should not be used. If a single asterisk is
specified, the use of proxies is disabled.

The
`ffsll(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ffsll&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
and
`flsll(3) <http://www.FreeBSD.org/cgi/man.cgi?query=flsll&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
functions have been added. These functions are the same as
`ffs(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ffs&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
and
`fls(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fls&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
except that they accept long long as the arguments.

The
`fortune(6) <http://www.FreeBSD.org/cgi/man.cgi?query=fortune&sektion=6&manpath=FreeBSD+7.1-RELEASE>`__
program now supports ``FORTUNE_PATH`` environment variable to specify
search path of the fortune files.

A bug in the
`fortune(6) <http://www.FreeBSD.org/cgi/man.cgi?query=fortune&sektion=6&manpath=FreeBSD+7.1-RELEASE>`__
program that prevents ``-e`` option with multiple files from working has
been fixed.

The
`freebsd-update.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update.conf&sektion=5&manpath=FreeBSD+7.1-RELEASE>`__
now supports ``IDSIgnorePaths`` statement.

The
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports ``-f node`` option which specifies ``node`` as the
root node on the next bus reset.

[sparc64] The
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now accepts ``-mcpu`` option properly; it was hardcoded as
``-mcpu=ultrasparc``.

The
`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports ZFS.

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports display of WPS IE (Wireless Provisioning Services
Information Element).

The
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now supports an ``add-kld kld`` command to locate a
`kld(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kld&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
and load its symbols.

The
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now has a shared library backend for kernel files that treats
`kld(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kld&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
as shared libraries and auto-loading symbols for
`kld(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kld&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
on startup.

The
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``tid`` command and other kernel module related commands
even for a remote target.

The
`kvm\_getcptime(3) <http://www.FreeBSD.org/cgi/man.cgi?query=kvm_getcptime&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
function to obtain the global CPU time statistics from the kernel has
been added.

The ``libalias`` library now supports ``PORT`` and ``EPRT`` FTP commands
in lowercase.

The
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now includes a limited support of
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__-compressed
manual pages.

The
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``-v`` (verbose) flag to ``-l`` command. It shows size
and backing store of all
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
devices at one time.

The
`memrchr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=memrchr&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
function has been added. This behaves like
`memchr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=memchr&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
except that it locates the last occurrence of the specified character in
the string.

The incorrect output grammar of
`morse(6) <http://www.FreeBSD.org/cgi/man.cgi?query=morse&sektion=6&manpath=FreeBSD+7.1-RELEASE>`__
program has been fixed.

The
`mountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mountd&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports ``-h bindip`` option which specifies IP addresses
to bind to for TCP and UDP requests. This option may be specified
multiple times. If no ``-h`` option is specified, ``INADDR_ANY`` will be
used. Note that when specifying IP addresses with this option, it will
automatically add ``127.0.0.1`` and if IPv6 is enabled, ``::1`` to the
list.

The
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports ``-L`` flag which changes the speed of scrolling
and changes ``-U`` option behavior to only affect the scroll threshold.

The
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
now support POSIX specification when moving a directory to an existing
directory across devices.

The
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports ``daily_status_mail_rejects_shorten`` configuration
variable in
`periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5&manpath=FreeBSD+7.1-RELEASE>`__.
This allows the rejected mail reports to tally the rejects per blacklist
without providing details about individual sender hosts. The default
configuration keeps the reports in their original form.

The
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now uses exit status of ``0`` and ``2`` in the same manner as
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__.

The
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports an ``-o`` flag, which makes
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
exit successfully after receiving one reply packet.

The
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports ``-r`` and ``-R`` flags, which are equivalent to
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__'s
``-a`` and ``-A`` flags, respectively.

The minimum allowed interval of
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
has been decreased to 0.000001 from 0.01.

The
`realpath(1) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports a ``-q`` flag to suppress warnings; it now also
accepts multiple paths on its command line.

The
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``-D`` flag to register DUN (Dial-Up Networking) service
in addition to the LAN (LAN Access Using PPP) service.

The
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``NAP``, ``GN``, and ``PANU`` profiles.

The
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now accepts ``esp`` as a protocol name for the ``spdadd``
command.

A bug in
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
that it attempts authentication even when ``-a off`` option is specified
has been fixed.

The
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+7.1-RELEASE>`__
and
`vmstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vmstat&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now support ``-P`` flag which displays per-CPU statistics.

The
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports an ``-a`` flag to display AS number corresponding to the
lookup IP address on each hop. It will query the number to WHOIS server
specified in ``-A`` option. If no ``-A`` is specified,
``whois.radb.net`` will be used as the default value.

The
`uuid\_enc\_le(3) <http://www.FreeBSD.org/cgi/man.cgi?query=uuid_enc_le&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__,
`uuid\_dec\_le(3) <http://www.FreeBSD.org/cgi/man.cgi?query=uuid_dec_le&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__,
`uuid\_enc\_be(3) <http://www.FreeBSD.org/cgi/man.cgi?query=uuid_enc_be&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__,
and
`uuid\_dec\_be(3) <http://www.FreeBSD.org/cgi/man.cgi?query=uuid_dec_be&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
functions have been added. These functions encode/decode a binary
representation of a UUID.

The
`watch(8) <http://www.FreeBSD.org/cgi/man.cgi?query=watch&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility now supports more than 10
`snp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snp&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
devices at a time.

The
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
now supports a ``-P`` option to specify the port number on which it
should listen.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.1-RELEASE>`__
now supports ``dummynet_enable`` variable which allow
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+7.1-RELEASE>`__
kernel module to be loaded when ``firewall_enable`` is ``YES``.

The ``ntpd``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
script can work with no configuration file ``/etc/ntp.conf`` now.

The ``ppp``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
script now supports multiple instances. For more details, see
description of ``ppp_profile`` variable in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.1-RELEASE>`__.

The ``sysctl``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
script now supports loading ``/etc/sysctl.conf.local`` in addition to
``/etc/sysctl.conf``.

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.1-RELEASE>`__
now supports configuration of interfaces and attached networks for
firewall rule set by ``rc.firewall`` when ``firewall_type`` is
``simple`` or ``client``. See ``firewall_client_net``,
``firewall_simple_iif``, ``firewall_simple_inet``,
``firewall_simple_oif``, and ``firewall_simple_onet``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**am-utils** has been updated from version 6.0.10p1 to version 6.1.5.

**ISC BIND** has been updated to version 9.4.2-P2.

**awk** has been updated from 1 May 2007 release to the 23 October 2007
release.

**bzip2** has been updated from version 1.0.4 to version 1.0.5.

**CVS** has been updated to version 1.11.22.1.

**hostapd** has been updated to version 0.5.10 + radius ACL support.

``libarchive`` has been updated to version 2.5.5.

**ncurses** library has been updated to version 5.6-20080503.

**NTP** has been updated to version 4.2.4p5.

**OpenPAM** has been updated from the Figwort release to the Hydrangea
release.

**OpenSSH** has been updated from version 4.5p1 to version 5.1p1.

The
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+7.1-RELEASE>`__
library has been updated to one of **ISC BIND** 9.4.3.

**sendmail** has been updated from version 8.14.2 to version 8.14.3.

The timezone database has been updated from the **tzdata2007h** release
to the **tzdata2008h** release.

**wpa\_supplicant** has been updated to version 0.5.10 + syslog support.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.20.1 to 2.22.

The supported version of the **KDE** desktop environment
(```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
has been updated from 3.5.8 to 3.5.10.

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
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC or SMP kernels distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
utility requires that the host being upgraded have Internet
connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.1-RELEASE>`__
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

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
