========================
Hintergrundwissen zu BSD
========================

.. raw:: html

   <div class="navheader">

Hintergrundwissen zu BSD
?
?
?\ `Weiter <what-a-real-unix.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Greg Lehey
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<grog@FreeBSD.org>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

In der Open Source-Welt steht das Wort „Linux“ oft synonym f?r
„Betriebssystem“, obwohl es nicht das einzige frei verf?gbare
Betriebssystem ist. Laut `Internet Operating System
Counter <http://www.leb.net/hzo/ioscount/data/r.9904.txt>`__ liefen im
April?1999 weltweit 31,3?Prozent der vernetzten Rechner unter Linux,
14,6?Prozent liefen hingegen unter BSD?UNIX?. Einige der weltweit
gr??ten Internetdienstleister, darunter
`Yahoo! <http://www.yahoo.com/>`__, verwenden BSD. Der im Jahre 1999
weltgr??te FTP-Server `ftp.cdrom.com <ftp://ftp.cdrom.com/>`__
(inzwischen abgeschaltet) verwendete BSD, um t?glich 1,4?Terabyte an
Daten zu ?bertragen. Hier geht es offensichtlich nicht um einen
Nischenmarkt, BSD ist vielmehr ein gut geh?tetes Geheimnis.

Worin besteht nun dieses Geheimnis? Warum ist BSD nicht bekannter?
Dieser Artikel versucht, diese und andere Fragen zu beantworten.

Unterschiede zwischen BSD und Linux werden in diesem Artikel *kursiv*
dargestellt.

*?bersetzt von Fabio Tosques*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ einzelne Abschnitte / `komplettes Dokument <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Was ist BSD? <index.html#what-is-bsd>`__
`2. Ein echtes UNIX?? <what-a-real-unix.html>`__
`3. Warum ist BSD nicht bekannter? <why-is-bsd-not-better-known.html>`__
`4. Ein Vergleich zwischen BSD und
Linux <comparing-bsd-and-linux.html>`__

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

1. Was ist BSD?
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD steht f?r „Berkeley Software Distribution“, also f?r die Verbreitung
des Quellcodes der University of California, Berkeley, und war
urspr?nglich als Erweiterung f?r ein von AT&T's Research entwickeltes
UNIX? Betriebssystem gedacht. Verschiedene Open?Source-Projekte beruhen
auf dieser, als 4.4BSD-Lite bekannten Quellcodeausgabe. In dieser
Ausgabe sind auch Softwarepakete anderer Open Source-Projekte,
insbesondere jene des GNU-Projekts, enthalten. Das komplette
Betriebssystem umfasst:

.. raw:: html

   <div class="itemizedlist">

-  Den BSD-Kernel, der sich um Prozessscheduling, Speichermanagement,
   die Unterst?tzung mehrerer Prozessoren (*symmetric multi-processing*,
   SMP), Ger?tetreiber und anderes mehr k?mmert.

   *Im Gegensatz zum Linux-Kernel gibt es verschiedene BSD-Kernel mit
   unterschiedlichen F?higkeiten*.

-  Die C-Bibliothek, die grundlegende API des Systems.

   *Die C-Bibliothek von BSD basiert auf Berkeley-Code und nicht auf
   Code des GNU-Projekts*.

-  N?tzliche Programme wie Shells, Programme f?r Dateioperationen,
   Compiler und Linker.

   *Einige Programme stammen aus dem GNU-Projekt, andere hingegen
   nicht*.

-  Das X?Window-System f?r die grafische Benutzeroberfl?che.

   Bei den meisten BSD-Versionen wird das X?Window-System eingesetzt und
   zwar die Version des `X.org <http://www.X.org/>`__-Projekts. FreeBSD
   erlaubt es dem Benutzer, aus einer grossen Anzahl an
   Desktop-Umgebungen zu w?hlen, wie beispielsweise Gnome, KDE oder
   Xfce. Ebenso gibt es leichtgewichtige Window-Manager wie Openbox,
   Fluxbox oder Awesome.

-  Viele weitere Programme und Werkzeuge.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------------+
| ?   | ?   | ?\ `Weiter <what-a-real-unix.html>`__   |
+-----+-----+-----------------------------------------+
| ?   | ?   | ?2. Ein echtes UNIX??                   |
+-----+-----+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
