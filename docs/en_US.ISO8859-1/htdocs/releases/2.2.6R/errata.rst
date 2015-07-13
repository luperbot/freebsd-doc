==========================
FreeBSD 2.2.6 Errata Notes
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

FreeBSD 2.2.6 Errata Notes
==========================

::

    The file 
    ERRATA.TXT contains post-release ERRATA for 2.2.6 and should always
    be considered the definitive place to look *first* before reporting
    a problem with this release.  This file will also be periodically
    updated as new issues are reported so even if you've checked this
    file recently, check it again before filing a bug report.  Any
    changes to this file are also automatically emailed to:

        freebsd-stable@FreeBSD.org

    For 2.2.6 security advisories, see:

    ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/

    For the latest information.

    ---- Security Advisories:

    Current active security advisories for 2.2.6:   4

    See ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-98:0[2-5].*
    for full information.

    ---- System Update Information:
    o Root mountpoint change which affects those upgrading via
     "make world" or a FreeBSD 2.2.6 upgrade.

    Fix:  2.2.6 introduces a change in the naming of the device from
          which the root filesystem is mounted.  This change affects all systems,
          however user intervention is only required for systems undergoing an
          upgrade installation.

    Previously, the root filesystem was always mounted from the
    compatibility slice, while other partitions on the same disk were
    mounted from their true slice.  This might, for example, have resulted
    in an /etc/fstab file like:

    # Device      Mountpoint      FStype  Options         Dump    Pass#
    /dev/wd0s2b   none            swap    sw              0       0
    /dev/wd0a     /               ufs     rw              1       1
    /dev/wd0s2f   /local0         ufs     rw              1       1
    /dev/wd0s2e   /usr            ufs     rw              1       1

    For FreeBSD 2.2.6 and later, this format changes so that the device for
    '/' is consistent with others, ie.

    # Device      Mountpoint      FStype  Options         Dump    Pass#
    /dev/wd0s2b   none            swap    sw              0       0
    /dev/wd0s2a   /               ufs     rw              1       1
    /dev/wd0s2f   /local0         ufs     rw              1       1
    /dev/wd0s2e   /usr            ufs     rw              1       1

    If /etc/fstab is not updated manually in this case, the system will
    issue a warning message whenever / is mounted (normally at startup)
    indicating the change that must be made.  In addition, trouble may be
    experienced if the root filesystem is not correctly unmounted, whereby
    the root filesystem will not be marked clean at the next reboot.

    This change should be made as soon as the upgraded system has been
    successfully rebooted.


    o The ppp program fails to work, citing a missing shared library
      called "libdes.so.3.0".

    Fix:  There are three possible fixes:

    1. The easiest fix is to simply install the des distribution with
       /stand/sysinstall, remembering to pick a site that will allow you
       to export it if you're outside the United States and Canada
       (ftp.FreeBSD.org and ftp.internat.FreeBSD.org both fall into this
       category).

    2. Purely as a work-around, and what you may need to do if ppp
       also constitutes your only way of getting to the net, is to simply
       do the following (as root):

          cp /usr/lib/libcrypt.so.2.0 /usr/lib/libdes.so.3.0
          ldconfig -m /usr/lib

    3. Another fix, and one which doesn't involve having to fetch the DES
       bits, is to install the ppp sources in /usr/src/usr.sbin/ppp and rebuild
       them.  The sources are "smart" enough to know that the DES library isn't
       on the system and won't create a binary which depends on it.

    NOTE:  If you choose the 2nd or 3rd fixes, you also will not be able to
    use MSCHAP (Microsoft Win*) style authentication.


    o The xterm program in XFree86 3.3.2 doesn't remove utmp entries on
      exit (e.g. xterm sessions show up in "who" or "w" even after they've
      exited).

    Fix:  Fetch the updated xterm binary at:

      ftp://ftp.FreeBSD.org/pub/FreeBSD/updates/2.2.6-RELEASE/xterm

    Or get the *latest* ports collection on your machine (see
    http://www.FreeBSD.org/ports) and use the port in x11/XFree86 to
    build an xterm with this patch already applied (as of 98/04/06).
    The patch itself can also be obtained from the port itself:

      ftp://ftp.FreeBSD.org/pub/FreeBSD/FreeBSD-current/ports/x11/XFree86/patches/patch-ag


    o The older Matsushita (Panasonic), Sony CDU-31 and Mitsumi (non-IDE)
      CDROM drives no longer permit CDROM installs.

    Fix: Fetch an updated boot floppy from the updates/ directory, e.g.:

      ftp://ftp.FreeBSD.org/pub/FreeBSD/updates/2.2.6-RELEASE/boot.flp

    And use it to install 2.2.6 instead.  This problem is fixed in 2.2-stable
    and will not be a problem with the next FreeBSD release.

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
