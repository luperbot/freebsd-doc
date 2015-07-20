===================
Anhang A. Beispiele
===================

.. raw:: html

   <div class="navheader">

Anhang A. Beispiele
`Zur?ck <see-also-linuxdoc.html>`__?
?
?\ `Weiter <examples-docbook-article.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="appendix">

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

`A.1. DocBook-Buch (``book``) <examples.html#examples-docbook-book>`__
`A.2. DocBook-Artikel (``article``) <examples-docbook-article.html>`__
`A.3. Ausgabeformate erzeugen <examples-formatted.html>`__

.. raw:: html

   </div>

In diesem Anhang sind XML-Beispieldokumente und Befehle enthalten, die
zeigen, wie man aus DocBook-Dokumenten verschiedene Ausgabeformate
erzeugen kann. Sofern alle Werkzeuge f?r das Dokumentationsprojekt
ordnungsgem?? installiert wurden, k?nnen die angebotenen Beispiele
direkt ?bernommen werden.

Die Beispiele dieses Abschnitts sind bewusst einfach aufgebaut. Daher
fehlen in den Beispielen einige Elemente, insbesondere Elemente f?r die
Titelei. Weitere DocBook-Beispiele k?nnen in den DocBook-Quellen dieses
und anderer Dokumente des FDPs gefunden werden. Die Quellen des FDPs
sind im svn doc-Repository und online unter
``http://svnweb.FreeBSD.org/doc/`` verf?gbar.

Um Irritationen zu vermeiden, bauen die XML-Beispiele auf der 4.1er
Standard-DocBook DTD anstatt auf der erweiterten FreeBSD-Variante auf.
Ebenso werden die Standardstylesheets von Norman Welsh, anstatt der
angepassten Stylesheets des FreeBSD-Dokumentationsprojektes benutzt.
Dadurch eignen sich die Beispiele auch als generische DocBook-Vorlagen.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.1. DocBook-Buch (``book``)
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel A.1. Ein DocBook-Buch (``book``)

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook V4.1//EN">

    <book lang='de'>
      <bookinfo>
        <title>Ein Buchbeispiel</title>

        <author>
          <firstname>Vorname</firstname>
          <surname>Nachname</surname>
          <affiliation>
            <address><email>vorname.nachname@domain.de</email></address>
          </affiliation>
        </author>

        <copyright>
          <year>2000</year>
          <holder>Urheberhinweis</holder>
        </copyright>

        <abstract>
          <para>Falls das Buch eine Zusammenfassung hat, sollte sie
            hier stehen.</para>
        </abstract>
      </bookinfo>

      <preface>
        <title>Einleitung</title>

        <para>Falls das Buch eine Einleitung hat, sollte diese hier
          stehen.</para>
      </preface>

      <chapter>
        <title>Das erste Kapitel</title>

        <para>Das ist das erste Kapitel des Buches.</para>

        <sect1>
          <title>Der erste Abschnitt</title>

          <para>Das ist der erste Abschnitte des Buches.</para>
        </sect1>
      </chapter>
    </book>

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

+------------------------------------------+-------------------------------+-------------------------------------------------+
| `Zur?ck <see-also-linuxdoc.html>`__?     | ?                             | ?\ `Weiter <examples-docbook-article.html>`__   |
+------------------------------------------+-------------------------------+-------------------------------------------------+
| 14.5. Das Linux-Dokumentationsprojekt?   | `Zum Anfang <index.html>`__   | ?A.2. DocBook-Artikel (``article``)             |
+------------------------------------------+-------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
