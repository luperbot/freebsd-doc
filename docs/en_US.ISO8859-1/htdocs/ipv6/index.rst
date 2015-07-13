===============
IPv6 in FreeBSD
===============

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

IPv6 in FreeBSD
===============

.. raw:: html

   <div id="catnav">

Category Navigation
^^^^^^^^^^^^^^^^^^^

-  `IPv6 in FreeBSD <../ipv6/>`__
-  `No-IPv4 support (IPv6-only) <../ipv6/ipv6only.html>`__
-  `World IPv6 Launch <../ipv6/w6l.html>`__
-  `World IPv6 Day <../ipv6/w6d.html>`__
-  

   -  `www stats <../ipv6/w6d-www-stats.html>`__

.. raw:: html

   </div>

Introduction
------------

FreeBSD has shipped tightly integrated IPv6 support for over a decade,
with the FreeBSD 4.0 in 2000 the first release to include
"out-of-the-box" IPv6 support. These web pages document on-going IPv6
development in the FreeBSD community, including participation in IPv6
World Day 2011.

Latest news
-----------

-  **January 12, 2012**: 9.0-RELEASE no-IPv4 support (IPv6-only)
   snapshots available. For more details and download links see
   `IPv6Only wiki page <http://wiki.freebsd.org/IPv6Only>`__.
-  **December 15, 2011**: 9.0-RC3 no-IPv4 support (IPv6-only) snapshots
   available. For more details and download links see `IPv6Only wiki
   page <http://wiki.freebsd.org/IPv6Only>`__.
-  **August 3, 2011**: 9.0-BETA1 IPv6-only snapshots available. For more
   details and download links see `IPv6Only wiki
   page <http://wiki.freebsd.org/IPv6Only>`__.
-  **June 9, 2011**: Thanks to everyone having joined us for World IPv6
   Day. We have some (unspectacular) `statistics of
   www.freebsd.org <w6d-www-stats.html>`__ starting 12 hours before and
   running until 12 hours after the event for you.
-  **June 7, 2011**: New set of IPv6-only snapshots uploaded. Now with
   RFC 6106 DNS search list and nameserver support in
   `rtsol(8) <//www.FreeBSD.org/cgi/man.cgi?query=rtsol&sektion=8>`__
   and
   `rtsold(8) <//www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8>`__,
   also when installing. Read more about the snapshots
   `here <ipv6only.html>`__ and find download links and netinstall
   documentation `on the wiki <http://wiki.freebsd.org/IPv6Only>`__.
-  **June 6, 2011**: The FreeBSD Foundation and iXsystems announced
   today their commitment to support the efforts of World IPv6 Day to
   accelerate global IPv6 deployment. Read the `entire press
   release <http://www.prweb.com/releases/2011/6/prweb8529718.htm>`__
   and find more information on FreeBSD and World IPv6 Day
   `here <w6d.html>`__.
-  **June 6, 2011**: New set of IPv6-only snapshots uploaded. Read more
   about the snapshots `here <ipv6only.html>`__ and find download links
   `here <http://wiki.freebsd.org/IPv6Only>`__.
-  **June 6, 2011**: Hiroki Sato
   `commits <http://svn.freebsd.org/changeset/base/222732>`__ `RFC
   6106 <http://www.rfc-editor.org/rfc/rfc6106.txt>`__ "IPv6 Router
   Advertisement Options for DNS Configuration" (RDNSS and DNSSL)
   support.

IPv6 in FreeBSD
---------------

FreeBSD is a widely used, open source operating system whose network
stack has been the foundation for decades of research, as well as a
reference implementation of IPv6 (developed by the
`KAME <http://www.kame.net/>`__ project). FreeBSD first shipped IPv6
support in March 2000 as part of FreeBSD `4.0-Release <../releases/>`__.

IPv6 and the FreeBSD Project
----------------------------

The FreeBSD Project has been an early adopter and active participant in
the IPv6 community. With the help of the community, we have been serving
releases from IPv6-enabled servers since May 2003 and FreeBSD's website,
mailing lists, and developer infrastructure have been IPv6 enabled since
2007.

FreeBSD is used by critical Internet infrastructure such as root name
servers, routers, firewalls and some of the world's busiest and most
reliable web sites as well as embedded into many products all in the
need for the best IPv6 support. To read more about some companies using
the FreeBSD operating system in their products, see the `FreeBSD
Foundation
Testimonials <http://www.freebsdfoundation.org/testimonials.shtml>`__
page.

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
