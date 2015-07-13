================================
FreeBSD 5.4-RELEASE Announcement
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

FreeBSD 5.4-RELEASE Announcement
================================

| **Date:** Mon, 9 May 2005 17:01:58 -0400
|  **From:** Ken Smith <kensmith@FreeBSD.org>
|  **To:** freebsd-announce@FreeBSD.org
|  **Subject:** [FreeBSD-Announce] FreeBSD 5.4-RELEASE Announcement

The Release Engineering Team is happy to announce the availability of
FreeBSD 5.4-RELEASE, the latest release of the FreeBSD Stable
development branch. Since FreeBSD 5.3-RELEASE in November 2004 we have
made many improvements in functionality, stability, performance, and
device driver support for some hardware, as well as dealt with known
security issues and made many bugfixes.

For a complete list of new features, known problems, and late-breaking
news, please see the release notes and errata list, available here:

http://www.FreeBSD.org/releases/5.4R/relnotes.html

http://www.FreeBSD.org/releases/5.4R/errata.html

FreeBSD 5.4 will become an "Errata Branch". In addition to Security
fixes other well-tested fixes to basic functionality will be committed
to the RELENG\_5\_4 branch after the release. Both Security Advisories
and Errata Notices are announced on the freebsd-announce@freebsd.org
mailing list.

It is expected there will be at least one more release from the
RELENG\_5 branch, most likely two. The current plans are for the
RELENG\_6 branch to be created within the next few months, and an
initial 6.0-RELEASE will be made a few months afterwards. There will be
a 5.5-RELEASE following a few months after the 6.0-RELEASE.

For more information about FreeBSD release engineering activities,
please see:

http://www.FreeBSD.org/releng/

Dedication
----------

The FreeBSD 5.4 Release is dedicated to the memory of Cameron Grant.
Cameron was an active FreeBSD Developer and principal architect of the
sound driver subsystem despite his physical handicap. His is a superb
example of human spirit dominating over adversity. Cameron was an
inspiration to those who met him; he will be fondly remembered and
sorely missed.

Availability
------------

FreeBSD 5.4-RELEASE supports the i386, amd64, ia64, pc98, sparc64, and
alpha architectures and can be installed directly over the net, using
bootable media, or copied to a local NFS/FTP server. Distributions for
all architectures except alpha are available now. The distribution for
alpha should become available within the next day or two.

Please continue to support the FreeBSD Project by purchasing media from
one of our supporting vendors. The following companies will be offering
FreeBSD 5.4 based products:

-  FreeBSD Mall, Inc. ``http://www.freebsdmall.com/``

-  Daemonnews, Inc. ``http://www.bsdmall.com/freebsd1.html``

If you can not afford FreeBSD on media, are impatient, or just want to
use it for evangelism purposes, then by all means download the ISO
images. We can not promise that all the mirror sites will carry the
larger ISO images. At the time of this announcement they are available
from the following sites. MD5 checksums for the release images are
included at the bottom of this message.

Bittorrent
----------

As with the 5.3 release we are experimenting with Bittorrent. A
collection of trackers for the release ISO images is available at

``http://people.freebsd.org/~kensmith/5.4-torrent/``

FTP
---

At the time of this announcement the following FTP sites have FreeBSD
5.4-RELEASE available.

-  ``ftp://ftp.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp3.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp5.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.at.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.ch.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.cz.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.ee.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.es.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.fi.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.fr.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.ie.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.is.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp5.pl.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp3.ru.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.se.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.si.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.tw.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.uk.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.us.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp5.us.FreeBSD.org/pub/FreeBSD/``

FreeBSD is also available via anonymous FTP from mirror sites in the
following countries and territories: Argentina, Australia, Austria,
Brazil, Canada, China, Croatia, Czech Republic, Denmark, Estonia,
Finland, France, Germany, Greece, Hong Kong, Hungary, Iceland,
Indonesia, Ireland, Italy, Japan, Korea, Lithuania, Netherlands, New
Zealand, Norway, Poland, Portugal, Romania, Russia, Saudi Arabia,
Singapore, Slovak Republic, Slovenia, South Africa, Spain, Sweden,
Switzerland, Taiwan, Turkey, Ukraine, United Kingdom, and the United
States.

Before trying the central FTP site, please check your regional mirror(s)
first by going to:

ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD

Any additional mirror sites will be labeled ftp2, ftp3 and so on.

More information about FreeBSD mirror sites can be found at:

``       http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html``

For instructions on installing FreeBSD, please see Chapter 2 of The
FreeBSD Handbook. It provides a complete installation walk-through for
users new to FreeBSD, and can be found online at:

``     http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/install.html``

Acknowledgments
---------------

The FreeBSD Developers deserve the most thanks. Without their efforts
FreeBSD would not exist.

Many companies donated equipment, network access, or man-hours to
finance the release engineering activities for FreeBSD 5.4 including The
FreeBSD Mall, Hewlett Packard, Yahoo!, Sentex Communications, Sandvine,
Inc., FreeBSD Systems, Inc, and NTT/Verio.

The release engineering team for 5.4-RELEASE includes:

+---------------------------------------------+----------------------------------------------------------------------------------------+
| Scott Long <scottl@FreeBSD.org\ >           | Release Engineering                                                                    |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >       | Release Engineering, Security                                                          |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >            | Release Engineering                                                                    |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Ken Smith <kensmith@FreeBSD.org\ >          | Release Engineering, amd64, i386, sparc64 Release Building, Mirror Site Coordination   |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Hiroki Sato <hrs@FreeBSD.org\ >             | Release Engineering, Documentation                                                     |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Doug White <dwhite@FreeBSD.org\ >           | Release Engineering                                                                    |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Murray Stokely <murray@FreeBSD.org\ >       | Release Engineering, Documentation                                                     |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Wilko Bulte <wilko@FreeBSD.org\ >           | Alpha Release Building                                                                 |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Marcel Moolenaar <marcel@FreeBSD.org\ >     | ia64 Release Building                                                                  |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Takahashi Yoshihiro <nyan@FreeBSD.org\ >    | pc98 Release Building                                                                  |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Kris Kennaway <kris@FreeBSD.org\ >          | Package Building                                                                       |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Joe Marcus Clarke <marcus@FreeBSD.org\ >    | Package Building                                                                       |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Jacques A. Vidrine <nectar@FreeBSD.org\ >   | Security Officer                                                                       |
+---------------------------------------------+----------------------------------------------------------------------------------------+
| Paul Saab <ps@FreeBSD.org\ >                | Bittorrent Coordination                                                                |
+---------------------------------------------+----------------------------------------------------------------------------------------+

CD Image Checksums
------------------

::

      MD5 (5.4-RELEASE-amd64-bootonly.iso) = 6882dd5ce59cda1ba4a66ef45f017597
      MD5 (5.4-RELEASE-amd64-disc1.iso) = 26bca75d799c0a1690c6ae0bf0886234
      MD5 (5.4-RELEASE-amd64-disc2.iso) = 3da9debeae15a49158b01b1d92843fbc

      MD5 (5.4-RELEASE-i386-bootonly.iso) = 2afe65af7e7b994c3ce87cefda27352e
      MD5 (5.4-RELEASE-i386-disc1.iso) = 3dbb37485535e129354bc099e24aed99
      MD5 (5.4-RELEASE-i386-disc2.iso) = e4b748415ca783fce64cfafd6bd56f57

      MD5 (5.4-RELEASE-ia64-bootonly.iso) = 45b032bf952e7ea8b2c42f94c3fa4997
      MD5 (5.4-RELEASE-ia64-disc1.iso) = 2b1ad22da2ea0fe86345c99590049ebd
      MD5 (5.4-RELEASE-ia64-disc2.iso) = 62e589928628453f1813db7402b4f3ad
      MD5 (5.4-RELEASE-ia64-livefs.iso) = 6c05d71c36d84179923668faddf58e43

      MD5 (5.4-RELEASE-pc98-disc1.iso) = 003dee8647e9b2cbca7df0d92011800f

      MD5 (5.4-RELEASE-sparc64-bootonly.iso) = 91cb2304c2ecbcce0b312738649ba88d
      MD5 (5.4-RELEASE-sparc64-disc1.iso) = 5f77c9a20e09d5ef66fad9c60e17c2ac
      MD5 (5.4-RELEASE-sparc64-disc2.iso) = 7da34a32ca8196a34732548fe92d71e6

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
