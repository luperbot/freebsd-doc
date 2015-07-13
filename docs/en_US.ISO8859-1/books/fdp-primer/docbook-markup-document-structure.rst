=======================
9.4.?Document Structure
=======================

.. raw:: html

   <div class="navheader">

9.4.?Document Structure
`Prev <docbook-markup-fpi.html>`__?
Chapter?9.?DocBook Markup
?\ `Next <docbook-markup-block-elements.html>`__

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

9.4.?Document Structure
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DocBook allows structuring documentation in several ways. The FreeBSD
Documentation Project uses two primary types of DocBook document: the
book and the article.

Books are organized into ``chapter``\ s. This is a mandatory
requirement. There may be ``part``\ s between the book and the chapter
to provide another layer of organization. For example, the Handbook is
arranged in this way.

A chapter may (or may not) contain one or more sections. These are
indicated with the ``sect1`` element. If a section contains another
section then use the ``sect2`` element, and so on, up to ``sect5``.

Chapters and sections contain the remainder of the content.

An article is simpler than a book, and does not use chapters. Instead,
the content of an article is organized into one or more sections, using
the same ``sect1`` (and ``sect2`` and so on) elements that are used in
books.

The nature of the document being written should be used to determine
whether it is best marked up as a book or an article. Articles are well
suited to information that does not need to be broken down into several
chapters, and that is, relatively speaking, quite short, at up to 20-25
pages of content. Books are best suited to information that can be
broken up into several chapters, possibly with appendices and similar
content as well.

The `FreeBSD tutorials <../../../../docs.html>`__ are all marked up as
articles, while this document, the
`FAQ <../../../../doc/en_US.ISO8859-1/books/faq/index.html>`__, and the
`Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/index.html>`__
are all marked up as books, for example.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.4.1.?Starting a Book
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The content of a book is contained within the ``book`` element. As well
as containing structural markup, this element can contain elements that
include additional information about the book. This is either
meta-information, used for reference purposes, or additional content
used to produce a title page.

This additional information is contained within ``info``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.1.?Boilerplate ``book`` with ``info``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <book>
      <info>
        <title>Your Title Here</title>

        <author>
          <personname>
            <firstname>Your first name</firstname>
            <surname>Your surname</surname>
          </personname>

          <affiliation>
        <address>
              <email>Your email address</email>
        </address>
          </affiliation>
        </author>

        <copyright>
          <year>1998</year>
          <holder role="mailto:your email address">Your name</holder>
        </copyright>

        <releaseinfo>$FreeBSD$</releaseinfo>

        <abstract>
          <para>Include an abstract of the book's contents here.</para>
        </abstract>
      </info>

      …

    </book>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.4.2.?Starting an Article
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The content of the article is contained within the ``article`` element.
As well as containing structural markup, this element can contain
elements that include additional information about the article. This is
either meta-information, used for reference purposes, or additional
content used to produce a title page.

This additional information is contained within ``info``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.2.?Boilerplate ``article`` with ``info``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <article>
      <info>
        <title>Your title here</title>

        <author>
          <personname>
        <firstname>Your first name</firstname>
        <surname>Your surname</surname>
          </personname>

          <affiliation>
        <address>
          <email>Your email address</email></address>
        </address>
          </affiliation>
        </author>

        <copyright>
          <year>1998</year>
          <holder role="mailto:your email address">Your name</holder>
        </copyright>

        <releaseinfo>$FreeBSD$</releaseinfo>

        <abstract>
          <para>Include an abstract of the article's contents here.</para>
        </abstract>
      </info>

      …

    </article>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.4.3.?Indicating Chapters
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Use ``chapter`` to mark up your chapters. Each chapter has a mandatory
``title``. Articles do not contain chapters, they are reserved for
books.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.3.?A Simple Chapter

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <chapter>
      <title>The Chapter's Title</title>

      ...
    </chapter>

.. raw:: html

   </div>

.. raw:: html

   </div>

A chapter cannot be empty; it must contain elements in addition to
``title``. If you need to include an empty chapter then just use an
empty paragraph.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.4.?Empty Chapters

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <chapter>
      <title>This is An Empty Chapter</title>

      <para></para>
    </chapter>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.4.4.?Sections Below Chapters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In books, chapters may (but do not need to) be broken up into sections,
subsections, and so on. In articles, sections are the main structural
element, and each article must contain at least one section. Use the
``sectn`` element. The *``n``* indicates the section number, which
identifies the section level.

The first ``sectn`` is ``sect1``. You can have one or more of these in a
chapter. They can contain one or more ``sect2`` elements, and so on,
down to ``sect5``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.5.?Sections in Chapters

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <chapter>
      <title>A Sample Chapter</title>

      <para>Some text in the chapter.</para>

      <sect1>
        <title>First Section</title>

        …
      </sect1>

      <sect1>
        <title>Second Section</title>

        <sect2>
          <title>First Sub-Section</title>

          <sect3>
        <title>First Sub-Sub-Section</title>

        …
          </sect3>
        </sect2>

        <sect2>
          <title>Second Sub-Section (1.2.2)</title>

          …
        </sect2>
      </sect1>
    </chapter>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Section numbers are automatically generated and prepended to titles when
the document is rendered to an output format. The generated section
numbers and titles from the example above will be:

.. raw:: html

   <div class="itemizedlist" xmlns="http://www.w3.org/1999/xhtml">

-  1.1. First Section

-  1.2. Second Section

-  1.2.1. First Sub-Section

-  1.2.1.1. First Sub-Sub-Section

-  1.2.2. Second Sub-Section

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.4.5.?Subdividing Using ``part`` Elements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``part``\ s introduce another level of organization between ``book`` and
``chapter`` with one or more ``part``\ s. This cannot be done in an
``article``.

.. code:: programlisting

    <part>
      <title>Introduction</title>

      <chapter>
        <title>Overview</title>

        ...
      </chapter>

      <chapter>
        <title>What is FreeBSD?</title>

        ...
      </chapter>

      <chapter>
        <title>History</title>

        ...
      </chapter>
    </part>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+--------------------------------+----------------------------------------------------+
| `Prev <docbook-markup-fpi.html>`__?    | `Up <docbook-markup.html>`__   | ?\ `Next <docbook-markup-block-elements.html>`__   |
+----------------------------------------+--------------------------------+----------------------------------------------------+
| 9.3.?Formal Public Identifier (FPI)?   | `Home <index.html>`__          | ?9.5.?Block Elements                               |
+----------------------------------------+--------------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
