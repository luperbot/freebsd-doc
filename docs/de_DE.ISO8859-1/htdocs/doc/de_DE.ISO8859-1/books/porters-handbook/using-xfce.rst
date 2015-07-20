====================
6.20. Xfce verwenden
====================

.. raw:: html

   <div class="navheader">

6.20. Xfce verwenden
`Zur?ck <using-lua.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-mozilla.html>`__

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

6.20. Xfce verwenden
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die ``USE_XFCE``-Variable wird f?r die automatische Konfiguration der
Abh?ngigkeiten eingesetzt, welche die Xfce-Basisbibliotheken oder
Anwendungen wie
`x11-toolkits/libxfce4gui <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/libxfce4gui/pkg-descr>`__
und
`x11-wm/xfce4-panel <http://www.freebsd.org/cgi/url.cgi?ports/x11-wm/xfce4-panel/pkg-descr>`__
verwenden.

Die folgenden Xfce-Bibliotheken und -Anwendungen werden derzeit
unterst?tzt:

.. raw:: html

   <div class="itemizedlist">

-  libexo:
   `x11/libexo <http://www.freebsd.org/cgi/url.cgi?ports/x11/libexo/pkg-descr>`__

-  libgui:
   `x11-toolkits/libxfce4gui <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/libxfce4gui/pkg-descr>`__

-  libutil:
   `x11/libxfce4util <http://www.freebsd.org/cgi/url.cgi?ports/x11/libxfce4util/pkg-descr>`__

-  libmcs:
   `x11/libxfce4mcs <http://www.freebsd.org/cgi/url.cgi?ports/x11/libxfce4mcs/pkg-descr>`__

-  mcsmanager:
   `sysutils/xfce4-mcs-manager <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/xfce4-mcs-manager/pkg-descr>`__

-  panel:
   `x11-wm/xfce4-panel <http://www.freebsd.org/cgi/url.cgi?ports/x11-wm/xfce4-panel/pkg-descr>`__

-  thunar:
   `x11-fm/thunar <http://www.freebsd.org/cgi/url.cgi?ports/x11-fm/thunar/pkg-descr>`__

-  wm:
   `x11-wm/xfce4-wm <http://www.freebsd.org/cgi/url.cgi?ports/x11-wm/xfce4-wm/pkg-descr>`__

-  xfdev:
   `dev/xfce4-dev-tools <http://www.freebsd.org/cgi/url.cgi?ports/dev/xfce4-dev-tools/pkg-descr>`__

.. raw:: html

   </div>

Die folgenden zus?tzlichen Parameter werden unterst?tzt:

.. raw:: html

   <div class="itemizedlist">

-  configenv: Benutzen Sie dies, wenn Ihr Port eine speziell angepasste
   ``CONFIGURE_ENV``-Variable ben?tigt, um seine erforderlichen
   Bibliotheken zu finden.

   .. code:: programlisting

       -I${LOCALBASE}/include
               -L${LOCALBASE}/lib

   wird CPPFLAGS hinzugef?gt und ergibt ``CONFIGURE_ENV``.

.. raw:: html

   </div>

Wenn also ein Port von
`sysutils/xfce4-mcs-manager <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/xfce4-mcs-manager/pkg-descr>`__
abh?ngt und die speziellen CPPFLAGS in seiner configure-Umgebung
verlangt, dann w?rde die Syntax wie folgt aussehen:

.. code:: programlisting

    USE_XFCE=        mcsmanager configenv

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+--------------------------------+--------------------------------------+
| `Zur?ck <using-lua.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-mozilla.html>`__   |
+--------------------------------+--------------------------------+--------------------------------------+
| 6.19. Verwendung von Lua?      | `Zum Anfang <index.html>`__    | ?6.21. Mozilla verwenden             |
+--------------------------------+--------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
