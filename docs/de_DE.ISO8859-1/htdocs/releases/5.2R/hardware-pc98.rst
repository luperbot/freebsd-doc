=============================================
FreeBSD/pc98 5.2-RELEASE Hardware Information
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 5.2-RELEASE Hardware Information
=============================================

The FreeBSD German Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

Copyright © 2002, 2003 The FreeBSD German Documentation Project

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Inhaltsverzeichnis**
1. `Einf?hrung <#INTRO>`__
2. `Unterst?tzte Systeme <#SUPPORT-SYS>`__
3. `Unterst?tzte Ger?te <#SUPPORT>`__
3.1. `Festplatten-Controller <#AEN38>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN757>`__
3.4. `ATM Karten <#AEN767>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN786>`__
3.6. `Diverse Netzwerkkarten <#AEN812>`__
3.7. `ISDN Karten <#AEN835>`__
3.8. `Serielle Schnittstellen <#AEN899>`__
3.9. `Audio Hardware <#AEN1072>`__
3.10. `Kameras, TV-Karten, etc <#AEN1194>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Bluetooth Ger?te <#BLUETOOTH>`__
3.14. `Verschl?sselungs-Hardware <#AEN1420>`__
3.15. `Diverses <#AEN1438>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
5.2-RELEASE auf NEC PC-98x1 Systemen (meistens einfach FreeBSD/pc98
5.2-RELEASE genannt). Hier finden Sie zum einen alle die Ger?te, von
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
-----------------------

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
----------------------

$FreeBSD$
Dieses Kapitel enth?lt alle Ger?te, die auf jeden Fall von FreeBSD auf
pc98 Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
funktionieren, allerdings wurden sie noch nicht getestet. R?ckmeldungen,
Erg?nzungen und Korrekturen werden dankend angenommen.

Wenn m?glich, wird der zum jeweiligen Ger?t bzw. zur jeweiligen
Ger?teklasse passende Treiber aufgef?hrt. Wenn es unter FreeBSD eine
Online-Hilfe f?r den betreffenden Treiber gibt (das ist der Normalfall),
wird sie ebenfalls aufgef?hrt. In dieser Online-Hilfe finden Sie
genauere Informationen ?ber vom jeweiligen Treiber unterst?tzen Ger?te
und Controller finden.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Listen der von den jeweiligen Treiber
    unterst?tzen Ger?te werden nach und nach aus diesem Dokument
    entfernt, damit es nur noch eine, zuverl?ssige Quelle f?r diese
    Informationen gibt. Wenn diese Aufr?umarbeiten abgeschlossen sind,
    finden Sie die Liste der von einem Treiber unterst?tzten Ger?te in
    der Onlinehilfe zum jeweiligen Treiber.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.1. Festplatten-Controller
~~~~~~~~~~~~~~~~~~~~~~~~~~~

IDE/ATA Controller
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

Adaptec AIC-6260 und AIC-6360 basierte Karten
(`aic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aic&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec AIC7770, AIC7850, AIC7860, AIC7870, AIC7880, und AIC789x SCSI
Controller
(`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

C-Bus SCSI Interfaces in NEC PC-9801-55, 92 und kompatiblen (ct Treiber)

-  NEC PC-9801-55, 92 und kompatible

   ICM IF-2660

   Midori-Denshi MDC-554NA

   Logitec LHA-N151

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? flags 0x00000 angegeben werden, wenn DMA-Transfers
       genutzt werden sollen.

   .. raw:: html

      </div>

-  I-O DATA SC-98II

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? flags 0x10000 angegeben werden, wenn DMA-Transfers
       genutzt werden sollen.

   .. raw:: html

      </div>

-  TEXA HA-55BS2 und neuer

   Midori-Denshi MDC-926Rs

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? flags 0x20000 angegeben werden, wenn DMA-Transfers
       genutzt werden sollen.

   .. raw:: html

      </div>

-  ELECOM Bus-master SCSI Anschlu?

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? flags 0x30000 angegeben werden, wenn
       Bus-Master-Transfers genutzt werden sollen.

   .. raw:: html

      </div>

-  Alle SMIT-f?higen SCSI Anschl?sse

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? flags 0x40000 angegeben werden, wenn SMIT-Transfers
       genutzt werden sollen.

   .. raw:: html

      </div>

-  Logitec LHA-20x Familie

   ICM IF-2766, IF-2766ET, IF-2767 und IF-2769

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** In der Konfigurationsdatei f?r den angepa?ten
       Kernel mu? flags 0x50000 angegeben werden, wenn
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
`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`adw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  MELCO IFC-USP, RATOC REX-PCI30 und @Nifty FNECHARD IFC-USUP-TX
   (`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

LSI/SymBios (ehemals NCR) 53C8XX und 53C10XX PCI SCSI Controller, sowohl
auf Hostadaptern als auch on-board
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

PC-Card SCSI Hostadapter auf Basis des NCR 53C500
(`ncv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Qlogic Controller und kompatible Ger?te
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Tekram DC390 und DC390T Controller, eventuell auch andere auf dem AMD
53c974 basierende Karten
(`amd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  MELCO IFC-DP

PC-Card SCSI Hostadapter auf Basis des Workbit Ninja SCSI-3
(`nsp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nsp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

LSI Logic Fusion/MP architecture Fiber Channel Controller
(`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Mit allen unterst?tzten SCSI Controllern ist die uneingeschr?nkte
Nutzung von SCSI-I, SCSI-II und SCSI-III Ger?ten m?glich. Dazu geh?ren
Festplatten, optische Platten, Bandlaufwerke (u.a. DAT, 8mm Exabyte,
Mammoth, DLT), Wechselplatten, Ger?te mit eigenem Prozessor und CDROM.
Sie k?nnen mit den CD-Treibern (wie
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)
lesend auf WORMs zugreifen, wenn diese die entsprechenden Kommandos f?r
CDROM unterst?tzen. F?r schreibenden Zugriff steht das Programm
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__
aus der Ports Collection zur Verf?gung.

Zur Zeit unterst?tzte CDROM-Arten:

-  SCSI Ger?te (dazu geh?ren auch ProAudio Spectrum und SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)

-  ATAPI IDE Ger?te
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2. Netzwerkkarten
~~~~~~~~~~~~~~~~~~~

Adaptec Duralink PCI Fast Ethernet Netzwerkkarten, die auf dem Adaptec
AIC-6915 Fast Ethernet Controller basieren
(`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Alteon Networks PCI Gigabit Ethernet Netzwerkkarten mit Tigon 1 und
Tigon 2 Chipsatz
(`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

AMD PCnet Netzwerkkarten
(`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  Contec C-NET(98)S

-  PCI NIC using AMD AM79C97x (PCnet-PCI/Fast)

-  NEC SV-98/2-B05, B06 (PCI)

-  Allied-Telesis LA-PCI (PCI)

Netzwerkkarten mit SMC 83c17x (EPIC)
(`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit National Semiconductor DS8390, dazu geh?ren auch die
NE2000 und alle Nachbauten der NE2000
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Winbond W89C840F Fast Ethernet Karten
(`wb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

VIA Technologies VT3043 \`\`Rhine I'', VT86C100A \`\`Rhine II'' und
VT6105/VT6105M \`\`Rhine III'' Fast Ethernet Karten
(`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Silicon Integrated Systems SiS 900 und SiS 7016 PCI Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

National Semiconductor DP83815 Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

National Semiconductor DP83820 und DP83821 Gigabit Ethernet Karten
(`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Sundance Technologies ST201 PCI Fast Ethernet Karten
(`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Texas Instruments ThunderLAN PCI Netzwerkkarten
(`tl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

DEC/Intel 21143 Fast Ethernet Karten und Nachbauten f?r PCI, MiniPCI,
und CardBus
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

USB Ethernet Karten mit ADMtek Inc. AN986
(`aue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

USB Netzwerkkarten mit CATC USB-EL1210A
(`cue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

USB Netzwerkkarten mit Kawasaki LSI KU5KUSB101B
(`kue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

ASIX Electronics AX88172 USB Netzwerkkarten
(`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

USB-Netzwerkkarten auf Basis des RealTek RTL8150
(`rue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rue&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit DEC DC21040, DC21041, DC21140, DC21141, DC21142 oder
DC21143
(`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Fast Ethernet Karten mit Fujitsu MB86960A/MB86965A
(`fe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Fast Ethernet Karten mit Intel 82557, 82558, 82559, 82550 und 82562
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
(`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit 3Com Etherlink XL Chipsatz
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

3Com 3C59X Familie
(`vx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

National Semiconductor DP8393X (SONIC) Ethernet Karten (snc Treiber)

-  NEC PC-9801-83, -84, -103, und -104

-  NEC PC-9801N-25 und -J02R

Gigabit Ethernet Karten mit Level 1 LXT1001 NetCellerator Controller
(`lge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Ethernet und Fast Ethernet Karten mit 3Com 3XP Typhoon/Sidewinder
(3CR990) Chipsatz
(`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Gigabit Ethernet Karten mit Broadcom BCM570x
(`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Gigabit Ethernet Karten mit Intel 82542 und 82543 Controllern
(`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber), sowie Karten auf Basis der 82540EM, 82544, 82545EM und 82546EB
Chips?tze (nur
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Myson Ethernetkarten
(`my(4) <http://www.FreeBSD.org/cgi/man.cgi?query=my&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Fast Ethernet und Gigabit Ethernet Karten mit RealTek RTL8139C+,
RTL8169, RTL8169S oder RTL8110S Chipsatz
(`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3. FDDI Karten
~~~~~~~~~~~~~~~~

DEC DEFPA PCI
(`fpa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fpa&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4. ATM Karten
~~~~~~~~~~~~~~~

Efficient Networks, Inc. ENI-155p ATM PCI Karten (hea Treiber)

FORE Systems, Inc. PCA-200E ATM PCI Karten (hfa und
`fatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

ATM Karten mit IDT 77201/211
(`idt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=idt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

FORE Systems, Inc. HE155 und HE622 ATM Karten
(`hatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Karten)

ATM-Karten auf Basis des IDT77252 Chipsatzes
(`patm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=patm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.5. Karten f?r drahtlose Netzwerke
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lucent Technologies WaveLAN/IEEE 802.11b Wireless Ethernet Karten und
kompatible auf Basis der Hermes, Intersil PRISM-II, Intersil PRISM-2.5,
Intersil Prism-3 und Symbol Spectrum24 Chips?tze
(`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Cisco/Aironet 802.11b Wireless Karten
(`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Raytheon Raylink 2.4GHz Wireless Karten
(`ray(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ray&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

802.11b Karten mit AMD Am79C930 und Harris (Intersil) Chipsatz
(`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.6. Diverse Netzwerkkarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.7. ISDN Karten
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.8. Serielle Schnittstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Eingebaute Serielle Schnittstellen
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  PC-9801 on-board

-  PC-9821 2'nd CCU (flags 0x12000000)

NEC PC-9861K, PC-9801-101 und Midori-Denshi MDC-926Rs
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  COM2 (Flags 0x01000000)

-  COM3 (Flags 0x02000000)

NEC PC-9801-120
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x11000000" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Microcore MC-16550, MC-16550II, MC-RS98
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x14000?01" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Media Intelligent RSB-2000, RSB-3000 und AIWA B98-02
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x15000?01" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Media Intelligent RSB-384
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x16000001" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

I-O DATA RSA-98III
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** "flags 0x18000?01" mu? in der Konfigurationsdatei
    angegeben werden.

.. raw:: html

   </div>

Hayes ESP98
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
~~~~~~~~~~~~~~~~~~~

NEC PC-9801-73, 86 und Kompatible (nss Treiber)

-  NEC A-MATE on-board Audio

-  Q-Vision WaveStar, WaveMaster

NEC X-MATE, CanBe, ValueStar on-board (mss Treiber)

Creative Technologies SoundBlaster(98)
(`sb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

I-O DATA CD-BOX
(`sb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

MPU-401 und kompatible (mpu Treiber)

-  Q-Vision WaveStar

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10. Kameras, TV-Karten, etc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Karten mit Brooktree Bt848/849/878/879
(`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.11. USB Ger?te
~~~~~~~~~~~~~~~~

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

Host Controllers, die dem OHCI 1.0 Standard entsprechen
(`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Host Controllers, die dem UHCI 1.1 Standard entsprechen
(`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

USB 2.0 Controller, die das EHCI Interface nutzen
(`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Hubs

Tastaturen
(`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Diverses

-  Assist Computer Systems PC Camera C-M1

-  ActiveWire I/O Board

-  Creative Technology Video Blaster WebCam Plus

-  Diamond Rio 500, 600, und 800 MP3 Player
   (`urio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  D-Link DSB-R100 USB Radio
   (`ufm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ufm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  Mirunet AlphaCam Plus

Modems
(`umodem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umodem&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  3Com 5605

-  Metricom Ricochet GS USB wireless modem

-  Yamaha Broadband Wireless Router RTW65b

M?use
(`ums(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ums&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Drucker und Adapterkabel f?r konventionelle Drucker
(`ulpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ulpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  ATen parallel printer Adapter

-  Belkin F5U002 parallel printer Adapter

-  Canon BJ F850, S600

-  Canon LBP-1310, 350

-  Entrega USB-to-parallel printer Adapter

-  Hewlett-Packard HP Deskjet 3420 (P/N: C8947A #ABJ)

-  Oki Data MICROLINE ML660PS

-  Seiko Epson PM-900C, 880C, 820C, 730C

Serielle Schnittstellen
(`ubsa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsa&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Scanner (zusammen mit **SANE**)
(`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Massenspeicher
(`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

Audio Ger?te
(`uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uaudio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Handspring Visor und andere PDAs mit PalmOS
(`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.13. Bluetooth Ger?te
~~~~~~~~~~~~~~~~~~~~~~

PCCARD Host Kontroller
(`ng\_bt3c(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bt3c&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  3Com/HP 3CRWB6096-A PCCARD Adapter

USB Host Kontroller
(`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Karten auf Basis der Hifn 7751, 7811 und 7951 Chips
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Karten auf Basis der SafeNet 1141 or 1741 Chips?tze
(`safe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=safe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Karten auf Basis der Bluesteel 5501 und 5601 Chips?tze
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Karten auf Basis der Broadcom BCM5801, BCM5802, BCM5805, BCM5820, BCM
5821, BCM5822 Chips?tze
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.15. Diverses
~~~~~~~~~~~~~~

FAX-Modem/PCCARD

-  MELCO IGM-PCM56K/IGM-PCM56KH

-  Nokia Card Phone 2.0 (gsm900/dcs1800 HSCSD terminal)

Diskettenlaufwerk
(`fdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Tastaturen:

-  Standard-Tastaturen

-  USB-Tastaturen (genaue Modellbezeichnungen finden Sie im Kapitel `USB
   Ger?te <#USB>`__)

M?use:

-  Bus M?use und kompatible Ger?te
   (`mse(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mse&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  serielle M?se und kompatible Ger?te

-  USB M?use (genaue Modellbezeichnungen finden im Kapitel `USB
   Ger?te <#USB>`__)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** In
    `moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
    finden Sie weitere Informationen zur Nutzung von M?usen in FreeBSD.
    Informationen ?ber die Nutzung von M?usen in **XFree86** erhalten
    Sie bei http://www.xfree86.org/.

.. raw:: html

   </div>

Parallele Schnittstellen nach \`\`PC-9821 Standard''
(`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Joystick Port des SoundBlaster(98)
(`joy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=joy&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
