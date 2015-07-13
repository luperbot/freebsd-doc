=================================
FreeBSD 8.0-RELEASE Release Notes
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

FreeBSD 8.0-RELEASE Release Notes
=================================

Release Highlights
------------------

The highlights in the 8.0-RELEASE are the following:

-  A new virtualization container named “vimage” has been implemented.
   This is a jail with a virtualized instance of the FreeBSD network
   stack and can be created by using
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+8.0-RELEASE>`__
   command.

-  The FreeBSD netisr framework has been reimplemented for parallel
   threading support. This is a kernel network dispatch interface which
   allows device drivers (and other packet sources) to direct packets to
   protocols for directly dispatched or deferred processing. The new
   implementation supports up to one netisr thread per CPU, and several
   benchmarks on SMP machines show substantial performance improvement
   over the previous version.

-  The FreeBSD TTY layer has been replaced with a new one which has
   better support for SMP and robust resource handling. A tty now has
   own mutex and it is expected to improve scalability when compared to
   the old implementation based on the Giant lock.

-  [amd64, i386] The FreeBSD Linux emulation layer has been updated to
   version 2.6.16 and the default Linux infrastructure port is now
   ``emulators/linux_base-f10`` (Fedora 10).

-  The FreeBSD ``GENERIC`` kernel now includes Trusted BSD MAC
   (Mandatory Access Control) support. No MAC policy module is loaded by
   default.

-  The FreeBSD USB subsystem has been reimplemented to support modern
   devices and better SMP scalability. The new implementation includes
   Giant-lock-free device drivers, a Linux compatibility layer,
   `usbconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbconfig&sektion=8&manpath=FreeBSD+8.0-RELEASE>`__
   utility, full support for split transaction and isochronous
   transaction, and so on.

-  The FreeBSD CAM SCSI subsystem
   (`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.0-RELEASE>`__)
   now includes experimental support for ATA/SATA/AHCI-compliant
   devices.

-  The shared vnode locking for pathname lookups in the
   `VFS(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VFS&sektion=9&manpath=FreeBSD+8.0-RELEASE>`__
   subsystem has been improved.

-  The **ZFS** file system has been updated to version 13. The changes
   include ZFS operations by a regular user, L2ARC, ZFS Intent Log on
   separated disks (slog), sparse volumes, and so on.

-  The FreeBSD NFS subsystem now supports ``RPCSEC_GSS`` authentication
   on both the client and server.

-  The FreeBSD NFS subsystem now includes a new, experimental
   implementation with support for NFSv2, NFSv3, and NFSv4.

-  The wireless network support layer (net80211) now supports multiple
   BSS instances on the supported network devices.

-  The FreeBSD L2 address translation table has been reimplemented to
   reduce lock contention on parallel processing and simplify the
   routing logic.

-  The IGMPv3 and SSM (Source-Specific Multicast) including IPv6 SSM and
   MLDv2 have been added.

-  The
   `ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+8.0-RELEASE>`__
   subsystem now supports NAT-Traversal (RFC 3948).

-  The GCC stack protection (also known as ProPolice) has been enabled
   in the FreeBSD base system.

-  The supported version of the **GNOME** desktop environment
   (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
   has been updated to 2.26.3.

-  The supported version of the **KDE** desktop environment
   (```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
   has been updated to 4.3.1.

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
