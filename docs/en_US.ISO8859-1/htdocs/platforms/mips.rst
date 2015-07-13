====================
FreeBSD/MIPS Project
====================

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

-  `Home <../>`__

-  `About <../about.html>`__

   -  `Introduction <../projects/newbies.html>`__
   -  `Features <../features.html>`__
   -  `Advocacy <../advocacy/>`__
   -  `Marketing <../marketing/>`__
   -  `Privacy Policy <../privacy.html>`__

-  `Get FreeBSD <../where.html>`__

   -  `Release Information <../releases/>`__
   -  `Release Engineering <../releng/>`__

-  `Documentation <../docs.html>`__

   -  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../docs/books.html>`__

-  `Community <../community.html>`__

   -  `Mailing Lists <../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../usergroups.html>`__
   -  `Events <../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../support.html>`__

   -  `Vendors <../commercial/commercial.html>`__
   -  `Security Information <../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../donations/>`__

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

-  `Developers <../projects/index.html>`__
-  `Developer's
   Handbook <../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Porter's Handbook <../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Source code repositories <../developers/cvs.html>`__
-  `Release Engineering <../releng/index.html>`__
-  `Platforms <../platforms/>`__
-  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
-  `Contributing <../doc/en_US.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD/MIPS Project
====================

Introduction
~~~~~~~~~~~~

This page contains information about porting FreeBSD to the MIPS?
platform. Discussion of the MIPS port takes place on the
`freebsd-mips <http://lists.freebsd.org/mailman/listinfo/freebsd-mips>`__
mailing list.

Table Of Contents
~~~~~~~~~~~~~~~~~

-  `Status <#status>`__
-  `FreeBSD/MIPS Hardware Notes <#hw>`__
-  `FreeBSD/MIPS mailing list <#list>`__

Status
~~~~~~

MIPS is a `Tier
3 <../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__
architecture, and as such is currently regarded as experimental. It is
not supported by the `FreeBSD <..>`__ project.

FreeBSD/MIPS Hardware Notes
~~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD/MIPS is a port of the FreeBSD operating system to platforms
based around MIPS processors. At the moment, several MIPS32 and MIPS64
development boards and embedded platforms are being targeted.

Listing all supported devices on all CPUs and boards is impractical
here, however much information can be obtained from the mailing list and
archives, `the FreeBSD/MIPS Wiki
pages <https://wiki.freebsd.org/FreeBSD/MIPS>`__, and also from the
`Kernel Configuration
files <https://svnweb.freebsd.org/base/head/sys/mips/conf/>`__

CPUs
^^^^

The following non-exhaustive list of CPUs and CPU families are
supported:

-  MIPS4Kc
-  MIPS24Kc
-  MIPS74Kc
-  Atheros AR71xx, AR724x, AR91xx, AR933x, AR934x
-  Cavium OCTEON
-  NetLogic XLR/XLS CPU family
-  SRI/Cambridge's BERI and CHERI open-source FPGA soft-cores

Note that not all peripherals are supported on all CPUs.

Boards
^^^^^^

The following boards are supported:

-  Ubiquiti Networks Router-Station (AR7130)
-  Ubiquiti Networks Router-Station Pro (AR7161)
-  Ubiquiti Networks PicoStation M2HP (AR7241)
-  Ubiquiti Networks EdgeRouter Lite (OCTEON)
-  TP-Link TL-WR1043ND (AR9132)
-  Mikrotik RouterBoard RB450G
-  Alfa Networks Hornet UB (AR933x)
-  D-Link DIR-825 (AR7161)
-  Atheros PB44, PB47, AP94, AP96 reference designs (AR7161)
-  Atheros DB120 reference design (AR9344)
-  8devices Carambola-2 (AR9330)
-  Engenius ENH-200 (AR7240+AR9285)
-  Buffalo Airstation WZR-300HP B0 A1
-  MIPS Malta evaluation board
-  Lanner MR-320, MR-730, MR-995 (OCTEON)
-  Portwell CAM-0100 (OCTEON)
-  Radisys AMC-7211 / ATCA-7220 (OCTEON)
-  D-Link DSR-500, DSR-500N, DSR-1000 and DSR-1000N (OCTEON)
-  GE Intelligent Platforms WANIC 6354 (OCTEON)
-  Cavium development boards CN5860-EVB-NIC4, CN5650-EVB-NIC16,
   CN5200-EVB-MB4

Note that not all peripherals are supported on all boards.

FreeBSD/MIPS mailing list
~~~~~~~~~~~~~~~~~~~~~~~~~

Join the `FreeBSD/MIPS mailing list <#list>`__ to contribute code or
learn about the status of the project.

To subscribe to this list, send an email to
``<freebsd-mips-subscribe@FreeBSD.org>`` or visit the `mailman
interface <http://lists.FreeBSD.org/mailman/listinfo/freebsd-mips>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../search/index-site.html>`__ \| `Legal
Notices <../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../layout/images/logo-red.png
   :target: ..
