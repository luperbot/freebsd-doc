=============
4.4.?Patching
=============

.. raw:: html

   <div class="navheader">

4.4.?Patching
`Prev <slow-modifying.html>`__?
Chapter?4.?Slow Porting
?\ `Next <slow-configure.html>`__

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

4.4.?Patching
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In the preparation of the port, files that have been added or changed
can be recorded with
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
for later feeding to
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1>`__.
Doing this with a typical file involves saving a copy of the original
file before making any changes using a ``.orig`` suffix.

.. code:: screen

    % cp file file.orig

After all changes have been made, ``cd`` back to the port directory. Use
``make makepatch`` to generate updated patch files in the ``files``
directory.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.4.1.?General Rules for Patching
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Patch files are stored in ``PATCHDIR``, usually ``files/``, from where
they will be automatically applied. All patches must be relative to
``WRKSRC``. Typically ``WRKSRC`` is a subdirectory of ``WRKDIR``, the
directory where the distfile is extracted. Use ``make -V WRKSRC`` to see
the actual path. The patch names are to follow these rules:

.. raw:: html

   <div class="itemizedlist">

-  Avoid having more than one patch modify the same file. For example,
   having both ``patch-foobar.c`` and ``patch-foobar.c2`` making changes
   to ``${WRKSRC}/foobar.c`` makes them fragile and difficult to debug.

-  When creating names for patch files, replace each underscore (``_``)
   with two underscores (``__``) and each slash (``/``) with one
   underscore (``_``). For example, to patch a file named
   ``src/freeglut_joystick.c``, name the corresponding patch
   ``patch-src_freeglut__joystick.c``. Do not name patches like
   ``patch-aa`` or ``patch-ab``. Always use the path and file name in
   patch names. Using ``make           makepatch`` automatically
   generates the correct names.

-  A patch may modify multiple files if the changes are related and the
   patch is named appropriately. For example,
   ``patch-add-missing-stdlib.h``.

-  Only use characters ``[-+._a-zA-Z0-9]`` for naming patches. In
   particular, *do not use ``::`` as a path separator,* use ``_``
   instead.

.. raw:: html

   </div>

Minimize the amount of non-functional whitespace changes in patches. It
is common in the Open Source world for projects to share large amounts
of a code base, but obey different style and indenting rules. When
taking a working piece of functionality from one project to fix similar
areas in another, please be careful: the resulting patch may be full of
non-functional changes. It not only increases the size of the ports
repository but makes it hard to find out what exactly caused the problem
and what was changed at all.

If a file must be deleted, do it in the ``post-extract`` target rather
than as part of the patch.

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

4.4.2.?Manual Patch Generation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Manual patch creation is usually not necessary. Automatic patch
generation as described earlier in this section is the preferred method.
However, manual patching may be required occasionally.

.. raw:: html

   </div>

Patches are saved into files named ``patch-*`` where *``*``* indicates
the pathname of the file that is patched, such as ``patch-Imakefile`` or
``patch-src-config.h``.

After the file has been modified,
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__ is
used to record the differences between the original and the modified
version. ``-u`` causes
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__ to
produce “unified” diffs, the preferred form.

.. code:: screen

    % diff -u file.orig file > patch-pathname-file

When generating patches for new, added files, ``-N`` is used to tell
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__ to
treat the non-existent original file as if it existed but was empty:

.. code:: screen

    % diff -u -N newfile.orig newfile > patch-pathname-newfile

Do not add ``$FreeBSD$`` RCS strings in patches. When patches are added
to the Subversion repository with ``svn add``, the ``fbsd:nokeywords``
property is set to ``yes`` automatically so keywords in the patch are
not modified when committed. The property can be added manually with
``svn propset fbsd:nokeywords yes       files...``.

Using the recurse (``-r``) option to
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__ to
generate patches is fine, but please look at the resulting patches to
make sure there is no unnecessary junk in there. In particular, diffs
between two backup files, ``Makefile``\ s when the port uses ``Imake``
or GNU ``configure``, etc., are unnecessary and have to be deleted. If
it was necessary to edit ``configure.in`` and run ``autoconf`` to
regenerate ``configure``, do not take the diffs of ``configure`` (it
often grows to a few thousand lines!). Instead, define
``USE_AUTOTOOLS=autoconf:261`` and take the diffs of ``configure.in``.

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

4.4.3.?Simple Automatic Replacements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Simple replacements can be performed directly from the port ``Makefile``
using the in-place mode of
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1>`__.
This is useful when changes use the value of a variable:

.. code:: programlisting

    post-patch:
        @${REINPLACE_CMD} -e 's|for Linux|for FreeBSD|g' ${WRKSRC}/README

Quite often, software being ported uses the CR/LF convention in source
files. This may cause problems with further patching, compiler warnings,
or script execution (like ``/bin/sh^M not found``.) To quickly convert
all files from CR/LF to just LF, add this entry to the port
``Makefile``:

.. code:: programlisting

    USES=    dos2unix

A list of specific files to convert can be given:

.. code:: programlisting

    USES= dos2unix
    DOS2UNIX_FILES= util.c util.h

Use ``DOS2UNIX_REGEX`` to convert a group of files across
subdirectories. Its argument is a
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__-compatible
regular expression. More on the format is in
`re\_format(7) <http://www.FreeBSD.org/cgi/man.cgi?query=re_format&sektion=7>`__.
This option is useful for converting all files of a given extension. For
example, convert all source code files, leaving binary files intact:

.. code:: programlisting

    USES=    dos2unix
    DOS2UNIX_REGEX= .*\.([ch]|cpp)

A similar option is ``DOS2UNIX_GLOB``, which runs ``find`` for each
element listed in it.

.. code:: programlisting

    USES= dos2unix
    DOS2UNIX_GLOB=  *.c *.cpp *.h

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+------------------------------+-------------------------------------+
| `Prev <slow-modifying.html>`__?   | `Up <slow-porting.html>`__   | ?\ `Next <slow-configure.html>`__   |
+-----------------------------------+------------------------------+-------------------------------------+
| 4.3.?Modifying the Port?          | `Home <index.html>`__        | ?4.5.?Configuring                   |
+-----------------------------------+------------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
