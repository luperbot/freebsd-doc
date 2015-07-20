======================================
FreeBSD/ia64 5.1-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/ia64 5.1-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 von The FreeBSD Documentation Project

Copyright © 2002, 2003 von The FreeBSD German Documentation Project

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 5.1-RELEASE enthalten eine ?bersicht ?ber
aktuelle ?nderungen in FreeBSD im Entwicklungszweig 5-CURRENT. Dieses
Dokument enth?lt die Liste aller Sicherheitshinweise, die seit der
letzten Version herausgegeben wurden, sowie eine ?bersicht ?ber die
wichtigsten ?nderungen am Kernel und an den Benutzerprogrammen. Einige
kurze Anmerkungen zum Thema Aktualisierung wurden ebenfalls aufgenommen.

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
2.2.2. `?nderungen im Bootloader <#BOOT>`__
2.2.3. `Netzwerke und Netzwerkkarten <#NET-IF>`__
2.2.4. `Netzwerk-Protokolle <#NET-PROTO>`__
2.2.5. `Festplatten und Massenspeicher <#DISKS>`__
2.2.6. `Dateisystem <#FS>`__
2.2.7. `Unterst?tzung f?r PCCARD <#PCCARD>`__
2.2.8. `Multimedia <#MM>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.4. `Zus?tzliche Software <#CONTRIB>`__
2.5. `Infrastruktur f?r Ports und Packages <#PORTS>`__
2.6. `Erzeugung von Releases und Integration <#RELENG>`__
2.7. `Dokumentation <#DOC>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
=============

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 5.1-RELEASE auf
IA-64 Systemen. Es beschreibt die Komponenten von FreeBSD, die in
letzter Zeit hinzugef?gt, ge?ndert, oder gel?scht wurden. Au?erdem
erhalten Sie Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 5.1-RELEASE ist eine release
Distribution. Sie k?nnen Sie von ftp://ftp.FreeBSD.org/ und allen seinen
Mirrors erhalten. Weitere Informationen, wie Sie diese (oder andere)
release Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.

Anwender, die noch keine Erfahrung mit einer 5-CURRENT Version eines
FreeBSD release haben, sollten auf jeden Fall die \`\`Hinweise f?r die
ersten Anwender von FreeBSD 5.1-RELEASE'' lesen. Dieses Dokument sollte
?berall dort verf?gbar sein, wo auch die Release Notes verf?gbar sind;
entweder als Teil einer FreeBSD Distribution oder auf den FreeBSD
Webseiten. Es enth?lt wichtige Informationen ?ber die Vor- und Nachteile
des Betriebs von FreeBSD 5.1-RELEASE im Vergleich zum Betrieb eines
Systems auf der Basis der Entwicklungszweiges 4-STABLE.

Alle Anwender sollten vor der Installation von FreeBSD die Release Notes
lesen. Die Errata enthalten \`\`brandhei?e'' Informationen, die erst
kurz vor oder nach der Ver?ffentlichung bekannt wurden. Dies sind
typischerweise Informationen ?ber bekannte Probleme, Hinweise zum Thema
Sicherheit und Korrekturen der Dokumentation. Die jeweils aktuelle
Version der Errata zu FreeBSD 5.1-RELEASE finden Sie auf den FreeBSD
Webseiten.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
=============

In diesem Artikel finden Sie viele der f?r den Anwender
offensichtlichsten Neuerungen und ?nderungen in FreeBSD seit
5.0-RELEASE. Dazu geh?ren sowohl die ?nderungen, die nur 5.0-RELEASE
betreffen, als auch ?nderungen in den anderen Entwicklungszweigen seit
FreeBSD 5.0-RELEASE. Letztere sind als [MERGED] gekennzeichnet.

Die Eintr?ge umfassen alle Sicherheitshinweise, die nach dem Erscheinen
von 5.0-RELEASE herausgegeben wurden, neue Treiber bzw. Unterst?tzung
f?r neue Hardware, neue Befehle oder Optionen, die Behebung wichtiger
Fehler, und Aktualisierungen von zus?tzlicher Software. Sie k?nnen
ebenfalls ?nderungen bei den wichtigeren Ports/Packages und bei der
Erzeugung der Releases dokumentieren. Es sollte offensichtlich sein, da?
die Release Notes nicht jede einzelne ?nderung in FreeBSD auff?hren
k?nnen; dieses Dokument konzentriert sich auf Sicherheitshinweise, f?r
den Anwender sichtbare ?nderungen und die wichtigsten Verbesserungen der
Infrastruktur.

.. raw:: html

   <div class="SECT2">

--------------

2.1. Sicherheit
---------------

Ein ?ber das Netzwerk nutzbarer Fehler in **CVS** k?nnte dazu f?hren,
da? ein Angreifer beliebige Programme auf dem CVS Server ausf?hren kann.
Weitere Informationen finden Sie in
`FreeBSD-SA-03:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:01.cvs.asc>`__.
[MERGED]

Durch Auswertung der Antwortzeiten von **OpenSSL** w?re es einem
Angreifer mit sehr viel Rechenleistung m?glich gewesen, unter bestimmten
Umst?nden den Klartext der ?bermittelten Daten zu erhalten. Dieser
Fehler durch die neue **OpenSSL** Version 0.9.7 behoben. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:02.openssl.asc>`__.
[MERGED]

Die Sicherheit und Leistung der Erweiterung \`\`syncookies'' wurde
verbessert, damit Angreifer es schwerer haben, eine Verbindung zu
f?lschen. Weitere Informationen finden Sie in
`FreeBSD-SA-03:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:03.syncookies.asc>`__.
[MERGED]

Diverse ?ber das Netzwerk nutzbare Puffer-?berl?ufe in **sendmail**
wurden durch die Aktualisierung von **sendmail** behoben. Weitere
Information finden Sie in
`FreeBSD-SA-03:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:04.sendmail.asc>`__
und
`FreeBSD-SA-03:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:07.sendmail.asc>`__.
[MERGED]

In der XDR-Implementierung wurde ein Fehler behoben, der es einem
Angreifer m?glich machte, den Dienst abst?rzen zu lassen. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:05.xdr.asc>`__.
[MERGED]

In **OpenSSL** wurden zwei vor kurzem ver?ffentlichte Schwachstellen
repariert. Weitere Informationen finden Sie in
`FreeBSD-SA-03:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:06.openssl.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. ?nderungen im Kernel
-------------------------

`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.1-release>`__
ist nicht mehr optional, die Option ``NODEVFS`` kann nicht mehr f?r die
Konfigurationsdatei f?r einen angepa?ten Kernel verwendet werden.

Der neue Treiber
`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+5.1-release>`__
unterst?tzt das bei USB 2.0 Controller verwendete USB Enhanced Host
Controller Interface.

Bei der Behandlung der Zugriffsrechte f?r ``/dev/tty`` wurde ein kleiner
Fehler behoben. Dadurch ist es jetzt auch wieder m?glich,
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.1-release>`__
zu verwenden, nachdem man
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.1-release>`__
benutzt hat.

In
`fstat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fstat&sektion=2&manpath=FreeBSD+5.1-release>`__
wurde ein Fehler beseitigt, durch den bei der Benutzung von TCP Sockets
immer ``0`` zum Lesen verf?gbare Zeichen gemeldet wurden. Die Option
``NOTE_LOWAT`` f?r ``EVFILT_READ`` funktioniert auch wieder.

Bei
`madvise(2) <http://www.FreeBSD.org/cgi/man.cgi?query=madvise&sektion=2&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt ``MADV_PROTECT``, mit dem ein Proze? das Virtual
Memory System dar?ber informieren kann, da? er "wichtig" ist und nicht
beendet werden sollte, wenn kein Swapspace mehr zur Verf?gung steht.
Diese Option steht nur f?r Prozesse zur Verf?gung, die mit
Superuser-Rechten laufen.

Die Scheduler-Infrastruktur wurde um einen zweiten Scheduler erg?nzt,
der f?r alle Anwendungsbereiche einsetzbar ist und viele Vorteile f?r
SMP bietet. In der Konfigurationsdatei f?r den Kernel mu? genau ein
Scheduler ausgew?hlt werden. Der bisher verwendete Scheduler wird mit
``options SCHED_4BSD`` aktiviert. Der neue (noch experimentelle)
Scheduler kann mit ``options SCHED_ULE`` aktiviert werden.

Die Major Numbers f?r Ger?te werden jetzt dynamisch alloziert. Dadurch
sinkt die Notwendigkeit f?r eine zentrale, statische Tabelle mit den
Zuordnungen von Major Numbers zu Ger?tetreibern (einige Treiber behalten
aus Gr?nden der Kompatibilit?t ihre alten Major Numbers), au?erdem ist
es nicht mehr so wahrscheinlich, da? der Nummernkreis f?r die Major
Numbers ersch?pft wird.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1. Unterst?tzung f?r Prozessoren und Mainboards
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Mit dem neuen Treiber
`vpd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vpd&sektion=4&manpath=FreeBSD+5.1-release>`__
k?nnen auf IBM ThinkPad Laptops die Hardware-Informationen aus der Vital
Product Data Stuktur ausgelesen werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2. ?nderungen im Bootloader
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Das Verzeichnis ``/modules`` war in FreeBSD 4.\ ``X`` das
Standard-Verzeichnis f?r Module. Es ist nicht mehr Teil des
Standard-Pfades f?r ``kern.module_path``. Module anderer Hersteller
sollten in ``/boot/modules`` abgelegt werden.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** F?r FreeBSD 4.\ ``X`` vorgesehene Module bringen das
    System in der Regel zum Absturz, wenn sie von FreeBSD 5.1-RELEASE
    Kernel geladen werden und sollten nur mit ?u?erster Vorsicht
    eingesetzt werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3. Netzwerke und Netzwerkkarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Treiber cm unterst?tzt jetzt IPX.

Das neue
`wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan&sektion=4&manpath=FreeBSD+5.1-release>`__
Modul bietet Unterst?tzung f?r die 802.11 Verbindungsschicht. Die
Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.1-release>`__
und
`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.1-release>`__
wurden ge?ndert, um dieses Modul nutzen zu k?nnen.

Im Treiber
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.1-release>`__
wurde ein Zeitfehler beseitigt, durch den es bei der Konfiguration eines
Netzwerkanschlusses zu einer Kernel Panic und anderen Fehlern kommen
konnte.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4. Netzwerk-Protokolle
~~~~~~~~~~~~~~~~~~~~~~~~~~

Es ist jetzt wieder m?glich, bei
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.1-release>`__
``skipto`` zusammen mit dem Schl?sselwort ``log`` zu benutzen. Auch die
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.1-release>`__
``uid`` Regeln funktionieren jetzt wieder.

Es ist jetzt m?glich, bei der Konfiguration des Kernels die beiden
Optionen ``FAST_IPSEC`` und ``INET6`` anzugeben. Allerdings ist es immer
noch nicht m?glich, beide Optionen gleichzeitig zu nutzen.

In TCP NewReno wurde ein Fehler behoben, durch den der \`\`Fast
Recovery'' Modus zu fr?h beendet wurde, falls NewReno aktiviert war.
[MERGED]

TCP unterst?tzt jetzt den in RFC 3042 vorgeschlagenen Mechanismus
\`\`Limited Transmit'', der in bestimmten F?llen die Effektivit?t der
TCP Loss Recovery verbessern kann. Die Erweiterung ist standardm??ig
deaktiviert und kann mit der Sysctl-Variablen ``net.inet.tcp.rfc3042``
aktiviert werden. Weitere Informationen finden Sie in
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.1-release>`__.

TCP unterst?tzt jetzt die gr??ere initiale Congestion Windows, wie in
RFC 3390 beschrieben. Durch diese Erweiterung kann sich der
Datendurchsatz bei kurzen Transfers und Verbindungen mit gro?er
Bandbreite und hoher Verbindungszeit verbessern. Die Erweiterung ist
standardm??ig deaktiviert und kann mit der Sysctl-Variablen
``net.inet.tcp.rfc3390`` aktiviert werden. Weitere Informationen finden
Sie in
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.1-release>`__.

Die Routinen zum Zusammensetzen von fragmentierten IP-Paketen arbeiten
jetzt besser, wenn eine gro?e Anzahl Fragmente empfangen wird. Ziel der
?nderung war, eine bessere Resistenz gegen Denial-of-Service Angriffe
mit Paket-Fragmenten zu erreichen.

TCP-Verbindungen im Status ``TIME_WAIT`` nutzen jetzt einen speziellen
Protocol Control Block, der kleiner als der ?bliche TCP PCB ist. Dadurch
ist es m?glich, einige der von einer solchen Verbindung genutzten
Datenstrukturen und Ressourcen fr?her freizugeben.

Es ist jetzt m?glich, die Ports zu definieren, die als
\`\`privilegiert'' gelten (TCP und UDP Ports, f?r die nur der Super-User
`bind(2) <http://www.FreeBSD.org/cgi/man.cgi?query=bind&sektion=2&manpath=FreeBSD+5.1-release>`__
aufrufen darf). Der Bereich kann mit den Sysctl-Variablen
``net.inet.ip.portrange.reservedlow`` und
``net.inet.ip.portrange.reservedhigh`` angegeben werden, diese sind
standardm??ig auf die vorher verwendeten Werte gesetzt. Diese
Erweiterung soll es erm?glichen, da? sich Server-Prozesse an eigentlich
privilegierte Ports binden k?nnen, ohne Superuser-Rechte zu ben?tigen.
Weitere Informationen finden Sie in
`ip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip&sektion=4&manpath=FreeBSD+5.1-release>`__.

Im nicht-blockierenden RPC Code wurden diverse Fehler beseitigt. Dadurch
k?nnen Anwender von
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8&manpath=FreeBSD+5.1-release>`__
wieder Dateisysteme von einem 5.1-RELEASE Server mounten.

Die XNS Protokollfamilie funktioniert seit ?ber sieben Jahren nicht
mehr, darum wurde die Unterst?tzung daf?r jetzt entfernt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5. Festplatten und Massenspeicher
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Treiber
`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+5.1-release>`__
l?uft jetzt v?llig unabh?ngig vom Giant Kernel Lock. Dadurch ergibt sich
auf SMP-Systemen mit mehreren gleichzeitig stattfindenden
I/O-Operationen eine Leistungssteigerung von fast 20%.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt alle bekannten Chips?tze von SiS, eine detaillierte
Liste finden Sie in den Hardware Notes.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt die Promise SATA150 TX2 und TX4 Serial ATA/150
Controller.

Beim Herunterfahren des Systems weist der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.1-release>`__
jetzt alle Ger?te an, eventuell noch ausstehende Schreiboperationen
sofort zu t?tigen (flush). Ger?te, die diese Operation nicht
unterst?tzen, reagieren darauf eventuell mit einer Fehlermeldung, die
auf der Systemkonsole angezeigt wird.

Die CAM Schicht unterst?tzt jetzt Ger?te mit mehr als 2\ :sup:`32`
Bl?cken, was bei einer Blockgr??e von 512 Byte einer Gr??te von 2 TByte
entspricht.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Anwender, die diese ?nderung in ihr System aufnehmen,
    m?ssen alle Programme neu kompilieren, die
    `pass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pass&sektion=4&manpath=FreeBSD+5.1-release>`__
    oder
    `xpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xpt&sektion=4&manpath=FreeBSD+5.1-release>`__
    verwenden. Dazu geh?ren unter anderem
    `camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+5.1-release>`__
    aus dem Basissystem und die Ports ``sysutils/cdrtools`` und
    ``multimedia/xmms``.

.. raw:: html

   </div>

Der Treiber
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.1-release>`__
wurde in diversen Punkten ?berarbeitet. Das wichtigste sichtbare
Ergebnis ist eine verbesserte Kompatibilit?t zu diversen
ATAPI/USB/Firewire CD-ROM Laufwerken.

`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.1-release>`__
ist nicht mehr optional, die Option ``NO_GEOM`` kann nicht mehr in der
Konfigurationsdatei f?r einen angepa?ten Kernel angegeben werden.

Der Treiber
`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.1-release>`__
wurde aktualisiert, dadurch sollten die bei der Installation
aufgetretenen Probleme mit nicht erkannten Festplatten behoben sein.

Im Treiber
`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+5.1-release>`__
wurde ein Fehler beseitigt, der zu \`\`H?ngern'' f?hren konnte.

UFS und UFS2 Dateisysteme k?nnen jetzt mit Namen versehen werden. Diese
Namen sind Zeichenketten, die ein Dateisystem identifizieren und nicht
vom verwendeten Ger?t abh?ngen. Die Namen k?nnen bei
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.1-release>`__
und
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-L`` angegeben werden. Wird das Modul
``GEOM_VOL`` genutzt, k?nnen die Dateisysteme in ``/dev/vol`` direkt
?ber ihren Namen angesprochen werden.

Das Root-Dateisystem kann jetzt auch auf einer
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.1-release>`__-Partition
liegen. Weitere Informationen finden Sie in der Onlinehilfe zu
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.1-release>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6. Dateisystem
~~~~~~~~~~~~~~~~~~

Mit der neuen Kernel-Option ``DIRECTIO`` ist es m?glich, Daten direkt
(unter Umgehung des Buffer Cache im Kernel) in den Speicherbereich eines
Programms zu lesen. Um diese Erweiterung nutzen zu k?nnen, mu? bei dem
entsprechenden Dateideskriptor das Flag ``O_DIRECT`` gesetzt sein,
au?erdem m?ssen sowohl der Offset als auch die L?nge der Leseoperation
ein ganzzahliges Vielfaches der physikalischen Sektorgr??e sein.

NETNCP und die Unterst?tzung f?r Netware Dateisysteme (nwfs)
funktionieren wieder.

Beim Versuch, die Verbindung zu einem smbfs Share zu trennen, konnte es
zu Fehlermeldungen und Kernel Panics kommen; diese Fehler wurden
beseitigt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.7. Unterst?tzung f?r PCCARD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.8. Multimedia
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
----------------------

`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+5.1-release>`__
geht jetzt korrekt mit Pa?w?rtern um, die Shell-Sonderzeichen enthalten.

Bei
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+5.1-release>`__
kann jetzt mit der Option ``-g`` die Standardgruppe eines Benutzers
gesetzt werden.

Mit
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8&manpath=FreeBSD+5.1-release>`__
steht ein Ersatz f?r das fr?her genutzte disklabel zur Verf?gung. Es
kann wie sein Vorg?nger das BSD-Label auf einer Festplattenpartition
installieren, untersuchen und modifizieren sowie die Routinen f?r den
Systemstart installieren. Im Vergleich zu disklabel wurden einige
Optionen und Parameter entfernt, die nicht mehr ben?tigt werden. Mit dem
neuen Parameter ``-m`` kann
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8&manpath=FreeBSD+5.1-release>`__
angewiesen werden, das Layout auf eine bestimmte Maschine anzupassen.

Wird bei
`chgrp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chgrp&sektion=1&manpath=FreeBSD+5.1-release>`__
und
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8&manpath=FreeBSD+5.1-release>`__
der Parameter ``-v`` mehrfach angegeben, geben sie bei jeder ?nderung
der UID und GID den alten und neuen Wert aus.

>\ `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.1-release>`__
kennt jetzt das Schl?selwort ``nodevice``, das bei der Konfiguration
eines angepa?ten Kernels verwendet werden kann, um die Wirkung einer
vorher gesetzten ``device`` Anweisung aufzuheben. Die neuen
Schl?sselworte ``nooption`` und ``nomakeoption`` heben die Wirkung von
vorher gesetzten ``options`` bzw. ``makeoptions`` Anweisungen auf.

Das neue Programm
`diskinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=diskinfo&sektion=8&manpath=FreeBSD+5.1-release>`__
zeigt Informationen ?ber Festplatten und vergleichbare Ger?te an. Es
kann auch f?r einen extrem simplen Leistungstest genutzt werden.

Das Programm disklabel wurde durch
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8&manpath=FreeBSD+5.1-release>`__
ersetzt. Auf den Plattformen alpha, i386 und pc98 ist disklabel jetzt
ein Link auf
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8&manpath=FreeBSD+5.1-release>`__.

Wird bei
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.1-release>`__
die neue Option ``-C`` angegeben, wird ein Cache f?r Datenbl?cke der
Festplatte eingerichtet. Dadurch steigt die Performance von
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.1-release>`__,
kann aber dazu f?hren, da? zwischen den einzelnen L?ufen erfolgende
?nderungen des Dateisystems nicht erkannt werden.

Wird
`dumpfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dumpfs&sektion=8&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-m`` aufgerufen, zeigt es die
Dateisystemparameter in Form einer Befehlszeile f?r
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.1-release>`__
an.

Das neue Programm
`elfdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=elfdump&sektion=1&manpath=FreeBSD+5.1-release>`__
kann Informationen ?ber ausf?hrbare Dateien im
`elf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=elf&sektion=5&manpath=FreeBSD+5.1-release>`__
Format anzeigen.

`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+5.1-release>`__
nutzt die aus der Bibliothek
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3&manpath=FreeBSD+5.1-release>`__
stammende Unterst?tzung f?r ``.netrc`` Dateien; au?erdem kann mit der
neuen Option ``-N`` eine andere ``.netrc`` Datei angegeben werden.

`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt ``.netrc`` Dateien; weitere Informationen dazu finden
Sie in
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+5.1-release>`__.

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-h`` aufgerufen, werden in den Server-Meldungen
keine Informationen ?ber das System (wie die
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.1-release>`__
Versionsnummer oder der Systemname) angegeben. [MERGED]

Bei
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.1-release>`__
kann jetzt mit der neuen Option ``-P`` angegeben werden, auf welchem
Port eingehende Verbindungen erwartet werden sollen. Die Portnummer f?r
den Daten-Port ist nicht mehr hart verdraht, sondern immer eins kleiner
als die des Ports f?r die Kommandos. [MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt eine erweiterte Version der Datei ``/etc/ftpchroot``.
Weitere Informationen finden Sie in der ebenfalls neuen Online-Hilfe zu
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5&manpath=FreeBSD+5.1-release>`__.
[MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt ein erweitertes Format f?r die Namen der
Home-Verzeichnis, das gleichzeitig ein Startverzeichnis f?r
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.1-release>`__
definiert; dieses Verzeichnis wird dann als Startpunkt f?r eine
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.1-release>`__-Umgebung
genutzt. Zu diesem Zweck wird die Sequenz ``/./`` genutzt, die auch von
anderen FTP-Servern f?r diesen Zweck genutzt wird. Diese Sequenz kann
sowohl in
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5&manpath=FreeBSD+5.1-release>`__
als auch in
`passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+5.1-release>`__
genutzt werden. [MERGED]

`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt die Optionen ``-R`` und ``-S`` zum Empfang und Senden
von DV-Datenstr?men. [MERGED]

Das neue Programm
`gstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstat&sektion=8&manpath=FreeBSD+5.1-release>`__
zeigt Daten ?ber die Festplattenzugriffe innerhalb des
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.1-release>`__
Subsystems.

Die neuen
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.1-release>`__-Befehle
``enable`` und ``disable`` k?nnen zur Kontrolle verschiedener Aspekte
der
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.1-release>`__-Funktionalit?t
genutzt werden, bis hin zur Aktivierung und Deaktivierung der gesamten
Firewall. Im Vergleich mit den bereits existierenden sysctl-Variablen
ist dieses Interface einfacher zu bedienen und besser zug?nglich.

Wird
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+5.1-release>`__
mit dem Parameter ``-i`` aufgerufen, gibt es einen Namen f?r das gerade
erzeugte Jail aus.

Mit dem neuen Programm
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8&manpath=FreeBSD+5.1-release>`__
kann ein Befehl innerhalb eines existierenden Jail ausgef?hrt werden.

Das neue Programm
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8&manpath=FreeBSD+5.1-release>`__
zeigt die Liste der existierenden Jails an.

`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1&manpath=FreeBSD+5.1-release>`__
wurde von ``/usr/bin`` nach ``/bin`` verschoben, damit es auch in den
ersten Phasen des Systemstarts zur Verf?gung steht, wenn lediglich das
Root-Dateisystem gemountet ist.

Bei
`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+5.1-release>`__
kann man jetzt mit dem neuen Parameter ``-j`` alle Prozesse innerhalb
eines Jails beenden.

Die neue Bibliothek
`libgeom(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libgeom&sektion=3&manpath=FreeBSD+5.1-release>`__
erlaubt normalen Programmen den Zugriff auf einige Funktionen des
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.1-release>`__
Subsystems.

Das neue MAC Policy Modul mac\_portacl ist jetzt verf?gbar. Es stellt
einen einfachen ACL-Mechanismus zur Verf?gung, mit dem Benutzern und
Gruppen erlaubt werden kann,
`bind(2) <http://www.FreeBSD.org/cgi/man.cgi?query=bind&sektion=2&manpath=FreeBSD+5.1-release>`__
f?r TCP oder UDP Ports aufzurufen. Das Modul soll in der Regel zusammen
mit der neuen Sysctl-Variablen ``net.inet.ip.portrange.reservedhigh``
eingesetzt werden.

Das Skript ``MAKEDEV`` wird nicht mehr ben?tigt und wurde entfernt, da
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.1-release>`__
jetzt auf allen Systemen verwendet werden mu?.

Wird
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-P`` aufgerufen, legt es eine Sicherheitskopie
der ersetzten Dateien an.

`mixer(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mixer&sektion=8&manpath=FreeBSD+5.1-release>`__
unterst?tzt relative ?nderungen der Lautst?rke.

Das neue Programm
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.1-release>`__
vereinfacht die Erzeugung von FFS Snapshots. Das Programm ist SUID
``root`` und soll von Mitgliedern der Gruppe ``operator`` aufgerufen
werden.

Bei
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.1-release>`__
und
`umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8&manpath=FreeBSD+5.1-release>`__
kann jetzt mit ``-F`` eine andere Tabelle der Dateisysteme als
Alternative zu
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+5.1-release>`__
angegeben werden.

Wird
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-c`` aufgerufen, ruft es f?r UDP Mount Points
nicht mehr
`connect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=connect&sektion=2&manpath=FreeBSD+5.1-release>`__
auf. Diese Option mu? gesetzt sein, wenn ein Server die Antworten nicht
vom Standardport 2049 verschickt oder die Antworten von einer anderen
IP-Adresse verschickt (dies kann bei Systemen mit mehreren
Netzwerkkarten auftreten). Wird die Sysctl-Variable
``vfs.nfs.nfs_ip_paranoia`` auf ``0`` gesetzt, ist diese Option
standardm??ig aktiv. [MERGED]

Bei
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8&manpath=FreeBSD+5.1-release>`__
kann man jetzt mit mit ``noinet4`` und ``noinet6`` die Verwendung von
IPv4 beziehungsweise IPv6 verhindern.

`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.1-release>`__
erzeugt jetzt standardm??ig UFS2 Dateisysteme, UFS1 Dateisysteme werden
nur noch erzeugt, wenn der Parameter ``-O1`` angegeben wird.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.1-release>`__
wurde in vielen Punkten erweitert:

-  Wird bei einem Eintrag (bzw. einer Gruppe von Eintr?gen, bei denen
   die Option ``G`` gesetzt ist) die neue Option ``W`` angeben, wird das
   Programm zur Kompression des Logfiles erst gestartet, wenn er die
   vorher gestarteten Packprogramme durchgelaufen sind. Dadurch soll
   verhindert werden, da? Systeme durch die gleichzeitige Kompression
   mehrerer gro?er Logfiles ?berlastet werden. [MERGED]

-  Die \`\`default rotate action'' legt fest, wie Daten behandelt
   werden, die zwar rotiert werden sollen, aber nicht explizit in der
   Konfiguration erw?hnt wurden. [MERGED]

-  Die Angabe des Parameters ``-s`` auf der Kommandozeile sorgt daf?r,
   da? bei der Rotation von Logfiles keine Signale an Prozesse gesendet
   werden sollen. [MERGED]

-  Ist bei einem Eintrag in der Konfigurationsdatei die Option ``N``
   gesetzt, wird bei der Rotation dieses Logfiles kein Signal an einen
   Proze? geschickt. [MERGED]

-  Ist bei einem Eintrag in der Konfigurationsdatei die Option ``N``
   gesetzt, wird nach der Rotation dieses Logfiles ein Signal an eine
   Gruppe von Prozessen statt eines einzelnen Prozesses geschickt.
   [MERGED]

`nsdispatch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nsdispatch&sektion=3&manpath=FreeBSD+5.1-release>`__
kann jetzt von Threads genutzt werden und unterst?tzt jetzt auch Name
Service Switch (NSS) Module. NSS Module k?nnen fest in ``libc``
eingebunden werden oder mit
`dlopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=dlopen&sektion=3&manpath=FreeBSD+5.1-release>`__
dynamisch nachgeladen werden. Sie werden bei der Konfiguration geladen
und initialisiert, das hei?t wenn
`nsdispatch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nsdispatch&sektion=3&manpath=FreeBSD+5.1-release>`__
aufgerufen wird oder
`nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5&manpath=FreeBSD+5.1-release>`__
zum ersten Mal oder nach einer ?nderung eingelesen wird.

Das neue Modul
`pam\_chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_chroot&sektion=8&manpath=FreeBSD+5.1-release>`__
f?hrt eine
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.1-release>`__
Operation in ein vorgegebenes Verzeichnis oder in ein aus dem
Heimatverzeichnis des Benutzers abgeleitetes Verzeichnis aus.

`pam\_ssh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ssh&sektion=8&manpath=FreeBSD+5.1-release>`__
wurde komplett ?berarbeitet. Eine der Konsequenzen ist, da? es jetzt f?r
jede Sitzung einen
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1&manpath=FreeBSD+5.1-release>`__
startet; die alte Version versuchte, jede Sitzung mit dem
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1&manpath=FreeBSD+5.1-release>`__
zu verbinden, der von der ersten Sitzung gestartet wrude.

Wird bei
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.1-release>`__
die neue Option ``-D`` genutzt, wird bei den versendeten Paketen das Bit
\`\`Don't Fragment'' gesetzt.

Wird
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-M`` aufgerufen, verschickt es \`\`ICMP mask''
oder \`\`ICMP timestamp request'' statt der ?blichen \`\`ICMP echo''
Anfragen.

Bei
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.1-release>`__
k?nnen mit der neuen Option ``-z`` die \`\`Type of Service'' Bits der
versendeten Pakete definiert werden.

`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+5.1-release>`__
kann jetzt auch User anlegen, deren Namen mit dem Zeichen ``$`` endet,
diese ?nderung dient zur Vereinfachung der Administration von **Samba**
Servern. [MERGED]

`pwd\_mkdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pwd_mkdb&sektion=8&manpath=FreeBSD+5.1-release>`__
erzeugt die Pa?wort-Datenbanken ``/etc/pwd.db`` und ``/etc/spwd.db``
jetzt in einem Format, das nicht mehr von der Byte-Order des Systems
abh?ngig ist. Dadurch ist es m?glich, diese Datenbanken zwischen
Maschinen mit unterschiedlichen Architekturen auszutauschen. Das Format
enth?lt Versionsnummern f?r jeden Eintrag, um die Kompatibilit?t mit
alten Versionen zu gew?hrleisten.

In
`rand(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rand&sektion=3&manpath=FreeBSD+5.1-release>`__
wurde ein Fehler beseitigt, der dazu f?hren konnte, da? die Folge der
Zufallszahlen beim Wert ``0`` steckenblieb. Davon unabh?ngig sollte
`rand(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rand&sektion=3&manpath=FreeBSD+5.1-release>`__
nur f?r triviale Zwecke genutzt werden.

`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt dynamische Mappings f?r Anh?ngigkeiten zwischen shared
Objects. Diese optionale Erweiterung ist sehr n?tzlich, wenn man mit den
verschiedenen Thread-Bibliotheken experimentieren will. Allerdings ist
es standardm??ig nicht im Basissystem enthalten. Weitere Informationen
?ber die Aktivierung und Benutzung dieser Erweiterung finden Sie in
`libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+5.1-release>`__.

`sem\_open(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sem_open&sektion=3&manpath=FreeBSD+5.1-release>`__
arbeitet jetzt korrekt, wenn eine Semaphore mehrfach ge?ffnet wird;
dadurch kann ein Aufruf von
`sem\_close(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sem_close&sektion=3&manpath=FreeBSD+5.1-release>`__
das aufrufende Programm nicht mehr zum Absturz bringen.

Die Logik zur Initialisierung von
`srandom(3) <http://www.FreeBSD.org/cgi/man.cgi?query=srandom&sektion=3&manpath=FreeBSD+5.1-release>`__
wurde verbessert.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
legt neue Dateisysteme standardm??ig im Format UFS2 an, sofern der
Benutzer im Schritt "Label Disk" nichts explizit auf UFS1 umstellt.

Mit dem neuen Programm
`swapoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapoff&sektion=8&manpath=FreeBSD+5.1-release>`__
ist es m?glich, Swapping und Paging auf einem Ger?t abzuschalten. Das
ebenfalls neue Kommando
`swapctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapctl&sektion=8&manpath=FreeBSD+5.1-release>`__
stellt die von den anderen BSDs bekannte Benutzer-Interface f?r
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8&manpath=FreeBSD+5.1-release>`__
und
`swapoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapoff&sektion=8&manpath=FreeBSD+5.1-release>`__
zur Verf?gung.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Das Programm
    `swapoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapoff&sektion=8&manpath=FreeBSD+5.1-release>`__
    ist noch im Versuchsstadium.

.. raw:: html

   </div>

Bei
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.1-release>`__
ist jetzt m?glich, bei der Angabe einer System- oder
Programmspezifikation in der Konfigurationsdatei
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5&manpath=FreeBSD+5.1-release>`__
mehrere Systeme oder Programme anzugeben.

Wird
`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-ifstat`` aufgerufen, zeigt es den Datenflu? auf
den aktiven Netzwerk-Interfaces des Systems.

Das neue Programm
`usbhidaction(1) <http://www.FreeBSD.org/cgi/man.cgi?query=usbhidaction&sektion=1&manpath=FreeBSD+5.1-release>`__
kann auf Aktionen von USB HID Ger?ten und die konfigurierten Aktionen
ausf?hren.

Der neue Parameter ``-r`` von
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+5.1-release>`__
und
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+5.1-release>`__
erlaubt es, auch unvollst?ndige oder defekte Dateien zu bearbeiten, bei
denen der Vorspann oder auch die letzten Zeilen fehlen.

Bei
`vmstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vmstat&sektion=8&manpath=FreeBSD+5.1-release>`__
wurde die Implementierung f?r den Parameter ``-f`` (zur Anzeige der
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2&manpath=FreeBSD+5.1-release>`__
Statistiken) ?berarbeitet.

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.1-release>`__
unterst?tzt jetzt die neue Option ``-P``, um mehrere Versionen des
gleichen Programms parallel ausf?hren zu lassen.

Wird
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.1-release>`__
mit dem Parameter ``-o`` verwendet, reinitialisiert es ``/dev/tty`` f?r
das aufgerufene Programm, bevor es aufgerufen wird. Diese Erweiterung
wird ben?tigt, wenn das aufgerufene Programm interaktiv ist.

Es gibt jetzt die notwendige Infrastruktur f?r 1:1 Threading, bei dem es
f?r jeden pthread einer Anwendung genau eine KSE und einen Thread gibt.
Bei diesem System ?bernimmt der Kernel die Entscheidung, welcher Thread
aktiv ist; au?erdem ist er f?r die Zustellung aller Signale
verantwortlich. Um diese Funktionalit?t innerhalb eines Programms nutzen
zu k?nnen, mu? lediglich an Stelle der sonst verwendeten Bibliothek
``libc_r`` die Bibliothek ``libthr`` verwendet werden. Bitte beachten
Sie, da? diese Bibliothek (zur Zeit) nicht standardm??ig zur Verf?gung
steht. Das System f?r 1:1 Threading nutzt Teile der KSE-Routinen und ist
ein eingeschr?nkter Sonderfall der M:N Threading Infrastruktur, die zur
Zeit in der Entwicklung ist.

Die altbekannten BSD-Startscripte in ``/etc`` wurden durch das von
**NetBSD** ?bernommene ``rc.d`` System (auch \`\`rcNG'' genannt)
ersetzt. Die Funktionalit?t der alten Skripte wurde vollst?ndig erhalten
und Dateien wie ``/etc/rc.conf`` bleiben auch weiterhin der bevorzugte
Weg zur Konfiguration des Systems. Das ``rc.d`` System wurde seit
5.0-RELEASE standardm??ig benutzt, daher sollte diese ?nderung f?r die
meisten Anwender transparent sein. Anwender, die die alten Skripte
modifiziert haben, m?ssen sich darauf einstellen, da? die folgenden
Dateien aus dem Verzeichnis ``/etc`` entfernt wurden: ``rc.atm``,
``rc.devfs``, ``rc.diskless1``, ``rc.diskless2``, ``rc.i386``,
``rc.alpha``, ``rc.amd64``, ``rc.ia64``, ``rc.sparc64``, ``rc.isdn``,
``rc.network``, ``rc.network6``, ``rc.pccard``, ``rc.serial``,
``rc.syscons``, ``rc.sysctl``. Bei der Anwendung von
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+5.1-release>`__
ist es m?glich, diese Dateien automatisch entfernen zu lassen. Weitere
Informationen finden Sie in
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8&manpath=FreeBSD+5.1-release>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Zus?tzliche Software
-------------------------

Die **ACPI-CA** Routinen wurden von Version 20021118 auf Version
20030228 aktualisiert.

Die **awk**-Variante von Bell Labs ist jetzt in der Version vom
14. M?rz 2003 verf?gbar.

**BIND** steht jetzt in der Version 8.3.4 zur Verf?gung. [MERGED]

Alle Anwendungen aus dem **bzip2** Paket sind jetzt im Basissystem
verf?gbar (dies betrifft speziell ``bzip2recover``, das jetzt erzeugt
und installiert wird). [MERGED]

**CVS** steht jetzt in der Version 1.11.5 zur Verf?gung. [MERGED]

**FILE** steht jetzt in der Version 3.41 zur Verf?gung. [MERGED]

**GCC** steht jetzt in der Version 3.2.2 zur Verf?gung.

Die Bibliothek **gdtoa** stellt Funktionen zur Umwandlung von
Zeichenketten in Flie?kommazahlen und umgekehrt zur Verf?gung. Die zur
Zeit genutzte Version ist vom 24. M?rz 2003.

**groff** und die dazugeh?rigen Programmen wurden von Version 1.18.1 auf
Version 1.19 aktualisiert.

**IPFilter** steht jetzt in der Version 3.4.31 zur Verf?gung. [MERGED]

Der **ISC DHCP** Client steht jetzt in der Version 3.0.1RC11 zur
Verf?gung. [MERGED]

Der **ISC DHCP** Client enth?lt jetzt das Programm
`omshell(1) <http://www.FreeBSD.org/cgi/man.cgi?query=omshell&sektion=1&manpath=FreeBSD+5.1-release>`__
und die Bibliothek
`dhcpctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpctl&sektion=3&manpath=FreeBSD+5.1-release>`__,
mit denen das Verhalten des Client w?hrend des Betriebs beeinflu?t
werden kann.

**Kerberos IV** (in Form von **KTH eBones**) wird nicht mehr
unterst?tzt. Anwender, die diese Funktionalit?t ben?tigen, k?nnen den
Port oder das Package ``security/krb4`` installieren. Der Kerberos IV
Kompatibilit?tsmodus wurde aus Kerberos 5 entfernt, und die Namen der
Benutzerprogramme wurden von ``k5program`` in ``kprogram`` ge?ndert.

**Kerberos 5** wird jetzt beim ``buildworld`` standardm??ig mit erzeugt
und installiert. Es macht keinen Unterschied mehr, ob ``MAKE_KERBEROS5``
gesetzt ist oder nicht. Wenn Kerberos 5 nicht im Basissystem enthalten
sein soll, mu? die Variable ``NO_KERBEROS`` im Makefile gesetzt werden.

**libpcap** ist jetzt in der Lage, eine Auswahl unter den verschiedenen
Data Link Typen eines Interfaces zu treffen.

**lukemftpd** ist jetzt auf dem Stand vom 22. Januar 2003. Hinweis:
Dieses Programm wird standardm??ig weder erzeugt noch installiert.

**OpenPAM** wurde von der Version \`\`Citronella'' auf die Version der
\`\`Dianthus'' Release aktualisiert.

**OpenSSH** steht jetzt in der Version 3.6.1p1. zur Verf?gung.

**OpenSSL** steht jetzt in der Version 0.9.7a zur Verf?gung. Die
wichtigsten Neuerungen sind die Unterst?tzung f?r AES und
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+5.1-release>`__
Ger?te. [MERGED]

**sendmail** steht jetzt in der Version 8.12.9 zur Verf?gung. [MERGED]

`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+5.1-release>`__
steht jetzt in der Version 3.7.2 zur Verf?gung. [MERGED] Wird
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+5.1-release>`__
mit der neuen Option ``-L`` aufgerufen, zeigt es eine Liste der Data
Link Typen an, die auf einem Interface zur Verf?gung stehen; mit der
neuen Option ``-y`` kann angegeben werden, welcher Data Link Typ bei der
Aufzeichnung der Pakete genutzt werden soll.

**texinfo** wurde von der Version 4.2 auf die Version 4.5 aktualisiert.

Die Datenbank der Zeitzonen wurde von der Version ``tzdata2002d`` auf
die Version ``tzdata2003a`` aktualisiert. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5. Infrastruktur f?r Ports und Packages
-----------------------------------------

Die nur eine Zeile langen ``pkg-comment`` Dateien wurden aus allen Ports
entfernt und in das ``Makefile`` des jeweiligen Ports integriert.
Dadurch sinken die Plattenbelegung und der Inode-Verbrauch der
Ports-Sammlung erheblich. [MERGED]

Beim Download der Distributionsdateien f?r einen Port kann jetzt im
``Makefile`` mit der Variablen ``FETCH_REGET`` angegeben werden, wie oft
versucht werden soll, den Download einer Datei fortzusetzen, wenn die
MD5 Pr?fsumme nicht stimmt. Die Infrastruktur f?r die Ports unterst?tzt
ebenfalls die Wiederaufnahme unterbrochener Downloads.

Bei
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.1-release>`__
kann jetzt mit ``-C`` eine Liste von Packages definiert werden, die
nicht zu diesem Package kompatibel sind. Ist eines dieser Pakete bereits
installiert, weigert sich
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.1-release>`__,
das Paket zu installieren. Wenn das Paket trotzdem installiert werden
soll, mu?
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.1-release>`__
mit dem Parameter ``-f`` aufgerufen werden.

`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+5.1-release>`__
beachtet jetzt den Wert der Environment-Variable ``BLOCKSIZE``, wenn es
mit dem Parameter ``-b`` aufgerufen wird.

Bei
`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+5.1-release>`__
kann jetzt der Parameter ``-Q`` angegeben werden. Er bewirkt ein
?hnliches Verhalten wie der Parameter ``-q`` (quiet), allerdings wird
vor jeder Ausgabe der Name des gerade bearbeiteten Paketes ausgegeben.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6. Erzeugung von Releases und Integration
-------------------------------------------

**GNOME** steht jetzt in der Version 2.2.1 zur Verf?gung. [MERGED]

**KDE** steht jetzt in der Version 3.1.2 zur Verf?gung. [MERGED]

Es gibt keine separate ``krb5`` Distribution mehr. Die Kerberos 5
Bibliotheken und Programme sind jetzt Bestandteile der ``crypto``
Distribution.

In
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
ist es jetzt wieder m?glich, Die Installation einzelner Komponenten von
**XFree86** zu installieren. Um dies zu unterst?tzen, gab es mehrere f?r
den Anwender nicht sichtbare ?nderungen, die es ganz allgemein erlauben,
Teile einer Distribution als Packages installieren zu lassen.

**XFree86** steht jetzt in der Version 4.3.0 zur Verf?gung. [MERGED]

Diverse Routinen zur Aktualisierung von FreeBSD von 2.\ ``X`` auf
3.\ ``X`` beziehungsweise von 3.\ ``X`` auf 4.\ ``X`` wurden entfernt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7. Dokumentation
------------------

Die Dokumentation wurde um die beiden Artikel \`\`FreeBSD From Scratch''
und \`\`The Roadmap for 5-STABLE'' erg?nzt. F?r beide Dokumente werden
noch ?bersetzer gesucht.

Im Rahmen eines neuen Projektes haben die Arbeiten an einer d?nischen
(``da_DK.ISO8859-1``) ?berstzung begonnen.

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
jeden Fall* die \`\`Hinweise f?r die ersten Anwender von FreeBSD
5.1-RELEASE'' lesen. Dieses Dokument ist auf den Distributionen in der
Regel in der Datei ``EARLY.TXT`` verf?gbar; ansonsten sollte es ?berall
dort verf?gbar sein, wo auch die anderen Dokumente der Release Notes
verf?gbar sind. Das Dokument enth?lt einige Tips f?r die Aktualisierung;
viel wichtiger ist aber die Analyse der beiden Optionen Wechsel zu
FreeBSD 5.\ ``X`` oder Weitere Verwendung von FreeBSD 4.\ ``X``.

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

Alle Anwender von FreeBSD 5-CURRENT sollten sich in die Mailingliste
<current@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
