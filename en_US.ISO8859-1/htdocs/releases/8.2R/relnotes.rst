=================================
FreeBSD 8.2-RELEASE Release Notes
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

FreeBSD 8.2-RELEASE Release Notes
=================================

Release Highlights
------------------

The highlights in the 8.2-RELEASE are the following:

-  [amd64] FreeBSD/amd64 now always sets the KVA space as equal to or
   larger than physical memory size. This change would help to prevent a
   “kmem\_map too small” panic which often occurs when using
   ZFS.[`r214620 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214620>`__\ ]

-  The FreeBSD ``GENERIC`` kernel is now compiled with ``KDB`` and
   ``KDB_TRACE`` options. From 8.2-RELEASE the kernel supports
   displaying a stack trace on panic by using
   `stack(9) <http://www.FreeBSD.org/cgi/man.cgi?query=stack&sektion=9&manpath=FreeBSD+8.2-RELEASE>`__
   facility with no debugger backend like
   `ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__.
   Note that this does not change the default behaviors of the
   ``GENERIC`` kernel on
   panic.[`r214326 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214326>`__\ ]

-  The FreeBSD
   `crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   framework (opencrypto) now supports XTS-AES (XEX-TCB-CTS, or
   XEX-based Tweaked Code Book mode with CipherText Stealing), which is
   defined in IEEE Std.
   1619-2007.[`r214254 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214254>`__\ ]

-  [amd64] Xen HVM support in FreeBSD/amd64 kernel has been improved.
   For more details, see
   `xen(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xen&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   manual
   page.[`r215788 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215788>`__\ ]

-  FreeBSD now fully supports GPT (GUID Partition Table). Checksums of
   primary header and primary partition table are verified properly
   now.[`r213994 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213994>`__\ ]

-  [amd64, i386] The
   `aesni(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aesni&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   driver has been added. This supports AES accelerator on Intel CPUs
   and accelerates AES operations for
   `crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__.[`r215633 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215633>`__\ ]

-  [amd64, i386] The
   `aibs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aibs&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   driver has been added. This supports the hardware sensors in ASUS
   motherboards and replaces the
   `acpi\_aiboost(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_aiboost&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   driver.[`r210476 <http://svn.freebsd.org/viewvc/base?view=revision&revision=210476>`__\ ]

-  The
   `tpm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tpm&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   driver, which supports Trusted Platform Module has been
   added.[`r215036 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215036>`__\ ]

-  The xhci(4) driver, which supports Extensible Host Controller
   Interface (xHCI) and USB 3.0, has been
   added.[`r215944 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215944>`__\ ]

-  The FreeBSD Linux emulation subsystem now supports the
   **video4linux** API. This requires native **video4linux** hardware
   drivers such as the ones provided by ``multimedia/pwcbsd`` and
   ``multimedia/webcamd``.

-  The
   `miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   has been rewritten for the generic IEEE 802.3 annex 31B full duplex
   flow control support. The
   `alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `cas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cas&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `gem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gem&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   `stge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stge&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   and
   `xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   drivers along with atphy(4), bmtphy(4), brgphy(4), e1000phy(4),
   gentbi(4), inphy(4), ip1000phy(4), jmphy(4), nsgphy(4), nsphyter(4),
   and
   `rgephy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rgephy&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   have been updated to support flow control via this
   facility.[\ `r211379 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211379>`__,
   `r215881 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215881>`__,
   `r215890 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215890>`__,
   `r2105894 <http://svn.freebsd.org/viewvc/base?view=revision&revision=2105894>`__,
   `r216002 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216002>`__,
   `r216023 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216023>`__,
   `r216029 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216029>`__,
   `r216031 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216031>`__,
   `r216033 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216033>`__]

-  A new
   `netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   node
   `ng\_patch(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_patch&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__
   has been added. This performs data modification of packets passing
   through. Modifications are restricted to a subset of C language
   operations on unsigned integers of 8, 16, 32 or 64-bit
   size.[`r209843 <http://svn.freebsd.org/viewvc/base?view=revision&revision=209843>`__\ ]

-  The FreeBSD TCP reassembly implementation has been improved. A
   long-standing accounting bug affecting SMP systems has been fixed and
   the ``net.inet.tcp.reass.maxqlen``
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   variable has been retired in favor of a per-connection dynamic limit
   based on the receive socket buffer size. FreeBSD receivers now handle
   packet loss (particularly losses caused by queue overflows)
   significantly better than before which improves connection
   throughput.[\ `r214865 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214865>`__,
   `r214866 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214866>`__]

-  The
   `siftr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=siftr&sektion=4&manpath=FreeBSD+8.2-RELEASE>`__,
   Statistical Information For TCP Research (SIFTR) kernel module has
   been added. This is a facility that logs a range of statistics on
   active TCP connections to a log file. It provides the ability to make
   highly granular measurements of TCP connection state, aimed at system
   administrators, developers and
   researchers.[`r214859 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214859>`__\ ]

-  The
   `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   GEOM class now uses XTS-AES mode by
   default.[`r214405 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214405>`__\ ]

-  The ZFS on-disk format has been updated to version 15 and various
   performance improvements for the ZFS have been imported from
   OpenSolaris.

-  Userland support for the
   `dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
   subsystem has been added. This allows inspection of userland software
   itself and its correlation with the kernel, thus allowing a much
   better picture of what exactly is going on behind the scenes. The
   `dtruss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtruss&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
   utility has been added and ``libproc`` has been updated to support
   the
   facility.[`r214983 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214983>`__\ ]

-  The
   `gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   utility now supports a ``recover`` subcommand for GPT partition
   tables.

-  The
   `gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   utility now supports ``GPT_ENT_ATTR_BOOTME``,
   ``GPT_ENT_ATTR_BOOTONCE``, and ``GPT_ENT_ATTR_BOOTFAILED`` attributes
   in GPT. The attribute keywords in the command line are ``bootme``,
   ``bootonce``, and ``bootfailed``
   respectively.[`r213994 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213994>`__\ ]

-  The ``libarchive`` library and
   `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
   utility now support LZMA (Lempel-Ziv-Markov chain-Algorithm)
   compression
   format.[`r213667 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213667>`__\ ]

-  The
   `newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   utility now supports an ``-S pidfile`` option to override the default
   `syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   PID
   file.[`r211699 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211699>`__\ ]

-  The
   `newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   utility now supports a special log file name ``<include>`` for
   processing file inclusion. Globbing in the file name and circular
   dependency detection are supported. For more details, see the
   `newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
   manual
   page.[`r215622 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215622>`__\ ]

-  The
   `pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   utility now supports a file and a network socket as a top source.
   This allows top monitoring over TCP on a system with no local
   symbols, for
   example.[`r211098 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211098>`__\ ]

-  The
   `tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
   and
   `tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   utilities have been improved for better interoperability and they now
   support RFC 1350, 2347, 2348, 2349, and
   3617.[\ `r213036 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213036>`__,
   `r213038 <http://svn.freebsd.org/viewvc/base?view=revision&revision=213038>`__]

-  A periodic script for ``zfs scrub`` has been added. For more details,
   see the
   `periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
   manual page.

-  A periodic script which can be used to find installed ports' files
   with mismatched checksum has been added. For more details, see the
   `periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5&manpath=FreeBSD+8.2-RELEASE>`__
   manual page.

-  The
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
   utility now uses the following numbers for default and minimum
   partition sizes: 1GB for ``/``, 4GB for ``/var``, and 1GB for
   ``/tmp``.[`r211007 <http://svn.freebsd.org/viewvc/base?view=revision&revision=211007>`__\ ]

-  The **ACPI-CA** has been updated to 20101013.

-  The
   `ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+8.2-RELEASE>`__
   program has been updated to version
   1.5.2.[`r214287 <http://svn.freebsd.org/viewvc/base?view=revision&revision=214287>`__\ ]

-  **ISC BIND** has been updated to version 9.6-ESV-R3.

-  **netcat** has been updated to version 4.8.

-  **OpenSSL** has been updated to version 0.9.8q.

-  The **timezone** database has been updated to the **tzdata2010o**
   release.

-  The **xz** has been updated from snapshot as of 12 April 2010 to
   5.0.0 release

-  The supported version of the **GNOME** desktop environment
   (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
   has been updated to 2.32.1.

-  The supported version of the **KDE** desktop environment
   (```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
   has been updated to 4.5.5.

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
