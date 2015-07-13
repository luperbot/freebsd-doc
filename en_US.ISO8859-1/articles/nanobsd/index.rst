=======================
Introduction to NanoBSD
=======================

.. raw:: html

   <div class="navheader">

Introduction to NanoBSD
?
?
?\ `Next <howto.html>`__

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

Daniel Gerzo
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

Copyright ? 2006 The FreeBSD Documentation Project

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

This document provides information about the NanoBSD tools, which can be
used to create FreeBSD system images for embedded applications, suitable
for use on a Compact Flash card (or other mass storage medium).

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

`1. Introduction to NanoBSD <index.html#intro>`__
`2. NanoBSD Howto <howto.html>`__
`Index <ix01.html>`__

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

1.?Introduction to NanoBSD
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NanoBSD is a tool currently developed by Poul-Henning Kamp
``<phk@FreeBSD.org>``. It creates a FreeBSD system image for embedded
applications, suitable for use on a Compact Flash card (or other mass
storage medium).

It can be used to build specialized install images, designed for easy
installation and maintenance of systems commonly called “computer
appliances”. Computer appliances have their hardware and software
bundled in the product, which means all applications are pre-installed.
The appliance is plugged into an existing network and can begin working
(almost) immediately.

The features of NanoBSD include:

.. raw:: html

   <div class="itemizedlist">

-  Ports and packages work as in FreeBSD — Every single application can
   be installed and used in a NanoBSD image, the same way as in FreeBSD.

-  No missing functionality — If it is possible to do something with
   FreeBSD, it is possible to do the same thing with NanoBSD, unless the
   specific feature or features were explicitly removed from the NanoBSD
   image when it was created.

-  Everything is read-only at run-time — It is safe to pull the
   power-plug. There is no necessity to run
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   after a non-graceful shutdown of the system.

-  Easy to build and customize — Making use of just one shell script and
   one configuration file it is possible to build reduced and customized
   images satisfying any arbitrary set of requirements.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+----------------------------+
| ?   | ?   | ?\ `Next <howto.html>`__   |
+-----+-----+----------------------------+
| ?   | ?   | ?2.?NanoBSD Howto          |
+-----+-----+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
