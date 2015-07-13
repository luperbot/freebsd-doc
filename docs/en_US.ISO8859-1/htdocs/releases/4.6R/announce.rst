================================
FreeBSD 4.6-RELEASE Announcement
================================

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

FreeBSD 4.6-RELEASE Announcement
================================

| **Date:** Sat, 15 Jun 2002 16:34:26 -0700
|  **From:** "Bruce A. Mah" <bmah@FreeBSD.org>
|  **To:** freebsd-announce@FreeBSD.org
|  **Subject:** FreeBSD 4.6-RELEASE is now available

I am happy to announce the availability of FreeBSD 4.6-RELEASE, the very
latest release on the FreeBSD -STABLE development branch. Since FreeBSD
4.5-RELEASE in January 2002, we have made hundreds of fixes, updated
many system components, and addressed a wide variety of security issues.

One of the most significant changes in FreeBSD 4.6 is the adoption of
XFree86 4.2.0 as the default version of the X Windows System. We
encourage users (particularly those upgrading from older installations
of XFree86) to consult the relevant section of the FreeBSD Handbook for
information on installing and configuring XFree86 4.2.0. This
information can be found on-line at:

http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/x11.html

On systems with the doc distribution installed, it can also be found at:

``/usr/share/doc/en_US.ISO8859-1/books/handbook/x11.html``

A number of enhancements to network device drivers have been made, as
well as updates to the ATA storage subsystem.

Some contributed programs have been updated, such as sendmail (updated
to 8.12.3) and the ISC DHCP client (updated to 3.0.1RC8).

For more information about the most significant changes with this
release of FreeBSD, please see the release notes:

http://www.FreeBSD.org/releases/4.6R/relnotes.html

It is also useful to peruse the errata file, as it contains
late-breaking news about the release:

http://www.FreeBSD.org/releases/4.6R/errata.html

For more information about FreeBSD release engineering activities
(including a schedule of upcoming releases), please see:

http://www.FreeBSD.org/releng/

Availability
============

FreeBSD 4.6-RELEASE supports the i386 and alpha architectures and can be
installed directly over the net using the boot floppies or copied to a
local NFS/FTP server. Distributions for the i386 are available now. As
of this writing, the final builds for the alpha architecture are in
progress and will be made available shortly.

We can't promise that all the mirror sites will carry the larger ISO
images, but they will at least be available from:

-  ftp://ftp.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp2.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp.au.freebsd.org/pub/FreeBSD/
-  ftp://ftp.cz.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp.lt.FreeBSD.org/pub/FreeBSD/
-  ftp://freebsd.nctu.edu.tw/FreeBSD/

If you can't afford FreeBSD on media, are impatient, or just want to use
it for evangelism purposes, then by all means download the ISO images,
otherwise please continue to support the FreeBSD Project by purchasing
media from one of our supporting vendors. The following companies have
contributed substantially to the development of FreeBSD:

+-------------------------+----------------------------------------+
| FreeBSD Mall, Inc.      | http://www.freebsdmall.com/            |
+-------------------------+----------------------------------------+
| FreeBSD Services Ltd.   | http://www.freebsd-services.com/       |
+-------------------------+----------------------------------------+
| Daemon News             | http://www.bsdmall.com/freebsd1.html   |
+-------------------------+----------------------------------------+

Each CD or DVD set contains the FreeBSD installation and application
package bits for the i386 ("PC") architecture. For a set of distfiles
used to build ports in the ports collection, please see the FreeBSD
Toolkit, a 6 CD set containing extra bits which no longer fit on the 4
CD set, or the DVD distribution from FreeBSD Services Ltd.

FreeBSD is also available via anonymous FTP from mirror sites in the
following countries: Argentina, Australia, Brazil, Bulgaria, Canada,
China, Czech Republic, Denmark, Estonia, Finland, France, Germany, Hong
Kong, Hungary, Iceland, Ireland, Israel, Japan, Korea, Lithuania, the
Netherlands, New Zealand, Poland, Portugal, Romania, Russia, Saudi
Arabia, South Africa, Slovak Republic, Slovenia, Spain, Sweden, Taiwan,
Thailand, Trantor, Ukraine, and the United Kingdom.

Before trying the central FTP site, please check your regional mirror(s)
first by going to:

ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD

Any additional mirror sites will be labeled ftp2, ftp3 and so on.

More information about FreeBSD mirror sites can be found at:

http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html

For instructions on installing FreeBSD, please see Chapter 2 of The
FreeBSD Handbook. It provides a complete installation walk-through for
users new to FreeBSD, and can be found online at:

http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/install.html

Acknowledgments
===============

Many companies donated equipment, network access, or man-hours to
finance the release engineering activities for FreeBSD 4.6, including
Compaq, Yahoo!, and The FreeBSD Mall.

In addition to myself, the release engineering team for 4.6-RELEASE
includes:

+-----------------------------------------+-----------------------------------------+
| Murray Stokely <murray@FreeBSD.org\ >   | Release Engineering Lead, i386 Builds   |
+-----------------------------------------+-----------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >   | Release Engineering                     |
+-----------------------------------------+-----------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >        | Release Engineering, alpha Builds       |
+-----------------------------------------+-----------------------------------------+
| Brian Somers <brian@FreeBSD.org\ >      | Release Engineering                     |
+-----------------------------------------+-----------------------------------------+
| Steve Price <steve@FreeBSD.org\ >       | Package Splits                          |
+-----------------------------------------+-----------------------------------------+
| Will Andrews <will@FreeBSD.org\ >       | Package Splits                          |
+-----------------------------------------+-----------------------------------------+
| Kris Kennaway <kris@FreeBSD.org\ >      | Package Building                        |
+-----------------------------------------+-----------------------------------------+
| David O'Brien <obrien@FreeBSD.org\ >    | XFree86 Integration                     |
+-----------------------------------------+-----------------------------------------+

Please join me in thanking them for all the hard work which went into
making this release. Many thanks are also due to the FreeBSD committers
(committers@FreeBSD.org), without whom there would be nothing to
release, and thousands of FreeBSD users world-wide who have contributed
bug fixes, features, and suggestions.

Enjoy!

| Bruce A. Mah
|  (For the FreeBSD Release Engineering Team)

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
