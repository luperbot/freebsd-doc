============================
FreeBSD 11.0 Release Process
============================

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

FreeBSD 11.0 Release Process
============================

Introduction
============

This is the release schedule for FreeBSD?11.0. For more information
about the release engineering process, please see the `Release
Engineering <../../releng/index.html>`__ section of the web site.

*Important:* This schedule is tentative, and may be subject to change.

General discussions about the pending release and known issues should be
sent to the public
`freebsd-current <mailto:FreeBSD-current@FreeBSD.org>`__ mailing list.
`MFC <../../doc/en_US.ISO8859-1/books/handbook/freebsd-glossary.html#mfc-glossary>`__
requests should be sent to re@FreeBSD.org.

Schedule
========

During the head freeze, the Release Engineering Team may create ALPHA
snapshots to publish for testing purposes. As the frequency and total
number of the ALPHA snapshots will depend on the length of time the head
branch is frozen, no official schedule is provided.

Announcements regarding the availability of the ALPHA snapshots will be
sent to the `freebsd-current <mailto:freebsd-current@FreeBSD.org>`__ and
`freebsd-snapshots <mailto:freebsd-snapshots@FreeBSD.org>`__ mailing
lists.

+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Action                                  | Expected        | Actual             | Description                                                                                                                                                                                                          |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Initial release schedule announcement   | -               | 26?February?2015   | Release Engineers send announcement email to developers with a rough schedule.                                                                                                                                       |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Release schedule reminder               | 25?March?2016   | -                  | Release Engineers send reminder announcement e-mail to developers with updated schedule.                                                                                                                             |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Code slush begins                       | 22?April?2016   | -                  | Release Engineers announce that all further commits to the head branch will not require explicit approval, however new features should be avoided.                                                                   |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Code freeze begins                      | 29?April?2016   | -                  | Release Engineers announce that all further commits to the head branch will require explicit approval. Certain blanket approvals will be granted for narrow areas of development, documentation improvements, etc.   |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| KBI freeze begins                       | 13?May?2016     | -                  | Release Engineers announce that all further commits to the head branch will require explicit approval. Additionally, there can be no changes to the KBI until head is branched to stable/11.                         |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| stable/11 branch                        | 10?June?2016    | -                  | Subversion branch created; release engineering continues on this branch.                                                                                                                                             |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| BETA1 builds begin                      | 10?June?2016    | -                  | First beta test snapshot.                                                                                                                                                                                            |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| head?thaw                               | 11?June?2016    | -                  | The code freeze on the head branch is lifted.                                                                                                                                                                        |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| BETA2 builds begin                      | 17?June?2016    | -                  | Second beta test snapshot.                                                                                                                                                                                           |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| BETA3 builds begin?\*                   | 24?June?2016    | -                  | Third beta test snapshot.                                                                                                                                                                                            |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| releng/11.0 branch                      | 1?July?2016     | -                  | Subversion branch created; future release engineering proceeds on this branch.                                                                                                                                       |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RC1 builds begin                        | 1?July?2016     | -                  | First release candidate.                                                                                                                                                                                             |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| stable/11?thaw                          | 2?July?2016     | -                  | The code freeze on the stable/11 branch is lifted.                                                                                                                                                                   |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RC2 builds begin                        | 8?July?2016     | -                  | Second release candidate.                                                                                                                                                                                            |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RC3 builds begin?\*                     | 15?July?2016    | -                  | Third release candidate.                                                                                                                                                                                             |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RELEASE builds begin                    | 22?July?2016    | -                  | 11.0-RELEASE builds begin.                                                                                                                                                                                           |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RELEASE announcement                    | 27?July?2016    | -                  | 11.0-RELEASE press release.                                                                                                                                                                                          |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Turn over to the secteam                | -               | -                  | releng/11.0 branch is handed over to the FreeBSD?Security Officer Team in one or two weeks after the announcement.                                                                                                   |
+-----------------------------------------+-----------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

"\*" indicates "as-needed" items.

Status / TODO
=============

`FreeBSD Release Engineering TODO
Page <../../releases/11.0R/todo.html>`__
Additional Information
======================

-  `FreeBSD?Release Engineering website <../../releng/index.html>`__

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
