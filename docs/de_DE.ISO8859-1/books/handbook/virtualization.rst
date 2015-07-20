===========================
Kapitel 24. Virtualisierung
===========================

.. raw:: html

   <div class="navheader">

Kapitel 24. Virtualisierung
`Zur?ck <vinum-root.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <virtualization-guest.html>`__

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

Kapitel 24. Virtualisierung
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Oliver Peter.

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

`24.1. ?bersicht <virtualization.html#virtualization-synopsis>`__
`24.2. FreeBSD als Gast-Betriebssystem <virtualization-guest.html>`__
`24.3. FreeBSD als Host-Betriebssystem <virtualization-host.html>`__

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

24.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Virtualisierungssoftware erlaubt es, mehrere Betriebssysteme
gleichzeitig auf dem selben Computer laufen zu lassen. Derartige
Softwaresysteme f?r PCs setzen in der Regel ein Host-Betriebssystem
voraus, auf dem die Virtualisierungssoftware l?uft und unterst?tzen eine
nahezu beliebige Anzahl von Gast-Betriebssystemen.

Nachdem Sie dieses Kapitel gelesen haben,

.. raw:: html

   <div class="itemizedlist">

-  Kennen Sie den Unterscheid zwischen einem Host-Betriebssystem und
   einem Gast-Betriebssystem.

-  K?nnen Sie FreeBSD auf einem Intel?-basierenden Apple? Macintosh?
   installieren.

-  K?nnen Sie FreeBSD unter Microsoft??Windows? und Virtual PC
   installieren.

-  Wissen Sie, wie man ein virtualisiertes FreeBSD-System f?r optimale
   Leistung konfiguriert.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  Die Grundlagen von UNIX? und FreeBSD verstehen (`Kapitel?4,
   *Grundlagen des UNIX Betriebssystems* <basics.html>`__).

-  FreeBSD installieren k?nnen (`Kapitel?2, *FreeBSD?8.\ *``X``* (und
   ?lter) installieren* <install.html>`__).

-  Wissen, wie man seine Netzwerkverbindung konfiguriert (`Kapitel?33,
   *Weiterf?hrende Netzwerkthemen* <advanced-networking.html>`__).

-  Software Dritter installieren k?nnen (`Kapitel?5, *Installieren von
   Anwendungen: Pakete und Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+----------------------------------------------+---------------------------------------------+
| `Zur?ck <vinum-root.html>`__?                    | `Nach oben <system-administration.html>`__   | ?\ `Weiter <virtualization-guest.html>`__   |
+--------------------------------------------------+----------------------------------------------+---------------------------------------------+
| 23.9. Vinum f?r das Root-Dateisystem benutzen?   | `Zum Anfang <index.html>`__                  | ?24.2. FreeBSD als Gast-Betriebssystem      |
+--------------------------------------------------+----------------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
