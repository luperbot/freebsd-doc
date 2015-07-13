===========================
FreeBSD 5.1 Release Process
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

FreeBSD 5.1 Release Process
===========================

Introduction
============

This is a specific schedule for the release of FreeBSD 5.1. For more
general information about the release engineering process, please see
the `Release Engineering <../../releng/index.html>`__ section of the web
site.

General discussions about the release engineering process or quality
assurance issues should be sent to the public
`FreeBSD-qa <mailto:FreeBSD-qa@FreeBSD.org>`__ mailing list.
`MFC <../../doc/en_US.ISO8859-1/books/faq/misc.html#DEFINE-MFC>`__
requests should be sent to re@FreeBSD.org.

One of the major features of FreeBSD 5.1 will be further refinement of
the re-worked SMP support introduced in FreeBSD 5.0.

FreeBSD 5.1 will continue to be released from the 5-CURRENT development
stream. For more details about the milestones for reaching 5-STABLE, see
the `5-STABLE
Roadmap <http://docs.freebsd.org/doc/5.1-RELEASE/usr/share/doc/en_US.ISO8859-1/articles/5-roadmap/index.html>`__
page.

The current release engineering `TODO
list <../../releases/5.1R/todo.html>`__ is also available. This list is
updated periodically through the release cycle.

Schedule
========

+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Action                                  | Expected      | Actual        | Description                                                                                                                                                                        |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``-CURRENT`` code freeze                | 5?May?2003    | 5?May?2003    | The ``src/`` code freeze for 5.1. Commits to ``HEAD`` require ``re@FreeBSD.org`` approval.                                                                                         |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``5.1-BETA``                            | 5?May?2003    | 15?May?2003   | ``5.1-BETA`` release of x86, alpha, sparc64, and ia64.                                                                                                                             |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``5.1-BETA2``                           | 19?May?2003   | 22?May?2003   | Second ``5.1-BETA`` release of x86, alpha, sparc64, and ia64.                                                                                                                      |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_5_1`` branched                 | 30 May 2003   | 31 May 2003   | Branch of ``src/`` from ``HEAD`` for the release. Note: no branch for ``RELENG_5`` will happen at this time.                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Turn off debugging for ``RELENG_5_1``   | 30 May 2003   | 31 May 2003   | Turn off WITNESS, INVARIANTS, and malloc debugging options similar to what was done for 5.0.                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| First release candidate                 | 30?May?2003   | 1?June?2003   | x86, alpha, sparc64, and ia64 images released and uploaded to ``ftp-master.FreeBSD.org``.                                                                                          |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``src/`` unfrozen                       | 30 May 2003   | 31 May 2003   | Unfreeze ``HEAD`` src. Continue to coordinate significant check-ins with ``re@FreeBSD.org`` in order to work towards ``5-STABLE``.                                                 |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports tree tagged                       | 30 May 2003   | 27 May 2003   | Tentative date of ``RELEASE_5_1_0`` tag for ports.                                                                                                                                 |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Version numbers bumped                  | 2 June 2003   | 3 June 2003   | The files listed `here <../../doc/en_US.ISO8859-1/articles/releng/article.html#VERSIONBUMP>`__ are updated to reflect FreeBSD 5.1.                                                 |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``src/`` tree tagged                    | 2 June 2003   | 4 June 2003   | Tag the ``RELENG_5_1`` branch with ``RELENG_5_1_0_RELEASE``.                                                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``doc/`` tree tagged                    | 2 June 2003   | 30 May 2003   | Tag the ``doc/`` tree with ``RELEASE_5_1_0``.                                                                                                                                      |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Final builds                            | 2 June 2003   | 4 June 2003   | Start x86, alpha, sparc64, ia64, and pc98 builds.                                                                                                                                  |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Warn ``hubs@FreeBSD.org``               | 5 June 2003   | 5 June 2003   | Heads up email to ``hubs@FreeBSD.org`` to give admins time to prepare for the load spike to come. The site administrators have frequently requested advance notice for new ISOs.   |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Upload to ``ftp-master``                | 5?June?2003   | 8 June 2003   | Release and packages uploaded to ``ftp-master.FreeBSD.org.``                                                                                                                       |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.1 Released                    | 9 June 2003   | 9 June 2003   | FreeBSD 5.1 is announced to the mailing lists.                                                                                                                                     |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FreeBSD 5.1 Press Release               | 9 June 2003   | 9 June 2003   | A formal press release statement is in the works and should be released at this time to the ``www.FreeBSD.org`` website and various tech publications.                             |
+-----------------------------------------+---------------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
