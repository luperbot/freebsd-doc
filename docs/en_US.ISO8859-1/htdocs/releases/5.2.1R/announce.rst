==================================
FreeBSD 5.2.1-RELEASE Announcement
==================================

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

FreeBSD 5.2.1-RELEASE Announcement
==================================

| **Date:** Wed, 25 Feb 2004 20:31:31 -0700 (MST)
|  **From:** Scott Long <scottl@FreeBSD.org>
|  **To:** freebsd-announce@FreeBSD.org
|  **Subject:** [FreeBSD-Announce] FreeBSD 5.2.1 Released!

It is once again my great privilege and pleasure to announce the
availability of FreeBSD 5.2.1-RELEASE. This is a 'point release' and is
intended to address several bugs and vulnerabilities discovered in the
FreeBSD 5.2 release. These include:

-  Significantly improved ATA/IDE and SATA handling. Problems with
   timeouts, error recovery, and certain master/slave configurations
   have been largely addressed.
-  The ``kdeadmin3`` package has been updated to fix the password
   database corruption found with the KUser tool.
-  Third-party NSS modules can now support groups with many users.
-  Multicast and promiscuous modes have been fixed in the 'sk' Ethernet
   driver, allowing it to operate in a DHCP environment.
-  Latest updates to the XFree86 4.3 server to protect against several
   published security vulnerabilities.

FreeBSD 5.2.1 also contains a number of other significant stability and
security improvements over FreeBSD 5.2. However, it is still considered
a 'New Technology' release and might not be suitable for all users.
Those with more conservative needs may prefer to continue using FreeBSD
4.X. Information on the various trade-offs involved, as well as some
notes on future plans for both FreeBSD 4.X and 5.X, can be found in the
Early Adopter's Guide, available here:

``http://www.FreeBSD.org/releases/5.2.1R/early-adopter.html``

For a complete list of new features and known problems, please see the
release notes and errata list, available here:

``http://www.FreeBSD.org/releases/5.2.1R/relnotes.html``

``http://www.FreeBSD.org/releases/5.2.1R/errata.html``

For more information about FreeBSD release engineering activities,
please see:

``http://www.FreeBSD.org/releng/``

**Availability**

FreeBSD 5.2.1-RELEASE supports the i386, pc98, alpha, sparc64, amd64,
and ia64 architectures and can be installed directly over the net using
the boot floppies or copied to a local NFS/FTP server. Distributions for
all architectures are available now.

Please continue to support the FreeBSD Project by purchasing media from
one of our supporting vendors. The following companies will be offering
FreeBSD 5.2.1 based products:

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
-  ``ftp://ftp2.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp3.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp4.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp5.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp7.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp14.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.cz.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.de.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp3.de.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp7.de.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp6.tw.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp1.ru.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.ru.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp5.uk.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp7.uk.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.us.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp4.us.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp11.us.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp14.us.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp15.us.FreeBSD.org/pub/FreeBSD/``

FreeBSD is also available via anonymous FTP from mirror sites in the
following countries: Argentina, Australia, Brazil, Bulgaria, Canada,
China, Czech Republic, Denmark, Estonia, Finland, France, Germany, Hong
Kong, Hungary, Iceland, Ireland, Japan, Korea, Lithuania, Amylonia, the
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
finance the release engineering activities for FreeBSD 5.2.1 including
The FreeBSD Mall, Compaq, Yahoo!, Sentex Communications, and NTT/Verio.

The release engineering team for 5.2.1-RELEASE includes:

+---------------------------------------------+--------------------------------------------------------+
| Scott Long <scottl@FreeBSD.org\ >           | Release Engineering, I386 and Alpha Release Building   |
+---------------------------------------------+--------------------------------------------------------+
| Bruce A. Mah <bmah@FreeBSD.org\ >           | Release Engineering, Documentation                     |
+---------------------------------------------+--------------------------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >       | Release Engineering, Security                          |
+---------------------------------------------+--------------------------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >            | Release Engineering                                    |
+---------------------------------------------+--------------------------------------------------------+
| Murray Stokely <murray@FreeBSD.org\ >       | Release Engineering                                    |
+---------------------------------------------+--------------------------------------------------------+
| Ken Smith <kensmith@FreeBSD.org\ >          | Sparc64 Release Building, Mirror Site Coordination     |
+---------------------------------------------+--------------------------------------------------------+
| Marcel Moolenaar <marcel@FreeBSD.org\ >     | IA64 Release Building                                  |
+---------------------------------------------+--------------------------------------------------------+
| David O'Brien <obrien@FreeBSD.org\ >        | AMD64 Release Building                                 |
+---------------------------------------------+--------------------------------------------------------+
| Takahashi Yoshihiro <nyan@FreeBSD.org\ >    | PC98 Release Building                                  |
+---------------------------------------------+--------------------------------------------------------+
| Kris Kennaway <kris@FreeBSD.org\ >          | Package Building                                       |
+---------------------------------------------+--------------------------------------------------------+
| Joe Marcus Clarke <marcus@FreeBSD.org\ >    | Package Building                                       |
+---------------------------------------------+--------------------------------------------------------+
| Jacques A. Vidrine <nectar@FreeBSD.org\ >   | Security Officer                                       |
+---------------------------------------------+--------------------------------------------------------+

**CD Image Checksums**

::

    MD5 (5.2.1-RELEASE-alpha-bootonly.iso) = 44136b68eb96d0b0776fcbca3648b020
    MD5 (5.2.1-RELEASE-alpha-disc1.iso) = ff5a9ebff52dba2db2e5afdfc996cfe4
    MD5 (5.2.1-RELEASE-alpha-disc2.iso) = bace8bceb3186b5bdeccccdc1c2b26cb
    MD5 (5.2.1-RELEASE-alpha-miniinst.iso) = 2a30597f5306a539963e826f1f29fb91

    MD5 (5.2.1-RELEASE-amd64-bootonly.iso) = 60a590202b07b264d33e30a40f745ba6
    MD5 (5.2.1-RELEASE-amd64-disc1.iso) = 7fdc18683561f58df0a2bc6327a6552b
    MD5 (5.2.1-RELEASE-amd64-disc2.iso) = fce7b8a76e85772c9d572b84ba1107af
    MD5 (5.2.1-RELEASE-amd64-miniinst.iso) = ff4d14fffaa8c4864e167f7df57189ee

    MD5 (5.2.1-RELEASE-i386-bootonly.iso) = 5035853dd92a0807645dc1674a2ee028
    MD5 (5.2.1-RELEASE-i386-disc1.iso) = 9a1c764680504f5b7d2fb8c2d07de8e0
    MD5 (5.2.1-RELEASE-i386-disc2.iso) = 86b96a834fdda87f7436373c53ff3662
    MD5 (5.2.1-RELEASE-i386-miniinst.iso) = 6f035aef6598c0307cf53a896ccfa12f

    MD5 (5.2.1-RELEASE-ia64-bootonly.iso) = dcdb3bc8fc5ae29fa7deeb836debc0a7
    MD5 (5.2.1-RELEASE-ia64-disc2.iso) = 59349f53622559263f77a6d599ebb74e
    MD5 (5.2.1-RELEASE-ia64-miniinst.iso) = 80148ffa7420828e28ce53ccfe3f1b8b

    MD5 (5.2.1-RELEASE-pc98-disc2.iso) = 06243edad4243fbdfa45f34965c13e5d
    MD5 (5.2.1-RELEASE-pc98-miniinst.iso) = 513c50b09da1cf1d8afda8df3599e754

    MD5 (5.2.1-RELEASE-sparc64-bootonly.iso) = e9b3e29c6c78aeb5f9176f8c04b9de93
    MD5 (5.2.1-RELEASE-sparc64-disc1.iso) = f9d463ccd832a3157603c68ddb9126ae
    MD5 (5.2.1-RELEASE-sparc64-disc2.iso) = 8a2c544ce9d9a6c632c8a5120ee99bc7
    MD5 (5.2.1-RELEASE-sparc64-miniinst.iso) = 069784739bd4c2244077f8423d97fda6

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
