========================
Hintergrundwissen zu BSD
========================

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Greg Lehey
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<grog@FreeBSD.org>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD ist ein eingetragenes Warenzeichen der FreeBSD Foundation.

AMD, AMD Athlon, AMD Opteron, ?lan und PCnet sind eingetragene
Warenzeichen von Advanced Micro Devices, Inc.

Apple, FireWire, Mac, Macintosh, Mac OS, Quicktime und TrueType sind
eingetragene Warenzeichen von Apple Computer, Inc., in den Vereinigten
Staaten und anderen L?ndern.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium und Xeon sind
Warenzeichen oder eingetragene Warenzeichen der Intel Corporation oder
ihrer Gesellschaften in den Vereinigten Staaten und in anderen L?ndern.

Linux ist ein eingetragenes Warenzeichen von Linus Torvalds.

Motif, OSF/1 und UNIX sind eingetragene Warenzeichen und IT DialTone und
The Open Group sind Warenzeichen der The Open Group in den Vereinigten
Staaten und in anderen L?ndern.

Sparc, Sparc64, und UltraSPARC sind Warenzeichen von SPARC
International, Inc in den Vereinigten Staaten und in anderen L?ndern.
Produkte, die das Warenzeichen SPARC tragen, basieren auf einer von Sun
Microsystems, Inc. entwickelten Architektur.

Sun, Sun Microsystems, Java, Java Virtual Machine, JDK, JSP, JVM, Netra,
Solaris, StarOffice und SunOS sind Warenzeichen oder eingetragene
Warenzeichen von Sun Microsystems, Inc. in den Vereinigten Staaten und
in anderen L?ndern.

UNIX is a registered trademark of The Open Group in the United States
and other countries.

Viele Produktbezeichnungen von Herstellern und Verk?ufern sind
Warenzeichen. Soweit dem FreeBSD Project das Warenzeichen bekannt ist,
werden die in diesem Dokument vorkommenden Bezeichnungen mit dem Symbol
„™“ oder dem Symbol „?“ gekennzeichnet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

In der Open Source-Welt steht das Wort „Linux“ oft synonym f?r
„Betriebssystem“, obwohl es nicht das einzige frei verf?gbare
Betriebssystem ist. Laut `Internet Operating System
Counter <http://www.leb.net/hzo/ioscount/data/r.9904.txt>`__ liefen im
April?1999 weltweit 31,3?Prozent der vernetzten Rechner unter Linux,
14,6?Prozent liefen hingegen unter BSD?UNIX?. Einige der weltweit
gr??ten Internetdienstleister, darunter
`Yahoo! <http://www.yahoo.com/>`__, verwenden BSD. Der im Jahre 1999
weltgr??te FTP-Server `ftp.cdrom.com <ftp://ftp.cdrom.com/>`__
(inzwischen abgeschaltet) verwendete BSD, um t?glich 1,4?Terabyte an
Daten zu ?bertragen. Hier geht es offensichtlich nicht um einen
Nischenmarkt, BSD ist vielmehr ein gut geh?tetes Geheimnis.

Worin besteht nun dieses Geheimnis? Warum ist BSD nicht bekannter?
Dieser Artikel versucht, diese und andere Fragen zu beantworten.

Unterschiede zwischen BSD und Linux werden in diesem Artikel *kursiv*
dargestellt.

*?bersetzt von Fabio Tosques*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ `einzelne Abschnitte <index.html>`__ / komplettes Dokument ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Was ist BSD? <#what-is-bsd>`__
`2. Ein echtes UNIX?? <#what-a-real-unix>`__
`3. Warum ist BSD nicht bekannter? <#why-is-bsd-not-better-known>`__
`4. Ein Vergleich zwischen BSD und Linux <#comparing-bsd-and-linux>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1. Was ist BSD?
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD steht f?r „Berkeley Software Distribution“, also f?r die Verbreitung
des Quellcodes der University of California, Berkeley, und war
urspr?nglich als Erweiterung f?r ein von AT&T's Research entwickeltes
UNIX? Betriebssystem gedacht. Verschiedene Open?Source-Projekte beruhen
auf dieser, als 4.4BSD-Lite bekannten Quellcodeausgabe. In dieser
Ausgabe sind auch Softwarepakete anderer Open Source-Projekte,
insbesondere jene des GNU-Projekts, enthalten. Das komplette
Betriebssystem umfasst:

.. raw:: html

   <div class="itemizedlist">

-  Den BSD-Kernel, der sich um Prozessscheduling, Speichermanagement,
   die Unterst?tzung mehrerer Prozessoren (*symmetric multi-processing*,
   SMP), Ger?tetreiber und anderes mehr k?mmert.

   *Im Gegensatz zum Linux-Kernel gibt es verschiedene BSD-Kernel mit
   unterschiedlichen F?higkeiten*.

-  Die C-Bibliothek, die grundlegende API des Systems.

   *Die C-Bibliothek von BSD basiert auf Berkeley-Code und nicht auf
   Code des GNU-Projekts*.

-  N?tzliche Programme wie Shells, Programme f?r Dateioperationen,
   Compiler und Linker.

   *Einige Programme stammen aus dem GNU-Projekt, andere hingegen
   nicht*.

-  Das X?Window-System f?r die grafische Benutzeroberfl?che.

   Bei den meisten BSD-Versionen wird das X?Window-System eingesetzt und
   zwar die Version des `X.org <http://www.X.org/>`__-Projekts. FreeBSD
   erlaubt es dem Benutzer, aus einer grossen Anzahl an
   Desktop-Umgebungen zu w?hlen, wie beispielsweise Gnome, KDE oder
   Xfce. Ebenso gibt es leichtgewichtige Window-Manager wie Openbox,
   Fluxbox oder Awesome.

-  Viele weitere Programme und Werkzeuge.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2. Ein echtes UNIX??
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD-Betriebssysteme sind keine Nachbauten, sondern Weiterentwicklungen
des UNIX? Betriebssystems von AT&T's Research, das als Vorfahre des
modernen UNIX? System V gilt. ?berrascht Sie diese Aussage? Wie kann das
sein, wenn AT&T seine Quellen nie als Open Source ver?ffentlicht hat?

Es stimmt, dass AT&T UNIX? kein Open Source ist. Im Sinne des Copyright
ist BSD daher eindeutig *kein* UNIX?. Andererseits f?gte AT&T aber
Quellcode von anderen Projekten in den eigenen Code ein, insbesondere
jenen der Computer Sciences Research Group (CSRG) der University of
California in Berkeley, CA. Im Jahr 1976 begann die CSRG damit, B?nder
ihrer Software zu vertreiben, die sie *Berkeley Software Distribution*
oder *BSD* nannten.

Anfangs wurden vor allem Anwendungen ver?ffentlicht. Das ?nderte sich
schlagartig, als die CSRG von der Advanced Research Projects Agency
(DARPA) den Auftrag bekam, deren Kommunikationsprotokolle (ARPANET) zu
?berarbeiten. Die neuen Protokolle wurden als *Internet Protocols*
bezeichnet, und wurden sp?ter als *TCP/IP* weltbekannt. Die erste
Implementierung dieser Protokolle erfolgte 1982 als Teil von 4.2BSD.

Im Laufe der 80er Jahre entstanden einige neue Firmen, die Workstations
vertrieben. Viele zogen es vor, UNIX? zu lizenzieren und kein eigenes
Betriebssystem zu entwickeln. Sun?Microsystems lizenzierte UNIX?,
implementierte eine Version von 4.2BSD und bezeichnete das fertige
Produkt als SunOS™. Als es AT&T gestattet wurde, UNIX? kommerziell zu
vertreiben, verkaufte AT&T eine abgespeckte Version namens System?III,
der schnell System?V folgte. Im System?V-Basissystem waren keine
Netzwerkfunktionen enthalten, daher wurden alle Implementierungen
zus?tzlich mit Software des BSD-Projekts, darunter TCP/IP sowie diverse
n?tzliche Programme wie *csh* oder *vi*. Diese Erweiterungen wurden
unter der Bezeichnung *Berkeley Extensions* zusammengefasst.

Da die BSD-B?nder AT&T-Quellcode enthielten, war eine UNIX? Lizenz
erforderlich. Als im Jahre 1990 die F?rderung der CSRG auslief,
beschlossen einige Mitglieder der Gruppe, den quelloffenen BSD-Code ohne
den propriet?ren AT&T-Code zu ver?ffentlichen. Das Ergebnis dieser
Bem?hungen war *Networking Tape 2*, besser bekannt als *Net/2*. Net/2
war aber kein komplettes Betriebssystem, da gut 20 Prozent des
Kernelcodes fehlten. William F. Jolitz, ein Mitglied der CSRG, schrieb
den fehlenden Code und ver?ffentlichte diesen Anfang 1992 als *386BSD*.
Zur gleichen Zeit gr?ndete eine andere Gruppe ehemaliger CSRG-Mitglieder
das kommerzielle Unternehmen `Berkeley Software Design
Inc. <http://www.bsdi.com/>`__ und ver?ffentlichte eine Betaversion des
Betriebssystems unter dem Namen `BSD/386 <http://www.bsdi.com>`__, die
auf den gleichen Quellen basierte. Sp?ter wurde dieses Betriebssystem in
BSD/OS umbenannt.

386BSD war niemals wirklich stabil. Daher spalteten sich 1993 zwei neue
Projekte ab: `NetBSD <http://www.NetBSD.org/>`__ sowie
`FreeBSD <../../../../index.html>`__. Beide Projekte entstanden, weil
sich 386BSD zu langsam weiterentwickelte. Die erste NetBSD-Version
entstand Anfang 1993, die erste FreeBSD-Version Ende 1993. Zu dieser
Zeit hatte sich der Quellcode aber derart ver?ndert, dass es schwer war,
ihn wieder zu verschmelzen. Zudem hatten die beiden Projekte
unterschiedliche Ziele, die dieser Artikel noch beschreiben wird. 1996
spaltete sich ein weiteres Projekt von NetBSD ab:
`OpenBSD <http://www.OpenBSD.org>`__. 2003 spaltete sich schlie?lich
`DragonFlyBSD <http://www.dragonflybsd.org/>`__ von FreeBSD ab.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3. Warum ist BSD nicht bekannter?
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD ist aus vielen Gr?nden relativ unbekannt:

.. raw:: html

   <div class="orderedlist">

#. BSD-Entwickler sind eher an der Verbesserung des Codes interessiert
   als an der Vermarktung desselben.

#. Die Popularit?t von Linux beruht auch auf externen Faktoren wie der
   Presse, sowie auf Firmen, die gegr?ndet wurden, um Linux zu
   vertreiben. Bis heute fehlen den freien BSD-Systemen solche F?rderer.

#. BSD-Entwickler sind vielleicht erfahrener als Linux-Entwickler, und
   haben deshalb weniger Interesse daran, die Benutzung des Systems
   einfacher zu gestalten. Einsteiger sind bei Linux wahrscheinlich
   besser aufgehoben.

#. 1992 verklagte AT&T `BSDI <http://www.bsdi.com/>`__, den Verk?ufer
   von BSD/386, mit der Behauptung, der Quellcode enthalte
   urheberrechtlich gesch?tzten AT&T Code. Zwar kam es 1994 zu einer
   au?ergerichtlichen Einigung, die Leute waren aber erst einmal
   verunsichert. Noch im M?rz 2000 behauptete ein im Web publizierter
   Artikel, das Verfahren sei erst „k?rzlich“ eingestellt worden.

   Bez?glich der Bezeichnung schaffte der Gerichtsprozess jedoch
   Klarheit: In den 80er Jahren war BSD unter dem Namen „BSD?UNIX?“
   bekannt. Durch die Entfernung der letzten Zeilen des AT&T-Codes
   verlor BSD das Recht, sich UNIX? zu nennen. Deshalb finden Sie in der
   Literatur sowohl Verweise auf „4.3BSD UNIX?“ als auch auf „4.4BSD“.

#. Nach wie vor existiert das Vorurteil, die einzelnen BSD Projekte
   seien gespalten und zerstritten. Das `Wall Street
   Journal <http://interactive.wsj.com/bin/login?Tag=/&URI=/archive/retrieve.cgi%253Fid%253DSB952470579348918651.djm&>`__
   sprach gar von einer „Balkanisierung“ des BSD-Projekts. Wie der
   Prozess, basiert auch dieses Vorurteil haupts?chlich auf alten
   Geschichten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4. Ein Vergleich zwischen BSD und Linux
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wo sind nun die Unterschiede zwischen, sagen wir Debian GNU/Linux und
FreeBSD? F?r die meisten Benutzer sind die Unterschiede nicht gro?:
Beide sind UNIX? ?hnliche Betriebssysteme. Beide sind nichtkommerzielle
Projekte (was f?r eine Vielzahl anderer Linux-Distributionen nicht
gilt). Der folgende Abschnitt betrachtet BSD n?her und vergleicht es mit
Linux. Die meisten Erl?uterungen beziehen sich auf FreeBSD, da es sich
dabei um das am h?ufigsten installierte BSD-System handelt. Die
Unterschiede zu NetBSD, OpenBSD und DragonFlyBSD sind aber gering.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1. Wem geh?rt BSD?
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD geh?rt weder einer einzelnen Person, noch geh?rt es einem
Unternehmen. Entwickelt und zur Verf?gung gestellt wird es von einer
technisch interessierten und engagierten Gemeinschaft, die ?ber die
ganze Welt verteilt ist. Einige BSD-Komponenten sind eigenst?ndige Open
Source-Projekte mit eigenen Rechten, die getrennt verwaltet und gewartet
werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2. Wie erfolgt die Weiterentwicklung von BSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD-Kernel werden nach dem Open Source-Modell weiterentwickelt. Jedes
Projekt unterh?lt einen ?ffentlich zug?nglichen *Quellcode-Baum*, der
mit dem `Concurrent Versions System <http://www.cvshome.org/>`__ (CVS)
verwaltet wird, und alle Quellen des Projekts, die Dokumentation und
andere notwendige Dateien enth?lt. CVS erlaubt es Anwendern, jede
gew?nschte Version des Systems „auszuchecken“ (mit anderen Worten, eine
Kopie des System zu erhalten).

Eine Vielzahl von Entwicklern tr?gt weltweit zur Verbesserung von BSD
bei. Dabei werden drei Typen unterschieden:

.. raw:: html

   <div class="itemizedlist">

-  Ein *Contributor* schreibt Code oder Dokumentationen. Ihm ist es
   nicht gestattet, seinen Beitrag direkt in den Quellbaum einflie?en zu
   lassen. Bevor dieser Code in das System eingebracht wird, muss er von
   einem registrierten Entwickler, dem *Committer* gepr?ft werden.

-  *Committer* k?nnen Code in den Quellbaum einbringen, das hei?t sie
   besitzen Schreibrechte f?r den Quellcode-Baum. Um ein Committer zu
   werden, muss man zuerst seine F?higkeiten im gew?nschten Gebiet unter
   Beweis stellen.

   Es liegt im Ermessen des Committers, ob er die Allgemeinheit befragt,
   bevor er ?nderungen am Quellbaum vornimmt. In der Regel wird ein
   erfahrener Committer korrekte ?nderungen einf?gen, ohne sich mit
   anderen abzustimmen. Ein Committer des Documentation Projects k?nnte
   etwa typografische oder grammatikalische Korrekturen ohne lange
   Diskussion durchf?hren. Auf der anderen Seite sollten ?nderungen mit
   weitreichenden Konsequenzen vor dem Commit zur Begutachtung
   bereitgestellt werden. Im Extremfall kann ein Mitglied des Core
   Teams, das als Principal Architect fungiert, sogar die Entfernung der
   ?nderung aus dem Quellcodebaum veranlassen. Dieser Vorgang wird als
   *backing out* bezeichnet. Alle Committer werden durch eine E-Mail
   ?ber die erfolgte ?nderung informiert. Es ist daher nicht m?glich,
   heimlich eine ?nderung durchzuf?hren.

-  Das *Core Team*. Sowohl FreeBSD als auch NetBSD besitzen ein Core
   Team zur Betreuung des jeweiligen Projekts. Da die Core Teams erst im
   Projektverlauf entstanden, ist ihre Rolle nicht genau definiert. Um
   ein Mitglied des Core Teams zu sein, muss man kein Entwickler sein,
   obwohl dies die Regel ist. Die Regeln der Core Teams unterscheiden
   sich von Projekt zu Projekt, generell gilt aber, das dessen
   Mitglieder mehr Einfluss auf die Richtung des Projekts haben als
   Nichtmitglieder.

.. raw:: html

   </div>

Diese Konstellation unterscheidet sich von Linux in einigen Punkten:

.. raw:: html

   <div class="orderedlist">

#. Es sind stets mehrere Personen f?r das System verantwortlich. In der
   Praxis ist dieser Unterschied aber nicht gravierend, da zum einen der
   Principal Architect verlangen kann, dass ?nderungen zur?ckgenommen
   werden, und zum anderen auch beim Linux-Projekt mehrere Personen das
   Recht haben, ?nderungen vorzunehmen.

#. Es *existiert* ein zentraler Aufbewahrungsort (Repository), in dem
   die kompletten Betriebssystemquellen zu finden sind, einschlie?lich
   aller ?lteren Versionen.

#. BSD-Projekte pflegen das komplette „Betriebssystem“, nicht nur den
   Kernel. Dieser Unterschied ist aber marginal, da weder BSD noch Linux
   ohne Anwendungsprogramme sinnvoll einsetzbar sind. Die unter BSD
   eingesetzten Applikationen sind oft identisch mit denen von Linux.

#. Da beim BSD-Projekt nur ein CVS-Quellbaum gepflegt werden muss, ist
   die Entwicklung ?bersichtlicher, und es ist m?glich, auf jede
   beliebige Version einer Datei zuzugreifen. CVS erm?glicht auch
   inkrementelle Updates: Das FreeBSD-Repository wird beispielsweise
   etwa 100 Mal pro Tag ver?ndert. Viele dieser ?nderungen betreffen
   aber nur einen relativen kleinen Bereich von FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3. BSD-Versionen
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD, NetBSD und OpenBSD stellen drei verschiedene „Ausgaben“
(Releases) zur Verf?gung. Analog zu Linux erhalten diese Ausgaben eine
Nummer, etwa 1.4.1 oder 3.5. Die Versionsnummer erh?lt zus?tzlich ein
Suffix, das den Verwendungszweck bezeichnet:

.. raw:: html

   <div class="orderedlist">

#. Die Entwicklerversion hat das Suffix *CURRENT*. FreeBSD weist diesem
   Suffix eine Nummer zu, z.B. FreeBSD 5.0-CURRENT. NetBSD verwendet ein
   etwas anderes Bezeichnungsschema und h?ngt als Suffix nur einen
   Buchstaben an die Versionsnummer an, der ?nderungen an den internen
   Schnittstellen anzeigt, z.B. NetBSD 1.4.3G. OpenBSD weist der
   Entwicklerversion keine Nummer zu, sie hei?t also einfach
   „OpenBSD-current“. Neue Entwicklungen werden zuerst in diesen Zweig
   eingef?gt.

#. In regelm??igen Intervallen, durchschnittlich zwei- bis viermal im
   Jahr, wird eine so genannte *RELEASE*-Version des Systems
   ver?ffentlicht, die dann beispielsweise als OpenBSD?2.6-RELEASE oder
   NetBSD?1.4-RELEASE bezeichnet wird. Diese sind sowohl auf CD-ROM als
   auch als freier Download von den FTP-Servern der Projekte erh?ltlich.
   Diese RELEASE-Versionen sind f?r Endbenutzer gedacht. NetBSD
   verwendet sogar eine dritte Ziffer, um gepatchte Releases zu
   kennzeichnen (etwa NetBSD 1.4.2).

#. Sobald Fehler in einer RELEASE-Version gefunden werden, werden diese
   beseitigt und in den CVS-Baum eingef?gt. Beim FreeBSD-Projekt wird
   die daraus resultierende Version als *STABLE* bezeichnet, w?hrend sie
   bei NetBSD und OpenBSD weiterhin RELEASE hei?t. Kleinere ?nderungen,
   die sich nach einer Testphase im CURRENT-Zweig als stabil erweisen,
   k?nnen ebenfalls in die STABLE-Version einflie?en.

.. raw:: html

   </div>

*Bei Linux werden hingegen zwei getrennte Code-B?ume gepflegt: Eine
stabile Version und eine Entwicklerversion. Stabile Versionen haben an
der zweiten Stelle eine gerade Ziffer (2.0, 2.2 oder 2.4).
Entwicklerversionen haben an der zweiten Stelle eine ungerade Ziffer
(2.1, 2.3 oder 2.5). In jedem Fall folgt der zweiten Ziffer noch eine
dritte, welche die Version genauer bezeichnet. Zus?tzlich f?gt jeder
Verk?ufer einer Linux-Distribution selbst Programme und Werkzeuge hinzu.
Daher ist auch der Name der Distribution nicht unwichtig, da dieser
ebenfalls eine Versionsnummer enth?lt. So kann die vollst?ndige
Beschreibung beispielsweise so aussehen: „TurboLinux?6.0 mit
Kernel?2.2.14“*

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.4. Welche BSD-Versionen gibt es ?berhaupt?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Gegensatz zu den zahlreichen Linux-Distributionen gibt es nur vier
gro?e frei verf?gbare BSDs. Jedes BSD-Projekt unterh?lt seinen eigenen
Quellcode-Baum und seinen eigenen Kernel. In der Praxis scheinen die
Unterschiede im Code der Anwenderprogramme aber geringer zu sein als bei
Linux.

Es ist nicht einfach, die Ziele der einzelnen BSD-Projekte genau zu
trennen, da die Unterschiede eher subtiler Natur sind:

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD will eine hohe Leistung erreichen, f?r den Benutzer einfach
   in der Bedienung sein, und wird von Internetanbietern bevorzugt
   eingesetzt. Es l?uft auf einer Vielzahl von Plattformen, darunter
   i386™-Systeme („PCs“), Systeme mit einem AMD?64-Bit-Prozessor,
   UltraSPARC?-Systeme, Compaq?Alpha-Systeme, sowie Systeme, die der
   Spezifikation NEC?PC-98 entsprechen. Das FreeBSD-Projekt hat die mit
   Abstand gr??te Anwenderzahl unter den frei verf?gbaren BSD-Systemen.

-  Bei NetBSD ist Portabilit?t das oberste Ziel: „Nat?rlich l?uft NetBSD
   darauf“. NetBSD kann auf vielen verschiedenen Systemen, von Palmtops
   bis hin zu gro?en Servern, installiert werden, und wurde sogar schon
   im Raumfahrtprogramm der NASA eingesetzt. Besonders f?r alte
   Nicht-Intel?-Plattformen ist NetBSD die erste Wahl.

-  Bei OpenBSD stehen die Sicherheit und sauberer Code im Vordergrund.
   OpenBSD verbindet bei der Weiterentwicklung des Systems Open
   Source-Konzepte mit rigorosen *code reviews*. Dadurch entsteht ein
   sehr sicheres System, das OpenBSD f?r sicherheitsbewusste
   Unternehmen, Banken, B?rsen und die US-Regierung zu ersten Wahl
   macht. Auch OpenBSD l?uft, ?hnlich wie NetBSD, auf vielen
   verschiedenen Plattformen.

-  Das Ziel von DragonFlyBSD ist eine hohe Leistung und Skalierbarkeit
   auf allen Systemen, vom Einzelplatzrechner bis hin zu riesigen
   Cluster-Systemen. DragonFlyBSD verfolgt dabei langfristig
   verschiedene technische Ziele, der Schwerpunkt der Entwicklung liegt
   aber auf der Bereitstellung einer SMP-f?higen Infrastruktur, die
   leicht zu verstehen, zu warten und weiterzuentwickeln ist.

.. raw:: html

   </div>

Es gibt noch zwei weitere BSD UNIX? Systeme, die aber nicht Open Source
sind: BSD/OS sowie Apples Mac?OS??X:

.. raw:: html

   <div class="itemizedlist">

-  BSD/OS war das ?lteste, von 4.4BSD abstammende Betriebssystem. Es war
   zwar nicht Open Source, Quellcode-Lizenzen konnten aber relativ
   g?nstig erworben werden. Es wies viele Gemeinsamkeiten mit FreeBSD
   auf. Zwei Jahre, nachdem BSDi von Wind River Systems ?bernommen
   worden war, wurde die Entwicklung von BSD/OS als eigenst?ndiges
   Produkt eingestellt. Zwar wird BSD/OS von Wind River noch
   unterst?tzt, eine aktive Weiterentwicklung erfolgt allerdings nur
   noch f?r das Embedded-Betriebssystem VxWorks.

-  Bei `Mac?OS??X <http://www.apple.com/macosx/server/>`__ handelt es
   sich um die neueste Version des Betriebssystems der Macintosh?-Linie
   von `Apple Computer Inc.'s <http://www.apple.com/>`__.
   `Darwin <http://developer.apple.com/darwin/>`__, der BSD-Kern des
   Betriebssystems ist als voll funktionsf?higes Open
   Source-Betriebssystem f?r x86- sowie PPC-Computer erh?ltlich. Die
   grafische Oberfl?che Aqua/Quartz und andere propriet?re Anwendungen
   von Mac?OS??X sind aber weiterhin closed-source Software. Einige
   Darwin-Entwickler sind auch FreeBSD-Committer, was auch f?r den
   umgekehrten Fall gilt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.5. Worin unterscheidet sich die BSD-Lizenz von der GNU Public License?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux steht unter der `GNU General Public
License <http://www.fsf.org/copyleft/gpl.html>`__ (GPL), die entworfen
wurde, um closed-source Software zu verhindern. Jede Software, die von
einer Software abgeleitet wurde, die unter der GPL steht, muss wieder
unter der GPL ver?ffentlicht werden. Auf Verlangen ist auch der
Quellcode zur Verf?gung zu stellen. Die
`BSD-Lizenz <http://www.opensource.org/licenses/bsd-license.html>`__ ist
dagegen weniger restriktiv: Der Quellcode muss nicht zur Verf?gung
gestellt werden, es k?nnen also auch Bin?rdateien verbreitet werden.
Dieser Umstand ist besonders f?r Anwendungen im Embedded-Bereich
interessant.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.6. Was sollte ich sonst noch wissen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da f?r BSD weniger Anwendungsprogramme verf?gbar waren als f?r Linux,
wurde ein Softwarepaket entwickelt, das die Ausf?hrung von
Linuxprogrammen unter BSD erm?glicht. Dieses Paket enth?lt zwei Dinge:
Kernelmodifikationen zur korrekten Ausf?hrung von Linux-Systemaufrufen
sowie Linuxkompatibilit?tsdateien, beispielsweise die C-Bibliothek von
Linux. Unterschiede in der Ausf?hrungsgeschwindigkeit von
Linuxanwendungen auf einem Linuxrechner und einem vergleichbaren mit BSD
ausgestatteten Rechner sind in der Praxis so gut wie nicht feststellbar.

Die „Alles-aus-einer-Hand“-Natur von BSD hat den Vorteil, dass Upgrades
im Vergleich zu Linux h?ufig leichter durchzuf?hren sind. BSD
aktualisiert Bibliotheken, indem es Kompatibilit?tsmodule f?r ?ltere
Versionen der Bibliotheken bereitstellt. Daher ist es m?glich, auch
mehrere Jahre alte Bin?rdateien ohne Probleme auszuf?hren.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.7. Was soll ich nun benutzen, BSD oder Linux?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Was hei?t das nun alles f?r die Praxis? Wer sollte BSD, wer Linux
benutzen?

Diese Frage ist nicht einfach zu beantworten. Trotzdem folgen nun einige
Empfehlungen:

.. raw:: html

   <div class="itemizedlist">

-  „Wenn es nicht kaputt ist, fass' es nicht an!“: Wenn Sie schon ein
   frei verf?gbares Betriebssystem verwenden und damit gl?cklich sind,
   gibt es eigentlich keinen vern?nftigen Grund f?r einen Wechsel.

-  BSD-Systeme, inbesondere FreeBSD, k?nnen eine weitaus bessere
   Leistung als Linux-Systeme aufweisen. Diese Aussage ist aber nicht
   allgemein g?ltig. In den meisten F?llen sind die
   Leistungsunterschiede aber gering oder gar nicht festzustellen. In
   bestimmten F?llen kann auch Linux eine bessere Leistung aufweisen.

-  In der Regel haben BSD-Systeme den Ruf, zuverl?ssiger zu sein. Diese
   Aussage beruht auf der reiferen Codebasis.

-  Die BSD-Projekte haben den Ruf, ?ber qualitativ und quantitativ
   bessere Dokumentation zu verf?gen. Die verschiedenen
   Dokumentationsprojekte haben das Ziel, eine st?ndig aktualisierte und
   in zahlreiche Sprachen ?bersetzte Dokumentation zu erstellen, die
   alle Aspekte des System umfasst.

-  Die BSD-Lizenz kann attraktiver sein als die GPL.

-  BSD-Systeme k?nnen die meisten Linuxprogramme ausf?hren, w?hrend
   Linux keine BSD-Programme ausf?hren kann. Viele BSD-Systeme k?nnen
   sogar Programme von anderen UNIX? ?hnlichen Systemen ausf?hren.
   Daraus k?nnte man ableiten, dass die Migration auf ein BSD-System
   einfacher ist, als es bei Linux der Fall w?re.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.8. Wo gibt es Support, Serviceleistungen und Schulungen f?r BSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSDi / `FreeBSD Mall, Inc. <http://www.freebsdmall.com>`__ bieten seit
fast 10 Jahren Support-Vertr?ge f?r FreeBSD an.

Dar?ber hinaus finden sich auf den folgenden Seiten der einzelnen
Projekte Firmen, die Supportleistungen anbieten:
`FreeBSD <../../../../commercial/consult_bycat.html>`__,
`NetBSD <http://www.netbsd.org/gallery/consultants.html>`__, und
`OpenBSD <http://www.openbsd.org/support.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
