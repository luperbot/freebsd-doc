==============================
20.5. GEOM Gate Netzwerkger?te
==============================

.. raw:: html

   <div class="navheader">

20.5. GEOM Gate Netzwerkger?te
`Zur?ck <GEOM-mirror.html>`__?
Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
?\ `Weiter <geom-glabel.html>`__

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

20.5. GEOM Gate Netzwerkger?te
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GEOM unterst?tzt die Verwendung entfernter Ger?te wie Festplatten,
CD-ROMs, Dateien usw. mittels Nutzung der Gate-Dienstprogramme. Dies ist
vergleichbar mit NFS.

Zu Beginn muss eine Exportdatei erzeugt werden. Diese Datei legt fest,
wer Zugriff auf die exportierten Ressourcen hat und welche
Zugriffstechniken angeboten werden. Um zum Beispiel den vierten Slice
auf der ersten SCSI-Platte zu exportieren, ist die folgende Datei
``/etc/gg.exports`` mehr als ausreichend:

.. code:: programlisting

    192.168.1.0/24 RW /dev/da0s4d

Sie wird allen Hosts innerhalb des privaten Netzwerkes den Zugriff auf
das Dateisystem auf der Partition ``da0s4d`` erlauben.

Um dieses Ger?t zu exportieren, stellen Sie bitte sicher, dass es
momentan nicht gemounted ist und starten Sie den
`ggated(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggated&sektion=8>`__
Server-Daemon:

.. code:: screen

    # ggated

Um nun ``mount`` auf der Client-Maschine auszuf?hren, geben Sie bitte
die folgenden Befehle ein:

.. code:: screen

    # ggatec create -o rw 192.168.1.1 /dev/da0s4d
    ggate0
    # mount /dev/ggate0 /mnt

Von nun an kann auf das Ger?t ?ber den Mount-Punkt ``/mnt`` zugegriffen
werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es sollte darauf hingewiesen werden, dass dies scheitern wird, falls das
Ger?t momentan entweder auf dem Server oder irgendeiner anderen Maschine
gemountet ist.

.. raw:: html

   </div>

Wenn das Ger?t nicht l?nger gebraucht wird, dann kann es mit dem Befehl
`umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__
ausgeh?ngt werden (genauso wie jedes andere Laufwerk auch).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <GEOM-mirror.html>`__?   | `Nach oben <GEOM.html>`__     | ?\ `Weiter <geom-glabel.html>`__   |
+----------------------------------+-------------------------------+------------------------------------+
| 20.4. RAID1 - Spiegelung?        | `Zum Anfang <index.html>`__   | ?20.6. Das Labeln von Laufwerken   |
+----------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
