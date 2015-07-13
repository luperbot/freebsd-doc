=================================
FreeBSD 9.3-RELEASE Release Notes
=================================

.. raw:: html

   <div class="article">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

IBM, AIX, OS/2, PowerPC, PS/2, S/390, and ThinkPad are trademarks of
International Business Machines Corporation in the United States, other
countries, or both.

IEEE, POSIX, and 802 are registered trademarks of Institute of
Electrical and Electronics Engineers, Inc. in the United States.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

SPARC, SPARC64, and UltraSPARC are trademarks of SPARC International,
Inc in the United States and other countries. SPARC International, Inc
owns all of the SPARC trademarks and under licensing agreements allows
the proper use of these trademarks by its members.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on 2014-07-08 by gjb.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

The release notes for FreeBSD 9.3-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 9.3-STABLE development
line. This document lists applicable security advisories that were
issued since the last release, as well as significant changes to the
FreeBSD kernel and userland. Some brief remarks on upgrading are also
presented.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <#intro>`__
`2. What's New <#new>`__
`3. Upgrading from Previous Releases of FreeBSD <#upgrade>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document contains the release notes for FreeBSD 9.3-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 9.3-RELEASE is a release distribution. It
can be found at ``http://www.FreeBSD.org/releases/`` or any of its
mirrors. More information on obtaining this (or other) release
distributions of FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
9.3-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.?What's New
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes the most user-visible new or changed features in
FreeBSD since 9.2-RELEASE.

Typical release note items document recent security advisories issued
after 9.2-RELEASE, new drivers or hardware support, new commands or
options, major bug fixes, or contributed software upgrades. They may
also list changes to major ports/packages or release engineering
practices. Clearly the release notes cannot list every single change
made to FreeBSD between releases; this document focuses primarily on
security advisories, user-visible changes, and major architectural
improvements.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Problems described in the following security advisories have been fixed.
For more information, consult the individual advisories available from
``http://security.FreeBSD.org/``.

.. raw:: html

   <div class="informaltable">

+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                                 | Date              | Topic                                                                                                                  |
+==========================================================================================================+===================+========================================================================================================================+
| `FreeBSD-SA-14:01.bsnmpd <http://security.freebsd.org/advisories/FreeBSD-SA-14:01.bsnmpd.asc>`__         | 14?January?2014   | Fix `bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1>`__ remote denial of service vulnerability   |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:02.ntpd <http://security.freebsd.org/advisories/FreeBSD-SA-14:02.ntpd.asc>`__             | 14?January?2014   | Disable “monitor” feature in `ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__ by default          |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:04.bind <http://security.freebsd.org/advisories/FreeBSD-SA-14:04.bind.asc>`__             | 14?January?2014   | Remote denial of service vulnerability                                                                                 |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:05.nfsserver <http://security.freebsd.org/advisories/FreeBSD-SA-14:05.nfsserver.asc>`__   | 8?April?2014      | Deadlock in the NFS server                                                                                             |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:06.openssl <http://security.freebsd.org/advisories/FreeBSD-SA-14:06.openssl.asc>`__       | 8?April?2014      | ECDSA side channel leak                                                                                                |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:08.tcp <http://security.freebsd.org/advisories/FreeBSD-SA-14:08.tcp.asc>`__               | 30?April?2014     | TCP reassembly vulnerability                                                                                           |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:11.sendmail <http://security.freebsd.org/advisories/FreeBSD-SA-14:11.sendmail.asc>`__     | 26?May?2014       | Sendmail improper close-on-exec flag handling                                                                          |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:12.ktrace <http://security.freebsd.org/advisories/FreeBSD-SA-14:12.ktrace.asc>`__         | 3?June?2014       | `ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1>`__ kernel memory disclosure                     |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:13.pam <http://security.freebsd.org/advisories/FreeBSD-SA-14:13.pam.asc>`__               | 3?June?2014       | Incorrect error handling in PAM policy parser                                                                          |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:14.openssl <http://security.freebsd.org/advisories/FreeBSD-SA-14:14.openssl.asc>`__       | 5?June?2014       | Multiple vulnerabilities                                                                                               |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:16.file <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:16.file.asc>`__         | 24?June?2014      | Multiple vulnerabilities                                                                                               |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+
| `FreeBSD-SA-14:17.kmem <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:17.kmem.asc>`__         | 8?July?2014       | Kernel memory disclosure in control messages and SCTP notifications                                                    |
+----------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.?Kernel Changes
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4>`__
driver has been updated to version 1.20.00.28.
`[r256033] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256033>`__

The
`isci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isci&sektion=4>`__
driver is now loadable via
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
`[r256437] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256437>`__\ 
(Sponsored by The?FreeBSD?Foundation)

System-level
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
values are now exposed to the system for the
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4>`__
device.
`[r256759] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256759>`__

The `mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4>`__
driver has been updated to support MegaRAID Invader controllers.
`[r256924] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256924>`__

A kernel panic triggered in ``zfs_root()`` after a failed rollback has
been fixed.
`[r257119] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257119>`__

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
``debug.devfs_iosize_max_clamp`` has been added which enables and
disables ``SSIZE_MAX``-sized I/O requests on
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
files.
`[r257125] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257125>`__\ 
(Sponsored by The?FreeBSD?Foundation)

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
``kern.disallow_high_osrel``, has been added which disables executing
the images compiled on a userland with a higher major version number
than the major version number of the running kernel.
`[r257126] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257126>`__\ 
(Sponsored by The?FreeBSD?Foundation)

A kernel panic triggered by unmounting a busy
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystem has been fixed.
`[r257253] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257253>`__

A deadlock triggered by powering off a USB device has been fixed.
`[r257373] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257373>`__

The
`ichsmb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ichsmb&sektion=4>`__
driver has been updated to support Intel Lynx Point PCH SMBus devices.
`[r258214] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258214>`__

The `ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4>`__
driver has been updated to support Coleto Creek devices.
`[r258215] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258215>`__

The
`ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4>`__
driver has been updated to support the PCI-express solid state drive in
the Apple??MacBook Air (model A1465).
`[r258217] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258217>`__

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
``vfs.zfs.arc_meta_limit`` can now be changed at runtime.
`[r258635] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258635>`__

The
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2>`__
system call has been updated to more optimally use superpages and
provide support for tweaking the alignment of virtual mappings.
`[r258870] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258870>`__

A workaround has been implemented in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4>`__
driver for hung transmission on BCM5719 and BCM5720 chipsets.
`[r258962] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258962>`__

A kernel panic when listing sysctls on a system with ``INVARIANTS``
enabled has been fixed.
`[r259002] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259002>`__

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
``kern.supported_archs`` has been added, which will list the
``MACHINE_ARCH`` values whose binaries can be run on the system.
`[r259466] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259466>`__

Several problems that could trigger kernel panic on
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
and
`kldunload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldunload&sektion=8>`__
have been fixed.
`[r259519] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259519>`__\ 
(Sponsored by Spectra Logic)

A kernel panic triggered by some multi-threaded applications has been
fixed.
`[r260082] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260082>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The
`runfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=runfw&sektion=4>`__
firmware has been renamed from ``runfw`` to ``run.fw`` for consistency
with other firmware files.
`[r260134] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260134>`__

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
``kern.panic_reboot_wait_time``, has been added. This allows tuning the
amount of time the system will wait before rebooting after
`panic(9) <http://www.FreeBSD.org/cgi/man.cgi?query=panic&sektion=9>`__.
The ``kern.panic_reboot_wait_time`` value defaults to the kernel
configuration option, ``PANIC_REBOOT_WAIT_TIME``.
`[r260433] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260433>`__

Hardware Random Number Generators have been disabled by default.
`[r260644] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260644>`__

Support for GPS ports has been added to the
`uhso(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhso&sektion=4>`__
driver.
`[r261485] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261485>`__

A memory leak of compressed buffers has been fixed in
``l2arc_write_done()``.
`[r262116] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262116>`__

The
`netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4>`__
framework has been updated to match the version in ``head/``, which
includes netmap pipes, kqueue support, and enhanced VALE switch port.
`[r262153] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262153>`__

A deadlock triggered by sending a mounted
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
snapshot has been fixed.
`[r262175] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262175>`__

Support for SIIG X1 PCI-e has been added to
`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4>`__.
`[r262231] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262231>`__

Support for the ext4 filesystem has been enabled, supporting read-only
mounts.
`[r262564] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262564>`__

A kernel panic triggered by inserting a USB ethernet device on
VIMAGE-enabled systems has been fixed.
`[r262594] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262594>`__

TTM, a memory manager used by video drivers, has been merged.
`[r262988] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262988>`__\ 
(Sponsored by The?FreeBSD?Foundation)

Support for ``/sys/kernel/random/uuid`` has been added to
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5>`__.
`[r263103] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263103>`__

A memory leak in the ``zpool_in_use()`` function has been fixed.
`[r263128] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263128>`__

The ``extensible_dataset``
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__
feature has been added. See
`zpool-features(7) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool-features&sektion=7>`__
for more information.
`[r263391] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263391>`__

A memory leak has been fixed in ``libzfs``.
`[r263408] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263408>`__

The `vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
driver has been merged from ``head/``.
`[r263817,263818] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263817,263818>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The `mpr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpr&sektion=4>`__
device has been added, providing support for LSI Fusion-MPT 3 12Gb
SCSI/SATA controllers.
`[r265729] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265729>`__\ 
(Sponsored by LSI, Spectra Logic)

A kernel bug that inhibited proper functionality of the
``dev.cpu.0.freq``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
on Intel? processors with Turbo Boost?™ enabled has been fixed.
`[r266167] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266167>`__

Support for
`xen(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xen&sektion=4>`__
hardware-assisted virtualization, ``XENHVM``, is now available as a
loadable module, ``xenhvm.ko``.
`[r266269] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266269>`__

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.?Hardware Support
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Trackpad support for Apple??MacBook products has been added.
`[r261510] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261510>`__

The `nve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nve&sektion=4>`__
driver has been deprecated, and the
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4>`__
driver should be used instead.
`[r261973] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261973>`__

The `mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4>`__
driver has been updated to support MegaRAID Fury cards.
`[r262968] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262968>`__

The Radeon KMS driver has been added.
`[r263170,263171] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263170,263171>`__

The
`aacraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aacraid&sektion=4>`__
driver has been updated to version 3.2.5.
`[r263340] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263340>`__

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.1.?Network Interface Support
''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4>`__
driver has been updated to add preliminary support for the RTL8106E
chipset.
`[r257611] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257611>`__

The `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4>`__
driver has been updated to support the RTL8168G, RTL8168GU and RTL8411B
chipsets.
`[r257614,257616] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257614,257616>`__

The `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4>`__
driver has been updated to add preliminary support for the RTL8168EP
chipset.
`[r257618] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257618>`__

The `oce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=oce&sektion=4>`__
driver has been updated to version 10.0.664.0.
`[r258586] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258586>`__

The
`qlxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=qlxgbe&sektion=4>`__
driver has been imported from ``head/``.
`[r258898] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258898>`__

The
`qlxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=qlxge&sektion=4>`__
driver has been imported from ``head/``.
`[r258936] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258936>`__

The `bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4>`__
driver has been updated to support the BCM5725 chipset.
`[r258965] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258965>`__

The `bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4>`__
driver has been updated to support the BCM57764, BCM57767, BCM57782,
BCM57786 and BCM57787 chipsets.
`[r258967] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258967>`__

The `run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4>`__
driver has been updated to support MediaTek/Ralink chipsets RT5370 and
RT5372.
`[r259457] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259457>`__

The `usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4>`__
wireless radiotap headers have been realigned, allowing wireless
adapters to work on arm, mips, and other similar platforms where
alignment is important.
`[r259460] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259460>`__

The `run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4>`__
firmware has been updated to version 0.33.
`[r260119] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260119>`__

The `bxe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bxe&sektion=4>`__
driver has been merged from ``head/``, providing support for Broadcom
NetXtreme II 10Gb PCIe adapters.
`[r260252] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260252>`__

The `run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4>`__
driver has been updated to include support for the MediaTek/Ralink
RT3593 chipset.
`[r261865] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261865>`__

The `run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4>`__
driver has been updated to include support for the DLINK DWA-127
wireless adapter.
`[r261933] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261933>`__

The
`axge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axge&sektion=4>`__
driver has been added.
`[r262153] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262153>`__

The
`urndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urndis&sektion=4>`__
driver has been imported from OpenBSD.
`[r262362] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262362>`__

The `bxe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bxe&sektion=4>`__
driver has been updated to version 1.78.78.
`[r263582] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263582>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.2.?File Systems
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystem has been updated to support the ``bookmarks`` feature.
`[r263410] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263410>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.?Userland Changes
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A new flag ``-c``, has been added to
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1>`__
and
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1>`__,
which restricts the process lookup to the specified login class.
`[r256054] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256054>`__

The `ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8>`__
utility has been updated to add ``show ioapic`` and
``show all       ioapics``.
`[r257496] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257496>`__

Setting ``nmbcluster`` values to their current value will now be
ignored, instead of failing with an error.
`[r258183] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258183>`__

The ``/var/cache`` directory is now created with mode ``0755`` instead
of mode ``0750``, since this directory is used by many third-party
applications, which makes dropping group privileges impossible.
`[r258763] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258763>`__

The
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1>`__
utility has been updated to include the ``-U`` and ``-K`` flags, which
print the ``__FreeBSD_version`` for the running userland and kernel,
respectively.
`[r258818] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258818>`__

The
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__
library has been updated to support SNI (Server Name Identification),
allowing to use virtual hosts on HTTPS.
`[r258844] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258844>`__

A segmentation fault and internal compiler error bug in
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
triggered by throwing a warning before parsing any tokens has been
fixed.
`[r259243] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259243>`__

Several updates to
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__ have
been imported from Google.
`[r259269,259406] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259269,259406>`__\ 
(Contributed / provided by Google)

A byte-order bug in the Heimdal ``gss_pseudo_random()`` function which
would prevent interoperability with other Kerberos implementations has
been fixed. In particular, this would prevent interoperability with the
MIT implementation.
`[r259448] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259448>`__

The
`hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8>`__
utility has been updated to output the current queue sizes.
`[r260007] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260007>`__

The `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
utility will no longer truncate the ``command`` output column.
`[r260197] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260197>`__

The
`protect(1) <http://www.FreeBSD.org/cgi/man.cgi?query=protect&sektion=1>`__
command has been added, which allows exempting processes from being
killed when swap is exhausted.
`[r260208] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260208>`__

The
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
utility now prevents deactivating the last component of a mirror.
`[r260507] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260507>`__

A new
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
command, ``gmirror destroy``, has been added, which will destroy the
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
and erase the
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
metadata.
`[r260507] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260507>`__

The
`etcupdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=etcupdate&sektion=8>`__
utility, a tool for managing updates to files in ``/etc``, has been
merged from ``head/``.
`[r260650] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260650>`__

The
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__
utility has been updated to fix incorrect behavior with the ``-lname``
and ``-ilname`` flags.
`[r260651] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260651>`__

The ``hw.uart.console`` is now always updated when the comconsole setup
changes.
`[r260868,260869] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260868,260869>`__

The
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
utility has been updated to display a message directing to
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__,
instead of the cryptic message “Exec format error”.
`[r260909] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260909>`__

A bug that could trigger an infinite loop in KDE and X has been fixed.
`[r261674] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261674>`__

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
utility has been changed to use the size of the file, instead of the
blocks the file takes on the disk to match the behavior documented in
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__.
`[r262076] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262076>`__

A bug in
`zdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zdb&sektion=8>`__
which would cause numeric parameters to a flag as being treated as
additional flags has been fixed.
`[r262105] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262105>`__

The
`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8>`__
utility now has a ``-V`` flag, which lists information such as serial
numbers for each device.
`[r262134] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262134>`__

A bug that would allow creating a
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
snapshot of an inconsistent dataset has been fixed.
`[r262158] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262158>`__

Receiving a
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
dataset with ``zfs recv -F`` now properly destroys any snapshots that
were created since the incremental source snapshot.
`[r262160] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262160>`__

Installation from a read-only ``.OBJDIR`` has been fixed.
`[r263031] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263031>`__

A new shared library directory, ``/usr/lib/private``, has been added for
internal-use shared libraries.
`[r263031] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263031>`__

A default ``libmap32.conf`` has been added, for 32-bit applications.
`[r263031] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263031>`__

The ``libucl`` library, a JSON-compatible configuration file parsing
library, has been imported.
`[r263032] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263032>`__

The `pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__
package management utility has been syncronized with ``head/``. This
implements binary package signature verification when bootstrapping the
system with ``pkg       bootstrap``.
`[r263038] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263038>`__

The system timezone data files have been updated to version tzdata2014a.
`[r263042] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263042>`__

The NetBSD
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
utility, ``bmake`` has been imported for compatibility with the
FreeBSD?Ports Collection. It is installed as ``bmake``, and the ``make``
remains the FreeBSD version.
`[r263212] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263212>`__

The
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__
library now supports ``Last-Modified`` timestamps which return UTC
instead of GMT.
`[r263326] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263326>`__

Aliases for the
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
commands ``list -t snap`` and ``snap`` have been added to match
Oracle??Solaris 11.
`[r263404] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263404>`__

A new flag, ``-p``, has been added to the
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
``list`` command, providing output in a parseable form.
`[r263406] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263406>`__

OpenPAM has been updated to Nummularia (20130907), which incorporates
several bug fixes and documentation improvements. The
`openpam\_ttyconv(3) <http://www.FreeBSD.org/cgi/man.cgi?query=openpam_ttyconv&sektion=3>`__
library has been completely rewritten.
`[r263421] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263421>`__

The `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
command interpreter has been updated to expand assignments after
``export``, ``local``, and ``readonly`` differently. As result of this
change, variable assignment such as ``local       v=$1`` will assign the
first positional parameter to ``v``, even if ``$1`` contains spaces, and
``local w=~/myfile`` will expand the tilde (``~``).
`[r264423] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264423>`__

The
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__
utility has been updated to implement ``-ignore_readdir_race``. Prior to
this change, ``-ignore_readdir_race`` existed as an option for GNU
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__
compatibility, and was ignored if specified. A counter primary,
``-noignore_readdir_race`` now also exists, and is the default behavior.
`[r264699] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264699>`__

The `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
utility has been updated to include the ``-J`` flag, used to filter
output by matching
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
IDs and names. Additionally, argument ``0`` can be used to ``-J`` to
only list processes running on the host system.
`[r266286] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266286>`__

The `top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
utility has been updated to filter by
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__ ID
or name, in followup to the
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ change
in ``r265229``.
`[r266287] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266287>`__

The Blowfish
`crypt(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypt&sektion=3>`__
default format has been changed to ``$2b$``.
`[r266818] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266818>`__

The default
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__
now includes files in the ``/etc/newsyslog.conf.d/`` and
``/usr/local/etc/newsyslog.conf.d/`` directories by default for
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__.
`[r267114] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267114>`__

A new flag, “onifconsole” has been added to ``/etc/ttys``. This allows
the system to provide a login prompt via serial console if the device is
an active kernel console, otherwise it is equivalent to ``off``.
`[r267243] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267243>`__

The
`arc4random(3) <http://www.FreeBSD.org/cgi/man.cgi?query=arc4random&sektion=3>`__
library has been updated to match that of FreeBSD-CURRENT.
`[r267379] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267379>`__

The
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8>`__
utility has been updated to include a new flag, ``-l``, which ends event
collection after the specified number of seconds.
`[r267411] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267411>`__

The FreeBSD?Project has migrated from the GNATS bug tracking system to
Bugzilla. The
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
utility used for submitting problem reports has been replaced with a
stub shell script that instructs to use the Bugzilla web interface.
`[r267911] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267911>`__

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1.?\ `periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__ Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``/etc/periodic/security/800.loginfail``
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
script has been refined to catch more authentication failures and reduce
false positives.
`[r263662] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263662>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.2.?\ `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Support for “first boot” scripts has been added to
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__. See
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ and
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
for implementation details.
`[r256917] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256917>`__

The `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
system will now re-source
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
on receipt of ``SIGALRM``.
`[r260432] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260432>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.?Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`readline(3) <http://www.FreeBSD.org/cgi/man.cgi?query=readline&sektion=3>`__
library has been updated to version 1.104.
`[r255934] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255934>`__

Sendmail has been updated to version 8.14.9.
`[r266711] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266711>`__

BIND has been updated to version 9.9.5.
`[r262706] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262706>`__\ 
(Sponsored by DK Hostmaster A/S)

The `xz(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xz&sektion=1>`__
utility has been updated to a post-5.0.5 snapshot.
`[r263286] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263286>`__

OpenSSH has been updated to version 6.6p1.
`[r263970] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263970>`__

OpenSSL has been updated to version 0.9.8za.
`[r267285] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267285>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.5.?Ports and Packages
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Note to FreeBSD desktop users: please read this section carefully,
especially before upgrading ports that depend on Xorg.

.. raw:: html

   </div>

In April 2014, the FreeBSD Ports collection switched to a newer version
of Xorg that supports KMS (Kernel Mode Setting).

Users upgrading from earlier versions of FreeBSD?9.x or FreeBSD?8.x
should be aware of several things regarding Xorg:

.. raw:: html

   <div class="itemizedlist" xmlns="http://www.w3.org/1999/xhtml">

-  When applications are built from the FreeBSD Ports Collection or
   installed from the ``new_xorg``
   `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
   repository, the newer, KMS-aware version of Xorg is used.

-  The KMS version of Xorg does not switch back to text mode after
   leaving the X desktop environment, and the system console will not be
   visible. The new
   `vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
   console driver supports graphic consoles and keeps the console
   visible after X has exited. The
   `vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
   driver must be compiled into the kernel. A ``VT`` kernel
   configuration example file is included in 9.3-RELEASE, but is not
   compiled or enabled by default. See
   `vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__ and
   the `vt(4) wiki page <https://wiki.freebsd.org/VT>`__ for additional
   information.

-  Packages for KDE4 are not available in the default (``latest``)
   `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
   repository, however are available in the ``new_xorg`` repository. See
   the `announcement
   email <https://lists.freebsd.org/pipermail/freebsd-announce/2014-July/001570.html>`__
   for details on how to use the ``new_xorg`` repository.

   The older Xorg that does not support KMS can still be installed from
   the ``latest`` upstream
   `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
   repository and the packages included on the 9.3-RELEASE DVD.

   However, it is important to note that some newer applications require
   the newer Xorg, and will not work with the old version. The newer
   Xorg is recommended, and should be used unless not compatible with
   legacy graphics cards.

   To continue using the old version of Xorg when building from the
   FreeBSD?Ports Collection, set ``WITHOUT_NEW_XORG=yes`` in
   `make.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=make.conf&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.6.?Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As part of the release build, the
`etcupdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=etcupdate&sektion=8>`__
utility will bootstrap the system, allowing
`etcupdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=etcupdate&sektion=8>`__
to work after the first upgrade of a system.
`[r260891] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260891>`__

The ``release.sh`` script and release ``Makefile`` have been updated to
use `pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__
to populate the dvd installation medium.
`[r262879] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262879>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The
`services.mkdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=services.mkdb&sektion=8>`__
utility has been updated to support multiple byte orders. Similar to
`cap\_mkdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cap_mkdb&sektion=1>`__,
the ``services.db`` will be created with proper endinanness as part of
cross-architecture release builds.
`[r263028] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263028>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.?Upgrading from Previous Releases of FreeBSD
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Upgrading Using `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__ or a Source-Based Procedure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

[amd64,i386] Binary upgrades between RELEASE versions (and snapshots of
the various security branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as an unmodified ``GENERIC`` kernel, distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility requires that the host being upgraded have Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported using to
the instructions in ``/usr/src/UPDATING``.

For more specific information about upgrading instructions, see
``http://www.FreeBSD.org/releases/9.3R/installation.html``.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Upgrading FreeBSD should only be attempted after backing up *all* data
and configuration files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.?User-Visible Incompatibilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD?9.0 and later versions have several configuration
incompatibilities with earlier versions of FreeBSD. These differences
are best understood before upgrading. *Please read this section and the
`Upgrading Section in 9.0-RELEASE Release
Notes <http://www.freebsd.org/releases/9.0R/relnotes-detailed.html#UPGRADE>`__
carefully before submitting a problem report and/or posting a question
to the FreeBSD mailing lists.*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 9.3-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
