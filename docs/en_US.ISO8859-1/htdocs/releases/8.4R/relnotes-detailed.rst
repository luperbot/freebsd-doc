=================================
FreeBSD 8.4-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2013 The FreeBSD Documentation Project

| $FreeBSD: releng/8.4/release/doc/en\_US.ISO8859-1/relnotes/article.xml
  251258 2013-06-02 16:21:02Z hrs $

.. raw:: html

   <div class="legalnotice">

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
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract">

The release notes for FreeBSD 8.4-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 8.4-STABLE development
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
1 `Introduction <#intro>`__
2 `What's New <#new>`__
2.1 `Security Advisories <#security>`__
2.2 `Kernel Changes <#kernel>`__
2.2.1 `Boot Loader Changes <#boot>`__
2.2.2 `Hardware Support <#proc>`__
2.2.3 `Network Protocols <#net-proto>`__
2.2.4 `Disks and Storage <#disks>`__
2.2.5 `File Systems <#fs>`__
2.3 `Userland Changes <#userland>`__
2.3.1 ```/etc/rc.d`` Scripts <#rcd-scripts>`__
2.4 `Contributed Software <#contrib>`__
2.5 `Ports/Packages Collection Infrastructure <#ports>`__
2.6 `Release Engineering and Integration <#releng>`__
3 `Upgrading from previous releases of FreeBSD <#upgrade>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 8.4-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 8.4-RELEASE is a release distribution. It
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
8.4-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 8.3-RELEASE.

Typical release note items document recent security advisories issued
after 8.3-RELEASE, new drivers or hardware support, new commands or
options, major bug fixes, or contributed software upgrades. They may
also list changes to major ports/packages or release engineering
practices. Clearly the release notes cannot list every single change
made to FreeBSD between releases; this document focuses primarily on
security advisories, user-visible changes, and major architectural
improvements.

.. raw:: html

   <div class="sect2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

Problems described in the following security advisories have been fixed.
For more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="informaltable">

+----------------+----------------+---------------------------------------------+
| Advisory       | Date           | Topic                                       |
+================+================+=============================================+
| `SA-12:01.open | 03?May?2012    | OpenSSL multiple vulnerabilities            |
| ssl <http://se |                |                                             |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 2:01.openssl.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:02.cryp | 30?May?2012    | Incorrect crypt() hashing                   |
| t <http://secu |                |                                             |
| rity.freebsd.o |                |                                             |
| rg/advisories/ |                |                                             |
| FreeBSD-SA-12: |                |                                             |
| 02.crypt.asc>` |                |                                             |
| __             |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:03.bind | 12?June?2012   | Incorrect handling of zero-length RDATA     |
|  <http://secur |                | fields in named(8)                          |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-12:0 |                |                                             |
| 3.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:04.sysr | 12?June?2012   | Privilege escalation when returning from    |
| et <http://sec |                | kernel                                      |
| urity.freebsd. |                |                                             |
| org/advisories |                |                                             |
| /FreeBSD-SA-12 |                |                                             |
| :04.sysret.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:05.bind | 06?August?2012 | named(8) DNSSEC validation Denial of        |
|  <http://secur |                | Service                                     |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-12:0 |                |                                             |
| 5.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:06.bind | 22?November?20 | Multiple Denial of Service vulnerabilities  |
|  <http://secur | 12             | with named(8)                               |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-12:0 |                |                                             |
| 6.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:07.host | 22?November?20 | Insufficient message length validation for  |
| apd <http://se | 12             | EAP-TLS messages                            |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 2:07.hostapd.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:08.linu | 22?November?20 | Linux compatibility layer input validation  |
| x <http://secu | 12             | error                                       |
| rity.freebsd.o |                |                                             |
| rg/advisories/ |                |                                             |
| FreeBSD-SA-12: |                |                                             |
| 08.linux.asc>` |                |                                             |
| __             |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-13:02.libc | 19?February?20 | glob(3) related resource exhaustion         |
|  <http://secur | 13             |                                             |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-13:0 |                |                                             |
| 2.libc.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-13:03.open | 02?April?2013  | OpenSSL multiple vulnerabilities            |
| ssl <http://se |                |                                             |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 3:03.openssl.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-13:04.bind | 02?April?2013  | BIND remote denial of service               |
|  <http://secur |                |                                             |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-13:0 |                |                                             |
| 4.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-13:05.nfss | 29?April?2013  | Insufficient input validation in the NFS    |
| erver <http:// |                | server                                      |
| security.freeb |                |                                             |
| sd.org/advisor |                |                                             |
| ies/FreeBSD-SA |                |                                             |
| -13:05.nfsserv |                |                                             |
| er.asc>`__     |                |                                             |
+----------------+----------------+---------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

A bug which could cause a kernel thread to have a wrong CPU affinity
configuration has been
fixed.[`r232757 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232757>`__\ ]

`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
environment variables ``comconsole_port`` and ``comconsole_pcidev`` have
been added. The former allows to set the base address of the serial
console I/O port. The later takes the string of the format
``bus``:``device``:``function``:``[bar]`` as a value and uses the serial
port attached as PCI device at the specified location for console. Both
variants pass ``hw.uart.console`` variable to the
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver to properly hand-over the kernel
console.[`r245847 <http://svn.freebsd.org/viewvc/base?view=revision&revision=245847>`__\ ]

A new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
tunable ``hw.broken_txfifo`` has been added to enable workaround for old
version of **QEMU** and **Xen** which have a buggy emulated
UART.[`r246626 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246626>`__\ ]

The ``F_DUPFD_CLOEXEC`` command for
`fcntl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fcntl&sektion=2&manpath=FreeBSD+8.4-RELEASE>`__
has been implemented. This is standardized in IEEE Std 1003.1-2008
(POSIX, Single UNIX Specification Version 4). In addition to this,
``F_DUP2FD_CLOEXEC`` has been implemented in analogy with
``F_DUP2FD``.[\ `r239860 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239860>`__,
`r239861 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239861>`__]

The
`filemon(4) <http://www.FreeBSD.org/cgi/man.cgi?query=filemon&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
pseudo-device has been added. This allows a process to collect file
operations data of its
children.[`r240707 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240707>`__\ ]

A bug in VIMAGE
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
which could make the network subsystem run on an wrong vnet context has
been
fixed.[`r233584 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233584>`__\ ]

``debug.kdb.break_to_debugger`` and ``debug.kdb.alt_break_to_debugger``
have been added as
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variables and loader tunables. These are disabled by default and
``BREAK_TO_DEBUGGER`` and ``ALT_BREAK_TO_DEBUGGER`` kernel options now
set them enabled. These changes allow ``GENERIC`` kernel to support
break-to-debugger
capability.[`r235121 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235121>`__\ ]

The FreeBSD
`sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
scheduler has been improved in CPU selection on systems which support
SMT (Symmetric MultiThreading, also known as HyperThreading on Intel
CPUs). It now prefers a logical CPU when the the other logical CPUs on
the physical one are idle, and an idle CPU in an SMT CPU group always
has lower priority. The CPU load calculation for load balancing has also
been improved to consider highest and lowest CPU load in comparison to
differentiate load in CPU groups. This change gives 10-15% performance
improvement in SMT CPUs such as Core
i7.[`r241246 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241246>`__\ ]

The
`shm\_map(9) <http://www.FreeBSD.org/cgi/man.cgi?query=shm_map&sektion=9&manpath=FreeBSD+8.4-RELEASE>`__
and
`shm\_unmap(9) <http://www.FreeBSD.org/cgi/man.cgi?query=shm_unmap&sektion=9&manpath=FreeBSD+8.4-RELEASE>`__
functions have been added to allow in-kernel code to map portions of
shared memory objects created by
`shm\_open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shm_open&sektion=2&manpath=FreeBSD+8.4-RELEASE>`__
into the kernel's address
space.[`r236684 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236684>`__\ ]

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variable ``kern.stop_scheduler_on_panic`` has been added. When set to
``1``, only one thread runs uninterruptedly after a system panic and the
other CPUs are stopped. The default value is
``0``.[`r235502 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235502>`__\ ]

The
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
tunables ``kern.maxtsiz``, ``kern.dfldsiz``, ``kern.maxdsiz``,
``kern.dflssiz``, ``kern.maxssiz``, and ``kern.sgrowsiz`` are now
writable
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variables.[`r240502 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240502>`__\ ]

A bug that changes to a mapped file with the
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+8.4-RELEASE>`__
system call were not flushed properly under certain circumstances has
been fixed. If a process has an NFS-backed file and adds changes to it,
normally the changes are written into the backing store automatically.
However, the NFS client recognized the modified parts are written
successfully even when the write operation was failed for some reason
such as permission
denied.[\ `r233765 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233765>`__,
`r234094 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234094>`__,
`r236150 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236150>`__]

.. raw:: html

   <div class="sect3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

[amd64, i386, pc98] A bug in FreeBSD boot block has been fixed. A
pathname of the third stage loader (or kernel) in the
`boot.config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=boot.config&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
configuration file could not be
recognized.[\ `r233377 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233377>`__,
`r234563 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234563>`__]

A bug in
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
which could prevents a UFS1 filesystem on big endian platforms from
booting.[`r232963 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232963>`__\ ]

[sparc64] FreeBSD
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
now supports ``heap`` to show the heap
usage.[`r235998 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235998>`__\ ]

The **gptboot** boot block now reads the backup GPT header from the last
LBA only when the primary GPT header and tables are invalid. This
mitigates interoperability issues with some
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
providers like ``MIRROR`` which use the last LBA for the
metadata.[`r234694 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234694>`__\ ]

[sparc64] FreeBSD/sparc64 now supports booting from ZFS via the
``zfsboot`` boot block and
``zfsloader``.[`r236077 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236077>`__\ ]

A bug in the **zfsboot** boot block which could prevent ``-q`` option
from working has been
fixed.[`r234680 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234680>`__\ ]

The ``zfsboot`` boot block and ``zfsloader`` support filesystems within
a ZFS storage pool. In ``zfsloader``, the ZFS device name format is now
``zfs:pool/fs`` and the fully qualified file path format is
``zfs:pool/fs:/path/to/file``. The ``zfsboot`` boot block accepts the
kernel/loader name in the format ``pool:fs:path/to/file`` or, as before,
``pool:path/to/file``. In the latter case a default filesystem is used
(the pool root or a filesystem with the bootfs property). The
``zfsboot`` boot block passes the GUIDs of the selected storage pool and
dataset to ``zfsloader`` to be used as its
defaults.[`r237765 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237765>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

FreeBSD
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
subsystem now uses MADT to match ACPI Processor objects to CPUs and
ignores disabled cores while it is possible that MADT and DSDT/SSDTs may
list CPUs in different orders. A new loader tunable
``debug.acpi.cpu_unordered`` has been added for buggy systems that do
not have unique ACPI IDs for MADT and Processor objects. Setting it to
``1`` restores the old
behavior.[`r237823 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237823>`__\ ]

[amd64] A workaround for Erratum 721 for AMD Processor Family 10h and
12h has been implemented. Under a highly specific and detailed set of
internal timing conditions, the processor may incorrectly update the
stack pointer after a long series of push and/or near-call instructions,
or a long series of pop and/or near-return
instructions.[`r233799 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233799>`__\ ]

[amd64] The extended FPU states for native 64-bit and 32-bit ABIs have
been supported. AVX instructions are also enabled on capable
CPUs.[`r237009 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237009>`__\ ]

[amd64, i386, pc98] The
`atkbdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbdc&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports a keyboard controller which has PnP ID ``PNP0320``.
This can be found on machines which have Japanese PS/2 keyboard with
106/109
keys.[`r233795 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233795>`__\ ]

[amd64, i386, pc98] The
`atkbdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbdc&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Synaptics touchpad v7.5 and
above.[`r244982 <http://svn.freebsd.org/viewvc/base?view=revision&revision=244982>`__\ ]

A bug in
`cpufreq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpufreq&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
which could prevent CPU frequency tuning from working properly has been
fixed.[`r233369 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233369>`__\ ]

A bug in
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver which could cause a deadlock in
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility has been
fixed.[`r233825 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233825>`__\ ]

The
`pcf8563(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcf8563&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver for the NXP (Philips) PCF8563 RTC has been
added.[`r236079 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236079>`__\ ]

[amd64] The
`pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports mapping between MSI (Message Signaled Interrupt) and
HyperTransport interrupt messages on HyperTransport to PCI bus briges.
This change improves handling of MSIs on AMD
CPUs.[`r234151 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234151>`__\ ]

The
`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Sun 1040 PCI Quad Serial, Moxa PCIe
CP102E/CP102EL/CP104EL-A/CP104JU/CP114EL/CP118EL-A/CP168EL-A multiport
serial boards, Advantech PCI-1602 RS-485/RS-422 serial card, and Sunix
SER5437A dual serial PCI Express
card.[\ `r236651 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236651>`__,
`r238775 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238775>`__,
`r243009 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243009>`__,
`r248041 <http://svn.freebsd.org/viewvc/base?view=revision&revision=248041>`__]

[amd64, i386] The
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports VIA C3 Nehemiah random number generator on VIA Nano
processors. ``PADLOCK`` kernel option has been replaced with
``PADLOCK_RNG`` in ``GENERIC``
kernel.[`r240991 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240991>`__\ ]

[amd64, i386] The
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports ``RDRAND`` instruction on Intel on-chip Digital
Random Number Generator (called Bull Mountain). ``RDRAND_RND`` kernel
option has been added to ``GENERIC``
kernel.[`r240994 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240994>`__\ ]

A new
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
keyboard map for Danish ISO-8859-1 keyboard found on Apple MacBook has
been
added.[`r242338 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242338>`__\ ]

A bug in the
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been fixed. It could cause a button of a USB mouse to be
pressed and never released after
detaching.[`r246787 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246787>`__\ ]

[amd64, i386] The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Intel AMT Serial Port for Remote Keyboard and Text
(KT) Redirection (Serial Over LAN) on Intel 4 Series Chipset
family.[`r233065 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233065>`__\ ]

The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Wacom Tablet at FuS Lifebook T, multiport serial
device IrDA devices with PnP ID PNP0502, PNP0510, and PNP0511, V.34
modems based on CIR1000 Cirrus Logic chip, and MosChip MCS9904 four
serial ports
controller.[\ `r242883 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242883>`__,
`r243357 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243357>`__,
`r244140 <http://svn.freebsd.org/viewvc/base?view=revision&revision=244140>`__]

The
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports BeagleBone and FT2232-based egnite Turtelizer 2
JTAG/RS232
Adapter.[\ `r237189 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237189>`__,
`r237381 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237381>`__]

The
`uchcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uchcom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports CH341/CH340 USB-Serial
Bridge.[`r240570 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240570>`__\ ]

The
`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Microsoft Natural Ergonomic Keyboard 4000. It had an
issue that function keys were not
recognized.[`r239426 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239426>`__\ ]

The
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Motorola
cable.[`r239726 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239726>`__\ ]

The
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now handles suspend events synchronously. This fixed problems of
suspend and
resume.[`r232871 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232871>`__\ ]

The
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports multi-TT mode operation, which can have one
transaction translator for each downstream-facing port on a USB hub.
This allows more bandwidth for isochronous FULL speed application
connected through a High Speed USB
HUB.[`r235011 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235011>`__\ ]

The
`uslcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uslcom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Silicon Laboratories CP2103/CP2104/CP2105 based USB
serial
adapter.[\ `r239820 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239820>`__,
`r239827 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239827>`__]

[amd64, i386] The paravirtualized
`virtio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
drivers have been added to ``GENERIC`` kernel. They include PCI fontend,
``net``, ``block``, ``balloon``, and ``scsi`` drivers. The module files
are ``virtio.ko``, ``virtio_pci.ko``, ``if_vtnet.ko``,
``virtio_blk.ko``, ``virtio_balloon.ko``, and ``virtio_scsi.ko``,
respectively.[\ `r239473 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239473>`__,
`r247907 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247907>`__,
`r247909 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247909>`__]

The
`wbwd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wbwd&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver, which supports the watchdog timer found in Winbond Super I/O
chips, has been
added.[`r235947 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235947>`__\ ]

The
`xhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xhci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
USB driver now supports XHCI port routing on Intel 7 Series chipsets
(Panther Point) and Intel 8 Series chipsets (Lynx Point). A new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
tunable ``hw.usb.xhci.xhci_port_route`` has been added for routing
bitmap for switching EHCI ports to XHCI
controller.[`r242985 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242985>`__\ ]

The
`xhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xhci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
USB driver now supports Etron EJ168 USB 3.0 Host
Controllers.[`r245736 <http://svn.freebsd.org/viewvc/base?view=revision&revision=245736>`__\ ]

.. raw:: html

   <div class="sect4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

[i386] A bug in the
`snd\_emu10kx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10kx&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver which could prevent it from working with ``PAE`` kernel option
has been
fixed.[`r238674 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238674>`__\ ]

The
`snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been updated. It now supports and provides HDMI, new volume
control, automatic recording source selection, runtime reconfiguration,
more than 4 PCM devices on a controller, multichannel recording,
additional playback/record streams, higher bandwidth, and more
informative device
names.[\ `r236750 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236750>`__,
`r236753 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236753>`__]

The
`snd\_uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_uaudio&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports USB Audio
v2.0.[`r242983 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242983>`__\ ]

The
`snd\_uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_uaudio&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Intel 8 Series chipsets (Lynx
Point).[`r247121 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247121>`__\ ]

The
`snd\_uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_uaudio&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports various Yamaha
keyboards.[`r244248 <http://svn.freebsd.org/viewvc/base?view=revision&revision=244248>`__\ ]

The
`snd\_uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_uaudio&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports buttons such as volume
up/down.[`r246788 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246788>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`age(4) <http://www.FreeBSD.org/cgi/man.cgi?query=age&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now supports jumbo
frames.[`r246725 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246725>`__\ ]

Link state change handling in the
`ale(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ale&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been
improved.[`r234127 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234127>`__\ ]

The
`ale(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ale&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now supports flow
control.[`r234241 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234241>`__\ ]

A bug in the
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been fixed. It could prevent jumbo frame
configuration from
working.[`r235424 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235424>`__\ ]

A bug in
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
which could prevent IPMI (Intelligent Platform Management Interface)
from working when the interface is down has been
fixed.[`r236217 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236217>`__\ ]

The
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now supports remote PHYs, which allow the
controller to perform MDIO type accesses to a remote transceiver by
using message pages defined through MRBE (MultiRate Backplane Ethernet).
This is found on machines such as the Dell PowerEdge M610
Blade.[`r235819 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235819>`__\ ]

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver which could cause watchdog timeout on BCM5704
controller connected behind AMD 8131 PCI-X bridge has been
fixed.[`r233496 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233496>`__\ ]

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports BCM5717/5718/5719/5720/5761/57766
controllers.[\ `r243547 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243547>`__,
`r245152 <http://svn.freebsd.org/viewvc/base?view=revision&revision=245152>`__]

A bug in ``if_ierrors`` counter in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver running on BCM5700, 5701, 5702, 5703, or 5704 controller has been
fixed. It reported only the number of discarded
packets.[`r233499 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233499>`__\ ]

A bug in
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
which could make the device stop working has been
fixed.[`r236219 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236219>`__\ ]

[amd64, i386, pc98] The
`cas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cas&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__,
`gem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gem&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__,
and
`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
drivers have been added to ``GENERIC``
kernel.[`r233744 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233744>`__\ ]

The
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been updated to firmware version
1.8.4.[`r247670 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247670>`__\ ]

A bug in statistics counters in the
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__,
lem(4), and
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
drivers has been
fixed.[`r241376 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241376>`__\ ]

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
and lem(4) network interface drivers have been updated to version 7.3.7
and 2.3.9, respectively. It now supports Intel 82580 and I210/I217/I218
interfaces.[`r247430 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247430>`__\ ]

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been improved. It does not cause
unnecessary media change in controller reconfiguration such as
promiscuous mode change which leads to an extra link
reestablishment.[`r233502 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233502>`__\ ]

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now attempts to attach as many CPUs as possible
to each queue. If the number of CPUs are greater than or equal to the
number of queues, all queues are bound to different
CPUs.[`r235616 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235616>`__\ ]

The ipheth(4) driver now supports Apple iPhone 5 tethering
mode.[`r242279 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242279>`__\ ]

The
`iwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwn&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Intel Centrino 6150 wireless N and WiMAX chipsets,
and Intel Centrino Wireless-N 100/130
devices.[\ `r233839 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233839>`__,
`r235844 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235844>`__]

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been updated to version
1.1.4.[`r247501 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247501>`__\ ]

A bug in
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been fixed. It could cause packet loss in
TCP communication when TSO (TCP Segmentation Offload) is
enabled.[`r235666 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235666>`__\ ]

The
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been updated to firmware version 1.4.55 from
Myricom.[`r236416 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236416>`__\ ]

The
`oce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=oce&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been updated to version
4.6.95.0.[`r248062 <http://svn.freebsd.org/viewvc/base?view=revision&revision=248062>`__\ ]

The
`ral(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ral&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now supports Ralink RT2800 and RT3000
chipsets.[`r236008 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236008>`__\ ]

A bug in the
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
and
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface drivers which could cause a problem on RTL8139 family
has been
fixed.[`r233490 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233490>`__\ ]

A bug in the
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver which could cause intermittent link up/down on
RTL8169 controller has been
fixed.[`r233493 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233493>`__\ ]

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now supports D-Link DFE-520TX rev
C1.[`r245858 <http://svn.freebsd.org/viewvc/base?view=revision&revision=245858>`__\ ]

WoL (Wake-on-LAN) support in the
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver is now disabled by
default.[`r233490 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233490>`__\ ]

The
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Logitec
LAN-W300NU2.[`r232594 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232594>`__\ ]

The
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now loads the firmware upon initialization, not
attachment. This fixes an issue when the root filesystem is not
available at the time of device
detection.[`r233461 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233461>`__\ ]

The
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been updated to firmware version
0.236.[`r234029 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234029>`__\ ]

The
`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver has been improved. System load fluctuation
under high network load has been
fixed.[`r233487 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233487>`__\ ]

The
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
pseudo network interface driver now supports VIMAGE
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__.[`r237145 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237145>`__\ ]

The
`u3g(4) <http://www.FreeBSD.org/cgi/man.cgi?query=u3g&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Qualcomm Vertex Wireless 110L modem, Qualcomm 3G
modem, Qualcomm Vertex VW110L modem, SIMCom SIM5218, and Huawei K4505,
K3770, E3131, E392, E3131, K3765, K4505, and ETS2055 3G
modems.[\ `r232875 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232875>`__,
`r235012 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235012>`__,
`r243655 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243655>`__]

The
`udav(4) <http://www.FreeBSD.org/cgi/man.cgi?query=udav&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
network interface driver now supports JP1082 USB-LAN
adapter.[`r242984 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242984>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

Locking performance of the
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
Berkeley Packet Filter has been
improved.[`r247732 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247732>`__\ ]

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
pseudo network interface driver now supports multiple bridges in the
same STP domain. It used the same MAC address as the bridge ID for all
bridges on the system
before.[`r236056 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236056>`__\ ]

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
now supports link state change notification and works with
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
protocol.[`r236058 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236058>`__\ ]

The ``net.link.bridge``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variables can now be set in
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
and/or
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__.[`r236072 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236072>`__\ ]

The default number of the bridge forwarding cache entries of the
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
pseudo network interface driver has been increased from ``100`` to
``2000``.[`r233085 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233085>`__\ ]

The ``table`` argument in the
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
packet filter rule syntax now supports IP address, interface name, port
number, and jail ID. The following syntax is valid:

.. code:: programlisting

    skipto tablearg ip from any to any via table(42) in

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variable ``net.inet.ip.fw.tables_max`` has been added to specify the
maximum number of tables. The default value is
``128``.[`r234637 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234637>`__\ ]

``IP_RECVTOS`` socket option to receive for received UDP/IPv4 packets a
cmsg of type IP\_RECVTOS which contains the TOS byte has been
implemented. This allows access to the ECN bits in a protocol on top of
UDP.[`r247944 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247944>`__\ ]

A bug in FreeBSD IPv6 stack has been fixed. It could cause a
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
pseudo network interface to get the EUI64 part in an autoconfigured IPv6
address from an unrelated Ethernet interface on the
system.[`r233112 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233112>`__\ ]

FreeBSD IPv6 stack now supports multiple FIBs. One can use
`setfib(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfib&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
to select a different routing table for
IPv6.[`r232552 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232552>`__\ ]

A bug in reference counting of IPv6 interface routes has been
fixed.[\ `r236609 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236609>`__,
`r236611 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236611>`__,
`r236827 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236827>`__]

FreeBSD IPv6 stack now handles fragment packets which are not actually
fragments but have Fragment Header with both the ``Fragment Offset`` and
the ``M`` bit set to ``0`` as a regular (non-fragment) packet. For more
detail, see Internet Draft
``draft-gont-6man-ipv6-atomic-fragments``.[`r238495 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238495>`__\ ]

A bug which could cause a system panic in the multicast routing in
kernel with ``VIMAGE`` kernel option has been fixed. This option is
disabled in ``GENERIC``
kernel.[`r233605 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233605>`__\ ]

The
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
pseudo network driver now allows the configuration of which layers are
used for the load balance hash calculation. It can be set in
``ifconfig lagghash`` option in a comma-separated list. The default
value is ``lagghash 	 l2,l3,l4``. For more detail, see
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
manual
page.[`r236057 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236057>`__\ ]

A bug in the
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
pseudo network interface driver which could cause an unexpected removal
of a member interface upon interface renaming has been
fixed.[`r238048 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238048>`__\ ]

The
`ng\_netflow(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_netflow&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
node and
`flowctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=flowctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports NetFlow version 9. A new export9 hook has been
added for NetFlow v9 data. Note that data export can be done
simultaneously in both version 5 and version
9.[\ `r238619 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238619>`__,
`r238620 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238620>`__]

A bug in the
`ng\_patch(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_patch&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
node which could cause a system panic has been
fixed.[`r234682 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234682>`__\ ]

FreeBSD routing table handling has been improved. It can now perform
packet forwarding even while a user application is reading the whole
routing table via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__.[`r235056 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235056>`__\ ]

A loader tunable ``net.fibs`` now supports specifying the number of
routing tables. The ``ROUTETABLES`` kernel option can still be used to
set the default number of routing
tables.[`r235104 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235104>`__\ ]

FreeBSD SCTP stack now supports
`ng\_iface(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_iface&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
and
`stf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stf&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
interfaces.[\ `r233245 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233245>`__,
`r233246 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233246>`__]

FreeBSD SCTP stack now supports ``net.inet.udp.checksum``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variable for SCTP over UDP over IPv4
encapsulation.[`r234805 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234805>`__\ ]

``SO_PROTOCOL`` and ``SO_PROTOTYPE`` socket option have been added.
These are socket level options to get the protocol number found in
**Linux** or **Solaris**. For more detail, see
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2&manpath=FreeBSD+8.4-RELEASE>`__
manual
page.[`r232819 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232819>`__\ ]

An issue in FreeBSD
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
host cache has been fixed. It could cause extra ICMP message exchanges
when an ICMP unreach is received but allocation of the corresponding TCP
host cache
fails.[`r235053 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235053>`__\ ]

A
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variable ``net.inet.tcp.rexmit_drop_options`` has been added to not drop
options from the third retransmitted SYN. The default value is set to
``1`` for backward
compatibility.[`r247499 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247499>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Marvell 88SE9220/9230/9235 PCIe 2.0 x2 6Gbps SATA
controllers.[`r237114 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237114>`__\ ]

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been updated to version 1.20.00.26 and now supports ARC-1214
and
ARC-1224.[\ `r244923 <http://svn.freebsd.org/viewvc/base?view=revision&revision=244923>`__,
`r247827 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247827>`__]

A bug in the
`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver which could cause data corruption has been
fixed.[`r236319 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236319>`__\ ]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Intel 8 Series chipsets (Lynx
Point).[`r247099 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247099>`__\ ]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now creates symbolic links for backward compatibility when
``ATA_CAM`` kernel option is enabled. In a kernel with ``ATA_CAM``, an
ATA/SATA disk is recognized as a device node with a name ``ada0``
instead of ``ad0``. A symbolic link ``/dev/ad0`` is automatically
generated for ``/dev/ada0`` to keep backward compatibility. This
symbolic link generation can be controlled by a
``kern.cam.ada.legacy_aliases`` (enabled by default when ``ATA_CAM`` is
set).[`r234912 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234912>`__\ ]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now has
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
tunables to set initial SATA revision for the specific device. The
tunable name is ``hint.ata.busnum.devdevnum.sata_rev`` for a device
``devnum`` on a bus ``busnum``, or ``hint.ata.busnum.sata_rev`` for all
devices on a bus ``busnum``. The valid values are ``1``, ``2``, and
``3``, which correspond to 1.5?Gbps, 3?Gbps, and
6?Gbps.[`r243124 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243124>`__\ ]

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
``kern.features.ata_cam`` has been added. This shows whether ``ATA_CAM``
kernel option is enabled or not. This option is disabled in ``GENERIC``
kernel.[`r233714 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233714>`__\ ]

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variable ``kern.cam.pmp.hide_special`` has been added. This controls
whether special PMP ports such as PMP (Port MultiPlier) configuration or
SEMB (SATA Enclosure Management Bridge) will be exposed or hidden. The
default value is ``1``
(hidden).[`r236766 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236766>`__\ ]

The
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now uses ``READ CAPACITY(16)`` SCSI command to get device
information by default when possible. This enables to detect whether
Logical Block Provisioning (also known as ``TRIM`` or ``UNMAP``) in
SBC-3 (SCSI Block Commands-3) Specification is supported on the
device.[\ `r232942 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232942>`__,
`r236804 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236804>`__]

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variables ``kern.cam.da.da_send_ordered`` and
``kern.cam.ada.ada_send_ordered`` have been renamed with
``kern.cam.da.send_ordered`` and
``kern.cam.ada.send_ordered``.[`r247105 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247105>`__\ ]

Performance of the
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been improved. It now handles subsequent ``BIO_DELETE``
requests handled as a single ``TRIM``
request.[`r234914 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234914>`__\ ]

[amd64, i386] The
`hpt27xx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hpt27xx&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been included in ``GENERIC``
kernel.[`r245941 <http://svn.freebsd.org/viewvc/base?view=revision&revision=245941>`__\ ]

The
`hptiop(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptiop&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been updated to version 1.8 and now supports HighPoint
RocketRAID
4500/4311/4310/4211/4210/3560/3530.[\ `r239159 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239159>`__,
`r242216 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242216>`__]

The
`isci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Intel C600 Serial Attached SCSI controllers with
chip IDs from ``0x1d6c`` to
``0x1d6f``.[`r232554 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232554>`__\ ]

A bug in the
`isci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver which could not correctly handle ``READ 	 CAPACITY(16)`` SCSI
command for an SATA device has been
fixed.[`r233789 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233789>`__\ ]

The
`isci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports SCSI UNMAP to ATA DSM
translation.[`r239735 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239735>`__\ ]

A bug in
`isci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isci&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver which could prevent **smartctl** (``sysutils/smartmontools`` in
the Ports Collection) from
working.[`r236264 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236264>`__\ ]

The
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports LSI MegaRAID SAS cards named "Drake Skinny" and
"ThunderBolt". This includes Dell PERC H810/H800/H710/H700 and Intel
RAID Controller
RS25DB080/RS25NB008.[`r235625 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235625>`__\ ]

A bug which could make the
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver attach LSI MegaRAID cards which should be handled by the
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been
fixed.[`r232563 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232563>`__\ ]

The
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
tunable ``hw.mfi.allow_cam_disk_passthrough`` to control raw disk
attachment. The default value is ``0``
(disabled).[`r243826 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243826>`__\ ]

The
`mps(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mps&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been updated to version 14.00.00.01-fbsd. This now supports
Integrated RAID, WarpDrive controllers, ``WRITE12`` and ``READ12`` for
direct I/O, SCSI protection information (EEDP), Transport Level Retries
(TLR) for tape drives, and LSI's userland
utility.[`r237877 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237877>`__\ ]

[sparc64, powerpc] The
`mps(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mps&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been added to ``GENERIC``
kernel.[\ `r237944 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237944>`__,
`r238074 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238074>`__]

The ``MULTIPATH``
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
class has been updated. It now supports Active/Active mode, Active/Read
mode as hybrid of Active/Active and Active/Passive, keeping a failed
path without removing the geom provider, manual configuration without
on-disk metadata, and add, remove, fail, restore, configure subcommands
in the
`gmultipath(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmultipath&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility to manage the configured
paths.[`r234917 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234917>`__\ ]

The ``PART_LDM``
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
class has been added. This partition scheme has support for Logical Disk
Manager, which is also known as dynamic volumes in Microsoft Windows NT.
Note that JBOD, RAID0, and RAID5 volumes are not supported
yet.[`r234407 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234407>`__\ ]

The ``RAID``
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
class now supports the DDF metadata format, which is defined in the SNIA
Common RAID Disk Data Format Specification v2.0. It can read
non-degraded RAID4/5/5E/5EE/5R/6/MDF volumes. An ``-o`` option in
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility can be used to specify byte order for the DDF
metadata.[`r235875 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235875>`__\ ]

The ``RAID``
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
class now partially supports Intel Rapid Recover Technology (Intel RRT).
It is alike to RAID1, but with dedicating master and recovery disks and
providing manual control over synchronization. It allows to use recovery
disk as snapshot of the master disk from the time of the last
sync.[`r246170 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246170>`__\ ]

The ``RAID``
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
class now supports
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variables ``kern.geom.raid.enable`` and ``kern.geom.raid.format``.
``kern.geom.raid.enable`` is to control on-disk metadata recognition in
a systemwide basis. When it is set to ``1``, it is enabled (the default
value is ``1``). ``kern.geom.raid.format`` are similar variables to
control enable/disable of specific metadata or transformation modules.
The valid keywords for ``format`` are ``raid0``, ``raid1``, ``raid1e``,
``raid5``, and
``concat``.[\ `r240554 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240554>`__,
`r240556 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240556>`__]

The ``RAID``
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
class now supports ``BIO_DELETE``
requests.[`r243679 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243679>`__\ ]

The
`tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
filesystem is production ready, and no longer considered an experimental
implementation.[`r234512 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234512>`__\ ]

The
`tws(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tws&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver has been updated to version 10.80.00.005 from
LSI.[`r241763 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241763>`__\ ]

The
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
driver now supports Olympus FE-210 camera, LG UP3S MP3 player, Laser
MP3-2GA13 MP3, and Garmin GPS
devices.[\ `r235086 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235086>`__,
`r236654 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236654>`__]

A bug in the
`xen(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xen&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
**blkfront** driver has been fixed. It could not attach on Citrix
XenServer configurations that advertise the multi-page ring
extension.[`r233791 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233791>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
filesystem now supports
``/proc/filesystems``.[`r247808 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247808>`__\ ]

Bugs in
`msdosfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=msdosfs&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
which could cause mounting a FAT32 filesystem to fail, create a broken
directory entry in a FAT32 filesystem, and prevent ``sync`` and
``async`` mount option from working, have been
fixed.[\ `r246547 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246547>`__,
`r246548 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246548>`__,
`r246550 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246550>`__]

Bugs in FreeBSD NFS subsystem has been fixed. They could cause stale
name cache entries on an NFS
client.[`r233286 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233286>`__\ ]

A memory leak when a ZFS volume is exported via the FreeBSD NFS
(**newnfs**) server has been fixed. Note that **oldnfs** is used as the
default NFS implementation in ``GENERIC``
kernel.[`r236147 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236147>`__\ ]

FreeBSD NFS subsystem now supports a timeout parameter on positive name
cache entries on the NFS client side. ``nametimeo`` mount option has
been added to specify the timeout. The default value is ``60`` seconds,
and one can disable the positive name caching by setting it to
``0``.[`r233327 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233327>`__\ ]

A workaround has been implemented in FreeBSD NFS subsystem to handle a
reply to an NFS create RPC which do not include file attributes under
certain circumstances. This improves interoperability between
non-FreeBSD NFS servers and FreeBSD NFS
clients.[`r235417 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235417>`__\ ]

A bug in
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
handling in FreeBSD NFS subsystem has been fixed. It could cause an
unintended security configuration when there are multiple export entries
with different security
flavors.[`r241348 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241348>`__\ ]

Several bugs in
`nullfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nullfs&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
which could cause a system panic have been
fixed.[`r232665 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232665>`__\ ]

FreeBSD ZFS subsystem has been updated to support feature flags for ZFS
pools (the SPA version is 5000). Asynchronous destroy of ZFS dataset,
LZ4 compression, ZIO NOP-write optimization have been implemented as new
features.
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
tunables ``vfs.zfs.sync_pass_deferred_free``,
``vfs.zfs.sync_pass_dont_compress``, ``vfs.zfs.sync_pass_rewrite``, and
``vfs.zfs.nopwrite_enabled`` have been
added.[\ `r243717 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243717>`__,
`r244088 <http://svn.freebsd.org/viewvc/base?view=revision&revision=244088>`__,
`r247310 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247310>`__]

Note that this upgrade can cause interoperability issues when upgrading
a FreeBSD 8.4 system to 9.0 or 9.1. This is because FreeBSD 9.0 and 9.1
support SPA version 28 and do not recognize version 5000. To mitigate
this issue, the default SPA version for a newly created ZFS pool on
FreeBSD 8.4 is set to version 28. To create a ZFS pool with version
5000, use
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
``upgrade`` command after the creation.

A bug in ZFS subsystem which could cause a system panic when importing a
ZFS pool has been
fixed.[`r246578 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246578>`__\ ]

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
variable ``vfs.zfs.txg.timeout`` has been changed from read-only to
writable.[`r235507 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235507>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

The load average limit in the
`atrun(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atrun&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility has been set based on the number of
CPUs.[`r242991 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242991>`__\ ]

The
`chkgrp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chkgrp&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-q`` flag to disable printing of text when the
group format is
correct.[`r244064 <http://svn.freebsd.org/viewvc/base?view=revision&revision=244064>`__\ ]

The
`crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now waits for a second before updating the spool directory's
mtime. It could happen that the modified crontab updated the ``mtime``
of the spool directory, and then
`crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility updated the ``mtime`` again within a second. In this case, the
``crontab`` database is not updated
properly.[`r239877 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239877>`__\ ]

The
`cut(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cut&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-w`` flag to specify whitespace as the
delimiter.[`r244305 <http://svn.freebsd.org/viewvc/base?view=revision&revision=244305>`__\ ]

The default ``dot.cshrc`` file for
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
and
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
has been changed. For more detail, see
``/usr/share/skel/dot.cshrc``.[\ `r234979 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234979>`__,
`r242642 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242642>`__]

The
`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports an ``-r`` flag to restart the program if it has
been
terminated.[`r233762 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233762>`__\ ]

The
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
daemon now supports the ``!`` character in regex matching in
`devd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devd.conf&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__.
It inverts the logic of the
matching.[`r247768 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247768>`__\ ]

The
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
mount now supports ``ruleset=number`` mount option and updating the
existing mount by using ``-u`` flag in the
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility. This new option sets the specified ruleset number as the active
ruleset of the new devfs mount and applies all its rules at mount time.
If the specified ruleset doesn't exist, a new empty ruleset is
created.[`r233867 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233867>`__\ ]

The
`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-g`` flag to display the results in
gigabytes.[`r247539 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247539>`__\ ]

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports percent-encoded strings in user and password
component of a
URL.[`r235254 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235254>`__\ ]

The maximum number of HTTP redirections has been increased from ``5`` to
``20`` in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility.[`r242034 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242034>`__\ ]

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports HTTP status codes ``305`` (Use Proxy) and ``308``
(Permanent
Redirect).[\ `r242288 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242288>`__,
`r242291 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242291>`__]

A countermeasure against possible DoS (Denial of Service) attack
described in CVE-2010-2632 in the
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
daemon has been
implemented.[`r246357 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246357>`__\ ]

A new environment variable ``PROFIL_USE_PID`` has been added to generate
profiling data for the
`gprof(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gprof&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility with a filename including the process
ID.[`r235084 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235084>`__\ ]

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
now supports a ``state`` option for
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
protocol to set the state of a carp cluster. Valid state keywords are
``master`` and
``backup``.[`r243466 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243466>`__\ ]

A bug in the
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
daemon which could cause wrong accounting for elapsed time has been
fixed.[`r236875 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236875>`__\ ]

The
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
daemon now set the listen queue size to the value of
``kern.ipc.somaxconn`` instead of hardcoded value
``64``.[`r246403 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246403>`__\ ]

The default
`ip6addrctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6addrctl&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
address selection policy for IPv4 and IPv6 has been updated to one in
RFC
6724.[`r246599 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246599>`__\ ]

The
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-p pid`` option to accept either a process ID
or a thread
ID.[`r237790 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237790>`__\ ]

The
`lastcomm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lastcomm&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``+format`` option to specify
`strftime(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strftime&sektion=3&manpath=FreeBSD+8.4-RELEASE>`__
format for process start and exit
times.[`r235888 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235888>`__\ ]

The **libedit** library has been updated to a NetBSD snapshot as of 28
December,
2009.[`r237739 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237739>`__\ ]

The **libpmc** library has been updated to support more PMCs
(Performance Monitoring Counters) in Intel Core i7 and Xeon 5500 family
based on Intel documentation as of October 2011. Specifically,
``DTLB_MISSES.PDE_MISS`` and ``DTLB_MISSES.LARGE_WALK_COMPLETED`` have
been
added.[`r234045 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234045>`__\ ]

The **libradius** now supports the
`rad\_bind\_to(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rad_bind_to&sektion=3&manpath=FreeBSD+8.4-RELEASE>`__
function.[`r234555 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234555>`__\ ]

The
`libusb(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libusb&sektion=3&manpath=FreeBSD+8.4-RELEASE>`__
library now supports a
`libusb\_get\_max\_iso\_packet\_size(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libusb_get_max_iso_packet_size&sektion=3&manpath=FreeBSD+8.4-RELEASE>`__
function.[`r235017 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235017>`__\ ]

A bug in the the **libutil** library has been fixed. It could prevent
configuration of ``priority`` class capability in ``/etc/login.conf``
(``LOGIN_SETPRIORITY`` in
`setusercontext(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setusercontext&sektion=3&manpath=FreeBSD+8.4-RELEASE>`__
function) from working when the password is not
set.[`r233153 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233153>`__\ ]

The
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility has been updated to version ``8201210080``. It now supports
``-V ${VAR}`` variable expansion, and ``:tu`` and ``:tl`` variable
modifiers.[`r241368 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241368>`__\ ]

The
`mktemp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mktemp&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now uses ``tmp`` as the default prefix when ``-t`` is not
specified.[`r241422 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241422>`__\ ]

The
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-h`` flag. This forces it to treat a symbolic
link to a directory for the target as a symbolic instead of a
directory.[`r241321 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241321>`__\ ]

The
`pam\_exec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_exec&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
module now supports ``return_prog_exit_status``. When this option is
enabled, the program exit status is used as the
`pam\_exec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_exec&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
return code. It allows the program to tell why the step failed (user
unknown, for
example).[`r234843 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234843>`__\ ]

A bug in
`pam\_unix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_unix&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
module has been fixed. It could prevent ``passwordtime`` login
capability in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
from
working.[`r234741 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234741>`__\ ]

The
`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-e`` flag to display PCI error details in
listing mode. When this is specified, the status of any error bits in
the PCI status register and PCI-express device status register will be
displayed. It also lists any errors indicated by version 1 of
PCI-express Advanced Error Reporting
(AER).[`r237732 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237732>`__\ ]

A workaround has been implemented in the
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
daemon to support some 3G modems which return a wrong signature in echo
packets and make it impossible to use LQR and
ECHO.[`r242198 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242198>`__\ ]

The
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now displays ``osreldate`` in binary information for a
process.[`r233953 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233953>`__\ ]

The
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now displays superpage mapping flag in the process virtual
memory
mappings.[`r238752 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238752>`__\ ]

The
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
and
`fstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fstat&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utilities now shows pathname associated with a shared memory
object.[`r236699 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236699>`__\ ]

The
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports ``cow`` keyword to show the number of copy-on-write
faults in a
process.[`r236306 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236306>`__\ ]

The
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports ``dsiz`` and ``ssiz`` keywords to show data and
stack size
respectively.[`r241159 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241159>`__\ ]

The
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
daemon now supports
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.4-RELEASE>`__
interface and ``-P`` option to specify the PID file. When ``-a`` flag is
specified, ``/var/run/rarpd.ifname``.pid is used as the PID filename by
default.[`r245077 <http://svn.freebsd.org/viewvc/base?view=revision&revision=245077>`__\ ]

A bug in the
`remquo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=remquo&sektion=3&manpath=FreeBSD+8.4-RELEASE>`__
functions where the quotient did not always have the correct sign when
the remainder was 0, and another bug that the remainder and quotient
were both off by a bit in certain cases involving subnormal remainders,
have been fixed. Note that these bugs affected all platforms except
amd64 and
i386.[`r234534 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234534>`__\ ]

The
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
dynamic linker has been improved in performance of TLS (Thread Local
Storage)
handling.[`r233067 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233067>`__\ ]

The
`setbuf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setbuf&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility and **libstdbuf** library have been added. This controls the
default buffering behavior of standard stdio
streams.[`r235141 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235141>`__\ ]

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
program now allows underscore characters in the arithmetic
expansion.[`r234001 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234001>`__\ ]

The
`sockstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sockstat&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-j jid`` option to specify the socket list to
be limited to a specific
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
ID.[`r237672 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237672>`__\ ]

A variable ``NO_FOO`` in
`src.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=src.conf&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__
now overrides
``WITH_FOO``.[`r241969 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241969>`__\ ]

The
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
daemon now supports IPv6 destination address in
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5&manpath=FreeBSD+8.4-RELEASE>`__.[`r241472 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241472>`__\ ]

The
`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now accepts fractional number of
seconds.[`r243684 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243684>`__\ ]

The
`tcpdrop(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdrop&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility now allows addresses and ports to be separated by a colon or
period rather than a space to permit directly pasting the output of
commands such as netstat and sockstat on the command
line.[`r247563 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247563>`__\ ]

The
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now displays ZFS ARC memory usage on hosts using
ZFS.[`r239751 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239751>`__\ ]

A bug in
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility which could result in not accepting any incoming packets has
been
fixed.[`r235163 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235163>`__\ ]

The
`unzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unzip&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
program now supports a ``-Z`` flag to enable **zipinfo**
mode.[`r234331 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234331>`__\ ]

The
`usbdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdump&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports filtering USB devices and USB
endpoints.[`r235015 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235015>`__\ ]

The
`usbhidctl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=usbhidctl&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-z`` flag for reading operation. It allows to
not request current values from the device, but only receive
changes.[`r235881 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235881>`__\ ]

Performance of the
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
``list -t snapshot`` command has been dramatically
improved.[`r233862 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233862>`__\ ]

The
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
``get`` command now supports a ``-t 	datatype``
option.[`r233862 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233862>`__\ ]

The
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
``jail`` and ``unjail`` commands now support a jail name as well as a
jail
ID.[`r246750 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246750>`__\ ]

The
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
``send`` command now reports transmitted data size in bytes when ``-v``
flag is
specified.[`r235952 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235952>`__\ ]

Changing
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
``canmount`` property to ``on`` no longer causes remount of the ZFS
dataset when a dataset is already
mounted.[`r237457 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237457>`__\ ]

.. raw:: html

   <div class="sect3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``rc.d`` scripts now display script filename running to standard
error when ``SIGINFO`` is issued. This message was sent to standard
output and could prevent redirection from
working.[`r232549 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232549>`__\ ]

The ``rc.d/jail`` script now supports a ``jail_parameters`` variable to
specify extra parameters for each
jail.[`r242083 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242083>`__\ ]

The
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports a ``-R`` flag to restart all third party services
in
``/usr/local/etc/rc.d``.[`r246609 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246609>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**AWK** has been updated to
20121220.[`r246374 <http://svn.freebsd.org/viewvc/base?view=revision&revision=246374>`__\ ]

**ISC BIND** has been updated to version
9.8.4-P2.[`r248807 <http://svn.freebsd.org/viewvc/base?view=revision&revision=248807>`__\ ]

**BZIP2** has been updated to version
1.0.6.[`r247448 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247448>`__\ ]

**TENEX C shell**
(`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__)
has been updated to version
6.18.01.[`r232635 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232635>`__\ ]

**LESS**
(`less(1) <http://www.FreeBSD.org/cgi/man.cgi?query=less&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__)
has been updated to version
v451.[`r240160 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240160>`__\ ]

**libexpat** has been updated to version
2.1.0.[`r247514 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247514>`__\ ]

**netcat** has been updated to a version as of OpenBSD
5.2.[`r243819 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243819>`__\ ]

**OpenSSH** has been updated to version
6.1.[`r247521 <http://svn.freebsd.org/viewvc/base?view=revision&revision=247521>`__\ ]

**OpenSSL** has been updated to version
0.9.8y.[`r248057 <http://svn.freebsd.org/viewvc/base?view=revision&revision=248057>`__\ ]

**sendmail** has been updated to version
8.14.7.[`r250167 <http://svn.freebsd.org/viewvc/base?view=revision&revision=250167>`__\ ]

The **timezone** database has been updated to **tzdata2012j**
release.[`r243006 <http://svn.freebsd.org/viewvc/base?view=revision&revision=243006>`__\ ]

**XZ** has been updated to version
5.0.4.[`r245129 <http://svn.freebsd.org/viewvc/base?view=revision&revision=245129>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``pkg(8)`` command has been added. This is used as a bootstrap tool
for ``ports-mgmt/pkg`` in the Ports
Collection.[`r239563 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239563>`__\ ]

The
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
utility now supports ``PACKAGESUFFIX`` to specify extension in a package
filename.[`r240674 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240674>`__\ ]

The
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+8.4-RELEASE>`__
program now allows a relative pathname in the ``-p``
option.[`r233686 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233686>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported version of the **KDE** desktop environment (``x11/kde4``)
has been updated from 4.7.4 to 4.10.1.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

[amd64, i386] Upgrades between RELEASE versions (and snapshots of the
various security branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC kernel distributed as a part of
an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
utility requires that the host being upgraded has Internet connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+8.4-RELEASE>`__
menu on CDROM distribution media. This type of binary upgrade may be
useful on non-i386, non-amd64 machines or on systems with no Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported, according
to the instructions in ``/usr/src/UPDATING``.

.. raw:: html

   <div class="important">

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
