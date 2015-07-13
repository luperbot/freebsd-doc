====================
Writing a GEOM Class
====================

.. raw:: html

   <div class="navheader">

Writing a GEOM Class
?
?
?\ `Next <prelim.html>`__

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

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Ivan Voras
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| 
|  ????\ ``<ivoras@FreeBSD.org>``
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

Last modified on by .

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

This text documents some starting points in developing GEOM classes, and
kernel modules in general. It is assumed that the reader is familiar
with C userland programming.

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
`2. Preliminaries <prelim.html>`__
`3. On FreeBSD Kernel Programming <kernelprog.html>`__
`4. On GEOM Programming <geom.html>`__

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

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1.?Documentation
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Documentation on kernel programming is scarce — it is one of few areas
where there is nearly nothing in the way of friendly tutorials, and the
phrase “use the source!” really holds true. However, there are some bits
and pieces (some of them seriously outdated) floating around that should
be studied before beginning to code:

.. raw:: html

   <div class="itemizedlist">

-  The `FreeBSD Developer's
   Handbook <../../../../doc/en_US.ISO8859-1/books/developers-handbook/index.html>`__
   — part of the documentation project, it does not contain anything
   specific to kernel programming, but rather some general useful
   information.

-  The `FreeBSD Architecture
   Handbook <../../../../doc/en_US.ISO8859-1/books/arch-handbook/index.html>`__
   — also from the documentation project, contains descriptions of
   several low-level facilities and procedures. The most important
   chapter is 13, `Writing FreeBSD device
   drivers <../../../../doc/en_US.ISO8859-1/books/arch-handbook/driverbasics.html>`__.

-  The Blueprints section of `FreeBSD
   Diary <http://www.freebsddiary.org>`__ web site — contains several
   interesting articles on kernel facilities.

-  The man pages in section 9 — for important documentation on kernel
   functions.

-  The
   `geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__
   man page and `PHK's GEOM slides <http://phk.freebsd.dk/pubs/>`__ —
   for general introduction of the GEOM subsystem.

-  Man pages
   `g\_bio(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_bio&sektion=9>`__,
   `g\_event(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_event&sektion=9>`__,
   `g\_data(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_data&sektion=9>`__,
   `g\_geom(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_geom&sektion=9>`__,
   `g\_provider(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_provider&sektion=9>`__
   `g\_consumer(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_consumer&sektion=9>`__,
   `g\_access(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_access&sektion=9>`__
   & others linked from those, for documentation on specific
   functionalities.

-  The
   `style(9) <http://www.FreeBSD.org/cgi/man.cgi?query=style&sektion=9>`__
   man page — for documentation on the coding-style conventions which
   must be followed for any code which is to be committed to the FreeBSD
   Subversion tree.

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

+-----+-----+-----------------------------+
| ?   | ?   | ?\ `Next <prelim.html>`__   |
+-----+-----+-----------------------------+
| ?   | ?   | ?2.?Preliminaries           |
+-----+-----+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
