================================
FreeBSD 8.3-RELEASE Announcement
================================

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

FreeBSD 8.3-RELEASE Announcement
================================

The FreeBSD Release Engineering Team is pleased to announce the
availability of FreeBSD 8.3-RELEASE. This is the fourth release from the
8-STABLE branch which improves on the functionality of FreeBSD 8.2 and
introduces some new features. Some of the highlights:

-  usb(4) now supports the USB packet filter

-  TCP/IP stack now supports the mod\_cc(9) pluggable congestion control
   framework

-  graid(8) GEOM class added to support various BIOS-based software RAID
   controllers (replacement for ataraid(4))

-  ZFS subsystem updated to SPA version 28

-  Gnome version 2.32.1, KDE version 4.7.4

For a complete list of new features and known problems, please see the
online release notes and errata list available at:

-  ``http://www.FreeBSD.org/releases/8.3R/relnotes-detailed.html``

-  ``http://www.FreeBSD.org/releases/8.3R/errata.html``

For more information about FreeBSD release engineering activities please
see:

-  ``http://www.FreeBSD.org/releng/``

Availability
------------

FreeBSD 8.3-RELEASE is now available for the amd64, i386, pc98, and
sparc64 architectures.

FreeBSD 8.3 can be installed from bootable ISO images or over the
network. Some architectures (currently amd64 and i386) also support
installing from a USB memory stick. The required files can be downloaded
via FTP or BitTorrent as described in the sections below. While some of
the smaller FTP mirrors may not carry all architectures, they will all
generally contain the more common ones such as amd64 and i386.

MD5 and SHA256 hashes for the release ISO images are included at the
bottom of this message.

The purpose of the images provided as part of the release are as
follows:

dvd1
    This contains everything necessary to install the base FreeBSD
    operating system, a collection of pre-built packages, and the
    documentation. It also supports booting into a "livefs" based rescue
    mode. This should be all you need if you can burn and use DVD-sized
    media.

disc1
    This contains the base FreeBSD operating system and the English
    documentation package for CDROM-sized media. There are no other
    packages.

livefs
    This contains support for booting into a "livefs" based rescue mode
    but does not support doing an install from the CD itself. It is
    meant to help rescue an existing system but could be used to do a
    network based install if necessary.

bootonly
    This supports booting a machine using the CDROM drive but does not
    contain the support for installing FreeBSD from the CD itself. You
    would need to perform a network based install (e.g. from an FTP
    server) after booting from the CD.

memstick
    This can be written to an USB memory stick (flash drive) and used to
    do an install on machines capable of booting off USB drives. It also
    supports booting into a "livefs" based rescue mode. The
    documentation packages are provided but no other packages.

    As one example of how to use the memstick image, assuming the USB
    drive appears as /dev/da0 on your machine something like this should
    work:

    ::

        # dd if="FreeBSD"-8.3-RELEASE-amd64-memstick.img of=/dev/da0 bs="10240" conv="sync"

    Be careful to make sure you get the target (of=) correct.

FreeBSD 8.3-RELEASE can also be purchased on CD-ROM or DVD from several
vendors. One of the vendors that will be offering FreeBSD 8.3-based
products is:

-  FreeBSD Mall, Inc. ``http://www.freebsdmall.com/``

BitTorrent
----------

8.3-RELEASE ISOs are available via BitTorrent. A collection of torrent
files to download the images is available at:

-  ``http://torrents.FreeBSD.org:8080/``

FTP
---

At the time of this announcement the following FTP sites have FreeBSD
8.3-RELEASE available.

-  ``ftp://ftp.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp5.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp10.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp.cn.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp.cz.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp.dk.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp.fr.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp.jp.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp.ru.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp1.ru.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp.tw.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp4.tw.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp5.us.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``
-  ``ftp://ftp10.us.freebsd.org/pub/FreeBSD/releases/ISO-IMAGES/8.3/``

However before trying these sites please check your regional mirror(s)
first by going to:

-  ``ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD``

Any additional mirror sites will be labeled **ftp2**, **ftp3** and so
on.

More information about FreeBSD mirror sites can be found at:

-  ``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html``

For instructions on installing FreeBSD or updating an existing machine
to 8.3-RELEASE please see:

-  ``http://www.FreeBSD.org/releases/8.3R/installation.html``

Support
-------

The FreeBSD Security Team currently plans to support FreeBSD 8.3 until
April 30, 2014. For more information on the Security Team and their
support of the various FreeBSD branches see:

-  ``http://www.FreeBSD.org/security/``

Acknowledgments
---------------

Many companies donated equipment, network access, or man-hours to
support the release engineering activities for FreeBSD 8.3 including The
FreeBSD Foundation, Yahoo!, NetApp, Internet Systems Consortium, Sentex
Communications, New York Internet, Juniper Networks, and iXsystems.

The release engineering team for 8.3-RELEASE includes:

+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Ken?Smith?<kensmith@FreeBSD.org\ >                                | Release Engineering, amd64, i386, sparc64 Release Building, Mirror Site Coordination   |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Robert?Watson?<rwatson@FreeBSD.org\ >                             | Release Engineering, Security                                                          |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Konstantin?Belousov?<kib@FreeBSD.org\ >                           | Release Engineering                                                                    |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Marc?Fonvieille?<blackend@FreeBSD.org\ >                          | Release Engineering, Documentation                                                     |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Josh?Paetzel?<jpaetzel@FreeBSD.org\ >                             | Release Engineering                                                                    |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Hiroki?Sato?<hrs@FreeBSD.org\ >                                   | Release Engineering, Documentation                                                     |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Bjoern?Zeeb?<bz@FreeBSD.org\ >                                    | Release Engineering                                                                    |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Takahashi?Yoshihiro?<`nyan@FreeBSD.org <nyan@FreeBSD.org>`__\ >   | PC98 Release Building                                                                  |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Joe?Marcus?Clarke?<marcus@FreeBSD.org\ >                          | Package Building                                                                       |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Erwin?Lansing?<erwin@FreeBSD.org\ >                               | Package Building                                                                       |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Mark?Linimon?<linimon@FreeBSD.org\ >                              | Package Building                                                                       |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Pav?Lucistnik?<pav@FreeBSD.org\ >                                 | Package Building                                                                       |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Ion-Mihai?Tetcu?<itetcu@FreeBSD.org\ >                            | Package Building                                                                       |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Martin?Wilke?<miwi@FreeBSD.org\ >                                 | Package Building, Ports Security                                                       |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Colin?Percival?<cperciva@FreeBSD.org\ >                           | Security Officer                                                                       |
+-------------------------------------------------------------------+----------------------------------------------------------------------------------------+

Trademark
---------

FreeBSD is a registered trademark of The FreeBSD Foundation.

ISO Image Checksums
-------------------

::

    MD5 (FreeBSD-8.3-RELEASE-amd64-bootonly.iso) = b1e776a82deabaf66a91293b04107277
    MD5 (FreeBSD-8.3-RELEASE-amd64-disc1.iso) = cf4edae9692f560e9cab89c8347886f5
    MD5 (FreeBSD-8.3-RELEASE-amd64-dvd1.iso) = 70089656058e74962cbedad1a2181daa
    MD5 (FreeBSD-8.3-RELEASE-amd64-livefs.iso) = 24e1a8d3c02c230fe415408179f90dbc
    MD5 (FreeBSD-8.3-RELEASE-amd64-memstick.img) = 013612ac4e080028b5f4e2c344250850

::

    MD5 (FreeBSD-8.3-RELEASE-i386-bootonly.iso) = 2fa59569f572abe450fce6b5efddeb04
    MD5 (FreeBSD-8.3-RELEASE-i386-disc1.iso) = 00fac17d95d27950e30b22e521c45da9
    MD5 (FreeBSD-8.3-RELEASE-i386-dvd1.iso) = 2478c6a7477492c347e80aaf61f48cc1
    MD5 (FreeBSD-8.3-RELEASE-i386-livefs.iso) = 147db14848518808deddf3c0b03694c3
    MD5 (FreeBSD-8.3-RELEASE-i386-memstick.img) = 5cbbe6f41e53eb98471c3392eb1bb768

::

    MD5 (FreeBSD-8.3-RELEASE-pc98-bootonly.iso) = 91843c5c9dbdf1d1be23eae30b0184b8
    MD5 (FreeBSD-8.3-RELEASE-pc98-disc1.iso) = e84f3d26d72a37ae332b617e8122bec4
    MD5 (FreeBSD-8.3-RELEASE-pc98-livefs.iso) = 4a441695c30c446308d7ee55d1ead1bc

::

    MD5 (FreeBSD-8.3-RELEASE-sparc64-bootonly.iso) = b94f5c9b07fdc1870cd284e168b557d8
    MD5 (FreeBSD-8.3-RELEASE-sparc64-disc1.iso) = 8b748240afe7a3f80cdf531f7d8a1317
    MD5 (FreeBSD-8.3-RELEASE-sparc64-dvd1.iso) = 3ea38fd60444193c3d74d2b0beba14a4
    MD5 (FreeBSD-8.3-RELEASE-sparc64-livefs.iso) = 317325d88a8605ae5a48447f92c5f919

::

    SHA256 (FreeBSD-8.3-RELEASE-amd64-bootonly.iso) = 2af20d98b02a26ebe9a3ddeb4785f317e2024f9494ca3a177edafdc8ef138b7d
    SHA256 (FreeBSD-8.3-RELEASE-amd64-disc1.iso) = 26d4870f3a310a95e488ed14dd8e36eb52e857878f2b238b3b91e65c101eee93
    SHA256 (FreeBSD-8.3-RELEASE-amd64-dvd1.iso) = acd9127364c759c4eb38fd02634f52bffe75b845a767a20f7dbf022a1626eed7
    SHA256 (FreeBSD-8.3-RELEASE-amd64-livefs.iso) = cb3dcd38ce4e3782059ea6d550a947a69c47bf167c6ae24f1cd58c5b4132697b
    SHA256 (FreeBSD-8.3-RELEASE-amd64-memstick.img) = eb598fa93b553744bd79e6b648b87b20f9054f7c131856c09ee2f88f29ccca6d

::

    SHA256 (FreeBSD-8.3-RELEASE-i386-bootonly.iso) = e701dee1458888bee1a399937f1ec525022a225b8b097bd820ed4338e0bf300d
    SHA256 (FreeBSD-8.3-RELEASE-i386-disc1.iso) = a83919b5104d8ec4e905693a6bd6b90b88b1c30923029146d1dab62b62a038e9
    SHA256 (FreeBSD-8.3-RELEASE-i386-dvd1.iso) = 3f3334a1e4f3d3f62ef274861764d466b44e19cc14549e6cdfdbd555808d78e2
    SHA256 (FreeBSD-8.3-RELEASE-i386-livefs.iso) = d45352262d7f9d871d25d01fab3c9a946ef4488f5fbbd104e153f04ca58d5b24
    SHA256 (FreeBSD-8.3-RELEASE-i386-memstick.img) = 56f4fc14ebe66dad5691ca63fa846e5d003efb630e5cb0181921ffb8af5a4edd

::

    SHA256 (FreeBSD-8.3-RELEASE-pc98-bootonly.iso) = 664b06c1a68352be8833b90ee455cbc31dfea531b7dd5f648d48659da60e386d
    SHA256 (FreeBSD-8.3-RELEASE-pc98-disc1.iso) = 1a54d5cbd6e72d740f7bf6372c58fb8caa5bb49d6c56358e18fe7433103bbb4f
    SHA256 (FreeBSD-8.3-RELEASE-pc98-livefs.iso) = 5b8887aee9c80914ece956452fd5e48eb759232d56cb4fff557e7cc60daab58b

::

    SHA256 (FreeBSD-8.3-RELEASE-sparc64-bootonly.iso) = e7ba76bbecff1b92d00caed5e644443b596f6a0fee4d717046aae73c4c5248c2
    SHA256 (FreeBSD-8.3-RELEASE-sparc64-disc1.iso) = f5d4087a0a070a05ad2cd9032fdc3a49fff2f716b7485debc25ae6757e29ca90
    SHA256 (FreeBSD-8.3-RELEASE-sparc64-dvd1.iso) = a697afe3e47250fa707b54021b5114aa0e286f088a5c89dfb6e1b2f51dd7bb67
    SHA256 (FreeBSD-8.3-RELEASE-sparc64-livefs.iso) = a5af66e2ad1042676a157c94f3d63e118761435abd26d8b5dd66e99bdc830526

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
