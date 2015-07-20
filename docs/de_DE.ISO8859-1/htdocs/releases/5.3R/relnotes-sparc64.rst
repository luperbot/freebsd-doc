=========================================
FreeBSD/sparc64 5.3-RELEASE Release Notes
=========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/sparc64 5.3-RELEASE Release Notes
=========================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004 The FreeBSD Documentation
Project

Copyright © 2002, 2003, 2004 The FreeBSD German Documentation Project

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 5.3-RELEASE enthalten eine ?bersicht ?ber
alle ?nderungen in FreeBSD seit der Version 5.2.1-RELEASE. Dieses
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
2.2.1. `?nderungen im Bootloader <#BOOT>`__
2.2.2. `Hardware-Unterst?tzung <#PROC>`__
2.2.3. `Netzwerk-Protokolle <#NET-PROTO>`__
2.2.4. `Festplatten und Massenspeicher <#DISKS>`__
2.2.5. `Dateisystem <#FS>`__
2.2.6. `Zus?tzliche Software <#AEN945>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.3.1. ```/etc/rc.d`` Scripts <#RC-SCRIPTS>`__
2.4. `Zus?tzliche Software <#CONTRIB>`__
2.5. `Infrastruktur f?r Ports und Packages <#PORTS>`__
2.6. `Erzeugung von Releases und Integration <#RELENG>`__
2.7. `Dokumentation <#DOC>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 5.3-RELEASE auf
UltraSPARC Systemen. Es beschreibt die Komponenten von FreeBSD, die in
letzter Zeit hinzugef?gt, ge?ndert, oder gel?scht wurden. Au?erdem
erhalten Sie Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 5.3-RELEASE ist eine release
Distribution. Sie k?nnen Sie von ftp://ftp.FreeBSD.org/ und allen seinen
Mirrors erhalten. Weitere Informationen, wie Sie diese (oder andere)
release Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Bezugsquellen f?r
FreeBSD'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.

Alle Anwender sollten vor der Installation von FreeBSD die
Release-Errata lesen. Die Errata enthalten \`\`brandhei?e''
Informationen, die erst kurz vor oder nach der Ver?ffentlichung bekannt
wurden. Dies sind typischerweise Informationen ?ber bekannte Probleme,
Hinweise zum Thema Sicherheit und Korrekturen der Dokumentation. Die
jeweils aktuelle Version der Errata zu FreeBSD 5.3-RELEASE finden Sie
auf den FreeBSD Webseiten.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
-------------

In diesem Artikel finden Sie die f?r den Anwender offensichtlichsten
Neuerungen und ?nderungen in FreeBSD seit 5.2.1-RELEASE. Die hier
aufgef?hrten ?nderungen sind auf 5-STABLE beschr?nkt, sofern Sie nicht
explizit als [MERGED] gekennzeichnet sind.

Die Eintr?ge umfassen alle Sicherheitshinweise, die nach dem Erscheinen
von 5.3-RELEASE herausgegeben wurden, neue Treiber bzw. Unterst?tzung
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
~~~~~~~~~~~~~~~

In
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, durch den Einstellungen f?r das Dateisystem
auf ihre Standardwerte zur?ckgesetzt wurden, sobald ein Snapshot erzeugt
wurde. Die Auswirkungen des Fehlers hingen stark von den lokalen
Gegebenheiten ab. Es war m?glich, da? erweiterte ACLs deaktiviert werden
oder die Nutzung von Progammen mit gesetztem setuid-Bit auf unsicheren
Dateisystemen erlaubt wird. Der Fehler trat auch auf, wenn
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der Option -L genutzt wurde, da daf?r
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
genutzt wird. Bitte beachten Sie, da?
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
normalerweise nur vom Super-User und den Mitgliedern der Gruppe
``operator`` genutzt werden kann. Weitere Informationen finden Sie in
`FreeBSD-SA-04:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:01.mksnap_ffs.asc>`__.

In den Routinen f?r das System V Shared Memory (speziell im Systemaufruf
`shmat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmat&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__)
wurde ein Fehler behoben, der dazu f?hren konnte, da? ein Teil des
Shared Memory auf nicht genutzten Speicher des Kernel verweist. Dadurch
war es theoretisch m?glich, da? ein lokaler Angreifer unbefugten Zugriff
auf Teile des Kernel-Speichers erh?lt. M?gliche Folgen sind die
Aussp?hung sicherheitsrelevanter Informationen, die Umgehung von
Zugriffskontrollen, und die ?nderung der Benutzerrechte. Weitere
Informationen finden Sie in
`FreeBSD-SA-04:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:02.shmat.asc>`__.
[MERGED]

Im Systemaufruf
`jail\_attach(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail_attach&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, durch den ein Proze? mit Super-User Rechten
sein Root-Verzeichnis ?ndern konnte, obwohl er innerhalb eines Jails
lief. Dadurch konnte der Proze? Lese- und Schreibzugriff auf alle
Dateien im Ziel-Jail erhalten. Weitere Informationen finden Sie in
`FreeBSD-SA-04:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:03.jail.asc>`__.

Die Anzahl der gleichzeitig gespeicherten TCP-Segmente f?r das
Zusammensetzen von fragmentierten Pakete wurde limitiert, dadurch wird
eine Abart der Denial-of-Service Angriffe mit geringen Bandbreitenbedarf
auf den FreeBSD TCP-Stack verhindert. Weitere Informationen finden Sie
in
`FreeBSD-SA-04:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:04.tcp.asc>`__.
[MERGED]

In **OpenSSL** wurde ein Fehler bei der Verarbeitung von SSL/TLS
ChangeCipherSpec Nachrichten beseitigt, der zur Derefenzierung eines
NULL-Zeigers f?hren konnte. Durch diesen Fehler w?re es einem Angreifer
m?glich gewesen, auf **OpenSSL** basierende Applikationen zum Absturz zu
bringen und so einen Denial-of-Service Angriff ?ber ein Netzwerk
auszuf?hren. Weitere Details finden Sie in
`FreeBSD-SA-04:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:05.openssl.asc>`__.
[MERGED]

Durch einen Fehler bei der Behandlung bestimmter IPv6 Socket
Einstellungen im Systemaufruf
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
konnte ein lokaler Angreifer unbefugten Zugriff auf Teile des
Kernel-Speichers erhalten. Dies konnte zur Aussp?hung sensitiver Daten,
zur Umgehung von Zugriffsbeschr?nkugen oder zu einem Totalabsturz des
Systems f?hren. Weitere Informationen finden Sie in
`FreeBSD-SA-04:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:06.ipv6.asc>`__.

Zwei Programmierfehler in **CVS** konnten dazu f?hren, da? der Server
beliebige Dateien auf dem Client ?berschreiben kann und da? ein Client
beliebige Dateien auf dem Server lesen kann, wenn ein Client ?ber ein
Netzwerk auf ein CVS-Repository zugreift. Weitere Informationen finden
Sie in
`FreeBSD-SA-04:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:07.cvs.asc>`__.

In **Heimdal** wurde ein Fehler behoben, durch den unter bestimmten
Umst?nden die Informationen zur Authentifizierung nicht ausreichend
gepr?ft wurden, wenn diese zu einem anderen autonomen Realm geh?ren.
Weitere Informationen finden Sie in
`FreeBSD-SA-04:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:08.heimdal.asc>`__.

In **CVS** wurde ein Fehler behoben, durch den ein Client beliebige
Teile des Hauptspeichers des Servers ?berschreiben konnte. Weitere
Informationen finden Sie in
`FreeBSD-SA-04:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:10.cvs.asc>`__.
[MERGED]

Im Systemaufruf
`msync(2) <http://www.FreeBSD.org/cgi/man.cgi?query=msync&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, der zur Inkonsitenz des Caches bei einer
MS\_INVALIDATE Operation f?hren konnte. Allerdings ist dadurch nicht
mehr garantiert, da? alle mit MS\_INVALIDATE markierten Seiten wirklich
ung?ltig gemacht werden. Anwender, die die alte Funktionalit?t von
MS\_INVALIDATE ben?tigen und sich keine Sorgen wegen des
Sicherheitsrisikos machen, k?nnen die Sysctl-Variable vm.old\_msync auf
1 setzen, um das alte (unsichere) Verhalten zu reaktivieren. Weitere
Informationen finden Sie in
`FreeBSD-SA-04:11 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:11.msync.asc>`__.
[MERGED]

Im Systemaufruf
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, durch den nicht festgestellt wurde, da? ein
Versuch der ?nderung der Routing-Tabellen nicht von einem im Jail
laufenden Proze? stammt. Weitere Informationen finden Sie in
`FreeBSD-SA-04:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:12.jail.asc>`__.
[MERGED]

Bei der Abarbeitung verschiedener Linux-Systemaufrufe wurde ein Fehler
behoben, der dazu f?hren konnte, da? ohne vorherige Pr?fung auf Teile
des Speichers zugegriffen werden konnte. Weitere Informationen finden
Sie in
`FreeBSD-SA-04:13 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:13.linux.asc>`__.
[MERGED]

Eine Reihe von Programmierfehlern in **CVS** wurden durch die
Aktualisierung auf **CVS** 1.11.17 behoben. Die Fehler gaben ungewollt
Informationen preis, boten M?glichkeiten zu Denial-of-Service Angriffen
und eventuell zur Ausf?hrung beliebigen Codes. Weiteres lesen Sie bitte
im Sicherheitshinweis
`FreeBSD-SA-04:14 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:14.cvs.asc>`__
nach.

Ein Fehler in CONS\_SCRSHOT der Funktion
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
wurde behoben. Der Fehler erlaubte unberechtigten Zugriff auf Teile des
Kernelspeichers. Dies h?tte kritische Daten preisgeben k?nnen,
Zugriffskontrollmechanismen umgehen k?nnen oder Rechte erh?hen k?nnen.
Weiteres lesen Sie bitte im Sicherheitshinweis
`FreeBSD-SA-04:15 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:15.syscons.asc>`__
nach.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. ?nderungen im Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~

Die Option ADAPTIVE\_MUTEXES ist neu und standardm??ig aktiviert. Durch
diese Option warten Threads aktiv auf eine Sperre, die ein Thread
besitzt, der gerade auf einer anderen CPU l?uft. Sie k?nnen diese
Funktion mit der Kerneloption NO\_ADAPTIVE\_MUTEXES explizit abstellen.

Die neue Kerneloption ADAPTIVE\_GIANT f?gt Giant zu den Mutexen
(Sperren) hinzu, auf die gewartet werden kann, wenn die Option
ADAPTIVE\_MUTEXES aktiviert ist. Die Option erh?ht die
Leistungsf?higkeit von Multiprozessorsystemen und ist auf i386-Systemen
standardm??ig aktiviert.

Die Funktion
`bus\_dma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_dma&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
beachtet jetzt beim Laden der Puffer die im dma Tag angegebenen
Einschr?nkungen f?r Alignment und Grenzen; ``bus_dmamap_load()`` benutzt
automatisch Bounce Buffer, wenn dies notwendig werden sollte. Au?erdem
gibt es einen Satz Sysctl-Variablen der Form hw.busdma.\*, die
Statistiken f?r
`bus\_dma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_dma&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
enthalten.

Die Funktion
`contigmalloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=contigmalloc&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
wurde mit einem neuen Algorithmus implementiert, der h?here
Erfolgsaussichten besitzt. Der alte Algorithmus kann durch Setzen der
Sysctl-Variablen vm.old\_contigmalloc verwendet werden. Weiteres
entnehmen Sie bitte der Hilfeseite
`contigmalloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=contigmalloc&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__.

Die Pfadregeln von
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
werden jetzt korrekt auf Verzeichnisse angewandt.

Die
`getvfsent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getvfsent&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
API wurde entfernt.

Die Loader-Variable hw.pci.allow\_unsupported\_io\_range wurde entfernt.

`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt die Nutzung von Raw Sockets innerhalb eines Jails.
Diese Erweiterung ist standardm??ig deaktiviert und wird ?ber die
Sysctl-Variable security.jail.allow\_raw\_sockets gesteuert.

`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt den neuen Filter EVFILT\_FS, mit dem Anwenderprogramme
?ber Ereignisse auf Dateisystemebene unterrichtet werden k?nnen. Zur
Zeit werden die Ereignisse \`\`mount'', \`\`unmount'', \`\`NFS up'' und
\`\`NFS down'' gemeldet.

Mit KDB steht eine neue Infrastruktur f?r die Fehlersuche zur Verf?gung.
KDB besteht aus einem neuen GDB Backend, das umgeschrieben wurde, um
Threading, RLE Kompression, etc. zu unterst?tzen; sowie aus einem
Frontend, das zum einen notwendige Infrastruktur f?r mehrere
verschiedene Debugger Backends und zum anderen die notwendigen
Grundlagen f?r diese Backends zur Verf?gung stellt. Dadurch ?ndern sich
die folgenden Optionen:

-  KDB wird standardm??ig aktiviert, wenn eine der Zeilen options KDB,
   options GDB oder options DDB in der Konfigurationsdatei f?r den
   angepa?ten Kernel steht.. Sowohl DDB als auch GDB legen fest, welches
   KDB Backend genutzt werden soll.

-  WITNESS\_DDB hei?t jetzt WITNESS\_KDB.

-  DDB\_TRACE hei?t jetzt KDB\_TRACE.

-  DDB\_UNATTENDED hei?t jetzt KDB\_UNATTENDED.

-  SC\_HISTORY\_DDBKEY hei?t jetzt SC\_HISTORY\_KDBKEY.

-  DDB\_NOKLDSYM wurde entfernt. Das neue DDB Backend unterst?tzt jetzt
   Pre-Linker Symbol Lookups und KLD Symbol Lookups zur gleichen Zeit.

-  GDB\_REMOTE\_CHAT wurde entfernt. Die f?r diese Funktionen genutzten
   Erweiterungen des GDB Protokolls waren FreeBSD Eigengew?chse.
   Au?erdem gibt es f?r den GSB Pakete f?r die Ausgabe auf der Konsole.

Der KDB ist die einzige m?gliche Schnittstelle f?r alle Routinen, die
Funktionen des Debuggers nutzen wollen. Dazu geh?ren unter anderem die
Aktivierung des Debuggers und die Verarbeitung der alternativen
Break-Sequenz. F?r diese Anwendungen ist das Frontend nicht mehr
optional. Alle Anfragen an den Debugger werden je nach Umstand entweder
vom Frontend abgearbeitet oder an das Backend weitergegeben. Zur Auswahl
des aktiven Backends dient die Sysctl-Variable debug.kdb.current. Die
Sysctl-Variable debug.kdb.available liefert die Liste der zur Zeit
konfigurierten Backends. Ein Schreibzugriff auf die Sysctl-Variable
debug.kdb.enter aktiviert den Debugger.

Die neue Sysctl-Variable debug.kdb.stop\_cpus steuert, ob
Inter-Prozessor-Interrupts (IPI) an andere Prozessoren ausgeliefert
werden, wenn der Debugger startet. Ist die Variable gesetzt, werden
andere Prozessoren vom Debugger angehalten.

Die neue Kernel-Option MAC\_STATIC deaktiviert die interne
Synchronisierung der MAC Infrastruktur und sch?tzt so vor dem
dynamischen Laden und Entfernen von MAC Policies.

Die Regelpr?fung der Richtlinie
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
kann nun bei der ersten passenden Regel abgebrochen werden. Dies wird
mit der neuen Sysctl-Variablen mac\_bsdextended\_firstmatch\_enabled
aktiviert.

Die Richtline
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
kann jetzt Fehlversuche zur Syslog-Facility AUTHPRIV protokollieren.
Dies wird mit der neuen Sysctl-Variablen mac\_bsdextended\_logging
aktiviert.

mballoc wurde durch mbuma ersetzt, eine Routine zur Allozierung von
Mbufs und Clustern, die auf eine Reihe von Erweiterungen der UMA
Infrastruktur aufbaut. Durch diese ?nderung wird die Kernel-Option
NMBCLUSTERS nicht mehr benutzt. Die maximale Anzahl an Clustern wird
immer noch von maxusers begrenzt, diese Einschr?nkung kann aufgehoben
werden, indem man die Loader-Variable kern.ipc.nmbclusters auf Null
setzt.

``/dev/kmem``, ``/dev/mem`` und ``/dev/io`` stehen nun als Kernelmodule
zur Verf?gung.

In
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, durch mit PROT\_NONE markierte Seiten unter
bestimmten Umst?nden f?r den Lesezugriff freigegeben wurden. [MERGED]

Die neue Loader-Variable debug.mpsafenet wurde hinzugef?gt und
standardm??ig aktiviert. Die Variable bewirkt, da? der FreeBSD
Netzwerkstack ohne die Sperre \`\`Giant'' arbeitet. Dadurch lassen sich
mehr Netzwerkoperationen parallel ausf?hren und die Latenz sinkt.
Beachten Sie, da? durch
`ng\_tty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_tty&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
KAME IPSec oder IPX/SPX die Sperre Giant wieder zum Zeitpunkt des
Systemstarts wieder aktiviert wird. Wenn Sie die Module zur Laufzeit
laden, erhalten Sie eine Fehlermeldung, da die Module auf Giant
angewiesen sind.

Die Kerneloption NET\_WITH\_GIANT wurde hinzugef?gt. Sie setzt die
Loader-Variable debug.mpsafenet auf 0 und aktiviert Giant f?r den
Netzwerkstack. Die Option ist f?r Konfigurationen gedacht, die Giant
noch ben?tigen.

Die neue Loader-Variable debug.mpsafevm vermeidet fast vollst?ndig die
Benutzung der Sperre Giant bei Zero-Fill Page-Faults.

Es gibt zus?tzlich zu den bekannten Sysctl-Variablen pro Ger?t jetzt
auch Extra-Zweige pro Ger?teklasse. Damit ?ndern sich die existierenden
Namen wie dev.foo0.bar in dev.foo.0.bar, die neuen Namen haben dann das
Format dev.foo.bar.

Ist die neue Sysctl-Variable kern.always\_console\_output gesetzt,
werden Meldungen des Kernels immer auf der Console ausgegeben, auch wenn
TIOCCONS gesetzt ist.

Die neue Sysctl-Variable kern.sched.name enth?lt den Namen des zur Zeit
genutzten Schedulers. Der Name der Sysctl-Variablen kern.quantum wurde
zur Vereinheitlichung in kern.sched.quantum ge?ndert.

Die Bus-Ressourcen und das Power Management von
`pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurden aktualisiert.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Obwohl das Power State Management auf dem
    `pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
    Bus aktiviert ist, kann es auf einigen Systemen zu Problemen kommen.
    Um das Power State Management abzuschalten, mu?
    hw.pci.do\_powerstate auf 0 gesetzt werden.

.. raw:: html

   </div>

Der ULE-Scheduler steht nun als zus?tzlicher Scheduler zur Verf?gung.
Der normale 4BSD-Schelduler ist der vorgegebene Scheduler im
``GENERIC``-Kernel. F?r den normalen Anwender bedeutet das in vielen
F?llen ein besseres Verhalten bei interaktiver Arbeit: Interaktive
Anwendungen \`\`springen'' und \`\`ruckeln'' weniger, wenn die Maschine
unter sehr hoher Last betrieben wird. Dies hilft zwar nicht, wenn das
Disk Subsystem ?berlastet ist, aber es hilft deutlich, wenn die CPU
?berlastet ist. Auf SMP Systemen unterst?tzt ULE separate Warteschlangen
f?r jede CPU mit Bevorzugung der jeweligen CPU, erlaubt die Bindung
eines Prozesses an eine CPU und verbesserten Support f?r Hyperthreading
sowie eine Grundlage f?r weitergehende Optimierungen. Mit
fortschreitender Verfeinerung der Locks im Kernel wird der Scheduler in
der Lage sein, die parallel zur Verf?gung stehenden Ressourcen
effizienter zu nutzen.

Der lineare Suchalgorithmus von
`vm\_map\_findspace(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vm_map_findspace&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
wurde durch einen O(log n) Algorithmus ersetzt. F?r Anwendungen, die
h?ufig die Funktion
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
benutzen (mehrere tausend Regionen) reduziert dies drastisch die durch
`vm\_map\_findspace(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vm_map_findspace&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
verursachten Kosten.

Die Loader-Variablen debug.witness\_\* wurden in debug.witness.\*
umbenannt.

Der dynamische und statische Linker von FreeBSD unterst?tzt nun die
**GCC**-Funktion Thread Local Storage (TLS). Damit kann der Modifikator
\_\_thread zur Deklaration globaler und statischer Variablen hinzugef?gt
werden. Eine so modifizierte Variable ist spezifisch f?r einen Thread.
?ndert sich der Wert einer solchen Variablen in einem Thread, wird der
Wert in den anderen Threads nicht ge?ndert.

Die Routinen, mit der der Kernel Datei-Handles alloziert, wurden
aktualisiert. Die neuen Routinen basieren auf ?hnlichen Routinen in
OpenBSD.

Auf FreeBSD/sparc64 Systemen ist time\_t jetzt ein 64-Bit Wert und kein
32-Bit Wert mehr.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Diese ?nderung ist nicht r?ckw?rtskompatibel und alle
    Programme, die den 32-Bit time\_t oder Systemfunktionen zur
    Verarbeitung von time\_t Werten nutzen, m?ssen neu ?bersetzt werden.
    Weitere Informationen und Hinweise f?r die Aktualisierung finden Sie
    in ``/usr/src/UPDATING.64BTT``.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.1. ?nderungen im Bootloader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Es gibt eine zus?tzliche Version von ``boot0``, die ?ber eine serielle
Konsole verwendet werden kann. Um diese Version zu verwenden, mu?
`boot0cfg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot0cfg&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit den Parametern -b``/boot/boot0sio`` aufgerufen werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2. Hardware-Unterst?tzung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der neue Treiber
`acpi\_toshiba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_toshiba&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt das Toshiba Hardware Control Interface, mit dem die
Monitorausg?nge von Toshiba Laptops gesteuert werden k?nnen.

Der neue Treiber
`acpi\_video(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_video&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt die ACPI Video Erweiterungen zum Umschalten der
Monitorausg?nge und der Steuerung der Hintergrundbeleuchtung.

`nmdm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nmdm&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde neu geschrieben, um die Zuverl?ssigkeit zu erh?hen.

Der von NetBSD importierte RAIDframe Treiber ``raid(4)`` wurde entfernt,
da er zur Zeit nicht funktioniert und nur mit sehr gro?en Aufwand an die
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
API in 5-CURRENT angepa?t werden k?nnte.

Der Treiber
`pcic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcic&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde aus der Kernelkonfiguration ``GENERIC`` entfernt, da der Treiber
nicht l?nger gepflegt wird. Der Treiber war schon l?ngere Zeit
auskommentiert.

`sab(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sab&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt die Kernel-Option BREAK\_TO\_DEBUGGER.

Der neue Treiber
`ubser(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubser&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt die Server f?r serielle Konsolen von BWCT.

Der neue Treiber
`ucycom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucycom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt die Familie der Cypress CY7C637xx und CY7C640/1xx USB zu
RS232 Bridges. Zur Zeit arbeitet der Treiber nur mit dem DeLorme
Earthmate USB GPS Receiver zusammen. Der Treiber ist unvollst?ndig, es
fehlen Flu?kontrolle und Ausgaben.

Die Infrastruktur f?r die Ger?tetreiber und viele Ger?tetreiber wurden
aktualisiert. Zu den ?nderungen geh?ren unter anderem: Viele weitere
Treiber nutzen jetzt automatisch zugewiesene Major Number statt der
fr?her verwendeten statisch zugewiesenen Major Numbers. Interne
Funktionen wurden erweitert, um das Cloning von Pseudo-Ger?ten
unterst?tzen zu k?nnen. Die API f?r die Ger?tetreiber wurde ge?ndert,
unter anderem wurde in struct cdevsw ein neues Feld d\_version
aufgenommen. Bitte beachten Sie, da? Ger?tetreiber anderer Hersteller
nach dieser ?nderung neu ?bersetzt werden m?ssen.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1. Multimedia
'''''''''''''''''''

Der Treiber ``meteor`` (video capture) wurde entfernt, weil er
fehlerhaft ist und sich niemand fand, der die Fehler beseitigen wollte.

Die Routinen f?r Direct Rendering Manager (DRM) wurden aus dem CVS-Tree
des DRI Project aktualisiert und sind jetzt auf dem Stand vom 26. Mai
2004. Die neue Version kennt zus?tzliche PCI IDs und enth?lt ein neues
Paket f?r die Radeon.

Die Treiber f?r verschiedene Soundkarten wurden neu organisiert. Der
allgemeine Soundtreiber hei?t nun device sound, die ger?tespezifischen
Treiber hei?en jetzt device snd\_\*. Der ``midi``-Treiber f?r serielle
Schnittstellen und verscheidene Soundkarten wurde entfernt. Weiteres
entnehmen Sie bitte den Hilfeseiten
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_ad1816(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_ad1816&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_als4000(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_als4000&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_cmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cmi&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_cs4281(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cs4281&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_als4000(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_als4000&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_cmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cmi&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_cs4281(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cs4281&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_csa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_csa&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_ds1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_ds1&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_emu10k1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10k1&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_es137x(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_es137x&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_gusc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_gusc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_maestro3(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_maestro3&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_solo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_solo&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
und
`snd\_uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_uaudio&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

Der Treiber
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
(fr?her
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__)
liest jetzt beim Start die Datei ``/boot/device.hints`` aus. Damit ist
es m?glich, Voreinstellungen f?r die Lautst?rke zu definieren. Beachten
Sie, da? der in ``/boot/device.hints`` benutzte Treibername immer noch
pcm ist. Weiteres entnehmen Sie bitte der Hilfeseite
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2. Netzwerke und Netzwerkkarten
'''''''''''''''''''''''''''''''''''''

Der neue Treiber
`arl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt Aironet Arlan 655 WLAN-Karten. [MERGED]

Der Treiber
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unters?tzt jetzt sparc64 Davicom Karten, die ihre MAC-Adresse in der
Open Firmware speichern.

Beim Treiber
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
gibt es keine Aussetzer mehr, wenn die Einstellungen ge?ndert werden.
[MERGED].

Der neue Treiber
`fwip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwip&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt IP over FireWire. Zur Zeit ist die Nummer des Broadcast
Channels noch fest verdrahtet und das Multicast Channel Allocation
Protocol (MCAP) wird auch nicht unterst?tzt. Auf lange Sicht soll der
neue Treiber alle Anforderungen aus RFC 2734 und RFC 3146 erf?llen und
`fwe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwe&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
ersetzen.

`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
nutzt jetzt die ger?tespezifischen Sysctl-Variablen unter dev.fxp0.
Diese Variablen k?nnen f?r jedes Ger?t einzeln gesetzt werden.

Beim Treiber
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
kann man jetzt einstellen, ob erweiterte Ethernet Rahmen empfangen
werden sollen oder nicht (VLAN\_MTU). Die Einstellung kann vom Anwender
mit
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
und den Optionen vlanmtu bzw. -vlanmtu ge?ndert werden.

Der Treiber
`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt ?berlange Ethernet-Frames korrekt und kann daher auch
f?r ein
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
eingesetzt werden, in dem eine Ethernet MTU maximaler Gr??e genutzt
wird.

Mit dem Treiber k?nnen jetzt TCP/UDP Transmit/Receive-Pr?fsummen von der
Karte berechnet werden (*checksum offload*). Allerdings ber?cksichtigt
der Treiber nicht, da? eine UDP-Pr?fsumme 0x0 sein kann, daher ist die
UDP Transmit-Pr?fsummenberechnung in der Voreinstellung deaktiviert. Die
Pr?fsummenberechnung kann mit der Option link0 des Befehls
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
wieder aktiviert werden.

Der neue Treiber
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt Intel PRO/10GBE 10 Gigabit Ethernet Karten. [MERGED]

Im Treiber
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, durch den die Unterst?tzung f?r VLAN nicht
richtig funktionierte. [MERGED]

Im Treiber
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurden mehrere Fehler bei der Unterst?tzung des
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Modus beseitigt. [MERGED]

Im Treiber
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurden diverse Fehler im Bereich Multicast und Promiscuous Mode behoben.

Der Treiber
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt den
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Modus. [MERGED]

Der neue Treiber
`udav(4) <http://www.FreeBSD.org/cgi/man.cgi?query=udav&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt USB Ethernetkarten mit Davicom DM9601 Chipsatz.

Der neue Treiber
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt den VIA Networking Technologies VT6122 Gigabit Ethernet Chip
und integrierte 10/100/1000 Kupfer-PHY.

Der Treiber
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt den
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Modus. [MERGED]

Im Treiber
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde die Unterst?tzung f?r die Berechnung der TX-Pr?fsummen durch die
Hardware deaktiviert, da diese Erweiterung nicht richtig funktioniert
und die ?bertragung verlangsamt. [MERGED]

Der
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Modus kann jetzt f?r jedes Interface separat aktiviert werden. Diese
Erweiterung wird zur Zeit von den Treibern
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
und
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt. Mit Ausnahme von
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wird die Erweiterung mit
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
gesteuert. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3. Netzwerk-Protokolle
^^^^^^^^^^^^^^^^^^^^^^^^^^

Der Treiber
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Tunnel unterst?tzt jetzt die Version 2 des WCCP Protokolls.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde um die Option versrcreach erweitert. Diese Option pr?ft, ob in der
Routing-Tabelle eine Route zur Absenderadresse eines Paketes existiert.
Diese Option ist f?r Router gedacht, die via BGP die gesamten
Routinginformationen des Internets in ihrer Routingtabelle haben und
jetzt alle Pakete mit gef?lschten oder nicht routbaren Absenderadressen
ablehnen k?nnen. Die Regel

.. code:: PROGRAMLISTING

    deny ip from any to any not versrcreach

entspricht in Cisco IOS Syntax der folgenden Regel:

.. code:: PROGRAMLISTING

    ip verify unicast source reachable-via any

Die neue Option antispoof von
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
pr?ft, ob die Quelladresse eingehender Pakete aus einem direkt
angeschlossenen Netz kommt. Ist das der Fall, wird die Schnittstelle,
?ber die das Paket herein gekommen ist, mit der Schnittstelle des direkt
sngeschlossenen Netzes verglichen. Sind die Schnittstellen verschieden,
passt die Regel nicht auf das Paket. Beispiel:

.. code:: PROGRAMLISTING

    deny ip from any to any not antispoof in

Die neue Option jail von
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
verkn?pft eine Regel mit der Prison-ID eines Jails:

.. code:: PROGRAMLISTING

    count ip from any to any jail 2

Zur Zeit gilt diese Regel nur f?r TCP- und UDP-Pakete.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt Lookup-Tabellen. Diese Erweiterung ist sehr n?tzlich,
wenn gro?e Mengen Adressen verarbeitet werden m?ssen, die sich nicht
zusammenfassen lassen. [MERGED]

Um die
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Regel forward zu benutzen mu? der Kernel mit der Option
IPFIREWALL\_FORWARD ?bersetzt werden.

Die neue Sysctl-Variable net.inet.ip.process\_options erlaubt es, die
Verarbeitung von IP Optionen zu steuern. Wenn diese Variable auf 0
steht, werden alle IP Optionen ignoriert und unver?ndert weitergereicht.
Steht die Variable auf 1, werden alle IP Optionen verarbeitet; dies ist
die Standardeinstellung. Steht die Variable auf 2, werden alle Pakete,
bei denen IP Optionen gesetzt sind, mit einer "ICMP filter prohibited"
Nachricht abgelehnt.

In der IPsec Implementierung des KAME Projektes wurden diverse Fehler
beseitigt. Diese Fehler f?hrten dazu, da? Objekte aus dem Speicher
entfernt wurden, bevor alle Referenzen auf diese Objekte gel?scht
wurden. Dadurch konnte es nach dem Aufr?umen der Security Policy
Database (SPD) zu Problemen bis zum Totalabsturz des Systems kommen.

Wenn
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option globalports aufgerufen wird, unterst?tzt es die
Nutzung mit mehreren Instanzen. Damit wird es m?glich, einen
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
an mehrere Netzwerk-Interfaces anzubinden und die Last ?ber diese
Interfaces zu verteilen.

Die neue Netgraph Node
`ng\_atmllc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_atmllc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt ATM LLC Encapsulation nach RFC 1483.

Die neue Netgraph Node
`ng\_hub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hub&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt eine einfache Verteilung von Paketen, ?hnlich einem Ethernet
Hub. [MERGED]

Die Netgraph node
`ng\_rfc1490(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_rfc1490&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt auch die von Cisco verwendete Methode zur
Encapsulation, da diese auf Frame Relay Verbindungen oft in Zusammenhang
mit RFC 1490 eingesetzt wird.

Die neue Netgrpah Node
`ng\_sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_sppp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
stellt eine Verbindung zwischen dem
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
System und dem
`sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Treiber f?r synchrone Leitungen bereit.

Eine Netgraph Methode stellt einen Teil der Funktionalit?t wieder her,
die bei den
`ng\_tee(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_tee&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Nodes beim Wechsel von 4.X verloren ging.

Die neue Netgraph Node
`ng\_vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_vlan&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt VLAN Tagging nach IEEE 802.1Q. [MERGED]

Die Option PFIL\_HOOKS ist jetzt immer im Kernel aktiviert, daher wurden
die entsprechenden Kerneloptionen entfernt. Alle Paketfilter von FreeBSD
benutzen nun das PFIL\_HOOKS-System.

Der Routing Socket unterst?tzt jetzt Benachrichtigungen, falls sich der
Status einer Ethernet-Verbindung ?ndert.

Die von
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
genutzten Routinen f?r Link Quality Monitoring (LQM) wurden vollst?ndig
neu geschrieben. Das in RFC 1989 beschriebene LQM erlaubt PPP, die
Qualit?t der Verbindung zu ?berwachen.

Das Routinen zum Cloning von virtuellen Interfaces und die
Match-Funktion wurden ge?ndert, um
`stf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Interfaces mit Namen wie ``stf0``, ``stf`` oder ``6to4`` erzeugen zu
k?nnen. Dadurch geht die R?ckw?rtskompatibilit?t verloren. Zum Beispiel
legt ``ifconfig stf`` jetzt ein Interface mit dem Namen ``stf`` an und
nicht mehr ``stf0``; au?erdem gibt es nicht mehr ``stf0`` auf der
Standardausgabe aus.

Die folgenden TCP-Erweiterungen sind jetzt standardm??ig aktiviert: RFC
3042 (\`\`Limited Retransmit''), RFC 3390 (\`\`increased initial
congestion window sizes'') und die Begrenzung des Ergebnisses bei der
Berechnung der TCP Bandbreitenverz?gerung. F?r diese Erweiterungen gibt
es die Sysctl-Variablen net.inet.tcp.rfc3042, net.inet.tcp.rfc3390 und
net.inet.tcp.inflight.enable. Weiteres entnehmen Sie der Hilfeseite
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

Der FreeBSD TCP-Stack unterst?tzt jetzt eine Mindestgr??e der MSS (kann
?ber die Sysctl-Variable net.inet.tcp.minmss eingestellt werden) und die
Begrenzung der Anzahl der Verbindungen, die viele kleine TCP Segmente
innerhalb kurzer Zeit senden (einstellbar ?ber die Sysctl-Variable
net.inet.tcp.minmssoverload. ?ber dieses Limit hinausgehende
Verbindungen k?nnen verworfen und mit einem TCP Reset Paket beantwortet
werden. Diese Erweiterung sch?tzt vor bestimmten Arten von Angriffen,
die Systemressourcen aufbrauchen wollen.

Der TCP-Stack unterst?tzt jetzt teilweise (nur bei der Ausgabe) RFC 2385
(TCP-MD5). Diese Erweiterung wird mit den Kernel-Optionen TCP\_SIGNATURE
und FAST\_IPSEC aktiviert und authentifiziert TCP-Verbindungen.
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt auch die Klasse TCP-MD5 f?r Security Associations.

Die Verarbeitung von Reset-Packeten f?r TCP-Verbindungen wurde
verbessert, um Angriffe mit solchen Paketen so schwer wie m?glich zu
machen, ohne die Kompatibilit?t mit m?glichst vielen TCP
Implementierungen zu verlieren.

Die Implementierung von RFC 1948 wurde verbessert. Die Zeitkomponente
einer Initial Sequence Number (ISN) wird jetzt zwischen zwei
Zeitscheiben um einen zuf?lligen positiven Wert erh?ht. Damit ist
sichergestellt, da? die ISN immer erh?ht wird, egal wie schnell der Port
wiederverwendet wird.

F?r die Auswahl eines nicht-privilegierten Ports wird jetzt eine von
OpenBSD stammende Routine verwendet. Diese Routine ist standardm??ig
aktiviert und kann ?ber die Sysctl-Variable
net.inet.ip.portrange.randomized abgeschaltet werden.

TCP Selective Acknowledgements (SACK) nach RFC 2018 wird jetzt
unterst?tzt. Durch diese Technik erh?ht sich der Datendurchsatz f?r
TCP-Verbindungen mit hohen Paketverlusten. SACK kann mit der
Sysctl-Variablen net.inet.tcp.sack.enable aktiviert werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4. Festplatten und Massenspeicher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
ATA/SATA Controller.

Im Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurden diverse Fehler korrigiert. Die Erkennung von Master und Slave
sollte jetzt besser funktionieren, und einige der Probleme mit Timeouts
sollten auch behoben sein.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt den Promise Command Sequencer, der auf allen modernen
Controllern von Promise (PDC203\*\* PDC206\*\*) vorhanden ist.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Damit steht auch eingeschr?nkter Support f?r den
    Promise SX4/SX4000 als \`\`normaler'' Promise ATA Controller zur
    Verf?gung; ATA RAID's werden zwar unterst?tzt, aber nur die Modi
    RAID0, RAID1 und RAID0+1.

.. raw:: html

   </div>

Die f?r CAM SCSI Treiber
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
gedachte Kernel-Option DA\_OLD\_QUIRKS wurde entfernt. [MERGED]

In
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler korrigiert, der in einigen F?llen zu I/O-H?ngern f?hren
konnte.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_CONCAT erlaubt es, mehrere Platten hintereinanderzuh?ngen, um eine
gr??ere Platte zu erhalten.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_NOP ist f?r diverse Testzwecke vorgesehen.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_RAID3 implementiert RAID 3 Funktionen. Das dazu passende
Benutzerprogramm
`graid3(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid3&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
wurde hinzugef?gt.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_STRIPE implementiert RAID 0 Funktionalit?t mit den Modi \`\`FAST''
und \`\`ECONOMIC''. Wenn im Modus \`\`FAST'' kleine Stripes benutzt
werden, wird an jede Platte nur eine I/O-Anforderung gesendet. Dieser
Modus ist f?r kleine Stripe-Gr??en ungef?hr zehnmal so schnell wie
\`\`ECONOMIC'' und andere RAID 0 Implementierungen. Dieser Modus wird
standardm??ig genutzt. Da dieser Modus aber relativ viel Speicher
verbraucht, kann auf den \`\`ECONOMIC'' Modus umgeschaltet werden, bei
dem mehrere Anfragen versendet werden. Dazu mu? die Loader-Variable
kern.geom.stripe.fast auf 0 gesetzt werden. Mit der Loader-Variable
kern.geom.stripe.maxmem wird festgelegt, wieviel Speicher im \`\`FAST''
Modus genutzt werden darf.

GEOM Gate besteht aus der neuen
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_GATE und mehreren Benutzerprogrammen f?r GEOM Gate
(`ggatel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggatel&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
`ggatec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggatec&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
and
`ggated(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggated&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__).
Damit ist es m?glich, bestehende Ger?te ?ber ein Netzwerk zu
exportieren, auch wenn sie
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
nicht unterst?tzen.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_LABEL findet Partitionstabellen oder Volume Labels auf
verschiedenen Dateisystemen wie z.B. UFS, MSDOSFS (FAT12, FAT16, FAT32)
und ISO9660.

Im Standardkernel ``GENERIC`` ist jetzt die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_GPT aktiv, die GUID Partition Table (GPT) Partitionen unterst?tzt
und eine gro?e Anzahl von Partitionen auf einer einzelnen Platte
erlaubt.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_MIRROR implemetiert RAID 1. Diese Klasse wird mit dem
Benutzerprogramm
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
gesteuert.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_UZIP implemtiert schreibgesch?tzte komprimierte Laufwerke. Zur
Zeit beherrscht die Klasse das Cloop V2.0 Disk Compression Format.

Die neue
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klasse
GEOM\_VINUM erlaubt die Zusammenarbeit zwischen
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
und
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

Der Treiber
`ips(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ips&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt die aktuellen Adaptec SCSI Hostadapter der ServeRAID
Familie.

Im Treiber
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, durch den die SBus-Version dieser Karten
nicht richtig funktionierten.

Der Treiber
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt auch die bisher fehlenden ATAPI MMC Befehle und
verarbeitet Timeouts richtig. [MERGED]

Der Volume-Manager
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
nutzt jetzt
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
die Infrastruktur f?r die ?bersetzung von Festplattenzugriffen in 5.x.
Weiterhin steht jetzt das Benutzerprogramm ``gvinum`` zur Verf?gung.

Der Treiber
`esp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=esp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
wurde aus NetBSD importiert, um die SBUS SCSI Karten in Sun Ultra 1e und
2 unterst?tzen zu k?nnen.

Software RAIDs von LSI werden jetzt unterst?tzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5. Dateisystem
^^^^^^^^^^^^^^^^^^

Die Routinen f?r EXT2FS Dateisystem unterst?tzen jetzt teilweise gro?e
(> 4GB) Dateien. Die Einschr?nkungen sind: Die Routinen werden keine
gro?en Dateien anlegen, wenn das Dateisystem nicht auf EXT2\_DYN\_REV
aktualisiert wurde oder im Superblock nicht die Option
EXT2\_FEATURE\_RO\_COMPAT\_LARGE\_FILE gesetzt wurde.

Im NFSv4 Client wurde ein Fehler beseitigt, der zu einem Totalabsturz
des Systems f?hren konnte, wenn ein Server angesprochen wurde, der
lediglich NFSv3/NFSv2 unterst?tzt.

Die neue Kernel Option MSDOSFS\_LARGE dient zur Unterst?tzung von FAT32
Dateisystemen, die gr??er sind als 128GB. Diese Option ist standardm??ig
inaktiv. Bitte beachten Sie, da? die Option 32 Byte Kernel-Speicher f?r
jede einzelne Datei im Dateisystem verbraucht. Sie sollten diese Option
nur in Ausnahmef?llen nutzen, z.B. f?r den Nur-Lese-Zugriff auf
Dateisysteme mit weniger als einer Million Dateien. Au?erdem ist es
nicht m?glich, diese Dateisysteme ?ber NFS zu exportieren.

Der SMBFS Client unterst?tzt jetzt SMB Request Signing. Dadurch werden
"man-in-the-middle" Angriffe verhindert; weiterhin ist diese Erweiterung
Voraussetzung f?r die Nutzung von Windows 2003 Servern in der
Standardkonfiguration. Da die digitale Signatur jeder SMB-Nachricht
viele Ressourcen verbraucht, wird diese Erweiterung nur aktiviert, wenn
es der Server verlangt. Langfristig wird es eine entsprechende Option
f?r
`mount\_smbfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_smbfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
geben.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6. Zus?tzliche Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Das **ALTQ framework** wurde aus dem KAME Snapshot vom 7. Juni 2004
importiert. Dadurch ist die ABI f?r struct ifnet nicht mehr kompatibel;
daher m?ssen alle Treiber f?r Netzwerkkarten neu ?bersetzt werden. Die
Treiber f?r die folgenden Netzwerkkarten wurden angepa?t, damit sie das
**ALTQ framework** unterst?tzen:
`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`tun(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tun&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
und
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

**IPFilter** wurde von Version 3.4.31 auf Version 3.4.35 aktualisiert.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
~~~~~~~~~~~~~~~~~~~~~~

`acpidump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
versteht nun SSDT-Tabellen. Die Ausgabe einer DSDT enth?lt nun auch die
den Inhalt von SSDT-Tabellen.

Wird
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -f aufgerufen, bearbeitet es Dateien und nicht
Partitionen auf der Festplatte.

FreeBSD nutzt jetzt
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
standardm??ig als
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
Programm. ``/usr/bin/tar`` ist ein symbolischer Link, der standardm??ig
auf ``/usr/bin/bsdtar`` verweist. Wenn Sie standardm??ig
``/usr/bin/gtar`` nutzen wollen, m?ssen Sie die Make-Variable WITH\_GTAR
setzen.

Die neuen Programme ``bthidcontrol`` und ``bthidd`` unterst?tzen
Bluetooth HID (Human Interface Devices).

`col(1) <http://www.FreeBSD.org/cgi/man.cgi?query=col&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`colcrt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=colcrt&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`colrm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=colrm&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`column(1) <http://www.FreeBSD.org/cgi/man.cgi?query=column&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`fmt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fmt&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`join(1) <http://www.FreeBSD.org/cgi/man.cgi?query=join&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`rev(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rev&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
und
`ul(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ul&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
arbeitn nun mit Multibyte-Zeichen.

`conscontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=conscontrol&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt die beiden neuen Befehle set und unset, die die
Console setzen und l?schen. unset sorgt daf?r, da? Ausgaben des Systems
(z.B. aus
`printf(9) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__)
immer auf die echte Console gehen. Das Programm ist eine Schnittstelle
f?r den TTY ioctl TIOCCONS.

Wird
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -j aufgerufen, verz?gert das Programm die
Ausf?hrung von Cron-Jobs f?r normale Benutzer f?r eine kurze, zuf?llige
Zeit. Die ebenfalls neue Option stellt die gleiche Funktionalit?t zur
Verf?gung, allerdings f?r Cron-Jobs des Super-Users. Sinn und Zweck
dieser Erweiterung ist, Lastspitzen zu vermeiden, wenn viele Cron-Jobs
an einem bestimmten Zeitpunkt starten sollen. [MERGED]

`cut(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cut&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
-c, -d und -f funktionieren jetzt korrekt, wenn ein Zeichen mehr als ein
Byte belegt.

Wird
`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option iso8601 aufgerufen, gibt es Datum im ISO 8601
Format aus.

Wird
`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -p aufgerufen, schreibt es seine PID in eine Datei.

Die neue Option fillchar des Werkzeugs
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
erlaubt die angabe eines alternativen F?llzeichens f?r den
Konvertierungsmodus oder bei Fehlern wenn die Option noerror zusammen
mit der Option sync benutzt wird.

Wird
`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -c aufgerufen, zeigt es die Summe der Statistiken
f?r die einzelnen Dateisysteme an.

Ein Fehler in
`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
wurde behoben. Der Fehler gab falsche Informationen aus, wenn die Option
-t mit einem Mountpoint verwendet wurde, auf den der Benutzer nicht
zugreifen durfte.

Das Programm ``doscmd`` wurde aus dem FreeBSD Basissystem entfernt. Es
steht jetzt in der FreeBSD Ports Collection unter dem Namen
```emulators/doscmd`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/doscmd/pkg-descr>`__
zur Verf?gung.

Bei
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
und
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
kann mit der neuen Option -P ein Backup-Medium au?er Dateien und
Bandlaufwerken angegeben werden. Das Argument von -P wird an
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
?bergeben, damit ist im Environment entweder $DUMP\_VOLUME
beziehungsweise $RESTORE\_VOLUME definiert. Weitere Informationen finden
Sie in
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
und
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

Das neue Programm
`eeprom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=eeprom&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
kann Systeminformation in einem EEPROM oder NVRAM anzeigen oder
ver?ndern. Zur Zeit werden nur Systeme mit Open Firmware unterst?tzt.

Mit
`fgetwln(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fgetwln&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
steht jetzt eine Variante der Funktion
`fgetln(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fgetln&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
zur Verf?gung, die auch Zeichen unterst?tzt, die aus mehr als einem Byte
bestehen.

Wird
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Optionen -acl aufgerufen, sucht nach Dateien mit
`acl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=acl&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__.

Wird
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -depth n aufgerufen, sucht es alle Dateien, die n
Verzeichnisebenen unterhalb des Startpunkts der Suche liegen. [MERGED]

Im Active-Mode ?ffnet
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
nun den Socket f?r den Datentransfer mit der effektiven UID des
Benutzers anstelle der UID ``root``. Damit k?nnen Anonymous-FTP
Sitzungen mit einer
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__-Regel,
die uid benutzt, erfasst werden.

Die neuen Funktionen
`ftw(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ftw&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
and
`nftw(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nftw&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
k?nnen zum Durchsuchen eines Verzeichnisbaums genutzt werden.

Mit dem neuen Programm
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
k?nnen
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Klassen
vom Anwender konfiguriert werden.

`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
ein Werkzeug zur Verwaltung von GUID Partitionstabellen, besitzt nun das
Kommando remove. Das Kommando add hat nun die Option -i, mit der ein
Anwender die Partitionsnummer einer neuen Partition angeben kann.

Wird
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -M aufgerufen, zeigt es das MAC Label des aktuellen
Prozesses an.

Wird
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option name aufgerufen, k?nnen Netzwerk-Interfaces ohne
Neustart des Systems umbenannt werden.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
zeigt jetzt an, ob ein Interface im
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Modus betrieben wird. [MERGED]

Einige Netzwerkkarten sind in der Lage, ?bergro?e Ethernet-Rahmen (mit
einem Inhalt von mehr als 1500 Byte) anzunehmen. Diese Option kann jetzt
mit den neuen
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
Optionen vlanmtu und -vlanmtu aktiviert und deaktiviert werden.

Einige Netzwerkkarten k?nnen VLAN Tags selbstst?ndig verarbeiten. Diese
Erweiterung kann jetzt mit den neuen
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
Optionen vlanhwtag und -vlanhwtag aktiviert und deaktiviert werden.

Bei
`indent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=indent&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
kann mit der neuen Option -ldi die Einr?ckung lokaler Variablen
eingestellt werden. Das Programm wurde auch an diversen anderen Stellen
erweitert.

`indent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=indent&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt die neuen Optionen -fbs und -ut.

Wird
`ip6fw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6fw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -n aufgerufen, werden unter keinen Umst?nden
?nderungen an den im Kernel aktiven Regeln vorgenommen.

Wird
`ipcs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ipcs&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -u aufgerufen, zeigt es alle IPC-Ressourcen an, die
dem angegebenen Benutzer geh?ren.

Wird
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -b aufgerufen, zeigt das Kommando nur noch die
Aktion und den Kommentar der Regel, die eigentliche Regel wird nicht
mehr angezeigt.

Wird
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -U aufgerufen, kann man einen Befehl mit der
Kernnung eines Benutzers ausf?hren, der nur innerhalb des
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
existiert.

Die neue Option -l von
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
bereinigt die Umgebung eines Jails. Analog zur Option -l von
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
werden alle Umgebungsvariablen au?er HOME, SHELL, PATH, TERM und USER
entfernt, bevor ein Programm im Jail gestartet wird.

Das neue Debugging-Werkzeug
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
ist gegen **libgdb** gebunden und kann mit Kernelthreads, Kernelmodulen
und
`kvm(3) <http://www.FreeBSD.org/cgi/man.cgi?query=kvm&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
umgehen.

Wird
`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -e aufgerufen, wird der bei -u angegebene auf die
aktive (effective) und nicht die reale (real) User-ID angewandt.
[MERGED]

Die Bibliothek
`libalias(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libalias&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt ?ber eine neue API mehrere Instanzen innerhalb eines
Prozesses. Die existierende API wurde mit den Funktionen der neuen API
neu implementiert, um die Kompatibilit?t mit ?lteren Anwendungen
sicherzustellen.

Die neue Bibliothek **libarchive** erlaubt die Verarbeitung von
komprimierten und unkomprimierten Archiven. Weitere Informationen finden
Sie in
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__.

**libdisk** nutzt zur Adressierung von Festplatten jetzt d\_addr\_t,
damit
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
Festplatten und Dateisysteme mit einer Gr??e von mehr als einem TB
korrekt behandelt.

Die Umgebungsvariable LIBPTHREAD\_SYSTEM\_SCOPE erzwingt unter
**libpthread** den 1:1 Modus (mit System-Scope-Threads). Der 1:1 Modus
wird ebenfalls erzwungen, wenn **libpthread** mit der Option
-DSYSTEM\_SCOPE\_ONLY ?bersetzt wird. Diese Option ist die
Voreinstellung auf Systemen, die den M:N Modus noch nicht beherrschen.
Weiterhin erzwingt die Umgebungsvariable LIBPTHREAD\_PROCESS\_SCOPE den
M:N Modus (mit Process-Scope-Threads). Beispiele:

.. code:: SCREEN

    % LIBPTHREAD_SYSTEM_SCOPE=yes threaded_app

Startet die Anwendung threaded\_app mit System-Scope-Threads.

.. code:: SCREEN

    % LIBPTHREAD_PROCESS_SCOPE=yes threaded_app

Startet die Anwendung threaded\_app mit Process-Scope-Threads.

Der Fehler in der Option -d von
`look(1) <http://www.FreeBSD.org/cgi/man.cgi?query=look&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
wurde behoben.
`look(1) <http://www.FreeBSD.org/cgi/man.cgi?query=look&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
funktioniert jetzt auch mit Lokalisierungen, die Multibyte-Zeichen
verwenden.

`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
behandelt Dateinamen jetzt gem?? der Einstellung in LC\_CTYPE korrekt
als Folgen aus Zeichen mit mehr als einem Byte, wenn es bestimmt, welche
Zeichen druckbar sind.

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt auch die Anweisung .warning.

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
versteht nun das POSIX-kompatible Pr?fix + f?r auszuf?hrende Kommandos.
Mit diesem Pr?fix gekennzeichnete Kommandos werden trotz des Schalters
-n ausgef?hrt. Diese Funktion ist n?tzlich, wenn weitere ``Makefile``\ s
ausgef?hrt werden.

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
f?gt nun, wie vom POSIX-Standard gefordert, Variablenzuweisungen auf der
Kommandozeile in die Variable MAKEFLAGS ein. Dies f?hrt dazu, da? solche
Variablen an weitere Aufrufe von
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
weiter gereicht werden (es sei denn, MAKEFLAGS wird explizit
?berschrieben). Die Variablen k?nnen damit nur noch auf der
Kommandozeile eines weiteren Aufrufs von
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
?berschrieben werden.

Die im C99 Standard definierten Funktionen
`nearbyint(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nearbyint&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
und
`nearbyintf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nearbyintf&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
stehen jetzt zur Verf?gung.

Die neue C99-Datei ``tgmath.h`` stellt vom Typ unabh?ngige Makros f?r
die Funktionen vom Type float, double und long double aus ``math.h`` und
``complex.h`` zur Verf?gung.

Die GNU-Erweiterungen von
`mbsnrtowcs(3) <http://www.FreeBSD.org/cgi/man.cgi?query=mbsnrtowcs&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
und
`wcsnrtombs(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wcsnrtombs&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
wurden implemtiert.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
erlaubt dem Anwender jetzt, in ``newsyslog.conf`` eine Option zur
Fehlersuche zu setzen.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
geht bei der Rotation von Dateien jetzt anders vor: Zuerst werden alle
Dateien rotiert, die rotiert werden m?ssen. Danach wird jedem Proze?,
dem ein Signal gesendet werden mu?, genau ein Signal gesendet. Als
letzter Schritt werden alle Dateien komprimiert, die komprimiert werden
m?ssen.

Die neue Funktion
`nextwctype(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nextwctype&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
erlaubt es, ?ber alle Zeichen innerhalb einer bestimmten Klasse zu
iterieren.

Es gibt jetzt minimale Unterst?tzung f?r die UTF-8 Version aller zur
Zeit unterst?tzten Lokalisierungen des Systems. Diese ?nderung ist
prim?r zur Unterst?tzung des Ports
```misc/utf8locale`` <http://www.FreeBSD.org/cgi/url.cgi?ports/misc/utf8locale/pkg-descr>`__
gedacht.

Mit Israel Hebrew he\_IL.UTF-8 steht eine Lokalisierung f?r Israel mit
hebr?ischen Schriftzeichen zur Verf?gung.

Das neue Programm
`logins(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logins&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
zeigt Informationen ?ber User- und Systemaccounts an.

Bei
`mountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mountd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
kann mit der neuen Option -p ein fester Port angegeben werden, der dann
im Regelsatz einer Firewall genutzt werden kann.

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
zeigt jetzt auch an, in welchen Multicast Gruppen sich das System
befindet.

Werden
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
und
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -l aufgerufen, wird auf dem neuen Dateisystem
automatisch die Option "MAC Multilabel" gesetzt; es ist also nicht mehr
notwendig, diese Option manuell mit
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
zu setzen.

`nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
protokolliert jetzt Anmeldeversuche via
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

`nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
wurde von ``/sbin/nologin`` nach ``/usr/sbin/nologin`` verschoben.
``/sbin/nologin`` ist jetzt ein Verweis auf die neue Lokation, damit
wird die Kompatibilit?t mit ?lteren Systemen gewahrt.

In der Unterst?tzung f?r NSS wurde ein Fehler beseitigt, der zu
Problemen beim Betrieb von NSS-Modulen aus anderen Quellen (z.B.
```net/nss_ldap`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/nss_ldap/pkg-descr>`__)
und Gruppen mit vielen Mitgliedern gef?hrt hat.

`od(1) <http://www.FreeBSD.org/cgi/man.cgi?query=od&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
bietet jetzt POSIX-?hnliche Unterst?tzung f?r Zeichen, die mehr als ein
Byte belegen.

`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
wurde durch die OpenBSD-Version mit einer BSD-Lizenz ersetzt. Die Option
--posix erzwingt die strikte Beachtung des POSIX-Standards.

Die beiden Programme
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
and
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
wurden aus NetBSD importiert. Sie unterst?tzen zus?tzlich auch die
Option -M, um die Werte der Namensliste aus dem angegebenen core statt
aus ``/dev/kmem`` zu extrahieren, und die Option -N, um die Namensliste
aus dem angegebenen System statt aus dem Standard-Kernel zu extrahieren.

Wird bei
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
das neue Kommando \`\`set rad\_alive N'' genutzt, werden in regelm??igen
Abst?nden RADIUS Accounting Informationen an den RADIUS-Server gesendet.
[MERGED]

Das neue Kommando \`\`set pppoe [standard\|3Com]'' von
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
legt den Operationsmodus des zu Grunde liegenden
`ng\_pppoe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_pppoe&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph-Knotens fest.

Das Programm
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
erf?llt die Anforderungen des POSIX/SUSv3 Standards jetzt besser. Zu den
Verbesserungen geh?ren die neue Option include -p zur Angabe einer Liste
von Proze?-IDs, die neue Option -t zur Angabe einer Liste von Terminal
Namen, die neue Option -A als Alias f?r -ax, die neue Option -G zur
Angabe einer Liste von Gruppen-IDs, die neue Option -X als Gegenst?ck zu
-x, sowie diverse kleinere Verbesserungen. Weitere Informationen finden
Sie in
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__.
[MERGED]

In
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler behoben, der zu Fehlern f?hrte, wenn eine
Netzwerk-Schnittstelle mehr als eine IP Adresse hatte. [MERGED]

`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt die neue Format-Option -O emul, die ausgibt, innerhalb
welcher Systemaufruf-Emulation der Proze? l?uft.

Wird
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Optionen -H aufgerufen, erwartet es ein verschl?sseltes
Pa?wort aus einem Eingabestrom. [MERGED]

`regex(3) <http://www.FreeBSD.org/cgi/man.cgi?query=regex&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
unterst?tzt jetzt regul?re Ausdr?cke, die Zeichen beachten, die mehr als
ein Byte belegen.

In den von
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
genutzten Konfigurationsdateien k?nnen jetzt die Schl?sselw?rter
timeout: und attempts: verwendet werden.

Die
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
Bibliothek und ihre diversen Schnittstellen sind jetzt deutlich
reentranter und brauchbarer f?r Threads. Es ist jetzt m?glich, mehr als
eine DNS-Anfrage auf einmal abzuwickeln, dadurch verbessert sich die
Performance einiger Anwendungen mit mehreren Threads ganz erheblich.
Allerdings m?ssen einiger dieser Programme neu ?bersetzt werden,
Beispiele aus der Ports Collection sind
```www/mozilla`` <http://www.FreeBSD.org/cgi/url.cgi?ports/www/mozilla/pkg-descr>`__
und ?hnliche Programme,
```mail/evolution`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/evolution/pkg-descr>`__,
```devel/gnomevfs`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs/pkg-descr>`__
und
```devel/gnomevfs2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs2/pkg-descr>`__.

Wird
`rmdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rmdir&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -v aufgerufen, gibt es zus?tzliche Informationen
aus.

`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
funktioniert jetzt korrekt, wenn der Dump gr??er als 2 GByte ist.

In
`script(1) <http://www.FreeBSD.org/cgi/man.cgi?query=script&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
wurde ein Fehler beseitigt, damit das Programm auch dann korrekt
funktioniert, wenn die Standardeingabe geschlossen wurde. Ohne diese
Korrektur h?tte es in Verbindung mit
```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__
dazu kommen k?nnen, da? im nicht-interaktiven Betrieb alle veralteten
Ports entfernt, aber nicht wieder neu erzeugt werden.

Mit
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
steht jetzt ein Hintergrunddienst f?r das Bluetooth Service Discovery
Protocol zur Verf?gung.

Das
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
Kommando y (translate) unterst?tzt jetzt Zeichen, die mehr als ein Byte
belegen.

Es beiden neuen Programme
`sha1(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha1&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
und
`rmd160(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rmd160&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
berechnen eine sichere Pr?fsumme ?ber die von Ihnen eingelesenen Daten,
analog zur Funktion von
`md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__.
[MERGED]

Mit dem neuen Programm
`smbmsg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=smbmsg&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
kann man SMBus Nachrichten versenden und empfangen.

Wird
`sunlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sunlabel&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -c aufgerufen, benutzt es zur Berechnung der
Partitionsgr??e Zylinder statt der ?blichen Sektoren. Die ebenfalls neue
Option -h gibt das Label in einem benutzerfreundlich Gr??e/Start Format
aus.

Wenn sich Absender und Empf?nger auf dem lokalen System befindet,
verwendet
`talk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=talk&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
jetzt in den Paketen, die es an
`talkd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=talkd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
schickt, ``localhost`` als Standard-Maschinennamen. Das bedeutet, da?
`talk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=talk&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
ab jetzt auf einen korrekten Eintrag for ``localhost`` angewiesen ist,
dieser mu? entweder in ``/etc/hosts`` stehen oder per DNS aufl?sbar
sein.

Wird
`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -w aufgerufen, erlaubt er die Erzeugung neuer
Dateien. Mit der ebenfalls neuen Option -U kann die Umask eingestellt
werden.

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
kann jetzt auch den aktuellen Datendurchsatz anzeigen. Diese Erweiterung
kann durch Dr?cken der Taste \`\`m'' und mit der Kommandozeilenoption -m
io aktiviert werden.

Viele Benutzerprogramme im Standardsystem (zum gr??ten Teil die
GNU-Programme) nutzen jetzt die Systemversion
von\ `getopt\_long(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getopt_long&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
und nicht mehr die GNU-Version.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1. ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Das Script ``diskless`` wurde in die Scripte ``hostname``, ``resolve``,
``tmp`` und ``var`` aufgeteilt.

Das neue Script ``gbde_swap`` stellt verschl?sselte Swap-Partitionen zur
Verf?gung. Wenn in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
die Variable gbde\_swap\_enable definiert ist und in
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
eine Swap-Partition mit dem Namen ``/dev/foo.bde`` angeben ist, wird
diese beim Start des Systems automatisch an das Ger?t ``/dev/foo``
angebunden. Au?erdem wird ein zuf?lliger Schl?ssel generiert, indem die
MD5-Pr?fsumme ?ber 512 Bytes aus ``/dev/random`` berechnet wird. Bitte
beachten Sie, da? es damit nicht mehr m?glich ist, Kernel Dumps zu
sichern.

Neu sind die Optionen ip6addrctl\_enable und ip6addrctl\_verbose. Ist
die Option ip6addrctl\_enable auf YES gesetzt, wird die Address
Selection Policy in den Kernel aufgenommen. Wenn die Datei
``/etc/ip6addrctl.conf`` existiert, wird diese benutzt, sonst wird eine
Standard-Policy verwendet. Die Standard-Policy ist die in RFC 3484
beschriebene Policy f?r den Fall, da? ipv6\_enable auf YES gesetzt ist.
Andernfalls ist die Standard-Policy die Priorit?ts-Policy f?r IPv4
Adressen.

Das neue Script ``mixer`` sichert beim Herunterfahren des Systems alle
Lautst?rkeneinstellungen und stellt sie beim Start des Systems
automatisch wieder her.

Das Skript ``named`` wurde auf **BIND 9** des Basissystems angepasst.
Unter anderem wurden folgende ?nderungen vorgenommen:

-  `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   l?uft standardm??ig im
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__-Verzeichnis
   ``/var/named``. In der Datei ``rc.conf`` k?nnen Sie mit der Variablen
   named\_chrootdir die Verwendung von
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
   abstellen oder das
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__-Verzeichnis
   ?ndern.

-  Ist die Variable named\_chroot\_autoupdate auf YES gesetzt (die
   Vorgabe), wird das
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__-Verzeichnis
   automatisch beim Systemstart eingerichtet. Es wird ein symbolischer
   Link von ``/etc/namedb`` auf ``/var/named/etc/namedb`` und ein
   symbolischer Link von ``/var/run/named/pid`` auf
   ``/var/named/var/run/named/pid`` eingerichtet. Die Anlage der Links
   k?nnen Sie mit der Variablen named\_symlink\_enable in der Datei
   ``rc.conf`` verhindern.

-  Die Datei ``rndc.key`` wird erstellt, wenn sie noch nicht existiert.

Die neuen Scripts ``pf`` und ``pflog`` dienen zur Unterst?tzung von
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~

Die **ACPI-CA** Routinen wurden von der Zwischenversion 20030619 auf die
Zwischenversion 20040527 aktualisiert.

**AMD (am-utils)** wurde von Version 6.0.9 auf Version 6.0.10p1
aktualisiert.

Der Bell Labs **awk** wurden von der am 29. Juli 2003 ver?ffentlichten
Version auf die am 7. Februar 2004 ver?ffentlichte Version aktualisiert.

**BIND** wurde von Version 8.3.1-REL auf die Version 9.3.0 aktualisiert.

**Binutils** wurde auf eine Zwischenversion des FSF-Entwicklungszweiges
2.15 vom 23. Mai 2004 aktualisiert.

**CVS** wurde von Version 1.11.10 auf Version 1.11.17 aktualisiert.
[MERGED]

Das Werkzeug **FILE** wurde von Version 3.41 auf die Version 4.10
aktualisiert.

Die Bibliothek **gdtoa** dient zur Umwandlung von Zahlen zwischen dem
Bin?r- und Dezimalformat und wurde von Version 20030324 auf Version
20040118 aktualisiert.

**GDB** wurde auf Version 6.1.1 aktualisiert.

**GNU GCC** wurde von 3.3.3-prerelease vom 6. November 2003 auf
3.4.2-prerelease vom 28. Juli 2004 aktualisiert.

**GNU grep** wurde von Version 2.4d auf Version 2.5.1 aktualisiert.

**GNU sort** wurde von der Version aus textutils 2.1 auf die Version aus
coreutils vom 12. August 2004 aktualisiert.

**less** wurde von Version 371 auf Version 381 aktualisiert.

**GNU readline** 4.3 wurde mit den offiziellen Korrekturen 001 bis 005
aktualisiert.

Die Bibliothek **GNU regex** wurde auf die Version aktualisiert, die in
**GNU grep** 2.5.1 enthalten ist.

Die **GNU tar** Version im Basissystem hei?t jetzt ``gtar``.

**Heimdal Kerberos** wurde von Version 0.6 auf Version 0.6.1.
aktualisiert.

Der **ISC DHCP** Client wurde von Version 3.0.1 RC10 auf Version 3.0.1
aktualisiert.

**libpcap** wurde von Version 0.7.1 auf Version 0.8.3 aktualisiert.

**lukemftpd** wurde von der Zwischenversion vom 3. November 2003 auf die
Zwischenversion vom 9. August 2004 aktualisiert.

**OpenPAM** wurde von der Version Dogwood auf die Version Eelgrass
aktualisiert.

**OpenSSH** wurde von Version 3.6.1p1 auf Version 3.8.1p1 aktualisiert.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die Standardkonfiguration von
    `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
    wurde ge?ndert. Die Version 1 des SSH Protokolls wird nicht mehr
    standardm??ig unterst?tzt. Weiterhin wird die Authentifizierung mit
    Pa?wort nicht mehr akzeptiert, wenn PAM aktiviert wurde.

.. raw:: html

   </div>

**OpenSSL** wurde von Version 0.9.7c auf Version 0.9.7d aktualisiert.
[MERGED]

Aus einer Prerelease-Version von **OpenSSL** wurde die Unterst?tzung f?r
die PadLock ACE (Advanced Cryptography Engine) der VIA C3 (Nehemiah)
Prozessoren ?bernommen.

Der aus OpenBSD 3.5-stable stammende Paketfilter **pf** wurde in FreeBSD
importiert und wird standardm??ig installiert. Die von **pf** ben?tigten
Benutzer ``proxy`` und ``_pflogd`` sowie die drei ben?tigten Gruppen
``authpf``, ``proxy`` und ``_pflogd`` wurden ebenfalls hinzugef?gt.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Wenn Sie Ihr System mit Hilfe des Quellcodes
    aktualisieren, m?ssen Sie den User und die beiden Gruppen vor der
    Aktualisierung anlegen. Sie k?nnen mergemaster -p benutzen, um die
    richtigen Eintr?ge in den Dateien
    `passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
    und
    `group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
    anlegen zu lassen. Wenn **pf** nicht erzeugt werden soll, mu? in
    ``make.conf`` die Variable NO\_PF gesetzt sein.

.. raw:: html

   </div>

Einige Zusatzprogramme f?r **pf** von OpenBSD wurden ebenfalls
importiert.
`ftp-proxy(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp-proxy&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
ist ein FTP-Proxy f?r
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`pfctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pfctl&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
ist das ?quivalent von
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
`pflogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pflogd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
ist ein Hintergrunddienst, der mit if\_pflog Pakete im
`pcap(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pcap&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__-Format
protokolliert und
`authpf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=authpf&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
ist eine Shell, die nach der Authentifizierung eines Benutzers
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-Regels?tze
anpasst.

**routed** wurde von Version 2.22 auf die Version 2.27 von rhyolite.com
aktualisiert. Wenn Sie die MD5 Authentification in RIP nutzen, m?ssen
Sie beachten, da?
`routed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=routed&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
nicht mehr zu fr?heren FreeBSD-Versionen kompatibel ist, daf?r ist er
jetzt kompatibel zu den Implementierungen von Sun, Cisco und anderen
Herstellern.

**sendmail** wurde von Version 8.12.10 auf Version 8.13.1 aktualisiert.
[MERGED]

**tcpdump** wurde von Version 3.7.1 auf Version 3.8.3 aktualisiert.

**tcsh** wurde von Version 6.11 auf Version 6.13.00 aktualisiert.

Die Datenbank f?r die Zeitzonen wurde von der Version ``tzdata2003a``
auf die Version ``tzdata2004a`` aktualisiert.

**zlib** wurde von Version 1.1.4 auf Version 1.2.1 aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5. Infrastruktur f?r Ports und Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die meisten start- und Stopskripten der Ports benutzen nun das neue
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__-System,
das in FreeBSD 5.X eingef?hrt wurde. Einige Ports benutzen noch die
alten Skripten. Beim Systemstart werden zuerst die neuen Skripten und
dann die alten ausgef?hrt, beim Herunterfahren werden die Skripten in
der umgekehrten Reihenfolge ausgef?hrt.

Das Attribut SIZE kann zur Pr?fung der Gr??e der Distributionsdateien
genutzt werden, bevor diese ?bertragen werden, dieses Attribut ist
standardm??ig aktiviert. Mit der Einstellung DISABLE\_SIZE kann ein
Anwender diese Pr?fung abschalten. Diese M?glichkeit ist f?r Anwender
?lterer FreeBSD Versionen gedacht, bei denen
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
diese Pr?fung unterst?tzt sowie f?r einige FTP Proxies, die
standardm??ig falsche oder unsinnige Gr??en melden.

Das Ports-Verzeichnis enth?lt zwei neue Dateien mit wichtigen
Informationen: ``ports/CHANGES`` informiert ?ber gr??e ?nderungen an der
Ports Collection und der Infrastruktur dazu. ``ports/UPDATING``
informiert ?ber Stolpersteine bei der Aktualisierung bestimmer Ports,
analog zu den Informationen zur Aktualisierung des Systems, die in
``src/UPDATING`` zu finden sind.

Die von den Package-Programmen (``pkg_*``) des Systems genutzten
Routinen zur Analyse der Versionsnummer wurden neu implementiert und
sind jetzt wieder kompatibel zu den Routinen in 4.x und
```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__.

Die Package-Programme des Systems verstehen jetzt relationale Operatoren
und die von der csh her bekannten {...} Auswahloperatoren:

.. code:: SCREEN

    # pkg_info -I 'docbook>=3.0'

zeigt alle Docbook DTDs ab der Versionsnummer 3.0 an. Zus?tzliche gibt
es neue Kommandozeilenoptionen, die bei der Nutzung von Jokerzeichen
helfen.

Die Package-Programme des Systems k?nnen jetzt besser mit besch?digten
Package-Datenbanken umgehen.

Wird
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -S aufgerufen, wird bei der Erzeugung des Packages
allen @cwd ein Pr?fix vorangestellt.

Wird
`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
mit der neuen Option -j aufgerufen, zeigt es die Liste der Anforderungen
f?r jedes Package an.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6. Erzeugung von Releases und Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die Kryptographie-Funktionen von FreeBSD sind nicht mehr optionaler
Bestandteil von Releases. Die crypto-Distribution wurde in die
base-Distribution aufgenommen. F?r Leute, die weiterhin Programme ohne
Kryptographie bauen wollen, existiert weiterhin die Bauoption -DNOCRYPT.

**GNOME** wird jetzt in der Version 2.6.2 statt der Version 2.4
unterst?tzt.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Wenn Sie nur die alte Version des **GNOME** Desktops
    verwenden
    (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__),
    f?hrt ein einfaches Update aus der FreeBSD Ports Collection mit
    Hilfe von
    `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__
    (```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__)
    zu gr??eren Problemen. Wenn Sie den **GNOME** Desktop benutzen,
    sollen Sie die bei http://www.FreeBSD.org/gnome/docs/faq26.html
    verf?gbaren Informationen sorgf?ltig lesen und das Script
    ``gnome_upgrade.sh`` benutzen, um **GNOME** auf Version 2.6 zu
    aktualisieren.

    Wenn Sie allerdings nur einige der **GNOME** Bibliotheken benutzen,
    k?nnen Sie die installieren Ports wahrscheinlich problemlos mit
    `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__
    aktualisieren.

.. raw:: html

   </div>

**KDE** wird jetzt in der Version 3.3.0 statt der Version 3.1.4
unterst?tzt.

In der FreeBSD Ports Collection gibt es jetzt das Programm
```security/portaudit`` <http://www.FreeBSD.org/cgi/url.cgi?ports/security/portaudit/pkg-descr>`__,
das eine Datenbank mit bekannten Schwachstellen in Ports/Packages
ausliest und den Systemadministrator ?ber Gefahren informiert.

Das standardm??ig verwendete X-Window-System in FreeBSD ist nun **Xorg**
anstelle von **XFree86**. Von **Xorg** wird die Version X11R6.7.0
verwendet. **XFree86** ist weiterhin in der Ports-Collection
(```x11/XFree86-4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/XFree86-4/pkg-descr>`__)
enthalten.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7. Dokumentation
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktualisierung einer ?lteren Version von FreeBSD
---------------------------------------------------

Anwender, die schon ein FreeBSD-System im Einsatz haben, sollten *auf
jeden Fall* die \`\`Hinweise f?r die ersten Anwender von FreeBSD
5.3-RELEASE'' lesen. Dieses Dokument ist auf den Distributionen in der
Regel in der Datei ``EARLY.TXT`` verf?gbar; ansonsten sollte es ?berall
dort verf?gbar sein, wo auch die anderen Dokumente der Release Notes
verf?gbar sind. Das Dokument enth?lt einige Tips f?r die Aktualisierung;
viel wichtiger ist aber die Analyse der beiden Optionen Wechsel zu
FreeBSD 5.X oder Weitere Verwendung von FreeBSD 4.X.

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

Alle Anwender von FreeBSD 5-STABLE sollten sich in die Mailingliste
<stable@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.
