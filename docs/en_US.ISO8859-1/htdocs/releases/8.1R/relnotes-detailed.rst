=================================
FreeBSD 8.1-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 8.1-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2010 The FreeBSD Documentation Project

| $FreeBSD: stable/8/release/doc/en\_US.ISO8859-1/relnotes/article.sgml
  210449 2010-07-24 17:44:31Z hrs $

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

The release notes for FreeBSD 8.1-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 8-STABLE development
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

This document contains the release notes for FreeBSD 8.1-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 8.1-RELEASE is a release distribution. It
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
8.1-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 8.0-RELEASE.

Typical release note items document recent security advisories issued
after 8.0-RELEASE, new drivers or hardware support, new commands or
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

+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                                   | Date           | Topic                                                                                                                                                          |
+============================================================================================================+================+================================================================================================================================================================+
| `SA-09:15.ssl <http://security.freebsd.org/advisories/FreeBSD-SA-09:15.ssl.asc>`__                         | 3 Dec 2009     | SSL protocol flaw                                                                                                                                              |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:16.rtld <http://security.freebsd.org/advisories/FreeBSD-SA-09:16.rtld.asc>`__                       | 3 Dec 2009     | Improper environment sanitization in `rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__                         |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-09:17.freebsd-update <http://security.freebsd.org/advisories/FreeBSD-SA-09:17.freebsd-update.asc>`__   | 3 Dec 2009     | Inappropriate directory permissions in `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__   |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:01.bind <http://security.freebsd.org/advisories/FreeBSD-SA-10:01.bind.asc>`__                       | 6 Jan 2010     | BIND `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__ cache poisoning with DNSSEC validation                |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:02.ntpd <http://security.freebsd.org/advisories/FreeBSD-SA-10:02.ntpd.asc>`__                       | 6 Jan 2010     | ntpd mode 7 denial of service                                                                                                                                  |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:03.zfs <http://security.freebsd.org/advisories/FreeBSD-SA-10:03.zfs.asc>`__                         | 6 Jan 2010     | ZFS ZIL playback with insecure permissions                                                                                                                     |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:04.jail <http://security.freebsd.org/advisories/FreeBSD-SA-10:04.jail.asc>`__                       | 27 May 2010    | Insufficient environment sanitization in `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__                     |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:05.opie <http://security.freebsd.org/advisories/FreeBSD-SA-10:05.opie.asc>`__                       | 27 May 2010    | OPIE off-by-one stack overflow                                                                                                                                 |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:06.nfsclient <http://security.freebsd.org/advisories/FreeBSD-SA-10:06.nfsclient.asc>`__             | 27 May 2010    | Unvalidated input in nfsclient                                                                                                                                 |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-10:07.mbuf <http://security.freebsd.org/advisories/FreeBSD-SA-10:07.mbuf.asc>`__                       | 13 July 2010   | Lost mbuf flag resulting in data corruption                                                                                                                    |
+------------------------------------------------------------------------------------------------------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
debugger has been improved:

-  It now supports ``show ifnets`` and ``show ifnet struct ifnet *``
   commands to print a list of “ifnet \*” of each virtual network stack
   and fields of specified ``fip``, respectively.

-  It now supports ``show all lltables``,
   ``show lltable struct lltable *``, and
   ``show llentry struct llentry *`` commands to print a list of
   “lltable \*” of each virtual network stack, fields of specified
   structures respectively.

-  The ``show mount`` command now prints active string mount options.

-  It now supports ``show vnetrcrs`` command to dump the whole log of
   distinctive ``curvnet`` recursion events.

-  It now supports ``show vnet_sysinit`` and ``show vnet_unsysinit``
   commands to print ordered call lists.

A new kernel thread called “deadlock resolver” has been added. This can
be used to detect possible deadlock by using information of thread state
and heuristic analysis. This is not enabled by default. To enable this,
an option ``option DEADLKRES`` in kernel configuration file and
recompilation of the kernel.

The default
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
rules now expose the upper 256 of
`pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
device nodes.

Two commands to enable/disable read-ahead have been added to
`fcntl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fcntl&sektion=2&manpath=FreeBSD+8.1-RELEASE>`__
system call:

-  ``F_READAHEAD`` specifies the amount for sequential access. The
   amount is specified in bytes and is rounded up to nearest block size.

-  ``F_RDAHEAD`` is a Darwin compatible version that use 128KB as the
   sequential access size.

Note that the read-ahead amount is also limited by sysctl variable
``vfs.read_max``, which may need to be raised in order to better utilize
this feature.

The
`lindev(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lindev&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been added. This is for supporting various Linux-specific
pseudo devices such as ``/dev/full``. Note that this is not included in
``GENERIC`` kernel.

A POSIX function pselect(3) has been reimplemented as a system call
`pselect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=pselect&sektion=2&manpath=FreeBSD+8.1-RELEASE>`__
to eliminate race condition.

A kernel option ``option INCLUDE_CONFIG_FILE`` has been added to
``GENERIC`` kernel by default.

A bug in the
`sched\_4bsd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_4bsd&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
scheduler that the timestamp for the sleeping operation is not cleaned
up on the wakeup has been fixed.

A race condition in the
`sched\_4bsd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_4bsd&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
scheduler has been fixed.

A bug in the
`sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
scheduler which prevented process usage (``%CPU``) from working
correctly has been fixed.

New SDT (Statically Defined Tracing) probes such as ones for
``opencrypto`` and ``vnet`` have been added to FreeBSD
`dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
subsystem.

[powerpc] FreeBSD now supports SMP in PowerPC G5 systems. Note that SMP
support on FreeBSD/powerpc is disabled by default in ``GENERIC`` kernel.

[sparc64] FreeBSD now supports UltraSPARC IV, IV+, and SPARC64 V CPUs.

The
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved. The history buffer can be fully saved/restored
in the VESA mode switching via a loader tunable ``hint.sc.0.vesa_mode``.

A bug in the
`tty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tty&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver that ``TIOCSTI`` did not work has been fixed. This affects
applications like
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__.

[amd64, i386] An x86 real mode emulator based on OpenBSD's x86emu
implementation has been added to improve real mode BIOS call support on
both i386 and amd64. The
`atkbdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbdc&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`dpms(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dpms&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
vesa(4),
`vga(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vga&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now use this emulator and work on the both platforms.

The VIMAGE
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
virtualization container can work with
`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
now. Note that the VIMAGE is not enabled by default in ``GENERIC``
kernel.

The VIMAGE
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
now supports ``ip4.saddrsel``, ``ip4.nosaddrsel``, ``ip6.saddrsel``, and
``ip6.nosaddrsel`` to control whether to use source address selection or
the primary jail address for unbound outgoing connections. The default
value is to use source address selection.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

[pc98] The ``boot2`` bootcode has been reimplemented based on the i386
counterpart. It now supports ELF binary, UFS2 file system, and larger
number of slices.

[ia64] The EFI ``loader`` program now supports a command-line option
``-dev currdev`` to specify the default value of ``currdev``. This
option can be set by the EFI boot manager.

[powerpc] The
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
program now supports U-Boot storage.

[i386] The algorithm the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
uses has been improved to choose a memory range for its heap when using
a range above 1MB. This fixes a symptom that the loader fails to load a
kernel.

A kernel environment variable ``vfs.root.mountfrom`` now supports
multiple elements for root file system in a space-separated list. Each
list element will be tried in order and the first available one will be
mounted.

The ``zfsloader`` has been added. This is a separate
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
enabled loader. Note that a ZFS bootcode (``zfsboot`` or ``gptzfsboot``)
need to be installed to use this new loader.

The ``zfsboot`` and ``gptzfsboot`` bootcode now fully support 64-bit
LBAs for disk addresses. This allows booting from large volumes.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

[powerpc] The ``adb`` driver now supports for interpreting taps on ADB
touchpads as a button click.

The amdsbwd(4) driver for AMD SB600/SB7xx watchdog timer has been added.

[powerpc] The ``apt`` driver for the Apple Touchpad present on MacBook
has been added to ``GENERIC`` kernel.

[sparc64] The epic(4) driver for the front panel LEDs in Sun Fire
V215/V245 has been added.

A bug in the
`ipmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipmi&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver that caused incorrect watchdog timer setting has been fixed.

[sparc64] The
`pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports a JBus to PCIe bridge (called as “Fire”) found in
the Sun Fire V215/V245 and Sun Ultra 25/45 machines.

[powerpc] The
`smu(4) <http://www.FreeBSD.org/cgi/man.cgi?query=smu&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now provides thermal management and monitoring features. This
allows fan control and thermal monitoring on SMU-based Apple G5
machines, as well as an
`led(4) <http://www.FreeBSD.org/cgi/man.cgi?query=led&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
interface to control the sleep LED.

The
`tnt4882(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tnt4882&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver for IEEE-488 (GPIB) bus now supports National Instruments TNT5004
chip.

The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports NetMos NM9865 family of Serial/Parallel ports.

The
`uep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uep&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver for USB onscreen touch panel from eGalax has been added. This
driver is supported by ``x11-drivers/xf86-input-egalax``.

A bug in the
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver that can allow to send a zero length packet has been fixed.

The
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
subsystem now reports
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
``notify`` events with the device properties instead of ``attach``
events. The following is an example entry of
`devd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devd.conf&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
to match a
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
device with a SCSI subclass and BBB protocol:

.. code:: PROGRAMLISTING

    notify 100 {
        match "system"      "USB";
        match "subsystem"   "INTERFACE";
        match "type"        "ATTACH";
        match "intclass"    "0x08";
        match "intsubclass" "0x06";
        match "intprotocol" "0x50";
        action "/path/to/command -flag";
    };

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The
`acpi\_video(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_video&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports LCD brightness control notify handler.

The
`acpi\_sony(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_sony&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
helper driver now supports default display brightness, wired LAN power,
and bass gain.

The
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved. It includes a fix for aperture size
calculation issue which prevents some graphics cards from working.

The
`snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now allows AD1981HD codecs to use playback mixer.

The
`snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports multichannel (4.0 and 7.1) playback support. The 5.1
mode support is disabled now due to unidentified synchronization
problem. Devices which supports the 7.1 mode can handle the 5.1
operation via software upmix done by
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__.
Note that stereo stream is no longer duplicated to all ports.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports Atheros AR9285-based devices.

A bug in the
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver which causes a problem of AR5416-based chipsets including AR9285
has been fixed.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports BCM5761, BCM5784, and BCM57780-based devices.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports TSO (TCP Segmentation Offloading) on BCM5755 or
newer controllers.

A long-standing bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver which was related to ASF heartbeat sending has been fixed.

A long-standing stability issue of the
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
and
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver due to a hardware bug in its DMA handling when the system has
more than 4GB memory has been fixed. This applies to BCM5714, BCM5715,
and BCM5708 controllers.

A bug in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver that incorrectly enabled TSO on BCM5754/BCM5754M controllers has
been fixed.

A bug in the
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been fixed. The MTU was set based on the firstly-added member
even if the addition failed.

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports ``SIOCSIFMTU`` ioctl. For example,
``ifconfig bridge0 mtu 1280`` can change the MTU of ``bridge0`` to
``1280``. Changing the MTU is allowed only when all members have the
same MTU value.

The
`bwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bwn&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver for Broadcom BCM43xx chipsets has been added.

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been updated to T3 firmware 7.8.0.

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports hardware filtering based on inspection of L2/L3/L4
headers. Filtering based on source IP address, destination IP address,
source port number, destination port number, 802.1q VLAN frame tag, UDP,
TCP, and MAC address is possible. The configuration can be done by the
cxgbtool(8) utility. Note that cxgbtool(8) is in
``src/usr.sbin/cxgbtool`` but not compiled by default.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been updated to version 7.0.5.

The et(4) driver now supports MSI and Tx checksum offloading of IPv4,
TCP, and UDP.

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now exports the hardware MAC statistics via sysctl variables.

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been updated to version 1.9.5.

The
`iwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwn&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been updated. This includes various improvements and bugfixes
regarding RF switch, bgscan support, suspend/resume support, locking
issue, and more. The line ``device iwnfw`` in the kernel configuration
file will include all firmware images.

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been updated to version 2.2.0.

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved:

-  It now supports Marvell Yukon 88E8042, 88E8057, 88E8059 (Yukon
   Optima) devices and DGE-560SX (Yukon XL).

-  A rudimentary interrupt moderation with programmable countdown timer
   register has been implemented. The default parameter of the holdoff
   time is 100us and this can be changed via sysctl variable
   ``dev.mskc.0.int_holdoff``. Note that the interrupt moderation is
   shared resource on a dual-port controllers and it is impossible to
   use separate interrupt moderation values for each port.

-  A stability issue has been fixed. A heavy RX traffic while rebooting
   is in progress could prevent the system from working.

The
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been updated to firmware version 1.4.50 from Myricom.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver no longer performs an unnecessary interface up/down during
getting IP address via DHCP.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now uses ``2048`` as PCIe Maximum Read Request Size. This
improves bulk transfer performance.

The
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver for Ralink RT2700U/RT2800U/RT3000U USB 802.11agn devices has been
added.

The sge(4) driver for Silicon Integrated Systems SiS190/191 Fast/Gigabit
Ethernet has been added. This supports TSO and TSO over VLAN.

The
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved:

-  The DMA handling has been improved.

-  Wake-On-LAN is now supported.

-  Unnecessary reinitialization of the interfaces has been eliminated.

-  RX interrupt moderation with single shot timer has been implemented.
   The default parameter of the moderation time is 150us and this can be
   changed via sysctl variable ``dev.ste.0.int_rx_mod``. Setting it 0
   effectively disables the RX interrupt moderation feature.

The tsec(4) driver now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__.

The
`u3g(4) <http://www.FreeBSD.org/cgi/man.cgi?query=u3g&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved and now works with ZTE MF636, Option Gi0322,
Globetrotter GE40x, and Novatel MC950D.

The
`uhso(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhso&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver for Option HSDPA USB devices has been added. A new
`uhsoctl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uhsoctl&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
userland utility can be used to initiate and close the WAN connection.

The
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved:

-  The DMA handling has been improved.

-  Wake-On-LAN is now supported.

-  Unnecessary reinitialization of the interfaces has been eliminated.

-  Hardware MAC statistics are now supported via sysctl variables
   ``dev.vge.0.stats``.

-  Interrupt moderation with single shot timer and scheme supported by
   VT61xx controllers have been implemented. The default parameters are
   tuned to generate interrupt less than 8k per second, and these
   parameters can be changed via sysctl variables
   ``dev.vge.0.int_holdoff``, ``dev.vge.0.rx_coal_pkt``, and
   ``dev.vge.0.tx_coal_pkt``. Note that an up/down cycle is needed to
   make a parameter change take effect.

The
`urtw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urtw&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved and now supports RTL8187B-based devices.

The FreeBSD Xen netfront driver has been improved in stability and
performance.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD flowtable now supports IPv6. This is for per-CPU caching flows
as a means of accelerating L3 and L2 lookups as well as providing
stateful load balancing when ECMP (Equal-Cost Multi-Path routing) is
enabled by ``option RADIX_MPATH``.

A new capability flag ``LINKSTATE`` has been added to
``struct ifnet.if_capabilities``. This indicates if the interface can
check the link state or not. The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now shows this flag if supported.

A new event handler ``iflladdr_event`` has been added. This signals that
the L2 address on an interface has changed, and lets stacked interfaces
such as
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
detect that their lower interface has changed and adjust things in order
to keep working. This fixes an issue of
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
and
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
configuration.

IPcomp (IP Payload Compression Protocol defined in RFC 2393) protocol is
now enabled by default. Note that this requires ``option IPSEC`` in the
kernel configuration file and ``GENERIC`` kernel does not include it.
This functionality can be disabled by using a sysctl variable
``net.inet.ipcomp.ipcomp_enable``.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
subsystem including
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
has been updated to “ipfw3” and various bugs have been fixed:

-  The major enhancement is a completely restructured version of
   `dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   with support for different packet scheduling algorithms (loadable at
   runtime), faster queue/pipe lookup, and a much cleaner internal
   architecture and kernel/userland ABI which simplifies future
   extensions.

-  All of O(N) sequences in the firewall rule evaluation removed from
   the kernel critical sections. The worst case is now O(log N).

-  It now supports ``ipfw0`` pseudo interface for logging similar to
   `pflog(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pflog&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__.
   A sysctl ``net.inet.ip.fw.verbose=0`` enables logging to ``ipfw0``,
   and ``net.inet.ip.fw.verbose=1`` sends logging to
   `syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
   as before.

-  The ``me`` keyword in the
   `ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   rule now matches any IPv6 addresses configured on an interface as
   well as IPv4 ones.

-  A bug that ``keep-alive`` rule did not work for IPv6 packets has been
   fixed.

-  The ``lookup`` match option has been added.

   .. code:: PROGRAMLISTING

       lookup {dst-ip|src-ip|dst-port|src-port|uid|jail} N

   This searches the specified field in table ``N`` and sets
   ``tablearg`` accordingly. With ``dst-ip`` or ``src-ip`` the option
   replicates two existing options. When used with other arguments, the
   option can be useful to quickly dispatch traffic based on other
   fields.

-  A bug in the
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
   variable ``ip.fw.one_pass`` handling has been fixed. A packet which
   comes from a pipe without being delayed incorrectly ignored this
   variable.

A memory alignment issue in the
`ng\_ksocket(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ksocket&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
and
`ng\_ppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ppp&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
Netgraph node drivers have been fixed. This fixes kernel panics due to
the misalignment.

The
`ng\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bridge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
and
`ng\_hub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hub&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
Netgraph node drivers now supports a flag ``persistent``. It disables
automatic node shutdown when the last hook gets disconnected. The new
control messages ``NGM_BRIDGE_SET_PERSISTENT`` and
``NGM_HUB_SET_PERSISTENT`` have been added for the flag.

The
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
subsystem now supports ``sloppy`` keyword to enable a TCP state machine
for tracking TCP connections with no sequence number check. This feature
is in the latest version of **pf**.

The
`pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9&manpath=FreeBSD+8.1-RELEASE>`__
framework for packet filtering in FreeBSD kernel now supports separate
packet filtering instances like
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
for each VIMAGE jail.

A bug that proxy ARP entries cannot be added over point-to-point link
types has been fixed.

The
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
pseudo interface now reports the link state properly by updating
``if_link_state`` variable in the kernel.

The
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
pseudo interface has been added to ``GENERIC`` kernel.

The
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
pseudo interface now supports TSO (TCP Segmentation Offloading). The
capability flag is named as ``IFCAP_VLAN_HWTSO`` and it is separated
from ``IFCAP_VLAN_HWTAGGING``. The
`age(4) <http://www.FreeBSD.org/cgi/man.cgi?query=age&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`ale(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ale&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
and
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver support this feature.

The
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
pseudo interface for IEEE 802.1Q VLAN now ignore renaming of the
parent's interface name. The configured VLAN interfaces continue to work
with the new name while previously the configurations were removed as
the renaming happens.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ada(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ada&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports ``BIO_DELETE``. For SSDs this uses ``TRIM`` feature
of ``DATA SET MANAGEMENT`` command, as defined by ACS-2 specification
working draft. For Compact Flash use ``CFA ERASE`` command, same as
`ad(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ad&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
does. This change realizes restoring write speed of SSDs which supports
``TRIM`` command by doing ``newfs -E /dev/ada1``, for example.

The
`ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports SATA part of Marvell 88SE912x controllers.

The
`ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports FIS-based (Frame Information Structure) switching of
port multiplier on supported controllers.

The
`ahd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahd&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now supports three separated error counters for correctable,
uncorrectable, and fatal, in
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
MIB.

A new kernel option ``option ATA_CAM`` has been added. This turns
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
controller drivers into
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
interface modules. When enabled, this option deprecates all
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
peripheral drivers and interfaces such as ``ad`` and ``acd``, and allows
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
drivers ``ada``, and ``cd`` and interfaces to be natively used instead.
Note that this is not enabled by default in the ``GENERIC`` kernel.

A bug in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver which can lead to interrupt storms and command timeouts has been
fixed.

USB mass storage device support in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been removed. Note that this was not used in ``GENERIC``
kernel and the
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver supports such devices for a long time.

FreeBSD
`cam(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
SCSI framework has been improved:

-  SATA and PATA support has been improved and it now recognizes more
   detail device capabilities. For example, the
   `ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   and
   `siis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=siis&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   driver now reports maximum tag number to the framework to optimize
   the NCQ handling.

-  A loader tunable ``kern.cam.boot_delay`` has been added. This
   controls the delay time before
   `cam(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
   probes the attached devices.

-  SCSI error recovery for devices on buses without automatic sense
   reporting has been improved. Typical devices are on ATAPI and USB.
   For example, this allows
   `cam(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
   to wait, while CD drive loads disk, instead of immediately return
   error status.

-  The
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   ATA transport layer now supports Power-Up In Stand-by (PUIS). The
   PUIS is a configuration of SATA or PATA drives to prevent them from
   automatic spin-up when power is applied. A typical application is
   staggered spin-up.

-  The
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   ATA transport layer now supports negotiating and enabling additional
   SATA features such as device initiated power management, Automatic
   Partial to Slumber mode transition, and DMA auto-activation.

A livelock issue of the
`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver under a high load has been fixed.

A bug in the
`fdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdc&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver which prevents the kernel module from unloading has been fixed.

The
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
now supports the following sysctl variables for each label type to
enable the labeling itself:

.. code:: PROGRAMLISTING

    kern.geom.label.ext2fs.enable
    kern.geom.label.iso9660.enable
    kern.geom.label.msdosfs.enable
    kern.geom.label.ntfs.enable
    kern.geom.label.reiserfs.enable
    kern.geom.label.ufs.enable
    kern.geom.label.ufsid.enable
    kern.geom.label.gptid.enable
    kern.geom.label.gpt.enable

Note that all of them are also loader tunables. They are enabled (set as
``1``) by default.

`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
providers including complex ones such as
`gconcat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gconcat&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
`graid3(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid3&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
`gstripe(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstripe&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
and some hardware RAID device drivers like
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
now inform its optimal access block size to the upper layer.

The
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports ``configure -p priority`` command to change the
providers priority.

The balancing mode algorithm ``load`` used in the
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility has been changed and it is now the default one instead of
``split``:

-  Instead of measuring last request execution time for each drive and
   choosing one with smallest time, use averaged number of requests,
   running on each drive. This information is more accurate and timely.
   It allows to distribute load between drives in more even and
   predictable way.

-  For each drive track offset of the last submitted request. If new
   request offset matches previous one or close for some drive, prefer
   that drive. It allows to significantly speedup simultaneous
   sequential reads.

The
`gmultipath(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmultipath&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports ``destroy``, ``rotate``, ``getactive`` commands.

A bug in the
`graid3(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid3&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
which causes a panic when a large request arrives has been fixed. This
happens when ``MAXPHYS`` is set as larger than 128k.

The default block size of
`gstripe(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstripe&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
has been increased from 4k to 64k.

The ``GEOM_SCHED`` module has been added. This supports scheduling disk
I/O requests in a device independent manner. A supported algorithm is an
anticipatory scheduler ``gsched_rr`` which gives very nice performance
improvements in presence of competing random access patterns. See also
`gsched(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gsched&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
manual page for more details.

The HAST (Highly Available STorage) framework has been added:

-  This is a framework to allow transparently storing data on two
   physically separated machines connected over the TCP/IP network. HAST
   works in Primary-Secondary (Master-Backup, Master-Slave)
   configuration, which means that only one of the cluster nodes can be
   active at any given time. Only Primary node is able to handle I/O
   requests to HAST-managed devices. Currently HAST is limited to two
   cluster nodes in total.

-  This operates on block level; it provides disk-like devices in
   ``/dev/hast/`` directory for use by file systems and/or applications.
   Working on block level makes it transparent for file systems and
   applications. There in no difference between using HAST-provided
   device and raw disk, partition, etc. All of them are just regular
   `geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
   providers in FreeBSD.

-  The userland part consists of
   `hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
   `hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
   and
   `hast.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hast.conf&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__.
   More details can be found at http://wiki.FreeBSD.org/HAST.

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been improved in stability.

The
`mvs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mvs&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
CAM ATA driver for Marvell 88SX50XX/88SX60XX/88SX70XX/SoC SATA
controllers has been added. This driver supports same hardware as the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver does, but provides many additional features, such as NCQ and PMP.

The
`siis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=siis&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver now enables MSI by default on SiI3124-based devices. This can be
disabled by using a ``hint.siis.0.msi`` loader tunable.

The Max Read Request Size in the
`siis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=siis&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver for PCIe chips has been increased from 512 to 1024 bytes for
better performance.

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
driver has been updated to the latest version from LSI.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The
`msdosfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=msdosfs&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
subsystem is now MP-safe and a race condition when a force unmount
happens has been fixed.

FreeBSD NFS subsystem now supports a timeout for the negative name cache
entries in the client. This avoids a bogus negative name cache entry
from persisting forever when another client creates an entry with the
same name within the same NFS server time of day clock tick. The mount
option ``negnametimeo`` can be used to override the default timeout
interval (60 seconds) on a per-mount-point basis. a Setting
``negnametimeo`` to ``0`` disables negative name caching for the mount
point.

A race condition in FreeBSD NFS subsystem that occurs when
`nfsiod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsiod&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
threads are being created has been fixed. This also fixes an
interoperability issue found in combination of a FreeBSD NFS client and
a Linux NFS server.

The inode number handling in
`ffs(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ffs&sektion=7&manpath=FreeBSD+8.1-RELEASE>`__
file system is now unsigned. Previously some large inode numbers can be
treated as negative, and this issue shows up at file systems with the
size of more than 16Tb in 16k block case. The
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility never create a file system with more than 2^32 inodes by cutting
back on the number of inodes per cylinder group if necessary to stay
under the limit.

The UFS file system
(`ffs(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ffs&sektion=7&manpath=FreeBSD+8.1-RELEASE>`__)
now supports NFSv4 ACL.

FreeBSD
`VFS(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VFS&sektion=9&manpath=FreeBSD+8.1-RELEASE>`__
subsystem now supports a new sysctl variable
``vfs.vlru_allow_cache_src``. This allow ``vnlru`` kernel thread to
reclaim of the directory vnodes that are source of the namecache
records. This is not enabled by default because for typical workload it
would make namecache unusable, but large nested directory tree easily
puts any process that accesses file system into one second wait for
``vnlru`` kernel thread.

The ZFS file system has been improved:

-  It now supports NFSv4 ACL.

-  The L2ARC code has been improved in stability and performance.

-  The zpool version has been updated to version 14. It is now possible
   to use zpools created on OpenSolaris 2009.06.

-  A sysctl variable ``vfs.zfs.txg.write_limit_override`` has been
   added. This can be used for tuning of ZFS write throttling.

-  ZFS prefetch statistics has been added as a sysctl variable
   ``kstat.zfs.misc.zfetchstats``.

-  The
   `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
   ``zpool export`` command now supports ``-F`` flag. When exporting
   with this flag, ``zpool.cache`` remains untouched.

-  A data corruption issue of ``zfs send/receive`` between two different
   platforms has been fixed. Symbolic links could be broken in the
   previous releases.

-  A possible deadlock of ``zfs receive`` has been fixed.

-  Possible panics of ``zfs destroy`` and ``zfs rollback`` have been
   fixed.

-  A occasional failure of ``zfs rename`` due to a busy state has been
   fixed.

-  Bugs that ``zfs snapshot -r`` fails when the file system is busy, and
   ``zfs receive`` can fail with an E2BIG error, have been fixed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

A bug in
`bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
program which leads to high CPU consumption on a loaded system has been
fixed.

A bug in
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility which prevented it from working with multi-session bzip2 files
has been fixed.

The
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a ``-v`` flag in the subcommand ``identify``. It
displays whole of identify data block.

The
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports ``-d`` and ``-f`` flags in the subcommand ``cmd``.
They specify DMA protocol or FPDMA (NCQ) protocol to be used for ATA
command, respectively.

The
`chgrp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chgrp&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
and
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
now support a ``-x`` flag to make it not traverse across multiple mount
points for the recursive operation.

The
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
now supports a ``-x`` flag to make it not traverse across multiple mount
points for the recursive operation.

The
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
and
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utilities now support NFSv4 ACL.

The
`diskinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=diskinfo&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
now supports reporting disk stripe size and offset. This helps users to
make file systems optimally aligned and tuned for better performance.

A bug in
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility which can crash the program has been fixed.

A bug in
`factor(6) <http://www.FreeBSD.org/cgi/man.cgi?query=factor&sektion=6&manpath=FreeBSD+8.1-RELEASE>`__
utility which leads to performance degradation has been fixed.

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports HTTP digest authentication.

A bug in
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility which incorrectly evaluates a variable ``NO_PROXY`` has been
fixed.

A bug in
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility has been fixed. An option ``-newerXB`` was interpreted as the
same as ``-newerXm``.

A bug in the
`fnmatch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fnmatch&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
function has been fixed. The flag ``FNM_PERIOD`` did not work correctly
when ``*`` characters were included in the string and ``FNM_PATHNAME``
was specified.

A bug in the
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility which causes the last cylinder group of a UFS1 file system is
always reported as broken even after it is fixed.

The
`gcore(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcore&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now recognizes threads in the process and handles dumps on a
thread scope.

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports manipulation of NDP flags handled by
`ndp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndp&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__.

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a ``description value`` command to add a
description ``value`` to the specified interface.

The
`indent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=indent&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a ``-ta`` flag to treat all ``_t``-suffixed
identifiers as types.

The ``liblzma`` library for LZMA2 lossless data compression algorithm
and the userland utilities
`xz(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xz&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
`xzdec(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xzdec&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
`lzma(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lzma&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
and
`lzmainfo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lzmainfo&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__.
has been imported. When the old system is upgraded to 8.1-RELEASE,
deinstalling a version found in the Ports Collection (``archivers/xz``)
and recompilation of the packages which depend on it may be required.

[amd64, i386] The ``libz`` library has been improved in performance. For
FreeBSD/i386, note that this improvement uses instructions only on
i686-class CPU and they are disabled by default. Specifying
``CPUTYPE=pentium4`` in ``/etc/make.conf`` enables them.

The
`ln(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ln&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now reports an error correctly when a ``-f`` flag and two same
file entries were specified in the command line option. It removed the
file first and then reported a “not found” error.

The
`ln(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ln&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now removes trailing slash characters when creating a link to a
directory. The following command sequence reported an error in the
previous releases:

.. code:: SCREEN

    % mkdir test1 test2
    % ln -s ../test2/ test1

The
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports ``[ipaddr``]:\ ``path`` notation in addition to the
existing one. This allows IPv6 address in the address field, and a path
including “\ ``:``\ ” to be mounted.

A bug in the
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility that prevents ``netstat -f netgraph`` from working has been
fixed.

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports ARP information in statistics shown by the ``-s``
flag.

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a ``-q number`` option to specify the number of
outputs. This is used in conjunction with ``-w`` option.

The
`newfs\_msdos(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs_msdos&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now uses ``NO_NAME`` as the default volume label and ``BSD4.4``
as the OEM String.

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility does not consider non-existence of a PID file as an error now. A
new flag ``-P`` reverts it to the old behavior.

The
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
program no longer tries to bind to an IPv6 anycast address.

The
`pam\_krb5(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_krb5&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
PAM module now supports ``no_user_check`` option. This allows to
authorize a user not known to the local system.

The
`pathchk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pathchk&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a ``-P`` flag defined in POSIX-1.2008. This checks
for empty pathnames and components starting with “\ ``-``\ ”.

A variable ``daily_clean_tmps_ignore`` which is used in the
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
daily script now has ``/tmp/.snap``. This prevents ``/tmp/.snap`` from
being removed.

The
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports two new flags ``-i`` and ``-j`` to display
information about signal disposition and pending/blocked status for
signals.

The
`pwait(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pwait&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility has been added. This is similar to the Solaris utility of the
same name, and waits for any process to terminate.

A bug in the
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility which caused short reads when a option ``-P`` was used has been
fixed.

The
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
``-a`` flag now excludes the interfaces which IPv6 or accepting ICMPv6
Router Advertisement message is disabled from the auto-probed interface
list.

The
`scandir(3) <http://www.FreeBSD.org/cgi/man.cgi?query=scandir&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
and
`alphasort(3) <http://www.FreeBSD.org/cgi/man.cgi?query=alphasort&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
functions has been updated to conform POSIX.1-2008 (IEEE Std
1003.1-2008).

The
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a ``-r`` flag which means exactly the same as a
``-E`` flag. This is for compatibility with the GNU version.

The service name database
`services(5) <http://www.FreeBSD.org/cgi/man.cgi?query=services&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
(usually in ``/etc/services``) now also supports a
`db(3) <http://www.FreeBSD.org/cgi/man.cgi?query=db&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
style database for better lookup performance. The following entry in
``/etc/nsswitch.conf`` enables use of the binary database file:

.. code:: PROGRAMLISTING

    services: db

Note that the
`db(3) <http://www.FreeBSD.org/cgi/man.cgi?query=db&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
style database can be created by
`services\_mkdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=services_mkdb&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
at ``/var/db/service.db``.

The
`sighold(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sighold&sektion=2&manpath=FreeBSD+8.1-RELEASE>`__,
`sigignore(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sigignore&sektion=2&manpath=FreeBSD+8.1-RELEASE>`__,
`sigpause(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sigpause&sektion=2&manpath=FreeBSD+8.1-RELEASE>`__,
`sigrelse(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sigrelse&sektion=2&manpath=FreeBSD+8.1-RELEASE>`__,
and
`sigset(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sigset&sektion=2&manpath=FreeBSD+8.1-RELEASE>`__
functions have been implemented for making porting software from System
V-like systems easy. Note that these are defined in POSIX.1-2008 XSI
(IEEE Std 1003.1-2008, X/Open System Interface) but now obsolete. Since
FreeBSD already has another ``sigpause(3)`` function derived from
4.2BSD, a version of the XSI interface is implemented as
``xsi_sigpause()``.

The
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__,
and
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
programs now set ``MADV_PROTECT`` memory flag onto themselves to protect
from being terminated by the FreeBSD kernel when available memory
becomes short. This kind of process termination happens in a
swap-intensive workload.

The
`stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports ``%Sf`` output specifier to display the file flags
symbolically.

The
`strsignal(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strsignal&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
function is now thread-safe.

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a ``-i`` flag to ignore failures while retrieving
individual OIDs. This allows the same list of OIDs to be passed to
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
across different systems where particular OIDs may not exist, and still
get as much information as possible from them.

The
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now performs source address selection correctly even in a VIMAGE
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
environment.

The
`unifdef(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unifdef&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility has been updated to version 1.188. It now supports a new ``-B``
flag to compress blank lines around a deleted section to prevent blank
lines around paragraphs of code from getting doubled.

The
`unzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unzip&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports the rename query when a file with the same name as
the one about to be extracted already exists.

The
`unzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unzip&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports ``-C``, ``-c``, ``-f``, ``-p``, and ``-v`` flags
which are compatible with Info-ZIP.

The
`usbconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbconfig&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports a new flag ``-d`` to specify the
`ugen(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ugen&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
device, and ``add_quirk`` and ``remove_quirk`` commands.

The
`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
utility now supports searching IPv6 addresses just like IPv4 without
specifying the ARIN server. A ``-d`` flag has been removed because it is
now obsolete.

A new errno ``ENOTCAPABLE`` has been added. This is to be returned when
a process requests an operation on a file descriptor that is not
authorized by the descriptor's capability flags.

The
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
command now supports a new flag ``receive -u`` to specify that the
received ZFS should not be mounted automatically.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
command has been added. This provides an easy command-line interface to
the ``rc.d`` system.

The ``rc.d/ipfw`` script and ``/etc/rc.firewall`` now supports IPv6 and
``rc.d/ip6fw`` script and ``/etc/rc.firewall6`` are obsolete. Note that
``ipv6_firewall_*`` variables in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
are replaced with ``firewall_client_net_ipv6``,
``firewall_simple_iif_ipv6``, ``firewall_simple_inet_ipv6``,
``firewall_simple_oif_ipv6``, ``firewall_simple_onet_ipv6``.

A new ``rc.d`` script ``rc.d/rtsold`` has been added. This handles
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
daemon.

A new ``rc.d`` script ``rc.d/static_arp`` has been added. This allows
the administrator to statically define mappings of MAC address to IPv4
at boot time. See also the
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
manual page for more details.

The ``rc.d/tmp`` script now uses a unique directory name prefixed with
``/tmp/.diskless`` instead of ``/tmp/.diskless`` itself. This fixes an
issue when ``/tmp/.diskless`` exists before the script runs.

A new ``rc.d`` script ``rc.d/ubthidhci`` has been added. This small
script calls
`usbconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbconfig&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
to change a USB Bluetooth controller from HID mode to HCI mode.

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
now supports a ``firewall_coscripts`` variable. This should contain a
list of commands which should be executed after firewall starts or
stops.

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+8.1-RELEASE>`__
now supports configuring
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
interfaces as child devices similar to
`wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
interfaces.
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
interfaces are listed via a new ``vlans_IF`` variable. If a VLAN
interface is a number, then that number is treated as the VLAN tag for
the interface and the interface will be named ``IF.tag``. Otherwise, the
VLAN tag must be provided via a VLAN parameter in a ``create_args_IF``
variable.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

The **ACPI-CA** has been updated to 20100304.

The **awk** has been updated from the 23 October 2007 release to the 26
November 2009 release.

**ISC BIND** has been updated to version 9.6.2-P2.

**netcat** has been updated to version 4.7.

**OpenSSH** has been updated from version 5.1p1 to version 5.4p1.

**OpenSSL** has been updated to version 0.9.8n.

**sendmail** has been updated to version 8.14.4.

The timezone database has been updated to the **tzdata2010j** release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The filename of ISO images for FreeBSD releases now has a ``FreeBSD-``
at the beginning.

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated to 2.28.2.

The supported version of the **KDE** desktop environment
(```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
has been updated to 4.4.3.

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
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC kernel distributed as a part of
an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
utility requires that the host being upgraded has Internet connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
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
