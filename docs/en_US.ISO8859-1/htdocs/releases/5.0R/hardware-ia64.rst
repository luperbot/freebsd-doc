=======================================
FreeBSD/ia64 5.0-RELEASE Hardware Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/ia64 5.0-RELEASE Hardware Notes
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
3 `Supported Devices <#SUPPORT>`__
3.1 `Disk Controllers <#AEN27>`__
3.2 `Ethernet Interfaces <#ETHERNET>`__
3.3 `FDDI Interfaces <#AEN1521>`__
3.4 `ATM Interfaces <#AEN1531>`__
3.5 `Wireless Network Interfaces <#AEN1573>`__
3.6 `Miscellaneous Networks <#AEN1701>`__
3.7 `ISDN Interfaces <#AEN1722>`__
3.8 `Serial Interfaces <#AEN1786>`__
3.9 `Audio Devices <#AEN1946>`__
3.10 `Camera and Video Capture Devices <#AEN2072>`__
3.11 `USB Devices <#USB>`__
3.12 `IEEE 1394 (Firewire) Devices <#FIREWIRE>`__
3.13 `Bluetooth Devices <#BLUETOOTH>`__
3.14 `Cryptographic Accelerators <#AEN2371>`__
3.15 `Miscellaneous <#AEN2396>`__

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document is in a very preliminary state. It is incomplete, and
    is almost certainly not be an accurate reflection of reality.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This document contains the hardware compatibility notes for FreeBSD
5.0-RELEASE on the IA-64 hardware platform (also referred to as
FreeBSD/ia64 5.0-RELEASE). It lists devices known to work on this
platform, as well as some notes on boot-time kernel customization that
may be useful when attempting to configure support for new devices.

.. raw:: html

   <div class="NOTE">

    **Note:** This document includes information specific to the IA-64
    hardware platform. Versions of the hardware compatibility notes for
    other architectures will differ in some details.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Supported Processors and Motherboards
=======================================

Need to write this section.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Supported Devices
===================

$FreeBSD: src/release/doc/en\_US.ISO8859-1/hardware/common/dev.sgml,v
1.119.2.3 2003/01/14 18:12:50 roam Exp $
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
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
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

-  nVidia nForce ATA100

-  Promise ATA100 OEM chip (pdc20265)

-  Promise ATA133 OEM chip (pdc20269)

-  Promise Fasttrak-33, -66, -100, -100 TX2/TX4, -133 TX2/TX2000

-  Promise Ultra-33, -66, -100, -133 TX2/TX2000

-  ServerWorks ROSB4 ATA33

-  ServerWorks CSB5 ATA66/ATA100

-  Sil 0680 UDMA6

-  SiS 530, 540, 620

-  SiS 630, 633, 635, 645, 730, 733, 735, 740, 745, 750

-  SiS 5591 ATA100

-  VIA 82C586 ATA33, 82C596 ATA66, 82C686a ATA66, 82C686b ATA100

-  VIA 8233, 8235 ATA133

Qlogic controllers and variants
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
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

With all supported SCSI controllers, full support is provided for
SCSI-I, SCSI-II, and SCSI-III peripherals, including hard disks, optical
disks, tape drives (including DAT, 8mm Exabyte, Mammoth, and DLT),
medium changers, processor target devices and CD-ROM drives. WORM
devices that support CD-ROM commands are supported for read-only access
by the CD-ROM drivers (such as
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__).
WORM/CD-R/CD-RW writing support is provided by
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__,
which is a part of the
```sysutils/cdrtools`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
port in the Ports Collection.

The following CD-ROM type systems are supported at this time:

-  SCSI interface (also includes ProAudio Spectrum and SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__)

-  ATAPI IDE interface
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2 Ethernet Interfaces
-----------------------

Intel 82557-, 82258-, 82559-, 82550- or 82562-based Fast Ethernet NICs
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
driver)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel InBusiness 10/100 PCI Network Adapter

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server and Dual-Port Server Adapters

-  On-board Ethernet NICs on many Intel motherboards.

Gigabit Ethernet NICs based on the Broadcom BCM570x
(`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
driver)

-  3Com 3c996-SX, 3c996-T

-  Netgear GA302T

-  SysKonnect SK-9D21 and 9D41

-  Integrated gigabit Ethernet NICs on DELL PowerEdge 2550 servers

-  Integrated gigabit Ethernet NICs on IBM x235 servers

Gigabit Ethernet NICs based on the Intel 82542 and 82543 controller
chips
(`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
and
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
drivers), plus NICs supported by the Intel 82540EM, 82544, 82545EM, and
82546EB controller chips
(`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
driver only)

-  Intel PRO/1000 Gigabit Ethernet

.. raw:: html

   <div class="NOTE">

    **Note:** The
    `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
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
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
driver)

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

Keyboards including:

-  PS/2 keyboards

Mice including:

-  PS/2 mice
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.0-RELEASE>`__
   driver)

-  Serial mice

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

|
