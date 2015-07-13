=======================
Chapter?8.?XHTML Markup
=======================

.. raw:: html

   <div class="navheader">

Chapter?8.?XHTML Markup
`Prev <xml-primer-conclusion.html>`__?
?
?\ `Next <xhtml-markup-fpi.html>`__

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

`8.1. Introduction <xhtml-markup.html#xhtml-markup-introduction>`__
`8.2. Formal Public Identifier (FPI) <xhtml-markup-fpi.html>`__
`8.3. Sectional Elements <xhtml-markup-sectional-elements.html>`__
`8.4. Block Elements <xhtml-markup-block-elements.html>`__
`8.5. In-line Elements <xhtml-markup-inline-elements.html>`__

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

8.1.?Introduction
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This chapter describes usage of the XHTML markup language used for the
FreeBSD web site.

XHTML is the XML version of the HyperText Markup Language, the markup
language of choice on the World Wide Web. More information can be found
at ``http://www.w3.org/``.

XHTML is used to mark up pages on the FreeBSD web site. It is usually
not used to mark up other documentation, since DocBook offers a far
richer set of elements from which to choose. Consequently, XHTML pages
will normally only be encountered when writing for the web site.

HTML has gone through a number of versions. The XML-compliant version
described here is called XHTML. The latest widespread version is XHTML
1.0, available in both *strict* and *transitional* variants.

The XHTML DTDs are available from the Ports Collection in
`textproc/xhtml <http://www.freebsd.org/cgi/url.cgi?ports/textproc/xhtml/pkg-descr>`__.
They are automatically installed by the
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
port.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This is *not* an exhaustive list of elements, since that would just
repeat the documentation for XHTML. The aim is to list those elements
most commonly used. Please post questions about elements or uses not
covered here to the `FreeBSD documentation project mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Inline Versus Block:
~~~~~~~~~~~~~~~~~~~~

In the remainder of this document, when describing elements, *inline*
means that the element can occur within a block element, and does not
cause a line break. A *block* element, by comparison, will cause a line
break (and other processing) when it is encountered.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+----------------------------------------+
| `Prev <xml-primer-conclusion.html>`__?   | ?                       | ?\ `Next <xhtml-markup-fpi.html>`__    |
+------------------------------------------+-------------------------+----------------------------------------+
| 7.9.?Conclusion?                         | `Home <index.html>`__   | ?8.2.?Formal Public Identifier (FPI)   |
+------------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
