==========================================
FreeBSD/sparc64 5.2-RELEASE Hardware Notes
==========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/sparc64 5.2-RELEASE Hardware Notes
==========================================

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Table of Contents**
1 `Introduction <#INTRO>`__
2 `Supported Systems <#SUPPORT-SYS>`__
2.1 `Fully Supported Systems <#AEN25>`__
2.2 `Partially Supported Systems <#AEN75>`__
2.3 `Unsupported Systems <#AEN87>`__
3 `Supported Devices <#SUPPORT>`__
3.1 `Disk Controllers <#AEN103>`__
3.2 `Ethernet Interfaces <#ETHERNET>`__
3.3 `FDDI Interfaces <#AEN824>`__
3.4 `ATM Interfaces <#AEN834>`__
3.5 `Wireless Network Interfaces <#AEN853>`__
3.6 `Miscellaneous Networks <#AEN879>`__
3.7 `ISDN Interfaces <#AEN902>`__
3.8 `Serial Interfaces <#AEN966>`__
3.9 `Audio Devices <#AEN1139>`__
3.10 `Camera and Video Capture Devices <#AEN1261>`__
3.11 `USB Devices <#USB>`__
3.12 `IEEE 1394 (Firewire) Devices <#FIREWIRE>`__
3.13 `Bluetooth Devices <#BLUETOOTH>`__
3.14 `Cryptographic Accelerators <#AEN1489>`__
3.15 `Miscellaneous <#AEN1507>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the hardware compatibility notes for FreeBSD
5.2-RELEASE on the UltraSPARC hardware platform (also referred to as
FreeBSD/sparc64 5.2-RELEASE). It lists devices known to work on this
platform, as well as some notes on boot-time kernel customization that
may be useful when attempting to configure support for new devices.

.. raw:: html

   <div class="NOTE">

    **Note:** This document includes information specific to the
    UltraSPARC hardware platform. Versions of the hardware compatibility
    notes for other architectures will differ in some details.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Supported Systems
-------------------

This section describes the systems currently known to be supported by
FreeBSD on the UltraSPARC platform. For background information on the
various hardware designs see the `Sun System
Handbook <http://sunsolve.sun.com/handbook_pub/>`__.

SMP is supported on all systems with more than 1 processor.

If you have a system that is not listed here, it may not have been
tested with FreeBSD 5.2-RELEASE. We encourage you to try it and send a
note to the `FreeBSD SPARC porting mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-sparc64>`__ with
your results, including which devices work and which do not.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Fully Supported Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following systems are fully supported by FreeBSD.

-  Blade 100

-  Blade 150

-  Enterprise 220R

-  Enterprise 250

-  Enterprise 420R

-  Enterprise 450

-  Fire V100

-  Fire V120

-  Netra t1 105

-  Netra T1 AC200/DC200

-  Netra t 1100

-  Netra t 1120

-  Netra t 1125

-  Netra t 1400/1405

-  Netra 120

-  Netra X1

-  SPARCEngine Ultra AXi

-  SPARCEngine Ultra AXmp

-  Ultra 5

-  Ultra 10

-  Ultra 30

-  Ultra 60

-  Ultra 80

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Partially Supported Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following systems are partially supported by FreeBSD. In particular
the onboard scsi controller in sbus systems is not supported.

-  Enterprise 3500

-  Enterprise 4500

-  Ultra 1 Enterprise (1E for short)

-  Ultra 2

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Unsupported Systems
~~~~~~~~~~~~~~~~~~~~~~~

The following systems are not supported by FreeBSD. This may be due to
lack of processor support (UltraSPARC III), due to a quirk in the system
design that makes FreeBSD unstable, or due to lack of support for
sufficient onboard devices to make FreeBSD generally useful.

-  All systems containing UltraSPARC III processor(s).

-  Ultra 1

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Supported Devices
-------------------

$FreeBSD: src/release/doc/en\_US.ISO8859-1/hardware/common/dev.sgml,v
1.209 2003/12/07 00:54:22 bmah Exp $
This section describes the devices currently known to be supported by
with FreeBSD on the UltraSPARC platform. Other configurations may also
work, but simply have not been tested yet. Feedback, updates, and
corrections to this list are encouraged.

Where possible, the drivers applicable to each device or class of
devices is listed. If the driver in question has a manual page in the
FreeBSD base distribution (most should), it is referenced here.
Information on specific models of supported devices, controllers, etc.
can be found in the manual pages.

.. raw:: html

   <div class="NOTE">

    **Note:** Lists of specific, supported devices are gradually being
    removed from this document in order to reduce the amount of
    duplicated (and potentially out-of-date) information contained
    within. When this process is complete, the manual page for each
    driver should be consulted for the authoritative list of devices
    supported that particular driver.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.1 Disk Controllers
~~~~~~~~~~~~~~~~~~~~

IDE/ATA controllers
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

Adaptec AIC-7770, AIC-7850, AIC-7860, AIC-7870, AIC-7880, and AIC789x
based SCSI host adapters
(`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Ultra-320 SCSI controllers based on the Adaptec AIC7901, AIC7901A, and
AIC7902 Ultra320 controller chips
(`ahd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

LSI/Symbios (formerly NCR) 53C8XX and 53C10XX PCI SCSI controllers,
either embedded on motherboard or on add-on boards
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

Qlogic controllers and variants
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

LSI Logic Fusion/MP architecture Fiber Channel controllers
(`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

With all supported SCSI controllers, full support is provided for
SCSI-I, SCSI-II, and SCSI-III peripherals, including hard disks, optical
disks, tape drives (including DAT, 8mm Exabyte, Mammoth, and DLT),
medium changers, processor target devices and CD-ROM drives. WORM
devices that support CD-ROM commands are supported for read-only access
by the CD-ROM drivers (such as
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__).
WORM/CD-R/CD-RW writing support is provided by
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__,
which is a part of the
```sysutils/cdrtools`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
port in the Ports Collection.

The following CD-ROM type systems are supported at this time:

-  SCSI interface (also includes ProAudio Spectrum and SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)

-  ATAPI IDE interface
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2 Ethernet Interfaces
~~~~~~~~~~~~~~~~~~~~~~~

RealTek 8129/8139 Fast Ethernet NICs
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

DEC/Intel 21143 Fast Ethernet NICs and clones for PCI, MiniPCI, and
CardBus
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Intel 82557-, 82258-, 82559-, 82550- or 82562-based Fast Ethernet NICs
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server and Dual-Port Server Adapters

3Com Etherlink XL-based NICs
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Sun HME and QFE Ethernet NICs
(`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Sun GEM (Gigabit Ethernet) and ERI (Fast Ethernet) NICs
(`gem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gem&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3 FDDI Interfaces
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4 ATM Interfaces
~~~~~~~~~~~~~~~~~~

FORE Systems, Inc. PCA-200E ATM PCI Adapters (hfa and
`fatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

FORE Systems, Inc. HE155 and HE622 ATM interfaces
(`hatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.5 Wireless Network Interfaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.6 Miscellaneous Networks
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.7 ISDN Interfaces
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.8 Serial Interfaces
~~~~~~~~~~~~~~~~~~~~~

Serial ports based on the SAB82532 serial chip, console only
(`sab(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sab&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Serial ports based on the Zilog 8530 dual uart, console only (zs driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9 Audio Devices
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10 Camera and Video Capture Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.11 USB Devices
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.12 IEEE 1394 (Firewire) Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Host Controllers
(`fwohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwohci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Serial Bus Protocol 2 (SBP-2) storage devices
(`sbp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.13 Bluetooth Devices
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.14 Cryptographic Accelerators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.15 Miscellaneous
~~~~~~~~~~~~~~~~~~

OpenFirmware console (ofwcons driver)

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
