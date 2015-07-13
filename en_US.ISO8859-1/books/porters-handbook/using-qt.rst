==============
6.11.?Using Qt
==============

.. raw:: html

   <div class="navheader">

6.11.?Using Qt
`Prev <using-gnome.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-kde.html>`__

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

6.11.?Using Qt
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

6.11.1.?Ports That Require Qt
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Ports Collection provides support for Qt 4 and Qt 5 frameworks with
``USE_QTx``, where *``x``* is ``4`` or ``5``. Set ``USE_QTx`` to the
list of required Qt components (libraries, tools, plugins). The Qt 4 and
Qt 5 frameworks are quite similar. The main difference is the set of
supported components.

The Qt framework exports a number of variables which can be used by
ports, some of them listed below:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.7.?Variables Provided to Ports That Use Qt

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+--------------------------------------------------------------+
| ``QT_PREFIX``      | Set to the path where Qt was installed (``${LOCALBASE}``).   |
+--------------------+--------------------------------------------------------------+
| ``QMAKE``          | Full path to ``qmake`` binary.                               |
+--------------------+--------------------------------------------------------------+
| ``LRELEASE``       | Full path to ``lrelease`` utility.                           |
+--------------------+--------------------------------------------------------------+
| ``MOC``            | Full path to ``moc``.                                        |
+--------------------+--------------------------------------------------------------+
| ``RCC``            | Full path to ``rcc``.                                        |
+--------------------+--------------------------------------------------------------+
| ``UIC``            | Full path to ``uic``.                                        |
+--------------------+--------------------------------------------------------------+
| ``QT_INCDIR``      | Qt include directory.                                        |
+--------------------+--------------------------------------------------------------+
| ``QT_LIBDIR``      | Qt libraries path.                                           |
+--------------------+--------------------------------------------------------------+
| ``QT_PLUGINDIR``   | Qt plugins path.                                             |
+--------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

When using the Qt framework, these settings are deployed:

.. code:: programlisting

    CONFIGURE_ARGS+=  --with-qt-includes=${QT_INCDIR} \
                --with-qt-libraries=${QT_LIBDIR} \
                --with-extra-libs=${LOCALBASE}/lib \
                --with-extra-includes=${LOCALBASE}/include

    CONFIGURE_ENV+= QTDIR="${QT_PREFIX}" QMAKE="${QMAKE}" \
            MOC="${MOC}" RCC="${RCC}" UIC="${UIC}" \
            QMAKESPEC="${QMAKESPEC}"

    PLIST_SUB+= QT_INCDIR=${QT_INCDIR_REL} \
            QT_LIBDIR=${QT_LIBDIR_REL} \
            QT_PLUGINDIR=${QT_PLUGINDIR_REL}

Some configure scripts do not support the arguments above. To suppress
modification of\ ``CONFIGURE_ENV`` and ``CONFIGURE_ARGS``, set
``QT_NONSTANDARD``.

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

6.11.2.?Component Selection
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Individual Qt tool and library dependencies must be specified in
``USE_QTx``. Every component can be suffixed with ``_build`` or
``_run``, the suffix indicating whether the dependency on the component
is at buildtime or runtime. If unsuffixed, the component will be
depended on at both build- and runtime. Usually, library components are
specified unsuffixed, tool components are mostly specified with the
``_build`` suffix and plugin components are specified with the ``_run``
suffix. The most commonly used components are listed below (all
available components are listed in ``_USE_QT_ALL``, ``_USE_QT4_ONLY``,
and ``_USE_QT5_ONLY`` in ``/usr/ports/Mk/bsd.qt.mk``):

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.8.?Available Qt Library Components

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------+------------------------------------+
| Name          | Description                        |
+===============+====================================+
| ``core``      | core library (Qt 5 only)           |
+---------------+------------------------------------+
| ``corelib``   | core library (Qt 4 only)           |
+---------------+------------------------------------+
| ``dbus``      | Qt DBus library                    |
+---------------+------------------------------------+
| ``gui``       | graphical user interface library   |
+---------------+------------------------------------+
| ``network``   | network library                    |
+---------------+------------------------------------+
| ``opengl``    | Qt OpenGL library                  |
+---------------+------------------------------------+
| ``script``    | script library                     |
+---------------+------------------------------------+
| ``sql``       | SQL library                        |
+---------------+------------------------------------+
| ``testlib``   | unit testing library               |
+---------------+------------------------------------+
| ``webkit``    | Qt WebKit library                  |
+---------------+------------------------------------+
| ``xml``       | Qt XML library                     |
+---------------+------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

To determine the libraries an application depends on, run ``ldd`` on the
main executable after a successful compilation.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.9.?Available Qt Tool Components

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Name                | Description                                                                                                                              |
+=====================+==========================================================================================================================================+
| ``qmake``           | Makefile generator/build utility                                                                                                         |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ``buildtools``      | build tools (``moc``, ``rcc``), needed for almost every Qt application (Qt 5 only)                                                       |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ``linguisttools``   | localization tools: ``lrelease``, ``lupdate`` (Qt 5 only)                                                                                |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ``linguist``        | localization tools: ``lrelease``, ``lupdate`` (Qt 4 only)                                                                                |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ``moc``             | meta object compiler, needed for almost every Qt application at buildtime (Qt 4 only)                                                    |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ``rcc``             | resource compiler, needed if the application comes with ``*.rc`` or ``*.qrc`` files (Qt 4 only)                                          |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ``uic``             | user interface compiler, needed if the application comes with ``*.ui`` files, in practice, every Qt application with a GUI (Qt 4 only)   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.10.?Available Qt Plugin Components

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+---------------------------------------------------------------------------------+
| Name               | Description                                                                     |
+====================+=================================================================================+
| ``iconengines``    | SVG icon engine plugin, needed if the application ships SVG icons (Qt 4 only)   |
+--------------------+---------------------------------------------------------------------------------+
| ``imageformats``   | plugins for TGA, TIFF, and MNG image formats                                    |
+--------------------+---------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.5.?Selecting Qt 4 Components

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

In this example, the ported application uses the Qt 4 graphical user
interface library, the Qt 4 core library, all of the Qt 4 code
generation tools and Qt 4's Makefile generator. Since the ``gui``
library implies a dependency on the core library, ``corelib`` does not
need to be specified. The Qt 4 code generation tools ``moc``, ``uic``
and ``rcc``, as well as the Makefile generator ``qmake`` are only needed
at buildtime, thus they are specified with the ``_build`` suffix:

.. code:: programlisting

    USE_QT4=   gui moc_build qmake_build rcc_build uic_build

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

6.11.3.?Using ``qmake``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the application provides a qmake project file (``*.pro``), define
``USES= qmake`` along with ``USE_QTx``. Note that ``USES= qmake``
already implies a build dependency on qmake, therefore the qmake
component can be omitted from ``USE_QTx``. Similar to
`CMake <building.html#using-cmake>`__, qmake supports out-of-source
builds, which can be enabled by specifying the ``outsource`` argument
(see ```USES= qmake`` example <using-qt.html#using-qmake-example>`__).

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.11.?Variables for Ports That Use ``qmake``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------+---------------------------------------------------------------------------------------------------------------------------------+
| Variable                | Means                                                                                                                           |
+=========================+=================================================================================================================================+
| ``QMAKE_ARGS``          | Port specific qmake flags to be passed to the ``qmake`` binary.                                                                 |
+-------------------------+---------------------------------------------------------------------------------------------------------------------------------+
| ``QMAKE_ENV``           | Environment variables to be set for the ``qmake`` binary. The default is ``${CONFIGURE_ENV}``.                                  |
+-------------------------+---------------------------------------------------------------------------------------------------------------------------------+
| ``QMAKE_SOURCE_PATH``   | Path to qmake project files (``.pro``). The default is ``${WRKSRC}`` if an out-of-source build is requested, empty otherwise.   |
+-------------------------+---------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.6.?\ ``USES= qmake`` Example

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This snippet demonstrates the use of qmake for a Qt 4 port:

.. code:: programlisting

    USES=      qmake:outsource
    USE_QT4=    moc_build

For a Qt 5 port:

.. code:: programlisting

    USES=     qmake:outsource
    USE_QT5=    buildtools_build

.. raw:: html

   </div>

.. raw:: html

   </div>

Qt applications are often written to be cross-platform and often
X11/Unix is not the platform they are developed on, which in turn leads
to certain loose ends, like:

.. raw:: html

   <div class="itemizedlist">

-  *Missing additional include paths.* Many applications come with
   system tray icon support, but neglect to look for includes and/or
   libraries in the X11 directories. To add directories to ``qmake``'s
   include and library search paths via the command line, use:

   .. code:: programlisting

       QMAKE_ARGS+=  INCLUDEPATH+=${LOCALBASE}/include \
               LIBS+=-L${LOCALBASE}/lib

-  *Bogus installation paths.* Sometimes data such as icons or .desktop
   files are by default installed into directories which are not scanned
   by XDG-compatible applications.
   `editors/texmaker <http://www.freebsd.org/cgi/url.cgi?ports/editors/texmaker/pkg-descr>`__
   is an example for this - look at ``patch-texmaker.pro`` in the
   ``files`` directory of that port for a template on how to remedy this
   directly in the ``qmake`` project file.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+--------------------------------+
| `Prev <using-gnome.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-kde.html>`__   |
+--------------------------------+-------------------------+--------------------------------+
| 6.10.?Using GNOME?             | `Home <index.html>`__   | ?6.12.?Using KDE               |
+--------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
