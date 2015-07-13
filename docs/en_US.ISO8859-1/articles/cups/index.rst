===============
CUPS on FreeBSD
===============

.. raw:: html

   <div class="navheader">

CUPS on FreeBSD
?
?
?\ `Next <printing-cups-install.html>`__

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

Chess Griffin
~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<chess@chessgriffin.com>``

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

An article about configuring CUPS on FreeBSD.

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

`1. An Introduction to the Common Unix Printing System
(CUPS) <index.html#printing-cups>`__
`2. Installing the CUPS Print Server <printing-cups-install.html>`__
`3. Configuring the CUPS Print
Server <printing-cups-configuring-server.html>`__
`4. Configuring Printers on the CUPS Print
Server <printing-cups-configuring-printers.html>`__
`5. Configuring CUPS Clients <printing-cups-clients.html>`__
`6. CUPS Troubleshooting <printing-cups-troubleshooting.html>`__
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

1.?An Introduction to the Common Unix Printing System (CUPS)
------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CUPS, the Common UNIX Printing System, provides a portable printing
layer for UNIX?-based operating systems. It has been developed by Easy
Software Products to promote a standard printing solution for all UNIX?
vendors and users.

CUPS uses the Internet Printing Protocol (IPP) as the basis for managing
print jobs and queues. The Line Printer Daemon (LPD), Server Message
Block (SMB), and AppSocket (aka JetDirect) protocols are also supported
with reduced functionality. CUPS adds network printer browsing and
PostScript Printer Description (PPD) based printing options to support
real-world printing under UNIX?. As a result, CUPS is ideally-suited for
sharing and accessing printers in mixed environments of FreeBSD, Linux?,
Mac?OS??X, or Windows?.

The main site for CUPS is ``http://www.cups.org/``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+--------------------------------------------+
| ?   | ?   | ?\ `Next <printing-cups-install.html>`__   |
+-----+-----+--------------------------------------------+
| ?   | ?   | ?2.?Installing the CUPS Print Server       |
+-----+-----+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
