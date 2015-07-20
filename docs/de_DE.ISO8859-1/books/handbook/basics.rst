==============================================
Kapitel 4. Grundlagen des UNIX Betriebssystems
==============================================

.. raw:: html

   <div class="navheader">

Kapitel 4. Grundlagen des UNIX Betriebssystems
`Zur?ck <bsdinstall-install-trouble.html>`__?
Teil?I.?Erste Schritte
?\ `Weiter <consoles.html>`__

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

Kapitel 4. Grundlagen des UNIX Betriebssystems
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Umgeschrieben von Chris Shumway.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Uwe Pierau.

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

`4.1. ?bersicht <basics.html#basics-synopsis>`__
`4.2. Virtuelle Konsolen und Terminals <consoles.html>`__
`4.3. Zugriffsrechte <permissions.html>`__
`4.4. Verzeichnis-Strukturen <dirstructure.html>`__
`4.5. Festplatten, Slices und Partitionen <disk-organization.html>`__
`4.6. Anh?ngen und Abh?ngen von Dateisystemen <mount-unmount.html>`__
`4.7. Prozesse <basics-processes.html>`__
`4.8. D?monen, Signale und Stoppen von
Prozessen <basics-daemons.html>`__
`4.9. Shells <shells.html>`__
`4.10. Text-Editoren <editors.html>`__
`4.11. Ger?te und Ger?tedateien <basics-devices.html>`__
`4.12. Bin?rformate <binary-formats.html>`__
`4.13. Weitere Informationen <basics-more-information.html>`__

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

4.1. ?bersicht
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das folgende Kapitel umfasst die grundlegenden Kommandos und
Funktionsweisen des Betriebssystems FreeBSD. Viel von dem folgenden
Material gilt auch f?r jedes andere UNIX?-artige System. Falls Sie mit
dem Material schon vertraut sind, k?nnen Sie dieses Kapitel ?berlesen.
Wenn FreeBSD neu f?r Sie ist, dann sollten Sie dieses Kapitel auf jeden
Fall aufmerksam lesen.

Dieser Abschnitt behandelt die folgenden Themen:

.. raw:: html

   <div class="itemizedlist">

-  virtuelle Konsolen,

-  Zugriffsrechte unter UNIX? sowie Datei-Flags unter FreeBSD,

-  Zugriffskontrolllisten f?r Dateisysteme,

-  die Verzeichnisstruktur von FreeBSD,

-  Organisation von Dateisystemen unter FreeBSD,

-  Ein- und Abh?ngen von Dateisystemen,

-  Prozesse, D?monen und Signale,

-  Shells und die Login-Umgebung,

-  Texteditoren,

-  Ger?te und Ger?tedateien,

-  Bin?rformate unter FreeBSD und

-  wie Sie in den Manualpages nach weiteren Informationen suchen k?nnen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+----------------------------------------+------------------------------------------+
| `Zur?ck <bsdinstall-install-trouble.html>`__?   | `Nach oben <getting-started.html>`__   | ?\ `Weiter <consoles.html>`__            |
+-------------------------------------------------+----------------------------------------+------------------------------------------+
| 3.10. Fehlerbehebung?                           | `Zum Anfang <index.html>`__            | ?4.2. Virtuelle Konsolen und Terminals   |
+-------------------------------------------------+----------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
