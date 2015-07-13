========================
FreeBSD 4.5 Announcement
========================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header And Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

.. raw:: html

   <div class="frontdonateroundbox">

.. raw:: html

   <div class="frontdonatetop">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatecontent">

`Donate to FreeBSD <https://www.FreeBSDFoundation.org/donate/>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatebot">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Peripheral Links
----------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

Search
------

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Site Navigation
---------------

.. raw:: html

   <div id="menu">

-  `Home <../../>`__

-  `About <../../about.html>`__

   -  `Introduction <../../projects/newbies.html>`__
   -  `Features <../../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Get FreeBSD <../../where.html>`__

   -  `Release Information <../../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Documentation <../../docs.html>`__

   -  `FAQ <../../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../../docs/books.html>`__

-  `Community <../../community.html>`__

   -  `Mailing Lists <../../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../../support.html>`__

   -  `Vendors <../../commercial/commercial.html>`__
   -  `Security Information <../../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Get FreeBSD <../../where.html>`__
-  `Release Information <../../releases/>`__

   -  Production Release:
      `10.1 <../../releases/10.1R/announce.html>`__
   -  Production Release:
      `9.3 <../../releases/9.3R/announce.html>`__
   -  Production Release:
      `8.4 <../../releases/8.4R/announce.html>`__

-  `Snapshot Releases <../../snapshots/>`__

   -  Upcoming Release:
      `10.2 <../../releases/10.2R/schedule.html>`__

-  `Ported Applications <../../ports/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD 4.5 Announcement
========================

| **Date:** Tuesday, 29 Jan 2002 20:00:00 -0800
|  **From:** "Murray Stokely" <murray@FreeBSD.org>
|  **To:** announce@FreeBSD.org
|  **Subject:** 4.5-RELEASE is now available

I am very pleased to announce the availability of FreeBSD 4.5-RELEASE,
the very latest release on the FreeBSD -STABLE branch of development.
Since FreeBSD 4.4 was released in September 2001, we have made hundreds
of fixes, updated many system components, made several substantial
performance improvements, and addressed a wide variety of security
issues.

In particular, there have been significant enhancements in the areas of
network communications and filesystems. FreeBSD 4.5 contains
improvements to the TCP stack to provide better throughput. In addition,
TCP performance is aided by larger default buffer sizes. Finally,
FreeBSD 4.5 contains new mechanisms to mitigate the effects of TCP
Denial of Service attacks.

The FFS filesystem benefits from a new directory layout strategy that
has demonstrated significantly better performance for operations
traversing large directory structures. Various bugs were located and
fixed in the FFS and NFS code with the help of a filesystem exercising
program originally developed at Apple Computer, Inc.

Those users doing fresh installations of FreeBSD should note some
changes for newly created filesystems, intended to improve the "out of
the box" performance of FreeBSD. In particular, sysinstall(8) now
enables Soft Updates (a strategy for improving both performance and
reliability of on-disk data structures) for new filesystems it creates
and the newfs(8) program will now, by default, create filesystems with
larger block sizes.

For more information about the most significant changes with this
release of FreeBSD, please see the release section of our web site:

http://www.FreeBSD.org/releases/

There you will find `Release
Notes <http://www.FreeBSD.org/releases/4.5R/notes.html>`__, `Hardware
Notes <http://www.FreeBSD.org/releases/4.5R/hardware.html>`__, and a
list of `Errata <http://www.FreeBSD.org/releases/4.5R/errata.html>`__.

Availability
============

4.5-RELEASE is available for the i386 and alpha architectures and can be
installed directly over the net using the boot floppies or copied to a
local NFS/FTP server.

We can't promise that all the mirror sites will carry the larger ISO
images, but they will at least be available from:

-  ftp://ftp.FreeBSD.org/pub/FreeBSD/
-  http://ftp.au.freebsd.org/pub/FreeBSD/
-  ftp://ftp.dk.FreeBSD.org/pub/FreeBSD/
-  ftp://freebsd.nctu.edu.tw/pub/FreeBSD/

If you can't afford the CDs, are impatient, or just want to use it for
evangelism purposes, then by all means download the ISOs, otherwise
please continue to support the FreeBSD project by purchasing media from
one of our supporting vendors. The following companies have contributed
substantially to the development of FreeBSD :

+-------------------------+----------------------------------------+
| FreeBSD Mall, Inc.      | http://www.freebsdmall.com             |
+-------------------------+----------------------------------------+
| FreeBSD Services Ltd.   | http://www.freebsd-services.com        |
+-------------------------+----------------------------------------+
| Daemon News             | http://www.bsdmall.com/freebsd1.html   |
+-------------------------+----------------------------------------+

Each CD set contains the FreeBSD installation and application package
bits for the i386 ("PC") architecture. For a set of distfiles used to
build ports in the ports collection, please see the FreeBSD Toolkit, a 6
CD set containing extra bits which no longer fit on the 4 CD set.

FreeBSD is also available via anonymous FTP from mirror sites in the
following countries: Argentina, Australia, Brazil, Bulgaria, Canada,
China, Czech Republic, Denmark, Estonia, Finland, France, Germany, Hong
Kong, Hungary, Iceland, Ireland, Israel, Japan, Korea, Lithuania,
Latvia, the Netherlands, Poland, Portugal, Romania, Russia, Saudi
Arabia, South Africa, Slovak Republic, Slovenia, Spain, Sweden, Taiwan,
Thailand, the Ukraine and the United Kingdom.

Before trying the central FTP site, please check your regional mirror(s)
first by going to:

ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD

Any additional mirror sites will be labeled ftp2, ftp3 and so on.

See the `FreeBSD
Handbook <http://www.freebsd.org/handbook/mirrors-ftp.html>`__ for
additional information about FreeBSD mirror sites.

The FreeBSD installation instructions have recently been significantly
enhanced. Chapter 2 of The FreeBSD Handbook, available
`online <http://www.freebsd.org/handbook/install.html>`__, provides a
complete installation walk-through for users new to FreeBSD.

Acknowledgments
===============

Many companies donated equipment, network access, or man-hours to
finance the release engineering activities for FreeBSD 4.5, including
Compaq, Yahoo!, and The FreeBSD Mall.

In addition to myself, the release engineering team for 4.5-RELEASE
includes:

+-----------------------------------------+---------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >   | Release Engineering                   |
+-----------------------------------------+---------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >        | Release Engineering                   |
+-----------------------------------------+---------------------------------------+
| Bruce A. Mah <bmah@FreeBSD.org\ >       | Release Documentation                 |
+-----------------------------------------+---------------------------------------+
| Steve Price <steve@FreeBSD.org\ >       | Package Building                      |
+-----------------------------------------+---------------------------------------+
| Wilko Bulte <wilko@FreeBSD.org\ >       | Alpha Platform Release Engineering    |
+-----------------------------------------+---------------------------------------+
| Peter Wemm <peter@FreeBSD.org\ >        | Ports Cluster System Administration   |
+-----------------------------------------+---------------------------------------+

Please join me in thanking them for all the hard work which went into
making this release. I would also like to thank the FreeBSD Committers
(committers@FreeBSD.org), without whom there would be nothing to
release, and the many thousands of FreeBSD users world-wide who
contributed bug fixes, features and suggestions.

Thanks!

- Murray

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ../..
