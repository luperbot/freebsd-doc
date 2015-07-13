=======================================
FreeBSD/ia64 5.1-RELEASE Hardware Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/ia64 5.1-RELEASE Hardware Notes
=======================================

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 by The FreeBSD Documentation Project

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Table of Contents**
1 `Introduction <#INTRO>`__
2 `Supported Processors and Motherboards <#PROC-IA64>`__
2.1 `Supported Devices Overview <#AEN38>`__
3 `Supported Devices <#SUPPORT>`__
3.1 `Disk Controllers <#AEN92>`__
3.2 `Ethernet Interfaces <#ETHERNET>`__
3.3 `FDDI Interfaces <#AEN1658>`__
3.4 `ATM Interfaces <#AEN1668>`__
3.5 `Wireless Network Interfaces <#AEN1712>`__
3.6 `Miscellaneous Networks <#AEN1840>`__
3.7 `ISDN Interfaces <#AEN1871>`__
3.8 `Serial Interfaces <#AEN1935>`__
3.9 `Audio Devices <#AEN2130>`__
3.10 `Camera and Video Capture Devices <#AEN2253>`__
3.11 `USB Devices <#USB>`__
3.12 `IEEE 1394 (Firewire) Devices <#FIREWIRE>`__
3.13 `Bluetooth Devices <#BLUETOOTH>`__
3.14 `Cryptographic Accelerators <#AEN2633>`__
3.15 `Miscellaneous <#AEN2658>`__

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This is a preliminary document. It is incomplete, and in need of
    additional content. Please send additional information on IA-64
    processors, motherboards, and various devices working on FreeBSD to
    the `FreeBSD IA64 porting mailing
    list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ia64>`__.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This document contains the hardware compatibility notes for FreeBSD
5.1-RELEASE on the IA-64 hardware platform (also referred to as
FreeBSD/ia64 5.1-RELEASE). It lists devices known to work on this
platform, as well as some notes on boot-time kernel customization that
may be useful when attempting to configure support for new devices.

.. raw:: html

   <div class="NOTE">

    **Note:** This document includes information specific to the IA-64
    hardware platform. Versions of the hardware compatibility notes for
    other architectures will differ in some details.

.. raw:: html

   </div>

More information on FreeBSD/ia64 is contained on the `FreeBSD/ia64
Project <http://www.FreeBSD.org/platforms/ia64/index.html>`__ page.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Supported Processors and Motherboards
=======================================

Currently supported processors are the
`Itanium <http://www.intel.com/design/itanium/itanium/index.htm>`__ and
the `Itanium 2 <http://www.intel.com/design/itanium2/index.htm>`__.

Supported chipsets include:

-  HP zx1 (only on development branch, see the `Perforce
   repository <http://perforce.FreeBSD.org/>`__)

-  HP i2000

-  Intel 460GX

-  Intel E8870

Both Uniprocessor (UP) and Symmetric Multi-processor (SMP)
configurations are under active development. At this time, SMP-enabled
systems are considered less stable. The current priorities are UP fixes
to improve stability.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Supported Devices Overview
------------------------------

This section contains additional information about what devices may or
may not be supported by FreeBSD/ia64.

Except for the PC chipset embedded
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.1-release>`__
controllers, most should work out of the box. Eventually, all
ia64-compatible ATA controllers are expected to be fully supported.
Refer to the following sections for various disk controllers and their
current status.

In general, \`\`PC standard'' serial ports supported by the
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
driver are expected to work on Intel legacy machines, but not PA legacy
machines. The reason is that all devices on HP machines are
memory-mapped and there is *no* ISA device support other than the PCI
dictated VGA legacy.

In addition to
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
devices, the following devices fail on non-Intel legacy machines (but
should work on boxes with an Intel legacy) because their drivers make
ISA-specific assumptions that do not hold:

.. raw:: html

   <div class="INFORMALTABLE">

+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------+
| `sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__                                                                                                        | No support for memory-mapped I/O    |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------+
| `syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+5.1-release>`__                                                                                                | Expect BIOS, VGA probes, etc.       |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------+
| `pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.1-release>`__                                                                                                        | Probes MSS ISA ports *ad nauseum*   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------+
| `atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+5.1-release>`__, `psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.1-release>`__   | Fixed ISA port locations            |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Supported Devices
===================

$FreeBSD: src/release/doc/en\_US.ISO8859-1/hardware/common/dev.sgml,v
1.157 2003/05/30 11:24:00 nyan Exp $
This section describes the devices currently known to be supported by
with FreeBSD on the IA-64 platform. Other configurations may also work,
but simply have not been tested yet. Feedback, updates, and corrections
to this list are encouraged.

Where possible, the drivers applicable to each device or class of
devices is listed. If the driver in question has a manual page in the
FreeBSD base distribution (most should), it is referenced here.

.. raw:: html

   <div class="SECT2">

--------------

3.1 Disk Controllers
--------------------

IDE/ATA controllers
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

-  Acard ATP850 UDMA2, ATP860 UDMA4, ATP865 UDMA6

-  AMD 756 ATA66, 766 ATA100, 768 ATA100

-  Cenatek Rocket Drive

-  CMD 646, 648 ATA66, and 649 ATA100

-  Cypress 82C693

-  Cyrix 5530 ATA33

-  HighPoint HPT366 ATA66, HPT370 ATA100, HPT372 ATA133, HPT374 ATA133

-  Intel PIIX, PIIX3, PIIX4

-  Intel ICH ATA66, ICH2 ATA100, ICH3 ATA100, ICH4 ATA100

-  nVidia nForce ATA100, nForce2 ATA133

-  Promise ATA100 OEM chip (pdc20265)

-  Promise ATA133 OEM chip (pdc20269)

-  Promise Fasttrak-33, -66, -100, -100 TX2/TX4, -133 TX2/TX2000

-  Promise SATA150 TX2/TX4 Serial ATA/150

-  Promise Ultra-33, -66, -100, -133 TX2/TX2000/TX4000

-  ServerWorks ROSB4 ATA33

-  ServerWorks CSB5 and CSB6 ATA66/ATA100

-  Sil 0680 UDMA6

-  SiS 530, 540, 550, 620

-  SiS 630, 630S, 633, 635, 640, 645, 645DX, 648, 650, 651, 652, 655,
   658, 730, 733, 735, 740, 745, 746, 748, 750, 751, 752, 755

-  SiS 5591 ATA100

-  VIA 82C586 ATA33, 82C596 ATA66, 82C686a ATA66, 82C686b ATA100

-  VIA 8233, 8235 ATA133

Qlogic controllers and variants
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

-  Qlogic 1020, 1040 SCSI and Ultra SCSI host adapters

-  Qlogic 1240 dual Ultra SCSI controllers

-  Qlogic 1080 Ultra2 LVD and 1280 Dual Ultra2 LVD controllers

-  Qlogic 12160 Ultra3 LVD controllers

-  Qlogic 2100 and Qlogic 2200 Fibre Channel SCSI controllers

-  Qlogic 2300 and Qlogic 2312 2-Gigabit Fibre Channel SCSI controllers

-  Performance Technology SBS440 ISP1000 variants

-  Performance Technology SBS450 ISP1040 variants

-  Performance Technology SBS470 ISP2100 variants

-  Antares Microsystems P-0033 ISP2100 variants

LSI Logic Fusion/MP architecture Fiber Channel controllers (mpt driver)

-  LSI 53c1020, 53c1030

With all supported SCSI controllers, full support is provided for
SCSI-I, SCSI-II, and SCSI-III peripherals, including hard disks, optical
disks, tape drives (including DAT, 8mm Exabyte, Mammoth, and DLT),
medium changers, processor target devices and CD-ROM drives. WORM
devices that support CD-ROM commands are supported for read-only access
by the CD-ROM drivers (such as
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.1-release>`__).
WORM/CD-R/CD-RW writing support is provided by
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__,
which is a part of the
```sysutils/cdrtools`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
port in the Ports Collection.

The following CD-ROM type systems are supported at this time:

-  SCSI interface (also includes ProAudio Spectrum and SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.1-release>`__)

-  ATAPI IDE interface
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.1-release>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2 Ethernet Interfaces
-----------------------

Intel 82557-, 82258-, 82559-, 82550- or 82562-based Fast Ethernet NICs
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel InBusiness 10/100 PCI Network Adapter

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server and Dual-Port Server Adapters

-  On-board Ethernet NICs on many Intel motherboards.

Gigabit Ethernet NICs based on the Broadcom BCM570x
(`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

-  3Com 3c996-SX, 3c996-T

-  Netgear GA302T

-  SysKonnect SK-9D21 and 9D41

Gigabit Ethernet NICs based on the Intel 82542 and 82543 controller
chips
(`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+5.1-release>`__
and
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.1-release>`__
drivers), plus NICs supported by the Intel 82540EM, 82544, 82545EM, and
82546EB controller chips
(`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.1-release>`__
driver only)

-  Intel PRO/1000 Gigabit Ethernet

.. raw:: html

   <div class="NOTE">

    **Note:** The
    `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.1-release>`__
    driver is officially supported by Intel, but is only supported on
    the i386.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3 FDDI Interfaces
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4 ATM Interfaces
------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.5 Wireless Network Interfaces
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.6 Miscellaneous Networks
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.7 ISDN Interfaces
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.8 Serial Interfaces
---------------------

\`\`PC standard'' 8250, 16450, and 16550-based serial ports
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

PCI-Based multi-port serial boards
(`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

-  Diva Serial (GSP) Multiport UART (development branch only)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9 Audio Devices
-----------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10 Camera and Video Capture Devices
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.11 USB Devices
----------------

Host Controllers
(`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+5.1-release>`__
and
`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+5.1-release>`__
drivers)

-  UHCI or OHCI compliant motherboard chipsets (no exceptions known)

USB 2.0 controllers using the EHCI interface
(`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.12 IEEE 1394 (Firewire) Devices
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.13 Bluetooth Devices
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.14 Cryptographic Accelerators
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.15 Miscellaneous
------------------

VGA-compatible video cards
(`vga(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vga&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** Information regarding specific video cards and
    compatibility with **XFree86** can be found at
    http://www.xfree86.org/.

.. raw:: html

   </div>

Keyboards including:

-  PS/2 keyboards
   (`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+5.1-release>`__
   driver)

Pointing devices including:

-  PS/2 mice and compatible devices, including many laptop pointing
   devices
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.1-release>`__
   driver)

-  Serial mice and compatible devices

.. raw:: html

   <div class="NOTE">

    **Note:**
    `moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+5.1-release>`__
    has more information on using pointing devices with FreeBSD.
    Information on using pointing devices with **XFree86** can be found
    at http://www.xfree86.org/.

.. raw:: html

   </div>

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

All users of FreeBSD 5-CURRENT should subscribe to the
<current@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
