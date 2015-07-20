========================================
4.3. Dokumentenspezifische Informationen
========================================

.. raw:: html

   <div class="navheader">

4.3. Dokumentenspezifische Informationen
`Zur?ck <structure-locale.html>`__?
Kapitel 4. Dokumentation-Verzeichnisstruktur
?\ `Weiter <doc-build.html>`__

--------------

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

4.3. Dokumentenspezifische Informationen
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt enth?lt Informationen zu einigen vom FreeBSD
Documentation Project (FDP) verwalteten Dokumenten.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1. Das Handbuch
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

``books/handbook/``
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Handbuch wurde unter Verwendung von DocBook XML (und der vom FreeBSD
Project erweiterten XML DocBook-DTD) geschrieben.

Das Handbuch ist als DocBook-\ ``book`` organisiert. Es besteht aus
mehreren Teilen (``part``\ s), die wiederum mehrere Kapitel
(``chapter``) enthalten k?nnen. Kapitel sind zus?tzlich in Abschnitte
(``sect1``) und Unterabschnitte (``sect2``, ``sect3`` und so weiter)
unterteilt.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1.1. Physikalische Organisation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Verzeichnis ``handbook`` enth?lt sowohl weitere Verzeichnisse als
auch zahlreiche einzelne Dateien.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Organisation des Handbuchs hat sich im Laufe der Zeit ge?ndert,
daher k?nnten die Informationen in diesem Abschnitt eventuell nicht mehr
dem akutellen Stand entsprechen. Haben Sie Fragen zur Organisation des
Handbuchs, so wenden Sie sich bitte an das `FreeBSD documentation
project <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1.1.1. ``Makefile``
'''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ``Makefile`` definiert verschiedene Variablen zur Konvertierung
derXML-Quellen in andere Formate. Au?erdem listet es die verschiedenen
Dateien auf, aus denen das Handbuch gebaut wird. Zus?tzlich wird die
Standard-\ ``doc.project.mk`` inkludiert, die den f?r die Konvertierung
in andere Formate notwendigen Code bereitstellt.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1.1.2. ``book.xml``
'''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Hauptdokument innerhalb des Handbuchs. Neben der
`DOCTYPE-Deklaration <xml-primer-doctype-declaration.html>`__ des
Handbuchs werden hier auch die Elemente aufgelistet, die die Struktur
des Handbuchs definieren.

``book.xml`` verwendet
`Parameterentit?ten <xml-primer-entities.html#xml-primer-parameter-entities>`__,
um Dateien mit der Endung ``.ent`` zu laden. Diese Dateien definieren
die `allgemeinen
Entit?ten <xml-primer-entities.html#xml-primer-general-entities>`__, die
innerhalb des Handbuchs verwendet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1.1.3. ``Verzeichnis``/chapter.xml
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jedes Kapitel des Handbuchs wird in einer ``chapter.xml`` genannten
Datei gespeichert. Jedes Verzeichnis erh?lt den Namen des
``id``-Attributs des ``chapter``-Elements.

Enth?lt eine Kapiteldatei beispielsweise die Eintr?ge

.. code:: programlisting

    <chapter id="kernelconfig">
    ...
    </chapter>

so handelt es sich um die Datei ``chapter.xml`` im Verzeichnis
``kernelconfig``. Im Allgemeinen enth?lt diese Datei das komplette
Kapitel.

Wird die XHTML-Version des Handbuchs gebaut, entsteht dadurch
``kernelconfig.html``. Der Grund daf?r ist allerdings der Wert des
``id``-Attributs, und nicht der Name des Verzeichnisses.

In fr?heren Versionen des Handbuchs wurden all diese Dateien im gleichen
Verzeichnis wie die Datei ``book.xml`` gespeichert und nach dem Wert des
``id``-Attributs der ``chapter``-Elemente benannt. Durch die Verwendung
von eigenen Verzeichnissen f?r die verschiedenen Kapitel wurde das
Handbuch f?r k?nftige Erweiterungen vorbereitet. Beispielsweise wurde es
dadurch m?glich, Bilder in die einzelnen Kapitel aufzunehmen. Die Bilder
f?r das Handbuch werden zentral im Verzeichnis
``share/images/books/handbook`` gespeichert. Existiert eine lokalisierte
Version eines Bildes, wird diese hingegen gemeinsam mit dem
XML-Quellcode im gleichen Verzeichnis gespeichert. Ein Vorteil dieser
Methode ist beispielsweise die Vermeidung von Namenskollisionen.
Au?erdem ist es ?bersichtlicher, mit mehreren Verzeichnissen zu
arbeiten, die jeweils nur einige Dateien enthalten, als mit einem
einzigen Verzeichnis, das eine Vielzahl von Dateien enth?lt.

Durch dieses Vorgehen entstanden viele Verzeichnisse, die jeweils eine
``chapter.xml`` enhalten, beispielsweise ``basics/chapter.xml``,
``introduction/chapter.xml`` oder ``printing/chapter.xml``.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Benennen Sie Kapitel und Verzeichnisse nicht nach Ihrer Reihenfolge
innerhalb des Handbuchs. Dann f?hrt eine Umstrukturierung des Handbuchs
im Normalfall nicht dazu, dass daf?r Dateien umbenannt werden m?ssen (es
sei denn, einzelne Kapitel werden neu aufgenommen oder entfernt).

.. raw:: html

   </div>

Die Datei ``chapter.xml`` ist keine komplette XML-Datei. Dies bedeutet,
dass sie nicht alleine gebaut werden kann, sondern nur als Teil des
Handbuchs.

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

+----------------------------------------------------------+----------------------------------+-----------------------------------------------+
| `Zur?ck <structure-locale.html>`__?                      | `Nach oben <structure.html>`__   | ?\ `Weiter <doc-build.html>`__                |
+----------------------------------------------------------+----------------------------------+-----------------------------------------------+
| 4.2. Die Verzeichnisse ``Sprache``.\ *``Kodierung``*/?   | `Zum Anfang <index.html>`__      | ?Kapitel 5. Die Erzeugung der Zieldokumente   |
+----------------------------------------------------------+----------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
