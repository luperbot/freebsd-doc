=============================================
FreeBSD/ia64 5.0-CURRENT Hardware Information
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/ia64 5.0-CURRENT Hardware Information
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
2. `Unterst?tzte Prozessoren und Mainboards <#PROC-IA64>`__
3. `Unterst?tzte Ger?te <#SUPPORT>`__
3.1. `Festplatten-Controller <#AEN31>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN1523>`__
3.4. `ATM Karten <#AEN1533>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN1576>`__
3.6. `Diverse Netzwerkkarten <#AEN1704>`__
3.7. `ISDN Karten <#AEN1728>`__
3.8. `Serielle Schnittstellen <#AEN1792>`__
3.9. `Audio Hardware <#AEN1953>`__
3.10. `Kameras, TV-Karten, etc <#AEN2079>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Bluetooth Ger?te <#BLUETOOTH>`__
3.14. `Verschl?sselungs-Hardware <#AEN2378>`__
3.15. `Diverses <#AEN2403>`__

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieses Dokument befindet sich noch in einem sehr fr?hen Stadium. Die
    Angaben sind unvollst?ndig und entsprechen mit gr??ter
    Wahrscheinlichkeit in einigen Punkten nicht ganz der Realit?t.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
=============

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
5.0-CURRENT auf IA-64 Systemen (meistens einfach FreeBSD/ia64
5.0-CURRENT genannt). Hier finden Sie zum einen alle die Ger?te, von
denen wir wissen, da? Sie funktionieren; zum anderen finden Sie hier
Hinweise, wie Sie den Kernel anpassen k?nnen, wenn Sie ein bisher noch
nicht unterst?tztes Ger?t verwenden wollen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Dieses Dokument enth?lt Informationen f?r IA-64
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
==========================================

Schreib mich!.

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
ia64 Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
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

Fast Ethernet Karten mit Intel 82557, 82558, 82559, 82550 und 82562
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.0-current>`__
Treiber)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel InBusiness 10/100 PCI Netzwerkkarten

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server und Dual-Port Server Adapters

-  Interne Netzwerk-Anschl?sse diverse Mainbaords von Intel

Gigabit Ethernet Karten mit Broadcom BCM570x
(`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.0-current>`__
Treiber)

-  3Com 3c996-SX, 3c996-T

-  Netgear GA302T

-  SysKonnect SK-9D21 und 9D41

-  Eingebaute Gigabit Ethernet Karten in DELL PowerEdge 2550 Servern

-  Eingebaute Gigabit Ethernet Karten in IBM x235 Servern

Gigabit Ethernet Karten mit Intel 82542 und 82543 Controllern
(`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+5.0-current>`__
und
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.0-current>`__
Treiber), sowie Karten auf Basis der 82540EM, 82544, 82545EM und 82546EB
Chips?tze (nur
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.0-current>`__
Treiber)

-  Intel PRO/1000 Gigabit Ethernet

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Der
    `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.0-current>`__
    Treiber wird von Intel unterst?tzt, allerdings nur auf der i386
    Plattform.

.. raw:: html

   </div>

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

Serielle Schnittstellen nach \`\`PC standard'' auf Basis der 8250, 16450
und 16550 Chips
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.0-current>`__
Treiber)

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

Tastaturen:

-  PS/2-Tastaturen

M?use:

-  PS/2 M?use
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.0-current>`__
   Treiber)

-  serielle M?se

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
