=============================================
FreeBSD/ia64 5.2-RELEASE Hardware Information
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/ia64 5.2-RELEASE Hardware Information
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
2. `Unterst?tzte Prozessoren und Mainboards <#PROC-IA64>`__
2.1. `?bersicht ?ber die unterst?tzten Systeme <#AEN41>`__
3. `Unterst?tzte Ger?te <#SUPPORT>`__
3.1. `Festplatten-Controller <#AEN94>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN813>`__
3.4. `ATM Karten <#AEN823>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN842>`__
3.6. `Diverse Netzwerkkarten <#AEN868>`__
3.7. `ISDN Karten <#AEN891>`__
3.8. `Serielle Schnittstellen <#AEN955>`__
3.9. `Audio Hardware <#AEN1128>`__
3.10. `Kameras, TV-Karten, etc <#AEN1250>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Bluetooth Ger?te <#BLUETOOTH>`__
3.14. `Verschl?sselungs-Hardware <#AEN1476>`__
3.15. `Diverses <#AEN1494>`__

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieses Dokument befindet sich noch in einem sehr fr?hen Stadium. Die
    Angaben sind unvollst?ndig und m?ssen dringend erweitert werden.
    Wenn Sie Informationen ?ber FreeBSD IA-64 Prozessoren, Mainboards
    und andere Ger?te haben, die mit FreeBSD funktionieren, senden Sie
    sie bitte an die `FreeBSD IA64
    porting <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ia64>`__
    Mailingliste.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
5.2-RELEASE auf IA-64 Systemen (meistens einfach FreeBSD/ia64
5.2-RELEASE genannt). Hier finden Sie zum einen alle die Ger?te, von
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

Weitergehende Informationen ?ber FreeBSD/ia64 finden Sie auf den
Webseiten des `FreeBSD/ia64
Project <http://www.FreeBSD.org/platforms/ia64/index.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Unterst?tzte Prozessoren und Mainboards
------------------------------------------

Zur Zeit werden die
`Itanium <http://www.intel.com/design/itanium/itanium/index.htm>`__ und
`Itanium 2 <http://www.intel.com/design/itanium2/index.htm>`__
Prozessoren unterst?tzt. Die folgenden Mainboard-Chips?tze werden
unterst?tzt:

-  HP zx1 (nur auf dem Entwicklungszweig, weitere Informationen finden
   Sie im `Perforce repository <http://perforce.freebsd.org/>`__)

-  HP i2000

-  Intel 460GX

-  Intel E8870

Zur Zeit wird sowohl an Ein-Prozessor (UP) als auch an Mehr-Prozessor
Systemen gearbeitet. Letztere sind zur Zeit weniger stabil. Zur Zeit
konzentriert sich die Arbeit auf Verbesserungen f?r UP-Systeme, um deren
Stabilit?t zu erh?hen.

.. raw:: html

   <div class="SECT2">

--------------

2.1. ?bersicht ?ber die unterst?tzten Systeme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Dieser Abschnitt enth?lt zus?tzliche Informationen dar?ber, welche
Ger?te von FreeBSD/ia64 unterst?tzt werden und welche nicht.

Mit Ausnahme der in die PC-Chips?tze integrierten Varianten sollten alle
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Kontroller sofort funktionieren. Wir gehen davon aus, da? fr?her oder
sp?ter alle ia64-kompatiblen Kontroller vollst?ndig unterst?tzt werden.
In den folgenden Abschnitten finden Sie genauere Informationen ?ber die
verschiedenen Festplattencontroller und ihren aktuellen Status.

Ganz generell sollten serielle Schnittstellen nach \`\`PC-Standard'' auf
Intel-Hardware funktionieren, w?hrend sie auf PA-Hardware nicht
funktionieren werden. Der Grund ist, da? auf HP-Maschinen alle Ger?te in
den Speicher eingeblendet werden. Mit Ausnahme der von PCI verlangten
VGA-Unterst?tzung gibt es *keinerlei* Unterst?tzung f?r ISA-Ger?te.

Au?er den schon genannten seriellen Schnittstellen mit
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__-Treiber
gibt es eine Reihe weiterer Ger?ten, von denen wir wissen, da? sie auf
Nicht-Intel Systemen nicht funktionieren k?nnen, weil sie sich auf
ISA-spezifische Begebenheiten verlassen, die nicht mehr zutreffen. Diese
Ger?te sollten jedoch auf Intel-Hardware funktionieren.

.. raw:: html

   <div class="INFORMALTABLE">

+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------+
| `sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__                                                                                                        | Keine Unterst?tzung f?r I/O durch in den Hauptspeicher eingeblendete Bereiche   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------+
| `syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__                                                                                                | Erwartet ein BIOS, VGA-Erkennung, etc.                                          |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------+
| `pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__                                                                                                        | Pr?ft MSS ISA Ports *bis zum Erbrechen*                                         |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------+
| `atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__, `psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__   | Fest verdrahte ISA-Adressen                                                     |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------+

.. raw:: html

   </div>

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
ia64 Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
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

Fast Ethernet Karten mit Intel 82557, 82558, 82559, 82550 und 82562
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel InBusiness 10/100 PCI Netzwerkkarten

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server und Dual-Port Server Adapters

-  Interne Netzwerk-Anschl?sse auf diversen Mainbaords von Intel

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

Serielle Schnittstellen nach \`\`PC standard'' auf Basis der 8250, 16450
und 16550 Chips
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Serielle Multi-Port PCI-Karten
(`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  Diva Serial (GSP) Multiport UART (nur im Entwicklungszweig)

-  Syba Tech Ltd. PCI-4S2P-550-ECP

-  Titan PCI-200H und PCI-800H

-  US Robotics (3Com) 3CP5609 modem

-  VScom PCI-400 und PCI-800

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

Host Controllers, die dem OHCI 1.0 Standard entsprechen
(`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Host Controllers, die dem UHCI 1.1 Standard entsprechen
(`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

USB 2.0 Controller, die das EHCI Interface nutzen
(`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

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

VGA-Kompatible Grafikkarten
(`vga(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vga&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Informationen ?ber spezielle Grafikkarten und ihre
    Kompatibilit?t mit **XFree86** k?nnen Sie bei
    http://www.xfree86.org/ finden.

.. raw:: html

   </div>

Tastaturen:

-  PS/2-Tastaturen
   (`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

M?use:

-  PS/2 M?use und kompatible Ger?te, unter anderem viele der bei Laptops
   verwendeten Touchpads und Glidepoints
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  serielle M?se und kompatible Ger?te

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** In
    `moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
    finden Sie weitere Informationen zur Nutzung von M?usen in FreeBSD.
    Informationen ?ber die Nutzung von M?usen in **XFree86** erhalten
    Sie bei http://www.xfree86.org/.

.. raw:: html

   </div>

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
