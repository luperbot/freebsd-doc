===========================
FreeBSD 5.2 Release Process
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

FreeBSD 5.2 Release Process
===========================

Introduction
============

This is a specific schedule for the release of FreeBSD 5.2. For more
general information about the release engineering process, please see
the `Release Engineering <../../releng/index.html>`__ section of the web
site.

General discussions about the release engineering process or quality
assurance issues should be sent to the public
`FreeBSD-qa <mailto:FreeBSD-qa@FreeBSD.org>`__ mailing list.
`MFC <../../doc/en_US.ISO8859-1/books/faq/misc.html#DEFINE-MFC>`__
requests should be sent to re@FreeBSD.org.

FreeBSD 5.2 will continue to be released from the 5-CURRENT development
stream. For more details about the milestones for reaching 5-STABLE, see
the `5-STABLE
Roadmap <http://docs.freebsd.org/doc/5.2-RELEASE/usr/share/doc/en_US.ISO8859-1/articles/5-roadmap/index.html>`__
page.

The current release engineering `TODO
list <../../releases/5.2R/todo.html>`__ is also available. This list is
updated periodically through the release cycle.

Schedule
========

+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Action                                  | Expected      | Actual        | Description                                                                                                                                                                                                  |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``src/`` tree frozen                    | 17?Nov?2003   | 18?Nov?2003   | Announce the ``src/`` code freeze for 5.2 on the ``HEAD`` branch. Commits to ``HEAD`` require ``re@FreeBSD.org`` approval.                                                                                   |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``ports/`` tree frozen                  | 17?Nov?2003   | 19?Nov?2003   | Announce the ``ports/`` code freeze for 5.2. Commits to ``ports/`` require ``portmgr@FreeBSD.org`` approval.                                                                                                 |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Begin ``5.2-BETA`` builds               | 17?Nov?2003   | 24?Nov?2003   | Begin building 5.2-BETA disc1 and disc2 for all Tier-1 platforms.                                                                                                                                            |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Release ``5.2-BETA``                    | 19?Nov?2003   | 26?Nov?2003   | 5.2-BETA tier-1 platform images released and uploaded to ``ftp-master.FreeBSD.org``.                                                                                                                         |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_5_2`` branched                 | 1?Dec?2003    | 6?Dec?2003    | Branch of ``src/`` from ``HEAD`` for the release. Note: no branch for ``RELENG_5`` will happen at this time.                                                                                                 |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Turn off debugging for ``RELENG_5_2``   | 1?Dec?2003    | 6?Dec?2003    | Turn off WITNESS, INVARIANTS, and malloc debugging options similar to what was done for 5.1.                                                                                                                 |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Begin ``5.2-RC1`` builds                | 1?Dec?2003    | 7?Dec?2003    | Begin building 5.2-RC1 disc1 and disc2 for all Tier-1 platforms.                                                                                                                                             |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``src/`` unfrozen                       | 1?Dec?2003    | 6?Dec?2003    | Unfreeze ``HEAD`` src. Continue to coordinate significant check-ins with ``re@FreeBSD.org`` in order to work towards ``5-STABLE``.                                                                           |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Release ``5.2-RC1``                     | 3?Dec?2003    | 10?Dec?2003   | 5.2-RC1 tier-1 platform images released and uploaded to ``ftp-master.FreeBSD.org``.                                                                                                                          |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports tree tagged                       | 3?Dec?2003    | 3?Dec?2003    | Tentative date of ``RELEASE_5_2_0`` tag for ports.                                                                                                                                                           |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``doc/`` tree slush                     | 8?Dec?2003    | 9?Dec?2003    | Announce the ``doc/`` slush for 5.2. From this time until the tagging of the ``doc/`` tree, non-critical changes should be postponed to allow translation teams time to finish their work for the release.   |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Begin ``5.2-RC2`` builds                | 19?Dec?2003   | 21?Dec?2003   | Begin building 5.2-RC2 disc1 and disc2 for all Tier-1 platforms.                                                                                                                                             |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Release ``5.2-RC2``                     | 21?Dec?2003   | 23?Dec?2003   | 5.2-RC2 tier-1 platform images released and uploaded to ``ftp-master.FreeBSD.org``.                                                                                                                          |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``doc/`` tree tagged                    | 12?Dec?2003   | 12?Dec?2003   | Tag the ``doc/`` tree with ``RELEASE_5_2_0``.                                                                                                                                                                |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Version numbers bumped                  | Jan?2004      | Jan?11?2004   | The files listed `here <../../doc/en_US.ISO8859-1/articles/releng/article.html#VERSIONBUMP>`__ are updated to reflect FreeBSD 5.2.                                                                           |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``src/`` tree tagged                    | Jan?2004      | Jan?11?2004   | Tag the ``RELENG_5_2`` branch with ``RELENG_5_2_0_RELEASE``.                                                                                                                                                 |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Begin ``5.2-RELEASE`` builds            | Jan?2004      | Jan?11?2004   | Start 5.2-RELEASE Tier-1 builds.                                                                                                                                                                             |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Warn ``mirror-announce@FreeBSD.org``    | Jan?2004      | Jan?11?2004   | Heads up email to ``mirror-announce@FreeBSD.org`` to give admins time to prepare for the load spike to come. The site administrators have frequently requested advance notice for new ISOs.                  |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Upload to ``ftp-master``                | Jan?2004      | Jan?11?2004   | Release and packages uploaded to ``ftp-master.FreeBSD.org.``                                                                                                                                                 |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.2 Announced                   | Jan?2004      | Jan?12?2004   | FreeBSD 5.2 is announced to the mailing lists.                                                                                                                                                               |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.2 Press Release               | Jan?2004      | Jan?12?2004   | A formal press release statement is in the works and should be released at this time to the ``www.FreeBSD.org`` website and various tech publications.                                                       |
+-----------------------------------------+---------------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
