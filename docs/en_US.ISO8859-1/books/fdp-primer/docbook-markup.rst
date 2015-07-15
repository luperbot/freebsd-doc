=========================
Chapter?9.?DocBook Markup
=========================

.. raw:: html

   <div class="navheader">

Chapter?9.?DocBook Markup
`Prev <xhtml-markup-inline-elements.html>`__?
?
?\ `Next <docbook-markup-freebsd-extensions.html>`__

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

`9.1. Introduction <docbook-markup.html#docbook-markup-introduction>`__
`9.2. FreeBSD Extensions <docbook-markup-freebsd-extensions.html>`__
`9.3. Formal Public Identifier (FPI) <docbook-markup-fpi.html>`__
`9.4. Document Structure <docbook-markup-document-structure.html>`__
`9.5. Block Elements <docbook-markup-block-elements.html>`__
`9.6. In-line Elements <docbook-markup-inline-elements.html>`__
`9.7. Images <docbook-markup-images.html>`__
`9.8. Links <docbook-markup-links.html>`__

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

9.1.?Introduction
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This chapter is an introduction to DocBook as it is used for FreeBSD
documentation. DocBook is a large and complex markup system, but the
subset described here covers the parts that are most widely used for
FreeBSD documentation. While a moderate subset is covered, it is
impossible to anticipate every situation. Please post questions that
this document does not answer to the `FreeBSD documentation project
mailing list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.

DocBook was originally developed by HaL Computer Systems and O'Reilly &
Associates to be a Document Type Definition (DTD) for writing technical
documentation `:sup:`[1]` <#ftn.idp67727184>`__. Since 1998 it is
maintained by the `DocBook Technical
Committee <http://www.oasis-open.org/committees/tc_home.php?wg_abbrev=docbook>`__.
As such, and unlike LinuxDoc and XHTML, DocBook is very heavily oriented
towards markup that describes *what* something is, rather than
describing *how* it should be presented.

The DocBook DTD is available from the Ports Collection in the
`textproc/docbook-xml <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docbook-xml/pkg-descr>`__
port. It is automatically installed as part of the
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
port.

.. raw:: html

   <div class="note" xmlns="">

Formal Versus Informal:
~~~~~~~~~~~~~~~~~~~~~~~

Some elements may exist in two forms, *formal* and *informal*.
Typically, the formal version of the element will consist of a title
followed by the informal version of the element. The informal version
will not have a title.

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

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp67727184" class="footnote">

`:sup:`[1]` <#idp67727184>`__\ A short history can be found under
http://www.oasis-open.org/docbook/intro.shtml#d0e41.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-------------------------+--------------------------------------------------------+
| `Prev <xhtml-markup-inline-elements.html>`__?   | ?                       | ?\ `Next <docbook-markup-freebsd-extensions.html>`__   |
+-------------------------------------------------+-------------------------+--------------------------------------------------------+
| 8.5.?In-line Elements?                          | `Home <index.html>`__   | ?9.2.?FreeBSD Extensions                               |
+-------------------------------------------------+-------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
