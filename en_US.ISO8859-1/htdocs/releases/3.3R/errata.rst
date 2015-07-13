========================
FreeBSD 3.3 Errata Notes
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

FreeBSD 3.3 Errata Notes
========================

::

    The file 
    ERRATA.TXT contains post-release ERRATA for 3.3 and should always
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

    Current active security advisories for 3.3:     None

    ---- System Update Information:

    The fvwm desktop choice in the X Desktops menu doesn't work.

    Fix: Install fvwm from /usr/ports/x11-wm/fvwm2 instead of using the
         desktop menu item and put "fvwm" in your $HOME/.xinitrc and
         $HOME/.xsession files for use by startx/xdm.  You can also build
         and reinstall /usr/src/release/sysinstall from 3.3-STABLE sources
         to fix the X Desktop menu item in question.

    The lo0 (loop-back) device is not configured on startup, causing
    utilities like mountd to fail.

    Fix: Assuming that you experience this problem at all, edit /etc/rc.conf
         and search for where the network_interfaces variable is set.  In
         its value, change the word "auto" to "lo0" since the auto keyword
         doesn't bring the loop-back device up properly, for reasons yet to
         be adequately determined.  Since your other interface(s) will already
         be set in the network_interfaces variable after initial installation,
         it's reasonable to simply s/auto/lo0/ in rc.conf and move on.

    The 3.3 ISO image (and 3.3 CDROM #1 from Walnut Creek CDROM)
         mysteriously fails to boot on an ATAPI CDROM device but works
         with SCSI CDROMs (on adaptors which support bootable CDs).

    Fix: Either install using boot floppies (see floppies/README.TXT)
         rather than booting from the CDROM or grab the updated ISO image
         from:

           ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/ISO-IMAGES/

         See also the CHECKSUM.MD5 file in that directory to verify whether
         you have the "old" or new image - some mirrors may be slow
         in picking up the uncompressed and gzipped versions of the ISO 9660
         installation image.  As always, Walnut Creek CDROM will also provide
         replacement CDs (once they become available) on request to purchasers
         of the 3.3-RELEASE product.

         This problem was caused by a bug in mkisofs which we're still
         chasing but have, for now, simply worked-around.

    Ppp(8) does not properly detect carrier in direct mode.

    Fix: Download and install the latest version of ppp(8) from:

           http://www.FreeBSD.org/~brian/ (US)
           http://www.Awfulhak.org/~brian/ (UK)

         or upgrade your system to -stable.

    Hitting Ctl-Alt-Space may panic the kernel with the
    apm driver which is disabled or is not functional because of
    the lack of APM support in the motherboard.

    Fix: To fix this, apply the following patch to
         /sys/i386/apm/apm.c and rebuild the kernel.

    Index: apm.c
    ===================================================================
    RCS file: /src/CVS/src/sys/i386/apm/apm.c,v
    retrieving revision 1.77.2.8
    retrieving revision 1.77.2.9
    diff -u -r1.77.2.8 -r1.77.2.9
    --- apm.c   1999/09/12 01:06:28 1.77.2.8
    +++ apm.c   1999/09/20 15:34:29 1.77.2.9
    @@ -621,6 +621,9 @@
     apm_suspend(int state)
     {
        struct apm_softc *sc = &apm_softc;
    +
    +   if (!sc->initialized)
    +       return;

        switch (state) {
        case PMST_SUSPEND:


        If you don't like to rebuild the kernel, you can edit your
        keymap file so that it won't cause panic.  Find your keymap
        file in /usr/share/syscons/keymap.  Open it with an editor
        program and locate the following line.

          057   ' '  ' '  nul  ' '  ' '  ' '  susp ' '  O
                                              ~~~~
        Change it to

          057   ' '  ' '  nul  ' '  ' '  ' '  ' '  ' '  O
                                              ~~~ (a quoted space)
        You must change the next line too.

          104   slock saver slock saver susp nop  susp nop  O
                                        ~~~~      ~~~~
        Edit this to

          104   slock saver slock saver nop  nop  nop  nop  O

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
