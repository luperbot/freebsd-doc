========================
FreeBSD 4.0 Errata Notes
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

FreeBSD 4.0 Errata Notes
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

    Current active security advisories: None

    ---- System Update Information:


    The tcpdump binary in the bin distribution is erroneously linked against
    the libcrypto.so library, which is only found in the separate crypto
    distribution.


    Therefore, if you only install the bin distribution without the crypto
    distribution, tcpdump will not work as installed.

    Fix: Download a new tcpdump binary from the following location:

        http://people.FreeBSD.org/~kris/4.0R/i386/tcpdump (i386)
        http://people.FreeBSD.org/~kris/4.0R/alpha/tcpdump (alpha)

    The MD5 checksum of this file is:

        i386 version: MD5 (tcpdump) = 0b3d32b367e7312d546ccae8f1824391
        alpha version: MD5 (tcpdump) = 2d113fa4c38c8a0299d558acb5c6ad57

    To verify the checksum of your downloaded copy, perform the following
    command:

        /sbin/md5 /path/to/downloaded/tcpdump

    and compare with the above.



    o Tool source code not installed by install.sh (outside of sysinstall)


    If you are attempting to extract the full source code from
    the CDROM (outside of the sysinstall program), you will end up missing
    the tool source code.

    Fix: If you are running install.sh from /cdrom/src, you will need to also
         run:

           cat stool.?? | tar --unlink -xpzf - -C /usr/src

    to have the tool sources (/usr/src/tools hierarchy) installed. These are
    required to successfully build world.

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
