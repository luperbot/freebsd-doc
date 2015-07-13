================================
FreeBSD Support for Leap Seconds
================================

.. raw:: html

   <div class="navheader">

FreeBSD Support for Leap Seconds
?
?
?\ `Next <leapseconds-posix.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article">

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

`1. Introduction <index.html#leapseconds-definition>`__
`2. Default Leap Second Handling on FreeBSD <leapseconds-posix.html>`__
`3. Cautions <leapseconds-cautions.html>`__
`4. Testing <leapseconds-testing.html>`__
`5. Conclusion <leapseconds-conclusion.html>`__

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

A *leap second* is an ad-hoc one-second correction to synchronize atomic
timescales with Earth rotation. This article describes how FreeBSD
interacts with leap seconds.

As of this writing, the next leap second will occur at 2015-Jun-30
23:59:60 UTC. This leap second will occur during a business day for
North and South America and the Asia/Pacific region.

Leap seconds are announced by `IERS <http://datacenter.iers.org/>`__ on
`Bulletin
C <http://datacenter.iers.org/web/guest/bulletins/-/somos/5Rgv/product/16>`__.

Standard leap second behavior is described in `RFC
7164 <https://tools.ietf.org/html/rfc7164#section-3>`__. Also see
`time2posix(3) <http://www.FreeBSD.org/cgi/man.cgi?query=time2posix&sektion=3>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------------------+
| ?   | ?   | ?\ `Next <leapseconds-posix.html>`__          |
+-----+-----+-----------------------------------------------+
| ?   | ?   | ?2.?Default Leap Second Handling on FreeBSD   |
+-----+-----+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
