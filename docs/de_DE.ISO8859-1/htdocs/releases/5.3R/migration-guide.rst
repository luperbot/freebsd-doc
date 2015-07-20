=======================================
FreeBSD 5.3-RELEASE Migrationsleitfaden
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.3-RELEASE Migrationsleitfaden
=======================================

.. raw:: html

   <div class="AUTHORGROUP">

The FreeBSD Release Engineering Team
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

Copyright © 2002, 2003, 2004 The FreeBSD Release Engineering Team

| $FreeBSD$

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD ist ein eingetragenes Warenzeichen von Wind River Systems, Inc.
Dies soll sich bald ?ndern.

Apple, FireWire, Mac, Macintosh, Mac OS, Quicktime und TrueType sind
eingetragene Warenzeichen von Apple Computer, Inc., in den Vereinigten
Staaten und anderen L?ndern.

IBM, AIX, EtherJet, Netfinity, OS/2, PowerPC, PS/2, S/390 und ThinPad
sind Warenzeichen der International Business Machines Corporation in den
Vereinigten Staaten, anderen L?ndern oder beiden.

IEEE, POSIX und 802 sind eingetragene Warenzeichen vom Institute of
Electrical and Electronics Engineers, Inc. in den Vereinigten Staaten.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium und Xeon sind
Warenzeichen oder eingetragene Warenzeichen der Intel Corporation oder
ihrer Gesellschaften in den Vereinigten Staaten und in anderen L?ndern.

Microsoft, FrontPage, MS-DOS, Outlook, Windows, Windows Media und
Windows NT sind entweder eingetragene Warenzeichen oder Warenzeichen der
Microsoft Corporation in den Vereinigten Staaten und/oder in anderen
L?ndern.

Sparc, Sparc64, SPARCEngine und UltraSPARC sind Warenzeichen von SPARC
International, Inc in den Vereinigten Staaten und in anderen L?ndern.
Produkte, die das Warenzeichen SPARC tragen, basieren auf einer von Sun
Microsystems, Inc. entwickelten Architektur.

Viele Produktbezeichnungen von Herstellern und Verk?ufern sind
Warenzeichen. Soweit dem FreeBSD Project das Warenzeichen bekannt ist,
werden die in diesem Dokument vorkommenden Bezeichnungen mit dem Symbol
\`\`™'' oder dem Symbol \`\`®'' gekennzeichnet.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Dieser Leitfaden beschreibt die wesentlichen Unterschiede zwischen
FreeBSD 4.X und FreeBSD 5.3-RELEASE aus Sicht eines Benutzers oder
Administrators, der ein existierendes System aktualisiert. Der Leitfaden
beschreibt kurz die vor und w?hrend einer Ver?ffentlichung ablaufenden
Prozesse. Danach beschreibt er die neuen Funktionen in FreeBSD 5.X sowie
?nderungen, die relevant f?r Benutzer sind, die bisher mit 4.X Releases
gearbeitet haben. Weiterhin beschreibt der Leitfaden wie existierende
Systeme mit Hilfe der Quellen oder mit Hilfe von Bin?rcode migriert
werden. Dieses Dokument erschien vor FreeBSD 5.X unter dem Titel
\`\`Hinweise f?r die ersten Anwender von FreeBSD 5.3-RELEASE''.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Mit FreeBSD 5.3-RELEASE startet eine neue Serie von \`\`FreeBSD-STABLE''
Releases. Diese Release und k?nftige Releases der 5.X-Serie sind wie die
vorhergehenden 4.X-Releases f?r den produktiven Einsatz gedacht.

Dieser Artikel wendet sich an Benutzer, die von 4.X-Release auf
5.3-RELEASE migrieren. Zuerst wird beschrieben, wie eine neue
FreeBSD-Version ver?ffentlicht wird. Anschlie?end werden einige der
neuen Funktionen in FreeBSD 5.X beschrieben. Der wahrscheinlich
wichtigste Abschnitt beschreibt die wesentlichen ?nderungen, f?r
Benutzer sichtbare ?nderungen oder ?nderungen an externen
Schnittstellen. Zuletzt gibt der Artikel Hinweise, wie bestehende
FreeBSD 4.X-Systeme mit Bin?rcode oder mit den Quellen auf
FreeBSD 5.3-RELEASE migriert werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Ver?ffentlichung neuer FreeBSD-Versionen
-------------------------------------------

Das Prinzip der FreeBSD-Entwicklung ist die Verwendung mehrerer
Entwicklungszweige innerhalb eines \`\`CVS Repository''. Der Hauptzweig
wird \`\`CURRENT'' genannt und innerhalb des Repository mit dem
symbolischen Namen HEAD referenziert. Neue Funktionen werden zun?chst in
diesen Zweig eingebracht. Auch wenn neue Funktionen zuerst nur in
CURRENT zur Verf?gung stehen, bereitet dieser Zweig von Zeit zu Zeit
Kummer, w?hrend die Neuerungen getestet und ihre Fehler entfernt werden.

Wenn eine neue FreeBSD-Version ver?ffentlicht wird, basiert diese in der
Regel auf einem der \`\`STABLE'' (stabil) genannten Entwicklungszweige.
Neuerungen werden in diese Entwicklungszweige ?bernommen, nachdem sie in
CURRENT getestet wurden. In den letzten zwei Jahren gab es nur einen
aktiven STABLE-Entwicklungszweig: \`\`4-STABLE''; dieser Zweig war die
Grundlage f?r alle 4.X Versionen. Dieser Zweig wird innerhalb des CVS
Repository durch den symbolischen Namen RELENG\_4 gekennzeichnet.

Die letzten beiden STABLE-Entwicklungszweige (3-STABLE und 4-STABLE)
wurden sehr fr?h im Entwicklungsablauf (verzweigt wurde bei 3.1 und 4.0)
erzeugt. R?ckblickend m?ssen wir feststellen, da? dadurch in beiden
F?llen nicht genug Zeit war, um CURRENT zu stabilisieren, bevor der neue
Entwicklungszweig eingerichtet wurde. Dies f?hrte zu unn?tiger
Mehrarbeit, da Fehlerkorrekturen von einem Zweig in den anderen Zweig
?bertragen werden mu?ten; au?erdem kam es zu einigen ?nderungen in der
Architektur, die nicht in den jeweils anderen Zweig ?bernommen werden
konnten.

Die 5.X-Releases wurden anders gehandhabt. FreeBSD 5.0, 5.1 und 5.2
wurden auf dem CURRENT-Zweig erzeugt. Das erste dieser Releases wurde
nach einer Entwicklungszeit von ?ber zwei Jahren herausgegeben (das
letzte Release aus HEAD war FreeBSD 4.0 im M?rz 2000).

Der \`\`5-STABLE-Zweig'' wurde im Gegensatz zu anderen
\`\`STABLE-Zweigen'' erst ein Jahr nach dem ersten 5.X-Release im CVS
mit dem Tag RELENG\_5 erzeugt (w?hrend der Erstellung des 5.3 Releases).
Diese Verz?gerung gab den Entwicklern Zeit, ?nderungen an der
Architektur vorzunehmen, die ?nderungen zu stabilisieren, Schnittstellen
fertigzustellen und damit einen guten Ausgangspunkt f?r weitere
5.X-Releases zu schaffen.

Abgesehen von allgemeinen Verbesserungen und Fehlerbehebungen liegt die
Priorit?t bei der Entwicklung des 5-STABLE-Zweiges in der Beibehaltung
der Application Binary Interface (ABI) und der Kompatibilit?t der
Application Program Interface (API). ?nderungen, die die
R?ckw?rtskompatibilit?t gef?hrden, sind mit Ausnahme von
Fehlerbehebungen f?r kritische Fehler nicht erlaubt.

Das n?chste CURRENT-Release aus dem CVS HEAD wird 6.0-RELEASE sein. Zum
Zeitpunkt von 5.3-Release steht noch nicht fest, wann 6.0 ver?ffentlicht
wird, es wird mit dem Jahr 2006 gerechnet.

Die Entwicklung des 4-STABLE-Zweiges wird begrenzt weitergef?hrt und es
wird noch mindestens ein Release (4.11) nach 5.3-RELEASE geben. F?r
besonders konservative Anwender ist es sinnvoll, 4.X-Releases noch
einige Zeit weiter zu benutzen. Releases aus dem 4-STABLE-Zweig werden
weiterhin vom Security Officer Team ``<security-officer@FreeBSD.org>``
unterst?tzt. Die Wartungsenden finden Sie auf der Seite
`Sicherheit <http://www.FreeBSD.org/de/security/index.html>`__ des
FreeBSD-Webauftritts.

Weitere Informationen ?ber den Ablauf bei der Ver?ffentlichung einer
neuen FreeBSD Version finden Sie auf den `Release Engineering Web
pages <http://www.FreeBSD.org/releng/index.html>`__ und im Artikel
`FreeBSD Release
Engineering <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/articles/releng/index.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Neuerungen
-------------

Die Glanzpunkte von FreeBSD 5.X sind die vielen Neuerungen. Diese
Neuerungen und die neue Funktionalit?t basieren zum gr??ten Teil auf
massiven ?nderungen der Systemarchitektur, die nicht in den
Entwicklungszweig 4-STABLE eingepflegt wurden. Viele in sich
abgeschlossene ?nderungen wie neue oder aktualisierte Ger?tetreiber oder
neue Benutzerprogramme wurden dagegen schon nach 4-STABLE ?bernommen.
Die folgende Liste enth?lt eine kurze ?bersicht ?ber die wichtigsten
Neuerungen:

-  SMPng: Die \`\`n?chste Generation'' der Unterst?tzung f?r
   Mehrprozessorsysteme (SMP). Die Arbeit konzentriert sich zur Zeit
   darauf, Locks f?r m?glichst kleine Bereiche der diversen Subsysteme
   des Kernels zu implementieren, damit m?glichst viele Vorg?nge
   (Threads) gleichzeitig im Kernel ablaufen k?nnen. Dabei wurde
   besonderes auf die Geschwindigkeit des Netzwerk-Stacks geachtet.

-  KSE: Die \`\`Kernel Scheduled Entities'' erlauben es einem Prozess,
   mehrere Threads auf Kernel-Ebene zu nutzen, analog zur Aktivierung
   via Scheduler. Die Bibliotheken ``libpthread`` und ``libthr``
   erlauben auch normalen Programmen mit mehreren Threads, diese
   Erweiterung ?ber die
   `pthread(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
   API zu nutzen. Die voreingestellte Thread-Library ist nun
   ``libpthread``.

-  Neue Plattformen: Zus?tzlich zu i386 und alpha werden jetzt auch
   amd64, ia64, pc98 und sparc64 Systeme unterst?tzt. An den Plattformen
   powerpc (l?uft auf PowerPC®-basierenden Systemen von Macintosh®) und
   arm wird gearbeitet.

-  GCC: Der Compiler und die dazugeh?rigen Werkzeuge basieren jetzt auf
   GCC 3.4.X und nicht mehr auf GCC 2.95.X.

-  MAC: Unterst?tzung f?r erweiterbare \`\`Mandatory Access Control''
   Regelwerke.

-  GEOM: Ein flexibles, modulares Ger?st zur Manipulation des
   Datentransfers von und zu Festplatten. Das System bietet einige
   Funktionen f?r Laufwerke: Erkennen von Partitionen,
   `gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
   ein Modul zur Verschl?sselung des Festplatteninhaltes, verschiedene
   RAID-Level, den Export von Laufwerken (mit
   `ggated(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggated&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   und verwandten Werkzeugen) und transparenter Dekompression von
   Laufwerken.

-  FFS: Das Dateisystem unterst?tzt jetzt
   Hintergrund-\ `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   (um das System nach einem Absturz schneller verf?gbar zu machen)
   sowie \`\`Schnappsch?sse''.

-  UFS2: Dieses neue Dateisystem unterst?tzt gr??ere Dateien und
   zus?tzliche Dateiberechtigungen.
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   erzeugt jetzt standardm??ig UFS2 Dateisysteme und auf allen
   Plattformen au?er pc98 gilt dies auch f?r Dateisysteme, die mit
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   erzeugt werden.

-  Neue Netzwerkfunktionen: In den 5.X-Releases wurden neue Funktionen
   hinzugef?gt, unter anderem: Unterst?tzung f?r TCP SACK (selective
   acknowledgements), der
   `pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
   Paketfilter von OpenBSD und das ALTQ Packet Queueing System.

-  Neue Hardware: Es wird mehr Hardware, wie Cardbus, Bluetooth-Ger?te
   und IEEE 802.11a/b/g Netzwerkkarten auf Basis von Atheros-Chips?tzen,
   unterst?tzt. Auf i386-Systemen k?nnen mit Hilfe des
   `ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Treibers
   einige Netzwerkkarten, f?r die es keinen FreeBSD-Treiber gibt, mit
   dem Treiber f?r Microsoft® Windows® benutzt werden.

Eine ausf?hrlichere ?bersicht ?ber die Neuerungen finden Sie in den
\`\`Release Notes'' f?r die verschiedenen FreeBSD 5.X Versionen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4. Beachtenswerte ?nderungen
----------------------------

Einige der Unterschiede zwischen FreeBSD 4.X und FreeBSD 5.X m?ssen
besonders herausgestellt werden, das sie ?nderungen der Architektur sind
oder nicht r?ckw?rtskompatibel sind. Auch wenn diese ?nderungen keinen
Datenverlust verursachen, k?nnen sie doch zu Verwirrung f?hren. Einige
beachtenswerte ?nderungen sind in der folgenden Liste zusammengefa?t:

-  Einige Teile des FreeBSD Basissystems wurden in die Ports Collection
   verschoben, weil sie so leichter zu warten sind oder weil sie nicht
   wirklich ein essentieller Bestandteil des Basissystems waren. Dazu
   geh?rt insbesondere **Perl** (in der Ports-Collection unter
   ```lang/perl5.8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/lang/perl5.8/pkg-descr>`__),
   das wegen der Lage im Basissystem Aktualisierungen des Systems
   erschwerte. Werkzeuge des Basissystems, die fr?her auf **Perl**
   angewiesen waren, wurden entweder neu geschrieben (wenn sie noch
   gebraucht werden) oder entfernt (weil sie ?berfl?ssig sind).

   Weitere Beispiele sind **UUCP** (in den Ports unter
   ```net/freebsd-uucp`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/freebsd-uucp/pkg-descr>`__),
   das Werkzeug ``doscmd`` und viele der althergebrachten Spiele
   (```games/freebsd-games`` <http://www.FreeBSD.org/cgi/url.cgi?ports/games/freebsd-games/pkg-descr>`__).

-  Durch die ?nderungen in den Datenstrukturen des Kernels und der
   Schnittstellen f?r Anwendungen und Programmierer (ABI/API), mu?ten
   Treiber anderer Hersteller angepa?t werden, damit sie korrekt mit
   FreeBSD 5.X 5.0 zusammenarbeiten. In einigen (hoffentlich seltenen)
   F?llen haben sich f?r den Anwender sichtbare Datenstrukturen
   ge?ndert, die es erfordern, Anwendungen neu zu kompilieren und/oder
   Ports und Pakete neu zu installieren. Wie schon in den 4.X-Releases
   will das FreeBSD-Entwicklerteam inkompatible ?nderungen in k?nftigen
   Releases auf dem 5.X-Zweig verhindern.

-  Einige Teile des FreeBSD-Basissystems wurden nicht mehr gepflegt,
   weil es nicht gen?gend Anwender und/oder Entwickler gab. Diese Teile
   wurden entfernt. dazu z?hlen unter anderem die Erzeugung von
   Programmen im Format ``a.out``, `[1] <#FTN.AEN161>`__ die
   XNS-Netzwerkprotokolle und der Treiber f?r den X-10 Controller.
   Einige Treiber f?r alte ISA-Karten waren kaputt und wurden entfernt.
   Einzelheiten entnehmen Sie bitte den Release-Notes.

-  Unter FreeBSD/i386 4.X wurden ISA-Ger?te in der
   Kernelkonfigurationsdatei konfiguriert. Die Konfiguration konnte beim
   Systemstart mit dem interaktiven Werkzeug **UserConfig** ge?ndert
   werden. Unter FreeBSD 5.X wurden beide Mechanismen durch
   `device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
   ersetzt. Dadurch m?ssen ISA-Ger?te nicht mehr fest im Kernel
   konfiguriert werden. Die Konfiguration von ISA-Ger?ten zur Zeit des
   Systemstarts ist nicht mehr men?gef?hrt, sondern wird im Boot-Loader
   vorgenommen.

-  Es gibt kein ``MAKEDEV`` mehr und es wird auch nicht mehr ben?tigt.
   FreeBSD 5.X benutzt ein spezielles Dateisystem f?r Ger?te, das die
   entsprechenden Ger?tedateien bei Bedarf automatisch erzeugt.
   Ger?tedateien werden mit dem Werkzeug
   `devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   oder ?ber die Datei ``/etc/devfs.conf`` konfiguriert. Weiteres
   entnehmen Sie bitte der Hilfeseite
   `devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__.

-  Alle mit
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   erzeugten Dateisysteme werden standardm??ig im Format UFS2 angelegt.
   Dies gilt auf allen Plattformen au?er pc98 auch f?r Dateisysteme, die
   mit
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   erzeugt werden. Da FreeBSD 4.X nur UFS1 lesen kann, m?ssen alle
   Dateisysteme, die sowohl mit 4.X als auch mit 5.X nutzbar sein
   sollen, im Format UFS1 erzeugt werden. In
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   steht dazu die Option -O1 zur Verf?gung, auch
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   enth?lt eine entsprechende Option. Dieser Fall tritt typischerweise
   auf Systemen auf, auf denen 4.X und 5.X installiert und abwechselnd
   betrieben werden. Bitte beachten Sie, da? es kein Programm zur
   Umwandlung von UFS1 nach UFS2 (oder umgekehrt) gibt, nur die Variante
   Backup, Formatieren, Restore.

-  Wegen des aktualisierten **GCC** Compilers m?ssen generell alle C++
   Programme neu ?bersetzt und neu installiert werden. Die Ursache sind
   ABI-?nderungen in C++.

-  Es ist zwar m?glich, f?r 4.X geschriebene Programme unter 5.X zu
   nutzen, allerdings mu? dazu die Distribution ``compat4x`` (oder der
   Port
   ```misc/compat4x`` <http://www.FreeBSD.org/cgi/url.cgi?ports/misc/compat4x/pkg-descr>`__)
   installiert sein. Wenn aber einer der installierten Ports
   aktualisiert werden muss, empfehlen wir generell *alle* installierten
   Ports neu zu bauen und neu zu installieren. Dies verhindert Probleme
   mit Programmen, die gegen eine Mischung aus neuen und alten
   Bibliotheken gebunden sind. Das Werkzeug
   ```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__
   kann Ihnen bei der Neuinstallation von Ports behilflich sein.

   Es gibt Ports, die nicht r?ckw?rtskompatibel sind, beispielsweise
   ```devel/gnomevfs2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs2/pkg-descr>`__,
   ```mail/postfix`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/postfix/pkg-descr>`__
   und
   ```security/cfs`` <http://www.FreeBSD.org/cgi/url.cgi?ports/security/cfs/pkg-descr>`__.
   Diese Ports m?ssen wegen ?nderungen in der statfs-Struktur neu
   ?bersetzt werden.

-  Die Datei ``host.conf``, mit der Namensdienste (Resolver)
   konfiguriert wurden, ist durch die (allgemeinere) Datei
   `nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
   ersetzt worden.

-  **BIND** wurde von Version 8 auf die Version 9 aktualisiert. Zwischen
   BIND 8 und BIND 9 gibt es viele Unterschiede. Wenn Sie
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   produktiv einsetzen, sollten Sie die Migrationsanleitung
   ``/usr/share/doc/bind9/misc/migration`` lesen. Im Verzeichnis
   ``/usr/share/doc/bind9/arm`` befindet sich das neue
   Adminstrator-Handbuch. Benutzer mit bestehenden
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__-Konfigurationen
   sollten das Verzeichnis ``/var/named`` vor der Migration sichern.
   Dies verhindert, da? Dateien vom
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__-Startskript
   ?berschrieben werden.

-  Ab 5.3-RELEASE ist in FreeBSD 5.X **Xorg** als X-Window-System
   voreingestellt. Zur Zeit bleibt **XFree86™** die Vorgabe f?r
   FreeBSD 4.X. Die Unterschiede zwischen beiden Versionen und eine
   Migrationsanleitung f?r bestehende Systeme beschreibt das Kapitel
   `Das
   X-Window-System <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/x11.html>`__
   des Handbuchs.

-  Die Dokumentation (wie z.B. das FreeBSD
   `Handbuch <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/index.html>`__
   und der
   `FAQ <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/faq/index.html>`__)
   ist teilweise noch nicht auf dem Stand von FreeBSD 5.X.

Weitere Informationen enthalten die Release-Notes der verschiedenen
FreeBSD 5.X Releases und die Datei ``src/UPDATING`` im
FreeBSD-Quellbaum. Beachtenswerte ?nderungen der Ports-Collection werden
in den Dateien ``ports/UPDATING`` und ``ports/CHANGES`` im Ports-Baum
beschrieben.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

5. Hinweise f?r die Aktualisierung von FreeBSD 4.X
--------------------------------------------------

Dieses Kapitel enth?lt Hinweise f?r Anwender, die ihr bestehendes
FreeBSD 4.X System auf FreeBSD 5.X aktualisieren wollen. Wie bei jeder
Aktualisierung ist es auf jeden Fall notwendig, vorher die Release Notes
und die Errata der neuen Version zu lesen; bei Aktualisierung ?ber den
Quellcode ist ``src/UPDATING`` Pflichtlekt?re.

.. raw:: html

   <div class="SECT2">

--------------

5.1. Aktualisierung ohne Quellcode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der einfachste Ansatz ist immer noch \`\`Sicherheitskopien erstellen,
Platte formatieren, neues System installieren, Benutzerdaten wieder
einspielen''. Dadurch werden alle Probleme mit veralteten und nicht
kompatiblen Programmen und Konfigurationsdateien umgangen. Die neuen
Dateisysteme k?nnen maximalen Nutzen aus den diversen Neuerungen
(speziell UFS2) ziehen.

Zum gegenw?rtigen Zeitpunkt ist die \`\`Upgrade''-Option in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
zur Migration auf eine neue Hauptversion unzureichend getestet. Wir
raten daher dringend von der Verwendung dieser Funktion ab.

Einige ?nderungen betreffen vielleicht Benutzer der FreeBSD  4.X
Startmedien. Die Installationsdisketten sind (auf Plattformen, wie i386,
die Disketten unterst?tzen) anders aufgebaut. Unter 4.X Releases
enthielten die Startdisketten einen Mini-Kernel, der gerade ausreichte,
um das System zu installieren. Mit dieser Aufteilung konnte der Kernel
auf einer einzigen Diskette gespeichert werden, doch fehlten unter
Umst?nden Treiber f?r bestimmte Hardware-Konfigurationen. Ab FreeBSD
5.3-RELEASE enthalten die Startdisketten einen GENERIC-Kernel, der ?ber
mehrere Disketten verteilt ist und mehr Treiber und mehr Funktionen
enth?lt. Der Boot-Loader fordert das Einlegen weiterer Disketten an.
Benutzer, die Installationsdisketten herunterladen (vielleicht um eine
Netzwerkinstallation durchzuf?hren), sollten beachten, da? es jetzt drei
Installationsdisketten gibt: ``boot.flp``, ``kern1.flp`` und
``kern2.flp``.

Bei einer Installation von CD-ROM auf einem i386™-System wird jetzt ein
neues Startprogramm mit dem Namen \`\`no-emulation boot loader''
genutzt. Dadurch ist es unter anderem m?glich, auf der CD den
Standardkernel (GENERIC) statt des auf den Disketten verwendeten
Mini-Kernels zu nutzen. Jedes System, das von den Installations-CDs f?r
Microsoft Windows NT® 4.0 booten kann, sollte auch mit den FreeBSD 5.X
CD-ROMs zurechtkommen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

5.2. Aktualisierung mit Quellcode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Viele Benutzer und Entwickler bevorzugen eine
    einfachere Art der Installation. Sichern Sie alle Daten und
    Konfigurationsdateien und installieren Sie das System mit
    Bin?rdateien (beispielsweise von einer CD-ROM). Spielen Sie
    anschlie?end die gesicherten Daten zur?ck. Verglichen mit einer
    Installation ?ber den Quellcode, m?ssen Sie sich bei diesem
    Verfahren nicht um alte Dateien und Programme k?mmern und Sie k?nnen
    neue Funktionen, wie das UFS2-Dateisystem benutzen.

    Benutzer, die nicht mit der Bauprozedur (buildworld/installworld)
    vertraut sind, sollten *nicht* mit dem Quellcode aktualisieren und
    stattdessen nach einer Datensicherung mit Bin?rdateien installieren.

.. raw:: html

   </div>

Eine Aktualisierung mit Quellcode baut und installiert Bin?rdateien aus
lokal auf der Maschine liegenden Quellcode. Die Aktualisierung beruht
auf der buildworld/installworld Prozedur, die von erfahrenen Benutzern
verwendet wird, um ?nderungen in einem Entwicklungszweig (wie
FreeBSD-STABLE oder FreeBSD-CURRENT) zu verfolgen. Allgemein ist diese
Prozedur aufwendiger als die Installation mit Bin?rdateien, sie kann
aber n?tzlich sein, wenn die Systemkonfiguration komplex oder stark
angepa?t ist. Eine Aktualisierung mit Quellcode ist auch n?tzlich f?r
ein entferntes System, auf das der Administrator keinen Zugriff hat und
daher auch keine Installationsmedien einlegen kann.

Es ist auf jeden Fall erforderlich, vor der Aktualisierung
``src/UPDATING`` zu lesen. Der Abschnitt \`\`To upgrade in-place from
4.x-stable to current'' enth?lt eine Schritt-f?r-Schritt Anleitung, der
Sie unbedingt folgen m?ssen, die Nutzung der ?blichen \`\`Abk?rzungen''
ist nicht m?glich. Die folgende Liste beschreibt und kommentiert die
n?tigen Schritte:

#. Sichern Sie Ihre Daten.

   Die Wichtigkeit dieses Schrittes kann nicht oft genug betont werden.
   Es ist wichtig, Sicherungen von allen Benutzerdaten und
   Konfigurationsdateien zu erstellen. Volle Sicherungen (Level 0) mit
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   sind daf?r geeignet, es gibt allerdings auch andere M?glichkeiten.

#. Stellen Sie sicher, da? im ``/``-Dateisystem ungef?hr 30 MB frei
   sind.

   FreeBSD 5.X ben?tigt mehr Platz als FreeBSD 4.X. Wenn das Verzeichnis
   ``/tmp`` im ``/``-Dateisystem liegt (was oft der Fall ist), k?nnen
   Sie Platz schaffen, indem Sie alle Dateien in diesem Verzeichnis
   l?schen.

#. Wenn n?tig, editieren Sie ``/etc/fstab``.

   Dieser Punkt betrifft wahrscheinlich nur ?ltere FreeBSD/i386 Systeme.
   Auf Systemen, die Disk-Slices mit MBRs besitzen, unterst?tzte FreeBSD
   sogenannte \`\`compatibility slices''. Der Name dieser Slices war
   etwa ``/dev/ad0a`` (ohne ausdr?cklich die Slice zu benennen). Diese
   Slices werden nicht mehr unterst?tzt. Slices m?ssen Namen wie
   ``/dev/ad0s1a`` tragen. Der Name muss das Laufwerk, die Nummer der
   Slice und den Buchstaben der Partition enthalten.

   Beachten Sie, da? \`\`compatibility slices'' seit FreeBSD
   2.2.6-RELEASE nicht mehr benutzt werden. Ignorieren Sie diesen Punkt
   wenn Sie FreeBSD/alpha Systeme oder Systeme mit \`\`dangerously
   dediated'' Platten benutzen.

#. Besorgen Sie sich, beispielsweise mit CVS, eine Kopie der Quellen des
   Basissystems (das Modul ``src/``). Mit CVS benutzen Sie f?r FreeBSD
   5.3-RELEASE das Tag RELENG\_5\_3\_0\_RELEASE, f?r den 5.3-Zweig (in
   dem Fehlerbehebungen stattfinden) nehmen Sie das Tag RELENG\_5\_3.
   Wenn Sie den 5-STABLE-Zweig verfolgen wollen, verwenden Sie das Tag
   RELENG\_5. Falls Sie die Quellen mit CVS auschecken, vergessen Sie
   nicht die Option -P anzugeben, damit CVS leere Verzeichnisse
   entfernt.

#. FreeBSD 5.X ben?tigt einige neue Eintr?ge in der Pa?wort- und
   Gruppendatei. Erzeugen Sie diese Eintr?ge mit Hilfe des nachstehenden
   Kommandos:

   .. code:: SCREEN

       # mergemaster -p

   Dieser Schritt mu? ausgef?hrt werden, damit neue Dateien dem
   richtigen Benutzerkonto und der richtigen Gruppe geh?ren.

   Beachten Sie, da? in FreeBSD 5.X das Werkzeug
   `nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   von ``/sbin/nologin`` nach ``/usr/sbin/nologin`` verschoben wurde.
   Die Login-Shell einiger Pseudo-Benutzer ist
   `nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   daher entstehen weitere Unterschiede in ``/etc/passwd``.

#. Bauen Sie mit dem nachstehenden Kommando die Benutzerwerkzeuge
   (Userland):

   .. code:: SCREEN

       # cd /usr/src
       # make buildworld

   Wenn die Variable CPUTYPE in ``/etc/make.conf`` definiert wird,
   sollte sie mit Operator ?= definiert werden. Damit kann der
   buildworld-Proze?, falls es n?tig sein sollte, die Variable
   ?berschreiben.

   Beachten Sie, da? MAKEOBJDIRPREFIX *nicht* in ``/etc/make.conf``
   definiert werden darf.

   Allgemein sollten die meisten der Bauoptionen in ``/etc/make.conf``
   auskommentiert oder entfernt sein. Besonders gilt das f?r Optionen,
   die direkt Bau- oder Basisfunktionen des Systems beeinflussen (wie
   NO\_TOOLCHAIN).

#. Bauen und installieren Sie einen neuen Kernel:

   .. code:: SCREEN

       # make buildkernel

   Das
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__-Ziel
   buildkernel mu? verwendet werden, damit der neue Kernel mit den im
   vorigen Schritt (buildworld) erzeugten Benutzerwerkzeugen gebaut
   wird. Sie k?nnen die Bauumgebung nicht manuell mit dem Werkzeug
   `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   erzeugen.

   Auch wenn es praktisch ist, in diesem Schritt einen angepa?ten Kernel
   zu erzeugen, sollten Sie das System mit einem GENERIC-Kernel
   aktualisieren. Diese Vorgehensweise ist weniger fehleranf?llig. Wenn
   Sie das erste Mal einen angepa?ten Kernel erstellen, benutzen Sie
   bitte den GENERIC-Kernel von FreeBSD 5.X als Vorlage, da viele
   Treiber und Optionen neu sind oder sich ge?ndert haben. Auf jeden
   Fall sollten Sie die Option COMPAT\_FREEBSD4 in die
   Kernelkonfiguration aufnehmen, da die Option Voraussetzung f?r eine
   erfolgreiche Aktualisierung ist.

#. Erzeugen Sie mit einer Variante des folgenden Kommandos f?r
   ISA-Ger?te die Datei ``device.hints``. Setzen Sie f?r MACHINE den
   Namen der passenden Architektur (beispielsweise i386) ein.

   .. code:: SCREEN

       # cp sys/MACHINE/conf/GENERIC.hints /boot/device.hints

   Mit moderner Hardware kann die Datei ``device.hints`` leer sein. Auf
   Systemen mit non-PNP ISA-Karten (hier mu? die Datei angepa?t werden),
   Systemen ohne PNPBIOS oder PNPBIOS-Systemen, die mit Disketten
   gestartet werden, ist die Datei zwingend erforderlich.

#. Installieren Sie den neuen Kernel:

   .. code:: SCREEN

       # make installkernel

   Unter FreeBSD 4.X wurde der Kernel in ``/kernel`` installiert. Unter
   FreeBSD 5.X wird der Kernel nach ``/boot/kernel/kernel`` installiert.
   Kernelmodule wurden unter FreeBSD 4.X in das Verzeichnis ``/modules``
   installiert, unter FreeBSD 5.X werden die Module in das Verzeichnis
   ``/boot/kernel`` installiert.

#. Installieren Sie den FreeBSD 5.X Boot-Loader:

   .. code:: SCREEN

       # cd /usr/src/sys/boot
       # make STRIP="" install

   Wir empfehlen diesen Schritt, obwohl er optional ist, auszuf?hren.

#. Deaktivieren Sie Module Dritter (wie die f?r VMware). Dies verhindert
   Abst?rze auf Grund ge?nderter Kernel-ABIs oder anderen
   Inkompatibilit?ten.

#. Booten Sie das System in den Einbenutzermodus. Sie m?ssen das System
   in diesem Schritt wirklich neu starten, da der neue Kernel laufen
   mu?, um die Benutzerwerkzeuge zu installieren. Da nur die
   erforderlichen Prozesse laufen, verringert der Einbenutzermodus
   wirksam das Auftreten unerwarteter Ereignisse.

#. H?ngen Sie die erforderlichen Dateisysteme ein:

   .. code:: SCREEN

       # fsck -p
       # mount -uw /
       # mount -at ufs

   Das Kommando
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   ist erforderlich, damit einige Felder im Superblock der Dateisysteme
   auf FreeBSD 5.X angepa?t werden. Wenn die Systemzeit die lokale Zeit
   anstelle von UTC verwendet, f?hren Sie auch noch den nachstehenden
   Befehl aus:

   .. code:: SCREEN

       # adjkerntz -i

   In diesem Schritt kann die folgende Meldung mehrmals auf der
   Systemkonsole erscheinen:

   .. code:: SCREEN

       WARNING: userland calling deprecated sysctl, please rebuild world

   Ignorieren Sie diese Meldung.

#. L?schen Sie die C++ Header-Dateien:

   .. code:: SCREEN

       # rm -rf /usr/include/g++

   Dieser Schritt verhindert, da? bei k?nftigen Compiler-L?ufen alte
   Header vom **GCC** 2.95 C++ Compiler angezogen werden.

#. Installieren Sie die Benutzerwerkzeuge (Userland):

   .. code:: SCREEN

       # cd /usr/src
       # make installworld

#. Auf Systemen, die
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   verwenden, m?ssen die
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__-Konfigurationsdateien
   in die
   `chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__-Umgebung
   im Verzeichnis ``/var/named`` geschoben werden. Befinden sich im
   Verzeichnis ``/var/named`` schon Dateien, sollten Sie diese jetzt
   sichern.

   .. code:: SCREEN

       # cd /etc
       # mv named named.bak
       # mkdir -p /var/named/etc/namedb
       # cp -Rp named.bak/* /var/named/etc/namedb

   Falls die Konfiguration die erzeugten Dateien f?r ``localhost``
   verwendet, generieren Sie die Dateien mit den nachstehenden Kommandos
   neu:

   .. code:: SCREEN

       # cd /var/named/etc/namedb
       # /bin/sh make-localhost
       # rm -f localhost-v6.rev localhost.rev

#. Aktualisieren Sie die Konfigurationsdateien des Systems:

   .. code:: SCREEN

       # mergemaster -i

   Dieser Schritt ist zwingend erforderlich. Der Schritt gew?hrleistet,
   da? die Start- und Konfigurationsdateien im Verzeichnis ``/etc`` zu
   dem frisch installierten System passen.

   Nach dem Lauf von
   `mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   sollten Sie die Datei ``/etc/rc.conf`` untersuchen und m?glicherweise
   anpassen. Die Vorgabewerte einiger Variablen haben sich ge?ndert,
   insbesondere wurden einige Dienste, die in 4.X aktiviert waren, in
   5.X deaktiviert.

#. Entfernen Sie ?brig gebliebene Dateien von **BIND 8**:

   .. code:: SCREEN

       # rm /usr/bin/dnskeygen /usr/bin/dnsquery
       # rm /usr/libexec/named-xfer
       # rm /usr/sbin/named.restart /usr/sbin/ndc

#. Starten Sie das System neu.

Nachdem Sie das Basissystem migriert haben, m?ssen Sie noch einige
Komponenten, die nicht zum Basissystem geh?ren, aktualisieren. **Perl**
ist nicht mehr Teil des Basissystems und sollte aus der Ports-Collection
(der Port
```lang/perl5.8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/lang/perl5.8/pkg-descr>`__)
oder als Paket nachinstalliert werden. Danach m?ssen alle Ports oder
Pakete, die von Perl abh?ngen, neu installiert werden.

Wenn Sie FreeBSD 4.X Programme laufen lassen wollen, ben?tigen Sie
Kompatibilit?tsbibliotheken. Diese k?nnen Sie mit dem Port oder Paket
```misc/compat4x`` <http://www.FreeBSD.org/cgi/url.cgi?ports/misc/compat4x/pkg-descr>`__
installieren.

Wie oben erw?hnt, wird **Xorg** in der Voreinstellung als
X-Window-System verwendet. Die Ports und Pakete beachten diese ?nderung,
um Abh?ngigkeiten zwischen Software zu bestimmen. Die Migration von
**XFree86** auf **Xorg** beschreibt das Handbuchkapitel `X11
installieren <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/x-install.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

6. Zusammenfassung
------------------

Dieser Artikel beschreibt einige der beachtenswerten Funktionen von
FreeBSD 5.X und bespricht wichtige Punkte f?r Benutzer von FreeBSD 4.X,
die bestehende Systeme aktualisieren wollen. Der Artikel beschreibt
weiterhin zwei Methoden ein System zu aktualisieren. Die erste Methode
benutzt Bin?rdateien von einem Installationsmedium, die zweite Methode
?bersetzt den Quellcode des Basissystems.

.. raw:: html

   </div>

.. raw:: html

   </div>

Fu?noten
~~~~~~~~

+--------------------------------------+--------------------------------------+
| `[1] <#AEN161>`__                    | Das Ausf?hren von                    |
|                                      | ``a.out``-Programmen ist weiterhin   |
|                                      | mit der Kerneloption COMPAT\_AOUT    |
|                                      | m?glich. Einige Compiler aus der     |
|                                      | Ports-Collection (beispielsweise     |
|                                      | ```lang/gcc28`` <http://www.FreeBSD. |
|                                      | org/cgi/url.cgi?ports/lang/gcc28/pkg |
|                                      | -descr>`__)                          |
|                                      | k?nnen auch noch ``a.out``-Programme |
|                                      | erzeugen.                            |
+--------------------------------------+--------------------------------------+

--------------

Diese Datei und andere Dokumente zu dieser Version sind bei
ftp://ftp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Alle Anwender von FreeBSD 5-STABLE sollten sich in die Mailingliste
<stable@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.
