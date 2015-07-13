=======================================
FreeBSD/pc98 5.2-RELEASE Hardware Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 5.2-RELEASE Hardware Notes
=======================================

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
3 `Supported Devices <#SUPPORT>`__
3.1 `Disk Controllers <#AEN34>`__
3.2 `Ethernet Interfaces <#ETHERNET>`__
3.3 `FDDI Interfaces <#AEN755>`__
3.4 `ATM Interfaces <#AEN765>`__
3.5 `Wireless Network Interfaces <#AEN784>`__
3.6 `Miscellaneous Networks <#AEN810>`__
3.7 `ISDN Interfaces <#AEN833>`__
3.8 `Serial Interfaces <#AEN897>`__
3.9 `Audio Devices <#AEN1070>`__
3.10 `Camera and Video Capture Devices <#AEN1192>`__
3.11 `USB Devices <#USB>`__
3.12 `IEEE 1394 (Firewire) Devices <#FIREWIRE>`__
3.13 `Bluetooth Devices <#BLUETOOTH>`__
3.14 `Cryptographic Accelerators <#AEN1420>`__
3.15 `Miscellaneous <#AEN1438>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the hardware compatibility notes for FreeBSD
5.2-RELEASE on the NEC PC-98x1 hardware platform (also referred to as
FreeBSD/pc98 5.2-RELEASE). It lists devices known to work on this
platform, as well as some notes on boot-time kernel customization that
may be useful when attempting to configure support for new devices.

.. raw:: html

   <div class="NOTE">

    **Note:** This document includes information specific to the NEC
    PC-98x1 hardware platform. Versions of the hardware compatibility
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

NEC PC-9801/9821 series with almost all i386-compatible processors,
including 80386, 80486, Pentium, Pentium Pro, Pentium II, and variants.
All i386-compatible processors by AMD, Cyrix, IBM, and IDT are also
supported.

NEC FC-9801/9821 series, and NEC SV-98 series (both of them are
compatible with PC-9801/9821 series) should be supported.

EPSON PC-386/486/586 series, which are compatible with NEC PC-9801
series are supported.

High-resolution mode is not supported. NEC PC-98XA/XL/RL/XL^2, and NEC
PC-H98 series are supported in normal (PC-9801 compatible) mode only.

Although there are some multi-processor systems (such as Rs20/B20),
SMP-related features of FreeBSD are not supported yet.

PC-9801/9821 standard bus (called C-Bus), PC-9801NOTE expansion bus
(110pin), and PCI bus are supported. New Extend Standard Architecture
(NESA) bus (used in PC-H98, SV-H98, and FC-H98 series) is not supported.

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
with FreeBSD on the NEC PC-98x1 platform. Other configurations may also
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

IDE/ATA controllers (wdc driver)

-  On-board IDE controller

Adaptec AIC-6260 and AIC-6360 based boards
(`aic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aic&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Adaptec AIC-7770, AIC-7850, AIC-7860, AIC-7870, AIC-7880, and AIC789x
based SCSI host adapters
(`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

NEC PC-9801-55, 92 and their compatible C-Bus SCSI interfaces (ct
driver)

-  NEC PC-9801-55, 92 and their compatibles

   ICM IF-2660

   Midori-Denshi MDC-554NA

   Logitec LHA-N151

   .. raw:: html

      <div class="NOTE">

       **Note:** flags 0x00000 is necessary in kernel configuration for
       DMA transfer mode.

   .. raw:: html

      </div>

-  I-O DATA SC-98II

   .. raw:: html

      <div class="NOTE">

       **Note:** flags 0x10000 is necessary in kernel configuration for
       DMA transfer mode.

   .. raw:: html

      </div>

-  TEXA HA-55BS2 and later

   Midori-Denshi MDC-926Rs

   .. raw:: html

      <div class="NOTE">

       **Note:** flags 0x20000 is necessary in kernel configuration for
       Bus-master transfer mode.

   .. raw:: html

      </div>

-  ELECOM Bus-master SCSI interfaces

   .. raw:: html

      <div class="NOTE">

       **Note:** flags 0x30000 is necessary in kernel configuration for
       Bus-master transfer mode.

   .. raw:: html

      </div>

-  All SMIT transfer type SCSI interfaces

   .. raw:: html

      <div class="NOTE">

       **Note:** flags 0x40000 is necessary in kernel configuration for
       SMIT transfer mode.

   .. raw:: html

      </div>

-  Logitec LHA-20x series

   ICM IF-2766, IF-2766ET, IF-2767 and IF-2769

   .. raw:: html

      <div class="NOTE">

       **Note:** flags 0x50000 is necessary in kernel configuration for
       Bus-master transfer mode.

   .. raw:: html

      </div>

NEC PC-9801-55, 92 and their compatible C-Bus SCSI interfaces (bs
driver)

-  NEC PC-9801-55, 92 and their compatibles

   ICM IF-2660

   Midori-Denshi MDC-554NA

   Logitec LHA-N151

   .. raw:: html

      <div class="NOTE">

       **Note:** "flags 0x00000" is necessary in kernel configuration
       for DMA transfer mode.

   .. raw:: html

      </div>

-  I-O DATA SC-98II

   .. raw:: html

      <div class="NOTE">

       **Note:** "flags 0x10000" is necessary in kernel configuration
       for DMA transfer mode.

   .. raw:: html

      </div>

-  TEXA HA-55BS2 and later

   Midori-Denshi MDC-926Rs

   .. raw:: html

      <div class="NOTE">

       **Note:** "flags 0x20000" is necessary in kernel configuration
       for Bus-master transfer mode.

   .. raw:: html

      </div>

-  ELECOM Bus-master SCSI interfaces

   .. raw:: html

      <div class="NOTE">

       **Note:** "flags 0x30000" is necessary in kernel configuration
       for Bus-master transfer mode.

   .. raw:: html

      </div>

-  All SMIT transfer type SCSI interfaces

   .. raw:: html

      <div class="NOTE">

       **Note:** "flags 0x40000" is necessary in kernel configuration
       for SMIT transfer mode.

   .. raw:: html

      </div>

-  Logitec LHA-20x series

   ICM IF-2766, IF-2766ET, IF-2767 and IF-2769

   .. raw:: html

      <div class="NOTE">

       **Note:** "flags 0x50000" is necessary in kernel configuration
       for Bus-master transfer mode.

   .. raw:: html

      </div>

AdvanSys SCSI controllers (all models,
`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`adw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

-  MELCO IFC-USP, RATOC REX-PCI30 and @Nifty FNECHARD IFC-USUP-TX
   (`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

LSI/Symbios (formerly NCR) 53C8XX and 53C10XX PCI SCSI controllers,
either embedded on motherboard or on add-on boards
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

NCR 53C500 based PC-Card SCSI host adapters
(`ncv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

TMC 18C30, 18C50 and 36C70 (AIC-6820) based ISA/PC-Card SCSI host
adapters
(`stg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stg&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Qlogic controllers and variants
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Tekram DC390 and DC390T controllers, maybe other cards based on the AMD
53c974 as well
(`amd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  MELCO IFC-DP

Workbit Ninja SCSI-3 based PC-Card SCSI host adapters
(`nsp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nsp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

Adaptec Duralink PCI Fast Ethernet adapters based on the Adaptec
AIC-6915 Fast Ethernet controller chip
(`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Alteon Networks PCI Gigabit Ethernet NICs based on the Tigon 1 and Tigon
2 chipsets
(`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

AMD PCnet NICs
(`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

-  Contec C-NET(98)S

-  PCI NIC using AMD AM79C97x (PCnet-PCI/Fast)

-  NEC SV-98/2-B05, B06 (PCI)

-  Allied-Telesis LA-PCI (PCI)

SMC 83c17x (EPIC)-based Ethernet NICs
(`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

National Semiconductor DS8390-based Ethernet NICs, including Novell
NE2000 and clones
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** In kernel configuration, you need to set flag for non-PCI
    device.

.. raw:: html

   </div>

-  Novell NE1000, NE2000, and NE2100

-  RealTek 8029

-  I-O DATA ET2/T-PCI

-  MELCO LGY-PCI-TR

-  PLANEX ENW-8300-T

-  Allied Telesis LA-98 (flags 0x000000)

-  Corega Ether98-T (flags 0x000000)

-  SMC EtherEZ98 (flags 0x000000)

-  ELECOM LD-BDN, LD-NW801G (flags 0x200000)

-  PLANEX EN-2298-C (flags 0x200000)

-  MELCO EGY-98 (flags 0x300000)

-  Contec C-NET(98)E-A, C-NET(98)L-A, C-NET(98)P (flags 0x300000)

-  MELCO LGY-98, LGH-98, IND-SP, IND-SS, LGY-98-N (110pin) (flags
   0x400000)

-  MACNICA NE2098 (flags 0x400000)

-  ICM IF-2766ET, IF-2771ET, AD-ET2-T, DT-ET-25, DT-ET-T5, NB-ET-T
   (110pin) (flags 0x500000)

-  D-Link DE-298, DE-298P (flags 0x500000)

-  ELECOM LD-98P (flags 0x500000)

-  PLANEX EN-2298-T, EN-2298P-T (flags 0x500000)

-  Allied Telesis SIC-98, SIU-98, SIC-98NOTE (110pin) (flags 0x600000)

-  Allied Telesis SIU-98-D (flags 0x610000)

-  NEC PC-9801-107, 108 (flags 0x800000)

-  I-O DATA LA/T-98, LA/T-98SB, LA2/T-98, ET/T-98 (flags 0x900000)

-  MACNICA ME98 (flags 0x900000)

-  Kansai KLA-98C/T (flags 0x900000)

-  NEC PC-9801-77, 78 (flags 0x910000)

-  Contec C-NET(98), RT-1007(98), C-NET(9N) (110pin) (flags 0xa00000)

-  Contec C-NET(98)E, C-NET(98)L, C-NET(9N)L (110pin) (flags 0xb00000)

-  Logitec LAN-98T (flags 0xb00000)

-  Networld 98X3 (flags 0xd00000)

-  Accton EN1644(old model), EN1646(old model), EN2203(old model)
   (110pin) (flags 0xd00000)

-  Networld EC-98X, EP-98X (flags 0xd10000)

NE2000 compatible PC-Card (PCMCIA) Ethernet and FastEthernet cards
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  AR-P500 Ethernet

-  Accton EN2212/EN2216/UE2216

-  Allied Telesis CentreCOM LA100-PCM\_V2

-  AmbiCom 10BaseT card

-  BayNetworks NETGEAR FA410TXC Fast Ethernet

-  CNet BC40 adapter

-  COREGA Ether PCC-T/EtherII PCC-T/FEther PCC-TXF/PCC-TXD

-  Compex Net-A adapter

-  CyQ've ELA-010

-  D-Link DE-650/660

-  Danpex EN-6200P2

-  Elecom Laneed LD-CDL/TX, LD-CDF, LD-CDS, LD-10/100CD, LD-CDWA
   (DP83902A), MACNICA Ethernet ME1 for JEIDA

-  IO DATA PCLATE

-  IBM Creditcard Ethernet I/II

-  IC-CARD Ethernet/IC-CARD+ Ethernet

-  Kingston KNE-PC2, KNE-PCM/x Ethernet

-  Linksys EC2T/PCMPC100/PCM100, PCMLM56, EtherFast 10/100 PC Card,
   Combo PCMCIA Ethernet Card (PCMPC100 V2)

-  MELCO LPC-T/LPC2-T/LPC2-CLT/LPC2-TX/LPC3-TX/LPC3-CLX

-  NDC Ethernet Instant-Link

-  National Semiconductor InfoMover NE4100

-  NetGear FA-410TX

-  Network Everywhere Ethernet 10BaseT PC Card

-  Planex FNW-3600-T

-  Socket LP-E

-  Surecom EtherPerfect EP-427

-  TDK LAK-CD031,Grey Cell GCS2000 Ethernet Card

-  Telecom Device SuperSocket RE450T

RealTek 8129/8139 Fast Ethernet NICs
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Winbond W89C840F Fast Ethernet NICs
(`wb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

VIA Technologies VT3043 \`\`Rhine I'', VT86C100A \`\`Rhine II'', and
VT6105/VT6105M \`\`Rhine III'' Fast Ethernet NICs
(`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Silicon Integrated Systems SiS 900 and SiS 7016 PCI Fast Ethernet NICs
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

National Semiconductor DP83815 Fast Ethernet NICs
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

National Semiconductor DP83820 and DP83821 Gigabit Ethernet NICs
(`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Sundance Technologies ST201 PCI Fast Ethernet NICs
(`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

SysKonnect SK-984x PCI Gigabit Ethernet cards
(`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Texas Instruments ThunderLAN PCI NICs
(`tl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

DEC/Intel 21143 Fast Ethernet NICs and clones for PCI, MiniPCI, and
CardBus
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

ADMtek Inc. AN986-based USB Ethernet NICs
(`aue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

CATC USB-EL1210A-based USB Ethernet NICs
(`cue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Kawasaki LSI KU5KUSB101B-based USB Ethernet NICs
(`kue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

ASIX Electronics AX88172-based USB Ethernet NICs
(`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

RealTek RTL8150-based USB Ethernet NICs
(`rue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

DEC DC21040, DC21041, DC21140, DC21141, DC21142, and DC21143 based NICs
(`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Fujitsu MB86960A/MB86965A based Fast Ethernet NICs
(`fe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Intel 82557-, 82258-, 82559-, 82550- or 82562-based Fast Ethernet NICs
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server and Dual-Port Server Adapters

-  NEC PC-9821Ra20, Rv20, Xv13, Xv20 internal 100Base-TX (PCI)

-  NEC PC-9821X-B06 (PCI)

-  Contec C-NET(PI)-100TX (PCI)

3Com 3C5x9 Etherlink III NICs
(`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

3Com Etherlink XL-based NICs
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

3Com 3C59X series NICs
(`vx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

National Semiconductor DP8393X (SONIC) Ethernet cards (snc driver)

-  NEC PC-9801-83, -84, -103, and -104

-  NEC PC-9801N-25 and -J02R

Gigabit Ethernet cards based on the Level 1 LXT1001 NetCellerator
controller
(`lge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Ethernet and Fast Ethernet NICs based on the 3Com 3XP Typhoon/Sidewinder
(3CR990) chipset
(`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Gigabit Ethernet NICs based on the Broadcom BCM570x
(`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Gigabit Ethernet NICs based on the Intel 82542 and 82543 controller
chips
(`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers), plus NICs supported by the Intel 82540EM, 82544, 82545EM, and
82546EB controller chips
(`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver only)

Myson Ethernet NICs
(`my(4) <http://www.FreeBSD.org/cgi/man.cgi?query=my&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

RealTek RTL8139C+, RTL8169, RTL8169S and RTL8110S based PCI Fast
Ethernet and Gigabit Ethernet controllers
(`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3 FDDI Interfaces
~~~~~~~~~~~~~~~~~~~

DEC DEFPA PCI
(`fpa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fpa&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4 ATM Interfaces
~~~~~~~~~~~~~~~~~~

Efficient Networks, Inc. ENI-155p ATM PCI Adapters (hea driver)

FORE Systems, Inc. PCA-200E ATM PCI Adapters (hfa and
`fatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

IDT NICStAR 77201/211-based ATM Adapters
(`idt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=idt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

FORE Systems, Inc. HE155 and HE622 ATM interfaces
(`hatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

IDT77252-based ATM cards
(`patm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=patm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.5 Wireless Network Interfaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lucent Technologies WaveLAN/IEEE 802.11b wireless network adapters and
workalikes using the Lucent Hermes, Intersil PRISM-II, Intersil
PRISM-2.5, Intersil Prism-3, and Symbol Spectrum24 chipsets
(`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Cisco/Aironet 802.11b wireless adapters
(`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Raytheon Raylink 2.4GHz wireless adapters
(`ray(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ray&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

AMD Am79C930 and Harris (Intersil) based 802.11b cards
(`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

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

Internel serial interfaces
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  PC-9801 on-board

-  PC-9821 2'nd CCU (flags 0x12000000)

NEC PC-9861K, PC-9801-101 and Midori-Denshi MDC-926Rs
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  COM2 (flags 0x01000000)

-  COM3 (flags 0x02000000)

NEC PC-9801-120
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** "flags 0x11000000" is necessary in kernel configuration.

.. raw:: html

   </div>

Microcore MC-16550, MC-16550II, MC-RS98
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** "flags 0x14000?01" is necessary in kernel configuration.

.. raw:: html

   </div>

Media Intelligent RSB-2000, RSB-3000 and AIWA B98-02
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** "flags 0x15000?01" is necessary in kernel configuration.

.. raw:: html

   </div>

Media Intelligent RSB-384
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** "flags 0x16000001" is necessary in kernel configuration.

.. raw:: html

   </div>

I-O DATA RSA-98III
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** "flags 0x18000?01" is necessary in kernel configuration.

.. raw:: html

   </div>

Hayes ESP98
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** "options COM\_ESP" and "flags 0x19000000" are necessary in
    kernel configuration.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9 Audio Devices
~~~~~~~~~~~~~~~~~

NEC PC-9801-73, 86 and compatibles (nss driver)

-  NEC A-MATE internal sound

-  Q-Vision WaveStar, WaveMaster

NEC X-MATE, CanBe, ValueStar internal (mss driver)

Creative Technologies SoundBlaster(98)
(`sb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

I-O DATA CD-BOX
(`sb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

MPU-401 and compatible interfaces (mpu driver)

-  Q-Vision WaveStar

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10 Camera and Video Capture Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Brooktree Bt848/849/878/879-based frame grabbers
(`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.11 USB Devices
~~~~~~~~~~~~~~~~

A range of USB peripherals are supported; devices known to work are
listed in this section. Owing to the generic nature of most USB devices,
with some exceptions any device of a given class will be supported, even
if not explicitly listed here.

.. raw:: html

   <div class="NOTE">

    **Note:** USB Ethernet adapters can be found in the section listing
    `Ethernet interfaces <#ETHERNET>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Note:** USB Bluetooth adapters can be found in
    `Bluetooth <#BLUETOOTH>`__ section.

.. raw:: html

   </div>

OHCI 1.0-compliant host controllers
(`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

UHCI 1.1-compliant host controllers
(`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

USB 2.0 controllers using the EHCI interface
(`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Hubs

Keyboards
(`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Miscellaneous

-  Assist Computer Systems PC Camera C-M1

-  ActiveWire I/O Board

-  Creative Technology Video Blaster WebCam Plus

-  Diamond Rio 500, 600, and 800 MP3 players
   (`urio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

-  D-Link DSB-R100 USB Radio
   (`ufm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ufm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

-  Mirunet AlphaCam Plus

Modems
(`umodem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umodem&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  3Com 5605

-  Metricom Ricochet GS USB wireless modem

-  Yamaha Broadband Wireless Router RTW65b

Mice
(`ums(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ums&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Printers and parallel printer conversion cables
(`ulpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ulpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  ATen parallel printer adapter

-  Belkin F5U002 parallel printer adapter

-  Canon BJ F850, S600

-  Canon LBP-1310, 350

-  Entrega USB-to-parallel printer adapter

-  Hewlett-Packard HP Deskjet 3420 (P/N: C8947A #ABJ)

-  Oki Data MICROLINE ML660PS

-  Seiko Epson PM-900C, 880C, 820C, 730C

Serial devices
(`ubsa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsa&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

Scanners (through **SANE**)
(`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Storage
(`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  ADTEC Stick Drive AD-UST32M, 64M, 128M, 256M

-  Denno FireWire/USB2 Removable 2.5-inch HDD Case MIFU-25CB20

-  FujiFilm Zip USB Drive ZDR100 USB A

-  GREEN HOUSE USB Flash Memory \`\`PicoDrive'' GH-UFD32M, 64M, 128M

-  IBM 32MB USB Memory Key (P/N 22P5296)

-  IBM ThinkPad USB Portable CD-ROM Drive (P/N 33L5151)

-  I-O DATA USB x6 CD-RW Drive CDRW-i64/USB (CDROM only)

-  I-O DATA USB CD/CD-R/CD-RW/DVD-R/DVD-RW/DVD-RAM/DVD-ROM Drive
   DVR-iUH2 (CDROM, DVD-RAM only)

-  Iomega USB Zip 100Mb (primitive support still)

-  Iomega Zip750 USB2.0 Drive

-  Keian USB1.1/2.0 3.5-inch HDD Case KU350A

-  Kurouto Shikou USB 2.5-inch HDD Case GAWAP2.5PS-USB2.0

-  Logitec USB1.1/2.0 HDD Unit SHD-E60U2

-  Logitec Mobile USB Memory LMC-256UD

-  Logitec USB Double-Speed Floppy Drive LFD-31U2

-  Logitec USB/IEEE1394 DVD-RAM/R/RW Unit LDR-N21FU2 (CDROM only)

-  Matshita CF-VFDU03 floppy drive

-  MELCO USB2.0 MO Drive MO-CH640U2

-  I-O DATA USB/IEEE1394 Portable HD Drive HDP-i30P/CI, HDP-i40P/CI

-  MELCO USB Flash Disk \`\`PetitDrive'', RUF-32M, -64M, -128M, -256M

-  MELCO USB2.0 Flash Disk \`\`PetitDrive2'', RUF-256M/U2, -512M/U2

-  MELCO USB Flash Disk \`\`ClipDrive'', RUF-C32M, -C64M, -C128M,
   -C256M, -C512M

-  Microtech USB-SCSI-HD 50 USB to SCSI cable

-  NOVAC USB2.0 2.5/3.5-inch HDD Case NV-HD351U

-  Panasonic floppy drive

-  Panasonic USB2.0 Portable CD-RW Drive KXL-RW40AN (CDROM only)

-  RATOC Systems USB2.0 Removable HDD Case U2-MDK1, U2-MDK1B

-  Sony Portable CD-R/RW Drive CRX10U (CDROM only)

-  TEAC Portable USB CD-ROM Unit CD-110PU/210PU

-  Y-E Data floppy drive (720/1.44/2.88Mb)

Audio Devices
(`uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uaudio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Handspring Visor and other PalmOS devices
(`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  Handspring Visor

-  Palm M125, M500, M505

-  Sony Clie 4.0 and 4.1

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.12 IEEE 1394 (Firewire) Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.13 Bluetooth Devices
~~~~~~~~~~~~~~~~~~~~~~

PCCARD Host Controllers
(`ng\_bt3c(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bt3c&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  3Com/HP 3CRWB6096-A PCCARD adapter

USB Host Controllers
(`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  3Com 3CREB96

-  EPoX BT-DG02

-  Mitsumi USB Bluetooth adapter

-  MSI MS-6967

-  TDK Bluetooth USB adapter

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.14 Cryptographic Accelerators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Accelerators based on the Hifn 7751, 7811, or 7951 chipsets
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Accelerators based on the SafeNet 1141 or 1741 cryptographic accelerator
chipsets
(`safe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=safe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Accelerators based on the Bluesteel 5501 or 5601 chipsets
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Accelerators based on the Broadcom BCM5801, BCM5802, BCM5805, BCM5820,
BCM 5821, BCM5822 chipsets
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.15 Miscellaneous
~~~~~~~~~~~~~~~~~~

FAX-Modem/PCCARD

-  MELCO IGM-PCM56K/IGM-PCM56KH

-  Nokia Card Phone 2.0 (gsm900/dcs1800 HSCSD terminal)

Floppy drives
(`fdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Keyboards including:

-  Standard keyboards

-  USB keyboards
   (`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

Pointing devices including:

-  Bus mice and compatible devices
   (`mse(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mse&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

-  Serial mice and compatible devices

-  USB mice
   (`ums(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ums&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

.. raw:: html

   <div class="NOTE">

    **Note:**
    `moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
    has more information on using pointing devices with FreeBSD.
    Information on using pointing devices with **XFree86** can be found
    at http://www.xfree86.org/.

.. raw:: html

   </div>

\`\`PC-9821 standard'' parallel ports
(`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Joystick port of SoundBlaster(98)
(`joy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=joy&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

PHS Data Communication Card/PCCARD

-  NTT DoCoMo P-in Comp@ct

-  Panasonic KX-PH405

-  SII MC-P200

Power Management Controller of NEC PC-98 Note (pmc driver)

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
