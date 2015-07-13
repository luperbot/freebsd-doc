===================
FreeBSD/ARM Project
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

FreeBSD/ARM Project
===================

Introduction
~~~~~~~~~~~~

This page contains information about the FreeBSD port to the ARM
architecture and hardware. Discussion of the ARM port takes place on the
`freebsd-arm <http://lists.freebsd.org/mailman/listinfo/freebsd-arm>`__
mailing list.

Table Of Contents
~~~~~~~~~~~~~~~~~

-  `Status <#status>`__
-  `Hardware List <#hw>`__
-  `What Needs To Be Done <#todo>`__
-  `FreeBSD/ARM Related Links <#links>`__
-  `Mini-Install Guide <#miniinst>`__
-  `FreeBSD/ARM mailing list <#list>`__

Status
~~~~~~

ARM is officially a `Tier
2 <../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__
architecture, as the `FreeBSD <..>`__ project does not provide official
releases or pre-built packages for this platform due to it primarily
targeting the embedded arena. However, FreeBSD/ARM is being actively
developed and maintained, is well supported, and provides an excellent
framework for building ARM-based systems. FreeBSD/arm supports ARMv4 and
ARMv5 processors. FreeBSD/armv6 supports ARMv6 and ARMv7 processors,
including SMP on the latter.

64-bit ARM support is in progress.

FreeBSD/ARM Hardware Notes
~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD/arm and FreeBSD/armv6 support a large range of ARM CPUs and
development boards. Not every peripheral is supported on every CPU or
board, though work continues towards this and contributions are always
welcome. Conversely, many CPUs and boards not listed may work with only
minimal changes needed.

Listing all supported devices on all CPUs and boards is impractical
here, however much information can be obtained from the mailing list and
archives, `the FreeBSD/arm Wiki
pages <https://wiki.freebsd.org/FreeBSD/arm>`__, and also from the
`Kernel Configuration
files <https://svnweb.freebsd.org/base/head/sys/arm/conf/>`__

Cores Supported
^^^^^^^^^^^^^^^

-  ARM9E
-  Most XScale
-  Marvel Feroceon
-  Marvel Sheeva
-  ARM10E
-  ARM11J
-  Cortex A5
-  Cortex A7
-  Cortex A8
-  Cortex A9
-  Cortex A12
-  Cortex A15

SoCs
^^^^

-  Allwinner A10/A20
-  Atmel AT91RM92 and AT91SAM9 families
-  Broadcom BCM2835 (used in Raspberry Pi)
-  Cavium CNS11xx
-  Freescale i.MX51, i.MX53, i.MX6 and Vybrid Family
-  Intel XSCALE
-  Marvell Orion, Kirkwood and Discovery Innovation families of
   systems-on-chip
-  Marvell Armada 500 (ARMv6) and Armada XP (ARMv7)
-  NXP LPC32x0
-  Qualcomm Snapdragon
-  Rockchip RK3188
-  Samsung Exynos5 and S3C24xxx
-  Texas Instruments DaVinci Digital Media SoC
-  TI OMAP
-  Xilinx Zynq7 family

Note that not all peripherals are supported on all CPUs.

Boards
^^^^^^

-  ArndaleBoard (Samsung Exynos5250)
-  Atmel AT91RM9200
-  BeagleBoard and BeagleBoard-xM (TI OMAP3)
-  BeagleBone
-  Colibri VF50 Evaluation Board
-  Cubieboard(1,2) (Allwinner A10/A20)
-  Device Solutions Quartz
-  Gateworks Avila GW2348 and Cambria GW2358
-  Genesi Efika MX Smarttop and Smartbook
-  Globalscale Technologies OpenRD platform
-  Google Chromebook
-  Kwikbyte KB9202B (as well as the older KB9202 and KB9202A)
-  Linksys NSLU2
-  Marvell DB-88F5182, DB-88F5281, DB-88F6281, RD-88F6281, DB-78100
-  Marvell DB-88F6781 (ARMv6)
-  Marvell DB-78460 (ARMv7)
-  Marvell Sheeva Plug and Dream Plug
-  Pandaboard (OMAP4)
-  Phytec Cosmic Board (Freescale Vybrid Family)
-  Raspberry Pi
-  Radxa Rock (Work in progress)
-  SBC6045 with Atmel at91sam9g45
-  Technologic Systems TS-7200 and TS-7800
-  Wandboard
-  Zedboard (Xilinx Zynq)

Note that not all peripherals are supported on all boards.

What Needs To Be Done
~~~~~~~~~~~~~~~~~~~~~

-  SATA support needs to be added for boards currently missing it.
-  Other devices, such as watchdog, i2c and bus should be merged from
   NetBSD.

FreeBSD/ARM Related Links
~~~~~~~~~~~~~~~~~~~~~~~~~

-  `Brief history of
   ARM <http://esd.et.ntust.edu.tw/downloads/2008_Embedded_Programming/2008_ESW/Embedded_3_ARM.pdf>`__
-  `NetBSD Arm projects <http://www.netbsd.org/ports/#ports-by-cpu>`__

Mini-Install guide
~~~~~~~~~~~~~~~~~~

Olivier Houchard <cognet@FreeBSD.org\ > has written a mini-install guide
for the current FreeBSD source. It is `available
here <http://people.freebsd.org/~cognet/arm.html>`__.

FreeBSD/ARM mailing list
~~~~~~~~~~~~~~~~~~~~~~~~

To subscribe to this list, send mail to
``<freebsd-arm-subscribe@FreeBSD.org>`` or visit `mailman
interface <http://lists.FreeBSD.org/mailman/listinfo/freebsd-arm>`__.

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
