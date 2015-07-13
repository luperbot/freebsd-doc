===========================
FreeBSD 5.0 Release Process
===========================

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

FreeBSD 5.0 Release Process
===========================

Introduction
============

This is a specific schedule for the release of FreeBSD 5.0. For more
general information about the release engineering process, please see
the `Release Engineering <../../releng/index.html>`__ section of the web
site.

General discussions about the release engineering process or quality
assurance issues should be sent to the public
`freebsd-qa <mailto:freebsd-qa@FreeBSD.org>`__ mailing list.
`MFC <../../doc/en_US.ISO8859-1/books/faq/misc.html#DEFINE-MFC>`__
requests should be sent to re@FreeBSD.org.

One of the major new features of FreeBSD 5.0 will be completely
re-worked SMP support.

The current release engineering `TODO
list <../../releases/5.0R/todo.html>`__ is also available. This list is
updated periodically through the release cycle.

Schedule
========

+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Action                                  | Expected      | Actual        | Description                                                                                                                                                                                                                                                                              |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``releng_5_dp1`` branch (Perforce)      | 15 Mar 2002   | 15 Mar 2002   | Branch created, commits require re@ approval. The branch will be used to allow us time to QA the release, synchronize the release notes with the translation teams, synchronize sysinstall and the package set, etc without disrupting the normal flow of development on ``-CURRENT``.   |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports Freeze                            | 2 Apr 2002    | 2 Apr 2002    | The ports tree is frozen and tagged for the developer preview.                                                                                                                                                                                                                           |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Final i386 package build completes      | 3 Apr 2002    | 4 Apr 2002    | The final package build for the i386 architecture is complete.                                                                                                                                                                                                                           |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Final Alpha package build completes     | 3 Apr 2002    | 5 Apr 2002    | The final package build for the Alpha architecture is complete.                                                                                                                                                                                                                          |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Final sparc64 package build completes   | 3 Apr 2002    | 7 Apr 2002    | The final package build for the sparc64 architecture is complete.                                                                                                                                                                                                                        |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Package Split                           | 3 Apr 2002    | 7 Apr 2002    | The packages for the installation CDROM are selected from the results of the final package build.                                                                                                                                                                                        |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.0 Developer Preview 1         | 5 Apr 2002    | 8 Apr 2002    | A full release for the i386, Alpha, and sparc64 architectures. The i386 and Alpha releases at least will contain a full package set and a disc1 ISO image will be made available.                                                                                                        |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 5.0 Feature List finalized              | 16 Jun 2002   | --            | At the FreeBSD Developer Summit at Usenix, we will need to finalize the list of features that will be included with FreeBSD 5.0. Some features will just have to wait for 5.1 to give us ample time to QA the many features that are ready.                                              |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_5_0_DP2`` branch               | 17 Jul 2002   | 17 Aug 2002   | Branch created in Perforce, commits require re@ approval.                                                                                                                                                                                                                                |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.0 Developer Preview 2         | 25 Jul 2002   | 18 Nov 2002   | A full release for the i386, Alpha, and sparc64 architectures.                                                                                                                                                                                                                           |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``-CURRENT`` feature freeze             | 1 Oct 2002    | 16 Oct 2002   | After this date, significant new features should be discussed with ``re@`` before consideration for 5.0-RELEASE.                                                                                                                                                                         |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``-CURRENT`` code freeze                | 20 Oct 2002   | 18 Nov 2002   | The code freeze for 5.0. Commits to HEAD require re@ approval.                                                                                                                                                                                                                           |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| First release candidate                 | 2 Dec 2002    | 9 Dec 2002    | x86, alpha, sparc64, and ia64 images released and uploaded to ftp-master.FreeBSD.org.                                                                                                                                                                                                    |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_5_0`` branched                 | 12 Dec 2002   | 12 Dec 2002   | Branch from ``HEAD`` for the release. Note: no branch for ``RELENG_5`` will happen a this time.                                                                                                                                                                                          |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| src unfrozen                            | 12 Dec 2002   | 12 Dec 2002   | Unfreeze ``HEAD`` src. Continue to coordinate significant check-ins with re@FreeBSD.org in order to work towards ``5-STABLE``.                                                                                                                                                           |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Second release candidate                | 17 Dec 2002   | 21 Dec 2002   | --                                                                                                                                                                                                                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports tree tagged                       | 3 Jan 2003    | 1 Jan 2003    | Tentative date of ``RELEASE_5_0_0`` tag for ports.                                                                                                                                                                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Start RC3 builds                        | 7 Jan 2003    | 9 Jan 2003    | Set timestamp and start i386, pc98, sparc64, alpha, and ia64 builds.                                                                                                                                                                                                                     |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Third release candidate released        | 10 Jan 2003   | 12 Jan 2003   | --                                                                                                                                                                                                                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Version numbers bumped                  | 15 Jan 2003   | 15 Jan 2003   | The files listed `here <../../doc/en_US.ISO8859-1/articles/releng/article.html#VERSIONBUMP>`__ are updated to reflect FreeBSD 5.0.                                                                                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| src tree tagged                         | 15 Jan 2003   | 16 Jan 2003   | Tag the RELENG\_5\_0 branch with RELENG\_5\_0\_0\_RELEASE                                                                                                                                                                                                                                |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| doc tree tagged                         | 15 Jan 2003   | 15 Jan 2003   | Tag the doc/ branch with RELEASE\_5\_0\_0                                                                                                                                                                                                                                                |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Final builds                            | 15 Jan 2003   | 16 Jan 2003   | Start x86, alpha, sparc64, ia64, and pc98 builds.                                                                                                                                                                                                                                        |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Warn hubs@FreeBSD.org                   | 15 Jan 2003   | 17 Jan 2003   | Heads up email to hubs@FreeBSD.org to give admins time to prepare for the load spike to come. The site administrators have frequently requested advance notice for new ISOs.                                                                                                             |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Upload to ``ftp-master``                | 17 Jan 2003   | 17 Jan 2003   | Release and packages uploaded to ``ftp-master.FreeBSD.org``                                                                                                                                                                                                                              |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.0 Released                    | 19 Jan 2003   | 19 Jan 2003   | FreeBSD 5.0 is announced to the mailing lists.                                                                                                                                                                                                                                           |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.0 Press Release               | 19 Jan 2003   | --            | A formal press release statement is in the works and should be released at this time to the www.FreeBSD.org website and various tech publications.                                                                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
