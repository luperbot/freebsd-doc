=============================
Testing Guide for 4.5-RELEASE
=============================

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

Testing Guide for 4.5-RELEASE
=============================

Goals
~~~~~

As part of our on-going effort to improve the release engineering
process, we have identified several areas that need significant quality
assurance testing during the release candidate phase. Below, we've
listed the changes in 4.5-PRERELEASE that we feel merit the most
attention due to their involving substantial changes to the system, or
having arrived late in the development cycle leading up to the release.
In general, our goal in the QA process is to attempt to check a number
of things:

-  The system has not regressed with respects to stability, correctness,
   interoperability, or performance of features present in prior
   releases.
-  New features result in the desired improvement in stability,
   correctness, interoperability, or performance.

To effectively determine this, it's desirable to test the system in a
diverse set of environments, applying a wide set of workloads, forcing
the system to operate both within and outside its normal specification.
Particular focus should often be placed on the continuing (or new)
capability of the system to perform correctly when used in concert with
systems from other vendors.

Features to explore carefully:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Recent TCP changes, especially relating to the delayed ACK fix,
   congestion response, syncache, syncookies, increased socket buffer
   sizes, et al. We're interested in testing interoperability with as
   many platforms as possible, demonstrating continued strong (and
   better) scalability and performance, and watching out for quirks
   (connection stalls, ...), not to mention crashes. Jonathan Lemon was
   responding to a panic report on freebsd-current earlier today
   regarding a PCB call, which is something we should keep an eye on. On
   the other hand, `Yahoo! <http://www.yahoo.com/>`__ is now deploying
   this code, and that should help test it a great deal.
-  VFS/VM/NFS fixes. We need to continue to test performance,
   correctness, and interoperability. In particular, I'd like to see a
   lot of inter-platform performance testing (FreeBSD->Solaris, vice
   versa, etc). We'd also like careful investigation of low-memory
   situations.
-  FFS fixes. We had some reports of deadlocks in FFS; it sounds like
   Matt Dillon has caught most of them, but combinations I'd particular
   like to see tested involve Quotas, Chroot, and NFS, under load, and
   involving memory mapping and heavy directory operations.
-  NTP 4.1. This is probably reasonable safe, but it doesn't hurt to do
   interop testing, especially on the Alpha platform.
-  SMBfs. We need stability testing, mostly, I suspect. Performance is
   probably not a large focus. While SMBfs support has been available on
   -STABLE through a port previously, determining that the integration
   with the base system (especially the boot process) was done correctly
   is important. Attempting to use SMBfs in /etc/fstab in a diskless
   environment might be one thing to explore, for example.
-  Once the man page change goes in (which I think it should) we'll want
   some basic testing of the man command. **Update:** This change proved
   too controversial for introduction this late in the release cycle,
   and so it will not be included with FreeBSD 4.5.
-  cdboot. Late in the release cycle, a new implementation of the
   CD-based boot loader was introduced. This should generally improve
   support for booting or installing from CD, but this change requires
   testing on a variety of architectures and devices. **Update:** Thanks
   to everyone who helped test this functionality. A number of users
   reported problems booting with this new loader, so this will not be
   used for FreeBSD 4.5.
-  Sysinstall module loading. In order to make room for more devices on
   the boot floppy, a number of wireless Ethernet device drivers were
   moved over to the MFSROOT floppy in the form of loadable kernel
   modules. We would like to see this functionality tested thoroughly
   before the final release.
-  ATA code. The ATA driver has been updated to support 48bit addressing
   and has been tested to work with at least one 160GB IDE drive.
   Further testing with very large IDE drives is necessary.
-  XFree86. There was at least one problem report with XFree86 4.x sent
   to the ``qa@FreeBSD.org`` mailing list. Please help us test this
   important third party software package to ensure it works well with
   FreeBSD 4.5. The FreeBSD Handbook may need to be updated to describe
   the recommended procedure for installing XFree86 4.x during a new
   installation.
-  Linux Compatibility. There was a small change in the Ethernet device
   enumeration of the Linux compatibility layer. All Linux applications
   should be tested under the new environment. In particular, those
   applications that deal with network interfaces should be tested
   carefully.

The `release notes <../../relnotes.html>`__ will always be a good place
to look for things to test. There are a number of new drivers, including
``if_em``, which would probably benefit from more exposure. Please
report bugs to the qa@FreeBSD.org list, and/or via send-pr with a heads
up to the qa list.

Known Issues
~~~~~~~~~~~~

`4.5 Release Candidate
3 <ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386>`__ was released on
January 23. There will be one final release candidate before the final
release. Please see the postings to qa@FreeBSD.org and
stable@FreeBSD.org for more information.

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
