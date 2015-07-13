======================
5.15.?Installing Files
======================

.. raw:: html

   <div class="navheader">

5.15.?Installing Files
`Prev <conflicts.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <special.html>`__

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

5.15.?Installing Files
----------------------

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

5.15.1.?\ ``INSTALL_*`` Macros
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Use the macros provided in ``bsd.port.mk`` to ensure correct modes of
files in the port's ``*-install`` targets. Set ownership directly in
``pkg-plist`` with the corresponding entries, such as
``@(owner``,\ *``group``*,), ``@owner owner``, and
``@group       group``. These operators work until overridden, or until
the end of ``pkg-plist``, so do not forget to reset them after they are
no longer needed. The default ownership is ``root:wheel``. See
`Section?7.6.10, “Base
Keywords” <plist-keywords.html#plist-keywords-base>`__ for more
information.

.. raw:: html

   <div class="itemizedlist">

-  ``INSTALL_PROGRAM`` is a command to install binary executables.

-  ``INSTALL_SCRIPT`` is a command to install executable scripts.

-  ``INSTALL_LIB`` is a command to install shared libraries (but not
   static libraries).

-  ``INSTALL_KLD`` is a command to install kernel loadable modules. Some
   architectures do not like having the modules stripped, so use this
   command instead of ``INSTALL_PROGRAM``.

-  ``INSTALL_DATA`` is a command to install sharable data, including
   static libraries.

-  ``INSTALL_MAN`` is a command to install manpages and other
   documentation (it does not compress anything).

.. raw:: html

   </div>

These variables are set to the
`install(1) <http://www.FreeBSD.org/cgi/man.cgi?query=install&sektion=1>`__
command with the appropriate flags for each situation.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Do not use ``INSTALL_LIB`` to install static libraries, because
stripping them renders them useless. Use ``INSTALL_DATA`` instead.

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

5.15.2.?Stripping Binaries and Shared Libraries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installed binaries should be stripped. Do not strip binaries manually
unless absolutely required. The ``INSTALL_PROGRAM`` macro installs and
strips a binary at the same time. The ``INSTALL_LIB`` macro does the
same thing to shared libraries.

When a file must be stripped, but neither ``INSTALL_PROGRAM`` nor
``INSTALL_LIB`` macros are desirable, ``${STRIP_CMD}`` strips the
program or shared library. This is typically done within the
``post-install`` target. For example:

.. code:: programlisting

    post-install:
        ${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/xdl

When multiple files need to be stripped:

.. code:: programlisting

    post-install:
    .for l in geometry media body track world
        ${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/lib${PORTNAME}-${l}.so.0
    .endfor

Use
`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1>`__ on
a file to determine if it has been stripped. Binaries are reported by
`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1>`__ as
``stripped``, or ``not stripped``. Additionally,
`strip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=strip&sektion=1>`__
will detect programs that have already been stripped and exit cleanly.

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

5.15.3.?Installing a Whole Tree of Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes, a large number of files must be installed while preserving
their hierarchical organization. For example, copying over a whole
directory tree from ``WRKSRC`` to a target directory under ``PREFIX``.
Note that ``PREFIX``, ``EXAMPLESDIR``, ``DATADIR``, and other path
variables must always be prepended with ``STAGEDIR`` to respect staging
(see `Section?6.1, “Staging” <special.html#staging>`__).

Two macros exist for this situation. The advantage of using these macros
instead of ``cp`` is that they guarantee proper file ownership and
permissions on target files. The first macro, ``COPYTREE_BIN``, will set
all the installed files to be executable, thus being suitable for
installing into ``PREFIX/bin``. The second macro, ``COPYTREE_SHARE``,
does not set executable permissions on files, and is therefore suitable
for installing files under ``PREFIX/share`` target.

.. code:: programlisting

    post-install:
        ${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
        (cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})

This example will install the contents of the ``examples`` directory in
the vendor distfile to the proper examples location of the port.

.. code:: programlisting

    post-install:
        ${MKDIR} ${STAGEDIR}${DATADIR}/summer
        (cd ${WRKSRC}/temperatures && ${COPYTREE_SHARE} "June July August" ${STAGEDIR}${DATADIR}/summer)

And this example will install the data of summer months to the
``summer`` subdirectory of a ``DATADIR``.

Additional ``find`` arguments can be passed via the third argument to
``COPYTREE_*`` macros. For example, to install all files from the first
example except Makefiles, one can use these commands.

.. code:: programlisting

    post-install:
        ${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
        (cd ${WRKSRC}/examples && \
        ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR} "! -name Makefile")

These macros do not add the installed files to ``pkg-plist``. They must
be added manually. For optional documentation (``PORTDOCS``, see
`Section?5.15.4, “Install Additional
Documentation” <install.html#install-documentation>`__) and examples
(``PORTEXAMPLES``), the ``%%PORTDOCS%%`` or ``%%PORTEXAMPLES%%``
prefixes must be prepended in ``pkg-plist``.

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

5.15.4.?Install Additional Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the software has some documentation other than the standard man and
info pages that is useful for the user, install it under ``DOCSDIR``
This can be done, like the previous item, in the ``post-install``
target.

Create a new directory for the port. The directory name is ``DOCSDIR``.
This usually equals ``PORTNAME``. However, if the user might want
different versions of the port to be installed at the same time, the
whole ``PKGNAME`` can be used.

Since only the files listed in ``pkg-plist`` are installed, it is safe
to always install documentation to ``STAGEDIR`` (see `Section?6.1,
“Staging” <special.html#staging>`__). Hence ``.if`` blocks are only
needed when the installed files are large enough to cause significant
I/O overhead.

.. code:: programlisting

    post-install:
        ${MKDIR} ${STAGEDIR}${DOCSDIR}
        ${INSTALL_MAN} ${WRKSRC}/docs/xvdocs.ps ${STAGEDIR}${DOCSDIR}

Here are some handy variables and how they are expanded by default when
used in the ``Makefile``:

.. raw:: html

   <div class="itemizedlist">

-  ``DATADIR`` gets expanded to ``PREFIX/share/PORTNAME``.

-  ``DATADIR_REL`` gets expanded to ``share/PORTNAME``.

-  ``DOCSDIR`` gets expanded to ``PREFIX/share/doc/PORTNAME``.

-  ``DOCSDIR_REL`` gets expanded to ``share/doc/PORTNAME``.

-  ``EXAMPLESDIR`` gets expanded to ``PREFIX/share/examples/PORTNAME``.

-  ``EXAMPLESDIR_REL`` gets expanded to ``share/examples/PORTNAME``.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``DOCS`` option only controls additional documentation installed in
``DOCSDIR``. It does not apply to standard man pages and info pages.
Things installed in ``DATADIR`` and ``EXAMPLESDIR`` are controlled by
``DATA`` and ``EXAMPLES`` options, respectively.

.. raw:: html

   </div>

These variables are exported to ``PLIST_SUB``. Their values will appear
there as pathnames relative to ``PREFIX`` if possible. That is,
``share/doc/PORTNAME`` will be substituted for ``%%DOCSDIR%%`` in the
packing list by default, and so on. (See more on ``pkg-plist``
substitution `here <plist.html#plist-sub>`__.)

All conditionally installed documentation files and directories are
included in ``pkg-plist`` with the ``%%PORTDOCS%%`` prefix, for example:

.. code:: programlisting

    %%PORTDOCS%%%%DOCSDIR%%/AUTHORS
    %%PORTDOCS%%%%DOCSDIR%%/CONTACT

As an alternative to enumerating the documentation files in
``pkg-plist``, a port can set the variable ``PORTDOCS`` to a list of
file names and shell glob patterns to add to the final packing list. The
names will be relative to ``DOCSDIR``. Therefore, a port that utilizes
``PORTDOCS``, and uses a non-default location for its documentation,
must set ``DOCSDIR`` accordingly. If a directory is listed in
``PORTDOCS`` or matched by a glob pattern from this variable, the entire
subtree of contained files and directories will be registered in the
final packing list. If the ``DOCS`` option has been unset then files and
directories listed in ``PORTDOCS`` would not be installed or added to
port packing list. Installing the documentation at ``PORTDOCS`` as shown
above remains up to the port itself. A typical example of utilizing
``PORTDOCS`` looks as follows:

.. code:: programlisting

    PORTDOCS=    README.* ChangeLog docs/*

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The equivalents of ``PORTDOCS`` for files installed under ``DATADIR``
and ``EXAMPLESDIR`` are ``PORTDATA`` and ``PORTEXAMPLES``, respectively.

The contents of ``pkg-message`` are displayed upon installation. See
`the section on using
``pkg-message`` <pkg-files.html#porting-message>`__ for details.
``pkg-message`` does not need to be added to ``pkg-plist``.

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

5.15.5.?Subdirectories Under ``PREFIX``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Try to let the port put things in the right subdirectories of
``PREFIX``. Some ports lump everything and put it in the subdirectory
with the port's name, which is incorrect. Also, many ports put
everything except binaries, header files and manual pages in a
subdirectory of ``lib``, which does not work well with the BSD paradigm.
Many of the files must be moved to one of these directories: ``etc``
(setup/configuration files), ``libexec`` (executables started
internally), ``sbin`` (executables for superusers/managers), ``info``
(documentation for info browser) or ``share`` (architecture independent
files). See
`hier(7) <http://www.FreeBSD.org/cgi/man.cgi?query=hier&sektion=7>`__
for details; the rules governing ``/usr`` pretty much apply to
``/usr/local`` too. The exception are ports dealing with USENET “news”.
They may use ``PREFIX/news`` as a destination for their files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+--------------------------------------+
| `Prev <conflicts.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <special.html>`__           |
+------------------------------+---------------------------+--------------------------------------+
| 5.14.?Conflict Handling?     | `Home <index.html>`__     | ?Chapter?6.?Special Considerations   |
+------------------------------+---------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
