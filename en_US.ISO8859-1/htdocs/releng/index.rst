===============================
Release Engineering Information
===============================

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

Release Engineering Information
===============================

This page contains documentation about the FreeBSD release engineering
process.

-  `Code Freeze Status <#freeze>`__
-  `Charter for the Release Engineering Team <../releng/charter.html>`__
-  `Release Engineering Documentation <#docs>`__
-  `Current Release Engineering Team <#team>`__
-  `Old Releases <#old>`__

Upcoming Release Schedule
-------------------------

NOTE: Release dates are approximate and may be subject to schedule
slippage.

+---------------+----------------+---------------------------------------------------------+
| Date          | Event          | Information                                             |
+===============+================+=========================================================+
| August?2015   | FreeBSD?10.2   | `Target Schedule <../releases/10.2R/schedule.html>`__   |
+---------------+----------------+---------------------------------------------------------+
| July?2016     | FreeBSD?11.0   | `Target Schedule <../releases/11.0R/schedule.html>`__   |
+---------------+----------------+---------------------------------------------------------+

Code-Freeze Status
------------------

The following table lists the code freeze status for the major branches
of the ``src/`` subtree of the FreeBSD Subversion repository. Commits to
any branch listed as "frozen" must first be reviewed and approved by the
relevant contact party. The status of other subtrees such as ``ports/``
and ``doc/``, is also provided below.

Branch
Status
Contact
Notes
``head``
Open
committers
Active development branch for 11.0-CURRENT.
``stable/10``
Open
committers
Development branch for FreeBSD 10-STABLE.
``releng/10.1``
Frozen
security-officer@FreeBSD.org
FreeBSD 10.1 supported errata fix branch.
``releng/10.0``
Frozen
security-officer@FreeBSD.org
FreeBSD 10.0 errata fix branch (not officially supported).
``stable/9``
Open
committers
Development branch for FreeBSD 9-STABLE.
``releng/9.3``
Frozen
security-officer@FreeBSD.org
FreeBSD 9.3 supported errata fix branch.
``releng/9.2``
Frozen
security-officer@FreeBSD.org
FreeBSD 9.2 errata fix branch (not officially supported).
``releng/9.1``
Frozen
security-officer@FreeBSD.org
FreeBSD 9.1 errata fix branch (not officially supported).
``releng/9.0``
Frozen
security-officer@FreeBSD.org
FreeBSD 9.0 errata fix branch (not officially supported).
``stable/8``
Open
committers
Development branch for 8-STABLE.
``releng/8.4``
Frozen
security-officer@FreeBSD.org
FreeBSD 8.4 supported errata fix branch.
``releng/8.3``
Frozen
security-officer@FreeBSD.org
FreeBSD 8.3 errata fix branch (not officially supported).
``releng/8.2``
Frozen
security-officer@FreeBSD.org
FreeBSD 8.2 errata fix branch (not officially supported).
``releng/8.1``
Frozen
security-officer@FreeBSD.org
FreeBSD 8.1 errata fix branch (not officially supported).
``releng/8.0``
Frozen
security-officer@FreeBSD.org
FreeBSD 8.0 errata fix branch (not officially supported).
``stable/7``
Open
committers
Maintenance branch for 7-STABLE (not officially supported).
``releng/7.4``
Frozen
security-officer@FreeBSD.org
FreeBSD 7.4 errata fix branch (not officially supported).
``releng/7.3``
Frozen
security-officer@FreeBSD.org
FreeBSD 7.3 errata fix branch (not officially supported).
``releng/7.2``
Frozen
security-officer@FreeBSD.org
FreeBSD 7.2 errata fix branch (not officially supported).
``releng/7.1``
Frozen
security-officer@FreeBSD.org
FreeBSD 7.1 errata fix branch (not officially supported).
``releng/7.0``
Frozen
security-officer@FreeBSD.org
FreeBSD 7.0 errata fix branch (not officially supported).
``stable/6``
Open
committers
Maintenance branch for 6-STABLE (not officially supported).
``releng/6.4``
Frozen
security-officer@FreeBSD.org
FreeBSD 6.4 errata fix branch (not officially supported).
``releng/6.3``
Frozen
security-officer@FreeBSD.org
FreeBSD 6.3 errata fix branch (not officially supported).
``releng/6.2``
Frozen
security-officer@FreeBSD.org
FreeBSD 6.2 errata fix branch (not officially supported).
``releng/6.1``
Frozen
security-officer@FreeBSD.org
FreeBSD 6.1 errata fix branch (not officially supported).
``releng/6.0``
Frozen
security-officer@FreeBSD.org
FreeBSD 6.0 errata fix branch (not officially supported).
``stable/5``
Open
committers
Maintenance branch for 5-STABLE (not officially supported).
``releng/5.5``
Frozen
security-officer@FreeBSD.org
FreeBSD 5.5 errata fix branch (not officially supported).
``releng/5.4``
Frozen
security-officer@FreeBSD.org
FreeBSD 5.4 errata fix branch (not officially supported).
``releng/5.3``
Frozen
security-officer@FreeBSD.org
FreeBSD 5.3 errata fix branch (not officially supported).
``releng/5.2``
Frozen
security-officer@FreeBSD.org
FreeBSD 5.2 / 5.2.1 security fix branch (not officially supported).
``releng/5.1``
Frozen
security-officer@FreeBSD.org
FreeBSD 5.1 security fix branch (not officially supported).
``releng/5.0``
Frozen
security-officer@FreeBSD.org
FreeBSD 5.0 security fix branch (not officially supported).
``stable/4``
Open
committers
Maintenance branch for 4-STABLE (not officially supported).
``releng/4.11``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.11 errata fix branch (not officially supported).
``releng/4.10``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.10 security fix branch (not officially supported).
``releng/4.9``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.9 security fix branch (not officially supported).
``releng/4.8``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.8 security fix branch (not officially supported).
``releng/4.7``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.7 security fix branch (not officially supported).
``releng/4.6``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.6 security fix branch (not officially supported).
``releng/4.5``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.5 security fix branch (not officially supported).
``releng/4.4``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.4 security fix branch (not officially supported).
``releng/4.3``
Frozen
security-officer@FreeBSD.org
FreeBSD 4.3 security fix branch (not officially supported).
``stable/3``
Open
committers
Maintenance branch for 3-STABLE (not officially supported).
``stable/2.2``
Open
committers
Maintenance branch for 2.2-STABLE (not officially supported).
Subtree
Status
Contact
Notes
``ports/``
Open
portmgr@FreeBSD.org
FreeBSD Ports Collection.
``doc/``
Open
freebsd-doc@FreeBSD.org
SGML/XML based documentation set.
Release Engineering Documentation
---------------------------------

-  | `FreeBSD Release
     Engineering <../doc/en_US.ISO8859-1/articles/releng/index.html>`__
   |  Describes the approach used by the FreeBSD release engineering
     team to make production quality releases of the FreeBSD Operating
     System. It describes the tools available for those interested in
     producing customized FreeBSD releases for corporate rollouts or
     commercial productization.

-  | `FreeBSD Release Engineering for Third Party
     Packages <../doc/en_US.ISO8859-1/articles/releng-packages/index.html>`__
   |  Describes the approach used by the FreeBSD release engineering
     team to produce a high quality package set suitable for official
     FreeBSD release media. This document is a work in progress, but
     eventually it will cover the process used to build a clean package
     set on the FreeBSD.org "Ports Cluster", how to configure any other
     set of machines as a ports cluster, how to split up the packages
     for the release media, and how to verify that a package set is
     consistent.

Release Engineering Team
------------------------

The primary release engineering team is responsible for approving
`MFC <../doc/en_US.ISO8859-1/books/handbook/freebsd-glossary.html#mfc-glossary>`__
requests during code freezes, setting release schedules, and all of the
other responsibilities laid out in our
`charter <../releng/charter.html>`__.

**Primary RE Team (re@FreeBSD.org)** : Glen Barber, Konstantin Belousov,
Marc Fonvieille, Xin Li, Craig Rodrigues, Hiroki Sato, Gleb Smirnoff,
Marius Strobl, Robert Watson form the primary release engineering
decision-making group.

The builders release engineering team is responsible for building and
packaging FreeBSD releases on the various supported platforms.

**Builders REs (re-builders@FreeBSD.org)** : Marcel Moolenaar, Yoshihiro
Takahashi, Nathan Whitehorn

The third party packages in the Ports Collection are managed by the
portmgr@ team. Among many other responsibilities, the port managers keep
the ports cluster running smoothly to produce binary packages.

**Package Builders (portmgr@FreeBSD.org)** : Mathieu Arnold, Antoine
Brodin, Baptiste Daroussin, Bryan Drewery, Erwin Lansing, Steve Wills

Old Releases
------------

The FreeBSD Project does not maintain a complete archive of old release
ISO images but many of them are available at
ftp://ftp-archive.FreeBSD.org/pub/FreeBSD-Archive/old-releases/.

If you are unable to find an FTP mirror that still contains the release
you are looking for, then you can email CD-ROM vendors to see if they
have any old releases available.

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
