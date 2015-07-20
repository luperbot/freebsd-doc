=============================================
19.17. Den Auslagerungsspeicher verschl?sseln
=============================================

.. raw:: html

   <div class="navheader">

19.17. Den Auslagerungsspeicher verschl?sseln
`Zur?ck <disks-encrypting.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <disks-hast.html>`__

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

19.17. Den Auslagerungsspeicher verschl?sseln
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Christian Br?ffer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Verschl?sselung des Auslagerungsspeichers ist unter FreeBSD einfach
einzurichten. Je nach dem, welche FreeBSD-Version Sie einsetzen, k?nnen
Konfiguration und m?gliche Optionen allerdings unterschiedlich sein. Sie
k?nnen entweder das
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__-
oder das
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__-Verschl?sselungs-Subsystem
einsetzen. Beide Subsysteme werden ?ber das
`rc.d <configtuning-rcd.html>`__-Skript ``encswap`` gestartet.

Der letzte Abschnitt, `Partitionen
verschl?sseln <disks-encrypting.html>`__, enth?lt eine kurze
Beschreibung der verschiedenen Verschl?sselungs-Subsysteme.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.17.1. Warum sollte der Auslagerungsspeicher verschl?sselt werden?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie die Verschl?sselung von Plattenpartitionen dient auch die
Verschl?sselung des Auslagerungsspeichers dem Schutz sensitiver
Informationen. Stellen Sie sich etwa eine Anwendung vor, die ein
Passwort erfordert. Solange dieses Passwort im Hauptspeicher verbleibt,
ist alles in Ordnung. Beginnt Ihr Betriebssystem allerdings, Daten auf
die Festplatte auszulagern, um im Hauptspeicher Platz f?r andere
Anwendungen zu schaffen, kann es passieren, dass Ihr Passwort im
Klartext in den Auslagerungsspeicher geschrieben wird, was es einem
potentiellen Angreifer leicht macht, Ihr Passwort herauszufinden. Die
Verschl?sselung Ihres Auslagerungsspeichers kann dieses Problem l?sen.

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

19.17.2. Vorbereitungen
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

F?r die weiteren Ausf?hrungen dieses Abschnitts stellt ``ad0s1b`` die
Swap-Partition dar.

.. raw:: html

   </div>

Noch ist Ihr Auslagerungsspeicher nicht verschl?sselt. Es k?nnte
allerdings sein, dass bereits Passw?rter oder andere sensitive Daten als
Klartext im Auslagerungsspeicher vorhanden sind. Daher sollten Sie den
Auslagerungsspeicher komplett mit zuf?llig generierten Zeichen
?berschreiben, bevor Sie ihn verschl?sseln:

.. code:: screen

    # dd if=/dev/random of=/dev/ad0s1b bs=1m

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

19.17.3. Den Auslagerungsspeicher mit `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__ verschl?sseln
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Datei ``/etc/fstab`` sollte das Suffix ``.bde`` an den
Ger?tenamen der Swap-Partition anh?ngt werden:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/ad0s1b.bde         none            swap    sw              0       0

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

19.17.4. Den Auslagerungsspeicher mit `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__ verschl?sseln
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alternativ k?nnen Sie Ihren Auslagerungsspeicher auch mit
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
verschl?sseln. Die Vorgehensweise ist dabei ?hnlich. Allerdings h?ngen
Sie bei der Verwendung von
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__ in
``/etc/fstab`` das Suffix ``.eli`` an den Ger?tenamen der Swap-Partition
an:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/ad0s1b.eli         none            swap    sw              0       0

In der Voreinstellung verschl?sselt
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
den Auslagerungsspeicher mit dem AES-Algorithmus und einer
Schl?ssell?nge von 128 Bit.

Es ist m?glich, diese Optionen durch das Setzen der
``geli_swap_flags``-Option in ``/etc/rc.conf`` anzupassen. Die folgende
Zeile weist das rc.d-Skript ``encswap`` an,
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__-Swap-Partitionen
mit dem Blowfish-Algorithmus und einer Schl?ssell?nge von 128?Bit zu
verschl?sseln. Zus?tzlich wird die Sektorgr??e auf 4?Kilobyte gesetzt
und die Option „detach on last close“ aktiviert:

.. code:: programlisting

    geli_swap_flags="-e blowfish -l 128 -s 4096 -d"

Eine Auflistung m?glicher Optionen f?r den Befehl ``onetime`` finden Sie
in der Manualpage zu
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__.

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

19.17.5. Die korrekte Funktion testen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie Ihr System neu gestartet haben, k?nnen Sie die korrekte
Funktion Ihres verschl?sselten Auslagerungsspeichers pr?fen, indem Sie
sich die Ausgabe von ``swapinfo`` ansehen.

Wenn Sie
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
einsetzen, erhalten Sie eine Meldung ?hnlich der folgenden:

.. code:: screen

    % swapinfo
    Device          1K-blocks     Used    Avail Capacity
    /dev/ad0s1b.bde    542720        0   542720     0%

Wenn Sie
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
einsetzen, erhalten Sie hingegen eine Ausgabe ?hnlich der folgenden:

.. code:: screen

    % swapinfo
    Device          1K-blocks     Used    Avail Capacity
    /dev/ad0s1b.eli    542720        0   542720     0%

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+-------------------------------------------+
| `Zur?ck <disks-encrypting.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <disks-hast.html>`__           |
+---------------------------------------+-------------------------------+-------------------------------------------+
| 19.16. Partitionen verschl?sseln?     | `Zum Anfang <index.html>`__   | ?19.18. Highly Available Storage (HAST)   |
+---------------------------------------+-------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
