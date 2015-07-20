================================================
FreeBSD/sparc64 5.0-CURRENT Hardware Information
================================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/sparc64 5.0-CURRENT Hardware Information
================================================

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
2.1. `Vollst?ndig unterst?tzte Systeme <#AEN27>`__
2.2. `Teilweise unterst?tzte Systeme <#AEN75>`__
2.3. `Nicht unterst?tzte Systeme <#AEN85>`__
3. `Unterst?tzte Ger?te <#SUPPORT>`__
3.1. `Festplatten-Controller <#AEN101>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN1593>`__
3.4. `ATM Karten <#AEN1603>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN1646>`__
3.6. `Diverse Netzwerkkarten <#AEN1774>`__
3.7. `ISDN Karten <#AEN1798>`__
3.8. `Serielle Schnittstellen <#AEN1862>`__
3.9. `Audio Hardware <#AEN2023>`__
3.10. `Kameras, TV-Karten, etc <#AEN2149>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Bluetooth Ger?te <#BLUETOOTH>`__
3.14. `Verschl?sselungs-Hardware <#AEN2448>`__
3.15. `Diverses <#AEN2473>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
=============

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
5.0-CURRENT auf UltraSPARC Systemen (meistens einfach FreeBSD/sparc64
5.0-CURRENT genannt). Hier finden Sie zum einen alle die Ger?te, von
denen wir wissen, da? Sie funktionieren; zum anderen finden Sie hier
Hinweise, wie Sie den Kernel anpassen k?nnen, wenn Sie ein bisher noch
nicht unterst?tztes Ger?t verwenden wollen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Dieses Dokument enth?lt Informationen f?r UltraSPARC
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

In diesem Kapitel sind alle Systeme aufgef?hrt, von denen wir wissen,
da? sie von FreeBSD f?r UltraSPARC unterst?tzt werden. Zus?tzliche
Informationen zu den einzelnen Systemen finden Sie im `Sun System
Handbook <http://sunsolve.sun.com/handbook_pub/>`__.

SMP wird auf allen Systemen mit mehr als einem Prozessor unterst?tzt.

Wenn Sie ein System haben, da? nicht in dieser Liste aufgef?hrt ist,
konnten wir FreeBSD noch nicht auf diesem System testen, ist es durchaus
m?glich, da? es von FreeBSD unterst?tzt wird. Wenn Sie ein solches
System haben, testen Sie es bitte und teilen Sie
`uns <freebsd-sparc@freebsd.org>`__ das Ergebnis mit.

.. raw:: html

   <div class="SECT2">

--------------

2.1. Vollst?ndig unterst?tzte Systeme
-------------------------------------

Die folgenden Systeme werden vollst?ndig unterst?tzt:

-  Blade 100

-  Blade 150

-  Enterprise 220R

-  Enterprise 250

-  Enterprise 420R

-  Fire V100

-  Fire V120

-  Netra t1 105

-  Netra t1 AC200/DC200

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

2.2. Teilweise unterst?tzte Systeme
-----------------------------------

Die folgenden Systeme werden nur unvollst?ndig unterst?tzt. Dies
betrifft speziell den SCSI-Controller auf dem Systemboard, der zur Zeit
nicht unterst?tzt wird.

-  Enterprise 4500

-  Ultra 1 Enterprise (auch als 1E bezeichnet)

-  Ultra 2

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Nicht unterst?tzte Systeme
-------------------------------

Die folgenden Systeme werden von FreeBSD nicht unterst?tzt. Dies liegt
zum Teil daran, da? der Prozessor nicht unterst?tzt wird (UltraSPARC
III); an Merkw?rdigkeiten im Design des Systems, die zu Problemen im
Betrieb f?hren; oder an fehlender Unterst?tzten f?r die Komponenten des
Systems, wodurch FreeBSD nicht benutzbar wird.

-  Alle Systeme mit UltraSPARC III Prozessor(en).

-  Enterprise 450

-  Ultra 1

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Unterst?tzte Ger?te
======================

$FreeBSD: src/release/doc/de\_DE.ISO8859-1/hardware/common/dev.sgml,v
1.18 2003/01/16 22:41:47 ue Exp $
Dieses Kapitel enth?lt alle Ger?te, die auf jeden Fall von FreeBSD auf
sparc64 Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
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
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
Treiber)

-  Acard ATP850 UDMA2, ATP860 UDMA4, ATP865 UDMA6

-  AMD 756 ATA66, 766 ATA100, 768 ATA100

-  CMD 646, 648 ATA66, und 649 ATA100

-  Cypress 82C693

-  Cyrix 5530 ATA33

-  HighPoint HPT366 ATA66, HPT370 ATA100, HPT372 ATA133, HPT374 ATA133

-  Intel PIIX, PIIX3, PIIX4

-  Intel ICH ATA66, ICH2 ATA100, ICH3 ATA100, ICH4 ATA100

-  nVidia nForce ATA100

-  Promise ATA100 OEM Baustein (pdc20265)

-  Promise ATA133 OEM Baustein (pdc20269)

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

Adaptec SCSI Controller

-  Adaptec
   19160/291x/2920/2930/2940/2950/29160/3940/3950/3960/39160/398x/494x
   PCI SCSI Controller, einschlie?lich der Narrow/Wide/Twin/Ultra/Ultra2
   Versionen
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.0-current>`__
   Treiber)

Ultra-320 SCSI Controller auf Basis der Adaptec AIC7901, AIC7901A und
7902 Ultra320 Controller (ahd Treiber)

-  Adaptec 29320, 29320A, 29320B, 29320LP

-  Adaptec 39320, 39320D

LSI/SymBios (ehemals NCR) 53C810, 53C810a, 53C815, 53C825, 53C825a,
53C860, 53C875, 53C875a, 53C876, 53C885, 53C895, 53C895a, 53C896,
53C1010-33, 53C1010-66, 53C1000, 53C1000R PCI SCSI Controller, sowohl
auf Hostadaptern als auch on-board
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+5.0-current>`__
und
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+5.0-current>`__
Treiber)

-  ASUS SC-200, SC-896

-  Data Technology DTC3130 (alle Modelle)

-  DawiControl DC2976UW

-  Diamond FirePort (alle)

-  NCR Hostadapter (alle)

-  Symbios Hostadapter (alle)

-  Tekram DC390W, 390U, 390F, 390U2B, 390U2W, 390U3D, und 390U3W

-  Tyan S1365

Qlogic(-?hnlich) Controller
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
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

LSI Logic Fusion/MP architecture Fiber Channel Controller (mpt Treiber)

-  LSI FC909, FC929

-  LSI 53c1020, 53c1030

Mit allen unterst?tzten SCSI Controllern ist die uneingeschr?nkte
Nutzung von SCSI-I, SCSI-II und SCSI-III Ger?ten m?glich. Dazu geh?ren
Festplatten, optische Platten, Bandlaufwerke (u.a. DAT, 8mm Exabyte,
Mammoth, DLT), Wechselplatten, Ger?te mit eigenem Prozessor und CDROM.
Sie k?nnen mit den CD-Treibern (wie
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-current>`__)
lesend auf WORMs zugreifen, wenn diese die entsprechenden Kommandos f?r
CDROM unterst?tzen. F?r schreibenden Zugriff steht das Programm
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__
aus der Ports Collection zur Verf?gung.

Zur Zeit unterst?tzte CDROM-Arten:

-  SCSI Ger?te (dazu geh?ren auch ProAudio Spectrum und SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-current>`__)

-  ATAPI IDE Ger?te
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.0-current>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2. Netzwerkkarten
-------------------

RealTek 8129/8139 Fast Ethernet Netzwerkkarten
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.0-current>`__
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

Sun HME und QFE Ethernet Karten (hme Treiber)

Sun GEM (Gigabit Ethernet) und ERI (Fast Ethernet) Karten (gem Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3. FDDI Karten
----------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4. ATM Karten
---------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.5. Karten f?r drahtlose Netzwerke
-----------------------------------

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

Serielle Schnittstellen auf Basis des SAB82532 Chips, nur im
Konsolen-Modus (sab Treiber)

Serielle Schnittstellen auf Basis des Zilog 8530 Doppel-UART, nur im
Konsolen-Modus (zs Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9. Audio Hardware
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10. Kameras, TV-Karten, etc
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.11. USB Ger?te
----------------

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

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.14. Verschl?sselungs-Hardware
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.15. Diverses
--------------

OpenFirmware Console (ofwcons Treiber)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

Diese Datei und andere Dokumente zu dieser Version sind bei
http://snapshots.jp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Alle Anwender von FreeBSD 5-CURRENT sollten sich in die Mailingliste
<current@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
