===========================
5.4.?The Distribution Files
===========================

.. raw:: html

   <div class="navheader">

5.4.?The Distribution Files
`Prev <makefile-categories.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-maintainer.html>`__

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

5.4.?The Distribution Files
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The second part of the ``Makefile`` describes the files that must be
downloaded to build the port, and where they can be downloaded.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.1.?\ ``DISTVERSION/DISTNAME``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``DISTNAME`` is the name of the port as called by the authors of the
software. ``DISTNAME`` defaults to
``${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}``,
and ``DISTVERSION`` defaults to ``${PORTVERSION}`` so override it only
if necessary. ``DISTNAME`` is only used in two places. First, the
distribution file list (``DISTFILES``) defaults to
``${DISTNAME}``\ ``${EXTRACT_SUFX}``. Second, the distribution file is
expected to extract into a subdirectory named ``WRKSRC``, which defaults
to ``work/${DISTNAME}``.

Some vendor's distribution names which do not fit into the
``${PORTNAME}-${PORTVERSION}``-scheme can be handled automatically by
setting ``DISTVERSION``. ``PORTVERSION`` will be derived from it
automatically.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Only one of ``PORTVERSION`` and ``DISTVERSION`` can be set at a time. If
``DISTVERSION`` does not derive a correct ``PORTVERSION``, do not use
``DISTVERSION``, set ``PORTVERSION`` to the right value and set
``DISTNAME`` with ``PORTNAME`` with either some computation of
``PORTVERSION`` or the verbatim upstream version.

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?5.2.?Examples of ``DISTVERSION`` and the Derived ``PORTVERSION``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------+-------------------+
| ``DISTVERSION``   | ``PORTVERSION``   |
+===================+===================+
| 0.7.1d            | 0.7.1.d           |
+-------------------+-------------------+
| 10Alpha3          | 10.a3             |
+-------------------+-------------------+
| 3Beta7-pre2       | 3.b7.p2           |
+-------------------+-------------------+
| 8:f\_17           | 8f.17             |
+-------------------+-------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``PKGNAMEPREFIX`` and ``PKGNAMESUFFIX`` do not affect ``DISTNAME``. Also
note that if ``WRKSRC`` is equal to ``${WRKDIR}/${DISTNAME}`` while the
original source archive is named something other than
``${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}``, leave ``DISTNAME`` alone—
defining only ``DISTFILES`` is easier than both ``DISTNAME`` and
``WRKSRC`` (and possibly ``EXTRACT_SUFX``).

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

5.4.2.?\ ``MASTER_SITES``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Record the directory part of the FTP/HTTP-URL pointing at the original
tarball in ``MASTER_SITES``. Do not forget the trailing slash (``/``)!

The ``make`` macros will try to use this specification for grabbing the
distribution file with ``FETCH`` if they cannot find it already on the
system.

It is recommended that multiple sites are included on this list,
preferably from different continents. This will safeguard against
wide-area network problems. We are even planning to add support for
automatically determining the closest master site and fetching from
there; having multiple sites will go a long way towards helping this
effort.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

``MASTER_SITES`` must not be blank. It must point to the actual site
hosting the distribution files. It cannot point to web archives, or the
FreeBSD distribution files cache sites. The only exception to this rule
is ports that do not have any distribution files. For example,
meta-ports do not have any distribution files, so ``MASTER_SITES`` does
not need to be set.

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

5.4.2.1.?Using ``MASTER_SITE_*`` Variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Shortcut abbreviations are available for popular archives like
SourceForge (``SOURCEFORGE``), GNU (``GNU``), or Perl CPAN
(``PERL_CPAN``). ``MASTER_SITES`` can use them directly:

.. code:: programlisting

    MASTER_SITES=    GNU/make

The older expanded format still works, but all ports have been converted
to the compact format. The expanded format looks like this:

.. code:: programlisting

    MASTER_SITES=      ${MASTER_SITE_GNU}
    MASTER_SITE_SUBDIR= make

These values and variables are defined in
```Mk/bsd.sites.mk`` <https://svnweb.freebsd.org/ports/head/Mk/bsd.sites.mk?view=markup>`__.
New entries are added often, so make sure to check the latest version of
this file before submitting a port.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

For any ``MASTER_SITE_FOO`` variable, the shorthand ``FOO`` can be used.
For example, use:

.. code:: programlisting

    MASTER_SITES=  FOO

If ``MASTER_SITE_SUBDIR`` is needed, use this:

.. code:: programlisting

    MASTER_SITES= FOO/bar

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some ``MASTER_SITE_*`` names are quite long, and for ease of use,
shortcuts have been defined:

.. raw:: html

   <div class="table" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="table-title">

Table?5.3.?Shortcuts for ``MASTER_SITE_*`` Macros

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+-------------+
| Macro                 | Shortcut    |
+=======================+=============+
| ``PERL_CPAN``         | ``CPAN``    |
+-----------------------+-------------+
| ``GITHUB``            | ``GH``      |
+-----------------------+-------------+
| ``GITHUB_CLOUD``      | ``GHC``     |
+-----------------------+-------------+
| ``LIBREOFFICE_DEV``   | ``LODEV``   |
+-----------------------+-------------+
| ``NETLIB``            | ``NL``      |
+-----------------------+-------------+
| ``RUBYGEMS``          | ``RG``      |
+-----------------------+-------------+
| ``SOURCEFORGE``       | ``SF``      |
+-----------------------+-------------+
| ``SOURCEFORGE_JP``    | ``SFJP``    |
+-----------------------+-------------+

.. raw:: html

   </div>

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

5.4.2.2.?Magic MASTER\_SITES Macros
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several “magic” macros exist for popular sites with a predictable
directory structure. For these, just use the abbreviation and the system
will choose a subdirectory automatically. For a port named ``Stardict``,
of version ``1.2.3``, and hosted on SourceForge, adding this line:

.. code:: programlisting

    MASTER_SITES=   SF

infers a subdirectory named ``/project/stardict/stardict/1.2.3``. If the
inferred directory is incorrect, it can be overridden:

.. code:: programlisting

    MASTER_SITES=  SF/stardict/WyabdcRealPeopleTTS/${PORTVERSION}

This can also be written as

.. code:: programlisting

    MASTER_SITES= SF
    MASTER_SITE_SUBDIR= stardict/WyabdcRealPeopleTTS/${PORTVERSION}

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?5.4.?Magic ``MASTER_SITES`` Macros

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------------+---------------------------------------------------------------------+
| Macro                         | Assumed subdirectory                                                |
+===============================+=====================================================================+
| ``APACHE_COMMONS_BINARIES``   | ``${PORTNAME:S,commons-,,}``                                        |
+-------------------------------+---------------------------------------------------------------------+
| ``APACHE_COMMONS_SOURCE``     | ``${PORTNAME:S,commons-,,}``                                        |
+-------------------------------+---------------------------------------------------------------------+
| ``APACHE_JAKARTA``            | ``${PORTNAME:S,-,/,}/source``                                       |
+-------------------------------+---------------------------------------------------------------------+
| ``BERLIOS``                   | ``${PORTNAME:tl}.berlios``                                          |
+-------------------------------+---------------------------------------------------------------------+
| ``CHEESESHOP``                | ``source/${DISTNAME:C/(.).*/\1/}/${DISTNAME:C/(.*)-[0-9].*/\1/}``   |
+-------------------------------+---------------------------------------------------------------------+
| ``CPAN``                      | ``${PORTNAME:C/-.*//}``                                             |
+-------------------------------+---------------------------------------------------------------------+
| ``DEBIAN``                    | ``pool/main/${PORTNAME:C/^((lib)?.).*$/\1/}/${PORTNAME}``           |
+-------------------------------+---------------------------------------------------------------------+
| ``FARSIGHT``                  | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``FESTIVAL``                  | ``${PORTREVISION}``                                                 |
+-------------------------------+---------------------------------------------------------------------+
| ``GCC``                       | ``releases/${DISTNAME}``                                            |
+-------------------------------+---------------------------------------------------------------------+
| ``GENTOO``                    | ``distfiles``                                                       |
+-------------------------------+---------------------------------------------------------------------+
| ``GIMP``                      | ``${PORTNAME}/${PORTVERSION:R}/``                                   |
+-------------------------------+---------------------------------------------------------------------+
| ``GH``                        | ``${GH_ACCOUNT}/${GH_PROJECT}/tar.gz/${GH_TAGNAME}?dummy=/``        |
+-------------------------------+---------------------------------------------------------------------+
| ``GHC``                       | ``${GH_ACCOUNT}/${GH_PROJECT}/``                                    |
+-------------------------------+---------------------------------------------------------------------+
| ``GNOME``                     | ``sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}``    |
+-------------------------------+---------------------------------------------------------------------+
| ``GNU``                       | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``GNUPG``                     | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``GNU_ALPHA``                 | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``HORDE``                     | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``LODEV``                     | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``MATE``                      | ``${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}``                        |
+-------------------------------+---------------------------------------------------------------------+
| ``MOZDEV``                    | ``${PORTNAME:tl}``                                                  |
+-------------------------------+---------------------------------------------------------------------+
| ``NL``                        | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``QT``                        | ``archive/qt/${PORTVERSION:R}``                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``SAMBA``                     | ``${PORTNAME}``                                                     |
+-------------------------------+---------------------------------------------------------------------+
| ``SAVANNAH``                  | ``${PORTNAME:tl}``                                                  |
+-------------------------------+---------------------------------------------------------------------+
| ``SF``                        | ``${PORTNAME:tl}/${PORTNAME:tl}/${PORTVERSION}``                    |
+-------------------------------+---------------------------------------------------------------------+

.. raw:: html

   </div>

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

5.4.3.?\ ``USE_GITHUB``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the distribution file comes from a specific commit or tag on
`GitHub <https://github.com>`__ for which there is no officially
released file, there is an easy way to set the right ``DISTNAME`` and
``MASTER_SITES`` automatically. These variables are available:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?5.5.?\ ``USE_GITHUB`` Description

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------+
| Variable         | Description                                                                                                                                                         | Default                                                      |
+==================+=====================================================================================================================================================================+==============================================================+
| ``GH_ACCOUNT``   | Account name of the GitHub user hosting the project                                                                                                                 | ``${PORTNAME}``                                              |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------+
| ``GH_PROJECT``   | Name of the project on GitHub                                                                                                                                       | ``${PORTNAME}``                                              |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------+
| ``GH_TAGNAME``   | Name of the tag to download (2.0.1, hash, ...) Using the name of a branch here is incorrect. It is also possible to use the hash of a commit id to do a snapshot.   | ``${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}``   |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.1.?Simple Use of ``USE_GITHUB``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

While trying to make a port for version ``1.2.7`` of pkg from the
FreeBSD user on github, at https://github.com/freebsd/pkg, The
``Makefile`` would end up looking like this (slightly stripped for the
example):

.. code:: programlisting

    PORTNAME=    pkg
    PORTVERSION=    1.2.7

    USE_GITHUB= yes
    GH_ACCOUNT= freebsd

It will automatically have ``MASTER_SITES`` set to ``GH         GHC``
and ``WRKSRC`` to ``${WRKDIR}/pkg-1.2.7``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.2.?More Complete Use of ``USE_GITHUB``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

While trying to make a port for the bleeding edge version of pkg from
the FreeBSD user on github, at https://github.com/freebsd/pkg, the
``Makefile`` ends up looking like this (slightly stripped for the
example):

.. code:: programlisting

    PORTNAME=    pkg-devel
    PORTVERSION=    1.3.0.a.20140411

    USE_GITHUB= yes
    GH_ACCOUNT= freebsd
    GH_PROJECT= pkg
    GH_TAGNAME= 6dbb17b

It will automatically have ``MASTER_SITES`` set to ``GH         GHC``
and ``WRKSRC`` to ``${WRKDIR}/pkg-6dbb17b``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.3.?Use of ``USE_GITHUB`` with ``DISTVERSIONPREFIX``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

From time to time, ``GH_TAGNAME`` is a slight variation from
``DISTVERSION``. For example, if the version is ``1.0.2``, the tag is
``v1.0.2``. In those cases, it is possible to use ``DISTVERSIONPREFIX``
or ``DISTVERSIONSUFFIX``:

.. code:: programlisting

    PORTNAME=  foo
    PORTVERSION=    1.0.2
    DISTVERSIONPREFIX=  v

    USE_GITHUB= yes

It will automatically set ``GH_TAGNAME`` to ``v1.0.2``, while ``WRKSRC``
will be kept to ``${WRKDIR}/foo-1.0.2``.

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

5.4.3.1.?Fetching Multiple Files From GitHub
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``USE_GITHUB`` framework also supports fetching multiple
distribution files from different places in GitHub. It works in a way
very similar to `Section?5.4.8, “Multiple Distribution or Patches Files
from Multiple
Locations” <makefile-distfiles.html#porting-master-sites-n>`__.

Multiple values are added to ``GH_ACCOUNT``, ``GH_PROJECT``, and
``GH_TAGNAME``. Each different value is assigned a tag. The main value
can either have no tag, or the ``:DEFAULT`` tag. A value can be omitted
if it is the same as the default as listed in `Table?5.5,
“\ ``USE_GITHUB``
Description” <makefile-distfiles.html#makefile-master_sites-github-description>`__.

For each tag, a ``${WRKSRC_tag``} helper variable is created, containing
the directory into which the file has been extracted. The
``${WRKSRC_tag``} variables can be used to move directories around
during ``post-extract``, or add to ``CONFIGURE_ARGS``, or whatever is
needed so that the software builds correctly.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.4.?Use of ``USE_GITHUB`` with Multiple Distribution Files

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

From time to time, there is a need to fetch more than one distribution
file. For example, when the upstream git repository uses submodules.
This can be done easily using tags in the ``GH_*`` variables:

.. code:: programlisting

    PORTNAME= foo
    PORTVERSION=    1.0.2

    USE_GITHUB= yes
    GH_ACCOUNT= bar:icons,contrib
    GH_PROJECT= foo-icons:icons foo-contrib:contrib
    GH_TAGNAME= 1.0:icons fa579bc:contrib

    CONFIGURE_ARGS= --with-contrib=${WRKSRC_contrib}

    post-extract:
          @${MV} ${WRKSRC_icons} ${WRKSRC}/icons

This will fetch three distribution files from github. The default one
comes from ``foo/foo`` and is version ``1.0.2``. The second one, tagged
``icons``, comes from ``bar/foo-icons`` and is in version ``1.0``. The
third one comes from ``bar/foo-contrib`` and uses the Git commit
``fa579bc``. The distribution files are named
``foo-foo-1.0.2_GH0.tar.gz``, ``bar-foo-icons-1.0_GH0.tar.gz``, and
``bar-foo-contrib-fa579bc_GH0.tar.gz``.

All the distribution files are extracted in ``${WRKDIR}`` in their
respective subdirectories. The default file is still extracted in
``${WRKSRC}``, in this case, ``${WRKDIR}/foo-1.0.2``. Each additional
distribution file is extracted in ``${WRKSRC_tag``}. Here, for the
``icons`` tag, it is called ``${WRKSRC_icons}`` and it contains
``${WRKDIR}/foo-icons-1.0``. The file with the ``contrib`` tag is called
``${WRKSRC_contrib}`` and contains ``${WRKDIR}/foo-contrib-fa579bc``.

.. raw:: html

   </div>

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

5.4.4.?\ ``EXTRACT_SUFX``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If there is one distribution file, and it uses an odd suffix to indicate
the compression mechanism, set ``EXTRACT_SUFX``.

For example, if the distribution file was named ``foo.tar.gzip`` instead
of the more normal ``foo.tar.gz``, write:

.. code:: programlisting

    DISTNAME=   foo
    EXTRACT_SUFX=   .tar.gzip

The ``USES=tar[:xxx``], ``USES=lha`` or ``USES=zip`` automatically set
``EXTRACT_SUFX`` to the most common archives extensions as necessary,
see `Chapter?15, *Values of ``USES``* <uses.html#uses-values>`__ for
more details. If neither of these are set then ``EXTRACT_SUFX`` defaults
to ``.tar.gz``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

As ``EXTRACT_SUFX`` is only used in ``DISTFILES``, only set one of
them..

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

5.4.5.?\ ``DISTFILES``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes the names of the files to be downloaded have no resemblance to
the name of the port. For example, it might be called ``source.tar.gz``
or similar. In other cases the application's source code might be in
several different archives, all of which must be downloaded.

If this is the case, set ``DISTFILES`` to be a space separated list of
all the files that must be downloaded.

.. code:: programlisting

    DISTFILES=   source1.tar.gz source2.tar.gz

If not explicitly set, ``DISTFILES`` defaults to
``${DISTNAME}${EXTRACT_SUFX}``.

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

5.4.6.?\ ``EXTRACT_ONLY``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If only some of the ``DISTFILES`` must be extracted—for example, one of
them is the source code, while another is an uncompressed document—list
the filenames that must be extracted in ``EXTRACT_ONLY``.

.. code:: programlisting

    DISTFILES=    source.tar.gz manual.html
    EXTRACT_ONLY=   source.tar.gz

When none of the ``DISTFILES`` need to be uncompressed, set
``EXTRACT_ONLY`` to the empty string.

.. code:: programlisting

    EXTRACT_ONLY=

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

5.4.7.?\ ``PATCHFILES``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port requires some additional patches that are available by FTP
or HTTP, set ``PATCHFILES`` to the names of the files and
``PATCH_SITES`` to the URL of the directory that contains them (the
format is the same as ``MASTER_SITES``).

If the patch is not relative to the top of the source tree (that is,
``WRKSRC``) because it contains some extra pathnames, set
``PATCH_DIST_STRIP`` accordingly. For instance, if all the pathnames in
the patch have an extra ``foozolix-1.0/`` in front of the filenames,
then set ``PATCH_DIST_STRIP=-p1``.

Do not worry if the patches are compressed; they will be decompressed
automatically if the filenames end with ``.Z``, ``.gz``, ``.bz2`` or
``.xz``.

If the patch is distributed with some other files, such as
documentation, in a ``gzip``\ ped tarball, using ``PATCHFILES`` is not
possible. If that is the case, add the name and the location of the
patch tarball to ``DISTFILES`` and ``MASTER_SITES``. Then, use
``EXTRA_PATCHES`` to point to those files and ``bsd.port.mk`` will
automatically apply them. In particular, do *not* copy patch files into
``${PATCHDIR}``. That directory may not be writable.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If there are multiple patches and they need mixed values for the strip
parameter, it can be added alongside the patch name in ``PATCHFILES``,
e.g:

.. code:: programlisting

    PATCHFILES= patch1 patch2:-p1

This does not conflict with `the master site grouping
feature <makefile-distfiles.html#porting-master-sites-n>`__, adding a
group also works:

.. code:: programlisting

    PATCHFILES= patch2:-p1:source2

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The tarball will have been extracted alongside the regular source by
then, so there is no need to explicitly extract it if it is a regular
``gzip``\ ped or ``compress``\ ed tarball. Take extra care not to
overwrite something that already exists in that directory if extracting
it manually. Also, do not forget to add a command to remove the copied
patch in the ``pre-clean`` target.

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

5.4.8.?Multiple Distribution or Patches Files from Multiple Locations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

(Consider this to be a somewhat “advanced topic”; those new to this
document may wish to skip this section at first).

This section has information on the fetching mechanism known as both
``MASTER_SITES:n`` and ``MASTER_SITES_NN``. We will refer to this
mechanism as ``MASTER_SITES:n``.

A little background first. OpenBSD has a neat feature inside
``DISTFILES`` and ``PATCHFILES`` which allows files and patches to be
postfixed with ``:n`` identifiers. Here, ``n`` can be both ``[0-9]`` and
denote a group designation. For example:

.. code:: programlisting

    DISTFILES=  alpha:0 beta:1

In OpenBSD, distribution file ``alpha`` will be associated with variable
``MASTER_SITES0`` instead of our common ``MASTER_SITES`` and ``beta``
with ``MASTER_SITES1``.

This is a very interesting feature which can decrease that endless
search for the correct download site.

Just picture 2 files in ``DISTFILES`` and 20 sites in ``MASTER_SITES``,
the sites slow as hell where ``beta`` is carried by all sites in
``MASTER_SITES``, and ``alpha`` can only be found in the 20th site. It
would be such a waste to check all of them if the maintainer knew this
beforehand, would it not? Not a good start for that lovely weekend!

Now that you have the idea, just imagine more ``DISTFILES`` and more
``MASTER_SITES``. Surely our “distfiles survey meister” would appreciate
the relief to network strain that this would bring.

In the next sections, information will follow on the FreeBSD
implementation of this idea. We improved a bit on OpenBSD's concept.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.8.1.?Simplified Information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section explains how to quickly prepare fine grained fetching of
multiple distribution files and patches from different sites and
subdirectories. We describe here a case of simplified ``MASTER_SITES:n``
usage. This will be sufficient for most scenarios. More detailed
information are available in `Section?5.4.8.2, “Detailed
Information” <makefile-distfiles.html#ports-master-sites-n-detailed>`__.

Some applications consist of multiple distribution files that must be
downloaded from a number of different sites. For example, Ghostscript
consists of the core of the program, and then a large number of driver
files that are used depending on the user's printer. Some of these
driver files are supplied with the core, but many others must be
downloaded from a variety of different sites.

To support this, each entry in ``DISTFILES`` may be followed by a colon
and a “tag name”. Each site listed in ``MASTER_SITES`` is then followed
by a colon, and the tag that indicates which distribution files are
downloaded from this site.

For example, consider an application with the source split in two parts,
``source1.tar.gz`` and ``source2.tar.gz``, which must be downloaded from
two different sites. The port's ``Makefile`` would include lines like
`Example?5.5, “Simplified Use of ``MASTER_SITES:n`` with One File Per
Site” <makefile-distfiles.html#ports-master-sites-n-example-simple-use-one-file-per-site>`__.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.5.?Simplified Use of ``MASTER_SITES:n`` with One File Per Site

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    MASTER_SITES= ftp://ftp1.example.com/:source1 \
            http://www.example.com/:source2
    DISTFILES=  source1.tar.gz:source1 \
            source2.tar.gz:source2

.. raw:: html

   </div>

.. raw:: html

   </div>

Multiple distribution files can have the same tag. Continuing the
previous example, suppose that there was a third distfile,
``source3.tar.gz``, that is downloaded from ``ftp.example2.com``. The
``Makefile`` would then be written like `Example?5.6, “Simplified Use of
``MASTER_SITES:n`` with More Than One File Per
Site” <makefile-distfiles.html#ports-master-sites-n-example-simple-use-more-than-one-file-per-site>`__.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.6.?Simplified Use of ``MASTER_SITES:n`` with More Than One
File Per Site

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    MASTER_SITES=   ftp://ftp.example.com/:source1 \
            http://www.example.com/:source2
    DISTFILES=  source1.tar.gz:source1 \
            source2.tar.gz:source2 \
            source3.tar.gz:source2

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

5.4.8.2.?Detailed Information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Okay, so the previous example did not reflect the new port's needs? In
this section we will explain in detail how the fine grained fetching
mechanism ``MASTER_SITES:n`` works and how it can be used.

.. raw:: html

   <div class="orderedlist">

#. Elements can be postfixed with ``:n`` where *``n``* is ``[^:,]+``,
   that is, *``n``* could conceptually be any alphanumeric string but we
   will limit it to ``[a-zA-Z_][0-9a-zA-Z_]+`` for now.

   Moreover, string matching is case sensitive; that is, ``n`` is
   different from ``N``.

   However, these words cannot be used for postfixing purposes since
   they yield special meaning: ``default``, ``all`` and ``ALL`` (they
   are used internally in item
   `ii <makefile-distfiles.html#porting-master-sites-n-what-changes-in-port-targets>`__).
   Furthermore, ``DEFAULT`` is a special purpose word (check item
   `3 <makefile-distfiles.html#porting-master-sites-n-DEFAULT-group>`__).

#. Elements postfixed with ``:n`` belong to the group ``n``, ``:m``
   belong to group ``m`` and so forth.

#. Elements without a postfix are groupless, they all belong to the
   special group ``DEFAULT``. Any elements postfixed with ``DEFAULT``,
   is just being redundant unless an element belongs to both ``DEFAULT``
   and other groups at the same time (check item
   `5 <makefile-distfiles.html#porting-master-sites-n-comma-operator>`__).

   These examples are equivalent but the first one is preferred:

   .. code:: programlisting

       MASTER_SITES=    alpha

   .. code:: programlisting

       MASTER_SITES=    alpha:DEFAULT

#. Groups are not exclusive, an element may belong to several different
   groups at the same time and a group can either have either several
   different elements or none at all.

#. When an element belongs to several groups at the same time, use the
   comma operator (``,``).

   Instead of repeating it several times, each time with a different
   postfix, we can list several groups at once in a single postfix. For
   instance, ``:m,n,o`` marks an element that belongs to group ``m``,
   ``n`` and ``o``.

   All these examples are equivalent but the last one is preferred:

   .. code:: programlisting

       MASTER_SITES=   alpha alpha:SOME_SITE

   .. code:: programlisting

       MASTER_SITES=    alpha:DEFAULT alpha:SOME_SITE

   .. code:: programlisting

       MASTER_SITES=    alpha:SOME_SITE,DEFAULT

   .. code:: programlisting

       MASTER_SITES=  alpha:DEFAULT,SOME_SITE

#. All sites within a given group are sorted according to
   ``MASTER_SORT_AWK``. All groups within ``MASTER_SITES`` and
   ``PATCH_SITES`` are sorted as well.

#. Group semantics can be used in any of the variables ``MASTER_SITES``,
   ``PATCH_SITES``, ``MASTER_SITE_SUBDIR``, ``PATCH_SITE_SUBDIR``,
   ``DISTFILES``, and ``PATCHFILES`` according to this syntax:

   .. raw:: html

      <div class="orderedlist">

   #. All ``MASTER_SITES``, ``PATCH_SITES``, ``MASTER_SITE_SUBDIR`` and
      ``PATCH_SITE_SUBDIR`` elements must be terminated with the forward
      slash ``/`` character. If any elements belong to any groups, the
      group postfix ``:n`` must come right after the terminator ``/``.
      The ``MASTER_SITES:n`` mechanism relies on the existence of the
      terminator ``/`` to avoid confusing elements where a ``:n`` is a
      valid part of the element with occurrences where ``:n`` denotes
      group ``n``. For compatibility purposes, since the ``/``
      terminator was not required before in both ``MASTER_SITE_SUBDIR``
      and ``PATCH_SITE_SUBDIR`` elements, if the postfix immediate
      preceding character is not a ``/`` then ``:n`` will be considered
      a valid part of the element instead of a group postfix even if an
      element is postfixed with ``:n``. See both `Example?5.7, “Detailed
      Use of ``MASTER_SITES:n`` in
      ``MASTER_SITE_SUBDIR``\ ” <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-subdir>`__
      and `Example?5.8, “Detailed Use of ``MASTER_SITES:n`` with Comma
      Operator, Multiple Files, Multiple Sites and Multiple
      Subdirectories” <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-complete-example-master-sites>`__.

      .. raw:: html

         <div class="example">

      .. raw:: html

         <div class="example-title">

      Example?5.7.?Detailed Use of ``MASTER_SITES:n`` in
      ``MASTER_SITE_SUBDIR``

      .. raw:: html

         </div>

      .. raw:: html

         <div class="example-contents">

      .. code:: programlisting

          MASTER_SITE_SUBDIR=  old:n new/:NEW

      .. raw:: html

         <div class="itemizedlist">

      -  Directories within group ``DEFAULT`` -> old:n

      -  Directories within group ``NEW`` -> new

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      | 

      .. raw:: html

         <div class="example">

      .. raw:: html

         <div class="example-title">

      Example?5.8.?Detailed Use of ``MASTER_SITES:n`` with Comma
      Operator, Multiple Files, Multiple Sites and Multiple
      Subdirectories

      .. raw:: html

         </div>

      .. raw:: html

         <div class="example-contents">

      .. code:: programlisting

          MASTER_SITES=    http://site1/%SUBDIR%/ http://site2/:DEFAULT \
                  http://site3/:group3 http://site4/:group4 \
                  http://site5/:group5 http://site6/:group6 \
                  http://site7/:DEFAULT,group6 \
                  http://site8/%SUBDIR%/:group6,group7 \
                  http://site9/:group8
          DISTFILES=  file1 file2:DEFAULT file3:group3 \
                  file4:group4,group5,group6 file5:grouping \
                  file6:group7
          MASTER_SITE_SUBDIR= directory-trial:1 directory-n/:groupn \
                  directory-one/:group6,DEFAULT \
                  directory

      The previous example results in this fine grained fetching. Sites
      are listed in the exact order they will be used.

      .. raw:: html

         <div class="itemizedlist">

      -  ``file1`` will be fetched from

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site1/directory-trial:1/

         -  http://site1/directory-one/

         -  http://site1/directory/

         -  http://site2/

         -  http://site7/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file2`` will be fetched exactly as ``file1`` since they both
         belong to the same group

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site1/directory-trial:1/

         -  http://site1/directory-one/

         -  http://site1/directory/

         -  http://site2/

         -  http://site7/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file3`` will be fetched from

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site3/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file4`` will be fetched from

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site4/

         -  http://site5/

         -  http://site6/

         -  http://site7/

         -  http://site8/directory-one/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file5`` will be fetched from

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file6`` will be fetched from

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site8/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      | 

   .. raw:: html

      </div>

#. How do I group one of the special macros from ``bsd.sites.mk``, for
   example, SourceForge (``SF``)?

   This has been simplified as much as possible. See `Example?5.9,
   “Detailed Use of ``MASTER_SITES:n`` with SourceForge
   (``SF``)” <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-sourceforge>`__.

   .. raw:: html

      <div class="example">

   .. raw:: html

      <div class="example-title">

   Example?5.9.?Detailed Use of ``MASTER_SITES:n`` with SourceForge
   (``SF``)

   .. raw:: html

      </div>

   .. raw:: html

      <div class="example-contents">

   .. code:: programlisting

       MASTER_SITES= http://site1/ SF/something/1.0:sourceforge,TEST
       DISTFILES=  something.tar.gz:sourceforge

   ``something.tar.gz`` will be fetched from all sites within
   SourceForge.

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

#. How do I use this with ``PATCH*``?

   All examples were done with ``MASTER*`` but they work exactly the
   same for ``PATCH*`` ones as can be seen in `Example?5.10, “Simplified
   Use of ``MASTER_SITES:n`` with
   ``PATCH_SITES``\ ” <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-patch-sites>`__.

   .. raw:: html

      <div class="example">

   .. raw:: html

      <div class="example-title">

   Example?5.10.?Simplified Use of ``MASTER_SITES:n`` with
   ``PATCH_SITES``

   .. raw:: html

      </div>

   .. raw:: html

      <div class="example-contents">

   .. code:: programlisting

       PATCH_SITES=    http://site1/ http://site2/:test
       PATCHFILES= patch1:test

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

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

5.4.8.3.?What Does Change for Ports? What Does Not?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. All current ports remain the same. The ``MASTER_SITES:n`` feature
   code is only activated if there are elements postfixed with ``:n``
   like elements according to the aforementioned syntax rules,
   especially as shown in item
   `7 <makefile-distfiles.html#porting-master-sites-n-group-semantics>`__.

#. The port targets remain the same: ``checksum``, ``makesum``,
   ``patch``, ``configure``, ``build``, etc. With the obvious exceptions
   of ``do-fetch``, ``fetch-list``, ``master-sites`` and
   ``patch-sites``.

   .. raw:: html

      <div class="itemizedlist">

   -  ``do-fetch``: deploys the new grouping postfixed ``DISTFILES`` and
      ``PATCHFILES`` with their matching group elements within both
      ``MASTER_SITES`` and ``PATCH_SITES`` which use matching group
      elements within both ``MASTER_SITE_SUBDIR`` and
      ``PATCH_SITE_SUBDIR``. Check `Example?5.8, “Detailed Use of
      ``MASTER_SITES:n`` with Comma Operator, Multiple Files, Multiple
      Sites and Multiple
      Subdirectories” <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-complete-example-master-sites>`__.

   -  ``fetch-list``: works like old ``fetch-list`` with the exception
      that it groups just like ``do-fetch``.

   -  ``master-sites`` and ``patch-sites``: (incompatible with older
      versions) only return the elements of group ``DEFAULT``; in fact,
      they execute targets ``master-sites-default`` and
      ``patch-sites-default`` respectively.

      Furthermore, using target either ``master-sites-all`` or
      ``patch-sites-all`` is preferred to directly checking either
      ``MASTER_SITES`` or ``PATCH_SITES``. Also, directly checking is
      not guaranteed to work in any future versions. Check item
      `B <makefile-distfiles.html#porting-master-sites-n-new-port-targets-master-sites-all>`__
      for more information on these new port targets.

   .. raw:: html

      </div>

#. New port targets

   .. raw:: html

      <div class="orderedlist">

   #. There are ``master-sites-n`` and ``patch-sites-n`` targets which
      will list the elements of the respective group *``n``* within
      ``MASTER_SITES`` and ``PATCH_SITES`` respectively. For instance,
      both ``master-sites-DEFAULT`` and ``patch-sites-DEFAULT`` will
      return the elements of group ``DEFAULT``, ``master-sites-test``
      and ``patch-sites-test`` of group ``test``, and thereon.

   #. There are new targets ``master-sites-all`` and ``patch-sites-all``
      which do the work of the old ``master-sites`` and ``patch-sites``
      ones. They return the elements of all groups as if they all
      belonged to the same group with the caveat that it lists as many
      ``MASTER_SITE_BACKUP`` and ``MASTER_SITE_OVERRIDE`` as there are
      groups defined within either ``DISTFILES`` or ``PATCHFILES``;
      respectively for ``master-sites-all`` and ``patch-sites-all``.

   .. raw:: html

      </div>

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

5.4.9.?\ ``DIST_SUBDIR``
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do not let the port clutter ``/usr/ports/distfiles``. If the port
requires a lot of files to be fetched, or contains a file that has a
name that might conflict with other ports (for example, ``Makefile``),
set ``DIST_SUBDIR`` to the name of the port (``${PORTNAME}`` or
``${PKGNAMEPREFIX}${PORTNAME}`` are fine). This will change ``DISTDIR``
from the default ``/usr/ports/distfiles`` to
``/usr/ports/distfiles/${DIST_SUBDIR}``, and in effect puts everything
that is required for the port into that subdirectory.

It will also look at the subdirectory with the same name on the backup
master site at ``ftp.FreeBSD.org``. (Setting ``DISTDIR`` explicitly in
``Makefile`` will not accomplish this, so please use ``DIST_SUBDIR``.)

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This does not affect ``MASTER_SITES`` defined in the ``Makefile``.

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

5.4.10.?\ ``ALWAYS_KEEP_DISTFILES``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port uses binary distfiles and has a license that requires that
the source code is provided with packages distributed in binary form,
like GPL, ``ALWAYS_KEEP_DISTFILES`` will instruct the FreeBSD build
cluster to keep a copy of the files specified in ``DISTFILES``. Users of
these ports will generally not need these files, so it is a good idea to
only add the source distfiles to ``DISTFILES`` when ``PACKAGE_BUILDING``
is defined.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.11.?Use of ``ALWAYS_KEEP_DISTFILES``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    .if defined(PACKAGE_BUILDING)
    DISTFILES+=     foo.tar.gz
    ALWAYS_KEEP_DISTFILES=  yes
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

When adding extra files to ``DISTFILES``, make sure to also add them to
``distinfo``. Also, the additional files will normally be extracted into
``WRKDIR`` as well, which for some ports may lead to undesirable side
effects and require special handling.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+------------------------------------------+
| `Prev <makefile-categories.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-maintainer.html>`__   |
+----------------------------------------+---------------------------+------------------------------------------+
| 5.3.?Categorization?                   | `Home <index.html>`__     | ?5.5.?\ ``MAINTAINER``                   |
+----------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
