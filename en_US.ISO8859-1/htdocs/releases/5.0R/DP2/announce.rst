=============================================
FreeBSD 5.0 Developer Preview #2 Announcement
=============================================

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

-  `Home <../../../>`__

-  `About <../../../about.html>`__

   -  `Introduction <../../../projects/newbies.html>`__
   -  `Features <../../../features.html>`__
   -  `Advocacy <../../../advocacy/>`__
   -  `Marketing <../../../marketing/>`__
   -  `Privacy Policy <../../../privacy.html>`__

-  `Get FreeBSD <../../../where.html>`__

   -  `Release Information <../../../releases/>`__
   -  `Release Engineering <../../../releng/>`__

-  `Documentation <../../../docs.html>`__

   -  `FAQ <../../../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../../../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../../../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../../../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../../../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../../../docs/books.html>`__

-  `Community <../../../community.html>`__

   -  `Mailing Lists <../../../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../../../usergroups.html>`__
   -  `Events <../../../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../../../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../../../support.html>`__

   -  `Vendors <../../../commercial/commercial.html>`__
   -  `Security Information <../../../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../../../donations/>`__

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

-  `Get FreeBSD <../../../where.html>`__
-  `Release Information <../../../releases/>`__

   -  Production Release:
      `10.1 <../../../releases/10.1R/announce.html>`__
   -  Production Release:
      `9.3 <../../../releases/9.3R/announce.html>`__
   -  Production Release:
      `8.4 <../../../releases/8.4R/announce.html>`__

-  `Snapshot Releases <../../../snapshots/>`__

   -  Upcoming Release:
      `10.2 <../../../releases/10.2R/schedule.html>`__

-  `Ported Applications <../../../ports/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD 5.0 Developer Preview #2 Announcement
=============================================

| **Date:** Monday, 18 Nov 2002 16:39:13 -0800
|  **From:** bmah@FreeBSD.org (Bruce A. Mah)
|  **To:** freebsd-announce@FreeBSD.org
|  **Subject:** FreeBSD 5.0 Developer Preview #2 Now Available

The FreeBSD Project is proud to announce the availability of the second
Developer Preview snapshot of FreeBSD 5.0 (5.0-DP2). This snapshot,
intended for widespread testing purposes, is the latest milestone
towards the eventual release of FreeBSD 5.0-RELEASE, currently scheduled
for mid-December 2002.

Since the release of 5.0-DP1, a number of new features have been added
on the CURRENT development branch. A few of these include:

-  The GEOM disk geometry module and the GBDE on-disk encryption system.
-  A compiler toolchain based on GCC 3.2.
-  A new extensible Mandatory Access Control framework, the TrustedBSD
   MAC Framework.
-  The new UFS2 on-disk format, with support for larger filesystems and
   extended file attributes.
-  Support for Firewire devices.
-  Experimental support for the RAIDframe software RAID disk driver.

Much more information can be found in the release documentation, as
described below.

WARNING
=======

This snapshot is not a supported release, and has not undergone any of
the usual quality assurance checking that is a part of normal FreeBSD
releases. It may include serious software bugs. Do not install this
software on a machine where important data may be put at risk.

The purpose of this snapshot is to get wider exposure to FreeBSD 5.0's
new features, in advance of the release. As such, we expect that testers
of 5.0-DP2 will follow the technical discussions on the
`freebsd-current@ <mailto:freebsd-current@FreeBSD.org>`__ mailing list.

AVAILABILITY
============

FreeBSD 5.0-DP2 is being released for the alpha, ia64, i386, pc98, and
sparc64 architectures. As of this writing, 5.0-DP2/i386 is available,
with other architectures to follow soon.

The checksums for the two i386 ISO images are as follows:

``MD5 (5.0-DP2-disc1.iso) = 997ef9ed5aa3e0721678f5482d2fc664 MD5 (5.0-DP2-disc2.iso) = 425718dbf1b771c8317556b7a13842c6``

Before trying the central FTP site, we strongly recommend that you check
FTP mirror sites in your country or region, such as:

``ftp://ftp.<yourcountry>.FreeBSD.org/pub/FreeBSD/``

Any additional mirror sites will be named ftp2, ftp3, and so forth.
Appendix A of the FreeBSD Handbook has additional information about
FreeBSD mirror sites; it is available on-line at:

``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html``

Some of the mirror sites known to carry 5.0-DP2 (in alphabetical order
by country code) are:

-  ftp://ftp.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp2.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp2.at.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp.au.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp4.de.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp.dk.FreeBSD.org/pub/FreeBSD/

Release documentation is available in the distributions, as well as on
the FreeBSD Web site:

-  Release notes: http://www.FreeBSD.org/releases/5.0R/DP2/relnotes.html
-  Hardware notes:
   http://www.FreeBSD.org/releases/5.0R/DP2/hardware.html
-  Errata: http://www.FreeBSD.org/releases/5.0R/DP2/errata.html
-  Early Adopter's Guide:
   http://www.FreeBSD.org/releases/5.0R/DP2/early-adopter.html

LATE-BREAKING NEWS
==================

Certain parts of the KDE and GNOME desktop environments did not make it
to the package sets in the i386 ISO images.

The sparc64 and ia64 snapshots may or may not have package sets
associated with them.

ACKNOWLEDGEMENTS
================

The FreeBSD Project wishes to thank the companies, developers, and users
who continue to make FreeBSD releases possible.

Many companies donated equipment, network access, or person-hours to
finance our ongoing release engineering activities, including The
FreeBSD Mall, Compaq, Yahoo!, Sentex Communications, NTT/Verio, and
Packet Design. We greatly appreciate their contributions.

The release engineering team for 5.0-DP2 includes:

+--------------------------------------------+-------------------------------------------------+
| Murray Stokely <murray@FreeBSD.org\ >      | Release Engineering Team Lead                   |
+--------------------------------------------+-------------------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >           | Release Engineering, alpha and sparc64 Builds   |
+--------------------------------------------+-------------------------------------------------+
| Scott Long <scottl@FreeBSD.org\ >          | Developer Communications                        |
+--------------------------------------------+-------------------------------------------------+
| Bruce A. Mah <bmah@FreeBSD.org\ >          | Release Documentation, i386 Build               |
+--------------------------------------------+-------------------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >      | Release Engineering, Security                   |
+--------------------------------------------+-------------------------------------------------+
| Marcel Moolenaar <marcel@FreeBSD.org\ >    | ia64 Build                                      |
+--------------------------------------------+-------------------------------------------------+
| TAKAHASHI Yoshihiro <nyan@FreeBSD.org\ >   | pc98 Build                                      |
+--------------------------------------------+-------------------------------------------------+
| Kris Kennaway <kris@FreeBSD.org\ >         | i386 and alpha Package Builds                   |
+--------------------------------------------+-------------------------------------------------+

FreeBSD 5.0-DP2 is, as with every release, a cooperative effort of all
of the FreeBSD committers <committers@FreeBSD.org\ >, as well as FreeBSD
users all over the world who have submitted new features, bug fixes, and
suggestions. Please join us in thanking everyone for their hard work in
polishing and improving the state of the FreeBSD -CURRENT development
branch.

We'd like to emphasize once again that this snapshot represents a
work-in-progress. Please help us by testing it now, so that we can make
FreeBSD 5.0-RELEASE as stable and useful as possible.

Thanks!

| Bruce A. Mah
|  (For the FreeBSD Release Engineering Team)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../../../search/index-site.html>`__ \| `Legal
Notices <../../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../../layout/images/logo-red.png
   :target: ../../..
