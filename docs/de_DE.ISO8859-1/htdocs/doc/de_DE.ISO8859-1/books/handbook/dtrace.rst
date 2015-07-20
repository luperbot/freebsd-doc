==================
Kapitel 27. DTrace
==================

.. raw:: html

   <div class="navheader">

Kapitel 27. DTrace
`Zur?ck <small-lan.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <dtrace-implementation.html>`__

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

Kapitel 27. DTrace
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling und Christoph Sold.

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

`27.1. ?berblick <dtrace.html#dtrace-synopsis>`__
`27.2. Unterschiede in der
Implementierung <dtrace-implementation.html>`__
`27.3. Die DTrace Unterst?tzung aktivieren <dtrace-enable.html>`__
`27.4. DTrace verwenden <dtrace-using.html>`__

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

27.1. ?berblick
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DTrace, auch bekannt als Dynamic Tracing, wurde von Sun™ als ein
Werkzeug zur Analyse von Performance-Problemen in Produktiv- und
Entwicklungssystemen entwickelt. Zus?tzlich zur Diagnose von
Performance-Problemen kann DTrace auch verwendet werden, um bei der
Untersuchung und Behebung von unerwartetem Verhalten im FreeBSD-Kernel
und den Anwenderprogrammen zu helfen.

DTrace ist ein bemerkenswertes Werkzeug zur Profilerstellung, mit einer
beeindruckenden Palette von Eigenschaften zur Diagnose von
Systemereignissen. Es kann auch dazu verwendet werden, bestehende
Skripte ablaufen zu lassen, um einen Nutzen aus deren M?glichkeiten zu
ziehen. Nutzer k?nnen mittels der Programmiersprache D von DTrace ihre
eigenen Hilfsmittel schreiben, was es erm?glicht, die eigenen Profile
nach Ihren Bed?rfnissen anzupassen.

Die DTrace-Implementierung in FreeBSD bietet experimentelle
Unterst?tzung f?r DTrace im Userland. Userland DTrace erlaubt es
Anwendern, function boundary tracing f?r Anwendungsprogramme ?ber den
``pid``-Provider hinweg vorzunehmen und um statische Sonden in
Anwendungsprogramme f?r die sp?tere Aufzeichnung einzuf?gen. Manche
Ports, wie beispielsweise
`databases/postgres-server <http://www.freebsd.org/cgi/url.cgi?ports/databases/postgres-server/pkg-descr>`__
und
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__
besitzen eine DTrace-Option, um statische Sonden zu aktivieren.
FreeBSD?10.0-RELEASE besitzt eine verh?ltnism?ssig gute Unterst?tzung
f?r DTrace im Anwendungsbereich, wird jedoch noch nicht als
produktionsreif angesehen. Insbesondere ist es m?glich, dass Programme
w?hrend der Aufzeichnung abst?rzen.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie Folgendes wissen:

.. raw:: html

   <div class="itemizedlist">

-  Was DTrace ist und welche Funktionen es zur Verf?gung stellt.

-  Unterschiede zwischen der Solaris™ DTrace Implementierung und
   derjenigen, die FreeBSD bereitstellt.

-  Wie man DTrace auf FreeBSD aktiviert und verwendet.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  UNIX? und FreeBSD Grundlagen verstehen (`Kapitel?4, *Grundlagen des
   UNIX Betriebssystems* <basics.html>`__).

-  Vertraut sein mit Sicherheitsaspekten und wie diese FreeBSD betreffen
   (`Kapitel?15, *Sicherheit* <security.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Diese Funktion ist als experimentell anzusehen. Manche Einstellungen
enthalten m?glicherweise nicht alle Funktionalit?ten, andere Teile
k?nnten gar nicht laufen. Mit der Zeit, wenn diese Funktion als f?r den
Produktivbetrieb geeignet erscheint, wird auch diese Dokumentation
ge?ndert, um diesem Umstand gerecht zu werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+----------------------------------------------+----------------------------------------------+
| `Zur?ck <small-lan.html>`__?             | `Nach oben <system-administration.html>`__   | ?\ `Weiter <dtrace-implementation.html>`__   |
+------------------------------------------+----------------------------------------------+----------------------------------------------+
| 26.9. Installation mehrerer Maschinen?   | `Zum Anfang <index.html>`__                  | ?27.2. Unterschiede in der Implementierung   |
+------------------------------------------+----------------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
