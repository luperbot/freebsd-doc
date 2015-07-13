=================
Filtering Bridges
=================

.. raw:: html

   <div class="navheader">

Filtering Bridges
?
?
?\ `Next <filtering-bridges-how.html>`__

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

Alex Dupre
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<ale@FreeBSD.org>``

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

Often it is useful to divide one physical network (like an Ethernet)
into two separate segments without having to create subnets, and use a
router to link them together. The device that connects the two networks
in this way is called a bridge. A FreeBSD system with two network
interfaces is enough in order to act as a bridge.

A bridge works by scanning the addresses of MAC level (Ethernet
addresses) of the devices connected to each of its network interfaces
and then forwarding the traffic between the two networks only if the
source and the destination are on different segments. Under many points
of view a bridge is similar to an Ethernet switch with only two ports.

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

`1. Why use a filtering bridge? <index.html#filtering-bridges-why>`__
`2. How to Install <filtering-bridges-how.html>`__
`3. Final Preparation <filtering-bridges-finalprep.html>`__
`4. Enabling the Bridge <filtering-bridges-enabling.html>`__
`5. Configuring The Firewall <filtering-bridges-ipfirewall.html>`__
`6. Contributors <filtering-bridges-contributors.html>`__

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

1.?Why use a filtering bridge?
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

More and more frequently, thanks to the lowering costs of broad band
Internet connections (xDSL) and also because of the reduction of
available IPv4 addresses, many companies are connected to the Internet
24 hours on 24 and with few (sometimes not even a power of 2) IP
addresses. In these situations it is often desirable to have a firewall
that filters incoming and outgoing traffic from and towards Internet,
but a packet filtering solution based on router may not be applicable,
either due to subnetting issues, the router is owned by the connectivity
supplier (ISP), or because it does not support such functionalities. In
these scenarios the use of a filtering bridge is highly advised.

A bridge-based firewall can be configured and inserted between the xDSL
router and your Ethernet hub/switch without any IP numbering issues.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+--------------------------------------------+
| ?   | ?   | ?\ `Next <filtering-bridges-how.html>`__   |
+-----+-----+--------------------------------------------+
| ?   | ?   | ?2.?How to Install                         |
+-----+-----+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
