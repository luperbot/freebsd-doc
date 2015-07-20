================================================
FreeBSD/alpha 4.6.2-RELEASE Hardware Information
================================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.6.2-RELEASE Hardware Information
================================================

The FreeBSD German Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 The FreeBSD Documentation Project

Copyright © 2002 The FreeBSD German Documentation Project

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Inhaltsverzeichnis**
1. `Einf?hrung <#AEN13>`__
2. `Unterst?tzte Prozessoren und Mainboards <#AEN18>`__
2.1. `?bersicht <#AEN32>`__
2.2. `Was braucht man im Allgemeinen um FreeBSD auf einer Alpha zu
nutzen? <#AEN50>`__
2.3. `Spezifische Informationen f?r einzelne Systeme <#AEN112>`__
2.3.1. `AXPpci33 (\`\`NoName'') <#AEN117>`__
2.3.2. `Universal Desktop Box (UDB oder \`\`Multia'') <#AEN191>`__
2.3.3. `Personal Workstation (\`\`Miata'') <#AEN277>`__
2.3.4. `DEC3000 Familie (die \`\`Bird'' Maschinen) <#AEN385>`__
2.3.5. `Evaluation Board 64 Systeme <#AEN557>`__
2.3.6. `Evaluation Board 164 (\`\`EB164, PC164, PC164LX, PC164SX'')
Familien <#AEN610>`__
2.3.7. `AlphaStation 200 (\`\`Mustang'') und 400 (\`\`Avanti'')
Familien <#AEN672>`__
2.3.8. `AlphaStation 500 und 600 (\`\`Alcor'' und \`\`Maverick'' f?r
EV5, \`\`Bret'' f?r EV56) <#AEN737>`__
2.3.9. `AlphaServer 1000 (\`\`Mikasa''), 1000A (\`\`Noritake'') und 800
(\`\`Corelle'') <#AEN845>`__
2.3.10. `DS10/VS10/XP900 (\`\`Webbrick'') / XP1000 (\`\`Monet'') / DS10L
(\`\`Slate'') <#AEN904>`__
2.3.11. `DS20/DS20E (\`\`Goldrush'') <#AEN1057>`__
2.3.12. `AlphaPC 264DP / UP2000 <#AEN1127>`__
2.3.13. `AlphaServer 2000 (\`\`DemiSable''), 2100 (\`\`Sable''), 2100A
(\`\`Lynx'') <#AEN1173>`__
2.3.14. `AlphaServer 4x00 (\`\`Rawhide'') <#AEN1246>`__
2.3.15. `AlphaServer 1200 (\`\`Tincup'') und AlphaStation 1200
(\`\`DaVinci'') <#AEN1277>`__
2.3.16. `AlphaServer 8200 und 8400 (\`\`TurboLaser'') <#AEN1307>`__
2.3.17. `Alpha Processor Inc. UP1000 <#AEN1351>`__
2.3.18. `Alpha Processor Inc. UP1100 <#AEN1401>`__
2.3.19. `Alpha Processor Inc. CS20, Compaq DS20L <#AEN1449>`__
2.4. `?bersicht ?ber die unterst?tzte Hardware <#AEN1496>`__
2.5. `Danksagung <#AEN1528>`__
3. `Unterst?tzte Ger?te <#AEN1569>`__
3.1. `Festplatten-Controller <#AEN1575>`__
3.2. `Netzwerkkarten <#ETHERNET>`__
3.3. `FDDI Karten <#AEN2805>`__
3.4. `ATM Karten <#AEN2815>`__
3.5. `Karten f?r drahtlose Netzwerke <#AEN2858>`__
3.6. `Diverse Netzwerkkarten <#AEN2983>`__
3.7. `ISDN Karten <#AEN2993>`__
3.8. `Serielle Multi-Port Karten <#AEN3057>`__
3.9. `Audio Hardware <#AEN3154>`__
3.10. `Kameras, TV-Karten, etc <#AEN3256>`__
3.11. `USB Ger?te <#USB>`__
3.12. `Diverses <#AEN3438>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Liste der unterst?tzen Ger?te f?r FreeBSD
4.6.2-RELEASE auf Alpha/AXP Systemen (meistens einfach FreeBSD/alpha
4.6.2-RELEASE genannt). Hier finden Sie zum einen alle die Ger?te, von
denen wir wissen, da? Sie funktionieren; zum anderen finden Sie hier
Hinweise, wie Sie den Kernel anpassen k?nnen, wenn Sie ein bisher noch
nicht unterst?tztes Ger?t verwenden wollen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Dieses Dokument enth?lt Informationen f?r Alpha/AXP
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

*Gepflegt von Wilko Bulte.* *?bersetzt von Udo Erdelhoff.*
Wir freuen uns ?ber Erg?nzungen, Korrekturen und konstruktive Kritik.
Informationen ?ber Fehlverhalten von Systemen sind willkommen.

.. raw:: html

   <div class="SECT2">

--------------

2.1. ?bersicht
~~~~~~~~~~~~~~

Dieses Dokument soll die erste Anlaufstelle f?r alle Anwender sein, die
FreeBSD auf einer Maschine mit Alpha-Prozessor benutzen wollen. Ziel
ist, Hintergrundinformationen ?ber die diversen Varianten der Hardware
zu geben. Es ist nicht als Ersatz f?r die Handb?cher der jeweiligen
Systeme gedacht. Die Informationen gliedern sich wie folgt:

-  Mindestanforderungen an die Hardware f?r den Betrieb von FreeBSD auf
   einem Alpha System;

-  n?here Informationen zu den von FreeBSD unterst?tzten
   Modellen/Mainboards;

-  Hinweise zur Verwendung von Erweiterungskarten mit FreeBSD inklusive
   Informationen zu plattformabh?ngiger Hardware.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Im Text wird je nach Lust und Laune auf DEC, Digital
    Equipment Corporation und Compaq verwiesen. Da Compaq die Firma
    Digital Equipment aufgekauft hat, d?rfte man eigentlich nur noch auf
    Compaq verweisen. Allerdings findet man diesen Namens-Mix ?berall,
    darum haben wir uns die Arbeit erspart.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** SRM Befehle werden in GROSSBUCHSTABEN dargestellt.
    SRM akzeptiert auch Kleinbuchstaben, die Verwendung von
    Gro?buchstaben dient dazu, Befehle f?r den Leser hervorzuheben.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Compaq stellt auf seinen Webseiten Informationen f?r
    Linux-Entwickler bereit. Auch f?r FreeBSD Anwender sind diese
    durchaus n?tzlich. Werfen Sie einmal einen Blick auf `Linux Alpha
    Power tools <http://www.support.compaq.com/alpha-tools/>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. Was braucht man im Allgemeinen um FreeBSD auf einer Alpha zu nutzen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Logischerweise eine Alpha, die von FreeBSD unterst?tzt wird. Alpha
Maschinen sind KEINE PCs. Es gibt erhebliche Unterschiede zwischen den
einzelnen Chips?tzen und Mainboards. Der Kernel mu? also die genauen
Details einer Maschine kennen, damit er auf ihr laufen kann. Wenn Sie
einfach irgendeinen ``GENERIC`` Kernel auf Ihre Hardware loslassen, wird
das in der Regel b?se in die Hose gehen.

Wenn Sie planen, eine Maschine mit FreeBSD zu nutzen, sollten Sie darauf
achten, da? die SRM Firmware Konsole installiert ist, bzw. das diese
Firmware f?r Ihre Maschine verf?gbar ist. Wenn Ihr System noch nicht von
FreeBSD unterst?tzt wird, kann sich das durchaus irgendwann einmal
?ndern; allerdings nur, wenn SRM f?r dieses System verf?gbar ist.

Wenn auf Ihrer Maschine die Firmware f?r die ARC oder AlphaBIOS Konsole
installiert ist, handelt es sich um ein System, welches auf den Betrieb
mit WindowsNT ausgelegt ist. Bei einigen Systemen ist die Firmware f?r
die SRM Konsole im System-ROM verf?gbar und Sie m?ssen diese nur
aktivieren (?ber das ARC oder AlphaBIOS Men?). Bei anderen System werden
Sie die ROMs mit der SRM Firmware neu flashen m?ssen. Bei
http://ftp.digital.com/pub/DEC/Alpha/firmware k?nnen Sie erfahren,
welche Optionen f?r Ihr System verf?gbar sind. Grundregel: Kein SRM
bedeutet *kein* FreeBSD (und auch kein NetBSD, OpenBSD, Tru64 Unix oder
OpenVMS). Nach dem Ende von WindowsNT/Alpha werden viele alte NT-Systeme
auf dem Gebrauchtmarkt verkauft. Diese sind mehr oder weniger wertlos,
wenn die Firmware lediglich NT unterst?tzt. Seien Sie also vorsichtig,
wenn der Preis zu verlockend scheint.

F?r diese Maschinen ist kein SRM verf?gbar:

-  Digital XL series

-  Digital XLT series

-  Samsung PC164UX (\`\`Ruffian'')

-  Samsung 164B

F?r diese Systeme ist zwar eine SRM Firmware verf?gbar, sie werden aber
nicht von FreeBSD unterst?tzt:

-  DECpc 150 (\`\`Jensen'')

-  DEC 2000/300 (\`\`Jensen'')

-  DEC 2000/500 (\`\`Culzean'')

-  AXPvme Familie (\`\`Medulla'')

Um die Dinge noch weiter zu verkomplizieren, hat Digital zwei
verschiedene Typen von Alpha-Maschinen verkauft: Die \`\`wei?en'' Alphas
waren reine NT-Maschinen, w?hrend auf den \`\`blauen'' Alphas OpenVMS
und Digital Unix laufen. Die Namen stammen von den Farben der Geh?use:
\`\`FrostWhite'' bzw. \`\`TopGunBlue''. Sie k?nnen zwar die Firmware f?r
die SRM Konsole auf einer wei?en Alpha installieren, allerdings werden
sich OpenVMS und Digital Unix weigern, auf einer solchen Maschine zu
booten. FreeBSD kann seit 4.0-RELEASE sowohl auf wei?en als auch auf
blauen Alphas genutzt werden. Um Fragen vorzubeugen: Digital verkaufte
die wei?en Alphas zu einem anderen (lies: geringeren) Preis.

Zusammen mit der SRM Firmware erhalten Sie den sogenannten OSF/1 PAL
Code (OSF/1 war der urspr?ngliche Name f?r die von Digital angebotene
Variante f?r die Alpha). Der PAL Code ist eine Art Vermittler zwischen
der Hardware und dem Betriebssystem. Er benutzt die normalen CPU Befehle
und einige besondere Anweisungen, die nur f?r die Nutzung durch den PAL
gedacht sind. PAL ist kein Microcode. Die Firmware f?r die ARC Konsole
enth?lt einen anderen PAL Code der auf die Nutzung durch WinNT optimiert
ist. Er kann nicht von FreeBSD (oder generell Unix bzw. OpenVMS) genutzt
werden. Um die ?blichen Frage vorwegzunehmen: Linux verf?gt ?ber einen
eigenen PAL Code und kann daher auch von ARC und AlphaBIOS. Dieser
Ansatz wird aus diversen Gr?nden von den \*BSD-Machern abgelehnt.
Details w?rden an dieser Stelle zu weit f?hren, sind aber auf den
Webseiten von FreeBSD und NetBSD verf?gbar.

Es gibt noch einen weiteren Fallstrick: Sie brauchen einen
Festplatten-Controller, der von der SRM Firmware erkannt wird, damit Sie
davon booten k?nnen. Welche Controller akzeptabel sind, h?ngt leider
stark vom jeweiligen System und der SRM Version ab. F?r ?ltere
PCI-basierte Systeme brauchen Sie entweder einen Kontroller mit einem
NCR/Symbios 53C810 oder einem Qlogic 1020/1040. Einige Maschinen
verf?gen ?ber einen integrierten On-Board Controller. Neuere Maschinen
und SRM Versionen unterst?tzen auch aktuellere SCSI-Chips bzw.
Kontroller. Details finden Sie in den System-spezifischen Informationen.
Hinweis: Wenn in diesem Dokument Symbios Chips erw?hnt werden, sind
damit auch ?ltere Chips gemeint, die noch die Aufschrift NCR tragen. NCR
wurde vor einiger Zeit von Symbios aufgekauft.

Diese Einschr?nkung k?nnte Ihnen Probleme machen, wenn Sie ein
ehemaliges WindowsNT-System haben. ARC und AlphaBIOS kennen (und booten
von) *anderen* Controllern als SRM. Zum Beispiel k?nnen Sie mit
ARC/AlphaBIOS von einem Adaptec 2940UW booten, w?hrend das mit SRM
(normalerweise) nicht geht. Nur bei einigen neueren Maschinen ist es
m?glich, von einem Adaptec zu booten. Details finden Sie in den
System-spezifischen Informationen.

Wenn Sie von einem Controller nicht booten k?nnen, k?nnen Sie ihn aber
in der Regel f?r Festplatten nutzen, von denen nicht gebootet werden
soll. Die Unterschiede zwischen SRM und ARC k?nnen auch dazu f?hren, da?
in Ihrem System IDE CDROMs oder Festplatten stecken (speziell bei
ehemaligen WindowsNT-Systemen). Es gibt einige SRM Versionen, die von
IDE-Festplatten und -CDROMs booten k?nnen, Details dazu finden Sie
wiederum in den System-spezifischen Informationen.

Seit FreeBSD 4.0 k?nnen Sie von der Original-CD booten, bei ?lteren
Versionen brauchen Sie hingegen die zwei Bootdisketten.

Wenn Sie von einer Festplatte booten wollen, mu? die Root-Partition
(Partition a) am Anfang (Offset 0) der Festplatte liegen. Daher m?ssen
Sie das Partitions-Men? des Installationsprogramms benutzen und als
erstes Partition a mit Offset 0 als Root-Partition anlegen. Danach
k?nnen Sie den Rest der Festplatten frei aufteilen. Wenn Sie sich nicht
an diese Regel halten, werden Sie das System zwar problemlos
installieren k?nnen, aber nicht von der gerade installieren Festplatte
booten k?nnen.

Wenn Sie keine Festplatte haben (oder wollen), k?nnen Sie das System
auch ?ber Ethernet booten. Dazu brauchen Sie eine Netzwerkkarte bzw.
Chips, der von der SRM Konsole unterst?tzt wird. Das bedeutet in der
Regel, da? Sie eine Netzwerkkarte mit einem 21040, 21142 oder 21143 Chip
ben?tigen. Wenn Sie eine ?ltere Maschine oder SRM Versionen haben,
werden die 21142 / 21143 Fast Ethernet Chips m?glicherweise nicht
erkannt. In diesem Fall k?nnen Sie nur 10MBit Ethernet nutzen, wenn Sie
?ber Ethernet booten wollen. Wenn Ihre Karte nicht von DEC stammt, wird
sie meistens auch funktionieren (aber nicht immer). Intel hat vor
einiger Zeit Digital Semiconductor aufgekauft und damit auch die Rechte
an den 21x4x Chips erworben. Wundern Sie sich also nicht, wenn Sie einen
21x4x mit Intel-Logo sehen. Der SRM auf einigen neuen Modellen
unterst?tzt ?brigens auch die Intel 8255x Chips.

Alphas mit SRM k?nnen sowohl eine graphische als auch eine serielle
Konsole nutzen. ARC kann zur Not auch eine serielle Konsole bedienen.
Wenn Sie ein Terminalprogramm mit einer 8Bit-f?higen VT100-Emulation
besitzen, sollten Sie in der Lage sein, von ARC/AlphaBIOS auf SRM
umzuschalten, ohne erst eine Graphikkarte installieren zu m?ssen.

Wenn Sie Ihre Alpha ohne Monitor und Grafikkarte betreiben wollen,
m?ssen Sie lediglich Tastatur und Maus abziehen. Als Ersatz schlie?en
Sie ein Terminal (bzw. einen PC mit Terminalprogramm) an den Anschlu?
"serial port #1" an. Der SRM spricht 9600N81. Diese Variante ist auch
sehr praktisch f?r die Fehlerdiagnose. Vorsicht: Einige/alle SRM geben
auch am zweiten seriellen Anschlu? eine Eingabeaufforderung aus. Der
Kernel wird allerdings nur den ersten Anschlu? f?r seine Ausgaben und
seine Konsole nutzen. *Dieses Verhalten kann zu massiver Verwirrung
f?hren.*

Die meisten PCI-basierten Alphas k?nnen normale VGA-Karten f?r PCs
nutzen. Der SRM ist intelligent genug, um diese Karten anzusprechen.
Allerdings bedeutet dies nicht, da? jede beliebige PCI VGA-Karte in
einer Alpha funktioniert. Die S3 Trio64, Mach64, und Matrox Millennium
funktionieren in der Regel, auch alte ET4000 funktionieren. Fragen Sie
lieber nach, bevor Sie Geld ausgeben.

Die meisten anderen PCI-Karten aus der PC-Welt werden auch von FreeBSD
auf PCI-basierten Alpha-Maschinen unterst?tzt. Die aktuellsten
Informationen zu diesem Thema finden Sie in der Datei
``/sys/alpha/conf/GENERIC``. Wenn auf der von Ihnen genutzten PCI-Karte
eine PCI-Bridge ist, sollten Sie die spezifischen Informationen zum
jeweiligen System beachten. In einigen F?llen k?nnen PCI-Karten Probleme
verursachen, wenn sie die PCI-Parity nicht richtig implementieren. Dies
kann zu Abst?rzen des Systems f?hren. Sie k?nnen die ?berpr?fung der
PCI-Parity mit dem folgenden SRM Kommando abschalten:

.. code:: SCREEN

    >>> SET PCI_PARITY OFF

Dies ist kein Fehler in FreeBSD, alle auf der Alpha genutzten
Betriebssysteme ben?tigen diesen \`\`Trick''.

Wenn Ihr System (auch) EISA-Steckpl?tze enth?lt, m?ssen Sie, nachdem Sie
eine EISA-Karte eingebaut oder die Firmware der Konsole aktualisiert
haben, das EISA Configuration Utility (ECU) starten.

Es gibt verschiedene Version der Alpha CPU. Die erste Version war der
21064. Er wurde in einem MOS4 genannten Verfahren hergestellt, die Chips
haben den Spitznamen EV4. Neuere CPUs hei?en 21164, 21264, usw. Sie
werden auch als EV4S, EV45, EV5, EV56, EV6, EV67, EV68 bezeichnet. Die
EVs mit zwei Ziffern kennzeichnen verbesserte Versionen. Zum Beispiel
verf?gt der EV45 im Vergleich zu seinem Vorg?nger, der EV4 ?ber eine
verbesserte FPU sowie ?ber einen 16 KByte I&D Cache on-chip. Faustregel:
Je gr??er die erste Ziffer nach dem \`\`EV'' ist, desto besser ist der
Chip (lies: schneller / moderner).

In Punkto Speicher sollten Sie auf jeden Fall mindestens 32 MByte
einsetzen. Es ist zwar m?glich, FreeBSD auch auf einem System mit nur 16
MByte zu nutzen, aber dabei kommt keine Freude auf. Die zur Compilierung
des Kernels ben?tigte Zeit halbierte sich nach dem Ausbau auf 32 MByte.
Bitte beachten Sie, da? die SRM Konsole 2 MByte des Systemspeichers
nutzt (und auch beh?lt). Wenn Sie ernsthaft mit Ihrem System arbeiten
wollen, sollte es mindestens 64 MByte Speicher besitzen.

Wo wir gerade beim Thema sind: Achten Sie sehr genau darauf, welche Art
von Speicher Ihr System benutzt. Es gibt viele verschiedene
Konfigurationen und Einschr?nkungen f?r die unterschiedlichen Systeme.

Zum Abschlu?: Der oben stehende Text d?rfte auf einen Einsteiger etwas
abschreckend wirken. Lassen Sie sich aber nicht abhalten. Wenn Sie noch
Fragen haben, stellen Sie diese ruhig.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Spezifische Informationen f?r einzelne Systeme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Im Rest dieses Kapitels finden Sie eine ?bersicht ?ber alle Systeme, auf
denen FreeBSD genutzt werden kann. Diese Liste wird l?nger werden, ein
Blick in ``/sys/alpha/conf/GENERIC`` lohnt sich.

Bei Alpha-Systemen wird oft nur der Codename aus dem Entwicklungsprojekt
benutzt, um eine Maschine zu identifizieren. Soweit bekannt, stehen die
Namen in Klammern hinter dem offiziellen Namen.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1. AXPpci33 (\`\`NoName'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Bei der NoName handelt es sich um ein Mainboard im Baby-AT Format mit
einem 21066 LCA (Low Cost Alpha) Prozessor. Die NoName war urspr?nglich
f?r die Verwendung durch OEMs gedacht. Der LCA Chip enth?lt fast die
gesamte Ansteuerung f?r den PCI-Bus und den Speicher, was ein sehr
preiswertes System m?glich macht.

Das eingeschr?nkte Interface zum Hauptspeicher bremst das System bei
einem Cache-Miss stark aus. Solange Sie innerhalb des On-Chip Caches
bleiben, ist die Performance der CPU vergleichbar mit der einer 21064
(erste Generation der Alpha). Diese Mainboards sollten heute sehr
g?nstig zu haben sein. Sie erhalten eine vollwertige 64-Bit CPU,
allerdings sollten Sie keine Geschwindigkeitswunder erwarten.

Features:

-  21066 Alpha CPU mit 166 MHz oder 21066A CPU mit 233 MHz. 21068 CPUs
   existieren auch, sind aber noch langsamer.

-  on-board Bcache / L2 cache: 0, 256k oder 1 MByte (nutzt DIL Chips)

-  PS/2 Maus & Tastatur ODER 5pin DIN Tastatur (2 verschiedene
   Mainboards)

-  Speicher:

   -  Busbreite: 64 Bits

   -  PS/2 72 Pin 36 Bit Fast Page Mode SIMMs

   -  70ns oder schneller

   -  m?ssen paarweise installiert werden

   -  4 SIMM Steckpl?tze

   -  benutzt ECC

-  512 KByte Flash ROM f?r die Konsole

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?

-  Floppy-Anschlu?:

-  1 IDE Anschlu? on-board

-  Steckpl?tze:

   -  3 32 Bit PCI Steckpl?tze (einer mit ISA geteilt)

   -  5 ISA Steckpl?tze (einer mit PCI geteilt)

-  on-board Fast SCSI mit Symbios 53C810 Chip

Die NoName kann in ihrem Flash ROM die Firmware f?r den SRM *oder* ARC
Konsole enthalten. Das Flash ROM ist nicht gro? genug, um beide
Varianten gleichzeitig zur Verf?gung zu stellen und die Auswahl per
Software m?glich zu machen. Sie ben?tigen jedoch nur SRM.

Der Cache der NoNames nutzt 15 oder 20 ns DIL Chips. Wenn Sie nur 256
KByte Cache brauchen, sollten Sie ihr altes 486er Mainboard
ausschlachten. Die f?r 1 MByte Cache ben?tigten Chips sind leider
deutlich seltener zu finden. Sie sollten zur Steigerung der Performance
mindestens 256 KByte Cache nutzen. Ohne Cache sind diese Maschinen sehr
langsam.

Das NoName Mainboard hat den normalen PC/AT-Stromanschlu?. Au?erdem
verf?gt es ?ber einen zus?tzlichen Anschlu? f?r 3.3 Volt. Es ist
allerdings nicht notwendig, ein neues Netzteil zu kaufen. Die 3.3 Volt
werden nur ben?tigt, wenn Sie auf 3.3 Volt ausgelegt PCI-Karten nutzen
wollen. Diese sind extrem selten.

Der IDE-Anschlu? wird von FreeBSD unterst?tzt, wenn die folgende Zeile
in der Konfigurationsdatei des Kernels steht:

.. code:: PROGRAMLISTING

    device ata0 at isa? port IO_WD1 irq 14

Leider kann die SRM Konsole von der IDE-Festplatte *nicht booten*. Sie
brauchen daher eine SCSI-Platte als Bootdevice.

Die NoName verh?lt sich im Bereich der seriellen Konsole etwas
st?rrisch. Sie m?ssen

.. code:: SCREEN

    >>> SET CONSOLE SERIAL

eingeben, damit sie eine serielle Konsole benutzt. Im Gegensatz zu den
meisten anderen Modellen reicht es nicht aus, die Tastatur abzuziehen.
Um wieder zur graphischen Konsole zu wechseln, m?ssen Sie

.. code:: SCREEN

    >>> SET CONSOLE GRAPHICS

auf der seriellen Konsole eingeben.

Einige Anwender mu?ten manchmal **Control**-**Alt**-**Del** dr?cken, um
den SRM aufzuwecken. Ich habe diese Situation noch nie erlebt; aber wenn
Sie nach dem Einschalten von einem schwarzen Bildschirm begr??t werden
ist es einen Versuch wert.

Verwenden Sie nur echte 36 Bit SIMMs, und nur FPM (Fast Page Mode) DRAM.
EDO DRAM oder SIMMs mit simulierter Parity *funktionieren nicht*. Das
System nutzt die zus?tzlichen 4 Bit f?r ECC. Das ist auch der Grund
weshalb 33 Bit FPM SIMMs nicht funktionieren.

Wenn Sie die Wahl haben, sollten Sie zur PS/2-Variante des Mainboards
greifen. Zum einen erhalten Sie einen Bonus-Anschlu? f?r die Maus, zum
anderen wird diese Variante von Tru64 Unix unterst?tzt (falls Sie das
irgendwann einmal benutzen wollen oder m?ssen.) Die \`\`DIN''-Variante
sollte aber f?r FreeBSD: ausreichend sein.

Lesen Sie nach M?glichkeit das `OEM
manual <ftp://ftp.digital.com/pub/DEC/axppci/design_guide.ps>`__.

Die Konfigurationsdatei f?r den Kernel einer NoName mu? die folgenden
Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_AXPPCI_33
    cpu     EV4

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2. Universal Desktop Box (UDB oder \`\`Multia'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Multia enth?lt entweder eine Intel- oder
    Alpha-CPU. Hier wird aus offensichtlichen Gr?nden nur die
    Alpha-Variante betrachtet.

.. raw:: html

   </div>

Die Multia ist ein kleiner Desktop-Rechner, der als eine Art Personal
Workstation gedacht war. Es gibt viele verschiedene Varianten, Sie
sollten also genau auf die Details achten.

Features:

-  21066 Alpha CPU mit 166 MHz oder 21066A CPU mit 233 MHz

-  on-board Bcache / L2 cache: COAST-?hnliches 256 KByte Cache Modul;
   die Variante mit 233 MHz hat 512 KByte Cache; die Variante mit 166
   MHz besitzt 256 KByte Cache, der fest eingebaut ist.

-  Anschl?sse f?r PS/2 Maus & Tastatur

-  Speicher:

   -  Busbreite: 64 Bit

   -  PS/2 72 Pin 36 Bit Fast Page Mode SIMMs

   -  70ns oder schneller

   -  m?ssen paarweise installiert werden

   -  4 SIMM Steckpl?tze

   -  benutzt ECC

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?

-  Floppy-Anschlu?

-  Intel 82378ZB PCI-ISA-Bridge

-  1 on-Board 21040 f?r 10MBit Ethernet mit AUI und 10Base2 Anschl?ssen

-  Steckpl?tze:

   -  1 32 Bit PCI Steckplatz

   -  2 PCMCIA Steckpl?tze

-  on-board Crystal CS4231 oder AD1848 Soundchip

-  on-board Fast SCSI, nutzt einen Symbios 53C810[A] Chip auf der PCI
   Riser Card

Das Flash ROM der Multia ist gro? genug, um SRM und ARC aufzunehmen und
die Umschaltung der Software zu erm?glichen.

Die in die Multia eingebaute TGA-Grafikkarte kann von FreeBSD *nicht*
als Konsole genutzt werden. Sie m?ssen eine serielle Konsole verwenden.

Die Multia hat nur einen 32 Bit PCI Steckplatz, der nur f?r eine kleine
PCI-Karte genutzt werden kann. Wenn Sie darauf verzichten, k?nnen Sie
eine 3.5" Festplatte einbauen. Das Montagematerial k?nnte Ihrer Multia
beliegen. Allerdings sollten Sie auf den Einbau der Festplatte
*verzichten*, da das Netzteil und die K?hlung unterdimensioniert sind.

Die beiden PCMCIA Steckpl?tze der Multia werden momentan nicht von
FreeBSD unterst?tzt.

Wenn Sie planen, eine schnellere CPU einzubauen, sollen Sie pr?fen, ob
die CPU gesockelt ist. Bei den kleineren Multias ist sie normalerweise
eingel?tet.

Die Multia besitzt zwei serielle Schnittstellen, allerdings sind diese
auf einem 25-poligen sub-D Anschlu? zusammengefa?t. In der Multia-FAQ
finden Sie eine Anleitung zum Bau eines Y-Kabels, mit dem Sie beide
Anschl?sse nutzen k?nnen.

Sie k?nnen die Multia von Diskette booten, allerdings k?nnen Sie dabei
auf Probleme sto?en. Der typische Fehler ist:

.. code:: SCREEN

    *** Soft Error - Error #10 - FDC: Data overrun or underrun

Dies ist kein Problem von FreeBSD, es ist ein Fehler im SRM. Die
einfachste M?glichkeit bei der Installation von FreeBSD ist, von einem
SCSI CDROM zu booten.

Einige Anwender mu?ten manchmal **Control**-**Alt**-**Del** dr?cken, um
den SRM aufzuwecken. Ich habe diese Situation noch nie erlebt; aber es
kommt auf einen Versuch an, wenn Sie nach dem Einschalten von einem
schwarzen Bildschirm begr??t werden.

Audio funktioniert beim Crystal CS4231 Chip einwandfrei, wenn Sie den
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__-Treiber
benutzen und die folgende Zeile in der Konfigurationsdatei f?r Ihren
Kernel haben:

.. code:: PROGRAMLISTING

    device pcm0 at isa? port 0x530  irq 9 drq 3 flags 0x15

Bis jetzt hat es noch niemand geschafft, einer Multia mit einem AD1848
einen Ton zu entlocken..

Beim Test der Audio-Wiedergabe wird man daran erinnert, da? die 166 MHz
CPU nicht schnell ist. MP3s k?nnen nur mit 22 kHz fehlerfrei
wiedergegeben werden.

Multis sind daf?r bekannt, da? sie gerne den Hitzetod sterben. Das
extrem kompakte Geh?use erlaubt kaum Luftzufuhr. Sie sollten Sie Multia
senkrecht in ihrem St?nder stellen, nicht waagerecht
(\`\`Pizzaschachtel''). Es ist eine sehr gute Idee, den L?fter durch ein
leistungsst?rkeres Modell zu ersetzen. Weiterhin k?nnen Sie eines der
Kabel zum Temperatursensor durchscheiden. Danach wird der L?fter mit
voller Drehzahl (und Lautst?rke) betrieben. H?ten Sie sich vor
PCI-Karten, die sehr viel Strom brauchen. Falls Ihr System trotzdem
sterben sollten, k?nnten Ihnen die Multia-Heat-Death Seiten auf der
`Website von NetBSD <http://www.netbsd.org/>`__ bei der Reparatur
weiterhelfen.

Die Intel 82378ZB PCI to ISA Bridge erm?glicht es, eine IDE-Festplatte
zu benutzen. Sie ben?tigen die folgende Zeile in der Konfigurationsdatei
Ihres angepa?ten Kernels:

.. code:: PROGRAMLISTING

    device ata0 at isa? port IO_WD1 irq 14

Der IDE-Anschlu? ist f?r die 2.5" Laptop-Festplatten ausgelegt. Eine
3.5" IDE-Festplatte pa?t nicht in das Geh?use, solange Sie nicht den
PCI-Steckplatz opfern. Leider kann die SRM Konsole nicht von einer
IDE-Platte booten. Sie ben?tigen also eine SCSI-Platte als Bootdevice.

Falls Sie die interne Festplatte auswechseln m?ssen: Das interne Kabel
vom PCI Riser Board zur *2.5"* Festplatte ist schmaler als ein normales
SCSI-Flachbandkabel. Andernfalls w?rde es nicht auf die 2.5" Festplatte
passen. Allerdings gibt es auch riser cards mit einem Anschlu? f?r ein
normales SCSI-Kabel, das auf eine normale SCSI-Platte pa?t.

Allerdings sollten Sie vor dem Einbau einer weiteren Festplatte absehen.
Benutzen Sie den externen SCSI-Anschlu? und bauen Sie die Festplatte in
ein externes Geh?use ein. Die Temperatur in der Multia ist schon hoch
genug. In den meisten F?llen hat Ihre Multia einen 50 poligen
High-Density Anschlu?, allerdings gab es auch Varianten der Multia, die
keine Festplatte hatten und evtl. auch ?ber keinen externen
SCSI-Anschlu? verf?gen. Achten Sie beim Kauf darauf.

Die Konfigurationsdatei f?r den Kernel einer Multia mu? die folgenden
Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_AXPPCI_33
    cpu     EV4

Wichtige Informationen zur Multia finden Sie unter
http://www.netbsd.org/Ports/alpha/multiafaq.html und
http://www.brouhaha.com/~eric/computers/udb.html.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.3. Personal Workstation (\`\`Miata'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die Miata ist einem kleinen Towergeh?use untergebracht, da? unter dem
Schreibtisch verschwinden kann. Es gibt diverse Varianten der Multia.
Die erste Miata war das Modell MX5. Da die Hardware dieser Maschinen
eine Reihe von Designschw?chen zeigte, wurde die Maschine ?berarbeitet,
das Ergebnis war die MiataGL. Leider kann man die beiden Varianten nicht
durch einen einfachen Blick auf das Geh?use unterscheiden. Die
einfachste Methode ist ein Blick auf die R?ckseite des Geh?uses. Wenn
sich dort zwei USB-Anschl?sse befinden, handelt es sich um eine MiataGL.
Auf dem Markt ist jedoch ?berwiegend die MX5 zu finden.

Der offizielle Systemname lautet \`\`Personal Workstation 433a''. Der
Begriff Personal Workstation ist etwas unhandlich und wird daher meist
als PWS abgek?rzt. Der Name besagt, da? die Maschine eine 433 MHz-CPU
hat und f?r den Betrieb unter WinNT Workstation vorgesehen war
(erkenntlich am anschlie?enden a). Die f?r den Betrieb mit Tru64 Unix
oder OpenVMS gedachten Systeme tragen Bezeichnungen wie \`\`433au''.
WinNT-Miatas enthalten in der Regel ab Werk ein IDE CDROM-Laufwerk.
Verallgemeinert gesehen, folgen die Systemnamen dem Schema
PWS[433,500,600]a[u].

Au?erdem gab es auch eine Variante, bei der die CPU mit einem speziellen
System von Kyrotech gek?hlt wurde; diese Maschinen besitzen ein etwas
anderes Geh?use.

Eigenschaften:

-  21164A EV56 Alpha CPU mit 433, 500 oder 600 MHz

-  21174 Core Logic (\`\`Pyxis'') Chipsatz

-  on-board Bcache / L3 cache: 0, 2 oder 4 MByte (benutzt ein Cache
   Modul)

-  Speicher:

   -  Busbreite: 128 Bits, ECC

   -  ungepufferte 72 Bit breite SDRAM DIMMs, m?ssen paarweise
      installiert werden

   -  6 DIMM Sockel

   -  Maximaler Speicherausbau: 1.5 GBytes

-  on-board Fast Ethernet:

   -  Die MX5 benutzt je nach Version der PCI Riser Card einen 21142
      oder 21143 Ethernet Chip

   -  Die MiataGL benutzt den 21143 Chip

   -  der Anschlu? ist entweder 10/100 MBit UTP, oder 10 MBit UTP/BNC

-  2 on-board [E]IDE Kan?le, basierend auf dem CMD646 (MX5) oder dem
   Cypress 82C693 (MiataGL)

-  1 Ultra-Wide SCSI Qlogic 1040 [nur MiataGL]

-  2 64-Bit PCI Steckpl?tze

-  3 32-Bit PCI Steckpl?tze (hinter einer DEC PCI-PCI Bridge)

-  3 ISA Steckpl?tze (teilen sich den Platz mit den 32 Bit PCI
   Steckpl?tzen, angeschlossen ?ber eine Intel 82378IB PCI to ISA
   Bridge)

-  2 serielle Anschl?sse mit 16550A

-  1 paralleler Anschlu?

-  PS/2 Anschlu? f?r Tastatur und Maus

-  USB Anschlu? [nur MiataGL]

-  eingebauter ESS1888 Soundchip

Die Elektronik der Miata ist auf zwei Platinen untergebracht. Das untere
Board befindet sich auf dem Geh?useboden und tr?gt die PCI- und
ISA-Steckpl?tze, den Soundchip, und ?hnliches. Die obere Platine tr?gt
die CPU, den Pyxis Chip, den Speicher, usw. Beachten Sie, da? die MX5
und die MiataGL zwei verschiedene PCI Riser Boards verwenden. Sie k?nnen
also nicht einfach eine Platine mit einer MiataGL CPU einsetzen, sondern
Sie ben?tigen das passende riser board. Angeblich kann man den Riser aus
einer MX5 mit der CPU-Platine der MiataGL benutzen, diese Konfiguration
ist aber ungetestet und wird nicht unterst?tzt. Alle anderen Teile der
Systeme (Geh?use, Kabel, etc.) sind bei der MX5 und der MiataGL
identisch.

Die MX5 hat Probleme mit DMA-Transfers von und zu den beiden 64-Bit PCI
Steckpl?tzen, wenn dieser DMA die Grenze einer Speicherseite
?berschreitet. Da der PCI-PCI Bridge Chip diese Transfers nicht erlaubt,
sind die 32 Bit Steckpl?tze davon nicht betroffen. Befindet sich in
einem der 64 Bit Steckpl?tzen eine dem SRM unbekannte Karte, startet das
System nicht. Nur Karten, von denen der SRM wei?, da? sie funktionieren
(\`\`known good''), k?nnen in den 64 Bit Steckpl?tzen genutzt werden.

Wenn Sie den SRM ?berlisten wollen, k?nnen Sie an der
Eingabeaufforderung set pci\_device\_override eingeben. Wenn Ihre Daten
danach mysteri?se Fehler aufweisen, d?rfen Sie sich allerdings nicht
beschweren.

Der vollst?ndige Befehl lautet:

.. code:: SCREEN

    >>> SET PCI_DEVICE_OVERRIDE <vendor_id><device_id>

Zum Beispiel:

.. code:: SCREEN

    >>> SET PCI_DEVICE_OVERRIDE 88c15333

Der radikalste Ansatz ist:

.. code:: SCREEN

    >>> SET PCI_DEVICE_OVERRIDE -1

Damit wird die ?berpr?fung der PCI ID komplett abgeschaltet und Sie
k?nnen jede beliebige PCI-Karte installieren, ohne da? deren PCI ID
gepr?ft wird. Damit dies funktioniert, brauchen Sie allerdings eine
halbwegs aktuelle Version des SRM.

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Sie handeln auf eigenes Risiko..

.. raw:: html

   </div>

Der Kernel von FreeBSD meldet Ihnen, wenn er den fehlerhaften Chip von
Pyxis findet:

.. code:: SCREEN

    Sep 16 18:39:43 miata /kernel: cia0: Pyxis, pass 1
    Sep 16 18:39:43 miata /kernel: cia0: extended capabilities: 1<BWEN>
    Sep 16 18:39:43 miata /kernel: cia0: WARNING: Pyxis pass 1 DMA bug; no bets...

Bei einer MiataGL erscheint:

.. code:: SCREEN

    Jan  3 12:22:32 miata /kernel: cia0: Pyxis, pass 1
    Jan  3 12:22:32 miata /kernel: cia0: extended capabilities: 1<BWEN>
    Jan  3 12:22:32 miata /kernel: pcib0: <2117x PCI host bus adapter> on cia0

Die MiataGL hat die DMA Probleme der MX5 nicht. PCI Karten, die der SRM
der XM5 moniert, wenn Sie im 64 Bit Steckplatz installiert werden,
werden kommentarlos vom SRM der MiataGL akzeptiert.

Die neueren Versionen des Mainboards f?r die MX5 enthalten eine
Hardware-Korrektur f?r den Fehler. Der SRM hat keine Informationen ?ber
das ECO und wird sich auch weiterhin ?ber unbekannte Karten beschweren.
Der FreeBSD Kernel hat ?brigens das gleiche Problem.

Der Miata SRM kann vom IDE CDROM booten. Sowohl die Miata GL als auch
die MX5 k?nnen von der IDE Festplatte booten, Sie k?nnen also das
gesamte FreeBSD-Dateisystem dort ablegen. Die Geschwindigkeit der
Festplatte in einer MX5 liegt bei ungef?hr 14 MByte/sec (wenn die
Festplatte schnell genug ist). Der CMD646 Chip der Miata unterst?tzt
maximal WDMA2, der UDMA-Modus ist zu fehlerhaft.

Die Miata MX5 verwendet im Allgemeinen einen auf dem Qlogic 1040
basierenden SCSI Kontroller. Der SRM kann davon booten. Bitte beachten
Sie, da? Sie von einem Adaptec-Kontroller *nicht* booten k?nnen.

Der PCI-PCI Bridge Chip auf der Riser Card der MiataGL ist schneller als
der Chip auf der Riser Card der MX5. Einige Riser Cards f?r die MX5
haben sogar den *gleichen* Chip wie die MiataGL. Es gibt also jede Menge
Abwechslung.

Nicht alle VGA-Karten funktionieren hinter der PCI-PCI Bridge. Das
typische Symptom ist ein fehlendes Bild. Um dieses Problem zu beheben,
sollten Sie die Karten einfach \`\`vor'' die Bridge setzen, also in
einen der 64 Bit PCI Steckpl?tze.

Sowohl die MX5 als auch die MiataGL haben einen Soundchip vom Type
ESS1888 on-board. Er emuliert einen SoundBlaster und wird unterst?tzt,
wenn Sie die folgende Zeile in der Konfigurationsdatei Ihres angepa?ten
Kernels haben:

.. code:: PROGRAMLISTING

    device    pcm0
    device  sbc0

Falls in Ihrer Miata eines der optionalen Cache Module steckt, sollten
Sie sicherstellen, da? es fest eingesteckt ist. Ein lockeres Modul f?hrt
zu seltsam erscheinenden Abst?rzen (nicht verwunderlich, aber kommen Sie
erst einmal darauf, wenn Sie einen mysteri?sen Fehler suchen). Die Cache
Module der MX5 und MiataGL sind identisch.

Wenn Sie das 2 MByte Cache Modul installieren, wird Ihr System zwar rund
10-15% schneller (wenn man die Zeit f?r ein buildworld mi?t).
Gleichzeitig *sinkt* aber die Bandbreite bei Lesezugriffen auf die 64
Bit PCI Karten via PCI DMA. Bei einem Test mit einer 64 Bit Karte von
Myrinet sank die Geschwindigkeit von 149 MByte/sec auf 115 MByte/sec.
Sie sollten diese Tatsache im Hinterkopf behalten, wenn Sie f?r Ihr
Einsatzgebiet extrem schnelle 64 Bit PCI Karten ben?tigen.

Der Wechsel zu einer schnelleren CPU ist einfach, wechseln Sie die CPU,
und stellen an dem DIP-Schalter f?r den Takt-Multiplikator die
Geschwindigkeit der neuen CPU ein.

Wenn Sie FreeBSD beenden und danach die folgende Fehlermeldung erhalten

.. code:: SCREEN

    ERROR: scancode 0xa3 not supported on PCXAL

sollten Sie die SRM Firmware auf V7.2-1 (oder neuer) aktualisieren.
Diese Version erschien zuerst auf der \`\`Firmware Update CD V5.7'', ist
aber auch auf http://www.compaq.com/ erh?ltlich. Damit wird dieser
Fehler des SRM sowohl bei der Miata MX5 als auch bei der Miata GL
behoben.

USB wird ab FreeBSD 4.1 unterst?tzt.

Bevor Sie das Geh?use ?ffnen, m?ssen Sie auf jeden Fall den Netzstecker
ziehen. Einige Komponenten werden mit Strom versorgt, *obwohl* der
Netzschalter auf aus steht.

Die Konfigurationsdatei f?r den Kernel einer Miata mu? die folgenden
Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_ST550
    cpu     EV5

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.4. DEC3000 Familie (die \`\`Bird'' Maschinen)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die DEC3000 Familie geh?rt zur ersten Generation der Alpha Maschinen.
Sie basieren auf einem TurboChannel (TC) genannten I/O System und sind
gebaut wie ein Panzerschrank (heben Sie sich keinen Bruch).

Die DEC3000 Familie kann in zwei Gruppen unterteilt werden: Die
DEC3000/500 Systeme und die DEC3000/300 Systeme. Die DEC3000/500 Systeme
sind die ?lteren leistungsstarken Server und Workstations der Alpha
Familie. Server verwenden serielle Konsolen, Workstations haben
Bildschirme. Die DEC3000/300 Systeme sind die preiswerten Workstations.

Die DEC3000/500 Systeme sind wegen dem guten Design des Hauptspeichers
extrem schnell (wenn man beachtet, wie alt diese Maschine sind). Die
DEC3000/300 verhalten sich diesbez?glich deutlich schlechter. Die
Bandbreite ihres Speichers ist wesentlich kleiner.

Der Name der Familie \`\`Birds'' entstand, weil die DEC-internen
Bezeichnungen der Maschinen aus der Vogelwelt stammen:

.. raw:: html

   <div class="INFORMALTABLE">

+-----------------+------------------+--------------------------------------------+
| DEC3000/400     | Sandpiper        | 133 MHz CPU, Desktop                       |
+-----------------+------------------+--------------------------------------------+
| DEC3000/500     | Flamingo         | 150 MHz CPU, Tower                         |
+-----------------+------------------+--------------------------------------------+
| DEC3000/500X    | Hot Pink         | 200 MHz CPU, Tower                         |
+-----------------+------------------+--------------------------------------------+
| DEC3000/600     | Sandpiper+       | 175 MHz CPU, Desktop                       |
+-----------------+------------------+--------------------------------------------+
| DEC3000/700     | Sandpiper45      | 225 MHz CPU, Tower                         |
+-----------------+------------------+--------------------------------------------+
| DEC3000/800     | Flamingo Ultra   | 200 MHz CPU, Tower                         |
+-----------------+------------------+--------------------------------------------+
| DEC3000/900     | Flamingo45       | 275 MHz CPU, Tower                         |
+-----------------+------------------+--------------------------------------------+
| DEC3000/300     | Pelican          | 150 MHz CPU, Desktop, 2 TC Steckpl?tze     |
+-----------------+------------------+--------------------------------------------+
| DEC3000/300X    | Pelican+         | 175 MHz CPU, Desktop, 2 TC Steckpl?tze     |
+-----------------+------------------+--------------------------------------------+
| DEC3000/300LX   | Pelican+         | 125 MHz CPU, Desktop, 2 TC Steckpl?tze     |
+-----------------+------------------+--------------------------------------------+
| DEC3000/300L    |                  | 100 MHz CPU, Desktop, kein TC Steckplatz   |
+-----------------+------------------+--------------------------------------------+

.. raw:: html

   </div>

Eigenschaften:

-  21064 CPU (100 bis 200 MHz) oder 21064A CPU (225 bis 275 MHz)

-  Speicher der DEC3000/500 Systeme:

   -  Busbreite: 256 Bit, ECC

   -  spezielle 100polige SIMMs

   -  Installiert in Gruppe zu 8 Modulen

-  Speicher der DEC3000/300 Systeme:

   -  Busbreite: 64 Bit, ECC

   -  PS/2 FPM SIMMS, 72polig, 36 Bit, 70ns oder schneller

   -  paarweise Installation

-  Bcache / L2 Cache: von 512 KByte bis zu 2 MByte

-  10MBit Ethernet auf Basis eines Lance 7990 Chip, AUI und UTP

-  einen oder zwei SCSI Kan?le auf Basis eines NCR53C94 oder NCR53CF94-2

-  2 serielle Anschl?sse auf Basis eines Zilog 8530 (einer kann f?r eine
   serielle Konsole genutzt werden)

-  eingebauter ISDN Anschlu?

-  eingebauter 8 Bit Sound

-  8 Bit Grafik, entweder auf einer TC oder eingebaut (je nach Modell)

Zur Zeit k?nnen DEC3000 Systeme unter FreeBSD nur ohne Festplatten
genutzt werden. Der Grund ist, das die SCSI-Treiber f?r die TC SCSI
Controller nicht im CAM enthalten sind, welches von den neuesten FreeBSD
Versionen genutzt wird. Es gibt zwar TC Karten mit einem (PMAZ-A) oder
zwei (PMAZC-AA) Fast SCSI Kan?len, jedoch werden diese Karten auch nicht
von FreeBSD unterst?tzt.

Die DEC3000/300 benutzt einen eingebauten SCSI Kanal mit einer
Geschwindigkeit von bis zu 5 MByte/sec. Dieser wird sowohl f?r interne
als auch f?r externe Ger?te genutzt. Die DEC3000/500 besitzt zwei
Kan?le, von denen einer f?r interne und einer f?r externe Ger?te
reserviert ist.

Die Diskettenlaufwerke in den DEC3000 sind ?ber eine Adapterkarte am
SCSI Bus angeschlossen. Dadurch ist es m?glich, von ihnen wie von einer
Festplatte zu booten und dabei die gleichen Ger?tenamen zu verwenden:

.. code:: SCREEN

    >>> BOOT DKA300

Der TurboChannel der 3000/300 Systeme ist nur halb so schnell wie der
TurboChannel der anderen 3000 Maschinen. Einige TC Erweiterungskarten
haben mit dem langsameren TurboChannel Probleme. Caveat emptor.

Der eingebaute ISDN-Anschlu? wird von FreeBSD nicht unterst?tzt.

Die DEC3000/300 Systeme benutzen normale 72 polige, 36 Bit Fast Page
Mode SIMMs. EDO SIMMs und SIMMS mit nur 32 Bit oder 33 Bit funktionieren
in den Pelicans nicht. Damit ein SIMM mit 32 MByte in einem DEC3000/300
System funktioniert, mu? die Belegung der Presence Detect
Bits/Anschl?sse des SIMMs mit dem ?bereinstimmen, was die Maschine
erwartet. Wenn das nicht der Fall ist, wird das SIMM als 8 MByte SIMM
\`\`erkannt''. Sie k?nnen SIMMs mit 8 MByte und 32 MByte mischen,
allerdings m?ssen die SIMMs eines Paares identisch sein.

Falls Sie auf Idee kommen sollten, Ihre 32 MByte SIMMs mit
falschen/fehlenden Presence Bits korrigieren zu wollen, sollten Ihnen
die folgenden Informationen weiterhelfen:

Ein PS/2 SIMM hat vier Presence Detection Bits. Zwei davon definieren
die Zugriffszeit, die anderen beiden die Gr??e des Speichermoduls.

An einer Seite des SIMM befinden sich zwei Reihen mit je vier
L?tfl?chen. Eine der Reihe ist mit Vss (Masse) verbunden, die andere mit
den Anschl?ssen 67 (PRD1), 68 (PRD2), 69 (PRD3), 70 (PRD4).

Wenn Sie zwei Fl?chen mit einem kleinen Widerstand oder etwas L?tzinn
verbinden, legen Sie den dazugeh?rigen Anschlu? auf Masse.

.. raw:: html

   <div class="INFORMALTABLE">

+--------+--------+-------------------+
| PRD1   | PRD2   | Speichergr??e     |
+========+========+===================+
| GND    | GND    | 4 oder 64 MByte   |
+--------+--------+-------------------+
| Open   | GND    | 2 oder 32 MByte   |
+--------+--------+-------------------+
| GND    | Open   | 1 oder 16 MByte   |
+--------+--------+-------------------+
| Open   | Open   | 8 MByte           |
+--------+--------+-------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="INFORMALTABLE">

+--------+--------+---------------------------+
| PRD3   | PRD4   | Zugriffsgeschwindigkeit   |
+========+========+===========================+
| GND    | GND    | 50 oder 100 nsec          |
+--------+--------+---------------------------+
| Open   | GND    | 80 nsec                   |
+--------+--------+---------------------------+
| GND    | Open   | 70 nsec                   |
+--------+--------+---------------------------+
| Open   | Open   | 60 nsec                   |
+--------+--------+---------------------------+

.. raw:: html

   </div>

In DEC3000/500 Systemen k?nnen 100polige SIMMs mit 2, 4, 8, 16 oder 32
MByte benutzt werden. Die maximale Gr??e des Speichers ist von Modell zu
Modell verschieden, um z.B. bei Desktop-Systemen ein kleineres Geh?use
zu erm?glichen, wurden Steckpl?tze f?r den Speicher eingespart. Wenn Sie
?ber gen?gend viele Steckpl?tze und SIMMs verf?gen, k?nnen Sie das
Maximum von 512 MByte erreichen. Hier liegt einer der Hauptunterschiede
zwischen den Tower- und Desktop-Varianten, letztere haben deutlich
weniger Steckpl?tze f?r SIMMs.

Die Audio-Hardware der Birds wird nicht unterst?tzt.

Die TC Maschinen werden von X-Windows nicht unterst?tzt. Die DEC3000/300
Maschinen brauchen eine serielle Konsole. Die DEC3000/500 Maschinen
k?nnten mit einer graphischen Konsole funktionieren. Der Autor (Wilko
Bulte ``<wilko@FreeBSD.org>``) betrieb seine Maschine mit einer
seriellen Konsole und kann daher keine Aussage dazu machen.

Birds kann man bei Ausverk?ufen erwerben. Da sie keine PCI Steckpl?tzen
besitzen, werden Sie nicht mehr aktiv unterst?tzt. Mittlerweile sind TC
Erweiterungskarten nur sehr schwer zu finden und die Unterst?tzung f?r
diese Karten ist eher schlecht, wenn Sie den Treiber nicht selbst
schreiben und testen. Unterlagen f?r Entwickler ?ber TC Karten sind
ebenfalls rar. Wir raten, eine Bird nur dann zu verwenden, wenn Sie sie
sehr g?nstig erwerben k?nnen und Sie bereit sind, sehr viel Zeit in die
Entwicklung der notwendigen Software zu investieren.

In der Konfigurationsdatei des Kernels eines DEC3000/[4-9]00 Systems
m?ssen die folgenden Zeilen stehen:

.. code:: PROGRAMLISTING

    options   DEC_3000_500
    cpu     EV4

In der Konfigurationsdatei f?r den Kernel eines DEC3000/300
(\`\`Pelican'') Systems m?ssen die folgenden Zeilen stehen:

.. code:: PROGRAMLISTING

    options   DEC_3000_300
    cpu     EV4

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.5. Evaluation Board 64 Systeme
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Im Rahmen der Bem?hungen, die Alpha CPU popul?rer zu machen, wurden von
DEC eine ganze Reihe sogenannter Evaluation Boards herausgegeben. Zu
diesen Systemen geh?ren EB64, EB64+, und das AlphaPC64
(\`\`Cabriolet''). Ein weiteres Mitglied dieser Familie ist das nicht
von DEC stammende Aspen Alpine. Die zur EB64 Familie geh?renden
Evaluation Boards weisen folgende Eigenschaften auf:

-  21064 oder 21064A CPU, 150 bis 275 MHz

-  Speicher:

   -  Busbreite: 128 Bit

   -  PS/2 Fast Page Mode SIMM, 72polig, 33 Bit

   -  70ns oder schneller

   -  Mu? in Vierergruppen installiert werden

   -  8 Steckpl?tze f?r SIMMs

   -  benutzt Parit?t

-  Bcache / L2 cache: 0 KByte, 512 KByte, 1 MByte oder 2 MByte

-  21072 (\`\`APECS'') Chipsatz

-  Intel 82378ZB PCI to ISA Bridge Chip (\`\`Saturn'')

-  zwei serielle Anschl?sse, 16550A

-  ein paralleler Anschlu?

-  Symbios 53C810 Fast-SCSI (nicht beim Alpha PC64)

-  IDE Anschlu? (nur Alpha PC64)

-  10 MBit Ethernet eingebaut (nicht beim Alpha PC64)

-  2 PCI Steckpl?tze (vier beim Alpha PC64)

-  3 ISA Steckpl?tze

Das Aspen Alpine unterscheidet sich zwar geringf?gig vom EB64+, ist aber
?hnlich genug, um mit dem SRM EPROM eines EB64+ betrieben werden zu
k?nnen. Das Aspen Alpine hat keinen Ethernet-Anschlu?, daf?r aber 3
statt 2 PCI Steckpl?tzen. Weiterhin verf?gt es ?ber 2 MByte Cache
Speicher, der fest eingel?tet ist sowie Jumper zur Auswahl der
SIMM-Geschwindigkeit (60 ns, 70 ns, 80 ns).

Sie k?nnen auch SIMMs mit 36 Bit einsetzen, in diesem Fall bleiben 3 Bit
ungenutzt. Beachten Sie, da? die Systeme Fast Page Mode Speicher
ben?tigen, und nicht EDO Speicher.

Das Programm f?r die SRM Konsole des EB64+ steckt in einem mit UV-Licht
l?schbaren EPROM, einfache Updates via Flash sind bei der EB64+ also
nicht m?glich. Aber die aktuellste Version des SRM f?r die EB64+ ist
ohnehin stark veraltet.

Der SRM der EB64+ kann sowohl vom 53C810 als auch vom Qlogic1040 SCSI
Kontroller booten. Leider gibt es hinsichtlich der Verwendung von Ultra
SCSI Ger?ten ein Probleme mit dem Qlogic. Die Firmware, welche von der
SRM auf den Qlogic geladen wird, ist sehr alt. Da es keine Updates f?r
den SRM des EB64+ gibt, l??t sich dies auch nicht ?ndern. Man kann zwar
eine neuere Version der Qlogic Firmware in den FreeBSD Kernel einbinden,
da es den Kernel aber um mehrere hundert KByte aufbl?ht, ist dies
un?blich. Erst ab FreeBSD 4.1 ist die Firmware in einem nachladbaren
Modul enthalten. Das alles kann dazu f?hren, da? Sie einen anderen
Kontroller als den Qlogic f?r ihr Bootdevice benutzen m?ssen.

Die AlphaPC64 Systeme werden normalerweise mit der Firmware f?r die ARC
Konsole ausgeliefert. Die Software f?r die SRM Konsole kann von Diskette
in das Flash ROM geladen werden.

Die SRM Konsole kann nicht vom IDE Anschlu? des AlphaPC64 booten.

Denken Sie daran, da? Sie ein Netzteil brauchen, das 3.3 Volts
bereitstellt (f?r die CPU).

Die Konfigurationsdatei f?r den Kernel mu? f?r Maschinen mit EB64+ die
folgenden Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_EB64PLUS
    cpu     EV4

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.6. Evaluation Board 164 (\`\`EB164, PC164, PC164LX, PC164SX'') Familien
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Das EB164 ist eine neuere Version des evaluation board und verwendet
eine 21164A CPU. Diese Version dient als Grundlage diverser Varianten,
die zum Teil von OEM Herstellern genutzt werden. Samsung entwickelte
eine eigene Variante mit dem Namen PC164LX, die nur ?ber 32 Bit PCI
Steckpl?tze verf?gt, w?hrend das Original von Digital 64 Bit PCI bietet.

-  21164A, verschiedene Geschwindigkeiten [EB164, PC164, PC164LX]

-  21164PC [nur auf dem PC164SX]

-  21174 (Alcor) Chipsatz

-  Bcache / L3 cache: das EB164 benutzt spezielle cache-SIMMs

-  Speicherbandbreite: 128 Bit / 256 Bit

-  Speicher:

   -  PS/2 SIMMs, in Gruppen zu 4 oder 8 Modulen

   -  36 Bit, Fast Page Mode, ECC, [EB164 / PC164]

   -  Paare aus SDRAM DIMMs, ECC [PC164SX / PC164LX]

-  2 serielle Anschl?sse, 16550A

-  PS/2 Tastatur und Maus

-  Kontroller f?r Diskettenlaufwerk

-  paralleler Anschlu?

-  32 Bit PCI

-  64 Bit PCI [nur in einigen Modellen]

-  ISA slots hinter einem Intel 82378ZB PCI to ISA Bridge Chip

Die Benutzung von 8 SIMMs, um einen 256 Bit breiten Speicher zu
erhalten, resultiert in interessanten Geschwindigkeitsvorteilen
gegen?ber einem 4 SIMM/128 Bit breiten Speicher. Nat?rlich m?ssen alle 8
SIMMs vom gleichen Typ sein, damit dies funktioniert; au?erdem mu? das
System explizit auf die Nutzung des 8 SIMM Modus konfiguriert werden.
Sie m?ssen 8 SIMMs benutzen, 4 SIMMs auf 2 B?nke verteilt funktioniert
nicht. Bei der PC164 kann mit 8 128 MByte SIMMs ein maximaler
Speicherausbau von 1 GByte erreicht werden. Das Handbuch behauptet, der
maximale Speicherausbau betrage 512 MByte.

Der SRM kann von Qlogic 10xx Karten oder dem Symbios 53C810[A] booten.
Neuere Versionen des Symbios 810 wie der Symbios 810AE werden vom SRM
des PC164 nicht erkannt. Der SRM der PC164 unterst?tzt Hostadapter auf
Basis des Symbios 53C895 scheinbar auch nicht (getestet mit einem Tekram
DC-390U2W). Allerdings gibt es Berichte, wonach No-Name Symbios 53C985
Karten funktionieren sollen. Karten wie der Tekram DC-390F (basiert auf
dem Symbios875) funktionieren offenbar auf der PC164, allerdings scheint
es hier leider subtile Abh?ngigkeiten von der jeweiligen Revision des
Chips und des Mainboards zu geben.

Von mit dem Symbios 53C825[a] best?ckten Karten kann ebenfalls gebootet
werden. Der Diamond FirePort baut zwar ebenfalls auf Chips von Symbios
auf, hingegen kann der SRM des PC164SX davon nicht booten. Es gibt
Berichte, da? die PC164SX problemlos von Karten mit Symbios825,
Symbios875, Symbios895 und Symbios876 booten kann. Es gibt ebenfalls
Erfolgsmeldungen f?r Adaptec 2940U und 2940UW (verifiziert mit SRM
V5.7-1). Adaptec 2930U2 und 2940U2[W] funktionieren nicht.

Der SRM der 164LX und 164SX kann ab der Firmware Version 5.8 von
Hostadaptern der Adaptec 2940-Familie booten.

Kurz zusammengefa?t: Die Maschinen dieser Modellreihe sind in Punkto
Kompatibilit?t der SCSI-Kontroller eine echte Herausforderung.

Die 164SX unterst?tzt maximal 1 GByte RAM. Es gibt Berichte, da? eine
Best?ckung mit vier normalen 256MB PC133 ECC DIMMs problemlos
funktioniert. Zur Zeit ist nicht bekannt, ob auch 512MB DIMMs genutzt
werden k?nnen.

Die 164SX hat Probleme mit einigen PCI Bridge Chips, was zu SRM Fehlern
und Kernel Panics f?hren kann. Dies scheint davon abzuh?ngen, ob die SRM
Konsole den Chip unterst?tzt und korrekt initialisieren kann. Das
eingebaute IDE Interface der 164SX ist sehr langsam, durch die
Verwendung einer Karte von Promise kann man die Geschwindigkeit um den
Faktor 3-4 erh?hen.

Der SRM der PC164 scheint ab und zu seine Einstellungen zu vergessen. Um
ohne den Verlust von Einstellungen auszukommen, soll man, aktuellen
Annahmen nach, erst auf SRM 4.x downgraden und dann auf 5.x upgraden.
Ein Fehler welcher z.B. auffiel war:

.. code:: SCREEN

    ERROR: ISA table corrupt!

Nach einem Downgrade auf SRM4.9, einem

.. code:: SCREEN

    >>> ISACFG -INIT

gefolgt von einem

.. code:: SCREEN

    >>> INIT

war das Problem gel?st. Einige der Besitzer der PC164 berichteten, da?
dieses Problem noch nie auftrat.

Beim PC164SX gibt es im AlphaBIOS eine Einstellung, da? beim n?chsten
Einschalten des Systems die SRM Konsole genutzt werden soll. Leider
scheint diese Einstellung ohne Wirkung zu bleiben. Mit anderen Worten,
es wird immer das AlphaBIOS gebootet. Unabh?ngig von dem was Sie
einstellen. Des Problems L?sung ist, das ROM der Konsole mit dem SRM
Code f?r die PC164SX zu ?berschreiben. Dadurch wird das AlphaBIOS
?berschrieben und Sie erhalten die gew?nschte SRM Konsole. Der SRM Code
ist auf der Webseite von Compaq verf?gbar.

Bei der 164LX kann nur die SRM Konsole oder das AlphaBIOS verwendet
werden, da das Flash ROM zu klein ist, um beide zur gleichen Zeit
aufzunehmen.

Die PC164 kann von einer IDE Festplatte booten, wenn der SRM aktuell
genug ist.

Das EB164 ben?tigt ein Netzteil, da? 3.3 Volt zur Verf?gung stellt. Bei
der PC164 fehlt allerdings das von ATX Netzteilen zum Einschalten
ben?tigte PS\_ON Signal. Ein kleiner Schalter, der dieses Signal mit
Masse verbindet, erlaubt Ihnen die Benutzung eines normalen ATX
Netzteils.

Die Konfigurationsdatei eines angepa?ten Kernels f?r Maschinen auf
Grundlage des EB164 mu? die folgenden Zeilen enthalten:

.. code:: PROGRAMLISTING

    options         DEC_EB164
    cpu             EV5

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.7. AlphaStation 200 (\`\`Mustang'') und 400 (\`\`Avanti'') Familien
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die Digital AlphaStation 200 und 400 Systeme sind fr?he,
leistungsschwache, PCI-basierte Workstations. Die Modellreihen 200 und
250 sind Desktops, die 400er sind Mini-Tower.

Eigenschaften:

-  21064 oder 21064A CPU, Geschwindigkeit 166 bis 333 MHz

-  DECchip 21071-AA core logic Chipsatz

-  Bcache / L2 cache: 512 Kbytes (Modelle 200 und 400) oder 2048 KByte
   (Modell 250)

-  Speicher:

   -  Busbreite 64 Bit

   -  8 bis 384 MByte RAM

   -  Fast Page DRAM, Zugriffszeit maximal 70 ns

   -  in drei Paaren (Modelle 200 und 400)

   -  in zwei Viergruppen (Modell 250)

   -  das Speichersystem verwendet Parit?t

-  PS/2 Tastatur und Maus

-  zwei serielle Anschl?sse, 16550

-  ein paralleler Anschlu?

-  Anschlu? f?r ein Diskettenlaufwerk

-  32 Bit PCI Steckpl?tze (3 beim Modell AS400, 2 bei den Modellen AS200
   und 250)

-  ISA Steckpl?tze (4 beim Modell AS400-series, 2 bei den Modellen AS200
   und 250, einige der ISA und PCI Steckpl?tze ?berlappen physikalisch)

-  eingebauter Ethernet-Anschlu? auf Grundlage eines 21040 (Modelle 200
   und 250)

-  eingebauter Symbios 53c810 Fast SCSI-2 Chip

-  Intel 82378IB (\`\`Saturn'') PCI-ISA Bridge Chip

-  entweder eingebaute TGA oder PCI VGA Grafik (Modellabh?ngig)

-  16 Bit Audio (Modelle 200 und 250)

Die Systeme benutzen SIMMs mit Parit?t, es brauchen allerdings keine 36
Bit breiten SIMMs zu sein. 33 Bit breite SIMMs reichen aus, 36 Bit
breite werden aber auch akzeptiert. EDO oder 32 Bit breite SIMMs
funktionieren nicht. Die Systeme unterst?tzen Speichermodule mit 4, 8,
16, 32 und 64 MByte.

Die Audio-Hardware der AS200 und AS250 soll funktionieren, wenn man die
folgende Zeile in die Konfigurationsdatei f?r den angepa?ten Kernel
einf?gt:

.. code:: PROGRAMLISTING

    device pcm0 at isa? port 0x530 irq 9 drq 0 flags 0x10011

Die Modelle AlphaStation 200 und 250 verf?gen ?ber einen automatischen
SCSI-Terminator. Sobald Sie Kabel an den externen SCSI-Anschlu?
anstecken, wird der interne Terminator deaktiviert. Das bedeutet
nat?rlich, da? Sie keine nicht terminierten Kabel an die Maschine
anschlie?en d?rfen.

Bei der AlphaStation 400 wird der Terminator ?ber den SRM gesteuert.
Falls Sie externe SCSI-Ger?te verwenden, m?ssen Sie den folgenden Befehl
eingeben:

.. code:: SCREEN

    >>> SET CONTROL_SCSI_TERM EXTERNAL.

Falls nur interne Ger?te vorhanden sind:

.. code:: SCREEN

    >>> SET CONTROL_SCSI_TERM INTERNAL

Die Konfigurationsdatei des Kernels einer AlphaStation-[24][05]00 mu?
die folgenden Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_2100_A50
    cpu     EV4

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.8. AlphaStation 500 und 600 (\`\`Alcor'' und \`\`Maverick'' f?r EV5, \`\`Bret'' f?r EV56)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die AS500 und 600 waren Hochleistungs-Workstations mit einer EV5 CPU,
und PCI Steckpl?tzen. Inzwischen haben die EV6 Maschinen diesen Platz
eingenommen. Die AS500 ist ein Desktop mit dunkelblauen Geh?use (TopGun
blau), die AS600 ein stabiler Tower. Die AS600 verf?gt ?ber ein LCD, mit
dessen Hilfe Sie die ersten Phasen des SRM Starts verfolgen k?nnen.

Eigenschaften:

-  21164 EV5 CPU mit 266, 300, 333, 366, 400, 433, 466, oder 500 MHz
   (AS500) bzw. 266, 300 oder 333 MHz (AS600)

-  21171 oder 21172 (Alcor) core logic Chipsatz

-  Cache:

   -  2 oder 4 Mb L3 / Bcache (AS600, 266 MHz)

   -  4 Mb L3 / Bcache (AS600, 300 MHz)

   -  2 oder 8 Mb L3 / Bcache (8 Mb nur in der 500 MHz Version)

   -  2 to 16 Mb L3 / Bcache (AS600; 3 Steckpl?tze f?r cache-SIMM)

-  Bandbreite des Speichers: 256 Bit

-  Speicher der AS500:

   -  gepufferte Standard-DIMMs, 72 Bit breite

   -  8 DIMM Steckpl?tze

   -  werden in Vierergruppen installiert

   -  maximaler Speicherausbau 1 GB (512 Mb bei der 333 MHz CPU)

   -  nutzt ECC

-  Speicher der AS600:

   -  Standard 36 Bit Fast Page Mode SIMMs

   -  32 SIMM Steckpl?tze

   -  werden in Achtergruppen installiert

   -  maximaler Speicherausbau 1 GB

   -  nutzt ECC

-  Wide SCSI auf Basis des Qlogic 1020 (1 Bus/Chip bei der AS500, 2
   Busse/Chip bei der AS600)

-  Ethernet auf Basis des 21040, Anschl?sse f?r Thinwire und UTP

-  Erweiterungen:

   -  AS500

      -  3 32-Bit PCI Steckpl?tze

      -  1 64-Bit PCI Steckpl?tze

   -  AS600:

      -  2 32-Bit PCI Steckpl?tze

      -  3 64-Bit PCI Steckpl?tze

      -  1 PCI/EISA physisch geteilter Steckplatz

      -  3 EISA Steckpl?tze

      -  1 PCI und 1 EISA Steckplatz sind standardm??ig belegt

-  21050 PCI-to-PCI Bridge

-  Intel 82375EB PCI-EISA Bridge (nur AS600)

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?

-  16 Bit Audio, Windows Sound System, in einem speziellen Steckplatz
   (AS500) bzw. in einem EISA Steckplatz (AS600, dies ist eine ISA
   Karte)

-  PS/2 Tastatur und Maus

Die ersten Maschinen waren mit Fast SCSI Kontrollern ausger?stet,
sp?tere Maschinen unterst?tzen Ultra SCSI. Bei der AS500 wird der eine
zur Verf?gung stehende SCSI-Bus sowohl f?r die internen als auch f?r die
externen Ger?te benutzt. Bei einem Fast SCSI Bus darf der externe Teil
des Busses maximal 1.8 Meter lang sein. Man kann den AS500 Qlogic
ISP1020A Chip auch im Ultra Modus betreiben, wenn man eine SRM Variable
setzt. Allerdings h?lt sich FreeBSD an die Empfehlung aus den Errata zum
Qlogic Chip und beschr?nkt die Busgeschwindigkeit auf Fast.

H?ten Sie sich bei der A500 vor uralten Versionen des SRM. Wenn Ihnen
solche unm?gliche SCSI-Geschwindigkeiten gemeldet werden, ist es Zeit
f?r ein Update:

.. code:: PROGRAMLISTING

    cd0 at isp0 bus 0 target 4 lun 0
    cd0: <DEC RRD45   DEC 0436> Removable CD-ROM SCSI-2 device
    cd0: 250.000MB/s transfers (250.000 MHz, offset 12)

Bei der AS600 versorgt einer der Qlogic SCSI Chips die internen Ger?te,
der andere ist f?r die externen SCSI Ger?te zust?ndig.

Die DIMMs werden bei der AS500 in Viergruppen installiert, allerdings
sind die B?nke ineinander verzahnt (\`\`physically interleaved
layout''). Eine Gruppe von 4 DIMMs besteht also *nicht* aus vier
nebeneinanderliegenden DIMMs.

Bei der AS600 sind die SIMMs auf zwei speziellen Speicherkarten
untergebraucht. Die SIMM m?ssen in Achtergruppen installiert werden und
beide Speicherkarten m?ssen identisch best?ckt werden.

Bitte beachten Sie, da? die AS500 und AS600 EISA Maschinen sind. Sie
m?ssen also das EISA Configuration Utility (ECU) von Diskette starten,
wenn Sie eine EISA-Karte in das System eingebaut haben oder wenn Sie die
Konfiguration der eingebauten I/O ?ndern wollen. Die AS500 hat zwar
keinen EISA Steckplatz, trotzdem wird das ECU verwendet, um die
eingebaute Audio-Hardware und ?hnliches zu konfigurieren.

Sie k?nnen die eingebaute Audio-Hardware der AS500 nutzen, wenn Sie die
folgende Zeile in die Konfigurationsdatei f?r Ihren angepa?ten Kernel
schreiben:

.. code:: PROGRAMLISTING

    device pcm0 at isa? port? irq 10 drq 0 flags 0x10011

Benutzen Sie danach das ECU, um die Audio-Hardware auf IRQ 10, Port
0x530 und DRQ 0 einzustellen. Bitte beachten Sie, da? die Angabe flags
0x10011 zwingend erforderlich ist.

Die PCI Steckpl?tze der AS600 zeigen eine Besonderheit. Die AS600 (um
genau zu sein, die PCI Erweiterungskarte mit den SCSI Kontrollern)
erlaubt die Einblendung von I/O Ports nicht, alle Ger?te hinter dieser
Karte m?ssen memory mapping verwenden. Wenn Sie Probleme haben, die
Qlogic SCSI Adapter zum laufen zu bringen, m?ssen Sie die folgende Zeile
in die Datei ``/boot/loader.rc`` einf?gen:

.. code:: PROGRAMLISTING

    set isp_mem_map=0xff

Eventuell m?ssen Sie diese Zeile schon im Boot Loader eingeben, bevor
Sie den Kernel f?r die Installation laden.

Die Konfigurationsdatei f?r einen angepa?ten Kernel f?r die
AlphaStation-[56]00 mu? die folgenden Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_KN20AA
    cpu     EV5

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.9. AlphaServer 1000 (\`\`Mikasa''), 1000A (\`\`Noritake'') und 800 (\`\`Corelle'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die Systeme der Modellreihen AlphaServer 1000 und 800 sind als Server
f?r Abteilungen konzipiert. Es gibt sie mit einer Reihe verschiedener
Geh?use und CPUs. Ganz allgemein gibt es Maschinen mit der 21064 (EV4)
CPU und Maschinen mit der 21164 (EV5) CPU. Die CPU sitzt auf einer
eigenen Karte, und der m?gliche CPU-Typ (EV4 und EV5) h?ngt vom
verwendetem Mainboard ab.

Beim AlphaServer 800 wurde ein deutlich kleineres Mini-Tower Geh?use
verwendet, ihm fehlt auch das StorageWorks SCSI hot-plug System. Der
Hauptunterschied zwischen der AS1000 und der AS1000A liegt darin, da?
die AS1000A 7 PCI Steckpl?tze hat, w?hrend bei der AS1000 nur 3 PCI
Steckpl?tze zur Verf?gung stehen, und der Rest EISA Steckpl?tze sind.

Die AS800 mit einer EV5/400 MHz CPU wurde sp?ter unter der Bezeichnung
\`\`DIGITAL Server 3300[R]'' verkauft, aus der AS800 mit einer EV5/500
MHz CPU wurde der \`\`DIGITAL Server 3305[R]''.

Eigenschaften:

-  21064 EV4[5] CPU mit 200, 233 oder 266 MHz 21164 EV5[6] CPU mit 300,
   333 oder 400 MHz (nur AS800: 500 MHz)

-  Speicher:

   -  Bandbreite: 128 Bit, ECC

   -  AS1000[A]:

      -  72polige, 36 Bit breite Fast Page Mode SIMMs, 70ns oder
         schneller

      -  16 (EV5 Systeme) oder 20 (EV4 Systeme) SIMM Steckpl?tze

      -  Maximaler Speicherausbau 1 GB

      -  nutzt ECC

   -  AS800: Benutzt EDO DIMMs, 60 ns, 3.3 Volt

-  VGA eingebaut (nur bei einigen Mainboards)

-  3 PCI, 2 EISA, 1 64-Bit PCI/EISA kombiniert (AS800)

-  7 PCI, 2 EISA (AS1000A)

-  2 PCI, 1 EISA/PCI, 7 EISA (AS1000)

-  SCSI eingebaut, basiert auf einem Symbios 810 [AS1000] oder Qlogic
   1020 [AS1000A]

Die AS1000 Systeme gibt in vielen verschiedenen Geh?usevarianten. Frei
stehend, Rack-Einbau, mit oder ohne StorageWorks SCSI System, usw. Die
\`\`Elektronik'' ist bei allen gleich.

AS1000 Maschinen: Alle Maschinen mit der EV4 verwenden normale PS/2
SIMMs (36 Bit, 72 Pin) in F?nfergruppen. Das f?nfte wird f?r ECC
benutzt. Alle Maschinen mit der EV5 verwenden normale PS/2 SIMM (36 Bit,
72 Pin) in Vierergruppen. Der ECC nutzt die 4 ?berz?hligen Bits der
SIMMs (4 Bit von 36 Bit). Die EV5 Mainboards haben 16 Steckpl?tze f?r
SIMMs, die EV4 Mainboards haben 20 Steckpl?tze f?r SIMMs.

Die AS800 Systeme verwenden DIMMs in Vierergruppen, dabei mu? in den mit
\`\`Bank 0'' gekennzeichneten Steckpl?tzen begonnen werden. Eine
Speicherbank besteht aus vier nebeneinanderliegenden Steckpl?tzen. Wenn
verschieden gro?e DIMMs installiert werden, m?ssen die gr??eren in Bank
0 installiert werden. Der maximale Speicherausbau betr?gt 2 GByte.
Beachten Sie, da? EDO DIMMs verwendet werden m?ssen.

Die AS1000/800 verh?lt sich etwas st?rrisch, wenn man an Ihr eine
serielle Konsole verwenden will. Sie m?ssen auf jeden Fall folgendes im
SRM eingeben:

.. code:: SCREEN

    >>> SET CONSOLE SERIAL

um die serielle Konsole verwenden zu k?nnen. Wie bei den meisten anderen
Alphas reicht es nicht aus, wenn man nur die Tastatur abzieht. Um wieder
auf die graphische Konsole umzuschalten, m?ssen Sie an den Befehl

.. code:: SCREEN

    >>> SET CONSOLE GRAPHICS

an der seriellen Konsole eingeben.

Wenn Sie eine AS800 besitzen, sollten Sie auf jeden Fall pr?fen, ob Ihr
Ultra-Wide SCSI Bus auch wirklich den Ultra Modus nutzt. Dazu ben?tigen
Sie das Programm ``EEROMCFG.EXE``, das Sie auf der \`\`Konsole Firmware
Upgrade CDROM'' finden.

Die Konfigurationsdatei f?r den Kernel eines AlphaServer1000/1000A/800
mu? die folgenden Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_1000A
    cpu     EV4  # je nach installierter CPU
    cpu     EV5  # je nach installierter CPU

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.10. DS10/VS10/XP900 (\`\`Webbrick'') / XP1000 (\`\`Monet'') / DS10L (\`\`Slate'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die Modelle Webbrick und Monet sind leistungsstarke Workstations und
Server, auf der Basis der EV6 und des Tsunami Chipsatzes. Der Tsunami
Chipsatz wird auch in den leistungsst?rksten Systemen genutzt und bietet
daher mehr als genug Leistung. Eigentlich handelt es sich bei der DS10,
VS10 und XP900 trotz der unterschiedlichen Namen nur um ein System. Die
Unterschiede liegen in der Software und den angebotenen Erweiterungen.
Die DS10L basiert auf der DS10, das Geh?use ist jedoch f?r den Einbau in
ein Rack vorgesehen und nur 1HE hoch. Diese Maschine ist f?r ISPs und
HPTC Cluster (wie zum Beispiel Beowulf) gedacht.

.. raw:: html

   <div class="SECT4">

--------------

2.3.10.1. \`\`Webbrick / Slate''
''''''''''''''''''''''''''''''''

-  21264 EV6 CPU, 466 MHz

-  L2 / Bcache: 2MB, ECC

-  Speicherzugriff: 128 Bit via crossbar, Transferrate 1.3GB/sec

-  Speicher:

   -  Standard SDRAM DIMM, gepuffert, ECC, 200 Pin, 83 MHz

   -  4 DIMM Steckpl?tze in der DS10; maximaler Speicherausbau 2GByte

   -  2 DIMM Steckpl?tze in der DS10L; maximaler Speicherausbau 1 GByte

   -  DIMMs m?ssen paarweise installiert werden

-  21271 Core Logic Chipsatz (\`\`Tsunami'')

-  2 eingebaute 21143 Fast Ethernet Kontroller

-  AcerLabs M5237 (Aladdin-V) USB Kontroller (deaktiviert)

-  AcerLabs M1533 PCI-ISA bridge

-  AcerLabs Aladdin ATA-33 Kontroller

-  zwei eingebaute EIDE-Kan?le

-  Erweiterungen: 3 64-Bit PCI Steckpl?tze und 1 32-Bit PCI Steckplatz;
   die DS10L hat einen 64-Bit PCI Steckplatz

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?

-  2 USB Anschl?sse

-  PS/2 Tastatur und Maus

Die Systeme verf?gen ?ber eine \`\`intelligente'' Spannungsversorgung.
Mit anderen Worten, selbst wenn Sie das System ausschalten, stehen Teile
des Systems immer noch unter Strom (wie bei einem PC mit ATX-Netzteil).
Wenn Sie Arbeiten an der Hardware durchf?hren wollen, m?ssen Sie also
den Netzstecker ziehen.

Diese Spannungsversorgung wird RMC genannt. Wenn sie aktiviert ist,
gelangen Sie durch die Eingabe von **Escape** **Escape** RMC auf dem
seriellen Anschlu? 1 zur Eingabeaufforderung der RMC. Mit der RMC k?nnen
Sie das System ausschalten, einschalten, neu starten, die Temperatur
?berwachen, die Grenzwerte f?r die Temperatur einstellen und vieles
mehr. Die RMC hat eine eigene Onlinehilfe.

Die Webbrick befindet sich in einem Desktop-?hnlichem Geh?use, das dem
der ?lteren 21164 \`\`Maverick'' Workstations gleicht, aber deutlich
besseren Zugang zu den Komponenten gew?hrt. Wenn Sie eine Server-Farm
aufbauen wollen, k?nnen Sie die Webbrick auch in ein Rack einbauen, sie
belegt 3 H?heneinheiten. Die Slate ist nur eine H?heneinheit hoch, hat
aber auch nur einen PCI Steckplatz.

Die DS10 besitzt 4 Steckpl?tze f?r DIMMs. DIMMs m?ssen paarweise
installiert werden; dabei m?ssen Sie darauf achten, da? die Paare
verzahnt sind und daher die beiden DIMMs eines Paares nicht
nebeneinander liegen. Sie k?nnen 32, 64, 128, 256 und 512 MByte gro?e
DIMMs verwenden.

Wenn in einer DS10 zwei Paare aus gleich gro?en DIMMs installieren,
greift das System abwechselnd auf die beiden Speicherb?nke zu, um die
Leistung zu steigern (memory interleaving). Diese Option steht bei der
DS10L nicht zur Verf?gung, da Sie nur zwei Steckpl?tze f?r DIMMs hat.

Seit der Version 5.9 der SRM Firmware k?nnen Sie auch von Hostadaptern
aus der Adaptec 2940-Familie booten und sind nicht mehr auf die
normalerweise verwendeten Qlogic und Symbios/NCR Hostadapter
eingeschr?nkt.

Im Basismodell ist eine FUJITSU 9.5GB ATA Festplatte eingebaut, von der
das System auch bootet. Auf der Webbrick k?nnen Sie FreeBSD mit EIDE
Festplatten einsetzen. Auf dem Mainboard der DS10 stehen zwei IDE
Anschl?sse zur Verf?gung. Die f?r den Betrieb mit Tru64 Unix oder VMS
vorgesehenen Systeme wurden standardm??ig mit Ultra-SCSI Festplatten an
Qlogic Hostadaptern ausger?stet.

Die PCI-Steckpl?tze unterst?tzen 32 Bit und 64 Bit Karten, sowohl die
3.3V als auch die 5V Variante.

Die USB Anschl?sse werden nicht unterst?tzt und von allen aktuellen
Versionen der SRM Konsole deaktiviert.

Die Konfigurationsdatei f?r den Kernel mu? die folgenden Zeilen
enthalten:

.. code:: PROGRAMLISTING

    options   DEC_ST6600
    cpu     EV5

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Obwohl Sie es vielleicht erwartet haben, ist es nicht
    notwendig, cpu EV6 anzugeben. Das cpu EV5 ist nur notwendig, damit
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
    nicht meckert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.10.2. \`\`Monet''
'''''''''''''''''''''

-  21264 EV6, 500 MHz; 21264 EV67, 500 oder 667 MHz (XP1000G, Code-Name
   Brisbane); die CPU steckt auf einer eigenen Karte, die vor Ort
   ausgewechselt werden kann

-  L2 / Bcache: 4MB, ECC

-  Speicherzugriff: 256 Bit

-  Speicher: 128 oder 256 MByte 100 MHz (PC100) 168 Pin JEDEC standard,
   registered ECC SDRAM DIMMs

-  21271 Core Logic Chipsatz (\`\`Tsunami'')

-  eingebauter Ethernet-Kontroller auf Basis des 21143

-  Cypress 82C693 USB Controller

-  Cypress 82C693 PCI-ISA Bridge

-  Cypress 82C693 Controller

-  Erweiterungsm?glichkeiten: 2 getrennte PCI Busse, die von schnell I/O
   Kan?len (\`\`hoses'') angesteuert werden:

   -  hose 0: (die oberen 3 Steckpl?tze) 2 64-Bit PCI Steckpl?tze 1
      32-Bit PCI Steckpl?tze

   -  hose 1: (die unteren 2 Steckpl?tze) 2 32-Bit PCI Steckpl?tze
      (hinter einer 21154 PCI-PCI Bridge)

   -  2 der 64-Bit PCI Steckpl?tze sind f?r Karten mit voller Baul?nge
      gedacht

   -  alle 32-Bit PCI Steckpl?tze sind nur f?r kurze Karten geeignet

   -  einer der 32-Bit PCI Steckpl?tze ?berlappt mit einem der ISA
      Steckpl?tze

   -  alle PCI Steckpl?tze werden mit 33 MHz angesteuert

-  1 Ultra-Wide SCSI Anschlu? an einem Qlogic 1040

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?

-  PS/2 Tastatur und Maus

-  eingebautes 16-Bit ESS ES1888 Audiosystem

-  2 USB Anschl?sse

-  Grafik: ELSA Gloria Synergy oder DEC/Compaq PowerStorm 3D
   Beschleuniger Karten (wahlweise)

Das Geh?use der Monet ist ?hnlich einem Mini-Tower, fast so wie bei der
Miata.

Der eingebaute Qlogic UW-SCSI Kontroller erlaubt bis zu 4 interne
Ger?te. Ein externer Anschlu? ist nicht vorhanden.

Wenn Sie eine 500 MHz CPU verwenden, k?nnen Sie auch 83 MHz DIMMs
verwenden, obwohl laut Compaq f?r alle CPUs PC100 DIMMs verlangt. DIMMs
m?ssen in Vierergruppen installiert werden, dabei mu? mit den mit
\`\`0'' markierten Steckpl?tzen begonnen werden. Der maximale
Speicherausbau betr?gt 4 GByte. Die DIMMs m?ssen \`\`physically
interleaved'' installiert werden, beachten Sie die Markierungen neben
den Steckpl?tzen. Die Breite des Speichers bei der Monet ist doppelt so
gro? wie bei der Webbrick. Die DIMMs sind auf derselben Karte wie die
CPU untergebracht. Bitte beachten Sie, da? ECC RAM verwendet wird, Sie
ben?tigen also 72 Bit DIMMs (und nicht die normalen 64 Bit PC DIMMs).

Die EIDE Ger?te k?nnen sowohl vom SRM als Bootdevice als auch von
FreeBSD genutzt werden. Obwohl der eingesetzt Cypress Chip 2 EIDE Kan?le
bereitstellt, wird in der Monet nur einer davon unterst?tzt.

Die USB Anschl?sse werden von FreeBSD unterst?tzt. Sollten Sie Probleme
mit der Nutzung der USB Anschl?sse haben, sollten Sie nachsehen, ob die
SRM Variable usb\_enable auf on steht. Sie k?nnen die Einstellung mit
dem folgenden Befehl ?ndern:

.. code:: SCREEN

    >>> SET USB_ENABLE ON

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Versuchen Sie nicht, einen SCSI-Kontroller mit
    Symbios-Chipsatz in einem der PCI-Steckpl?tze an Hose 1 zu benutzen.
    Ein noch nicht genau lokalisiertes Problem von FreeBSD sorgt in
    dieser Konstellation f?r Probleme.

.. raw:: html

   </div>

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Einige VGA Karten funktionieren hinter der PCI-PCI
    Bridge (in den Steckpl?tzen 4 und 5) nicht. Hier k?nnen Sie nur
    Karten verwenden, die das \`\`VGA-legacy addressing'' richtig
    implementiert haben. Benutzen Sie im Notfall einfach einen der
    PCI-Steckpl?tze \`\`vor'' der Bridge.

.. raw:: html

   </div>

Die Audio-Hardware wird zur Zeit nicht von FreeBSD unterst?tzt.

Die folgenden Zeilen m?ssen in der Konfigurationsdatei f?r den
angepa?ten Kernel enthalten sein:

.. code:: PROGRAMLISTING

    options   DEC_ST6600
    cpu     EV5

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Obwohl Sie es vielleicht erwartet haben, ist es nicht
    notwendig, cpu EV6 anzugeben. Das cpu EV5 ist nur notwendig, damit
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
    nicht meckert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.11. DS20/DS20E (\`\`Goldrush'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Eigenschaften:

-  21264 EV6 CPU, 500 oder 670 MHz

-  maximal zwei CPUs pro System

-  L2 / Bcache: 4 MByte pro CPU

-  Speicherzugriff: Dual 256 Bit wide with crossbar switch

-  Speicher:

   -  SDRAM DIMMs

   -  werden in Vierergruppen installiert

   -  16 DIMM Steckpl?tze, maximal 4 GByte

   -  ECC

-  21271 Core Logic Chipsatz (\`\`Tsunami'')

-  eingebauter Adaptec ? Wide Ultra SCSI Hostadapter

-  Erweiterungen:

   -  2 getrennte PCI Busse, die von schnellen I/O Kan?len (\`\`hoses'')
      angesteuert werden:

   -  6 64-Bit PCI Steckpl?tze, 3 pro hose

   -  1 ISA Steckplatz

Bei der DS20 m?ssen Sie

.. code:: SCREEN

    >>> SET CONSOLE SERIAL

eingeben, damit die serielle Konsole aktiv wird; es reicht nicht aus,
die Tastatur abzuziehen. Um wieder zur graphischen Konsole umzuschalten,
m?ssen Sie

.. code:: SCREEN

    >>> SET CONSOLE GRAPHICS

an der seriellen Konsole. Lassen Sie sich bitte nicht davon verwirren,
da? die Meldungen der SRM Konsole auf der graphischen Konsole
erscheinen, obwohl Sie auf die serielle Konsole umgeschaltet haben.
Sobald Sie FreeBSD starten, beachtet es die Einstellung f?r CONSOLE und
alle Meldungen beim Systemstart und das Login erscheinen auf der
seriellen Konsole.

Das Geh?use der DS20 ist gro? und wie ein W?rfel geformt. Im Geh?use ist
unter anderem ein StorageWorks SCSI hot-swap System eingebaut, da?
maximal sieben 3.5" SCSI Festplatten aufnehmen kann. Das Geh?use der
DS20E ist kleiner, da das StorageWorks System fehlt.

Die Systeme verf?gen ?ber eine \`\`intelligente'' Spannungsversorgung.
Mit anderen Worten, selbst wenn Sie das System ausschalten, stehen Teile
des Systems immer noch unter Strom (wie bei einem PC mit ATX-Netzteil).
Wenn Sie Arbeiten an der Hardware durchf?hren wollen, m?ssen Sie also
den Netzstecker ziehen.

Diese Spannungsversorgung wird RMC genannt. Wenn sie aktiviert ist,
gelangen Sie durch die Eingabe von **Escape** **Escape** RMC auf dem
seriellen Anschlu? 1 zur Eingabeaufforderung der RMC. Mit der RMC k?nnen
Sie das System ausschalten, einschalten, neu starten, die Temperatur
?berwachen, die Grenzwerte f?r die Temperatur einstellen und vieles
mehr. Die RMC hat eine eigene Onlinehilfe.

Der eingebaute Adaptec SCSI Hostadapter ist bei der DS20 abgeschaltet
und kann daher nicht mit FreeBSD genutzt werden.

Seit der Version 5.9 der SRM Firmware k?nnen Sie auch von Hostadaptern
aus der Adaptec 2940-Familie booten und sind nicht mehr auf die
normalerweise verwendeten Qlogic und Symbios/NCR Hostadapter
eingeschr?nkt.

Wenn Sie verschieden gro?e DIMMs benutzen, m?ssen Sie die gr??ten Module
in die mit 0 gekennzeichneten Steckpl?tze einsetzen. Au?erdem m?ssen Sie
die Steckpl?tze \`\`der Reihe nach'' benutzen, also erst Bank 0, dann
Bank 1, und so weiter.

Versuchen Sie nicht, einen SCSI-Kontroller mit Symbios-Chipsatz in einem
der PCI-Steckpl?tze an Hose 1 zu benutzen. Ein noch nicht genau
lokalisiertes Problem von FreeBSD sorgt in dieser Konstellation f?r
Probleme.

Die Konfigurationsdatei f?r den Kernel mu? die folgenden Zeilen
enthalten:

.. code:: PROGRAMLISTING

    options   DEC_ST6600
    cpu     EV5

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Obwohl Sie es vielleicht erwartet haben, ist es nicht
    notwendig, cpu EV6 anzugeben. Das cpu EV5 ist nur notwendig, damit
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
    nicht meckert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.12. AlphaPC 264DP / UP2000
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die UP2000 wird von der Firma Alpha Processor Inc. gebaut

Eigenschaften:

-  21264 EV6 CPU, 670 MHz

-  maximal zwei CPUs pro System

-  L2 / Bcache: 4 MByte pro CPU

-  Speicherzugriff: 256 Bit

-  Speicher: SDRAM DIMMs, Vierergruppen, ECC, 16 DIMM Steckpl?tze,
   maximal 4GB

-  21272 Core Logic Chipsatz (\`\`Tsunami'')

-  eingebauter Adaptec AIC7890/91 Wide Ultra SCSI Hostadapter

-  2 embedded IDE based on Cypress 82C693 chips

-  USB mit Cypress 82C693

-  Erweiterungen:

   -  2 getrennte PCI Busse, die von schnellen I/O Kan?len (\`\`hoses'')
      angesteuert werden

   -  6 64-Bit PCI Steckpl?tze, 3 pro hose

   -  1 ISA Steckplatz

Zur Zeit unterst?tzt FreeBSD nur maximal 2 GByte Speicher.

Der eingebaute Adaptec Hostadapter kann zwar nicht zum booten verwendet
werden, mit FreeBSD kann er allerdings f?r reine Datenplatten benutzt
werden.

Busmaster DMA wird von auf dem ersten IDE-Anschlu? unterst?tzt.

Die Konfigurationsdatei f?r den Kernel mu? die folgenden Zeilen
enthalten:

.. code:: PROGRAMLISTING

    options   DEC_ST6600
    cpu     EV5

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Obwohl Sie es vielleicht erwartet haben, ist es nicht
    notwendig, cpu EV6 anzugeben. Das cpu EV5 ist nur notwendig, damit
    `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
    nicht meckert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.13. AlphaServer 2000 (\`\`DemiSable''), 2100 (\`\`Sable''), 2100A (\`\`Lynx'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die AlphaServer 2[01]00 sind als Server f?r ganze Abteilungen gedacht,
\`\`medium iron'' halt. Alle Maschinen unterst?tzen mehrere CPUs, Sie
k?nnen bis zu zwei (AS2000) oder vier (AS2100[A]) CPU installieren. Es
gibt sowohl frei stehende als auch f?r den Einbau in ein 19"-Rack
vorgesehene Varianten. Die Unterschiede zwischen beiden Versionen
erstrecken sich auf die Anzahl der Steckpl?tze, die maximale Anzahl an
CPU, und den maximalen Speicherausbau. Bei einigen Systemen ist ein
StorageWorks System integriert, das den Austausch der SCSI-Festplatten
im laufenden Betrieb erlaubt. Zwischenzeitlich wurde der Aufstieg von
der Sable zur Lynx durch Austausch der I/O-Backplane angeboten (die
C-Bus Backplane verblieb im System). Schnellere CPUs wurden ebenfalls
angeboten.

-  21064 EV4[5] CPU[s], 200, 233, 275 MHz oder 21164 EV5[6] CPU[s]s,
   250, 300, 375, 400 MHz

-  Cache: Je nach CPU 1, 4 oder 8 MByte pro CPU

-  eingebauter Kontroller f?r ein 2.88 MByte Diskettenlaufwerk

-  10MBit 21040 Ethernet eingebaut [nur AS2100]

-  2 serielle Anschl?sse

-  1 paralleler Anschlu?

-  PS/2 Tastatur und Maus

Die 200 MHz CPUs werden in Wirklichkeit nur mit 190 MHz betrieben. Es
k?nnen maximal 4 CPUs eingebaut werden, die allerdings identisch sein
m?ssen (Typ/Geschwindigkeit).

Wenn einer der Prozessoren einmal einen Fehler verursacht hat und als
defekt markiert ist, bleibt dieser Status bestehen, auch wenn man die
CPU austauscht (oder neu einsetzt), bis Sie das folgende Kommando
eingeben

.. code:: SCREEN

    >>> CLEAR_ERROR ALL

und die Maschine aus- und wieder einschalten. Dies gilt wahrscheinlich
auch f?r die anderen Subsysteme (IO und Speicher), allerdings konnte
dies ungetestet.

Bei den Systemen werden spezialisierte Speicherkarten verwendet, die
sich einen 128 Bit breiten C-Bus mit den CPU-Karten teilen. Der maximale
Speicherausbau betr?gt 1 GByte (DemiSable) bzw. 2 GByte (Sable). Einer
der Steckpl?tze auf dem Speicher-Bus kann entweder eine CPU- oder eine
Speicher-Karte aufnehmen. Bei einem Maschine mit 4 CPUs k?nnen maximal
zwei Speicherkarten verwendet werden.

Einige Versionen der Speicherkarten sind f?r die Aufnahme von SIMMs
vorgesehen und werden als \`\`SIMM carriers'' bezeichnet. Bei anderen
Speicherkarten wurden die Speicherbausteine direkt auf die Platine
gel?tet, was die Bezeichnung \`\`flat memory modules'' erkl?rt.

SIMM werden in Gruppen von acht 72-Pin, 36 Bit, 70 ns FPM Modulen
verwendet. Es wurden nur zwei Typen von SIMMs unterst?tzt, 1 M x 36 Bit
(4 MByte) und 4M x 36 Bit (16 MByte). Jede Speicherkarte kann bis zu
vier SIMM-B?nke aufnehmen. Die Verwendung verschieden gro?er SIMMs auf
einer Speicherkarte ist nicht erlaubt. Sie m?ssen eine Speicherkarte
erst komplett best?cken, bevor Sie die n?chste Karte einbauen. Da
zwischen den Steckpl?tzen f?r die Karten nicht sehr viel Platz, sollten
Sie auf die physische Gr??e der SIMMs achten (bevor Sie sie kaufen...)

Sowohl die Lynx als auch die Sable sind etwas st?rrisch, wenn es um die
serielle Konsole geht. Sie m?ssen den folgenden Befehl eingeben, um eine
serielle Konsole benutzen zu k?nnen:

.. code:: SCREEN

    >>> SET CONSOLE SERIAL

Wie bei vielen anderen Alphas reicht es nicht aus, einfach nur die
Tastatur zu ziehen. Um wieder auf die graphische Konsole umzuschalten,
m?ssen Sie den folgenden Befehl eingeben:

.. code:: SCREEN

    >>> SET CONSOLE GRAPHICS

Bei der Lynx sollte sich die VGA Karte in einem der prim?ren
PCI-Steckpl?tze befinden, EISA VGA Karten haben diese Einschr?nkung
nicht.

Die Maschinen verf?gen ?ber ein kleines LCD, das OCP (Operator Control
Panel) genannt wird. Beim Start des Systems werden hier die Meldungen
der Testprogramme angezeigt. Sie k?nnen den auf dem OCP angezeigten Text
?ber das SRM beeinflussen:

.. code:: SCREEN

    >>> SET OCP_TEXT "FreeBSD"

Das SRM Kommando

.. code:: SCREEN

    >>> SHOW FRU

zeigt Ihnen eine ?bersicht ?ber die Konfiguration des Systems, inkl. der
Seriennummern, Versionsnummer und Fehlerzahlen der einzelnen Module.

Sable, DemiSable und Lynx verf?gen ?ber einen eingebauten Fast
SCSI-Controller vom Typ Symbios 810. Wenn Sie pr?fen wollen, ob der
Controller auf Fast SCSI eingestellt ist, sollten Sie das folgende
Kommando benutzen:

.. code:: SCREEN

    >>> SHOW PKA0_FAST

Wenn hier der Wert 1 angezeigt wird, wird Fast SCSI unterst?tzt.

.. code:: SCREEN

    >>> SET PKA0_FAST 1

aktiviert diesen Modus

Zusammen mit der AS2100[A] wird StorageWorks SCSI Modul mit 7 SCSI
Steckpl?tzen geliefert. Ein zweites Modul kann in das Geh?use eingebaut
werden. Bei der AS2000 gibt es nur ein Modul mit 7 Steckpl?tzen,
Erweiterungen sind nicht m?glich. Bitte beachten Sie, da? die Zuordnung
zwischen Steckpl?tzen und SCSI ID in diesen Modulen anders ist als bei
den normalen StorageWorks Modulen. Wenn Sie nur einen SCSI Bus
konfiguriert haben, lautet die Reihenfolge von oben nach unten 0, 4, 1,
5, 2, 6, 3.

Das Modul kann auch so konfiguriert werden, da? zwei unabh?ngige SCSI
Busse zur Verf?gung stehen. Dieser Modus wird f?r RAID-Controller wie
den KZPSC (Mylex DAC960) genutzt. In diesem Modus sind die Slot IDs wie
folgt belegt: 0A, 0B, 1A, 1B, 2A, 2B, 3A, 3B (von oben nach unten),
wobei A und B den SCSI-Bus angeben. Bei einer Konfiguration mit nur
einem SCSI-Bus geh?rt das Modul mit dem Terminator auf der R?ckseite
nach OBEN, das Modul mit den Jumpern nach UNTEN. Wenn Sie zwei
SCSI-Busse verwenden, ist die Anordnung vertauscht. Die Unterscheidung
zwischen den beiden Modulen ist relativ einfach: Auf dem
Terminator-Modul befinden sich mehrere elektronische Bauteile, auf dem
Jumper-Modul keine.

Die DemiSable stellt 7 EISA und 3 PCI Steckpl?tze zur Verf?gung, bei der
Sable sind es 8 EISA und 3 PCI Steckpl?tze. Die Lynx hat, weil Sie neuer
ist, 8 PCI und 3 EISA Steckpl?tze. Die PCI Steckpl?tze der Lynx sind in
Vierergruppen zusammengefa?t. Die vier PCI Steckpl?tze, die n?her an der
CPU liegen, sind die prim?ren Steckpl?tze, liegen also logisch vor der
PCI Bridge. Diese Steckpl?tze tragen entgegen der Erwartung die h?heren
Nummern (PCI4 bis PCI7).

Sie m?ssen auf jeden Fall das EISA Configuration Utility (auf Diskette)
benutzen, wenn Sie in den EISA Steckpl?tzen Karten hinzugef?gt oder
getauscht haben. Dazu m?ssen Sie nur die Diskette mit dem ECU einlegen
und den folgenden Befehl eingeben:

.. code:: SCREEN

    >>> RUNECU

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die EISA Steckpl?tze werden zwar zur Zeit nicht
    unterst?tzt, aber die Compaq Qvision EISA VGA Karte wird als ISA
    Ger?t behandelt werden und kann daher f?r die Konsole verwendet
    werden.

.. raw:: html

   </div>

Es gab Entw?rfe f?r ein spezielles Extended I/O Modul, welches auf dem
C-Bus eingesetzt werden sollte. Es ist nicht bekannt, ob diese Module
jemals gebaut wurden. Auf jeden Fall gibt es keine Daten, ob FreeBSD sie
unterst?tzt.

Die Systeme k?nnen mit redundanten Netzteilen ausgestattet werden.
Beachten Sie, da? das Geh?use mit einem Sicherheitsschalter versehen
ist, der die Maschine abschaltet, sobald Sie das Geh?use ?ffnen. Die
L?fter der Maschinen sind geregelt. Sobald ein System mit mehr als zwei
CPUs und mehr als einer Speicherkarte ausgestattet ist, m?ssen Sie zwei
Netzteile verwenden.

Die Konfigurationsdatei f?r den Kernel mu? die folgenden Zeilen
enthalten:

.. code:: PROGRAMLISTING

    options   DEC_2100_A500
    cpu     EV4     #je nach verwendeter CPU
    cpu     EV5     #je nach verwendeter CPU

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.14. AlphaServer 4x00 (\`\`Rawhide'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die AlphaServer 4x00 Systeme sind Server f?r kleinere Unternehmen, die
entweder in einem 30" (76 cm) hohen Schrank oder in einem 19" Rack
stecken. Auch bei diesen Systemen handelt es sich um mittlere
Datentechnik, nicht um Systeme f?r Hobbyisten. Die Rawhides sind f?r den
Einsatz von mehr als einer CPU vorgesehen, jedes System kann bis zu vier
CPUs aufnehmen. Die Grundversorgung mit Festplatten ?bernehmen ein oder
zwei StorageWorks Module im unteren Teil des Schrankes. Die f?r den
NT-Markt vorgesehenen Rawhides hei?en DIGITAL Server 7300 (5/400 CPU)
und DIGITAL Server 7305 (5/533 CPU). Ein R am Ende der Typenbezeichnung
deutet auf ein System hin, das in ein Rack eingebaut werden kann.

Eigenschaften:

-  21164 EV5 CPUs, 266/300 MHz oder 21164A EV56 CPUs,
   400/466/533/600/666 MHz

-  Cache: 4 MByte pro CPU. Bei der EV5 300 MHz gab es auch eine Variante
   ohne Cache. 8 MByte bei der EV5 600 MHz

-  Speicherzugriff: 128 Bit, ECC

-  eingebauter Kontroller f?r ein Diskettenlaufwerk

-  2 serielle Anschl?sse

-  1 paralleler Anschlu?

-  PS/2 Tastatur und Maus

Bei der Rawhide k?nnen bis zu 8 Speichermodule eingesetzt werden. Die
Module werden in Paaren eingesetzt und stellen dem Bus jeweils 72 Bit
zur Verf?gung (inklusive der Bits f?r ECC). Die Module k?nnen EDO RAM
oder SDRAM sein. Eine voll best?ckte Rawhide verf?gt ?ber vier Paar
Speichermodule. Um die maximale Leistung zu erhalten, sollten Sie nach
M?glichkeit SDRAM verwenden. Das Speichermodul mit der gr??ten Kapazit?t
mu? im Steckplatz 0 plaziert werden. Eine Mischung aus EDO und SDRAM
Speicher funktioniert auch (solange Sie nicht versuchen, innerhalb eines
Paares EDO und SDRAM zu mischen). Allerdings f?hrt die gleichzeitige
Verwendung von EDO und SDRAM dazu, da? der *gesamte* Speicher im
langsameren EDO-Modus angesteuert wird.

Die Rawhide verf?gt ?ber einen eingebauten Symbios 810 SCSI-Controller,
der einen 8 Bit (narrow) fast-SCSI Bus bereitstellt und der im
allgemeinen nur f?r das CDROM genutzt wird.

F?r die Rawhides gibt es Erweiterungsmodule mit 8 64-Bit PCI und 3 EISA
Steckpl?tzen (die sogenannten \`\`Saddle'' Module). Sie verf?gen ?ber
zwei getrennte PCI-Busse, PCI0 und PCI1. PCI0 stellt einen reinen PCI
Steckplatz und drei PCI/EISA Steckpl?tze zur Verf?gung. PCI0 enth?lt
auch eine PCI/EISA bridge, die die seriellen und parallelen
Schnittstellen, Tastatur, Maus, etc. ansteuert. PCI1 stellt 4 PCI
Steckpl?tze und einen Symbios 810 SCSI Kontroller zur Verf?gung. VGA
Karten f?r die Konsole m?ssen an PCI0 angeschlossen werden.

Die aktuellen Versionen von FreeBSD haben Probleme mit den PCI Bridges.
Zur Zeit steht nur eine Notl?sung zur Verf?gung, die eine Bridge mit nur
einem Ger?t unterst?tzt. Dadurch ist es m?glich, den von Digital
eingebauten Qlogic SCSI Hostadapter zu benutzen, der hinter einer 21054
PCI Bridge sitzt.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die EISA Steckpl?tze werden zur Zeit nicht
    unterst?tzt, aber die Compaq Qvision EISA VGA Karte wird als ISA
    Ger?t behandelt und kann daher f?r die Konsole benutzt werden.

.. raw:: html

   </div>

Die Stromversorgung der Rawhide wird ?ber einen I2C-Kontroller
gesteuert. Wenn Sie sicher sein wollen, da? kein Teil des Systems mehr
unter Spannung steht, m?ssen Sie den Netzstecker ziehen.

Die Konfigurationsdatei f?r den Kernel mu? die folgenden Zeilen
enthalten:

.. code:: PROGRAMLISTING

    options   DEC_KN300
    cpu     EV5

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.15. AlphaServer 1200 (\`\`Tincup'') und AlphaStation 1200 (\`\`DaVinci'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der AlphaServer 1200 ist der Nachfolger AlphaServer 1000A. Das Geh?use
ist mit dem des 1000A identisch, die Elektronik basiert allerdings auf
der des AlphaServer 4000. Diese Systeme sind f?r den Einbau von bis zu
zwei CPUs vorgesehen. Die Grundversorgung mit Festplatten ?bernimmt ein
StorageWorks Modul. Die f?r den NT-Markt vorgesehenen Varianten der
AS1200 hei?en DIGITAL Server 5300 (5/400 CPU) und DIGITAL Server 5305
(5/533 CPU).

Eigenschaften:

-  21164A EV56 CPUs, 400 oder 533 MHz

-  Cache: 4 MByte pro CPU

-  Speicherzugriff: 128 Bit, ECC, DIMM Speicher auf zwei Speicherkarten

-  eingebauter Kontroller f?r ein Diskettenlaufwerk

-  2 serielle Anschl?sse

-  1 paralleler Anschlu?

-  PS/2 Tastatur und Maus

Die AS1200 nutzt 2 Speicherkarten mit je 8 Steckpl?tzen f?r DIMMs. DIMMs
m?ssen paarweise installiert werden. Die Steckpl?tze m?ssen der Reihe
nach gef?llt werden. Wenn DIMMs mit verschiedenen Gr??en verwendet
werden, mu? Steckplatz 0 den gr??ten DIMM enthalten. Die AS1200 benutzt
eine statische Anfangsadresse f?r die DIMMs, jedes DIMM beginnt bei
einem vielfachen von 512 MByte. Wenn Sie DIMMs verwenden, die kleiner
als 256 MByte sind, wird der physikalische Speicher des Systems
\`\`L?cher'' enthalten. Das System unterst?tzt 64 MByte und 256 MByte
gro?e DIMMs. Dabei handelt es sich um die 72 Bit SDRAM Variante, da das
System ECC nutzt.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Unter FreeBSD werden zur Zeit nur maximal 2 GByte
    unterst?tzt.

.. raw:: html

   </div>

Bei der AS1200 ist ein Symbios 810 SCSI-Kontroller eingebaut, der einen
Fast SCSI Bus zur Verf?gung stellt.

Bei der Tincup stehen 5 64-Bit PCI Steckpl?tze, ein 32-Bit PCI
Steckplatz und ein EISA Steckplatz (der mit einem der 64 Bit PCI
Steckpl?tze ?berlappt) zur Verf?gung. Zwei separate PCI-Busse stehen zur
Verf?gung, PCI0 und PCI1. Der 32 Bit PCI Steckplatz und die beiden
oberen 64 PCI Steckpl?tze geh?ren zu PCI0. An PCI0 h?ngt auch eine Intel
82375EB PCI/EISA Bridge, ?ber die die seriellen und parallelen
Anschl?sse, Tastatur, Maus, etc. angesteuert werden. Zu PCI1 geh?ren
vier 64 Bit PCI-Steckpl?tze und ein Symbios 810 SCSI Kontroller.
VGA-Karten f?r die Konsole m?ssen in einem zu PCI0 geh?renden Steckplatz
installiert werden.

Die Stromversorgung des Systems wird ?ber einen I2C-Kontroller
gesteuert. Wenn Sie wirklich sein wollen, da? kein Teil des Systems mehr
unter Spannung steht, m?ssen Sie den Netzstecker ziehen. Die Tincup
benutzt zwei Netzteile; allerdings nur zur Lastverteilung und nicht als
redundante Stromversorgung.

Die Konfigurationsdatei f?r den Kernel mu? die folgenden Zeilen
enthalten:

.. code:: PROGRAMLISTING

    options   DEC_KN300
    cpu     EV5

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.16. AlphaServer 8200 und 8400 (\`\`TurboLaser'')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die AlphaServer 8200 und 8400 sind als Server f?r ein Firmennetzwerk
gedacht, die entweder in einem hohen 19" Schrank (9200) oder einem
breiten 19" Rack eingebaut sind. Diese Maschinen sind das ber?hmte
\`\`big iron'', keine Systeme f?r den Privatmann. Die TurboLaser k?nnen
bis zu 12 CPUs pro Maschine aufnehmen. Der TurboLaser System Bus (TLSB)
erlaubt neun (AS8400) bzw. f?nf Knoten (AS8200). Der TSLB besteht aus
256 Datenleitungen und 40 Adre?leitungen, der maximale Durchsatz liegt
bei 2.1 GByte/sec. Ein Knoten am TSLB kann eine CPU, Speicher, oder I/O
sein. An jeden TSLB werden maximal 3 I/O Knoten unterst?tzt.

Die Grundversorgung mit Festplatten ?bernimmt ein StorageWorks Modul.
Die AS8400 ben?tigt eine 3-Phasen-Wechselstrom (Drehstrom) Anschlu?, die
AS8200 kommt mit einem normalen Stromanschlu? aus.

Eigenschaften:

-  21164 EV5/EV56 CPUs, max. 467 MHz oder 21264 EV67 CPUs max. 625 MHz

-  ein oder zwei CPUs pro CPU-Modul

-  Cache: 4 MByte B-Cache pro CPU

-  Speicherzugriff: 256 Bit, ECC

-  Speicher: gro? Speicherkarten, die an den TLSB angeschlossen werden
   und auf denen spezielle SIMMs stecken. Die Speicherkarten sind in
   verschiedenen Gr??en erh?ltlich, bis zu 4 GByte pro Karte. Die Karten
   nutzen ECC (8 Bit ECC pro 64 Bit Daten). Die AS8400 kann maximale 7,
   die AS8200 maximal 3 Speicherkarte aufnehmen. Maximaler
   Speicherausbau: 28 GByte.

-  Expansion: 3 System \`\`I/O Ports'', die jeweils bis zu 12 I/O Kan?le
   erlauben. An jeden I/O-Kanal kann eine XMI-, Futurebus+- oder PCI-Box
   angeschlossen werden.

FreeBSD unterst?tzt (dies wurde auch getestet) bis zu 2 GByte Speicher
in einem TurboLaser. Sie sollten sorgf?ltig abw?gen, ob Sie die TSLB
Steckpl?tze mit Speicherkarten oder CPU-Karten f?llen. Wenn Sie sich zum
Beispiel f?r 28 GByte Speicher entscheiden, k?nnen Sie zur gleichen Zeit
nur zwei CPUs (eine Karte) verwenden.

FreeBSD unterst?tzt nur die PCI Steckpl?tze. XMI und Futurebus+ (die es
nur beim AS8400 gibt) werden beide nicht unterst?tzt.

Die Karten f?r die I/O Port haben die Bezeichnungen KFTIA oder KFTHA.
Diese Karten stellen die sogenannten \`\`hoses'' bereit, an die bis zu
vier (KFTHA) bzw. ein (KFTIA) PCI Bus angeschlossen werden kann. KFTIA
stellt zwei 10baseT Ethernet-Anschl?sse, einen FDDI-Anschlu?, drei Fast
Wide Differential SCSI Busse und einen Fast Wide Single Ended SCSI Bus
zur Verf?gung. Der FWSE SCSI Bus ist f?r das CDROM gedacht.

Die KFTHA unterst?tzt an jedem Ihrer vier hoses eine DWLPA oder DWLPB
Box. Diese beherbergen jeweils 12 32 Bit PCI Steckpl?tze. Physikalisch
handelt es sich dabei zwar 3 Busse mit je vier Steckpl?tze, aber f?r die
Software scheint es sich um einen PCI-Bus mit 12 Steckpl?tzen zu
handeln. Eine voll ausgebaute AS8x00 kann 3 (I/O Ports) mal 4 (hoses)
mal 12 (PCI Steckpl?tze/DWLPx), also 144 PCI Steckpl?tze zur Verf?gung
stellen. Die maximale Bandbreite pro KFTHA betr?gt 500 MByte/sec. Die
DWLPA kann auch 8 EISA Karten aufnehmen, 2 Steckpl?tze sind reine
PCI-Steckpl?tze, 2 Steckpl?tze sind reine EISA Steckpl?tze. Zwei der
zw?lf Steckpl?tze werden immer von I/O- und Verbinder-Karten belegt. Die
bevorzugte I/O Box ist die DWLPB.

Um die h?chste Leistung zu erhalten, sollten Sie Anwendungen mit hoher
Bandbreite (FibreChannel, Gigabit Ethernet) ?ber mehrere hoses und/oder
mehrere multiple KFTHA/KFTIA verteilen.

Momentan sind PCI Karten, welche PCI Bridges verwenden, mit FreeBSD
nicht nutzbar. Verzichten Sie also momentan auf diese Karten.

Der single ended narrow SCSI Bus auf der KFTIA wird vom System als
*vierter* SCSI Bus angezeigt, da die drei Fast Wide Differential SCI
Busse auf KFTIA Vorrang haben.

Die AS8x00 werden normalerweise mit einer seriellen Konsole benutzt.
Einige neuere Maschinen haben eventuell irgendeine Art von graphischer
Konsole, aber FreeBSD wurde nur mit einer seriellen Konsole gestestet.

Um die serielle Konsole benutzen zu k?nnen, m?ssen Sie in der
``/etc/ttys`` den Eintrag f?r die Konsole wie folgt ?ndern:

.. code:: PROGRAMLISTING

    console "/usr/libexec/getty std.9600"   unknown   on secure

Alternativ k?nnen Sie auch die folgende Zeile hinzuf?gen:

.. code:: PROGRAMLISTING

    zs0     "/usr/libexec/getty std.9600"   unknown   on secure

Die Konfigurationsdatei f?r den Kernel f?r einen AlphaServer 8x00 mu?
die folgenden Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   DEC_KN8AE    # Alpha 8200/8400 (Turbolaser)
    cpu     EV5

Obwohl Sie es vielleicht erwartet haben, ist es nicht notwendig, cpu EV6
anzugeben. Das cpu EV5 ist nur notwendig, damit
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
nicht meckert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.17. Alpha Processor Inc. UP1000
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Das UP1000 ist ein ATX Mainboard mit einer 21264a CPU, die auf einer
Slot B Karte steckt. Es wird normalerweise in einen ATX Tower eingebaut.

Eigenschaften:

-  21264a Alpha CPU, 600 oder 700 MHz, auf einer Slot B Karte (inklusive
   der L?fter)

-  Speicherzugriff: 128 Bits bis zum L2 Cache, 64 Bits vom Slot B bis
   zum AMD-751

-  on-board Bcache / L2 cache: 2MB (600 MHz) oder 4MB (700 MHz)

-  AMD AMD-751 (\`\`Irongate'') system controller chip

-  Acer Labs M1543C PCI-ISA Bridge / super-IO chip

-  PS/2 Maus und Tastatur

-  Speicher: ungepufferte 168-pin PC100 SDRAM DIMMS, 3 DIMM Steckpl?tze,
   nur DIMMs mit 64, 128 oder 256 MByte werden unterst?tzt

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?, ECP/EPP

-  Anschlu? f?r Diskettenlaufwerk

-  2 Ultra DMA33 IDE Kan?le

-  2 USB Anschl?sse

-  Erweiterungen:

   -  4 32 Bit PCI Steckpl?tze

   -  2 ISA Steckpl?tze

   -  1 AGP Steckplatz

Bei Slot B handelt es sich um eine kleine Box, die eine Karte mit CPU
und Cache enth?lt. Weiterhin sind zwei kleine L?fter angebracht. Laute
L?fter...

Das System ben?tigt ECC-f?hige DIMMs, also die 72 Bit Variante. Diese
Information wird in den Unterlagen zur UP1000 nicht erw?hnt. Das System
liest das serielle EEPROM auf DIMMs ?ber den SM Bus aus. Wenn nur ein
DIMM vorhanden ist, mu? es in Steckplatz *2* eingebaut werden. Dies ist
etwas seltsam.

Laut Hersteller ben?tigt man f?r ein UP1000 ein 400Watt ATX Netzteil.
Wenn man den Stromverbrauch von CPU und Mainboard betrachtet, scheint
dies etwas ?bertrieben. Allerdings sollten Sie wie immer an Ihre
Steckkarten und Peripherieger?te denken. Ein M1543C Baustein stellt
Stromspar- und Temperatur?berwachungsfunktionen bereit (via I2C/SM Bus).

Das UP1000 wird standardm??ig nur mit dem AlphaBIOS geliefert. Die
Firmware f?r die SRM Konsole ist auf der Webseite von Alpha Processor
Inc. erh?ltlich. Zur Zeit ist nur eine Beta-Version verf?gbar, die f?r
die auch f?r die Portierung von FreeBSD auf das UP1000 genutzt wurde.

Die SRM Konsole kann von den eingebauten Ultra DMA EIDE Kan?le booten.

Der SRM der UP1000 kann auch von einem Adaptec 294x Hostapdater booten,
allerdings traten mit einem Adaptec 294x unter hoher Last
\`\`Aussetzer'' auf. Ein Hostadapter mit einem Symbios 875 funktionierte
mit sym Treiber problemlos. H?chstwahrscheinlich funktionieren auch alle
anderen Hostadapter mit Symbios-Chipsatz, wenn sie vom sym Treiber
unterst?tzt werden.

Die USB Anschl?sse werden von der SRM Konsole deaktiviert und wurden
(noch) nicht mit FreeBSD getestet.

Die Konfigurationsdatei f?r einen Kernel f?r das UP1000 mu? die
folgenden Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   API_UP1000   # UP1000, UP1100 (Nautilus)
    cpu     EV5

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.18. Alpha Processor Inc. UP1100
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Das UP1100 ist ein ATX Mainboard mit einer 21264a CPU, die mit 600 MHz
betrieben wird. Es wird normalerweise in einen ATX Tower eingebaut.

Eigenschaften:

-  21264a Alpha EV6 CPU, 600 oder 700 MHz

-  Speicherzugriff: 100 MHz 64-Bit (PC-100 SDRAM), Bandbreite 800 MB/s

-  on-board Bcache / L2 cache: 2 MByte

-  AMD AMD-751 (\`\`Irongate'') system controller chip

-  Acer Labs M1535D PCI-ISA Bridge / super-IO chip

-  PS/2 Maus und Tastatur

-  Speicher: ungepufferte 168-pin PC100 SDRAM DIMMS, 3 DIMM Steckpl?tze,
   nur DIMMs mit 64, 128 oder 256 MByte werden unterst?tzt

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?, ECP/EPP

-  Anschlu? f?r Diskettenlaufwerk

-  2 Ultra DMA66 IDE Kan?le

-  2 USB Anschl?sse

-  Erweiterungen: 3 32 Bit PCI Steckpl?tze und ein AGP2x Steckplatz

Das UP1100 wird standardm??ig mit SRM Konsole geliefert. Die SRM Konsole
ist einem 2 MByte gro?en Flash ROM untergebracht.

Das System ben?tigt ECC-f?hige DIMMs, also die 72 Bit Variante. Diese
Information wird in den Unterlagen zur UP1000 nicht erw?hnt. Das System
liest das serielle EEPROM auf DIMMs ?ber den SM Bus aus. Wenn nur ein
DIMM vorhanden ist, mu? es in Steckplatz *2* eingebaut werden. Dies ist
etwas seltsam.

Laut Hersteller ben?tigt man f?r ein UP1000 ein 400Watt ATX Netzteil.
Wenn man den Stromverbrauch von CPU und Mainboard betrachtet, scheint
dies etwas ?bertrieben. Allerdings sollten Sie wie immer an Ihre
Steckkarten und Peripherieger?te denken Ein M1535D Baustein stellt
Stromspar- und Temperatur?berwachungsfunktionen bereit (via I2C/SM Bus,
mit einem LM75 Thermof?hler).

Auf dem Mainboard ist ein 21143 10/100MBit Ethernet Anschlu?
untergebracht.

Das UP1100 enth?lt au?erdem ein SoundBlaster kompatibles Audiosystem. Ob
es von FreeBSD unterst?tzt wird, ist noch unbekannt.

Die SRM Konsole kann von den eingebauten Ultra DMA EIDE Kan?le booten.

Das UP1100 besitzt 3 USB Anschl?sse, zwei stehen extern zur Verf?gung,
einer ist mit dem AGP Steckplatz verbunden.

Die Konfigurationsdatei des Kernels f?r ein UP1100 mu? die folgenden
Zeilen enthalten:

.. code:: PROGRAMLISTING

    options   API_UP1000   # UP1000, UP1100 (Nautilus)
    cpu     EV5

Obwohl Sie es vielleicht erwartet haben, ist es nicht notwendig, cpu EV6
anzugeben. Das cpu EV5 ist nur notwendig, damit
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
nicht meckert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.19. Alpha Processor Inc. CS20, Compaq DS20L
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der CS20 ist ein 19" breiter, 1HE hoher Server mit einer oder zwei
21264[ab] CPUs. Dieser Rechner wird von Compaq unter dem Namen
Alphaserver DS20L verkauft. Der DS20L enth?lt zwei 833 MHz CPUs.

Eigenschaften:

-  21264a Alpha CPU, 667 MHz oder 21264b, 833 MHz (max. 2 CPUs)

-  Speicherzugriff: 100 MHz 256-Bit breit

-  21271 Core Logic chipset (\`\`Tsunami'')

-  Acer Labs M1533 PCI-ISA Bridge controller / super-IO chip

-  PS/2 Maus und Tastatur

-  Speicher: gepufferte/registrierte 168-Pin PC100 PLL SDRAM DIMMS, 8
   DIMM Steckpl?tze, ECC, minimal 256 MByte, maximal 2 GByte Speicher

-  2 serielle Anschl?sse, 16550A

-  1 paralleler Anschlu?, ECP/EPP

-  ALI M1543C Ultra DMA66 IDE Anschlu?

-  zwei Intel 82559 10/100MBit Anschl?sse

-  Symbios 53C1000 Ultra160 SCSI Hostadapter

-  Erweiterungen: 2 64 Bit PCI Steckpl?tze (2/3 L?nge)

Das CS20 wird standardm??ig mit SRM Konsole geliefert. Die SRM Konsole
ist einem 2 MByte gro?en Flash ROM untergebracht.

Das CS20 ben?tigt ECC-f?hige DIMMs. Beachten Sie, da? es *gepufferte*
DIMMs verwendet.

Das CS20 verf?gt ?ber ein internes ?berwachungssystem auf I2C-Basis, mit
dem Temperatur, L?fter, Spannungen, etc. ?berwacht werden. Das I2C
unterst?tzt auch \`\`wake on LAN''.

Jeder PCI Steckplatz ist mit einem eigenem PCI Bus auf dem Tsunami
verbunden.

Die SRM Konsole kann von den eingebauten Ultra DMA EIDE Kan?le booten.

Das CS20 verf?gt ?ber ein eingebautes slim-line IDE CDROM. Weiterhin
steht ein von vorne zug?nglicher Schacht f?r eine 1" hohe 3.5" SCSI
Festplatte mit SCA Anschlu? zur Verf?gung.

Bitte beachten Sie, da? es kein Diskettenlaufwerk (und auch keinen
Anschlu? daf?r) gibt.

Die Konfigurationsdatei f?r den Kernel mu? die folgenden Zeilen
enthalten:

.. code:: PROGRAMLISTING

    options   DEC_ST6600
    cpu     EV5

Obwohl Sie es vielleicht erwartet haben, ist es nicht notwendig, cpu EV6
anzugeben. Das cpu EV5 ist nur notwendig, damit
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
nicht meckert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. ?bersicht ?ber die unterst?tzte Hardware
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ein Hinweis vorab: Es sind l?ngst nicht so viele FreeBSD/Alpha Systeme
in Betrieb wie FreeBSD/Intel. Mit anderen Worten, es ist sehr viel
unwahrscheinlicher, da? eine der vielen verschiedenen PCI/ISA Karten auf
einer Alpha getestet wurde, als das bei Intel der Fall ist. Das bedeutet
nicht unbedingt, da? es Probleme geben mu?, allerdings ist es deutlich
wahrscheinlicher, da? Sie sich auf unbekanntes Gebiet wagen. ``GENERIC``
enth?lt nur Ger?te, von denen wir wissen, da? Sie in einer Alpha
funktionieren.

PCI und ISA werden komplett unterst?tzt. Turbo Channel ist nicht im
Standardkernel (``GENERIC``) enthalten und wird nur bedingt unterst?tzt
(n?here Informationen finden Sie bei den einzelnen Systemen). MCA wird
nicht unterst?tzt. Bei EISA werden EISA-Karten nicht unterst?tzt, weil
die notwendigen Treiber fehlen. ISA Karten in EISA Steckpl?tzen sollten
funktionieren. Die Compaq Qvision EISA VGA Karte wird im ISA-Modus
betrieben und ist als Konsole verwendbar.

Diskettenlaufwerke mit 1.44 MByte und 1.2 MByte werden unterst?tzt. Die
in einigen Alpha Systemen vorhandenen 2.88 MByte Diskettenlaufwerke
werden nur als 1.44 MByte Laufwerke unterst?tzt.

ATA und ATAPI (IDE) Ger?te werden von der
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiberfamilie unterst?tzt. Da die meisten Anwender in Ihren Alphas SCSI
Festplatten nutzen, werden diese Treiber nicht so intensiv getestet wie
die SCSI-Treiber. Achten Sie auf die Einschr?nkungen beim Booten von IDE
Festplatten, diese Angaben finden Sie bei den Informationen zu den
einzelnen Systemen.

In Punkto SCSI werden ?ber die CAM Schicht die folgenden Hostadapter
vollst?ndig unterst?tzt: Adaptec 2940x (auf Basis der AIC7xxx chips),
Qlogic Familie und Symbios. Denken Sie daran, da? es system-spezifische
Einschr?nken gibt, wenn Sie von den verschiedenen Hostadaptern booten
wollen.

Die Qlogic QL2x00 FibreChannel Hostadapter werden vollst?ndig
unterst?tzt.

Wenn Sie Ihre Alpha ?ber Netzwerk booten wollen, brauchen Sie eine
Netzwerkkarte, die von der SRM Konsole unterst?tzt wird. Mit anderen
Worten, eine Karte mit einem 21x4x Chip. Genau diese Karten wurden auch
von Digital eingesetzt. Diese Chips werden bei FreeBSD von
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
(alter Treiber) oder
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
(neuer Treiber) unterst?tzt. Einige neueren Versionen des SRM sollen
auch die Intel 8255x Ethernet Chips unterst?tzen, die vom FreeBSD
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt werden. Aber hier ist Vorsicht geboten: Es gibt Berichte,
da? der
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
nicht sauber mit FreeBSD l?uft (obwohl er bei FreeBSD/x86 ausgezeichnet
funktioniert).

DEC DEFPA PCI FDDI Netzwerkkarten werden auf der Alpha unterst?tzt.

Die SRM Konsole emuliert normalerweise einen VGA kompatiblen Modus bei
PCI VGA Karten. Allerdings garantiert Compaq/DEC nicht daf?r, da? das
bei jeder m?glichen Karte funktioniert. Wenn der SRM der Meinung ist,
da? das VGA in Ordnung ist, kann FreeBSD die Karte benutzen. Der Treiber
f?r die Konsole funktioniert genau wie auf einem FreeBSD/intel System.
Bitte denken Sie daran, da? die VESA Modi auf der Alpha nicht
unterst?tzt werden, Ihnen bleibt also nur die 80x25 Konsole.

In einigen Alphas finden Sie Grafikkarte mit einem TGA-Baustein. Diese
einfache Grafikkarte unterst?tzt die VGA-Emulation nicht und kann daher
nicht als FreeBSD-Konsole verwendet werden. Die TGA2 Grafikkarten
unterst?tzen dagegen eine VGA-Emulation und k?nnen als FreeBSD-Konsole
genutzt werden.

Die in den meisten Alphas vorhandenen seriellen Schnittstellen nach dem
\`\`PC Standard'', werden unterst?tzt. Auf TurboChannel Systemen werden
die seriellen Schnittstellen ebenfalls unterst?tzt.

ISDN (i4b) wird von FreeBSD/alpha nicht unterst?tzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5. Danksagung
~~~~~~~~~~~~~~~

Um dieses Dokument zusammenzustellen, wurden viele Quellen genutzt; aber
die wichtigste und wertvollste Quelle waren die `NetBSD
Webseiten <http://www.netbsd.org/>`__. Ohne NetBSD/alpha g?be es kein
FreeBSD/alpha.

Die folgenden Personen haben mich bei der Arbeit an diesem Kapitel
unterst?tzt:

-  Andrew Gallatin ``<gallatin@FreeBSD.org>``

-  Chuck Robey ``<chuckr@FreeBSD.org>``

-  Matthew Jacob ``<mjacob@FreeBSD.org>``

-  Michael Smith ``<msmith@FreeBSD.org>``

-  David O'Brien ``<obrien@FreeBSD.org>``

-  Christian Weisgerber

-  Kazutaka YOKOTA

-  Nick Maniscalco

-  Eric Schnoebelen

-  Peter van Dijk

-  Peter Jeremy

-  Dolf de Waal

-  Wim Lemmers, ex-Compaq

-  Wouter Brackman, Compaq

-  Lodewijk van den Berg, Compaq

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Unterst?tzte Ger?te
----------------------

$FreeBSD: src/release/doc/de\_DE.ISO8859-1/hardware/common/dev.sgml,v
1.1.2.2 2002/05/27 05:27:16 ue Exp $
Dieses Kapitel enth?lt alle Ger?te, die auf jeden Fall von FreeBSD auf
alpha Systemen unterst?tzt werden. Andere Konfigurationen k?nnen auch
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
(`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Acerlabs Aladdin

-  AMD 756 ATA66, 766 ATA100, 768 ATA100

-  Cenatek Rocket Drive

-  CMD 646, 648 ATA66, und 649 ATA100

-  Cypress 82C693

-  Cyrex 5530 ATA33

-  HighPoint HPT366 ATA66, HPT370 ATA100, HPT372 ATA133, HPT374 ATA133

-  Intel PIIX, PIIX3, PIIX4

-  Intel ICH ATA66, ICH2 ATA100, ICH3 ATA100

-  nVidia nForce ATA100

-  Promise ATA100 OEM Baustein (pdc20265)

-  Promise Fasttrak-33, -66, -100, -100 TX2/TX4

-  Promise Ultra-33, -66, -100

-  ServerWorks ROSB4 ATA33

-  ServerWorks CSB5 ATA66/ATA100

-  SiS 530, 540, 620

-  SiS 630, 633, 635, 645, 730, 733, 735, 740, 745, 750

-  SiS 5591

-  VIA 82C586 ATA33, 82C596 ATA66, 82C686a ATA66, 82C686b ATA100

Adaptec SCSI Controller

-  Adaptec
   19160/291x/2920/2930/2940/2950/29160/3940/3950/3960/39160/398x/494x
   PCI SCSI Controller, einschlie?lich der Narrow/Wide/Twin/Ultra/Ultra2
   Versionen
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
   Treiber)

-  Adaptec AIC7770, AIC7850, AIC7860, AIC7870, AIC7880, und AIC789x
   on-board SCSI Controller
   (`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
   Treiber)

AMI MegaRAID RAID Controller, Modellreihen Express und Enterprise
(`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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

-  HP NetRaid-1si

-  HP NetRaid-3si

-  HP Embedded NetRaid

.. raw:: html

   <div class="NOTE">

    Aufgrund von Einschr?nkungen im SRM k?nnen Sie von diesen
    Hostadaptern nicht booten.

.. raw:: html

   </div>

Mylex DAC960 und DAC1100 RAID Controller, Firmware-Version 2.x, 3.x, 4.x
und 5.x
(`mlx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mlx&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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

    Aufgrund von Einschr?nkungen im SRM k?nnen Sie von diesen
    Hostadaptern nicht booten. Die Liste enth?lt einige Controller, die
    von Digital/Compaq in Alpha Systemen aus der StorageWorks-Familie
    verkauft werden, zum Beispiel KZPSC oder KZPAC.

.. raw:: html

   </div>

LSI/SymBios (ehemals NCR) 53C810, 53C810a, 53C815, 53C825, 53C825a,
53C860, 53C875, 53C875a, 53C876, 53C885, 53C895, 53C895a, 53C896,
53C1010-33, 53C1010-66, 53C1000, 53C1000R PCI SCSI Controller, sowohl
auf Hostadaptern als auch on-board
(`ncr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ncr&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
und
`sym(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sym&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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
(`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Qlogic 1020, 1040 SCSI und Ultra SCSI Hostadapter

-  Qlogic 1240 dual Ultra SCSI Controller

-  Qlogic 1080 Ultra2 LVD and 1280 Dual Ultra2 LVD Controller

-  Qlogic 12160 Ultra3 LVD Controller

-  Qlogic 2100 and Qlogic 2200 Fibre Channel SCSI Controller

-  Qlogic 2300 and Qlogic 2312 2-Gigabit Fibre Channel SCSI Controller

-  Performance Technology SBS440 ISP1000

-  Performance Technology SBS450 ISP1040

-  Performance Technology SBS470 ISP2100

-  Antares Microsystems P-0033 ISP2100

Mit allen unterst?tzten SCSI Controllern ist die uneingeschr?nkte
Nutzung von SCSI-I, SCSI-II und SCSI-III Ger?ten m?glich. Dazu geh?ren
Festplatten, optische Platten, Bandlaufwerke (u.a. DAT, 8mm Exabyte,
Mammoth, DLT), Wechselplatten, Ger?te mit eigenem Prozessor und CDROM.
Sie k?nnen mit den CD-Treibern (wie
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__)
lesend auf WORMs zugreifen, wenn diese die entsprechenden Kommandos f?r
CDROM unterst?tzen. F?r schreibenden Zugriff steht das Programm
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+Ports>`__
aus der Ports Collection zur Verf?gung.

Zur Zeit unterst?tzte CDROM-Arten:

-  SCSI Ger?te (dazu geh?ren auch ProAudio Spectrum and SoundBlaster
   SCSI)
   (`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__)

-  ATAPI IDE Ger?te
   (`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2. Netzwerkkarten
~~~~~~~~~~~~~~~~~~~

Adaptec Duralink PCI Fast Ethernet Netzwerkkarten, die auf dem Adaptec
AIC-6915 Fast Ethernet Controller basieren
(`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  ANA-62011 64-bit single port 10/100baseTX

-  ANA-62022 64-bit dual port 10/100baseTX

-  ANA-62044 64-bit quad port 10/100baseTX

-  ANA-69011 32-bit single port 10/100baseTX

-  ANA-62020 64-bit single port 100baseFX

AMD PCnet Netzwerkkarten
(`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
und
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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

Netzwerkkarten mit National Semiconductor DS8390, dazu geh?ren auch die
NE2000 und alle Nachbauten der NE2000
(`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  3C503 Etherlink II
   (`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
   Treiber)

-  NetVin 5000

-  Novell NE1000, NE2000, und NE2100

-  RealTek 8029

-  SMC Elite 16 WD8013

-  SMC Elite Ultra

-  SMC WD8003E, WD8003EBT, WD8003W, WD8013W, WD8003S, WD8003SBT and
   WD8013EBT und Nachbauten

-  Surecom NE-34

-  VIA VT86C926

-  Winbond W89C940

RealTek 8129/8139 Fast Ethernet Netzwerkkarten
(`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Kingston KNE110TX

-  LinkSys EtherFast LNE100TX

-  Matrox FastNIC 10/100

-  NetGear FA310-TX Rev. D1

Macronix 98713, 98713A, 98715, 98715A und 98725 Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Accton EN1217 (98715A)

-  Adico AE310TX (98715A)

-  Compex RL100-TX (98713 oder 98713A)

-  CNet Pro120A (98713 oder 98713A)

-  CNet Pro120B (98715)

-  NDC Communications SFA100A (98713A)

-  SVEC PN102TX (98713)

Macronix/Lite-On PNIC II LC82C115 Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  LinkSys EtherFast LNE100TX Version 2

Winbond W89C840F Fast Ethernet Karten
(`wb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wb&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Trendware TE100-PCIE

VIA Technologies VT3043 \`\`Rhine I'' and VT86C100A \`\`Rhine II'' Fast
Ethernet Karten
(`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  AOpen/Acer ALN-320

-  D-Link DFE-530TX

-  Hawking Technologies PN102TX

Silicon Integrated Systems SiS 900 und SiS 7016 PCI Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  SiS 630, 635 und 735 Mainboard Chips?tze

National Semiconductor DP83815 Fast Ethernet Karten
(`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  NetGear FA311-TX

-  NetGear FA312-TX

Sundance Technologies ST201 PCI Fast Ethernet Karten
(`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  D-Link DFE-550TX

SysKonnect SK-984x PCI Gigabit Ethernet Karten
(`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  SK-9821 1000baseT copper, single port

-  SK-9822 1000baseT copper, dual port

-  SK-9841 1000baseLX single mode fiber, single port

-  SK-9842 1000baseLX single mode fiber, dual port

-  SK-9843 1000baseSX multimode fiber, single port

-  SK-9844 1000baseSX multimode fiber, dual port

Texas Instruments ThunderLAN PCI Netzwerkkarten
(`tl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tl&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Compaq Netelligent 10, 10/100, 10/100 Dual-Port

-  Compaq Netelligent 10/100 TX Embedded UTP, 10 T PCI UTP/Coax, 10/100
   TX UTP

-  Compaq NetFlex 3P, 3P Integrated, 3P w/BNC

-  Olicom OC-2135/2138, OC-2325, OC-2326 10/100 TX UTP

-  Racore 8165 10/100baseTX

-  Racore 8148 10baseT/100baseTX/100baseFX multi-personality

PCI Fast Ethernet Karten mit ADMtek Inc. AL981
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

PCI Fast Ethernet Karten mit ADMtek Inc. AN985
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  LinkSys EtherFast LNE100TX v4.0/4.1

ASIX Electronics AX88140A PCI Netzwerkkarten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Alfa Inc. GFC2204

-  CNet Pro110B

Netzwerkkarten mit DEC DC21040, DC21041, DC21140, DC21141, DC21142 oder
DC21143
(`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Asante

-  Cogent EM100FX und EM440TX

-  DEC DE425, DE435, DE450, und DE500

-  SMC Etherpower 8432T, 9332, und 9334

-  ZYNX ZX 3xx

Fast Ethernet Karten mit DEC/Intel 21143
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  DEC DE500

-  Compaq Presario 7900 Familie (die eingebaute Netzwerkkarte)

-  D-Link DFE-570TX

-  Kingston KNE100TX

-  LinkSys EtherFast 10/100 Instant GigaDrive (die eingebaute
   Netzwerkkarte)

Davicom DM9100 und DM9102 PCI Fast Ethernet Karten
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Jaton Corporation XpressNet

Fast Ethernet Karten mit Intel 82557 oder 82559
(`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Intel EtherExpress Pro/100B PCI Fast Ethernet

-  Intel InBusiness 10/100 PCI Netzwerkkarten

-  Intel PRO/100+ Management Adapter

Netzwerkkarten mit 3Com Etherlink XL
(`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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

Ethernet und Fast Ethernet Karten mit 3Com 3XP Typhoon/Sidewinder
(3CR990) Chipsatz
(`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  3Com 3CR990-TX-95

-  3Com 3CR990-TX-97

-  3Com 3CR990B-SRV

-  3Com 3CR990B-TXM

-  3Com 3CR990SVR95

-  3Com 3CR990SVR97

Gigabit Ethernet Karten mit Intel 82542 und 82543 Controllern
(`wx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wx&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__,
`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
und
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber), sowie Karten auf Basis der 82540EM und 82544 Chips?tze (nur
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Intel PRO/1000 Gigabit Ethernet

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Der Treiber
    `wx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wx&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
    sollte nicht mehr verwendet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Der
    `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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
~~~~~~~~~~~~~~~~

DEC DEFPA PCI
(`fpa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fpa&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

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

3.8. Serielle Multi-Port Karten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

AST 4 Port Karte (bei Benutzung eines gemeinsamen IRQs)

Comtrol Rocketport Karte (rp Treiber)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.9. Audio Hardware
~~~~~~~~~~~~~~~~~~~

ESS

-  ES1868, ES1869, ES1879 und ES1888
   (`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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

MSS/WSS kompatible DSPs
(`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

Creative Technologies SoundBlaster Familie
(`sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  SoundBlaster

-  SoundBlaster Pro

-  SoundBlaster AWE-32

-  SoundBlaster AWE-64

-  SoundBlaster AWE-64 GOLD

-  SoundBlaster ViBRA-16

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

FreeBSD unterst?tze viele verschiedene Arten von USB-Ger?ten; in den
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
(`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
and
`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  ALi Aladdin-V

-  AMD-756

-  CMD Tech 670 & 673

-  Intel 82371SB (PIIX3)

-  Intel 82371AB and EB (PIIX4)

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

Hubs

-  Andromeda hub

-  MacAlly self powered hub (4 ports)

-  NEC hub

Tastatur
(`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Apple iMac Tastatur

-  BTC BTC7935 Tastatur mit PS/2 Mausanschlu?

-  Cherry G81-3504 Tastatur

-  Logitech M2452 Tastatur

-  MacAlly iKey Tastatur

-  Microsoft Tastatur

M?use
(`ums(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ums&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
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

-  Trust Ami Maus (3 Tasten)

Drucker und Adapterkabel f?r konventionelle Drucker
(`ulpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ulpt&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  ATen parallel printer Adapter

-  Belkin F5U002 parallel printer Adapter

-  Entrega USB-to-parallel printer Adapter

Massenspeicher
(`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

-  Matshita CF-VFDU03 Diskettenlaufwerk

-  Microtech USB-SCSI-HD 50 USB-auf-SCSI Kabel

-  Panasonic Diskettenlaufwerk

-  Y-E Data Diskettenlaufwerk (720/1.44/2.88Mb)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.12. Diverses
~~~~~~~~~~~~~~

Diskettenlaufwerk
(`fd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fd&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

Tastaturen:

-  AT-Tastaturen

-  PS/2-Tastaturen

-  USB-Tastaturen (genaue Modellbezeichnungen finden Sie im Kapitel `USB
   Ger?te <#USB>`__)

M?use:

-  PS/2 M?use
   (`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
   Treiber)

-  serielle M?use

-  USB M?use (genaue Modellbezeichnungen finden im Kapitel `USB
   Ger?te <#USB>`__)

Parallele Schnittstellen nach \`\`PC-Standard''
(`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

Serielle Schnittstellen nach \`\`PC-Standard'' auf Basis von 8250,
16450, und 16550-Chips
(`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

Diese Datei und andere Dokumente zu dieser Version sind bei
ftp://ftp.FreeBSD.org/pub/FreeBSD/releases\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
