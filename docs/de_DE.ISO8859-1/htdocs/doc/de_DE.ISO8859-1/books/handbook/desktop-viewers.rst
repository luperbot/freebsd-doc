============================
7.4. Anzeigen von Dokumenten
============================

.. raw:: html

   <div class="navheader">

7.4. Anzeigen von Dokumenten
`Zur?ck <desktop-productivity.html>`__?
Kapitel 7. Desktop-Anwendungen
?\ `Weiter <desktop-finance.html>`__

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

7.4. Anzeigen von Dokumenten
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige neuere Dokumentformate, die sich aktuell gro?er Beliebtheit
erfreuen, k?nnen Sie sich mit den im Basissystem enthaltenen Programmen
und Werkzeugen nicht ansehen. Dieser Abschnitt behandelt Programme, mit
denen Sie sich Dokumente in unterschiedlichsten Formaten ansehen k?nnen.

Die nachstehenden Anwendungen werden behandelt:

.. raw:: html

   <div class="informaltable">

+-------------------+--------------------+--------------------------------------+------------------------------+
| Anwendung         | Ressourcenbedarf   | Installationsaufwand aus den Ports   | wichtige Abh?ngigkeiten      |
+===================+====================+======================================+==============================+
| Acrobat?Reader?   | niedrig            | niedrig                              | Linux Binary Compatibility   |
+-------------------+--------------------+--------------------------------------+------------------------------+
| gv                | niedrig            | niedrig                              | Xaw3d                        |
+-------------------+--------------------+--------------------------------------+------------------------------+
| Xpdf              | niedrig            | niedrig                              | FreeType                     |
+-------------------+--------------------+--------------------------------------+------------------------------+
| GQview            | niedrig            | niedrig                              | Gtk+ oder GNOME              |
+-------------------+--------------------+--------------------------------------+------------------------------+

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

7.4.1. Acrobat?Reader?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Viele Dokumente werden heute im „Portable Document Format“ (PDF) zur
Verf?gung gestellt. PDF-Dokumente schauen Sie sich am Besten mit dem
Programm Acrobat?Reader? an, das von Adobe f?r Linux freigegeben wurde.
Da Linux-Programme unter FreeBSD laufen, steht Ihnen das Programm auch
hier zur Verf?gung.

Um Acrobat?Reader? 8 ?ber die Ports-Sammlung zu installieren, geben Sie
Folgendes ein:

.. code:: screen

    # cd /usr/ports/print/acroread8
    # make install clean

Aufgrund der Lizenzbedinungen ist eine Paketversion leider nicht
verf?gbar.

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

7.4.2. gv
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

gv kann PostScript?- und PDF-Dokumente anzeigen. Es stammt von ghostview
ab, besitzt aber wegen der Xaw3d-Bibliothek eine sch?nere
Benutzeroberfl?che. In gv k?nnen Sie viele Operationen durchf?hren: Sie
k?nnen die Ausrichtung und die Papiergr??e eines Dokuments ?ndern, das
Dokument skalieren oder die Kantengl?ttung (*Anti-Aliasing*) aktivieren.
Fast jede Operation kann sowohl mit der Tastatur als auch mit der Maus
durchgef?hrt werden.

Installieren Sie das gv-Paket wie folgt:

.. code:: screen

    # pkg_add -r gv

Benutzen Sie die Ports-Sammlung, wenn das Paket nicht zur Verf?gung
steht:

.. code:: screen

    # cd /usr/ports/print/gv
    # make install clean

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

7.4.3. Xpdf
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein schlankes und effizientes Programm zum Betrachten von PDF-Dateien
ist Xpdf. Es ben?tigt wenige Ressourcen und ist sehr stabil. Da das
Programm die Standard X-Zeichens?tze benutzt, ist es nicht auf Motif?
oder ein anderes X-Toolkit angewiesen.

Das Xpdf-Paket k?nnen Sie mit dem folgenden Kommando installieren:

.. code:: screen

    # pkg_add -r xpdf

Wenn das Paket nicht verf?gbar ist, oder Sie lieber die Ports-Sammlung
benutzen m?chten, gehen Sie wie folgt vor:

.. code:: screen

    # cd /usr/ports/graphics/xpdf
    # make install clean

Wenn Sie nach Abschluss der Installation Xpdf starten, ?ffnen Sie das
Men? mit der rechten Maustaste.

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

7.4.4. GQview
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit GQview lassen sich Bilder verwalten. Unter anderem k?nnen Sie sich
Bilder (auch auf dem ganzen Bildschirm) anschauen, ein externes Werkzeug
aufrufen und eine Vorschau (*thumbnail*) erzeugen. Weiterhin k?nnen Sie
automatisch ablaufende Pr?sentationen erstellen und grundlegende
Dateioperationen durchf?hren, Bildersammlungen verwalten und doppelte
Bilder aufsp?ren. GQview ist internationalisiert, das hei?t es
ber?cksichtigt die Spracheinstellungen des Systems.

Wenn Sie das GQview-Paket installieren wollen, geben Sie das folgende
Kommando ein:

.. code:: screen

    # pkg_add -r gqview

Ist das Paket nicht erh?ltlich, oder wenn Sie die Ports-Sammlung
bevorzugen, setzen Sie die folgenden Kommandos ab:

.. code:: screen

    # cd /usr/ports/graphics/gqview
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+--------------------------------+----------------------------------------+
| `Zur?ck <desktop-productivity.html>`__?   | `Nach oben <desktop.html>`__   | ?\ `Weiter <desktop-finance.html>`__   |
+-------------------------------------------+--------------------------------+----------------------------------------+
| 7.3. B?roanwendungen?                     | `Zum Anfang <index.html>`__    | ?7.5. Finanzsoftware                   |
+-------------------------------------------+--------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
