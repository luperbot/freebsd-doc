==================================
3.7. Eine Differenzdatei erstellen
==================================

.. raw:: html

   <div class="navheader">

3.7. Eine Differenzdatei erstellen
`Zur?ck <working-copy-revert.html>`__?
Kapitel 3. Die Arbeitskopie
?\ `Weiter <working-copy-subversion-references.html>`__

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

3.7. Eine Differenzdatei erstellen
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie eine oder mehrere Dateien bearbeitet haben, m?ssen Sie die
Unterschiede zwischen Ihrer lokalen Arbeitskopie und dem
FreeBSD-Repository in einer Datei sammeln, bevor Sie Ihre ?nderungen
einreichen k?nnen. Diese Dateien werden als *diff*-Dateien bezeichnet
und k?nnen durch den Befehl ``svn diff`` erzeugt werden:

.. code:: screen

    % cd ~/doc
    % svn diff > doc-fix-spelling.diff

Geben Sie der Datei einen Namen, die den Inhalt beschreibt. Die
Differenzdatei im Beispiel enth?lt Rechtschreibkorrekturen f?r den
gesamten Dokumentationsbaum.

Wenn Sie Ihre ?nderungen ?ber das Webformular „`Submit a FreeBSD problem
report <https://bugs.FreeBSD.org/bugzilla/enter_bug.cgi>`__“ einreichen
wollen, f?gen Sie bitte die Erweiterung ``.txt`` an den Dateinamen an,
damit das Formular sicher erkennt, dass Sie gew?hnlichen Text hochladen
wollen.

Vorsicht: ``svn diff`` protokolliert ALLE ?nderungen im aktuellen
Verzeichnis (und dessen Unterverzeichnissen). Wollen Sie einige dieser
?nderungen noch nicht einreichen, m?ssen Sie angeben, f?r welche Dateien
Sie eine Differenzdatei erstellen wollen.

.. code:: screen

    % cd ~/doc
    % svn diff disks/chapter.xml printers/chapter.xml > disks-printers.diff

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+-------------------------------------+-----------------------------------------------------------+
| `Zur?ck <working-copy-revert.html>`__?              | `Nach oben <working-copy.html>`__   | ?\ `Weiter <working-copy-subversion-references.html>`__   |
+-----------------------------------------------------+-------------------------------------+-----------------------------------------------------------+
| 3.6. ?nderungen an der Arbeitskopie zur?cknehmen?   | `Zum Anfang <index.html>`__         | ?3.8. Referenzen zu Subversion                            |
+-----------------------------------------------------+-------------------------------------+-----------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
