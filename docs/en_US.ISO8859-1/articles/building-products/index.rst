==============================
Building Products with FreeBSD
==============================

.. raw:: html

   <div class="navheader">

Building Products with FreeBSD
?
?
?\ `Next <freebsd-intro.html>`__

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

Joseph Koshy
~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

The FreeBSD Project

.. raw:: html

   <div class="address">

``<jkoshy@FreeBSD.org>``

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

The FreeBSD project is a worldwide, voluntary, and collaborative
project, which develops a portable and high-quality operating system.
The FreeBSD project distributes the source code for its product under a
liberal license, with the intention of encouraging the use of its code.
Collaborating with the FreeBSD project can help organizations reduce
their time to market, reduce engineering costs and improve their product
quality.

This article examines the issues in using FreeBSD code in appliances and
software products. It highlights the characteristics of FreeBSD that
make it an excellent substrate for product development. The article
concludes by suggesting a few “best practices” for organizations
collaborating with the FreeBSD project.

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

`1. Introduction <index.html#introduction>`__
`2. FreeBSD as a set of building blocks <freebsd-intro.html>`__
`3. Collaborating with FreeBSD <freebsd-collaboration.html>`__
`4. Conclusion <conclusion.html>`__
`Bibliography <bi01.html>`__

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

FreeBSD today is well-known as a high-performance server operating
system. It is deployed on millions of web servers and internet-facing
hosts worldwide. FreeBSD code also forms an integral part of many
products, ranging from appliances such as network routers, firewalls,
and storage devices, to personal computers. Portions of FreeBSD have
also been used in commercial shrink-wrapped software (see `Section?2,
“FreeBSD as a set of building blocks” <freebsd-intro.html>`__).

In this article we look at the `FreeBSD project <../../../../>`__ as a
software engineering resource—as a collection of building blocks and
processes which you can use to build products.

While FreeBSD's source is distributed freely to the public, to fully
enjoy the benefits of the project's work, organizations need to
*collaborate* with the project. In subsequent sections of this article
we discuss effective means of collaboration with the project and the
pitfalls that need to be avoided while doing so.

Caveat Reader.?The author believes that the characteristics of the
FreeBSD Project listed in this article were substantially true at the
time the article was conceived and written (2005). However, the reader
should keep in mind that the practices and processes used by open-source
communities can change over time, and that the information in this
article should therefore be taken as indicative rather than normative.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1.?Target Audience
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document would be of interest to the following broad groups of
people:

.. raw:: html

   <div class="itemizedlist">

-  Decision makers in product companies looking at ways to improve their
   product quality, reduce their time to market and lower engineering
   costs in the long term.
-  Technology consultants looking for best-practices in leveraging
   “open-source”.
-  Industry observers interested in understanding the dynamics of
   open-source projects.
-  Software developers seeking to use FreeBSD and looking for ways to
   contribute back.

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

1.2.?Article Goals
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After reading this article you should have:

.. raw:: html

   <div class="itemizedlist">

-  An understanding of the goals of the FreeBSD Project and its
   organizational structure.
-  An overview of the available technology in the project.
-  An understanding of its development model and release engineering
   processes.
-  An understanding of how conventional corporate software development
   processes differ from that used in the FreeBSD project.
-  Awareness of the communication channels used by the project and the
   level of transparency you can expect.
-  Awareness of optimal ways of working with the project—how best to
   reduce engineering costs, improve time to market, manage security
   vulnerabilities, and preserve future compatibility with your product
   as the FreeBSD project evolves.

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

1.3.?Article Structure
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The rest of the article is structured as follows:

.. raw:: html

   <div class="itemizedlist">

-  `Section?2, “FreeBSD as a set of building
   blocks” <freebsd-intro.html>`__ introduces the FreeBSD project,
   explores its organizational structure, key technologies and release
   engineering processes.
-  `Section?3, “Collaborating with
   FreeBSD” <freebsd-collaboration.html>`__ describes ways to
   collaborate with the FreeBSD project. It examines common pitfalls
   encountered by corporates working with voluntary projects like
   FreeBSD.
-  `Section?4, “Conclusion” <conclusion.html>`__ concludes.

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

+-----+-----+-------------------------------------------+
| ?   | ?   | ?\ `Next <freebsd-intro.html>`__          |
+-----+-----+-------------------------------------------+
| ?   | ?   | ?2.?FreeBSD as a set of building blocks   |
+-----+-----+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
