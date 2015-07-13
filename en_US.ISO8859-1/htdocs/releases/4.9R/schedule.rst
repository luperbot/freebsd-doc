===========================
FreeBSD 4.9 Release Process
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

FreeBSD 4.9 Release Process
===========================

Introduction
============

This is a specific schedule for the release of FreeBSD 4.9. For more
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

+--------------------+--------------------+--------------------+--------------------+
| Action             | Expected           | Actual             | Description        |
+--------------------+--------------------+--------------------+--------------------+
| Reminder           | 28?Jul?2003        | 28?Jul?2003        | Release Engineers  |
| announcement       |                    |                    | send announcement  |
|                    |                    |                    | email to           |
|                    |                    |                    | ``developers@FreeB |
|                    |                    |                    | SD.org``           |
|                    |                    |                    | with a rough       |
|                    |                    |                    | schedule for the   |
|                    |                    |                    | FreeBSD 4.9        |
|                    |                    |                    | release.           |
+--------------------+--------------------+--------------------+--------------------+
| Another Reminder   | 18?Aug?2003        | 18?Aug?2003        | 1 week reminder.   |
| announcement       |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
| Another Reminder   | 24?Aug?2003        | 24?Aug?2003        | Final reminder,    |
| announcement       |                    |                    | with exact time    |
|                    |                    |                    | (GMT) that freeze  |
|                    |                    |                    | begins.            |
+--------------------+--------------------+--------------------+--------------------+
| 4.9-PRERELEASE     | 25 Aug 2003        | --                 | A `testing         |
| Testing Guide      |                    |                    | guide <../../relea |
| published          |                    |                    | ses/4.9R/qa.html>` |
|                    |                    |                    | __                 |
|                    |                    |                    | should be          |
|                    |                    |                    | published with     |
|                    |                    |                    | information about  |
|                    |                    |                    | recent changes and |
|                    |                    |                    | areas of the       |
|                    |                    |                    | system that should |
|                    |                    |                    | be thoroughly      |
|                    |                    |                    | tested during the  |
|                    |                    |                    | pre-release/RC     |
|                    |                    |                    | period.            |
+--------------------+--------------------+--------------------+--------------------+
| ``4.9-PRERELEASE`` | 25 Aug 2003        | 25 Aug 2003        | ``newvers.sh``,    |
|                    |                    |                    | and                |
|                    |                    |                    | ``release.ent``    |
|                    |                    |                    | updated.           |
+--------------------+--------------------+--------------------+--------------------+
| FTP site updated   | 25 Aug 2003        | 25 Aug 2003        | ``pkg_add -r``     |
|                    |                    |                    | works for          |
|                    |                    |                    | ``4.9-PRERELEASE`` |
|                    |                    |                    | machines.          |
+--------------------+--------------------+--------------------+--------------------+
| Code freeze begins | 25 Aug 2003        | 25 Aug 2003        | After this date,   |
|                    |                    |                    | all commits to the |
|                    |                    |                    | ``RELENG_4``       |
|                    |                    |                    | branch must be     |
|                    |                    |                    | approved by        |
|                    |                    |                    | re@FreeBSD.org.    |
|                    |                    |                    | Certain highly     |
|                    |                    |                    | active             |
|                    |                    |                    | documentation      |
|                    |                    |                    | committers are     |
|                    |                    |                    | exempt from this   |
|                    |                    |                    | rule for routine   |
|                    |                    |                    | man page / release |
|                    |                    |                    | note updates.      |
|                    |                    |                    | Heads-up emails    |
|                    |                    |                    | should be sent to  |
|                    |                    |                    | the                |
|                    |                    |                    | ``developers@``,   |
|                    |                    |                    | ``stable@`` and    |
|                    |                    |                    | ``qa@`` lists.     |
+--------------------+--------------------+--------------------+--------------------+
| ``4.9-RC``         | 12 Sep 2003        | 28 Sep 2003        | ``newvers.sh`` and |
|                    |                    |                    | ``release.ent``    |
|                    |                    |                    | updated.           |
+--------------------+--------------------+--------------------+--------------------+
| Announce the Ports | 19 Aug 2003        | 19 Aug 2003        | Someone from       |
| Freeze             |                    |                    | ``portmgr@``       |
|                    |                    |                    | should email       |
|                    |                    |                    | ``freebsd-ports@`` |
|                    |                    |                    | and BCC:           |
|                    |                    |                    | ``developers@`` to |
|                    |                    |                    | set a date for the |
|                    |                    |                    | week long ports    |
|                    |                    |                    | freeze and tagging |
|                    |                    |                    | of the ports tree. |
+--------------------+--------------------+--------------------+--------------------+
| First release      | 12 Sep 2003        | 28 Sep 2003        | The first release  |
| candidate          |                    |                    | candidate for the  |
|                    |                    |                    | x86 and Alpha      |
|                    |                    |                    | architecture is    |
|                    |                    |                    | released. ISO      |
|                    |                    |                    | images should be   |
|                    |                    |                    | uploaded to        |
|                    |                    |                    | ``ftp-master.FreeB |
|                    |                    |                    | SD.org``           |
|                    |                    |                    | and                |
|                    |                    |                    | ``releng4.FreeBSD. |
|                    |                    |                    | org``.             |
|                    |                    |                    | A network install  |
|                    |                    |                    | directory should   |
|                    |                    |                    | be uploaded to     |
|                    |                    |                    | ``ftp-master.FreeB |
|                    |                    |                    | SD.org``.          |
|                    |                    |                    | The ``packages/``  |
|                    |                    |                    | directory should   |
|                    |                    |                    | be a *relative*    |
|                    |                    |                    | symlink, as        |
|                    |                    |                    | described in the   |
|                    |                    |                    | releng article.    |
|                    |                    |                    | Send a note to     |
|                    |                    |                    | mirror-announce@Fr |
|                    |                    |                    | eeBSD.org          |
|                    |                    |                    | saying a "Normal   |
|                    |                    |                    | Release Cycle" is  |
|                    |                    |                    | beginning, RC ISOs |
|                    |                    |                    | and install        |
|                    |                    |                    | directories will   |
|                    |                    |                    | be coming through  |
|                    |                    |                    | the next few       |
|                    |                    |                    | weeks.             |
+--------------------+--------------------+--------------------+--------------------+
| Heads up to        | 12 Sep 2003        | 28 Sep 2003        | A message should   |
| ``-stable``        |                    |                    | be sent to         |
|                    |                    |                    | ``qa@FreeBSD.org`` |
|                    |                    |                    | and                |
|                    |                    |                    | ``stable@FreeBSD.o |
|                    |                    |                    | rg``               |
|                    |                    |                    | after the snapshot |
|                    |                    |                    | is uploaded.       |
+--------------------+--------------------+--------------------+--------------------+
| Second release     | 17 Sep 2003        | 8 Oct 2003         | Note: the release  |
| candidate          |                    |                    | date of this       |
|                    |                    |                    | candidate depends  |
|                    |                    |                    | on the user        |
|                    |                    |                    | experience with    |
|                    |                    |                    | RC1.               |
+--------------------+--------------------+--------------------+--------------------+
| Third release      | 17 Oct 2003        | 18 Oct 2003        |                    |
| candidate          |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
| Ports tree frozen  | 10 Sep 2003        | 10 Sep 2003        | Only approved      |
|                    |                    |                    | commits will be    |
|                    |                    |                    | permitted to the   |
|                    |                    |                    | ``ports/`` tree    |
|                    |                    |                    | during the freeze. |
+--------------------+--------------------+--------------------+--------------------+
| Announce ``doc/``  | 17 Oct 2003        | 18 Oct 2003        | Notification of    |
| tree slush         |                    |                    | the impending      |
|                    |                    |                    | ``doc/`` tree      |
|                    |                    |                    | slush should be    |
|                    |                    |                    | sent to ``doc@``.  |
+--------------------+--------------------+--------------------+--------------------+
| ``doc/`` tree      | 18 Oct 2003        | 18 Oct 2003        | Non-essential      |
| slush              |                    |                    | commits to the     |
|                    |                    |                    | ``en_US.ISO8859-1/ |
|                    |                    |                    | ``                 |
|                    |                    |                    | subtree should be  |
|                    |                    |                    | delayed from this  |
|                    |                    |                    | point until after  |
|                    |                    |                    | the ``doc/`` tree  |
|                    |                    |                    | tagging, to give   |
|                    |                    |                    | translation teams  |
|                    |                    |                    | time to            |
|                    |                    |                    | synchronize their  |
|                    |                    |                    | work.              |
+--------------------+--------------------+--------------------+--------------------+
| Ports tree tagged  | 23 Sep 2003        | 24 Sep 2003        | ``RELEASE_4_9_0``  |
|                    |                    |                    | tag for            |
|                    |                    |                    | ``ports/``.        |
+--------------------+--------------------+--------------------+--------------------+
| Ports tree         | --                 | --                 | After the          |
| unfrozen           |                    |                    | ``ports/`` tree is |
|                    |                    |                    | tagged, the        |
|                    |                    |                    | ``ports/`` tree    |
|                    |                    |                    | will be re-opened  |
|                    |                    |                    | for commits, but   |
|                    |                    |                    | commits made after |
|                    |                    |                    | tagging will not   |
|                    |                    |                    | go in 4.9-RELEASE. |
+--------------------+--------------------+--------------------+--------------------+
| Final package      | 19 Sep 2003        | 10 Oct 2003        | The ports cluster  |
| build starts       |                    |                    | and                |
|                    |                    |                    | `bento <http://ben |
|                    |                    |                    | to.FreeBSD.org>`__ |
|                    |                    |                    | build final        |
|                    |                    |                    | packages.          |
+--------------------+--------------------+--------------------+--------------------+
| ``doc/`` tree      | 20 Oct 2003        | 21 Oct 2003        | Version number     |
| tagged.            |                    |                    | bumps for ``doc/`` |
|                    |                    |                    | subtree.           |
|                    |                    |                    | ``RELEASE_4_9_0``  |
|                    |                    |                    | tag for ``doc/``.  |
|                    |                    |                    | ``doc/`` slush     |
|                    |                    |                    | ends at this time. |
+--------------------+--------------------+--------------------+--------------------+
| ``RELENG_4_9``     | 18 Oct 2003        | 22 Oct 2003        | The release branch |
| branch             |                    |                    | is created.        |
+--------------------+--------------------+--------------------+--------------------+
| Note to            | 18 Oct 2003        | 23 Oct 2003        | A note should be   |
| freebsd-stable@    |                    |                    | sent to the        |
|                    |                    |                    | freebsd-stable@    |
|                    |                    |                    | list to let        |
|                    |                    |                    | over-anxious users |
|                    |                    |                    | know that the tags |
|                    |                    |                    | have been created  |
|                    |                    |                    | but the release    |
|                    |                    |                    | still isn't ready. |
|                    |                    |                    | Tags may be slid   |
|                    |                    |                    | before the         |
|                    |                    |                    | announcement goes  |
|                    |                    |                    | out. Point users   |
|                    |                    |                    | to freebsd-qa@ for |
|                    |                    |                    | details.           |
+--------------------+--------------------+--------------------+--------------------+
| Version numbers    | 18 Oct 2003        | --                 | The files listed   |
| bumped.            |                    |                    | `here <../../doc/e |
|                    |                    |                    | n_US.ISO8859-1/art |
|                    |                    |                    | icles/releng/artic |
|                    |                    |                    | le.html#VERSIONBUM |
|                    |                    |                    | P>`__              |
|                    |                    |                    | are updated to     |
|                    |                    |                    | reflect the fact   |
|                    |                    |                    | that this is       |
|                    |                    |                    | FreeBSD 4.9.       |
+--------------------+--------------------+--------------------+--------------------+
| Update man.cgi on  | 18 Oct 2003        | 19 Oct 2003        | Make sure the 4.9  |
| the website.       |                    |                    | manual pages are   |
|                    |                    |                    | being displayed by |
|                    |                    |                    | default for the    |
|                    |                    |                    | man->web gateway.  |
|                    |                    |                    | Also make sure     |
|                    |                    |                    | these man pages    |
|                    |                    |                    | are pointed to by  |
|                    |                    |                    | docs.xml.          |
+--------------------+--------------------+--------------------+--------------------+
| src tree tagged.   | 21 Oct 2003        | --                 | ``RELENG_4_9_0_REL |
|                    |                    |                    | EASE``             |
|                    |                    |                    | tag for ``src/``.  |
+--------------------+--------------------+--------------------+--------------------+
| Final builds.      | 21 Oct 2003        | --                 | Final builds for   |
|                    |                    |                    | x86 and Alpha in a |
|                    |                    |                    | pristine           |
|                    |                    |                    | environment.       |
+--------------------+--------------------+--------------------+--------------------+
| Warn               | 21 Oct 2003        | --                 | Heads up email to  |
| ``mirror-announce@ |                    |                    | mirror-announce@Fr |
| FreeBSD.org``      |                    |                    | eeBSD.org          |
|                    |                    |                    | to give admins     |
|                    |                    |                    | time to prepare    |
|                    |                    |                    | for the load spike |
|                    |                    |                    | to come. The site  |
|                    |                    |                    | administrators     |
|                    |                    |                    | have frequently    |
|                    |                    |                    | requested advance  |
|                    |                    |                    | notice for new     |
|                    |                    |                    | ISOs.              |
+--------------------+--------------------+--------------------+--------------------+
| Upload to          | 21 Oct 2003        | --                 | Release (and       |
| ``ftp-master``.    |                    |                    | packages?)         |
|                    |                    |                    | uploaded to        |
|                    |                    |                    | ``ftp-master.FreeB |
|                    |                    |                    | SD.org``           |
+--------------------+--------------------+--------------------+--------------------+
| Announcement       | 23 Oct 2003        | --                 | Announcement sent  |
|                    |                    |                    | out after a        |
|                    |                    |                    | majority of the    |
|                    |                    |                    | mirrors have       |
|                    |                    |                    | received the bits. |
+--------------------+--------------------+--------------------+--------------------+
| Unfreeze the tree  | 23 Oct 2003        | --                 | Announcement to    |
|                    |                    |                    | ``developers@``    |
|                    |                    |                    | explaining that    |
|                    |                    |                    | the release is     |
|                    |                    |                    | out, and commits   |
|                    |                    |                    | to ``RELENG_4`` no |
|                    |                    |                    | longer require     |
|                    |                    |                    | approval. Also     |
|                    |                    |                    | note the policy    |
|                    |                    |                    | for commits to the |
|                    |                    |                    | ``RELENG_4_9``     |
|                    |                    |                    | branch.            |
+--------------------+--------------------+--------------------+--------------------+

Additional Information
======================

-  `FreeBSD 4.9 developer todo list. <todo.html>`__
-  `FreeBSD 4.9 Quality Assurance Guide. <qa.html>`__
-  `FreeBSD Release Engineering website. <../../releng/index.html>`__
-  `FreeBSD busdma driver project
   page. <../../projects/busdma/index.html>`__

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
