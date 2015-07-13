===================
FreeBSD/ppc Project
===================

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

-  `Home <../>`__

-  `About <../about.html>`__

   -  `Introduction <../projects/newbies.html>`__
   -  `Features <../features.html>`__
   -  `Advocacy <../advocacy/>`__
   -  `Marketing <../marketing/>`__
   -  `Privacy Policy <../privacy.html>`__

-  `Get FreeBSD <../where.html>`__

   -  `Release Information <../releases/>`__
   -  `Release Engineering <../releng/>`__

-  `Documentation <../docs.html>`__

   -  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../docs/books.html>`__

-  `Community <../community.html>`__

   -  `Mailing Lists <../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../usergroups.html>`__
   -  `Events <../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../support.html>`__

   -  `Vendors <../commercial/commercial.html>`__
   -  `Security Information <../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../donations/>`__

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

-  `Developers <../projects/index.html>`__
-  `Developer's
   Handbook <../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Porter's Handbook <../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Source code repositories <../developers/cvs.html>`__
-  `Release Engineering <../releng/index.html>`__
-  `Platforms <../platforms/>`__
-  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
-  `Contributing <../doc/en_US.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD/ppc Project
===================

Introduction
~~~~~~~~~~~~

The FreeBSD/ppc project pages contain information about the FreeBSD port
to the PowerPC? architecture. As with the port itself, these pages are
still a work in progress.

Table Of Contents
~~~~~~~~~~~~~~~~~

-  `Status <#status>`__
-  `Latest News <#news>`__
-  `Port FAQs <#faq>`__
-  `Supported Hardware <#hardware>`__
-  `FreeBSD/ppc mailing list <#list>`__
-  `Known Issues <#issues>`__
-  `Documentation, White Papers, Utilities <#doc>`__
-  `Other links of interest <#links>`__

Status
~~~~~~

The FreeBSD/ppc port is still a `Tier
2 <../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__
platform. That means it is not being fully supported by our security
officer, release engineers and toolchain maintainers.

--------------

Latest News
~~~~~~~~~~~

-  **05 January, 2011**: Support for the Sony Playstation 3 has been
   committed to SVN.
-  **13 July, 2010**: Support for the powerpc64 architecture added.
-  **03 March, 2008**: Support for Freescale? PowerQUICC III MPC85XX
   family system-on-chip development boards has been committed into CVS.
-  **27 February, 2008**: FreeBSD 7.0 is the first release to officially
   support the FreeBSD/ppc port.

--------------

Frequently Asked Questions
~~~~~~~~~~~~~~~~~~~~~~~~~~

#. `How can I install FreeBSD/ppc <#1>`__
#. `How to use ports on FreeBSD/ppc? <#3>`__
#. `Should I install powerpc or powerpc64? <#4>`__
#. `Who should I contact? <#5>`__

How can I install FreeBSD/ppc?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ISO images of FreeBSD 10.1 suitable for New-World Macs are available for
download, for details on how to obtain these see the `release
announcement. <../releases/10.1R/announce.html>`__

How to use ports on FreeBSD/ppc?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The easy way to use ports on FreeBSD is to use portsnap. Refer to the
Handbook if you need assistance to `use the Ports
Collection <../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__.

Should I install powerpc or powerpc64?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The powerpc64 port provides a 64-bit kernel and userland, and is
supported on all 64-bit CPUs. Users of 32-bit CPUs (G3, G4) must use the
32-bit powerpc platform, users of 64-bit CPUs that support 32-bit
operating systems (G5) have a choice, and users of 64-bit CPUs that do
not (Cell) must use powerpc64. For those users with a choice, powerpc64
provides some additional features (the ability to use more than 2 GB of
RAM and ZFS support) while having slightly worse ports support due to
being a newer and less common architecture. Like other 64-bit platforms,
FreeBSD/powerpc64 supports running 32-bit binaries as well as 64-bit
ones.

Who should I contact?
^^^^^^^^^^^^^^^^^^^^^

`Peter Grehan <mailto:grehan@FreeBSD.org>`__ is the project leader.
Contact him if you can contribute code. If you just want to know about
the status of this project, check this page regularly or join the
`FreeBSD/ppc mailing list <#list>`__.

--------------

Supported Hardware
~~~~~~~~~~~~~~~~~~

The FreeBSD/ppc port should run on any New-World Apple machine (any
Apple machine with a built-in USB port), as well as the Sony Playstation
3. A port to IBM pSeries hardware is in progress. People reported
FreeBSD runs on following machines:

+--------------------+--------------------+--------------------+--------------------+
| Manufacturer       | Model              | Submitter          | Notes              |
|                    |                    | (optional links)   |                    |
+====================+====================+====================+====================+
| Apple              | iMac G3 350 MHz    | `Martin            | Rage 128VR         |
|                    |                    | Minkus <mailto:dis |                    |
|                    |                    | killer@diskiller.n |                    |
|                    |                    | et>`__             |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | iMac G3 DV Special | `David S.          | None               |
|                    | Edition            | Besade <mailto:web |                    |
|                    |                    | master@machowto.co |                    |
|                    |                    | m>`__              |                    |
|                    |                    | (`dmesg <http://pe |                    |
|                    |                    | ople.freebsd.org/~ |                    |
|                    |                    | flz/local/dmesg.pp |                    |
|                    |                    | c>`__)             |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | iMac G3 Revision B | `Peter             | Rage 3D Pro 215GP, |
|                    |                    | Grehan <mailto:gre | accel disabled     |
|                    |                    | han@FreeBSD.org>`_ |                    |
|                    |                    | _                  |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | eMac 700 MHz       | `Peter             | Nvidia GeForce2 MX |
|                    |                    | Grehan <mailto:gre |                    |
|                    |                    | han@FreeBSD.org>`_ |                    |
|                    |                    | _                  |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Mac Mini G4 1.4    | `Tilman            | None               |
|                    | GHz                | Linneweh <mailto:a |                    |
|                    |                    | rved@FreeBSD.org>` |                    |
|                    |                    | __                 |                    |
|                    |                    | (`dmesg <http://pe |                    |
|                    |                    | ople.freebsd.org/~ |                    |
|                    |                    | arved/stuff/minima |                    |
|                    |                    | c>`__)             |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Powerbook G4 1.33  | `Peter             | Nvidia GeForce     |
|                    | GHz                | Grehan <mailto:gre | G5200              |
|                    |                    | han@FreeBSD.org>`_ |                    |
|                    |                    | _                  |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Aluminium          | `Andreas           | None               |
|                    | Powerbook G4 1.5   | Tobler <mailto:toa |                    |
|                    | GHz                | @pop.agri.ch>`__   |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | PowerMac G5        |                    | FreeBSD 8.0        |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | iMac G5            |                    | FreeBSD 8.0        |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Xserve G5          |                    | FreeBSD 8.1        |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | PowerMac G5 (late  |                    | FreeBSD 8.1        |
|                    | 2005)              |                    |                    |
+--------------------+--------------------+--------------------+--------------------+

--------------

FreeBSD/ppc mailing list
~~~~~~~~~~~~~~~~~~~~~~~~

To subscribe to this list, send an email to
``     <freebsd-ppc-subscribe@FreeBSD.org>`` or visit the `mailman
interface <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ppc>`__.

--------------

Known Issues
~~~~~~~~~~~~

-  There is a known bug in the boot-loader, that prevents you from
   loading an alternate kernel, so testing your kernel is a bit risky.
   When booting the loader from the Open Firmware prompt, give it a
   partition which is either non-existent, doesn't have a kernel to
   load, or isn't a UFS partition:

   ::

       0 > boot hd:loader hd:0

   At this point, you can set currdev and manually load a kernel:

   ::

       OK set currdev="hd":14
       OK load /boot/kernel/kernel.save

--------------

Documentation, White Papers, Utilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `PowerPC chip
   documentation <http://www.freescale.com/files/product/doc/MPCFPE32B.pdf>`__
-  `Open Firmware Quick
   Reference <http://www.firmworks.com/QuickRef.html>`__
-  `"TN1061: Fundamentals of Open Firmware, Part 1 - The User
   Interface" <https://developer.apple.com/legacy/library/technotes/tn/tn1061.html>`__
-  `"TN1062: Fundamentals of Open Firmware, Part 2 - The Device
   Tree" <https://developer.apple.com/legacy/library/technotes/tn/tn1062.html>`__
-  `Apple hardware developer
   docs <http://developer.apple.com/legacy/mac/library/navigation/>`__
-  `"TN2004: Debugging Open Firmware Using
   Telnet" <http://web.archive.org/web/20080514111646/http://developer.apple.com/technotes/tn/tn2004.html>`__
-  `"TN2023: Open Firmware Ethernet Debugging II - Telnet
   Downloading" <http://web.archive.org/web/20080509173539/http://developer.apple.com/technotes/tn/tn2023.html>`__
-  `"TN2001: Running Files from a Hard Drive in Open
   Firmware" <https://developer.apple.com/legacy/library/technotes/tn/tn2001.html>`__
-  `psim <http://sourceware.org/psim/>`__ - A PowerPC simulator,
   available as a FreeBSD port at
   `emulators/psim-freebsd <http://www.freshports.org/?package=psim-freebsd>`__

Other Links of Interest
~~~~~~~~~~~~~~~~~~~~~~~

-  `FreeBSD/ppc wiki page <http://wiki.freebsd.org/powerpc>`__
-  `Garance A. Drosehn's description about FreeBSD on the Mac
   Mini <http://lists.freebsd.org/pipermail/freebsd-ppc/2005-January/000814.html>`__
-  `NetBSD/macppc <http://www.NetBSD.org/Ports/macppc/>`__
-  `OpenBSD/macppc <http://www.OpenBSD.org/macppc.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../search/index-site.html>`__ \| `Legal
Notices <../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../layout/images/logo-red.png
   :target: ..
