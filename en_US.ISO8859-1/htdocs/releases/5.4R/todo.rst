=======================
FreeBSD 5.4 Open Issues
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

FreeBSD 5.4 Open Issues
=======================

Open Issues
===========

This is the beginning of a list of open issues that need to be worked on
or resolved for FreeBSD 5.4. If you have any updates for this list,
please e-mail re@FreeBSD.org. The feature list for 5.4 is still a work
in progress, so items may be added, removed, or modified before we're
done.

Show stopper defects for 5.4-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
Required features for 5.4-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
Desired features for 5.4-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                  | Status        | Responsible              | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
+========================================+===============+==========================+==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| KAME IPSEC without the Giant Lock      | In?progress   | George V. Neville-Neil   | Currently, the KAME IPSEC implementation contains inadequate locking to operate without the Giant lock over the network stack, forcing kernels compiled with the KAME IPSEC implementation (not FAST\_IPSEC) to run the network stack with the Giant lock, reducing parallelism, increasing lock contention, and increasing latency by preventing preemption. For 5.4-RELEASE, it is desirable to complete the locking work for KAME IPSEC so that it can run without the Giant lock.                                                                                                                                                                                                                            |
+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| All Network Interface Drivers MPSAFE   | In?progress   | --                       | Currently, some network interface drivers are not safe without the Giant lock due to missing synchronization. These drivers are protected by running non-INTR\_MPSAFE and with the IFF\_NEEDSGIANT flag set, which cause interrupt threads to acquire the Giant lock before executing the driver's interrupt handler, and to perform if\_start (interface transmit start) asynchronously once the Giant lock can be acquired. This results in these drivers performing less well due to increased lock contention, decreased ability to preempt, and latency associated with asynchronous launching of latency-critical events. For 5.4, all network drivers should be able to operate without the Giant lock.   |
+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NetIPX without the Giant Lock          | In?progress   | Robert Watson            | Currently, the IPX/SPX (netipx) implementation contains inadequate locking to operate without the Giant lock over the network stack, forcing kernels compiled with IPX support to run the network stack with the Giant lock, reducing parallelism, increasing lock contention, and increasing latency by preventing preemption. For 5.4-RELEASE, it is desirable to complete the locking work for IPX so that it can run without the Giant lock.                                                                                                                                                                                                                                                                 |
+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Fix regression in file(1)              | --            | --                       | The new version of file(1) does not cross-build properly. If sparc64 executables are built on i386 the compiled magic numbers file that gets installed is wrong and file(1) doesn't work properly.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SIGABRT under load                     | In?progress   | Alan L. Cox              | Under very high load (Kris sees this on the package builders) a limitation of 16 sumultaneous exec's may be hit in exec\_map(). A workaround has been implemented with a fix planned for 5.5.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| DDB\_UNATTENDED may not work           | Not?done      | --                       | There are reports of problems getting dumps after panics.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| fix for ttywakeup panic                | In?progress   | Doug White               | There appears to be a race condition opening/closing ttys.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+----------------------------------------+---------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Documentation items that must be resolved for 5.4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
Testing focuses for 5.4-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                                       | Status   | Responsible     | Description                                                                                                                                                                                                                                   |
+=============================================================+==========+=================+===============================================================================================================================================================================================================================================+
| File descriptor locking                                     | Done     | Jeff Roberson   | File descriptor locking needs to be merged back from HEAD.                                                                                                                                                                                    |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| IPFilter mpsafe fixes                                       | Done     | Robert Watson   | IPFilter is currently not mpsafe but doesn't run with Giant.                                                                                                                                                                                  |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Update sysinstall to handle separate packages CD            | Done     | John Baldwin    | Avoid the need for a disc1-gnome/disc1-kde as was done for 4.11                                                                                                                                                                               |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| busdma fixes                                                | Done     | Scott Long      | More work is needed on busdma to fix bounce buffer problems.                                                                                                                                                                                  |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| AMR driver MPSAFE                                           | Done     | Scott Long      | Making the AMR driver MPSAFE will greatly increase its performance.                                                                                                                                                                           |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| CARP support                                                | Done     | Gleb Smirnoff   | Common Address Redundancy Protocol allows multiple hosts on the same local network to share a set of IP addresses.                                                                                                                            |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| kstack overflows in softupdates                             | Done     | --              | There had been reports of kernel stack overflows in softupdates code that caused filesystem problems on reboot. This was fixed during the early stage of code freeze but should be tested.                                                    |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ATAPI CDROMs in PIO mode during install                     | Done     | Ken Smith       | People are having difficulties with various ATAPI CDROMs on various architectures. We need to either do all installs in PIO mode or provide a boot menu method of selecting it.                                                               |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| truss not working                                           | Done     | Jeff Roberson   | See PR kern/78664.                                                                                                                                                                                                                            |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Deadlock under heavy interrupt load on MP Opteron systems   | Done     | Doug White      | A deadlock related to delivering IPIs on AMD 64-bit processors has been identified.                                                                                                                                                           |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SCHED\_ULE update                                           | Done     | Jeff Roberson   | Many improvements have been made to the ULE scheduler in 6-CURRENT. These should be merged back to 5.4. The merging is done but ULE is still known to cause panics for some people, especially on SMP systems. Try it with extreme caution.   |
+-------------------------------------------------------------+----------+-----------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
