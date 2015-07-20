=========================
19.9. Bandmedien benutzen
=========================

.. raw:: html

   <div class="navheader">

19.9. Bandmedien benutzen
`Zur?ck <floppies.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <backups-floppybackups.html>`__

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

19.9. Bandmedien benutzen
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bandmedien haben sich mit der Zeit weiterentwickelt, werden jedoch in
heutigen Systemen immer weniger verwendet. Moderne Backup-Systeme
verwenden *Offsite-Backups* in Verbindung mit lokalen
Wechseldatentr?gern. Weiterhin unterst?tzt FreeBSD SCSI-Bandlaufwerke,
wie etwa LTO und die ?lteren DAT-Laufwerke. Zus?tzlich gibt es begrenzte
Unterst?tzung f?r SATA- und USB-Bandlaufwerke.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.9.1. Serieller Zugriff mit `sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD nutzt den
`sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4>`__
Treiber, der die Schnittstellen ``/dev/sa0``, ``/dev/nsa0`` und
``/dev/esa0`` bereitstellt. Im ?blichen Gebrauch wird jedoch meist nur
``/dev/sa0`` ben?tigt. ``/dev/nsa0`` bezeichnet das selbe pysikalische
Laufwerk wie ``/dev/sa0``, aber nach dem Schreiben einer Datei wird das
Band nicht zur?ckgespult, was es erlaubt, mehr als eine Datei auf ein
Band zu schreiben. Die Verwendung von ``/dev/esa0`` wirft das Band aus,
nachdem das Ger?t geschlossen wurde.

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

19.9.2. Steuerung des Bandlaufwerks mit `mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1>`__ ist
das FreeBSD Dienstprogramm f?r die Steuerung weiterer Optionen des
Bandlaufwerks, wie zum Beispiel die Suche nach Dateien auf dem Band,
oder um Kontrollmarkierungen auf das Band zu schreiben.

Beispielsweise k?nnen die ersten drei Dateien auf einem Band erhalten
bleiben, indem diese ?bersprungen werden, bevor eine neue Datei
geschrieben wird:

.. code:: screen

    # mt -f /dev/nsa0 fsf 3

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

19.9.3. Benutzung von `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ zum Lesen und Schreiben von Bandsicherungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hier ein Beispiel, wie eine einzelne Datei mittels
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ auf
ein Band geschrieben wird:

.. code:: screen

    # tar cvf /dev/sa0 file

Wiederherstellung von Dateien aus dem
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__-Archiv
von Band in das aktuelle Verzeichnis:

.. code:: screen

    # tar xvf /dev/sa0

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

19.9.4. Die Benutzung von `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__ und `restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__ zum Erstellen und Wiederherstellen von Sicherungen.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein einfache Sicherung von ``/usr`` mit
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__:

.. code:: screen

    # dump -0aL -b64 -f /dev/nsa0 /usr

Interaktive Wiederherstellung von Dateien aus einer
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__-Datei
von Band in das aktuelle Verzeichnis:

.. code:: screen

    # restore -i -f /dev/nsa0

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

19.9.5. Weitere Software zur Bandsicherung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es stehen weitere Programme zur Vereinfachung von Bandsicherungen zur
Verf?gung. Zu den bekanntesten geh?ren AMANDA und Bacula. Diese
Programme zielen darauf ab, Sicherungen einfacher und bequemer zu
machen, oder um komplexe Sicherungen mehrerer Maschinen zu
automatisieren. Die Ports-Sammlung enth?lt sowohl diese, als auch
weitere Programme f?r die Bandsicherung.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <floppies.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <backups-floppybackups.html>`__   |
+-------------------------------+-------------------------------+----------------------------------------------+
| 19.8. Disketten benutzen?     | `Zum Anfang <index.html>`__   | ?19.10. Was ist mit Backups auf Disketten?   |
+-------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
