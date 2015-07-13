===========================
FreeBSD 7.4 Release Process
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

FreeBSD 7.4 Release Process
===========================

Introduction
============

This is the release schedule for FreeBSD 7.4. For more information about
the release engineering process, please see the `Release
Engineering <../../releng/index.html>`__ section of the web site.

General discussions about the pending release and known issues should be
sent to the public
`freebsd-stable <mailto:FreeBSD-stable@FreeBSD.org>`__ mailing list.
`MFC <../../doc/en_US.ISO8859-1/books/handbook/freebsd-glossary.html#mfc-glossary>`__
requests should be sent to re@FreeBSD.org.

Schedule
========

+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Action                                  | Expected           | Actual             | Description                                                                                                                                                                                                              |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Initial release schedule announcement   | -                  | 08?October?2010    | Release Engineers send announcement email to developers with a rough schedule.                                                                                                                                           |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Release schedule reminder               | -                  | Weekly             | Release Engineers send reminder announcement e-mail to developers with updated schedule.                                                                                                                                 |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Code freeze begins                      | 28?November?2010   | 29?November?2010   | Release Engineers announce that all further commits to the stable/7 branch will require explicit approval. Certain blanket approvals will be granted for narrow areas of development, documentation improvements, etc.   |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| BETA1                                   | 03?December?2010   | 10?December?2010   | First beta test snapshot.                                                                                                                                                                                                |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| releng/7.4 branch                       | 15?December?2010   | 21?December?2010   | Subversion branch created, propagated to CVS; future release engineering proceeds on this branch.                                                                                                                        |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RC1                                     | 17?December?2010   | 26?December?2010   | First release candidate.                                                                                                                                                                                                 |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RC2                                     | 07?January?2011    | 22?January?2011    | Second release candidate.                                                                                                                                                                                                |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RC3                                     | 28?January?2011    | 03?February?2011   | Third release candidate.                                                                                                                                                                                                 |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RELEASE build                           | 21?January?2011    | -                  | 7.4-RELEASE built.                                                                                                                                                                                                       |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| RELEASE announcement                    | 24?January?2011    | -                  | 7.4-RELEASE press release.                                                                                                                                                                                               |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Turn over to the secteam                | 31?January?2011    | -                  | RELENG\_7\_4 branch is handed over to the FreeBSD Security Officer Team in one or two weeks after the announcement.                                                                                                      |
+-----------------------------------------+--------------------+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Status / TODO
=============

http://wiki.freebsd.org/Releng/7.4TODO
Additional Information
======================

-  `FreeBSD 7.4 release engineering wiki
   page <http://wiki.freebsd.org/Releng/7.4TODO/>`__, which includes
   todo lists, scheduling information, binary compatibility information,
   and more.
-  `FreeBSD Release Engineering website <../../releng/index.html>`__

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
