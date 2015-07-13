=================================
FreeBSD 9.0-RELEASE Release Notes
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

FreeBSD 9.0-RELEASE Release Notes
=================================

.. raw:: html

   <div class="IMPORTANT">

    **Important:** If you are upgrading from a previous release of
    FreeBSD, please read `upgrading section in the Release
    Notes <http://www.FreeBSD.org/releases/9.0R/relnotes-detailed.html#UPGRADE>`__
    for notable incompatibilities carefully.

.. raw:: html

   </div>

Release Highlights
------------------

The highlights in the 9.0-RELEASE are the following. For more details,
please see `the Detailed Release Notes <relnotes-detailed.html>`__.

-  The FreeBSD kernel now supports Capsicum Capability Mode. Capsicum is
   a set of features for sandboxing support, using a capability model in
   which the capabilities are file descriptors. Two new kernel options
   ``CAPABILITIES`` and ``CAPABILITY_MODE`` have been added to the
   ``GENERIC`` kernel. For more information about Capsicum, see
   http://www.cl.cam.ac.uk/research/security/capsicum/.[`r219129 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219129>`__\ ]

-  The
   `hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   (Helper Hook) and
   `khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   (Kernel Helpers) KPIs have been implemented. These are a kind of
   superset of
   `pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   framework for more general use in the kernel. The
   `hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   KPI provides a way for kernel subsystems to export hook points that
   `khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   modules can hook to provide enhanced or new functionality to the
   kernel. The
   `khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   KPI provides a framework for managing
   `khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   modules, which indirectly use the
   `hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   KPI to register their hook functions with hook points of interest
   within the kernel. These allow a structured way to dynamically extend
   the kernel at runtime in an ABI preserving
   manner.[\ `r216758 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216758>`__,
   `r216615 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216615>`__]

-  A new resource accounting API has been implemented. It can keep
   per-process, per-jail, and per-loginclass resource accounting
   information. Note that this is not built nor installed by default. To
   build and install them, specify ``options RACCT`` in the kernel
   configuration file and rebuild the base system as described in the
   `FreeBSD
   Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r220137 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220137>`__\ ]

-  A new resource-limiting API has been implemented. It works in
   conjunction with the ``RACCT`` resource accounting implementation and
   takes user-configurable actions based on the set of rules it
   maintains and the current resource usage. The
   `rctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility has been added to manage the rules in userland. Note that
   this is not built nor installed by default. To build and install
   them, specify ``options RCTL`` in the kernel configuration file and
   rebuild the base system as described in the `FreeBSD
   Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r220163 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220163>`__\ ]

-  [powerpc] FreeBSD/powerpc now supports Sony Playstation 3 using the
   OtherOS feature available on firmwares 3.15 and
   earlier.[`r217044 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217044>`__\ ]

-  [amd64, i386] The FreeBSD
   `usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   subsystem now supports USB 3.0 by
   default.[`r223098 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223098>`__\ ]

-  The FreeBSD
   `usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   subsystem now supports USB packet filter. This allows to capture
   packets which go through each USB host controller. The implementation
   is almost based on
   `bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   code. The userland program
   `usbdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdump&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   has been
   added.[`r215649 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215649>`__\ ]

-  A bxe(4) driver for Broadcom NetXtreme II 10GbE controllers
   (BCM57710, BCM57711, BCM57711E) has been
   added.[`r219647 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219647>`__\ ]

-  A
   `cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver for Chelsio T4 (Terminator 4) based 10Gb/1Gb adapters has been
   added.[`r218794 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218794>`__\ ]

-  The
   `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver has been updated to version
   7.3.2.[`r219753 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219753>`__\ ]

-  The
   `igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver has been updated to version
   2.2.5.[`r223350 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223350>`__\ ]

-  The
   `igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver now supports Intel I350 PCIe Gigabit Ethernet
   controllers.[`r218530 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218530>`__\ ]

-  The
   `ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver has been updated to version
   2.3.8.[`r217593 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217593>`__\ ]

-  The
   `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver now supports RTL8168E/8111E-VL PCIe Gigabit Ethernet
   controllers and RTL8401E PCIe Fast Ethernet
   controllers.[\ `r217498 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217498>`__,
   `r218760 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218760>`__]

-  A
   `vte(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vte&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver for RDC R6040 Fast Ethernet controllers, which are commonly
   found on the Vortex86 System On a Chip, has been
   added.[`r216829 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216829>`__\ ]

-  A
   `vxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vxge&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver for the Neterion X3100 10GbE Server/Storage adapter has been
   added.[`r221167 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221167>`__\ ]

-  `ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   now supports IPv6 in the ``fwd``
   action.[`r225044 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225044>`__\ ]

-  `ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   now supports the ``call`` and ``return`` actions. Upon the
   ``call number`` action, the current rule number is saved in the
   internal stack and ruleset processing continues with the first rule
   numbered ``number`` or higher. The ``return`` action takes the rule
   number saved to internal stack by the latest ``call`` action and
   returns ruleset processing to the first rule with number greater than
   that saved
   number.[`r223666 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223666>`__\ ]

-  For Infiniband support, OFED (OpenFabrics Enterprise Distribution)
   version 1.5.3 has been imported into the base system. Note that this
   is not built nor installed by default. To build and install them,
   specify ``WITH_OFED=yes`` in ``/etc/src.conf`` and rebuild the base
   system as described in the `FreeBSD
   Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r219820 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219820>`__\ ]

-  The FreeBSD TCP/IP network stack now supports IPv4 prefixes with /31
   as described in RFC 3021, “Using 31-Bit Prefixes on IPv4
   Point-to-Point
   Links”.[`r226572 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226572>`__\ ]

-  The FreeBSD TCP/IP network stack now supports the
   `mod\_cc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   pluggable congestion control framework. This allows TCP congestion
   control algorithms to be implemented as dynamically loadable kernel
   modules. The following kernel modules are available as of
   9.0-RELEASE:
   `cc\_chd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_chd&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   for the CAIA-Hamilton-Delay algorithm,
   `cc\_cubic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_cubic&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   for the CUBIC algorithm,
   `cc\_hd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_hd&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   for the Hamilton-Delay algorithm,
   `cc\_htcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_htcp&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   for the H-TCP algorithm,
   `cc\_newreno(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_newreno&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   for the NewReno algorithm, and
   `cc\_vegas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_vegas&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   for the Vegas algorithm. The default algorithm can be set by a new
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   variable ``net.inet.tcp.cc.algorithm``. The value must be set to one
   of the names listed by ``net.inet.tcp.cc.available``, and ``newreno``
   is the default set at boot time. For more detail, see the
   `mod\_cc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   and
   `mod\_cc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   manual
   pages.[\ `r216109 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216109>`__,
   `r216114 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216114>`__,
   `r216115 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216115>`__,
   `r218152 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218152>`__,
   `r218153 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218153>`__,
   `r218155 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218155>`__]

-  An
   `h\_ertt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=h_ertt&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   (Enhanced Round Trip Time)
   `khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
   module has been added. This module allows per-connection, low noise
   estimates of the instantaneous RTT in the TCP/IP network stack with a
   robust implementation even in the face of delayed acknowledgments
   and/or TSO (TCP Segmentation Offload) being in use for a
   connection.[`r217806 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217806>`__\ ]

-  A new
   `tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   socket option ``TCP_CONGESTION`` has been added. This allows to
   select or query the congestion control algorithm that the TCP/IP
   network stack will use for connections on the
   socket.[`r218912 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218912>`__\ ]

-  The
   `ng\_netflow(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_netflow&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   `netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   node now supports NetFlow version 9. A new ``export9`` hook has been
   added for NetFlow v9 data. Note that data export can be done
   simultaneously in both version 5 and version
   9.[`r219183 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219183>`__\ ]

-  The
   `geom\_map(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom_map&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   GEOM class has been added. This allows to generate multiple geom
   providers based on a hard-coded layout of a device with no explicit
   partition table such as embedded flash storage. For more information,
   see the
   `geom\_map(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom_map&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   manual
   page.[`r220559 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220559>`__\ ]

-  The
   `graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   GEOM class has been added. This is a replacement of the
   `ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver supporting various BIOS-based software
   RAID.[`r219974 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219974>`__\ ]

-  A
   `tws(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tws&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver for 3ware 9750 SATA+SAS 6Gb/s RAID controllers has been
   added.[`r226115 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226115>`__\ ]

-  The FreeBSD Fast File System now supports softupdates journaling. It
   introduces a intent log into a softupdates-enabled file system which
   eliminates the need for background
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   even on unclean shutdown. This can be enabled in a per-filesystem
   basis by using the ``-j`` flag of the
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility or the ``-j enable`` option of the
   `tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility. Note that the 9.0-RELEASE installer automatically enables
   softupdates journaling for newly-created UFS file
   systems.[\ `r207141 <http://svn.freebsd.org/viewvc/base?view=revision&revision=207141>`__,
   `r218726 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218726>`__]

-  The FreeBSD Fast File System now supports the ``TRIM`` command when
   freeing data blocks. A new flag ``-t`` in the
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   and
   `tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utilities sets the TRIM-enable flag for a file system. The
   TRIM-enable flag makes the file system send a delete request to the
   underlying device for each freed block. The ``TRIM`` command is
   specified as a Data Set Management Command in the ATA8-ACS2 standard
   to carry the information related to deleted data blocks to a device,
   especially for a SSD (Solid-State Drive) for
   optimization.[`r216796 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216796>`__\ ]

-  The FreeBSD NFS subsystem has been updated. The new implementation
   supports NFS version 4 in addition to 2 and 3. The kernel options for
   the NFS server and client are changed from ``NFSSERVER`` and
   ``NFSCLIENT`` to ``NFSD`` and ``NFSCL``.
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   variables which start with ``vfs.nfssrv.`` have been renamed to
   ``vfs.nfsd.``. The NFS server now supports
   ``vfs.nfsd.server_max_nfsvers`` and ``vfs.nfsd.server_min_nfsvers``
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   variables to specify the maximum and the minimum NFS version number
   which the server accepts. The default value is set to ``3`` and
   ``2``,
   respectively.[`r221124 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221124>`__\ ]

-  The FreeBSD ZFS subsystem has been updated to the SPA (Storage Pool
   Allocator, also known as zpool) version 28. It now supports data
   deduplication, triple parity RAIDZ (raidz3), snapshot holds, log
   device removal, zfs diff, zpool split, zpool import ``-F``, and
   read-only zpool
   import.[`r219089 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219089>`__\ ]

-  An implementation of ``iconv()`` API libraries and utilities which
   are standardized in Single UNIX Specification has been imported.
   These are based on NetBSD's Citrus implementation. Note that these
   are not built nor installed by default. To build and install them,
   specify ``WITH_ICONV=yes`` in ``/etc/src.conf`` and rebuild the base
   system as described in the `FreeBSD
   Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r219019 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219019>`__\ ]

-  A
   `readline(3) <http://www.FreeBSD.org/cgi/man.cgi?query=readline&sektion=3&manpath=FreeBSD+9.0-RELEASE>`__
   API set has been imported into **libedit**. This is based on NetBSD's
   implementation and BSD licensed utilities now use it instead of GNU
   **libreadline**.[`r220370 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220370>`__\ ]

-  The
   `rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   and
   `rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   daemons now support the RDNSS and DNSSL options described in RFC
   6106, “IPv6 Router Advertisement Options for DNS Configuration”. A
   `rtadvctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility to control the
   `rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   daemon has been
   added.[\ `r222732 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222732>`__,
   `r224006 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224006>`__]

-  The
   `rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
   runtime linker now supports shared objects as filters in ELF shared
   libraries. Both standard and auxiliary filtering have been supported.
   The
   `rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
   linker's processing of a filter defers loading a filtee until a
   filter symbol is referenced unless the ``LD_LOADFLTR`` environment
   variable is defined or a ``-z loadfltr`` option was specified when
   the filter was
   created.[`r216695 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216695>`__\ ]

-  A bug in the
   `tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   daemon has been fixed. It had an interoperability issue when
   transferring a large
   file.[`r224536 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224536>`__\ ]

-  The
   `utmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=utmp&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
   user accounting database has been replaced by
   `utmpx(3) <http://www.FreeBSD.org/cgi/man.cgi?query=utmpx&sektion=3&manpath=FreeBSD+9.0-RELEASE>`__.
   User accounting utilities will now use ``utmpx`` database files
   exclusively. The
   `wtmpcvt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmpcvt&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
   utility can be used to convert ``wtmp`` files to the new format,
   making it possible to read them using the updated
   utilities.[`r202188 <http://svn.freebsd.org/viewvc/base?view=revision&revision=202188>`__\ ]

-  The
   `zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__:
   utility now supports a ``zpool labelclear`` command. This allows to
   wipe the label data from a drive that is not active in a
   pool.[`r224171 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224171>`__\ ]

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
