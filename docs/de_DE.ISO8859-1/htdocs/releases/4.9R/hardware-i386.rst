=============================================
FreeBSD/i386 4.9-RELEASE Hardware Information
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/i386 4.9-RELEASE Hardware Information
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
1. `Einf?hrung <#AEN15>`__
2. `Unterst?tzte Prozessoren und Mainboards <#AEN20>`__
3. `Unterst?tzte Ger?te <#AEN31>`__
3.1. `Festplatten-Controller <#AEN37>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN1343>`__
3.4. `ATM Karten <#AEN1353>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN1396>`__
3.6. `Diverse Netzwerkkarten <#AEN1524>`__
3.7. `ISDN Karten <#AEN1541>`__
3.8. `Serielle Multi-Port Karten <#AEN1605>`__
3.9. `Audio Hardware <#AEN1737>`__
3.10. `Kameras, TV-Karten, etc <#AEN1840>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Verschl?sselungs-Hardware <#AEN2101>`__
3.14. `Diverses <#AEN2126>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
4.9-RELEASE auf i386 Systemen (meistens einfach FreeBSD/i386 4.9-RELEASE
genannt). Hier finden Sie zum einen alle die Ger?te, von denen wir
wissen, da? Sie funktionieren; zum anderen finden Sie hier Hinweise, wie
Sie den Kernel anpassen k?nnen, wenn Sie ein bisher noch nicht
unterst?tztes Ger?t verwenden wollen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Dieses Dokument enth?lt Informationen f?r i386
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

2. Unterst?tzte Prozessoren und Mainboards
------------------------------------------

FreeBSD/i386 kann auf vielen \`\`IBM PC kompatiblen'' Maschinen benutzt
werden. Es ist nicht m?glich, hier alle unterst?tzten Kombinationen
aufzuf?hren, die von FreeBSD unterst?tzt werden, da es viel zu viele
M?glichkeiten gibt. Dennoch ist es m?glich, einige allgemeine Hinweise
zu geben.

Fast alle i386-kompatiblen Prozessoren werden unterst?tzt. Alle
Prozessoren von Intel ab dem 80386 werden unterst?tzt, also 80386,
80486, Pentium, Pentium Pro, Pentium II, Pentium III, Pentium 4, und die
Modellvarianten dieser Prozessoren, wie der Xeon und Celeron. Der
80386sx wird zwar unterst?tzt, wir raten aber dringend von der
Verwendung dieser CPU ab). Alle i386-kompatiblen Prozessoren von AMD
werden unterst?tzt, dazu geh?ren Am486, Am5x86, K5, K6 (alle Varianten),
Athlon (einschlie?lich Athlon-MP, Athlon-XP, Athlon-4 und Athlon
Thunderbird) und Duron. Der integrierte Prozessor AMD Élan SC520 wird
unterst?tzt. Der Transmeta Crusoe wird erkannt und unterst?tzt, das
gleiche gilt f?r die i386-kompatiblen Prozessoren von Cyrix und NexGen.

F?r diese Plattform gibt es ganz Reihe verschiedener Mainboards. F?r
Mainboards mit ISA, VLB, EISA, AGP, und PCI Steckpl?tzen ist die
Unterst?tzung ausgezeichnet. Der MCA (\`\`MicroChannel'') Bus, der in
den IBM PS/2 Computern zu finden ist, wird nur teilweise unterst?tzt.

Symmetrische Multi-Prozessor (SMP) Systeme werden im allgemeinen von
FreeBSD unterst?tzt. Allerdings kommt es in einigen F?llen zu Problemen,
weil das BIOS oder das Mainboard fehlerhaft sind. Ein Blick in der
Archive der Mailingliste `FreeBSD symmetric
multiprocessing <http://lists.FreeBSD.org/mailman/listinfo/freebsd-smp>`__
kann hier weiterhelfen.

FreeBSD l?uft normalerweise auf Laptops mit i386-Prozessoren, allerdings
gibt es keinen einheitlichen Standard f?r die Unterst?tzung bestimmter
Ausstattungsmerkmale wie Audio, Grafik, Power Management, und PCCARD
Steckpl?tzen. Diese Merkmale sind von Maschine zu Maschine
verschiedenen. In vielen F?llen ist es sogar notwendig, FreeBSD speziell
anzupassen, um Fehlern in der Hardware und anderen Merkw?rdigkeiten
auszugleichen. Im Zweifelsfalle kann ein Blick in der Archive der
Mailingliste `FreeBSD laptop
computer <http://lists.FreeBSD.org/mailman/listinfo/freebsd-mobile>`__
weiterhelfen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Unterst?tzte Ger?te
----------------------

$FreeBSD$
Dieses Kapitel enth?lt alle Ger?te, die auf jeden Fall von FreeBSD auf
i386 Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~

IDE/ATA Controller
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Acerlabs Aladdin

-  AMD 756 ATA66, 766 ATA100, 768 ATA100

-  Cenatek Rocket Drive

-  CMD 646, 648 ATA66, und 649 ATA100

-  Cypress 82C693

-  Cyrex 5530 ATA33

-  HighPoint HPT366 ATA66, HPT370 ATA100, HPT372 ATA133, HPT374 ATA133

-  Intel PIIX, PIIX3, PIIX4

-  Intel ICH ATA66, ICH2 ATA100, ICH3 ATA100, ICH4 ATA100

-  nVidia nForce ATA100

-  Promise ATA100 OEM Baustein (pdc20265)

-  Promise ATA133 OEM Baustein (pdc20269)

-  Promise Fasttrak-33, -66, -100, -100 TX2/TX4, -133 TX2/TX2 000

-  Promise Ultra-33, -66, -100, -133 TX2/TX2000

-  ServerWorks ROSB4 ATA33

-  ServerWorks CSB5 ATA66/ATA100

-  Sil 0680 UDMA6

-  SiS 530, 540, 620

-  SiS 630, 633, 635, 645, 730, 733, 735, 740, 745, 750

-  SiS 5591 ATA100

-  VIA 82C586 ATA33, 82C596 ATA66, 82C686a ATA66, 82C686b ATA100

-  VIA 8233, 8235 ATA133

Adaptec SCSI Controller

-  Adaptec 1535 ISA SCSI Controller

-  Adaptec 154x ISA SCSI Controller
   (`aha(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aha&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec 164x MCA SCSI Controller
   (`aha(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aha&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec 174x EISA SCSI Controller im normalen und erweiterten Modus
   (`aha(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aha&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   und
   `ahb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahb&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec 274x EISA SCSI Controller, sowohl die Narrow als auch die
   Wide Version
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec 284x VLB SCSI Controller, sowohl die Narrow als auch die Wide
   Version
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec
   19160/291x/2920/2930/2940/2950/29160/3940/3950/3960/39160/398x/494x
   PCI SCSI Controller, einschlie?lich der Narrow/Wide/Twin/Ultra/Ultra2
   Versionen
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec AIC7770, AIC7850, AIC7860, AIC7870, AIC7880, und AIC789x
   on-board SCSI Controller
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec 1510 ISA SCSI Controller (nicht bootf?hig)

-  Adaptec 152x ISA SCSI Controller
   (`aha(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aha&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Adaptec AIC-6260 und AIC-6360 basierte Karten, dazu geh?ren auch der
   AHA-152x und die SoundBlaster SCSI Karten
   (`aic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aic&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

Ultra-320 SCSI Controller auf Basis der Adaptec AIC7901, AIC7901A und
7902 Ultra320 Controller (ahd Treiber)

-  Adaptec 29320, 29320A, 29320B, 29320LP

-  Adaptec 39320, 39320D

Adaptec 2100S/32x0S/34x0S SCSI RAID Controller
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Adaptec 2000S/2005S Zero-Channel RAID
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Adaptec 2400A ATA-100 RAID Controller
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Adaptec FSA RAID Controller
(`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Adaptec AAC-2622

-  Adaptec AAC-364

-  Adaptec SCSI RAID 5400S

-  Dell PERC 2/QC

-  Dell PERC 2/Si

-  Dell PERC 3/Di

-  Dell PERC 3/QC

-  Dell PERC 3/Si

-  HP NetRAID-4M

AdvanSys SCSI Controllers (alle Modelle.
`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
und
`adw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

BusLogic MultiMaster Hostadapter, \`\`W''-Modelle
(`bt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bt&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber):

-  BT-948

-  BT-958

-  BT-958D

BusLogic MultiMaster Hostdapter, \`\`C''-Modelle
(`bt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bt&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber):

-  BT-946C

-  BT-956C

-  BT-956CD

-  BT-445C

-  BT-747C

-  BT-757C

-  BT-757CD

-  BT-545C

-  BT-540CF

BusLogic MultiMaster Hostadapter, \`\`S''-Typen
(`bt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bt&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber):

-  BT-445S

-  BT-747S

-  BT-747D

-  BT-757S

-  BT-757D

-  BT-545S

-  BT-542D

-  BT-742A

-  BT-542B

BusLogic MultiMaster Hostadapter, \`\`A''-Typen
(`bt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bt&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber):

-  BT-742A

-  BT-542B

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** BusLogic/Mylex \`\`Flashpoint'' Karten werden noch
    nicht unterst?tzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** AMI FastDisk Controller werden auch unterst?tzt, wenn
    es sich um vollwertige Nachbauten des BusLogic MultiMaster handelt.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Buslogic/Bustek BT-640, Storage Dimensions
    SDC3211B und SDC3211F Microchannel (MCA) Hostadapter werden
    ebenfalls unterst?tzt.

.. raw:: html

   </div>

DPT SmartCACHE Plus, SmartCACHE III, SmartRAID III, SmartCACHE IV und
SmartRAID IV SCSI/RAID Controller
(`dpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dpt&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

DPT SmartRAID V und VI SCSI RAID Controller
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  PM1554

-  PM2554

-  PM2654

-  PM2865

-  PM2754

-  PM3755

-  PM3757

AMI MegaRAID RAID Controller, Modellreihen Express und Enterprise
(`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  MegaRAID Series 418

-  MegaRAID Enterprise 1200 (Series 428)

-  MegaRAID Enterprise 1300 (Series 434)

-  MegaRAID Enterprise 1400 (Series 438)

-  MegaRAID Enterprise 1500 (Series 467)

-  MegaRAID Enterprise 1600 (Series 471)

-  MegaRAID Elite 1500 (Series 467)

-  MegaRAID Elite 1600 (Series 493)

-  MegaRAID Express 100 (Series 466WS)

-  MegaRAID Express 200 (Series 466)

-  MegaRAID Express 300 (Series 490)

-  MegaRAID Express 500 (Series 475)

-  Dell PERC

-  Dell PERC 2/SC

-  Dell PERC 2/DC

-  Dell PERC 3/DCL

-  Dell PERC 4/Di

-  HP NetRaid-1si

-  HP NetRaid-3si

-  HP Embedded NetRaid

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Sie k?nnen von diesen Hostadapter booten. Die
    EISA-Varianten werden nicht unterst?tzt.

.. raw:: html

   </div>

Mylex DAC960 und DAC1100 RAID Controller, Firmware-Version 2.x, 3.x, 4.x
und 5.x
(`mlx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mlx&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  DAC960P

-  DAC960PD

-  DAC960PDU

-  DAC960PL

-  DAC960PJ

-  DAC960PG

-  AcceleRAID 150

-  AcceleRAID 250

-  eXtremeRAID 1100

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Sie k?nnen von diesen Hostadapter booten. Die
    EISA-Varianten werden nicht unterst?tzt.

.. raw:: html

   </div>

Mylex PCI to SCSI RAID Controllers, Firmware-Version 6.x
(`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  AcceleRAID 160

-  AcceleRAID 170

-  AcceleRAID 352

-  eXtremeRAID 2000

-  eXtremeRAID 3000

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die nicht aufgef?hrten kompatiblen Controller von
    Mylex sollten auch funktionieren, allerdings wurde dies noch nicht
    getestet.

.. raw:: html

   </div>

3ware Escalade ATA RAID Controller
(`twe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twe&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  5000 series

-  6000 series

-  7000 series

LSI/SymBios (ehemals NCR) 53C810, 53C810a, 53C815, 53C825, 53C825a,
53C860, 53C875, 53C875a, 53C876, 53C885, 53C895, 53C895a, 53C896,
53C1010-33, 53C1010-66, 53C1000, 53C1000R PCI SCSI Controller, sowohl
auf Hostadaptern als auch on-board
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
und
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  ASUS SC-200, SC-896

-  Data Technology DTC3130 (alle Modelle)

-  DawiControl DC2976UW

-  Diamond FirePort (alle)

-  NCR Hostadapter (alle)

-  Symbios Hostadapter (alle)

-  Tekram DC390W, 390U, 390F, 390U2B, 390U2W, 390U3D, und 390U3W

-  Tyan S1365

PC-Card SCSI Hostadapter auf Basis des NCR 53C500 (ncv Treiber)

-  IO DATA PCSC-DV

-  KME KXLC002 (TAXAN ICD-400PN, etc.), KXLC004

-  Macnica Miracle SCSI-II mPS110

-  Media Intelligent MSC-110, MSC-200

-  NEC PC-9801N-J03R

-  New Media Corporation BASICS SCSI

-  Qlogic Fast SCSI

-  RATOC REX-9530, REX-5572 (nur SCSI)

ISA/PC-Card SCSI Hostadapter auf Basis der TMC 18C30, 18C50 (stg
Treiber)

-  Future Domain SCSI2GO

-  IBM SCSI PCMCIA Karte

-  ICM PSC-2401 SCSI

-  Melco IFC-SC

-  RATOC REX-5536, REX-5536AM, REX-5536M, REX-9836A

Qlogic(-?hnlich) Controller
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Qlogic 1020, 1040 SCSI und Ultra SCSI Hostadapter

-  Qlogic 1240 dual Ultra SCSI Controller

-  Qlogic 1080 Ultra2 LVD und 1280 Dual Ultra2 LVD Controller

-  Qlogic 12160 Ultra3 LVD Controller

-  Qlogic 2100 und Qlogic 2200 Fibre Channel SCSI Controller

-  Qlogic 2300 und Qlogic 2312 2-Gigabit Fibre Channel SCSI Controller

-  Performance Technology SBS440 ISP1000

-  Performance Technology SBS450 ISP1040

-  Performance Technology SBS470 ISP2100

-  Antares Microsystems P-0033 ISP2100

DTC 3290 EISA SCSI Controller (1542 Emulation)

Tekram DC390 und DC390T Controller, eventuell auch andere auf dem AMD
53c974 basierende Karte
(`amd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

PC-Card SCSI Hostadapter auf Basis des Workbit Ninja SCSI-3 (nsp
Treiber)

-  Alpha-Data AD-PCS201

-  IO DATA CBSC16

SCSI-Controller f?r den Druckerport
(`vpo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vpo&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  AIC 7110 SCSI Controller (ist im Iomega ZIP eingebaut)

-  Iomega Jaz Traveller

-  Iomega MatchMaker SCSI Interface (ist im Iomega ZIP+ eingebaut)

Compaq Intelligent Drive Array Controller
(`ida(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ida&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Compaq SMART Array 221

-  Compaq Integrated SMART Array Controller

-  Compaq SMART Array 4200, 4250ES Controller

-  Compaq SMART Array 3200, 3100ES Controller

-  Compaq SMART-2/DH, SMART-2/SL, SMART-2/P, SMART-2E und SMART
   Controller

SCSI Hostadapter, die das \`\`Command Interface for SCSI-3 Support''
nutzen
(`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Compaq Smart Array 5\* series (5300, 5i, 532)

Intel Integrated RAID Controllers
(`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Intel RAID Controller SRCMR

-  ICP Vortex SCSI RAID Controller (alle Wide/Ultra160, 32-Bit/64-Bit
   PCI Varianten)

Promise SuperTrak ATA RAID Controller
(`pst(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pst&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Promise SuperTrak SX6000 ATA RAID Controller

LSI Logic Fusion/MP architecture Fiber Channel Controller (mpt Treiber)

-  LSI FC909, FC929

-  LSI 53c1020, 53c1030

PCI SCSI Hostadapter auf Basis des Tekram TRM-S1040 SCSI Chipsatzes
(`trm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=trm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Tekram DC395U/UW/F

-  Tekram DC315U

Mit allen unterst?tzten SCSI Controllern ist die uneingeschr?nkte
Nutzung von SCSI-I, SCSI-II und SCSI-III Ger?ten m?glich. Dazu geh?ren
Festplatten, optische Platten, Bandlaufwerke (u.a. DAT, 8mm Exabyte,
Mammoth, DLT), Wechselplatten, Ger?te mit eigenem Prozessor und CDROM.
Sie k?nnen mit den CD-Treibern (wie
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__)
lesend auf WORMs zugreifen, wenn diese die entsprechenden Kommandos f?r
CDROM unterst?tzen. F?r schreibenden Zugriff steht das Programm
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__
aus der Ports Collection zur Verf?gung.

Zur Zeit unterst?tzte CDROM-Arten:

-  SCSI Ger?te (dazu geh?ren auch ProAudio Spectrum und SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__)

-  Sony-eigener Anschlu? (alle Modelle)
   (`scd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__)

-  ATAPI IDE Ger?te
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__)

Die folgenden Treiber wurden zwar vom alten SCSI-Treibermodell
unterst?tzt, wurden aber noch nicht f?r das neue
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__-System
umgeschrieben:

-  NCR5380/NCR53400 (\`\`ProAudio Spectrum'') SCSI Controller

-  UltraStor 14F, 24F und 34F SCSI Controller.

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Dieser Treiber ist in Arbeit, allerdings gibt es
       noch keine verl??lichen Informationen, ob und wann der Treiber
       fertig wird.

   .. raw:: html

      </div>

   | 

-  Seagate ST01/02 SCSI Controller

-  Future Domain 8xx/950 SCSI Controller

-  WD7000 SCSI Controller

Dieser Treiber wird nicht mehr gepflegt:

-  Mitsumi-eigener CDROM-Anschlu? (alle Varianten)
   (`mcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mcd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2. Netzwerkkarten
~~~~~~~~~~~~~~~~~~~

Adaptec Duralink PCI Fast Ethernet Netzwerkkarten, die auf dem Adaptec
AIC-6915 Fast Ethernet Controller basieren
(`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  ANA-62011 64-bit single port 10/100baseTX

-  ANA-62022 64-bit dual port 10/100baseTX

-  ANA-62044 64-bit quad port 10/100baseTX

-  ANA-69011 32-bit single port 10/100baseTX

-  ANA-62020 64-bit single port 100baseFX

Allied-Telesis AT1700 und RE2000 Karten
(`fe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fe&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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
(`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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
(`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
und
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  AMD PCnet/PCI (79c970 & 53c974 oder 79c974)

-  AMD PCnet/FAST

-  Isolan AT 4141-0 (16 Bit)

-  Isolink 4110 (8 Bit)

-  PCnet/FAST+

-  PCnet/FAST III

-  PCnet/PRO

-  PCnet/Home

-  HomePNA

Netzwerkkarten mit SMC 83c17x (EPIC)
(`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  SMC EtherPower II 9432 Familie

Netzwerkkarten mit National Semiconductor DS8390, dazu geh?ren auch die
NE2000 und alle Nachbauten der NE2000
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3C503 Etherlink II
   (`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  DEC Etherworks DE305

-  Hewlett-Packard PC Lan+ 27247B und 27252A

-  NetVin 5000

-  Novell NE1000, NE2000, und NE2100

-  RealTek 8029

-  SMC Elite 16 WD8013

-  SMC Elite Ultra

-  SMC WD8003E, WD8003EBT, WD8003W, WD8013W, WD8003S, WD8003SBT und
   WD8013EBT und Nachbauten

-  Surecom NE-34

-  VIA VT86C926

-  Winbond W89C940

NE2000-kompatible PC-Card (PCMCIA) Ethernet und FastEthernet Karten
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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

RealTek RTL 8002 Pocket Ethernet
(`rdp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rdp&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

RealTek 8129/8139 Fast Ethernet Netzwerkkarten
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Accton \`\`Cheetah'' EN1207D (MPX 5030/5038; RealTek 8139 Nachbau)

-  Allied Telesyn AT2550

-  Allied Telesyn AT2500TX

-  D-Link DFE-530TX+, DFE-538TX

-  Farallon NetLINE 10/100 PCI

-  Genius GF100TXR (RTL8139)

-  KTX-9130TX 10/100 Fast Ethernet

-  NDC Communications NE100TX-E

-  Netronix Inc. EA-1210 NetEther 10/100

-  OvisLink LEF-8129TX

-  OvisLink LEF-8139TX

-  SMC EZ Card 10/100 PCI 1211-TX

Lite-On 82c168/82c169 PNIC Fast Ethernet Netzwerkkarten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Kingston KNE110TX

-  LinkSys EtherFast LNE100TX

-  Matrox FastNIC 10/100

-  NetGear FA310-TX Rev. D1

Macronix 98713, 98713A, 98715, 98715A und 98725 Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Accton EN1217 (98715A)

-  Adico AE310TX (98715A)

-  Compex RL100-TX (98713 oder 98713A)

-  CNet Pro120A (98713 oder 98713A)

-  CNet Pro120B (98715)

-  NDC Communications SFA100A (98713A)

-  SVEC PN102TX (98713)

Macronix/Lite-On PNIC II LC82C115 Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  LinkSys EtherFast LNE100TX Version 2

Winbond W89C840F Fast Ethernet Karten
(`wb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wb&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Trendware TE100-PCIE

VIA Technologies VT3043 \`\`Rhine I'', VT86C100A \`\`Rhine II'' und
VT6105/VT6105M \`\`Rhine III'' Fast Ethernet Karten
(`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  AOpen/Acer ALN-320

-  D-Link DFE-530TX

-  Hawking Technologies PN102TX

Silicon Integrated Systems SiS 900 und SiS 7016 PCI Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  SiS 630, 635 und 735 Mainboard Chips?tze

National Semiconductor DP83815 Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  NetGear FA311-TX

-  NetGear FA312-TX

National Semiconductor DP83820 und DP83821 Gigabit Ethernet Karten
(`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Addtron AEG320T

-  Asante FriendlyNet GigaNIC 1000TA und 1000TPC

-  D-Link DGE-500T

-  LinkSys EG1032 (32-bit PCI) und EG1064 (64-bit PCI)

-  Netgear GA621 und GA622T

-  SMC EZ Card 1000 (SMC9462TX)

-  Surecom Technology EP-320G-TX

Sundance Technologies ST201 PCI Fast Ethernet Karten
(`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  D-Link DFE-550TX

SysKonnect SK-984x PCI Gigabit Ethernet Karten
(`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  SK-9821 1000baseT copper, single port

-  SK-9822 1000baseT copper, dual port

-  SK-9841 1000baseLX single mode fiber, single port

-  SK-9842 1000baseLX single mode fiber, dual port

-  SK-9843 1000baseSX multimode fiber, single port

-  SK-9844 1000baseSX multimode fiber, dual port

Texas Instruments ThunderLAN PCI Netzwerkkarten
(`tl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tl&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Compaq Netelligent 10, 10/100, 10/100 Dual-Port

-  Compaq Netelligent 10/100 Proliant

-  Compaq Netelligent 10/100 TX Embedded UTP, 10 T PCI UTP/Coax, 10/100
   TX UTP

-  Compaq NetFlex 3P, 3P Integrated, 3P w/BNC

-  Olicom OC-2135/2138, OC-2325, OC-2326 10/100 TX UTP

-  Racore 8165 10/100baseTX

-  Racore 8148 10baseT/100baseTX/100baseFX multi-personality

PCI Fast Ethernet Karten mit ADMtek Inc. AL981
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

PCI Fast Ethernet Karten mit ADMtek Inc. AN985
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  LinkSys EtherFast LNE100TX v4.0/4.1

USB Ethernet Karten mit ADMtek Inc. AN986
(`aue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aue&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Abocom UFE1000, DSB650TX\_NA

-  Accton USB320-EC, SpeedStream

-  ADMtek AN986, AN8511

-  Billionton USB100, USB100LP, USB100EL, USBE100

-  Corega Ether FEther USB-TX, FEther USB-TXS

-  D-Link DSB-650, DSB-650TX, DSB-650TX-PNA

-  Elsa Microlink USB2Ethernet

-  I/O Data USB ETTX

-  Kingston KNU101TX

-  LinkSys USB10T, USB10TA, USB10TX, USB100TX, USB100H1

-  Melco Inc. LUA-TX, LUA2-TX

-  Siemens Speedstream

-  SmartBridges smartNIC

-  SMC 2202USB

-  SOHOware NUB100

USB Netzwerkkarten mit CATC USB-EL1210A
(`cue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cue&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Belkin F5U011, F5U111

-  CATC Netmate, CATC Netmate II

-  SmartBridges SmartLink

USB Netzwerkkarten mit Kawasaki LSI KU5KUSB101B
(`kue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kue&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3Com 3c19250

-  AOX USB101

-  ADS Technologies USB-10BT

-  ATen UC10T

-  Corega USB-T

-  D-Link DSB-650C

-  Entrega NET-USB-E45

-  Kawasaki DU-H3E

-  LinkSys USB10T

-  Netgear EA101

-  Peracom USB Ethernet Adapter

-  SMC 2102USB, SMC 2104USB

USB-Netzwerkkarten auf Basis des RealTek RTL8150
(`rue(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rue&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  GREEN HOUSE GH-USB100B

-  MELCO LUA-KTX

ASIX Electronics AX88140A PCI Netzwerkkarten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Alfa Inc. GFC2204

-  CNet Pro110B

DEC EtherWORKS II und III Netzwerkkarten
(`le(4) <http://www.FreeBSD.org/cgi/man.cgi?query=le&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  DE200, DE201, DE202, DE422

-  DE203, DE204, DE205

Netzwerkkarten mit DEC DC21040, DC21041, DC21140, DC21141, DC21142 oder
DC21143
(`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Asante

-  Cogent EM100FX und EM440TX

-  DEC DE425, DE435, DE450, und DE500

-  SMC Etherpower 8432T, 9332, und 9334

-  ZYNX ZX 3xx

Fast Ethernet Karten mit DEC/Intel 21143
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  DEC DE500

-  Compaq Presario 7900 Familie (die eingebaute Netzwerkkarte)

-  D-Link DFE-570TX

-  Kingston KNE100TX

-  LinkSys EtherFast 10/100 Instant GigaDrive (die eingebaute
   Netzwerkkarte)

Davicom DM9009, DM9100 und DM9102 PCI Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Jaton Corporation XpressNet

Conexant LANfinity RS7112 (MiniPCI)
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Fast Ethernet Karten mit Fujitsu MB86960A/MB86965A
(`fe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fe&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  CONTEC C-NET(PC)C Ethernet

-  Eiger Labs EPX-10BT

-  Fujitsu FMV-J182, FMV-J182A, MBH10302, MBH10303 Ethernet PCMCIA

-  Fujitsu Towa LA501 Ethernet

-  HITACHI HT-4840-11

-  NextCom J Link NC5310

-  RATOC REX-5588, REX-9822, REX-4886, REX-R280

-  TDK LAK-CD021, LAK-CD021A, LAK-CD021BX

Fast Ethernet Karten mit Intel 82557 oder 82559
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel InBusiness 10/100 PCI Netzwerkkarten

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server und Dual-Port Server Adapters

-  Interne Netzwerk-Anschl?sse diverse Mainbaords von Intel

Netzwerkkarten mit Intel 82595
(`ex(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ex&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Intel EtherExpress Pro/10 und Pro/10+

-  Olicom OC2220

Netzwerkkarten mit Intel 82586
(`ie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ie&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3Com 3C507 Etherlink 16/TP

-  AT&T Starlan 10 und Starlan Fiber

-  EN100

-  Intel EtherExpress 16

-  RACAL Interlan NI5210

3Com 3C5x9 Etherlink III Netzwerkkarten
(`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3C509

-  3C529 MCA

-  3C579 EISA

-  3CXE589EC, 3CXE589ET PCMCIA

-  3C589/589B/589C/589D/589E/574TX/574B PC-card/PCMCIA

-  Megahertz 3CCFEM556BI, 3CXEM556, 3CCFEM556B

-  OfficeConnect 3CXSH572BT

-  Farallon EtherMac

3Com 3C501 8-bit ISA Netzwerkkarten
(`el(4) <http://www.FreeBSD.org/cgi/man.cgi?query=el&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Netzwerkkarten mit 3Com Etherlink XL
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3C900/905/905B/905C PCI

-  3C556/556B MiniPCI

-  3C450-TX HomeConnect

-  3c980/3c980B Fast Etherlink XL Server

-  3cSOHO100-TX OfficeConnect

-  Dell Optiplex GX1 on-board 3C918

-  Dell On-board 3C920

-  Dell Precision on-board 3C905B

-  Dell Latitude Docking Station mit eingebauter 3C905-TX

3Com 3C59X Familie
(`vx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vx&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3C590 Etherlink III (PCI)

-  3C595 Fast Etherlink III (PCI)

-  3C592/3C597 (EISA)

Netzwerkkarten mit Crystal Semiconductor CS89x0
(`cs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cs&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  IBM Etherjet ISA

Megahertz X-Jack Ethernet PC-Card CC-10BT
(`sn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sn&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Xircom CreditCard (16 bit) und baugleiche Karten (xe Treiber)

-  Accton EN2226/Fast EtherCard (16-Bit Version)

-  Compaq Netelligent 10/100 PC Card

-  Intel EtherExpress PRO/100 Mobile Adapter (16-bit Version)

-  Xircom 10/100 Network PC Card adapter

-  Xircom Realport card + modem(Ethernet Anschlu?)

-  Xircom CreditCard Ethernet 10/100

-  Xircom CreditCard 10Base-T \`\`CreditCard Ethernet Adapter IIps''
   (PS-CE2-10)

-  Xircom CreditCard Ethernet 10/100 + modem (Ethernet Anschlu?)

National Semiconductor DP8393X (SONIC) Ethernet Karten (snc Treiber)

-  NEC PC-9801-83, -84, -103, und -104

-  NEC PC-9801N-25 und -J02R

Gigabit Ethernet cards mit Level 1 LXT1001 NetCellerator Controller
(`lge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lge&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  D-Link DGE-500SX

-  SMC TigerCard 1000 (SMC9462SX)

Ethernet und Fast Ethernet Karten mit 3Com 3XP Typhoon/Sidewinder
(3CR990) Chipsatz
(`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3Com 3CR990-TX-95

-  3Com 3CR990-TX-97

-  3Com 3CR990B-SRV

-  3Com 3CR990B-TXM

-  3Com 3CR990SVR95

-  3Com 3CR990SVR97

Gigabit Ethernet Karten mit Broadcom BCM570x
(`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  3Com 3c996-SX, 3c996-T

-  Netgear GA302T

-  SysKonnect SK-9D21 und 9D41

-  Eingebaute Gigabit Ethernet Karten in DELL PowerEdge 2550 Servern

Gigabit Ethernet Karten mit Intel 82542 und 82543 Controllern
(`wx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wx&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__,
`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
und
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber), sowie Karten auf Basis der 82540EM, 82544, 82545EM und 82546EB
Chips?tze (nur
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Intel PRO/1000 Gigabit Ethernet

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Der Treiber
    `wx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wx&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
    sollte nicht mehr verwendet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Der
    `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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
~~~~~~~~~~~~~~~~

DEC DEFPA PCI
(`fpa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fpa&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

DEC DEFEA EISA
(`fpa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fpa&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4. ATM Karten
~~~~~~~~~~~~~~~

Efficient Networks, Inc. ENI-155p ATM PCI Karten (hea Treiber)

FORE Systems, Inc. PCA-200E ATM PCI Karten (hfa Treiber)

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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NCR / AT&T / Lucent Technologies WaveLan T1-speed ISA/radio LAN Karten
(`wl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wl&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Lucent Technologies WaveLAN/IEEE 802.11 PCMCIA und ISA Karten, sowohl
bei normaler (2 Mbps) als auch hoher (6 Mbps) Geschwindigkeit; auch
baugleiche Ger?te
(`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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

-  Melco Airconnect WLI-PCM-L11, WLI-PCM-L11

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
(`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Aironet 4500/4800 Familien (PCMCIA, PCI, und ISA Karten werden
   unterst?tzt)

-  Cisco Systems Aironet 340 und 350 Familien (PCMCIA, PCI, und ISA
   Karten werden unterst?tzt)

-  Xircom Wireless Ethernet Adapter (baugleich mit Aironet)

Raytheon Raylink 2.4GHz wireless Karten
(`ray(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ray&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Webgear Aviator

-  Webgear Aviator Pro

-  Raytheon Raylink PC Card

802.11 Karten mit AMD Am79C930 und Harris (Intersil)
(`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  BayStack 650 und 660

-  Farallon SkyLINE Wireless

-  Icom SL-200

-  Melco WLI-PCM

-  NEL SSMagic

-  Netwave AirSurfer Plus und AirSurfer Pro

-  ZoomAir 4000

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.6. Diverse Netzwerkkarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Granch SBNI12 Punkt-zu-Punkt Kommunikationssystem
(`sbni(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbni&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  SBNI12-XX und SBNI12D-XX, ISA und PCI

Granch SBNI16 SHDSL Modems
(`sbsh(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbsh&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

SMC COM90cx6 ARCNET Netzwerkkarten (cm Treiber)

-  SMC 90c26, 90c56, und 90c66 (im 90c56-kompatiblen Modus)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.7. ISDN Karten
~~~~~~~~~~~~~~~~

AcerISDN P10 ISA PnP (experimental)

Asuscom ISDNlink 128K ISA

ASUSCOM P-IN100-ST-D (und andere Karten mit Winbond W6692)

AVM

-  A1

-  B1 ISA (wurde mit V2.0 getestet)

-  B1 PCI (wurde mit V4.0 getestet)

-  Fritz!Card classic

-  Fritz!Card PnP

-  Fritz!Card PCI

-  Fritz!Card PCI, Version 2

-  T1

Creatix

-  ISDN-S0

-  ISDN-S0 P&P

Compaq Microcom 610 ISDN (Compaq Modell PSB2222I) ISA PnP

Dr. Neuhaus Niccy Go@ und kompatible

Dynalink IS64PPH und IS64PPH+

Eicon Diehl DIVA 2.0 und 2.02

ELSA

-  ELSA PCC-16

-  QuickStep 1000pro ISA

-  MicroLink ISDN/PCI

-  QuickStep 1000pro PCI

ITK ix1 Micro (< V.3, keine PnP-Karten )

Sedlbauer Win Speed

Siemens I-Surf 2.0

TELEINT ISDN SPEED No.1 (experimental)

Teles

-  S0/8

-  S0/16

-  S0/16.3

-  S0/16.3 PnP

-  16.3c ISA PnP (experimental)

-  Teles PCI-TJ

Traverse Technologies NETjet-S PCI

USRobotics Sportster ISDN TA intern

Winbond W6692 based PCI cards

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.8. Serielle Multi-Port Karten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

AST 4 Port Karte (bei Benutzung eines gemeinsamen IRQs)

ARNET Karten
(`ar(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ar&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  ARNET 8 Port Karten (bei Benutzung eines gemeinsamen IRQs)

-  ARNET (now Digiboard) Sync 570/i high-speed serial

Serielle Multi-Port Karten von Boca

-  Boca BB1004 4-Port serial card (die Modems werden *nicht*
   unterst?tzt)

-  Boca IOAT66 6-Port serial card (die Modems werden unterst?tzt)

-  Boca BB1008 8-Port serial card (die Modems werden *nicht*
   unterst?tzt)

-  Boca BB2016 16-Port serial card (die Modems werden unterst?tzt)

Comtrol Rocketport Karte
(`rp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rp&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Cyclades Cyclom-Y serial Karte
(`cy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cy&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

STB 4 Port Karte (bei Benutzung eines gemeinsamen IRQs)

Intelligente serielle Karten von DigiBoard
(`dgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dgb&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  DigiBoard PC/Xe series

-  DigiBoard PC/Xi series

Serielle Multi-Port PCI-Karten
(`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Actiontech 56K PCI

-  Avlab Technology, PCI IO 2S and PCI IO 4S

-  Comtrol RocketPort 550

-  Decision Computers PCCOM 4-port serial and dual port RS232/422/4 85

-  Dolphin Peripherals 4025/4035/4036

-  IC Book Labs Dreadnought 16x Lite and Pro

-  Lava Computers 2SP-PCI/DSerial-PCI/Quattro-PCI/Octopus-550

-  Middle Digital, Weasle serial port

-  Moxa Industio CP-114 and C168H/PCI

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

Serielle Karte von SDL Communication

-  SDL Communications Riscom/8 Serial Board (rc Treiber)

-  SDL Communications RISCom/N2 und N2pci high-speed sync serial boards
   (`sr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

Serielle Multi-Port Karten von Stallion Technologies

-  EasyIO
   (`stl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stl&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  EasyConnection 8/32
   (`stl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stl&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  EasyConnection 8/64
   (`stli(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stli&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  ONboard 4/16
   (`stli(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stli&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Brumby
   (`stli(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stli&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

Specialix SI/XIO/SX Karten, sowohl die ?lteren SIHOST2.x als auch die
neuen \`\`enhanced'' (transputer based, aka JET) Karten (ISA, EISA und
PCI werden unterst?tzt)
(`si(4) <http://www.FreeBSD.org/cgi/man.cgi?query=si&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9. Audio Hardware
~~~~~~~~~~~~~~~~~~~

Advance
(`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Asound 100 und 110

-  Logic ALS120 und ALS4000

CMedia Audio Bausteine

-  CMI8338/CMI8738

Crystal Semiconductor
(`csa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=csa&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  CS461x/462x Audio Accelerator

-  CS428x Audio Controller

ENSONIQ
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  AudioPCI ES1370/1371

ESS

-  ES1868, ES1869, ES1879 und ES1888
   (`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Maestro-1, Maestro-2, und Maestro-2E

-  Maestro-3/Allegro

   .. raw:: html

      <div class="NOTE">

       **Anmerkung:** Der Treiber f?r die Maestro-3/Allegro darf (und
       kann) aus rechtlichen Gr?nden nicht fest in den Kernel
       eingebunden werden. Wenn Sie diesen Treiber ben?tigen, m?ssen Sie
       die folgende Zeile in die Datei ``/boot/loader.conf`` eintragen:

       .. code:: SCREEN

           snd_maestro3_load="YES"

   .. raw:: html

      </div>

ForteMedia fm801

Gravis
(`gusc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gusc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  UltraSound MAX

-  UltraSound PnP

Eingebaute Audio-Hardware auf Intel 443MX, 810, 815, und 815E Mainboards
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

MSS/WSS kompatible DSPs
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

NeoMagic 256AV/ZX
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

OPTi 931/82C931
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

S3 Sonicvibes

Creative Technologies SoundBlaster Familie
(`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  SoundBlaster

-  SoundBlaster Pro

-  SoundBlaster AWE-32

-  SoundBlaster AWE-64

-  SoundBlaster AWE-64 GOLD

-  SoundBlaster ViBRA-16

Creative Technologies Sound Blaster Live! Familie (emu10k1 Treiber)

Trident 4DWave DX/NX
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

VIA Technologies VT82C686A

Yamaha

-  DS1

-  DS1e

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10. Kameras, TV-Karten, etc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Karten mit Brooktree Bt848/849/878/879
(`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  AverMedia Karten

-  Hauppauge Wincast TV und WinTV Karten (PCI)

-  Intel Smart Video Recorder III

-  Miro PC TV

-  STB TV PCI

-  Video Highway XTreme

-  VideoLogic Captivator PCI

Connectix QuickCam

Cortex1 frame grabber (ctx Treiber)

Creative Labs Video Spigot frame grabber (spigot Treiber)

Matrox Meteor Video frame grabber
(`meteor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=meteor&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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

Host Controllers
(`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
und
`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  ALi Aladdin-V

-  AMD-756

-  Belkin USB 2.0 High Speed Host Controller

-  CMD Tech 670 & 673

-  Intel 82371SB (PIIX3)

-  Intel 82371AB und EB (PIIX4)

-  Intel 82801AA (ICH)

-  Intel 82801AB (ICH0)

-  Intel 82801BA/BAM (ICH2)

-  Intel 82443MX

-  NEC uPD 9210

-  OPTi 82C861 (FireLink)

-  SiS 5571

-  VIA 83C572 USB

-  UHCI- oder OHCI-kompatible Chips?tze auf Mainboards (uns sind keine
   Ausnahmen bekannt)

USB host Controller (PCI)

-  ADS Electronics PCI plug-in Karte (2 Anschl?sse)

-  Entrega PCI plug-in card (4 Anschl?sse)

Hubs

-  Andromeda hub

-  MacAlly self powered hub (4 ports)

-  NEC hub

Tastatur
(`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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
   (`urio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urio&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  D-Link DSB-R100 USB Radio (ufm Treiber)

Modems (umodem Treiber)

-  3Com 5605

-  Metricom Ricochet GS USB wireless modem

M?use
(`ums(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ums&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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
(`ulpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ulpt&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  ATen parallel printer Adapter

-  Belkin F5U002 parallel printer Adapter

-  Entrega USB-to-parallel printer Adapter

Serielle Schnittstellen

-  Belkin F5U103 and F5U120 (ubsa Treiber)

-  e-Tek Labs Kwik232 (ubsa Treiber)

-  GoHubs GoCOM232 (ubsa Treiber)

-  HP USB-Serial Adapter
   (`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Inland UAS111
   (`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  Peracom single port serial Adapter (ubsa Treiber)

-  Prolific PL-2303 serial Adapter
   (`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  QVS USC-1000
   (`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  SUNTAC Slipper U VS-10U
   (`uvscom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvscom&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

Scanner (zusammen mit **SANE**)
(`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Perfection 636U

-  HP ScanJet 4100C, 5200C, 6300C

Massenspeicher
(`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Iomega USB Zip 100Mb (nur sehr eingeschr?nkt)

-  Matshita CF-VFDU03 Diskettenlaufwerk

-  Microtech USB-SCSI-HD 50 USB-auf-SCSI Kabel

-  Panasonic Diskettenlaufwerk

-  Y-E Data Diskettenlaufwerk (720/1.44/2.88Mb)

Handspring Visor und andere PDAs mit PalmOS
(`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
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

Host Controller
(`fwohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwohci&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Ricoh R5C552 Chipsatz

-  Sony CX3022 Chipsatz

-  TI TSB12LV22, LV23, 26 und TSB43AA22 Chips?tze

-  uPD72861 Chipsatz

-  VIA VT6306 Chipsatz

Massenspeicher
(`sbp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbp&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Apple iPod

-  Apple Macintosh G4 (Target Modus)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.13. Verschl?sselungs-Hardware
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Karten auf Basis der Hifn 7751, 7811 und 7951 Chips
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

-  Invertex AEON

-  Hifn 7751 Referenz-Platine

-  Global Technologies Group PowerCrypt und XL-Crypt

-  NetSec 7751

-  Soekris Engineering vpn1201 und vpn1211

Karten auf Basis der Bluesteel 5501 und 5601 Chips?tze
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Karten auf Basis der Broadcom BCM5801, BCM5802, BCM5805, BCM5820, BCM
5821, BCM5822 Chips?tze
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.14. Diverses
~~~~~~~~~~~~~~

FAX-Modem/PCCARD

-  Melco IGM-PCM56K/IGM-PCM56KH

-  Nokia Card Phone 2.0 (gsm900/dcs1800 HSCSD terminal)

Diskettenlaufwerk
(`fdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Genius und Mustek Handscanner

GPB und Transputer Treiber

VGA-Kompatible Grafikkarten
(`vga(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vga&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Informationen ?ber spezielle Grafikkarten und ihre
    Kompatibilit?t mit **XFree86** k?nnen Sie bei
    http://www.xfree86.org/ finden.

.. raw:: html

   </div>

Tastaturen:

-  AT-Tastaturen
   (`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  PS/2-Tastaturen
   (`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  USB-Tastaturen (genaue Modellbezeichnungen finden Sie im Kapitel `USB
   Ger?te <#USB>`__)

Loran-C Empf?nger (Dave Mills experimental hardware, loran Treiber).

M?use:

-  Bus M?use und kompatible Ger?te
   (`mse(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mse&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  PS/2 M?use und kompatible Ger?te, unter anderem viele der bei Laptops
   verwendeten Touchpads und Glidepoints
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
   Treiber)

-  serielle M?use und kompatible Ger?te

-  USB M?use (genaue Modellbezeichnungen finden im Kapitel `USB
   Ger?te <#USB>`__)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** In
    `moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
    finden Sie weitere Informationen zur Nutzung von M?usen in FreeBSD.
    Infortmationen ?ber die Nutzung von M?usen in **XFree86** erhalten
    Sie bei http://www.xfree86.org/.

.. raw:: html

   </div>

Parallele Schnittstellen nach \`\`PC-Standard''
(`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

PC-kompatible Joysticks
(`joy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=joy&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

PHS Data Communication Card/PCCARD

-  NTT DoCoMo P-in Comp@ct

-  Panasonic KX-PH405

-  SII MC-P200

Serielle Schnittstellen nach \`\`PC-Standard'' auf Basis von 8250,
16450, und 16550-Chips
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

X-10 Power Controller
(`tw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Treiber)

Karten auf Basis des Xilinx XC6200, die mit dem HOT1 von `Virtual
Computers <http://www.vcc.com/>`__ kompatibel sind (xrpu Treiber).

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
