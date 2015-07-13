=======================
FreeBSD/sparc64 Project
=======================

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

FreeBSD/sparc64 Project
=======================

Introduction
~~~~~~~~~~~~

This page contains information about the FreeBSD port to Fujitsu's
SPARC64? and Oracle's UltraSPARC? architectures. Discussion of this port
takes place on the
`freebsd-sparc <http://lists.freebsd.org/mailman/listinfo/freebsd-sparc64>`__
mailing list.

Table Of Contents
~~~~~~~~~~~~~~~~~

-  `Status <#status>`__
-  `Hardware List <#hw>`__
-  `Credits <#who>`__
-  `FreeBSD/sparc64 mailing list <#list>`__
-  `Points of Interest <#links>`__

Status
~~~~~~

UltraSPARC is a `Tier
2 <../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__
architecture, and as such is not fully supported by the `FreeBSD <..>`__
project. Although fully functional, the port is not as mature as the
existing i386 or amd64 ports.

Hardware List
~~~~~~~~~~~~~

A summary of supported systems follows. SMP is supported on all
supported systems that contain more than 1 processor. For full details
please see the `hardware notes <../releases/10.1R/hardware.html>`__ of
the `release <../releases/>`__ you are using.

-  Naturetech GENIALstation 777S
-  Sun Blade 100
-  Sun Blade 150
-  Sun Enterprise 150
-  Sun Enterprise 220R
-  Sun Enterprise 250
-  Sun Enterprise 420R
-  Sun Enterprise 450
-  Sun Fire B100s (support for the on-board NICs first appeared in
   8.1-RELEASE)
-  Sun Fire V100
-  Sun Fire V120
-  Sun Netra™ T1 100/105
-  Sun Netra T1 AC200/DC200
-  Sun Netra t 1100
-  Sun Netra t 1120
-  Sun Netra t 1125
-  Sun Netra t 1400/1405
-  Sun Netra 120
-  Sun Netra X1
-  Sun SPARCEngine? Ultra AX1105
-  Sun SPARCEngine Ultra AXe
-  Sun SPARCEngine Ultra AXi
-  Sun SPARCEngine Ultra AXmp
-  Sun SPARCEngine CP1500
-  Sun Ultra™ 1
-  Sun Ultra 1E
-  Sun Ultra 2
-  Sun Ultra 5
-  Sun Ultra 10
-  Sun Ultra 30
-  Sun Ultra 60
-  Sun Ultra 80
-  Sun Ultra 450

The following systems are partially supported by FreeBSD. In particular
the fibre channel controllers in SBus-based systems are not supported.
However, it is possible to use these with a SCSI controller supported by
the esp(4) driver (Sun ESP SCSI, Sun FAS Fast-SCSI and Sun FAS366
Fast-Wide SCSI controllers).

-  Sun Enterprise 3500
-  Sun Enterprise 4500

Starting with 7.2-RELEASE, sparc64 systems based on Sun UltraSPARC III
and beyond are also supported by FreeBSD, which includes the following
known working systems:

-  Sun Blade 1000
-  Sun Blade 1500
-  Sun Blade 2000
-  Sun Blade 2500
-  Sun Fire 280R
-  Sun Fire V210
-  Sun Fire V215 (support first appeared in 7.3-RELEASE and 8.1-RELEASE)
-  Sun Fire V240
-  Sun Fire V245 (support first appeared in 7.3-RELEASE and 8.1-RELEASE)
-  Sun Fire V250
-  Sun Fire V440 (support for the on-board NICs first appeared in
   7.3-RELEASE and 8.0-RELEASE)
-  Sun Fire V480 (501-6780 and 501-6790 centerplanes only, for which
   support first appeared in 7.3-RELEASE and 8.1-RELEASE, other
   centerplanes might work beginning with 8.3-RELEASE and 9.0-RELEASE)
-  Sun Fire V880
-  Sun Fire V890 (support first appeared in 7.4-RELEASE and 8.1-RELEASE,
   non-mixed Ultrasparc IV/IV+ CPU-configurations only)
-  Sun Netra 20/Netra T4

The following Sun UltraSPARC systems are not tested but believed to be
also supported by FreeBSD:

-  Sun Fire V125
-  Sun Fire V490 (support first appeared in 7.4-RELEASE and 8.1-RELEASE,
   non-mixed Ultrasparc IV/IV+ CPU-configurations only)

Starting with 7.4-RELEASE and 8.1-RELEASE, sparc64 systems based on
Fujitsu SPARC64 V are also supported by FreeBSD, which includes the
following known working systems:

-  Fujitsu PRIMEPOWER? 250

The following Fujitsu SPARC64 systems are not tested but believed to be
also supported by FreeBSD:

-  Fujitsu PRIMEPOWER 450
-  Fujitsu PRIMEPOWER 650
-  Fujitsu PRIMEPOWER 850

If you have a system that is not listed here please try it, and let
`us <mailto:freebsd-sparc@FreeBSD.org>`__ know about it.

Credits
~~~~~~~

The following people have been working either in the spotlights or
behind the scenes to get the FreeBSD port off the ground:

-  Jake Burkholder <jake@FreeBSD.org\ >
-  Thomas M?stl <tmm@FreeBSD.org\ >
-  David O'Brien <obrien@FreeBSD.org\ >

FreeBSD/sparc64 mailing list
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To subscribe to this list, send an email to
``<freebsd-sparc64-subscribe@FreeBSD.org>`` or visit the `mailman
interface <http://lists.FreeBSD.org/mailman/listinfo/freebsd-sparc64>`__.

Pointers Of Interest
~~~~~~~~~~~~~~~~~~~~

-  `SPARC Standards and technical
   documents <http://www.sparc.org/technical-documents-test-2/>`__
-  `NetBSD/sparc64 <http://www.netbsd.org/Ports/sparc64/>`__
-  `OpenBSD/sparc64 <http://www.openbsd.org/sparc64.html>`__

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
