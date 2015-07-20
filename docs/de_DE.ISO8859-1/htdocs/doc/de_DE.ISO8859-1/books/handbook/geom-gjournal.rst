============================
20.7. UFS Journaling in GEOM
============================

.. raw:: html

   <div class="navheader">

20.7. UFS Journaling in GEOM
`Zur?ck <geom-glabel.html>`__?
Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
?\ `Weiter <zfs.html>`__

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

20.7. UFS Journaling in GEOM
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit FreeBSD?7.0 wurde eine lang erwartete Funktion, das Journaling,
implementiert. Diese Funktion wird ?ber das GEOM-Subsystem realisiert
und kann ?ber das Werkzeug
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8>`__
eingerichtet werden.

Was ist Journaling? Bei Journaling wird ein Protokoll ?ber alle
Dateisystemtransaktionen angelegt, inklusive aller Ver?nderungen, aus
denen ein kompletter Schreibvorgang besteht, bevor diese ?nderungen
(Metadaten sowie tats?chliche Schreibvorg?nge) physisch auf der
Festplatte ausgef?hrt werden. Dieses Protokoll kann sp?ter erneut
aufgerufen werden, um diese Vorg?nge zu wiederholen (beispielsweise um
Systeminkonsistenzen zu vermeiden).

Diese Technik bietet eine weitere M?glichkeit, sich vor Datenverlust und
Dateisystem-Inkonsistenzen zu sch?tzen. Im Gegensatz zu Soft Updates
(die Metadaten-Aktualisierungen verfolgen und erzwingen) und Snapshots
(die ein Image eines Dateisystems darstellen) wird bei Journaling ein
tats?chliches Protokoll in einem speziell daf?r bereitgestellten Bereich
der Festplatte (oder manchmal sogar auf einer separaten Platte)
gespeichert.

Im Gegensatz zu anderen Journaling-Dateisystemen arbeitet die
``gjournal``-Methode blockbasiert und wurde nicht als Teil des
Dateisystems implementiert, sondern als GEOM-Erweiterung.

Um die ``gjournal``-Unterst?tzung zu aktivieren, muss der FreeBSD-Kernel
die folgende Option enthalten (was seit FreeBSD?7.0 bereits in der
Voreinstellung der Fall ist):

.. code:: programlisting

    options  UFS_GJOURNAL

Um ein Volume mit Journalunterst?tzung beim Systemstart automatisch zu
mounten, muss das Kernelmodul ``geom_journal.ko`` ebenfalls automatisch
geladen werden (durch einen entsprechenden Eintrag in der Datei
``/boot/loader.conf``):

.. code:: programlisting

    geom_journal_load="YES"

Alternativ k?nnen Sie auch einen angepassten Kernel bauen, der diese
Funktionalit?t enth?lt, indem Sie die folgende Zeile in Ihrer
Kernelkonfigurationsdatei aufnehmen:

.. code:: programlisting

    options     GEOM_JOURNAL

Das Anlegen eines neuen Journals auf einem freien Dateisystem erfolgt
durch die folgenden Schritte (im Folgenden wird angenommen, dass es sich
bei ``da4`` um eine neue SCSI-Platte handelt):

.. code:: screen

    # gjournal load
    # gjournal label /dev/da4

Danach sollten die Ger?tedateien ``/dev/da4`` sowie ``/dev/da4.journal``
vorhanden sein. Nun k?nnen Sie auf diesem Ger?t ein Dateisystem anlegen:

.. code:: screen

    # newfs -O 2 -J /dev/da4.journal

Dieser Befehl erzeugt ein UFS2-Dateisystem auf dem Ger?t, f?r das im
letzten Schritt das Journaling aktiviert wurde.

Danach h?ngen Sie das neue Dateisystem mit ``mount`` in Ihren
Verzeichnisbaum ein:

.. code:: screen

    # mount /dev/da4.journal /mnt

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls auf Ihrem System mehrere Slices angelegt sind (beispielsweise
``ad4s1`` sowie ``ad4s2``), wird ``gjournal`` f?r jedes Slice ein
Journal anlegen (also ``ad4s1.journal`` sowie ``ad4s2.journal``).

.. raw:: html

   </div>

Um die Leistung zu optimieren, kann das Journal auf eine externe Platte
ausgelagert werden. In einem solchen Fall geben Sie die Ger?tedatei der
Platte nach dem Ger?t an, f?r das Sie Journaling aktivieren wollen.
Theoretisch ist es auch m?glich, Journaling auf bereits existierenden
Dateisystemen durch das Werkzeug ``tunefs`` zu aktivieren. Machen Sie
aber in jedem Fall ein Backup Ihrer Daten, bevor Sie versuchen, ein
existierendes Dateisystem zu ?ndern. ``gjournal`` wird zwar den Vorgang
abbrechen, wenn es das Journal nicht erzeugen kann, allerdings sch?tzt
Sie dies nicht vor Datenverlust durch einen fehlerhaften Einsatz von
``tunefs``.

Es ist m?glich, Journale auch f?r die Bootplatte eines FreeBSD-System zu
verwenden. Lesen Sie bitte den Artikel `Implementing UFS Journaling on a
Desktop
PC <../../../../doc/en_US.ISO8859-1/articles/gjournal-desktop/article.html>`__,
wenn Sie an einer derartigen Konfiguration interessiert sind.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <geom-glabel.html>`__?     | `Nach oben <GEOM.html>`__     | ?\ `Weiter <zfs.html>`__               |
+------------------------------------+-------------------------------+----------------------------------------+
| 20.6. Das Labeln von Laufwerken?   | `Zum Anfang <index.html>`__   | ?Kapitel 21. Das Z-Dateisystem (ZFS)   |
+------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
