================================================
FreeBSD/sparc64 5.2-RELEASE Hardware Information
================================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/sparc64 5.2-RELEASE Hardware Information
================================================

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
2.1. `Vollst?ndig unterst?tzte Systeme <#AEN29>`__
2.2. `Teilweise unterst?tzte Systeme <#AEN79>`__
2.3. `Nicht unterst?tzte Systeme <#AEN91>`__
3. `Unterst?tzte Ger?te <#SUPPORT>`__
3.1. `Festplatten-Controller <#AEN107>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN826>`__
3.4. `ATM Karten <#AEN836>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN855>`__
3.6. `Diverse Netzwerkkarten <#AEN881>`__
3.7. `ISDN Karten <#AEN904>`__
3.8. `Serielle Schnittstellen <#AEN968>`__
3.9. `Audio Hardware <#AEN1141>`__
3.10. `Kameras, TV-Karten, etc <#AEN1263>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Bluetooth Ger?te <#BLUETOOTH>`__
3.14. `Verschl?sselungs-Hardware <#AEN1489>`__
3.15. `Diverses <#AEN1507>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
5.2-RELEASE auf UltraSPARC Systemen (meistens einfach FreeBSD/sparc64
5.2-RELEASE genannt). Hier finden Sie zum einen alle die Ger?te, von
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
-----------------------

In diesem Kapitel sind alle Systeme aufgef?hrt, von denen wir wissen,
da? sie von FreeBSD f?r UltraSPARC unterst?tzt werden. Zus?tzliche
Informationen zu den einzelnen Systemen finden Sie im `Sun System
Handbook <http://sunsolve.sun.com/handbook_pub/>`__.

SMP wird auf allen Systemen mit mehr als einem Prozessor unterst?tzt.

Wenn Sie ein System haben, da? nicht in dieser Liste aufgef?hrt ist,
k?nnte das daran liegen, da? es noch mit FreeBSD 5.2-RELEASE getestet
wurde. Bitte probieren Sie es aus und schicken Sie eine Mail mit Ihren
Ergebnissen (und Informationen dar?ber, welche Ger?te unterst?tzt werden
und welche nicht) an die `FreeBSD SPARC
porting <http://lists.FreeBSD.org/mailman/listinfo/freebsd-sparc64>`__.

.. raw:: html

   <div class="SECT2">

--------------

2.1. Vollst?ndig unterst?tzte Systeme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die folgenden Systeme werden vollst?ndig unterst?tzt:

-  Blade 100

-  Blade 150

-  Enterprise 220R

-  Enterprise 250

-  Enterprise 420R

-  Enterprise 450

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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die folgenden Systeme werden nur unvollst?ndig unterst?tzt. Dies
betrifft speziell den SCSI-Controller auf dem Systemboard, der zur Zeit
nicht unterst?tzt wird.

-  Enterprise 3500

-  Enterprise 4500

-  Ultra 1 Enterprise (auch als 1E bezeichnet)

-  Ultra 2

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Nicht unterst?tzte Systeme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die folgenden Systeme werden von FreeBSD nicht unterst?tzt. Dies liegt
zum Teil daran, da? der Prozessor nicht unterst?tzt wird (UltraSPARC
III); an Merkw?rdigkeiten im Design des Systems, die zu Problemen im
Betrieb f?hren; oder an fehlender Unterst?tzten f?r die Komponenten des
Systems, wodurch FreeBSD nicht benutzbar wird.

-  Alle Systeme mit UltraSPARC III Prozessor(en).

-  Ultra 1

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Unterst?tzte Ger?te
----------------------

$FreeBSD$
Dieses Kapitel enth?lt alle Ger?te, die auf jeden Fall von FreeBSD auf
sparc64 Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
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

Adaptec AIC7770, AIC7850, AIC7860, AIC7870, AIC7880, und AIC789x SCSI
Controller
(`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Ultra-320 SCSI Controller auf Basis der Adaptec AIC7901, AIC7901A und
7902 Ultra320 Controller
(`ahd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

LSI/SymBios (ehemals NCR) 53C8XX und 53C10XX PCI SCSI Controller, sowohl
auf Hostadaptern als auch on-board
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Qlogic Controller und kompatible Ger?te
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

RealTek 8129/8139 Fast Ethernet Netzwerkkarten
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

DEC/Intel 21143 Fast Ethernet Karten und Nachbauten f?r PCI, MiniPCI,
und CardBus
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit DEC DC21040, DC21041, DC21140, DC21141, DC21142 oder
DC21143
(`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Fast Ethernet Karten mit Intel 82557, 82558, 82559, 82550 und 82562
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server und Dual-Port Server Adapters

Netzwerkkarten mit 3Com Etherlink XL Chipsatz
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Sun HME und QFE Ethernet Karten
(`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Sun GEM (Gigabit Ethernet) und ERI (Fast Ethernet) Karten
(`gem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gem&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3. FDDI Karten
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.4. ATM Karten
~~~~~~~~~~~~~~~

FORE Systems, Inc. PCA-200E ATM PCI Karten (hfa und
`fatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

FORE Systems, Inc. HE155 und HE622 ATM Karten
(`hatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Karten)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.5. Karten f?r drahtlose Netzwerke
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Serielle Schnittstellen auf Basis des SAB82532 Chips, nur im
Konsolen-Modus
(`sab(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sab&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Serielle Schnittstellen auf Basis des Zilog 8530 Doppel-UART, nur im
Konsolen-Modus (zs Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9. Audio Hardware
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.10. Kameras, TV-Karten, etc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.11. USB Ger?te
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.12. IEEE 1394 (Firewire) Ger?te
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Host Controller
(`fwohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwohci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Massenspeicher nach Serial Bus Protcol 2 (SBP-2) Standard
(`sbp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.13. Bluetooth Ger?te
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.14. Verschl?sselungs-Hardware
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.15. Diverses
~~~~~~~~~~~~~~

OpenFirmware Console (ofwcons Treiber)

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
