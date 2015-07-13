=====================
6.20.?Using wxWidgets
=====================

.. raw:: html

   <div class="navheader">

6.20.?Using wxWidgets
`Prev <using-sdl.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-lua.html>`__

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

6.20.?Using wxWidgets
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes the status of the wxWidgets libraries in the
ports tree and its integration with the ports system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.20.1.?Introduction
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are many versions of the wxWidgets libraries which conflict
between them (install files under the same name). In the ports tree this
problem has been solved by installing each version under a different
name using version number suffixes.

The obvious disadvantage of this is that each application has to be
modified to find the expected version. Fortunately, most of the
applications call the ``wx-config`` script to determine the necessary
compiler and linker flags. The script is named differently for every
available version. Majority of applications respect an environment
variable, or accept a configure argument, to specify which ``wx-config``
script to call. Otherwise they have to be patched.

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

6.20.2.?Version Selection
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To make the port use a specific version of wxWidgets there are two
variables available for defining (if only one is defined the other will
be set to a default value):

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.23.?Variables to Select wxWidgets Versions

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+----------------------------------------+--------------------------+
| Variable         | Description                            | Default value            |
+==================+========================================+==========================+
| ``USE_WX``       | List of versions the port can use      | All available versions   |
+------------------+----------------------------------------+--------------------------+
| ``USE_WX_NOT``   | List of versions the port cannot use   | None                     |
+------------------+----------------------------------------+--------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

The available wxWidgets versions and the corresponding ports in the tree
are:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.24.?Available wxWidgets Versions

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------+------------------------------------------------------------------------------------------------------+
| Version   | Port                                                                                                 |
+===========+======================================================================================================+
| ``2.4``   | `x11-toolkits/wxgtk24 <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/wxgtk24/pkg-descr>`__   |
+-----------+------------------------------------------------------------------------------------------------------+
| ``2.6``   | `x11-toolkits/wxgtk26 <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/wxgtk26/pkg-descr>`__   |
+-----------+------------------------------------------------------------------------------------------------------+
| ``2.8``   | `x11-toolkits/wxgtk28 <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/wxgtk28/pkg-descr>`__   |
+-----------+------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The versions starting from ``2.5`` also come in Unicode version and are
installed by a slave port named like the normal one plus a ``-unicode``
suffix, but this can be handled with variables (see `Section?6.20.4,
“Unicode” <using-wx.html#wx-unicode>`__).

.. raw:: html

   </div>

The variables in `Table?6.23, “Variables to Select wxWidgets
Versions” <using-wx.html#wx-ver-sel-table>`__ can be set to one or more
of these combinations separated by spaces:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.25.?wxWidgets Version Specifications

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------------------+---------------+
| Description                      | Example       |
+==================================+===============+
| Single version                   | ``2.4``       |
+----------------------------------+---------------+
| Ascending range                  | ``2.4+``      |
+----------------------------------+---------------+
| Descending range                 | ``2.6-``      |
+----------------------------------+---------------+
| Full range (must be ascending)   | ``2.4-2.6``   |
+----------------------------------+---------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

There are also some variables to select the preferred versions from the
available ones. They can be set to a list of versions, the first ones
will have higher priority.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.26.?Variables to Select Preferred wxWidgets Versions

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------+----------------+
| Name              | Designed for   |
+===================+================+
| ``WANT_WX_VER``   | the port       |
+-------------------+----------------+
| ``WITH_WX_VER``   | the user       |
+-------------------+----------------+

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

6.20.3.?Component Selection
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are other applications that, while not being wxWidgets libraries,
are related to them. These applications can be specified in
``WX_COMPS``. These components are available:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.27.?Available wxWidgets Components

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------+------------------------------+-----------------------+
| Name          | Description                  | Version restriction   |
+===============+==============================+=======================+
| ``wx``        | main library                 | none                  |
+---------------+------------------------------+-----------------------+
| ``contrib``   | contributed libraries        | ``none``              |
+---------------+------------------------------+-----------------------+
| ``python``    | wxPython (Python bindings)   | ``2.4-2.6``           |
+---------------+------------------------------+-----------------------+
| ``mozilla``   | wxMozilla                    | ``2.4``               |
+---------------+------------------------------+-----------------------+
| ``svg``       | wxSVG                        | ``2.6``               |
+---------------+------------------------------+-----------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

The dependency type can be selected for each component by adding a
suffix separated by a semicolon. If not present then a default type will
be used (see `Table?6.29, “Default wxWidgets Dependency
Types” <using-wx.html#wx-def-dep-types>`__). These types are available:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.28.?Available wxWidgets Dependency Types

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+---------------------------------------------------------------------------------+
| Name        | Description                                                                     |
+=============+=================================================================================+
| ``build``   | Component is required for building, equivalent to ``BUILD_DEPENDS``             |
+-------------+---------------------------------------------------------------------------------+
| ``run``     | Component is required for running, equivalent to ``RUN_DEPENDS``                |
+-------------+---------------------------------------------------------------------------------+
| ``lib``     | Component is required for building and running, equivalent to ``LIB_DEPENDS``   |
+-------------+---------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

The default values for the components are detailed in this table:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.29.?Default wxWidgets Dependency Types

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------+-------------------+
| Component     | Dependency type   |
+===============+===================+
| ``wx``        | ``lib``           |
+---------------+-------------------+
| ``contrib``   | ``lib``           |
+---------------+-------------------+
| ``python``    | ``run``           |
+---------------+-------------------+
| ``mozilla``   | ``lib``           |
+---------------+-------------------+
| ``svg``       | ``lib``           |
+---------------+-------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.11.?Selecting wxWidgets Components

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This fragment corresponds to a port which uses wxWidgets version ``2.4``
and its contributed libraries.

.. code:: programlisting

    USE_WX=     2.4
    WX_COMPS=   wx contrib

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

6.20.4.?Unicode
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The wxWidgets library supports Unicode since version ``2.5``. In the
ports tree both versions are available and can be selected with these
variables:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.30.?Variables to Select Unicode in wxWidgets Versions

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+------------------------------------------------------------------------------------------+----------------+
| Variable              | Description                                                                              | Designed for   |
+=======================+==========================================================================================+================+
| ``WX_UNICODE``        | The port works *only* with the Unicode version                                           | the port       |
+-----------------------+------------------------------------------------------------------------------------------+----------------+
| ``WANT_UNICODE``      | The port works with both versions but prefers the Unicode one                            | the port       |
+-----------------------+------------------------------------------------------------------------------------------+----------------+
| ``WITH_UNICODE``      | The port will use the Unicode version                                                    | the user       |
+-----------------------+------------------------------------------------------------------------------------------+----------------+
| ``WITHOUT_UNICODE``   | The port will use the normal version if supported (when ``WX_UNICODE`` is not defined)   | the user       |
+-----------------------+------------------------------------------------------------------------------------------+----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Do not use ``WX_UNICODE`` for ports that can use both Unicode and normal
versions. If the port needs to use Unicode by default, define
``WANT_UNICODE`` instead.

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

6.20.5.?Detecting Installed Versions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To detect an installed version, define ``WANT_WX``. If it is not set to
a specific version then the components will have a version suffix.
``HAVE_WX`` will be filled after detection.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.12.?Detecting Installed wxWidgets Versions and Components

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This fragment can be used in a port that uses wxWidgets if it is
installed, or an option is selected.

.. code:: programlisting

    WANT_WX= yes

    .include <bsd.port.pre.mk>

    .if defined(WITH_WX) || !empty(PORT_OPTIONS:MWX) || !empty(HAVE_WX:Mwx-2.4)
    USE_WX=         2.4
    CONFIGURE_ARGS+=    --enable-wx
    .endif

This fragment can be used in a port that enables wxPython support if it
is installed or if an option is selected, in addition to wxWidgets, both
version ``2.6``.

.. code:: programlisting

    USE_WX=      2.6
    WX_COMPS=   wx
    WANT_WX=    2.6

    .include <bsd.port.pre.mk>

    .if defined(WITH_WXPYTHON) || !empty(PORT_OPTIONS:MWXPYTHON) || !empty(HAVE_WX:Mpython)
    WX_COMPS+=      python
    CONFIGURE_ARGS+=    --enable-wxpython
    .endif

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

6.20.6.?Defined Variables
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These variables are available in the port (after defining one from
`Table?6.23, “Variables to Select wxWidgets
Versions” <using-wx.html#wx-ver-sel-table>`__).

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.31.?Variables Defined for Ports That Use wxWidgets

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+--------------------------------------------------------------------------+
| Name             | Description                                                              |
+==================+==========================================================================+
| ``WX_CONFIG``    | The path to the wxWidgets ``wx-config`` script (with different name)     |
+------------------+--------------------------------------------------------------------------+
| ``WXRC_CMD``     | The path to the wxWidgets ``wxrc`` program (with different name)         |
+------------------+--------------------------------------------------------------------------+
| ``WX_VERSION``   | The wxWidgets version that is going to be used (for example, ``2.6``)    |
+------------------+--------------------------------------------------------------------------+
| ``WX_UNICODE``   | If not defined but Unicode is going to be used then it will be defined   |
+------------------+--------------------------------------------------------------------------+

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

6.20.7.?Processing in ``bsd.port.pre.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Define ``WX_PREMK`` to be able to use the variables right after
including ``bsd.port.pre.mk``.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

When defining ``WX_PREMK``, then the version, dependencies, components
and defined variables will not change if modifying the wxWidgets port
variables *after* including ``bsd.port.pre.mk``.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.13.?Using wxWidgets Variables in Commands

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This fragment illustrates the use of ``WX_PREMK`` by running the
``wx-config`` script to obtain the full version string, assign it to a
variable and pass it to the program.

.. code:: programlisting

    USE_WX=       2.4
    WX_PREMK=   yes

    .include <bsd.port.pre.mk>

    .if exists(${WX_CONFIG})
    VER_STR!=   ${WX_CONFIG} --release

    PLIST_SUB+= VERSION="${VER_STR}"
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The wxWidgets variables can be safely used in commands when they are
inside targets without the need of ``WX_PREMK``.

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

6.20.8.?Additional ``configure`` Arguments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some GNU ``configure`` scripts cannot find wxWidgets with just the
``WX_CONFIG`` environment variable set, requiring additional arguments.
``WX_CONF_ARGS`` can be used for provide them.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.32.?Legal Values for ``WX_CONF_ARGS``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+------------------------------------------------------------------------+
| Possible value   | Resulting argument                                                     |
+==================+========================================================================+
| ``absolute``     | ``--with-wx-config=${WX_CONFIG}``                                      |
+------------------+------------------------------------------------------------------------+
| ``relative``     | ``--with-wx=${LOCALBASE}           --with-wx-config=${WX_CONFIG:T}``   |
+------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+--------------------------------+
| `Prev <using-sdl.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-lua.html>`__   |
+------------------------------+-------------------------+--------------------------------+
| 6.19.?Using SDL?             | `Home <index.html>`__   | ?6.21.?Using Lua               |
+------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
