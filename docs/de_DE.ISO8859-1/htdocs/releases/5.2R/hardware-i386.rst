=============================================
FreeBSD/i386 5.2-RELEASE Hardware Information
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/i386 5.2-RELEASE Hardware Information
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
2. `Unterst?tzte Prozessoren und Mainboards <#PROC>`__
3. `Unterst?tzte Ger?te <#SUPPORT>`__
3.1. `Festplatten-Controller <#AEN70>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN789>`__
3.4. `ATM Karten <#AEN799>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN818>`__
3.6. `Diverse Netzwerkkarten <#AEN844>`__
3.7. `ISDN Karten <#AEN867>`__
3.8. `Serielle Schnittstellen <#AEN931>`__
3.9. `Audio Hardware <#AEN1104>`__
3.10. `Kameras, TV-Karten, etc <#AEN1226>`__
3.11. `USB Ger?te <#USB>`__
3.12. `IEEE 1394 (Firewire) Ger?te <#FIREWIRE>`__
3.13. `Bluetooth Ger?te <#BLUETOOTH>`__
3.14. `Verschl?sselungs-Hardware <#AEN1452>`__
3.15. `Diverses <#AEN1470>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
5.2-RELEASE auf i386 Systemen (meistens einfach FreeBSD/i386 5.2-RELEASE
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
80386SX wird ab FreeBSD 5.2-RELEASE nicht mehr unterst?tzt. Alle
i386-kompatiblen Prozessoren von AMD werden unterst?tzt, dazu geh?ren
Am486, Am5x86, K5, K6 (alle Varianten), Athlon (einschlie?lich
Athlon-MP, Athlon-XP, Athlon-4 und Athlon Thunderbird) und Duron. Der
integrierte Prozessor AMD Élan SC520 wird unterst?tzt. Der Transmeta
Crusoe wird erkannt und unterst?tzt, das gleiche gilt f?r die
i386-kompatiblen Prozessoren von Cyrix und NexGen.

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

FreeBSD nutzt HyperThreading (HTT) auf Intel CPUs, wenn die CPU dies
unterst?tzt. Wenn in der Konfigurationsdatei f?r den angepa?ten Kernel
die Zeile options SMP angegeben ist, erkennt und aktiviert der Kernel
die zus?tzlichen logischen Prozessoren. Der Standard-Scheduler in
FreeBSD behandelt diese logischen Prozessoren genau so wie zus?tzliche
physikalische Prozessoren. Mit anderen Worten, der Scheduler
ber?cksichtigt bei seinen Entscheidungen nicht, da? sich die logischen
Prozessoren auf einer CPU bestimmte Ressourcen teilen. Da dieses sehr
einfache Vorgehen zu schlechter Performance f?hren kann, kann es unter
bestimmten Umst?nden sinnvoll sein, die logischen CPUs mit der
sysctl-Variable machdep.hlt\_logical\_cpus zu deaktivieren. Es ist
au?erdem m?glich, jede CPU anzuhalten, die sich im Idle-Loop befindet,
dazu dient die sysctl-Variable machdep.hlt\_cpus. Weitere Informationen
finden Sie in
`smp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=smp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__.

Unterst?tzt die CPU die Physical Address Extension (PAE), kann FreeBSD
diese Erweiterung nutzen, wenn in der Konfigurationsdatei f?r den
angepa?ten Kernel die Option PAE angegeben wird. In diesem Fall wird der
Speicher oberhalb von 4 GByte erkannt und steht f?r die Nutzung durch
das System zur Verf?gung. Allerdings sind nicht alle Teile von FreeBSD
und alle Treiber kompatibel zu PAE. Weitere Informationen finden Sie in
`pae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pae&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__.

FreeBSD l?uft normalerweise auf Laptops mit i386-Prozessoren, allerdings
gibt es keinen einheitlichen Standard f?r die Unterst?tzung bestimmter
Ausstattungsmerkmale wie Audio, Grafik, Power Management und PCCARD
Steckpl?tzen. Diese Merkmale sind von Maschine zu Maschine
verschiedenen. In vielen F?llen ist es sogar notwendig, FreeBSD speziell
anzupassen, um Fehlern in der Hardware und anderen Merkw?rdigkeiten
auszuweichen. Im Zweifelsfalle kann ein Blick in der Archive der
Mailingliste `FreeBSD laptop
computer <http://lists.FreeBSD.org/mailman/listinfo/freebsd-mobile>`__
weiterhelfen.

Die meisten aktuellen Laptops (und auch f?r den Schreibtisch vorgesehene
Ger?te) unterst?tzen den Advanced Configuration and Power Management
(ACPI) Standard. Wie in
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
beschrieben, nutzt FreeBSD die von Intel ver?ffentlichte
Referenz-Implementierung "ACPI Component Architecture", um ACPI
unterst?tzen zu k?nnen. Leider kann es durch die Benutzung von ACPI auf
einigen Systemen zu Stabilit?tsproblemen kommen, die es notwendig
machen, den ACPI-Treiber abzuschalten. Dieser wird normalerweise beim
Systemstart als Kernel-Modul geladen. Um ihn abzuschalten, m?ssen Sie
die folgende Zeile in die Datei ``/boot/device.hints`` eintragen:

.. code:: PROGRAMLISTING

    hint.acpi.0.disabled="1"

Wenn Sie ein Problem im Zusammenhang mit ACPI l?sen wollen, kann es
helfen, Teile der ACPI-Funktionen abzuschalten. Informationen, welche
der Einstellungen im Bootloader daf?r verantwortlich sind, finden Sie in
der Onlinehilfe zu
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__

ACPI braucht zur korrekten Funktion die Differentiated System Descriptor
Table (DSDT), die vom BIOS bereitgestellt wird. Einige Systemen haben
fehlerhafte oder unvollst?ndige DSDTs, daher kann ACPI auf diesen
Maschinen nicht korrekt funktionieren. Korrigierte DSDTs f?r einige
Maschinen sind im Bereich
`DSDT <http://acpi.sourceforge.net/dsdt/index.php>`__ der Webseiten des
`ACPI4Linux <http://acpi.sourceforge.net/>`__ Projekts verf?gbar.
FreeBSD kann diese DSDTs an Stelle der vom BIOS bereitgestellten DSDT
nutzen, weitere Informationen dazu finden Sie in der Onlinehilfe zu
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__

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

Adaptec AIC-6260 und AIC-6360 basierte Karten
(`aic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aic&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec AHA-154X und AHA-1640 MCA SCSI Controller und kompatible Ger?te
(`aha(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aha&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec 174x EISA SCSI Controller im erweiterten Modus
(`ahb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec AIC7770, AIC7850, AIC7860, AIC7870, AIC7880, und AIC789x SCSI
Controller
(`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Ultra-320 SCSI Controller auf Basis der Adaptec AIC7901, AIC7901A und
7902 Ultra320 Controller
(`ahd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec FSA RAID Controller
(`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

AdvanSys SCSI Controllers (alle Modelle.
`adv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adv&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`adw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=adw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

BusLogic MultiMaster Hostadapter der Modellreihen \`\`W'', \`\`C'',
\`\`S'' und \`\`A''
(`bt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Buslogic/Bustek BT-640, Storage Dimensions
    SDC3211B und SDC3211F Microchannel (MCA) Hostadapter werden
    ebenfalls unterst?tzt.

.. raw:: html

   </div>

DPT SmartCACHE Plus, SmartCACHE III, SmartRAID III, SmartCACHE IV und
SmartRAID IV SCSI/RAID Controller
(`dpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec 21x0S/32x0S/34x0S SCSI RAID Controller
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec 2000S/2005S Zero-Channel RAID
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec 2400A ATA-100 RAID Controller
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

DPT SmartRAID V und VI SCSI RAID Controller
(`asr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=asr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

AMI MegaRAID RAID Controller, Modellreihen Express und Enterprise
(`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Sie k?nnen von diesen Hostadapter booten. Die
    EISA-Varianten werden nicht unterst?tzt.

.. raw:: html

   </div>

Mylex DAC RAID Controller, Firmware-Version 2.x, 3.x, 4.x und 5.x
(`mlx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mlx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Sie k?nnen von diesen Hostadapter booten. Die
    EISA-Varianten werden nicht unterst?tzt.

.. raw:: html

   </div>

Mylex PCI to SCSI RAID Controllers, Firmware-Version 6.x
(`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

3ware Escalade ATA RAID Controller
(`twe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

ISA/PC-Card SCSI Hostadapter auf Basis der TMC 18C30, 18C50 und 36C70
(AIC-6820) Chips
(`stg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stg&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Qlogic Controller und kompatible Ger?te
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

DTC 3290 EISA SCSI Controller (1542 Emulation)

Tekram DC390 und DC390T Controller, eventuell auch andere auf dem AMD
53c974 basierende Karten
(`amd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

PC-Card SCSI Hostadapter auf Basis des Workbit Ninja SCSI-3
(`nsp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nsp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Adaptec AIC-7110 SCSI-Controller f?r den Druckerport
(`vpo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vpo&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Compaq Intelligent Drive Array Kontroller
(`ida(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ida&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

SCSI Hostadapter, die das \`\`Command Interface for SCSI-3 Support''
nutzen
(`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Intel Integrated RAID Controller
(`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Promise SuperTrak ATA RAID Controller
(`pst(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pst&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

IBM / Adaptec ServeRAID Systeme
(`ips(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ips&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

LSI Logic Fusion/MP architecture Fiber Channel Controller
(`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

PCI SCSI Host Adapter auf Basis des Tekram TRM-S1040 SCSI Chipsatzes
(`trm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=trm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

-  Matsushita CR-562, CR-563 und kompatible
   (`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  Sony-eigener Anschlu? (alle Modelle)
   (`scd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)

-  ATAPI IDE Ger?te
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)

Die folgenden Treiber wurden zwar vom alten SCSI-Treibermodell
unterst?tzt, wurden aber noch nicht f?r das neue
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__-System
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
   (`mcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mcd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__)

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
(`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit National Semiconductor DS8390, dazu geh?ren auch die
NE2000 und alle Nachbauten der NE2000
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  3C503 Etherlink II
   (`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

RealTek RTL 8002 Pocket Ethernet
(`rdp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rdp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

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

SysKonnect SK-984x PCI Gigabit Ethernet Karten
(`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

DEC EtherWORKS II und III Netzwerkkarten
(`le(4) <http://www.FreeBSD.org/cgi/man.cgi?query=le&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

-  Intel InBusiness 10/100 PCI Netzwerkkarten

-  Intel PRO/100+ Management Adapter

-  Intel Pro/100 VE Desktop Adapter

-  Intel Pro/100 M Desktop Adapter

-  Intel Pro/100 S Desktop, Server und Dual-Port Server Adapters

-  Interne Netzwerk-Anschl?sse auf diversen Mainbaords von Intel

Netzwerkkarten mit Intel 82595
(`ex(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ex&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit Intel 82586
(`ie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ie&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

3Com 3C5x9 Etherlink III Netzwerkkarten
(`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

3Com 3C501 8-bit ISA Netzwerkkarten
(`el(4) <http://www.FreeBSD.org/cgi/man.cgi?query=el&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit 3Com Etherlink XL Chipsatz
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

3Com 3C59X Familie
(`vx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Netzwerkkarten mit Crystal Semiconductor CS89x0
(`cs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cs&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Megahertz X-Jack Ethernet PC-Card CC-10BT
(`sn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Xircom CreditCard (16 bit) und baugleiche Karten
(`xe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

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

Fast Ethernet Karten mit Broadcom BCM4401 Chipsatz
(`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

DEC DEFEA EISA
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

NCR / AT&T / Lucent Technologies WaveLan T1-speed ISA/radio LAN Karten
(`wl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

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

802.11a/b/g Netzwerkkarten auf Basis der Chips?tze Atheros AR5210,
AR5211 und AR5212
(`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.6. Diverse Netzwerkkarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cronyx-Sigma synchron/asynchron Wandler f?r serielle Verbindungen
(`cx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cx&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
driver)

Granch SBNI12 Punkt-zu-Punkt Kommunikationssystem
(`sbni(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbni&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Granch SBNI16 SHDSL Modems
(`sbsh(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbsh&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

SMC COM90cx6 ARCNET Netzwerkkarten (cm Treiber)

-  SMC 90c26, 90c56, und 90c66 (im 90c56-kompatiblen Modus)

LAN Media Corp WAN Adapter auf Basis des DEC \`\`Tulip'' Fast Ethernet
Controller
(`lmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lmc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

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

3.8. Serielle Schnittstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Serielle Schnittstellen nach \`\`PC standard'' auf Basis der 8250, 16450
und 16550 Chips
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

AST 4 Port Karte (bei Benutzung eines gemeinsamen IRQs)

ARNET Karten
(`ar(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ar&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
(`rp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Cyclades Cyclom-Y serial Karte
(`cy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cy&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

STB 4 Port Karte (bei Benutzung eines gemeinsamen IRQs)

Intelligente serielle Karten von DigiBoard
(`dgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dgb&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Serielle Multi-Port PCI-Karten
(`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  Actiontech 56K PCI

-  Avlab Technology, PCI IO 2S und PCI IO 4S

-  Comtrol RocketPort 550

-  Decision Computers PCCOM 4-port serial und dual port RS232/422/485

-  Dolphin Peripherals 4025/4035/4036

-  IC Book Labs Dreadnought 16x Lite und Pro

-  Lava Computers 2SP-PCI/DSerial-PCI/Quattro-PCI/Octopus-550

-  Middle Digital, Weasle serial port

-  Moxa Industio CP-114, Smartio C104H-PCI und C168H/PCI

-  NEC PK-UG-X001 und PK-UG-X008

-  Netmos NM9835 PCI-2S-550

-  Oxford Semiconductor OX16PCI954 PCI UART

-  Syba Tech SD-LAB PCI-4S2P-550-ECP

-  SIIG Cyber I/O PCI 16C550/16C650/16C850

-  SIIG Cyber 2P1S PCI 16C550/16C650/16C850

-  SIIG Cyber 2S1P PCI 16C550/16C650/16C850

-  SIIG Cyber 4S PCI 16C550/16C650/16C850

-  SIIG Cyber Serial (1- und 2-Port) PCI 16C550/16C650/16C850

-  Syba Tech Ltd. PCI-4S2P-550-ECP

-  Titan PCI-200H und PCI-800H

-  US Robotics (3Com) 3CP5609 modem

-  VScom PCI-400 und PCI-800

Serielle Karte von SDL Communication

-  SDL Communications Riscom/8 Serial Board (rc Treiber)

-  SDL Communications RISCom/N2 und N2pci high-speed sync serial boards
   (`sr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

Serielle Multi-Port Karten von Stallion Technologies
(`stl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stl&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
and
`stli(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stli&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Specialix SI/XIO/SX Karten, sowohl die ?lteren SIHOST2.x als auch die
neuen \`\`enhanced'' (transputer based, aka JET) Karten (ISA, EISA und
PCI werden unterst?tzt)
(`si(4) <http://www.FreeBSD.org/cgi/man.cgi?query=si&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9. Audio Hardware
~~~~~~~~~~~~~~~~~~~

Advance
(`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  Asound 100 und 110

-  Logic ALS120 und ALS4000

CMedia Audio Bausteine

-  CMI8338/CMI8738

Crystal Semiconductor
(`csa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=csa&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  CS461x/462x Audio Accelerator

-  CS428x Audio Controller

ENSONIQ
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  AudioPCI ES1370/1371

ESS

-  ES1868, ES1869, ES1879 und ES1888
   (`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
(`gusc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gusc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  UltraSound MAX

-  UltraSound PnP

Eingebaute Audio-Hardware auf Intel 443MX, 810, 815, und 815E Mainboards
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

MSS/WSS kompatible DSPs
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

NeoMagic 256AV/ZX
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

OPTi 931/82C931
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

S3 Sonicvibes

Creative Technologies SoundBlaster Familie
(`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

-  SoundBlaster

-  SoundBlaster Pro

-  SoundBlaster AWE-32

-  SoundBlaster AWE-64

-  SoundBlaster AWE-64 GOLD

-  SoundBlaster ViBRA-16

Creative Sound Blaster Live! Familie (emu10k1 Treiber)

Trident 4DWave DX/NX
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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
(`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

Connectix QuickCam

Cortex1 frame grabber (ctx Treiber)

Creative Labs Video Spigot frame grabber (spigot Treiber)

Matrox Meteor Video frame grabber
(`meteor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=meteor&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

-  Iomega USB Zip 100Mb (nur sehr eingeschr?nkt)

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

Genius und Mustek Handscanner

GPB und Transputer Treiber

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

-  AT-Tastaturen
   (`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  PS/2-Tastaturen
   (`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  USB-Tastaturen (genaue Modellbezeichnungen finden Sie im Kapitel `USB
   Ger?te <#USB>`__)

Loran-C Empf?nger (Dave Mills experimental hardware, loran Treiber).

M?use:

-  Bus M?use und kompatible Ger?te
   (`mse(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mse&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   Treiber)

-  PS/2 M?use und kompatible Ger?te, unter anderem viele der bei Laptops
   verwendeten Touchpads und Glidepoints
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
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

Parallele Schnittstellen nach \`\`PC-Standard''
(`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

PC-kompatible Joysticks
(`joy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=joy&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber)

PHS Data Communication Card/PCCARD

-  NTT DoCoMo P-in Comp@ct

-  Panasonic KX-PH405

-  SII MC-P200

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
