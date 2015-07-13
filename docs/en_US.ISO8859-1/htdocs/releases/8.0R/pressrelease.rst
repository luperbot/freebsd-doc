================================
FreeBSD 8.0-RELEASE Announcement
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

FreeBSD 8.0-RELEASE Announcement
================================

FreeBSD Project Announces Release of FreeBSD Version 8.0
--------------------------------------------------------

Release includes enhanced virtualization support, NFSv4, and 802.11s D3.03 wireless mesh networking
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

San Jose, CA (PRWEB) November 25, 2009 -- The FreeBSD Project has
announced the release of FreeBSD Version 8.0. This next major release
branch of FreeBSD delivers a large number of new technologies into the
hands of an ever-increasing number of users. Key release focuses include
wireless networking, virtualization, and storage technology.

802.11 wireless networking has been overhauled to add Virtual Access
Points (VAP) support, which allows multiple wireless networks to be
hosted from a single access point. Draft 802.11 mesh networking support
allows FreeBSD-based devices to dynamically link together to create a
larger wireless network. Also added are TDMA extensions to 802.11,
targeted at long-haul WiFi networks.

FreeBSD 8.0's network stack also offers multiprocessing optimizations: a
revised link layer subsystem, per-CPU flow cache, multiqueue transmit
support, and significant UDP and TCP protocol scalability improvements.
Zero-copy buffer extensions to BPF improve high volume packet capture
performance.

In FreeBSD 8.0, virtual machine administrators in FreeBSD's
ground-breaking lightweight "Jails" can now create their own nested
jails. FreeBSD now supports host and guest modes in VirtualBox, and can
run as a 32-bit Xen DomU guest.

The Network File System (NFS) implementation has been enhanced with
GSSAPI encryption, and also experimental NFSv4 client and server
support. In addition to ZFS moving from experimental to production
status, FreeBSD 8.0 introduces GPT boot support.

Other notable updates in FreeBSD Version 8.0 include:

-  Experimental MIPS support based on a contribution from Juniper
   Networks.
-  Countless SMP scalability improvements significantly aid performance
   on 16-core systems.
-  File system scalability improvements as a result of reimplemented VFS
   locking.
-  Improved exploit mitigation for buffer overflows and kernel NULL
   pointer vulnerabilities.
-  The extensible kernel security framework (MAC Framework) is now
   available out-of-the-box.
-  A ground-up rewrite of the USB stack improving performance, device
   support, and adding USB target mode.

"FreeBSD 8.0's wireless network stack is the industry leader, and makes
FreeBSD the platform of choice for a future generation of networking
products," said FreeBSD Core Team member Robert Watson. "Enterprise
consumers will appreciate 8.0's improved virtualization, storage, and
multiprocessor scalability."

About The FreeBSD Project:
~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD is an advanced operating system for modern server, desktop, and
embedded computer platforms. FreeBSD's code base has undergone over
thirty years of continuous development, improvement, and optimization.
It is developed and maintained by a large team of individuals. FreeBSD
provides advanced networking, impressive security features, and world
class performance and is used by some of the world's busiest web sites
and most pervasive embedded networking and storage devices. The FreeBSD
Project's web site is at
`http://www.FreeBSD.org <http://www.FreeBSD.org/>`__

About The FreeBSD Foundation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The FreeBSD Foundation is a 501(c)(3) non-profit organization dedicated
to supporting the FreeBSD Project. The Foundation gratefully accepts
donations from individuals and businesses, using them to fund projects,
which further the development of the FreeBSD operating system. In
addition, the Foundation represents the FreeBSD Project in executing
contracts, license agreements, and other legal arrangements that require
a recognized legal entity. The FreeBSD Foundation is entirely supported
by donations. More information about the FreeBSD Foundation is available
on the web at http://www.FreeBSDFoundation.org/.

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
