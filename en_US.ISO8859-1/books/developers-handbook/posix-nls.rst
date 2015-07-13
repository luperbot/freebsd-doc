==================================================================
4.2.?Localized Messages with POSIX.1 Native Language Support (NLS)
==================================================================

.. raw:: html

   <div class="navheader">

4.2.?Localized Messages with POSIX.1 Native Language Support (NLS)
`Prev <l10n.html>`__?
Chapter?4.?Localization and Internationalization - L10N and I18N
?\ `Next <policies.html>`__

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

4.2.?Localized Messages with POSIX.1 Native Language Support (NLS)
------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by G?bor K?vesd?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beyond the basic I18N functions, like supporting various input encodings
or supporting national conventions, such as the different decimal
separators, at a higher level of I18N, it is possible to localize the
messages written to the output by the various programs. A common way of
doing this is using the POSIX.1 NLS functions, which are provided as a
part of the FreeBSD base system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1.?Organizing Localized Messages into Catalog Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

POSIX.1 NLS is based on catalog files, which contain the localized
messages in the desired encoding. The messages are organized into sets
and each message is identified by an integer number in the containing
set. The catalog files are conventionally named after the locale they
contain localized messages for, followed by the ``.msg`` extension. For
instance, the Hungarian messages for ISO8859-2 encoding should be stored
in a file called ``hu_HU.ISO8859-2``.

These catalog files are common text files that contain the numbered
messages. It is possible to write comments by starting the line with a
``$`` sign. Set boundaries are also separated by special comments, where
the keyword ``set`` must directly follow the ``$`` sign. The ``set``
keyword is then followed by the set number. For example:

.. code:: programlisting

    $set 1

The actual message entries start with the message number and followed by
the localized message. The well-known modifiers from
`printf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=3>`__
are accepted:

.. code:: programlisting

    15 "File not found: %s\n"

The language catalog files have to be compiled into a binary form before
they can be opened from the program. This conversion is done with the
`gencat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gencat&sektion=1>`__
utility. Its first argument is the filename of the compiled catalog and
its further arguments are the input catalogs. The localized messages can
also be organized into more catalog files and then all of them can be
processed with
`gencat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gencat&sektion=1>`__.

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

4.2.2.?Using the Catalog Files from the Source Code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Using the catalog files is simple. To use the related functions,
``nl_types.h`` must be included. Before using a catalog, it has to be
opened with
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__.
The function takes two arguments. The first parameter is the name of the
installed and compiled catalog. Usually, the name of the program is
used, such as grep. This name will be used when looking for the compiled
catalog file. The
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
call looks for this file in ``/usr/share/nls/locale``/*``catname``* and
in ``/usr/local/share/nls/locale``/*``catname``*, where ``locale`` is
the locale set and ``catname`` is the catalog name being discussed. The
second parameter is a constant, which can have two values:

.. raw:: html

   <div class="itemizedlist">

-  ``NL_CAT_LOCALE``, which means that the used catalog file will be
   based on ``LC_MESSAGES``.

-  ``0``, which means that ``LANG`` has to be used to open the proper
   catalog.

.. raw:: html

   </div>

The
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
call returns a catalog identifier of type ``nl_catd``. Please refer to
the manual page for a list of possible returned error codes.

After opening a catalog
`catgets(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catgets&sektion=3>`__
can be used to retrieve a message. The first parameter is the catalog
identifier returned by
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__,
the second one is the number of the set, the third one is the number of
the messages, and the fourth one is a fallback message, which will be
returned if the requested message cannot be retrieved from the catalog
file.

After using the catalog file, it must be closed by calling
`catclose(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catclose&sektion=3>`__,
which has one argument, the catalog id.

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

4.2.3.?A Practical Example
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following example will demonstrate an easy solution on how to use
NLS catalogs in a flexible way.

The below lines need to be put into a common header file of the program,
which is included into all source files where localized messages are
necessary:

.. code:: programlisting

    #ifdef WITHOUT_NLS
    #define getstr(n)    nlsstr[n]
    #else
    #include <nl_types.h>

    extern nl_catd       catalog;
    #define getstr(n)    catgets(catalog, 1, n, nlsstr[n])
    #endif

    extern char     *nlsstr[];

Next, put these lines into the global declaration part of the main
source file:

.. code:: programlisting

    #ifndef WITHOUT_NLS
    #include <nl_types.h>
    nl_catd  catalog;
    #endif

    /*
     * Default messages to use when NLS is disabled or no catalog
     * is found.
     */
    char    *nlsstr[] = {
            "",
    /* 1*/  "some random message",
    /* 2*/  "some other message"
    };

Next come the real code snippets, which open, read, and close the
catalog:

.. code:: programlisting

    #ifndef WITHOUT_NLS
        catalog = catopen("myapp", NL_CAT_LOCALE);
    #endif

    ...

    printf(getstr(1));

    ...

    #ifndef WITHOUT_NLS
        catclose(catalog);
    #endif

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.3.1.?Reducing Strings to Localize
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There is a good way of reducing the strings that need to be localized by
using libc error messages. This is also useful to just avoid duplication
and provide consistent error messages for the common errors that can be
encountered by a great many of programs.

First, here is an example that does not use libc error messages:

.. code:: programlisting

    #include <err.h>
    ...
    if (!S_ISDIR(st.st_mode))
        errx(1, "argument is not a directory");
          

This can be transformed to print an error message by reading ``errno``
and printing an error message accordingly:

.. code:: programlisting

    #include <err.h>
    #include <errno.h>
    ...
    if (!S_ISDIR(st.st_mode)) {
        errno = ENOTDIR;
        err(1, NULL);
    }
          

In this example, the custom string is eliminated, thus translators will
have less work when localizing the program and users will see the usual
“Not a directory” error message when they encounter this error. This
message will probably seem more familiar to them. Please note that it
was necessary to include ``errno.h`` in order to directly access
``errno``.

It is worth to note that there are cases when ``errno`` is set
automatically by a preceding call, so it is not necessary to set it
explicitly:

.. code:: programlisting

    #include <err.h>
    ...
    if ((p = malloc(size)) == NULL)
        err(1, NULL);
          

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

4.2.4.?Making use of ``bsd.nls.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Using the catalog files requires few repeatable steps, such as compiling
the catalogs and installing them to the proper location. In order to
simplify this process even more, ``bsd.nls.mk`` introduces some macros.
It is not necessary to include ``bsd.nls.mk`` explicitly, it is pulled
in from the common Makefiles, such as ``bsd.prog.mk`` or ``bsd.lib.mk``.

Usually it is enough to define ``NLSNAME``, which should have the
catalog name mentioned as the first argument of
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
and list the catalog files in ``NLS`` without their ``.msg`` extension.
Here is an example, which makes it possible to to disable NLS when used
with the code examples before. The ``WITHOUT_NLS``
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
variable has to be defined in order to build the program without NLS
support.

.. code:: programlisting

    .if !defined(WITHOUT_NLS)
    NLS=    es_ES.ISO8859-1
    NLS+=   hu_HU.ISO8859-2
    NLS+=   pt_BR.ISO8859-1
    .else
    CFLAGS+=    -DWITHOUT_NLS
    .endif

Conventionally, the catalog files are placed under the ``nls``
subdirectory and this is the default behaviour of ``bsd.nls.mk``. It is
possible, though to override the location of the catalogs with the
``NLSSRCDIR``
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
variable. The default name of the precompiled catalog files also follow
the naming convention mentioned before. It can be overridden by setting
the ``NLSNAME`` variable. There are other options to fine tune the
processing of the catalog files but usually it is not needed, thus they
are not described here. For further information on ``bsd.nls.mk``,
please refer to the file itself, it is short and easy to understand.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------------+-------------------------+---------------------------------------------------+
| `Prev <l10n.html>`__?                                               | `Up <l10n.html>`__      | ?\ `Next <policies.html>`__                       |
+---------------------------------------------------------------------+-------------------------+---------------------------------------------------+
| Chapter?4.?Localization and Internationalization - L10N and I18N?   | `Home <index.html>`__   | ?Chapter?5.?Source Tree Guidelines and Policies   |
+---------------------------------------------------------------------+-------------------------+---------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
