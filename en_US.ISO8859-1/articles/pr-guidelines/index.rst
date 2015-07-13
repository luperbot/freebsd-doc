==================================
Problem Report Handling Guidelines
==================================

.. raw:: html

   <div class="navheader">

Problem Report Handling Guidelines
?
?
?\ `Next <pr-lifecycle.html>`__

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

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Hiten Pandya
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

These guidelines describe recommended handling practices for FreeBSD
Problem Reports (PRs). Whilst developed for the FreeBSD PR Database
Maintenance Team ``<freebsd-bugbusters@FreeBSD.org>``, these guidelines
should be followed by anyone working with FreeBSD PRs.

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
`2. Problem Report Life-cycle <pr-lifecycle.html>`__
`3. Problem Report State <pr-states.html>`__
`4. Types of Problem Reports <pr-types.html>`__
`5. Further Reading <references.html>`__

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

Bugzilla is an issue management system used by the FreeBSD Project. As
accurate tracking of outstanding software defects is important to
FreeBSD's quality, the correct use of the software is essential to the
forward progress of the Project.

Access to Bugzilla is available to the entire FreeBSD community. In
order to maintain consistency within the database and provide a
consistent user experience, guidelines have been established covering
common aspects of bug management such as presenting followup, handling
close requests, and so forth.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------+
| ?   | ?   | ?\ `Next <pr-lifecycle.html>`__   |
+-----+-----+-----------------------------------+
| ?   | ?   | ?2.?Problem Report Life-cycle     |
+-----+-----+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
