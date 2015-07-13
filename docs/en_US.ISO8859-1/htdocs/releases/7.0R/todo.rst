=======================
FreeBSD 7.0 Open Issues
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

FreeBSD 7.0 Open Issues
=======================

This is a list of open issues that need to be resolved for FreeBSD 7.0.
If you have any updates for this list, please e-mail re@FreeBSD.org.

-  `Major issues <#major>`__
-  `Minor issues <#minor>`__
-  `Testing foci <#testing>`__
-  `Problems Discovered by Kernel Stress Test Suite <#stresstest>`__

Major issues for 7.0-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+---------------------------------+----------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                           | Status   | Responsible                       | Description                                                                                                                                                                                                                                                           |
+=================================+==========+===================================+=======================================================================================================================================================================================================================================================================+
| routed not working              | Done     | Robert Watson                     | Routed should have been updated because of updates made to the underlying network infrastructure. The old interface was added back in but marked as depreciated.                                                                                                      |
+---------------------------------+----------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TCP accept race condition       | Done     | Gleb Smirnoff, Robert Watson      | A race in TCP will lead to very occasional returning of 0.0.0.0:0 rather than the correct IP address via the socket address returned by accept(). A patch has been merged to HEAD, RELENG\_7 and RELENG\_7\_0.                                                        |
+---------------------------------+----------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| sleepq race condition           | Done     | John Baldwin                      | Races in the sleepq implementation will occasionally result in sleeps with timeouts failing to wake up, as well as other symptoms. A patch has been merged to HEAD, RELENG\_7, and RELENG\_7\_0.                                                                      |
+---------------------------------+----------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| pty race condition              | Done     | Konstantin Belousov               | Multiple race conditions in the tty/pty code have lead to occasional panics. One set of problems has been fixed, but others are still being explored It is aniticipated that the remaining problems will be fixed for 7.0RC2.                                         |
+---------------------------------+----------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| amd64 minidump race condition   | Done     | Ruslan Ermilov                    | A race condition during minidump generation on SMP amd64 could lead trashed file systems due to writing outside of the swap area. A patch has been merged to HEAD, RELENG\_7, and RELENG\_7\_0.                                                                       |
+---------------------------------+----------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| libkse fork process wedge       | Done     | Julian Elischer, Daniel Eischen   | A bug in libkse could lead the processes hanging after fork if they fork while running multiple threads. A patch has been committed to HEAD that properly reinitializes internal thread library locks after fork; it has been merged to RELENG\_7 and RELENG\_7\_0.   |
+---------------------------------+----------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Minor issues for 7.0-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+--------------------------------------------------------------------------------------+----------+-----------------+---------------+
| Issue                                                                                | Status   | Responsible     | Description   |
+======================================================================================+==========+=================+===============+
| sparc64 has a problem building OpenSP so it can't finish a release build with docs   | Done     | Marius Strobl   | Fixed.        |
+--------------------------------------------------------------------------------------+----------+-----------------+---------------+

Testing foci for 7.0-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+--------------------+--------------------+--------------------+--------------------+
| Issue              | Status             | Responsible        | Description        |
+====================+====================+====================+====================+
| TCP timers         | Needs?testing      | Mike Silbersack    |                    |
+--------------------+--------------------+--------------------+--------------------+
| MAC Framework      |                    | Robert Watson      | A code sync with   |
|                    |                    |                    | Mac OS X Leopard   |
|                    |                    |                    | for the MAC        |
|                    |                    |                    | framework was      |
|                    |                    |                    | committed.         |
+--------------------+--------------------+--------------------+--------------------+
| TCP issues         | Done               | Mike Silbersack    | Turned out to not  |
|                    |                    |                    | be TCP issues      |
|                    |                    |                    | after all,         |
|                    |                    |                    | problems with      |
|                    |                    |                    | signal handling in |
|                    |                    |                    | mountd.            |
+--------------------+--------------------+--------------------+--------------------+

Stress Test Panics
~~~~~~~~~~~~~~~~~~

The system is continuously being subjected to Peter Holm's `Kernel
Stress Test Suite <http://www.holm.cc/stress/>`__. The following issues
have recently been discovered from this test suite.

-  `soft update
   lag <http://people.FreeBSD.org/~pho/stress/log/symlink.txt>`__
-  `Fatal trap 12: page fault while in kernel
   mode <http://people.FreeBSD.org/~pho/stress/log/kostik143.html>`__
-  `panic: sched\_priority: invalid priority
   224 <http://people.FreeBSD.org/~pho/stress/log/kostik135.html>`__
-  `panic: \_\_lockmgr\_args: recursing on non recursive lockmgr
   getblk <http://people.FreeBSD.org/~pho/stress/log/kostik116.html>`__

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
