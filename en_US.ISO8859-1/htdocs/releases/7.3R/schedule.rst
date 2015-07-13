===========================
FreeBSD 7.3 Release Process
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

FreeBSD 7.3 Release Process
===========================

Introduction
============

This is a specific schedule for the release of FreeBSD 7.3. For more
general information about the release engineering process, please see
the `Release Engineering <../../releng/index.html>`__ section of the web
site.

General discussions about the pending release and known issues should be
sent to the public
`freebsd-stable <mailto:FreeBSD-stable@FreeBSD.org>`__ mailing list.
`MFC <../../doc/en_US.ISO8859-1/books/handbook/freebsd-glossary.html#mfc-glossary>`__
requests should be sent to re@FreeBSD.org.

Schedule
========

+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Action                            | Expected                   | Actual             | Description                                                                                                                                                                                                                                                                                       |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Release schedule announcement     | —                          | 23?January?2010    | Release Engineers send announcement email to ``freebsd-stable@`` with a rough schedule for the FreeBSD 7.3 release.                                                                                                                                                                               |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Code freeze begins                | 22?January?2010            | 23?January?2010    | After this date, all commits to RELENG\_7 must be approved by re@FreeBSD.org. Certain highly active documentation committers are exempt from this rule for routine man page / release note updates. Heads-up emails should be sent to the developers, as well as ``stable@`` and ``qa@`` lists.   |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``BETA1`` builds                  | 25?January?2010            | 27?January?2010    | Begin BETA1 builds.                                                                                                                                                                                                                                                                               |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Announce ``doc/`` tree slush      | —                          | 31?January?2010    | Notification of the impending ``doc/`` tree slush should be sent to ``doc@``.                                                                                                                                                                                                                     |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``doc/`` tree slush               | 5?February?2010            | 5?February?2010    | Non-essential commits to the ``en_US.ISO8859-1/`` subtree should be delayed from this point until after the ``doc/`` tree tagging, to give translation teams time to synchronize their work.                                                                                                      |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``doc/`` tree tagged.             | 10?February?2010           | 10?February?2010   | Version number bumps for ``doc/`` subtree. ``RELEASE_7_3_0`` tag for ``doc/``. ``doc/`` slush ends at this time.                                                                                                                                                                                  |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ports tree feature freeze         | 8?February?2010            | 15?February?2010   | Only feature safe commits will be permitted to the ``ports/`` tree during the freeze.                                                                                                                                                                                                             |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_7_3`` branch             | —                          | 10?February?2010   | The new release branch is created. Update ``newvers.sh`` and ``release.ent`` on various branches involved.                                                                                                                                                                                        |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RC1`` builds                    | 8?February?2010            | 10?February?2010   | Begin RC1 builds.                                                                                                                                                                                                                                                                                 |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RC2`` builds                    | 22?February?2010           | 1?March?2010       | Begin RC2 builds.                                                                                                                                                                                                                                                                                 |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELENG_7_3_0_RELEASE`` tagged   | —                          | 21?March?2010      | The release tag for 7.3-RELEASE is set on RELENG\_7\_3 branch.                                                                                                                                                                                                                                    |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RELEASE`` builds                | —                          | 21?March?2010      | Begin RELEASE builds.                                                                                                                                                                                                                                                                             |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Announcement                      | [STRIKEOUT:1?March?2010]   | 23?March?2010      | Announcement sent out after a majority of the mirrors have received the bits.                                                                                                                                                                                                                     |
|                                   | 23?March?2010              |                    |                                                                                                                                                                                                                                                                                                   |
+-----------------------------------+----------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Additional Information
======================

-  `FreeBSD 7.3 status page. <http://wiki.FreeBSD.org/Releng/7.3TODO>`__
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
