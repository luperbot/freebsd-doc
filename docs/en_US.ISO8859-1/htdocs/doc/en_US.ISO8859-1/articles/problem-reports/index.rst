===============================
Writing FreeBSD Problem Reports
===============================

.. raw:: html

   <div class="navheader">

Writing FreeBSD Problem Reports
?
?
?\ `Next <pr-when.html>`__

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

Dag-Erling Sm?rgrav
~~~~~~~~~~~~~~~~~~~

Contributed by ?

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Mark Linimon
~~~~~~~~~~~~

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

This article describes how to best formulate and submit a problem report
to the FreeBSD Project.

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

`1. Introduction <index.html#pr-intro>`__
`2. When to Submit a Problem Report <pr-when.html>`__
`3. Preparations <pr-prep.html>`__
`4. Writing the Problem Report <pr-writing.html>`__
`5. Follow-up <pr-followup.html>`__
`6. If There Are Problems <pr-problems.html>`__
`7. Further Reading <pr-further.html>`__
`Index <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

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

One of the most frustrating experiences one can have as a software user
is to submit a problem report only to have it summarily closed with a
terse and unhelpful explanation like “not a bug” or “bogus PR”.
Similarly, one of the most frustrating experiences as a software
developer is to be flooded with problem reports that are not really
problem reports but requests for support, or that contain little or no
information about what the problem is and how to reproduce it.

This document attempts to describe how to write good problem reports.
What, one asks, is a good problem report? Well, to go straight to the
bottom line, a good problem report is one that can be analyzed and dealt
with swiftly, to the mutual satisfaction of both user and developer.

Although the primary focus of this article is on FreeBSD problem
reports, most of it should apply quite well to other software projects.

Note that this article is organized thematically, not chronologically.
Read the entire document before submitting a problem report, rather than
treating it as a step-by-step tutorial.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------------------+
| ?   | ?   | ?\ `Next <pr-when.html>`__            |
+-----+-----+---------------------------------------+
| ?   | ?   | ?2.?When to Submit a Problem Report   |
+-----+-----+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
