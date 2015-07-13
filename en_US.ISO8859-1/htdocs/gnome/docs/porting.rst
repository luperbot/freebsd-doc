=========================================
FreeBSD GNOME Project: How To Make a Port
=========================================

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

FreeBSD GNOME Project: How To Make a Port
=========================================

This document assumes that you already know how the port system works,
and therefore only provides GNOME-specific hints and tips. General
instructions can be found in the `FreeBSD Porter's
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/porters-handbook/index.html>`__.

Example Makefile
----------------

There is an `example Makefile <example-Makefile.html>`__ for a GNOME
port, which uses many of the tricks outlined in this document. Please
feel free to use it as a guide for creating your own ports.

GNOME Makefile Macros
---------------------

GNOME applications under FreeBSD use the **USE\_GNOME** infrastructure.
To specify which components of the GNOME system your port needs in order
to build, simply list them all as a space-separated list. For example:

::

    USE_XLIB=   yes
    USE_GNOME=  gnomeprefix gnomehack libgnomeui
          

The **USE\_GNOME** components are divided into the following two lists:

-  `GNOME desktop-version-independent components <gnome_porting.html>`__

-  `GNOME 2 components <gnome2_porting.html>`__

-  `GNOME 1 components <gnome1_porting.html>`__

If your port needs only **GTK2** libraries, the following is the
shortest way to define this:

::

    USE_GNOME=  gtk20
          

If your port needs only **GTK1** libraries, the following is the
shortest way to define this:

::

    USE_GNOME=  gtk12
          

Even if your application needs only the GTK libraries, other
**USE\_GNOME** components may be useful. Please scan the entire list to
make sure your port uses all relevant components.

Once you have finished with your port, it is a good idea to verify that
your port depends on the correct list of components. To see a list of
what packages your port will actually require, use the command
``make package-depends`` from within your port's directory.

To aid in creating the list of necessary components, it can be helpful
to examine the output of ``make configure``. At the end of the
``checking for...`` list, there will be a line similar to this:

::

    checking for    libgnomeui-2.0 >= 2.0.0      cspi-1.0 >= 1.1.7
    libspi-1.0 >= 1.1.7      libbonobo-2.0 >= 2.0.0   atk >= 1.0.0
    gtk+-2.0 >= 2.0.0    gail    libwnck-1.0     esound... yes

This is a list of the components upon which this application relies to
build. Pay close attention to the hierarchical layout of the
**USE\_GNOME** system; many components are implied from other
**USE\_GNOME** directives. In the above example,
``USE_GNOME= libgnomeui`` implies use of ``libbonoboui``, which implies
``libgnomecanvas``, which implies ``libglade2``, which implies
``gtk20``. Thus, even though ``gtk+-2.0`` appears in the list of
requisite components, ``gtk20`` can be eliminated from the
**USE\_GNOME** list. There are a number of other such redundancies that
can be eliminated from this list.

For the above list (taken from ``sysutils/gok``), the following is
defined in the ``Makefile``:

::

    USE_GNOME=  gnomehack gnomeprefix libgnomeui atspi libwnck

GNOME 1 Desktop vs. GNOME 2 Desktop
-----------------------------------

In the beginning, there was only ``GNOME 1``. When the ``GNOME 2``
desktop came around, maximum backwards compatibility was ensured, within
reason. ``GNOME 1`` applications can run fine under the ``GNOME 2``
desktop, provided that the applications do not utilize functionality
specific to the ``GNOME 1`` desktop environment.

The ``GNOME 1`` desktop, and all applications that will not run under
the ``GNOME 2`` desktop, have been removed from the ports tree.

What this means for you, as an application porter, is simply that you
should not add ``GNOME 1``-specific applications to the ports tree.

If you wish to determine which version of the GNOME desktop environment
is present on a user's machine, you can check the value of
**GNOME\_DESKTOP\_VERSION**. This variable is set to either ``"1"`` or
``"2"`` depending upon whether the ``GNOME 1`` or ``GNOME 2`` desktop is
installed.

Optional GNOME Dependencies
---------------------------

If your port can optionally use GNOME, you must set ``WANT_GNOME= yes``
in your Makefile, then check to see if ``HAVE_GNOME`` is set for each
component from the list above that your port can use. Since this is a
conditional evaluation, you need to stick it between ``bsd.port.pre.mk``
and ``bsd.port.post.mk``. For example:

::

    WANT_GNOME= yes

    .include <bsd.port.pre.mk>

    .if ${HAVE_GNOME:Mgnomepanel}!=""
        USE_GNOME+= gnomeprefix gnomepanel
        CONFIGURE_ARGS+=    --with-gnome
        PKGNAMESUFFIX=  -gnome
    .else
        CONFIGURE_ARGS+=    --without-gnome
    .endif

    .include <bsd.port.post.mk>
              

Here, ``WANT_GNOME`` tells the ports system to check for the existence
of the various GNOME components listed above. For each component found,
its name is appended to ``HAVE_GNOME``. Since this port can use
``gnomepanel``, we check ``HAVE_GNOME`` to see if it contains
``gnomepanel`` (for more on the :M``pattern`` make syntax, please refer
to the
`make(1) <//www.FreeBSD.org/cgi/man.cgi?query=make&sektion=0&format=html>`__
manpage). If ``gnomepanel`` is found, then it is added the list of
``USE_GNOME`` dependencies, and the port-specific ``--with-gnome``
``CONFIGURE_ARG`` is passed. In an old GNOME infrastructure,
``PKGNAMESUFFIX`` was automatically adjusted by the proper ``USE_*``
macro. Now it is up to the individual porter to do this. Our example
port appends ``-gnome`` to the port name to indicate it has been built
with GNOME support. The same is true for the ``DATADIR`` ``PLIST_SUB``.
The individual porter must decide when do the ``DATADIR`` substitution.
A good rule of thumb is to add the ``DATADIR`` ``PLIST_SUB`` when using
the ``gnomeprefix`` component.

**Note:** You cannot add extra default ``USE_GNOME`` components after
the ``.include <bsd.port.pre.mk>``. That is, the following is **wrong**
:

::

    .include <bsd.port.pre.mk>

    .if ${HAVE_GNOME:Mgnomelibs}!=""
        USE_GNOME+= libgnome
    .else
        USE_GNOME+= gtk12  # WRONG!
    .endif
          

This will make the build system think that GNOME *is* desired, and mark
the ``pkg-plist`` accordingly, thus breaking package builds. If you need
to add default ``USE_GNOME`` components, do so **above** the
`` .include <bsd.port.pre.mk>`` line.

To enforce use of optional GNOME dependencies unconditionally, you can
add ``WITH_GNOME= yes`` to ``/etc/make.conf`` or on the make command
line. This will always return true when checking for optional GNOME
dependencies. If you want the system to always return false when
checking for optional GNOME dependencies, you can add
``WITHOUT_GNOME= yes`` to ``/etc/make.conf`` or to the make command
line.

More information on the USE\_GNOME infrastructure can be found by
looking at the source and comments of ``${PORTSDIR}/Mk/bsd.gnome.mk``.

GNOME PREFIX
------------

Since the release of 2.16, GNOME now lives in ``LOCALBASE`` instead of
``X11BASE``. To make it easier for GNOME ports that must also be
installed into the same PREFIX as GNOME, a hack has been added to
``bsd.gnome.mk`` to force the PREFIX to ``LOCALBASE`` whenever the
``gnomeprefix`` component is used. This can be overridden by manually
specifying ``PREFIX`` in your port's ``Makefile`` or on the command
line.

OMF Installation
----------------

A large number of GNOME applications (especially GNOME 2 applications)
install Open Source Metadata Framework (OMF) files which contain the
help file information for those applications. These OMF files require
special processing by ScrollKeeper in order for applications like Yelp
to find help documentation. In order to accomplish proper registry of
these OMF files when installing GNOME applications from packages, you
should make sure that ``omf`` files are listed in ``pkg-plist`` and that
your ``Makefile`` has this defined:

::

    INSTALLS_OMF="yes"
                

GConf Schema Installation
-------------------------

GConf is the XML-based database that virtually all GNOME applications
use for storing their settings. This database is defined by installed
schema files that are used to generate ``%gconf.xml`` key files.
Previously, these schema files and ``%gconf.xml`` key files were listed
in the port's ``pkg-plist``. Since this proved to be problematic,
handling of GConf schemas was changed to something similar to that of
`MAN\ *n* <http://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/porting-manpages.html>`__
files. That is, for each schema file installed by your port, you must
have the following listed in the ``Makefile``:

::

    GCONF_SCHEMAS=  my_app.schemas my_app2.schemas my_app3.schemas
          

For example in ``audio/gnome-media``:

::

    GCONF_SCHEMAS=  CDDB-Slave2.schemas gnome-audio-profiles.schemas \
            gnome-cd.schemas gnome-sound-recorder.schemas
          

The schema files and ``%gconf.xml`` key files should not be in the
``pkg-plist``. If you notice that the port doesn't has any
``%gconf.xml`` key files, but has schema files then you should not be
use ``GCONF_SCHEMAS``. It means, this port has broke either schema files
or installation of GConf.

Shared MIME database
--------------------

If your port install files like ``application/x-portname.xml`` in
``share/mime``, you have to add these two lines at the end of the
``pkg-plist``:

::

    @exec %%LOCALBASE%%/bin/update-mime-database %D/share/mime
    @unexec %%LOCALBASE%%/bin/update-mime-database %D/share/mime
          

Also make sure ``shared-mime-info`` is among the dependencies of your
port. If your port use ``gtk20``, you will have ``shared-mime-info``
indirectly. You can check indirect dependencies with ``make describe``.

Example port to look at:
```deskutils/drivel`` <https://svnweb.FreeBSD.org/ports/head/deskutils/drivel/>`__

Desktop database
----------------

Some ports provide MIME definitions in their ``.desktop`` files. If your
port install ``.desktop`` file into ``share/applications`` and there is
a line starting with ``MimeType`` in it, you need to update desktop
database after install and deinstall. This database is represented by
``share/applications/mimeinfo.cache`` file. Add dependency on GNOME
component ``desktopfileutils`` and these lines to the end of
``pkg-plist``:

::

    @exec %%LOCALBASE%%/bin/update-desktop-database > /dev/null || /usr/bin/true
    @unexec %%LOCALBASE%%/bin/update-desktop-database > /dev/null || /usr/bin/true
          

Also add following to the ``post-install`` target in port's Makefile:

::

    -@update-desktop-database
          

Example port to look at:
```editors/leafpad`` <https://svnweb.FreeBSD.org/ports/head/editors/leafpad/>`__

Libtool Issues
--------------

Most, if not all, GNOME applications depend on GNU's libtool. They also
use the GNU configure system. If your port installs shared libraries,
and includes an ``ltmain.sh`` script in its ``${WRKSRC}`` directory, you
should add ``USES=libtool`` to your port's Makefile.

Distfiles
---------

To separate GNOME 2 distfiles from the GNOME 1 distfiles, and to keep
the distfiles directory clean, GNOME 1 ports that download their
distfiles from ``${MASTER_SITE_GNOME}`` must add the following to their
Makefile:

::

    DIST_SUBDIR=    gnome
              

GNOME 2 ports that download their distfiles from
``${MASTER_SITE_GNOME}`` must include the following in their Makefile:

::

    DIST_SUBDIR=    gnome2
          

Some GNOME distfiles come in both tar gzip as well as tar bzip2 format.
To save time when downloading distfiles over slow links, you should use
the bzip2 distfiles whenever possible. To do this, add the following to
your port's Makefile:

::

    USE_BZIP2=  yes
          

If you still need help with your port, have a look at some of the
`existing ports </ports/gnome.html>`__ for examples. The `freebsd-gnome
mailing list <mailto:freebsd-gnome@FreeBSD.org>`__ is also there for
you.

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
