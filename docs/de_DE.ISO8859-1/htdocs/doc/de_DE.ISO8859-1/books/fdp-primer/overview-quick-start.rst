=================
1.2. Schnellstart
=================

.. raw:: html

   <div class="navheader">

1.2. Schnellstart
`Zur?ck <overview.html>`__?
Kapitel 1. ?berblick
?\ `Weiter <tools.html>`__

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

1.2. Schnellstart
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, was Sie tun m?ssen, bevor Sie ?nderungen an
der FreeBSD-Dokumentation vornehmen k?nnen. Abonnieren Sie zuerst die
Mailingliste `FreeBSD documentation
project <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.
Einige Mitglieder dieser Mailingliste sind auch auf dem IRC-Kanal
``#bsddocs`` auf `EFnet <http://www.efnet.org/>`__ erreichbar. Nehmen
Sie mit Ihnen Kontakt auf, wenn Sie Fragen oder Probleme bei der Arbeit
an der FreeBSD-Dokumentation haben.

.. raw:: html

   <div class="procedure">

#. Installieren Sie den Metaport
   `textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
   als Port oder Paket, um automatisch alle f?r die Arbeit an der
   Dokumentation ben?tigten Werkzeuge zu installieren.

#. Installieren Sie eine lokale Arbeitskopie der Dokumentation von einem
   Spiegelserver des FreeBSD-Repository nach ``~/doc`` (lesen Sie dazu
   auch `Kapitel?3, *Die Arbeitskopie* <working-copy.html>`__).

   .. code:: screen

       % svn checkout https://svn0.us-west.FreeBSD.org/doc/head ~/doc

#. Ihr Texteditor sollte f?r die Arbeit an der FreeBSD-Dokumentation wie
   folgt konfiguriert sein:

   .. raw:: html

      <div class="itemizedlist">

   -  Zeilenumbruch nach 70 Zeichen.

   -  Tabstop auf 2 Zeichen.

   -  8 Leerzeichen sollen durch einen Tabstop ersetzt werden.

   .. raw:: html

      </div>

   Konfigurationen f?r einige h?ufig verwendete Editoren finden Sie im
   `Kapitel?12, *Der Schreibstil* <writing-style.html>`__.

#. Aktualisieren Sie Ihre lokale Arbeitskopie:

   .. code:: screen

       % svn up ~/doc

#. Bearbeiten Sie die Datei. Bevor Sie umfangreiche ?nderungen an einer
   Datei vornehmen, k?ndigen Sie die geplanten ?nderungen bitte auf der
   Mailingliste an.

   Eine Auflistung h?ufig verwendeter Tags und Entities finden Sie in
   `Kapitel?8, *XHMTL Markup (noch nicht
   ?bersetzt)* <xhtml-markup.html>`__ und in `Kapitel?9, *DocBook Markup
   (noch nicht ?bersetzt)* <docbook-markup.html>`__.

#. Nachdem Sie Ihre ?nderungen vorgenommen haben, pr?fen Sie diese auf
   potentielle Probleme:

   .. code:: screen

       % igor -R filename.xml | less -RS

   Werden Fehler gemeldet, editieren Sie die Datei erneut. Speichern Sie
   das Ergebnis und f?hen Sie den Test erneut aus. Wiederholen Sie dies
   solange, bis keine Fehler mehr gemeldet werden.

#. Bauen Sie die Dokumentation *immer*, bevor Sie ?nderungen einreichen.
   Dazu f?hren Sie **``make``** im Hauptverzeichnis des Dokuments aus,
   dass Sie gerade bearbeiten. Um beispielsweise die deutsche Version
   des FreeBSD-Handbuchs als einzelne HTML-Dateien zu bauen, f?hren Sie
   **``make``** im Verzeichnis ``de_DE.ISO8859-1/books/handbook/`` aus.
   Durch diesen Schritt wird sichergestellt, dass Ihre ?nderungen den
   Bau der Dokumentation nicht wegen eines Fehlers abbrechen.

#. Wenn Ihre ?nderungen abgeschlossen und erfolgreich getestet wurden,
   erzeugen Sie eine „Differenzdatei“ mit Ihren ?nderungen:

   .. code:: screen

       % cd ~/doc
       % svn diff > bsdinstall.diff.txt

   Geben Sie der Differenzdatei einen aussagekr?ftigen Namen. Im
   angegebenen Bespiel wurden ?nderungen im Abschnitt ``bsdinstall`` des
   Handbuchs vorgenommen.

#. Reichen Sie Ihre ?nderungen ?ber das webbasierte
   `Problembericht-Formular <../../../../support.html#gnats>`__ ein.
   Geben Sie eine kurze Beschreibung in der Form *[patch]
   *``kurze Beschreibung des Problems``** ein. Als Kategorie w?hlen Sie
   ``docs`` und als Klasse ``doc-bug``. Danach geben Sie eine
   Beschreibung Ihrer ?nderungen ein sowie eventuelle weitere wichtige
   Punkte. Verwenden Sie danach den Button [?Browse...?], um Ihre
   Differenzdatei hochzuladen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+---------------------------------+------------------------------+
| `Zur?ck <overview.html>`__?   | `Nach oben <overview.html>`__   | ?\ `Weiter <tools.html>`__   |
+-------------------------------+---------------------------------+------------------------------+
| Kapitel 1. ?berblick?         | `Zum Anfang <index.html>`__     | ?Kapitel 2. Die Werkzeuge    |
+-------------------------------+---------------------------------+------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
