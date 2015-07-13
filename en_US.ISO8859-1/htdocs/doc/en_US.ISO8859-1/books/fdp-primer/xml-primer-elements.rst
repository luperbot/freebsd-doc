===================================
7.2.?Elements, Tags, and Attributes
===================================

.. raw:: html

   <div class="navheader">

7.2.?Elements, Tags, and Attributes
`Prev <xml-primer.html>`__?
Chapter?7.?XML Primer
?\ `Next <xml-primer-doctype-declaration.html>`__

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

7.2.?Elements, Tags, and Attributes
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All the vocabularies written in XML share certain characteristics. This
is hardly surprising, as the philosophy behind XML will inevitably show
through. One of the most obvious manifestations of this philosophy is
that of *content* and *elements*.

Documentation, whether it is a single web page, or a lengthy book, is
considered to consist of content. This content is then divided and
further subdivided into elements. The purpose of adding markup is to
name and identify the boundaries of these elements for further
processing.

For example, consider a typical book. At the very top level, the book is
itself an element. This “book” element obviously contains chapters,
which can be considered to be elements in their own right. Each chapter
will contain more elements, such as paragraphs, quotations, and
footnotes. Each paragraph might contain further elements, identifying
content that was direct speech, or the name of a character in the story.

It may be helpful to think of this as “chunking” content. At the very
top level is one chunk, the book. Look a little deeper, and there are
more chunks, the individual chapters. These are chunked further into
paragraphs, footnotes, character names, and so on.

Notice how this differentiation between different elements of the
content can be made without resorting to any XML terms. It really is
surprisingly straightforward. This could be done with a highlighter pen
and a printout of the book, using different colors to indicate different
chunks of content.

Of course, we do not have an electronic highlighter pen, so we need some
other way of indicating which element each piece of content belongs to.
In languages written in XML (XHTML, DocBook, et al) this is done by
means of *tags*.

A tag is used to identify where a particular element starts, and where
the element ends. *The tag is not part of the element itself*. Because
each grammar was normally written to mark up specific types of
information, each one will recognize different elements, and will
therefore have different names for the tags.

For an element called *``element-name``* the start tag will normally
look like ``<element-name``>. The corresponding closing tag for this
element is ``</element-name``>.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.1.?Using an Element (Start and End Tags)

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

XHTML has an element for indicating that the content enclosed by the
element is a paragraph, called ``p``.

.. code:: programlisting

    <p>This is a paragraph.  It starts with the start tag for
      the 'p' element, and it will end with the end tag for the 'p'
      element.</p>

    <p>This is another paragraph.  But this one is much shorter.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some elements have no content. For example, in XHTML, a horizontal line
can be included in the document. For these “empty” elements, XML
introduced a shorthand form that is completely equivalent to the two-tag
version:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.2.?Using an Element Without Content

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

XHTML has an element for indicating a horizontal rule, called ``hr``.
This element does not wrap content, so it looks like this:

.. code:: programlisting

    <p>One paragraph.</p>
    <hr></hr>

    <p>This is another paragraph.  A horizontal rule separates this
      from the previous paragraph.</p>

The shorthand version consists of a single tag:

.. code:: programlisting

    <p>One paragraph.</p>
    <hr/>

    <p>This is another paragraph.  A horizontal rule separates this
      from the previous paragraph.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

As shown above, elements can contain other elements. In the book example
earlier, the book element contained all the chapter elements, which in
turn contained all the paragraph elements, and so on.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.3.?Elements Within Elements; ``em``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <p>This is a simple <em>paragraph</em> where some
      of the <em>words</em> have been <em>emphasized</em>.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

The grammar consists of rules that describe which elements can contain
other elements, and exactly what they can contain.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

People often confuse the terms tags and elements, and use the terms as
if they were interchangeable. They are not.

An element is a conceptual part of your document. An element has a
defined start and end. The tags mark where the element starts and ends.

When this document (or anyone else knowledgeable about XML) refers to
“the ``<p>`` tag” they mean the literal text consisting of the three
characters ``<``, ``p``, and ``>``. But the phrase “the ``p`` element”
refers to the whole element.

This distinction *is* very subtle. But keep it in mind.

.. raw:: html

   </div>

Elements can have attributes. An attribute has a name and a value, and
is used for adding extra information to the element. This might be
information that indicates how the content should be rendered, or might
be something that uniquely identifies that occurrence of the element, or
it might be something else.

An element's attributes are written *inside* the start tag for that
element, and take the form
``attribute-name``\ ="*``attribute-value``*\ ".

In XHTML, the ``p`` element has an attribute called ``align``, which
suggests an alignment (justification) for the paragraph to the program
displaying the XHTML.

The ``align`` attribute can take one of four defined values, ``left``,
``center``, ``right`` and ``justify``. If the attribute is not specified
then the default is ``left``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.4.?Using an Element with an Attribute

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <p align="left">The inclusion of the align attribute
      on this paragraph was superfluous, since the default is left.</p>

    <p align="center">This may appear in the center.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some attributes only take specific values, such as ``left`` or
``justify``. Others allow any value.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.5.?Single Quotes Around Attributes

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <p align='right'>I am on the right!</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Attribute values in XML must be enclosed in either single or double
quotes. Double quotes are traditional. Single quotes are useful when the
attribute value contains double quotes.

Information about attributes, elements, and tags is stored in catalog
files. The Documentation Project uses standard DocBook catalogs and
includes additional catalogs for FreeBSD-specific features. Paths to the
catalog files are defined in an environment variable so they can be
found by the document build tools.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.1.?To Do…
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before running the examples in this document, install
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
from the FreeBSD Ports Collection. This is a *meta-port* that downloads
and installs the standard programs and supporting files needed by the
Documentation Project.
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
users must use ``rehash`` for the shell to recognize new programs after
they have been installed, or log out and then log back in again.

.. raw:: html

   <div class="procedure">

#. Create ``example.xml``, and enter this text:

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

       <html xmlns="http://www.w3.org/1999/xhtml">
         <head>
           <title>An Example XHTML File</title>
         </head>

         <body>
           <p>This is a paragraph containing some text.</p>

           <p>This paragraph contains some more text.</p>

           <p align="right">This paragraph might be right-justified.</p>
         </body>
       </html>

#. Try to validate this file using an XML parser.

   `textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
   includes the ``xmllint`` `validating
   parser <xml-primer.html#xml-primer-validating>`__.

   Use ``xmllint`` to validate the document:

   .. code:: screen

       % xmllint --valid --noout example.xml

   ``xmllint`` returns without displaying any output, showing that the
   document validated successfully.

#. See what happens when required elements are omitted. Delete the line
   with the ``<title>`` and ``</title>`` tags, and re-run the
   validation.

   .. code:: screen

       % xmllint --valid --noout example.xml
       example.xml:5: element head: validity error : Element head content does not follow the DTD, expecting ((script | style | meta | link | object | isindex)* , ((title , (script | style | meta | link | object | isindex)* , (base , (script | style | meta | link | object | isindex)*)?) | (base , (script | style | meta | link | object | isindex)* , title , (script | style | meta | link | object | isindex)*))), got ()

   This shows that the validation error comes from the *``fifth``* line
   of the *``example.xml``* file and that the content of the ``<head>``
   is the part which does not follow the rules of the XHTML grammar.

   Then ``xmllint`` shows the line where the error was found and marks
   the exact character position with a ``^`` sign.

#. Replace the ``title`` element.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+----------------------------+-----------------------------------------------------+
| `Prev <xml-primer.html>`__?   | `Up <xml-primer.html>`__   | ?\ `Next <xml-primer-doctype-declaration.html>`__   |
+-------------------------------+----------------------------+-----------------------------------------------------+
| Chapter?7.?XML Primer?        | `Home <index.html>`__      | ?7.3.?The DOCTYPE Declaration                       |
+-------------------------------+----------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
