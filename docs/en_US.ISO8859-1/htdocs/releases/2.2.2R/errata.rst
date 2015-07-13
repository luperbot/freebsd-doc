==========================
FreeBSD 2.2.2 Errata Notes
==========================

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

FreeBSD 2.2.2 Errata Notes
==========================

::

    Last minute errata:
    -------------------
    o login as root produces "login_getclass: unknown class 'root'" on system console.

    Fix:  If you have the source distribution installed, simply
          cp /usr/src/etc/login.conf /etc
          otherwise, get it from the FreeBSD FTP site using this URL:
          ftp://ftp.FreeBSD.org/pub/FreeBSD/FreeBSD-current/src/etc/login.conf
          instead.  Simply cd to /etc and then run fetch(1) with the provided URL.


    o sysconfig scrambles rc.conf if run again.

    Fix:  Get updated /usr/src from RELENG_2_2 branch and build
          /usr/src/release/sysinstall, copying the new binary to /stand.

          If you do not have enough space for src then you could also
          use the boot/fixit floppy combo from a later 2.2-YYMMDD-RELENG
          release to simply mount your root partition (using the Fixit
          option) and copy /stand/sysinstall from the floppy to /stand on
          your root fs.


    o Installation floppy does not boot at all - whereas the 2.2.1 floppy
      worked fine.  I get a "panic: double fault" right after it tries to
      change the root device to fd0c.

    Fix:  The problem is that you have 48MB of RAM and something very
          mysterious has happened to FreeBSD twixt 2.2.1 and 2.2.2 which makes
          it fail with just that exact memory size.  Given the popularity of
          16MB simms, it also explains why none of us have seen it since we
          typically have either 16MB, 32MB or 64MB of memory in our systems. :)

          We're working on finding and fixing this problem, but until then
          the following work-around is in effect for 48MB systems:

          1. Boot the 2.2.2 boot floppy and when it comes to the first menu which
             asks you whether or not you want to go into the kernel configuration
             editor, choose the "experts only" CLI mode option.  Now type:

              iosize npx0 32768
              visual
              < and do your visual kernel configuration as normal then exit>

             If you can get through to the installation, go to step 3.

          2. If the above does not work, physically remove all but 32MB of memory
             from your machine and then boot the boot floppy.  Unless your problem
             is totally weird and something we've not seen at all before, you
             should now be able to go on to step 3.

          3. Complete the installation and then boot off your hard disk.  This
             boot should work fine, since you are no longer using the memory
             filesystem that the installation uses and which seems to interact
             badly with these memory size issues to create the failure you saw.

             You will also want to boot with the -c flag at some point and
             say "iosize npx0 0" to get the full use of all your memory back
             since the old value of 32768 will have been saved to disk during
             the initial installation.  If you already plan on building a custom
             kernel, you can skip this step since the value will be reset anyway.

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
