================
Chapter?2.?Tools
================

.. raw:: html

   <div class="navheader">

Chapter?2.?Tools
`Prev <overview-quick-start.html>`__?
?
?\ `Next <tools-optional.html>`__

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

`2.1. Required Tools <tools.html#tools-required>`__
`2.2. Optional Tools <tools-optional.html>`__

.. raw:: html

   </div>

Several software tools are used to manage the FreeBSD documentation and
render it to different output formats. Some of these tools are required
and must be installed before working through the examples in the
following chapters. Some are optional, adding capabilities or making the
job of creating documentation less demanding.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Required Tools
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Install
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
from the Ports Collection. This *meta-port* installs all the
applications required to do useful work with the FreeBSD documentation.
Some further notes on particular components are given below.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.1.?DTDs and Entities
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD documentation uses several Document Type Definitions (DTDs) and
sets of XML entities. These are all installed by the
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
port.

.. raw:: html

   <div class="variablelist">

XHTML DTD
(`textproc/xhtml <http://www.freebsd.org/cgi/url.cgi?ports/textproc/xhtml/pkg-descr>`__)
    XHTML is the markup language of choice for the World Wide Web, and
    is used throughout the FreeBSD web site.

DocBook DTD
(`textproc/docbook-xml-450 <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docbook-xml-450/pkg-descr>`__)
    DocBook is designed for marking up technical documentation. Most of
    the FreeBSD documentation is written in DocBook.

ISO 8879 entities
(`textproc/iso8879 <http://www.freebsd.org/cgi/url.cgi?ports/textproc/iso8879/pkg-descr>`__)
    Character entities from the ISO 8879:1986 standard used by many
    DTDs. Includes named mathematical symbols, additional characters in
    the Latin character set (accents, diacriticals, and so on), and
    Greek symbols.

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

+-----------------------------------------+-------------------------+-------------------------------------+
| `Prev <overview-quick-start.html>`__?   | ?                       | ?\ `Next <tools-optional.html>`__   |
+-----------------------------------------+-------------------------+-------------------------------------+
| 1.2.?Quick Start?                       | `Home <index.html>`__   | ?2.2.?Optional Tools                |
+-----------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
