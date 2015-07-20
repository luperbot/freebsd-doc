=========================================
Einen eigenen FreeBSD Update Server bauen
=========================================

.. raw:: html

   <div class="navheader">

Einen eigenen FreeBSD Update Server bauen
?
?
?\ `Weiter <introduction.html>`__

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Jason Helfman
~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

Jason?Helfman

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

Copyright ? 2009-2011, 2013 Jason Helfman

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

Dieser Artikel beschreibt den Bau eines internen FreeBSD Update Server.
Die
`freebsd-update-server <http://svnweb.freebsd.org/base/user/cperciva/freebsd-update-build/>`__
Software wurde von Colin Percival, emeritierter Security Officer von
FreeBSD, geschrieben. Benutzer, die es als vorteilhaft ansehen ihre
Systeme ?ber einen offiziellen Update-Server zu aktualisieren, k?nnen
mit Hilfe eines selbst erstellten FreeBSD Update Server die
Funktionalit?t ?ber manuell optimierte FreeBSD Releases oder ?ber
Bereitstellung eines lokalen Mirror, welcher schnellere Updates
erm?glicht, erweitern.

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

`1. Danksagung <index.html#acknowledgments>`__
`2. Einf?hrung <introduction.html>`__
`3. Voraussetzungen <prerequisites.html>`__
`4. Konfiguration: Installation & Setup <Configuration.html>`__
`5. Den Update Code bauen <build.html>`__
`6. Eine Fehlerkorrektur erstellen <patch.html>`__
`7. Tipps <tips.html>`__

.. raw:: html

   </div>

*?bersetzt von Bj?rn Heidotting*.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1. Danksagung
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Artikel wurde anschlie?end im `BSD
Magazine <http://bsdmag.org/magazine/1021-bsd-as-a-desktop>`__ gedruckt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------------+
| ?   | ?   | ?\ `Weiter <introduction.html>`__   |
+-----+-----+-------------------------------------+
| ?   | ?   | ?2. Einf?hrung                      |
+-----+-----+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
