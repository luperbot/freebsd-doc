====================================
Kapitel 23. Der Vinum Volume Manager
====================================

.. raw:: html

   <div class="navheader">

Kapitel 23. Der Vinum Volume Manager
`Zur?ck <filesystems-linux.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <vinum-intro.html>`__

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

Kapitel 23. Der Vinum Volume Manager
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Urspr?nglich geschrieben von Greg Lehey.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Johann Kois und Kay Abendroth.

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

`23.1. ?bersicht <vinum-vinum.html#vinum-synopsis>`__
`23.2. Ihre Platten sind zu klein. <vinum-intro.html>`__
`23.3. M?gliche Engp?sse <vinum-access-bottlenecks.html>`__
`23.4. Datenintegrit?t <vinum-data-integrity.html>`__
`23.5. Vinum-Objekte <vinum-objects.html>`__
`23.6. Einige Beispiele <vinum-examples.html>`__
`23.7. Objektbenennung <vinum-object-naming.html>`__
`23.8. Vinum konfigurieren <vinum-config.html>`__
`23.9. Vinum f?r das Root-Dateisystem benutzen <vinum-root.html>`__

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

23.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Egal, ?ber welche und wieviele Festplatten Ihr System auch verf?gt,
immer wieder werden Sie mit den folgenden Problemen konfrontiert:

.. raw:: html

   <div class="itemizedlist">

-  Ihre Platten sind zu klein.

-  Sie sind zu langsam.

-  Ihre Platten sind unzuverl?ssig.

.. raw:: html

   </div>

Um derartige Probleme zu l?sen, wurden verschiedene Methoden entwickelt.
Eine M?glichkeit bietet der Einsatz von mehreren, manchmal auch
redundant ausgelegten Platten. Zus?tzlich zur Unterst?tzung
verschiedener Erweiterungskarten und Controller f?r
Hardware-RAID-Systeme enth?lt das FreeBSD-Basissystem auch den Vinum
Volume Manager, einen Blockger?tetreiber, der die Einrichtung virtueller
Platten unterst?tzt. Bei *Vinum* handelt es sich um einen sogenannten
*Volume Manager*, einen virtuellen Plattentreiber, der obige drei
Probleme l?st. Vinum bietet Ihnen gr??ere Flexibilit?t, Leistung und
Zuverl?ssigkeit als die klassische Datenspeicherung auf einzelne
Festplatten. Dazu unterst?tzt Vinum RAID-0, RAID-1 und RAID-5 (sowohl
einzeln als auch in Kombination).

Dieses Kapitel bietet Ihnen einen ?berblick ?ber potentielle Probleme
der klassischen Datenspeicherung auf Festplatten sowie eine Einf?hrung
in den Vinum Volume Manager.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

F?r FreeBSD?5.X wurde Vinum ?berarbeitet und an die GEOM-Architektur
(`Kapitel?20, *GEOM: Modulares Framework zur
Plattentransformation* <GEOM.html>`__) angepasst, wobei die
urspr?nglichen Ideeen und Begriffe sowie die auf der Platte ben?tigten
Metadaten beibehalten wurden. Die ?berarbeitete Version wird als
*gvinum* (f?r *GEOM-Vinum*) bezeichnet. Die folgenden Ausf?hrungen
verwenden den Begriff *Vinum* als abstrakten Namen, unabh?ngig davon,
welche Variante implementiert wurde. S?mtliche Befehlsaufrufe erfolgen
?ber ``gvinum``, welches nun das Kernelmodul ``geom_vinum.ko`` (statt
``vinum.ko``) ben?tigt. Analog finden sich alle Ger?tedateien nun unter
``/dev/gvinum`` statt unter ``/dev/vinum``. Seit FreeBSD?6.x ist die
alte Vinum-Implementierung nicht mehr im Basissystem enthalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------------------------+--------------------------------------+
| `Zur?ck <filesystems-linux.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <vinum-intro.html>`__     |
+----------------------------------------+----------------------------------------------+--------------------------------------+
| 22.2. Linux? Dateisysteme?             | `Zum Anfang <index.html>`__                  | ?23.2. Ihre Platten sind zu klein.   |
+----------------------------------------+----------------------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
