=============================================
FreeBSD/pc98 5.1-RELEASE Hardware Information
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 5.1-RELEASE Hardware Information
=============================================

The FreeBSD German Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 von The FreeBSD Documentation Project

Copyright © 2002, 2003 von The FreeBSD German Documentation Project

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Inhaltsverzeichnis**
1. `Einf?hrung <#INTRO>`__
2. `Unterst?tzte Systeme <#SUPPORT-SYS>`__
3. `Unterst?tzte Ger?te <#SUPPORT>`__
3.1. `Festplatten-Controller <#AEN36>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN1597>`__
3.4. `ATM Karten <#AEN1607>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN1652>`__
3.6. `Diverse Netzwerkkarten <#AEN1780>`__
3.7. `ISDN Karten <#AEN1811>`__
3.8. `Serielle Schnittstellen <#AEN1875>`__
3.9. `Audio Hardware <#AEN2070>`__
3.10. `Kameras, TV-Karten, etc <#AEN2193>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Bluetooth Ger?te <#BLUETOOTH>`__
3.14. `Verschl?sselungs-Hardware <#AEN2571>`__
3.15. `Diverses <#AEN2596>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
=============

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
5.1-RELEASE auf NEC PC-98x1 Systemen (meistens einfach FreeBSD/pc98
5.1-RELEASE genannt). Hier finden Sie zum einen alle die Ger?te, von
denen wir wissen, da? Sie funktionieren; zum anderen finden Sie hier
Hinweise, wie Sie den Kernel anpassen k?nnen, wenn Sie ein bisher noch
nicht unterst?tztes Ger?t verwenden wollen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Dieses Dokument enth?lt Informationen f?r NEC PC-98x1
    Systeme. Andere Versionen dieses Dokumentes, die f?r andere
    Plattformen gedacht sind, werden in vielen Punkten von diesem
    Dokument abweichen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Unterst?tzte Systeme
=======================

NEC PC-9801/9821 Systeme mit fast allen i386-kompatiblen Prozessoren,
dazu geh?ren unter anderem 80386, 80486, Pentium, Pentium Pro und
Pentium II inklusive aller Varianten. Die i386-kompatiblen Prozessoren
von AMD, Cyrix, IBM und IDT werden ebenfalls unterst?tzt.

NEC FC-9801/9821 und NEC SV-98 (beide sind mit der PC-9801/9821 Familie
kompatibel) sollten auch unterst?tzt werden.

Die EPSON PC-386/486/586 Familien sind kompatibel zur NEC PC-9801
Familie und sollten auch unterst?tzt werden.

Der hochaufl?sende Modus wird nicht unterst?tzt. Die Familien NEC
PC-98XA/XL/RL/XL^2 und NEC PC-H98 werden nur im normalen (PC-9801
kompatiblen) Modus unterst?tzt.

Es gibt zwar einige Mehrprozessorsysteme (wie Rs20/B20), die
SMP-F?higkeiten in FreeBSD werden allerdings noch nicht unterst?tzt.

Der Standard-Bus des PC-9801/9821 (der sogenannte C-Bus), der
Erweiterungsbus des PC9801NOTE (110 Pin) und der PCI-Bus werden
unterst?tzt. Der New Extended Standard Architecture (NESA) Bus (wird in
den Familien PC-H98, SV-H98 und FC-H98 genutzt) wird noch nicht
unterst?tzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Unterst?tzte Ger?te
======================

$FreeBSD$
Dieses Kapitel enth?lt alle Ger?te, die auf jeden Fall von FreeBSD auf
pc98 Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
funktionieren, allerdings wurden sie noch nicht getestet. R?ckmeldungen,
Erg?nzungen und Korrekturen werden dankend angenommen.

Wenn m?glich, wird der zum jeweiligen Ger?t bzw. zur jeweiligen
Ger?teklasse passende Treiber aufgef?hrt. Wenn es unter FreeBSD eine
Online-Hilfe f?r den betreffenden Treiber gibt (das ist der Normalfall),
wird sie ebenfalls aufgef?hrt.

.. raw:: html

   <div class="SECT2">

--------------

3.1. Festplatten-Controller
---------------------------

IDE/ATA Controller
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Acard ATP850 UDMA2, ATP860 UDMA4, ATP865 UDMA6

-  AMD 756 ATA66, 766 ATA100, 768 ATA100

-  CMD 646, 648 ATA66, und 649 ATA100

-  Cypress 82C693

-  Cyrix 5530 ATA33

-  HighPoint HPT366 ATA66, HPT370 ATA100, HPT372 ATA133, HPT374 ATA133

-  Intel PIIX, PIIX3, PIIX4

-  Intel ICH ATA66, ICH2 ATA100, ICH3 ATA100, ICH4 ATA100

-  nVidia nForce ATA100, nForce2 ATA133

-  Promise ATA100 OEM Baustein (pdc20265)

-  Promise ATA133 OEM Baustein (pdc20269)

-  Promise Fasttrak-33, -66, -100, -100 TX2/TX4, -133 TX2/TX2000

-  Promise SATA150 TX2/TX4 Serial ATA/150

-  Promise Ultra-33, -66, -100, -133 TX2/TX2000/TX4000

-  ServerWorks ROSB4 ATA33

-  ServerWorks CSB5 und CSB6 ATA66/ATA100

-  Sil 0680 UDMA6

-  SiS 530, 540, 550, 620

-  SiS 630, 630S, 633, 635, 640, 645, 645DX, 648, 650, 651, 652, 655,
   658, 730, 733, 735, 740, 745, 746, 748, 750, 751,752, 755

-  SiS 5591 ATA100

-  VIA 82C586 ATA33, 82C596 ATA66, 82C686a ATA66, 82C686b ATA100

-  VIA 8233, 8235 ATA133

IDE/ATA controllers (wdc Treiber)

-  on-board IDE Controller

Adaptec SCSI Controller

-  NEC PC-9801-100 und Adaptec AHA-1030P, 1030B
   (`aic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aic&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  NEC PC-9821Xt13 und RvII26 internal, NEC PC-9821X-B02L/B09, NEC
   SV-98/2-B03, Adaptec AHA-2940J, AHA-2940AU und AHA-2940N
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

C-Bus SCSI Interfaces in NEC PC-9801-55, 92 und kompatiblen (ct Treiber)

-  NEC PC-9801-55, 92 und kompatible

   ICM IF-2660

   Midori-Denshi MDC-554NA

   Logitec LHA-N151

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? ``flags 0x00000`` angegeben werden, wenn DMA-Transfers
       genutzt werden sollen.

   .. raw:: html

      </div>

-  I-O DATA SC-98II

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? ``flags 0x10000`` angegeben werden, wenn DMA-Transfers
       genutzt werden sollen.

   .. raw:: html

      </div>

-  TEXA HA-55BS2 und neuer

   Midori-Denshi MDC-926Rs

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? ``flags 0x20000`` angegeben werden, wenn DMA-Transfers
       genutzt werden sollen.

   .. raw:: html

      </div>

-  ELECOM Bus-master SCSI Anschlu?

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? ``flags 0x30000`` angegeben werden, wenn
       Bus-Master-Transfers genutzt werden sollen.

   .. raw:: html

      </div>

-  Alle SMIT-f?higen SCSI Anschl?sse

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? ``flags 0x40000`` angegeben werden, wenn
       SMIT-Transfers genutzt werden sollen.

   .. raw:: html

      </div>

-  Logitec LHA-20x Familie

   ICM IF-2766, IF-2766ET, IF-2767 und IF-2769

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? ``flags 0x50000`` angegeben werden, wenn
       Bus-Master-Transfers genutzt werden sollen.

   .. raw:: html

      </div>

NEC PC-9801-55, 92 und dazu kompatible C-Bus SCSI Controller (bs
Treiber)

-  NEC PC-9801-55, 92 und kompatible

   ICM IF-2660

   Midori-Denshi MDC-554NA

   Logitec LHA-N151

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Zur Aktivierung des DMA Transfer Modus mu? in der
       Konfigurationsdatei f?r den Kernel "flags 0x00000" angegeben
       werden.

   .. raw:: html

      </div>

-  I-O DATA SC-98II

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Zur Aktivierung des DMA Transfer Modus mu? in der
       Konfigurationsdatei f?r den Kernel "flags 0x10000" angegeben
       werden.

   .. raw:: html

      </div>

-  TEXA HA-55BS2 und Nachfolger

   Midori-Denshi MDC-926Rs

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Zur Aktivierung des Bus-Master Transfer Modus mu?
       in der Konfigurationsdatei f?r den Kernel "flags 0x20000"
       angegeben werden.

   .. raw:: html

      </div>

-  ELECOM Bus-master SCSI interfaces

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Zur Aktivierung des Bus-Master Transfer Modus mu?
       in der Konfigurationsdatei f?r den Kernel "flags 0x30000"
       angegeben werden.

   .. raw:: html

      </div>

-  Alle SCSI-Kontroller mit SMIT Transfer

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Zur Aktivierung des SMIT Transfer Modus mu? in der
       Konfigurationsdatei f?r den Kernel "flags 0x40000" angegeben
       werden.

   .. raw:: html

      </div>

-  Logitec LHA-20x series

   ICM IF-2766, IF-2766ET, IF-2767 und IF-2769

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Zur Aktivierung des Bus-Master Transfer Modus mu?
       in der Konfigurationsdatei f?r den Kernel "flags 0x50000"
       angegeben werden.

   .. raw:: html

      </div>

AdvanSys SCSI Controllers (alle Modelle.
`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.1-release>`__
und
`adw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adw&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  MELCO IFC-USP, RATOC REX-PCI30 und @Nifty FNECHARD IFC-USUP-TX
   (`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

LSI/SymBios (ehemals NCR) 53C810, 53C810a, 53C815, 53C825, 53C825a,
53C860, 53C875, 53C875a, 53C876, 53C885, 53C895, 53C895a, 53C896,
53C1010-33, 53C1010-66, 53C1000, 53C1000R PCI SCSI Controller, sowohl
auf Hostadaptern als auch on-board
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+5.1-release>`__
und
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  I-O DATA SC-98/PCI und SC-PCI
   (`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  I-O DATA SC-UPCI und Logitec LHA-521UA
   (`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

PC-Card SCSI Hostadapter auf Basis des NCR 53C500 (ncv Treiber)

-  IO DATA PCSC-DV

-  KME KXLC002 (TAXAN ICD-400PN, etc.), KXLC004

-  Macnica Miracle SCSI-II mPS110

-  Media Intelligent MSC-110, MSC-200

-  NEC PC-9801N-J03R

-  New Media Corporation BASICS SCSI

-  Qlogic Fast SCSI

-  RATOC REX-9530, REX-5572 (nur SCSI)

Qlogic(-?hnlich) Controller
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Qlogic SCSI Interface

Tekram DC390 und DC390T Controller, eventuell auch andere auf dem AMD
53c974 basierende Karte
(`amd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  MELCO IFC-DP

PC-Card SCSI Hostadapter auf Basis des Workbit Ninja SCSI-3 (nsp
Treiber)

-  Alpha-Data AD-PCS201

-  IO DATA CBSC16

LSI Logic Fusion/MP architecture Fiber Channel Controller (mpt Treiber)

-  LSI FC909, FC929

-  LSI 53c1020, 53c1030

Mit allen unterst?tzten SCSI Controllern ist die uneingeschr?nkte
Nutzung von SCSI-I, SCSI-II und SCSI-III Ger?ten m?glich. Dazu geh?ren
Festplatten, optische Platten, Bandlaufwerke (u.a. DAT, 8mm Exabyte,
Mammoth, DLT), Wechselplatten, Ger?te mit eigenem Prozessor und CDROM.
Sie k?nnen mit den CD-Treibern (wie
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.1-release>`__)
lesend auf WORMs zugreifen, wenn diese die entsprechenden Kommandos f?r
CDROM unterst?tzen. F?r schreibenden Zugriff steht das Programm
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__
aus der Ports Collection zur Verf?gung.

Zur Zeit unterst?tzte CDROM-Arten:

-  SCSI Ger?te (dazu geh?ren auch ProAudio Spectrum und SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.1-release>`__)

-  ATAPI IDE Ger?te
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.1-release>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2. Netzwerkkarten
-------------------

Adaptec Duralink PCI Fast Ethernet Netzwerkkarten, die auf dem Adaptec
AIC-6915 Fast Ethernet Controller basieren
(`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  ANA-62011 64-bit single port 10/100baseTX

-  ANA-62022 64-bit dual port 10/100baseTX

-  ANA-62044 64-bit quad port 10/100baseTX

-  ANA-69011 32-bit single port 10/100baseTX

-  ANA-62020 64-bit single port 100baseFX

Allied-Telesis AT1700 und RE2000 Karten
(`fe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fe&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  CONTEC C-NET(PC)C PCMCIA Ethernet

-  Fujitsu MBH10303, MBH10302 Ethernet PCMCIA

-  Fujitsu Towa LA501 Ethernet

-  Fujitsu FMV-J182, FMV-J182A

-  RATOC REX-5588, REX-9822, REX-4886, und REX-R280

-  Eiger Labs EPX-10BT

-  HITACHI HT-4840-11

-  NextCom J Link NC5310

-  TDK LAK-CD021, LAK-CD021A, LAK-CD021BX

Alteon Networks PCI Gigabit Ethernet Netzwerkkarten mit Tigon 1 und
Tigon 2 Chipsatz
(`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com 3c985-SX (Tigon 1 und 2)

-  Alteon AceNIC (Tigon 1 und 2)

-  Alteon AceNIC 1000baseT (Tigon 2)

-  Asante PCI 1000BASE-SX Gigabit Ethernet Karte

-  Asante GigaNIX1000T Gigabit Ethernet Karte

-  DEC/Compaq EtherWORKS 1000

-  Farallon PN9000SX

-  NEC Gigabit Ethernet

-  Netgear GA620 (Tigon 2)

-  Netgear GA620T (Tigon 2, 1000baseT)

-  Silicon Graphics Gigabit Ethernet

AMD PCnet Netzwerkkarten
(`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+5.1-release>`__
und
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Contec C-NET(98)S

-  PCI NIC using AMD AM79C97x (PCnet-PCI/Fast)

-  NEC SV-98/2-B05, B06 (PCI)

-  Allied-Telesis LA-PCI (PCI)

Netzwerkkarten mit SMC 83c17x (EPIC)
(`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  SMC EtherPower II 9432 Familie

Netzwerkkarten mit National Semiconductor DS8390, dazu geh?ren auch die
NE2000 und alle Nachbauten der NE2000
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** In der Konfigurationsdatei f?r den Kernel m?ssen Sie
    die Einstellungen f?r das Nicht-PCI Variante w?hlen.

.. raw:: html

   </div>

-  Novell NE1000, NE2000, und NE2100

-  RealTek 8029

-  I-O DATA ET2/T-PCI

-  MELCO LGY-PCI-TR

-  PLANEX ENW-8300-T

-  Allied Telesis LA-98 (Flags 0x000000)

-  Corega Ether98-T (Flags 0x000000)

-  SMC EtherEZ98 (Flags 0x000000)

-  ELECOM LD-BDN, LD-NW801G (Flags 0x200000)

-  PLANEX EN-2298-C (Flags 0x200000)

-  MELCO EGY-98 (Flags 0x300000)

-  Contec C-NET(98)E-A, C-NET(98)L-A, C-NET(98)P (Flags 0x300000)

-  MELCO LGY-98, LGH-98, IND-SP, IND-SS, LGY-98-N (110pin) (Flags
   0x400000)

-  MACNICA NE2098 (Flags 0x400000)

-  ICM IF-2766ET, IF-2771ET, AD-ET2-T, DT-ET-25, DT-ET-T5, NB-ET-T
   (110pin) (Flags 0x500000)

-  D-Link DE-298, DE-298P (Flags 0x500000)

-  ELECOM LD-98P (Flags 0x500000)

-  PLANEX EN-2298-T, EN-2298P-T (Flags 0x500000)

-  Allied Telesis SIC-98, SIU-98, SIC-98NOTE (110pin) (Flags 0x600000)

-  Allied Telesis SIU-98-D (Flags 0x610000)

-  NEC PC-9801-107, 108 (Flags 0x800000)

-  I-O DATA LA/T-98, LA/T-98SB, LA2/T-98, ET/T-98 (Flags 0x900000)

-  MACNICA ME98 (Flags 0x900000)

-  Kansai KLA-98C/T (Flags 0x900000)

-  NEC PC-9801-77, 78 (Flags 0x910000)

-  Contec C-NET(98), RT-1007(98), C-NET(9N) (110pin) (Flags 0xa00000)

-  Contec C-NET(98)E, C-NET(98)L, C-NET(9N)L (110pin) (Flags 0xb00000)

-  Logitec LAN-98T (Flags 0xb00000)

-  Networld 98X3 (Flags 0xd00000)

-  Accton EN1644 (altes Modell), EN1646 (altes Modell), EN2203 (altes
   Modell) (110pin) (Flags 0xd00000)

-  Networld EC-98X, EP-98X (Flags 0xd10000)

NE2000-kompatible PC-Card (PCMCIA) Ethernet und FastEthernet Karten
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  AR-P500 Ethernet

-  Accton EN2212/EN2216/UE2216

-  Allied Telesis CentreCOM LA100-PCM\_V2

-  AmbiCom 10BaseT

-  BayNetworks NETGEAR FA410TXC Fast Ethernet

-  CNet BC40

-  COREGA Ether PCC-T/EtherII PCC-T/FEther PCC-TXF/PCC-TXD

-  Compex Net-A

-  CyQ've ELA-010

-  D-Link DE-650/660

-  Danpex EN-6200P2

-  Elecom Laneed LD-CDL/TX, LD-CDF, LD-CDS, LD-10/100CD, LD-CDWA
   (DP83902A), MACNICA Ethernet ME1 f?r JEIDA

-  IO DATA PCLATE

-  IBM Creditcard Ethernet I/II

-  IC-CARD Ethernet/IC-CARD+ Ethernet

-  Kingston KNE-PC2, KNE-PCM/x Ethernet

-  Linksys EC2T/PCMPC100, PCMLM56, EtherFast 10/100 PC Card, Combo
   PCMCIA Ethernet Karte (PCMPC100 V2)

-  Melco LPC-T/LPC2-T/LPC2-CLT/LPC2-TX/LPC3-TX/LPC3-CLX

-  NDC Ethernet Instant-Link

-  National Semiconductor InfoMover NE4100

-  NetGear FA-410TX

-  Network Everywhere Ethernet 10BaseT PC Card

-  Planex FNW-3600-T

-  Socket LP-E

-  Surecom EtherPerfect EP-427

-  TDK LAK-CD031,Grey Cell GCS2000

-  Telecom Device SuperSocket RE450T

RealTek 8129/8139 Fast Ethernet Netzwerkkarten
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Accton \`\`Cheetah'' EN1207D (MPX 5030/5038; RealTek 8139 Nachbau)

-  SOHO(PRAGMATIC) UE-1211C (PCI)

Macronix 98713, 98713A, 98715, 98715A und 98725 Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Accton EN1217 (98715A)

-  Adico AE310TX (98715A)

-  Compex RL100-TX (98713 oder 98713A)

-  CNet Pro120A (98713 oder 98713A)

-  CNet Pro120B (98715)

-  NDC Communications SFA100A (98713A)

-  SVEC PN102TX (98713)

Macronix/Lite-On PNIC II LC82C115 Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  LinkSys EtherFast LNE100TX Version 2

Winbond W89C840F Fast Ethernet Karten
(`wb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wb&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Trendware TE100-PCIE

VIA Technologies VT3043 \`\`Rhine I'', VT86C100A \`\`Rhine II'' und
VT86C105/VT86C105M \`\`Rhine III'' Fast Ethernet Karten
(`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  MELCO LGY-PCI-TXR (PCI)

-  CO-100MV (PCI)

-  Corega FastEtherII PCI-TX (PCI)

Silicon Integrated Systems SiS 900 und SiS 7016 PCI Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  @Nifty FNECHARD IFC-USUP-TX (PCI)

-  MELCO LGY-PCI-TXC (PCI)

National Semiconductor DP83815 Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  NetGear FA311-TX

-  NetGear FA312-TX

National Semiconductor DP83820 und DP83821 Gigabit Ethernet Karten
(`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Addtron AEG320T

-  Ark PC SOHO-GA2500T (32-bit PCI) und SOHO-GA2000T (64-bit PCI)

-  Asante FriendlyNet GigaNIC 1000TA und 1000TPC

-  D-Link DGE-500T

-  LinkSys EG1032 (32-bit PCI) und EG1064 (64-bit PCI)

-  Netgear GA621 und GA622T

-  SMC EZ Card 1000 (SMC9462TX)

-  Surecom Technology EP-320G-TX

-  Trendware TEG-PCITX (32-bit PCI) und TEG-PCITX2 (64-bit PCI)

Sundance Technologies ST201 PCI Fast Ethernet Karten
(`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  D-Link DFE-550TX

Texas Instruments ThunderLAN PCI Netzwerkkarten
(`tl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tl&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Compaq Netelligent 10, 10/100, 10/100 Dual-Port

-  Compaq Netelligent 10/100 TX Embedded UTP, 10 T PCI UTP/Coax, 10/100
   TX UTP

-  Compaq NetFlex 3P, 3P Integrated, 3P w/BNC

-  Olicom OC-2135/2138, OC-2325, OC-2326 10/100 TX UTP

-  Racore 8165 10/100baseTX

-  Racore 8148 10baseT/100baseTX/100baseFX multi-personality

PCI Fast Ethernet Karten mit ADMtek Inc. AL981
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

PCI Fast Ethernet Karten mit ADMtek Inc. AN985
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  LinkSys EtherFast LNE100TX v4.0/4.1

USB Ethernet Karten mit ADMtek Inc. AN986
(`aue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aue&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Abocom UFE1000, DSB650TX\_NA

-  Accton USB320-EC, SpeedStream

-  ADMtek AN986, AN8511

-  Billionton USB100, USB100LP, USB100EL, USBE100

-  Corega Ether FEther USB-TX, FEther USB-TXS

-  D-Link DSB-650, DSB-650TX, DSB-650TX-PNA

-  Elecom LD-USBL/TX

-  Elsa Microlink USB2Ethernet

-  I-O Data USB ETTX

-  Kingston KNU101TX

-  LinkSys USB10T, USB10TA, USB10TX, USB100TX, USB100H1

-  MELCO LUA-TX, LUA2-TX

-  Planex UE-200TX

-  Siemens Speedstream

-  SmartBridges smartNIC

-  SMC 2202USB

-  SOHOware NUB100

USB Netzwerkkarten mit CATC USB-EL1210A
(`cue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cue&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Belkin F5U011, F5U111

-  CATC Netmate, CATC Netmate II

-  SmartBridges SmartLink

USB Netzwerkkarten mit Kawasaki LSI KU5KUSB101B
(`kue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kue&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com 3c19250

-  AOX USB101

-  Abocom URE 450

-  ADS Technologies USB-10BT

-  ATen UC10T

-  Corega USB-T

-  D-Link DSB-650C

-  Entrega NET-USB-E45

-  I/O Data USB ETT

-  Kawasaki DU-H3E

-  LinkSys USB10T

-  Netgear EA101

-  Peracom USB Ethernet Adapter

-  SMC 2102USB, 2104USB

ASIX Electronics AX88172 USB Netzwerkkarten
(`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+5.1-release>`__
driver)

-  D-Link DUBE100

-  Linksys USB200M

-  Netgear FA120

USB-Netzwerkkarten auf Basis des RealTek RTL8150
(`rue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rue&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  GREEN HOUSE GH-USB100B

-  MELCO LUA-KTX

ASIX Electronics AX88140A PCI Netzwerkkarten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Alfa Inc. GFC2204

-  CNet Pro110B

Netzwerkkarten mit DEC DC21040, DC21041, DC21140, DC21141, DC21142 oder
DC21143
(`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Asante

-  Cogent EM100FX und EM440TX

-  DEC DE425, DE435, DE450, und DE500

-  SMC Etherpower 8432T, 9332, und 9334

-  ZYNX ZX 3xx

-  I-O DATA LA2/T-PCI (PCI)

-  ELECOM LD-PCI2T, LD-PCITS (PCI)

-  Corega FastEther PCI-TX (PCI)

Fast Ethernet Karten mit DEC/Intel 21143
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  DEC DE500

-  Compaq Presario 7900 Familie (die eingebaute Netzwerkkarte)

-  D-Link DFE-570TX

-  Kingston KNE100TX

-  LinkSys EtherFast 10/100 Instant GigaDrive (die eingebaute
   Netzwerkkarte)

Davicom DM9009, DM9100 und DM9102 PCI Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Jaton Corporation XpressNet

Cnet Pro120A (PCI)
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

MELCO LGY-PCI-TXL (PCI)
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

Fast Ethernet Karten mit Fujitsu MB86960A/MB86965A
(`fe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fe&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Allied Telesis RE1000, RE1000Plus, ME1500 (110pin)

-  Contec C-NET(98)P2, C-NET(9N)E (110pin), C-NET(9N)C(ExtCard)

-  Ungermann-Bass Access/PC N98C+(PC85152,PC85142), Access/NOTE N98
   (PC86132) (110pin)

-  TDK LAC-98012, LAC-98013, LAC-98025, LAC-9N011 (110pin)

-  Ratoc REX-9880/9881/9882/9883

Fast Ethernet Karten mit Intel 82557, 82558, 82559, 82550 und 82562
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server und Dual-Port Server Adapters

-  NEC PC-9821Ra20, Rv20, Xv13, Xv20 internal 100Base-TX (PCI)

-  NEC PC-9821X-B06 (PCI)

-  Contec C-NET(PI)-100TX (PCI)

3Com 3C5x9 Etherlink III Netzwerkkarten
(`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com 3C569, 3C569-TPO, 3C569B, 3C569B-COMBO

Netzwerkkarten mit 3Com Etherlink XL
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3C900/905/905B/905C PCI

3Com 3C59X Familie
(`vx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vx&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3C590 Etherlink III (PCI)

-  3C595 Fast Etherlink III (PCI)

National Semiconductor DP8393X (SONIC) Ethernet Karten (snc Treiber)

-  NEC PC-9801-83, -84, -103, und -104

-  NEC PC-9801N-25 und -J02R

Gigabit Ethernet Karten mit Level 1 LXT1001 NetCellerator Controller
(`lge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lge&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  D-Link DGE-500SX

-  SMC TigerCard 1000 (SMC9462SX)

Ethernet und Fast Ethernet Karten mit 3Com 3XP Typhoon/Sidewinder
(3CR990) Chipsatz
(`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com 3CR990-TX-95

-  3Com 3CR990-TX-97

-  3Com 3CR990B-SRV

-  3Com 3CR990B-TXM

-  3Com 3CR990SVR95

-  3Com 3CR990SVR97

Gigabit Ethernet Karten mit Broadcom BCM570x
(`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com 3c996-SX, 3c996-T

-  Netgear GA302T

-  SysKonnect SK-9D21 und 9D41

Gigabit Ethernet Karten mit Intel 82542 und 82543 Controllern
(`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+5.1-release>`__
und
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber), sowie Karten auf Basis der 82540EM, 82544, 82545EM und 82546EB
Chips?tze (nur
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Intel PRO/1000 Gigabit Ethernet

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Der
    `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.1-release>`__
    Treiber wird von Intel unterst?tzt, allerdings nur auf der i386
    Plattform.

.. raw:: html

   </div>

Myson Ethernetkarten (my Treiber)

-  Myson MTD80X Based Fast Ethernet Karte

-  Myson MTD89X Based Gigabit Ethernet Karte

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3. FDDI Karten
----------------

DEC DEFPA PCI
(`fpa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fpa&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4. ATM Karten
---------------

Efficient Networks, Inc. ENI-155p ATM PCI Karten (hea Treiber)

FORE Systems, Inc. PCA-200E ATM PCI Karten (hfa Treiber)

IDT 77201/211 NICStAR ATM Karte (idt Treiber)

FORE Systems, Inc. LE155 ATM Karte (idt Treiber)

Die ATM-Unterst?tzung von FreeBSD umfa?t die folgenden \`\`signaling
protocols'':

-  The ATM Forum UNI 3.1 signaling protocol

-  The ATM Forum UNI 3.0 signaling protocol

-  The ATM Forum ILMI address registration

-  FORE Systems' proprietary SPANS signaling protocol

-  Permanent Virtual Channels (PVCs)

Das System \`\`Classical IP and ARP over ATM'' der IETF wird unterst?tzt
und entspricht den folgenden RFCs bzw. Internet Drafts:

-  RFC 1483, \`\`Multiprotocol Encapsulation over ATM Adaptation Layer
   5''

-  RFC 1577, \`\`Classical IP and ARP over ATM''

-  RFC 1626, \`\`Default IP MTU for use over ATM AAL5''

-  RFC 1755, \`\`ATM Signaling Support for IP over ATM''

-  RFC 2225, \`\`Classical IP and ARP over ATM''

-  RFC 2334, \`\`Server Cache Synchronization Protocol (SCSP)''

-  Internet Draft ``draft-ietf-ion-scsp-atmarp-00.txt``, \`\`A
   Distributed ATMARP Service Using SCSP''

Support for an ATM sockets interface is also provided.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.5. Karten f?r drahtlose Netzwerke
-----------------------------------

Lucent Technologies WaveLAN/IEEE 802.11 PCMCIA und ISA Karten, sowohl
bei normaler (2 Mbps) als auch hoher (6 Mbps) Geschwindigkeit; auch
baugleiche Ger?te
(`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die ISA Variante dieser Karten ist in Wirklichkeit
    eine PCMCIA-Karte, die auf einem ISA-PCMCIA-Adapter steckt, daher
    funktionieren beide Varianten mit dem gleichen Treiber.

.. raw:: html

   </div>

-  3COM 3crwe737A AirConnect Wireless LAN PC Card

-  Accton airDirect WN3301

-  Addtron AWA100

-  Adtec ADLINK340APC

-  Airway 802.11 Adapter

-  Avaya Wireless PC Card

-  Blue Concentric Circle CF Wireless LAN Model WL-379F

-  BreezeNET PC-DS.11

-  Buffalo WLI-CF-S11G

-  Cabletron RoamAbout 802.11 DS

-  Compaq WL100, WL110

-  Corega KK Wireless LAN PCC-11, PCCA-11, PCCB-11

-  D-Link DWL-650

-  Dell TrueMobile 1150 Series

-  ELECOM Air@Hawk/LD-WL11/PCC

-  ELSA AirLancer MC-11

-  Farallon Skyline 11Mbps Wireless

-  ICOM SL-1100

-  IBM High Rate Wireless LAN PC Card

-  Intel PRO/Wireless 2011 LAN PC Card

-  IO Data WN-B11/PCM

-  Laneed Wireless card

-  Linksys Instant Wireless WPC11

-  Lucent WaveLAN/IEEE 802.11

-  MELCO Airconnect WLI-PCM-S11, WLI-PCM-L11

-  NCR WaveLAN/IEEE 802.11

-  NEC Wireless Card CMZ-RT-WP

-  NEC Aterm WL11C (PC-WL/11C)

-  NEC PK-WL001

-  Netgear MA401

-  PLANEX GeoWave/GW-NS110

-  Proxim Harmony, RangeLAN-DS

-  SMC 2632W, 2602W

-  Sony PCWA-C100

-  TDK LAK-CD011WL

-  Toshiba Wireless LAN Card

-  US Robotics Wireless Card 2410

Aironet 802.11 wireless Karten
(`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Aironet 4500/4800 Familien (PCMCIA, PCI, und ISA Karten werden
   unterst?tzt)

-  Cisco Systems Aironet 340 und 350 Familien (PCMCIA, PCI, Mini-PCI und
   ISA Karten werden unterst?tzt)

-  Xircom Wireless Ethernet Adapter (baugleich mit Aironet)

Raytheon Raylink 2.4GHz wireless Karten
(`ray(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ray&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Webgear Aviator

-  Webgear Aviator Pro

-  Raytheon Raylink PC Card

802.11 Karten mit AMD Am79C930 und Harris (Intersil)
(`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  BayStack 650 und 660

-  Farallon SkyLINE Wireless

-  Icom SL-200

-  MELCO WLI-PCM

-  NEL SSMagic

-  Netwave AirSurfer Plus und AirSurfer Pro

-  ZoomAir 4000

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.6. Diverse Netzwerkkarten
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.7. ISDN Karten
----------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.8. Serielle Schnittstellen
----------------------------

Eingebaute Serielle Schnittstellen
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  PC-9801 on-board

-  PC-9821 2'nd CCU (flags 0x12000000)

NEC PC-9861K, PC-9801-101 und Midori-Denshi MDC-926Rs
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  COM2 (Flags 0x01000000)

-  COM3 (Flags 0x02000000)

NEC PC-9801-120
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x11000000" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Microcore MC-16550, MC-16550II, MC-RS98
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x14000?01" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Media Intelligent RSB-2000, RSB-3000 und AIWA B98-02
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x15000?01" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Media Intelligent RSB-384
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x16000001" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

I-O DATA RSA-98III
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x18000?01" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Hayes ESP98
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "options COM\_ESP" und "flags 0x19000000" m?ssen in
    der Konfigurationsdatei angegeben werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9. Audio Hardware
-------------------

NEC PC-9801-73, 86 und Kompatible (nss Treiber)

-  NEC A-MATE on-board Audio

-  Q-Vision WaveStar, WaveMaster

NEC X-MATE, CanBe, ValueStar on-board (mss Treiber)

Creative Technologies SoundBlaster(98)
(`sb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sb&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

I-O DATA CD-BOX
(`sb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sb&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

Software PCM (pca Treiber)

MPU-401 und kompatible (mpu Treiber)

-  Q-Vision WaveStar

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10. Kameras, TV-Karten, etc
-----------------------------

Karten mit Brooktree Bt848/849/878/879
(`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  AverMedia Karten

-  Hauppauge Wincast TV und WinTV Karten (PCI)

-  Intel Smart Video Recorder III

-  Miro PC TV

-  STB TV PCI

-  Video Highway XTreme

-  VideoLogic Captivator PCI

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.11. USB Ger?te
----------------

FreeBSD unterst?tzt viele verschiedene Arten von USB-Ger?ten; in den
nachfolgenden Listen sind nur die Ger?te aufgef?hrt, f?r die wir
Erfolgsmeldungen erhalten haben. Da sich die meisten USB-Ger?te sehr
?hnlich sind, werden ?blicherweise alle Ger?te einer Klasse
funktionieren, auch wenn Sie hier nicht explizit aufgef?hrt sind.
Ausnahmen best?tigen allerdings immer die Regel.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** USB Netzwerkkarten finden Sie in einem eigenen
    Abschnitt im Kapitel `Netzwerkkarten <#ETHERNET>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Bluetooth-Adapter f?r USB finden Sie in im Abschnitt
    `Bluetooth <#BLUETOOTH>`__.

.. raw:: html

   </div>

Host Controllers
(`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+5.1-release>`__
und
`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  NEC PC-9821V200 etc
   (`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+5.1-release>`__
   driver)

USB Host Controller (PCI)

-  TRY CORPORATION JUS-02
   (`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

USB 2.0 Controller, die das EHCI Interface nutzen
(`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

Hubs

-  Andromeda hub

-  MacAlly self powered hub (4 ports)

-  NEC hub

Tastaturen
(`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Apple iMac Tastatur

-  BTC BTC7935 Tastatur mit PS/2 Mausanschlu?

-  Cherry G81-3504 Tastatur

-  Logitech M2452 Tastatur

-  MacAlly iKey Tastatur

-  Microsoft Tastatur

-  Sun Microsystems USB-Tastatur Typ 6

Diverses

-  ActiveWire I/O Board

-  Diamond Rio 500, 600, und 800 MP3 Player
   (`urio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urio&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  D-Link DSB-R100 USB Radio (ufm Treiber)

Modems
(`umodem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umodem&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com 5605

-  Metricom Ricochet GS USB wireless modem

-  Yamaha Broadband Wireless Router RTW65b

M?use
(`ums(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ums&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Agiler Maus 29UO

-  Apple iMac Maus

-  Belkin Maus

-  Chic Maus

-  Cypress Maus

-  Genius Niche Maus

-  Kensington Mouse-in-a-Box

-  Logitech Rad-Maus (3 Tasten)

-  Logitech PS/2 / USB Maus (3 Tasten)

-  MacAlly Maus (3 Tasten)

-  Microsoft IntelliMouse (3 Tasten)

-  Sun Microsystems USB-Maus, Typ 6

-  Trust Ami Maus (3 Tasten)

Drucker und Adapterkabel f?r konventionelle Drucker
(`ulpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ulpt&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  ATen parallel printer Adapter

-  Belkin F5U002 parallel printer Adapter

-  Entrega USB-to-parallel printer Adapter

Serielle Schnittstellen

-  Belkin F5U103 und F5U120 (ubsa Treiber)

-  e-Tek Labs Kwik232 (ubsa Treiber)

-  GoHubs GoCOM232 (ubsa Treiber)

-  HP USB-Serial Adapter
   (`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  Inland UAS111
   (`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  Peracom single port serial adapter (ubsa Treiber)

-  Prolific PL-2303 serial adapter
   (`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  QVS USC-1000
   (`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  SUNTAC Slipper U VS-10U
   (`uvscom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvscom&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

Scanner (zusammen mit **SANE**)
(`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Perfection 636U

-  HP ScanJet 4100C, 5200C, 6300C

Massenspeicher
(`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  ADTEC Stick Drive AD-UST32M, 64M, 128M, 256M

-  Denno FireWire/USB2 Removable 2.5-inch HDD Case MIFU-25CB20

-  FujiFilm Zip USB Drive ZDR100 USB A

-  GREEN HOUSE USB Flash Memory \`\`PicoDrive'' GH-UFD32M, 64M, 128M

-  IBM 32MB USB Memory Key (P/N 22P5296)

-  IBM ThinkPad USB Portable CD-ROM Drive (P/N 33L5151)

-  I-O DATA USB x6 CD-RW Drive CDRW-i64/USB (nur CDROM

-  I-O DATA USB CD/CD-R/CD-RW/DVD-R/DVD-RW/DVD-RAM/DVD-ROM Laufwerk DV
   R-iUH2 (nur CDROM und DVD-RAM)

-  Iomega Zip750 USB2.0 Drive

-  Keian USB1.1/2.0 3.5-inch HDD Case KU350A

-  Kurouto Shikou USB 2.5-inch HDD Case GAWAP2.5PS-USB2.0

-  Logitec USB1.1/2.0 HDD Unit SHD-E60U2

-  Logitec Mobile USB Memory LMC-256UD

-  Logitec USB Double-Speed Diskettenlaufwerk LFD-31U2

-  Logitec USB/IEEE1394 DVD-RAM/R/RW Unit LDR-N21FU2 (nur CDROM)

-  Matshita CF-VFDU03 Diskettenlaufwerk

-  MELCO USB2.0 MO Drive MO-CH640U2

-  MELCO USB/IEEE1394 Portable HD Drive HDP-i30P/CI, HDP-i40P/CI

-  MELCO USB Flash Disk \`\`PetitDrive'', RUF-32M, -64M, -128M, -256M

-  MELCO USB2.0 Flash Disk \`\`PetitDrive2'', RUF-256M/U2, -512M/U2

-  MELCO USB Flash Disk \`\`ClipDrive'', RUF-C32M, -C64M, -C128M,
   -C256M, -C512M

-  Microtech USB-SCSI-HD 50 USB-auf-SCSI Kabel

-  Panasonic Diskettenlaufwerk

-  Panasonic USB2.0 Portable CD-RW Drive KXL-RW40AN (nur CDROM)

-  RATOC Systems USB2.0 Removable HDD Case U2-MDK1, U2-MDK1B

-  Sony Portable CD-R/RW Drive CRX10U (CDROM only)

-  TEAC Portable USB CD-ROM Unit CD-110PU/210PU

-  Y-E Data Diskettenlaufwerk (720/1.44/2.88Mb)

Audio Ger?te (uaudio Treiber)

-  Audio-Technica USB Digital Kopfh?rer ATC-HA4USB

-  Ergo Systems AUDIOTRAK OPTOPlay USB

-  KENWOOD MD Personal Stereo System MDX-G7

-  KENWOOD/SOTEC VH-7PC

-  I-O DATA Analog nach Digital USB Audio Wandler DAVOX

-  ONKYO PC Speaker GX-R5U(W)

-  ONKYO USB Digital Audio Processor SE-U55X(S)

-  Roland UA-5 USB Audio Interface \`\`Audio Capture''

-  Sony PC Active Speaker System SRS-T100PC

Handspring Visor und andere PDAs mit PalmOS
(`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Handspring Visor

-  Palm M125, M500, M505

-  Sony Clie 4.0 und 4.1

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.12. IEEE 1394 (Firewire) Ger?te
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.13. Bluetooth Ger?te
----------------------

PCCARD Host Kontroller
(`ng\_bt3c(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bt3c&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com/HP 3CRWB6096-A PCCARD Adapter

USB Host Kontroller
(`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  3Com 3CREB96

-  EPoX BT-DG02

-  Mitsumi USB Bluetooth Adapter

-  MSI MS-6967

-  TDK Bluetooth USB Adapter

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.14. Verschl?sselungs-Hardware
-------------------------------

Karten auf Basis der Hifn 7751, 7811 und 7951 Chips
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

-  Invertex AEON

-  Hifn 7751 Referenz-Platine

-  Global Technologies Group PowerCrypt und XL-Crypt

-  NetSec 7751

-  Soekris Engineering vpn1201 und vpn1211

Karten auf Basis der Bluesteel 5501 und 5601 Chips?tze
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

Karten auf Basis der Broadcom BCM5801, BCM5802, BCM5805, BCM5820, BCM
5821, BCM5822 Chips?tze
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.15. Diverses
--------------

FAX-Modem/PCCARD

-  MELCO IGM-PCM56K/IGM-PCM56KH

-  Nokia Card Phone 2.0 (gsm900/dcs1800 HSCSD terminal)

Diskettenlaufwerk
(`fdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

Tastaturen:

-  Standard-Tastaturen

-  USB-Tastaturen (genaue Modellbezeichnungen finden Sie im Kapitel `USB
   Ger?te <#USB>`__)

M?use:

-  Bus M?use und kompatible Ger?te
   (`mse(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mse&sektion=4&manpath=FreeBSD+5.1-release>`__
   Treiber)

-  serielle M?se und kompatible Ger?te

-  USB M?use (genaue Modellbezeichnungen finden im Kapitel `USB
   Ger?te <#USB>`__)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** In
    `moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+5.1-release>`__
    finden Sie weitere Informationen zur Nutzung von M?usen in FreeBSD.
    Informationen ?ber die Nutzung von M?usen in **XFree86** erhalten
    Sie bei http://www.xfree86.org/.

.. raw:: html

   </div>

Parallele Schnittstellen nach \`\`PC-9821 Standard''
(`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

Joystick Port des SoundBlaster(98)
(`joy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=joy&sektion=4&manpath=FreeBSD+5.1-release>`__
Treiber)

PHS Data Communication Card/PCCARD

-  NTT DoCoMo P-in Comp@ct

-  Panasonic KX-PH405

-  SII MC-P200

Power Management Controller im NEC PC-98 Note (pmc Treiber)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

Diese Datei und andere Dokumente zu dieser Version sind bei
ftp://ftp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Alle Anwender von FreeBSD 5-CURRENT sollten sich in die Mailingliste
<current@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
