==================================
FreeBSD 10.1-RELEASE Release Notes
==================================

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

Copyright ? 2000-2014 The FreeBSD Documentation Project

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

Intel, Celeron, Centrino, Core, EtherExpress, i386, i486, Itanium,
Pentium, and Xeon are trademarks or registered trademarks of Intel
Corporation or its subsidiaries in the United States and other
countries.

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

Last modified on 2014-11-06 by gjb.

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

The release notes for FreeBSD 10.1-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 10.1-STABLE development
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

This document contains the release notes for FreeBSD 10.1-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 10.1-RELEASE is a release distribution. It
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
10.1-RELEASE can be found on the FreeBSD Web site.

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
FreeBSD since 10.0-RELEASE.

Typical release note items document recent security advisories issued
after 10.0-RELEASE, new drivers or hardware support, new commands or
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

The following security advisories have been issued since
FreeBSD?10.0-RELEASE:

.. raw:: html

   <div class="informaltable">

+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| Advisory                                                                                             | Date                | Topic                                                                 |
+======================================================================================================+=====================+=======================================================================+
| `SA-13:14.openssh <http://www.freebsd.org/security/advisories/FreeBSD-SA-13:14.openssh.asc>`__       | 19?November?2013    | OpenSSH AES-GCM memory corruption vulnerability                       |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:01.bsnmpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:01.bsnmpd.asc>`__         | 14?January?2014     | bsnmpd remote denial of service vulnerability                         |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:02.ntpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:02.ntpd.asc>`__             | 14?January?2014     | ntpd distributed reflection Denial of Service vulnerability           |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:03.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:03.openssl.asc>`__       | 14?January?2014     | OpenSSL multiple vulnerabilities                                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:04.bind <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:04.bind.asc>`__             | 14?January?2014     | BIND remote denial of service vulnerability                           |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:05.nfsserver <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:05.nfsserver.asc>`__   | 8?April?2014        | Deadlock in the NFS server                                            |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:06.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:06.openssl.asc>`__       | 8?April?2014        | OpenSSL multiple vulnerabilities                                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:07.devfs <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:07.devfs.asc>`__           | 30?April?2014       | Fix devfs rules not applied by default for jails                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:08.tcp <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:08.tcp.asc>`__               | 30?April?2014       | Fix TCP reassembly vulnerability                                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:09.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:09.openssl.asc>`__       | 30?April?2014       | Fix OpenSSL use-after-free vulnerability                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:10.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:10.openssl.asc>`__       | 15?May?2014         | Fix OpenSSL NULL pointer deference vulnerability                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:11.sendmail <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:11.sendmail.asc>`__     | 3?June?2014         | Fix sendmail improper close-on-exec flag handling                     |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:13.pam <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:13.pam.asc>`__               | 3?June?2014         | Fix incorrect error handling in PAM policy parser                     |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:14.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:14.openssl.asc>`__       | 5?June?2014         | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:15.iconv <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:15.iconv.asc>`__           | 24?June?2014        | NULL pointer dereference and out-of-bounds array access               |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:16.file <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:16.file.asc>`__             | 24?June?2014        | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:17.kmem <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:17.kmem.asc>`__             | 8?July?2014         | Kernel memory disclosure in control messages and SCTP notifications   |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:18.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:18.openssl.asc>`__       | 9?September?2014    | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:19.tcp <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:19.tcp.asc>`__               | 16?September?2014   | Denial of Service in TCP packet processing.                           |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:20.rtsold <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:20.rtsold.asc>`__         | 21?October?2014     | Remote buffer overflow vulnerability.                                 |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:21.routed <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:21.routed.asc>`__         | 21?October?2014     | Remote denial of service vulnerability.                               |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:22.namei <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:22.namei.asc>`__           | 21?October?2014     | Memory leak in sandboxed namei lookup.                                |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:23.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:23.openssl.asc>`__       | 21?October?2014     | Multiple vulerabilities.                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:25.setlogin <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:25.setlogin.asc>`__     | 04?November?2014    | Kernel stack disclosure.                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:26.ftp <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:26.ftp.asc>`__               | 04?November?2014    | Remote code execution.                                                |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+

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

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
``kern.panic_reboot_wait_time``, has been added, which allows
controlling how long the system will wait after
`panic(9) <http://www.FreeBSD.org/cgi/man.cgi?query=panic&sektion=9>`__
before rebooting.
`[r260431] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260431>`__

The `vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
driver has been merged from FreeBSD-CURRENT. To enable
`vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__, enter
``set kern.vty=vt`` at the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
prompt during boot, or add ``kern.vty=vt`` to
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
and reboot the system.
`[r262861] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262861>`__

Support for
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4>`__
has been added for PowerPC??970 class processors.
`[r263122] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263122>`__

Support for ADT7460 and ADT7467 fan controllers found in newer
PowerBooks™ and iBooks™ has been added to the
`iicbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iicbus&sektion=4>`__
driver.
`[r263197] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263197>`__

A panic triggered by removing a
`urtwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urtwn&sektion=4>`__
device has been fixed.
`[r263256] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263256>`__

A potential deadlock in the
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4>`__
stack triggered by detaching USB devices that create character devices
has been fixed.
`[r263799] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263799>`__

Support for AMD??Family 16h sensor devices has been added to
`amdtemp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amdtemp&sektion=4>`__.
`[r263869] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263869>`__

The
`uslcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uslcom&sektion=4>`__
driver has been updated to support 26 new devices.
`[r265610] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265610>`__

A kernel bug that inhibited proper functionality of the
``dev.cpu.0.freq``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
on Intel? processors with Turbo Boost™ enabled has been fixed.
`[r266165] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266165>`__

The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4>`__
driver has been updated to include support for the Intel??Lynx Point KT
AMT serial port.
`[r266436] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266436>`__

The ``radeonkms(4)`` driver has been updated to include 32-bit
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2>`__
support, allowing 32-bit applications to run on a 64-bit system.
`[r266594] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266594>`__

A bug that would prevent a
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
from setting the correct IPv4 source address with some operations that
required ``security.jail.allow_raw_sockets`` has been fixed.
`[r266718] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266718>`__

The
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4>`__
driver has been updated to support core events from the Atom™ Silvermont
architecture.
`[r266911] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266911>`__

The `oce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=oce&sektion=4>`__
driver has been updated with vendor-supplied fixes for big endian
support, and 20GB/s and 25GB/s link speeds.
`[r268046] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268046>`__

The FreeBSD?virtual memory subsystem has been updated to implement “fast
path” for the page fault handler.
`[r270630] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270630>`__

The
`asmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asmc&sektion=4>`__
driver has been updated to support the Apple??Mac Mini 3,1.
`[r271069] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271069>`__

The FreeBSD/powerpc64 default kernel configuration, ``GENERIC64``, has
been updated to enable the
`vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
console driver for the Sony??Playstation?3™ platform.
`[r271111] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271111>`__

The FreeBSD/powerpc ``ofwfb`` driver, used to provide a graphics console
when the
`vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
console driver is used, has been modified to work with the
``x11-drivers/xf86-video-scfb`` port.
`[r271116] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271116>`__\ 
(Sponsored by The?FreeBSD?Foundation)

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If using an ATI graphics card with the
`vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
driver, the ``x11-servers/xorg-server`` package must be updated to
version 1.12.4\_8 or newer.

.. raw:: html

   </div>

Several performance enchancements to the
`vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__ driver
have been merged from FreeBSD-CURRENT.
`[r271128] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271128>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The default stack size (``KSTACK_PAGES``) has been increased from ``4``
to ``8`` for the powerpc64 architecture.
`[r271153] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271153>`__

The FreeBSD/powerpc ATI driver has been updated to support enabling and
disabling the Radeon?9700 backlight, found in the Apple??PowerBook™?G4.
`[r271205] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271205>`__

Hardware context support has been added to the ``drm/i915`` driver,
adding support for Mesa 9.2 and later.
`[r271816] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271816>`__

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.?Virtualization Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Support for Microsoft? Hyper-V has been added to FreeBSD/i386 as
loadable modules, however not available in the ``GENERIC`` kernel
configuration.
`[r259450] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259450>`__

The
`bhyve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=4>`__
hypervisor now supports soft power-off functionality via the ACPI S5
state.
`[r261090] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261090>`__

Support for FreeBSD/i386 guests has been added to
`bhyve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=4>`__.
`[r267399] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267399>`__

Support for virtualized ``XSAVE`` has been added to
`bhyve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=4>`__,
allowing guest operating systems to use ``XSAVE`` and ``XSAVE``-enabled
features, such as AVX.
`[r267427] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267427>`__

The
`bhyve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=4>`__
hypervisor now supports booting from a
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystem.
`[r268932] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268932>`__

A new driver,
`virtio\_random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio_random&sektion=4>`__,
has been added, which allows FreeBSD virtual machines to harvest entropy
from the hypervisor.
`[r268933] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268933>`__

The
`bhyve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=4>`__
hypervisor has been synced with the version in FreeBSD-CURRENT.
`[r270159] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270159>`__

A number of enhancements have been added, and several bug fixes,
including:

.. raw:: html

   <div class="itemizedlist">

-  Post-mortem debugging has been added when a guest virtual machine
   exits with an “EPT Misconfiguration” error.

-  The hypervisor
   `virtio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio&sektion=4>`__
   API has been expanded from 32- to 64-bit.

-  Support for identifying capabilities of the virtual CPU has been
   added.

-  Support for emulating legacy x86 task switching has been added.

-  Support to list the VT-x features in base kernel
   `dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
   has been added.

-  Support for extended PCI configuration space has been added.

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

2.2.2.?ARM Support
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``WANDBOARD`` kernel configuration file has been added.
`[r259355] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259355>`__

Boot devices may now be specified by setting a u-boot environment
variable. If a boot device is not specified, the probe mechanism will be
used. To specify the boot device, set the ``loaderdev=device`` u-boot
environment variable.
`[r265067] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265067>`__

The ``nexus(4)`` driver has been updated to include “Flattened Device
Tree” support, replacing the
`fdtbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdtbus&sektion=4>`__
driver in most cases.
`[r266000] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266000>`__

The
`gpioiic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gpioiic&sektion=4>`__
and
`gpioled(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gpioled&sektion=4>`__
have been merged from FreeBSD-CURRENT.
`[r266105] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266105>`__

Support for hardware floating point was added to the kernel, and enabled
by default in the configuration files for all platforms that contain the
required hardware.

C++ exception handling now works with GCC.

Support for SMP was added to the kernel, and enabled by default in the
configuration files for all platforms that contain multi-core CPUs.

Support was added for:

.. raw:: html

   <div class="itemizedlist">

-  CHROMEBOOK (Samsung Exynos 5250)

-  COLIBRI (Freescale Vybrid)

-  COSMIC (Freescale Vybrid)

-  IMX53-QSB (Freescale i.MX53)

-  QUARTZ (Freescale Vybrid)

-  RADXA (Rockchip rk30xx)

-  WANDBOARD (Freescale i.MX6)

.. raw:: html

   </div>

An I2C driver was added for the RaspberryPi.

Drivers have been added to support TI platforms, such as BEAGLEBONE and
PANDABOARD:

.. raw:: html

   <div class="itemizedlist">

-  PRUSS (Programmable Realtime Unit Subsystem)

-  MBOX (Mailbox hardware)

-  SDHCI (new faster driver for MMC/SD storage)

-  PPS (Pulse Per Second input on a GPIO/timer pin)

-  PWM (Pulse Width Modulation output)

-  ADC (Analog to Digital converter)

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

2.2.3.?Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A kernel selection menu has been added to
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.
If the “beastie menu” is enabled, the kernel to boot may be selected
from the kernel selection menu. Additional kernels may be listed in
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
as a comma- or space-separated list. By default, ``kernel`` and
``kernel.old`` are listed.
`[r262701] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262701>`__

The ``sys/boot/`` sources have been rearranged, moving
`libstand(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libstand&sektion=3>`__
to a directory indicating the library is built as 32-bit.
`[r271130] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271130>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The
`libstand(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libstand&sektion=3>`__
library has been updated to produce a 64-bit shared library for the
FreeBSD/amd64 and FreeBSD/powerpc64 architectures.
`[r271135] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271135>`__\ 
(Sponsored by The?FreeBSD?Foundation)

Initial support for UEFI boot has been added.
`[r271135] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271135>`__\ 
(Sponsored by The?FreeBSD?Foundation)

Three new files are installed to ``/boot``, supporting UEFI boot:
`[r271136] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271136>`__\ 
(Sponsored by The?FreeBSD?Foundation)

.. raw:: html

   <div class="itemizedlist">

-  ``boot1.efi``: The UEFI first stage bootstrap file.

-  ``boot1.efifat``: A FAT filesystem image containing an EFI system
   partition.

-  ``loader.efi``: The third stage bootstrap file.

.. raw:: html

   </div>

Serial console and null console support has been added to the UEFI boot
loader.
`[r271880] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271880>`__

Support has been added to cache
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
passphrases during system boot. When a system is configured with
multiple ``GEOM_ELI`` providers all using the same passphrase, the
passphrase that is cached after the first entry is used for the
subsequent ``GEOM_ELI`` provider. If the passphrase in the cache is
incorrect, then a prompt for the passphrase for the next provider is
displayed.
`[r272006] <http://svn.freebsd.org/viewvc/base?view=revision&revision=272006>`__

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

2.2.4.?Hardware Support
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.4.1.?Network Interface Support
''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Support for Ralink RT5370 and RT5372 chipsets has been added to the
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4>`__
driver.
`[r259453] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259453>`__

Firmware for the
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4>`__
driver has been updated to version 0.33.
`[r260120] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260120>`__

Support for the Ralink RT3593 chipset has been added to the
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4>`__
driver.
`[r261868] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261868>`__

The `nve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nve&sektion=4>`__
driver is now deprecated, and the
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4>`__
driver should be used instead.
`[r261972] <http://svn.freebsd.org/viewvc/base?view=revision&revision=261972>`__

Support for the
`axge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axge&sektion=4>`__
driver has been added. This driver supports the ASIX AX88178A and
AX88179 USB ethernet adapters. The AX88178A supports USB 2.0, and the
AX88179 supports USB 2.0 and 3.0.
`[r262137] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262137>`__

The
`urndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urndis&sektion=4>`__
driver has been imported from OpenBSD.
`[r262363] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262363>`__

Support for multiple transmitter/receiver queues has been added to the
`vmx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vmx&sektion=4>`__
driver.
`[r264866] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264866>`__

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The FreeBSD?guest operating system must have MSIX enabled as a
prerequisite for multiple queues.

.. raw:: html

   </div>

Support for the ASUS USB-N10 Nano wireless card has been added to the
`urtwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urtwn&sektion=4>`__
driver.
`[r265345] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265345>`__

Transmission checksum offloading has been disabled for the RTL8168C and
RTL8168CP chipsets in the
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4>`__ driver
for TCP and UDP frames. This is due to a report of UDP datagrams with IP
options generating corrupt frames.
`[r266212] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266212>`__

Preliminary support has been added to the
`urtwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urtwn&sektion=4>`__
driver for the Realtek RTL8188EUS and RTL8188ETV chipsets.
`[r266578] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266578>`__

A bug in the fast receiver buffer recycle path has been fixed in the
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4>`__
driver.
`[r267694] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267694>`__

The bundled
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4>`__
firmware for T4 and T5 cards has been updated to version 1.11.27.0.
`[r267849] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267849>`__\ 
(Contributed / provided by Chelsio)

The `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4>`__
driver has been updated to version 7.4.2.
`[r269196] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269196>`__

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4>`__
tunables have been renamed to match their
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
counterparts:
`[r269975] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269975>`__

.. raw:: html

   <div class="informaltable">

+-----------------------------------+--------------------------------+
| Old Name                          | New Name                       |
+===================================+================================+
| ``hw.ixgbe.enable_aim``           | ``hw.ix.enable_aim``           |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.max_interrupt_rate``   | ``hw.ix.max_interrupt_rate``   |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.rx_process_limit``     | ``hw.ix.rx_process_limit``     |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.tx_process_limit``     | ``hw.ix.tx_process_limit``     |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.enable_msix``          | ``hw.ix.enable_msix``          |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.num_queues``           | ``hw.ix.num_queues``           |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.txd``                  | ``hw.ix.txd``                  |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.rxd``                  | ``hw.ix.rxd``                  |
+-----------------------------------+--------------------------------+
| ``hw.ixgbe.unsupported_sfp``      | ``hw.ix.unsupported_sfp``      |
+-----------------------------------+--------------------------------+

.. raw:: html

   </div>

Be sure to update
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
if using the old tunables before upgrading to FreeBSD?10.1-RELEASE.

The
`if\_nf10bmac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_nf10bmac&sektion=4>`__
driver has been merged from FreeBSD-CURRENT to support the NetFPGA-10G
Embedded CPU Ethernet Core.
`[r270061] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270061>`__

The
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4>`__
driver has been updated to support
`netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4>`__
for the T5 10G/40G cards.
`[r270297] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270297>`__

The
`vtnet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vtnet&sektion=4>`__
driver has been updated to support
`netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4>`__.
`[r270509] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270509>`__

The
`urtwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urtwn&sektion=4>`__
driver has been updated to support the ASUS USB-AC51 wireless card.
`[r270514] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270514>`__

The Intel??XL710 ethernet controller driver, ``ixlv(4)``, has been
merged from FreeBSD-CURRENT.
`[r270631] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270631>`__

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

2.2.5.?Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Support for the UDP-Lite protocol (RFC 3828) has been added to the IPv4
and IPv6 stacks.
`[r265946] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265946>`__

A bug in
`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4>`__
that would allow two listening sockets bound to the same port has been
fixed.
`[r267771] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267771>`__

Kernel RPC code, which is a base of NFS server took multiple
optimizations, that significantly improved its performance and SMP
scalability. (Sponsored by iXsystems)

The iSCSI initiator has been updated to support redirection handling
when an iSCSI device is configured with multiple IP addresses across
different network interfaces. Previously, clients connecting to such
iSCSI devices could require additional client-side configuration.
`[r269065] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269065>`__\ 
(Sponsored by The?FreeBSD?Foundation)

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
``kern.iscsi.fail_on_disconnection``, has been added, which allows iSCSI
clients to remove the attached disk device when the connection to the
target is dropped, where previously I/O would stop until the connection
is restored.
`[r265523] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265523>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The iSCSI transmit code has been optimized to coalesce PDUs and avoid
lock contention.
`[r265524] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265524>`__\ 
(Sponsored by The?FreeBSD?Foundation)

Several performance optimizations have been made to the iSCSI subsystem,
including deferring wakeup until enough data has been received to read
or write a file, reducing CPU usage and throughput performance with
large I/O workloads.
`[r265524] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265524>`__\ 
(Sponsored by iXsystems)

Support for hostname- and IP-based access restriction has been added to
the iSCSI
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
daemon.
`[r263720] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263720>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
daemon has been updated to allow overriding the “default”
``portal-group`` configuration.
`[r263725] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263725>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
daemon now includes a new ``auth-group``, “default”, defaulting to
``deny``, which is possible to override.
`[r263726] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263726>`__\ 
(Sponsored by The?FreeBSD?Foundation)

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

2.2.6.?Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__
subsystem has been updated to support I/O direct dispatch. When safety
requirements are met, it enables avoiding passing I/O requests to GEOM
``g_up``/``g_down`` thread, executing them directly in the caller
context, avoiding CPU bottlenecks in ``g_up``/``g_down`` threads, plus
avoid several context switches per I/O.
`[r260385] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260385>`__\ 
(Sponsored by iXsystems)

The
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__
RAID driver has been updated to support unmapped I/O.
`[r260385] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260385>`__\ 
(Sponsored by iXsystems)

The `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4>`__
subsystem has been updated to support finer-grained locking, direct
dispatch and multi-queue, which combined with
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__
direct dispatch, reduces lock congestion and improves SMP scalability of
the SCSI/ATA stack.
`[r260387] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260387>`__\ 
(Sponsored by iXsystems)

The
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
``GEOM_MULTIPATH`` class has been updated to support automatic live
partition resizing.
`[r260478] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260478>`__

The
`virtio\_blk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio_blk&sektion=4>`__
driver has been updated to support unmapped I/O.
`[r260857] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260857>`__

The
`virtio\_scsi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio_scsi&sektion=4>`__
driver has been updated to support unmapped I/O.
`[r260858] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260858>`__

Support for LUN-based CD changers has been removed from the
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4>`__
driver.
`[r264522] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264522>`__

Support for ``BIO_DELETE`` has been added to
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
``zvol`` volumes.
`[r264732] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264732>`__

Support for 9th generation HP host bus adapter cards has been added to
`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4>`__.
`[r264734] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264734>`__

The `mpr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpr&sektion=4>`__
device has been added, providing support for LSI Fusion-MPT 3 12Gb
SCSI/SATA controllers.
`[r265388] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265388>`__\ 
(Sponsored by LSI)

A new ``zvol`` property ``volmode`` and
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
``vfs.zfs.vol.mode`` has been added to allow switching ``zvol`` between
three different ways of exposing it to a user: ``geom``, ``dev`` and
``none``.
`[r265678] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265678>`__

The
`mrsas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mrsas&sektion=4>`__
driver has been added, providing support for LSI MegaRAID SAS
controllers. The
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4>`__
driver will attach to the controller, by default. To enable
`mrsas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mrsas&sektion=4>`__
add ``hw.mfi.mrsas_enable=1`` to ``/boot/loader.conf``, which turns off
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4>`__
device probing.
`[r265922] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265922>`__\ 
(Sponsored by LSI)

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

At this time, the
`mfiutil(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mfiutil&sektion=8>`__
utility and the FreeBSD version of MegaCLI and StorCli do not work with
`mrsas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mrsas&sektion=4>`__.

.. raw:: html

   </div>

Fixed accounting of ``BIO_FLUSH`` operation in
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
``GEOM_DISK`` class
`[r266608] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266608>`__

The
`gstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstat&sektion=8>`__
utility now has an ``-o`` option, to display “other” operations, such as
``BIO_FLUSH``.
`[r266610] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266610>`__

The `mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4>`__
driver has been updated to include support for unmapped I/O.
`[r267084] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267084>`__

The
`hpt27xx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hpt27xx&sektion=4>`__
driver has been updated with various vendor-supplied bug fixes.
`[r267457] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267457>`__

Support for unmapped I/O has been added to the
`xen(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xen&sektion=4>`__
``blkfront`` driver.
`[r270130] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270130>`__\ 
(Sponsored by Citrix Systems R&D)

The
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
``label`` class is now aware of resized partitions. This corrects an
issue where ``geom resize`` would resize the partition, but the label
provider in ``/dev/gptid/`` would not be resized.
`[r259328] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259328>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
utility now has a ``resize`` command, making it easier to resize the
size of a mirror when all of its components have been replaced.
`[r260502] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260502>`__

Support for MegaRAID Fury cards has been added to the
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4>`__
driver.
`[r262967] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262967>`__

The
`aacraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aacraid&sektion=4>`__
driver has been updated to version 3.2.5.
`[r263024] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263024>`__

The ``GEOM_VINUM`` option is now able to be built both directly into the
kernel or as a
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
loadable module.
`[r265536] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265536>`__

The
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
``GEOM_PART`` class has been updated to support automatic partition
resizing. Changes to the partition size are not saved to disk until
``gpart commit`` is run, and prior to saving, can be reverted with
``gpart undo``.
`[r265912] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265912>`__

The
`geom\_uncompress(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom_uncompress&sektion=4>`__
module is built by default which, similar to
`geom\_uzip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom_uzip&sektion=4>`__,
provides support for compressed, read-only disk images.
`[r266220] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266220>`__

Support for the ``disklabel64`` partitioning scheme has been added to
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__.
`[r268091] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268091>`__

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
and
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
tunable, ``kern.geom.part.mbr.enforce_chs`` has been added to the
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
``MBR`` partition class. When set to a non-zero value, ``GEOM_PART_MBR``
will automatically recalculate the user-specified offset and size for
alignment with the disk geometry.
`[r270552] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270552>`__

Many improvements to the CAM Target Layer (CTL): (Sponsored by
iXsystems)

.. raw:: html

   <div class="itemizedlist">

-  Support for ``UNMAP``, ``WRITE         SAME``, ``COMPARE AND WRITE``,
   ``XCOPY`` and some other SCSI commands was added to support VMWare
   VAAI and Microsoft ODX storage acceleration.

-  The ``READ``/``WRITE`` size limitations were removed by supporting
   multiple data moves per command.
   `[r265642] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265642>`__

-  Finer-grained per-LUN locking and multiple worker threads for better
   SMP scapability.
   `[r268556] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268556>`__

-  Memory consumption reduced by several times by disabling some never
   used functionality.
   `[r269297] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269297>`__

-  The maximum number of SCSI ports increased from 32 to 128.
   `[r269298] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269298>`__

-  Improved ``zvol`` integration for better performance.
   `[r269429] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269429>`__

.. raw:: html

   </div>

The
`hptnr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptnr&sektion=4>`__
driver has been updated to version 1.0.1.
`[r270810] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270810>`__\ 
(Contributed / provided by HighPoint)

The
`mrsas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mrsas&sektion=4>`__
driver has been added to the ``GENERIC`` kernel configuration on amd64
and i386 architectures.
`[r271234] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271234>`__

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

2.2.7.?File Systems
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``vfs.zfs.zio.use_uma``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
has been re-enabled. On multi-CPU machines with enough RAM, this can
easily double
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
performance or reduce CPU usage in half. It was originally disabled due
to memory and KVA exhaustion problem reports, which should be resolved
due to several changes in the VM subsystem.
`[r260338] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260338>`__

A new flag, ``-R``, has been added to the
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8>`__
utility. When used,
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8>`__
will restart itself when too many critical errors have been detected.
`[r260178] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260178>`__\ 
(Contributed / provided by Netflix)

The `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystem has been updated to implement “bookmarks”. See
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__ for
further details.
`[r263407] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263407>`__

The `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystem has been updated to allow tuning the minimum “ashift” value
when creating new top-level virtual devices (vdevs). To set the minimum
ashift value, for example when creating a
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__
on “Advanced Format” drives, set the ``vfs.zfs.min_auto_ashift``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
accordingly.
`[r266122] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266122>`__

The ``libzfs`` thread pool API has been imported from OpenSolaris, and
adapted for FreeBSD. This change allows parallel disk scanning, which
can reduce
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__
overall import time in some workloads.
`[r266612] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266612>`__

The
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__
utility has been updated to prevent assertion failures when restoring a
UFS filesystem dump to a ZFS filesystem by writing restored files in
block sizes that are a multiple of 1024.
`[r269651] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269651>`__

Two
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__\ s
have been added to the
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystem:
`[r269774] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269774>`__

.. raw:: html

   <div class="itemizedlist">

-  ``vfs.zfs.mg_fragmentation_threshold``:?The percentage of the
   metaslab group size that should be considered eligible for
   allocation, unless all metaslab groups within the metaslab class have
   also crossed this threshold.

-  ``vfs.zfs.metaslab.fragmentation_threshold``:?The maximum percentage
   of metaslab fragmentation level to keep their active state

.. raw:: html

   </div>

The default
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__ ARC
hash table size has been increased, and a new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
tunable, ``vfs.zfs.arc_average_blocksize``, has been added. Previously,
the hash table could be too small, which would lead to long hash chains
and limit performance for cached reads. The
``vfs.zfs.arc_average_blocksize`` tunable allows overriding the default
block size. The previous default was 65536, and default of the new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
tunable is 8192.
`[r269846] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269846>`__

The Fast File System (FFS) has been updated to support multi-threaded
soft updates. Previously, soft updates were handled by a single thread,
and as of this change, now have one thread per FFS mountpoint.
`[r270157] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270157>`__

The new filesystem automount facility,
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__,
has been merged from FreeBSD-CURRENT. The new
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
facility is similar to that found in other UNIX?-like operating systems,
such as OS?X™ and Solaris™. The
`autofs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=autofs&sektion=5>`__
facility uses a Sun™-compatible
`auto\_master(5) <http://www.FreeBSD.org/cgi/man.cgi?query=auto_master&sektion=5>`__
configuration file, and is administered with the
`automount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automount&sektion=8>`__
userland utility, and the
`automountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=automountd&sektion=8>`__
and
`autounmountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=autounmountd&sektion=8>`__
daemons.
`[r270892] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270892>`__\ 
(Sponsored by The?FreeBSD?Foundation)

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

A new flag is added to
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__,
``-b``, which outputs the existing buses and their parents.
`[r260177] <http://svn.freebsd.org/viewvc/base?view=revision&revision=260177>`__\ 
(Sponsored by Netflix)

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
utility has been updated to rotate files based on the actual file size
instead of the blocks on disk. This matches the behavior documented in
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__.
`[r262075] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262075>`__

The location of the
`rctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rctl&sektion=8>`__
configuration file can now be overridden in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.
To use a non-default location, set ``rctl_rules`` in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
to the location of the file.
`[r262384] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262384>`__

The ATF test suite has been updated to version 0.20. The test suite is
disabled by default in FreeBSD?10.1, and can be enabled by adding
``WITH_TESTS=yes`` to
`src.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=src.conf&sektion=5>`__.
`[r262855] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262855>`__

The ``libucl`` library (Unified Configuration Library) has been merged
from FreeBSD-CURRENT.
`[r263019] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263019>`__

The `pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__
bootstrapping utility has been synced with the version in
FreeBSD-CURRENT.
`[r263020] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263020>`__

The `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
userland utility has been updated to include aliases for ``snapshot``,
which allows use of ``zfs       list -t snap`` and ``zfs       snap``.
`[r263403] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263403>`__

The `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
userland utility has been updated to include a new flag to
``zfs       list``, ``-p``, which when specified, prints the output in a
parsable format.
`[r263405] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263405>`__

The Blowfish password format implementation has been updated. Support
for $2b$ has been added, allowing use of passwords greater than 256
characters long.
`[r263783] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263783>`__

The
`iconv(3) <http://www.FreeBSD.org/cgi/man.cgi?query=iconv&sektion=3>`__
library has been updated to match NetBSD, providing several bug fixes.
`[r264497] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264497>`__

The
`date(1) <http://www.FreeBSD.org/cgi/man.cgi?query=date&sektion=1>`__
utility has been updated to include a new flag, ``-R``, which prints the
date and time output as specified in RFC 2822.
`[r265265] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265265>`__

The `bc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bc&sektion=1>`__
utility has been updated to version 1.1, in sync with the version in
OpenBSD.
`[r265533] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265533>`__

The
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8>`__
utility has been updated to include a new flag, ``-a``, which when
specified, produces a full stack track on the sampled points.
`[r265604] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265604>`__\ 
(Contributed / provided by Netflix)

The
`netstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=8>`__
and
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__
utilities have been updated to include a shorthand equivalent to the
``-f inet`` and ``-f       inet6`` address specifiers, ``-4`` and
``-6``, respectively.
`[r265701] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265701>`__

The
`crypt(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypt&sektion=3>`__
library now defaults to SHA512 for password hashing.
`[r265879] <http://svn.freebsd.org/viewvc/base?view=revision&revision=265879>`__

The
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
utility has been updated to allow forceful configuration reset with the
``-f`` flag. Additionally, a bug that would prevent ``-f`` from properly
creating a
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
configuration has been fixed.
`[r266014] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266014>`__

The
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
file now takes precedence over the shell-specific environment files. In
particular, the ``PATH``, ``BLOCKSIZE`` variables are commented from
``/usr/share/skel/dot.profile``, and the ``path``, ``BLOCKSIZE``, and
``umask`` variables have been commented from
``/usr/share/skel/dot.cshrc``.
`[r266029] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266029>`__

The
`binmiscctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=binmiscctl&sektion=8>`__
userland utility and related image activator features have been merged
from FreeBSD-CURRENT.
`[r266272] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266272>`__

The `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
utility has been updated to include the ``-J`` flag, used to filter
output by matching
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
IDs and names. Additionally, argument ``0`` can be used to ``-J`` to
only list processes running on the host system.
`[r266279] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266279>`__

The `top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
utility has been updated to filter by
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__ ID
or name, in followup to the
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ change
in ``r265229``.
`[r266280] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266280>`__

The
`gstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstat&sektion=8>`__
utility has been updated to include a new flag, ``-o``. When set,
`gstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstat&sektion=8>`__
will display statistics for operations such as ``BIO_FLUSH``.
`[r266610] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266610>`__

The
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__
library has been updated to look for root SSL certificates in
``/usr/local/etc/ssl/`` before ``/etc/ssl/``.
`[r266632] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266632>`__

The
`clang(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang&sektion=1>`__/llvm
suite has been updated to version 3.4.1.
`[r266715] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266715>`__

The Blowfish password format has been changed to $2b$ by default.
`[r266816] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266816>`__

The amount of data collected for
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4>`__
has been updated to work with modern processors and larger amounts of
available memory.
`[r266888] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266888>`__

The
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8>`__
utility has been updated to include a new flag, ``-l``, which ends event
collection after the specified number of seconds.
`[r266890] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266890>`__

The
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
utility has been updated to avoid printing “``/var/tmp/temproot``
disappeared” if there is nothing to compare.
`[r266953] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266953>`__

The FreeBSD installer,
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__,
has been updated to include optional
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__-encrypted
or
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__-mirrored
swap devices when installing onto a full
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystem. Additionally, the parent
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
dataset is now configured with ``lz4`` compression enabled.
`[r267056] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267056>`__

The default
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__
now includes files in the ``/etc/newsyslog.conf.d/`` and
``/usr/local/etc/newsyslog.conf.d/`` directories by default for
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__.
`[r267113] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267113>`__

The
`realpath(1) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=1>`__
utility has been updated to return ``ENOTDIR`` on paths components “.”
and “..” that are not directories, such as ``/dev/null/.`` or
``/dev/null/..``.
`[r267161] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267161>`__

A new flag, “onifconsole” has been added to ``/etc/ttys``. This allows
the system to provide a login prompt via serial console if the device is
an active kernel console, otherwise it is equivalent to ``off``.
`[r267236] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267236>`__

Support for legacy PCI devices has been removed from
`bhyve(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=8>`__.
`[r267341] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267341>`__

The
`bhyve(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=8>`__
userland utility has been updated to include SMBIOS support. A new flag
has been added, ``-U``, which allows specifying the UUID of the guest in
the System Information structure.
`[r267450] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267450>`__

The FreeBSD?Project has migrated from the GNATS bug tracking system to
Bugzilla. The
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
utility used for submitting problem reports has been replaced with a
stub shell script that instructs to use the Bugzilla web interface.
`[r267734] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267734>`__

The
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1>`__
utility has been updated to include a ``--dry-run`` flag, which is
equivalent to ``--check`` and ``-C``.
`[r267747] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267747>`__

A bug in
`bsdgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdgrep&sektion=1>`__
that would prevent patterns from being matched under certain conditions
has been fixed.
`[r267878] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267878>`__

The
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1>`__
utility has been updated to include two new flags, ``-r`` and ``-H``.
When ``-r`` is specified,
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1>`__
will print current resource usage about the process(es). When ``-H`` is
specified,
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1>`__
will print information about threads rather than the process(es).
`[r267979] <http://svn.freebsd.org/viewvc/base?view=revision&revision=267979>`__

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``-H`` flag is currently only used with ``-r`` to display resource
usage for individual threads, rather than the entire process.

.. raw:: html

   </div>

The `sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1>`__
utility has been updated to include a new flag, ``-u``, which enables
unbuffered output when specified.
`[r268019] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268019>`__

The
`mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__
utility has been merged from FreeBSD-CURRENT.
`[r268161] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268161>`__

The
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__
has been updated to include a new ``persist`` command, which allows
issuing ``SCSI PERSISTENT RESERVE       IN`` and
``SCSI PERSISTENT RESERVE       OUT``.
`[r268700] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268700>`__\ 
(Sponsored by Spectra Logic)

The
`gstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstat&sektion=8>`__
utility has been updated to include a new flag, ``-p``, which displays
only physical providers when specified.
`[r268791] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268791>`__

The
`kldstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldstat&sektion=8>`__
utility has been updated to allow ``-q`` to be specified when also
specifying ``-n       module.ko``.
`[r268903] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268903>`__

The
`mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__
utility has been updated to include support for both fixed- and
dynamically-allocated images for the VHD and VMDK formats.
`[r269177] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269177>`__

The
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4>`__
entropy collection script, ``/usr/libexec/save-entropy``, no longer runs
within
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
environments.
`[r269220] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269220>`__

The
`bhyve(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=8>`__
wrapper script, ``/usr/share/examples/bhyve/vmrun.sh``, has been synced
with FreeBSD-CURRENT.
`[r269397] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269397>`__

This update includes:

.. raw:: html

   <div class="itemizedlist">

-  A new flag, ``-e``, has been added, which is used to set
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
   environment variables.

-  A new flag, ``-C``, has been added, which is used to specify the
   guest console device.

-  A new flag, ``-H``, has been added, which is used to pass the host
   path to
   `bhyveload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyveload&sektion=8>`__.

-  Support for multiple disk and
   `tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4>`__
   devices has been added.

-  The ``-I`` flag has been removed.

.. raw:: html

   </div>

The
`nfsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsd&sektion=8>`__
server update to 4.1, adding support for RFC5661, has merged from
FreeBSD-CURRENT.
`[r269398] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269398>`__

[ia64] The serial terminals ``ttyu0`` and ``ttyu1`` have been updated to
``onifconsole`` by default in
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__,
which either can be the serial console, depending on the platform.
`[r269432] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269432>`__

The
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8>`__
utility has been updated to reset ``itimer`` when the maximum number of
packets to send have been reached. This prevents
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8>`__
from exiting when the interval in set to a small value and a low number
of packets to send has been specified.
`[r269800] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269800>`__

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
utility has been updated to support extra
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
arguments for the ``ip4.addr`` and ``ip6.addr`` parameters. This change
allows
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
interfaces to be used within the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.
`[r269805] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269805>`__

Support for generating and compiling USDT DTrace probes has been
improved. DTrace USDT files are now handled similar to
`lex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lex&sektion=1>`__ and
`yacc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yacc&sektion=1>`__
files, meaning support for handling D files as part of the build process
is built into the ``SRCS``
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
environment variable.
`[r269946] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269946>`__

The
`iscsictl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iscsictl&sektion=8>`__
utility has been updated to include a new flag, ``-M``, which allows
modifying the iSCSI session parameters without requiring the session to
be removed and added back.
`[r269968] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269968>`__

The
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8>`__
utility has been updated to support specifying the NFS version as a
``key=value`` pair argument to the ``-o`` flag. For example, to specify
NFS version 4, the syntax to use is ``-o?vers=4``.
`[r270043] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270043>`__

The
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
client socket type has been changed to ``SOCK_SEQPACKET``, providing
sequential packet support.
`[r270242] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270242>`__\ 
(Sponsored by Spectra Logic)

Support for the “account” facility has been added to the
`pam\_group(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_group&sektion=8>`__
module.
`[r270401] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270401>`__

The
`pathchk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pathchk&sektion=1>`__
utility has been updated to ensure bytes greater than or equal to 128
are considered non-portable.
`[r270890] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270890>`__

The `zdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zdb&sektion=8>`__
utility is now included in the set of applications installed in the
``/rescue`` environment, making it possible to examine
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
filesystems when ``/usr`` is unavailable.
`[r270997] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270997>`__\ 
(Contributed / provided by FreeNAS)

Several ``libc`` improvements have been merged from illumos™ and Apple?,
providing better internationalization support and POSIX? compliance.

Support for adding empty partitions has been added to the
`mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__
utility.
`[r271967] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271967>`__

Support for QCOW and QCOW2 disk image formats has been added to the
`mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__
utility.
`[r272819] <http://svn.freebsd.org/viewvc/base?view=revision&revision=272819>`__

The
`mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__
utility has been updated to include three options used to print
information about
`mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__
itself:
`[r273098] <http://svn.freebsd.org/viewvc/base?view=revision&revision=273098>`__

.. raw:: html

   <div class="informaltable">

+-----------------+--------------------------------------------------------------------------------------------------------------------+
| Option          | Output                                                                                                             |
+=================+====================================================================================================================+
| ``--version``   | The current version of the `mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__ utility         |
+-----------------+--------------------------------------------------------------------------------------------------------------------+
| ``--formats``   | The disk image file formats supported by `mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__   |
+-----------------+--------------------------------------------------------------------------------------------------------------------+
| ``--schemes``   | The partition schemes supported by `mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__         |
+-----------------+--------------------------------------------------------------------------------------------------------------------+

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

2.3.1.?\ ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``network.subr``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ script
has been updated to loosen the requirement of listing network aliases in
numeric order. Previously, a network alias of ``_alias2`` would not be
created if ``_alias1`` was not defined.
`[r264438] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264438>`__

The
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__
utility has been updated to check that the
`rc.d(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.d&sektion=8>`__
directory exists before traversing the directory.
`[r268098] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268098>`__

A regression introduced in FreeBSD?10.0-RELEASE that would prevent
proper IPv6 allocation via the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
startup script has been fixed.
`[r259141] <http://svn.freebsd.org/viewvc/base?view=revision&revision=259141>`__

The `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
restriction requiring
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
devices defined in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
to be listed sequentially has been removed.
`[r264438] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264438>`__

The
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
`rc.d(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.d&sektion=8>`__
startup script now generates ``ED25519``
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
host keys if keys do not already exist when ``ssh_keygen_alg()`` is
invoked.
`[r262566] <http://svn.freebsd.org/viewvc/base?view=revision&revision=262566>`__

Support for
`vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__
keyboard maps has been added to the ``syscons``
`rc.d(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.d&sektion=8>`__
startup script.
`[r271095] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271095>`__

Support for subdirectories within ``/etc/rc.conf.d/service``/ has been
added the
`rc.d(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.d&sektion=8>`__.
This allows creating separate configuration files for services such as
``netif``, for example, where each network interface can have a separate
configuration file.
`[r271260] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271260>`__

The default
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__,
``/etc/defaults/rc.conf``, has been updated to include
``/usr/lib32/compat`` in the default ``ld-elf32.so.1`` search path.
`[r272078] <http://svn.freebsd.org/viewvc/base?view=revision&revision=272078>`__

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

2.3.2.?\ ``/etc/periodic`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The daily
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
script ``110.clean-tmps`` has been updated to avoid crossing filesystem
mount boundaries when cleaning files in ``/tmp``.
`[r272430] <http://svn.freebsd.org/viewvc/base?view=revision&revision=272430>`__

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

The `xz(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xz&sektion=1>`__
utility has been updated to a post-5.0.5 snapshot.
`[r263285] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263285>`__

OpenSSH has been updated to version 6.6p1.
`[r264377] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264377>`__

The `nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1>`__
utility has been updated to match the version in OpenBSD 5.5.
`[r264911] <http://svn.freebsd.org/viewvc/base?view=revision&revision=264911>`__

Sendmail has been updated to 8.14.9.
`[r266692] <http://svn.freebsd.org/viewvc/base?view=revision&revision=266692>`__

The
`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1>`__
utility and
`libmagic(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libmagic&sektion=3>`__
library have been updated to 5.19.
`[r268515] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268515>`__

The
`byacc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=byacc&sektion=1>`__
parser has been updated to version 20140422.
`[r268899] <http://svn.freebsd.org/viewvc/base?view=revision&revision=268899>`__

The
`lldb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lldb&sektion=1>`__
debugging library has been updated to the r202189 snapshot.
`[r269024] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269024>`__\ 
(Sponsored by DARPA, AFRL)

The
`unbound(8) <http://www.FreeBSD.org/cgi/man.cgi?query=unbound&sektion=8>`__
caching resolver and ``ldns`` have been updated to version 1.4.22.
`[r269257] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269257>`__

The “lite” version of Subversion included in the FreeBSD?base system and
its dependencies have been updated:
`[r269847] <http://svn.freebsd.org/viewvc/base?view=revision&revision=269847>`__

.. raw:: html

   <div class="itemizedlist">

-  apr has been updated to version 1.5.1.

-  apr-util has been updated to version 1.5.3.

-  serf has been updated to version 1.3.7.

-  svnlite has been updated to version 1.8.10.

.. raw:: html

   </div>

The `nvi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nvi&sektion=1>`__
editor has been update to version 2.1.2-c80f493b038.
`[r270026] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270026>`__

The
`fparseln(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fparseln&sektion=3>`__
library has been updated to version 1.7.
`[r270031] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270031>`__

The lukemftpd FTP server has been removed from the FreeBSD?base system.
`[r270415] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270415>`__

The timezone database has been updated to version tzdata2014f.
`[r270817] <http://svn.freebsd.org/viewvc/base?view=revision&revision=270817>`__

OpenPAM has been updated to Ourouparia (20140912).
`[r271947] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271947>`__

OpenSSL has been updated to version 1.0.1j.
`[r273399] <http://svn.freebsd.org/viewvc/base?view=revision&revision=273399>`__

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

2.5.?Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
package management utility has been updated to version 1.3.8.

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

The
`services.mkdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=services.mkdb&sektion=8>`__
utility has been updated to include endianness awareness, allowing the
``services.db`` database to be created as part of the release build,
regardless of native- or cross-built releases.
`[r263028] <http://svn.freebsd.org/viewvc/base?view=revision&revision=263028>`__

The ``release/`` scripts have been updated to produce UEFI-capable and
BIOS-capable CD-ROM ISOs as well as memory stick images for the
FreeBSD/amd64 architecture.
`[r271470] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271470>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The ``release/scripts/pkg-stage.sh`` script has been updated to include
a symlink to the on-disc version of
`pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__ in
the ``packages/`` structure on the DVD installer. This allows the
`pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__
bootstrap utility to properly locate the ``Latest/pkg.txz`` package on
the DVD when ``REPOS_DIR`` is set to ``/dist/packages/repos``,
eliminating the need for a network connection or explicitly providing
the path to the version included on the DVD installation medium.
`[r271943] <http://svn.freebsd.org/viewvc/base?view=revision&revision=271943>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The FreeBSD?Release Engineering build tools have been updated to provide
support for building virtual machine disk images as part of the release
build process using
`mkimg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkimg&sektion=1>`__.
The disk image formats currently supported include QCOW2, VHD, VMDK, and
raw formats. See
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7>`__
for additional information.
`[r273101] <http://svn.freebsd.org/viewvc/base?view=revision&revision=273101>`__\ 
(Sponsored by The?FreeBSD?Foundation)

The FreeBSD?Release Engineering build tools have been updated to provide
support for building FreeBSD virtual machine disk images for the
Microsoft??Azure cloud hosting platform. This functionality is not
connected directly to the default ``release``
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
target, however can be invoked by specifying the ``vm-azure`` target
directly.
`[r273199] <http://svn.freebsd.org/viewvc/base?view=revision&revision=273199>`__\ 
(Sponsored by The?FreeBSD?Foundation)

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

[amd64,i386] Binary upgrades between RELEASE versions (and snapshots of
the various security branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified ``GENERIC`` kernel distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility requires that the host being upgraded have Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported, according
to the instructions in ``/usr/src/UPDATING``.

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

   </div>

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 10.1-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
