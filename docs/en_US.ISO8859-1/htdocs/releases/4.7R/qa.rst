=============================
Testing Guide for 4.7-RELEASE
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

Testing Guide for 4.7-RELEASE
=============================

Goals
~~~~~

As part of our on-going effort to improve the release engineering
process, we have identified several areas that need significant quality
assurance testing during the release candidate phase. Below, we've
listed the changes in 4.7-RELEASE that we feel merit the most attention
due to their involving substantial changes to the system, or having
arrived late in the development cycle leading up to the release. In
general, our goal in the QA process is to attempt to check a number of
things:

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

-  PPP. A number of significant PPP changes were merged to -STABLE
   before the code freeze. In particular, the following changes were
   made:

   -  IPv6 support
   -  Better RADIUS support (including MS-CHAP)
   -  Improved handling of bad negotiation options
   -  Improved negotiation diagnostics
   -  Improved sockaddr (RTAX) parsing
   -  More consistent compile time options (NOXXX to compile something
      out)
   -  More available macros
   -  Firewall punching
   -  Improved \`\`proxy'' and \`\`proxyall'' handling
   -  Handle connected UDP sockets on descriptor 0 in -direct mode
   -  Fix a load of typos
   -  Update to internal version 3.1

-  IPFilter has recently been updated to version 3.4.29 and has not yet
   been thoroughly tested in -STABLE.
-  **ahc** and **ahd** Adaptec SCSI drivers: There has been a major
   update to the ``ahc`` and ``ahd`` device drivers. These drivers have
   not yet been thoroughly tested in -STABLE.
-  ATA. There were some problems with tagged queuing and some CDROM read
   operations with the ATA stack in FreeBSD 4.6. These problems were
   fixed in 4.6.2, but more testing on different hardware is still
   needed.
-  Sendmail has been updated to 8.12.6. This should be a very stable
   bugfix release, but sendmail users are encouraged to help test this
   before 4.7 is released.
-  XFree86 has been updated to 4.2.1. This release fixes some security
   issues and other bugs in 4.2.0, but should have almost identical
   functionality.
-  Heimdal (Kerberos 5 support) has been updated. Kerberos 5 users are
   encouraged to test this before 4.7 is released.

The `release notes <../../relnotes.html>`__ will always be a good place
to look for things to test.

Known Issues
~~~~~~~~~~~~

-  The 4.7-RC1 snapshots were built without packages due to some
   problems (which only recently came to light) in the bzip2 package
   support. *Resolution:* The RE team decided to return to gzip packages
   for 4.7-RC2 (as well as any subsequent RC snapshots and the final
   release), thus allowing this snapshot to have its normal package set.
-  Partially as a result of the above package problems, the ports tree
   on the 4.7-RC1/i386 ISO image is not exactly the same as the
   4.7-RC1/i386 FTP directory. Both will be eventually updated for
   subsequent RC snapshots and the final release. *Resolution:* Not a
   factor for subsequent snapshots.
-  Loading kernel modules on 4.7-RC1/alpha is broken. *Resolution:* A
   fix has been committed and will be present in 4.7-RC2/alpha.
-  When booting from the install media (e.g. a CDROM), sysinstall tries
   to load a set of modules from the mfsroot image. For some reason,
   sysinstall cannot load the module containing the aac driver; this
   results in an error dialog when starting sysinstall. Access to aac
   devices from within sysinstall is, understandably, broken by this
   error. This appears to be due to a dependency on the linux module.
   *Resolution:* The aac driver was brought back into the install
   kernels, and other modules were moved to modules.

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
