=================================
FreeBSD 7.2-RELEASE Release Notes
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

FreeBSD 7.2-RELEASE Release Notes
=================================

Release Highlights
------------------

The highlights in the 7.2-RELEASE are the following:

-  [amd64, i386] The FreeBSD virtual memory subsystem now supports fully
   transparent use of **superpages** for application memory; application
   memory pages are dynamically promoted to or demoted from superpages
   without any modification to application code. This change offers the
   benefit of large page sizes such as improved virtual memory
   efficiency and reduced TLB (translation lookaside buffer) misses
   without downsides like application changes and virtual memory
   inflexibility. This is disabled by default and can be enabled by
   setting a loader tunable ``vm.pmap.pg_ps_enabled`` to ``1``.

-  [amd64] The FreeBSD kernel virtual address space has been increased
   to 6GB. This allows subsystems to use larger virtual memory space
   than before. For example,
   `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   adaptive replacement cache (ARC) requires large kernel memory space
   to cache file system data, so it benefits from the increased address
   space. Note that the ceiling on the kernel map size is now 60% of the
   size rather than an absolute quantity.

-  [sparc64] The FreeBSD now supports Ultra SPARC III (Cheetah)
   processor family.

-  [i386] The
   `boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   BTX loader has been improved. This fixes several boot issues on
   recent machines reported for 7.1-RELEASE and before.

-  A bug in the
   `ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
   driver which caused low “max device openings” count and led to poor
   performance has been fixed.

-  The
   `sdhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sdhci&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
   driver has been added. This supports PCI devices with class 8 and
   subclass 5 according to the SD Host Controller Specification.

-  Various network interface drivers have been improved, including
   `ae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ae&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `ath\_hal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath_hal&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   `sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
   and
   `txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__.

-  The
   `btpand(8) <http://www.FreeBSD.org/cgi/man.cgi?query=btpand&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   daemon from NetBSD has been added. This daemon provides support for
   Bluetooth Network Access Point (NAP), Group Ad-hoc Network (GN) and
   Personal Area Network User (PANU) profiles.

-  The
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   subsystem has been updated. Changes include:

   -  Multiple addresses of both IPv4 and IPv6 per jail has been
      supported. It is even possible to have jails without an IP address
      at all, which basically gives one a chrooted environment with
      restricted process view and no networking.

   -  SCTP
      (`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__)
      with IPv6 in jails has been implemented.

   -  Specific CPU binding by using
      `cpuset(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuset&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
      has been implemented. Note that the current implementation allows
      the superuser inside of the jail to change the CPU bindings
      specified. This behavior will be fixed in the next release.

   -  A
      `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
      can start with a specific route FIB now.

   -  A ``show jails`` subcommand in
      `ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
      has been added.

   -  Compatibility support which permits 32-bit jail binaries to be
      used on 64-bit systems to manage jails has been added.

   -  Note that both version numbers of ``jail`` and ``prison`` in the
      `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
      have been updated for the new features.

-  The supported version of the **GNOME** desktop environment
   (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
   has been updated from 2.22 to 2.26.

-  The supported version of the **KDE** desktop environment has been
   updated from 3.5.10
   (```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
   to 4.2.2
   (```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__).

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
