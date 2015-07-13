=================================
FreeBSD 7.3-RELEASE Release Notes
=================================

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

FreeBSD 7.3-RELEASE Release Notes
=================================

Release Highlights
------------------

The highlights in the 7.3-RELEASE are the following:

-  The **ZFS** file system has been updated to version 13. The changes
   include ZFS operations by a regular user, L2ARC, ZFS Intent Log on
   separated disks (slog), sparse volumes, and so on.

-  A lock handling error has been fixed in interaction between
   `malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+7.3-stable>`__
   implementation and threading library.

-  A deadlock in the
   `sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+7.3-stable>`__
   scheduler has been fixed.

-  A new sysctl variable ``security.bsd.map_at_zero`` has been added and
   set to ``1`` (allow) by default. This controls whether FreeBSD allows
   to map an object at the address ``0``, which is part of the
   user-controlled portion of the virtual address space. Disabling this
   has some effect on preventing an attack which injects malicious code
   into that location and triggers a NULL pointer dereference in the
   kernel.

-  A new boot loader ``gptzfsboot``, which supports GPT and ZFS has been
   added. ``zfsloader``, the final boot loader similar to
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+7.3-stable>`__
   which supports ZFS has been added.

-  [amd64, i386] CPU cache flushing has been optimized when changing
   caching attributes of pages by doing nothing for CPUs that support
   self-snooping and using ``CLFLUSH`` instead of a full cache
   invalidate when possible.

-  The **amdsbwd(4)** driver for AMD SB600/SB7xx watchdog timer has been
   added.

-  [amd64, i386] The
   `hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+7.3-stable>`__
   driver for Hardware Performance Monitoring Counter support has been
   added.

-  **DRM** now supports Radeon HD 4200 (RS880), 4770 (RV740), and R6/7xx
   3D, and Intel G41 chips.

-  The
   `alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+7.3-stable>`__
   driver for Atheros AR8131/AR8132 PCIe Ethernet controller has been
   added.

-  [sparc64] The
   `cas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cas&sektion=4&manpath=FreeBSD+7.3-stable>`__
   driver has been added to provide support for Sun Cassini/Cassini+ and
   National Semiconductor DP83065 Saturn Gigabit Ethernet devices.

-  A userland utility
   `mfiutil(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mfiutil&sektion=8&manpath=FreeBSD+7.3-stable>`__
   for the
   `mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+7.3-stable>`__
   devices has been added.

-  A userland utility
   `mptutil(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mptutil&sektion=8&manpath=FreeBSD+7.3-stable>`__
   for the
   `mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+7.3-stable>`__
   devices has been added.

-  The
   `yp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=yp&sektion=8&manpath=FreeBSD+7.3-stable>`__
   utilities now support ``shadow.byname`` and ``shadow.byuid`` maps.
   These requires privileged port access.

-  The
   `service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8&manpath=FreeBSD+7.3-stable>`__
   command as an easy interface for the rc.d scripts has been added.

-  **ISC BIND** has been updated to version 9.4-ESV.

-  **sendmail** has been updated from version 8.14.3 to version 8.14.4.

-  The supported version of the **GNOME** desktop environment
   (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
   has been updated to 2.28.2.

-  The supported version of the **KDE** desktop environment
   (```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
   has been updated to 4.3.5.

-  FreeBSD release ISO images now have “FreeBSD-” at the beginning of
   the filenames.

For more details, please see `the Detailed Release
Notes <relnotes-detailed.html>`__.

A list of all platforms currently under development can be found on the
`Supported Platforms <../../platforms/index.html>`__ page.

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
