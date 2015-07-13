===========================================================
6.4.?Ports with Distribution Restrictions or Legal Concerns
===========================================================

.. raw:: html

   <div class="navheader">

6.4.?Ports with Distribution Restrictions or Legal Concerns
`Prev <porting-shlibs.html>`__?
Chapter?6.?Special Considerations
?\ `Next <building.html>`__

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

6.4.?Ports with Distribution Restrictions or Legal Concerns
-----------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Licenses vary, and some of them place restrictions on how the
application can be packaged, whether it can be sold for profit, and so
on.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

It is the responsibility of a porter to read the licensing terms of the
software and make sure that the FreeBSD project will not be held
accountable for violating them by redistributing the source or compiled
binaries either via FTP/HTTP or CD-ROM. If in doubt, please contact the
`FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__.

.. raw:: html

   </div>

In situations like this, the variables described in the next sections
can be set.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.4.1.?\ ``NO_PACKAGE``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable indicates that we may not generate a binary package of the
application. For instance, the license may disallow binary
redistribution, or it may prohibit distribution of packages created from
patched sources.

However, the port's ``DISTFILES`` may be freely mirrored on FTP/HTTP.
They may also be distributed on a CD-ROM (or similar media) unless
``NO_CDROM`` is set as well.

If the binary package is not generally useful, and the application must
always be compiled from the source code, use ``NO_PACKAGE``. For
example, if the application has configuration information that is site
specific hard coded into it at compile time, set ``NO_PACKAGE``.

Set ``NO_PACKAGE`` to a string describing the reason why the package
cannot be generated.

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

6.4.2.?\ ``NO_CDROM``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This variable alone indicates that, although we are allowed to generate
binary packages, we may put neither those packages nor the port's
``DISTFILES`` onto a CD-ROM (or similar media) for resale. However, the
binary packages and the port's ``DISTFILES`` will still be available via
FTP/HTTP.

If this variable is set along with ``NO_PACKAGE``, then only the port's
``DISTFILES`` will be available, and only via FTP/HTTP.

Set ``NO_CDROM`` to a string describing the reason why the port cannot
be redistributed on CD-ROM. For instance, use this if the port's license
is for “non-commercial” use only.

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

6.4.3.?\ ``NOFETCHFILES``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Files defined in ``NOFETCHFILES`` are not fetchable from any of
``MASTER_SITES``. An example of such a file is when the file is supplied
on CD-ROM by the vendor.

Tools which check for the availability of these files on
``MASTER_SITES`` have to ignore these files and not report about them.

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

6.4.4.?\ ``RESTRICTED``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set this variable alone if the application's license permits neither
mirroring the application's ``DISTFILES`` nor distributing the binary
package in any way.

Do not set ``NO_CDROM`` or ``NO_PACKAGE`` along with ``RESTRICTED``,
since the latter variable implies the former ones.

Set ``RESTRICTED`` to a string describing the reason why the port cannot
be redistributed. Typically, this indicates that the port contains
proprietary software and that the user will need to manually download
the ``DISTFILES``, possibly after registering for the software or
agreeing to accept the terms of an EULA.

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

6.4.5.?\ ``RESTRICTED_FILES``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When ``RESTRICTED`` or ``NO_CDROM`` is set, this variable defaults to
``${DISTFILES} ${PATCHFILES}``, otherwise it is empty. If only some of
the distribution files are restricted, then set this variable to list
them.

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

6.4.6.?\ ``LEGAL_TEXT``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port has legal concerns not addressed by the above variables, set
``LEGAL_TEXT`` to a string explaining the concern. For example, if
special permission was obtained for FreeBSD to redistribute the binary,
this variable must indicate so.

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

6.4.7.?\ ``/usr/ports/LEGAL`` and ``LEGAL``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A port which sets any of the above variables must also be added to
``/usr/ports/LEGAL``. The first column is a glob which matches the
restricted distfiles. The second column is the port's origin. The third
column is the output of ``make -VLEGAL``.

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

6.4.8.?Examples
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The preferred way to state "the distfiles for this port must be fetched
manually" is as follows:

.. code:: programlisting

    .if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX})
    IGNORE= may not be redistributed because of licensing reasons. Please visit some-website to accept their license and download ${DISTFILES} into ${DISTDIR}
    .endif

This both informs the user, and sets the proper metadata on the user's
machine for use by automated programs.

Note that this stanza must be preceded by an inclusion of
``bsd.port.pre.mk``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+-------------------------------+
| `Prev <porting-shlibs.html>`__?   | `Up <special.html>`__   | ?\ `Next <building.html>`__   |
+-----------------------------------+-------------------------+-------------------------------+
| 6.3.?Shared Libraries?            | `Home <index.html>`__   | ?6.5.?Building Mechanisms     |
+-----------------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
