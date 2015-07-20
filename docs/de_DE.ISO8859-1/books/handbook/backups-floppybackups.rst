=========================================
19.10. Was ist mit Backups auf Disketten?
=========================================

.. raw:: html

   <div class="navheader">

19.10. Was ist mit Backups auf Disketten?
`Zur?ck <backups-tapebackups.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <backup-strategies.html>`__

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

19.10. Was ist mit Backups auf Disketten?
-----------------------------------------

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

19.10.1. Kann ich Disketten zum Backup meiner Daten verwenden?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Disketten sind kein wirklich geeignetes Medium f?r Backups aus folgenden
Gr?nden:

.. raw:: html

   <div class="itemizedlist">

-  Disketten sind unzuverl?ssig, besonders langfristig.

-  Speichern und Wiederherstellen ist sehr langsam.

-  Sie haben eine sehr eingeschr?nkte Kapazit?t (Die Zeiten sind l?ngst
   vorbei, wo eine ganze Festplatte auf ein Dutzend Disketten oder so
   gespeichert werden konnte).

.. raw:: html

   </div>

Wenn jedoch keine andere M?glichkeit zum Datenbackup vorhanden ist, dann
sind Disketten immer noch besser als gar kein Backup.

Wenn man gezwungen ist Disketten zu verwenden, dann sollte man auf eine
gute Qualit?t achten. Disketten, die schon einige Jahre im B?ro
herumgelegen haben, sind eine schlechte Wahl. Ideal sind neue Disketten
von einem renommierten Hersteller.

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

19.10.2. Wie mache ich ein Backup auf Disketten?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die beste Art eines Diskettenbackups ist der Befehl
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ mit
der Mehrfachband-Option ``-M``, die es erm?glicht ein Backup ?ber
mehrere Disketten zu verteilen.

Ein Backup aller Dateien im aktuellen Verzeichnis einschlie?lich aller
Unterverzeichnisse wird durch den folgenden Befehl veranlasst (als
``root``):

.. code:: screen

    # tar Mcvf /dev/fd0 *

Wenn die erste Diskette voll ist, meldet sich
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ und
verlangt einen Diskettenwechsel (weil
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
unabh?ngig vom Medium arbeitet, wird das n?chste Band (Volume) verlangt,
was in diesem Zusammenhang eine Diskette bedeutet), in etwa wie folgt:

.. code:: screen

    Prepare volume #2 for /dev/fd0 and hit return:

Dies wird mit steigender Volumenzahl wiederholt, bis alle angegebenen
Dateien archiviert sind.

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

19.10.3. K?nnen Diskettenbackups komprimiert werden?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Leider erlaubt es
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
nicht, die Option ``-z`` f?r Multi-Volume-Archive zu verwenden. Man kann
nat?rlich alle Dateien mit
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__
komprimieren, sie mit
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ auf
die Disketten aufspielen, und dann die Dateien wieder
`gunzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gunzip&sektion=1>`__
dekomprimieren!

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

19.10.4. Wie werden Diskettenbackups wieder hergestellt?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zur Wiederherstellung des gesamten Archivs verwendet man:

.. code:: screen

    # tar Mxvf /dev/fd0

Eine Methode um nur bestimmte Dateien wieder her zu stellen ist mit der
ersten Diskette den folgenden Befehl auszuf?hren:

.. code:: screen

    # tar Mxvf /dev/fd0 filename

`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ wird
dann die folgenden Disketten anfordern, bis die ben?tigte Datei gefunden
ist.

Wenn man die Diskette kennt, auf der sich die Datei befindet, kann man
alternativ diese Diskette auch direkt einlegen und den gleichen Befehl
wie oben verwenden. Man beachte, dass, falls die erste Datei eine
Fortsetzung einer Datei von einer der vorigen Disketten ist,
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ die
Warnung ausgibt, dass diese Datei nicht wiederhergestellt werden kann,
selbst dann, wenn dies gar nicht verlangt wurde!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------+------------------------------------------+
| `Zur?ck <backups-tapebackups.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <backup-strategies.html>`__   |
+------------------------------------------+-------------------------------+------------------------------------------+
| 19.9. Bandmedien benutzen?               | `Zum Anfang <index.html>`__   | ?19.11. Backup-Strategien                |
+------------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
