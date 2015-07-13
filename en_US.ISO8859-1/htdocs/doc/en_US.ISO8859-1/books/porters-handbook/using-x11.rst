==============
6.9.?Using X11
==============

.. raw:: html

   <div class="navheader">

6.9.?Using X11
`Prev <using-perl.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-gnome.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.?Using X11
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.1.?X.Org Components
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The X11 implementation available in The Ports Collection is X.Org. If
the application depends on X components, set ``USE_XORG`` to the list of
required components. Available components, at the time of writing, are:

``bigreqsproto compositeproto damageproto dmx       dmxproto dri2proto dri3proto evieproto fixesproto       fontcacheproto fontenc fontsproto fontutil glproto ice       inputproto kbproto libfs oldx pciaccess pixman presentproto       printproto randrproto recordproto renderproto resourceproto       scrnsaverproto sm trapproto videoproto x11 xau xaw xaw6 xaw7       xbitmaps xcb xcmiscproto xcomposite xcursor xdamage xdmcp       xevie xext xextproto xf86bigfontproto xf86dgaproto       xf86driproto xf86miscproto xf86rushproto xf86vidmodeproto       xfixes xfont xfontcache xft xi xinerama xineramaproto       xkbfile xkbui xmu xmuu xorg-macros xorg-server xp xpm       xprintapputil xprintutil xproto xproxymngproto xrandr       xrender xres xscrnsaver xshmfence xt xtrans xtrap xtst xv       xvmc xxf86dga xxf86misc xxf86vm``.

Always up-to-date list can be found in ``/usr/ports/Mk/bsd.xorg.mk``.

The Mesa Project is an effort to provide free OpenGL implementation. To
specify a dependency on various components of this project, use
``USE_GL``. Valid options are: ``egl, gl, glesv2, glew, glu, glut, glw``
and ``linux``. For backwards compatibility, the value of ``yes`` maps to
``glu``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.3.?\ ``USE_XORG`` Example

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    USE_XORG=   xrender xft xkbfile xt xaw
    USE_GL=     glu

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.6.?Variables for Ports That Use X

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------+----------------------------------------------------------------------------------+
| ``USES= imake``   | The port uses ``imake``.                                                         |
+-------------------+----------------------------------------------------------------------------------+
| ``XMKMF``         | Set to the path of ``xmkmf`` if not in the ``PATH``. Defaults to ``xmkmf -a``.   |
+-------------------+----------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.4.?Using X11-Related Variables

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    # Use some X11 libraries
    USE_XORG=   x11 xpm

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.2.?Ports That Require Motif
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port requires a Motif library, define ``USES= motif`` in the
``Makefile``. Default Motif implementation is
`x11-toolkits/open-motif <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/open-motif/pkg-descr>`__.
Users can choose
`x11-toolkits/lesstif <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/lesstif/pkg-descr>`__
instead by setting ``WANT_LESSTIF`` in their ``make.conf``.

``MOTIFLIB`` will be set by ``motif.mk`` to reference the appropriate
Motif library. Please patch the source of the port to use
``${MOTIFLIB}`` wherever the Motif library is referenced in the original
``Makefile`` or ``Imakefile``.

There are two common cases:

.. raw:: html

   <div class="itemizedlist">

-  If the port refers to the Motif library as ``-lXm`` in its
   ``Makefile`` or ``Imakefile``, substitute ``${MOTIFLIB}`` for it.

-  If the port uses ``XmClientLibs`` in its ``Imakefile``, change it to
   ``${MOTIFLIB} ${XTOOLLIB}           ${XLIB}``.

.. raw:: html

   </div>

Note that ``MOTIFLIB`` (usually) expands to
``-L/usr/local/lib -lXm -lXp`` or ``/usr/local/lib/libXm.a``, so there
is no need to add ``-L`` or ``-l`` in front.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.3.?X11 Fonts
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port installs fonts for the X Window System, put them in
``LOCALBASE/lib/X11/fonts/local``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.4.?Getting a Fake ``DISPLAY`` with Xvfb
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some applications require a working X11 display for compilation to
succeed. This pose a problem for machines that operate headless. When
this variable is used, the build infrastructure will start the virtual
framebuffer X server. The working ``DISPLAY`` is then passed to the
build. See ```USES=display`` <uses.html#uses-display>`__ for the
possible arguments.

.. code:: programlisting

    USES=    display

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.5.?Desktop Entries
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desktop entries (`a Freedesktop
standard <http://standards.freedesktop.org/desktop-entry-spec/latest/>`__)
provide a way to automatically adjust desktop features when a new
program is installed, without requiring user intervention. For example,
newly-installed programs automatically appear in the application menus
of compatible desktop environments. Desktop entries originated in the
GNOME desktop environment, but are now a standard and also work with KDE
and Xfce. This bit of automation provides a real benefit to the user,
and desktop entries are encouraged for applications which can be used in
a desktop environment.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.5.1.?Using Predefined ``.desktop`` Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ports that include predefined ``*``.desktop must include those files in
``pkg-plist`` and install them in the ``$LOCALBASE/share/applications``
directory. The ```INSTALL_DATA`` macro <install.html#install-macros>`__
is useful for installing these files.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.5.2.?Updating Desktop Database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If a port has a MimeType entry in its ``portname``.desktop, the desktop
database must be updated after install and deinstall. To do this, define
``USES``\ = desktop-file-utils.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.5.3.?Creating Desktop Entries with ``DESKTOP_ENTRIES``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desktop entries can be easily created for applications by using
``DESKTOP_ENTRIES``. A file named ``name``.desktop will be created,
installed, and added to ``pkg-plist`` automatically. Syntax is:

.. code:: programlisting

    DESKTOP_ENTRIES=   "NAME" "COMMENT" "ICON" "COMMAND" "CATEGORY" StartupNotify

The list of possible categories is available on the `Freedesktop
website <http://standards.freedesktop.org/menu-spec/latest/apa.html>`__.
``StartupNotify`` indicates whether the application is compatible with
*startup notifications*. These are typically a graphic indicator like a
clock that appear at the mouse pointer, menu, or panel to give the user
an indication when a program is starting. A program that is compatible
with startup notifications clears the indicator after it has started.
Programs that are not compatible with startup notifications would never
clear the indicator (potentially confusing and infuriating the user),
and must have ``StartupNotify`` set to ``false`` so the indicator is not
shown at all.

Example:

.. code:: programlisting

    DESKTOP_ENTRIES=   "ToME" "Roguelike game based on JRR Tolkien's work" \
                "${DATADIR}/xtra/graf/tome-128.png" \
                "tome -v -g" "Application;Game;RolePlaying;" \
                false

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+----------------------------------+
| `Prev <using-perl.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-gnome.html>`__   |
+-------------------------------+-------------------------+----------------------------------+
| 6.8.?Using Perl?              | `Home <index.html>`__   | ?6.10.?Using GNOME               |
+-------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
