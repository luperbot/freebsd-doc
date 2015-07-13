========================================
FreeBSD/amd64 5.2-RELEASE Hardware Notes
========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/amd64 5.2-RELEASE Hardware Notes
========================================

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
2 `Supported Processors and Motherboards <#PROC>`__
3 `Supported Devices <#SUPPORT>`__
3.1 `Disk Controllers <#AEN35>`__
3.2 `Ethernet Interfaces <#ETHERNET>`__
3.3 `FDDI Interfaces <#AEN756>`__
3.4 `ATM Interfaces <#AEN766>`__
3.5 `Wireless Network Interfaces <#AEN785>`__
3.6 `Miscellaneous Networks <#AEN811>`__
3.7 `ISDN Interfaces <#AEN834>`__
3.8 `Serial Interfaces <#AEN898>`__
3.9 `Audio Devices <#AEN1071>`__
3.10 `Camera and Video Capture Devices <#AEN1193>`__
3.11 `USB Devices <#USB>`__
3.12 `IEEE 1394 (Firewire) Devices <#FIREWIRE>`__
3.13 `Bluetooth Devices <#BLUETOOTH>`__
3.14 `Cryptographic Accelerators <#AEN1421>`__
3.15 `Miscellaneous <#AEN1439>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the hardware compatibility notes for FreeBSD
5.2-RELEASE on the AMD64 hardware platform (also referred to as
FreeBSD/amd64 5.2-RELEASE). It lists devices known to work on this
platform, as well as some notes on boot-time kernel customization that
may be useful when attempting to configure support for new devices.

.. raw:: html

   <div class="NOTE">

    **Note:** This document includes information specific to the AMD64
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
---------------------------------------

FreeBSD/amd64 has supported the AMD64 (\`\`Hammer'') architecture since
mid-2003. It made its first debut as an experimental release based on
FreeBSD 5.1-RELEASE.

As of this writing, this port supports the Athlon64 (\`\`Clawhammer'')
and Opteron (\`\`Sledgehammer'') machines. The largest tested memory
configuration to date is 8GB. SMP support has been recently completed
and is reasonably robust.

In many respects, FreeBSD/amd64 is similar to FreeBSD/i386, in terms of
drivers supported. There may be some issues with 64-bit cleanliness in
some (particularly older) drivers. Generally, drivers that already
function correctly on other 64-bit platforms should work.

FreeBSD/amd64 is a very young platform on FreeBSD. While the core
FreeBSD kernel and base system components are generally fairly robust,
there are likely to still be rough edges, particularly with third party
packages.

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
with FreeBSD on the AMD64 platform. Other configurations may also work,
but simply have not been tested yet. Feedback, updates, and corrections
to this list are encouraged.

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

Adaptec AIC-6260 and AIC-6360 based boards
(`aic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aic&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Adaptec AIC-7770, AIC-7850, AIC-7860, AIC-7870, AIC-7880, and AIC789x
based SCSI host adapters
(`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Ultra-320 SCSI controllers based on the Adaptec AIC7901, AIC7901A, and
AIC7902 Ultra320 controller chips
(`ahd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Adaptec FSA family RAID controllers
(`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

AdvanSys SCSI controllers (all models,
`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`adw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
drivers)

BusLogic MultiMaster \`\`W'', \`\`C'', \`\`S'', and \`\`A'' Series Host
Adapters
(`bt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

DPT SmartCACHE Plus, SmartCACHE III, SmartRAID III, SmartCACHE IV and
SmartRAID IV SCSI/RAID controllers
(`dpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Adaptec 21x0S/32x0S/34x0S SCSI RAID controllers
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Adaptec 2000S/2005S Zero-Channel RAID controllers
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Adaptec 2400A ATA-100 RAID controller
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

DPT SmartRAID V and VI SCSI RAID controllers
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

AMI MegaRAID Express and Enterprise family RAID controllers
(`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** Booting from these controllers is supported. EISA adapters
    are not supported.

.. raw:: html

   </div>

Mylex DAC-family RAID controllers with 2.x, 3.x, 4.x and 5.x firmware
(`mlx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mlx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   <div class="NOTE">

    **Note:** Booting from these controllers is supported. EISA adapters
    are not supported.

.. raw:: html

   </div>

Mylex AcceleRAID/eXtremeRAID family PCI to SCSI RAID controllers with
6.x firmware
(`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

DTC 3290 EISA SCSI controller in 1542 emulation mode.

Tekram DC390 and DC390T controllers, maybe other cards based on the AMD
53c974 as well
(`amd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

SCSI adapters utilizing the Command Interface for SCSI-3 Support
(`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Intel Integrated RAID Controllers
(`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

IBM / Adaptec ServeRAID series
(`ips(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ips&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

LSI Logic Fusion/MP architecture Fiber Channel controllers
(`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

PCI SCSI host adapters using the Tekram TRM-S1040 SCSI chipset
(`trm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=trm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

-  AMD PCnet/PCI (79c970 & 53c974 or 79c974)

-  AMD PCnet/FAST

-  Isolan AT 4141-0 (16 bit)

-  Isolink 4110 (8 bit)

-  PCnet/FAST+

-  PCnet/FAST III

-  PCnet/PRO

-  PCnet/Home

-  HomePNA

SMC 83c17x (EPIC)-based Ethernet NICs
(`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

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

-  Intel InBusiness 10/100 PCI Network Adapter

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server and Dual-Port Server Adapters

-  On-board Ethernet NICs on many Intel motherboards.

Intel 82595-based Ethernet NICs
(`ex(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ex&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

3Com 3C5x9 Etherlink III NICs
(`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

3Com Etherlink XL-based NICs
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

3Com 3C59X series NICs
(`vx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Crystal Semiconductor CS89x0-based NICs
(`cs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cs&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Megahertz X-Jack Ethernet PC-Card CC-10BT
(`sn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Xircom CreditCard adapters (16 bit) and workalikes
(`xe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

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

Broadcom BCM4401 based Fast Ethernet adapters
(`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4 ATM Interfaces
~~~~~~~~~~~~~~~~~~

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

\`\`PC standard'' 8250, 16450, and 16550-based serial ports
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

AST 4 port serial card using shared IRQ

PCI-Based multi-port serial boards
(`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  Actiontech 56K PCI

-  Avlab Technology, PCI IO 2S and PCI IO 4S

-  Comtrol RocketPort 550

-  Decision Computers PCCOM 4-port serial and dual port RS232/422/485

-  Dolphin Peripherals 4025/4035/4036

-  IC Book Labs Dreadnought 16x Lite and Pro

-  Lava Computers 2SP-PCI/DSerial-PCI/Quattro-PCI/Octopus-550

-  Middle Digital, Weasle serial port

-  Moxa Industio CP-114, Smartio C104H-PCI and C168H/PCI

-  NEC PK-UG-X001 and PK-UG-X008

-  Netmos NM9835 PCI-2S-550

-  Oxford Semiconductor OX16PCI954 PCI UART

-  Syba Tech SD-LAB PCI-4S2P-550-ECP

-  SIIG Cyber I/O PCI 16C550/16C650/16C850

-  SIIG Cyber 2P1S PCI 16C550/16C650/16C850

-  SIIG Cyber 2S1P PCI 16C550/16C650/16C850

-  SIIG Cyber 4S PCI 16C550/16C650/16C850

-  SIIG Cyber Serial (Single and Dual) PCI 16C550/16C650/16C850

-  Syba Tech Ltd. PCI-4S2P-550-ECP

-  Titan PCI-200H and PCI-800H

-  US Robotics (3Com) 3CP5609 modem

-  VScom PCI-400 and PCI-800

Specialix SI/XIO/SX multiport serial cards, with both the older
SIHOST2.x and the new \`\`enhanced'' (transputer based, aka JET) host
cards (ISA, EISA and PCI are supported)
(`si(4) <http://www.FreeBSD.org/cgi/man.cgi?query=si&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9 Audio Devices
~~~~~~~~~~~~~~~~~

Advance
(`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  Asound 100 and 110

-  Logic ALS120 and ALS4000

CMedia sound chips

-  CMI8338/CMI8738

Crystal Semiconductor
(`csa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=csa&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  CS461x/462x Audio Accelerator

-  CS428x Audio Controller

ENSONIQ
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  AudioPCI ES1370/1371

ESS

-  ES1868, ES1869, ES1879 and ES1888
   (`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

-  Maestro-1, Maestro-2, and Maestro-2E

-  Maestro-3/Allegro

   .. raw:: html

      <div class="NOTE">

       **Note:** The Maestro-3/Allegro cannot be compiled into the
       FreeBSD kernel due to licensing restrictions. To use this driver,
       add the following line to ``/boot/loader.conf``:

       .. code:: SCREEN

           snd_maestro3_load="YES"

   .. raw:: html

      </div>

ForteMedia fm801

Gravis
(`gusc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gusc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  UltraSound MAX

-  UltraSound PnP

Intel 443MX, 810, 815, and 815E integrated sound devices
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

MSS/WSS Compatible DSPs
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

NeoMagic 256AV/ZX
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

OPTi 931/82C931
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

S3 Sonicvibes

Creative Technologies SoundBlaster series
(`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

-  SoundBlaster

-  SoundBlaster Pro

-  SoundBlaster AWE-32

-  SoundBlaster AWE-64

-  SoundBlaster AWE-64 GOLD

-  SoundBlaster ViBRA-16

Creative Technologies Sound Blaster Live! series (emu10k1 driver)

Trident 4DWave DX/NX
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

VIA Technologies VT82C686A

Yamaha

-  DS1

-  DS1e

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

VGA-compatible video cards
(`vga(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vga&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
   (`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

-  USB keyboards
   (`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

Pointing devices including:

-  Bus mice and compatible devices
   (`mse(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mse&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   driver)

-  PS/2 mice and compatible devices, including many laptop pointing
   devices
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

\`\`PC standard'' parallel ports
(`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

PC-compatible joysticks
(`joy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=joy&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

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
