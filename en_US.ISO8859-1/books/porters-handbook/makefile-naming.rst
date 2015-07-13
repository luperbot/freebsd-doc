===========
5.2.?Naming
===========

.. raw:: html

   <div class="navheader">

5.2.?Naming
`Prev <makefiles.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-categories.html>`__

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

5.2.?Naming
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first part of the port's ``Makefile`` names the port, describes its
version number, and lists it in the correct category.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.1.?\ ``PORTNAME`` and ``PORTVERSION``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set ``PORTNAME`` to the base name of the port, and ``PORTVERSION`` to
the version number of the port.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

The package name must be unique among all of the ports tree. Make sure
that there is not already a port with the same ``PORTNAME`` and if there
is add one of ```PKGNAMEPREFIX`` or
``PKGNAMESUFFIX`` <makefile-naming.html#porting-pkgnameprefix-suffix>`__.

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

5.2.2.?\ ``PORTREVISION`` and ``PORTEPOCH``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

5.2.2.1.?\ ``PORTREVISION``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``PORTREVISION`` is a monotonically increasing value which is reset to 0
with every increase of ``PORTVERSION``, typically every time there is a
new official vendor release. If ``PORTREVISION`` is non-zero, the value
is appended to the package name. Changes to ``PORTREVISION`` are used by
automated tools like
`pkg-version(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-version&sektion=8>`__
to determine that a new package is available.

``PORTREVISION`` must be increased each time a change is made to the
port that changes the generated package in any way. That includes
changes that only affect a package built with non-default
`options <makefile-options.html>`__.

Examples of when ``PORTREVISION`` must be bumped:

.. raw:: html

   <div class="itemizedlist">

-  Addition of patches to correct security vulnerabilities, bugs, or to
   add new functionality to the port.

-  Changes to the port ``Makefile`` to enable or disable compile-time
   options in the package.

-  Changes in the packing list or the install-time behavior of the
   package. For example, a change to a script which generates initial
   data for the package, like
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
   host keys.

-  Version bump of a port's shared library dependency (in this case,
   someone trying to install the old package after installing a newer
   version of the dependency will fail since it will look for the old
   libfoo.x instead of libfoo.(x+1)).

-  Silent changes to the port distfile which have significant functional
   differences. For example, changes to the distfile requiring a
   correction to ``distinfo`` with no corresponding change to
   ``PORTVERSION``, where a ``diff -ru`` of the old and new versions
   shows non-trivial changes to the code.

.. raw:: html

   </div>

Examples of changes which do not require a ``PORTREVISION`` bump:

.. raw:: html

   <div class="itemizedlist">

-  Style changes to the port skeleton with no functional change to what
   appears in the resulting package.

-  Changes to ``MASTER_SITES`` or other functional changes to the port
   which do not affect the resulting package.

-  Trivial patches to the distfile such as correction of typos, which
   are not important enough that users of the package have to go to the
   trouble of upgrading.

-  Build fixes which cause a package to become compilable where it was
   previously failing. As long as the changes do not introduce any
   functional change on any other platforms on which the port did
   previously build. Since ``PORTREVISION`` reflects the content of the
   package, if the package was not previously buildable then there is no
   need to increase ``PORTREVISION`` to mark a change.

.. raw:: html

   </div>

A rule of thumb is to decide whether a change committed to a port is
something which *some* people would benefit from having. Either because
of an enhancement, fix, or by virtue that the new package will actually
work at all. Then weigh that against that fact that it will cause
everyone who regularly updates their ports tree to be compelled to
update. If yes, ``PORTREVISION`` must be bumped.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

People using binary packages will *never* see the update if
``PORTREVISION`` is not bumped. Without increasing ``PORTREVISION``, the
package builders have no way to detect the change and thus, will not
rebuild the package.

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

5.2.2.2.?\ ``PORTEPOCH``
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

From time to time a software vendor or FreeBSD porter will do something
silly and release a version of their software which is actually
numerically less than the previous version. An example of this is a port
which goes from foo-20000801 to foo-1.0 (the former will be incorrectly
treated as a newer version since 20000801 is a numerically greater value
than 1).

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The results of version number comparisons are not always obvious.
``pkg version`` (see
`pkg-version(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-version&sektion=8>`__)
can be used to test the comparison of two version number strings. For
example:

.. code:: screen

    % pkg version -t 0.031 0.29
            >

The ``>`` output indicates that version 0.031 is considered greater than
version 0.29, which may not have been obvious to the porter.

.. raw:: html

   </div>

In situations such as this, ``PORTEPOCH`` must be increased. If
``PORTEPOCH`` is nonzero it is appended to the package name as described
in section 0 above. ``PORTEPOCH`` must never be decreased or reset to
zero, because that would cause comparison to a package from an earlier
epoch to fail. For example, the package would not be detected as out of
date. The new version number, ``1.0,1`` in the above example, is still
numerically less than the previous version, 20000801, but the ``,1``
suffix is treated specially by automated tools and found to be greater
than the implied suffix ``,0`` on the earlier package.

Dropping or resetting ``PORTEPOCH`` incorrectly leads to no end of
grief. If the discussion above was not clear enough, please consult the
`FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__.

It is expected that ``PORTEPOCH`` will not be used for the majority of
ports, and that sensible use of ``PORTVERSION`` can often preempt it
becoming necessary if a future release of the software changes the
version structure. However, care is needed by FreeBSD porters when a
vendor release is made without an official version number — such as a
code “snapshot” release. The temptation is to label the release with the
release date, which will cause problems as in the example above when a
new “official” release is made.

For example, if a snapshot release is made on the date ``20000917``, and
the previous version of the software was version ``1.2``, do not use
``20000917`` for ``PORTVERSION``. The correct way is a ``PORTVERSION``
of ``1.2.20000917``, or similar, so that the succeeding release, say
``1.3``, is still a numerically greater value.

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

5.2.2.3.?Example of ``PORTREVISION`` and ``PORTEPOCH`` Usage
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``gtkmumble`` port, version ``0.10``, is committed to the ports
collection:

.. code:: programlisting

    PORTNAME=  gtkmumble
    PORTVERSION=    0.10

``PKGNAME`` becomes ``gtkmumble-0.10``.

A security hole is discovered which requires a local FreeBSD patch.
``PORTREVISION`` is bumped accordingly.

.. code:: programlisting

    PORTNAME= gtkmumble
    PORTVERSION=    0.10
    PORTREVISION=   1

``PKGNAME`` becomes ``gtkmumble-0.10_1``

A new version is released by the vendor, numbered ``0.2`` (it turns out
the author actually intended ``0.10`` to actually mean ``0.1.0``, not
“what comes after 0.9” - oops, too late now). Since the new minor
version ``2`` is numerically less than the previous version ``10``,
``PORTEPOCH`` must be bumped to manually force the new package to be
detected as “newer”. Since it is a new vendor release of the code,
``PORTREVISION`` is reset to 0 (or removed from the ``Makefile``).

.. code:: programlisting

    PORTNAME=    gtkmumble
    PORTVERSION=    0.2
    PORTEPOCH=  1

``PKGNAME`` becomes ``gtkmumble-0.2,1``

The next release is 0.3. Since ``PORTEPOCH`` never decreases, the
version variables are now:

.. code:: programlisting

    PORTNAME=   gtkmumble
    PORTVERSION=    0.3
    PORTEPOCH=  1

``PKGNAME`` becomes ``gtkmumble-0.3,1``

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If ``PORTEPOCH`` were reset to ``0`` with this upgrade, someone who had
installed the ``gtkmumble-0.10_1`` package would not detect the
``gtkmumble-0.3`` package as newer, since ``3`` is still numerically
less than ``10``. Remember, this is the whole point of ``PORTEPOCH`` in
the first place.

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

5.2.3.?\ ``PKGNAMEPREFIX`` and ``PKGNAMESUFFIX``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Two optional variables, ``PKGNAMEPREFIX`` and ``PKGNAMESUFFIX``, are
combined with ``PORTNAME`` and ``PORTVERSION`` to form ``PKGNAME`` as
``${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}``. Make
sure this conforms to our `guidelines for a good package
name <makefile-naming.html#porting-pkgname>`__. In particular, the use
of a hyphen (``-``) in ``PORTVERSION`` is *not* allowed. Also, if the
package name has the *``language-``* or the *``-compiled.specifics``*
part (see below), use ``PKGNAMEPREFIX`` and ``PKGNAMESUFFIX``,
respectively. Do not make them part of ``PORTNAME``.

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

5.2.4.?Package Naming Conventions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These are the conventions to follow when naming packages. This is to
make the package directory easy to scan, as there are already thousands
of packages and users are going to turn away if they hurt their eyes!

Package names take the form of
``language_region-name-compiled.specifics-version.numbers``.

The package name is defined as
``${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}``. Make
sure to set the variables to conform to that format.

.. raw:: html

   <div class="variablelist">

``language_region-``
    FreeBSD strives to support the native language of its users. The
    *``language-``* part is a two letter abbreviation of the natural
    language defined by ISO-639 when the port is specific to a certain
    language. Examples are ``ja`` for Japanese, ``ru`` for Russian,
    ``vi`` for Vietnamese, ``zh`` for Chinese, ``ko`` for Korean and
    ``de`` for German.

    If the port is specific to a certain region within the language
    area, add the two letter country code as well. Examples are
    ``en_US`` for US English and ``fr_CH`` for Swiss French.

    The *``language-``* part is set in ``PKGNAMEPREFIX``.

``name``
    Make sure that the port's name and version are clearly separated and
    placed into ``PORTNAME`` and ``PORTVERSION``. The only reason for
    ``PORTNAME`` to contain a version part is if the upstream
    distribution is really named that way, as in the
    `textproc/libxml2 <http://www.freebsd.org/cgi/url.cgi?ports/textproc/libxml2/pkg-descr>`__
    or
    `japanese/kinput2-freewnn <http://www.freebsd.org/cgi/url.cgi?ports/japanese/kinput2-freewnn/pkg-descr>`__
    ports. Otherwise, ``PORTNAME`` cannot contain any version-specific
    information. It is quite normal for several ports to have the same
    ``PORTNAME``, as the
    `www/apache\* <http://www.freebsd.org/cgi/url.cgi?ports/www/apache*/pkg-descr>`__
    ports do; in that case, different versions (and different index
    entries) are distinguished by ``PKGNAMEPREFIX`` and
    ``PKGNAMESUFFIX`` values.

    There is a tradition of naming ``Perl 5`` modules by prepending
    ``p5-`` and converting the double-colon separator to a hyphen. For
    example, the ``Data::Dumper`` module becomes ``p5-Data-Dumper``.

``-compiled.specifics``
    If the port can be built with different `hardcoded
    defaults <makefile-masterdir.html>`__ (usually part of the directory
    name in a family of ports), the *``-compiled.specifics``* part
    states the compiled-in defaults. The hyphen is optional. Examples
    are paper size and font units.

    The *``-compiled.specifics``* part is set in ``PKGNAMESUFFIX``.

``-version.numbers``
    The version string follows a dash (``-``) and is a period-separated
    list of integers and single lowercase alphabetics. In particular, it
    is not permissible to have another dash inside the version string.
    The only exception is the string ``pl`` (meaning “patchlevel”),
    which can be used *only* when there are no major and minor version
    numbers in the software. If the software version has strings like
    “alpha”, “beta”, “rc”, or “pre”, take the first letter and put it
    immediately after a period. If the version string continues after
    those names, the numbers follow the single alphabet without an extra
    period between them (for example, ``1.0b2``).

    The idea is to make it easier to sort ports by looking at the
    version string. In particular, make sure version number components
    are always delimited by a period, and if the date is part of the
    string, use the ``0.0.yyyy``.\ *``mm``*.\ *``dd``* format, not
    ``dd``.\ *``mm``*.\ *``yyyy``* or the non-Y2K compliant
    ``yy``.\ *``mm``*.\ *``dd``* format. It is important to prefix the
    version with ``0.0.`` in case a release with an actual version
    number is made, which would be numerically less than ``yyyy``.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Package name must be unique among all of the ports tree, check that
there is not already a port with the same ``PORTNAME`` and if there is
add one of ```PKGNAMEPREFIX`` or
``PKGNAMESUFFIX`` <makefile-naming.html#porting-pkgnameprefix-suffix>`__.

.. raw:: html

   </div>

Here are some (real) examples on how to convert the name as called by
the software authors to a suitable package name:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?5.1.?Package Naming Examples

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| Distribution Name   | ``PKGNAMEPREFIX``   | ``PORTNAME``   | ``PKGNAMESUFFIX``   | ``PORTVERSION``   | Reason                                                    |
+=====================+=====================+================+=====================+===================+===========================================================+
| mule-2.2.2          | (empty)             | mule           | (empty)             | 2.2.2             | No changes required                                       |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| mule-1.0.1          | (empty)             | mule           | 1                   | 1.0.1             | ``mule`` already exists                                   |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| EmiClock-1.0.2      | (empty)             | emiclock       | (empty)             | 1.0.2             | No uppercase names for single programs                    |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| rdist-1.3alpha      | (empty)             | rdist          | (empty)             | 1.3.a             | No strings like ``alpha`` allowed                         |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| es-0.9-beta1        | (empty)             | es             | (empty)             | 0.9.b1            | No strings like ``beta`` allowed                          |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| mailman-2.0rc3      | (empty)             | mailman        | (empty)             | 2.0.r3            | No strings like ``rc`` allowed                            |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| v3.3beta021.src     | (empty)             | tiff           | (empty)             | 3.3               | What the heck was that anyway?                            |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| tvtwm               | (empty)             | tvtwm          | (empty)             | pl11              | Version string always required                            |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| piewm               | (empty)             | piewm          | (empty)             | 1.0               | Version string always required                            |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| xvgr-2.10pl1        | (empty)             | xvgr           | (empty)             | 2.10.1            | ``pl`` allowed only when no major/minor version numbers   |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| gawk-2.15.6         | ja-                 | gawk           | (empty)             | 2.15.6            | Japanese language version                                 |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| psutils-1.13        | (empty)             | psutils        | -letter             | 1.13              | Paper size hardcoded at package build time                |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| pkfonts             | (empty)             | pkfonts        | 300                 | 1.0               | Package for 300dpi fonts                                  |
+---------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

If there is absolutely no trace of version information in the original
source and it is unlikely that the original author will ever release
another version, just set the version string to ``1.0`` (like the
``piewm`` example above). Otherwise, ask the original author or use the
date string the source file was released on
(``0.0.yyyy``.\ *``mm``*.\ *``dd``*) as the version.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+------------------------------------------+
| `Prev <makefiles.html>`__?             | `Up <makefiles.html>`__   | ?\ `Next <makefile-categories.html>`__   |
+----------------------------------------+---------------------------+------------------------------------------+
| Chapter?5.?Configuring the Makefile?   | `Home <index.html>`__     | ?5.3.?Categorization                     |
+----------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
