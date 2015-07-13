========================
FreeBSD 4.3 Errata Notes
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

FreeBSD 4.3 Errata Notes
========================

::

    If you read no other documentation before installing this
    version of FreeBSD, you should at least by all means *READ
    THE ERRATA* for this release so that you don't stumble over
    problems which have already been found and fixed.  This ERRATA.TXT
    file is obviously already out of date by definition, but other
    copies are kept updated on the net and should be consulted as
    the "current errata" for your release.  These other copies of
    the errata are located at:

      1. http://www.FreeBSD.org/releases/

      2. ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/<your-release>/ERRATA.TXT
         (and any sites which keep up-to-date mirrors of this location).

    Any changes to this file are also automatically emailed to:

        freebsd-current@FreeBSD.org

    For all FreeBSD security advisories, see:

        http://www.FreeBSD.org/security/

    for the latest security incident information.

    ---- Security Advisories:

    The vulnerability documented in security advisory FreeBSD-SA-01:39 was
    fixed in FreeBSD 4.3-RELEASE.  The release notes mentioned the fix,
    but made no mention of the security advisory.

    A vulnerability in the fts(3) routines (used by applications for
    recursively traversing a filesystem) could allow a program to operate
    on files outside the intended directory hierarchy.  This bug, as well
    as a fix, is described in security advisory FreeBSD-SA-01:40.

    A flaw allowed some signal handlers to remain in effect in a child
    process after being exec-ed from its parent.  This allowed an attacker
    to execute arbitrary code in the context of a setuid binary.  More
    details, as well as a fix, are described in security advisory
    FreeBSD-SA-01:42.

    A remote buffer overflow in tcpdump(1) could be triggered by sending
    certain packets at a target machine.  More details, as well as a fix,
    can be found in security advisory FreeBSD-SA-01:48.

    A remote buffer overflow in telnetd(8) could result in arbitrary code
    running on a target machine.  More details, as well as a fix, can be
    found in security advisory FreeBSD-SA-01:49.

    A vulnerability whereby a remote attacker could exhaust a target's
    pool of network buffers has been closed.  More details, as well as a
    fix, can be found in security advisory FreeBSD-SA-01:52.

    A flaw existed in ipfw(8), in which ``me'' filter rules would match
    the remote IP address of a point-to-point interface in addition to the
    intended local IP address.  More details, as well as a fix, can be
    found in security advisory FreeBSD-SA-01:53.

    A vulnerability in procfs(5) could allow a process to read sensitive
    information from another process's memory space.  For more details, as
    well as information on patches, see security advisory
    FreeBSD-SA-01:55.

    PARANOID hostname checking in tcp_wrappers did not work correctly.
    For more details and information on patches, see security advisory
    FreeBSD-SA-01:56.

    sendmail(8) has a local root vulnerability.  For more details and
    patch information, see security advisory FreeBSD-SA-01:57.

    lpd(8) contained a remotely-exploitable buffer overflow.  For more
    details, and a fix for this problem, see security advisory
    FreeBSD-SA-01:58.

    rmuser(8) had a race condition that briefly exposed a world-readable
    /etc/master.passwd.  For more details, as well as workarounds and
    solutions, see security advisory FreeBSD-SA-01:59.

    ---- System Update Information:

    The release note entry for the ESS Maestro-3/Allegro sound driver gave
    an incorrect command for loading the driver via /boot/loader.conf.
    The correct command is:

        snd_maestro3_load="YES"

    ssh(1) is no longer SUID root.  The primary manifestation of this
    change is that .shosts authentication may not work "out of the box".
    Both temporary and permanent fixes are described in the FAQ at:

        http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/faq/admin.html#SSH-SHOSTS

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
