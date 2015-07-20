========================================================
Hinweise f?r die ersten Anwender von FreeBSD 5.1-RELEASE
========================================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

Hinweise f?r die ersten Anwender von FreeBSD 5.1-RELEASE
========================================================

.. raw:: html

   <div class="AUTHORGROUP">

The FreeBSD Release Engineering Team
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

Copyright © 2002, 2003 von The FreeBSD Release Engineering Team

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Dieser Artikel enth?lt Informationen ?ber den Status von FreeBSD
5.1-RELEASE f?r die Anwender, die bisher noch keine Erfahrung mit den
5.\ ``X`` Versionen oder FreeBSD sammeln konnten. Er enth?lt einige
Hintergrundinformationen ?ber die vor und w?hrend einer Ver?ffentlichung
ablaufende Prozesse, nennt die wichtigsten Neuerungen und die Stellen,
an denen die ersten Anwender Probleme haben k?nnten. Weiterhin gibt es
Informationen ?ber die Pl?ne f?r weitere Ver?ffentlichungen im
Entwicklungszweig 4-STABLE und ein paar Hinweise f?r die Aktualisierung
bestehender Systeme.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
=============

Nach ?ber zwei Jahren steht mit FreeBSD 5.\ ``X`` wieder eine komplett
neue FreeBSD-Version zur Verf?gung. Sie bietet nicht nur diverse neue
M?glichkeiten, auch und gerade \`\`unter der Haube'' hat sich einiges
verbessert. Der Nachteil dieser Neuerungen ist, da? gro?e Teile des
Systems neu und nicht ausreichend getestet sind. Im Vergleich zu den
existierenden 4.\ ``X`` Versionen kann der Schritt zu den ersten
5.\ ``X`` Versionen zu Verschlechterungen in den Bereichen Stabilit?t,
Leistung und teilweise auch Funktionalit?t f?hren.

Aus diesen Gr?nden warnen wir alle Anwender, ihre Systeme nicht von
?lteren FreeBSD-Versionen auf 5.0 zu aktualisieren, wenn sie die
"Problemzonen" nicht kennen oder nicht bereit sind, die Einschr?nkungen
in den neuesten Versionen in Kauf zu nehmen. Gerade konservative
Anwender sollten in der nahen Zukunft 4.\ ``X``-Versionen (wie
4.8-RELEASE) benutzen. Wir meinen, da? diese Anwender erst zu 5.\ ``X``
wechseln sollten, nachdem der Entwicklungszweig 5-STABLE existiert; dies
wird wahrscheinlich nach der Ver?ffentlichung von 5.2-RELEASE passieren.

Hier zeigt sich das \`\`Henne und Ei'' Problem bei der Ver?ffentlichung
von FreeBSD 5.\ ``X``. Alle am FreeBSD Project beteiligten Personen
wollen ein FreeBSD, das m?glichst stabil und zuverl?ssig ist. Um dieses
Ziel zu erreichen, m?ssen die neue Version und speziell die neuen
Komponenten von m?glichst vielen Anwendern getestet werden. Dummerweise
gibt es bei realistischer Betrachtung nur eine M?glichkeit, eine gr??ere
Anzahl an Anwender f?r einen Test zu gewinnen: Die Ver?ffentlichung der
zu testenden Version!

Dieser Artikel beschreibt einige der Probleme, die bei der Installation
und Benutzung von FreeBSD 5.1-RELEASE auftreten k?nnen. Zuerst wird
beschrieben, wie eine neue FreeBSD Version ver?ffentlicht wird. Dann
werden die interessanteren Neuerungen in FreeBSD 5.1-RELEASE und die
Bereiche, in denen (gerade f?r unvorsichtige Anwender) Probleme
auftreten k?nnen, vorgestellt. Anwender, die erst einmal bei Systemen
auf Basis von 4-STABLE bleiben m?chten, erhalten einen kurzen Ausblick
auf die kurz- und mittelfristigen Planungen f?r diesen
Entwicklungszweig. Zuletzt wird besprochen, was bei einer Aktualisierung
eines existierenden 4.\ ``X`` Systems auf 5.0 beachtet werden mu?.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Ver?ffentlichung neuer FreeBSD-Versionen
===========================================

Das Prinzip der FreeBSD-Entwicklung ist die Verwendung mehrerer
Entwicklungszweige innerhalb eines \`\`CVS Repository''. Der Hauptzweig
wird \`\`CURRENT'' genannt und innerhalb des Repository mit dem
symbolischen Namen ``HEAD`` referenziert. Neuerungen werden zun?chst in
diesen Zweig eingebracht. Das bedeutet zwar, da? neue M?glichkeiten
zun?chst einmal nur in CURRENT zur Verf?gung stehen, es bedeutet
allerdings auch, da? dieser Zweig von Zeit zu Zeit Kummer bereitet,
w?hrend die Neuerungen getestet und ihre Fehler entfernt werden.

Wenn eine neue FreeBSD-Version ver?ffentlicht wird, basiert diese in der
Regel auf einem der \`\`STABLE'' (stabil) genannten Entwicklungszweige.
Neuerungen werden nur in diese Entwicklungszweige ?bernommen, nachdem
sie in CURRENT getestet wurden. Zur Zeit gibt es nur einen aktiven
STABLE Entwicklungszweig: \`\`4-STABLE''; dieser Zweig war die Grundlage
f?r alle 4.\ ``X`` Versionen. Dieser Zweig wird innerhalb des CVS
Repository durch den symbolischen Namen ``RELENG_4`` gekennzeichnet.

Die Basis f?r FreeBSD 5.0 und 5.1 ist der Entwicklungszweig CURRENT.
Damit wird zum ersten Mal nach ?ber zwei Jahren eine neue Version auf
Basis dieses Entwicklungszweiges erscheinen (die letzte war FreeBSD 4.0,
im M?rz 2000).

Einige Zeit nach der Ver?ffentlichung von FreeBSD 5.0 wird im FreeBSD
CVS Repository der Zweig \`\`5-STABLE'' mit dem symbolischen Namen
``RELENG_5`` erzeugt werden. Die letzten beiden Entwicklungszweige
dieser Art (3-STABLE und 4-STABLE) wurden unmittelbar nach der
Ver?ffentlichung der jeweiligen \`\`Punkt Null'' Versionen (3.0 bzw.
4.0) erzeugt. R?ckblickend m?ssen wir feststellen, da? dadurch in beiden
F?llen nicht genug Zeit war, um CURRENT zu stabilisieren, bevor der neue
Entwicklungszweig eingerichtet wurde. Dies f?hrte zu unn?tiger
Mehrarbeit, da Fehlerkorrekturen von einem Zweig in den anderen Zweig
?bertragen werden mu?ten; au?erdem kam es zu einigen ?nderungen in der
Architektur, die nicht in den jeweils anderen Zweig ?bernommen werden
konnten.

Aus diesem Grund wird das Release Engineering Team den neuen 5-STABLE
Entwicklungszweig erst dann im CVS Repository einrichten, wenn eine
solide Grundlage zur Verf?gung steht. Es ist sehr wahrscheinlich, da?
vorher mehrere 5.\ ``X`` Versionen erscheinen werden; zur Zeit rechnen
wir damit, da? 5-STABLE nach dem Erscheinen von 5.2-RELEASE erzeugt
werden wird.

Weitere Informationen ?ber den Ablauf bei der Ver?ffentlichung einer
neuen FreeBSD Version finden Sie auf den `Release Engineering Web
pages <http://www.FreeBSD.org/releng/index.html>`__ und im Artikel
`FreeBSD Release
Engineering <http://www.freebsd.org/doc/en_US.ISO8859-1/articles/releng/index.html>`__.
Informationen ?ber den geplanten Entwicklungszweig 5-STABLE finden Sie
auf der `\`\`The Roadmap for
5-STABLE'' <http://docs.freebsd.org/doc/5.1-RELEASE/usr/share/doc/en_US.ISO8859-1/articles/5-roadmap/index.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Neuerungen
=============

Die Glanzpunkte von FreeBSD 5.\ ``X`` sind die vielen Neuerungen. Diese
Neuerungen und die neue Funktionalit?t basieren zum gr??ten Teil auf
massiven ?nderungen der Systemarchitektur, die nicht in den
Entwicklungszweig 4-STABLE eingepflegt wurden. Viele in sich
abgeschlossene ?nderungen wie Treiber f?r neue Ger?te oder neue
Benutzerprogramme wurden dagegen schon nach 4-STABLE ?bernommen. Die
folgende Liste enth?lt eine kurze ?bersicht ?ber die wichtigsten
Neuerungen in FreeBSD 5.0:

-  SMPng: Die \`\`n?chste Generation'' der Unterst?tzung f?r Systeme mit
   mehreren Prozessoren (noch nicht abgeschlossen). Es ist jetzt
   m?glich, da? mehrere Prozessoren gleichzeitig den Kernel nutzen.

-  KSE: Die \`\`Kernel Scheduled Entities'' erlauben es einem Prozess,
   mehrere Threads auf Kernel-Ebene zu nutzen, analog zur Aktivierung
   via Scheduler. Die (experimentellen) Bibliotheken ``libkse`` und
   ``libthr`` erlauben auch normalen Programmen mit mehreren Threads,
   diese Erweiterung zu nutzen.

-  Neue Plattformen: Zus?tzlich zu i386, pc98 und Alpha werden jetzt
   auch sparc64 und ia64 Systeme unterst?tzt.

-  GCC: Der Compiler und die dazugeh?rigen Werkzeuge basieren jetzt auf
   GCC 3.2.2 und nicht mehr auf GCC 2.95.\ ``X``.

-  MAC: Unterst?tzung f?r erweiterbare \`\`Mandatory Access Control''
   Regelwerke.

-  GEOM: Ein flexibles Ger?st zur Manipulation von Daten beim Transfer
   von und zu Festplatten. Auf dieser Basis wurde ein experimentelles
   Modul zur Verschl?sselung des Festplatteninhaltes entwickelt.

-  FFS: Das Dateisystem unterst?tzt jetzt
   Hintergrund-\ `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.1-release>`__
   (um das System nach einem Absturz schneller verf?gbar zu machen)
   sowie \`\`Schnappsch?sse''.

-  UFS2: Dieses neue Dateisystem unterst?tzt gr??ere Dateien und
   zus?tzliche Dateiberechtigungen.
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.1-release>`__
   erzeugt jetzt standardm??ig UFS2 Dateisysteme und auf allen
   Plattformen au?er PC98 gilt dies auch f?r Dateisysteme, die mit
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
   erzeugt werden.

-  Cardbus: Cardbus wird jetzt unterst?tzt.

Eine ausf?hrlichere ?bersicht ?ber die Neuerungen finden Sie in den
\`\`Release Notes'' f?r FreeBSD 5.0-RELEASE und 5.1-RELEASE.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4. Nachteile f?r fr?he Anwender
===============================

Ein Nachteil der Neuerungen in FreeBSD 5.\ ``X`` ist, da? es in einigen
Bereichen auf Grund der noch nicht abgeschlossenen Entwicklung zu
Problemen oder zu unerwarteten Effekten kommen kann. Einige (aber nicht
alle) der Problemzonen sind in der folgenden Liste zusammengefa?t:

-  Die Arbeit an diversen Neuerungen ist noch nicht abgeschlossen, dazu
   geh?ren unter anderem SMPng und KSE. Diese Erweiterungen sind zwar
   f?r Test- und Experimentalzwecke ausreichend stabil, aber unter
   Umst?nden nicht stabil genug f?r den Produktionsbetrieb.

-  Durch die ?nderungen in den Datenstrukturen des Kernels und der
   Schnittstellen f?r Anwendungen und Programmierer (ABI/API), m?ssen
   Treiber anderer Hersteller angepa?t werden, damit sie korrekt mit
   FreeBSD 5.0 zusammenarbeiten. Es ist nicht ausgeschlossen, da? es bis
   zum Erscheinen des Entwicklungszweiges 5-STABLE weitere kleinere
   ?nderungen am ABI/API geben wird.

-  Einige Teile des FreeBSD Basissystems wurden in die Ports Collection
   verschoben. Dazu geh?ren insbesondere **Perl**, **UUCP** und die
   meisten (nicht alle) Spiele. Diese Programme werden zwar weiterhin
   entwickelt und unterst?tzt, es kann aber verwirren, da? sie nicht
   mehr Teil des Basissystems sind.

-  Einige Teile des FreeBSD-Basissystems wurden nicht mehr gepflegt,
   weil es nicht gen?gend Anwender und/oder Entwickler gab. Diese Teile
   mu?ten entfernt werden, dazu z?hlen unter anderem die Erzeugung von
   Programmen im Format a.out;, die XNS-Netzwerkprotokolle und der
   Treiber f?r den X-10 Controller.

-  Viele Ports und Packages, die mit FreeBSD 4-STABLE noch korrekt
   liefen, k?nnen mit FreeBSD 5.0 nicht genutzt oder nicht kompiliert
   werden. Der Grund ist in der Regel der neue Compiler oder die
   Aufr?umarbeiten in den Header-Dateien.

-  Viele der Neuerungen in FreeBSD 5.\ ``X`` wurden bisher nur auf
   relativ wenigen Systemen getestet. Viele dieser Neuerungen (wie
   SMPng) haben Auswirkungen auf gro?e Bereiche des Kernels.

-  Die Neuerungen in FreeBSD 5.0 enthalten noch Routinen zur
   Unterst?tzung bei der Fehlersuche und Diagnose. Dadurch kann es dazu
   kommen, da? ein System mit FreeBSD 5.0 langsamer ist als mit
   4-STABLE.

-  Neuerungen werden erst in den Entwicklungszweig 4-STABLE ?bernommen,
   nachdem sie eine Zeit lang in -CURRENT \`\`gereift'' sind. Bei
   FreeBSD 5.0 fehlt dieser stabilisierende Effekt eines -STABLE
   Entwicklungszweiges. Der Entwicklungszweig 5-STABLE wird
   wahrscheinlich erst einige Zeit nach der Ver?ffentlichung von
   5.2-RELEASE eingerichtet werden.

-  Die Dokumentation (wie z.B. das FreeBSD
   `Handbuch <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/index.html>`__
   und der
   `FAQ <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/faq/index.html>`__)
   ist teilweise noch nicht auf dem Stand von FreeBSD 5.\ ``X``.

Da einige dieser Probleme auch negative Auswirkungen auf die Stabilit?t
des Systems haben, r?t das Release Engineering Team konservativen
Anwendern und Firmen, Versionen aus dem Entwicklungszweig 4-STABLE zu
verwenden, bis die 5.\ ``X`` Versionen zuverl?ssiger geworden sind.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

5. Die Zukunft des Entwicklungszweiges 4-STABLE
===============================================

Die Ver?ffentlichung von FreeBSD 5.0 bedeutete nicht das Ende des
Entwicklungszweiges 4-STABLE: FreeBSD 4.8 erschien im April 2003, zwei
Monate nach der Ver?ffentlichung von FreeBSD 5.0. Es wird wahrscheinlich
noch eine weitere Version auf der Basis dieses Entwicklungszweiges
geben: Das f?r den Sommer 2003 geplante 4.9-RELEASE. Auch eine Version
4.10 liegt im Bereich des M?glichen. Dies h?ngt von mehreren Faktoren
ab, der wichtigste davon ist die Existenz und Stabilit?t des
Entwicklungszweiges 5-STABLE. Wenn CURRENT nicht stabil genug ist, um
einen Entwicklungszweig 5-STABLE zu rechtfertigen, werden weitere
Versionen auf Basis des Entwicklungszweiges 4-STABLE m?glich und
notwendig sein. Bis zum Erscheinen der offiziell letzten Version auf
Basis von 4-STABLE bleibt es den Entwicklern ?berlassen, ob sie
Neuerungen aus ``HEAD`` in 4-STABLE einpflegen (im Rahmen der schon
bestehenden Regelungen).

Bis zu einem gewissen Grad werden das Release Engineering Team und die
Entwickler auch die W?nsche der Benutzer nach weiteren Versionen auf
Basis von 4-STABLE beachten. Allerdings nur, so weit dies im Rahmen der
beschr?nkten Ressourcen m?glich ist.

Neue Versionen auf Basis des Entwicklungszweiges 4-STABLE werden vom
Security Officer Team ``<security-officer@FreeBSD.org>`` im ?blichen
Rahmen unterst?tzt werden, genauere Informationen dazu finden Sie auf
der `Security page <http://www.FreeBSD.org/security/index.html>`__ auf
der FreeBSD Webseite. In der Regel werden die letzten beiden Versionen
jedes Entwicklungszweiges durch die Ver?ffentlichung von
Sicherheitshinweisen und Patches unterst?tzt; dem Team ist es allerdings
freigestellt, diese Unterst?tzung auf weitere Versionen oder spezielle
Probleme auszudehnen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

6. Hinweise f?r die Aktualisierung von FreeBSD 4.\ ``X``
========================================================

Dieses Kapitel enth?lt Hinweise f?r Anwender, die ihr bestehendes
FreeBSD 4.\ ``X`` System auf FreeBSD 5.\ ``X`` aktualisieren wollen. Wie
bei jeder Aktualisierung ist es auf jeden Fall notwendig, vorher die
Release Notes und die Errata der neuen Version zu lesen; bei
Aktualisierung ?ber den Quellcode ist ``src/UPDATING`` Pflichtlekt?re.

.. raw:: html

   <div class="SECT2">

--------------

6.1. Aktualisierung ohne Quellcode
----------------------------------

Der einfachste Ansatz ist immer noch \`\`Sicherheitskopien erstellen,
Platte formatieren, neues System installieren, Daten wieder
einspielen''. Dadurch werden alle Probleme mit veralteten und nicht
kompatiblen Programmen und Konfigurationsdateien umgangen. Die neuen
Dateisysteme k?nnen maximalen Nutzen aus den diversen Neuerungen
(speziell UFS2) ziehen.

Zum gegenw?rtigen Zeitpunkt hat noch niemand ausf?hrlich getestet, ob
und wie gut die \`\`Upgrade''-Option in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
bei einem Update von 4.0 zu 5.0 funktioniert. Wir raten daher dringend
von der Verwendung dieser Funktion ab. Eines der Hauptprobleme ist, da?
bei dieser Variante diverse Dateien nicht gel?scht werden, die zwar von
4.\ ``X`` genutzt wurden, aber in 5.\ ``X`` nicht mehr vorhanden sind.
Diese Altlasten k?nnen zu Problemen f?hren.

Auf i386 und pc98 Systemen kann die Konfiguration von ISA Ger?ten beim
Systemstart mit dem Werkzeug UserConfig eingestellt werden, dies gilt
auch beim Start von einem Installations-Medium. Dieses Programm wurde in
FreeBSD 5.0 durch
`device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5&manpath=FreeBSD+5.1-release>`__
ersetzt; dieses stellt zwar die gleiche Funktionalit?t bereit, ist aber
von der Bedienung her v?llig verschieden.

Bei einer Installation von Diskette kann es notwendig werden, die neue
Treiber-Diskette zu benutzen. Das ``drivers.flp`` Diskettenimage sollte
im allgemeinen ?berall dort verf?gbar sein, wo auch schon die bekannten
``kern.flp`` und ``mfsroot.flp`` verf?gbar sind.

Bei einer Installation von CD-ROM auf einem i386-System wird jetzt ein
neues Startprogramm mit dem Namen \`\`no-emulation boot loader''
genutzt. Dadurch ist es unter anderem m?glich, auf der CD den
Standardkernel (``GENERIC``) statt des auf den Disketten verwendeten
Mini-Kernels zu nutzen. Jedes System, das von den Installations-CDs f?r
Windows NT 4.0 booten kann, sollte auch mit den FreeBSD 5.\ ``X``
CD-ROMs zurechtkommen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

6.2. Aktualisierung mit Quellcode
---------------------------------

Es ist auf jeden Fall erforderlich, vor der Aktualisierung
``src/UPDATING`` zu lesen. Der Abschnitt \`\`To upgrade from 4.x-stable
to current'' enth?lt eine Schritt-f?r-Schritt Anleitung, der Sie
unbedingt folgen m?ssen, die Nutzung der ?blichen \`\`Abk?rzungen'' ist
nicht m?glich.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

6.3. Allgemeine Hinweise
------------------------

**Perl** wurde aus dem Basissystem entfernt und sollte entweder als
Package oder ?ber die Ports Collection installiert werden. Die bisher
?bliche Praxis, Perl als Teil des Basissystems zu behandeln und mit ihm
zusammen zu kompilieren, f?hrte zu diversen Problemen, die eine
Aktualisierung von Perl erschwerten. Die im Standardsystem vorhandenen
Programme, die Perl ben?tigten, wurden entweder in einer anderen Sprache
neu geschrieben (wenn sie noch ben?tigt wurden) oder ersatzlos entfernt
(wenn sie ?berfl?ssig waren). Da
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
das Perl Package bei den meisten Distributionen automatisch mit
installiert, sollte diese ?nderung kaum Auswirkungen auf die Anwender
haben.

Einige Scripte verlassen sich darauf, da? der Perl-Interpreter als
``/usr/bin/perl`` verf?gbar ist. Der Perl Port enth?lt das Programm
``use.perl``, mit dem ein passender Satz symbolischer Links f?r diese
Scripte erzeugt werden kann. Nach dem Aufruf von ``use.perl port``
sollte alles wie erwartet funktionieren.

Es ist zwar m?glich, f?r 4.\ ``X`` geschriebene Programme unter
5.\ ``X`` zu nutzen, allerdings mu? dazu die Distribution ``compat4x``
installiert sein. Damit *k?nnte* es auch m?glich sein, alte Ports zu
benutzen.

Bei der Aktualisierung eines bestehenden Systems auf Basis von 4-STABLE,
ist es unbedingt notwendig, die alten Dateien in ``/usr/include`` zu
l?schen. Im allgemeinen ist es ausreichend, dieses Verzeichnis vor der
Installation bzw. vor dem ``installworld`` zu entfernen. Wird das
Verzeichnis nicht entfernt, kann es zu Problemen kommen (speziell mit
C++-Programmen), da der Compiler dann einen Mix aus alten und neuen
Headerdateien verwendet.

Es gibt kein ``MAKEDEV`` mehr, weil es nicht mehr ben?tigt wird. FreeBSD
5.\ ``X`` benutzt ein spezielles Dateisystem f?r Ger?te, das die
entsprechenden Device Nodes bei Bedarf automatisch erzeugt. Weitere
Informationen finden Sie in
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.1-release>`__.

Alle mit
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.1-release>`__
erzeugten Dateisysteme werden standardm??ig im Format UFS2 angelegt.
Diese gilt auf allen Plattformen au?er PC98 auch f?r Dateisysteme, die
mit
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
erzeugt werden. Da FreeBSD 4.\ ``X`` nur UFS1 lesen kann, m?ssen alle
Dateisysteme, die sowohl mit 4.\ ``X`` als auch mit 5.\ ``X`` nutzbar
sein sollen, im Format UFS1 erzeugt werden. Dieser Fall tritt
typischerweise auf Systemen auf, auf denen 4.\ ``X`` und 5.\ ``X``
installiert und abwechselnd betrieben werden. In
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.1-release>`__
steht dazu die Option ``-O1`` zur Verf?gung, auch
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
enth?lt eine entsprechende Option. Bitte beachten Sie, da? es kein
Konvertierungsprogramm zur Umwandlung von UFS1 nach UFS2 (oder
umgekehrt) gibt, nur die Variante Backup, Formatieren, Restore.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

7. Zusammenfassung
==================

FreeBSD 5.1-RELEASE enth?lt zwar viele interessante Neuerungen, aber es
ist noch nicht f?r alle Anwender geeignet. Aus diesem Grund haben wir in
diesem Dokument Informationen ?ber die Abl?ufe bei der Ver?ffentlichung
einer neuen Version, die interessantesten Neuerungen in den 5.\ ``X``
Versionen und wahrscheinliche Probleme gegeben. Weiterhin enthielt er
einen Ausblick auf die Zukunft des Entwicklungszweiges 4-STABLE und
Informationen f?r Anwender, die schon jetzt umsteigen wollen.

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

Alle Anwender von FreeBSD 5-CURRENT sollten sich in die Mailingliste
<current@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
