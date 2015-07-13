===============================
Perforce in FreeBSD Development
===============================

.. raw:: html

   <div class="navheader">

Perforce in FreeBSD Development
?
?
?\ `Next <start.html>`__

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

Scott Long
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| 
|  ????\ ``<scottl@FreeBSD.org>``
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
`2. Getting Started <start.html>`__
`3. Clients <clients.html>`__
`4. Syncing <syncing.html>`__
`5. Branches <branches.html>`__
`6. Integrations <Integrations.html>`__
`7. Submit <submit.html>`__
`8. Editing <editing.html>`__
`9. Changes, Descriptions, and History <changes.html>`__
`10. Diffs <diffs.html>`__
`11. Adding and Removing Files <add-rm-files.html>`__
`12. Working with Diffs <working-with-diffs.html>`__
`13. Renaming Files <renaming-files.html>`__
`14. Interactions Between FreeBSD Subversion and
Perforce <freebsd-cvs-and-p4.html>`__
`15. Offline Operation <offline-ops.html>`__
`16. Notes for Google Summer of Code <soc.html>`__

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

The FreeBSD project uses the Perforce version control system to manage
experimental projects that are not ready for the main Subversion
repository.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1.?Availability, Documentation, and Resources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While Perforce is a commercial product, the client software for
interacting with the server is freely available from Perforce. It can be
easily installed on FreeBSD via the
`devel/p4 <http://www.freebsd.org/cgi/url.cgi?ports/devel/p4/pkg-descr>`__
port or can be downloaded from the Perforce web site at
``http://www.perforce.com/perforce/loadprog.html``, which also offers
client applications for other OS's.

While there is a GUI client available, most people use the command line
application called ``p4``. This document is written from the point of
view of using this command.

Detailed documentation is available online at
``http://www.perforce.com/perforce/technical.html``.

Reading the “Perforce User's Guide” and “Perforce Command Reference” is
highly recommended. The p4 application also contains an extensive amount
of online help accessible via ``p4 help``.

The FreeBSD Perforce server is hosted on ``perforce.freebsd.org``, port
``1666``. The repository is browsable online at
``http://p4web.freebsd.org``.

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
| ?   | ?   | ?\ `Next <start.html>`__   |
+-----+-----+----------------------------+
| ?   | ?   | ?2.?Getting Started        |
+-----+-----+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
