================
6.23.?Using Xfce
================

.. raw:: html

   <div class="navheader">

6.23.?Using Xfce
`Prev <using-iconv.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-mozilla.html>`__

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

6.23.?Using Xfce
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ports that need Xfce libraries or applications set ``USES=xfce``.

Specific Xfce library and application dependencies are set with values
assigned to ``USE_XFCE``. They are defined in
``/usr/ports/Mk/Uses/xfce.mk``. The possible values are:

.. raw:: html

   <div class="variablelist">

.. raw:: html

   <div class="variablelist-title">

Values of ``USE_XFCE``

.. raw:: html

   </div>

garcon
    `sysutils/garcon <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/garcon/pkg-descr>`__

libexo
    `x11/libexo <http://www.freebsd.org/cgi/url.cgi?ports/x11/libexo/pkg-descr>`__

libgui
    `x11-toolkits/libxfce4gui <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/libxfce4gui/pkg-descr>`__

libmenu
    `x11/libxfce4menu <http://www.freebsd.org/cgi/url.cgi?ports/x11/libxfce4menu/pkg-descr>`__

libutil
    `x11/libxfce4util <http://www.freebsd.org/cgi/url.cgi?ports/x11/libxfce4util/pkg-descr>`__

panel
    `x11-wm/xfce4-panel <http://www.freebsd.org/cgi/url.cgi?ports/x11-wm/xfce4-panel/pkg-descr>`__

thunar
    `x11-fm/thunar <http://www.freebsd.org/cgi/url.cgi?ports/x11-fm/thunar/pkg-descr>`__

xfconf
    `x11/xfce4-conf <http://www.freebsd.org/cgi/url.cgi?ports/x11/xfce4-conf/pkg-descr>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.18.?\ ``USES=xfce`` Example

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    USES=     xfce
    USE_XFCE=   libmenu

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.19.?Using Xfce's Own GTK3 Widgets

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

In this example, the ported application uses the GTK3-specific widgets
`x11/libxfce4menu <http://www.freebsd.org/cgi/url.cgi?ports/x11/libxfce4menu/pkg-descr>`__
and
`x11/xfce4-conf <http://www.freebsd.org/cgi/url.cgi?ports/x11/xfce4-conf/pkg-descr>`__.

.. code:: programlisting

    USES=        xfce:gtk3
    USE_XFCE=   libmenu xfconf

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Xfce components included this way will automatically include any
dependencies they need. It is no longer necessary to specify the entire
list. If the port only needs
`x11-wm/xfce4-panel <http://www.freebsd.org/cgi/url.cgi?ports/x11-wm/xfce4-panel/pkg-descr>`__,
use:

.. code:: programlisting

    USES=     xfce
    USE_XFCE=   panel

There is no need to list the components
`x11-wm/xfce4-panel <http://www.freebsd.org/cgi/url.cgi?ports/x11-wm/xfce4-panel/pkg-descr>`__
needs itself like this:

.. code:: programlisting

    USES=     xfce
    USE_XFCE=   libexo libmenu libutil panel

However, Xfce components and non-Xfce dependencies of the port must be
included explicitly. Do not count on an Xfce component to provide a
sub-dependency other than itself for the main port.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+------------------------------------+
| `Prev <using-iconv.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-mozilla.html>`__   |
+--------------------------------+-------------------------+------------------------------------+
| 6.22.?Using ``iconv``?         | `Home <index.html>`__   | ?6.24.?Using Mozilla               |
+--------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
