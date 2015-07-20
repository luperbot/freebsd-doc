===============================================================
Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
===============================================================

.. raw:: html

   <div class="navheader">

Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
`Zur?ck <disks-hast.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <GEOM-intro.html>`__

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

Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
---------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Daniel Seuffert und Johann Kois.

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

`20.1. ?bersicht <GEOM.html#geom-synopsis>`__
`20.2. Einf?hrung in GEOM <GEOM-intro.html>`__
`20.3. RAID0 - Striping <GEOM-striping.html>`__
`20.4. RAID1 - Spiegelung <GEOM-mirror.html>`__
`20.5. GEOM Gate Netzwerkger?te <geom-ggate.html>`__
`20.6. Das Labeln von Laufwerken <geom-glabel.html>`__
`20.7. UFS Journaling in GEOM <geom-gjournal.html>`__

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

20.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel behandelt den Einsatz von Laufwerken mit dem
GEOM-Framework in FreeBSD. Dies beinhaltet auch die wichtigen
RAID-?berwachungswerkzeuge, welche das Framework zur Konfiguration
nutzen. Dieses Kapitel enth?lt keine tiefsch?rfenden Betrachtungen, wie
GEOM I/O nutzt oder steuert, sein zugrundeliegendes Subsystem oder den
Quelltext von GEOM. Diese Information wird durch die
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__-Manualpage
und seine zahlreichen „SEE ALSO“-Verweise bereitgestellt. Dieses Kapitel
ist auch kein ausf?hrlicher F?hrer f?r RAID-Konfigurationen. Nur durch
GEOM unterst?tzte RAID-Klassen werden er?rtert.

Nach Lesen dieses Kapitels werden Sie folgendes wissen:

.. raw:: html

   <div class="itemizedlist">

-  Welche Art von RAID-Unterst?tzung durch GEOM verf?gbar ist.

-  Wie man die Basis-Dienstprogramme nutzt, um verschiedene RAID-Stufen
   zu konfigurieren, zu manipulieren und zu warten.

-  Wie man mittels GEOM spiegelt, striped, verschl?sselt und entfernte
   Laufwerke verbindet.

-  Wie man an Laufwerken, welche an das GEOM-Framework angeschlossen
   sind, Fehler behebt.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  Verstehen, wie FreeBSD Laufwerke behandelt (`Kapitel?19,
   *Speichermedien* <disks.html>`__).

-  Wissen wie man einen neuen FreeBSD-Kernel installiert und
   konfiguriert (`Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+----------------------------------------------+-----------------------------------+
| `Zur?ck <disks-hast.html>`__?             | `Nach oben <system-administration.html>`__   | ?\ `Weiter <GEOM-intro.html>`__   |
+-------------------------------------------+----------------------------------------------+-----------------------------------+
| 19.18. Highly Available Storage (HAST)?   | `Zum Anfang <index.html>`__                  | ?20.2. Einf?hrung in GEOM         |
+-------------------------------------------+----------------------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
