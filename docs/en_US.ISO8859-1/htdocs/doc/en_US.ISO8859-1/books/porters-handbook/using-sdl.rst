===============
6.19.?Using SDL
===============

.. raw:: html

   <div class="navheader">

6.19.?Using SDL
`Prev <using-ruby.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-wx.html>`__

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

6.19.?Using SDL
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``USE_SDL`` is used to autoconfigure the dependencies for ports which
use an SDL based library like
`devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__
and
`graphics/sdl\_image <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl_image/pkg-descr>`__.

These SDL libraries for version 1.2 are recognized:

.. raw:: html

   <div class="itemizedlist">

-  sdl:
   `devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__

-  console:
   `devel/sdl\_console <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl_console/pkg-descr>`__

-  gfx:
   `graphics/sdl\_gfx <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl_gfx/pkg-descr>`__

-  image:
   `graphics/sdl\_image <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl_image/pkg-descr>`__

-  mixer:
   `audio/sdl\_mixer <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_mixer/pkg-descr>`__

-  mm:
   `devel/sdlmm <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdlmm/pkg-descr>`__

-  net:
   `net/sdl\_net <http://www.freebsd.org/cgi/url.cgi?ports/net/sdl_net/pkg-descr>`__

-  pango:
   `x11-toolkits/sdl\_pango <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/sdl_pango/pkg-descr>`__

-  sound:
   `audio/sdl\_sound <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_sound/pkg-descr>`__

-  ttf:
   `graphics/sdl\_ttf <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl_ttf/pkg-descr>`__

.. raw:: html

   </div>

These SDL libraries for version 2.0 are recognized:

.. raw:: html

   <div class="itemizedlist">

-  sdl:
   `devel/sdl20 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl20/pkg-descr>`__

-  gfx:
   `graphics/sdl2\_gfx <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl2_gfx/pkg-descr>`__

-  image:
   `graphics/sdl2\_image <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl2_image/pkg-descr>`__

-  mixer:
   `audio/sdl2\_mixer <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl2_mixer/pkg-descr>`__

-  net:
   `net/sdl2\_net <http://www.freebsd.org/cgi/url.cgi?ports/net/sdl2_net/pkg-descr>`__

-  ttf:
   `graphics/sdl2\_ttf <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl2_ttf/pkg-descr>`__

.. raw:: html

   </div>

Therefore, if a port has a dependency on
`net/sdl\_net <http://www.freebsd.org/cgi/url.cgi?ports/net/sdl_net/pkg-descr>`__
and
`audio/sdl\_mixer <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_mixer/pkg-descr>`__,
the syntax will be:

.. code:: programlisting

    USE_SDL=   net mixer

The dependency
`devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__,
which is required by
`net/sdl\_net <http://www.freebsd.org/cgi/url.cgi?ports/net/sdl_net/pkg-descr>`__
and
`audio/sdl\_mixer <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_mixer/pkg-descr>`__,
is automatically added as well.

Using ``USE_SDL`` with entries for SDL 1.2, it will automatically:

.. raw:: html

   <div class="itemizedlist">

-  Add a dependency on sdl12-config to ``BUILD_DEPENDS``

-  Add the variable ``SDL_CONFIG`` to ``CONFIGURE_ENV``

-  Add the dependencies of the selected libraries to ``LIB_DEPENDS``

.. raw:: html

   </div>

Using ``USE_SDL`` with entries for SDL 2.0, it will automatically:

.. raw:: html

   <div class="itemizedlist">

-  Add a dependency on sdl2-config to ``BUILD_DEPENDS``

-  Add the variable ``SDL2_CONFIG`` to ``CONFIGURE_ENV``

-  Add the dependencies of the selected libraries to ``LIB_DEPENDS``

.. raw:: html

   </div>

To check whether an SDL library is available, use ``WANT_SDL``:

.. code:: programlisting

    WANT_SDL=   yes

    .include <bsd.port.pre.mk>

    .if ${HAVE_SDL:Mmixer}!=""
    USE_SDL+=   mixer
    .endif

    .include <bsd.port.post.mk>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+-------------------------------+
| `Prev <using-ruby.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-wx.html>`__   |
+-------------------------------+-------------------------+-------------------------------+
| 6.18.?Using Ruby?             | `Home <index.html>`__   | ?6.20.?Using wxWidgets        |
+-------------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
