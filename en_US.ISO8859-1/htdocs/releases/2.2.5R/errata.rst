==========================
FreeBSD 2.2.5 Errata Notes
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

FreeBSD 2.2.5 Errata Notes
==========================

::

    The file 
    ERRATA.TXT contains post-release ERRATA for 2.2.5 and should always
    be considered the definitive place to look first before reporting
    a problem with this release.  This file will also be periodically
    updated as new issues are reported so even if you've checked this
    file recently, check it again before filing a bug report.  Any
    changes to this file are also automatically emailed to:

        freebsd-stable@FreeBSD.org

    For 2.2.5 security advisories, see:

        ftp://FreeBSD.org/pub/CERT/

    For the latest information (note the URL carefully - this is NOT
    ftp.FreeBSD.org).

    ---- Security Advisories:

    Current active security advisories for 2.2.5:   One

    o FreeBSD-SA-97:05 (available from ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT).

      You may also simply remove /dev/io as a quick work-around if you're
      not running an X server or some other specialized utility which
      requires access to the I/O instructions.

    ---- System Update Information:
    o The appletalk stack was broken in 2.2.5.

    Fix:  If you plan to run appletalk, you should apply the following patch:

    ftp://ftp.FreeBSD.org/pub/FreeBSD/updates/2.2.5-RELEASE/atalk.diff.2.2.gz


    o The line printer spooler lpd will, when sending jobs to remote
      printers, kill the child process sending to the remote after the
      timeout specified in the `ct' capability (2 minutes by default).

    Fix:  Please upgrade the lpd subsystem to 2.2-stable.  As a workaround,
          increase the `ct' capability to an unreasonably large number of
          seconds (like 3600).


    o Intel "F00F bug" enables users to hang machines with Pentium processors
      if they have access to the machine and can execute programs.

    Fix:  Update to the 2.2-stable version of the kernel or apply the patch
          found in:

          ftp://ftp.FreeBSD.org/pub/FreeBSD/updates/2.2.5-RELEASE/f00f.diff.2.2.gz


    o A bug in the ipfw code exists where using the "reset tcp" firewall command
      causes the kernel to write ethernet headers onto random kernel stack
      locations.

    Fix:    Update to the 2.2-stable version of the kernel or apply the
            patch found in ftp://ftp.FreeBSD.org/pub/FreeBSD/updates/2.2.5-RELEASE/ipfw.diff.gz


    o A bug in XF86Setup causes it to fail to create a symbolic link from
      /usr/X11R6/bin/X to the right X server for your hardware if a link
      does not already exist.  When you type startx the following error is
      displayed:

      xinit:  No such file or directory (errno 2):  no server "X" found in PATH

    Fix:    Execute the following commands (as root) and re-run XF86Setup.

        # cd /usr/X11R6/bin
        # ln -s XF86_VGA16 X

        If XF86Setup asks you if you want to use the existing XF86Config for
        defaults choose no.  When it asks you if you want to create an 'X'
        link to the server choose yes.


    o A bug in the phase diagram implementation of user-level ppp causes
      problems with some ppp implementations when shutting down the link.
      The line will go dead, but the modem will not hang up unless done
      manually using pppctl (or a switch).

    Fix:  A version of ppp derived from the -current sources is available from
          http://www.FreeBSD.org/~brian

          It should build on any version of FreeBSD from 2.0.5 onwards.
          This code is available in the -current tree, but not (yet) in the
          2.2-STABLE tree.

        Further documentation can be found at these locations:

          Document references
          FAQ
          handbook

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
