===========================
5.3. Beigesteuerte Software
===========================

.. raw:: html

   <div class="navheader">

5.3. Beigesteuerte Software
`Zur?ck <policies-maintainer.html>`__?
Kapitel 5. Vorgaben und Richtlinien f?r das Quelltextverzeichnis
?\ `Weiter <policies-encumbered.html>`__

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

5.3. Beigesteuerte Software
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Poul-Henning Kamp, David O'Brien und Gavin Atkinson.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Teile der FreeBSD-Distribution enthalten Software, die aktiv
au?erhalb des FreeBSD-Projektes gepflegt wird. Aus historischen Gr?nden
nennen wir dies *contributed* Software. Beispiele daf?r sind sendmail,
gcc und patch.

?ber die Jahre wurden verschiedene Methoden genutzt, um solche Software
zu verwalten, und jede hat Vor- wie auch Nachteile. So hat sich kein
eindeutiger Gewinner herauskristallisiert.

Es wurde viel ?ber diesen Umstand diskutiert und eine Methode als die
„offizielle“ vorgestellt, um in Zukunft diese Art der Software zu
importieren. Ferner wird dringend geraten, dass sich existierende,
beigesteuerte Software diesem Modell ann?hert, da es signifikante
Vorteile gegen?ber der alten Methode gibt. Dazu geh?rt auch, dass jeder
einfach Diffs bez?glich der „offiziellen“ Quelltext-Versionen erzeugen
kann (auch ohne direkten Repository-Zugang). Dies wird es deutlich
vereinfachen, ?nderungen an die Hauptentwickler zur?ckflie?en zu lassen.

Letztendlich kommt es jedoch auf die Menschen an, welche die Arbeit
leisten. Wenn die Durchf?hrung dieses Modells bei einem Paket mal nicht
m?glich ist, k?nnen Ausnahmen dieser Regeln nur mit Genehmigung des
Core-Teams und der ?bereinstimmung der anderen Entwickler gew?hrt
werden. Die F?higkeit, dieses Paket auch in Zukunft pflegen zu k?nnen,
ist eine der Schl?sselfragen bei dieser Entscheidung.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Durch einige bedauernswerte Einschr?nkungen des RCS-Dateiformats und die
Handhabung von Herstellerzweigen ist von unwesentlichen, trivialen
und/oder kosmetischen ?nderungen an Dateien *dringend abzuraten*, die
dem Herstellerzweig folgen. „Grammatikalische oder sprachliche
Fehlerbehebungen“ sind explizit unter der „Kosmetik“-Kategorie
einzuordnen und sollten vermieden werden. Das Repository kann sich durch
?nderungen einzelner Zeichen dramatisch aufbl?hen.

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

5.3.1. Herstellerimports mit CVS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das file-Werkzeug soll als Beispiel dienen, wie dieses Modell
funktioniert:

``src/contrib/file`` enth?lt den Quelltext so, wie vom Maintainer dieses
Pakets bereitgestellt. Teile, die unter FreeBSD g?nzlich unnutzbar sind,
k?nnen entfernt werden. Im Fall von
`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1>`__
wurde u.a. das Unterverzeichnis ``python`` und Dateien mit dem Pr?fix
``lt`` vor dem Import entfernt.

``src/lib/libmagic`` enth?lt ein ``Makefile`` im bmake-Stil, das die
Regeln des Standard-Makefiles ``bsd.lib.mk`` nutzt, um die Bibliothek zu
erstellen und die Dokumentation zu installieren.

``src/usr.bin/file`` enth?lt ein ``Makefile`` im bmake-Stil, welches das
``file``-Programm erstellt und installiert, ebenso die dazugeh?rigen
Manualpages, welche die Regeln von ``bsd.prog.mk`` nutzen.

Das Entscheidende ist hier das ``src/contrib/file``-Verzeichnis, welches
nach den folgenden Regeln erstellt wird: Es muss den Quelltext aus dem
Original enthalten (ohne RCS-Schl?sselworte und im korrekten
Herstellerzweig) mit so wenig FreeBSD-spezifischen ?nderungen wie
m?glich. Sollte es Zweifel geben, wie hier zu verfahren ist, unbedingt
zuerst nachfragen und nicht auf gut Gl?ck etwas probieren in der vagen
Hoffnung, dass es „irgendwie funktioniert“.

Aufgrund der eingangs schon erw?hnten Einschr?nkungen bei
Herstellerzweigen ist es erforderlich, dass „offizielle“
Fehlerbehebungen vom Hersteller in die Originalquellen der Distribution
einflie?en und als Resultat wieder in den Herstellerzweig importiert
werden. Offizielle Fehlerbehebungen sollten nie direkt in FreeBSD
eingepflegt und „committet“ werden, da dies den Herstellerzweig
zerst?ren w?rde und der Import von zuk?nftigen Versionen w?re um ein
Vielfaches schwerer, da es zu Konflikten kommen w?rde.

Da einige Pakete Dateien enthalten, die zur Kompatibilit?t mit anderen
Architekturen und Umgebungen als FreeBSD gedacht sind, ist es zul?ssig,
diese Teile zu l?schen, wenn sie f?r FreeBSD nicht von Interesse sind,
und so Speicherplatz zu sparen. Dateien, die ein Copyright und
Release-artige Informationen zu den vorhandenen Dateien enthalten,
sollten *nicht* gel?scht werden.

Falls es einfacher erscheint, k?nnen die ``bmake``-``Makefile``\ s vom
Verzeichnisbaum durch einige Dienstprogramme automatisch erstellt
werden, was es hoffentlich sogar noch einfacher macht, eine Version zu
aktualisieren. Ist dies geschehen, so stellen Sie bitte sicher, diese
Werkzeuge in das Verzeichnis ``src/tools`` gleich mit dem Port an sich
einzuchecken, sodass es f?r zuk?nftige Maintainer verf?gbar ist.

Im Verzeichnis ``src/contrib/file`` sollte eine Datei mit dem Namen
``FREEBSD-upgrade`` hinzugef?gt werden und sie sollte den Stand wie
folgt anzeigen:

.. raw:: html

   <div class="itemizedlist">

-  Welche Dateien ausgelassen wurden.

-  Von wo die Original-Distribution stammt und/oder wo die offizielle
   Hauptseite zu finden ist.

-  Wohin Fehlerbehebungen an den Originalautor gesendet werden k?nnen.

-  M?glicherweise eine ?bersicht, welche FreeBSD-spezifischen ?nderungen
   vorgenommen wurden.

.. raw:: html

   </div>

Ein Beispielinhalt von ``src/contrib/groff/FREEBSD-upgrade`` ist hier
aufgelistet:

.. code:: programlisting

    $FreeBSD: src/contrib/groff/FREEBSD-upgrade,v 1.5.12.1 2005/11/15 22:06:18 ru Exp $

    This directory contains virgin sources of the original distribution files
    on a "vendor" branch.  Do not, under any circumstances, attempt to upgrade
    the files in this directory via patches and a cvs commit.

    To upgrade to a newer version of groff, when it is available:
            1. Unpack the new version into an empty directory.
               [Do not make ANY changes to the files.]

            2. Use the command:
                    cvs import -m 'Virgin import of FSF groff v<version>' \
                            src/contrib/groff FSF v<version>

               For example, to do the import of version 1.19.2, I typed:
                    cvs import -m 'Virgin import of FSF groff v1.19.2' \
                            src/contrib/groff FSF v1_19_2

            3. Follow the instructions printed out in step 2 to resolve any
               conflicts between local FreeBSD changes and the newer version.

    Do not, under any circumstances, deviate from this procedure.

    To make local changes to groff, simply patch and commit to the main
    branch (aka HEAD).  Never make local changes on the FSF branch.

    All local changes should be submitted to Werner Lemberg <wl@gnu.org> or
    Ted Harding <ted.harding@nessie.mcc.ac.uk> for inclusion in the next
    vendor release.

    ru@FreeBSD.org - 20 October 2005

Eine weitere M?glichkeit ist es, eine Liste von Dateien, die nicht
enthalten sein sollen zu pflegen, was besonders dann sehr hilfreich sein
kann, wenn die Liste ziemlich gross oder kompliziert ist bzw. Imports
sehr h?ufig stattfinden. Durch erstellen einer Datei namens
``FREEBSD-Xlist`` im gleichen Verzeichnis, in welches das
Herstellerverzeichnis importiert werden soll, die eine Liste von
auszuschliessenden Dateinamen-Mustern pro Zeile enth?lt, k?nnen
zuk?nftige Imports folgendermassen durchgef?hrt werden:

.. code:: screen

    % tar -X FREEBSD-Xlist -xzf vendor-source.tgz

Als Beispiel einer ``FREEBSD-Xlist``-Datei wird hier diejenige von
``src/contrib/tcsh`` gezeigt:

.. code:: programlisting

    */BUGS
    */config/a*
    */config/bs2000
    */config/bsd
    */config/bsdreno
    */config/[c-z]*
    */tests
    */win32

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bitte importieren Sie weder ``FREEBSD-upgrade`` noch ``FREEBSD-Xlist``
mit den beigesteuerten Quellen. Stattdessen sollten Sie diese Dateien
nach dem initialen Import hinzuf?gen.

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

5.3.2. Herstellerimports mit SVN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Dag-Erling Sm?rgrav.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt die Prozedur f?r Herstellerimports mit
Subversion im Detail.

.. raw:: html

   <div class="procedure">

#. **Vorbereiten des Quellbaums**

   Wenn dies Ihr erster Import nach dem Wechsel zu SVN ist, sollen Sie
   den Herstellerbaum aufr?umen, verflachen und die Merge-Historie in
   den Hauptzweig vorbereiten. Falls das nicht Ihr erster Import ist,
   k?nnen Sie diesen Schritt ohne Probleme ?berspringen.

   W?hrend der Konvertierung von CVS zu SVN wurden Herstellerzweige mit
   der gleichen Struktur wie der Hauptzweig importiert. Beispielsweise
   wurden die foo Herstellerquellen in ``vendor/foo/dist/contrib/foo``
   abgelegt, jedoch ist dies unpraktisch und zwecklos. Was wir wirklich
   wollen, ist dass die Herstellerquellen direkt in ``vendor/foo/dist``
   liegen, beispielsweise so:

   .. code:: screen

       % cd vendor/foo/dist/contrib/foo
       % svn move $(svn list) ../..
       % cd ../..
       % svn remove contrib
       % svn propdel -R svn:mergeinfo
       % svn commit

   Beachten Sie, dass das ``propdel``-Bit notwendig ist, da mit
   Subversion 1.5 automatisch ``svn:mergeinfo`` zu jedem Verzeichnis
   hinzugef?gt wird, das Sie kopieren oder verschieben. In diesem Fall
   brauchen Sie diese Informationen nicht, da Sie nichts in den Zweig
   mergen werden, den Sie gel?scht haben.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Sie werden wahrscheinlich die Tags genauso verflachen wollen. Die
   Prozedur daf?r ist die selbe. Wenn Sie dies tun, sollten Sie den
   Commit bis zum Schluss aufschieben.

   .. raw:: html

      </div>

   Pr?fen Sie den ``dist``-Baum und f?hren Sie alle n?tigen
   Aufr?umarbeiten durch, die Sie f?r sinnvoll erachten. Sie werden
   m?glicherweise die Erweiterung von Schl?sselw?rtern deaktivieren
   wollen, da dies auf unmodifizierten Quellen keinen Sinn ergibt. In
   machen F?llen kann dies sogar sch?dlich sein.

   .. code:: screen

       % svn propdel svn:keywords -R .
       % svn commit

   Bootstrappen der ``svn:mergeinfo`` auf dem Zielverzeichnis (des
   Hauptzweiges) auf die Revision die mit der letzten ?nderung, die im
   Herstellerzweig vor dem Import der neuen Quellen durchgef?hrt wurde,
   korrespondiert, wird ebenso ben?tigt:

   .. code:: screen

       % cd head/contrib/foo
       % svn merge --record-only svn_base/vendor/foo/dist@12345678 .
       % svn commit

   Dabei entspricht *``svn_base``* dem Basisverzeichnis Ihres
   SVN-Repositories, z.B. ``svn+ssh://svn.FreeBSD.org/base``.

#. **Neue Quellen importieren**

   Bereiten Sie einen kompletten, sauberen Baum mit Herstellerquellen
   vor. Mit SVN k?nnen wir eine komplette Distribution in dem
   Herstellerzweig aufbewahren, ohne den Hauptzweig aufzubl?hen.
   Importieren Sie alles, aber mergen Sie nur das, was wirklich ben?tigt
   wird.

   Beachten Sie, dass Sie alle Dateien, die seit dem letzten
   Herstellerimport hinzugef?gt wurden, auch einbeziehen und diejenigen,
   welche entfernt wurden, auch l?schen m?ssen. Um dies zu
   bewerkstelligen, sollten Sie sortierte Listen der Bestandteile des
   Herstellerbaums und von den Quellen, Sie die vorhaben zu importieren,
   vorbereiten:

   .. code:: screen

       % cd vendor/foo/dist
       % svn list -R | grep -v '/$' | sort > ../old
       % cd ../foo-9.9
       % find . -type f | cut -c 3- | sort > ../new

   Mit diesen beiden Dateien, wird Ihnen das folgende Kommando alle
   Dateien auflisten, die entfernt wurden (nur die Dateien in ``old``):

   .. code:: screen

       % comm -23 ../old ../new

   Der folgende Befehl wird die hinzugef?gten Dateien auflisten (nur
   diejenigen Dateien in ``new``):

   .. code:: screen

       % comm -13 ../old ../new

   Wir f?hren dies nun zusammen:

   .. code:: screen

       % cd vendor/foo/foo-9.9
       % tar cf - . | tar xf - -C ../dist
       % cd ../dist
       % comm -23 ../old ../new | xargs svn remove
       % comm -13 ../old ../new | xargs svn add

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Wenn in der neuen Version neue Verzeichnisse hinzugekommen sind, wird
   dieser letzte Befehl fehlschlagen. Sie m?ssen diese Verzeichnisse
   hinzuf?gen und anschliessend den Befehl erneut ausf?hren. Genauso
   m?ssen Sie Verzeichnisse, die entfernt wurden, h?ndisch l?schen.

   .. raw:: html

      </div>

   Pr?fen Sie die Eigenschaften jeder neuen Datei:

   .. raw:: html

      <div class="itemizedlist">

   -  Alle Textdateien sollten ``svn:eol-style`` auf den Wert ``native``
      gesetzt haben.

   -  Alle Bin?rdateien sollten ``svn:mime-type`` auf
      ``application/octet-stream`` gesetzt haben, ausser es existiert
      ein passenderer Medientyp.

   -  Ausf?hrbare Dateien sollten ``svn:executable`` auf ``*`` gesetzt
      haben.

   -  Es sollten keine anderen Eigenschaften auf den Dateien im Baum
      gesetzt sein.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Sie sind bereit, zu committen, jedoch sollten Sie zuerst die Ausgabe
   von ``svn stat`` und ``svn             diff`` ?berpr?fen, um sicher
   zu gehen, dass alles in Ordnung ist.

   .. raw:: html

      </div>

   Sobald Sie den die neue Release-Version des Herstellers committed
   haben, sollten Sie Ihn f?r zuk?nftige Referenzen taggen. Die beste
   und schnellste Methode ist, dies direkt im Repository zu tun:

   .. code:: screen

       % svn copy svn_base/vendor/foo/dist svn_base/vendor/foo/9.9

   Um den neuen Tag zu bekommen, brauchen Sie nur ihre Arbeitskopie von
   ``vendor/foo`` zu aktualisieren.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Wenn Sie lieber die Kopie in der ausgecheckten Kopie durchf?hren
   wollen, vergessen Sie nicht, die generierte ``svn:mergeinfo`` wie
   oben beschrieben zu entfernen.

   .. raw:: html

      </div>

#. **Mit *-HEAD* mergen**

   Nachdem Sie Ihren Import vorbereitet haben, wird es Zeit zu mergen.
   Die Option ``--accept=postpone`` weist SVN an, noch keine
   merge-Konflikte aufzul?sen, weil wir uns um diese manuell k?mmern
   werden:

   .. code:: screen

       % cd head/contrib/foo
       % svn update
       % svn merge --accept=postpone svn_base/vendor/foo/dist

   L?sen Sie die Konflikte und stellen Sie sicher, dass alle Dateien,
   die im Herstellerzweig hinzugef?gt oder entfernt wurden, auch sauber
   im Hauptzweig hinzugef?gt bzw. gel?scht wurden. Es ist immer ratsam,
   diese Unterschiede gegen den Herstellerbaum zu pr?fen:

   .. code:: screen

       % svn diff --no-diff-deleted --old=svn_base/vendor/foo/dist --new=.

   Die Option ``--no-diff-deleted`` weist SVN an, keine Dateien zu
   pr?fen, die sich zwar im Herstellerbaum, aber nicht im Hauptzweig
   befinden.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Bei SVN gibt es das Konzept von innerhalb und ausserhalb des
   Herstellerbaums nicht. Wenn eine Datei, die zuvor eine lokale
   ?nderung hatte, aber nun keine mehr besitzt, entfernen Sie einfach
   das was ?brig ist, wie FreeBSD Versionstags, damit diese nicht l?nger
   in den diffs gegen den Herstellerbaum erscheinen.

   .. raw:: html

      </div>

   Wenn irgendwelche ?nderungen notwendig sind, um die Welt mit den
   neuen Quellen zu bauen, machen Sie diese jetzt und testen Sie diese
   bis Sie sicher sind, dass alles korrekt gebaut wird und richtig
   funktionert.

#. **Commit**

   Nun sind Sie bereit f?r den Commit. Stellen Sie sicher, dass Sie
   alles in einem einzigen Schritt durchf?hren. Idealerweise sollten Sie
   alle diese Schritte in einem sauberen Baum durchgef?hrt haben. Falls
   dies der Fall ist, k?nnen Sie einfach aus dem obersten Verzeichnis
   dieses Baums committen. Dies ist der beste Weg, um ?berraschungen zu
   vermeiden. Wenn Sie dies korrekt durchf?hren, wird der Baum atomar
   von einem konsistenten Zustand mit dem alten Code in einen neuen
   konsistenten Zustand mit dem neuen Code ?berf?hrt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+--------------------------------------------+
| `Zur?ck <policies-maintainer.html>`__?   | `Nach oben <policies.html>`__   | ?\ `Weiter <policies-encumbered.html>`__   |
+------------------------------------------+---------------------------------+--------------------------------------------+
| 5.2. ``MAINTAINER`` eines Makefiles?     | `Zum Anfang <index.html>`__     | ?5.4. Belastende Dateien                   |
+------------------------------------------+---------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
