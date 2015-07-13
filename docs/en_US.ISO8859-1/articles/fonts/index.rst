=================
Fonts and FreeBSD
=================

.. raw:: html

   <div class="navheader">

Fonts and FreeBSD
?
?
?\ `Next <terminology.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

*A Tutorial*
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Dave Bodenstab
~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| 
|  ????\ ``<imdave@synet.net>``
|  ??

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

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on Wed Aug 7, 1996 by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

This document contains a description of the various font files that may
be used with FreeBSD and the syscons driver, X11, Ghostscript and Groff.
Cookbook examples are provided for switching the syscons display to
80x60 mode, and for using type 1 fonts with the above application
programs.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <index.html#intro>`__
`2. Basic terminology <terminology.html>`__
`3. What font formats can I use? <font-formats.html>`__
`4. Setting a virtual console to 80x60 line
mode <virtual-console.html>`__
`5. Using type 1 fonts with X11 <type1-fonts-x11.html>`__
`6. Using type 1 fonts with
Ghostscript <type1-fonts-ghostscript.html>`__
`7. Using type 1 fonts with Groff <type1-fonts-groff.html>`__
`8. Converting TrueType fonts to a groff/PostScript format for
groff <convert-truetype.html>`__
`9. Can TrueType fonts be used with other
programs? <truetype-for-other-programs.html>`__
`10. Where can additional fonts be
obtained? <obtaining-additional-fonts.html>`__
`11. Additional questions <additional-questions.html>`__

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

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are many sources of fonts available, and one might ask how they
might be used with FreeBSD. The answer can be found by carefully
searching the documentation for the component that one would like to
use. This is very time consuming, so this tutorial is an attempt to
provide a shortcut for others who might be interested.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+----------------------------------+
| ?   | ?   | ?\ `Next <terminology.html>`__   |
+-----+-----+----------------------------------+
| ?   | ?   | ?2.?Basic terminology            |
+-----+-----+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
