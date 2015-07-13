=================
5.8.?Dependencies
=================

.. raw:: html

   <div class="navheader">

5.8.?Dependencies
`Prev <makefile-portscout.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-masterdir.html>`__

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

5.8.?Dependencies
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many ports depend on other ports. This is a very convenient feature of
most Unix-like operating systems, including FreeBSD. Multiple ports can
share a common dependency, rather than bundling that dependency with
every port or package that needs it. There are seven variables that can
be used to ensure that all the required bits will be on the user's
machine. There are also some pre-supported dependency variables for
common cases, plus a few more to control the behavior of dependencies.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.8.1.?\ ``LIB_DEPENDS``
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable specifies the shared libraries this port depends on. It is
a list of *``lib``*:*``dir``* tuples where *``lib``* is the name of the
shared library, *``dir``* is the directory in which to find it in case
it is not available. For example,

.. code:: programlisting

    LIB_DEPENDS=   libjpeg.so:${PORTSDIR}/graphics/jpeg

will check for a shared jpeg library with any version, and descend into
the ``graphics/jpeg`` subdirectory of the ports tree to build and
install it if it is not found.

The dependency is checked twice, once from within the ``build`` target
and then from within the ``install`` target. Also, the name of the
dependency is put into the package so that ``pkg install`` (see
`pkg-install(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-install&sektion=8>`__)
will automatically install it if it is not on the user's system.

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

5.8.2.?\ ``RUN_DEPENDS``
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable specifies executables or files this port depends on during
run-time. It is a list of *``path``*:*``dir``*\ [:*``target``*] tuples
where *``path``* is the name of the executable or file, *``dir``* is the
directory in which to find it in case it is not available, and
*``target``* is the target to call in that directory. If *``path``*
starts with a slash (``/``), it is treated as a file and its existence
is tested with ``test -e``; otherwise, it is assumed to be an
executable, and ``which -s`` is used to determine if the program exists
in the search path.

For example,

.. code:: programlisting

    RUN_DEPENDS=   ${LOCALBASE}/news/bin/innd:${PORTSDIR}/news/inn \
            xmlcatmgr:${PORTSDIR}/textproc/xmlcatmgr

will check if the file or directory ``/usr/local/news/bin/innd`` exists,
and build and install it from the ``news/inn`` subdirectory of the ports
tree if it is not found. It will also see if an executable called
``xmlcatmgr`` is in the search path, and descend into
``textproc/xmlcatmgr`` to build and install it if it is not found.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In this case, ``innd`` is actually an executable; if an executable is in
a place that is not expected to be in the search path, use the full
pathname.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The official search ``PATH`` used on the ports build cluster is

.. code:: programlisting

    /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

.. raw:: html

   </div>

The dependency is checked from within the ``install`` target. Also, the
name of the dependency is put into the package so that ``pkg install``
(see
`pkg-install(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-install&sektion=8>`__)
will automatically install it if it is not on the user's system. The
*``target``* part can be omitted if it is the same as
``DEPENDS_TARGET``.

A quite common situation is when ``RUN_DEPENDS`` is literally the same
as ``BUILD_DEPENDS``, especially if ported software is written in a
scripted language or if it requires the same build and run-time
environment. In this case, it is both tempting and intuitive to directly
assign one to the other:

.. code:: programlisting

    RUN_DEPENDS=  ${BUILD_DEPENDS}

However, such assignment can pollute run-time dependencies with entries
not defined in the port's original ``BUILD_DEPENDS``. This happens
because of
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__'s
lazy evaluation of variable assignment. Consider a ``Makefile`` with
``USE_*``, which are processed by ``ports/Mk/bsd.*.mk`` to augment
initial build dependencies. For example, ``USES= gmake`` adds
`devel/gmake <http://www.freebsd.org/cgi/url.cgi?ports/devel/gmake/pkg-descr>`__
to ``BUILD_DEPENDS``. To prevent such additional dependencies from
polluting ``RUN_DEPENDS``, create another variable with the current
content of ``BUILD_DEPENDS`` and assign it to both ``BUILD_DEPENDS`` and
``RUN_DEPENDS``:

.. code:: programlisting

    MY_DEPENDS=    some:${PORTSDIR}/devel/some \
            other:${PORTSDIR}/lang/other
    BUILD_DEPENDS=  ${MY_DEPENDS}
    RUN_DEPENDS=    ${MY_DEPENDS}

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

5.8.3.?\ ``BUILD_DEPENDS``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable specifies executables or files this port requires to
build. Like ``RUN_DEPENDS``, it is a list of
*``path``*:*``dir``*\ [:*``target``*] tuples. For example,

.. code:: programlisting

    BUILD_DEPENDS= unzip:${PORTSDIR}/archivers/unzip

will check for an executable called ``unzip``, and descend into the
``archivers/unzip`` subdirectory of the ports tree to build and install
it if it is not found.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

“build” here means everything from extraction to compilation. The
dependency is checked from within the ``extract`` target. The
*``target``* part can be omitted if it is the same as ``DEPENDS_TARGET``

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

5.8.4.?\ ``FETCH_DEPENDS``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable specifies executables or files this port requires to
fetch. Like the previous two, it is a list of
*``path``*:*``dir``*\ [:*``target``*] tuples. For example,

.. code:: programlisting

    FETCH_DEPENDS= ncftp2:${PORTSDIR}/net/ncftp2

will check for an executable called ``ncftp2``, and descend into the
``net/ncftp2`` subdirectory of the ports tree to build and install it if
it is not found.

The dependency is checked from within the ``fetch`` target. The
*``target``* part can be omitted if it is the same as
``DEPENDS_TARGET``.

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

5.8.5.?\ ``EXTRACT_DEPENDS``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable specifies executables or files this port requires for
extraction. Like the previous, it is a list of
*``path``*:*``dir``*\ [:*``target``*] tuples. For example,

.. code:: programlisting

    EXTRACT_DEPENDS=   unzip:${PORTSDIR}/archivers/unzip

will check for an executable called ``unzip``, and descend into the
``archivers/unzip`` subdirectory of the ports tree to build and install
it if it is not found.

The dependency is checked from within the ``extract`` target. The
*``target``* part can be omitted if it is the same as
``DEPENDS_TARGET``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Use this variable only if the extraction does not already work (the
default assumes ``tar``) and cannot be made to work using ``USES=tar``,
``USES=lha`` or ``USES=zip`` described in `Chapter?15, *Values of
``USES``* <uses.html#uses-values>`__.

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

5.8.6.?\ ``PATCH_DEPENDS``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable specifies executables or files this port requires to
patch. Like the previous, it is a list of
*``path``*:*``dir``*\ [:*``target``*] tuples. For example,

.. code:: programlisting

    PATCH_DEPENDS= ${NONEXISTENT}:${PORTSDIR}/java/jfc:extract

will descend into the ``java/jfc`` subdirectory of the ports tree to
extract it.

The dependency is checked from within the ``patch`` target. The
*``target``* part can be omitted if it is the same as
``DEPENDS_TARGET``.

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

5.8.7.?\ ``USES``
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Parameters can be added to define different features and dependencies
used by the port. They are specified by adding this line to the
``Makefile``:

.. code:: programlisting

    USES= feature[:arguments]

For the complete list of values, please see `Chapter?15, *Values of
``USES``* <uses.html#uses-values>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

``USES`` cannot be assigned after inclusion of ``bsd.port.pre.mk``.

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

5.8.8.?\ ``USE_*``
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several variables exist to define common dependencies shared by many
ports. Their use is optional, but helps to reduce the verbosity of the
port ``Makefile``\ s. Each of them is styled as ``USE_*``. These
variables may be used only in the port ``Makefile``\ s and
``ports/Mk/bsd.*.mk``. They are not meant for user-settable options —
use ``PORT_OPTIONS`` for that purpose.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is *always* incorrect to set any ``USE_*`` in ``/etc/make.conf``. For
instance, setting

.. code:: programlisting

    USE_GCC=X.Y

(where X.Y is version number) would add a dependency on gccXY for every
port, including ``lang/gccXY`` itself!

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?5.6.?\ ``USE_*``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable      | Means                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+===============+=======================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| ``USE_GCC``   | The port requires GCC (``gcc`` or ``g++``) to build. Some ports need any GCC version, some require modern, recent versions. It is typically set to ``any`` (in this case, GCC from base would be used on versions of FreeBSD that still have it, or ``lang/gcc`` port would be installed when default C/C++ compiler is Clang); or ``yes`` (means always use stable, modern GCC from ``lang/gcc`` port). The exact version can also be specified, with a value such as ``4.7``. The minimal required version can be specified as ``4.6+``. The GCC from the base system is used when it satisfies the requested version, otherwise an appropriate compiler is built from the port, and ``CC`` and ``CXX`` are adjusted accordingly.   |
+---------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Variables related to gmake and ``configure`` are described in
`Section?6.5, “Building Mechanisms” <building.html>`__, while autoconf,
automake and libtool are described in `Section?6.6, “Using GNU
Autotools” <using-autotools.html>`__. Perl related variables are
described in `Section?6.8, “Using Perl” <using-perl.html>`__. X11
variables are listed in `Section?6.9, “Using X11” <using-x11.html>`__.
`Section?6.10, “Using GNOME” <using-gnome.html>`__ deals with GNOME and
`Section?6.12, “Using KDE” <using-kde.html>`__ with KDE related
variables. `Section?6.13, “Using Java” <using-java.html>`__ documents
Java variables, while `Section?6.14, “Web Applications, Apache and
PHP” <using-php.html>`__ contains information on Apache, PHP and PEAR
modules. Python is discussed in `Section?6.15, “Using
Python” <using-python.html>`__, while Ruby in `Section?6.18, “Using
Ruby” <using-ruby.html>`__. `Section?6.19, “Using
SDL” <using-sdl.html>`__ provides variables used for SDL applications
and finally, `Section?6.23, “Using Xfce” <using-xfce.html>`__ contains
information on Xfce.

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

5.8.9.?Minimal Version of a Dependency
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A minimal version of a dependency can be specified in any
``*``\ \_DEPENDS except ``LIB_DEPENDS`` using this syntax:

.. code:: programlisting

    p5-Spiffy>=0.26:${PORTSDIR}/devel/p5-Spiffy

The first field contains a dependent package name, which must match the
entry in the package database, a comparison sign, and a package version.
The dependency is satisfied if p5-Spiffy-0.26 or newer is installed on
the machine.

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

5.8.10.?Notes on Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As mentioned above, the default target to call when a dependency is
required is ``DEPENDS_TARGET``. It defaults to ``install``. This is a
user variable; it is never defined in a port's ``Makefile``. If the port
needs a special way to handle a dependency, use the ``:target`` part of
``*``\ \_DEPENDS instead of redefining ``DEPENDS_TARGET``.

When running ``make clean``, the port dependencies are automatically
cleaned too. If this is not desirable, define ``NOCLEANDEPENDS`` in the
environment. This may be particularly desirable if the port has
something that takes a long time to rebuild in its dependency list, such
as KDE, GNOME or Mozilla.

To depend on another port unconditionally, use the variable
``${NONEXISTENT}`` as the first field of ``BUILD_DEPENDS`` or
``RUN_DEPENDS``. Use this only when the source of the other port is
needed. Compilation time can be saved by specifying the target too. For
instance

.. code:: programlisting

    BUILD_DEPENDS=  ${NONEXISTENT}:${PORTSDIR}/graphics/jpeg:extract

will always descend to the ``jpeg`` port and extract it.

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

5.8.11.?Circular Dependencies Are Fatal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Do not introduce any circular dependencies into the ports tree!

.. raw:: html

   </div>

The ports building technology does not tolerate circular dependencies.
If one is introduced, someone, somewhere in the world, will have their
FreeBSD installation broken almost immediately, with many others quickly
to follow. These can really be hard to detect. If in doubt, before
making that change, make sure to run: ``cd /usr/ports; make index``.
That process can be quite slow on older machines, but it may be able to
save a large number of people, including yourself, a lot of grief in the
process.

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

5.8.12.?Problems Caused by Automatic Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dependencies must be declared either explicitly or by using the `OPTIONS
framework <makefile-options.html>`__. Using other methods like automatic
detection complicates indexing, which causes problems for port and
package management.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.12.?Wrong Declaration of an Optional Dependency

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    .include <bsd.port.pre.mk>

    .if exists(${LOCALBASE}/bin/foo)
    LIB_DEPENDS=    libbar.so:${PORTSDIR}/foo/bar
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

The problem with trying to automatically add dependencies is that files
and settings outside an individual port can change at any time. For
example: an index is built, then a batch of ports are installed. But one
of the ports installs the tested file. The index is now incorrect,
because an installed port unexpectedly has a new dependency. The index
may still be wrong even after rebuilding if other ports also determine
their need for dependencies based on the existence of other files.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.13.?Correct Declaration of an Optional Dependency

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    OPTIONS_DEFINE=  BAR
    BAR_DESC=   Calling cellphones via bar

    BAR_LIB_DEPENDS=    libbar.so:${PORTSDIR}/foo/bar

.. raw:: html

   </div>

.. raw:: html

   </div>

Testing option variables is the correct method. It will not cause
inconsistencies in the index of a batch of ports, provided the options
were defined prior to the index build. Simple scripts can then be used
to automate the building, installation, and updating of these ports and
their packages.

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

5.8.13.?\ ``USE_*`` and ``WANT_*``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``USE_*`` are set by the port maintainer to define software on which
this port depends. A port that needs Firefox would set

.. code:: programlisting

    USE_FIREFOX=  yes

Some ``USE_*`` can accept version numbers or other parameters. For
example, a port that requires Apache 2.2 would set

.. code:: programlisting

    USE_APACHE=    22

For more control over dependencies in some cases, ``WANT_*`` are
available to more precisely specify what is needed. For example,
consider the
`mail/squirrelmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/squirrelmail/pkg-descr>`__
port. This port needs some PHP modules, which are listed in ``USE_PHP``:

.. code:: programlisting

    USE_PHP=   session mhash gettext mbstring pcre openssl xml

Those modules may be available in CLI or web versions, so the web
version is selected with ``WANT_*``:

.. code:: programlisting

    WANT_PHP_WEB= yes

Available ``USE_*`` and ``WANT_*`` are defined in the files in
``/usr/ports/Mk``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+-----------------------------------------+
| `Prev <makefile-portscout.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-masterdir.html>`__   |
+---------------------------------------+---------------------------+-----------------------------------------+
| 5.7.?\ ``PORTSCOUT``?                 | `Home <index.html>`__     | ?5.9.?\ ``MASTERDIR``                   |
+---------------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
