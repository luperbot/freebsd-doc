========================
6.5.?Building Mechanisms
========================

.. raw:: html

   <div class="navheader">

6.5.?Building Mechanisms
`Prev <porting-restrictions.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-autotools.html>`__

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

6.5.?Building Mechanisms
------------------------

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

6.5.1.?Building Ports in Parallel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD ports framework supports parallel building using multiple
``make`` sub-processes, which allows SMP systems to utilize all of their
available CPU power, allowing port builds to be faster and more
effective.

This is achieved by passing ``-jX`` flag to
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
running on vendor code. This is the default build behavior of ports.
Unfortunately, not all ports handle parallel building well and it may be
required to explicitly disable this feature by adding the
``MAKE_JOBS_UNSAFE=yes`` variable. It is used when a port is known to be
broken with ``-jX``.

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

6.5.2.?\ ``make``, ``gmake``, ``fmake``, and ``imake``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several differing ``make`` implementations exist. Ported software often
requires a particular implementation, like GNU ``make``, known in
FreeBSD as ``gmake``, or ``fmake``, the legacy FreeBSD ``make``.

If the port uses GNU make, add ``gmake`` to ``USES``. If the legacy
FreeBSD ``make`` is needed, add ``fmake`` there.

``MAKE_CMD`` can be used to reference the specific command configured by
the ``USES`` setting in the port's ``Makefile``. In rare cases when more
than one ``make`` implementation is listed in ``USES``, the variables
``GMAKE`` (for the GNU version) or ``FMAKE`` (for the legacy FreeBSD
version) are available. Only use ``MAKE_CMD`` within the application
``Makefile``\ s in ``WRKSRC`` to call the ``make`` implementation
expected by the ported software.

If the port is an X application that uses imake to create
``Makefile``\ s from ``Imakefile``\ s, set ``USES=       imake``.. See
the ```USES=imake`` <uses.html#uses-imake>`__ section of `Chapter?15,
*Values of ``USES``* <uses.html>`__ for more details.

If the port's source ``Makefile`` has something other than ``all`` as
the main build target, set ``ALL_TARGET`` accordingly. The same goes for
``install`` and ``INSTALL_TARGET``.

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

6.5.3.?\ ``configure`` Script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port uses the ``configure`` script to generate ``Makefile`` from
``Makefile.in``, set ``GNU_CONFIGURE=yes``. To give extra arguments to
the ``configure`` script (the default argument is
``--prefix=${PREFIX}       --infodir=${PREFIX}/${INFO_PATH}       --mandir=${MANPREFIX}/man       --build=${CONFIGURE_TARGET}``),
set those extra arguments in ``CONFIGURE_ARGS``. Extra environment
variables can be passed using ``CONFIGURE_ENV``.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.1.?Variables for Ports That Use ``configure``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+----------------------------------------------------------------------------------------------------+
| Variable               | Means                                                                                              |
+========================+====================================================================================================+
| ``GNU_CONFIGURE``      | The port uses ``configure`` script to prepare build.                                               |
+------------------------+----------------------------------------------------------------------------------------------------+
| ``HAS_CONFIGURE``      | Same as ``GNU_CONFIGURE``, except default configure target is not added to ``CONFIGURE_ARGS``.     |
+------------------------+----------------------------------------------------------------------------------------------------+
| ``CONFIGURE_ARGS``     | Additional arguments passed to ``configure`` script.                                               |
+------------------------+----------------------------------------------------------------------------------------------------+
| ``CONFIGURE_ENV``      | Additional environment variables to be set for ``configure`` script run.                           |
+------------------------+----------------------------------------------------------------------------------------------------+
| ``CONFIGURE_TARGET``   | Override default configure target. Default value is ``${MACHINE_ARCH}-portbld-freebsd${OSREL}``.   |
+------------------------+----------------------------------------------------------------------------------------------------+

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

6.5.4.?Using ``cmake``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For ports that use CMake, define ``USES= cmake``, or
``USES= cmake:outsource`` to build in a separate directory (see below).

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.2.?Variables for Ports That Use ``cmake``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------+-------------------------------------------------------------------------------------------------------------------+
| Variable                | Means                                                                                                             |
+=========================+===================================================================================================================+
| ``CMAKE_ARGS``          | Port specific CMake flags to be passed to the ``cmake`` binary.                                                   |
+-------------------------+-------------------------------------------------------------------------------------------------------------------+
| ``CMAKE_BUILD_TYPE``    | Type of build (CMake predefined build profiles). Default is ``Release``, or ``Debug`` if ``WITH_DEBUG`` is set.   |
+-------------------------+-------------------------------------------------------------------------------------------------------------------+
| ``CMAKE_ENV``           | Environment variables to be set for the ``cmake`` binary. Default is ``${CONFIGURE_ENV}``.                        |
+-------------------------+-------------------------------------------------------------------------------------------------------------------+
| ``CMAKE_SOURCE_PATH``   | Path to the source directory. Default is ``${WRKSRC}``.                                                           |
+-------------------------+-------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.3.?Variables the Users Can Define for ``cmake`` Builds

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+----------------------------------------------------------------------------------------------------+
| Variable            | Means                                                                                              |
+=====================+====================================================================================================+
| ``CMAKE_VERBOSE``   | Enable verbose build output. Default not set, unless ``BATCH`` or ``PACKAGE_BUILDING`` are set.    |
+---------------------+----------------------------------------------------------------------------------------------------+
| ``CMAKE_NOCOLOR``   | Disables colour build output. Default not set, unless ``BATCH`` or ``PACKAGE_BUILDING`` are set.   |
+---------------------+----------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

CMake supports these build profiles: ``Debug``, ``Release``,
``RelWithDebInfo`` and ``MinSizeRel``. ``Debug`` and ``Release``
profiles respect system ``*FLAGS``, ``RelWithDebInfo`` and
``MinSizeRel`` will set ``CFLAGS`` to ``-O2 -g`` and ``-Os -DNDEBUG``
correspondingly. The lower-cased value of ``CMAKE_BUILD_TYPE`` is
exported to ``PLIST_SUB`` and must be used if the port installs
``*``.cmake depending on the build type (see
`deskutils/strigi <http://www.freebsd.org/cgi/url.cgi?ports/deskutils/strigi/pkg-descr>`__
for an example). Please note that some projects may define their own
build profiles and/or force particular build type by setting
``CMAKE_BUILD_TYPE`` in ``CMakeLists.txt``. To make a port for such a
project respect ``CFLAGS`` and ``WITH_DEBUG``, the ``CMAKE_BUILD_TYPE``
definitions must be removed from those files.

Most CMake-based projects support an out-of-source method of building.
The out-of-source build for a port can be requested by using the
``:outsource`` suffix. When enabled, ``CONFIGURE_WRKSRC``,
``BUILD_WRKSRC`` and ``INSTALL_WRKSRC`` will be set to
``${WRKDIR}/.build`` and this directory will be used to keep all files
generated during configuration and build stages, leaving the source
directory intact.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.1.?\ ``USES= cmake`` Example

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This snippet demonstrates the use of CMake for a port.
``CMAKE_SOURCE_PATH`` is not usually required, but can be set when the
sources are not located in the top directory, or if only a subset of the
project is intended to be built by the port.

.. code:: programlisting

    USES=         cmake:outsource
    CMAKE_SOURCE_PATH=  ${WRKSRC}/subproject

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

6.5.5.?Using ``scons``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port uses SCons, define ``USE_SCONS=yes``.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.4.?Variables for Ports That Use ``scons``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------+--------------------------------------------------------------+
| Variable             | Means                                                        |
+======================+==============================================================+
| ``SCONS_ARGS``       | Port specific SCons flags passed to the SCons environment.   |
+----------------------+--------------------------------------------------------------+
| ``SCONS_BUILDENV``   | Variables to be set in system environment.                   |
+----------------------+--------------------------------------------------------------+
| ``SCONS_ENV``        | Variables to be set in SCons environment.                    |
+----------------------+--------------------------------------------------------------+
| ``SCONS_TARGET``     | Last argument passed to SCons, similar to ``MAKE_TARGET``.   |
+----------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

To make third party ``SConstruct`` respect everything that is passed to
SCons in ``SCONS_ENV`` (that is, most importantly,
``CC/CXX/CFLAGS/CXXFLAGS``), patch ``SConstruct`` so build
``Environment`` is constructed like this:

.. code:: programlisting

    env = Environment(**ARGUMENTS)

It may be then modified with ``env.Append`` and ``env.Replace``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------------+-------------------------+--------------------------------------+
| `Prev <porting-restrictions.html>`__?                          | `Up <special.html>`__   | ?\ `Next <using-autotools.html>`__   |
+----------------------------------------------------------------+-------------------------+--------------------------------------+
| 6.4.?Ports with Distribution Restrictions or Legal Concerns?   | `Home <index.html>`__   | ?6.6.?Using GNU Autotools            |
+----------------------------------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
