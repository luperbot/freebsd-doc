================================
FreeBSD 5.0-RELEASE Announcement
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

FreeBSD 5.0-RELEASE Announcement
================================

| **Date:** Sun, 19 Jan 2003 10:03:42 -0700
|  **From:** scottl@FreeBSD.org (Scott Long)
|  **To:** freebsd-announce@FreeBSD.org
|  **Subject:** FreeBSD 5.0 Release Available

It is my privilege and pleasure to announce the availability of FreeBSD
5.0-RELEASE. The culmination of nearly three years of work, this release
starts FreeBSD on the path of advanced multiprocessor and application
thread support and introduces support for the sparc64 and ia64
platforms. Among the long list of new and improved features:

-  UFS2, the second generation UFS filesystem, shatters the current 1TB
   filesystem barrier.
-  Background filesystem checking (bgfsck) and filesystem snapshots
   eliminate the need for downtime to do filesystem repair and backup
   tasks.
-  Experimental support for Mandatory Access Controls (MAC) provide an
   extensible and flexible means for administrators to define system
   security policies.
-  Fine-grained locking in the kernel paves the road for much higher
   efficiency of multi-processor systems.
-  Support for Bluetooth, ACPI, CardBus, IEEE 1394, and experimental
   hardware crypto acceleration keeps FreeBSD at the forefront of new
   technology.
-  The GCC 3.2.1 compiler provides the latest installment of the
   ever-improving GNU Compiler Collection.
-  GEOM, the extensible and flexible storage framework, and DEVFS, the
   device virtual filesystem, simplify storage and device management
   while opening the door for new enterprise storage technologies.
-  Support for the sparc64 and ia64 platforms expands FreeBSD's support
   of advanced 64-bit computing platforms.

Although FreeBSD 5.0 contains a number of new and exciting features, it
may not be suitable for all users. More conservative users may prefer to
continue using FreeBSD 4.X. Information on the various trade-offs
involved, as well as some notes on future plans for both FreeBSD 4.X and
5.X, can be found in the Early Adopter's Guide, available here:

``http://www.FreeBSD.org/releases/5.0R/early-adopter.html``

For a complete list of new features and known problems, please see the
release notes and errata list, available here:

``http://www.FreeBSD.org/releases/5.0R/relnotes.html``

``http://www.FreeBSD.org/releases/5.0R/errata.html``

For more information about FreeBSD release engineering activities,
please see:

``http://www.FreeBSD.org/releng/``

**Availability**

FreeBSD 5.0-RELEASE supports the i386, pc98, alpha, sparc64, and ia64
architectures and can be installed directly over the net using the boot
floppies or copied to a local NFS/FTP server. Distributions for all
architectures are available now.

Please continue to support the FreeBSD Project by purchasing media from
one of our supporting vendors. The following companies will be offering
FreeBSD 5.0 based products:

+----------------------+--------------------------------------------+
| FreeBSD Mall, Inc.   | ``http://www.freebsdmall.com/``            |
+----------------------+--------------------------------------------+
| Daemonnews, Inc.     | ``http://www.bsdmall.com/freebsd1.html``   |
+----------------------+--------------------------------------------+

If you can't afford FreeBSD on media, are impatient, or just want to use
it for evangelism purposes, then by all means download the ISO images.
We can't promise that all the mirror sites will carry the larger ISO
images, but they will at least be available from:

-  ``ftp://ftp.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp12.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.tw.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp3.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp4.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp5.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.cz.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp7.de.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.lt.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.za.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.se.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp1.ru.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.ru.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp4.ru.FreeBSD.org/pub/FreeBSD/``

FreeBSD is also available via anonymous FTP from mirror sites in the
following countries: Argentina, Australia, Brazil, Bulgaria, Canada,
China, Czech Republic, Denmark, Estonia, Finland, France, Germany, Hong
Kong, Hungary, Iceland, Ireland, Japan, Korea, Lithuania, the
Netherlands, New Zealand, Poland, Portugal, Romania, Russia, Saudi
Arabia, South Africa, Slovak Republic, Slovenia, Spain, Sweden, Taiwan,
Thailand, Ukraine, and the United Kingdom.

Before trying the central FTP site, please check your regional mirror(s)
first by going to:

``ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD``

Any additional mirror sites will be labeled ftp2, ftp3 and so on.

More information about FreeBSD mirror sites can be found at:

``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html``

For instructions on installing FreeBSD, please see Chapter 2 of The
FreeBSD Handbook. It provides a complete installation walk-through for
users new to FreeBSD, and can be found online at:

``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/install.html``

**Acknowledgments**

Many companies donated equipment, network access, or man-hours to
finance the release engineering activities for FreeBSD 5.0 including The
FreeBSD Mall, Compaq, Yahoo!, Sentex Communications, and NTT/Verio.

The release engineering team for 5.0-RELEASE includes:

+---------------------------------------------+--------------------------------------+
| Scott Long <scottl@FreeBSD.org\ >           | Release Engineering and Building     |
+---------------------------------------------+--------------------------------------+
| Bruce A. Mah <bmah@FreeBSD.org\ >           | Release Engineering, Documentation   |
+---------------------------------------------+--------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >       | Release Engineering, Security        |
+---------------------------------------------+--------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >            | Release Engineering                  |
+---------------------------------------------+--------------------------------------+
| Murray Stokely <murray@FreeBSD.org\ >       | Release Engineering                  |
+---------------------------------------------+--------------------------------------+
| Marcel Moolenaar <marcel@FreeBSD.org\ >     | IA64 Release Building                |
+---------------------------------------------+--------------------------------------+
| Takahashi Yoshihiro <nyan@FreeBSD.org\ >    | PC98 Release Building                |
+---------------------------------------------+--------------------------------------+
| Kris Kennaway <kris@FreeBSD.org\ >          | Package Building                     |
+---------------------------------------------+--------------------------------------+
| Jacques A. Vidrine <nectar@FreeBSD.org\ >   | Security Officer                     |
+---------------------------------------------+--------------------------------------+

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
