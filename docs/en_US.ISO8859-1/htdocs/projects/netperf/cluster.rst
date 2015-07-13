=======================
FreeBSD Netperf Cluster
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

-  `Developers <../../projects/index.html>`__
-  `Developer's
   Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Porter's
   Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Source code repositories <../../developers/cvs.html>`__
-  `Release Engineering <../../releng/index.html>`__
-  `Platforms <../../platforms/>`__
-  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
-  `Contributing <../../doc/en_US.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Netperf Cluster
=======================

Contents
--------

-  `Introduction <#introduction>`__
-  `Donors <#donors>`__
-  `Netperf Cluster Admins <#admins>`__
-  `Netperf Cluster Resources <#resources>`__
-  `Netperf Cluster Procedures <#procedures>`__
-  `Current Configuration Notes and News <#notes>`__

Introduction
------------

The netperf cluster provides a multi-node, SMP-capable, network
functionality and performance test capability for the `FreeBSD
Project <../../>`__, supporting a variety of on-going sub-projects
including the `netperf project <./index.html>`__, and on-going work on
high performance threading. The cluster is available on a check out
basis for developers, who must request accounts be created by contacting
one of the `netperf cluster admins <#admins>`__. The cluster includes
both 1gbps and 10gbps test segments, with network hardware from a number
of vendors.

Donors
------

The netperf cluster was made possible through the generous donation of a
number of organizations, including:

-  `Sentex Data Communications <http://www.sentex.ca/>`__, who not only
   host the complete cluster, provide front-end build system, several
   test systems, and the management infrastructure (remote power, serial
   console, network switch, etc), but also appear to be endlessly
   willing to help configure, reconfigure, and troubleshoot at almost
   any time of day or night.

-  `FreeBSD Systems <http://www.freebsdsystems.com/>`__, who through a
   generous matching grant with the FreeBSD Foundation, provide the
   majority of testing hardware used in the cluster, including three
   dual-Xeon test systems.

-  The `FreeBSD Foundation <http://www.FreeBSDFoundation.org/>`__, who
   provided a matching grant for the purposes of purchasing testing
   hardware, as well as taking ownership of hardware, offering tax
   receipts to donors in its role as a non-profit, and participating in
   cluster planning.

-  `IronPort Systems <http://www.ironport.com>`__, who have donated a
   test server.

-  `iXsystems <http://www.ixsystems.com/>`__, who have donated several
   test servers.

-  `Google, Inc. <http://www.google.com/>`__, who have donated two test
   servers.

-  `Cisco, Inc. <http://www.cisco.com/>`__, who have donated a 10gbps
   switch.

-  `Chelsio Communications <http://www.chelsio.com/>`__, who have
   donated two 10gbps network cards.

-  `Myricom, Inc. <http://www.myricom.com/>`__, who have donated two
   10gbps network cards.

-  `Intel Corporation <http://www.intel.com/>`__, who have donated two
   10gbps network cards.

-  `Meinberg <http://www.meinberg-usa.com/>`__, who have donated a
   LANTIME M600 IEEE 1588 Grandmaster Clock.

-  George V. Neville-Neil, who has donated a quad-core AMD test system.

-  Robert Watson, who has donated a dual-CPU PIII system and a
   Portmaster terminal server.

Donations to support the netperf cluster have an immediate and
substantial impact on the success of a number of on-going performance
projects, providing access to high-end hardware to a large number of
developers. If you or your company are interested in helping to support
continued development of the netperf cluster as a resource for FreeBSD
development, please contact the `netperf cluster admins <#admins>`__.

Netperf Cluster Admins
----------------------

The FreeBSD netperf cluster is managed by a small team of
developer/administrators to support SMP development and performance
testing on high-end hardware. If you have any questions, including
questions about access to the cluster as a developer, or about possible
future donations of testing hardware, please feel free to contact them
via netperf-admin at FreeBSD.org.

Netperf Cluster Resources
-------------------------

The Netperf cluster consists of several systems interconnected using a
management network, as well as individual back-to-back gigabit ethernet
links for a test network. The following systems are available as testing
resources on a check-out basis:

-  **zoo.FreeBSD.org** is the front-end build and management system.
   This system was donated by Sentex Communications.

-  **elephant** is a dual-PIII 800MHz system with ATA disk subsystem.

-  **orangutan** is a dual-Xeon 2GHz system equipped with an Adaptec
   SCSI RAID array. This system was donated by IronPort Systems.

-  **tiger-1**, **tiger-2**, and **tiger-3** are a set of
   interconnected, matching dual-Xeon 3GHz systems with ATA disk
   subsystems. Each has four if\_em network interfaces, and these are
   interconnected so that various topologies can be created. These
   systems were donated by FreeBSD Systems and the FreeBSD Foundation.

-  **cheetah** is a dual core Opteron 270 system with two 2GHz CPUs each
   with two cores using a Tyan K8S Pro (S2882) motherboard. The machine
   identifies as a quad processor machine in dmesg. The system has SATA
   disk, 2GB of RAM, 1GB for each processor, and 5 ethernet ports. fxp0
   is the management port and em0, em1, bge0 and bge1 are gigE
   interfaces which will eventually connect cheetah to elephant and
   orangutan. This system was donated by George Neville-Neil.

-  **hippo** is a quad-processor Pentium III 500MHz system with 50GB
   RAID array, donated by Sentex Communications.

-  **camel** is a dual core Pentium D 3.0Ghz SMP system with four SATA
   disks and two hardware crypto devices, donated by Sentex
   Communications.

-  **interlope** is a Celeron 2.5GHz system with two SATA disks running
   SUN Solaris 10, donated by Sentex Communications.

-  **apc2**, **apc3**, and **apc4** are the remote power consoles for
   the test network. These systems were donated by Sentex
   Communications.

-  **leopard1**, **leopard2**, and **leopard3** are dual-core Intel
   systems hooked up to the 10gbps test cluster, and use Chelsio and
   Myricom 10gbps cards. These systems were donated by iXsystems.

-  **hydra1** and **hydra2** are 8-core Intel systems hooked up to the
   10gbps test cluster. These systems were donated by Google and the
   FreeBSD Foundation.

The current serial port and network configuration of test systems, as
well as password information, can be found in /etc/motd on zoo. We are
currently interested in adding amd64 and em64t hardware to the cluster.

Netperf Cluster Procedures
--------------------------

As the netperf cluster is a centrally managed and shared resource,
understanding and consistent following of its procedures is important.
In particular, following of the procedures makes it easier for
developers to have reasonable expectations about the configuration of
systems in the cluster, as well as to avoid treading on each others
toes.

Pointers and documentation on Netperf Cluster procedures can be found on
the `Test Cluster One
Pointers <https://wiki.freebsd.org/TestClusterOnePointers>`__ page on
the FreeBSD wiki.

Current Configuration Notes and News
------------------------------------

A few hopefully up-to-date configuration notes that may be relevant to
users of the netperf cluster:

-  **20070727** - The 10gbps testbed is now being configured, thanks to
   donations from iXsystems, Chelsio, Myricom, Intel, Google, Cisco, and
   the FreeBSD Foundation.

-  **20061211** - The `Netperf Cluster Reservations
   page <http://wiki.freebsd.org/NetperfClusterReservations>`__ is now
   online on the wiki. Also, a `Netperf Cluster
   Pointers <http://wiki.freebsd.org/NetperfClusterPointers>`__ wiki
   page has been set up documenting procedures for the Netperf cluster.

-  **20061205** - **zoo.FreeBSD.org** has been updated to the most
   recent version of 6-STABLE.

-  **20050624** - **cheetah** is now online!

-  **20050204** - **orangutan** is now configured to use PXEboot, thanks
   to help from Sentex.

-  **20050203** - system upgrades to **tiger-1**, **tiger-2**, and
   **tiger-3** have been completed -- the latest versions of 4.x (ar0s1)
   and 6.x (ar0s2) are now installed.

-  **20050203** - **zoo.FreeBSD.org** has been updated to the most
   recent version of 5-STABLE.

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
