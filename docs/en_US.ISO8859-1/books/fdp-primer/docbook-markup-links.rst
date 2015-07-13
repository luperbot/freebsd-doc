==========
9.8.?Links
==========

.. raw:: html

   <div class="navheader">

9.8.?Links
`Prev <docbook-markup-images.html>`__?
Chapter?9.?DocBook Markup
?\ `Next <stylesheets.html>`__

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

9.8.?Links
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Links are also in-line elements.

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

9.8.1.?\ ``xml:id`` Attributes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most DocBook elements accept an ``xml:id`` attribute to give that part
of the document a unique name. The ``xml:id`` can be used as a target
for a crossreference or link.

Any portion of the document that will be a link target must have an
``xml:id`` attribute. Assigning an ``xml:id`` to all chapters and
sections, even if there are no current plans to link to them, is a good
idea. These ``xml:id``\ s can be used as unique anchor reference points
by anyone referring to the HTML version of the document.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.34.?\ ``xml:id`` on Chapters and Sections

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <chapter xml:id="introduction">
      <title>Introduction</title>

      <para>This is the introduction.  It contains a subsection,
        which is identified as well.</para>

      <sect1 xml:id="introduction-moredetails">
        <title>More Details</title>

        <para>This is a subsection.</para>
      </sect1>
    </chapter>

.. raw:: html

   </div>

.. raw:: html

   </div>

Use descriptive values for ``xml:id`` names. The values must be unique
within the entire document, not just in a single file. In the example,
the subsection ``xml:id`` is constructed by appending text to the
chapter ``xml:id``. This ensures that the ``xml:id``\ s are unique. It
also helps both reader and anyone editing the document to see where the
link is located within the document, similar to a directory path to a
file.

To allow the user to jump into a specific portion of the document, even
in the middle of a paragraph or an example, use ``anchor``. This element
has no content, but takes an ``xml:id`` attribute.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.35.?\ ``anchor``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <para>This paragraph has an embedded
      <anchor xml:id="para1"/>link target in it.  It will not
      show up in the document.</para>

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

9.8.2.?Crossreferences with ``xref``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xref`` provides the reader with a link to jump to another section of
the document. The target ``xml:id`` is specified in the ``linkend``
attribute, and ``xref`` generates the link text automatically.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.36.?Using ``xref``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Assume that this fragment appears somewhere in a document that includes
the ``xml:id`` example shown above:

.. code:: programlisting

    <para>More information can be found
      in <xref linkend="introduction"/>.</para>

    <para>More specific information can be found
      in <xref linkend="introduction-moredetails"/>.</para>

The link text will be generated automatically, looking like
(*emphasized* text indicates the link text):

.. raw:: html

   <div class="blockquote">

    More information can be found in *Chapter 1, Introduction*.

    More specific information can be found in *Section 1.1, “More
    Details”*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The link text is generated automatically from the chapter and section
number and ``title`` elements.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``xref`` cannot link to an ``xml:id`` attribute on an ``anchor``
element. The ``anchor`` has no content, so the ``xref`` cannot generate
the link text.

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

9.8.3.?Linking to the Same Document or Other Documents on the Web
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The link elements described here allow the writer to define the link
text. It is very important to use descriptive link text to give the
reader an idea of where the link will take them. Remember that DocBook
can be rendered to multiple types of media. The reader may be looking at
a printed book or other form of media where there are no links. If the
link text is not descriptive enough, the reader may not be able to
locate the linked section.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.8.3.1.?Links to the Same Document
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``link`` is used to create a link within the same document. The target
``xml:id`` is specified in the ``linkend`` attribute. This element wraps
content, which is used for the link text.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.37.?Using ``link``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Assume that this fragment appears somewhere in a document that includes
the ``xml:id`` example.

.. code:: programlisting

    <para>More information can be found in the
      <link linkend="introduction">sample introduction</link>.</para>

    <para>More specific information can be found in the
      <link linkend="introduction-moredetails">sample introduction with more
        details</link> section.</para>

This output will be generated (*emphasized* text is used to show the
link text):

.. raw:: html

   <div class="blockquote">

    More information can be found in the *sample introduction*.

    More specific information can be found in the *sample introduction
    with more details* section.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``link`` can be used to include links to the ``xml:id`` of an ``anchor``
element, since the ``link`` content defines the link text.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.8.3.2.?Linking to Other Documents on the Web
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``ulink`` is used to link to external documents on the web. The
``url`` attribute is the URL of the page that the link points to, and
the content of the element is the text that will be displayed for the
user to activate.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.38.?\ ``link`` to a FreeBSD Documentation Web Page

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Link to the book or article URL entity. To link to a specific chapter in
a book, add a slash and the chapter file name, followed by an optional
anchor within the chapter. For articles, link to the article URL entity,
followed by an optional anchor within the article. URL entities can be
found in ``doc/share/xml/urls.ent``.

Usage for book links:

.. code:: programlisting

    <para>Read the <link
        xlink:href="&url.books.handbook;/svn.html#svn-intro">SVN
        introduction</link>, then pick the nearest mirror from
      the list of <link
        xlink:href="&url.books.handbook;/svn.html#svn-mirrors">Subversion
        mirror sites</link>.</para>

Appearance:

Read the `SVN
introduction <../../../../doc/en_US.ISO8859-1/books/handbook/svn.html#svn-intro>`__,
then pick the nearest mirror from the list of `Subversion mirror
sites <../../../../doc/en_US.ISO8859-1/books/handbook/svn.html#svn-mirrors>`__.

Usage for article links:

.. code:: programlisting

    <para>Read this
      <link xlink:href="&url.articles.bsdl-gpl;">article
        about the BSD license</link>, or just the
      <link xlink:href="&url.articles.bsdl-gpl;#intro">introduction</link>.</para>

Appearance:

Read this `article about the BSD
license <../../../../doc/en_US.ISO8859-1/articles/bsdl-gpl>`__, or just
the
`introduction <../../../../doc/en_US.ISO8859-1/articles/bsdl-gpl#intro>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.39.?\ ``link`` to a FreeBSD Web Page

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>Of course, you could stop reading this document and go to the
      <link xlink:href="&url.base;/index.html">FreeBSD home page</link> instead.</para>

Appearance:

Of course, you could stop reading this document and go to the `FreeBSD
home page <../../../../index.html>`__ instead.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.40.?\ ``ulink`` to an External Web Page

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>Wikipedia has an excellent reference on
      <link
        xlink:href="http://en.wikipedia.org/wiki/GUID_Partition_Table">GUID
        Partition Tables</link>.</para>

Appearance:

Wikipedia has an excellent reference on `GUID Partition
Tables <http://en.wikipedia.org/wiki/GUID_Partition_Table>`__.

The link text can be omitted to show the actual URL:

.. code:: programlisting

    <para>Wikipedia has an excellent reference on
      GUID Partition Tables: <link
        xlink:href="http://en.wikipedia.org/wiki/GUID_Partition_Table"></link>.</para>

Appearance:

Wikipedia has an excellent reference on GUID Partition Tables:
``http://en.wikipedia.org/wiki/GUID_Partition_Table``.

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

   <div class="navfooter">

--------------

+------------------------------------------+--------------------------------+----------------------------------+
| `Prev <docbook-markup-images.html>`__?   | `Up <docbook-markup.html>`__   | ?\ `Next <stylesheets.html>`__   |
+------------------------------------------+--------------------------------+----------------------------------+
| 9.7.?Images?                             | `Home <index.html>`__          | ?Chapter?10.?Style Sheets        |
+------------------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
