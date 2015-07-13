=======================
FreeBSD 5.3 Open Issues
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

FreeBSD 5.3 Open Issues
=======================

Open Issues
===========

This is a list of open issues that need to be resolved for FreeBSD 5.3.
If you have any updates for this list, please e-mail re@FreeBSD.org.

Issues that require investigation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
Show stopper defects for 5.3-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
Required features for 5.3-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
Desired features and bugfixes for 5.3-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                                                         | Status             | Responsible                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
+===============================================================================+====================+===============================+==============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| Reports of poor performance with the if\_re driver (re ethernet interfaces)   | In?progress        | John-Mark Gurney              | There have been reports that specific gigabit ethernet cards supported by the if\_re driver are experiencing poor performance; a patch has been posted that corrects timer and interrupt problems with the driver, and is believed to correct the performace problems. The patch will be merged to 6.x and 5.x shortly.                                                                                                                                                                                                                                                                                      |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GDB thread support                                                            | In?progress        | David Xu, Marcel Moolenaar    | With improved support for threading primitives, support is now required to ease debugging of threaded applications. Ideally, this support will work for both libthr and libkse threading models.                                                                                                                                                                                                                                                                                                                                                                                                             |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| KSE support for sparc64                                                       | In?progress        | Ken Smith                     | Kernel bits implemented, userland not implemented.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| truss support for ptrace                                                      | --                 | --                            | Almost all process debugging tools have been updated to use non-procfs kernel primitives, with the exception of truss(1). As procfs is considered deprecated due to its inherent security risks, it is highly desirable to update truss to operate in a post-procfs world. Dag-Erling C. Sm?rgrav had prototype patches; Robert Drehmel is developing and testing patches now. Support for system call tracing has been added to ptrace().                                                                                                                                                                   |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FAST\_IPSEC and KAME compatibility                                            | Not?done           | --                            | FAST\_IPSEC currently cannot be used directly with the KAME IPv6 implementation, requiring an additional level of IP tunnel indirection to protect IPv6 packets when using hardware crypto acceleration. This issue must be resolved so that the two services may more easily be used together. Among other things, this will require a careful review of the handling of mbuf header copying and m\_tag support in the KAME IPv6 code.                                                                                                                                                                      |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| rpc.lockd(8) stability                                                        | --                 | --                            | A process cannot be interrupted while waiting on a lock. Fixing this requires that the RPC code be taught how to deal with lock cancellation and interruption events.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Revised kld build infrastructure                                              | Not?done           | Peter Wemm                    | Kernel modules are currently built independently from a kernel configuration, and independently from one another, resulting in substantially redundant compilation of objects, as well as the inability to easily manage compile-time options for kernel objects (such as MAC, PAE, etc) that may require conditional compilation in the kernel modules. In order to improve build performance and better support options of this sort, the KLD build infrastructure needs to be revamped. Peter Wemm has done some initial prototyping, and should be contacted before starting on this work.               |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Race conditions in truss                                                      | Errata candidate   | Robert Drehmel                | Truss appears to contain a race condition during the start-up of debugging, which can result in truss failing to attach to the process before it exits. The symptom is that truss reports that it cannot open the procfs node supporting the process being debugged. A bug also appears to exist where in truss will hang if execve() returns ENOENT. A further race appears to exist in which truss will return "PIOCWAIT: Input/output error" occasionally on startup. The fix for this sufficiently changes process execution handling that we will defer the fix to post-5.0 and consider this errata.   |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| filedesc LOR                                                                  | Not?done           | --                            | The LOR reported in PR kern/55175 needs to be fixed. Filedesc locking needs to be heavily reviewed in general.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| KSE support for alpha                                                         | In?progress        | Marcel Moolenaar              | Userland bits implemented, kernel bits not implemented.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| CAM locking                                                                   | In?progress        | Scott Long, Justin T. Gibbs   | For kernel API/ABI compatibility reasons, it would be desirable to have the CAM locking strategy determined and loosely implemented for 5.3.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| syscons not working on Sparc64 Ultra-30                                       | Not?done           | --                            | When running syscons on an Ultra-30 with Creator-3D typing characters on the keyboard produces garbage. Problem reported by Kris Kennaway. Debugging difficult due to lack of this particular configuration among developers and problem isn't present on similar hardware (e.g. no problem on Ultra-60 w/Creator-3D).                                                                                                                                                                                                                                                                                       |
+-------------------------------------------------------------------------------+--------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Documentation items that must be resolved for 5.3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                     | Status     | Responsible                               | Description                                                                                                                                                                                                                                                                                                                                                             |
+===========================================+============+===========================================+=========================================================================================================================================================================================================================================================================================================================================================================+
| i386 Floppy Installation Docs             | Done       | Gavin Atkinson, Bruce A. Mah              | The installation documentation doesn't take into account the new floppy images (with a full kernel split across multiple disks). This should be updated.                                                                                                                                                                                                                |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `docs/70485 (closed) <http://www.freebsd.org/cgi/query-pr.cgi?pr=docs/70485>`__                                                                                                                                                                                                                                                                                        |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Finish hardware notes trimming            | Done       | Simon L. B. Nielsen, Christian Brueffer   | Finish removing mention of individual devices in the hardware notes and use auto-generated lists, based on driver manual pages, instead.                                                                                                                                                                                                                                |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| sound(4) related manual pages             | Done       | Simon L. B. Nielsen                       | The snd(4) and pcm(4) drivers have been renamed but their manual pages are still outdated. sound(4) has to be added and pcm(4), csa(4), gusc(4), sbc(4), and uaudio(4) should be revised. Other manual pages which refer to pcm(4) (if any) should possibly be revised, too. In addition, supported cards list needs to be updated.                                     |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `Manpage for snd\_solo on -doc@ <http://docs.freebsd.org/cgi/mid.cgi?20040820145251.GA36893>`__                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `[PATCH] sound(4) related manpages 5.3 TODO item on -doc@ <http://docs.freebsd.org/cgi/mid.cgi?20040828142503.GA52613@ip.net.ua>`__                                                                                                                                                                                                                                    |
|                                           |            |                                           |  `src/share/man/man4/Makefile rev.1.279 <http://www.freebsd.org/cgi/cvsweb.cgi/src/share/man/man4/Makefile?rev=1.279&content-type=text/x-cvsweb-markup>`__                                                                                                                                                                                                              |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Sound section in the Handbook             | Done       | Marc Fonvieille                           | This section is outdated, some rewrites are needed for 5.3-RELEASE.                                                                                                                                                                                                                                                                                                     |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `doc/en\_US.ISO8859-1/books/handbook/multimedia/chapter.xml rev.1.94 <http://www.freebsd.org/cgi/cvsweb.cgi/doc/en_US.ISO8859-1/books/handbook/multimedia/chapter.xml?rev=1.94&content-type=text/x-cvsweb-markup>`__                                                                                                                                                   |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| FDP documentations related pcm(4)         | Not?done   | --                                        | With the snd(4) and pcm(4) drivers changes, documentations (FAQ) regarding the use of these drivers need an update.                                                                                                                                                                                                                                                     |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Early Adopter's Guide                     | Done       | Bruce A. Mah, Tom Rhodes                  | Xin LI pointed out that FreeBSD 5.3-RELEASE is the first stable release on 5.X and it is (hopefully) not for early adopters. Early Adopter's Guide is still useful, but contains a bit old information. Some parts of this guide need a rewrite, and this document should be published as "4.X to 5.X Migration Guide", which focuses difference between 4.X and 5.X.   |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `Draft for review <http://www.FreeBSD.org/relnotes/5-STABLE/early-adopter/index.html>`__                                                                                                                                                                                                                                                                               |
|                                           |            |                                           |  `discussion on -doc@ and -current@ <http://docs.freebsd.org/cgi/mid.cgi?1094426835.767.50.camel@localhost>`__                                                                                                                                                                                                                                                          |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Installation Notes                        | Not?done   | Tom Rhodes                                | Some parts are outdated. doc/70485 has been committed, but more work is needed to reflect the realities. bmah@ pointed out that we should have "quick-start" installation guide for each platform instead of the current ones because they become too long and difficult to be maintained.                                                                              |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `doc/70485 (closed) <http://www.freebsd.org/cgi/query-pr.cgi?pr=doc/70485>`__                                                                                                                                                                                                                                                                                          |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Xorg                                      | Done       | Ken Tom, Marc Fonvieille                  | Update the X11 chapter of the Handbook for X.Org's X11 server.                                                                                                                                                                                                                                                                                                          |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `books/handbook/config/chapter.xml rev.1.147 <http://www.freebsd.org/cgi/cvsweb.cgi/doc/en_US.ISO8859-1/books/handbook/x11/chapter.xml?rev=1.147&content-type=text/x-cvsweb-markup>`__                                                                                                                                                                                 |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| rc.d scripts                              | Done       | Tom Rhodes                                | Ch.11.4 and 11.5 of the Handbook must be updated to mention the new rc.d scripts and some ports use /etc/rc.conf for their configuration.                                                                                                                                                                                                                               |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `books/handbook/config/chapter.xml rev.1.170 <http://www.freebsd.org/cgi/cvsweb.cgi/doc/en_US.ISO8859-1/books/handbook/config/chapter.xml?rev=1.170&content-type=text/x-cvsweb-markup>`__                                                                                                                                                                              |
|                                           |            |                                           |  `books/handbook/config/chapter.xml rev.1.172 <http://www.freebsd.org/cgi/cvsweb.cgi/doc/en_US.ISO8859-1/books/handbook/config/chapter.xml?rev=1.172&content-type=text/x-cvsweb-markup>`__                                                                                                                                                                              |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Handbook's kernel configuration chapter   | Done       | Ceri Davies                               | Chapter 8 must be updated to match 5.3-RELEASE.                                                                                                                                                                                                                                                                                                                         |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `docs/70674 (closed) <http://www.freebsd.org/cgi/query-pr.cgi?pr=70674>`__                                                                                                                                                                                                                                                                                             |
|                                           |            |                                           |  `books/handbook/kernelconfig/chapter.xml rev.1.135 <http://www.freebsd.org/cgi/cvsweb.cgi/doc/en_US.ISO8859-1/books/handbook/kernelconfig/chapter.xml?rev=1.135&content-type=text/x-cvsweb-markup>`__                                                                                                                                                                  |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Handbook's IPsec section                  | Not?done   | --                                        | Some parts of Section 14.10 are outdated and are not correct for 5.X systems.                                                                                                                                                                                                                                                                                           |
|                                           |            |                                           |  **References:**                                                                                                                                                                                                                                                                                                                                                        |
|                                           |            |                                           |  `ipsec on -doc@ <http://docs.freebsd.org/cgi/mid.cgi?1093985909.d6849c9clumsden@myrealbox.com>`__                                                                                                                                                                                                                                                                      |
|                                           |            |                                           |  `Problem with IPSEC in handbook on -doc@ <http://docs.freebsd.org/cgi/mid.cgi?2071E0FA-0600-11D9-9FC5-000A95908F0E@cybox.com>`__                                                                                                                                                                                                                                       |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Handbook's Vinum chapter                  | Not?done   | --                                        | Vinum chapter needs to be revised for 5.X systems.                                                                                                                                                                                                                                                                                                                      |
+-------------------------------------------+------------+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Testing focuses for 5.3-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                                                                    | Status          | Responsible                                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
+==========================================================================================+=================+=====================================================+==============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| KSE as the default threads library                                                       | Needs?testing   | David Xu, Daniel Eischen                            | KSE has matured to the point of being more stable and POSIX-compliant than the traditional libc\_r. All Tier-1 platforms **MUST** have stable KSE support for 5.3 in order to support a consistent transition. Additionally, all ports that depend on the pthreads API must be modified to properly detect and support the default threading library.                                                                                                                                                                                        |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Updated binutils for all platforms                                                       | Needs?testing   | David O'Brien                                       | Binutils needs updating in order to support new platforms, newer GDB versions, and Thread Local Storage.                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| gcc 3.3 floating point alignment regression                                              | Needs?testing   | ?                                                   | The previous GCC 3.3 snapshot included regressions in alignment of floating point arguments, resulting in a substantial performance degradation. The recent GCC 3.4.2 import should fix this, but more testing is needed.                                                                                                                                                                                                                                                                                                                    |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| in6\_pcbnotify() panic with TCP                                                          | Done            | Robert Watson                                       | Jun Kuriyama has reported a failed locking assertion with IPv6 TCP notifications. This problem is believed to be corrected.                                                                                                                                                                                                                                                                                                                                                                                                                  |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Per-platform Thread-Local Storage                                                        | Needs?testing   | Doug Rabson, Marcel Moolenaar                       | To complete support for thread-local storage on FreeBSD, per-architecture changes must be made. Currently pending platforms are amd64, alpha, ia64, i386, sparc64, and powerpc.                                                                                                                                                                                                                                                                                                                                                              |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SMP instability under load                                                               | Needs?testing   | Doug White, Alan L. Cox                             | High load on SMP systems appears to result in a hard hang related to VM IPI. Doug White has prepared a candidate patch that appears to resolve this instability, which is currently in testing for merge to the CVS HEAD.                                                                                                                                                                                                                                                                                                                    |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Fine-grained network stack locking without Giant                                         | Needs?testing   | Robert Watson                                       | Significant parts of the network stack (especially IPv4, UNIX domain IPC, and sockets) now have fine-grained locking of their data structures. It's possible to run many common network subsystems and services without the Giant lock. However, a number of device drivers and less mainstream network subsystems are currently not MPSAFE. 5.3 betas have shipped with Giant-free networking by default, with some bug reports and fixes in later betas and release candidates. Please report any problems to the current@ mailing list.   |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| kld support for amd64                                                                    | Needs?testing   | David O'Brien, Ian Dowse                            | KLDs work when loaded from userland, but not from the loader. kldxref and loader support has been committed to HEAD and RELENG\_5 and needs final testing.                                                                                                                                                                                                                                                                                                                                                                                   |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ATA panics under sparc64                                                                 | Needs?testing   | S?ren Schmidt, Scott Long                           | Recent changes to the ATA driver trigger a bug on sparc64 that causes a panic on boot. This was caused by bugs in busdma that have been hopefully fixed.                                                                                                                                                                                                                                                                                                                                                                                     |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ifconf() sleep warning                                                                   | Done            | Brooks Davis                                        | The ifconf() ioctl for listing network interfaces performs a copyout() while holding the global ifnet list mutex. This generates a witness warning in the event that copyout() generates a page fault, and risks more serious problems. This problem is believed to be corrected.                                                                                                                                                                                                                                                            |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| poll()/select() application wedge reports with debug.mpsafenet="1"                       | Done            | Robert Watson                                       | There are reports of applications wedging in poll() and select() while running the network stack without the Giant lock. A recent sleepq change appears to have caused some of the observed problems to go away (others are difficult to test for due to recent SMP instability). This problem appears to be corrected.                                                                                                                                                                                                                      |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| if\_em wedging under high pps                                                            | Done            | Max Laier                                           | There have been several reports of if\_em cards "wedging" under high packets-per-second load. This problem appears to have been corrected.                                                                                                                                                                                                                                                                                                                                                                                                   |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Panic on USB detach                                                                      | Needs?testing   | Warner Losh, Scott Long                             | A recent regression in the USB code is causing panics when a USB device detaches, especially USB hubs. A fix is in RELENG\_5 now.                                                                                                                                                                                                                                                                                                                                                                                                            |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| KAME IPSEC "ENOBUFS" problem with racoon and mbuma                                       | Done            | Robert Watson, Sam Leffler                          | There are reports that racoon is unable to complete IKE negotiation due to a send to the pfkey socket returning ENOBUFS. This appears to be a result of an incorrect assumption about mbuf data size due to a change resulting from mbuma. This problem appears to have been corrected.                                                                                                                                                                                                                                                      |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| BIND9 import into 5-CURRENT                                                              | Done            | Doug Barton, Dag-Erling C. Sm?rgrav, Tom Rhodes     | BIND9 is now in RELENG\_5 and HEAD. Testing is needed of basic functionality, migration from 8.x, and 3rd party packages in the ports tree.                                                                                                                                                                                                                                                                                                                                                                                                  |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Synaptics touchpad problems                                                              | Needs?testing   | Philip Paeps                                        | Synaptics updates to the psm(4) driver have resulted in poor interactivity for taps and button press events for some users. Support is now disabled by default but work will procede to fix the underlying problems.                                                                                                                                                                                                                                                                                                                         |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Scheduler-related hangs involving threads                                                | Needs?testing   | Scott Long, Julian Elischer                         | Significant work has happened in the scheduler to fix stability problems. More testing for UP and SMP under heavily load is needed.                                                                                                                                                                                                                                                                                                                                                                                                          |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NFS over IPv6 problems                                                                   | Done            | Doug White                                          | Jun Kuriyama has reported problems with NFS over IPv6 not functioning correctly as of the improved NFS support for disconnection changes. Doug White has tracked down the source of the problem (EMSGSIZE being returned by IPv6 UDP send routine due to fragmentation), and is currently exploring possible fixes. This problem appears to have been corrected.                                                                                                                                                                             |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reports of socket buffer corruption in tcp\_output()                                     | Done            | Robert Watson                                       | There have been reports of occasional corruption of socket buffers. This may have been the result of missing socket buffer locking in tcp\_output(), which has now been corrected in 6.x and 5.x; this problem is believed to be fixed.                                                                                                                                                                                                                                                                                                      |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reports of hangs using i4b (isdn4bsd)                                                    | Done            | Robert Watson                                       | There have been reports of system hangs while using ISDN with the i4b ISDN framework on SMP systems. These likely result from insufficient synchronization in the i4b implementation when runnning without the Giant lock over the network stack. The workaround until this is fixed is to re-assert the Giant lock over the stack when i4b is compiled into the kernel; this has been committed to 6.x and and 5.x. This problem appears to have been corrected.                                                                            |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Problems with multicast and setuid binaries/daemons                                      | Done            | Robert Watson, Christian S.J. Peron                 | There have been reports that multicast socket options on raw sockets no longer work properly with daemons changing privilege or setuid binaries. These symptoms have been tracked down to bugs relating to permitting limited use of raw sockets in jail(). A patch correcting these problems has been merged to 6.x and 5.x. This problem appears to have been corrected.                                                                                                                                                                   |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reports of sodealloc() panic under heavy load                                            | Done            | Robert Watson, Brian F. Feldman                     | There have been reports of a so\_count invariant violation in sofree(), which may relate to race conditions in sofree() against accept(), which were recently corrected in 6.x, and has been merged to 5.x. This problem appears to have been corrected.                                                                                                                                                                                                                                                                                     |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Merge of Darwin msdosfs, other fixes                                                     | Done            | --                                                  | Apple's Darwin operating system has fairly extensive improvements to msdosfs and other kernel services; these fixes must be reviewed and merged to the FreeBSD tree.                                                                                                                                                                                                                                                                                                                                                                         |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reports of poor performance of the if\_de driver (de ethernet interfaces)                | Done            | Robert Watson, John-Mark Gurney                     | There have been reports that if\_de ethernet cds behave poorly when running with debug.mpsafenet="1", even though the driver is marked to run all portions with the Giant lock. This suggests a race condition specific to this drive, which is currently being debugged. A patch has been committed to the 6.x and 5.x branches, and appears to correct the problem.                                                                                                                                                                        |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Threaded application get stuck in an unkillable state when touched by GDB                | Done            | David Xu                                            | Attaching GDB to a threaded process will leave the process in an unkillable state. Rebooting the machine is the only way to recover from this. This is easily triggered when a KDE app crashes and KDE automatically attaches GDB to it to extract a stack trace. A candidate fix is in 6-CURRENT. More testing and review is needed.                                                                                                                                                                                                        |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| More truss problems                                                                      | Done            | Alfred Perlstein                                    | Truss appears to have another problem. It is repeatable by running "truss -f fsck -p /", suspending it with ^Z, and then killing truss. It will leave behind the fsck processes which will be unkillable.                                                                                                                                                                                                                                                                                                                                    |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reports of TCP-related instability under extremely high load; possibly related to SACK   | Needs?testing   | George V. Neville-Neil, Robert Watson, Scott Long   | There have been reports that, under extremely high load, the tcp\_output() routine may appear to run for extended periods, resulting in the appearance of a hang for an extended period (up to 30 minutes), followed by recovery. A fix for SACK was developed and committed that hopefully corrects this problem.                                                                                                                                                                                                                           |
+------------------------------------------------------------------------------------------+-----------------+-----------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
