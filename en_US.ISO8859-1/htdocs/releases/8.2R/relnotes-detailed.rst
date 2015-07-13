=================================
FreeBSD 8.2-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 8.2-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2011 The FreeBSD Documentation Project

| $FreeBSD: stable/8/release/doc/en\_US.ISO8859-1/relnotes/article.sgml
  219006 2011-02-24 19:11:27Z hrs $

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

The release notes for FreeBSD 8.2-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 8.2-STABLE development
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
2.3.1 ```/etc/periodic`` Scripts <#PERIODIC-SCRIPTS>`__
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

This document contains the release notes for FreeBSD 8.2-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 8.2-RELEASE is a release distribution. It
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
8.2-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 8.1-RELEASE.

Typical release note items document recent security advisories issued
after 8.1-RELEASE, new drivers or hardware support, new commands or
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

[ia64] The maximum number of pages used for DMA bounce buffer pool has
been increased from 256 to
1024.[`r209326 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209326>`__\ ]

[powerpc] The default value of ``kern.hz`` has been increased from 100
to
1000.[`r209765 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209765>`__\ ]

[powerpc] The SMP kernel now works on MPC7400-based Apple desktop
machines such as
PowerMac3,3.[`r209767 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209767>`__\ ]

[powerpc] FreeBSD/powerpc now supports DMA bounce buffer which is
required on systems with larger RAM than
4GB.[`r211593 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211593>`__\ ]

[mips] FreeBSD/mips support has been improved. It now supports SMP on a
SWARM with a dual-core Sibyte
processor.[`r215938 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215938>`__\ ]

[mips] FreeBSD/mips now supports Netlogic Microsystems' XLR and XLS
multi-core processor families.

[sparc64] FreeBSD/sparc64 now supports reservation-based physical memory
allocation which provides better
performance.[`r215598 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215598>`__\ ]

[amd64] FreeBSD/amd64 now always sets the KVA space as equal to or
larger than physical memory size. The default size was calculated based
on one-third of the physical memory size by a code derived from one for
i386. It has been changed because constraints for memory space are not
severe on amd64 and this change would help to prevent a “kmem\_map too
small” panic which often occurs when using
ZFS.[`r214620 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214620>`__\ ]

[amd64, i386] CPU topology detection for Intel CPUs has been
improved.[`r214621 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214621>`__\ ]

[amd64, i386] ACPI suspend/resume functionality support has been
improved.[`r215513 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215513>`__\ ]

[amd64, i386] FreeBSD kernel now supports ``kern_fpu_enter()`` and
``kern_fpu_leave()`` KPIs which allow the kernel subsystems to use XMM
register files used in Intel SSE (Streaming SIMD
Extensions).[`r215513 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215513>`__\ ]

[amd64, i386, ia64] The
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now uses ACPI Reset Register capability by default only when a
flag in the FADT which indicates it is available. This behavior was
controlled by a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``hw.acpi.handle_reboot`` and the default value was always set
to
``0``.[`r215006 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215006>`__\ ]

[amd64, i386, ia64] The
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports new loader tunables ``hw.acpi.install_interface``
and ``hw.acpi.remove_interface``. For more details, see
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
manual
page.[`r215521 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215521>`__\ ]

The
`alq(9) <http://www.FreeBSD.org/cgi/man.cgi?query=alq&sektion=9&manpath=FreeBSD+8.2-RELEASE>`__
support has been improved. The ``alq_writen()`` and ``alq_getn()`` KPIs
have been extended to support variable length messages, which is enabled
at ALQ creation time depending on the arguments passed to
``alq_open()``. Also, the ``ALQ_NOACTIVATE`` and ``ALQ_ORDERED`` flags
have been added to allow ALQ consumers to have more control over I/O
scheduling and resource acquisition respectively. These extensions are
fully backward
compatible.[`r209788 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209788>`__\ ]

The
`alq(9) <http://www.FreeBSD.org/cgi/man.cgi?query=alq&sektion=9&manpath=FreeBSD+8.2-RELEASE>`__
support is now provided as a kernel module
``alq.ko``.[`r209783 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209783>`__\ ]

The
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
kernel debugger now supports an optional delay in ``reset`` and
``reboot`` commands. This allows an administrator to break the system
into debugger and trigger automatic textdump when an unattended panic
occurs.[`r209692 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209692>`__\ ]

The
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
kernel debugger now supports a ``show cdev`` command. This displays the
list of all created cdev's, consisting of devfs node name and struct
cdev
address.[`r212230 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212230>`__\ ]

The FreeBSD ``GENERIC`` kernel is now compiled with ``KDB`` and
``KDB_TRACE`` options. From 8.2-RELEASE the kernel supports displaying a
stack trace on panic by using
`stack(9) <http://www.FreeBSD.org/cgi/man.cgi?query=stack&sektion=9&manpath=FreeBSD+8.2-RELEASE>`__
facility with no debugger backend like
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__.
Note that this does not change the default behaviors of the ``GENERIC``
kernel on
panic.[`r214326 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214326>`__\ ]

The following
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variables are also now loader tunables: ``vm.kmem_size``,
``vm.kmem_size_max``, and ``vm.kmem_size_min``, ``debug.kdb.stop_cpus``,
``debug.trace_on_panic``, and ``kern.sync_on_panic``. Also, new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variables ``vm.kmem_map_size`` for the current kmem map size and
``vm.kmem_map_free`` for largest contiguous free range in kmem map,
``vfs.ncsizefactor`` for size factor for namecache, and
``vfs.ncnegfactor`` for ratio of negative namecache entries have been
added.[\ `r213554 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213554>`__,
`r213556 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213556>`__,
`r213560 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213560>`__]

The FreeBSD
`memguard(9) <http://www.FreeBSD.org/cgi/man.cgi?query=memguard&sektion=9&manpath=FreeBSD+8.2-RELEASE>`__
framework has been improved to make it able to detect use-after-free of
allocated memories over a longer time. For more details, see
`memguard(9) <http://www.FreeBSD.org/cgi/man.cgi?query=memguard&sektion=9&manpath=FreeBSD+8.2-RELEASE>`__
manual
page.[`r212427 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212427>`__\ ]

``PT_LWPINFO`` request to obtain information about the kernel thread
that caused the traced process to stop in the
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2&manpath=FreeBSD+8.2-RELEASE>`__
process tracing and debugging facility has been improved. It now reports
system call entry and leave events, as well as availability of
``siginfo_t`` accompanying the reported
signal.[`r214756 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214756>`__\ ]

The FreeBSD
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
framework (opencrypto) now supports XTS-AES (XEX-TCB-CTS, or XEX-based
Tweaked Code Book mode with CipherText Stealing), which is defined in
IEEE Std.
1619-2007.[`r214254 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214254>`__\ ]

[amd64] Xen HVM support in FreeBSD/amd64 kernel has been improved. For
more details, see
`xen(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xen&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
manual
page.[`r215788 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215788>`__\ ]

[amd64, i386] The qpi(4) pseudo bus driver has been added. This supports
extra PCI buses on Intel QPI chipsets where various hardware such as
memory controllers for each socket is
connected.[`r214784 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214784>`__\ ]

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD now fully supports GPT (GUID Partition Table). Checksums of
primary header and primary partition table are verified properly
now.[`r213994 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213994>`__\ ]

[powerpc] Memory management issues that prevented FreeBSD OpenFirmware
loader and netbooting from working have been
fixed.[\ `r215919 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215919>`__,
`r215920 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215920>`__]

The
`pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
now uses NFS version 3 instead of version 2 by
default.[`r212717 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212717>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

[amd64, i386] The
`aesni(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aesni&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been added. This supports AES accelerator on Intel CPUs and
accelerates AES operations for
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__.[`r215633 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215633>`__\ ]

[amd64, i386] The
`aibs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aibs&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been added. This supports the hardware sensors in ASUS
motherboards and replaces the
`acpi\_aiboost(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_aiboost&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver.[`r210476 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210476>`__\ ]

[amd64, i386] The
`coretemp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=coretemp&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports Xeon 5500/5600
series.[`r211914 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211914>`__\ ]

[powerpc] FreeBSD/powerpc now supports the I2C bus in Apple System
Management
Unit.[`r215694 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215694>`__\ ]

[powerpc] A device driver that supports CPU temperature sensors on
PowerMac 11,2 has been
added.[`r215695 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215695>`__\ ]

The
`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
and
`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now support LOW speed BULK transfer
mode.[`r215482 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215482>`__\ ]

[amd64, i386] The
`ichwd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ichwd&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports Intel NM10 Express chipset watchdog
timer.[`r209952 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209952>`__\ ]

The
`tpm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tpm&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver, which supports Trusted Platform Module has been
added.[`r215036 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215036>`__\ ]

The xhci(4) driver, which supports Extensible Host Controller Interface
(xHCI) and USB 3.0, has been
added.[`r215944 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215944>`__\ ]

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The FreeBSD Linux emulation subsystem now supports the **video4linux**
API. This requires native **video4linux** hardware drivers such as the
ones provided by ``multimedia/pwcbsd`` and ``multimedia/webcamd``.

MIDI input buffer size in the
`uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uaudio&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been changed. This fixes a problem where the input appears
several seconds
late.[`r215483 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215483>`__\ ]

An issue in the
`uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uaudio&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver that prevented some USB audio devices from working has been
fixed.[`r215484 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215484>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports Atheros AR8151/AR8152 PCIe Gigabit/Fast Ethernet
controllers.[`r212021 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212021>`__\ ]

A bug in the
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver was fixed that could lead to a system freeze when the system was
booted without a cable plugged in. This symptom was found in AR8132 on
EEE
PC.[`r215003 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215003>`__\ ]

The TX interrupt moderation timer in the
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been reduced from 50ms to 1ms. The 50ms timer resulted in a
poor UDP
performance.[`r212011 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212011>`__\ ]

The
`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been improved for stability and better performance on the TX
packet
rate.[\ `r214297 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214297>`__,
`r214298 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214298>`__,
`r214301 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214301>`__]

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports BCM5718 x2 PCI Express dual-port gigabit Ethernet
controller family. This family is the successor to the BCM5714/BCM5715
family and supports IPv4/IPv6 checksum offloading, TSO, VLAN hardware
tagging, jumbo frames, MSI/MSIX, IOV, RSS and TSS. The current version
of the driver supports all hardware features except IOV and
RSS/TSS.[`r214997 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214997>`__\ ]

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver which prevented TSO from working in BCM57780 has been
fixed.[`r211367 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211367>`__\ ]

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver that could wrongly disable the TX checksum offloading feature as
well when one tries to disable only the RX checksum offloading has been
fixed.[`r214700 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214700>`__\ ]

Some improvements for reliability of the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver with BCM5906 controller has been
made.[`r214714 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214714>`__\ ]

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports hardware MAC statistics in controller's internal
memory for BCM5705 or newer Broadcom controllers. These counters can be
accessed via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``dev.bge.N.stats.*`` and provide useful information to
diagnose driver
issues.[`r214698 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214698>`__\ ]

UDP checksum offloading in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been disabled by default. This is because Broadcom
controllers have a bug which can generate UDP datagrams with checksum
value ``0`` when TX UDP checksum offloading is enabled. The checksum
offloading can be enabled by using the following loader
tunable:[`r213109 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213109>`__\ ]

.. code:: PROGRAMLISTING

    dev.bge.N.forced_udpcsum

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver that could lead to poor performance on a system with more than 4
GB RAM has been fixed. The cause was that all of Broadcom controllers
except the BCM5755 and later have a bug in 4 GB-boundary DMA processing
and used the bounce buffer in an inefficient
way.[`r213593 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213593>`__\ ]

The
`bwi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bwi&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver, which supports Broadcom BCM430\* and BCM431\* family Wireless
Ethernet controllers, has been added. This is not compiled into the
``GENERIC`` kernel because there are some problems. The kernel module
``if_bwi.ko`` is available and can be loaded without recompiling the
kernel to enable this
driver.[`r212275 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212275>`__\ ]

A bug in the
`bwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bwn&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver that prevented WPA authentication from working has been
fixed.[`r212274 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212274>`__\ ]

A bug in the
`cdce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cdce&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been
fixed.[`r215499 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215499>`__\ ]

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports the following new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variables: ``hw.cxgb.nfilters`` sets the maximum number of entries in
the hardware filter table, ``dev.cxgbc.N.pkt_timestamp`` provides packet
timestamp instead of connection hash, and ``dev.cxgbc.N.core_clock``
provides the core clock frequency in
kHz.[`r211848 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211848>`__\ ]

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been updated to version 7.1.9.

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been updated to version 2.0.7.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
and
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
drivers now provide statistics counters as
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
MIB
objects.[`r209309 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209309>`__\ ]

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
and
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
drivers now support the
`led(4) <http://www.FreeBSD.org/cgi/man.cgi?query=led&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
interface via ``/dev/led/emN`` and ``/dev/led/igbN`` for identification
LED control. The following command line makes the LED blink on
``em0``:[`r211241 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211241>`__\ ]

.. code:: SCREEN

    # echo f2 > /dev/led/em0

The
`epair(4) <http://www.FreeBSD.org/cgi/man.cgi?query=epair&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
virtual Ethernet interface driver now supports explicit UP/DOWN
linkstate. This fixes an issue when it is used with the
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
protocol.[`r212150 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212150>`__\ ]

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports TSO over VLAN on i82550 and i82551
controllers.[`r214717 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214717>`__\ ]

The
`iwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwn&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports Intel Wireless WiFi Link 6000 series. The firmware
has been updated to version
9.221.4.1.[`r210673 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210673>`__\ ]

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver is now also provided as a kernel
module.[`r212386 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212386>`__\ ]

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been updated to version 2.3.8. It now supports 82599, better
interrupt handling, hardware assist to LRO, VM SRIOV interface, and so
on.[\ `r209308 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209308>`__,
`r215970 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215970>`__,
`r217593 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217593>`__]

The
`miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
has been rewritten for the generic IEEE 802.3 annex 31B full duplex flow
control support. The
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`cas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cas&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`gem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gem&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
`stge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
and
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
drivers along with atphy(4), bmtphy(4), brgphy(4), e1000phy(4),
gentbi(4), inphy(4), ip1000phy(4), jmphy(4), nsgphy(4), nsphyter(4), and
`rgephy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rgephy&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
have been updated to support flow control via this
facility.[\ `r211379 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211379>`__,
`r215881 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215881>`__,
`r215890 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215890>`__,
`r2105894 <http://svn.freebsd.org/viewvc/base?view=revision&revision=2105894>`__,
`r216002 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216002>`__,
`r216023 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216023>`__,
`r216029 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216029>`__,
`r216031 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216031>`__,
`r216033 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216033>`__]

The
`mwlfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mwlfw&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver is now also provided as a kernel
module.[`r212386 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212386>`__\ ]

A bug in the
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver that prevented TSO from working has been
fixed.[`r216054 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216054>`__\ ]

The
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports WoL (Wake on
LAN).[`r215456 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215456>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports 64-bit DMA addressing for RTL810xE/RTL8168/RTL8111
PCIe
controllers.[`r215218 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215218>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports hardware interrupt moderation of TX completion
interrupts on RTL8169/RTL8168
controllers.[`r215405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215405>`__\ ]

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports WoL (Wake on LAN) on RTL8139B or newer
controllers.[`r211377 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211377>`__\ ]

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports reading hardware statistics counters by setting a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``dev.rl.N.stats`` to
``1``.[`r215222 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215222>`__\ ]

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports a device hint to change a way of register access.
Although some newer RTL8139 controllers support memory-mapped register
access, it is difficult to detect the support automatically. For this
reason the driver uses I/O mapping by default and provides the following
device hint. If it is set to ``0``, the driver uses memory mapping for
register
access.[`r212039 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212039>`__\ ]

.. code:: PROGRAMLISTING

    hint.rl.N.prefer_iomap="0"

Note that the default value is ``1``.

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has improved interrupt handling. It now has better TX performance
under high RX
load.[`r214407 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214407>`__\ ]

A bug in the
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been fixed. It did not program the station address for Yukon
controllers and overriding the station address with
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
was not
possible.[`r215216 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215216>`__\ ]

The
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now disables TX checksum offloading by default. This is because
some revisions of the Yukon controller generate corrupted frames. The
checksum offloading can be enabled manually by using ``txcsum`` option
in the
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility.[`r211359 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211359>`__\ ]

The
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now works on all supported platforms. Some stability and
performance issues have also been
fixed.[\ `r212468 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212468>`__,
`r213612 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213612>`__,
`r213628 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213628>`__]

The
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports WoL (Wake on LAN) on NS DP8315
controller.[`r213637 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213637>`__\ ]

A tunable ``dev.sis.N.manual_pad`` for the
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been added. This controls whether padding with 0x00 for short
frames is done by CPU, rather than the controller. The reason why this
tunable has been added is that NS DP83815/DP83816 pads them with 0xff
though RFC 1042 specifies it should be 0x00. The tunable is disabled by
default, which means padding with 0xff is used because padding with 0x00
by software needs extra CPU cycles. Enabling ``manual_pad``, by setting
this
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable to a non-zero value, forces the use of software
padding.[`r213626 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213626>`__\ ]

The
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports a device hint to change the device register access
mode. The driver uses memory-mapped register access by default, but this
caused stability problems with some old IC Plus Corp (formerly Sundace)
controllers. The following device hint makes the driver use I/O mapping
for register
access:[`r211357 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211357>`__\ ]

.. code:: PROGRAMLISTING

    hint.ste.N.prefer_iomap="1"

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports WoL (Wake on LAN). Note that not all controllers
support this functionality and some need an additional remote wakeup
cable.[`r213120 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213120>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

An issue in the
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
pseudo interface and linkstate changes of the underlying interfaces has
been fixed. This happened when a
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
interface was created before the underlying interface and its linkstate
became
``UP``.[`r213505 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213505>`__\ ]

A bug in the
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
packet filter subsystem has been fixed. The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``net.inet.ip.fw.one_pass`` did not work for ``netgraph``
action and in-kernel
NAT.[\ `r212738 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212738>`__,
`r216348 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216348>`__]

A new loader tunable ``net.link.ifqmaxlen`` has been added. It specifies
the default value of send interface queue length. The default value for
this parameter is
``50``.[`r215342 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215342>`__\ ]

The ``ngtee`` action in the
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
packet filter subsystem has been changed. It no longer accepts a
packet.[`r212742 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212742>`__\ ]

A possible panic in the
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
pseudo interface for logging has been
fixed.[`r214108 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214108>`__\ ]

IPsec flow distribution has been improved for more parallel
processing.[`r209691 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209691>`__\ ]

A bug in the FreeBSD IPv4 stack that prevented adding a proxy ARP entry
over
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
interfaces has been
fixed.[`r209277 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209277>`__\ ]

A bug in the FreeBSD IPv6 stack that prevented an ``-I`` in the
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility from working with ``net.inet6.ip6.use_defaultzone=1`` has been
fixed.[`r211435 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211435>`__\ ]

The
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
interface now supports a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``net.link.lagg.failover_rx_all``. This controls whether to
accept input packets on any link in a failover
lagg.[`r214111 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214111>`__\ ]

The
`ng\_eiface(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_eiface&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
node now supports VLAN-compatible MTU and an MTU size which is larger
than
1500.[`r215869 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215869>`__\ ]

The
`ng\_ether(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ether&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
node now supports interface transfer between multiple virtual network
stacks by
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
``vnet`` command. A
`ng\_ether(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ether&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
node associated with a network interface is now destroyed and recreated
when the network interface is moved to another
vnet.[`r212320 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212320>`__\ ]

A new
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
node
`ng\_patch(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_patch&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
has been added. This performs data modification of packets passing
through. Modifications are restricted to a subset of C language
operations on unsigned integers of 8, 16, 32 or 64-bit
size.[`r209843 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209843>`__\ ]

An ICMP unreachable problem in the
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
packet filter subsystem when TSO support is enabled has been
fixed.[`r212905 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212905>`__\ ]

The TCP bandwidth delay product window limiting algorithm controlled by
the
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``net.inet.tcp.inflight.enable`` is now disabled by default. It
has been found that this algorithm is inefficient on a fast network with
smaller RTT than 10ms. It had been enabled by default since 5.2-RELEASE,
and then had been disabled only if the RTT was lesser than 10ms since
7.0-RELEASE. Pluggable TCP congestion control algorithm modules are
planned to be added for the future
releases.[`r211538 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211538>`__\ ]

A bug in FreeBSD TCP Path MTU discovery which could lead to a wrong
calculation for an MTU smaller than 256 octets has been fixed. Note that
this bug did not affect MTUs equal to or larger than 256
octets.[`r211602 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211602>`__\ ]

The FreeBSD TCP reassembly implementation has been improved. A
long-standing accounting bug affecting SMP systems has been fixed and
the ``net.inet.tcp.reass.maxqlen``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable has been retired in favor of a per-connection dynamic limit
based on the receive socket buffer size. FreeBSD receivers now handle
packet loss (particularly losses caused by queue overflows)
significantly better than before which improves connection
throughput.[\ `r214865 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214865>`__,
`r214866 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214866>`__]

The TCP initial window increase in RFC 3390 which can be controlled by a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``net.inet.tcp.rfc3390`` now reduces the congestion window to
the restart window if a TCP connection has been idle for one retransmit
timeout or more. For more details, see RFC 5681 Section
4.1.[`r211870 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211870>`__\ ]

The
`siftr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=siftr&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
Statistical Information For TCP Research (SIFTR) kernel module has been
added. This is a facility that logs a range of statistics on active TCP
connections to a log file. It provides the ability to make highly
granular measurements of TCP connection state, aimed at system
administrators, developers and
researchers.[`r214859 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214859>`__\ ]

FreeBSD virtual network stack (vnet) now supports IPv4 multicast
routing.[`r212319 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212319>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now disables NCQ and PMP support on VIA VT8251 because they are
unreliable under
load.[`r211458 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211458>`__\ ]

The
`ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now uses 15 seconds for device reset timeout instead of 10
seconds because some devices need 10 - 12 seconds to spin
up.[`r211718 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211718>`__\ ]

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been updated to version
1.20.00.19.[`r215825 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215825>`__\ ]

The
`ada(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ada&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports a new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``kern.cam.ada.spindown_shutdown`` which controls whether or
not to spin-down disks when shutting down if the device supports the
functionality. The default value is
``1``.[`r215173 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215173>`__\ ]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports limiting initial ATA mode for devices via device
hints ``hint.devname.unit.devN.mode`` or ``hint.devname.unit.mode``. The
valid values are the same as ones supported in the
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
and
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utilities.[`r210164 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210164>`__\ ]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now disables cable status check on both controller and device
side when the loader tunable ``hw.ata.ata_dma_check_80pin`` is ``0``.
The check on controller side was performed regardless of this loader
tunable.[`r210204 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210204>`__\ ]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now reports SATA power management capabilities to the
`CAM(4) <http://www.FreeBSD.org/cgi/man.cgi?query=CAM&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
layer when ``ATA_CAM`` is enabled. This allows a device to initiate
transitions if controller configured to accept it. This makes
``hint.ata.N.pm_level=1`` mode
work.[`r215777 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215777>`__\ ]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been improved on hotplugging and connection speed reporting
support for some Intel SATA controllers including ICH5 and ICH8+
operating in legacy
mode.[`r214671 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214671>`__\ ]

An issue of device detection of Serverworks K2 SATA controllers in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
has been
fixed.[`r213291 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213291>`__\ ]

A bug in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver that prevented some Silicon Image chipsets from working on big
endian systems has been
fixed.[`r214667 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214667>`__\ ]

The
`gconcat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gconcat&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
GEOM class now supports kernel crash dump. The dumping is performed to
the component where a dump partition
begins.[`r214330 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214330>`__\ ]

A bug in the
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
GEOM class on little endian platforms has been fixed. The metadata
version for newly created providers has been updated to ``4`` due to
this. Providers with the older versions are fully interoperable with
8.2-RELEASE and later by being treated as ones with the native byte
order flag
automatically.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
GEOM class now supports a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``kern.geom.eli.overwrites``. This specifies the number of
times on-disk keys should be overwritten when destroying them. The
default value is
``5``.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
GEOM class has been improved for preventing the same encryption key from
being used in 2^20 blocks
(sectors).[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
GEOM class now uses XTS-AES mode by
default.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

A
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
variable ``kern.geom.eli.debug`` now allows a value ``-1``. This means
turn off any log messages of the
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
GEOM
class.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver now supports larger I/O sizes which the device and
`CAM(4) <http://www.FreeBSD.org/cgi/man.cgi?query=CAM&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
subsystem can support. This was limited to 64KB, and the number of
scatter/gather segments was limited to 33 on platforms with 4K
pages.[`r210376 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210376>`__\ ]

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
driver has been updated. The version number is
3.80.06.003.[`r209404 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209404>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
Linux process file system now supports
``proc/$$/environment``.[`r214050 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214050>`__\ ]

The FreeBSD NFS client now supports a kernel environment variable
``boot.nfsroot.nfshandlelen``. This lets the diskless root file system
on boot to use NFS version 3 and the specified file handle length. If
this variable is not set, NFS version 2 is
used.[`r212716 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212716>`__\ ]

The ZFS on-disk format has been updated to version
15.[`r212668 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212668>`__\ ]

The ZFS metaslab code has been updated. This provides a noticeable
improvement on write speed, especially on pools with less than 30% of
free space. The related OpenSolaris Bug IDs are 6826241, 6869229,
6918420, and
6917066.[`r212671 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212671>`__\ ]

The ZFS now supports offlining of log devices. The related OpenSolaris
Bug IDs are 6599442, 6726045, and
6803605.[`r214013 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214013>`__\ ]

Performance improvements for the ZFS have been imported from
OpenSolaris. They include caching of ACL permission checks, faster
handling of
`stat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=2&manpath=FreeBSD+8.2-RELEASE>`__,
mitigation of mutex lock contention. The related OpenSolaris Bug IDs are
6802734, 6844861, 6848431, 6775100, 6827779, 6857433, 6860318, 6865875,
6867395, 6868276, and
6870564.[`r212672 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212672>`__\ ]

The default value of ``vfs.zfs.vdev.max_pending`` has been decreased
from 35 to 10 (OpenSolaris Bug ID is 6891731) to improve
latency.[`r210541 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210541>`__\ ]

Various bugs in the ZFS subsystem have been fixed. The related
OpenSolaris Bug IDs are: 6328632, 6396518, 6501037, 6504953, 6542860,
6551866, 6572357, 6572376, 6582163, 6586537, 6595194, 6596237, 6604992,
6621164, 6623978, 6633095, 6635482, 6664765, 6674216, 6696242, 6696858,
6702206, 6710376, 6713916, 6717022, 6722540, 6722991, 6737463, 6739487,
6739553, 6740164, 6745863, 6747596, 6747698, 6748436, 6755435, 6757430,
6758107, 6759986, 6759999, 6761100, 6761406, 6764124, 6765294, 6767129,
6769612, 6770866, 6774713, 6774886, 6775697, 6776104, 6776548, 6780491,
6784104, 6784108, 6785914, 6788152, 6788830, 6789318, 6790064, 6790345,
6790687, 6791064, 6791066, 6791071, 6791101, 6792134, 6792139, 6792884,
6793430, 6794136, 6794570, 6794830, 6797109, 6797118, 6798384, 6798878,
6799895, 6800184, 6800942, 6801507, 6801810, 6803343, 6803822, 6804954,
6807339, 6807765, 6809340, 6809683, 6809691, 6810367, 6815592, 6815893,
6816124, 6818183, 6821169, 6821170, 6822816, 6824006, 6824062, 6824968,
6826466, 6826468, 6826469, 6826470, 6826471, 6826472, 6827260, 6830237,
6830541, 6833162, 6833711, 6833999, 6834217, 6836714, 6836768, 6838062,
6838344, 6841321, 6843014, 6843069, 6843235, 6844069, 6844900, 6847229,
6848242, 6856634, 6857012, 6861983, 6862984, 6863610, 6870564, 6880764,
6882227, 6892298, 6898245, 6906110, 6906946, 6939941, 6950219, 6951024,
and 6953403.

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
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility has been improved. It now runs faster even when a single
interface has a number of
aliases.[`r209267 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209267>`__\ ]

A bug in the
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility that prevented an ``-r`` option from handling arbitrary breaks
in a base64 encoded string has been
fixed.[`r214729 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214729>`__\ ]

The
`calendar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=calendar&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports repeating events which span multiple years, lunar
events, and solar
events.[`r211723 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211723>`__\ ]

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now reports a reason for exiting and the 10-second period in
which the
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
ignores routing messages has been changed to start just after
``dhclient-script`` starts instead of just after it finished. This
change fixes a symptom that
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
silently exits under a certain
condition.[`r210915 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210915>`__\ ]

Userland support for the
`dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
subsystem has been added. This allows inspection of userland software
itself and its correlation with the kernel, thus allowing a much better
picture of what exactly is going on behind the scenes. The
`dtruss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtruss&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility has been added and the ``libproc`` library has been updated to
support the
facility.[`r214983 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214983>`__\ ]

The
`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports a ``-t threshold`` option to display entries that
exceeds the value of ``threshold``. If the value is negative, it
displays entries with a value less than the absolute value of
``threshold``.[`r209362 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209362>`__\ ]

The
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports partitions which are provided by
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
or
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
GEOM
classes.[`r215667 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215667>`__\ ]

The
`gcore(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcore&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports an ``-f`` flag which forces a full dump of all the
segments except for the malformed
ones.[`r210567 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210567>`__\ ]

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports ``resize`` subcommand to resize encrypted file
systems after growing
it.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports ``suspend`` and ``resume`` subcommands. The
``suspend`` subcommand makes
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
devices wait for all in-flight I/O requests, suspend new I/O requests,
remove all
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
sensitive data from the kernel memory (like encryption keys) and will
wait for either ``geli resume`` or ``geli detach`` command. For more
information, see
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
manual
page.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now checks the metadata provider size strictly. If the check
fails, the provider is not attached. A new option ``-f`` can override
this
behavior.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports ``-J newpassfile`` and ``-j oldpassfile`` options
for loading passphrase from a
file.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

The ``gethost*()``, ``getnet*()``, and ``getproto*()`` functions now set
the errno to ``ERANGE`` and the NSS backend terminates with
``NS_RETURN`` when the result buffer size is too
small.[`r211938 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211938>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports a ``resize`` command to resize partitions for all
schemes but
EBR.[`r209497 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209497>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports ``backup`` and ``restore`` subcommands to backup
partition tables and restore
them.[`r215941 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215941>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now handles given geom/provider names with and without ``/dev/``
prefix.[`r213661 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213661>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports an ``-F`` option for the ``destroy`` subcommand.
This option forces destroying of the partition table even if it is not
empty.[`r213684 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213684>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports a ``recover`` subcommand for GPT partition tables.
A corrupted GPT is now marked when the following three types of
corruption:[`r213684 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213684>`__\ ]

-  Primary GPT header or table is corrupted.

-  Secondary GPT header or table is corrupted.

-  Secondary GPT header is not located at the last LBA.

Changes to the corrupted GPT table are not allowed except for
``destroy`` and ``recover`` subcommands.

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports ``GPT_ENT_ATTR_BOOTME``, ``GPT_ENT_ATTR_BOOTONCE``,
and ``GPT_ENT_ATTR_BOOTFAILED`` attributes in GPT. The attribute
keywords in the command line are ``bootme``, ``bootonce``, and
``bootfailed``
respectively.[`r213994 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213994>`__\ ]

An issue in the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility has been fixed. A UFS1 file system created with 64KB blocksize
was incorrectly recognized as one with a broken superblock. This is
because the FreeBSD kernel checks a partition first for a UFS2
superblock at 64KB offset while it is possible that a UFS1 file systems
with 64KB blocksize has an alternative superblock at the same location.
For example, a file system created by ``newfs -U -O 1 -b 65536 -f 8192``
could lead to this
symptom.[`r215728 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215728>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports ``SIGHUP`` for reloading the configuration file.
When ``SIGTERM`` or ``SIGINT`` is received, the worker processes
terminate.[`r213049 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213049>`__\ ]

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now check an invalid CIDR subnet notation more strictly. It
wrongly accepted ``10.0.0.1/10.0.0.1`` as
``10.0.0.1/10``.[`r212144 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212144>`__\ ]

An accuracy issue in the
`jn(3) <http://www.FreeBSD.org/cgi/man.cgi?query=jn&sektion=3&manpath=FreeBSD+8.2-RELEASE>`__
and
`jnf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=jnf&sektion=3&manpath=FreeBSD+8.2-RELEASE>`__
functions in ``libm`` has been
fixed.[`r215237 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215237>`__\ ]

Incorrect behaviors in stuttering sequences and reverse ranges in the
`jot(1) <http://www.FreeBSD.org/cgi/man.cgi?query=jot&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility have been
fixed.[`r209284 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209284>`__\ ]

The ``libarchive`` library and
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now support LZMA (Lempel-Ziv-Markov chain-Algorithm) compression
format.[`r213667 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213667>`__\ ]

The
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports a blocksize which is up to ``8192`` (4MB) in the
``-b blocksize``
option.[`r215229 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215229>`__\ ]

A bug in the
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility that prevented it from working with some files on a ZFS file
system has been
fixed.[`r214442 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214442>`__\ ]

The ``-p`` option in the
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now displays the ``rw`` mount option correctly as in the
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
format.[`r213978 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213978>`__\ ]

The
`ncal(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ncal&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility has been updated. The option ``-b`` has been replaced with
``-C`` and ``-B number``. Options ``-3`` to show previous, current and
next month, and ``-A number`` to show months after current month have
been added. The option ``-m N YYYY`` now prints only the month, not the
whole
year.[`r213889 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213889>`__\ ]

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports an ``-S pidfile`` option to override the default
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
PID
file.[`r211699 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211699>`__\ ]

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports a special log file name ``<include>`` for
processing file inclusion. Globbing in the file name and circular
dependency detection are supported. For more details, see the
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
manual
page.[`r215622 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215622>`__\ ]

The
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility is now compiled with shared memory reference clock driver. For
example, GPS devices can be used as source of precise time via
``astro/gpsd`` in the Ports
Collection.[`r213980 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213980>`__\ ]

An off-by-one error in the
`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility when ustar file name is too long has been
fixed.[`r212848 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212848>`__\ ]

The
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports an ``-l`` option like the
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility
does.[`r209912 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209912>`__\ ]

The
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports a file and a network socket as a top source. A new
option ``-O filename`` specifies to send log output to ``filename``, and
another new option ``-R filename`` specifies to receive events from
``filename``. For a socket, the ``filename`` is in a form of
``ipaddr:port``. This allows top monitoring over TCP on a system with no
local symbols, for
example.[`r211098 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211098>`__\ ]

The
`pom(6) <http://www.FreeBSD.org/cgi/man.cgi?query=pom&sektion=6&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports a ``-p`` flag to print only the
percentage.[`r210089 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210089>`__\ ]

The
`powerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=powerd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports an ``-m freq`` and ``-M freq`` to control the
minimum and maximum frequency,
respectively.[`r212472 <http://svn.freebsd.org/viewvc/base?view=revision&revision=212472>`__\ ]

The
`ruptime(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ruptime&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now displays hostnames longer than 12
characters.[`r213825 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213825>`__\ ]

A behavior of the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
program when an ``-u`` option is specified has been changed. The special
parameters ``$@`` and ``$*`` no longer cause an error when there are no
positional
parameters.[`r215066 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215066>`__\ ]

A bug in the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
program has been fixed. A ``SIGINT`` signal is now passed through from a
child process if the shell is interactive and the job control is
enabled. For example, aborting
`sleep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sleep&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
command by Ctrl-C no longer display ``ok`` in the following command
line:[`r210616 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210616>`__\ ]

.. code:: SCREEN

    % sleep 5; echo ok

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
program now supports a ``bg`` command consisting solely of redirections.
For
example:[`r210732 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210732>`__\ ]

.. code:: SCREEN

    % < /dev/null &

The
`sleep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sleep&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports the ``SIGINFO`` signal and reports the specified
sleep time and the remaining
time.[`r211536 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211536>`__\ ]

The
`tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
and
`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utilities have been improved for better interoperability and they now
support RFC 1350, 2347, 2348, 2349, and
3617.[\ `r213036 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213036>`__,
`r213038 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213038>`__]

A bug in ``[=]=]`` equivalent class handling in the
`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility has been fixed. A closing bracket immediately after ``[=`` was
incorrectly treated as
special.[`r213899 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213899>`__\ ]

The
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports an ``-o`` flag as a synonym for the ``-s`` flag for
compatibility with other
systems.[`r210566 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210566>`__\ ]

Bugs in
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility have been fixed. They include handling of ``^@`` and ``^C`` in
insert mode when reading an ex
command.[`r211060 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211060>`__\ ]

The
`watchdogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=watchdogd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
program now uses ``MADV_PROTECT`` memory flag to protect itself from
being terminated by the FreeBSD kernel when available memory becomes
short. This kind of process termination happens in a swap-intensive
workload.[`r214345 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214345>`__\ ]

The ``set sharenfs`` command in the
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports ``sec``
option.[`r209870 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209870>`__\ ]

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/periodic`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A periodic script for ``zfs scrub`` has been added. For more details,
see
`periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
manual page.

A periodic script which can be used to find installed ports' files with
mismatched checksum has been added. For more details, see the
`periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
manual page.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

The **ACPI-CA** has been updated to 20101013.

The
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
program has been updated to version
1.5.2.[`r214287 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214287>`__\ ]

**ISC BIND** has been updated to version 9.6-ESV-R3.

**netcat** has been updated to version 4.8.

**OpenSSL** has been updated to version 0.9.8q.

The **timezone** database has been updated to the **tzdata2010o**
release.

The **xz** has been updated from snapshot as of 12 April 2010 to 5.0.0
release

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
utility now supports LZMA (**xz**) compression. Note that the default is
still
**bzip2**.[`r215738 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215738>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now uses the following numbers for default and minimum partition
sizes: 1GB for ``/``, 4GB for ``/var``, and 1GB for
``/tmp``.[`r211007 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211007>`__\ ]

The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility now attempts to enable
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
on a serial port when no VGA card is detected on the
system.[`r211009 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211009>`__\ ]

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

[amd64, i386] Upgrades between RELEASE versions (and snapshots of the
various security branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC kernel distributed as a part of
an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility requires that the host being upgraded has Internet connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
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
