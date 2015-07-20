========================
Kapitel 2. Die Werkzeuge
========================

.. raw:: html

   <div class="navheader">

Kapitel 2. Die Werkzeuge
`Zur?ck <overview-quick-start.html>`__?
?
?\ `Weiter <tools-optional.html>`__

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

`2.1. Verpflichtende Werkzeuge <tools.html#tools-required>`__
`2.2. Optionale Werkzeuge <tools-optional.html>`__

.. raw:: html

   </div>

Um die FreeBSD-Dokumentation zu verwalten und in verschiedene Formate zu
konvertieren, werden diverse Werkzeuge verwendet. Einige dieser
Werkzeuge sind verpflichtend und m?ssen auf Ihrem System installiert
sein, bevor Sie den Beispielen in den folgenden Kapiteln folgen k?nnen.
Andere sind hingegen optional und dienen dazu, zus?tzliche
Funktionalit?t bereitzustellen oder das Erzeugen der Dokumentation zu
vereinfachen.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1. Verpflichtende Werkzeuge
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installieren Sie zuerst den Port ``textproc/docproj`` ?ber die
Ports-Sammlung. Dieser *Metaport* installiert alle verpflichtenden
Werkzeuge f?r die Arbeit an der FreeBSD-Dokumentation. Einige dieser
Komponenten werden in den folgenden Abschnitten n?her beschrieben.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.1. Die DTDs und die Entit?ten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das FDP benutzt verschiedene *Document Type Definitions* (DTDs) und
diverse XML-Entit?tens?tze. Diese werden durch den Port
``textproc/docproj`` automatisch installiert.

.. raw:: html

   <div class="variablelist">

XHTML DTD (``textproc/xhtml``)
    XHTML ist die meistverwendete Auszeichnungssprache des World Wide
    Web und wird durchg?ngig f?r die FreeBSD-Webseite genutzt.

DocBook DTD (``textproc/docbook-xml-450``)
    DocBook ist als Auszeichnungssprache f?r technische Dokumentationen
    entwickelt worden. Ein Gro?teil der FreeBSD-Dokumentation wird
    mittels DocBook erstellt.

ISO 8879 entities (``textproc/iso8879``)
    Enties des ISO 8879:1986-Standards, die von vielen DTDs ben?tigt
    werden. Darin enthalten sind mathematische Symbole, zus?tzliche
    Zeichen, die f?r auf dem lateinischen beruhende Alphabete ben?tigt
    werden sowie griechische Zeichen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <overview-quick-start.html>`__?   | ?                             | ?\ `Weiter <tools-optional.html>`__   |
+-------------------------------------------+-------------------------------+---------------------------------------+
| 1.2. Schnellstart?                        | `Zum Anfang <index.html>`__   | ?2.2. Optionale Werkzeuge             |
+-------------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
