=========================================
FreeBSD GNOME Project: GNOME 1 Components
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

FreeBSD GNOME Project: GNOME 1 Components
=========================================

To see how to utilize these components, please examine the `example
Makefile <example-Makefile.html>`__.

+-------------------+----------------------------+-------------------------------------+
| COMPONENT         | ASSOCIATED PROGRAM         | IMPLIED COMPONENTS                  |
+===================+============================+=====================================+
| ``bonobo``        | ``devel/bonobo``           | ``oaf gnomeprint``                  |
+-------------------+----------------------------+-------------------------------------+
| ``gal``           | ``x11-toolkits/gal``       | ``libglade``                        |
+-------------------+----------------------------+-------------------------------------+
| ``gconf``         | ``devel/gconf``            | ``oaf``                             |
+-------------------+----------------------------+-------------------------------------+
| ``gdkpixbuf``     | ``graphics/gdk-pixbuf``    | ``gtk12``                           |
+-------------------+----------------------------+-------------------------------------+
| ``glib12``        | ``devel/glib12``           | ``pkgconfig``                       |
+-------------------+----------------------------+-------------------------------------+
| ``gnomecanvas``   | ``graphics/gnomecanvas``   | ``gnomelibs gdkpixbuf``             |
+-------------------+----------------------------+-------------------------------------+
| ``gnomedb``       | ``databases/gnome-db``     | ``libgda``                          |
+-------------------+----------------------------+-------------------------------------+
| ``gnomelibs``     | ``x11/gnome-libs``         | ``esound imlib libxml orbit``       |
+-------------------+----------------------------+-------------------------------------+
| ``gnomeprint``    | ``print/gnome-print``      | ``gnomelibs gnomecanvas``           |
+-------------------+----------------------------+-------------------------------------+
| ``gnomevfs``      | ``devel/gnome-vfs1``       | ``gnomemimedata gconf gnomelibs``   |
+-------------------+----------------------------+-------------------------------------+
| ``gtk12``         | ``x11-toolkits/gtk12``     | ``glib12``                          |
+-------------------+----------------------------+-------------------------------------+
| ``imlib``         | ``graphics/imlib``         | ``gtk12``                           |
+-------------------+----------------------------+-------------------------------------+
| ``libgda``        | ``databases/libgda``       | ``gconf bonobo``                    |
+-------------------+----------------------------+-------------------------------------+
| ``libghttp``      | ``www/libghttp``           | ``?``                               |
+-------------------+----------------------------+-------------------------------------+
| ``libglade``      | ``devel/libglade``         | ``gnomedb``                         |
+-------------------+----------------------------+-------------------------------------+
| ``libxml``        | ``textproc/libxml``        | ``glib12``                          |
+-------------------+----------------------------+-------------------------------------+
| ``oaf``           | ``devel/oaf``              | ``orbit libxml``                    |
+-------------------+----------------------------+-------------------------------------+
| ``orbit``         | ``devel/ORBit``            | ``glib12``                          |
+-------------------+----------------------------+-------------------------------------+
| ``pygtk``         | ``x11-toolkits/py-gtk``    | ``gnomelibs gdkpixbuf libglade``    |
+-------------------+----------------------------+-------------------------------------+

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
