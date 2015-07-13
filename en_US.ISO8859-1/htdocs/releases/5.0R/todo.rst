=======================
FreeBSD 5.0 Open Issues
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

FreeBSD 5.0 Open Issues
=======================

Open Issues
===========

This is a list of open issues that need to be resolved for FreeBSD 5.0.
If you have any updates for this list, please e-mail re@FreeBSD.org.

Must Resolve Issues for 5.0-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
None at this time.
Desired Features for 5.0-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                             | Status             | Responsible                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
+===================================+====================+=============================+==============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| a.out toolchain port              | --                 | --                          | A.out support in the base system was reduced; the removed build chain components should be made into a port.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NETNCP and nwfs broken            | --                 | --                          | NETNCP and nwfs appear to be as-yet unadapted for KSE, and hence not working. The build needs fixing (probably not all that hard) and then it needs to be tested (harder: few people appear to have Netware servers).                                                                                                                                                                                                                                                                                                                                                                                        |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| No docs for FAST IPSEC            | --                 | --                          | The new "fast ipsec" implementation has insufficient documentation (man pages, release notes), and this would be highly desirable to have before 5.0-RELEASE.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Race conditions in truss          | Errata candidate   | Robert Drehmel              | Truss appears to contain a race condition during the start-up of debugging, which can result in truss failing to attach to the process before it exits. The symptom is that truss reports that it cannot open the procfs node supporting the process being debugged. A bug also appears to exist where in truss will hang if execve() returns ENOENT. A further race appears to exist in which truss will return "PIOCWAIT: Input/output error" occasionally on startup. The fix for this sufficiently changes process execution handling that we will defer the fix to post-5.0 and consider this errata.   |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Documentation rottage: S/Key      | --                 | --                          | We now use OPIE instead of S/Key. The handbook doesn't know that yet.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Documentation wanted: gdbe        | --                 | Chris Costello              | 5.0 includes GDBE, supporting encryption of swap and storage. It would be nice if that was documented in the handbook.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| iir driver fails to probe disks   | --                 | --                          | During the install, the iir controller appears to correctly probe, but finds no disk devices. The card in question is an Intel srcu32 RAID controller with 32Mb RAM, Firmware revision 2.33.01. Direct access to real iir hardware for SCSI developers would be very helpful in resolving this problem.                                                                                                                                                                                                                                                                                                      |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| mly driver hangs during install   | --                 | Scott Long, Jeff Roberson   | Hangs have been reported during the 5.0 snapshot install when installing to mly supported RAID arrays. The same array appears to work fine with 4.7-RELEASE. The card in question is a Mylex AcceleRAID 170, 32 Mb RAM, Firmware revision 7.01-00. This is believed to be the same problem as described in PR 45383.                                                                                                                                                                                                                                                                                         |
+-----------------------------------+--------------------+-----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Areas requiring immediate testing due to 5.0 changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+------------------------------------------------------+----------+---------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                                | Status   | Responsible   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+======================================================+==========+===============+=================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| if\_ie, if\_le, if\_wl network device drivers        | --       | Sam Leffler   | Changes made to the ethernet driver interfaces required sweeping API changes across all ethernet device drivers. While these changes are largely mechanical, they were not tested for three less frequently used interface drivers: if\_ie, if\_le, and if\_wl. They each require testing (and probably fixing) prior to 5.0-RELEASE. If you have access to devices that use these drivers, please perform local testing and provide feedback to Sam Leffler.   |
+------------------------------------------------------+----------+---------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| No console (term) if smbus is enable in the kernel   | --       | --            | There are reports that kernels build with smbus, viapm, and smb devices may not properly probe and support the system console following boot.                                                                                                                                                                                                                                                                                                                   |
+------------------------------------------------------+----------+---------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Known Issues with 5.0R-RC1 / i386
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+---------------------------------+---------------+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                           | Status        | Responsible      | Description                                                                                                                                                                                                                                           |
+=================================+===============+==================+=======================================================================================================================================================================================================================================================+
| KDE does not install from ISO   | In Progress   | Murray Stokely   | The kde meta-package is not included on the ISO, but many of the component kde packages are, so sysinstall gets confused and installs kde-icontheme instead (more correct behavior would be to fall back to kdebase if kde package is not present).   |
+---------------------------------+---------------+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
