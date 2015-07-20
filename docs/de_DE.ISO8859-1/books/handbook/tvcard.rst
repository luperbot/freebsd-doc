=========================
8.5. TV-Karten einrichten
=========================

.. raw:: html

   <div class="navheader">

8.5. TV-Karten einrichten
`Zur?ck <video-playback.html>`__?
Kapitel 8. Multimedia
?\ `Weiter <mythtv.html>`__

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

8.5. TV-Karten einrichten
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Josef El-Rayes.

.. raw:: html

   </div>

.. raw:: html

   <div>

?berarbeitet von Marc Fonvieille.

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

8.5.1. Einf?hrung
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit TV-Karten k?nnen Sie mit Ihrem Rechner ?ber Kabel oder Antenne
fernsehen. Die meisten Karten besitzen einen RCA- oder S-Video-Eingang.
Einige Karten haben auch einen FM-Radio-Empf?nger.

Der
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__-Treiber
von FreeBSD unterst?tzt PCI-TV-Karten mit einem Brooktree
Bt848/849/878/879 oder einem Conexant CN-878/Fusion 878a Chip. Die Karte
sollte einen der unterst?tzten Empf?nger besitzen, die in der Hilfeseite
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__
aufgef?hrt sind.

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

8.5.2. Den Treiber einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um Ihre Karte zu benutzen, m?ssen Sie den
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__-Treiber
laden. F?gen Sie die nachstehende Zeile in die Datei
``/boot/loader.conf`` ein:

.. code:: programlisting

    bktr_load="YES"

Sie k?nnen den Treiber f?r die TV-Karte auch fest in den Kernel
compilieren. Erweitern Sie dazu Ihre Kernelkonfiguration um die
folgenden Zeilen:

.. code:: programlisting

    device     bktr
    device  iicbus
    device  iicbb
    device  smbus

Die zus?tzlichen Treiber werden ben?tigt, da die Komponenten der Karte
?ber einen I2C-Bus verbunden sind. Bauen und installieren Sie dann den
neuen Kernel.

Anschlie?end m?ssen Sie Ihr System neu starten. W?hrend des Neustarts
sollte Ihre TV-Karte erkannt werden:

.. code:: programlisting

    bktr0: <BrookTree 848A> mem 0xd7000000-0xd7000fff irq 10 at device 10.0 on pci0
    iicbb0: <I2C bit-banging driver> on bti2c0
    iicbus0: <Philips I2C bus> on iicbb0 master-only
    iicbus1: <Philips I2C bus> on iicbb0 master-only
    smbus0: <System Management Bus> on bti2c0
    bktr0: Pinnacle/Miro TV, Philips SECAM tuner.

Abh?ngig von Ihrer Hardware k?nnen die Meldungen nat?rlich anders
aussehen. Sie sollten aber pr?fen, dass der Empf?nger richtig erkannt
wird. Die entdeckten Ger?te lassen sich mit
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
oder in der Kernelkonfigurationsdatei ?berschreiben. Wenn Sie
beispielsweise einen Philips-SECAM-Empf?nger erzwingen wollen, f?gen Sie
die folgende Zeile zur Kernelkonfigurationsdatei hinzu:

.. code:: programlisting

    options OVERRIDE_TUNER=6

Alternativ k?nnen Sie direkt
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
benutzen:

.. code:: screen

    # sysctl hw.bt848.tuner=6

Weitere Informationen zu den verschiedenen Optionen finden Sie in
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__
sowie in der Datei ``/usr/src/sys/conf/NOTES``.

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

8.5.3. N?tzliche Anwendungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die TV-Karte zu benutzen, m?ssen Sie eine der nachstehenden
Anwendungen installieren:

.. raw:: html

   <div class="itemizedlist">

-  `multimedia/fxtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/fxtv/pkg-descr>`__
   l?sst das Fernsehprogramm in einem Fenster laufen und kann Bilder,
   Audio und Video aufzeichnen.

-  `multimedia/xawtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xawtv/pkg-descr>`__
   eine weitere TV-Anwendung, mit den gleichen Funktionen wie fxtv.

-  `misc/alevt <http://www.freebsd.org/cgi/url.cgi?ports/misc/alevt/pkg-descr>`__
   dekodiert und zeigt Videotext/Teletext an.

-  Mit
   `audio/xmradio <http://www.freebsd.org/cgi/url.cgi?ports/audio/xmradio/pkg-descr>`__
   l?sst sich der FM-Radio-Empf?nger, der sich auf einigen TV-Karten
   befindet, benutzen.

-  `audio/wmtune <http://www.freebsd.org/cgi/url.cgi?ports/audio/wmtune/pkg-descr>`__
   ein leicht zu bedienender Radio-Empf?nger.

.. raw:: html

   </div>

Weitere Anwendungen finden Sie in der FreeBSD Ports-Sammlung.

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

8.5.4. Fehlersuche
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie Probleme mit Ihrer TV-Karte haben, pr?fen Sie zuerst, ob der
Video-Capture-Chip und der Empf?nger auch wirklich vom
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__-Treiber
unterst?tzt werden. Pr?fen Sie dann, ob Sie die richtigen Optionen
verwenden. Weitere Hilfe erhalten Sie auf der Mailingliste
`freebsd-multimedia <http://lists.FreeBSD.org/mailman/listinfo/freebsd-multimedia>`__
und in deren Archiven.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-----------------------------------+-------------------------------+
| `Zur?ck <video-playback.html>`__?   | `Nach oben <multimedia.html>`__   | ?\ `Weiter <mythtv.html>`__   |
+-------------------------------------+-----------------------------------+-------------------------------+
| 8.4. Videos wiedergeben?            | `Zum Anfang <index.html>`__       | ?8.6. MythTV                  |
+-------------------------------------+-----------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
