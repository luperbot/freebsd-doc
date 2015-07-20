=============================
1.3. ?ber das FreeBSD Projekt
=============================

.. raw:: html

   <div class="navheader">

1.3. ?ber das FreeBSD Projekt
`Zur?ck <nutshell.html>`__?
Kapitel 1. Einleitung
?\ `Weiter <install.html>`__

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

1.3. ?ber das FreeBSD Projekt
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der folgende Abschnitt bietet einige Hintergrundinformationen zum
FreeBSD Projekt, einschlie?lich einem kurzen geschichtlichen Abriss, den
Projektzielen und dem Entwicklungsmodell.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.3.1. Kurzer geschichtlicher Abriss zu FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das FreeBSD Projekt erblickte das Licht der Welt Anfang 1993 teils als
Auswuchs des „Unofficial 386BSD Patchkit“ unter der Regie der letzten
drei Koordinatoren des Patchkits: Nate Williams, Rod Grimes und Jordan
Hubbard.

Das urspr?ngliche Ziel war es, einen zwischenzeitlichen Abzug von 386BSD
zu erstellen, um ein paar Probleme zu beseitigen, die das
Patchkit-Verfahren nicht l?sen konnte. Der fr?he Arbeitstitel f?r das
Projekt war „386BSD 0.5“ oder „386BSD Interim“ als Referenz darauf.

386BSD war das Betriebssystem von Bill Jolitz, welches bis zu diesem
Zeitpunkt heftig unter fast einj?hriger Vernachl?ssigung litt. Als das
Patchkit mit jedem Tag anschwoll und unhandlicher wurde, entschied man
sich, Bill Jolitz zu helfen, indem ein ?bergangsweise „bereinigter“
Abzug zur Verf?gung gestellt wurde. Diese Pl?ne wurden durchkreuzt, als
Bill Jolitz pl?tzlich seine Zustimmung zu diesem Projekt zur?ckzog, ohne
einen Hinweis darauf, was stattdessen geschehen sollte.

Das Trio entschied, dass das Ziel sich weiterhin lohnen w?rde, selbst
ohne die Unterst?tzung von Bill und so wurde entschieden, den Namen
FreeBSD zu verwenden, der von David Greenman gepr?gt wurde. Die
anf?nglichen Ziele wurden festgelegt, nachdem man sich mit den
momentanen Benutzern des Systems besprach und abzusehen war, dass das
Projekt die Chance hatte, Realit?t zu werden, kontaktierte Jordan Walnut
Creek CDROM mit dem Vorhaben, FreeBSDs Verteilung auch auf diejenigen
auszuweiten, die noch keinen Internetzugang besa?en. Walnut Creek CDROM
unterst?tzte nicht nur die Idee durch die Verbreitung von FreeBSD auf
CD, sondern ging auch so weit dass es dem Projekt eine Maschine mit
schneller Internetverbindung zur Verf?gung stellte, um damit zu
arbeiten. Ohne den von Walnut Creek bisher nie dagewesenen Grad von
Vertrauen in ein, zur damaligen Zeit, komplett unbekanntes Projekt, w?re
es unwahrscheinlich, dass FreeBSD so weit gekommen w?re, wie es heute
ist.

Die erste auf CD-ROM (und netzweit) verf?gbare Ver?ffentlichung war
FreeBSD?1.0 im Dezember 1993. Diese basierte auf dem Band der
4.3BSD-Lite („Net/2“) der Universit?t von Kalifornien in Berkeley. Viele
Teile stammten aus 386BSD und von der Free Software Foundation. Gemessen
am ersten Angebot, war das ein ziemlicher Erfolg und Sie lie?en dem das
extrem erfolgreiche FreeBSD?1.1 im Mai 1994 folgen.

Zu dieser Zeit formierten sich unerwartete Gewitterwolken am Horizont,
als Novell und die Universit?t von Kalifornien in Berkeley (UCB) ihren
langen Rechtsstreit ?ber den rechtlichen Status des Berkeley
Net/2-Bandes mit einem Vergleich beilegten. Eine Bedingung dieser
Einigung war es, dass die UCB gro?e Teile des Net/2-Quellcodes als
„belastet“ zugestehen musste, und dass diese Besitz von Novell sind,
welches den Code selbst einige Zeit vorher von AT&T bezogen hatte. Im
Gegenzug bekam die UCB den „Segen“ von Novell, dass sich das
4.4BSD-Lite-Release bei seiner endg?ltigen Ver?ffentlichung als
unbelastet bezeichnen darf. Alle Net/2-Benutzer sollten auf das neue
Release wechseln. Das betraf auch FreeBSD. Dem Projekt wurde eine Frist
bis Ende Juli 1994 einger?umt, das auf Net/2-basierende Produkt nicht
mehr zu vertreiben. Unter den Bedingungen dieser ?bereinkunft war es dem
Projekt noch erlaubt ein letztes Release vor diesem festgesetzten
Zeitpunkt herauszugeben. Das war FreeBSD?1.1.5.1.

FreeBSD machte sich dann an die beschwerliche Aufgabe, sich St?ck f?r
St?ck aus einem neuen und ziemlich unvollst?ndigen Satz von
4.4BSD-Lite-Teilen, wieder aufzubauen. Die „Lite“ -Ver?ffentlichungen
waren deswegen leicht, weil Berkeleys CSRG gro?e Code-Teile, die f?r ein
start- und lauff?higes System gebraucht wurden, aufgrund diverser
rechtlicher Anforderungen entfernen musste und weil die 4.4-Portierung
f?r Intel-Rechner extrem unvollst?ndig war. Das Projekt hat bis November
1994 gebraucht diesen ?bergang zu vollziehen, was dann zu dem im Netz
ver?ffentlichten FreeBSD?2.0 und zur CD-ROM-Version (im sp?ten Dezember)
f?hrte. Obwohl FreeBSD gerade die ersten H?rden genommen hatte, war
dieses Release ein ma?geblicher Erfolg. Diesem folgte im Juni 1995 das
robustere und einfacher zu installierende FreeBSD?2.0.5.

Seit dieser Zeit hat FreeBSD eine Reihe von Releases ver?ffentlicht, die
jedes mal die Stabilit?t, Geschwindigkeit und Menge an verf?gbaren
Eigenschaften der vorherigen Version verbessert.

Momentan werden langfristige Entwicklungsprojekte im 10.X-CURRENT
(Trunk)-Zweig durchgef?hrt, und Abz?ge (Snapshots) der Releases von 10.X
werden regelm?ssig auf den
`Snapshot-Servern <ftp://ftp.FreeBSD.org/pub/FreeBSD/snapshots/>`__ zur
Verf?gung gestellt.

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

1.3.2. Ziele des FreeBSD-Projekts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Jordan Hubbard.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das FreeBSD Projekt stellt Software her, die ohne Einschr?nkungen f?r
beliebige Zwecke eingesetzt werden kann. Viele von uns haben
betr?chtlich in Quellcode und das Projekt investiert und h?tten sicher
nichts dagegen, hin und wieder ein wenig finanziellen Ausgleich daf?r zu
bekommen. Aber in keinem Fall bestehen wir darauf. Wir glauben unsere
erste und wichtigste „Mission“ ist es, Software f?r jeden Interessierten
und zu jedem Zweck zur Verf?gung zu stellen, damit die Software
gr??tm?gliche Verbreitung erlangt und gr??tm?glichen Nutzen stiftet. Das
ist, glaube ich, eines der grundlegenden Ziele freier Software, welche
wir mit gr??ter Begeisterung unterst?tzen.

Der Code in unserem Quellbaum, der unter die General Public License
(GPL) oder die Library General Public License (LGPL) f?llt, stellt
geringf?gig mehr Bedingungen. Das aber vielmehr im Sinne von
eingefordertem Zugriff, als das ?bliche Gegenteil der Beschr?nkungen.
Aufgrund zus?tzlicher Abh?ngigkeiten, die sich durch die Verwendung von
GPL-Software bei kommerziellem Gebrauch ergeben, bevorzugen wir daher
Software unter dem transparenteren BSD-Copyright, wo immer es angebracht
ist.

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

1.3.3. Das FreeBSD-Entwicklungsmodell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Satoshi Asami.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Entwicklung von FreeBSD ist ein offener und flexibler Prozess, der
durch den Beitrag von buchst?blich tausenden Leuten rund um die Welt
erm?glicht wird, wie an der `Liste der
Beitragenden <../../../../doc/de_DE.ISO8859-1/articles/contributors/article.html>`__
ersehen k?nnen. Die vielen Entwickler k?nnen aufgrund der
Entwicklungs-Infrastruktur von FreeBSD ?ber das Internet
zusammenarbeiten. Wir suchen st?ndig nach neuen Entwicklern, Ideen und
jenen, die sich in das Projekt tiefer einbringen wollen. Nehmen Sie
einfach auf der Mailingliste `FreeBSD technical
discussions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__
Kontakt mit uns auf. Die Mailingliste `FreeBSD
announcements <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__
steht f?r wichtige Ank?ndigungen, die alle FreeBSD-Benutzer betreffen,
zur Verf?gung.

Unabh?ngig davon ob Sie alleine oder mit anderen eng zusammen arbeiten,
enth?lt die folgende Aufstellung n?tzliche Informationen ?ber das
FreeBSD Projekt und dessen Entwicklungsabl?ufe.

.. raw:: html

   <div class="variablelist">

Die SVN-Repositories
     Der Hauptquellbaum von FreeBSD wurde ?ber viele Jahre
    ausschlie?lich mit `CVS <http://www.nongnu.org/cvs/>`__
    (Concurrent-Versions-System) gepflegt, einem frei erh?ltlichen
    Versionskontrollsystem, welches mit FreeBSD geliefert wird. Im Juni
    2008 begann das FreeBSD Project mit dem Umstieg auf
    `SVN <http://subversion.tigris.org>`__ (Subversion). Dieser Schritt
    wurde notwendig, weil durch technische Einschr?nkungen von CVS
    aufgrund des rapide wachsenden Quellcodebaumes und dem Umfang der
    bereits gespeichterten Revisisionsinformationen an dessen Grenzen zu
    sto?en begann. Die Repositories des Dokumentationsprojekts und die
    Ports-Sammlung wurden ebenfalls von CVS zu SVN im Mai und Juli 2012
    umgezogen. Lesen Sie dazu `Synchronisation der
    Quellen <synching.html>`__ f?r weitere Informationen zum Beziehen
    der FreeBSD ``src/`` Repository und `Die Ports-Sammlung
    verwenden <ports-using.html>`__ f?r Details zum Beziehen der FreeBSD
    Ports-Sammlung.

Die Committer-Liste
    Die *Committer* sind diejenigen Leute, welche *schreibenden* Zugriff
    auf den Subversion-Baum besitzen und berechtigt sind, ?nderungen an
    den FreeBSD-Quellen (der Begriff „Committer“ stammt aus dem
    Versionskontrollbefehl ``commit`` , der dazu verwendet wird,
    ?nderungen in das Repository zu bringen). Die beste M?glichkeit,
    Beitr?ge zur Bewertung der Committer-Liste einzusenden, ist das
    `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__-Kommando.
    Falls etwas an diesem System nicht zu funktionieren scheint, dann
    k?nnen Sie diese ebenso durch eine E-Mail an „FreeBSD committers“
    erreichen.

The FreeBSD core team
    Die *FreeBSD core team* ist mit dem Vorstand vergleichbar, wenn das
    FreeBSD?Projekt ein Unternehmen w?re. Die Hauptaufgabe des Core
    Teams ist es sicherzustellen, dass sich das Projekt als Ganzes in
    einem guten Zustand befindet und sich in die richtige Richtung
    bewegt. Das Einladen von engagierten und verantwortungsvollen
    Entwicklern zu dem Zweck, sich der Gruppe von Committern
    anzuschliessen, ist eine der Funktionen des Core Teams, genauso wie
    neue Mitglieder des Core Teams zu rekrutieren, wenn andere
    ausscheiden. Das aktuelle Core Team wurde aus einer Menge von
    Kandidaten aus dem Kreis der Committer im Juli 2012 gew?hlt. Wahlen
    werden alle zwei Jahre abgehalten.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Wie die meisten Entwickler auch, sind die Mitglieder des Core Teams
    Freiwillige, wenn es um die Entwicklung von FreeBSD geht und
    erhalten keinerlei finanziellen Vorteil aus dem Projekt, deshalb
    sollte „Verpflichtung“ nicht fehlverstanden werden mit „garantierter
    Unterst?tzung“. Die „Vorstands“-Analogie oben ist nicht sehr akkurat
    und kann vielleicht besser damit umschrieben werden, dass diese
    Leute ihr Leben f?r FreeBSD gegen jedwede Vernunft geopfert haben.

    .. raw:: html

       </div>

Aussenstehende Beitragende
    Schliesslich stellt die gr?sste, aber nichtsdestotrotz wichtigste
    Gruppe von Entwicklern die der Benutzer selbst dar, die stetig
    R?ckmeldungen und Fehlerbehebungen liefert. Der haupts?chliche Weg
    mit FreeBSDs nicht-zentralisierter Entwicklung Kontakt zu halten,
    ist, die `FreeBSD technical
    discussions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__
    Mailingliste zu abonnieren, auf der solche Dinge diskutiert werden.
    Lesen Sie dazu `Anhang?C, *Ressourcen im
    Internet* <eresources.html>`__ f?r weitere Informationen ?ber die
    verschiedenen FreeBSD-Mailinglisten.

    *`Liste der
    Beitragenden <../../../../doc/de_DE.ISO8859-1/articles/contributors/article.html>`__*
    ist eine, die lang ist und stetig w?chst, also warum nicht FreeBSD
    beitreten und noch heute etwas zur?ckgeben?

    Code ist nicht die einzige Art, zu dem Projekt etwas beizutragen.
    F?r eine ausf?hrlichere Liste von Dingen die getan werden m?ssen,
    lesen Sie auf der
    `FreeBSD?Projektwebseite <../../../../index.html>`__.

.. raw:: html

   </div>

Zusammenfassend ist unser Entwicklungsmodell als eine lose Menge von
konzentrischen Kreisen organisiert. Das zentralisierte Modell ist mit
der Praktikabilit?t der *Anwender* von FreeBSD entworfen worden, die mit
der einfachen Art einhergeht, eine zentrale Basis f?r den Code zu haben
und keine potentiellen Beitr?ge auszuschliessen! Unser Ansporn ist es,
ein stabiles Betriebssystem mit einer grossen Menge von koh?renten
`Anwendungsprogrammen <ports.html>`__, welches die Benutzer einfach
installieren und verwenden k?nnen - dieses Modell funktioniert darin
sehr gut, dieses Ziel zu erreichen.

Alles was wir von denen verlangen, die uns als FreeBSD-Entwickler
beitreten ist, etwas von der gleichen Hingabe an den Erfolg, die seine
momentanen Gemeinschaft inne hat, zu besitzen.

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

1.3.4. Programme von Drittherstellern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zus?tzlich zur Basisdistribution bietet FreeBSD eine Sammlung von
portierter Software mit tausenden der am meisten nachgefragten Programme
an. Als diese Zeilen geschrieben wurden, gab es ?ber 24,000 Ports! Die
Liste der Ports reicht von HTTP-Servern, zu Spielen, Sprachen, Editoren
und so ziemlich alles, was dazwischen liegt. Die gesamte Port-Sammlung
ist gesch?tzt 500?MB gross. Um einen Port zu ?bersetzen, wechseln Sie
einfach in das Verzeichnis des Programms, das sie installieren m?chten
und geben ``make install`` ein und das System erledigt den Rest. Die
gesamte Originaldistribution f?r jeden Port, den Sie bauen wird
dynamisch heruntergeladen, so dass sie nur gen?gend Plattenplatz zum
bauen des Ports, den sie haben m?chten, zur Verf?gung stellen m?ssen.
Fast jeder Port ist auch als vorkompiliertes„Paket“, das ?ber das
folgende einfache Kommando (``pkg_add``) f?r diejenigen, die keine
kompilierten Port aus den Quellen w?nschen. Weitere Informationen zu
Ports und Paketen finden Sie in `Kapitel?5, *Installieren von
Anwendungen: Pakete und Ports* <ports.html>`__.

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

1.3.5. Zus?tzliche Dokumentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle momentanen FreeBSD Versionen bieten eine Option im Installer
(entweder
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
oder
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__),
um zus?tzliche Dokumentation unter ``/usr/local/share/doc/freebsd``
w?hrend des initialen Systemsetups zu installieren. Dokumentation kann
auch zu einem sp?teren Zeitpunkt ?ber Pakete installiert werden, wie es
`Abschnitt?26.4.6.2, „Verwendung von
Dokumentations-Paketen“ <updating-upgrading-documentation.html#doc-ports-install-package>`__
beschreibt. Sie k?nnen ebenso die lokal installierten Anleitungen mit
jedem HTML-f?higen Browser lesen, indem Sie die folgende URL verwenden:

.. raw:: html

   <div class="variablelist">

Das FreeBSD Handbuch
    ```/usr/local/share/doc/freebsd/handbook/index.html`` <file://localhost/usr/local/share/doc/freebsd/handbook/index.html>`__

Die FreeBSD FAQ
    ```/usr/local/share/doc/freebsd/faq/index.html`` <file://localhost/usr/local/share/doc/freebsd/faq/index.html>`__

.. raw:: html

   </div>

Genauso erhalten Sie auch die Master (und am h?ufigsten aktualisierten)
Kopien von ``http://www.FreeBSD.org/``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------------+------------------------------------------------------------+
| `Zur?ck <nutshell.html>`__?   | `Nach oben <introduction.html>`__   | ?\ `Weiter <install.html>`__                               |
+-------------------------------+-------------------------------------+------------------------------------------------------------+
| 1.2. Willkommen zu FreeBSD?   | `Zum Anfang <index.html>`__         | ?Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren   |
+-------------------------------+-------------------------------------+------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
