======================================
FreeBSD/ia64 5.0-CURRENT Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/ia64 5.0-CURRENT Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 von The FreeBSD Documentation Project

Copyright © 2002, 2003 von The FreeBSD German Documentation Project

| $FreeBSD: src/release/doc/de\_DE.ISO8859-1/relnotes/common/new.sgml,v
  1.28 2003/01/16 22:41:47 ue Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 5.0-CURRENT enthalten eine ?bersicht ?ber
aktuelle ?nderungen in FreeBSD im Entwicklungszweig 5-CURRENT. Die Liste
umfa?t sowohl die ?nderungen des Kernels als auch ?nderungen der
Benutzerprogramme; dazu kommen alle Sicherheitshinweise, die seit der
letzten Version herausgegeben wurden. Einige kurze Anmerkungen zum Thema
Aktualisierung wurden ebenfalls aufgenommen.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Inhaltsverzeichnis**
1. `Einf?hrung <#INTRO>`__
2. `Neuerungen <#NEW>`__
2.1. `?nderungen im Kernel <#KERNEL>`__
2.1.1. `Unterst?tzung f?r Prozessoren und Mainboards <#AEN410>`__
2.1.2. `?nderungen im Bootloader <#AEN449>`__
2.1.3. `Netzwerke und Netzwerkkarten <#AEN477>`__
2.1.4. `Netzwerk-Protokolle <#AEN746>`__
2.1.5. `Festplatten und Massenspeicher <#AEN923>`__
2.1.6. `Dateisystem <#AEN1171>`__
2.1.7. `Unterst?tzung f?r PCCARD <#AEN1275>`__
2.1.8. `Multimedia <#AEN1296>`__
2.1.9. `Zus?tzliche Software <#AEN1327>`__
2.2. `Sicherheit <#SECURITY>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.3.1. `Zus?tzliche Software <#AEN3934>`__
2.3.2. `Infrastruktur f?r Ports und Packages <#AEN4393>`__
2.4. `Erzeugung von Releases und Integration <#AEN4511>`__
2.5. `Dokumentation <#AEN4535>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
=============

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 5.0-CURRENT auf
IA-64 Systemen. Es beschreibt die Komponenten von FreeBSD, die in
letzter Zeit hinzugef?gt, ge?ndert, oder gel?scht wurden. Au?erdem
erhalten Sie Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Die snapshot Distribution, f?r die diese Release Notes g?ltig sind,
markiert einen Punkt im Entwicklungszweig 5-CURRENT zwischen 4.0-RELEASE
und der zuk?nftigen Version 5.0-RELEASE. Sie k?nnen einige fertige
snapshot Distributionen, die in diesem Entwicklungszweig entstanden
sind, auf http://snapshots.jp.FreeBSD.org/ finden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
=============

In diesem Artikel finden Sie + viele der f?r den Anwender
offensichtlichsten Neuerungen und ?nderungen in FreeBSD seit
4.0-RELEASE. Dazu geh?ren sowohl die ?nderungen, die nur 4.0-RELEASE
betreffen, als auch ?nderungen in den anderen Entwicklungszweigen seit
FreeBSD 4.6-RELEASE. Letztere sind als [MERGED] gekennzeichnet. +

Die Eintr?ge dokumentieren neue Treiber bzw. Unterst?tzung f?r neue
Hardware, neue Befehle oder Optionen, die Behebung wichtiger Fehler, und
Aktualisierungen von Dritt-Software. Sicherheitshinweise, die nach dem
Erscheinen von 4.6-RELEASE herausgegeben wurden, sind ebenfalls
aufgef?hrt.

Viele weiter ?nderungen an FreeBSD sind hier aus Platzgr?nden nicht
aufgef?hrt. Zum Beispiel wurde die Dokumentation verbessert und
korrigiert, kleiner Fehler wurden beseitigt, potentielle
Sicherheitsrisiken im Sourcecode wurden aufgesp?rt und beseitigt, und
der Sourcecode wurde allgemein ?berarbeitet.

.. raw:: html

   <div class="SECT2">

--------------

2.1. ?nderungen im Kernel
-------------------------

`acct(2) <http://www.FreeBSD.org/cgi/man.cgi?query=acct&sektion=2&manpath=FreeBSD+5.0-current>`__
?ffnet die Datei mit den Accounting-Daten jetzt im Modus \`\`Anf?gen'',
damit das Accounting auch in diesem Fall mit
`accton(8) <http://www.FreeBSD.org/cgi/man.cgi?query=accton&sektion=8&manpath=FreeBSD+5.0-current>`__
eingeschaltet werden kann. [MERGED]

Der Kernel wurde um eine von OpenBSD stammende Crypto-Infrastruktur
erg?nzt (siehe
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+5.0-current>`__
und
`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+5.0-current>`__).
Sie stellt dem Kernel eine konsistente Schnittstelle zu Hardware- und
Software-Varianten von Verschl?sselungsalgorithmen zur Verf?gung,
Benutzerprogramme erhalten Zugriff auf Verschl?sselungs-Hardware.
Treiber f?r Karten auf Basis von hifn
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+5.0-current>`__)
und Braodcom
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.0-current>`__)
stehen zur Verf?gung. [MERGED]

Der neue
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+5.0-current>`__
Befehl ``show pcpu`` gibt einen Teil der CPU-spezifischen Daten aus.

Das neue ``devctl`` Interface bietet Benutzerprogrammen die M?glichkeit,
Informationen ?ber neue und entfernte Ger?te zu erhalten. Zur Zeit wird
diese Option haupts?chlich von
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+5.0-current>`__
genutzt.

`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__,
mit dem Eintr?ge im Verzeichnis ``/dev`` automatisch erstellt werden
k?nnen und das die Erkennung neuer Ger?te im laufenden Betrieb erlaubt,
wurde ?berarbeitet.
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__
ist jetzt standardm??ig aktiviert und kann mit der Kernel-Option
``NODEVFS`` abgeschaltet werden. Das Subsystem "rule" (Regel) erlaubt es
dem Administrator, bestimmte Eigenschaften von neuen devfs festzulegen,
bevor Sie f?r Benutzerprogramme sichtbar werden. Dabei werden sowohl
statische (wie z.B. ``/dev/speaker``) als auch dynamische (z.B.
``/dev/bpf*``, einige Wechselmedien) Nodes unterst?tzt. Jedes
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__
kann ein eigenes Regelwerk haben, damit sind spezielle Richtlinien f?r
Dinge wie z.B. jails m?glich. Zur Manipulation der Regeln und Regelwerke
dient das Tool
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8&manpath=FreeBSD+5.0-current>`__.

Der neue Treiber digi wurde hinzugef?gt, um Unterst?tzung f?r PCI
Xr-basierte und ISA Xem Digiboard Karten zu bieten. Der neue Befehl
`digictl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=digictl&sektion=8&manpath=FreeBSD+5.0-current>`__
wird (haupts?chlich) dazu genutzt, um Karten wie die PC/Xem neu zu
initialisieren, nachdem externe Port Module angeschlossen wurden. Dieser
Treiber ersetzt den ?lteren Treiber dgm.

Die neue Systemfunktion
`eaccess(2) <http://www.FreeBSD.org/cgi/man.cgi?query=eaccess&sektion=2&manpath=FreeBSD+5.0-current>`__
arbeitet ?hnlich wie
`access(2) <http://www.FreeBSD.org/cgi/man.cgi?query=access&sektion=2&manpath=FreeBSD+5.0-current>`__,
benutzt aber die effektiven Benutzerrechte statt der wahren
Benutzerrechte.

Jede
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.0-current>`__
Umgebung kann jetzt ihre eigene Sicherheitsstufe besitzen.

Die Sysctl-Variablen f?r
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.0-current>`__
sind von ``jail.*`` nach ``security.*`` verschoben worden. Andere
Sysctl-Variablen, die mit der Sicherheit zusammenh?ngen, sind von
``kern.security.*`` nach ``security.*`` verschoben worden.

Die Umgebungsvariablen des Kernels k?nnen jetzt zur Laufzeit mit dem
System-Call
`kenv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=2&manpath=FreeBSD+5.0-current>`__
ge?ndert werden.

Der Treiber labpc(4) wurde entfernt, da er ?beraltert war
(\`\`bitrot'').

Der Loader und der Kernel Linker suchen nun in jedem Verzeichnis mit
KLDs nach ``linker.hints`` Dateien, um die zu einem Modul-Namen und zu
einer Modul-Version passende KLD-Datei zu erhalten. Die Dateien werden
mit dem neuen Programm
`kldxref(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldxref&sektion=8&manpath=FreeBSD+5.0-current>`__
erzeugt.

FreeBSD enth?lt jetzt die notwendige Infrastruktur f?r Mandatory Access
Controls, das TrustedBSD MAC Framework. Damit k?nnen Kernel-Module
w?hrend der ?bersetzung der Kernels, beim Systemstart oder zur Laufzeit
eingebunden werden, um die Sicherheitsmechanismen des Systems zu
verst?rken. Das Infrastruktur erlaubt Modulen, sich f?r verschiedenen
Ereignisse anzumelden, au?erdem stellt es Standardfunktionen wie
\`\`Label Storage'' zur Verf?gung. Eine Reihe von Standard-Modulen wird
mitgeliefert, z.B. Implementierungen der Modelle \`\`fixed label Biba
integrity'' und \`\`floating label Biba integrity'', mehrstufige
Sicherheitsmodelle (Multi-Level Security, MLS) mit gegenseitiger
Abschottung, sowie diverse verbesserte UNIX Sicherheitsmodelle,
inklusive eines Firewalls f?r das Dateisystem. Die Infrastruktur
vereinfacht die Entwicklung privater und kommerzieller
Sicherheitserweiterungen. Um diesen modularen Dienst zu aktivieren, mu?
in der Konfigurationsdatei f?r den angepa?ten Kernel die Zeile
``options MAC`` stehen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Infrastruktur f?r die Mandatory Access Controls
    ist experimenteller Natur und daher standardm??ig deaktiviert.

.. raw:: html

   </div>

Die Machine Check Architecture (MCA)-Daten werden jetzt beim Systemstart
gesammelt und k?nnen ?ber die sysctl-Variablen ``hw.mca.*`` ausgelesen
werden.

Es gibt jetzt Routinen zum Profiling von
`mutex(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mutex&sektion=9&manpath=FreeBSD+5.0-current>`__,
die mit der Option ``MUTEX_PROFILING`` in der Konfigurationsdatei des
Kernels aktiviert werden k?nnen. Damit stehen dann die neuen
Sysctl-Variablen ``debug.mutex.prof.*`` zur Verf?gung.

Die Kernel-Option ``P1003_1B`` wurde nicht mehr verwendet und daher
entfernt.

`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+5.0-current>`__
wurde ?berarbeitet und nutzt jetzt den **Yarrow** Algorithmus. Es
sammelt Entropie aus einer Vielzahl von Quellen, dazu geh?ren die
Konsole, Massenspeicher und Ethernet sowie Punkt-zu-Punkt
Netzwerkverbindungen. Entropie aus
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+5.0-current>`__
wird regelm??ig in Dateien im Verzeichnis ``/var/db/entropy``
gespeichert, diese Dateien werden auch aktualisiert, wenn das System
heruntergefahren wird. Die Semantik von ``/dev/random`` wurde ge?ndert;
wenn nicht gen?gund Entropie vorhanden ist, blockiert es nicht mehr,
sondern generiert Pseudo-Zufallszahlen und verh?lt sich damit genau so
wie ``/dev/urandom``.

Die neue Kernel-Option ``options           REGRESSION`` aktiviert
Schnittstellen und Routinen, die f?r die Verwendung bei formalen Tests
vorgesehen sind.

Mit dem neuen Ressource-Limit ``RLIMIT_VMEM`` kann die maximale Gr??e
des von einem Prozess verwendeten virtuellen Speichers begrenzt werden,
davon ist auch via
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+5.0-current>`__
angeforderter Speicher betroffen. Das Limit kann in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
mit der neuen Variable ``vmemoryuse`` konfiguriert werden. [MERGED]

In der Systemfunktion
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+5.0-current>`__
wurde ein Fehler beseitigt, durch den die L?nger des Headers auf die
Dateigr??e angerechnet wurde. [MERGED]

`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt das Einf?gen vom Clipboard via Tastatur, die Funktion
liegt standardm??ig auf **Shift**-**Insert**.

Der neue Treiber uaudio unterst?tzt USB Audio Ger?te. [MERGED]

Der neue Treiber
`ucom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucom&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt USB Modems, serielle Schnittstellen und andere Programme,
die sich wie ein TTY verhalten sollen. Die neuen Treiber
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+5.0-current>`__,
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+5.0-current>`__
und
`uvscom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvscom&sektion=4&manpath=FreeBSD+5.0-current>`__
bauen darauf auf und unterst?tzen die seriellen Adapter von FTDI, den
Prolific PL-2303 bzw. den Slipper U VS-10U. [MERGED]

Bei der Konfiguration des Kernels kann die Option ``UCONSOLE`` nicht
mehr verwendet werden; dadurch wurden einige Sicherheitsl?cken
geschlossen.

Die Kernel-Option ``USER_LDT`` ist ab jetzt standardm??ig aktiviert.

Der neue Treiber
`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt via USB angeschlossene Handspring Visor. [MERGED]

Ein neuer Treiber unterst?tzt den VESA S3 linear framebuffer.

Die Infrastruktur f?r Crash Dumps des Kernels wurde ?berarbeitet, um
neue Plattformen unterst?tzen zu k?nnen; gleichzeitig wurde ein
genereller Fr?hjahrsputz durchgef?hrt. Dadurch hat sich das Format der
Crash Dumps ge?ndert; es ist nicht mehr von der Byte Order der Maschine
abh?ngig.

Extrem gro?e Swap-Partitionen (>67 GB) f?hren nicht mehr zum Absturz des
Systems.

``buildkernel`` erwartet den Namen des zu generierenden Kernels in der
Variablen ``KERNCONF`` und nicht mehr in ``KERNEL``. In einigen F?llen
ist es nicht mehr notwendig, ein ``buildworld`` durchzuf?hren, bevor Sie
``buildkernel`` aufrufen. (Der Aufruf von ``buildworld`` ist immer noch
notwendig bei der Aktualisierung ?ber Versionsgrenzen, nach
Aktualisierung der **binutil** Programme sowie bei neuen Versionen von
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__.)
[MERGED]

Linker sets sind jetzt in sich abgeschlossen; gensetdefs(8) wird nicht
mehr ben?tigt und wurde entfernt.

Environment-Variablen des Kernels (z.B. Tuning-Parameter) k?nnen mit dem
neuen
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__-Schl?sselwort
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__'s
``ENV`` schon bei der Erzeugung des Kernels gesetzt werden.

Wenn die neue Sysctl-Variable ``vm.idlezero_enable`` gesetzt ist, wird
das System freie CPU-Zeit zur Initialisierung von Speicherseiten
verwenden.

Der Scheduler des FreeBSD Kernels unterst?tzt jetzt \`\`Kernel-Scheduled
Entities'' (KSEs), die die parallele Ausf?hrung mehrerer Threads eines
Prozesses unterst?tzen, analog zur normalen Scheduler Activation. Zum
jetztigen Zeitpunkt enth?lt der Kernel die meisten der Routinen, die zur
Unterst?tzung von Threads notwendig sind. Der Kernel Scheduler
unterst?tzt mehrere Threads pro Prozess, allerdings immer nur auf einer
CPU. Weitere Informationen finden Sie in
`kse(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kse&sektion=2&manpath=FreeBSD+5.0-current>`__.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Arbeiten an KSE sind noch nicht abgeschlossen.

.. raw:: html

   </div>

Der Kernel unterst?tzt jetzt mehrere low-level Konsolen, die ?ber das
neue Programm
`conscontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=conscontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
verwaltet werden.

Die Berechnung der Systemlast erfolgt jetzt in leicht unterschiedlichen
Intervallen, um eine Synchronisierung mit periodisch laufenden Prozessen
zu verhindern. [MERGED]

Wenn bei der Erzeugung eines Kernel mit Debug-Informationen (z.B. mit
``makeoptions DEBUG=-g``) auch Module erzeugt werden, werden diese auch
mit Debug-Informationen versehen. Eine Nebenwirkung dieser ?nderung ist,
da? die zusammen mit einem Debug-Kernel erstellten und installierten
Module jetzt mehr Plattenplatz belegen. [MERGED]

Die Routinen, mit denen der Kernel anfordert, nutzen jetzt die
\`\`slab'' Technik, ?hnlich wie bei Solaris. Damit steht eine
SMP-sichere Technik zur Anforderung zur Verf?gung, deren Leistung linear
mit der Anzahl der CPU w?chst. Weiterhin reduziert sie die
Fragmentierung des Speichers.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1. Unterst?tzung f?r Prozessoren und Mainboards
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die SMP-Unterst?tzung wurde weitestgehend ?berarbeitet, dabei wurde
Sourcecode von BSD/OS 5.0 ?bernommen. Eines der wichtigsten Merkmale von
SMPng (\`\`SMP Next Generation'') ist, da? mehrere Prozesse gleichzeitig
den Kernel nutzen k?nnen, ohne auf ``spin locks`` angewiesen zu sein, da
diese die Effizienz eines Multi-Prozessor-Systems massiv beeintr?chtigen
k?nnen. Die Interrupt-Routinen besitzen jetzt einen Kontext, der es
erlaubt, sie anzuhalten; dadurch ist es nicht mehr notwendig, Interrupts
(komplett) abzuschalten.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2. ?nderungen im Bootloader
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Kernel und die Module sind in das Verzeichnis ``/boot/kernel``
verschoben worden, um gleichzeitige ?nderungen an beiden Komponenten
einfacher zu machen. Der Boot Loader wurde aktualisiert, um Probleme
durch die ?nderung zu vermeiden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3. Netzwerke und Netzwerkkarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Treiber
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt Netzwerkkarten auf der Basis der Xircom 3201 und
Conexant LANfinity RS7112 Chips?tze.

Der neue Treiber
`lmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lmc&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt LAN Media Corp WAN Netzwerkkarten auf Basis des DEC
\`\`Tulip'' PCI Fast Ethernet Controller.

Das Ger?t
`stf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stf&sektion=4&manpath=FreeBSD+5.0-current>`__
kann jetzt geklont werden.

Der Treiber
`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt echtes Multicast-Filtering.

Die Dateien f?r Netzwerk-Ger?te werden jetzt automatisch in ``/dev/net``
angelegt und f?r ioctl-Aufrufe f?r die Hardware (nicht Protokoll oder
Routing) genutzt werden. Der ioctl ``SIOCGIFCONF`` darf jetzt auf das
Spezial-Ger?t ``/dev/network`` angewandt werden.

.. code:: PROGRAMLISTING

        options DEVICE_POLLING
        options HZ=1000 # nicht Pflicht, aber dringend empfohlen

Danach kann Polling mit der Sysctl-Variable ``kern.polling.enable``
aktiviert; mit der Sysctl-Variable ``kern.polling.user_frac`` wird der
f?r Benutzerprozesse zur Verf?gung stehende Anteil der CPU-Zeit
eingestellt. Die ersten Ger?te, die Polling unterst?tzen, sind
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.0-current>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.0-current>`__,
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.0-current>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.0-current>`__
und
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.0-current>`__.
Weitere Informationen finden Sie in der Onlinehilfe zu
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.0-current>`__.
[MERGED]

Das Netzwerk-Subsystem unterst?tzt jetzt \`\`Zero copy''. Dieses
Features erm?glicht es, Daten vom Kernel zu Benutzerprogrammen zu
?bertragen, ohne die Daten kopieren zu m?ssen; dadurch wird einer der
schlimmsten Engp?sse f?r Netzwerk-Transfers beseitigt. Die
Sende-Routinen sollten mit fast jeder Netzwerkkarte zusammenarbeiten,
die Empfangs-Routinen unterst?tzen allerdings nur Netzwerkkarten, bei
denen die MTU mindestens so gro? wie eine Speicherseite ist (z.B.
Gigabit Ethernet Karten, die Jumbo Frames unterst?tzen). Weitere
Informationen sind in
`zero\_copy(9) <http://www.FreeBSD.org/cgi/man.cgi?query=zero_copy&sektion=9&manpath=FreeBSD+5.0-current>`__
verf?gbar.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4. Netzwerk-Protokolle
~~~~~~~~~~~~~~~~~~~~~~~~~~

Wird in der Konfigurationsdatei f?r den angepa?ten die Option
``FAST_IPSEC`` verwendet, nutzt IPsec die
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+5.0-current>`__-Infrastruktur
des Kernels, inklusive der Unterst?tzung f?r Hardware-Verschl?sselung.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die gleichzeitige Verwendung von ``FAST_IPSEC`` und
    ``IPSEC`` ist nicht m?glich.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Zur Zeit kann ``FAST_IPSEC`` nicht zusammen mit IPv6
    oder der Option ``INET6`` verwendet werden.

.. raw:: html

   </div>

Der neue Treiber
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt die Encapsulation von IP Paketen mt GRE (RFC 1701) und die
minimale IP Encapsulation f?r Mobile IP (RFC 2004). [MERGED]

Die Erzeugung von ICMP ECHO und TSTAMP Antworten kann jetzt beschr?nkt
werden. Die den Beschr?nkungen f?r die Erzeugung von TCP RST Paketen
wird jetzt unterschieden, ob das ausl?sende Paket an einen offenen oder
einen geschlossen Port geschickt wurde. F?r jede dieser Einschr?nkungen
gibt es jetzt eine eigene Beschreibung.

F?r weitergeleitete Pakete werden jetzt keine ICMP Source Quench
Nachrichten mehr erzeugt. Mit der Sysctl-Variablen
``net.inet.ip.sendsourcequench`` kann wieder auf das bisherige Verhalten
umgestellt werden.

Auf VLAN Ger?ten funktioniert jetzt IP Multicast, auch andere Fehler in
den VLAN-Routinen wurden beseitigt.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.0-current>`__
wurde komplett ?berarbeitet, die neue Version wird allgemein \`\`IPFW2''
genannt. Sie legt ihre Regeln in variablen Bl?cken im Kernel ab, ?hnlich
wie
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+5.0-current>`__
Anweisungen. Bis auf die neue Option, Regeln mit ``or`` zu kombinieren,
sollten die ?nderungen nicht nach au?en hin (also in
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__)
sichtbar sein. [MERGED]

Die neue Netgraph Node
`ng\_device(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_device&sektion=4&manpath=FreeBSD+5.0-current>`__
erzeugt einen Eintrag in ``/dev``, der als Startpunkt eines
Netgraph-Baums genutzt werden kann.

Die beiden neuen Netgraph Nodes
`ng\_gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_gif&sektion=4&manpath=FreeBSD+5.0-current>`__
und
`ng\_gif\_demux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_gif_demux&sektion=4&manpath=FreeBSD+5.0-current>`__
k?nnen f?r
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+5.0-current>`__
Ger?te verwendet werden.

Mit der neuen Netgraph Node
`ng\_ip\_input(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ip_input&sektion=4&manpath=FreeBSD+5.0-current>`__
k?nnen IP Pakete direkt an den ``main IP input processing code``
?bergeben werden.

Die neue Netgraph Node
`ng\_l2tp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2tp&sektion=4&manpath=FreeBSD+5.0-current>`__
implementiert das Encapsulation Layer des L2TP Protokolls, wie in RFC
2661 beschrieben. [MERGED]

Mit der neuen Netgraph Node ng\_split kann ein bidirektionaler Datenflu?
in zwei unidirektionale Datenfl?sse aufgespalten werden.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Auf stark besch?ftigten Maschinen kann es durch die
    gr??eren Puffer notwendig werden, den Parameter ``NMBCLUSTERS``
    entweder in der Konfigurationsdatei des Kernels oder ?ber den Loader
    Tuneable ``kern.ipc.nmbclusters`` zu erh?hen. Der Zustand der mbuf
    cluster kann mit ``netstat -mb`` ?berwacht werden.

.. raw:: html

   </div>

Die \`\`ephemeral port range'' f?r TCP und UDP liegt jetzt bei
49152-65535 (der alte Standardwert war 1024-5000). Dadurch erh?ht sich
die Anzahl der gleichzeitig m?glichen ausgehenden Verbindungen.

Der Timeout, nach dessen Ablauf
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.0-current>`__
ein Paket erneut versendet, kann jetzt mit den beiden sysctl-Variablen
``net.inet.tcp.rexmit_min`` und ``net.inet.tcp.rexmit_slop`` eingestellt
werden. Der Standardwert wurde von einer Sekunde auf 200 Millisekunden
gesenkt (?hnlich dem Default bei Linux), um besser auf Aussetzer bei
interaktiven Verbindungen und Ausf?lle bei unzuverl?ssigen schnellen
Verbindungen (drahtlose Netzwerke) reagieren zu k?nnen.

Das
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.0-current>`__
Protokoll ist jetzt in der Lage, die Anzahl der ausstehenden Pakete
dynamisch anzupassen, um die Bandbreite der Verbindung optimal
auszunutzen und die Verz?gerungen zu minimieren. Diese Routinen werden
mit der Sysctl-Variable ``net.inet.tcp.inflight_enable`` aktiviert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5. Festplatten und Massenspeicher
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
kann jetzt im Zusammenarbeit mit
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
schreibend auf Medien in DVD+RW Laufwerken zugreifen.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
erlaubt es jetzt, ?ber die CAM-Schicht und -Treiber
(`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-current>`__,
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+5.0-current>`__,
`st(4) <http://www.FreeBSD.org/cgi/man.cgi?query=st&sektion=4&manpath=FreeBSD+5.0-current>`__
und
`pass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pass&sektion=4&manpath=FreeBSD+5.0-current>`__)
auf ATA Ger?te zuzugreifen, und emuliert so SCSI-Ger?te. Um diese
M?glichkeit nutzen zu k?nnen, mu? in der Konfigurationsdatei f?r den
Kernel die Anweisung ``device atapicam`` stehen. Weitergehende
Informationen finden Sie in
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4&manpath=FreeBSD+5.0-current>`__.
[MERGED]

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Sil 0680 und VIA 8233/8235 Controller. [MERGED]

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt auch die Acard ATP850, ATP860 und ATP865 Controller.

Der Treiber
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt wie schon
`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.0-current>`__
die ioctls ``CDRIOCREADSPEED`` und ``CDRIOCWRITESPEED``, mit der die
Geschwindigkeit eines CD-ROM Laufwerkes eingestellt werden kann.

Der Treiber
`targ(4) <http://www.FreeBSD.org/cgi/man.cgi?query=targ&sektion=4&manpath=FreeBSD+5.0-current>`__
wurde ?berarbeitet; ``/usr/share/examples/scsi_target`` wurde um einen
neuen Modus erweitert, in dem ein \`\`direct access'' Ger?t emuliert
wird.

Der Treiber f?r die Diskettenlaufwerke
(`fdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdc&sektion=4&manpath=FreeBSD+5.0-current>`__)
wurde in vielen Punkten verbessert. Die Schreibdichte wird jetzt bei
h?ufig verwendeten Formaten automatisch gesetzt; au?erdem ist der
Treiber viel flexibler geworden, was die Auswahl der Schreibdichte
angeht.

Mit
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.0-current>`__
stehen neue M?glichkeiten zur Bearbeitung von Festplattenzugriffen zur
Verf?gung; das neue und erweiterbare System stellt diverse Methoden zur
Verf?gung, um Anforderungen f?r Festplattenzugriffe auf dem Weg vom
Kernel zu den eigentlichen Treibern zu manipulieren.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Wenn GEOM im Kernel aktiviert ist, werden
    \`\`compatability slices'' nicht mehr unterst?tzt. Diese wurden nur
    auf i386 und pc98 unterst?tzt und erlaubten es, im Namen eines
    Dateisystems die Angabe der MBR-Partition wegzulassen (also z.B.
    ``/dev/ad0a``); der Kernel suchte dann automatisch die erste
    FreeBSD-Partition und f?llte den Namen auf. Nutzt der Kernel GEOM
    (was inzwischen die Standardeinstellung ist), unterst?tzt er nur
    noch die vollen Namen (also z.B. ``/dev/ad0s1a``), wenn
    MBR-Partitionen benutzt werden. Diese ?nderung sollte allerdings nur
    wenige Anwender betreffen.

.. raw:: html

   </div>

Das neue Modul \`\`GEOM Based Disk Encryption'' erm?glicht die
Verschl?sselung des Festplatteninhaltes, um Zugriffe auf \`\`kalte''
Festplatten zu verhindern. Das Modul nutzt vier verschiedene
Verschl?sselungstechniken und erlaubt die Nutzung von bis zu vier
Kennw?rtern. Weitere Informationen finden Sie in der Onlinehilfe zu
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4&manpath=FreeBSD+5.0-current>`__.
Zur Verwaltung und Steuerung des Moduls dient das neue Hilfsprogramm
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8&manpath=FreeBSD+5.0-current>`__.
Im Standardsystem ist die Verschl?sselung der Festplatten nicht
aktiviert; um dieses Feature nutzen zu k?nnen, mu? in der
Konfigurationsdatei f?r den angepa?ten Kernel die Zeile
``options GEOM_BDE`` stehen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Das Modul ist noch im Experimentalstadium.

.. raw:: html

   </div>

Der Treiber
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
sucht jetzt aktiv nach ?nderungen in der Topologie des Fibre Channel.

Der Treiber
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt auf Qlogic SCSI Karten (inklusive der Ultra2, Ultra 3, und
Dual Bus Karten) den target mode.

Die Funktionalit?t von
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4&manpath=FreeBSD+5.0-current>`__
wurde in
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+5.0-current>`__
(memory disk) aufgenommen.
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+5.0-current>`__
Ger?te k?nnen jetzt mit
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
konfiguriert werden.
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4&manpath=FreeBSD+5.0-current>`__
und das Memory Filesystem (MFS) wurden entfernt.

Der von NetBSD stammende Treiber RAIDframe wurde importiert. Er stellt
u.a. Software-RAID Level 0, 1, 4 und 5 zur Verf?gung. Weitere
Informationen finden Sie in der Onlinehilfe
`raid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=raid&sektion=4&manpath=FreeBSD+5.0-current>`__.
Zur Steuerung des Treiber und zur Verwaltung der RAIDs dient das neue
Hilfsprogramm
`raidctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=raidctl&sektion=8&manpath=FreeBSD+5.0-current>`__.
Der Treiber ist nicht im Standardkernel enthalten; um ihn einzubinden,
mu? in der Konfigurationsdatei f?r den angepa?ten Kernel die Zeile
``device raidframe`` stehen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Dieses Modul befindet sich noch im
    Experimentalstadium.

.. raw:: html

   </div>

Diverse Fehler in
`sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4&manpath=FreeBSD+5.0-current>`__
wurden behoben, u.a. der \`\`tape drive spinning indefinitely upon
`mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1&manpath=FreeBSD+5.0-current>`__
``stat``'' Effekt.

Der Konfigurationsparameter ``SCSI_DELAY`` kann jetzt beim Systemstart
bzw. zur Laufzeit mit der Loader-Variablen bzw. dem Sysctl
``kern.cam.scsi_delay`` ge?ndert werden.

Der neue Treiber
`trm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=trm&sektion=4&manpath=FreeBSD+5.0-current>`__
unterst?tzt SCSI-Kontroller auf Basis des Tekram TRM-S1040 SCSI
Chipsatzes. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6. Dateisystem
~~~~~~~~~~~~~~~~~~

Der FreeBSD Kernel unterst?tzt jetzt ``named extended attributes``.
Damit k?nnen der Kernel und Benutzerprogramme mit entsprechenden
Privilegien mit Attribut-Daten versehen. Damit wird das TrustedBSD
Project unterst?tzt, speziell ACLs, capability data und mandatory access
control labels. Weitere Informationen finden Sie in
``/usr/src/sys/ufs/ufs/README.extattr``.

FFS unterst?tzt jetzt die Erzeugung von ``filesystem snapshots``.
Genauere Informationen finden Sie in
``/usr/src/sys/ufs/ffs/README.snapshot``.

`statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2&manpath=FreeBSD+5.0-current>`__
und
`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.0-current>`__
halten nach, wie viele Bl?cke und Dateien noch freigegeben werden
m?ssen, wenn Sie mit Soft Updates zusammen laufen.

Das ISO-9660 Dateisystem unterst?tzt jetzt nachladbare Routinen zur
Zeichensatzkonvertierung. Einige h?ufig ben?tigte Varianten sind im Port
```sysutils/cd9660_unicode`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/cd9660_unicode/pkg-descr>`__
zu finden. [MERGED]

`kernfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=kernfs&sektion=5&manpath=FreeBSD+5.0-current>`__
war ?beraltert und wurde entfernt.

Client-seitige NFS locks wurden implementiert.

Der Quellcode f?r den Kernel-Teil des NFS-Servers und des NFS-Client war
stark ineinander verzahnt. Diese Verzahnung wurde aufgehoben, um die
Wartung und Weiterentwicklung zu vereinfachen.

Im Dateisystem werden jetzt Access Control Lists (ACLs) unterst?tzt,
damit kann der Zugriff auf Dateien und Verzeichnisse genauer geregelt
werden. Die Routinen stammen vom TrustedBSD Project, weitere
Informationen finden Sie in ``/usr/src/sys/ufs/ufs/README.acls``.

Die Dateisysteme fdesc, fifo, null, msdos, portal, umap und union wurden
in fdescfs, fifofs, msdosfs, nullfs, portalfs, umapfs und unionfs
umbenannt, um einheitliche Namen zu haben. Diese ?nderung betrifft auch
die Module und mount\_\* Befehle. Zus?tzliche Routinen in
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.0-current>`__
(compatibility \`\`glue'') sorgen daf?r, da?
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+5.0-current>`__-Eintr?ge
mit dem Schl?sselwort ``msdos`` weiterhin funktionieren.

Mit pseudofs steht ein neues Grundger?st f?r Pseudo-Dateisysteme zur
Verf?gung.
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+5.0-current>`__
und
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__
wurden ge?ndert und nutzen jetzt pseudofs.

Wenn in ``/etc/fstab`` Eintr?ge f?r netzwerk-basierte Dateisysteme
vorhanden sind, werden diese jetzt beim Systemstart korrekt behandelt,
die Dateisysteme werden erst gemountet, nachdem das Netzwerk komplett
initialisiert wurde.

Das Universal Disk Format (UDF) wird jetzt f?r lesenden Zugriff
unterst?tzt. Dieses Format wird auf Packet-Written CD-RWs und den
meisten kommerziellen DVD-Videos verwendet. Diese Medien k?nnen mit
`mount\_udf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_udf&sektion=8&manpath=FreeBSD+5.0-current>`__
gemountet werden.

Eine erste Version des UFS2 Dateisystems steht jetzt zur Verf?gung.
Einige der Neuerungen in UFS2 sind:

-  Die Gr??e eines inode wurde auf 256 Byte erh?ht, um gen?gend Platz
   f?r 64 Bit lange Blockadressen zu haben.

-  Das Datum der Erstellung einer Datei wird jetzt aufgezeichnet.

-  Unterst?tzung f?r erweiterte Attribute ist ein integraler Bestandteil
   des Dateisystems und erlaubt die Speicherung von erweiterten
   Attributen direkt im Inode, daf?r steht im Inode Speicherplatz in der
   doppelten Gr??e eines Blocks im Dateisystem bereit. Dieser
   Speicherplatz wird f?r Access Lists und MAC Labels genutzt, kann aber
   auch von anderen Systemerweiterungen und Benutzerprogrammen genutzt
   werden.

UFS1 bleibt das Standardformat, es ist allerdings m?glich, bei
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
und im Bildschirm \`\`Partitioning'' von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
UFS2 als Option anzugeben. Alle 64-Bit Plattformen k?nnen auch von UFS2
Dateisystemen booten.

Der UFS1 Superblock mu?te leicht ge?ndert werden, um die diversen in
diesem Abschnitt erw?hnten ?nderungen unterst?tzen zu k?nnen. Dadurch
kann es zu leichten Kompatibilit?tsproblemen kommen, wenn eine a?ltere
FreeBSD-Version (vor 4.7-RELEASE) versucht,
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.0-current>`__
oder
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
auf ein UFS1 Dateisystem anzuwenden, das von FreeBSD ab 5.0-CURRENT
erzeugt wurde, beginnend mit FreeBSD 4.7-RELEASE sind die Formate
kompatibel. Dieses Problem tritt nur auf Systemen auf, auf denen mehrere
FreeBSD-Versionen installiert sind, die abwechselnd gestartet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7. Unterst?tzung f?r PCCARD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Standard-Kernel nutzt jetzt standardm??ig NEWCARD f?r
PCCARD/CardBus.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8. Multimedia
~~~~~~~~~~~~~~~~~

F?r Soundkarten mit Hardware zur Lautst?rkeregelung steht eine neue
Programmierschnittstelle zur Verf?gung.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die vom Boot Loader genutzte Forth Inspired Command Language (**FICL**)
wurde auf Version 3.02 aktualisiert.

Der von vielen Herstellern unterst?tzte Standard Advanced Configuration
und Power Interface wird jetzt unterst?tzt. Die Routinen stammen vom
**Intel ACPI Component Architecture** Projekt, und sind auf dem Stand
des 20021118 Snapshots. In einigen Punkten wird die Funktionalit?t des
alten Standard APM unterst?tzt, damit alte Applikationen weiterverwendet
werden k?nnen.

.. raw:: html

   <div class="SECT4">

--------------

2.1.9.1. IPFilter
^^^^^^^^^^^^^^^^^

**IPFilter** wurde auf Version 3.4.29 aktualisiert. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.1.9.3. KAME
^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. Sicherheit
---------------

Im Resolver existierte ein Buffer-?berlauf, der von einem entsprechend
programmierten Domain Name Server oder durch passende DNS-Anfragen eines
Angreifers ausgenutzt werden konnte, dieser Fehler wurde entfernt.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:28 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:28.resolv.asc>`__.
[MERGED]

In
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+5.0-current>`__
wurde ein Buffer Overflow beseitigt, der durch defekte NFS-Pakete
ausgenutzt werden konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:29 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:29.tcpdump.asc>`__.
[MERGED]

Es ist nicht mehr m?glich,
`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+5.0-current>`__
zur Verfolgung des Ablaufs von Prozessen zu benutzen, wenn diese vorher
priveligiert waren. Falls ein Prozess sensitive Informationen erhalten
hat, bevor er die Privilegien abgegeben hat, k?nnen diese nicht mehr an
die Au?enwelt gelangen. Weitere Informationen finden Sie in
`FreeBSD-SA-02:30 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:30.ktrace.asc>`__.
[MERGED]

In
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+5.0-current>`__
existierte eine Race Condition, durch die es m?glich war, die
Berechtigungen einer beliebigen Datei zu ?ndern, dieser Fehler wurde
korrigiert. Weitere Informationen finden Sie in
`FreeBSD-SA-02:32 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:32.pppd.asc>`__.
[MERGED]

In **OpenSSL** wurden mehrere Buffer Overflows gefunden, die Fehler
wurden durch ein Update der von FreeBSD verwendeten Version von
**OpenSSL** beseitigt. Weitere Informationen finden Sie in
`FreeBSD-SA-02:33 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:33.openssl.asc>`__.
[MERGED]

Ein Buffer Overflow im Heap des XDR Decoders wurde beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:34 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:34.rpc.asc>`__.
[MERGED]

Ein Fehler, durch den ein Benutzer beliebige Bl?cke auf einem
FFS-Dateisystem lesen und schreiben konnte, wurde beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:35 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:35.ffs.asc>`__.
[MERGED]

Im NFS Server wurde ein Fehler beseitigt, durch den es m?glich war, ?ber
das Netzwerk einen Denial-of-Service Angriff durchzuf?hren. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:36 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:36.nfs.asc>`__.
[MERGED]

Im
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+5.0-current>`__
System wurde ein Fehler beseitigt, durch den ein lokaler Benutzer einen
Systemabsturz herbeif?hren konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:37 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:37.kqueue.asc>`__.
[MERGED]

Bei mehrere Systemfunktionen wurden Fehler bei der Pr?fung der Parameter
beseitigt, durch die gr??ere Teile des Kernel-Speichers an den Aufrufer
zur?ckgegeben werden konnten. Weitere Informationen finden Sie in
`FreeBSD-SA-02:38 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:38.signed-error.asc>`__.
[MERGED]

In ``libkvm`` wurde ein Fehler beseitigt, durch den Applikationen
ungewollt sch?tzenswerte Datei-Handles nach au?en weiterleiten konnten.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:39 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:39.libkvm.asc>`__
[MERGED]

In kadmind(8) und k5admin wurden Puffer-?berl?ufe beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:40 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:40.kadmind.asc>`__.
[MERGED]

In
`smrsh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=smrsh&sektion=8&manpath=FreeBSD+5.0-current>`__
wurden Fehler beseitigt, durch die es einem Benutzer m?glich gewesen
w?re, die Einschr?nkung auf bestimmte Programme zu umgehen. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:41 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:41.smrsh.asc>`__
[MERGED]

In
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+5.0-current>`__
wurden Puffer-?berl?ufe beseitigt, die zu Programm-Fehlern f?hren
konnten. Weitere Informationen finden Sie in
`FreeBSD-SA-02:42 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:42.resolv.asc>`__.
[MERGED]

Diverse kritische Fehler in **BIND** wurden korrigiert, weitere
Informationen finden Sie in
`FreeBSD-SA-02:43 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:43.bind.asc>`__.
[MERGED]

In der Systemfunktion
`fpathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fpathconf&sektion=2&manpath=FreeBSD+5.0-current>`__
wurde ein Fehler (Verlust von Datei-Handles) beseitigt, durch den ein
lokaler Benutzer das System zum Absturz bringen oder h?here Privilegien
erhalten konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:44 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:44.filedesc.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
----------------------

Die Unterst?tzung f?r ausf?hrbare Programme im Format
`a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5&manpath=FreeBSD+5.0-current>`__
wurde aus dem Compiler und den zugeh?rigen Programmen entfernt.

`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+5.0-current>`__
und
`rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8&manpath=FreeBSD+5.0-current>`__
sind jetzt
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
Skripte und nicht mehr Perl Skripte.

`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+5.0-current>`__
kennzeichnet FDDI- bzw. ATM-Interfaces jetzt mit ``[fddi]`` bzw.
``[atm]``.

Mit dem neuen Programm
`asa(1) <http://www.FreeBSD.org/cgi/man.cgi?query=asa&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen FORTRAN Steuerzeichen interpretiert werden.

`at(1) <http://www.FreeBSD.org/cgi/man.cgi?query=at&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Optionen ``-r`` zum Entfernen von Auftr?gen und
``-t`` f?r Zeitangaben im POSIX-Format.

Die vom System genutzte
`awk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=awk&sektion=1&manpath=FreeBSD+5.0-current>`__-Variante
ist jetzt auf allen Plattformen **BWK awk**.

`basename(1) <http://www.FreeBSD.org/cgi/man.cgi?query=basename&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Optionen ``-a`` und ``-s``, um die Funktion
`basename(3) <http://www.FreeBSD.org/cgi/man.cgi?query=basename&sektion=3&manpath=FreeBSD+5.0-current>`__
auf mehrere Dateien anzuwenden.

`biff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=biff&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Option ``b`` f?r \`\`bell notification'' beim
Eintreffen von neuen Mails, bei dieser Variante wird der Terminal-Inhalt
nicht zerst?rt, wie das bei ``biff y`` passiert. [MERGED]

`biff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=biff&sektion=1&manpath=FreeBSD+5.0-current>`__
benutzt jetzt das Terminal, das f?r seine Standard-Eingabe,
Standard-Ausgabe, oder Standard-Fehler genutzt wird, und zwar in genau
der Reihenfolge. Damit ist es m?glich, die Ein/Ausgabeumleitung der
Shell zu benutzen (z.B. durch ``biff n < /dev/ttyp1``), um die Ausgabe
auf anderen Terminals umzustellen.

In
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
kann mit dem Parameter ``-d`` der Modus Disk At Once (DAO) aktiviert
werden. [MERGED]

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
kann jetzt VCDs/SVCDs erzeugen. [MERGED]

Bei
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
kann bei ``-s`` jetzt der Wert max angegeben werden, um die maximal
m?gliche Geschwindigkeit zu nutzen. [MERGED]

Die neuen Programme
`bzgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzgrep&sektion=1&manpath=FreeBSD+5.0-current>`__,
`bzegrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzegrep&sektion=1&manpath=FreeBSD+5.0-current>`__
und
`bzfgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzfgrep&sektion=1&manpath=FreeBSD+5.0-current>`__
stellen die von
`grep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=grep&sektion=1&manpath=FreeBSD+5.0-current>`__
bekannte Funktionalit?t f?r mit
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__
erzeugte Archive zur Verf?gung.

Bei
`calendar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=calendar&sektion=1&manpath=FreeBSD+5.0-current>`__
gibt es zwei neue Optionen: ``-W`` verh?lt sich ?hnlich wie ``-A``,
enth?lt aber keine Sonderbehandlung f?r Wochenende; mit ``-F`` kann die
Bedeutung von \`\`Friday'' ge?ndert werden.

`catman(1) <http://www.FreeBSD.org/cgi/man.cgi?query=catman&sektion=1&manpath=FreeBSD+5.0-current>`__
ist jetzt ein C-Programm und kein Perl-Script mehr.

Bei
`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
kann jetzt die Geschwindigkeit des CD-ROM-Zugriffs mit dem Kommando
``speed`` eingestellt werden. Wird der Wert ``max`` angegeben, wird die
h?chste m?gliche Geschwindigkeit verwendet. [MERGED]

Die Standard-Bibliothek ``libc`` wurde um die Funktion
`check\_utility\_compat(3) <http://www.FreeBSD.org/cgi/man.cgi?query=check_utility_compat&sektion=3&manpath=FreeBSD+5.0-current>`__
erweitert. Mit dieser Funktion k?nnen bestimmte Programme im
FreeBSD-Standardsystem feststellen, ob sie den FreeBSD 4-kompatiblen
Modus oder den \`\`Standard''-Modus benutzen sollen; fehlt die Angabe,
wird der Standard-Modus verwendet. Die Konfiguration erfolgt ?hnlich wie
bei
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+5.0-current>`__
?ber eine Environment-Variable oder einen symbolischen Link.

`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1&manpath=FreeBSD+5.0-current>`__
wurde von ``/usr/bin`` nach ``/bin`` verschoben.

`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Option ``-h``, um die Berechtigungen eines
symbolischen Links zu ?ndern.

Wird bei
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1&manpath=FreeBSD+5.0-current>`__
die Option ``-v`` mehr als einmal angegeben, gibt es die alten und neuen
Berechtigungen aus.

Bei
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8&manpath=FreeBSD+5.0-current>`__
ist es nicht mehr m?glich, Benutzer und Gruppe mit ``.`` zu trennen;
dadurch wird es m?glich, Benutzernamen zu verwenden, die einen ``.``
enthalten.

Bei der Verwendung ``CSMG_*`` Makros ist es nicht mehr erforderlich,
``<sys/param.h>`` einzubinden.

Die neue Distribution ``compat4x`` bietet Kompatibilit?t mit FreeBSD
4-STABLE. Sie enth?lt einen Teil der in FreeBSD 4.7-RELEASE enthaltenen
Bibliotheken.

Wird bei
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+5.0-current>`__
die nicht dem Standard entsprechende Option ``-n`` angegeben, fragt es
nicht mehr nach, ob eine Datei ?berschrieben werden soll; die Datei wird
in diesem Fall nicht ?berschrieben. [MERGED]

Das neue Programm
`csplit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csplit&sektion=1&manpath=FreeBSD+5.0-current>`__
kann Dateien nach ihrem Inhalt aufteilen.

`ctags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ctags&sektion=1&manpath=FreeBSD+5.0-current>`__
erzeugt jetzt standardm??ig Labels f?r typedefs, structs, unions und
enums (als ob die Option ``-t`` angegeben w?re). Mit der neuen Option
``-T`` kann auf die alte Verhaltensweise zur?ckgeschaltet werden.

Mit
`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+5.0-current>`__
steht jetzt ein ?ber die Kommandozeile benutzbares Programm zur Nutzung
von
`daemon(3) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=3&manpath=FreeBSD+5.0-current>`__
zur Verf?gung. Das Programm l?st die Verbindung zum kontrollierenden
Terminal und startet dann das auf der Kommandozeile ?bergebene Programm.
Dadurch k?nnen Sie beliebige Programme als Daemon-Proze? laufen lassen.
[MERGED]

Das neue Programm
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+5.0-current>`__
erlabut es, beliebige Programme auszuf?hren, wenn Ger?te hinzugef?gt
oder entfernt werden. Das Programm ist eine allgemeinere Version der
Funktionalit?t von
`pccardd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pccardd&sektion=8&manpath=FreeBSD+5.0-current>`__.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Arbeiten an
    `devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+5.0-current>`__
    sind noch nicht abgeschlossen.

.. raw:: html

   </div>

Mit dem neuen Programm
`devinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devinfo&sektion=8&manpath=FreeBSD+5.0-current>`__
k?nnen Sie die auf dem System vorhandenen Ger?te und die von ihnen
genutzten Ressourcen in einer Baumdarstellung ausgeben lassen.

diskpart(8) wurde entfernt, weil es ?berfl?ssig geworden war.

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Option ``-L``, um aktive UFS und UFS2 Dateisysteme
zuverl?ssiger bearbeiten zu k?nnen. Um ein konsistenten dump-file zu
erhalten, wird zun?chst ein Filesystem Snapshot erzeugt, auf dem
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
dann arbeitet. Wenn der Dump vollst?ndig ist, wird der Snapshot wieder
gel?scht.

Wird bei
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
die neue Option ``-C`` angegeben, wird ein Cache f?r Datenbl?cke der
Festplatte eingerichtet. Dadurch steigt die Performance von
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__,
kann aber dazu f?hren, da? zwischen den einzelnen L?ufen erfolgende
?nderungen des Dateisystems nicht erkannt werden.

Bei Verwendung der neuen Option ``-S`` gibt
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
nur die erwartete Gr??e des Dumps aus und beendet sich dann. [MERGED]

Das Programm
`expr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expr&sektion=1&manpath=FreeBSD+5.0-current>`__
entspricht jetzt POSIX.2-1992 (und damit auch POSIX.1-2001). Einige
Programme sind auf die alte Syntax angewiesen, da sie die Argumente
nicht korrekt markieren; dadurch h?lt
`expr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expr&sektion=1&manpath=FreeBSD+5.0-current>`__
sie f?r Befehlsoptionen (das auff?lligste Beispiel war/ist der von
vielen GNU Programmen genutzt Port bzw. das Package
```devel/libtool`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/libtool/pkg-descr>`__).
Es ist m?glich, f?r
`expr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expr&sektion=1&manpath=FreeBSD+5.0-current>`__
mit einen kompatiblen Modus zu aktivieren, in dem es sich wieder wie die
?lteren Versionen verh?lt; weitere Informationen dazu finden Sie in
`check\_utility\_compat(3) <http://www.FreeBSD.org/cgi/man.cgi?query=check_utility_compat&sektion=3&manpath=FreeBSD+5.0-current>`__.

In
`fbtab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fbtab&sektion=5&manpath=FreeBSD+5.0-current>`__
k?nnen die Zielger?te jetzt auch mit Wildcards angegeben werden, nicht
nur als einzelne Ger?te und Verzeichnisse.

Mit dem Programm
`fdread(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdread&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen Daten direkt von Diskette gelesen werden. Es ist das Gegenst?ck
zu
`fdwrite(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdwrite&sektion=1&manpath=FreeBSD+5.0-current>`__
und soll eine M?glichkeit, Daten wenigstens teilweise von defekten
Medien zu lesen und komplizierte Aufrufe von
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1&manpath=FreeBSD+5.0-current>`__
?berfl?ssig zu machen.

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Datei ``.pubkey``. [MERGED]

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Option ``-g``, mit der nur der Name des Benutzers
aus der GECOS Information ausgegeben wird. [MERGED]

Bei
`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
kann mit den neuen Optionen ``-4`` und ``-6`` eine Adressfamilie f?r
Anfragen ?ber das Netzwerk angegeben werden. [MERGED]

Das Programm
`fold(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fold&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt die Optionen ``-b`` und ``-s`` zum Umbruch an Byte- bzw.
Wortgrenzen. [MERGED]

Bei
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
wurde ein ?bergeordnetes Programm importiert, dadurch wurde die n?tige
Infrastruktur geschaffen, um
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
auf verschiedene Arten von Dateisystemen einsetzen zu k?nnen (analog zu
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.0-current>`__).

Die Art und Weise, wie
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
mit mehreren Durchl?ufen umgeht (Parameter Pass in der ``/etc/fstab``)
wurde an Dateisysteme angepa?t, die auf mehreren Festplatten liegen.

`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
kann die ?berpr?fung jetzt sowohl im Vordergrund (``-F``) als auch im
Hintergrund (``-B``) vornehmen. ?blicherweise wurde
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
aufgerufen, bevor die Dateisystem gemountet wurden und die ?berpr?fungen
wurden zu diesem Zeitpunkt komplett durchgef?hrt. Wenn die ?berpr?fung
im Hintergrund m?glich ist, wird
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
zwei mal aufgerufen. Der erste Aufruf erfolgt, bevor die Dateisysteme
gemountet werden; dabei wird die Option ``-F`` verwendet, um alle
Dateisysteme zu pr?fen, die nicht im Hintergrund gepr?ft werden k?nnen.
Der zweite Aufruf erfolgt, wenn das System komplett gestartet ist;
dieser Aufruf erfolgt mit der Option ``-B`` und pr?ft alle Dateisysteme,
die im Hintergrund gepr?ft werden k?nnen. Im Gegensatz zur Pr?fung im
Vordergrund erfolgt dieser Start asynchron, dadurch kann das System ganz
normal genutzt werden, auch die Dateisystemen, die gerade gepr?ft
werden. Die Option ``background_fsck`` in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
regelt, ob diese M?glichkeit beim Start des Systems benutzt wird.

`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Option ``-B`` zur ?berpr?fung von Dateisystemen im
Hintergrund (dazu m?ssen auf das Dateisystem Soft Updates aktiv sein).
Mit der Option ``-F`` kann angegeben werden, ob eine Pr?fung im
Vordergrund /notwendig ist.

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-m`` aufgerufen, k?nnen G?ste existierende
Dateien ?ndern, falls die Zugriffsrechte entsprechend gesetzt sind. Dies
erm?glicht es G?sten, unterbrochene Uploads fortzusetzen. [MERGED]

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-M`` aufgerufen, k?nnen G?ste keine Verzeichnisse
mehr anlegen. [MERGED]

Bei
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
kann das Kommando ``RETR`` mit den Optionen ``-o`` (f?r alle Nutzer) und
``-O`` (nur f?r G?ste) abgeschaltet werden. Zusammen mit ``-A`` und
angemessenen Zugriffsrechten kann damit ein halbwegs sicherer anonymer
Briefkasten aufgebaut werden. [MERGED]

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-W`` aufgerufen, werden FTP-Logins nicht mehr in
`wtmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmp&sektion=5&manpath=FreeBSD+5.0-current>`__
vermerkt. [MERGED]

Das neue Programm
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
ist ein Hilfsmittel zum Zugriff auf und die Kontrolle des
FireWire-Subsystems. [MERGED]

Mit dem neuen Hilfsprogramm
`getconf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getconf&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen die Werte der in POSIX und X/Open angegebenen Variablen f?r die
Pfad- und Systemkonfiguration ausgegeben werden. [MERGED]

gifconfig(8) ist ?berfl?ssig geworden und wurde entfernt. Die
Funktionalit?t wird von den ``tunnel`` und ``deletetunnel`` Operationen
in
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
bereitgestellt.

`gprof(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gprof&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt \`\`dynamic symbol resolution'' aus dem gerade
genutzten Kernel. Dadurch kann
`gprof(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gprof&sektion=1&manpath=FreeBSD+5.0-current>`__
auch mit entsprechend vorbereiten KLDs eingesetzt werden.

Mit dem neuen Programmen gpt k?nnen EFI GPT Partitionen bearbeitet
werden.

Die Scripte ibcs2(8), linux(8), osf1(8) und svr4(8) dienten nur dazu,
bestimmte Kernel Module f?r die Emulation laden; sie wurden entfernt.
Das Modul-System des Kernels l?dt die entsprechenden Module automatisch
, sobald sie ben?tigt werden.

Bei
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
ist es mit dem neuen Kommando ``promisc`` m?glich, ein Interface in den
Promiscuous Mode zu setzen. [MERGED]

Wird bei
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
die neue Option ``monitor`` angegeben, werden keine Pakete mehr ?ber
diese Schnittstelle gesendet oder empfangen. Damit ist es m?glich, den
Datenverkehr in einem Netzwerk zu ?berwachen, ohne es zu beinflussen.

Beim Start des Systems wird
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
nicht mehr standardm??ig von
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.0-current>`__
gestartet, allerdings bietet
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
bei der Installation die M?glichkeit, dies zu ?ndern. Sie k?nnen
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
ebenfalls aktivieren, wenn Sie die folgende Zeile in die Datei
``/etc/rc.conf`` eintragen:

.. code:: PROGRAMLISTING

        inetd_enable="YES"

Bei
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
ist es jetzt m?glich, die maximale Anzahl simultaner Verbindungen von
einer bestimmten IP-Adresse zu einem Service zu begrenzen. [MERGED]

Mit dem neuen Schl?sselwort ``limit`` ist es m?glich, mit
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
die Anzahl der Verbindungen zwischen zwei Systemen zu begrenzen.
[MERGED]

In den Regel von
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
kann jetzt auch der Wert des IPv4 Feld Precedence als Kriterium genutzt
werden.

`kbdmap(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmap&sektion=1&manpath=FreeBSD+5.0-current>`__
und
`vidfont(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidfont&sektion=1&manpath=FreeBSD+5.0-current>`__
wurden von Perl nach C konvertiert.

Mit
`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen jetzt Umgebungsvariablen des Kernels hinzugef?gt und gel?scht
werden.

Das Programm kget(8) wurde entfernt. Es wurde nur f?r UserConfig
gebraucht und dieses Programm gibt es in FreeBSD 5.0-CURRENT nicht mehr.

Das Programm
`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+5.0-current>`__
versucht nicht mehr, Zombie-Prozesse zu beenden, so lange die Option
``-z`` nicht angegeben wird.

Mit dem neuen Programm
`ktrdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrdump&sektion=8&manpath=FreeBSD+5.0-current>`__
kann der KTR Trace Buffer von Benutzern ausgelesen werden.

Die neue Option ``-a`` f?r
`ldd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ldd&sektion=1&manpath=FreeBSD+5.0-current>`__
f?hrt zur Ausgabe aller Objekte, die f?r das gerade geladene Objekt
gebraucht werden.

``libc`` ist jetzt standardm??ig f?r Threads verwendbar, ``libc_r``
enth?lt nur noch Thread-spezifische Funktionen.

``libstand`` kann jetzt den Inhalt einer Datei auf einem UFS Dateisystem
?berschreiben (es kann Dateien allerdings weder vergr??ern noch
verkleinern, da das Dateisystem inkonsistent sein k?nnte).

``libgmp`` wurde durch ``libmp`` ersetzt.

Die Funktionen in ``libposix1e`` wurden in ``libc`` aufgenommen.

``libusb`` wurde in ``libusbhid`` umbenannt und ?bernimmt damit die von
NetBSD genutzten Namen. [MERGED]

Wird
`lock(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lock&sektion=1&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-v`` aufgerufen, wird zum einen das aktuelle VTY
gesperrt, zum anderen ist es nicht mehr m?glich, auf andere VTYs
umzuschalten, so lange das aktuelle Terminal gesperrt ist. Damit ist es
m?glich, die Konsole von einem einzigen Terminal aus komplett zu
sperren. [MERGED]

`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8&manpath=FreeBSD+5.0-current>`__
wurde verbessert; ``lpc clean`` ist jetzt sicherer und das neue Kommando
``lpc           tclean`` zeigt an, welche Dateien von ``lpc clean``
gel?scht w?rden. ``lpc topq`` wurde v?llig ?berarbeitet und ist jetzt
deutlich flexibler bei der Auswahl der zu verschiebenden Druckauftr?ge
(z.B. Gruppen von Druckauftr?ge, alle Auftr?ge eines bestimmten
Systems). Mit dem neuen Befehl ``lpc bottomq`` k?nnen Druckauftr?ge an
das Ende der Warteschlange verschoben werden; mit dem neuen Befehl
``lpc setstatus`` kann der Status des Druckers ge?ndert werden. [MERGED]

Bei
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+5.0-current>`__
gibt es drei neue Optionen: ``-m`` listet die Dateien auf einer Seite
auf, ``-p`` erzwingt die Ausgabe ``/`` hinter einem Verzeichnisnamen,
und ``-x`` f?hrt dazu, da? die Dateinamen auf einer Seite formatiert
werden. [MERGED]

Wird
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-C``, wechselt es in das angegebene Verzeichnis,
bevor es mit der Arbeit beginnt. [MERGED]

`makewhatis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=makewhatis&sektion=1&manpath=FreeBSD+5.0-current>`__
ist jetzt ein C-Programm und kein Perl-Skript mehr.

`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+5.0-current>`__
wird nicht mehr SUID ``man``, um Sicherheitsprobleme im Zusammenhang mit
der Erzeugung von \`\`catpages'' (vorformatierte Seiten der Onlinehilfe)
zu umgehen. Dadurch kann
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+5.0-current>`__
f?r normale Anwender keine vorformatierten Seiten der Onlinehilfe des
Systems mehr erzeugen. Es ist aber weiterhin in der Lage, Seiten zu
formatieren, wenn der Benutzer Schreibrecht auf das Verzeichnis der
\`\`catpages'' hat (z.B. f?r seine eigenen Seiten) oder wenn es von
``root`` aufgerufen wird.

Mit dem neuen Programm mca k?nen Machine Check Architecture Records
dekodiert werden.

Das neue Kommando
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8&manpath=FreeBSD+5.0-current>`__
ruft
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+5.0-current>`__,
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+5.0-current>`__,
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
und
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.0-current>`__
auf und versteht dabei eine Kommandozeile wie das nicht mehr
unterst?tzte
`mount\_mfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_mfs&sektion=8&manpath=FreeBSD+5.0-current>`__.

`mesg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mesg&sektion=1&manpath=FreeBSD+5.0-current>`__
ist jetzt zum SUSv3 Standard konform. Eine der ?nderungen ist, da? die
Ausgaben jetzt auf dem Terminal erfolgen, das mit seiner
Standard-Eingabe, Standard-Ausgabe, oder Standard-Fehlermeldung (in
dieser Reihenfolge) verbunden ist. Daher ist es jetzt m?glich, den
Schreibzugriff auf andere Terminals mit der Ein/Ausgabeumleitung der
Shell einzustellen (z.B. durch ``mesg n           < /dev/ttyp1``).

`mountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mountd&sektion=8&manpath=FreeBSD+5.0-current>`__
und
`nfsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsd&sektion=8&manpath=FreeBSD+5.0-current>`__
wurden von ``/sbin`` nach ``/usr/sbin`` verschoben.

Wird
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+5.0-current>`__
mit der neuen (nicht standardisierten) Option ``-n`` aufgerufen, wird
bei jede Frage, ob eine Datei ?berschrieben werden soll, immer die
Antwort \`\`no'' angenommen. [MERGED]

Bei
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
kann jetzt mit der neuen Option ``-O`` ausgew?hlt werden, ob ein UFS1
oder UFS2 Dateisystem erzeugt werden soll.

Mit dem neuen Programm
`newgrp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=newgrp&sektion=1&manpath=FreeBSD+5.0-current>`__
kann man zu einer neuer Gruppe wechseln.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.0-current>`__
komprimiert die Logfiles jetzt standardm??ig mit
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__.
Bei Bedarf kann das alte Verhalten (die Komprimierung mit
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.0-current>`__)
in der Datei ``/etc/newsyslog.conf`` konfiguriert werden.

Wird bei
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.0-current>`__
bei einem Eintrag (bzw. einer Gruppe von Eintr?gen, bei denen die Option
``G`` gesetzt ist) die neue Option ``W`` angeben, wird das Programm zur
Kompression des Logfiles erst gestartet, wenn er die vorher gestarteten
Packprogramme durchgelaufen sind. Dadurch soll verhindert werden, da?
Systeme durch die gleichzeitige Kompression mehrerer gro?er Logfiles
?berlastet werden. [MERGED]

Mit den neuen Programm
`nextboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nextboot&sektion=8&manpath=FreeBSD+5.0-current>`__
k?nnen ein alternativer Kernel und/oder andere Einstellung f?r den
Systemstart definiert werden, die beim n?chsten Start des Systems
genutzt werden sollen. Ein ?hnliches Programm gab es bereits einmal in
FreeBSD 2.2.

**NFS** funktioniert jetzt auch mit IPv6.

Bei
`nice(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nice&sektion=1&manpath=FreeBSD+5.0-current>`__
kann man jetzt mit ``-n`` angeben, mit welcher \`\`niceness'' das
aufgerufene Programm laufen soll. [MERGED]

Das von NetBSD verwendete Konzept **nsswitch** wurde ?bernommen. Sobald
die Datei
`nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
angelegt wurde, kann FreeBSD so konfiguriert werden, da? es f?r Zugriffe
auf Daten wie
`passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+5.0-current>`__
und
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5&manpath=FreeBSD+5.0-current>`__
einfache Dateien, NIS oder Hesiod nutzt. Wenn beim Start des Systems die
Datei ``/etc/nsswitch.conf`` noch nicht existiert, wird sie automatisch
aus der vorhandenen ``/etc/host.conf`` erzeugt. Da einige alte Programme
immer noch ``/etc/host.conf`` ben?tigen, wird diese Datei ebenfalls beim
beim Start des Systems automatisch aus den Daten in der
``/etc/nsswitch.conf`` erzeugt.

`od(1) <http://www.FreeBSD.org/cgi/man.cgi?query=od&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Optionen ``-A`` zur Angabe der Basisadresse der
Eingabe, ``-N`` zur Angabe der Anzahl auszugebender Zeichen, ``-j`` zur
Angabe der zu ?berspringenden Zeichen, ``-s`` um vorzeichenbehaftete
Dezimalzahlen auszugeben und ``-t`` zur Festlegung des Ausgabeformates.
[MERGED]

**PAM** wird jetzt f?r die Verwaltung von Benutzer-Accounts und
Sitzungen unterst?tzt.

Zur Konfiguration von **PAM** werden jetzt Dateien in ``/etc/pam.d/``
und nicht mehr nur die eine Datei ``/etc/pam.conf`` genutzt. Weitere
Informationen finden Sie in ``/etc/pam.d/README``.

Das neue PAM-Modul
`pam\_echo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_echo&sektion=8&manpath=FreeBSD+5.0-current>`__
stellt einen Echo-Service zur Verf?gung.

Das neue PAM-Modul
`pam\_exec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_exec&sektion=8&manpath=FreeBSD+5.0-current>`__
stellt einen Service zum Starten von Programmen zur Verf?gung.

Das neue PAM-Modul
`pam\_ftp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ftp&sektion=8&manpath=FreeBSD+5.0-current>`__
kann zur Authentifizierung von anonymen FTP-Zugriffen verwendet werden.

Das neue PAM-Modul
`pam\_ftpusers(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ftpusers&sektion=8&manpath=FreeBSD+5.0-current>`__
nutzt die Datei
`ftpusers(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpusers&sektion=5&manpath=FreeBSD+5.0-current>`__
zur ?berpr?fung.

Das neue PAM-Modul
`pam\_ksu(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ksu&sektion=8&manpath=FreeBSD+5.0-current>`__
stellt Kerberos 5 Authentifizierung sowie Authorisierung via
``$HOME/.k5login`` f?r
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.0-current>`__
zur Verf?gung.

Das neue PAM-Modul
`pam\_lastlog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_lastlog&sektion=8&manpath=FreeBSD+5.0-current>`__
tr?gt die Login-Zeiten in die Datenbanken
`utmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=utmp&sektion=5&manpath=FreeBSD+5.0-current>`__,
`wtmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmp&sektion=5&manpath=FreeBSD+5.0-current>`__,
und
`lastlog(5) <http://www.FreeBSD.org/cgi/man.cgi?query=lastlog&sektion=5&manpath=FreeBSD+5.0-current>`__
ein.

Das neue PAM-Modul
`pam\_login\_access(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_login_access&sektion=8&manpath=FreeBSD+5.0-current>`__
dient zur ?berpr?fung mit Hilfe vpn ``/etc/login.access``.

Mit dem neuen PAM-Modul
`pam\_nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_nologin&sektion=8&manpath=FreeBSD+5.0-current>`__
k?nnen Anmeldungen gesperrt werden, dabei wird
`nologin(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=5&manpath=FreeBSD+5.0-current>`__,
genutzt.

Die neuen PAM-Modul
`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8&manpath=FreeBSD+5.0-current>`__
und
`pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8&manpath=FreeBSD+5.0-current>`__
k?nnen f?r die Zugriffssteuerung via
`opie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=opie&sektion=4&manpath=FreeBSD+5.0-current>`__
genutzt werden. [MERGED]

Das neue PAM-Modul
`pam\_passwdqc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_passwdqc&sektion=8&manpath=FreeBSD+5.0-current>`__
?berpr?ft beim Wechsel des Pa?wortes dessen Qualit?t.

Das neue PAM-Modul
`pam\_rhosts(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rhosts&sektion=8&manpath=FreeBSD+5.0-current>`__
unterst?tzt Authentifizierung via
`rhosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rhosts&sektion=5&manpath=FreeBSD+5.0-current>`__.

Mit dem neuen PAM-Modul
`pam\_rootok(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rootok&sektion=8&manpath=FreeBSD+5.0-current>`__
ist es m?glich, nur den Super-User zu authentifizieren.

Das neue PAM-Modul
`pam\_securetty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_securetty&sektion=8&manpath=FreeBSD+5.0-current>`__
?berpr?ft das \`\`security''-Flag (aus
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5&manpath=FreeBSD+5.0-current>`__)
eines Terminals.

Das neue PAM-Modul
`pam\_self(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_self&sektion=8&manpath=FreeBSD+5.0-current>`__
kann zum Identit?tsnachweis eines Benutzers genutzt werden.

Das neue PAM-Modul
`pam\_wheel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_wheel&sektion=8&manpath=FreeBSD+5.0-current>`__
dient dazu, die Mitglieder einer Gruppe zu authentifizieren,
standardm??ig ist dies ``wheel``.

Mit dem neuen Programm
`pathchk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pathchk&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen Pfadangaben auf ihre G?ltigkeit und Portabilit?t zwischen
POSIX-Systemen gepr?ft werden. [MERGED]

Wird bei
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.0-current>`__
die Option ``-o`` angegeben, wird das Programm sofort beendet, wenn eine
Antwort eintrifft.

prefix(8) ist ?berfl?ssig geworden und wurde entfernt. Die
Funktionalit?t wird von der ``eui64`` Operation in
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
bereitgestellt.

Die Funktionsbibliothek wurde um die von POSIX.1 eingef?hrte Routine
`pselect(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pselect&sektion=3&manpath=FreeBSD+5.0-current>`__
erweitert, damit steht eine etwas st?rkere Variante von
`select(2) <http://www.FreeBSD.org/cgi/man.cgi?query=select&sektion=2&manpath=FreeBSD+5.0-current>`__
zur Verf?gung.

Bei
`pwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pwd&sektion=1&manpath=FreeBSD+5.0-current>`__
kann jetzt mit der Option ``-L`` das logische Arbeitsverzeichnis
ausgegeben werden. [MERGED]

Wird bei
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1&manpath=FreeBSD+5.0-current>`__
die neue Option ``-l`` angegeben, werden die Quotas auf NFS
Dateisystemen nicht ?berpr?ft.

Der von
`rand(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rand&sektion=3&manpath=FreeBSD+5.0-current>`__
zur Verf?gung gestellte Generator f?r Pseudo-Zufallszahlen wurde
verbessert, um bessere Ergebnisse zu liefern.

Bei
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+5.0-current>`__
kann jetzt mit ``-t`` ein Verzeichnis angegeben werden, das statt
``/tftpboot`` genutzt wird. [MERGED]

`rcmd(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rcmd&sektion=3&manpath=FreeBSD+5.0-current>`__
nutzt jetzt die Environment-Variable ``RSH``, um ein anderes Programme
als
`rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1&manpath=FreeBSD+5.0-current>`__
f?r die Ausf?hrung von Programmen auf anderen Systemen nutzen zu k?nnen.
Dadurch k?nnen Programme wie
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
jetzt
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.0-current>`__
als Transportmedium nutzen.

`rdist(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rdist&sektion=1&manpath=FreeBSD+5.0-current>`__
ist nicht mehr Teil des Standardsystems, ist aber noch in der FreeBSD
Ports Collection als
```net/44bsd-rdist`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/44bsd-rdist/pkg-descr>`__
verf?gbar.

Bei
`renice(8) <http://www.FreeBSD.org/cgi/man.cgi?query=renice&sektion=8&manpath=FreeBSD+5.0-current>`__
kann jetzt mit der Option ``-n`` angegeben werden, wie stark die
Priorit?t eines Prozesses angehoben werden soll. [MERGED]

`portmap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portmap&sektion=8&manpath=FreeBSD+5.0-current>`__
wurde durch
`rpcbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcbind&sektion=8&manpath=FreeBSD+5.0-current>`__
ersetzt.

`rpcgen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcgen&sektion=1&manpath=FreeBSD+5.0-current>`__
benutzt jetzt ``/usr/bin/cpp`` (wie bei NetBSD) und nicht mehr
``/usr/libexec/cpp``.

`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+5.0-current>`__
wurde von NetBSD ?bernommen. Dieser Daemon unterst?tzt von Clients
gesetzte Locks auf NFS Dateisystemen.

Wenn die Environment-Variable ``LD_TRACE_LOADED_OBJECTS_ALL`` definiert
ist, gibt
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+5.0-current>`__
jetzt die Namen aller Objekte aus, f?r die ein Objekt geladen wurde.

Bei
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+5.0-current>`__
kann jetzt die Option ``-i`` angegeben werden, um Dateien direkt zu
?ndern. [MERGED]

Mit den neuen Programmen
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1&manpath=FreeBSD+5.0-current>`__
und
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen Sie Access Control Listen f?r Dateisysteme bearbeiten.

Der Befehl ``printf`` ist kein Bestandteil von
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
mehr, da der Platz f?r andere Zwecke besser gebraucht werden kann. Die
Funktionalit?t steht aber durch das externe Programm
`printf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=1&manpath=FreeBSD+5.0-current>`__
immer noch zur Verf?gung.

Wird bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
die neue Option ``-C`` verwendet, k?nnen existierende Dateien nicht mehr
durch Ein-/Ausgabeumleitung ?berschrieben werden; die neue Option ``-u``
erzeugt eine Fehlermeldung, wenn eine nicht gesetzte Variable expandiert
werden soll. [MERGED]

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt das interne Kommando ``cd`` jetzt die Optionen ``-L`` und
``-P`` zur Aktivierung des logischen bzw. physikalischen Modus.
Standardm??ig ist der logische Modus aktiviert, dieser Default kann mit
der internen Variable ``physical`` ge?ndert werden. [MERGED]

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt das interne Kommando ``jobs`` jetzt die beiden Optionen
``-s`` (gibt nur die PID aus) und ``-l`` (gibt die PID zus?tzlich aus).
[MERGED]

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
kann jetzt mit dem internen Kommando ``bind`` die Tastaturbelegung des
internen Editors ge?ndert werden.

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzen die internen Kommandos ``export`` und ``readonly`` jetzt
die Option ``-p``, mit denen ihre Ausgaben auf ein \`\`portables''
Format umgestellt werden. [MERGED]

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
ist nicht mehr m?glich, illegale Ausdr?cke f?r ``command`` & &&
``command``, ``&& command`` oder ``|| command`` zu verwenden. [MERGED]

`spkrtest(8) <http://www.FreeBSD.org/cgi/man.cgi?query=spkrtest&sektion=8&manpath=FreeBSD+5.0-current>`__
ist jetzt ein
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
Skript und kein Perl Skript mehr.

Bei
`split(1) <http://www.FreeBSD.org/cgi/man.cgi?query=split&sektion=1&manpath=FreeBSD+5.0-current>`__
kann mit der neuen Option ``-a`` festgelegt werden, wie viele Zeichen
f?r die Extension der Teile verwendet werden sollen. [MERGED]

Um die in SUSv2/POSIX festgelegten Standards f?r ``<sys/select.h>`` in
Zukunft erf?llen zu k?nnen, wurde ``struct selinfo`` und die
dazugeh?rigen Funktionen nach ``<sys/selinfo.h>`` verschoben.

`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.0-current>`__
nutzt jetzt **PAM** zur Authentifizierung von Benutzern.

Mit dem neuen Programm
`swapoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapoff&sektion=8&manpath=FreeBSD+5.0-current>`__
ist m?glich, Swapping und Paging auf einem Ger?ten abzuschalten. Das
ebenfalls neue Kommando
`swapctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapctl&sektion=8&manpath=FreeBSD+5.0-current>`__
stellt die von den anderen BSDs bekannte Benutzer-Interface f?r
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8&manpath=FreeBSD+5.0-current>`__
und
`swapoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapoff&sektion=8&manpath=FreeBSD+5.0-current>`__
zur Verf?gung.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Das Programm
    `swapoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapoff&sektion=8&manpath=FreeBSD+5.0-current>`__
    ist noch im Versuchsstadium.

.. raw:: html

   </div>

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+5.0-current>`__
zeigt jetzt die Beschreibungen der Variablen an, wenn die neue Option
``-d`` verwendet wird.

Die von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
standardm??ig angelegte Root-Partition ist auf i386- und pc98-Systemen
jetzt 100 MByte und auf Alpha-Systemen 120 MByte gro?.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
liegt jetzt in ``/usr/sbin``, dadurch wird die Installation einfacher.
Die Onlinehilfe f?r
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
wird jetzt auch in den standardm??ig verwendeten Verzeichnissen
abgelegt.

Bei neu installierten Systeme aktiviert
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
das
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__
Dateisystemen standardm??ig nicht mehr, um die Sicherheit des System zu
erh?hen. Es ist allerdings weiterhin m?glich,
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__
manuell oder ?ber eine entsprechende Zeile in
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+5.0-current>`__
zu aktivieren.

Wird
`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-ifstat`` aufgerufen, zeigt es den Datenflu? auf
den aktiven Netzwerk-Interfaces des Systems.

Mit dem neuen Programm
`tabs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tabs&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen die Positionen der Tabulatorspr?nge eines Terminals definiert
werden.

In der
`termcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=termcap&sektion=5&manpath=FreeBSD+5.0-current>`__
Datenbank wird f?r den Typ ``xterm`` jetzt der bei **XFree86**
mitgelieferte Eintrag genutzt. Dadurch unterst?tzt
`xterm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xterm&sektion=1&manpath=XFree86+4.2.0>`__
jetzt standardm??ig Farben und es ist nicht mehr notwendig, ``TERM`` auf
den Wert ``xterm-color`` zu setzen. Die weitere Verwendung des
Terminal-Typs ``xterm-color`` kann dazu f?hren, da? einige Anwendungen
(gutgemeinte) Warnungen ausgeben.

`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt RFC 2349 (TFTP Timeout Interval und Transfer Size
Options). Dieses Merkmal wird von einigen Firmware-Versionen wie z.B.
dem EFI Boot manager (zumindestens dem der HP i2000 Itanium Server)
ben?tigt, um ein Image mit **TFTP** zu booten.

Eine Version des Transport Independent RPC (**TI-RPC**) wurde
importiert.

`tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1&manpath=FreeBSD+5.0-current>`__
wurde um die von **OpenBSD** vorgenommenen Erweiterungen erg?nzt und
kann jetzt als Ersatz f?r
`cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1&manpath=FreeBSD+5.0-current>`__
dienen.

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.0-current>`__
nutzt jetzt die komplette Breite des Bildschirms aus.

Wird
`touch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=touch&sektion=1&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-h`` aufgerufen, bearbeitet es einen symbolischen
Link und nicht das Objekt, auf das der Link zeigt.

`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+5.0-current>`__
hat jetzt minimalen Support f?r die Listen ?quivalenter Zeichen, sofern
die jeweilige Locale diese Listen bereitstellt. [MERGED]

Wird bei
`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+5.0-current>`__
die neue Option ``-C`` angegeben, wird die Menge der im ersten Argument
?bergebenen Zeichen aufgef?llt.

Bei
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+5.0-current>`__
k?nnen mit den neuen Optionen ``-a`` und ``-l`` auf UFS-Dateisystemen
die Einstellungen ``FS_ACLS`` bzw. ``FS_MULTILABEL`` aktiviert und
deaktiviert werden.

Mit dem neuen Programm
`ugidfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ugidfw&sektion=8&manpath=FreeBSD+5.0-current>`__
kann das Regelwerk f?r die Mandatory Access Control Policy
``mac_bsdextended`` manipuliert werden, analog zu
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__.

**UUCP** wurde aus dem Basissystem entfernt und steht jetzt nur noch als
```net/freebsd-uucp`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/freebsd-uucp/pkg-descr>`__
in der Ports-Collection zur Verf?gung.

Bei
`unexpand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unexpand&sektion=1&manpath=FreeBSD+5.0-current>`__
k?nnen die Tabulatorpositionen mit der neuen Option ``-t`` angegeben
werden, ?hnlich wie bei
`expand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expand&sektion=1&manpath=FreeBSD+5.0-current>`__.
[MERGED]

Mit der neuen Option ``-d`` zeigt
`usbdevs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdevs&sektion=8&manpath=FreeBSD+5.0-current>`__
jetzt die f?r die Ger?te verwendeten Treiber an.

Die Base64-Unterst?tzung von
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1&manpath=FreeBSD+5.0-current>`__
und
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+5.0-current>`__
wird jetzt automatisch aktiviert, wenn die Programme als
`b64encode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64encode&sektion=1&manpath=FreeBSD+5.0-current>`__
bzw.
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+5.0-current>`__
aufgerufen werden. [MERGED]

Die Standard-Bibliothek ``libc`` wurde um Funktionen zur Erzeugung und
Manipulation von OSF/DCE 1.1-kompatiblen UUIDs erweitert. Weitergehende
Informationen finden Sie in in
`uuid(3) <http://www.FreeBSD.org/cgi/man.cgi?query=uuid&sektion=3&manpath=FreeBSD+5.0-current>`__

Das neue Hilfsprogramm
`uuidgen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuidgen&sektion=1&manpath=FreeBSD+5.0-current>`__
nutzt den System Call
`uuidgen(2) <http://www.FreeBSD.org/cgi/man.cgi?query=uuidgen&sektion=2&manpath=FreeBSD+5.0-current>`__,
um einen oder mehrere \`\`Universally Unique Identifiers'' erzeugen, die
zu OSF/DCE 1.1 version 1 UUIDs kompatibel sind.

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Option ``-S``, um das Umschalten zwischen
verschiedenen VTYs zu verhindern. [MERGED]

Die von
`vinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=8&manpath=FreeBSD+5.0-current>`__
standardm??ig verwendete Stripe Gr??e wurde von 256 KByte auf 279 KByte
erh?ht, damit sich die Superblocks besser auf die Stripes verteilen.

Bei
`wc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=wc&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die neue Option ``-m``, um die Gr??e in Zeichen (und
nicht wie ?blich Byte) zu bestimmen.

`whereis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whereis&sektion=1&manpath=FreeBSD+5.0-current>`__
war fr?her ein Perl-Skript und wurde in C neu geschrieben. Es wurde um
die Optionen ``-x`` zur Vermeidung des
`locate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locate&sektion=1&manpath=FreeBSD+5.0-current>`__-Aufrufs
und ``-q`` zur Unterdr?ckung der ?berschrift ?ber der Anfrage erweitert.

Wird
`whereis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whereis&sektion=1&manpath=FreeBSD+5.0-current>`__
mit der neuen Option ``-a`` aufgerufen, zeigt es alle Treffer und nicht
nur den ersten jeden Typs.

`which(1) <http://www.FreeBSD.org/cgi/man.cgi?query=which&sektion=1&manpath=FreeBSD+5.0-current>`__
ist jetzt ein C-Programm und kein Perlscript mehr.

Bei
`who(1) <http://www.FreeBSD.org/cgi/man.cgi?query=who&sektion=1&manpath=FreeBSD+5.0-current>`__
stehen mehrere neue Optionen zur Verf?gung: ``-H`` erzeugt
?berschriften; ``-T`` zeigt die Einstellung f?r
`mesg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mesg&sektion=1&manpath=FreeBSD+5.0-current>`__;
``-m`` bewirkt die gleiche Ausgabe wie ``am i``; ``-u`` zeigt an, wie
lange der Benutzer unt?tig war; ``-q`` zeigt die Namen in Spalten an.
[MERGED]

Bei
`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
kann jetzt im Modus ``hostap`` mit ``-l`` die Liste der assozierten
Stationen ausgegeben werden; mit ``-L`` werden alle verf?gbaren Access
Points aufgelistet.

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die Option ``-I``\ ``replstr``, die es dem Benutzer
erlaubt,
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
die von stdin gelesen Daten an einen bestimmten Punkt der Kommandozeile
einf?gen zu lassen. Die FreeBSD-spezifische Variante ``-J`` hat eine
?hnliche Wirkung. [MERGED]

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die neue Option ``-L``, um den Start des aufzurufenden
Programmes nach einer Anzahl Zeilen zu erzwingen. [MERGED]

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
unterst?tzt jetzt die neue Option ``-P``, um mehrere Versionen des
gleichen Programmes parallel ausf?hren zu lassen.

Mehrere Routinen in der C-Bibliothek unterst?tzen jetzt auch \`\`wide
characters''. Dazu geh?ren die Routinen zur Bestimmung des Typs eines
Zeichens wie
`wctype(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wctype&sektion=3&manpath=FreeBSD+5.0-current>`__;
die Routinen zur Ein- und Ausgabe dieser Zeichens wie
`getwc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getwc&sektion=3&manpath=FreeBSD+5.0-current>`__;
die Routinen f?r formatierte Ein-/Ausgabe wie
`wprintf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wprintf&sektion=3&manpath=FreeBSD+5.0-current>`__
und
`wscanf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wscanf&sektion=3&manpath=FreeBSD+5.0-current>`__.
Routinen zur Umwandlung in mehrere Byte gro?e Zeichen stehen ebenfalls
zur Verf?gung, siehe
`multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3&manpath=FreeBSD+5.0-current>`__.

Bei vielen Seiten der Onlinehilfe wurde das Aussehen und der Inhalt
korrigiert und verbessert, dieser Proze? ist aber noch lange nicht
abgeschlossen. [MERGED]

Die meisten traditionellen BSD-Spiele wurden aus dem Standardsystem
entfernt und sind jetzt nur noch ?ber den Port
```games/freebsd-games`` <http://www.FreeBSD.org/cgi/url.cgi?ports/games/freebsd-games/pkg-descr>`__
verf?gbar. Betroffen sind die folgenden Spiele: adventure(6),
arithmetic(6), atc(6), backgammon(6), battlestar(6), bs(6), canfield(6),
cribbage(6), fish(6), hack(6), hangman(6), larn(6), mille(6),
phantasia(6), piano(6), pig(6), quiz(6), rain(6), robots(6), rogue(6),
sail(6), snake(6), trek(6), wargames(6), worm(6), worms(6), wump(6).
dm(8) diente zur Steuerung des Zugriffes auf diese Spiele und wurde
ebenfalls entfernt. Die \`\`n?tzlichen'' Spiele und
`fortune(6) <http://www.FreeBSD.org/cgi/man.cgi?query=fortune&sektion=6&manpath=FreeBSD+5.0-current>`__,
verbleiben im System.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~

**am-utils** wurde auf Version 6.0.7. aktualisiert.

Ein vom 13. Dezember 2002 stammender Snapshot der **awk**-Variante von
Bell Labs (unter den Bezeichnungen \`\`BWK awk'' und \`\`Der Einzig
Wahre AWK'' bekannt) wurde in das Basissystem aufgenommen. Es steht auf
allen Plattformen als ``awk`` und ``nawk`` zur Verf?gung.

**BIND** wurde auf Version 8.3.3 aktualisiert. [MERGED]

**Binutils** wurden auf eine Vorversion von 2.13.2 mit Stand 27. Oktober
2002 aktualisiert.

Alle Anwendungen aus dem **bzip2** Paket sind jetzt im Basissystem
verf?gbar (dies betrifft speziell ``bzip2recover``, das jetzt erzeugt
und installiert wird).

**file** wurde auf Version 3.39 aktualisiert.

**gcc** steht jetzt in der Version 3.2.1 zur Verf?gung.

.. raw:: html

   <div class="WARNING">

    **Warnung:** Das C++ ABI von **gcc** 3.2.\ ``X`` ist inkompatibel zu
    dem fr?herer Versionen.

.. raw:: html

   </div>

**gdb** steht jetzt in der Version 5.2.1 zur Verf?gung.

**gperf** wurde auf Version 2.7.2 aktualisiert.

**groff** und die dazugeh?rigen Programme wurden auf die FSF-Version
1.18.1 aktualisiert.

**Heimdal Kerberos** wurde auf Version 0.5.1 aktualisiert. [MERGED]

Der **ISC DHCP** Client wurde auf Version 3.0.1RC11 aktualisiert.

Das Programm
`more(1) <http://www.FreeBSD.org/cgi/man.cgi?query=more&sektion=1&manpath=FreeBSD+5.0-current>`__
wurde durch
`less(1) <http://www.FreeBSD.org/cgi/man.cgi?query=less&sektion=1&manpath=FreeBSD+5.0-current>`__
ersetzt, es ist aber m?glich, es als ``more`` aufzurufen. [MERGED] Die
Version 371 von **less** wurde importiert.

Mit ``libbsdxml`` steht jetzt im Basissystem eine Bibliothek zur
Bearbeitung von XML-Dokumenten zur Verf?gung; damit sollen XML-nutzende
Programme im Basissystem unterst?tzt werden. Sie basiert fast
ausschlie?lich auf einem Import von **expat** 1.95.5, erhielt aber einen
anderen Namen, um Konflikte mit anderen Versionen von **expat**
auszuschlie?en, wenn diese ?ber die Ports Collection installiert werden.

**libpcap** wurde auf Version 0.7.1 aktualisiert. [MERGED]

**libreadline** wurde auf Version 4.2 aktualisiert.

**libz** wurde auf Version 1.1.4 aktualisiert.

**lint** wurde durch den von NetBSD am 19. Juli 2002 verwendeten
`lint(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lint&sektion=1&manpath=FreeBSD+5.0-current>`__
aktualisiert.

**lukemftp** 1.6 beta 2 (der FTP Client aus NetBSD) hat das von FreeBSD
genutzte Programm
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+5.0-current>`__
ersetzt. Zu den neuen Eigenschaften geh?ren weitergehende M?glichkeiten
der Automatisierung, bessere Einhaltung von Standards, Begrenzung der
Transferrate, und die Anpassung der Eingabeaufforderung. Einige
Environment-Variablen und Optionen f?r die Kommandozeile haben sich
ebenfalls ge?ndert.

Die von OpenBSD am 26. April 2002 genutzte Version von
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1&manpath=FreeBSD+5.0-current>`__
wurde importiert. [MERGED]

**ncurses** wurde auf Version 5.2-20020615 aktualisiert.

Die diversen **NTP** Programme wurden auf Version 4.1.1b aktualisiert.

**OpenPAM** (\`\`Daffodil'' Release) wird jetzt statt **Linux-PAM**
verwendet.

Die Programmsammlung **OPIE** (einmal verwendbare Pa?w?rter) wurde auf
Version 2.4 aktualisiert. Sie hat **S/Key** vollst?ndig ersetzt.
[MERGED]

**Perl** wurde aus dem FreeBSD Basissystem entfernt. Es ist weiterhin
m?glich, die Version aus der FreeBSD Ports Collection, das bin?re
Package oder ?ber den Punkt Perl distribution im Men? Distributionen von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
zu installieren. Durch diesen Schritt wird es in Zukunft deutlich
einfacher sein, neue Perl-Versionen zu importieren und Verbesserungen
einzubringen. Um das Basisystems von Perl-Abh?ngigkeiten zu befreien,
wurden viele in Perl geschriebene Utilities durch C-Programme und
Shellskripte ersetzt (f?r jedes dieser Utilities existiert ein eigener
Eintrag in den Release Notes).

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Arbeiten zur Entfernung aller Perl-Skripte sind
    noch nicht abgeschlossen.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die meisten der in
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
    verf?gbaren Distributionen enthalten die neue Perl Distribution.
    Diese ?nderung wird daher f?r die meisten User transparent sein, sie
    m?ssen lediglich Perl separat aktualisieren.

.. raw:: html

   </div>

**GNU ptx** wurde aus dem Basissystem entfernt, da es von keinem Teil
des Basissystem genutzt wird und schon seit l?ngerer Zeit weder
aktualisiert noch gepflegt wird. Das Programm ist aber weiterhin ?ber
den Port
```textproc/textutils`` <http://www.FreeBSD.org/cgi/url.cgi?ports/textproc/textutils/pkg-descr>`__
verf?gbar.

Der ``rc.d`` Mechanismus wurde von NetBSD ?bernommen. Dabei werden die
Aktionen beim Systemstart auf viele kleine, \`\`aufgabenorientierte''
Scripts im Verzeichnis ``/etc/rc.d`` verteilt; die Aufrufreihenfolge
wird dynamisch beim Start des System ermittelt.

**GNU sort** wurde aktualisiert, die neue Version stammt aus den **GNU
textutils 2.0.21**.

Die **NetBSD**-Version von
`stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1&manpath=FreeBSD+5.0-current>`__
wurde auf dem Stand von 5. Juni 2002 importiert.

**GNU tar** wurde auf Version 1.13.25. aktualisiert. [MERGED]

**tcpdump** wurde auf Version 3.7.1 aktualisiert. [MERGED]

Die
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+5.0-current>`__
Shell wurde durch
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+5.0-current>`__
ersetzt, die aber auch als ``csh`` aufgerufen werden kann. **tcsh**
wurde auf Version 6.12 aktualisiert. [MERGED]

Die zur Verf?gung gestellte Version der **tcp\_wrappers** enth?lt jetzt
das Hilfsprogramm
`tcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpd&sektion=8&manpath=FreeBSD+5.0-current>`__.
Dieser wird zwar von einer FreeBSD Standardinstallation nicht ben?tigt,
da
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
diese Funktionalit?t bereits enth?lt; er kann aber f?r
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__-Alternativen
wie z.B. **xinetd** n?tzlich sein. [MERGED]

**texinfo** wurde auf Version 4.2 aktualisiert. [MERGED]

**top** wurde auf Version 3.5b12 aktualisiert. [MERGED]

**traceroute** wurde auf die LBL-Version 1.4a12 aktualisiert.

Der Standardwert f?r die von
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+5.0-current>`__
benutzte TTL wird jetzt von der Sysctl-Variablen ``net.inet.ip.ttl``
definiert. [MERGED]

Die Datenbank der Zeitzonen wurde auf Version ``tzdata2002d``
aktualisiert. [MERGED]

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.1. CVS
^^^^^^^^^^^^

**cvs** ist jetzt in der Zwischenversion 1.11.2.1 mit Stand 1. Dezember
2002 verf?gbar. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.2. CVSup
^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.3. KAME
^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.4. OpenSSH
^^^^^^^^^^^^^^^^

**OpenSSH** wurde auf Version 3.4p1 aktualisiert. [MERGED] Die
wichtigsten ?nderungen:

-  Die ``*2`` Dateien werden nicht mehr ben?tigt (zum Beispiel kann
   ``~/.ssh/known_hosts`` jetzt den Inhalt von ``~/.ssh/known_hosts2``
   enthalten).

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+5.0-current>`__
   kann Schl?ssel jetzt im SECSH Public Key File Format importieren und
   exportieren, um Schl?ssel mit diversen kommerziellen SSH-Version
   auszutauschen.

-  `ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1&manpath=FreeBSD+5.0-current>`__
   wertet jetzt alle drei Standardschl?ssel aus.

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+5.0-current>`__
   verwendet keinen Standardardtyp mehr, der Typ der Schl?ssels mu? mit
   der Option ``-t`` angegeben werden.

-  Das neue Feature \`\`privilege separation'' nutzt unprivilegierte
   Prozesse, um die Auswirkungen von Sicherheitsl?cken und
   Programmierfehlern einzuschr?nken und zu begrenzen.

-  Die Behebung diverser Fehler, dazu geh?rt eine Sicherheitsl?cke, die
   zu einem Integer-?berlauf und dadurch zu einer nicht gew?nschten
   Vererbung von Privilegien f?hren konnte.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.5. OpenSSL
^^^^^^^^^^^^^^^^

**OpenSSL** wurde auf Version 0.9.6g aktualisiert. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.6. sendmail
^^^^^^^^^^^^^^^^^

**sendmail** wurde von Version 8.9.3 auf Version 8.12.6 aktualisiert.
Einige der wichtigen ?nderungen sind:
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.0-current>`__
wird nicht mehr SUID ``root`` Programm installiert (jetzt SGID
``smmsp``); neue Stanard-Pfade (siehe
``/usr/src/contrib/sendmail/cf/README``);
`newaliases(1) <http://www.FreeBSD.org/cgi/man.cgi?query=newaliases&sektion=1&manpath=FreeBSD+5.0-current>`__
darf nur noch von ``root`` und vertrauensw?rdigen Benutzer gestartet
werden; STARTTLS Verschl?sselung; der MSA Port (587) ist standardm??ig
aktiviert. Weitere Informationen sind in
``/usr/src/contrib/sendmail/RELEASE_NOTES`` verf?gbar. [MERGED]

.. code:: PROGRAMLISTING

        define(`confDEF_USER_ID', `daemon')

Beim Start des System wird **sendmail** nicht mehr standardm??ig von
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.0-current>`__
gestartet, um ankommende SMTP Verbindungen anzunehmen. Diese Einstellung
kann von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
je nach gew?hltem Sicherheitsprofil ?berschrieben werden. Alternativ
k?nnen Sie auch die folgenden Zeile in die Datei ``/etc/rc.conf``
eintragen:

.. code:: PROGRAMLISTING

        sendmail_enable="YES"

Wenn die von **sendmail** verwendeten Datenbanken alias und map mit
``/etc/mail/Makefile`` erzeugt werden, werden die Zugriffsrechte jetzt
standardm??ig auf 0640 gesetzt, um einen Denial-of-Service Angriff
mittels File Locking durch lokale Benutzer zu verhindern. Die
Zugriffsrechte k?nnen in ``make.conf`` mit der neuen Option
``SENDMAIL_MAP_PERMS`` ge?ndert werden. [MERGED]

Die Zugriffsrechte f?r ``/var/log/sendmail.st``, die Datei mit den
**sendmail**-Statistiken, wurden von 0644 auf 0640 ge?ndert, um einen
Denial-of-Service Angriff mittels File Locking durch lokale Benutzer zu
verhindern. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2. Infrastruktur f?r Ports und Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Durch eine neue Sammlung von Modulen mit dem Namen **BSDPAN** wird
**Perl** besser in die FreeBSD Ports Collection eingebunden.

Sowohl FreeBSD 5.0-CURRENT als auch einige 4.X-Versionen enthielten das
Programm pkg\_update(1), mit dem man installierte Packages und die von
ihnen ben?tigten Packages aktualisieren konnte. Dieses Programm wurde
entfernt, da mit dem Package
```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__
eine deutlich leistungsst?rkere Variante zur Verf?gung steht.

`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.0-current>`__
war fr?her ein Perl Skript und wurde jetzt in C neu geschrieben. Die oft
falsch eingesetzte Option ``-c`` wurde entfernt. Der Port
```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__
bietet eine unterst?tzte und sichere Alternative f?r die Aktualisierung
der installierten Ports/Packages.

Die Infrastruktur f?r die Ports Collection benutzt jetzt standardm??ig
**XFree86** 4.2.1, um Abh?ngigkeiten zu erf?llen. Wenn Sie weiterhin
**XFree86** 3.3.6 verwenden wollen, m?ssen die folgende Zeile in die
Datei ``/etc/make.conf`` eintragen: [MERGED]

.. code:: PROGRAMLISTING

        XFREE86_VERSION=3

Die im Package
```emulators/linux_base`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
enthaltenen Bibliotheken f?r die Linux Emulation entsprechen jetzt den
Bibliotheken von **Red Hat Linux** 7.1. [MERGED]

Die von der Ports Collection erzeugten bzw. die auf den FTP-Servern
bereitliegenden Pakete werden jetzt mit
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__
statt
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.0-current>`__
gepackt. Aus diesem Grund enden die Dateinamen jetzt mit ``.tbz`` statt
``.tgz``. Die diversen Tools f?r die Arbeit mit Packages wurden f?r das
neue Format aktualisiert.

Die Ports Collection verwendet jetzt eine separate ?bersicht
(``/usr/ports/INDEX-5``), die von FreeBSD 5-CURRENT genutzt wird. Der
Hauptgrund f?r die ?nderung war das Problem, da? Pakete in FreeBSD
5-CURRENT Abh?ngigkeiten haben, die sie in FreeBSD 4-STABLE nicht haben
(wie z.B.
```lang/perl5`` <http://www.FreeBSD.org/cgi/url.cgi?ports/lang/perl5/pkg-descr>`__).
Die jeweils aktuelle Indexdatei hei?t allerdings weiterhin ``INDEX``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Erzeugung von Releases und Integration
-------------------------------------------

Die Distribution ``bin`` wurde in ``base`` umbenannt, dadurch wird es
einfach, kombinierte Installations- und Reparaturmedien zu erzeugen.

Es ist jetzt m?glich, eine Release von FreeBSD 5-CURRENT auf einem
FreeBSD 4-STABLE System zu erzeugen. Es ist auch m?glich, Releases f?r
eine andere Architektur als die des Host-Systems zu erzeugen. Details
finden Sie in
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7&manpath=FreeBSD+5.0-current>`__.
[MERGED]

Die Disketten-Version wurde um eine dritte Diskette mit dem Namen
``drivers.flp``. Sie enth?lt nachladbare Kernel-Module f?r Treiber, die
nicht in der Kernel auf der ``kern.flp`` Diskette oder auf das
``mfsroot.flp`` Image passen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5. Dokumentation
------------------

Eine Reihe von Dokumenten aus den \`\`4.4 BSD Programmer's Supplementary
Documents'' unterliegen nicht mehr dem Copyright und stehen daher ab
sofort wieder in ``/usr/share/doc/psd`` zur Verf?gung. Dazu geh?ren:

-  *The UNIX Time-Sharing System* (``01.cacm``)

-  *UNIX Implementation* (``02.implement``)

-  *The UNIX I/O System* (``03.iosys``)

-  *UNIX Programming -- Second Edition* (``04.uprog``)

-  *The C Programming Language -- Reference Manual* (``06.Clang``)

-  *Yacc: Yet Another Compiler-Compiler* (``15.yacc``)

-  *Lex -- A Lexical Analyzer Generator* (``16.lex``)

-  *The M4 Macro Processor* (``17.m4``)

Eine Reihe von Dokumenten aus den \`\`4.4 BSD Users's Supplementary
Documents'' unterliegen nicht mehr dem Copyright und stehen daher ab
sofort wieder in ``/usr/share/doc/usd`` zur Verf?gung. Dazu geh?ren:

-  *NROFF/TROFF User's Manual* (``21.troff``)

-  *A TROFF Tutorial* (``22.trofftut``)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktualisierung einer ?lteren Version von FreeBSD
===================================================

Anwender, die schon ein FreeBSD-System im Einsatz haben, sollten *auf
jeden Fall* die \`\`Hinweise f?r die ersten Anwender von FreeBSD 5.0''
lesen. Dieses Dokument ist auf den Distributionen in der Regel in der
Datei ``EARLY.TXT`` verf?gbar; ansonsten sollte es ?berall dort
verf?gbar sein, wo auch die anderen Dokumente der Release Notes
verf?gbar sind. Das Dokument enth?lt einige Tipps f?r die
Aktualisierung; viel wichtiger ist aber die Analyse der beiden Optionen
Wechsel zu FreeBSD 5.\ ``X`` bzw Weitere Verwendung von FreeBSD
4.\ ``X``.

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Sie sollten vor der Aktualisierung von FreeBSD auf
    jeden Fall Sicherheitskopien *aller* Daten und Konfigurationsdateien
    anlegen.

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
