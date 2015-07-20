===================
6.17. SDL verwenden
===================

.. raw:: html

   <div class="navheader">

6.17. SDL verwenden
`Zur?ck <using-ruby.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-wx.html>`__

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

6.17. SDL verwenden
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variable ``USE_SDL`` wird f?r die automatische Konfiguration der
Abh?ngigkeiten f?r Ports benutzt, die auf SDL basierende Bibliotheken
wie
`devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__
und
`x11-toolkits/sdl\_gui <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/sdl_gui/pkg-descr>`__
verwenden.

Die folgenden SDL-Bibliotheken sind derzeit bekannt:

.. raw:: html

   <div class="itemizedlist">

-  sdl:
   `devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__

-  gfx:
   `graphics/sdl\_gfx <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl_gfx/pkg-descr>`__

-  gui:
   `x11-toolkits/sdl\_gui <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/sdl_gui/pkg-descr>`__

-  image:
   `graphics/sdl\_image <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl_image/pkg-descr>`__

-  ldbad:
   `devel/sdl\_ldbad <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl_ldbad/pkg-descr>`__

-  mixer:
   `audio/sdl\_mixer <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_mixer/pkg-descr>`__

-  mm:
   `devel/sdlmm <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdlmm/pkg-descr>`__

-  net:
   `net/sdl\_net <http://www.freebsd.org/cgi/url.cgi?ports/net/sdl_net/pkg-descr>`__

-  sound:
   `audio/sdl\_sound <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_sound/pkg-descr>`__

-  ttf:
   `graphics/sdl\_ttf <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sdl_ttf/pkg-descr>`__

.. raw:: html

   </div>

Falls ein Port z.B. von
`net/sdl\_net <http://www.freebsd.org/cgi/url.cgi?ports/net/sdl_net/pkg-descr>`__
und
`audio/sdl\_mixer <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_mixer/pkg-descr>`__
abh?ngt, so w?re die Syntax:

.. code:: programlisting

    USE_SDL=        net mixer

Die Abh?ngigkeit von
`devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__,
die durch
`net/sdl\_net <http://www.freebsd.org/cgi/url.cgi?ports/net/sdl_net/pkg-descr>`__
und
`audio/sdl\_mixer <http://www.freebsd.org/cgi/url.cgi?ports/audio/sdl_mixer/pkg-descr>`__
entsteht, wird automatisch zum Port hinzugef?gt.

Falls ``USE_SDL`` im Port verwendet wird, so wird automatisch:

.. raw:: html

   <div class="itemizedlist">

-  die Abh?ngigkeit von sdl12-config zu ``BUILD_DEPENDS`` hinzugef?gt

-  die Variable ``SDL_CONFIG`` zu ``CONFIGURE_ENV`` hinzugef?gt

-  die Abh?ngigkeit der ausgew?hlten Bibliotheken zu ``LIB_DEPENDS``
   hinzugef?gt

.. raw:: html

   </div>

Um zu ?berpr?fen, ob die SDL-Bibliotheken verf?gbar sind, kann die
Variable ``WANT_SDL`` verwendet werden:

.. code:: programlisting

    WANT_SDL=yes

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

+---------------------------------+--------------------------------+---------------------------------+
| `Zur?ck <using-ruby.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-wx.html>`__   |
+---------------------------------+--------------------------------+---------------------------------+
| 6.16. Ruby benutzen?            | `Zum Anfang <index.html>`__    | ?6.18. wxWidgets verwenden      |
+---------------------------------+--------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
