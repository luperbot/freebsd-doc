==================================================================
26.3. Portsnap: Ein Werkzeug zur Aktualisierung der Ports-Sammlung
==================================================================

.. raw:: html

   <div class="navheader">

26.3. Portsnap: Ein Werkzeug zur Aktualisierung der Ports-Sammlung
`Zur?ck <updating-upgrading-freebsdupdate.html>`__?
Kapitel 26. FreeBSD aktualisieren
?\ `Weiter <updating-upgrading-documentation.html>`__

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

26.3. Portsnap: Ein Werkzeug zur Aktualisierung der Ports-Sammlung
------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Basierend auf bereitgestellten Mitschriften von Colin Percival.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Basissystem von FreeBSD enth?lt auch ein Programm zum Aktualisieren
der Ports-Sammlung: das
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
Werkzeug. Wenn es ausgef?hrt wird, verbindet es sich mit einem
entfernten Rechner, ?berpr?ft den Sicherungsschl?ssel und l?dt eine neue
Kopie der Ports-Sammlung herunter. Der Schl?ssel wird dazu verwendet, um
die Integrit?t aller heruntergeladenen Dateien zu pr?fen und um
sicherzustellen, dass diese unterwegs nicht ver?ndert wurden. Um die
aktuellsten Dateien der Ports-Sammlung herunter zu laden, geben Sie das
folgende Kommando ein:

.. code:: screen

    # portsnap fetch
    Looking up portsnap.FreeBSD.org mirrors... 9 mirrors found.
    Fetching snapshot tag from geodns-1.portsnap.freebsd.org... done.
    Fetching snapshot metadata... done.
    Updating from Tue May 22 02:12:15 CEST 2012 to Wed May 23 16:28:31 CEST 2012.
    Fetching 3 metadata patches.. done.
    Applying metadata patches... done.
    Fetching 3 metadata files... done.
    Fetching 90 patches.....10....20....30....40....50....60....70....80....90. done.
    Applying patches... done.
    Fetching 133 new ports or files... done.

Dieses Beispiel zeigt, dass
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
mehrere Korrekturen f?r die aktuellen Ports-Daten gefunden und
verifiziert hat. Es zeigt auch, dass das Programm zuvor schon einmal
gestartet wurde. W?re es das erste Mal, w?rde nur die Ports-Sammlung
heruntergeladen werden.

Wenn
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
erfolgreich die ``fetch``-Operation abgeschlossen hat, befinden sich die
Ports-Sammlung und die dazugeh?rigen Korrekturen auf dem lokalen System,
welches die ?berpr?fung bestanden hat. Wenn Sie ``portsnap`` das erste
Mal ausgef?hrt haben, m?ssen Sie den Befehl ``portsnap extract``
verwenden, um die Ports-Sammlung zu installieren:

.. code:: screen

    # portsnap extract
    /usr/ports/.cvsignore
    /usr/ports/CHANGES
    /usr/ports/COPYRIGHT
    /usr/ports/GIDs
    /usr/ports/KNOBS
    /usr/ports/LEGAL
    /usr/ports/MOVED
    /usr/ports/Makefile
    /usr/ports/Mk/bsd.apache.mk
    /usr/ports/Mk/bsd.autotools.mk
    /usr/ports/Mk/bsd.cmake.mk
    ...

Um Ihre bereits installierte Ports-Sammlung zu aktualisieren, verwenden
Sie hingegen den Parameter ``update``:

.. code:: screen

    # portsnap update

Der Prozess ist jetzt abgeschlossen und Anwendungen k?nnen mittels der
aktuellen Ports-Sammlung installiert oder aktualisiert werden.

Die Operationen ``fetch`` und ``extract`` oder ``update`` k?nnen auch
nacheinander ausgef?hrt werden, wie im folgenden Beispiel gezeigt:

.. code:: screen

    # portsnap fetch update

Dieser Befehl l?dt die aktuelle Version der Ports-Sammlung herunter und
aktualisiert anschlie?end Ihre lokale Version im Verzeichnis
``/usr/ports``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+-------------------------------------------+---------------------------------------------------------+
| `Zur?ck <updating-upgrading-freebsdupdate.html>`__?   | `Nach oben <updating-upgrading.html>`__   | ?\ `Weiter <updating-upgrading-documentation.html>`__   |
+-------------------------------------------------------+-------------------------------------------+---------------------------------------------------------+
| 26.2. FreeBSD-Update?                                 | `Zum Anfang <index.html>`__               | ?26.4. Aktualisieren der Dokumentationssammlung         |
+-------------------------------------------------------+-------------------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
