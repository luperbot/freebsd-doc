================================
FreeBSD 7.4-RELEASE Announcement
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

FreeBSD 7.4-RELEASE Announcement
================================

The FreeBSD Release Engineering Team is pleased to announce the
availability of FreeBSD 7.4-RELEASE. This will be the last release from
the 7-STABLE branch.

Some of the highlights:

-  Gnome updated to 2.32.1

-  KDE updated to 4.5.5

-  Many misc. improvements and bugfixes

For a complete list of new features and known problems, please see the
online release notes and errata list available at:

-  ``http://www.FreeBSD.org/releases/7.4R/relnotes.html``

-  ``http://www.FreeBSD.org/releases/7.4R/errata.html``

For more information about FreeBSD release engineering activities please
see:

-  ``http://www.FreeBSD.org/releng/``

Availability
------------

FreeBSD 7.4-RELEASE is now available for the amd64, i386, ia64, pc98,
and sparc64 architectures.

FreeBSD 7.4 can be installed from bootable ISO images or over the
network. The required files can be downloaded via FTP or BitTorrent as
described in the sections below. While some of the smaller FTP mirrors
may not carry all architectures, they will all generally contain the
more common ones such as amd64 and i386.

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
    This contains the base FreeBSD operating system and the xorg
    packages for CDROM-sized media. There are no other packages on this
    image but there are more packages (mostly Gnome and KDE) on the
    disc2 and disc3 images. If you choose to install packages
    post-install you should just need disc1, you only need disc2/disc3
    if you want to install Gnome or KDE during install.

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

FreeBSD 7.4-RELEASE can also be purchased on CD-ROM or DVD from several
vendors. One of the vendors that will be offering FreeBSD 7.4-based
products is:

-  FreeBSD Mall, Inc. ``http://www.freebsdmall.com/``

BitTorrent
----------

7.4-RELEASE ISOs are available via BitTorrent. A collection of torrent
files to download the images is available at:

-  ``http://torrents.FreeBSD.org:8080/``

FTP
---

At the time of this announcement the following FTP sites have FreeBSD
7.4-RELEASE available.

-  ``ftp://ftp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp1.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp2.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp7.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp12.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp13.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.cn.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.dk.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.fr.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.ru.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp1.ru.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.tw.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp4.tw.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp3.us.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp10.us.freebsd.org/pub/FreeBSD/``

However before trying these sites please check your regional mirror(s)
first by going to:

-  ``ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD``

Any additional mirror sites will be labeled **ftp2**, **ftp3** and so
on.

More information about FreeBSD mirror sites can be found at:

-  ``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html``

For instructions on installing FreeBSD, please see Chapter 2 of The
FreeBSD Handbook. It provides a complete installation walk-through for
users new to FreeBSD, and can be found online at:

-  ``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/install.html``

Updates from Source
-------------------

The procedure for doing a source code based update is described in the
FreeBSD Handbook:

-  ``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/synching.html``

-  ``http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html``

The branch tag to use for updating the source is ``RELENG_7_4`` for CVS.
For SVN use ``releng/7.4``.

FreeBSD Update
--------------

The freebsd-update(8) utility supports binary upgrades of i386 and amd64
systems running earlier FreeBSD releases. Systems running
7.[0123]-RELEASE, 7.4-BETA1, or 7.4-RC[123] can upgrade as follows:

::

    # freebsd-update upgrade -r 7.4-RELEASE

During this process, FreeBSD Update may ask the user to help by merging
some configuration files or by confirming that the automatically
performed merging was done correctly.

::

    # freebsd-update install

The system must be rebooted with the newly installed kernel before
continuing.

::

    # shutdown -r now

After rebooting, freebsd-update needs to be run again to install the new
userland components, and the system needs to be rebooted again:

::

    # freebsd-update install
    # shutdown -r now

Users of earlier FreeBSD releases (FreeBSD 6.x) can also use
freebsd-update to upgrade to FreeBSD 7.4, but will be prompted to
rebuild all third-party applications (e.g., anything installed from the
ports tree) after the second invocation of "freebsd-update install", in
order to handle differences in the system libraries between FreeBSD 6.x
and FreeBSD 7.x.

Support
-------

The FreeBSD Security Team currently plans to support FreeBSD 7.4 until
February 28th 2013. Users of FreeBSD 7.3 are strongly encouraged to
upgrade to either FreeBSD 7.4 or FreeBSD 8.X before the FreeBSD 7.3 End
of Life on March 31st 2012. Also note support for FreeBSD 7.1 ends
February 28th, 2011. For more information on the Security Team and their
support of the various FreeBSD branches see:

-  ``http://www.FreeBSD.org/security/``

Acknowledgments
---------------

Many companies donated equipment, network access, or man-hours to
support the release engineering activities for FreeBSD 7.4 including The
FreeBSD Foundation, Hewlett-Packard, Yahoo!, NetApp, Internet Systems
Consortium, and Sentex Communications.

The release engineering team for 7.4-RELEASE includes:

+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Ken?Smith?<kensmith@FreeBSD.org\ >                                 | Release Engineering, amd64, i386, sparc64 Release Building, Mirror Site Coordination   |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Robert?Watson?<rwatson@FreeBSD.org\ >                              | Release Engineering, Security                                                          |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Konstantin?Belousov?<kib@FreeBSD.org\ >                            | Release Engineering                                                                    |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Marc?Fonvieille?<blackend@FreeBSD.org\ >                           | Release Engineering, Documentation                                                     |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Josh?Paetzel?<jpaetzel@FreeBSD.org\ >                              | Release Engineering                                                                    |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Hiroki?Sato?<hrs@FreeBSD.org\ >                                    | Release Engineering, Documentation                                                     |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Bjoern?Zeeb?<bz@FreeBSD.org\ >                                     | Release Engineering                                                                    |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Marcel?Moolenaar?<`marcel@FreeBSD.org <marcel@FreeBSD.org>`__\ >   | ia64, powerpc Release Building                                                         |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Takahashi?Yoshihiro?<nyan@FreeBSD.org\ >                           | PC98 Release Building                                                                  |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Joe?Marcus?Clarke?<marcus@FreeBSD.org\ >                           | Package Building                                                                       |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Erwin?Lansing?<erwin@FreeBSD.org\ >                                | Package Building                                                                       |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Mark?Linimon?<linimon@FreeBSD.org\ >                               | Package Building                                                                       |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Pav?Lucistnik?<pav@FreeBSD.org\ >                                  | Package Building                                                                       |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Ion-Mihai?Tetcu?<itetcu@FreeBSD.org\ >                             | Package Building                                                                       |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Martin?Wilke?<miwi@FreeBSD.org\ >                                  | Package Building                                                                       |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+
| Colin?Percival?<cperciva@FreeBSD.org\ >                            | Security Officer                                                                       |
+--------------------------------------------------------------------+----------------------------------------------------------------------------------------+

Trademark
---------

FreeBSD is a registered trademark of The FreeBSD Foundation.

ISO Image Checksums
-------------------

::

    MD5 (FreeBSD-7.4-RELEASE-amd64-bootonly.iso) = d63b110b10e99520258609f3d28bf0b0
    MD5 (FreeBSD-7.4-RELEASE-amd64-disc1.iso) = ea00c6902424af499360e19339656601
    MD5 (FreeBSD-7.4-RELEASE-amd64-disc2.iso) = 023fe1aec66972f43cda98b97a3c9117
    MD5 (FreeBSD-7.4-RELEASE-amd64-disc3.iso) = 0d7017e106a4ea51cbbc1d7ec5dcd6f8
    MD5 (FreeBSD-7.4-RELEASE-amd64-docs.iso) = bafb94c26d48ed5d2c4f8923b0003b43
    MD5 (FreeBSD-7.4-RELEASE-amd64-dvd1.iso) = fe454e503b9aeab68cff5d8f56ffa73c
    MD5 (FreeBSD-7.4-RELEASE-amd64-livefs.iso) = b8da626af31016c3b860fd093b562ecf
    MD5 (FreeBSD-7.4-RELEASE-amd64-dvd1.iso.gz) = e195b51e86f207d14d12bff9c5de81c6

::

    MD5 (FreeBSD-7.4-RELEASE-i386-bootonly.iso) = 30165c3342ef3508b535313f32a2d0b4
    MD5 (FreeBSD-7.4-RELEASE-i386-disc1.iso) = 746d6908bdac5f96ba3002ae1627aa4c
    MD5 (FreeBSD-7.4-RELEASE-i386-disc2.iso) = c0dbb71dec89341635714d861cca66cf
    MD5 (FreeBSD-7.4-RELEASE-i386-disc3.iso) = 9ad3cfeae844d6db7c385fd743027cb7
    MD5 (FreeBSD-7.4-RELEASE-i386-docs.iso) = a2709e830ee3cc2d12d735750e72ad79
    MD5 (FreeBSD-7.4-RELEASE-i386-dvd1.iso) = 105fc5e9bf7ff0d1eb3ab8f6003ae51f
    MD5 (FreeBSD-7.4-RELEASE-i386-livefs.iso) = 4bd1dea8735dba4347aaac04f7009fc1
    MD5 (FreeBSD-7.4-RELEASE-i386-dvd1.iso.gz) = f3d05347a929e988063bdd176d761734

::

    MD5 (FreeBSD-7.4-RELEASE-pc98-bootonly.iso) = 0901c7c2b10af1f019da231ec57c1baf
    MD5 (FreeBSD-7.4-RELEASE-pc98-disc1.iso) = 90f9e2d1a95e4475cae021607d7d7a0e
    MD5 (FreeBSD-7.4-RELEASE-pc98-livefs.iso) = 2159dd1f7c991e0d2c39e481b7ed128d

::

    MD5 (FreeBSD-7.4-RELEASE-sparc64-bootonly.iso) = 090ff3bf77bb4a8e5c8aac022f41987c
    MD5 (FreeBSD-7.4-RELEASE-sparc64-disc1.iso) = 09bf9f7d7ff62050dc3ea8addc028453
    MD5 (FreeBSD-7.4-RELEASE-sparc64-disc2.iso) = c6db8de5536af23bf5d8a63347261dae
    MD5 (FreeBSD-7.4-RELEASE-sparc64-disc3.iso) = ebcc690de2b0dcbc9d530dcd71943db3
    MD5 (FreeBSD-7.4-RELEASE-sparc64-docs.iso) = 093865a606b4c9e583b82321cb1f5dca

::

    SHA256 (FreeBSD-7.4-RELEASE-amd64-bootonly.iso) = 71c7a0fb224a435a2d482b783af80ff478973a52aaa9e398b77903bf14d6e425
    SHA256 (FreeBSD-7.4-RELEASE-amd64-disc1.iso) = c6d560a010808929570818c6e5947ff4e488085de690dd2d8489d393cf59ddd2
    SHA256 (FreeBSD-7.4-RELEASE-amd64-disc2.iso) = 9f51f6ee4636a9c0f12116539dad2e49c610e113b44cc01790b7167db5ad9500
    SHA256 (FreeBSD-7.4-RELEASE-amd64-disc3.iso) = d80ec0f695312658d2dac7c47ae2bb16a6f68661146b9b7a80fc2a49601e2097
    SHA256 (FreeBSD-7.4-RELEASE-amd64-docs.iso) = 6bdf555fb4a5882af65fea9f418d16cebc2443d72ed9a0af406d714170bf689a
    SHA256 (FreeBSD-7.4-RELEASE-amd64-dvd1.iso) = fcb7f2b97d67b08c4a72144c2d6428442417b671e367c3960b4bd0f27d006388
    SHA256 (FreeBSD-7.4-RELEASE-amd64-livefs.iso) = 7461a584b93fffbc9ca3f363e63913d2eaed2be3c947cb5366fc2f4bc5165e50
    SHA256 (FreeBSD-7.4-RELEASE-amd64-dvd1.iso.gz) = 5b81738635a997b5cd73b92131e2dd1c492a0cd1b7cd95330d75f7a2bada9097

::

    SHA256 (FreeBSD-7.4-RELEASE-i386-bootonly.iso) = 015cbe8fd94d7af971030ff3d9570b4e2a76941b8d9b9c9baba34451dd6e2a65
    SHA256 (FreeBSD-7.4-RELEASE-i386-disc1.iso) = 3a4437fbd10a516f365d169457f9413fe1e8cbc28792935edd83145bd4d20f9d
    SHA256 (FreeBSD-7.4-RELEASE-i386-disc2.iso) = d919293fe6e7fef5e30290f6d5814235f2c1ea8ac7080da8608d84e51da7dbca
    SHA256 (FreeBSD-7.4-RELEASE-i386-disc3.iso) = d69e755ae01bb82efc29b4aaa7f144690a5491506975548666791752662486cb
    SHA256 (FreeBSD-7.4-RELEASE-i386-docs.iso) = 743f5bd8f7e3ee065bf44821eaa026e9ac741c1e8ed1ad0ef4b93cf7d7aa5507
    SHA256 (FreeBSD-7.4-RELEASE-i386-dvd1.iso) = 2511f0f26acc184ec433a6729b54018c6582cf184ca5255cef6884dd2323cfbd
    SHA256 (FreeBSD-7.4-RELEASE-i386-livefs.iso) = b2fc72d782fc2c04afa6fa2ba76197b625436b11e77e18410c11023f68d1f2bd
    SHA256 (FreeBSD-7.4-RELEASE-i386-dvd1.iso.gz) = edfc816c589864d67b4e10500252789e44473cbd79775b8caf35cfa5ec488908

::

    SHA256 (FreeBSD-7.4-RELEASE-pc98-bootonly.iso) = 7420b7155d9e2c479cb18d6743a37f8f778027b400ecd7ac57f113c4f10af340
    SHA256 (FreeBSD-7.4-RELEASE-pc98-disc1.iso) = 9f6ceb3fc95b7c19ff1813ce4c27624f1c168373b02b8970d316c92e396fbb8f
    SHA256 (FreeBSD-7.4-RELEASE-pc98-livefs.iso) = ecd0996a62e7486614987037c47882729ef9c2a2b8b85b39064acfde840a060a

::

    SHA256 (FreeBSD-7.4-RELEASE-sparc64-bootonly.iso) = 0b7c2b29b99a5f39a8702717f7ae62b5dccd16457f208d954d0b99c30296332c
    SHA256 (FreeBSD-7.4-RELEASE-sparc64-disc1.iso) = 984ae17ec236bbaf0af2954fedda9054607a016c8a0e494930f37bf1c842109f
    SHA256 (FreeBSD-7.4-RELEASE-sparc64-disc2.iso) = 4ec37668a8732c77eef91f865da95d8f751784efee6fc3c7222d4a0810f557a6
    SHA256 (FreeBSD-7.4-RELEASE-sparc64-disc3.iso) = 987c44323e9c8e91adca0e5fdbf37cea46a835ff84f6d4bc13f36bd6202ad3c8
    SHA256 (FreeBSD-7.4-RELEASE-sparc64-docs.iso) = 6f21ca0637727a372234f7e57314cf532aabb78b9352c6a9de3867793318682e

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
