===========================
FreeBSD 7.0 Release Process
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

FreeBSD 7.0 Release Process
===========================

Introduction
============

This is a specific schedule for the release of FreeBSD 7.0. For more
general information about the release engineering process, please see
the `Release Engineering <../../releng/index.html>`__ section of the web
site.

General discussions about the release engineering process or quality
assurance issues should be sent to the public
`freebsd-qa <mailto:FreeBSD-qa@FreeBSD.org>`__ mailing list.
`MFC <../../doc/en_US.ISO8859-1/books/faq/misc.html#DEFINE-MFC>`__
requests should be sent to re@FreeBSD.org.

Schedule
========

+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Action                         | Expected       | Actual         | Description                                                                                                                                                                                                                                                                                  |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reminder announcement          | TBD            | 15?Oct?2007    | Release Engineers send announcement email to developers with a rough schedule for the FreeBSD 7.0 release.                                                                                                                                                                                   |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Announce the Ports Freeze      | 23?Oct?2007    | 23?Oct?2007    | Someone from ``portmgr@`` should email ``freebsd-ports@`` to set a date for the week long ports freeze and tagging of the ports tree.                                                                                                                                                        |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Code freeze begins             | 18?June?2007   | 19?June?2007   | After this date, all commits to HEAD must be approved by re@FreeBSD.org. Certain highly active documentation committers are exempt from this rule for routine man page / release note updates. Heads-up emails should be sent to the developers, as well as ``stable@`` and ``qa@`` lists.   |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Announce ``doc/`` tree slush   | TBD            | 19?Nov?2007    | Notification of the impending ``doc/`` tree slush should be sent to ``doc@``.                                                                                                                                                                                                                |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports tree frozen              | 30?Oct?2007    | 30?Oct?2007    | Only approved commits will be permitted to the ``ports/`` tree during the freeze.                                                                                                                                                                                                            |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``doc/`` tree slush            | 25?Nov?2007    | 25?Nov?2007    | Non-essential commits to the ``en_US.ISO8859-1/`` subtree should be delayed from this point until after the ``doc/`` tree tagging, to give translation teams time to synchronize their work.                                                                                                 |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``doc/`` tree tagged.          | 5?Dec?2007     | 5?Dec?2007     | Version number bumps for ``doc/`` subtree. ``RELEASE_7_0_0`` tag for ``doc/``. ``doc/`` slush ends at this time.                                                                                                                                                                             |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_7`` branch            | --             | 11?Oct?2007    | The new major version branch is created. Update ``newvers.sh`` and ``release.ent`` on various branches involved.                                                                                                                                                                             |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``BETA1`` builds               | 17?Oct?2007    | 19?Oct?2007    | Begin BETA1 builds.                                                                                                                                                                                                                                                                          |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``BETA2`` builds               | 31?Oct?2007    | 31?Oct?2007    | Begin BETA2 builds.                                                                                                                                                                                                                                                                          |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``BETA3`` builds               | 14?Nov?2007    | 16?Nov?2007    | Begin BETA3 builds.                                                                                                                                                                                                                                                                          |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``BETA4`` builds               | 28?Nov?2007    | 2?Dec?2007     | Begin BETA4 builds.                                                                                                                                                                                                                                                                          |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_7_0`` branch          | 12?Dec?2007    | 22?Dec?2007    | The new release branch is created. Update ``newvers.sh`` and ``release.ent`` on various branches involved.                                                                                                                                                                                   |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RC1`` builds                 | 12?Dec?2007    | 22?Dec?2007    | Begin RC1 builds.                                                                                                                                                                                                                                                                            |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RC2`` builds                 | 28?Jan?2008    | 7?Feb?2008     | Begin RC2 builds.                                                                                                                                                                                                                                                                            |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports tree tagged              | 14?Dec?2007    | 11?Dec?2007    | ``RELEASE_7_0_0`` tag for ``ports/``.                                                                                                                                                                                                                                                        |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports tree unfrozen            | 14?Dec?2007    | 11?Dec?2007    | After the ``ports/`` tree is tagged, the ``ports/`` tree will be re-opened for commits, but commits made after tagging will not go in 7.0-RELEASE.                                                                                                                                           |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Final package build starts     | 14?Dec?2007    | 12?Dec?2007    | The ports cluster and `pointyhat <http://pointyhat.FreeBSD.org>`__ build final packages.                                                                                                                                                                                                     |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELEASE`` builds             | 11?Feb?2008    | 23?Feb?2008    | Begin RELEASE builds.                                                                                                                                                                                                                                                                        |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Announcement                   | 26?Feb?2008    | 27?Feb?2008    | Announcement sent out after a majority of the mirrors have received the bits.                                                                                                                                                                                                                |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Turn over to the secteam       | TBD            | 5?Mar?2008     | RELENG\_7\_0 branch is handed over to the FreeBSD Security Officer Team in one or two weeks after the announcement.                                                                                                                                                                          |
+--------------------------------+----------------+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Additional Information
======================

-  `FreeBSD 7.0 developer todo list. <todo.html>`__
-  `FreeBSD 7.0 Code Freeze Commit Approval List. <approvals.html>`__
-  `FreeBSD Release Engineering website. <../../releng/index.html>`__

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
