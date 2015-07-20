====================================
Kapitel 22. Dateisystemunterst?tzung
====================================

.. raw:: html

   <div class="navheader">

Kapitel 22. Dateisystemunterst?tzung
`Zur?ck <zfs-term.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <filesystems-linux.html>`__

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

Kapitel 22. Dateisystemunterst?tzung
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling und Daniel Seuffert.

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

`22.1. ?bersicht <filesystems.html#filesystems-synopsis>`__
`22.2. Linux? Dateisysteme <filesystems-linux.html>`__

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

22.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dateisysteme sind ein wesentlicher Bestandteil von Betriebssystemen. Sie
erlauben es Benutzern, Dateien zu laden und zu speichern, erm?glichen
den Zugriff auf Daten und machen Festplatten ?berhaupt erst n?tzlich.
Betriebssysteme unterscheiden sich normalerweise bei dem mitgelieferten
Dateisystem. Traditionell ist dies unter FreeBSD das Unix File System
UFS, welches mit UFS2 modernisiert wurde. Seit FreeBSD?7.0 steht auch
das Z-Dateisystem (ZFS) als natives Dateisystem zur Verf?gung. Hierzu
finden Sie in `Kapitel?21, *Das Z-Dateisystem (ZFS)* <zfs.html>`__
weitere Informationen.

FreeBSD unterst?tzt auch eine Vielzahl weiterer Dateisysteme, um auf
Daten von anderen Betriebssystemen lokal zuzugreifen, beispielsweise
Daten auf USB-Speichermedien, Flash-Speichern und Festplatten. Dazu
geh?rt die Unterst?tzung f?r das Linux? Extended File System (EXT) und
das Reiser Dateisystem.

Es gibt verschiedene Stufen der Unterst?tzung in FreeBSD f?r diese
unterschiedlichen Dateisysteme. Manche ben?tigen ein geladenes
Kernelmodul, andere die Installation bestimmter Werkzeuge. Einige
Dateisysteme haben volle Unterst?tzung f?r Lese- und Schreibzugriffe,
w?hrend auf andere nur-lesend zugegriffen werden kann.

Nachdem Sie dieses Kapitel gelesen haben, wissen Sie:

.. raw:: html

   <div class="itemizedlist">

-  Den Unterschied zwischen nativen und unterst?tzten Dateisystemen.

-  Welche Dateisysteme von FreeBSD unterst?tzt werden.

-  Wie man fremde Dateisysteme aktiviert, konfiguriert, darauf zugreift
   und diese verwendet.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  Grundlagen von UNIX? und FreeBSD verstehen (`Kapitel?4, *Grundlagen
   des UNIX Betriebssystems* <basics.html>`__).

-  Mit den Grundlagen der Konfiguration und dem Bauen des Kernels
   vertraut sein (`Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__).

-  Problemlos Software von Drittherstellern in FreeBSD installieren
   k?nnen (`Kapitel?5, *Installieren von Anwendungen: Pakete und
   Ports* <ports.html>`__).

-  Sich ein wenig mit Festplatten, Speicher und Ger?tenamen in FreeBSD
   auskennen (`Kapitel?19, *Speichermedien* <disks.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+----------------------------------------------+------------------------------------------+
| `Zur?ck <zfs-term.html>`__?                 | `Nach oben <system-administration.html>`__   | ?\ `Weiter <filesystems-linux.html>`__   |
+---------------------------------------------+----------------------------------------------+------------------------------------------+
| 21.8. ZFS-Eigenschaften und Terminologie?   | `Zum Anfang <index.html>`__                  | ?22.2. Linux? Dateisysteme               |
+---------------------------------------------+----------------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
