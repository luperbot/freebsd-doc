=======================================
Chapter?7.?Advanced pkg-plist Practices
=======================================

.. raw:: html

   <div class="navheader">

Chapter?7.?Advanced ``pkg-plist`` Practices
`Prev <requiring-kernel-sources.html>`__?
?
?\ `Next <plist-cleaning.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`7.1. Changing ``pkg-plist`` Based on Make
Variables <plist.html#plist-sub>`__
`7.2. Empty Directories <plist-cleaning.html>`__
`7.3. Configuration Files <plist-config.html>`__
`7.4. Dynamic Versus Static Package List <plist-dynamic.html>`__
`7.5. Automated Package List Creation <plist-autoplist.html>`__
`7.6. Expanding Package List with Keywords <plist-keywords.html>`__

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

7.1.?Changing ``pkg-plist`` Based on Make Variables
---------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some ports, particularly the ``p5-`` ports, need to change their
``pkg-plist`` depending on what options they are configured with (or
version of ``perl``, in the case of ``p5-`` ports). To make this easy,
any instances in ``pkg-plist`` of ``%%OSREL%%``, ``%%PERL_VER%%``, and
``%%PERL_VERSION%%`` will be substituted appropriately. The value of
``%%OSREL%%`` is the numeric revision of the operating system (for
example, ``4.9``). ``%%PERL_VERSION%%`` and ``%%PERL_VER%%`` is the full
version number of ``perl`` (for example, ``5.8.9``). Several other
``%%VARS``\ %% related to port's documentation files are described in
`the relevant section <install.html#install-documentation>`__.

To make other substitutions, set ``PLIST_SUB`` with a list of
``VAR``\ =\ *``VALUE``* pairs and instances of ``%%VAR``\ %% will be
substituted with *``VALUE``* in ``pkg-plist``.

For instance, if a port installs many files in a version-specific
subdirectory, use a placeholder for the version so that ``pkg-plist``
does not have to be regenerated every time the port is updated. For
example:

.. code:: programlisting

    OCTAVE_VERSION=   ${PORTREVISION}
    PLIST_SUB=  OCTAVE_VERSION=${OCTAVE_VERSION}

in the ``Makefile`` and use ``%%OCTAVE_VERSION%%`` wherever the version
shows up in ``pkg-plist``. When the port is upgraded, it will not be
necessary to edit dozens (or in some cases, hundreds) of lines in
``pkg-plist``.

If files are installed conditionally on the options set in the port, the
usual way of handling it is prefixing ``pkg-plist`` lines with a
``%%OPT%%`` for lines needed when the option is enabled, or
``%%NO_OPT%%`` when the option is disabled, and adding
``OPTIONS_SUB=yes`` to the ``Makefile``. See `Section?5.12.3.1,
“\ ``OPTIONS_SUB``\ ” <makefile-options.html#options_sub>`__ for more
information.

For instance, if there are files that are only installed when the
``X11`` option is enabled, and ``Makefile`` has:

.. code:: programlisting

    OPTIONS_DEFINE=    X11
    OPTIONS_SUB=    yes

In ``pkg-plist``, put ``%%X11%%`` in front of the lines only being
installed when the option is enabled, like this :

.. code:: programlisting

    %%X11%%bin/foo-gui

This substitution will be done between the ``pre-install`` and
``do-install`` targets, by reading from ``PLIST`` and writing to
``TMPPLIST`` (default: ``WRKDIR/.PLIST.mktmp``). So if the port builds
``PLIST`` on the fly, do so in or before ``pre-install``. Also, if the
port needs to edit the resulting file, do so in ``post-install`` to a
file named ``TMPPLIST``.

Another way of modifying a port's packing list is based on setting the
variables ``PLIST_FILES`` and ``PLIST_DIRS``. The value of each variable
is regarded as a list of pathnames to write to ``TMPPLIST`` along with
``PLIST`` contents. Names listed in ``PLIST_FILES`` and ``PLIST_DIRS``
are subject to ``%%VAR``\ %% substitution as described above. Except for
that, names from ``PLIST_FILES`` will appear in the final packing list
unchanged, while ``@dir`` will be prepended to names from
``PLIST_DIRS``. To take effect, ``PLIST_FILES`` and ``PLIST_DIRS`` must
be set before ``TMPPLIST`` is written, that is, in ``pre-install`` or
earlier.

From time to time, using ``OPTIONS_SUB`` is not enough. In those cases,
adding a specific ``TAG`` to ``PLIST_SUB`` inside the ``Makefile`` with
a special value of ``@comment``, makes package tools to ignore the line.
For instance, if some files are only installed when the ``X11`` option
is on and the architecture is ``i386``:

.. code:: programlisting

    .include <bsd.port.pre.mk>

    .if ${PORT_OPTIONS:MX11} && ${ARCH} == "i386"
    PLIST_SUB+= X11I386=""
    .else
    PLIST_SUB+= X11I386="@comment "
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------+-------------------------------------+
| `Prev <requiring-kernel-sources.html>`__?   | ?                       | ?\ `Next <plist-cleaning.html>`__   |
+---------------------------------------------+-------------------------+-------------------------------------+
| 6.28.?Ports That Rely on Kernel Sources?    | `Home <index.html>`__   | ?7.2.?Empty Directories             |
+---------------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
