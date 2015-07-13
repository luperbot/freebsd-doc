===================
8.4.?Block Elements
===================

.. raw:: html

   <div class="navheader">

8.4.?Block Elements
`Prev <xhtml-markup-sectional-elements.html>`__?
Chapter?8.?XHTML Markup
?\ `Next <xhtml-markup-inline-elements.html>`__

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

8.4.?Block Elements
-------------------

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

8.4.1.?Headings
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XHTML has tags to denote headings in the document at up to six different
levels.

The largest and most prominent heading is ``h1``, then ``h2``,
continuing down to ``h6``.

The element's content is the text of the heading.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.2.?\ ``h1``, ``h2``, and Other Header Tags

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <h1>First section</h1>

    <!-- Document introduction goes here -->

    <h2>This is the heading for the first section</h2>

    <!-- Content for the first section goes here -->

    <h3>This is the heading for the first sub-section</h3>

    <!-- Content for the first sub-section goes here -->

    <h2>This is the heading for the second section</h2>

    <!-- Content for the second section goes here -->

.. raw:: html

   </div>

.. raw:: html

   </div>

Generally, an XHTML page should have one first level heading (``h1``).
This can contain many second level headings (``h2``), which can in turn
contain many third level headings. Do not leave gaps in the numbering.

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

8.4.2.?Paragraphs
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XHTML supports a single paragraph element, ``p``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.3.?\ ``p``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>This is a paragraph.  It can contain just about any
      other element.</p>

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

8.4.3.?Block Quotations
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A block quotation is an extended quotation from another document that
will appear in a separate paragraph.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.4.?\ ``blockquote``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>A small excerpt from the US Constitution:</p>

    <blockquote>We the People of the United States, in Order to form
      a more perfect Union, establish Justice, insure domestic
      Tranquility, provide for the common defence, promote the general
      Welfare, and secure the Blessings of Liberty to ourselves and our
      Posterity, do ordain and establish this Constitution for the
      United States of America.</blockquote>

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

8.4.4.?Lists
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XHTML can present the user with three types of lists: ordered,
unordered, and definition.

Entries in an ordered list will be numbered, while entries in an
unordered list will be preceded by bullet points. Definition lists have
two sections for each entry. The first section is the term being
defined, and the second section is the definition.

Ordered lists are indicated by the ``ol`` element, unordered lists by
the ``ul`` element, and definition lists by the ``dl`` element.

Ordered and unordered lists contain listitems, indicated by the ``li``
element. A listitem can contain textual content, or it may be further
wrapped in one or more ``p`` elements.

Definition lists contain definition terms (``dt``) and definition
descriptions (``dd``). A definition term can only contain inline
elements. A definition description can contain other block elements.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.5.?\ ``ul`` and ``ol``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>An unordered list.  Listitems will probably be
      preceded by bullets.</p>

    <ul>
      <li>First item</li>

      <li>Second item</li>

      <li>Third item</li>
    </ul>

    <p>An ordered list, with list items consisting of multiple
      paragraphs.  Each item (note: not each paragraph) will be
      numbered.</p>

    <ol>
      <li><p>This is the first item.  It only has one paragraph.</p></li>

      <li><p>This is the first paragraph of the second item.</p>

        <p>This is the second paragraph of the second item.</p></li>

      <li><p>This is the first and only paragraph of the third
        item.</p></li>
    </ol>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.6.?Definition Lists with ``dl``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <dl>
      <dt>Term 1</dt>

      <dd><p>Paragraph 1 of definition 1.</p>

        <p>Paragraph 2 of definition 1.</p></dd>

      <dt>Term 2</dt>

      <dd><p>Paragraph 1 of definition 2.</p></dd>

      <dt>Term 3</dt>

      <dd><p>Paragraph 1 of definition 3.</p></dd>
    </dl>

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

8.4.5.?Pre-formatted Text
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Pre-formatted text is shown to the user exactly as it is in the file.
Text is shown in a fixed font. Multiple spaces and line breaks are shown
exactly as they are in the file.

Wrap pre-formatted text in the ``pre`` element.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.7.?\ ``pre``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

For example, the ``pre`` tags could be used to mark up an email message:

.. code:: programlisting

    <pre>  From: nik@FreeBSD.org
      To: freebsd-doc@FreeBSD.org
      Subject: New documentation available

      There is a new copy of my primer for contributors to the FreeBSD
      Documentation Project available at

        &lt;URL:http://people.FreeBSD.org/~nik/primer/index.html&gt;

      Comments appreciated.

      N</pre>

Keep in mind that ``<`` and ``&`` still are recognized as special
characters in pre-formatted text. This is why the example shown had to
use ``&lt;`` instead of ``<``. For consistency, ``&gt;`` was used in
place of ``>``, too. Watch out for the special characters that may
appear in text copied from a plain-text source, like an email message or
program code.

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

8.4.6.?Tables
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mark up tabular information using the ``table`` element. A table
consists of one or more table rows (``tr``), each containing one or more
cells of table data (``td``). Each cell can contain other block
elements, such as paragraphs or lists. It can also contain another table
(this nesting can repeat indefinitely). If the cell only contains one
paragraph then the ``p``\ element is not needed.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.8.?Simple Use of ``table``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>This is a simple 2x2 table.</p>

    <table>
      <tr>
        <td>Top left cell</td>

        <td>Top right cell</td>
      </tr>

      <tr>
        <td>Bottom left cell</td>

        <td>Bottom right cell</td>
      </tr>
    </table>

.. raw:: html

   </div>

.. raw:: html

   </div>

A cell can span multiple rows and columns by adding the ``rowspan`` or
``colspan`` attributes with values for the number of rows or columns to
be spanned.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.9.?Using ``rowspan``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>One tall thin cell on the left, two short cells next to
      it on the right.</p>

    <table>
      <tr>
        <td rowspan="2">Long and thin</td>
      </tr>

      <tr>
        <td>Top cell</td>

        <td>Bottom cell</td>
      </tr>
    </table>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.10.?Using ``colspan``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>One long cell on top, two short cells below it.</p>

    <table>
      <tr>
        <td colspan="2">Top cell</td>
      </tr>

      <tr>
        <td>Bottom left cell</td>

        <td>Bottom right cell</td>
      </tr>
    </table>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.11.?Using ``rowspan`` and ``colspan`` Together

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>On a 3x3 grid, the top left block is a 2x2 set of
      cells merged into one.  The other cells are normal.</p>

    <table>
      <tr>
        <td colspan="2" rowspan="2">Top left large cell</td>

        <td>Top right cell</td>
      </tr>

      <tr>
        <!-- Because the large cell on the left merges into
             this row, the first <td> will occur on its
             right -->

        <td>Middle right cell</td>
      </tr>

      <tr>
        <td>Bottom left cell</td>

        <td>Bottom middle cell</td>

        <td>Bottom right cell</td>
      </tr>
    </table>

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

+----------------------------------------------------+------------------------------+---------------------------------------------------+
| `Prev <xhtml-markup-sectional-elements.html>`__?   | `Up <xhtml-markup.html>`__   | ?\ `Next <xhtml-markup-inline-elements.html>`__   |
+----------------------------------------------------+------------------------------+---------------------------------------------------+
| 8.3.?Sectional Elements?                           | `Home <index.html>`__        | ?8.5.?In-line Elements                            |
+----------------------------------------------------+------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
