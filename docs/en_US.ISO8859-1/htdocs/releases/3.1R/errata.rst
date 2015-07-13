========================
FreeBSD 3.1 Errata Notes
========================

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

FreeBSD 3.1 Errata Notes
========================

::

    The file 
    ERRATA.TXT contains post-release ERRATA for 3.1 and should always
    be considered the definitive place to look *first* before reporting
    a problem with this release.  This file will also be periodically
    updated as new issues are reported so even if you've checked this
    file recently, check it again before filing a bug report.  Any
    changes to this file are also automatically emailed to:

        freebsd-stable@FreeBSD.org

    For all FreeBSD security advisories, see:

    ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/

    For the latest information.

    ---- Security Advisories:

    Current active security advisories for 3.1:     None

    ---- System Update Information:

    o  Some packages, like netscape, will fail to install if chosen
       at initial system installation time, in some cases claiming
       that the "compat22" distribution needs to be installed even
       though it has, indeed, been installed.


    Fix: The problem here is that though the compatibility a.out libraries
         may have been installed from compat22 and as part of the XFree86
         distribution, the a.out library (ldconfig) cache has not yet been
         built given that this doesn't happen until the system has booted
         completely at least once.  This causes packages which require the
         old a.out libraries (like netscape) to get confused if they're
         installed before that has occurred.  To work around the problem,
         simply complete the installation as normal and come up fully,
         then re-run /stand/sysinstall (or use the pkg_add(1) command
         directly) to re-install the failing package(s).


    o  Kernel change information is not saved in the new kernel, even
       though this is claimed to work in the docs.


    Fix: The change information is being written out, in fact, but to the
         wrong location.  move /kernel.config to /boot/kernel.conf (if it
         exists, otherwise there were no changes to save) and add the
         following lines to /boot/loader.rc:

            load /kernel
            load -t userconfig_script /boot/kernel.conf
            autoboot 5

         This will cause the kernel change information to be read in and
         used properly (and you just learned a little about the new 3-stage
         loader in the process, so the exercise wasn't a total loss).


    o  DOS installation fails when you actually follow the instructions
       to install stuff under C:\FREEBSD\BIN\... and so on.


    Fix: The instructions are correct but the code was wrong in 3.1-RELEASE,
         sysinstall looking instead directly under C:\ (e.g. C:\BIN\...)
         or under C:\RELEASES\ (C:\RELEASES\BIN\... and so on).  Fixed
         in 3.1-STABLE.

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
