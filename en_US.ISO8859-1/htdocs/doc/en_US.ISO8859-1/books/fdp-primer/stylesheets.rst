========================
Chapter?10.?Style Sheets
========================

.. raw:: html

   <div class="navheader">

Chapter?10.?Style Sheets
`Prev <docbook-markup-links.html>`__?
?
?\ `Next <translations.html>`__

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

`10.1. CSS <stylesheets.html#stylesheets-css>`__

.. raw:: html

   </div>

XML is concerned with content, and says nothing about how that content
should be presented to the reader or rendered on paper. Multiple *style
sheet* languages have been developed to describe visual layout,
including Extensible Stylesheet Language Transformation (XSLT), Document
Style Semantics and Specification Language (DSSSL), and Cascading Style
Sheets (CSS).

The FDP documents use XSLT stylesheets to transform DocBook into XHTML,
and then CSS formatting is applied to the XHTML pages. Printable output
is currently rendered with legacy DSSSL stylesheets, but this will
probably change in the future.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.1.?CSS
---------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cascading Style Sheets (CSS) are a mechanism for attaching style
information (font, weight, size, color, and so forth) to elements in an
XHTML document without abusing XHTML to do so.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.1.1.?The DocBook Documents
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD XSLT and DSSSL stylesheets refer to ``docbook.css``, which
is expected to be present in the same directory as the XHTML files. The
project-wide CSS file is copied from ``doc/share/misc/docbook.css`` when
documents are converted to XHTML, and is installed automatically.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-----------------------------------+
| `Prev <docbook-markup-links.html>`__?   | ?                       | ?\ `Next <translations.html>`__   |
+-----------------------------------------+-------------------------+-----------------------------------+
| 9.8.?Links?                             | `Home <index.html>`__   | ?Chapter?11.?Translations         |
+-----------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
