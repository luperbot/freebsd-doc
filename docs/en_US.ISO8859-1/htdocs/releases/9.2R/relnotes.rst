=================================
FreeBSD 9.2-RELEASE Release Notes
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

FreeBSD 9.2-RELEASE Release Notes
=================================

Release Highlights
------------------

The highlights in the 9.2-RELEASE include the following.

-  Support for
   `rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=rarpd&sektion=8>`__
   added to
   `vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=vlan&sektion=4>`__.
   [`r245076 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=245076>`__\ ]

-  `xz(1) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=xz&sektion=1>`__
   updated to version 5.0.4.
   [`r245128 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=245128>`__\ ]

-  The ZFS filesystem now supports TRIM when used on solid state drives.
   ZFS TRIM support is enabled by default.
   [`r251419 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=251419>`__\ ]
   The following tunables have been added:

   -  ``vfs.zfs.trim.enabled``: Enable ZFS TRIM

   -  ``vfs.zfs.trim.max_interval``: Maximum interval in seconds between
      TRIM queue processing

   -  ``vfs.zfs.trim.timeout``: Delay TRIMs by up to this many seconds

   -  ``vfs.zfs.trim.txg_delay``: Delay TRIMs by up to this many TXGs

-  The
   `firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=firewire&sektion=4>`__
   drivers have been removed from the GENERIC kernel configuration for
   all architectures.
   [`r246321 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=246321>`__\ ]

-  `awk(1) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=awk&sektion=1>`__
   has been updated to version 20121220.
   [`r246373 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=246373>`__\ ]

-  The
   `virtio(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=virtio&sektion=4>`__
   drivers have been added to the GENERIC kernel configuration for amd64
   and i386 architectures.
   [`r247306 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=247306>`__\ ]

-  The ZFS filesystem now supports lz4 compression.
   [`r247309 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=247309>`__\ ]

-  The
   `oce(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=oce&sektion=4>`__
   has been updated to version 4.6.95.0.
   [`r248062 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=248062>`__\ ]

-  **OpenSSL** has been updated to version 0.9.8y.
   [`r248272 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=248272>`__\ ]

-  The
   `bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=bsdinstall&sektion=8>`__
   installer now supports installation over HTTP.
   [`r248313 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=248313>`__\ ]

-  **DTrace** hooks have been enabled by default in the GENERIC kernel.
   [`r249549 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=249549>`__\ ]

-  **DTrace** has been updated to version 1.9.0.
   [`r249856 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=249856>`__\ ]

-  **Sendmail** has been updated to version 8.14.7.
   [`r249865 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=r249865>`__,
   `r249866 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=r249866>`__,
   `r249867 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=r249867>`__,
   `r249875 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=r249875>`__]

-  **OpenSSH** has been updated to version 6.2p2.
   [`r251135 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=251135>`__\ ]

-  `less(1) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=less&sektion=1>`__
   has been updated to version 458.
   [`r251154 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=251154>`__\ ]

-  Add ATA pass-through support to
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=cam&sektion=4>`__.
   [`r251302 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=251302>`__\ ]

-  Implement new
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=rc.conf&sektion=5>`__
   syntax for
   `hostapd(8) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=hostapd&sektion=8>`__.
   The new format is: ``ifconfig_wlanX="HOSTAP"``, where ``X``
   represents the
   `wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=wlan&sektion=4>`__
   interface.
   [`r252748 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=252748>`__\ ]

-  Import unmapped I/O support from ``head/``.
   [`r251897 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=251897>`__\ ]

-  Merge
   `nvme(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=nvme&sektion=4>`__
   from ``head/``.
   [`r252222 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=252222>`__\ ]

-  Add support for the Chelsio 40G T5.
   [`r252495 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=252495>`__\ ]

-  Add a tunable to increase the initial TCP congestion window from 4
   segments to 10 segments. This tunable can be enabled by adding
   ``net.inet.tcp.experimental.initcwnd10=1`` to
   `sysctl.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=sysctl.conf&sektion=5>`__.
   This tunable is turned off by default in FreeBSD?9.2-RELEASE.
   [`r252789 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=252789>`__\ ]

-  Update the
   `ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=ixgbe&sektion=4>`__
   driver.
   [`r252898 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=252898>`__\ ]

-  Update the Intel e1000 driver.
   [`r252899 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=252899>`__\ ]

-  Add support for the HighPoint DC Series Data Center HBA (DC7280 and
   R750).
   [`r252903 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=252903>`__\ ]

-  Add service-specific
   `setfib(1) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=setfib&sektion=1>`__
   support. This is enabled by setting: ``<name>_fib`` in
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=rc.conf&sektion=5>`__.[`r253233 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=253233>`__\ ]

-  Update devices supported by
   `cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=cxgbe&sektion=4>`__.
   [`r253776 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=253776>`__\ ]

-  Remove
   `ctl(4) <http://www.FreeBSD.org/cgi/man.cgi?manpath=FreeBSD+9.2-RELEASE&query=ctl&sektion=4>`__
   from the GENERIC kernel configuration.
   [`r253860 <http://svn.FreeBSD.org/viewvc/base?view=revision&revision=253860>`__\ ]

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
