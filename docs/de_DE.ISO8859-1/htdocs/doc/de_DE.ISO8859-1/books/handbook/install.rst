===============================================
Kapitel 2. FreeBSD?8.X (und ?lter) installieren
===============================================

.. raw:: html

   <div class="navheader">

Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
`Zur?ck <history.html>`__?
Teil?I.?Erste Schritte
?\ `Weiter <install-hardware.html>`__

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

Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?berarbeitet und teilweise neu geschrieben von Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Der Gang durch sysinstall und alle Bildschirmabz?ge von Randy Pratt.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Martin Heinen und Johann Kois.

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

`2.1. ?bersicht <install.html#install-synopsis>`__
`2.2. Hardware-Anforderungen <install-hardware.html>`__
`2.3. Vor der Installation <install-pre.html>`__
`2.4. Die Installation starten <install-start.html>`__
`2.5. Das Werkzeug sysinstall <using-sysinstall.html>`__
`2.6. Plattenplatz f?r FreeBSD bereitstellen <install-steps.html>`__
`2.7. Den Installationsumfang bestimmen <install-choosing.html>`__
`2.8. Das Installationsmedium ausw?hlen <install-media.html>`__
`2.9. Die Installation festschreiben <install-final-warning.html>`__
`2.10. Arbeiten nach der Installation <install-post.html>`__
`2.11. Fehlersuche <install-trouble.html>`__
`2.12. Anspruchsvollere Installationen <install-advanced.html>`__
`2.13. Eigene Installationsmedien
herstellen <install-diff-media.html>`__

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

2.1. ?bersicht
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD wird mit dem textorientierten und einfach zu benutzendem
Installationsprogramm installiert. Beginnend mit FreeBSD?9.0-RELEASE
handelt es sich dabei um das Programm bsdinstall. ?ltere
FreeBSD-Versionen verwenden hingegen nach wie vor sysinstall f?r die
Installation. Dieses Kapitel beschreibt die Installation von FreeBSD
?ber sysinstall. Der Einsatz von bsdinstall wird hingegen in `Kapitel?3,
*FreeBSD?9.\ *``x``* (und neuer) installieren* <bsdinstall.html>`__
besprochen.

Dieses Kapitel behandelt folgende Punkte:

.. raw:: html

   <div class="itemizedlist">

-  Das Erzeugen von FreeBSD-Startdisketten.

-  Wie FreeBSD Platten anspricht und aufteilt.

-  Wie sysinstall ausgef?hrt wird.

-  Die Men?s von sysinstall und die erforderlichen Eingaben in den
   Men?s.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  Die Hardware-Notes der FreeBSD-Release, die Sie installieren wollen,
   lesen und sicherstellen, dass Ihre Hardware unterst?tzt wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Diese Installationsanleitung gilt f?r Rechner mit i386™-Architektur
(PC-kompatible Rechner). Abweichende Anweisungen f?r andere Plattformen
werden, falls notwendig, gegeben. Obwohl diese Anleitung so aktuell wie
m?glich ist, kann das Installationsverfahren von dem hier gezeigten
geringf?gig abweichen. Legen Sie bitte daher diese Anleitung nicht
wortw?rtlich aus, sondern lassen Sie sich von diesem Kapitel durch den
Installationsprozess leiten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+----------------------------------------+-----------------------------------------+
| `Zur?ck <history.html>`__?       | `Nach oben <getting-started.html>`__   | ?\ `Weiter <install-hardware.html>`__   |
+----------------------------------+----------------------------------------+-----------------------------------------+
| 1.3. ?ber das FreeBSD Projekt?   | `Zum Anfang <index.html>`__            | ?2.2. Hardware-Anforderungen            |
+----------------------------------+----------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
