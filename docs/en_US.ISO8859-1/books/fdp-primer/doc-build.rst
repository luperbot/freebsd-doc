==========================================
Chapter?5.?The Documentation Build Process
==========================================

.. raw:: html

   <div class="navheader">

Chapter?5.?The Documentation Build Process
`Prev <structure-document.html>`__?
?
?\ `Next <doc-build-makefiles.html>`__

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

`5.1. The FreeBSD Documentation Build
Toolset <doc-build.html#doc-build-toolset>`__
`5.2. Understanding ``Makefile``\ s in the Documentation
Tree <doc-build-makefiles.html>`__
`5.3. FreeBSD Documentation Project Make
Includes <make-includes.html>`__

.. raw:: html

   </div>

This chapter covers organization of the documentation build process and
how
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__ is
used to control it.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?The FreeBSD Documentation Build Toolset
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These are the tools used to build and install the FDP documentation.

.. raw:: html

   <div class="itemizedlist">

-  The primary build tool is
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__,
   specifically Berkeley Make.

-  Package building is handled by FreeBSD's
   `pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1>`__.

-  `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__
   is used to create compressed versions of the document.
   `bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1>`__
   archives are also supported.
   `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
   is used for package building.

-  `install(1) <http://www.FreeBSD.org/cgi/man.cgi?query=install&sektion=1>`__
   is used to install the documentation.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+-----------------------------------------------------------------+
| `Prev <structure-document.html>`__?   | ?                       | ?\ `Next <doc-build-makefiles.html>`__                          |
+---------------------------------------+-------------------------+-----------------------------------------------------------------+
| 4.3.?Document-Specific Information?   | `Home <index.html>`__   | ?5.2.?Understanding ``Makefile``\ s in the Documentation Tree   |
+---------------------------------------+-------------------------+-----------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
