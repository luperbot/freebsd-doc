========================
19.8. Disketten benutzen
========================

.. raw:: html

   <div class="navheader">

19.8. Disketten benutzen
`Zur?ck <creating-dvds.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <backups-tapebackups.html>`__

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

19.8. Disketten benutzen
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Original von Julio Merino.

.. raw:: html

   </div>

.. raw:: html

   <div>

Umgeschrieben von Martin Karlsson.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Disketten sind n?tzlich, wenn kein anderes bewegliches Speichermedium
vorhanden ist oder wenn nur kleine Datenmengen transferiert werden
sollen.

Dieser Abschnitt beschreibt die Handhabung von Disketten unter FreeBSD.
Haupts?chlich geht es um die Formatierung und Benutzung von 3,5?Zoll
Disketten, doch lassen sich die Konzepte leicht auf Disketten anderer
Formate ?bertragen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.8.1. Disketten formatieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.8.1.1. Die Ger?tedateien
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie auf jedes andere Ger?t auch, greifen Sie auf Disketten ?ber Eintr?ge
im Verzeichnis ``/dev`` zu. Verwenden Sie dazu die Eintr?ge
``/dev/fdN``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.8.1.2. Formatierung
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor eine Diskette benutzt werden kann, muss Sie (low-level) formatiert
werden, was normalerweise der Hersteller schon gemacht hat. Sie k?nnen
die Diskette allerdings noch einmal formatieren, um das Medium zu
?berpr?fen. Es ist m?glich, die Kapazit?t der Diskette zu ver?ndern,
allerdings sind die meisten Disketten auf 1440?kB ausgelegt.

Mit
`fdformat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdformat&sektion=1>`__
formatieren Sie eine Diskette. Das Kommando erwartet die Angabe eines
Ger?tenamens.

Achten Sie bei der Formatierung auf Fehlermeldungen, die schlechte
Speichermedien anzeigen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.8.1.2.1. Disketten formatieren
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Disketten werden mithilfe der Ger?tedatei ``/dev/fdN`` formatiert.
Legen Sie eine 3,5?Zoll Diskette in Ihr Laufwerk ein und f?hren das
folgende Kommando aus:

.. code:: screen

    # /usr/sbin/fdformat -f 1440 /dev/fd0

.. raw:: html

   </div>

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

19.8.2. Das Disklabel
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nach dem Formatieren muss auf der Diskette ein Disklabel erstellt
werden. Das Disklabel wird sp?ter zerst?rt, ist aber notwendig, um die
Gr??e und Geometrie der Diskette zu erkennen.

Das Disklabel gilt f?r die ganze Diskette und enth?lt alle Informationen
?ber die Geometrie der Diskette. Eine Liste der m?glichen Geometrien
finden Sie in ``/etc/disktab``.

Erstellen Sie nun das Label mit
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__:

.. code:: screen

    # /sbin/bsdlabel -B -w /dev/fd0 fd1440

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

19.8.3. Das Dateisystem
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auf der Diskette muss nun ein Dateisystem erstellt werden (high-level
Formatierung), damit FreeBSD von der Diskette lesen und auf sie
schreiben kann. Das Disklabel wird durch das Anlegen eines Dateisystems
zerst?rt. Falls Sie die Diskette sp?ter erneut formatieren wollen,
m?ssen Sie dann auch ein neues Disklabel anlegen.

Sie k?nnen entweder UFS oder FAT als Dateisystem verwenden. F?r
Disketten ist FAT das beste Dateisystem.

Das folgende Kommando legt ein Dateisystem auf der Diskette an:

.. code:: screen

    # /sbin/newfs_msdos /dev/fd0

Die Diskette kann nun benutzt werden.

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

19.8.4. Verwenden der Diskette
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zum Einh?ngen der Diskette in das Dateisystem verwenden Sie den Befehl
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8>`__.
Sie k?nnen auch den Port
`emulators/mtools <http://www.freebsd.org/cgi/url.cgi?ports/emulators/mtools/pkg-descr>`__
verwenden, um mit der Diskette zu arbeiten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+--------------------------------------------+
| `Zur?ck <creating-dvds.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <backups-tapebackups.html>`__   |
+------------------------------------+-------------------------------+--------------------------------------------+
| 19.7. DVDs benutzen?               | `Zum Anfang <index.html>`__   | ?19.9. Bandmedien benutzen                 |
+------------------------------------+-------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
