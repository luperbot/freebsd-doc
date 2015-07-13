=================================
FreeBSD 9.1-RELEASE Release Notes
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

FreeBSD 9.1-RELEASE Release Notes
=================================

This is a simplified version of the FreeBSD 9.1-RELEASE release notes.

.. raw:: html

   <div class="IMPORTANT">

    **Important:** If you are upgrading from a previous release of
    FreeBSD, please read `upgrading section in the Release
    Notes <http://www.FreeBSD.org/releases/9.1R/relnotes-detailed.html#upgrade>`__
    for notable incompatibilities carefully.

.. raw:: html

   </div>

Release Highlights
------------------

The highlights in the 9.1-RELEASE are the following. For more details,
please see `the Detailed Release Notes <relnotes-detailed.html>`__.

-  The FreeBSD Jail subsystem now supports mounting
   `devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__,
   `nullfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nullfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__,
   and ZFS filesystem inside a jail. New
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   parameters ``allow.mount.devfs``, ``allow.mount.nullfs``, and
   ``allow.mount.zfs`` to control the per-jail capabilities have been
   added. All of them are disabled by
   default.[`r232728 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232728>`__\ ]

-  The FreeBSD
   `sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   scheduler has been improved on CPU load balancing of SMT
   (Simultaneous MultiThreading) CPUs. It gives a 10-15% performance
   improvement when the number of threads is lesser than the number of
   logical
   CPUs.[`r233599 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233599>`__\ ]

-  The
   `boot0cfg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot0cfg&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility now supports configuration of PXE boot via the ``boot0`` boot
   block temporarily on the next boot. The slice number ``6`` or a
   keyword ``PXE`` can be specified to enable PXE boot using the ``-s``
   option.[`r230065 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230065>`__\ ]

-  [amd64, i386] The
   `hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver now supports the Intel Sandy Bridge
   microarchitecture.[`r234046 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234046>`__\ ]

-  [arm] FreeBSD/arm now supports the Atmel SAM9XE family of
   microcontrollers.[`r236081 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236081>`__\ ]

-  A bug in the
   `xhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xhci&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   (USB 3.0) driver has been fixed. It did not work with USB 3.0
   hubs.[`r230302 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230302>`__\ ]

-  The drm2(4) Intel GPU driver, which supports GEM and KMS and works
   with new generations of GPUs such as IronLake, SandyBridge, and
   IvyBridge, has been added. The
   `agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver now supports SandyBridge and IvyBridge CPU
   northbridges.[\ `r236926 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236926>`__,
   `r236927 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236927>`__,
   `r239965 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239965>`__]

-  The
   `snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver has been updated. It now supports and provides HDMI, new
   volume control, automatic recording source selection, runtime
   reconfiguration, more then 4 PCM devices on a controller,
   multichannel recording, additional playback/record streams, higher
   bandwidth, and more informative device
   names.[`r232798 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232798>`__\ ]

-  The
   `snd\_hdspe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hdspe&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver has been added. This supports RME HDSPe AIO and RayDAT sound
   cards.[`r233165 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233165>`__\ ]

-  A bug in
   `ae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ae&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver which could prevent from working under certain conditions has
   been
   fixed.[`r229520 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229520>`__\ ]

-  The
   `bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   and brgphy(4) drivers have been improved:

   -  A bug which could prevent the DMA functionality from working
      correctly has been
      fixed.[`r229350 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229350>`__\ ]

   -  It now works with PCI-X BCM 5704 controller that is connected to
      AMD-8131 PCI-X
      bridge.[`r233495 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233495>`__\ ]

   -  It now supports the BCM 5720 and BCM 5720C PHY, and the BCM 57780
      1000BASE-T media
      interface.[\ `r229357 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229357>`__,
      `r229867 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229867>`__,
      `r232134 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232134>`__]

   -  It now supports a
      `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
      tunable ``dev.bge.N.msi`` to control the use of MSI. The default
      value is ``1``
      (enabled).[`r231734 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231734>`__\ ]

-  The
   `cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   and
   `cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver have been updated to firmware version 1.5.2.0. They now
   support device configuration via a plain text configuration file,
   IPv6 hardware checksumming, IPv6 TSO and LRO, a ``loadfw`` command in
   the cxgbetool(8) utility which allows to install a firmware to the
   card,
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   variables under ``dev.t4nex.N.misc`` for various
   information.[\ `r231093 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231093>`__,
   `r237925 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237925>`__]

-  The
   `igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver has been updated to version 2.3.4. It now supports newer
   i210/i211
   devices.[`r238262 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238262>`__\ ]

-  The
   `mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver has been updated to firmware version 1.4.55 from
   Myricom.[`r236413 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236413>`__\ ]

-  The
   `oce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=oce&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver, which supports Emulex OneConnect 10Gbit Ethernet cards, has
   been
   added.[`r231663 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231663>`__\ ]

-  The
   `ral(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ral&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver now supports Ralink RT2800 and RT3000
   chipsets.[`r236004 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236004>`__\ ]

-  The
   `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver now supports the RTL8411 PCIe Gigabit Ethernet controller. A
   bug which could prevent WoL (Wake-on-LAN) from working on RTL8168E
   has been
   fixed.[\ `r229529 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229529>`__,
   `r231731 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231731>`__]

-  The
   `sfxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sfxge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver, which supports 10Gb Ethernet adapters based on Solarflare
   SFC9000 family controllers, has been
   added.[`r228100 <http://svn.freebsd.org/viewvc/base?view=revision&revision=228100>`__\ ]

-  The
   `xnb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xnb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   Xen Paravirtualized Backend Ethernet Driver (netback) has been
   updated. This is attached via the newbus framework and works properly
   in both HVM and PVM
   mode.[`r231697 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231697>`__\ ]

-  The ``table`` argument in the
   `ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   packet filter rule syntax now supports IP address, interface name,
   port number, and jail ID.
   [`r234597 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234597>`__\ ]

-  The FreeBSD
   `ip6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   protocol stack now has been improved in terms of its performance.
   Benchmarking can be found at http://people.freebsd.org/~bz/bench/.

-  The FreeBSD
   `ip6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   protocol stack now supports multiple
   FIB.[`r232292 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232292>`__\ ]

-  The
   `netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   fast packet I/O framework has been added. The
   `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__,
   lem(4),
   `igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__,
   and
   `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   drivers now support this framework. The technical details can be
   found at
   http://info.iet.unipi.it/~luigi/netmap/.[\ `r231650 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231650>`__,
   `r235527 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235527>`__]

-  The
   `arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver has been updated to version
   1.20.00.25.[`r240758 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240758>`__\ ]

-  The
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver now supports SEMB (SATA Enclosure Management Bridge) devices,
   which are equivalent to the SCSI SES/SAF-TE
   devices.[`r236778 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236778>`__\ ]

-  The ctl(4) driver, which supports
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   Target Layer and
   `ctladm(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctladm&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__,
   a userland control utility, have been added. ctl(4) is a disk and
   processor device emulation subsystem supporting tagged queuing, SCSI
   task attribute, SCSI implicit command ordering, full task management,
   multiple ports, multiple simultaneous initiators, multiple
   simultaneous backing stores, mode sense/select, and error injection
   support.[`r231772 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231772>`__\ ]

-  The **MIRROR**
   `geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   class now supports ``BIO_DELETE``. This means ``TRIM`` command will
   be issued on supported devices when deleting
   data.[`r238500 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238500>`__\ ]

-  The **MULTIPATH**
   `geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   class has been updated. It now supports Active/Active mode,
   Active/Read mode as hybrid of Active/Active and Active/Passive,
   keeping a failed path without removing the geom provider, manual
   configuration without on-disk metadata, and ``add``, ``remove``,
   ``fail``, ``restore``, ``configure`` subcommands in the
   `gmultipath(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmultipath&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility to manage the configured
   paths.[\ `r229303 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229303>`__,
   `r234916 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234916>`__]

-  The **UNCOMPRESS**
   `geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   class and the
   `mkulzma(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkulzma&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility have been added. This class supports lzma compressed images
   like the **UZIP**
   `geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   class and the
   `mkuzip(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkuzip&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility.[`r235483 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235483>`__\ ]

-  [amd64, i386] The
   `hpt27xx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hpt27xx&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver has been added. This supports HighPoint RocketRAID 27xx-based
   SAS 6Gb/s
   HBA.[`r229975 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229975>`__\ ]

-  [amd64, i386] The
   `isci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isci&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver, which supports the integrated SAS controller in the Intel
   C600 (Patsburg) chipset, has been
   added.[`r231689 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231689>`__\ ]

-  The
   `ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver now supports the Intel X540
   adapter.[`r230775 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230775>`__\ ]

-  The
   `mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver now supports single-message MSI, and Drake Skinny and
   Thunderbolt cards. The
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   tunable ``hw.mfi.msi`` has been added and it is enabled by
   default.[\ `r229611 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229611>`__,
   `r234429 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234429>`__]

-  The
   `mps(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mps&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   driver has been updated to version 14.00.00.01-fbsd. This now
   supports Integrated RAID, WarpDrive controllers, WRITE12 and READ12
   for direct I/O, SCSI protection information (EEDP), Transport Level
   Retries (TLR) for tape drives, and LSI's userland
   utility.[\ `r230920 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230920>`__,
   `r231679 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231679>`__,
   `r237876 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237876>`__]

-  The
   `usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   storage device driver now enables power save mode by
   default.[`r229107 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229107>`__\ ]

-  The FreeBSD NFS filesystem has been improved:

   -  It now supports a timeout on positive name cache entries on the
      client side. A new mount option ``nametimeo`` has been added and
      set to ``60`` (in seconds) by
      default.[`r233326 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233326>`__\ ]

   -  A memory leak when a ZFS volume is exported via the FreeBSD NFS
      server has been
      fixed.[`r234740 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234740>`__\ ]

   -  A bug has been fixed. When a process writes to an mmap-backed file
      on an NFS filesystem, flushing changes to the data could fail
      under some circumstances such as errors due to permission
      mismatch, and this failure could not detected as an error. A new
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
      variable ``vfs.nfs.nfs_keep_dirty_on_error`` has been added to
      control the behavior on the client side related to this issue.
      When this is set to ``1``, the pages where a write operation
      failed are kept dirty. The default value is set to
      ``0``.[`r233730 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233730>`__\ ]

   -  The
      `nfsv4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsv4&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
      filesystem now supports a
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
      variable ``vfs.nfsd.disable_checkutf8``. This disables the check
      for UTF-8 compliance in the filenames. This is disabled by
      default. Note that enabling this may help some interoperability
      issues but results in an NFSv4 server that is non-RFC 3530
      compliant.[`r229799 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229799>`__\ ]

-  The
   `tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
   filesystem is not an experimental implementation
   anymore.[`r234511 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234511>`__\ ]

-  The
   `tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
   filesystem now supports a
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   variable ``vfs.tmpfs.memory_reserved`` to set the amount of required
   free pages when
   `tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
   attempts to allocate a new
   node.[`r234849 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234849>`__\ ]

-  FreeBSD ZFS filesystem has been updated by merging improvements from
   illumos project. The following changes are
   made:[\ `r229578 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229578>`__,
   `r232328 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232328>`__]

   -  New properties, ``clones`` and ``written``, have been added.

   -  The `The
      zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
      ``send`` command now reports an estimated size of the stream.

   -  The
      `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
      ``destroy`` command now reports an estimate of the space which
      would be reclaimed, when ``-n`` flag is specified.

   -  The
      `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
      ``get`` command now supports the ``-t type`` flag to specify the
      data type.

-  The
   `dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility now supports ``domain-search`` (option number 119, described
   in RFC 3397). This allows a DHCP server to publish a list of implicit
   domain suffixes used during name lookup. If this option is specified,
   a ``search`` keyword will be added to
   ``/etc/resolv.conf``.[`r230597 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230597>`__\ ]

-  A bug in the
   `gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
   compiler has been fixed. It could lead to incorrect calculations when
   ``-ffast-math`` is
   specified.[`r234023 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234023>`__\ ]

-  The
   `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility now supports a ``vlanhwcsum`` parameter to set or reset
   checksum offloading capability on
   VLANs.[`r231221 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231221>`__\ ]

-  The
   `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility now supports a ``carp             state`` parameter to set
   the state to ``backup`` or ``master``
   forcibly.[`r232486 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232486>`__\ ]

-  The
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility now supports a configuration file
   (`jail.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=jail.conf&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__)
   for complex
   configurations.[`r235839 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235839>`__\ ]

-  Lock handling performance in the **libthr** pthread library has been
   improved. It now works 10 times faster especially under the condition
   that a mutex is heavily
   contested.[`r234372 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234372>`__\ ]

-  A new C++ stack has been imported. This consists of **libcxxrt**,
   originally developed by a FreeBSD developer under contract by
   PathScale and open sourced by the FreeBSD and NetBSD foundations, and
   **libc++** from the LLVM project. **libcxxrt** is a drop-in
   replacement for GNU **libsupc++**, which implements the C++ runtime
   support for features such as run-time type information, dynamic
   casting, thread-safe static initializer, and exceptions. **libc++**
   implements the C++11 standard library, and will replace GNU
   **libstdc++** in a future release. In 9.1-RELEASE, **libstdc++** is
   still installed as standard and now dynamically links against
   **libsupc++**. This allows libraries linking **libstdc++** and
   **libc++** to both be used in the same program, to aid
   migration.[`r235798 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235798>`__\ ]

-  The
   `rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
   run-time linker now supports GCC's RELRO (RElocation Read-Only). This
   prevents the GOT (Global Offset Table) from being
   overwritten.[`r231579 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231579>`__\ ]

-  The
   `rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
   run-time linker now supports a GNU hash section (``DT_GNU_HASH``),
   which is a replacement of optional ELF hash
   section.[`r235396 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235396>`__\ ]

-  The
   `setbuf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setbuf&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
   utility and **libstdbuf** library have been added. This controls the
   default buffering behavior of standard stdio
   streams.[`r235139 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235139>`__\ ]

-  The
   `xlocale(3) <http://www.FreeBSD.org/cgi/man.cgi?query=xlocale&sektion=3&manpath=FreeBSD+9.1-RELEASE>`__
   API has been implemented. This consists of ``_l``-suffixed versions
   of various standard library functions that use the global locale,
   making them take an explicit locale parameter and allowing
   thread-safe extended locale support. Most of these APIs are required
   for IEEE Std 1003.1-2008 (POSIX.1-2008 or ISO/IEC 9945:2009)
   compatibility, and are required by **libc++** and recent versions of
   **GNOME**. This implementation also supports several extensions for
   compatibility with Apple
   **Darwin**.[`r235785 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235785>`__\ ]

-  **ISC BIND** has been updated to version
   9.8.3-P4.[`r241417 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241417>`__\ ]

-  The **compiler-rt** library, which provides low-level target-specific
   interfaces such as functions in **libgcc**, has been updated to
   revision
   147467.[`r236018 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236018>`__\ ]

-  **file**
   (`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__)
   has been updated to version
   5.11.[`r237983 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237983>`__\ ]

-  GNU
   `gperf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gperf&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
   has been updated to version 3.0.3 (the latest GPLv2-licensed
   version).[`r230237 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230237>`__\ ]

-  **libarchive**,
   `bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__,
   and
   `cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
   have been updated to version
   2.8.5.[`r229588 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229588>`__\ ]

-  **libpcap** library has been updated to
   1.2.1.[`r236167 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236167>`__\ ]

-  **libstdc++** have been updated to rev 135556 of ``gcc-4_2-branch``
   (the last LGPLv2-licensed
   version).[`r229551 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229551>`__\ ]

-  The **LLVM** compiler infrastructure and **clang**, a C language
   family front-end, version 3.1 have been imported. Note that it is not
   used for building the FreeBSD base system by
   default.[`r236144 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236144>`__\ ]

-  The ``netcat`` utility has been updated to version
   5.1.[`r235971 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235971>`__\ ]

-  **OpenSSL** has been updated to version
   0.9.8x.[`r237998 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237998>`__\ ]

-  **tcpdump**
   (`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__)
   utility has been updated to version
   4.2.1.[`r236192 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236192>`__\ ]

-  The **TENEX C shell**
   (`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__)
   has been updated to version
   6.18.01.[`r232633 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232633>`__\ ]

-  The **timezone** database has been updated to the **tzdata2012a**
   release.[`r233447 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233447>`__\ ]

-  **zlib** library has been updated to version
   1.2.7.[`r237691 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237691>`__\ ]

-  The supported version of the **KDE** desktop environment
   (```x11/kde4`` <http://svnweb.FreeBSD.org/ports/head/x11/kde4/pkg-descr?revision=HEAD>`__)
   has been updated to 4.8.4.

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
