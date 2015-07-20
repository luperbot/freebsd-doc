=====================
Einf?hrung in NanoBSD
=====================

.. raw:: html

   <div class="navheader">

Einf?hrung in NanoBSD
?
?
?\ `Weiter <howto.html>`__

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

Daniel Gerzo
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2006 The FreeBSD Documentation Project

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

Dieses Dokument stellt Informationen zu den NanoBSD Werkzeugen bereit,
die dazu verwendet werden k?nnen ein FreeBSD Abbild f?r eingebettete
Systeme zu erstellen, welche auf eine Compact Flash Karte passen (oder
andere Massenspeicher).

*?bersetzt von Bj?rn Heidotting*.

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

`1. Einf?hrung in NanoBSD <index.html#intro>`__
`2. NanoBSD Anleitung <howto.html>`__
`Stichwortverzeichnis <ix01.html>`__

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

1. Einf?hrung in NanoBSD
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NanoBSD ist ein Werkzeug welches derzeit von Poul-Henning Kamp
entwickelt wird. Es erstellt ein FreeBSD Systemabbild f?r eingebettete
Systeme, die auf eine Compact Flash Karte passen (oder andere
Massenspeicher).

Es kann dazu benutzt werden um spezialisierte Installationsabbilder zu
bauen, entworfen f?r die einfache Installation und Wartung von Systemen
die als "Computer Appliances" bekannt sind. Computer Appliances haben
ihre Hard- und Software fest verbaut, dass bedeutet alle Anwendungen
sind vorinstalliert. Die Appliance wird an ein bestehendes Netzwerk
angeschlossen und kann mit der Arbeit (fast) sofort beginnen.

Zu den Eigenschaften von NanoBSD geh?ren:

.. raw:: html

   <div class="itemizedlist">

-  Ports und Pakete funktionieren wie in FreeBSD — Jede einzelne
   Anwendung kann auf dem NanoBSD Abbild installiert und benutzt werden,
   auf die gleiche Weise wie Sie es aus FreeBSD gewohnt sind.

-  Keine fehlende Funktionalit?t — Wenn es m?glich ist, etwas mit
   FreeBSD zu tun, ist es auch m?glich, die gleiche Sache mit NanoBSD zu
   tun, es sei denn, eine oder mehrere Funktionen wurden ausdr?cklich
   vor dem Bau des NanoBSD Abbilds entfernt.

-  Zur Laufzeit ist alles read-only — Es ist sicher den Stromstecker zu
   ziehen. Es besteht dann keine Notwendigkeit, einen
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   nach einem nicht ordnungsgem??em Herunterfahren des Systems
   auszuf?hren.

-  Einfach zu bauen und anzupassen — Unter Verwendung von nur einem
   Shell-Skript und einer Konfigurationsdatei ist es m?glich, ein
   reduziertes und angepasstes Abbild zu bauen, welches jegliche Reihe
   von Anforderungen erf?llt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+------------------------------+
| ?   | ?   | ?\ `Weiter <howto.html>`__   |
+-----+-----+------------------------------+
| ?   | ?   | ?2. NanoBSD Anleitung        |
+-----+-----+------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
