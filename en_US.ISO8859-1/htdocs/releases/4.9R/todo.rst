=======================
FreeBSD 4.9 Open Issues
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

FreeBSD 4.9 Open Issues
=======================

Open Issues
===========

This is a list of open issues that need to be resolved for FreeBSD 4.9.
If you have any updates for this list, please e-mail re@FreeBSD.org.

As many of these open issues involve merging bus\_dma driver changes
from -CURRENT, the `busdma <../../projects/busdma/index.html>`__ project
page is also useful.

Must Resolve Issues for 4.9-RC3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+------------------------------+----------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                        | Status   | Responsible   | Description                                                                                                                                                                                                                |
+==============================+==========+===============+============================================================================================================================================================================================================================+
| FireWire load failure bug.   | Done     | matusita@     | Reported on ``stable@``. Did this ever work after the initial firewire commit to drivers.conf in April? If not, is there any reason to not just back out that commit and not have firewire supported during the install?   |
+------------------------------+----------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Must Resolve Issues for 4.9-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+--------------------+--------------------+--------------------+--------------------+
| Issue              | Status             | Responsible        | Description        |
+====================+====================+====================+====================+
| if\_dc             | --                 | luoqi              |                    |
| tested/merged to   |                    |                    |                    |
| work with PAE in   |                    |                    |                    |
| 4.x                |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
| busdma             | --                 | scottl             | It's unclear if    |
| infrastructure     |                    |                    | further bus\_dma   |
| merges             |                    |                    | infrastructure     |
|                    |                    |                    | changes need to be |
|                    |                    |                    | merged?            |
+--------------------+--------------------+--------------------+--------------------+
| if\_xl             | Done               | silby              |                    |
+--------------------+--------------------+--------------------+--------------------+
| RAID drivers       | --                 | scottl             |                    |
| tested/merged to   |                    |                    |                    |
| work with PAE in   |                    |                    |                    |
| 4.x                |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
| ACPI merged as     | In progress        | John Baldwin       | ACPI will be       |
| optional component |                    |                    | provided as an     |
|                    |                    |                    | optional           |
|                    |                    |                    | component, turned  |
|                    |                    |                    | off by default.    |
+--------------------+--------------------+--------------------+--------------------+

Desired Features for 4.9-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-------------------------------------+---------------+-------------------+-------------------------------------------------------------------------+
| Issue                               | Status        | Responsible       | Description                                                             |
+=====================================+===============+===================+=========================================================================+
| USB updated to work with PAE        | In progress   | jmg, joe, luoqi   | USB does not currently work with PAE enabled.                           |
+-------------------------------------+---------------+-------------------+-------------------------------------------------------------------------+
| ``twe`` updated for bus\_dma/PAE    | --            | ps                | The 3ware ``twe`` driver needs to be updated for use with PAE in 4.X.   |
+-------------------------------------+---------------+-------------------+-------------------------------------------------------------------------+
| ``ciss`` updated for bus\_dma/PAE   | --            | ps                | The ``ciss`` driver needs to be updated for use with PAE in 4.X.        |
+-------------------------------------+---------------+-------------------+-------------------------------------------------------------------------+

Documentation items that must be resolved for 4.9
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+---------+----------+---------------+-------------------------------------------------------------------------------+
| Issue   | Status   | Responsible   | Description                                                                   |
+=========+==========+===============+===============================================================================+
| ACPI    | Done     | Murray        | Handbook should be updated to note that ACPI can be enabled on 4.9 systems.   |
+---------+----------+---------------+-------------------------------------------------------------------------------+
| PAE     | Done     | Murray        | Handbook should be updated to explain the basic PAE functionality.            |
+---------+----------+---------------+-------------------------------------------------------------------------------+

Testing focuses for 4.9
~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
PAE testing
--
More testing should be done with PAE systems to test device
compatibility and performance. In particular, active systems with 12 gig
of ram or more should be thoroughly tested to make sure the various
memory allocation algorithms in the kernel still scale properly. There
were reports of users running out of KVA space in -CURRENT with large
memory machines.

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
