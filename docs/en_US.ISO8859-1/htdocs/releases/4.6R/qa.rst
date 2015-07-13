=============================
Testing Guide for 4.6-RELEASE
=============================

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

Testing Guide for 4.6-RELEASE
=============================

Goals
~~~~~

As part of our on-going effort to improve the release engineering
process, we have identified several areas that need significant quality
assurance testing during the release candidate phase. Below, we've
listed the changes in 4.6-PRERELEASE that we feel merit the most
attention due to their involving substantial changes to the system, or
having arrived late in the development cycle leading up to the release.
In general, our goal in the QA process is to attempt to check a number
of things:

-  The system has not regressed with respects to stability, correctness,
   interoperability, or performance of features present in prior
   releases.
-  New features result in the desired improvement in stability,
   correctness, interoperability, or performance.

To effectively determine this, it's desirable to test the system in a
diverse set of environments, applying a wide set of workloads, forcing
the system to operate both within and outside its normal specification.
Particular focus should often be placed on the continuing (or new)
capability of the system to perform correctly when used in concert with
systems from other vendors.

Features to explore carefully:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  DHCP client support. This release will feature a major update of the
   ISC DHCP client (v3.0.1 RC8). The common cases have been well tested,
   but testing in more demanding or unusual environments would be
   beneficial. In particular, the new dynamic DNS update functionality
   has not been well tested.
-  sppp(4) upgrade. The ISDN project (i4b) once maintained an off-spring
   version of the SyncPPP driver, with a number of enhancements and
   bug-fixes made to it by people contributing to the i4b project. On
   the other hand, other improvements and bug-fixes of the regular
   tree's sppp driver didn't make it back to that version, so eventually
   two different SyncPPP drivers developed. The i4b version has been
   merged back in FreeBSD-current a few months ago, and these changes
   have now been folded into FreeBSD-stable as well, thus eliminating
   i4b's separate version. sppp users (of both flavours) should
   carefully test the new version. Users who previously used the i4b
   version should find all those improvements still being present (most
   notably, VJ header compression). Users who use sppp on hardware
   (HDLC) devices (like ar(4) or sr(4)) should see no breakage, but
   might notice that the negotiation of VJ header compression is now
   enabled by default. Use spppcontrol(8) to modify the default
   behaviour. Please report any breakage or oddity you observe to
   <joerg@FreeBSD.org>.
-  XFree86 4.2.0. sysinstall now installs XFree86 4.2.0 instead of
   XFree86 3.3.6; the XFree86 installation now uses \`\`normal'' binary
   packages instead of the special tarballs in past releases. The ports
   infrastructure now uses the XFree86 version 4 as the default version
   for satisfying dependencies.

The `release notes <../../relnotes.html>`__ will always be a good place
to look for things to test.

Known Issues
~~~~~~~~~~~~

-  Due to a buffer truncation in sysinstall, the GNOME meta-port
   (``x11/gnome``) in 4.6-RC1 does not install correctly. This has been
   fixed and is functional for 4.6-RC2 (and any later release candidate
   snapshots).
-  nslookup(1) had some bugs in 4.6-RC1 and 4.6-RC2. These have been
   been corrected and should function correctly beginning with 4.6-RC3.
-  Some users have reported stability issues with tagged queueing and
   the ata(4) driver. These problems have only been observed when using
   tags on motherboard-based ATA channels.
-  Potential problems with the TCP default window size (see kern/34801).
   The default window size has been reduced from 65536 to 57344 for
   4.6-RELEASE. (Errata item needed.)
-  Some of the XFree86 configuration utilities write their generated
   configuration files in places where sysinstall isn't looking for
   them, thus complicating XFree86 installs that are initiated from
   within sysinstall. These have been changed to /etc/X11/XF86Config for
   4.6-RELEASE. (Errata item needed.)
-  Some filenames in the ports tree are too long, thus resulting in odd
   /usr/@LongLink files after a sysinstall. These filenames have been
   shortened for 4.6-RELEASE.
-  Under some circumstances, dhclient can go into an infinite loop.

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
