===========================
FreeBSD 2.2.6 Release Notes
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

FreeBSD 2.2.6 Release Notes
===========================

::

    ================================================================
                             RELEASE NOTES
                      FreeBSD 2.2.6-RELEASE VERSION
    ================================================================

    What's new since 2.2.5
    ----------------------

    Kernel features:

    o Added support for SMC EtherPower II 10/100 Fast Ethernet card
      (aka SMC9432TX based on SMC83c170 EPIC chip).

    o Added support for DPT SCSI RAID controllers (see LINT).

    o New Plug and Play (PnP) support that allows you to (re)configure
      PnP devices.  Also support modems being detected by the PnP
      part and automatically attached.

    o Alternate sound driver (/sys/i386/isa/snd) from Luigi Rizzo;
      it does not yet support MIDI (for that, use the old sound
      driver) but it does have much better support for PNP sound
      cards and is much easier to configure (only one device).
      See /sys/i386/conf/LINT for more info.

    o Better Linux emulation (applications like RealVideo 5.0 for
      Linux now work).

    o Added support for ATAPI floppy drives (LS-120)

    o The psm, mse and sysmouse drivers are improved to provide
      better mouse support.  moused(8) has been modified to support
      various mice with a ``wheel''.  It also automatically
      recognizes mice which support the PnP COM device standard so
      that the user is no longer required to supply a mouse protocol
      type on the command line.

    Userland features:

    o popen() library call now uses and offers bidirectional pipes.

    o Added support for parallel makes in /usr/src (-j n works
      now with   world target, particularly useful with SMP
      machines).

    o tcpdump(1) utility enhanced

    o Support for ldconfig -R (remove) added.

    o Various bugfixes and enhancements to pthread support.

    o calendar(1) program brought more up-to-date.

    o KerberosIV updated to latest version.

    o Various curses(3) bugs fixed.

    o Various IEEE754 conformance changes to libm(3).

    o Much cleanup and general improvements to the documentation.

    o Various improvements to the NIS code.


    Security issues:

    o Fixed /dev/io and mmap security holes.

    o Better protection against "LAND attacks"

    o Various buffer overruns detected and extra checks added.

    o Pentium "F00F bug" is detected and a work-around installed to
      prevent hangs.

    o srandomdev() support merged from -current and utilities updated
      to use it.

`Release Home <../index.html>`__

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
