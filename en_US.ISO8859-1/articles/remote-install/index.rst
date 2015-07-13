============================================================================
Remote Installation of the FreeBSD Operating System Without a Remote Console
============================================================================

.. raw:: html

   <div class="navheader">

Remote Installation of the FreeBSD Operating System Without a Remote
Console
?
?
?\ `Next <intro.html>`__

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Daniel Gerzo
~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| 
|  ??\ ``<danger@FreeBSD.org>``

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

Copyright ? 2008 The FreeBSD Documentation Project

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

This article documents the remote installation of the FreeBSD operating
system when the console of the remote system is unavailable. The main
idea behind this article is the result of a collaboration with Martin
Matuska ``<mm@FreeBSD.org>`` with valuable input provided by Pawel Jakub
Dawidek ``<pjd@FreeBSD.org>``.

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

`1. Background <index.html#background>`__
`2. Introduction <intro.html>`__
`3. Preparation - mfsBSD <preparation.html>`__
`4. Installation of the FreeBSD Operating System <installation.html>`__
`5. ZFS <zfs.html>`__

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

1.?Background
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are many server hosting providers in the world, but very few of
them are officially supporting FreeBSD. They usually provide support for
a Linux? distribution to be installed on the servers they offer.

In some cases, these companies will install your preferred Linux?
distribution if you request it. Using this option, we will attempt to
install FreeBSD. In other cases, they may offer a rescue system which
would be used in an emergency. It is possible to use this for our
purposes as well.

This article covers the basic installation and configuration steps
required to bootstrap a remote installation of FreeBSD with RAID-1 and
ZFS capabilities.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+----------------------------+
| ?   | ?   | ?\ `Next <intro.html>`__   |
+-----+-----+----------------------------+
| ?   | ?   | ?2.?Introduction           |
+-----+-----+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
