=============================================
FreeBSD GNOME Project: Example GNOME Makefile
=============================================

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

-  `FreeBSD/GNOME <../../gnome/index.html>`__

   -  `Installation Instructions <../../gnome/docs/faq2.html#q1>`__
   -  `Upgrade Instructions <../../gnome/docs/faq232.html#q2>`__
   -  `Available Applications <../../gnome/../ports/gnome.html>`__
   -  `How to Help <../../gnome/docs/volunteer.html>`__
   -  `Reporting a Bug <../../gnome/docs/bugging.html>`__
   -  `Screenshots <../../gnome/screenshots.html>`__
   -  `Contact Us <../../gnome/contact.html>`__

-  `Documentation <../../gnome/index.html>`__

   -  `FAQ <../../gnome/docs/faq2.html>`__
   -  `HAL FAQ <../../gnome/docs/halfaq.html>`__
   -  `2.30 to 2.32 Upgrade FAQ <../../gnome/docs/faq232.html>`__
   -  `Development Branch FAQ <../../gnome/docs/develfaq.html>`__
   -  `Creating Ports <../../gnome/docs/porting.html>`__
   -  `Known Issues <../../gnome/docs/faq232.html#q4>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD GNOME Project: Example GNOME Makefile
=============================================

The following is an example Makefile for a FreeBSD GNOME port.

::

    # New ports collection makefile for:    gnomeapp
    # Date created:                     27 December 2003
    # Whom:                             Some GNOME User <freebsd-gnome@FreeBSD.org>
    #
    # $FreeBSD$
    #

    # For this example, assume there was already a gnomeapp in the tree, and that this
    # is the GTK+-2 version (i.e. gnomeapp2 versus gnomeapp).
    PORTname=       gnomeapp2
    PORTVERSION=    2.32.2
    MASTER_SITES=   ${MASTER_SITE_GNOME}
    MASTER_SITE_SUBDIR= sources/${PORTNAME:S/2//}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
    DISTname=   ${PORTNAME:S/2//}-${PORTVERSION}
    DIST_SUBDIR=    gnome2

    MAINTAINER= gnome@FreeBSD.org
    COMMENT=    A GNOME app that does some stuff

    USE_BZIP2=  yes
    GNU_CONFIGURE=  yes # NOTE: if the port needs ltverhack, this must be
    USE_AUTOTOOLS="libtool":15
    USE_GMAKE=      yes # same with GNU make
    # This is for i18n:
    CONFIGURE_ENV+= CPPFLAGS="-I${LOCALBASE}/include" \
                    LDFLAGS="-L${LOCALBASE}/lib"
    USE_GNOME=      gnomehack gtk20

    # This application can dock in the GNOME panel, or it can not.
    # But there's no need to build support for it if the GNOME panel
    # libraries are not installed, so only build GNOME panel support
    # if the gnomepanel port is already installed.
    WANT_GNOME=     yes

    .include <bsd.port.pre.mk>

    .if ${HAVE_GNOME:Mgnomepanel}!=""
    USE_GNOME+=         gnomepanel
    CONFIGURE_ARGS+=    --with-gnome
    PKGNAMESUFFIX=      -gnome
    .else
    CONFIGURE_ARGS+=    --without-gnome
    .endif

    # Given all the above code, the package name is either "gnomeapp2-gnome-2.32.2" or
    # "gnomeapp2-2.32.2", depending upon whether you want gnomepanel support. The downloaded
    # distfile will be "gnomeapp-2.32.2.tar.bz2."

    .include <bsd.port.post.mk>
        

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
