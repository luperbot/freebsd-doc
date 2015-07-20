===============================================
Kapitel 3. FreeBSD?9.x (und neuer) installieren
===============================================

.. raw:: html

   <div class="navheader">

Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
`Zur?ck <install-diff-media.html>`__?
Teil?I.?Erste Schritte
?\ `Weiter <bsdinstall-hardware.html>`__

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

Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Restructured, reorganized, and parts rewritten by Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

The sysinstall walkthrough, screenshots, and general copy by Randy
Pratt.

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated for bsdinstall by Gavin Atkinson und Warren Block.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling.

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

`3.1. ?bersicht <bsdinstall.html#bsdinstall-synopsis>`__
`3.2. Hardware-Anforderungen <bsdinstall-hardware.html>`__
`3.3. Vor der Installation <bsdinstall-pre.html>`__
`3.4. Die Installation starten <bsdinstall-start.html>`__
`3.5. Das bsdinstall-Werkzeug <using-bsdinstall.html>`__
`3.6. Installation aus dem Netzwerk <bsdinstall-netinstall.html>`__
`3.7. Plattenplatz bereitstellen <bsdinstall-partitioning.html>`__
`3.8. Die Installation festschreiben <bsdinstall-final-warning.html>`__
`3.9. Arbeiten nach der Installation <bsdinstall-post.html>`__
`3.10. Fehlerbehebung <bsdinstall-install-trouble.html>`__

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

3.1. ?bersicht
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD enth?lt ein text-basiertes, einfach zu verwendendes
Installationsprogramm. FreeBSD?9.0-RELEASE und neuer verwendet ein
Installationsprogramm genannt bsdinstall, w?hrend Versionen vor
FreeBSD?9.0-RELEASE stattdessen sysinstall zur Installation einsetzten.
Dieses Kapitel beschreibt die Verwendung von bsdinstall. Der Einsatz von
sysinstall wird in `Kapitel?2, *FreeBSD?8.\ *``X``* (und ?lter)
installieren* <install.html>`__ behandelt.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie wissen:

.. raw:: html

   <div class="itemizedlist">

-  wie man FreeBSD Installationsmedien erstellt.

-  wie FreeBSD Festplatten unterteilt und darauf verweist.

-  wie man bsdinstall startet.

-  welche Fragen Sie von bsdinstall gestellt bekommen, was sie bedeuten
   und und wie man diese beantwortet.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  Die Liste von unterst?tzter Hardware lesen, die mit Ihrer zu
   installierenden Version von FreeBSD ausgeliefert wird, um
   sicherzustellen, dass Ihre Hardware auch unterst?tzt wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Generell wurden diese Installationsanweisungen f?r Rechner der i386™
(„PC-kompatibel“) Architektur verfasst. An Stellen, an denen sich die
Anweisungen speziell auf eine andere Plattform beziehen, wird darauf
hingewiesen. Es mag kleinere Unterschiede geben zwischen dem
Installationsprogramm und dem, was hier beschrieben steht. Sie sollten
daher dieses Kapitel als eine Art Wegweiser und keine exakte Anleitung
betrachten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+----------------------------------------+--------------------------------------------+
| `Zur?ck <install-diff-media.html>`__?          | `Nach oben <getting-started.html>`__   | ?\ `Weiter <bsdinstall-hardware.html>`__   |
+------------------------------------------------+----------------------------------------+--------------------------------------------+
| 2.13. Eigene Installationsmedien herstellen?   | `Zum Anfang <index.html>`__            | ?3.2. Hardware-Anforderungen               |
+------------------------------------------------+----------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
