=======================================
4. Ein Vergleich zwischen BSD und Linux
=======================================

.. raw:: html

   <div class="navheader">

4. Ein Vergleich zwischen BSD und Linux
`Zur?ck <why-is-bsd-not-better-known.html>`__?
?
?

--------------

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

   <div class="navfooter">

--------------

+--------------------------------------------------+-------------------------------+-----+
| `Zur?ck <why-is-bsd-not-better-known.html>`__?   | ?                             | ?   |
+--------------------------------------------------+-------------------------------+-----+
| 3. Warum ist BSD nicht bekannter??               | `Zum Anfang <index.html>`__   | ?   |
+--------------------------------------------------+-------------------------------+-----+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
