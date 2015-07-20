========================================
FreeBSD/alpha 4.11-RELEASE Release Notes
========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.11-RELEASE Release Notes
========================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005 The FreeBSD Documentation
Project

Copyright © 2002, 2003, 2004, 2005 The FreeBSD German Documentation
Project

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 4.11-RELEASE enthalten eine ?bersicht ?ber
alle ?nderungen in FreeBSD seit der Version 4.10-RELEASE. Die Liste
umfasst sowohl die ?nderungen des Kernels als auch ?nderungen der
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
2.1. `Sicherheit <#SECURITY>`__
2.2. `?nderungen im Kernel <#KERNEL>`__
2.2.1. `Unterst?tzung f?r Prozessoren und Mainboards <#PROC>`__
2.2.2. `Netzwerke und Netzwerkkarten <#NET-IF>`__
2.2.3. `Netzwerk-Protokolle <#NET-PROTO>`__
2.2.4. `Festplatten und Massenspeicher <#DISKS>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.4. `Zus?tzliche Software <#CONTRIB>`__
2.5. `Erzeugung von Releases und Integration <#RELENG>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 4.11-RELEASE auf
Alpha/AXP Systemen. Es beschreibt die Komponenten von FreeBSD, die seit
4.10-RELEASE hinzugef?gt (oder ge?ndert) wurden. Au?erdem erhalten Sie
Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 4.11-RELEASE ist eine release
Distribution. Sie k?nnen Sie von ftp://ftp.FreeBSD.org/ und allen seinen
Mirrors erhalten. Weitere Informationen, wie Sie diese (oder andere)
release Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Bezugsquellen f?r
FreeBSD'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
-------------

Dieser Abschnitt beschreibt die f?r den Anwender offensichtlichsten
Neuerungen und ?nderungen in FreeBSD seit 4.10-RELEASE. Die Eintr?ge
dokumentieren neue Treiber bzw. Unterst?tzung f?r neue Hardware, neue
Befehle oder Optionen, die Behebung wichtiger Fehler, und
Aktualisierungen von Software Dritter. Sicherheitshinweise, die nach dem
Erscheinen von 4.10-RELEASE herausgegeben wurden, sind ebenfalls
aufgef?hrt.

.. raw:: html

   <div class="SECT2">

--------------

2.1. Sicherheit
~~~~~~~~~~~~~~~

Bei der Abarbeitung verschiedener Linux-Systemaufrufe wurde ein Fehler
behoben, der dazu f?hren konnte, dass ohne vorherige Pr?fung auf Teile
des Speichers zugegriffen werden konnte. Weiteres entnehmen Sie bitte
dem Sicherheitshinweis
`FreeBSD-SA-04:13 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:13.linux.asc>`__.

Eine Reihe von Programmierfehlern in **CVS** wurden durch die
Aktualisierung auf **CVS** 1.11.17 behoben. Die Fehler gaben ungewollt
Informationen preis, boten M?glichkeiten zu Denial-of-Service Angriffen
und eventuell zur Ausf?hrung beliebigen Codes. Weiteres lesen Sie bitte
im Sicherheitshinweis
`FreeBSD-SA-04:14 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:14.cvs.asc>`__
nach.

Ein Fehler des Werkzeugs
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+4.11-RELEASE>`__
wurde behoben. Der Fehler erlaubte es b?swilligen HTTP-Servern,
beliebige Speicherbereiche des Clients zu ?berschreiben. Einzelheiten
entnehmen Sie bitte dem Sicherheitshinweis
`FreeBSD-SA-04:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:16.fetch.asc>`__.

Ein Fehler in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.11-RELEASE>`__
und
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.11-RELEASE>`__
wurde behoben. Ein b?swilliger lokal angemeldeter Benutzer konnte die
Verf?gbarkeit des Systems durch Panics einschr?nken (Denial of Service)
oder Teile des Kernelspeichers lesen. Weiteres entnehmen Sie bitte dem
Sicherheitshinweis
`FreeBSD-SA-04:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:17.procfs.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. ?nderungen im Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~

Der Installations-Kernel wurde um den Treiber
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
erweitert.

In
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+4.11-RELEASE>`__
wurde ein Fehler beseitigt, durch den mit PROT\_NONE markierte Seiten
unter bestimmten Umst?nden f?r den Lesezugriff freigegeben wurden.

Es wurden Fehler in den Funktionen ``vm_object_madvise()``,
``vm_object_sync()`` und\ ``contigmalloc()`` der FreeBSD
Speicherverwaltung beseitigt. Die Fehler in den Funktionen
``vm_object_madvise()`` und ``vm_object_sync()`` f?hrten in
verschiedenen F?llen zu falschen Speicherinhalten. Ein Fehler in der
Funktion ``contigmalloc()`` konnte einen Stillstand (Panic) verursachen.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1. Unterst?tzung f?r Prozessoren und Mainboards
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Das Diskettenlaufwerk in der DS10 Alpha-Systeme kann nicht von FreeBSD
benutzt werden. Der Kernel erkennt die Hardware zwar, allerdings
arbeitet das Laufwerk nicht richtig. Dieser Fehler betrifft nicht den
Systemstart und die Installation des Systems vom Diskettenlaufwerk.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2. Netzwerke und Netzwerkkarten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der neue Treiber
`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt USB-Netzwerkkarten auf Basis des ASIX Electronics AX88172
USB 2.0 Chipsatzes.

Der Treiber
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt jetzt auch Karten auf Basis der BCM5750 und BCM5751
Chips?tze.

Der Treiber
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt nun die die PCI Express Adapter 82541ER und 82546GB mit zwei
Ports.

Der Treiber
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
wurde hinzugef?gt. Der Treiber unterst?tzt PCI Gigabit Ethernet-Karten,
die ?ber einen Intel 82597EX Ethernet Controller verf?gen.

Die neue Netgraph-Node
`ng\_hub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hub&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt eine einfache Verteilung von Paketen, ?hnlich einem
Ethernet-Hub.

Im Treiber
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
wurde ein Fehler in der Handhabung von Jumbo-Frames behoben.

Der Treiber
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt jetzt den
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
Modus.

Der
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
Modus kann jetzt f?r jedes Interface separat aktiviert werden. Diese
Erweiterung wird zurzeit von den Treibern
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
und
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt. Die Erweiterung wird mit
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
gesteuert.

Ein Systemabsturz (*panic*), der auftrat, wenn net.inet.ip.rtexpire
und/oder net.inet6.ip6.rtexpire auf 0 gesetzt waren, ist behoben.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3. Netzwerk-Protokolle
^^^^^^^^^^^^^^^^^^^^^^^^^^

F?r die Auswahl eines nicht-privilegierten Ports wird jetzt eine von
OpenBSD stammende Routine verwendet. Diese Routine ist standardm??ig
aktiviert und kann ?ber die Sysctl-Variable
net.inet.ip.portrange.randomized abgeschaltet werden. Die zuf?llige
Auswahl der Ports f?hrt bei hohen Verbindungsraten zu einer schnellen
Wiederverwendung von Ports und kann Probleme bereiten. Um die Sicherheit
zuf?lliger Ports zu behalten, wird diese Funktion bei hohen
Verbindungsraten abgestellt. Wenn die Verbindungsrate den Wert der
Sysctl-Variablen net.inet.ip.portrange.randomcps (Vorgabe ist 10)
?bersteigt, wird die Funktion f?r die durch die Sysctl-Variablen
net.inet.ip.portrange.randomtime gegebene Dauer (Vorgabe 45 Sekunden)
abgestellt.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt jetzt Lookup-Tables. Diese Erweiterung ist sehr n?tzlich,
wenn gro?e Mengen Adressen verarbeitet werden m?ssen, die sich nicht
zusammenfassen lassen.

`ipnat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipnat&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
besitzt nun Regeln, die andere als TCP- oder UPD-Pakete umleiten.

Die Handhabung von RST-Paketen im FreeBSD TCP/IP-Stack wurde verbessert.
Die ?nderung erschwert Angriffe und bleibt dennoch kompatibel zu den
meisten TCP/IP-Stacks. Der verwendete Algorithmus l?sst sich wie folgt
beschreiben: Verbindungen im Zustand ESTABLISHED akzeptieren nur
RST-Pakete mit der Sequenznummer (*sequence number*) aus
last\_ack\_sent. Alle anderen Pakete werden verworfen. Verbindungen in
anderen Zust?nden werden beim Empfang eines RST-Pakets beendet; weitere
Pakete werden verworfen. Dieser Algorithmus verletzt den RFC 793. Sie
k?nnen das alte Verhalten aktivieren, wenn Sie die neue Sysctl-Variable
net.inet.tcp.insecure\_rst auf 1 setzen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4. Festplatten und Massenspeicher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Neu ist der Treiber
`ips(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ips&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__.
Der Treiber unterst?tzt IBM/Adaptec ServeRAID Controller.

Der Treiber
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt nun die LSI Logic FC929X Dual 2Gb/s Fibre Channel Karte.

Der Treiber
`trm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=trm&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
unterst?tzt nun DC395U2W-Controller. Die Probleme mit hohen Auslastungen
sind behoben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
~~~~~~~~~~~~~~~~~~~~~~

Wird
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
mit der neuen Option -j aufgerufen, verz?gert das Programm die
Ausf?hrung von Cron-Jobs f?r normale Benutzer um eine kurze, zuf?llige
Zeitspanne. Die ebenfalls neue Option -J stellt dieselbe Funktion f?r
Cron-Jobs des Super-Users bereit. Zweck dieser Erweiterung ist es,
Lastspitzen zu vermeiden, wenn viele Cron-Jobs zum gleichen Zeitpunkt
starten sollen.

Der neue Schalter -m von
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
gibt nun das fwmem-Ziel vor.

Die Variable $inetd\_flags in ``/etc/defaults/rc.conf`` enth?lt nun
standardm??ig die Option -C 60.

Die Bibliothek **libc** stellt nun
`eui64(3) <http://www.FreeBSD.org/cgi/man.cgi?query=eui64&sektion=3&manpath=FreeBSD+4.11-RELEASE>`__
Funktionen bereit.

Die von
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
genutzten Routinen f?r Link Quality Monitoring (LQM) wurden vollst?ndig
neu geschrieben. Das in RFC 1989 beschriebene LQM erlaubt PPP, die
Qualit?t der Verbindung zu ?berwachen.

Wird bei
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
das neue Kommando \`\`set rad\_alive N'' benutzt, werden in regelm??igen
Abst?nden RADIUS Accounting Informationen an den RADIUS-Server gesendet.

In
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
wurde ein Fehler behoben, der verhinderte, dass der Dienst richtig lief,
wenn eine Netzwerk-Schnittstelle mehr als eine IP-Adresse hatte.

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
kennt nun die Facility LOG\_NTP.

In
`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1&manpath=FreeBSD+4.11-RELEASE>`__
wurden verschiedene \`\`off-by-one'' Fehler und Puffer?berl?ufe
entfernt.

Mit
`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+4.11-RELEASE>`__
lassen sich nun NORID (die norwegische Registrierungsstelle) und der
deutsche whois-Server abfragen. Mit dem Schalter -k l?sst sich die
koreanische Registrierungsstelle ``whois.krnic.net`` (National Internet
Development Agency of Korea) abfragen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~

**CVS** wurde von der Version 1.11.15 auf die Version 1.11.17
aktualisiert.

**sendmail** wurde von der Version 8.12.11 auf die Version 8.13.1
aktualisiert.

Die Quellen von **GNU patch** wurden aus dem Verzeichnis
``src/contrib/patch`` entfernt. FreeBSD benutzt schon seit fast sieben
Jahren die Quellen aus dem Verzeichnis ``src/gnu/usr.bin/patch``.

Die Datenbank f?r die Zeitzonen wurde von der Version \ **tzdata2004e**
auf die Version \ **tzdata2004g** aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5. Erzeugung von Releases und Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**GNOME** wurde von der Version 2.6 auf die Version 2.8.2 aktualisiert.
Eine Liste der ?nderungen jeder Komponente enth?lt die Nachricht unter
der URL
http://mail.gnome.org/archives/gnome-announce-list/2004-December/msg00026.html.

**KDE** wurde von der Version 3.2.2 auf die Version 3.3.2 aktualisiert.

Die Benutzerwerkzeuge der Linux-Bin?rkompatibilit?t wurden von
```linux_base-6`` <http://www.FreeBSD.org/cgi/url.cgi?ports/linux_base-6/pkg-descr>`__
(beruht auf Red Hat Linux 7.1) auf
```linux_base-8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/linux_base-8/pkg-descr>`__
(beruht auf Red Hat Linux 8.0) aktualisiert.

Die Release des **X Window System** wurde auf **XFree86** 4.4.0
aktualisiert. **Xorg** X11R6.8.1 steht in der Ports-Collection zur
Verf?gung
(```x11/xorg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__).

Die Variable NOSECURE wurde aus der Datei ``make.conf`` entfernt. Sie
konnte nicht mehr benutzt werden und wurde auch nicht mehr gepflegt.
Wenn Sie die Variable NOSECURE benutzt haben, benutzen Sie stattdessen
die Variable NOCRYPT.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktualisierung einer ?lteren Version von FreeBSD
---------------------------------------------------

Wenn Sie eine ?ltere Version von FreeBSD aktualisieren wollen, haben Sie
drei M?glichkeiten:

-  Die bin?re Aktualisierung mit
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__.
   Diese Variante ben?tigt die wenigste Zeit, allerdings geht sie davon
   aus, dass Sie keine Optionen zur Kompilierung von FreeBSD genutzt
   haben.

-  Die komplette Neuinstallation von FreeBSD. Dadurch f?hren Sie
   nat?rlich keine echte Aktualisierung durch und es ist auf jeden Fall
   nicht so bequem wie die bin?re Aktualisierung, da Sie ihre
   Konfigurationsdaten in ``/etc`` selbst sichern und wiederherstellen
   m?ssen. Dennoch kann diese Option sinnvoll sein, wenn Sie die
   Aufteilung der Partitionen ?ndern wollen oder m?ssen.

-  Mit dem Quellcode in ``/usr/src``. Diese Variante ist flexibler,
   ben?tigt aber mehr Plattenplatz, Zeit, und Erfahrung. Weitere
   Informationen zu diesem Thema finden Sie im Kapitel `\`\`Das
   komplette Basissystem neu
   bauen'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/makeworld.html>`__
   des `FreeBSD
   Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.
   Eine Aktualisierung einer sehr alten Version von FreeBSD kann mit
   Problemen verbunden sein; in diesen F?llen ist es effektiver, eine
   bin?re Aktualisierung oder eine komplette Neuinstallation
   durchzuf?hren.

Bitte lesen Sie den Inhalt der Datei ``INSTALL.TXT`` und zwar *bevor*
Sie mit der Aktualisierung beginnen. Wenn Sie den Quellcode zur
Aktualisierung nutzen, sollten Sie auf jeden Fall auch
``/usr/src/UPDATING`` lesen.

Zum guten Schluss: Wenn Sie auf eine der m?glichen Arten die
FreeBSD-Entwicklungszweige -STABLE oder -CURRENT nutzen, sollten Sie auf
jeden Fall das Kapitel `\`\`-CURRENT vs.
-STABLE'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/current-stable.html>`__
im `FreeBSD
Handbuch <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__
lesen.

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
ftp://ftp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
