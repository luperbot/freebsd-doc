======================
5.12.?Makefile Options
======================

.. raw:: html

   <div class="navheader">

5.12.?Makefile Options
`Prev <makefile-info.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-wrkdir.html>`__

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

5.12.?Makefile Options
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many applications can be built with optional or differing
configurations. Examples include choice of natural (human) language, GUI
versus command-line, or type of database to support. Users may need a
different configuration than the default, so the ports system provides
hooks the port author can use to control which variant will be built.
Supporting these options properly will make users happy, and effectively
provide two or more ports for the price of one.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.1.?\ ``OPTIONS``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.12.1.1.?Background
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``OPTIONS_*`` give the user installing the port a dialog showing the
available options, and then saves those options to
``${PORT_DBDIR}/${OPTIONS_NAME}/options``. The next time the port is
built, the options are reused. ``PORT_DBDIR`` defaults to
``/var/db/ports``. ``OPTIONS_NAME`` is to the port origin with an
underscore as the space separator, for example, for
`dns/bind99 <http://www.freebsd.org/cgi/url.cgi?ports/dns/bind99/pkg-descr>`__
it will be ``dns_bind99``.

When the user runs ``make config`` (or runs ``make build`` for the first
time), the framework checks for
``${PORT_DBDIR}/${OPTIONS_NAME}/options``. If that file does not exist,
the values of ``OPTIONS_*`` are used, and a dialog box is displayed
where the options can be enabled or disabled. Then ``options`` is saved
and the configured variables are used when building the port.

If a new version of the port adds new ``OPTIONS``, the dialog will be
presented to the user with the saved values of old ``OPTIONS``
prefilled.

``make showconfig`` shows the saved configuration. Use ``make rmconfig``
to remove the saved configuration.

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

5.12.1.2.?Syntax
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``OPTIONS_DEFINE`` contains a list of ``OPTIONS`` to be used. These are
independent of each other and are not grouped:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1 OPT2

Once defined, ``OPTIONS`` are described (optional, but strongly
recommended):

.. code:: programlisting

    OPT1_DESC= Describe OPT1
    OPT2_DESC=  Describe OPT2
    OPT3_DESC=  Describe OPT3
    OPT4_DESC=  Describe OPT4
    OPT5_DESC=  Describe OPT5
    OPT6_DESC=  Describe OPT6

``ports/Mk/bsd.options.desc.mk`` has descriptions for many common
``OPTIONS``. While often useful, override them if the description is
insufficient for the port.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

When describing options, view it from the perspective of the user: “What
functionality does it change?” and “Why would I want to enable this?” Do
not just repeat the name. For example, describing the ``NLS`` option as
“include NLS support” does not help the user, who can already see the
option name but may not know what it means. Describing it as “Native
Language Support via gettext utilities” is much more helpful.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Option names are always in all uppercase. They cannot use mixed case or
lowercase.

.. raw:: html

   </div>

``OPTIONS`` can be grouped as radio choices, where only one choice from
each group is allowed:

.. code:: programlisting

    OPTIONS_SINGLE=       SG1
    OPTIONS_SINGLE_SG1= OPT3 OPT4

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

There *must* be one of each ``OPTIONS_SINGLE`` group selected at all
times for the options to be valid. One option of each group *must* be
added to ``OPTIONS_DEFAULT``.

.. raw:: html

   </div>

``OPTIONS`` can be grouped as radio choices, where none or only one
choice from each group is allowed:

.. code:: programlisting

    OPTIONS_RADIO=     RG1
    OPTIONS_RADIO_RG1=  OPT7 OPT8

``OPTIONS`` can also be grouped as “multiple-choice” lists, where *at
least one* option must be enabled:

.. code:: programlisting

    OPTIONS_MULTI=        MG1
    OPTIONS_MULTI_MG1=  OPT5 OPT6

``OPTIONS`` can also be grouped as “multiple-choice” lists, where none
or any option can be enabled:

.. code:: programlisting

    OPTIONS_GROUP=      GG1
    OPTIONS_GROUP_GG1=  OPT9 OPT10

``OPTIONS`` are unset by default, unless they are listed in
``OPTIONS_DEFAULT``:

.. code:: programlisting

    OPTIONS_DEFAULT= OPT1 OPT3 OPT6

``OPTIONS`` definitions must appear before the inclusion of
``bsd.port.options.mk``. ``PORT_OPTIONS`` values can only be tested
after the inclusion of ``bsd.port.options.mk``. Inclusion of
``bsd.port.pre.mk`` can be used instead, too, and is still widely used
in ports written before the introduction of ``bsd.port.options.mk``. But
be aware that some variables will not work as expected after the
inclusion of ``bsd.port.pre.mk``, typically some ``USE_*`` flags.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.14.?Simple Use of ``OPTIONS``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    OPTIONS_DEFINE=    FOO BAR
    FOO_DESC=   Option foo support
    BAR_DESC=   Feature bar support

    OPTIONS_DEFAULT=FOO

    # Will add --with-foo / --without-foo
    FOO_CONFIGURE_WITH= foo
    BAR_RUN_DEPENDS=    bar:${PORTSDIR}/bar/bar

    .include <bsd.port.mk>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.15.?Check for Unset Port ``OPTIONS``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    .if ! ${PORT_OPTIONS:MEXAMPLES}
    CONFIGURE_ARGS+=--without-examples
    .endif

The form shown above is discouraged. The preferred method is using a
configure knob to really enable and disable the feature to match the
option:

.. code:: programlisting

    # Will add --with-examples / --without-examples
    EXAMPLES_CONFIGURE_WITH=    examples

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.16.?Practical Use of ``OPTIONS``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    OPTIONS_DEFINE=        EXAMPLES

    OPTIONS_SINGLE=     BACKEND
    OPTIONS_SINGLE_BACKEND= MYSQL PGSQL BDB

    OPTIONS_MULTI=      AUTH
    OPTIONS_MULTI_AUTH= LDAP PAM SSL

    EXAMPLES_DESC=      Install extra examples
    MYSQL_DESC=     Use MySQL as backend
    PGSQL_DESC=     Use PostgreSQL as backend
    BDB_DESC=       Use Berkeley DB as backend
    LDAP_DESC=      Build with LDAP authentication support
    PAM_DESC=       Build with PAM support
    SSL_DESC=       Build with OpenSSL support

    OPTIONS_DEFAULT=    PGSQL LDAP SSL

    # Will add USE_PGSQL=yes
    PGSQL_USE=  pgsql=yes
    # Will add --enable-postgres / --disable-postgres
    PGSQL_CONFIGURE_ENABLE= postgres

    ICU_LIB_DEPENDS=    libicuuc.so:${PORTSDIR}/devel/icu

    # Will add --with-examples / --without-examples
    EXAMPLES_CONFIGURE_WITH=    examples

    # Check other OPTIONS

    .include <bsd.port.mk>

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.12.1.3.?Default Options
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These options are always on by default.

.. raw:: html

   <div class="itemizedlist">

-  ``DOCS`` — build and install documentation.

-  ``NLS`` — Native Language Support.

-  ``EXAMPLES`` — build and install examples.

-  ``IPV6`` — IPv6 protocol support.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

There is no need to add these to ``OPTIONS_DEFAULT``. To have them
active, and show up in the options selection dialog, however, they must
be added to ``OPTIONS_DEFINE``.

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

5.12.2.?Feature Auto-Activation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When using a GNU configure script, keep an eye on which optional
features are activated by auto-detection. Explicitly disable optional
features that are not needed by adding ``--without-xxx`` or
``--disable-xxx`` in ``CONFIGURE_ARGS``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.17.?Wrong Handling of an Option

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    .if ${PORT_OPTIONS:MFOO}
    LIB_DEPENDS+=       libfoo.so:${PORTSDIR}/devel/foo
    CONFIGURE_ARGS+=    --enable-foo
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

In the example above, imagine a library libfoo is installed on the
system. The user does not want this application to use libfoo, so he
toggled the option off in the ``make config`` dialog. But the
application's configure script detects the library present in the system
and includes its support in the resulting executable. Now when the user
decides to remove libfoo from the system, the ports system does not
protest (no dependency on libfoo was recorded) but the application
breaks.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.18.?Correct Handling of an Option

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    FOO_LIB_DEPENDS=        libfoo.so:${PORTSDIR}/devel/foo
    # Will add --enable-foo / --disable-foo
    FOO_CONFIGURE_ENABLE=   foo

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Under some circumstances, the shorthand conditional syntax can cause
problems with complex constructs. The errors are usually
``Malformed conditional``, an alternative syntax can be used.

.. code:: programlisting

    .if !empty(VARIABLE:MVALUE)

as an alternative to

.. code:: programlisting

    .if ${VARIABLE:MVALUE}

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

5.12.3.?Options Helpers
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are some macros to help simplify conditional values which differ
based on the options set.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.3.1.?\ ``OPTIONS_SUB``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If ``OPTIONS_SUB`` is set to ``yes`` then each of the options added to
``OPTIONS_DEFINE`` will be added to ``PLIST_SUB`` and ``SUB_LIST``, for
example:

.. code:: programlisting

    OPTIONS_DEFINE=    OPT1
    OPTIONS_SUB=    yes

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    PLIST_SUB+= OPT1="" NO_OPT1="@comment "
    SUB_LIST+=  OPT1="" NO_OPT1="@comment "
    .else
    PLIST_SUB+= OPT1="@comment " NO_OPT1=""
    SUB_LIST+=  OPT1="@comment " NO_OPT1=""
    .endif

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The value of ``OPTIONS_SUB`` is ignored. Setting it to any value will
add ``PLIST_SUB`` and ``SUB_LIST`` entries for *all* options.

.. raw:: html

   </div>

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

5.12.3.2.?\ ``OPT``\ \_USE
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, for each ``key``\ =\ *``value``* pair
in ``OPT``\ \_USE, *``value``* is appended to the corresponding
``USE_KEY``. If *``value``* has spaces in it, replace them with commas
and they will be changed back to spaces during processing. For example:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1
    OPT1_USE=   mysql=yes xorg=x11,xextproto,xext,xrandr

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    USE_MYSQL=  yes
    USE_XORG=   x11 xextproto xext xrandr
    .endif

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

5.12.3.3.?\ ``OPT``\ \_USE\_OFF
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* *is not* selected, for each
``key``\ =\ *``value``* pair in ``OPT``\ \_USE\_OFF, *``value``* is
appended to the corresponding ``USE_KEY``. If *``value``* has spaces in
it, replace them with commas and they will be changed back to spaces
during processing. For example:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1
    OPT1_USE_OFF=   mysql=yes xorg=x11,xextproto,xext,xrandr

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1

    .include <bsd.port.options.mk>

    .if ! ${PORT_OPTIONS:MOPT1}
    USE_MYSQL=  yes
    USE_XORG=   x11 xextproto xext xrandr
    .endif

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

5.12.3.4.?\ ``OPT``\ \_CONFIGURE\_ENABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, for each *``entry``* in
``OPT``\ \_CONFIGURE\_ENABLE then ``--enable-entry`` is appended to
``CONFIGURE_ARGS``. When option *``OPT``* is not selected,
``--disable-entry`` is appended to ``CONFIGURE_ARGS``. An optional
argument can be specified with an ``=`` symbol. This argument is only
appended to the ``--enable-entry`` configure option. For example:

.. code:: programlisting

    OPTIONS_DEFINE=    OPT1 OPT2
    OPT1_CONFIGURE_ENABLE=  test1 test2
    OPT2_CONFIGURE_ENABLE=  test2=exhaustive

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    CONFIGURE_ARGS+=    --enable-test1 --enable-test2
    .else
    CONFIGURE_ARGS+=    --disable-test1 --disable-test2
    .endif

    .if ${PORT_OPTIONS:MOPT2}
    CONFIGURE_ARGS+=    --enable-test2=exhaustive
    .else
    CONFIGURE_ARGS+=    --disable-test2
    .endif

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

5.12.3.5.?\ ``OPT``\ \_CONFIGURE\_WITH
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, for each *``entry``* in
``OPT``\ \_CONFIGURE\_WITH then ``--with-entry`` is appended to
``CONFIGURE_ARGS``. When option *``OPT``* is not selected,
``--without-entry`` is appended to ``CONFIGURE_ARGS``. An optional
argument can be specified with an ``=`` symbol. This argument is only
appended to the ``--with-entry`` configure option. For example:

.. code:: programlisting

    OPTIONS_DEFINE=    OPT1 OPT2
    OPT1_CONFIGURE_WITH=    test1
    OPT2_CONFIGURE_WITH=    test2=exhaustive

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1 OPT2

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    CONFIGURE_ARGS+=    --with-test1
    .else
    CONFIGURE_ARGS+=    --without-test1
    .endif

    .if ${PORT_OPTIONS:MOPT2}
    CONFIGURE_ARGS+=    --with-test2=exhaustive
    .else
    CONFIGURE_ARGS+=    --without-test2
    .endif

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

5.12.3.6.?\ ``OPT``\ \_CONFIGURE\_ON
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, the value of
``OPT``\ \_CONFIGURE\_ON, if defined, is appended to ``CONFIGURE_ARGS``.
For example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_CONFIGURE_ON=  --add-test

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    CONFIGURE_ARGS+=    --add-test
    .endif

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

5.12.3.7.?\ ``OPT``\ \_CONFIGURE\_OFF
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* *is not* selected, the value of
``OPT``\ \_CONFIGURE\_ON, if defined, is appended to ``CONFIGURE_ARGS``.
For example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_CONFIGURE_OFF= --no-test

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=  OPT1

    .include <bsd.port.options.mk>

    .if ! ${PORT_OPTIONS:MOPT1}
    CONFIGURE_ARGS+=    --no-test
    .endif

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

5.12.3.8.?\ ``OPT``\ \_CMAKE\_ON
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, the value of ``OPT``\ \_CMAKE\_ON, if
defined, is appended to ``CMAKE_ARGS``. For example:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1
    OPT1_CMAKE_ON=  -DTEST:BOOL=true

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    CMAKE_ARGS+=    -DTEST:BOOL=true
    .endif

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

5.12.3.9.?\ ``OPT``\ \_CMAKE\_OFF
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* *is not* selected, the value of
``OPT``\ \_CMAKE\_OFF, if defined, is appended to ``CMAKE_ARGS``. For
example:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1
    OPT1_CMAKE_OFF= -DTEST:BOOL=false

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=  OPT1

    .include <bsd.port.options.mk>

    .if ! ${PORT_OPTIONS:MOPT1}
    CMAKE_ARGS+=    -DTEST:BOOL=false
    .endif

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

5.12.3.10.?\ ``OPT``\ \_QMAKE\_ON
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, the value of ``OPT``\ \_QMAKE\_ON, if
defined, is appended to ``QMAKE_ARGS``. For example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_QMAKE_ON=  -DTEST:BOOL=true

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=   OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    QMAKE_ARGS+=    -DTEST:BOOL=true
    .endif

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

5.12.3.11.?\ ``OPT``\ \_QMAKE\_OFF
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* *is not* selected, the value of
``OPT``\ \_QMAKE\_OFF, if defined, is appended to ``QMAKE_ARGS``. For
example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_QMAKE_OFF= -DTEST:BOOL=false

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=  OPT1

    .include <bsd.port.options.mk>

    .if ! ${PORT_OPTIONS:MOPT1}
    QMAKE_ARGS+=    -DTEST:BOOL=false
    .endif

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

5.12.3.12.?Dependencies
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For any of these dependency types:

.. raw:: html

   <div class="itemizedlist">

-  ``PKG_DEPENDS``

-  ``EXTRACT_DEPENDS``

-  ``PATCH_DEPENDS``

-  ``FETCH_DEPENDS``

-  ``BUILD_DEPENDS``

-  ``LIB_DEPENDS``

-  ``RUN_DEPENDS``

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.3.12.1.?\ ``OPT``\ \_\ *``ABOVEVARIABLE``*
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, the value of
``OPT``\ \_\ *``ABOVEVARIABLE``*, if defined, is appended to
``ABOVEVARIABLE``. For example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_LIB_DEPENDS=   liba.so:${PORTSDIR}/devel/a

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=    OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    LIB_DEPENDS+=   liba.so:${PORTSDIR}/devel/a
    .endif

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.3.12.2.?\ ``OPT``\ \_\ *``ABOVEVARIABLE``*\ \_OFF
''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* *is not* selected, the value of
``OPT``\ \_\ *``ABOVEVARIABLE``*\ \_OFF, if defined, is appended to
``ABOVEVARIABLE``. For example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_LIB_DEPENDS_OFF= liba.so:${PORTSDIR}/devel/a

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1

    .include <bsd.port.options.mk>

    . if ! ${PORT_OPTIONS:MOPT1}
    LIB_DEPENDS+=   liba.so:${PORTSDIR}/devel/a
    .endif

.. raw:: html

   </div>

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

5.12.3.13.?Generic Variables Replacement
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For any of these variables:

.. raw:: html

   <div class="itemizedlist">

-  ``ALL_TARGET``

-  ``CATEGORIES``

-  ``CFLAGS``

-  ``CPPFLAGS``

-  ``CXXFLAGS``

-  ``CONFIGURE_ENV``

-  ``CONFLICTS``

-  ``CONFLICTS_BUILD``

-  ``CONFLICTS_INSTALL``

-  ``DISTFILES``

-  ``EXTRA_PATCHES``

-  ``INFO``

-  ``INSTALL_TARGET``

-  ``LDFLAGS``

-  ``MAKE_ARGS``

-  ``MAKE_ENV``

-  ``PATCH_SITES``

-  ``PATCHFILES``

-  ``PLIST_FILES``

-  ``PLIST_DIRS``

-  ``PLIST_DIRSTRY``

-  ``PLIST_SUB``

-  ``USES``

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some variables are not in this list, in particular ``PKGNAMEPREFIX`` and
``PKGNAMESUFFIX``. This is intentional. A port *must not* change its
name when its option set changes.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Some of these variables, at least ``ALL_TARGET`` and ``INSTALL_TARGET``,
have their default values set *after* the options are processed.

With these lines in the ``Makefile``:

.. code:: programlisting

    ALL_TARGET= all

    DOCS_ALL_TARGET=    doc

If the ``DOCS`` option is enabled, ``ALL_TARGET`` will have a final
value of ``all doc``; if the option is disabled, it would have a value
of ``all``.

With only the options helper line in the ``Makefile``:

.. code:: programlisting

    DOCS_ALL_TARGET=    doc

If the ``DOCS`` option is enabled, ``ALL_TARGET`` will have a final
value of ``doc``; if the option is disabled, it would have a value of
``all``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.3.13.1.?\ ``OPT``\ \_\ *``ABOVEVARIABLE``*
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option *``OPT``* is selected, the value of
``OPT``\ \_\ *``ABOVEVARIABLE``*, if defined, is appended to
``ABOVEVARIABLE``. For example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_USES=  gmake
    OPT1_CFLAGS=    -DTEST

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MOPT1}
    USES+=      gmake
    CFLAGS+=    -DTEST
    .endif

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.3.13.2.?\ ``OPT``\ \_\ *``ABOVEVARIABLE``*\ \_OFF
''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When option OPT is not selected, the value of
``OPT``\ \_\ *``ABOVEVARIABLE``*\ \_OFF, if defined, is appended to
``ABOVEVARIABLE``. For example:

.. code:: programlisting

    OPTIONS_DEFINE= OPT1
    OPT1_USES_OFF=  gmake

is equivalent to:

.. code:: programlisting

    OPTIONS_DEFINE=  OPT1

    .include <bsd.port.options.mk>

    .if ! ${PORT_OPTIONS:MOPT1}
    USES+=  gmake
    .endif

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

+----------------------------------+---------------------------+-------------------------------------------+
| `Prev <makefile-info.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-wrkdir.html>`__        |
+----------------------------------+---------------------------+-------------------------------------------+
| 5.11.?Info Files?                | `Home <index.html>`__     | ?5.13.?Specifying the Working Directory   |
+----------------------------------+---------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
