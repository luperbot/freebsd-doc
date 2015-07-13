=================================
FreeBSD 8.1-RELEASE Release Notes
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

FreeBSD 8.1-RELEASE Release Notes
=================================

Release Highlights
------------------

The highlights in the 8.1-RELEASE are the following:

-  [powerpc] FreeBSD now supports SMP in PowerPC G5 systems. Note that
   SMP support on FreeBSD/powerpc is disabled by default in ``GENERIC``
   kernel.

-  [sparc64] FreeBSD now supports UltraSPARC IV, IV+, and SPARC64 V
   CPUs.

-  The ZFS zpool version has been updated to 14. The ``zfsloader`` has
   been added. This is a separate
   `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+8.1-RELEASE>`__
   enabled loader. Note that a ZFS bootcode (``zfsboot`` or
   ``gptzfsboot``) need to be installed to use this new loader.

-  The
   `bwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bwn&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   driver for Broadcom BCM43xx chipsets has been added.

-  The
   `run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   driver for Ralink RT2700U/RT2800U/RT3000U USB 802.11agn devices has
   been added.

-  The sge(4) driver for Silicon Integrated Systems SiS190/191
   Fast/Gigabit Ethernet has been added. This supports TSO and TSO over
   VLAN.

-  The
   `uhso(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhso&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   driver for Option HSDPA USB devices has been added. A new
   `uhsoctl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uhsoctl&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__
   userland utility can be used to initiate and close the WAN
   connection.

-  The
   `urtw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urtw&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   driver has been improved and now supports RTL8187B-based devices.

-  The
   `ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   subsystem including
   `dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   has been improved.

-  The
   `pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9&manpath=FreeBSD+8.1-RELEASE>`__
   framework for packet filtering in FreeBSD kernel now supports
   separate packet filtering instances like
   `ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   for each VIMAGE jail.

-  The
   `vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   pseudo interface now supports TSO (TCP Segmentation Offloading). The
   capability flag is named as ``IFCAP_VLAN_HWTSO`` and it is separated
   from ``IFCAP_VLAN_HWTAGGING``. The
   `age(4) <http://www.FreeBSD.org/cgi/man.cgi?query=age&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   `alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   `ale(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ale&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   `bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   `bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   `cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   `jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__,
   and
   `mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   driver support this feature.

-  The
   `vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   pseudo interface for IEEE 802.1Q VLAN now ignore renaming of the
   parent's interface name. The configured VLAN interfaces continue to
   work with the new name while previously the configurations were
   removed as the renaming happens.

-  The HAST (Highly Available STorage) framework has been added. This is
   a framework to allow transparently storing data on two physically
   separated machines connected over the TCP/IP network. HAST works in
   Primary-Secondary (Master-Backup, Master-Slave) configuration, which
   means that only one of the cluster nodes can be active at any given
   time. Only Primary node is able to handle I/O requests to
   HAST-managed devices. Currently HAST is limited to two cluster nodes
   in total.

-  FreeBSD
   `cam(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=3&manpath=FreeBSD+8.1-RELEASE>`__
   SCSI framework has been improved and a new kernel option
   ``option ATA_CAM`` has been added. This turns
   `ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   controller drivers into
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   interface modules. When enabled, this option deprecates all
   `ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   peripheral drivers and interfaces such as ``ad`` and ``acd``, and
   allows
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   drivers ``ada``, and ``cd`` and interfaces to be natively used
   instead. Note that this is not enabled by default in the ``GENERIC``
   kernel.

-  The
   `mvs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mvs&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   CAM ATA driver for Marvell 88SX50XX/88SX60XX/88SX70XX/SoC SATA
   controllers has been added. This driver supports same hardware as the
   `ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
   driver does, but provides many additional features, such as NCQ and
   PMP.

-  The ``liblzma`` library for LZMA2 lossless data compression algorithm
   and the userland utilities
   `xz(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xz&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
   `xzdec(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xzdec&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
   `lzma(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lzma&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__,
   and
   `lzmainfo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lzmainfo&sektion=1&manpath=FreeBSD+8.1-RELEASE>`__.
   has been imported.

-  The **ACPI-CA** has been updated to 20100304.

-  **ISC BIND** has been updated to version 9.6.2-P2.

-  **OpenSSH** has been updated from version 5.1p1 to version 5.4p1.

-  **OpenSSL** has been updated to version 0.9.8n.

-  **sendmail** has been updated to version 8.14.4.

-  The supported version of the **GNOME** desktop environment
   (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
   has been updated to 2.28.2.

-  The supported version of the **KDE** desktop environment
   (```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
   has been updated to 4.4.3.

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
