==================================================
Kapitel 10. Einen existierenden Port aktualisieren
==================================================

.. raw:: html

   <div class="navheader">

Kapitel 10. Einen existierenden Port aktualisieren
`Zur?ck <testing-tinderbox.html>`__?
?
?\ `Weiter <moved-and-updating-files.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`10.1. Patches mit CVS erstellen <port-upgrading.html#cvs-diff>`__
`10.2. Die Dateien UPDATING und MOVED <moved-and-updating-files.html>`__

.. raw:: html

   </div>

Wenn Sie feststellen, dass ein Port verglichen mit der neuesten Version
des Originalautors nicht mehr auf dem aktuellen Stand ist, sollten Sie
als Erstes sicherstellen, dass Sie die aktuellste Version des Ports
haben. Diese finden Sie im Verzeichnis ``ports/ports-current`` der
FreeBSD FTP-Spiegelseiten. Wenn Sie allerdings mit mehr als ein paar
Ports arbeiten, werden Sie es wahrscheinlich einfacher finden CVSup zu
benutzen, um Ihre gesamte Ports-Sammlung aktuell zu halten, wie es im
`Handbuch <../../../../doc/de_DE.ISO8859-1/books/handbook/synching.html#CVSUP-CONFIG>`__
beschrieben wird. Das hat zus?tzlich den Vorteil, dass Sie so auch alle
Abh?ngigkeiten des Ports aktuell halten.

Der n?chste Schritt besteht darin festzustellen, ob bereits eine
Aktualisierung des Ports darauf wartet committet zu werden. Um das
sicherzustellen haben Sie folgende M?glichkeiten. Es gibt eine
durchsuchbare Schnittstelle zur `FreeBSD Problembericht Datenbank (PR -
Problem
Report) <http://www.FreeBSD.org/cgi/query-pr-summary.cgi?query>`__ (auch
bekannt als ``GNATS``). W?hlen Sie dazu ``Ports`` im Drop-Down-Men? und
geben Sie den Namen des Ports ein.

Allerdings wird manchmal vergessen den Namen des Ports eindeutig im Feld
f?r die Zusammenfassung anzugeben. In diesem Fall k?nnen Sie das
`FreeBSD Ports Monitoring System <portsmon.html>`__ (auch bekannt als
``portsmon``) nutzen. Dieses versucht PRs von Ports nach Portname zu
sortieren. Um PRs nach einem bestimmten Port zu durchsuchen k?nnen Sie
die `?bersicht eines
Ports <http://portsmon.FreeBSD.org/portoverview.py>`__ verwenden.

Wenn es keine wartenden PRs gibt, ist der n?chste Schritt eine E-Mail an
den Maintainer des Ports zu schicken, wie von ``make maintainer``
gezeigt wird. Diese Person arbeitet vielleicht schon an einer
Aktualisierung, oder hat einen guten Grund den Port im Moment nicht zu
aktualisieren (z.B. wegen Stabilit?tsproblemen der neuen Version). Sie
wollen sicher nicht die Arbeit des Maintainers doppelt machen. Beachten
Sie bitte, dass f?r Ports ohne Maintainer ``ports@FreeBSD.org``
eingetragen ist. Das ist nur die allgemeine `FreeBSD
ports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__-Mailingliste,
deshalb wird es in diesem Fall wahrscheinlich nicht helfen eine E-Mail
dorthin zu schicken.

Wenn Sie der Maintainer bittet die Aktualisierung zu erledigen, oder
falls es keinen Maintainer gibt, haben Sie Gelegenheit, FreeBSD zu
helfen, indem Sie die Aktualisierung selbst bereitstellen. Dazu
verwenden Sie
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__,
das bereits im Basissystem enthalten ist.

Um einen brauchbaren ``diff`` f?r einen einzelne Datei zu erstellen,
kopieren Sie die zu patchende Datei nach *``dateiname.orig``* und
speichern Ihre ?nderungen in die Datei *``dateiname``*. Danach erzeugen
Sie den Patch:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % /usr/bin/diff dateiname.orig dateiname > dateiname.diff

.. raw:: html

   </div>

Soll mehr als eine Datei gepatcht werden, k?nnen Sie entweder
``cvs diff`` verwenden (siehe dazu `Abschnitt?10.1, „Patches mit CVS
erstellen“ <port-upgrading.html#cvs-diff>`__) oder Sie kopieren den
kompletten Port in ein neues Verzeichnis und speichern die Ausgabe des
rekursiven
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
auf das neue und alte Portverzeichniss (wenn Ihr ver?ndertes
Portverzeichnis z.B. ``superedit`` und das Original ``superedit.bak``
hei?t, dann speichern Sie bitte die Ergebnisse von
``diff -ruN superedit.bak       superedit``). Sowohl vereinheitlichendes
als auch kontextabh?ngiges diff (Auflistung der Unterschiede zweier
Dateien) sind akzeptabel, aber im Allgemeinen bevorzugen Port-Committer
vereinheitlichende ``diff``\ s. Bitte beachten Sie die Verwendung der
``-N``-Option. Dies ist der gebr?uchliche Weg ``diff`` dazu zu bewegen
korrekt damit umzugehen, neue Dateien anzulegen und alte zu l?schen.
Bevor Sie das diff einsenden ?berpr?fen Sie bitte die Ausgabe, um
sicherzugehen, dass die ?nderungen sinnvoll sind. Stellen Sie
insbesondere sicher, dass Sie das Arbeitsverzeichnis mit ``make clean``
aufger?t haben).

Um g?ngige Operationen mit Korrekturdateien zu vereinfachen, k?nnen Sie
``/usr/ports/Tools/scripts/patchtool.py`` benutzen. Aber lesen Sie bitte
vorher ``/usr/ports/Tools/scripts/README.patchtool``.

Falls der Port keinen Maintainer hat und Sie ihn selbst aktiv benutzen,
ziehen Sie bitte in Erw?gung sich als Maintainer zu melden. FreeBSD hat
mehr als 4000 Ports ohne Maintainer und in diesem Bereich werden immer
zus?tzliche Freiwillige ben?tigt (F?r eine ausf?hrliche Beschreibung der
Verantwortlichkeiten eines Maintainers lesen Sie bitte im `Developer's
Handbook <../../../../doc/de_DE.ISO8859-1/books/developers-handbook/policies.html#POLICIES-MAINTAINER>`__
nach).

Der beste Weg uns das diff zu schicken ist mittels
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
(Kategorie Ports). Wenn Sie der Maintainer des Ports sind, f?gen Sie
bitte ``[maintainer       update]`` an den Anfang Ihrer Zusammenfassung
und setzen Sie die „Klasse“ des PR auf ``maintainer-update``. Ansonsten
sollte die „Klasse“ des PR ``change-request`` sein. Bitte erw?hnen Sie
alle hinzugef?gten oder gel?schten Dateien in der Nachricht, da diese
beim Commit ausdr?cklich an
`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1>`__
?bergeben werden m?ssen. Wenn das diff gr??er ist als 20 Kilobyte
komprimieren und uuencoden Sie es bitte. Ansonsten k?nnen Sie es in den
PR einf?gen wie es ist.

Bevor Sie den PR mit
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
abschicken, sollten Sie den Abschnitt `Den Problembericht
schreiben <../../../../doc/de_DE.ISO8859-1/articles/problem-reports/pr-writing.html>`__
im Artikel ?ber Problemberichte lesen. Dieser enth?lt sehr viel mehr
Informationen dar?ber, wie man n?tzliche Problemberichte verfasst.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Wenn Sie Ihre Aktualisierung aufgrund von Sicherheitsbedenken oder eines
schwerwiegenden Fehlers bereitstellen wollen, informieren Sie bitte das
Ports Management Team ``<portmgr@FreeBSD.org>``, um einen sofortigen
Rebuild und eine Neuverteilung des Pakets Ihres Ports durchzuf?hren.
Sonst werden ahnungslose Nutzer von
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
?ber mehrere Wochen die alte Version durch ``pkg_add -r`` installieren.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Noch einmal: Bitte verwenden Sie
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
und nicht
`shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__,
um Aktualisierungen existierender Ports zu senden. Sie erleichtern es
damit den Ports-Committern, Ihre ?nderungen nachzuvollziehen.

.. raw:: html

   </div>

Nun, da Sie all das geschafft haben, k?nnen Sie in `Kapitel?14, *Auf dem
Laufenden bleiben* <keeping-up.html>`__ nachlesen, wie Sie den Port
aktuell halten.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.1. Patches mit CVS erstellen
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn m?glich, sollten Sie stets eine
`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1>`__-Differenz
einreichen. Diese sind leichter zu bearbeiten als Differenzen zwischen
„neuen und alten“ Verzeichnissen. Au?erdem k?nenn Sie so einfacher
feststellen, welche ?nderungen Sie vorgenommen haben oder Ihren Patch
modifizieren, falls dies durch ?nderungen in einem anderen Bereich der
Ports-Sammlung notwendig wird oder Sie vom Committer um eine Korrektur
Ihres Patches gebeten werden.

.. code:: screen

    % cd ~/my_wrkdir 
    % cvs -d R_CVSROOT co pdnsd  
    % cd ~/my_wrkdir/pdnsd

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#my-wrkdir>`__                 | Das Verzeichnis, in dem Sie den Port |
|                                      | bauen wollen. Dieses                 |
|                                      | Arbeitsverzeichnis kann sich auch    |
|                                      | au?erhalb von ``/usr/ports/``        |
|                                      | befinden.                            |
+--------------------------------------+--------------------------------------+
| `|2| <#R-CVSROOT>`__                 | R\_CVSROOT steht f?r einen           |
|                                      | ?ffentlichen CVS-Server. Eine Liste  |
|                                      | aller verf?gbaren Server finden Sie  |
|                                      | im `FreeBSD                          |
|                                      | Handbuch <../../../../doc/de_DE.ISO8 |
|                                      | 859-1/books/handbook/cvsup.html>`__. |
+--------------------------------------+--------------------------------------+
| `|3| <#module-name>`__               | Ersetzen Sie „pdnsd“ durch den       |
|                                      | Modulnamen des Ports. Dieser         |
|                                      | entspricht in der Regel dem Namen    |
|                                      | des Ports. Allerdings gibt es einige |
|                                      | Ausnahmen von dieser Regel,          |
|                                      | insbesondere bei sprachspezifischen  |
|                                      | Ports (beispielsweise lautet der     |
|                                      | Modulname f?r den Port               |
|                                      | `german/selfhtml <http://www.freebsd |
|                                      | .org/cgi/url.cgi?ports/german/selfht |
|                                      | ml/pkg-descr>`__                     |
|                                      | de-selfhtml). Um den Namen des       |
|                                      | Moduls herauszufinden, k?nnen Sie    |
|                                      | entweder die                         |
|                                      | `cvsweb-Schnittstelle <../../../../c |
|                                      | gi/cvsweb.cgi/ports>`__              |
|                                      | verwenden oder den kompletten Pfad   |
|                                      | des Ports angeben (in unserem        |
|                                      | Beispiel w?re der komplette Pfad     |
|                                      | also ``ports/dns/pdnsd``).           |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Danach modifizieren Sie den Port in gewohnter Weise. Falls Sie Dateien
hinzuf?gen oder entfernen, sollten Sie dies mit ``cvs`` protokollieren:

.. code:: screen

    % cvs add new_file
    % cvs remove deleted_file

?berpr?fen Sie die Funktion Ihres Ports anhand der Checklisten in
`Abschnitt?3.4, „Den Port testen“ <porting-testing.html>`__ und
`Abschnitt?3.5, „Ihren Port mit ``portlint``
?berpr?fen“ <porting-portlint.html>`__.

.. code:: screen

    % cvs status
    % cvs update 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#cvs-update>`__                | Dadurch wird versucht, die Differenz |
|                                      | zwischen Ihrer ge?nderten Version    |
|                                      | und dem aktuellen Stand im CVS zu    |
|                                      | kombinieren. Achten Sie dabei        |
|                                      | unbedingt auf die Ausgabe dieses     |
|                                      | Befehls. Vor jeder Datei wird ein    |
|                                      | Buchstabe angezeigt, der Ihnen       |
|                                      | mitteilt, was mit dieser Datei       |
|                                      | passiert ist. Eine vollst?ndige      |
|                                      | Liste dieser Pr?fixe finden Sie in   |
|                                      | `Tabelle?10.1, „Von cvs update       |
|                                      | verwendete                           |
|                                      | Pr?fixe“ <port-upgrading.html#table- |
|                                      | cvs-up>`__.                          |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 10.1. Von cvs update verwendete Pr?fixe

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| U   | Die Datei wurde aktualisiert. Es traten dabei keine Probleme auf.                                                                        |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| P   | Die Datei wurde ohne Probleme aktualisiert (dieses Pr?fix wird nur verwendet, wenn Sie mit einem entfernten Repository arbeiten).        |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| M   | Die Datei wurde modifiziert. Es traten keine Konflikte auf.                                                                              |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| C   | Die Datei wurde modifiziert, allerdings kam es dabei zu Konflikten zwischen Ihrer ge?nderten Version und der aktuellen Version im CVS.   |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Wird das Pr?fix ``C`` nach einem ``cvs update`` angezeigt, bedeutet
dies, dass im CVS etwas ge?ndert wurde und
`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1>`__
daher nicht in der Lage war, Ihre ?nderungen und die ?nderungen im CVS
zu kombinieren. Es ist immer sinnvoll, sich die ?nderungen anzusehen, da
``cvs`` keine Informationen dar?ber hat, wie ein Port aufgebaut sein
soll. Es kann (und wird wahrscheinlich) daher vorkommen, dass sich
manchmal ?nderungen ergeben, die keinen Sinn machen.

Im letzten Schritt erzeugen Sie einen „unified
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__“
gegen die derzeit im CVS vorhandenen Dateien:

.. code:: screen

    % cvs diff -uN > ../`basename ${PWD}`.diff

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Verwenden Sie unbedingt die Option ``-N``, um sicherzustellen, dass von
hinzugef?gte oder gel?schte Dateien im Patch erfasst sind. Der Patch
enth?t auch von Ihnen gel?schte Dateien (allerdings ohne Inhalt). Dies
ist wichtig, da nur so der Committer wissen kann, welche Dateien er
entfernen muss.

.. raw:: html

   </div>

Zuletzt reichen Sie Ihren Patch ein, indem Sie der Anleitung in
`Kapitel?10, *Einen existierenden Port
aktualisieren* <port-upgrading.html>`__ folgen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-------------------------------------------------+
| `Zur?ck <testing-tinderbox.html>`__?   | ?                             | ?\ `Weiter <moved-and-updating-files.html>`__   |
+----------------------------------------+-------------------------------+-------------------------------------------------+
| 9.5. Die Tinderbox?                    | `Zum Anfang <index.html>`__   | ?10.2. Die Dateien UPDATING und MOVED           |
+----------------------------------------+-------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
