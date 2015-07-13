=================================
FreeBSD 8.3-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 8.3-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2012 The FreeBSD Documentation Project

| $FreeBSD:
  releng/8.3/release/doc/en\_US.ISO8859-1/relnotes/article.sgml 234052
  2012-04-09 04:44:39Z hrs $

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

The release notes for FreeBSD 8.3-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 8.3-STABLE development
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
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Ports/Packages Collection Infrastructure <#PORTS>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 8.3-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 8.3-RELEASE is a release distribution. It
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
8.3-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 8.2-RELEASE.

Typical release note items document recent security advisories issued
after 8.2-RELEASE, new drivers or hardware support, new commands or
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
| `SA-11:01.moun | 20 April 2011  | Network ACL mishandling in                  |
| td <http://sec |                | `mountd(8) <http://www.FreeBSD.org/cgi/man. |
| urity.freebsd. |                | cgi?query=mountd&sektion=8&manpath=FreeBSD+ |
| org/advisories |                | 8.3-RELEASE>`__                             |
| /FreeBSD-SA-11 |                |                                             |
| :01.mountd.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:02.bind | 28 May 2011    | BIND remote DoS with large RRSIG RRsets and |
|  <http://secur |                | negative caching                            |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-11:0 |                |                                             |
| 2.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:04.comp | 28 September 2 | Errors handling corrupt compress file in    |
| ress <http://s | 011            | `compress(1) <http://www.FreeBSD.org/cgi/ma |
| ecurity.freebs |                | n.cgi?query=compress&sektion=1&manpath=Free |
| d.org/advisori |                | BSD+8.3-RELEASE>`__                         |
| es/FreeBSD-SA- |                | and                                         |
| 11:04.compress |                | `gzip(1) <http://www.FreeBSD.org/cgi/man.cg |
| .asc>`__       |                | i?query=gzip&sektion=1&manpath=FreeBSD+8.3- |
|                |                | RELEASE>`__                                 |
+----------------+----------------+---------------------------------------------+
| `SA-11:05.unix | 28 September 2 | Buffer overflow in handling of UNIX socket  |
|  <http://secur | 011            | addresses                                   |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-11:0 |                |                                             |
| 5.unix.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:06.bind | 23 December 20 | Remote packet Denial of Service against     |
|  <http://secur | 11             | `named(8) <http://www.FreeBSD.org/cgi/man.c |
| ity.freebsd.or |                | gi?query=named&sektion=8&manpath=FreeBSD+8. |
| g/advisories/F |                | 3-RELEASE>`__                               |
| reeBSD-SA-11:0 |                | servers                                     |
| 6.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:07.chro | 23 December 20 | Code execution via chrooted ftpd            |
| ot <http://sec | 11             |                                             |
| urity.freebsd. |                |                                             |
| org/advisories |                |                                             |
| /FreeBSD-SA-11 |                |                                             |
| :07.chroot.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:08.teln | 23 December 20 | telnetd code execution vulnerability        |
| etd <http://se | 11             |                                             |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 1:08.telnetd.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:09.pam\ | 23 December 20 | pam\_ssh improperly grants access when user |
| _ssh <http://s | 11             | account has unencrypted SSH private keys    |
| ecurity.freebs |                |                                             |
| d.org/advisori |                |                                             |
| es/FreeBSD-SA- |                |                                             |
| 11:09.pam_ssh. |                |                                             |
| asc>`__        |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:10.pam  | 23 December 20 | ``pam_start()`` does not validate service   |
| <http://securi | 11             | names                                       |
| ty.freebsd.org |                |                                             |
| /advisories/Fr |                |                                             |
| eeBSD-SA-11:10 |                |                                             |
| .pam.asc>`__   |                |                                             |
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

[amd64, i386] The FreeBSD
`dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
framework now supports ``systrace`` for system calls of ``linux32`` and
``freebsd32`` on FreeBSD/amd64. Two new ``systrace_linux32`` and
``systrace_freebsd32`` kernel modules provide support for tracing compat
system calls in addition to the native system call tracing provided by
the ``systrace``
module.[`r219107 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219107>`__\ ]

The
`hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
(Helper Hook) and
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
(Kernel Helpers) KPIs have been implemented. These are a kind of
superset of
`pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
framework for more general use in the kernel. The
`hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
KPI provides a way for kernel subsystems to export hook points that
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
modules can hook to provide enhanced or new functionality to the kernel.
The
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
KPI provides a framework for managing
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
modules, which indirectly use the
`hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
KPI to register their hook functions with hook points of interest within
the kernel. These allow a structured way to dynamically extend the
kernel at runtime in an ABI preserving
manner.[`r222406 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222406>`__\ ]

[amd64, i386, pc98] A
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
tunable ``hw.memtest.tests`` has been added. This controls whether to
perform memory testing at boot time or not. The default value is ``1``
(perform a memory
test).[`r230282 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230282>`__\ ]

The
`open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=open&sektion=2&manpath=FreeBSD+8.3-RELEASE>`__
and
`fhopen(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fhopen&sektion=2&manpath=FreeBSD+8.3-RELEASE>`__
system calls now support the ``O_CLOEXEC`` flag, which allows setting
the ``FD_CLOEXEC`` flag for the newly created file descriptor. This is
standardized in IEEE Std 1003.1-2008 (POSIX, Single UNIX Specification
Version
4).[`r220241 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220241>`__\ ]

The
`posix\_fallocate(2) <http://www.FreeBSD.org/cgi/man.cgi?query=posix_fallocate&sektion=2&manpath=FreeBSD+8.3-RELEASE>`__
system call has been implemented. This is a function in POSIX to ensure
that a part of the storage for regular file data is allocated on the
file system storage
media.[`r227573 <http://svn.freebsd.org/viewvc/base?view=revision&revision=227573>`__\ ]

The
`posix\_fadvise(2) <http://www.FreeBSD.org/cgi/man.cgi?query=posix_fadvise&sektion=2&manpath=FreeBSD+8.3-RELEASE>`__
system call has been implemented. This is a function in POSIX similar to
`madvise(2) <http://www.FreeBSD.org/cgi/man.cgi?query=madvise&sektion=2&manpath=FreeBSD+8.3-RELEASE>`__
except that it operates on a file descriptor instead of a memory
region.[`r229725 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229725>`__\ ]

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The FreeBSD
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
subsystem now supports USB packet filter. This allows to capture packets
which go through each USB host controller. The implementation is almost
based on
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
code. The userland program
`usbdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdump&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
has been
added.[`r221174 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221174>`__\ ]

.. raw:: html

   <div class="SECT4">

--------------

2.2.1.1 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver has been updated to version
7.11.0.[`r220340 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220340>`__\ ]

A
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver for Chelsio T4 (Terminator 4) based 10Gb/1Gb adapters has been
added.[`r219633 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219633>`__\ ]

[i386] The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now works correctly in kernels with the ``PAE``
option.[`r220072 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220072>`__\ ]

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver has been updated to version
7.3.2.[`r230848 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230848>`__\ ]

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver has been updated to version
2.3.1.[`r230848 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230848>`__\ ]

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports Intel I350 PCIe Gigabit Ethernet
controllers.[`r230848 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230848>`__\ ]

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver has been updated to version
2.4.5.[`r230924 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230924>`__\ ]

Firmware images in the
`iwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwn&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver for 1000, 5000, 6000, and 6500 series cards have been
updated.[`r223255 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223255>`__\ ]

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports RX checksum offloading for Yukon EC, Yukon Ultra,
Yukon FE and Yukon Ultra2. The checksum offloading for Yukon XL was
still disabled due to known silicon
bug.[`r223394 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223394>`__\ ]

A bug in the
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver which could prevent reinitialization after changing the MTU has
been
fixed.[`r218872 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218872>`__\ ]

A rdcphy(4) driver for RDC Semiconductor R6040 10/100 PHY has been
added.[`r218294 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218294>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports RTL8168E/8111E-VL PCIe Gigabit Ethernet controllers
and RTL8401E PCIe Fast Ethernet
controllers.[\ `r218901 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218901>`__,
`r219116 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219116>`__]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports TX interrupt moderation on RTL810xE PCIe Fast
Ethernet
controllers.[`r218905 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218905>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports another mechanism for RX interrupt moderation
because of performance problems. A
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
variable ``dev.re.N.int_rx_mod`` has been added to control amount of
time to delay RX interrupt processing, in units of microsecond. Setting
it to ``0`` completely disables RX interrupt moderation. A
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
tunable ``hw.re.intr_filter`` controls whether the old mechanism
utilizing MSI/MSI-X capability on supported controllers is used or not.
When set to a non-zero value, the
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver uses the old mechanism. The default value is ``0`` and this
tunable has no effect on controllers without MSI/MSI-X
capability.[`r219110 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219110>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports TSO (TCP Segmentation Offload) on RealTek
RTL8168/8111 C or later controllers. Note that this is disabled by
default because broken frames can be sent under certain
conditions.[`r218897 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218897>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports enabling TX and/or RX checksum offloading
independently from each other. Note that TX IP checksum is disabled on
some RTL8168C-based network interfaces because it can generate an
incorrect IP checksum when the packet contains IP
options.[\ `r218899 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218899>`__,
`r219114 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219114>`__]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports RTL8105E PCIe Fast Ethernet
controllers.[`r229530 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229530>`__\ ]

A
`vte(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vte&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver for RDC R6040 Fast Ethernet controllers, which are commonly found
on the Vortex86 System On a Chip, has been
added.[`r218296 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218296>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
now supports the ``call`` and ``return`` actions. Upon the
``call 	 number`` action, the current rule number is saved in the
internal stack and ruleset processing continues with the first rule
numbered ``number`` or higher. The ``return`` action takes the rule
number saved to internal stack by the latest ``call`` action and returns
ruleset processing to the first rule with number greater than that saved
number.[`r230575 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230575>`__\ ]

FreeBSD's
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
support now uses half of the hash size as the authenticator hash size in
Hashed Message Authentication Mode (HMAC-SHA-256, HMAC-SHA-384, and
HMAC-SHA-512) as described in RFC 4868. This was a fixed 96-bit length
in prior releases because the implementation was based on an old
Internet draft draft-ietf-ipsec-ciph-sha-256-00. Note that this means
8.3-RELEASE and later are no longer interoperable with the older FreeBSD
releases.[`r221157 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221157>`__\ ]

A bug in the ``IPV6_PKTINFO`` option used in
`sendmsg(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmsg&sektion=2&manpath=FreeBSD+8.3-RELEASE>`__
has been fixed. The ``IPV6_USE_MIN_MTU`` state set by
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2&manpath=FreeBSD+8.3-RELEASE>`__
was
ignored.[`r232560 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232560>`__\ ]

The FreeBSD TCP/IP network stack now supports the
`mod\_cc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
pluggable congestion control framework. This allows TCP congestion
control algorithms to be implemented as dynamically loadable kernel
modules. The following kernel modules are available as of 8.3-RELEASE:
`cc\_chd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_chd&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
for the CAIA-Hamilton-Delay algorithm,
`cc\_cubic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_cubic&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
for the CUBIC algorithm,
`cc\_hd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_hd&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
for the Hamilton-Delay algorithm,
`cc\_htcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_htcp&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
for the H-TCP algorithm,
`cc\_newreno(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_newreno&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
for the NewReno algorithm, and
`cc\_vegas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_vegas&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
for the Vegas algorithm. The default algorithm can be set by a new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
variable ``net.inet.tcp.cc.algorithm``. The value must be set to one of
the names listed by ``net.inet.tcp.cc.available``, and ``newreno`` is
the default set at boot time. For more detail, see the
`mod\_cc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
and
`mod\_cc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
manual
pages.[\ `r222401 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222401>`__,
`r222402 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222402>`__,
`r222403 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222403>`__,
`r222404 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222404>`__,
`r222406 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222406>`__,
`r222407 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222407>`__,
`r222408 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222408>`__,
`r222409 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222409>`__,
`r222411 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222411>`__,
`r222412 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222412>`__,
`r222413 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222413>`__,
`r222419 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222419>`__,
`r225738 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225738>`__]

An
`h\_ertt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=h_ertt&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
(Enhanced Round Trip Time)
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+8.3-RELEASE>`__
module has been added. This module allows per-connection, low noise
estimates of the instantaneous RTT in the TCP/IP network stack with a
robust implementation even in the face of delayed acknowledgments and/or
TSO (TCP Segmentation Offload) being in use for a
connection.[`r222410 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222410>`__\ ]

A new
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
socket option ``TCP_CONGESTION`` has been added. This allows to select
or query the congestion control algorithm that the TCP/IP network stack
will use for connections on the
socket.[`r222401 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222401>`__\ ]

The
`ng\_ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ipfw&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
node now supports
IPv6.[`r225876 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225876>`__\ ]

The
`ng\_one2many(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_one2many&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
node now supports the ``XMIT_FAILOVER`` transmit algorithm. This makes
packets deliver out of the first active ``many``
hook.[`r219660 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219660>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ada(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ada&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver now supports write cache control. A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
variable ``kern.cam.ada.write_cache`` determines whether the write cache
of
`ada(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ada&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
devices is enabled or not. Setting to ``1`` enables and ``0`` disables
the write cache, and ``-1`` leaves the device default behavior.
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
variables ``kern.cam.ada.N.write_cache`` can override the configuration
in a per-device basis (the default value is ``-1``, which means to use
the global setting). Note that the value can be changed at runtime, but
it takes effect only after a device
reset.[`r220841 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220841>`__\ ]

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver has been updated to version
1.20.00.22.[`r224991 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224991>`__\ ]

The
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
GEOM class has been added. This is a replacement of the
`ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver supporting various BIOS-based software
RAID.[`r223177 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223177>`__\ ]

The
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver has been
updated.[`r224235 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224235>`__\ ]

A
`tws(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tws&sektion=4&manpath=FreeBSD+8.3-RELEASE>`__
driver for 3ware 9750 SATA+SAS 6Gb/s RAID controllers has been
added.[`r226243 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226243>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 File Systems
^^^^^^^^^^^^^^^^^^

The FreeBSD Fast File System now supports the ``TRIM`` command when
freeing data blocks. A new flag ``-t`` in the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
and
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utilities sets the TRIM-enable flag for a file system. The TRIM-enable
flag makes the file system send a delete request to the underlying
device for each freed block. The ``TRIM`` command is specified as a Data
Set Management Command in the ATA8-ACS2 standard to carry the
information related to deleted data blocks to a device, especially for a
SSD (Solid-State Drive) for
optimization.[`r218079 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218079>`__\ ]

A new flag ``-E`` has been added to the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
and
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utilities. This clears unallocated blocks, notifying the underlying
device that they are not used and that their contents may be discarded.
This is useful in
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
for file systems which have been mounted on systems without ``TRIM``
support, or with ``TRIM`` support disabled, as well as filesystems which
have been copied from one device to
another.[`r225296 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225296>`__\ ]

The FreeBSD NFS subsystem now supports a ``nocto`` mount option. This
disables the close-to-open cache coherency check at open time. This
option may improve performance for read-only mounts, but should only be
used only if the data on the server changes rarely. The
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now also supports this flag
keyword.[`r221759 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221759>`__\ ]

A
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
tunable ``vfs.typenumhash`` has been added. Setting this to ``1``
enables to use a hash calculation on the file system identification
number internally used in the kernel. This fixes the “Stale NFS file
handle” error on NFS clients when upgrading or rebuilding the kernel on
the NFS server due to unexpected change of these identification number
values. Note that this is set to ``0`` (disable) by default for backward
compatibility.[`r226926 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226926>`__\ ]

The FreeBSD ZFS subsystem has been updated to the SPA (Storage Pool
Allocator, also known as zpool) version 28. It now supports data
deduplication, triple parity RAIDZ (raidz3), snapshot holds, log device
removal, zfs diff, zpool split, zpool import ``-F``, and read-only zpool
import.[`r222741 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222741>`__\ ]

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
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
and
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
utilities are now based on **libarchive** version
2.8.5.[`r229589 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229589>`__\ ]

The
`cpuset(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuset&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports a ``-C`` flag to create a new cpuset and assign an
existing process into that set, and an ``all`` keyword in the
``-l 	cpu-list`` option to specify all CPUs in the
system.[`r218033 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218033>`__\ ]

A bug in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
utility which could prevent the ``STAT`` FTP command from working
properly has been
fixed.[`r221764 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221764>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports a ``-p`` flag to the ``show`` subcommand. This
allows showing providers' names of partitions instead of the partitions'
indexes.[`r219861 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219861>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now drops ``root`` privileges of the worker processes to the
``hast``
user.[`r220104 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220104>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports a ``checksum`` keyword to specify the checksum
algorithm in a ``resource`` section. As of 8.3-RELEASE, ``none``,
``sha256``, and ``crc32`` are
supported.[`r220104 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220104>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports a ``compression`` keyword to specify the
compression algorithm in a ``resource`` section. As of 8.3-RELEASE,
``none``, ``hole`` and ``lzf`` are
supported.[`r220104 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220104>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports a ``source`` keyword to specify the local address
to bind to before connecting the remote
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
daemon.[`r220104 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220104>`__\ ]

A
`readline(3) <http://www.FreeBSD.org/cgi/man.cgi?query=readline&sektion=3&manpath=FreeBSD+8.3-RELEASE>`__
API set has been imported into **libedit**. This is based on NetBSD's
implementation and BSD licensed utilities now use it instead of GNU
**libreadline**.[`r220612 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220612>`__\ ]

The
`makefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=makefs&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports the ISO 9660
format.[`r224447 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224447>`__\ ]

**libmd** and **libcrypt** now support the SHA-256 and SHA-512
algorithms.[`r231588 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231588>`__\ ]

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
utility now does not expose the internal scope address representation
used in the FreeBSD kernel, which is derived from KAME IPv6 stack, in
the results of ``netstat -ani`` and
``netstat 	 -nr``.[`r219062 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219062>`__\ ]

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports
`xz(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xz&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
compression. An ``X`` flag in the optional field has been added to
specify the
compression.[`r218911 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218911>`__\ ]

A
`poweroff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poweroff&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility has been added. This is equivalent
to:[`r224259 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224259>`__\ ]

.. code:: SCREEN

    # shutdown -p now

The
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports ``iface name name`` and
``iface description 	description`` commands. These have the same
functionalities as the ``name`` and ``description`` subcommands of the
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility.[`r224285 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224285>`__\ ]

The
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
utility now supports ``-o usertime`` and ``-o systime`` options to
display accumulated system and user CPU time,
respectively.[`r219943 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219943>`__\ ]

The
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
daemon now supports a ``noifprefix`` keyword to disable gathering
on-link prefixes from interfaces when no ``addr`` keyword is specified.
An entry in ``/etc/rtadvd.conf`` with ``noifprefix`` and no ``addr``
generates an RA message with no prefix information
option.[`r231802 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231802>`__\ ]

The
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
daemon now supports the RDNSS and DNSSL options described in RFC 6106,
“IPv6 Router Advertisement Options for DNS Configuration”. A
`rtadvctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvctl&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility to control the
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
daemon has been
added.[`r231802 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231802>`__\ ]

A bug in the
`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
daemon has been fixed. It had an interoperability issue when
transferring a large
file.[`r227083 <http://svn.freebsd.org/viewvc/base?view=revision&revision=227083>`__\ ]

The
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__:
utility now supports a ``zpool labelclear`` command. This allows to wipe
the label data from a drive that is not active in a
pool.[`r229570 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229570>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

The **awk** has been updated to the 7 August 2011 release.

**ISC BIND** has been updated to version 9.6-ESV-R5-P1.

The ``netcat`` utility has been updated to version 4.9.

**GNU GCC** and **libstdc++** have been updated to rev 127959 of
``gcc-4_2-branch`` (the last GPLv2-licensed
version).[`r221274 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221274>`__\ ]

The **LESS** program has been updated to version
v444.[`r223454 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223454>`__\ ]

The **OpenSSH** utility has been updated to 5.4p1, and optimization for
large bandwidth-delay product connection and ``none`` cipher support
have been
merged[`r228152 <http://svn.freebsd.org/viewvc/base?view=revision&revision=228152>`__\ ]

**sendmail** has been updated to version
8.14.5.[`r223315 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223315>`__\ ]

The **timezone** database has been updated to the **tzdata2011n**
release.[`r226977 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226977>`__\ ]

The
`unifdef(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unifdef&sektion=1&manpath=FreeBSD+8.3-RELEASE>`__
utility has been updated to version 2.5.6.

The **xz** program has been updated from 5.0.0 to
5.0.1.[`r219219 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219219>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported version of the **KDE** desktop environment
(```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
has been updated from 4.5.5 to 4.7.4.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

[amd64, i386] Upgrades between RELEASE versions (and snapshots of the
various security branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC kernel distributed as a part of
an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
utility requires that the host being upgraded has Internet connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+8.3-RELEASE>`__
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
