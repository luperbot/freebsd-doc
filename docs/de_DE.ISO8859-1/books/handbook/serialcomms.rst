=====================================
Kapitel 28. Serielle Daten?bertragung
=====================================

.. raw:: html

   <div class="navheader">

Kapitel 28. Serielle Daten?bertragung
`Zur?ck <network-communication.html>`__?
Teil?IV.?Netzwerke
?\ `Weiter <serial.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 28. Serielle Daten?bertragung
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Martin Heinen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`28.1. ?bersicht <serialcomms.html#serial-synopsis>`__
`28.2. Einf?hrung <serial.html>`__
`28.3. Terminals <term.html>`__
`28.4. Einw?hlverbindungen <dialup.html>`__
`28.5. Verbindungen nach Au?en <dialout.html>`__
`28.6. Einrichten der seriellen Konsole <serialconsole-setup.html>`__

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

28.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

UNIX? Systeme unterst?tzten schon immer die serielle Daten?bertragung.
Tats?chlich wurden Ein- und Ausgaben auf den ersten UNIX? Maschinen ?ber
serielle Leitungen durchgef?hrt. Seit der Zeit, in der ein
durchschnittlicher „Terminal“ aus einem seriellen Drucker mit
10?Zeichen/Sekunde und einer Tastatur bestand, hat sich viel ver?ndert.
Dieses Kapitel behandelt einige M?glichkeiten, serielle Daten?bertragung
unter FreeBSD zu verwenden.

Nachdem Sie dieses Kapitel durchgearbeitet haben, werden Sie Folgendes
wissen:

.. raw:: html

   <div class="itemizedlist">

-  Wie Sie Terminals an Ihr FreeBSD anschlie?en.

-  Wie Sie sich mit einem Modem auf einem entfernten Rechner einw?hlen.

-  Wie Sie entfernten Benutzern erlauben, sich mit einem Modem in Ihr
   System einzuw?hlen.

-  Wie Sie Ihr System ?ber eine serielle Konsole booten.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  einen neuen Kernel konfigurieren und installieren k?nnen (`Kapitel?9,
   *Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__).

-  Das Berechtigungskonzept von UNIX? und Prozesse verstehen
   (`Kapitel?4, *Grundlagen des UNIX Betriebssystems* <basics.html>`__).

-  Zudem sollten Sie Zugriff auf die Handb?cher der seriellen
   Komponenten (Modem oder Multiportkarte) haben, die Sie mit FreeBSD
   verwenden wollen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+----------------------------------------------+-------------------------------+
| `Zur?ck <network-communication.html>`__?   | `Nach oben <network-communication.html>`__   | ?\ `Weiter <serial.html>`__   |
+--------------------------------------------+----------------------------------------------+-------------------------------+
| Teil?IV.?Netzwerke?                        | `Zum Anfang <index.html>`__                  | ?28.2. Einf?hrung             |
+--------------------------------------------+----------------------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
