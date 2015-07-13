=============================================
FreeBSD 5.0 Developer Preview #1 Announcement
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

FreeBSD 5.0 Developer Preview #1 Announcement
=============================================

| **Date:** Monday, 8 Apr 2002 15:00:00 -0800
|  **From:** "Murray Stokely" <murray@FreeBSD.org>
|  **To:** announce@FreeBSD.org
|  **Subject:** FreeBSD 5.0 Developer Preview #1 Now Available

A Developer Preview release of FreeBSD 5.0-CURRENT is now available for
widespread testing. This preview is a significant milestone towards the
eventual release of FreeBSD 5.0 in late 2002. Some of the many new
features that are available in this snapshot are listed below:

-  SMP support has been largely reworked, incorporating code from BSD/OS
   5.0 (in progress).
-  The random(4) device has been rewritten to use the Yarrow algorithm.
   It harvests entropy from a variety of interrupt sources (hardware
   devices) to provide the entropy required by strong cryptography.
-  Support for 32-bit Cardbus devices has been added for mobile
   computers (NEWCARD).
-  Significant security enhancements have been made throughout the
   system, including a reworked PAM implementation, ACLs, and fewer
   privileged programs in the base system.
-  An implementation of scheduler activiations has been added to the
   kernel to more efficiently handle multi-threaded programs. (in
   progress).
-  A device filesystem has been added to allow entries in the /dev
   directory to be automatically attached. Among other benefits, devfs
   provides better support for attaching and detaching peripheral
   devices.
-  Support for the sparc64 architecture, including most modern
   workstations and entry level servers from Sun Microsystems (and
   possibly clones from Tatung, and others).
-  FFS snapshots and background fsck(8).

WARNING
=======

--------------

This is a development snapshot, and may include serious software bugs.
Do not install this on a machine where important data may be put at
risk. In addition, a number of debugging options are turned on by
default, so the poor performance of this snapshot should not set
expectations for the final release of 5.0.

--------------

That said, we have done our best to provide a stable system for
developers and power-users to help test the new functionality in 5.0.
For a complete list of new features and known problems, please see the
`release
notes <http://www.FreeBSD.org/releases/5.0R/DP1/relnotes.html>`__ and
`errata list <http://www.FreeBSD.org/releases/5.0R/DP1/errata.html>`__.

Availability
============

5.0-DP1 is available for the i386, alpha, and sparc64 architectures and
can be installed directly over the net using the boot floppies or copied
to a local NFS/FTP server.

If you can't afford the CDs, are impatient, or just want to use it for
evangelism purposes, then by all means download the ISOs, otherwise
please continue to support the FreeBSD project by purchasing media from
one of our supporting vendors. This Developer Preview release is
available on CD-ROM from the `FreeBSD
Mall <http://www.FreeBSDmall.com>`__.

http://www.FreeBSDMall.com/
FreeBSD is also available via anonymous FTP from mirror sites in the
following countries: Argentina, Australia, Brazil, Bulgaria, Canada,
China, Czech Republic, Denmark, Estonia, Finland, France, Germany, Hong
Kong, Hungary, Iceland, Ireland, Israel, Japan, Korea, Lithuania,
Latvia, the Netherlands, Poland, Portugal, Romania, Russia, Saudi
Arabia, South Africa, Slovak Republic, Slovenia, Spain, Sweden, Taiwan,
Thailand, the Ukraine, the United Kingdom, and the United States.

Before trying the central FTP site, please check your regional mirror(s)
first by going to:

``ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD``
Any additional mirror sites will be labeled ftp2, ftp3 and so on.

We can't promise that all the mirror sites will carry the larger ISO
images, but they will at least be available from:

-  ftp://ftp.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp2.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp5.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp.au.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp.uk.FreeBSD.org/pub/FreeBSD/
-  ftp://ftp.dk.FreeBSD.org/pub/FreeBSD/

See the `FreeBSD Handbook <http://www.FreeBSD.org/handbook>`__ for
additional information about FreeBSD mirror sites.

Acknowledgments
===============

Finally, we would like to thank the developers, users, and companies
that continue to make FreeBSD releases possible.

Many companies donated equipment, network access, or man-hours to
finance our ongoing release engineering activities, including
`Compaq <http://www.compaq.com>`__, `Yahoo! <http://www.yahoo.com>`__,
and `The FreeBSD Mall <http://www.freebsdmall.com>`__.

I couldn't possibly list all of the people that have helped make 5.0 DP1
a reality, but the following people deserve to be singled out. Will
Andrews, Kris Kennaway, Steve Price, and the rest of the Ports team did
an incredible job fixing hundreds of third-party packages. Robert Watson
and Bruce A. Mah did an excellent job writing up the errata file,
helping to decide what changes should be made specifically for this DP
release, and much more. Jake Burkholder acted not only as lead developer
for the sparc64 port, but also as package builder and release engineer!
David O'Brien helped integrate XFree86 4.2 into this snapshot.

Please join me in thanking them for all the hard work that went into
polishing the FreeBSD -CURRENT development branch over the past month. I
would also like to thank the FreeBSD Committers
(committers@FreeBSD.org), without whom there would be nothing to
release, and the many thousands of FreeBSD users world-wide who
contributed bug fixes, features and suggestions.

Above all else, remember that this is a work in progress. Please help us
find bugs now, so that 5.0-RELEASE will be that much better.

Thanks!

- Murray

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
