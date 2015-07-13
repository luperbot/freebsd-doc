=====================
Chapter?7.?XML Primer
=====================

.. raw:: html

   <div class="navheader">

Chapter?7.?XML Primer
`Prev <the-website-env.html>`__?
?
?\ `Next <xml-primer-elements.html>`__

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

Table of Contents

.. raw:: html

   </div>

`7.1. Overview <xml-primer.html#xml-primer-overview>`__
`7.2. Elements, Tags, and Attributes <xml-primer-elements.html>`__
`7.3. The DOCTYPE Declaration <xml-primer-doctype-declaration.html>`__
`7.4. Escaping Back to XML <xml-primer-xml-escape.html>`__
`7.5. Comments <xml-primer-comments.html>`__
`7.6. Entities <xml-primer-entities.html>`__
`7.7. Using Entities to Include Files <xml-primer-include.html>`__
`7.8. Marked Sections <xml-primer-marked-sections.html>`__
`7.9. Conclusion <xml-primer-conclusion.html>`__

.. raw:: html

   </div>

Most FDP documentation is written with markup languages based on XML.
This chapter explains what that means, how to read and understand the
documentation source, and the XML techniques used.

Portions of this section were inspired by Mark Galassi's `Get Going With
DocBook <http://www.galassi.org/mark/mydocs/docbook-intro/docbook-intro.html>`__.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.1.?Overview
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In the original days of computers, electronic text was simple. There
were a few character sets like ASCII or EBCDIC, but that was about it.
Text was text, and what you saw really was what you got. No frills, no
formatting, no intelligence.

Inevitably, this was not enough. When text is in a machine-usable
format, machines are expected to be able to use and manipulate it
intelligently. Authors want to indicate that certain phrases should be
emphasized, or added to a glossary, or made into hyperlinks. Filenames
could be shown in a “typewriter” style font for viewing on screen, but
as “italics” when printed, or any of a myriad of other options for
presentation.

It was once hoped that Artificial Intelligence (AI) would make this
easy. The computer would read the document and automatically identify
key phrases, filenames, text that the reader should type in, examples,
and more. Unfortunately, real life has not happened quite like that, and
computers still require assistance before they can meaningfully process
text.

More precisely, they need help identifying what is what. Consider this
text:

.. raw:: html

   <div class="blockquote">

    To remove ``/tmp/foo``, use
    `rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1>`__.

    .. code:: screen

        % rm /tmp/foo

.. raw:: html

   </div>

It is easy to see which parts are filenames, which are commands to be
typed in, which parts are references to manual pages, and so on. But the
computer processing the document cannot. For this we need markup.

“Markup” is commonly used to describe “adding value” or “increasing
cost”. The term takes on both these meanings when applied to text.
Markup is additional text included in the document, distinguished from
the document's content in some way, so that programs that process the
document can read the markup and use it when making decisions about the
document. Editors can hide the markup from the user, so the user is not
distracted by it.

The extra information stored in the markup *adds value* to the document.
Adding the markup to the document must typically be done by a
person—after all, if computers could recognize the text sufficiently
well to add the markup then there would be no need to add it in the
first place. This *increases the cost* (the effort required) to create
the document.

The previous example is actually represented in this document like this:

.. code:: programlisting

    <para>To remove <filename>/tmp/foo</filename>, use &man.rm.1;.</para>

    <screen>&prompt.user; <userinput>rm /tmp/foo</userinput></screen>

The markup is clearly separate from the content.

Markup languages define what the markup means and how it should be
interpreted.

Of course, one markup language might not be enough. A markup language
for technical documentation has very different requirements than a
markup language that is intended for cookery recipes. This, in turn,
would be very different from a markup language used to describe poetry.
What is really needed is a first language used to write these other
markup languages. A *meta markup language*.

This is exactly what the eXtensible Markup Language (XML) is. Many
markup languages have been written in XML, including the two most used
by the FDP, XHTML and DocBook.

Each language definition is more properly called a grammar, vocabulary,
schema or Document Type Definition (DTD). There are various languages to
specify an XML grammar, or *schema*.

A schema is a *complete* specification of all the elements that are
allowed to appear, the order in which they should appear, which elements
are mandatory, which are optional, and so forth. This makes it possible
to write an XML *parser* which reads in both the schema and a document
which claims to conform to the schema. The parser can then confirm
whether or not all the elements required by the vocabulary are in the
document in the right order, and whether there are any errors in the
markup. This is normally referred to as “validating the document”.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Validation confirms that the choice of elements, their ordering, and so
on, conforms to that listed in the grammar. It does *not* check whether
*appropriate* markup has been used for the content. If all the filenames
in a document were marked up as function names, the parser would not
flag this as an error (assuming, of course, that the schema defines
elements for filenames and functions, and that they are allowed to
appear in the same place).

.. raw:: html

   </div>

Most contributions to the Documentation Project will be content marked
up in either XHTML or DocBook, rather than alterations to the schemas.
For this reason, this book will not touch on how to write a vocabulary.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+------------------------------------------+
| `Prev <the-website-env.html>`__?   | ?                       | ?\ `Next <xml-primer-elements.html>`__   |
+------------------------------------+-------------------------+------------------------------------------+
| 6.3.?Environment Variables?        | `Home <index.html>`__   | ?7.2.?Elements, Tags, and Attributes     |
+------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
