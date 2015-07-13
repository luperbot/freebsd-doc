=======================
FreeBSD 6.2 Open Issues
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

FreeBSD 6.2 Open Issues
=======================

This is a list of open issues that need to be resolved for FreeBSD 6.2.
If you have any updates for this list, please e-mail re@FreeBSD.org.

-  `Major issues <#major>`__
-  `Testing foci <#testing>`__
-  `Problems Discovered by Kernel Stress Test Suite <#stresstest>`__

Major issues for 6.2-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
No pending major issues.
Testing foci for 6.2-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+--------------------------------------+-----------------+-----------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                | Status          | Responsible                                               | Description                                                                                                                                                                                                                                                                                                                                                     |
+======================================+=================+===========================================================+=================================================================================================================================================================================================================================================================================================================================================================+
| bce(4) stability fixes               | Needs?testing   | Scott Long                                                | Several stability fixes for bce(4) were merged from HEAD to RELENG\_6 around 20061024. Initial testing results have been promising, but more testing reports would be useful.                                                                                                                                                                                   |
+--------------------------------------+-----------------+-----------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| em(4) stability fixes                | Needs?testing   | Scott Long, Jack F. Vogel, Gleb Smirnoff, Kris Kennaway   | Several difficult-to-diagnose stability issues have been observed in the em(4) driver since August. As of 20061027, a newer driver provided by Intel (version 6.2.9) has been committed to RELENG\_6 for testing. **UPDATE**: Additional changes committed 20061110 fix some other observed stability problems and restore missing jumbo frame functionality.   |
+--------------------------------------+-----------------+-----------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| sysinstall(8) kernel selection fix   | Needs?testing   | Erwin Lansing                                             | A bug in sysinstall(8) could result in it failing to install a kernel on a new disk if the user did not choose a distribution from the distribution menu. This is believed to have been fixed as of 20061029, but could use more testing.                                                                                                                       |
+--------------------------------------+-----------------+-----------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ggated(8)                            | Needs?testing   | Pawel Jakub Dawidek                                       | A recently-committed patch to ggated(8) is believed to fix some fairly serious problems, as reported in PR `kern/104829 <http://www.FreeBSD.org/cgi/query-pr.cgi?pr=104829>`__.                                                                                                                                                                                 |
+--------------------------------------+-----------------+-----------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| devfs(5) fixes                       | Needs?testing   | Konstantin Belousov                                       | Several deadlocks and locking bugs have been fixed in devfs(5).                                                                                                                                                                                                                                                                                                 |
+--------------------------------------+-----------------+-----------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| tty(4) fixes                         | Needs?testing   | Martin Blapp                                              | Several workarounds have been committed for known problems in the tty(4) layer.                                                                                                                                                                                                                                                                                 |
+--------------------------------------+-----------------+-----------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Stress Test Panics
~~~~~~~~~~~~~~~~~~

The system is continuously being subjected to Peter Holm's `Kernel
Stress Test Suite <http://www.holm.cc/stress/>`__. The following issues
have recently been discovered from this test suite.

Currently none reported.

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
