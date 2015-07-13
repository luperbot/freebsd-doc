================================================
5.3.?FreeBSD Documentation Project Make Includes
================================================

.. raw:: html

   <div class="navheader">

5.3.?FreeBSD Documentation Project Make Includes
`Prev <doc-build-makefiles.html>`__?
Chapter?5.?The Documentation Build Process
?\ `Next <the-website.html>`__

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

5.3.?FreeBSD Documentation Project Make Includes
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
includes are best explained by inspection of the code. Here are the
system include files:

.. raw:: html

   <div class="itemizedlist">

-  ``doc.project.mk`` is the main project include file, which includes
   all the following include files, as necessary.

-  ``doc.subdir.mk`` handles traversing of the document tree during the
   build and install processes.

-  ``doc.install.mk`` provides variables that affect ownership and
   installation of documents.

-  ``doc.docbook.mk`` is included if ``DOCFORMAT`` is ``docbook`` and
   ``DOC`` is set.

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

5.3.1.?\ ``doc.project.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By inspection:

.. code:: programlisting

    DOCFORMAT?=    docbook
    MAINTAINER?=    doc@FreeBSD.org

    PREFIX?=    /usr/local
    PRI_LANG?=  en_US.ISO8859-1

    .if defined(DOC)
    .if ${DOCFORMAT} == "docbook"
    .include "doc.docbook.mk"
    .endif
    .endif

    .include "doc.subdir.mk"
    .include "doc.install.mk"

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.1.1.?Variables
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``DOCFORMAT`` and ``MAINTAINER`` are assigned default values, if these
are not set by the document make file.

``PREFIX`` is the prefix under which the `documentation building
tools <tools.html>`__ are installed. For normal package and port
installation, this is ``/usr/local``.

``PRI_LANG`` should be set to whatever language and encoding is natural
amongst users these documents are being built for. US English is the
default.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``PRI_LANG`` does not affect which documents can, or even will, be
built. Its main use is creating links to commonly referenced documents
into the FreeBSD documentation install root.

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

5.3.1.2.?Conditionals
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``.if defined(DOC)`` line is an example of a
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
conditional which, like in other programs, defines behavior if some
condition is true or if it is false. ``defined`` is a function which
returns whether the variable given is defined or not.

``.if ${DOCFORMAT} == "docbook"``, next, tests whether the ``DOCFORMAT``
variable is ``"docbook"``, and in this case, includes
``doc.docbook.mk``.

The two ``.endif``\ s close the two above conditionals, marking the end
of their application.

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

5.3.2.?\ ``doc.subdir.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This file is too long to explain in detail. These notes describe the
most important features.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.1.?Variables
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``SUBDIR`` is a list of subdirectories that the build process should
   go further down into.

-  ``ROOT_SYMLINKS`` is the name of directories that should be linked to
   the document install root from their actual locations, if the current
   language is the primary language (specified by ``PRI_LANG``).

-  ``COMPAT_SYMLINK`` is described in the `Subdirectory
   Makefile <doc-build-makefiles.html#sub-make>`__ section.

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

5.3.2.2.?Targets and Macros
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dependencies are described by ``target``:
*``dependency1 dependency2           ...``* tuples, where to build
``target``, the given dependencies must be built first.

After that descriptive tuple, instructions on how to build the target
may be given, if the conversion process between the target and its
dependencies are not previously defined, or if this particular
conversion is not the same as the default conversion method.

A special dependency ``.USE`` defines the equivalent of a macro.

.. code:: programlisting

    _SUBDIRUSE: .USE
    .for entry in ${SUBDIR}
        @${ECHO} "===> ${DIRPRFX}${entry}"
        @(cd ${.CURDIR}/${entry} && \
        ${MAKE} ${.TARGET:S/realpackage/package/:S/realinstall/install/} DIRPRFX=${DIRPRFX}${entry}/ )
    .endfor

In the above, ``_SUBDIRUSE`` is now a macro which will execute the given
commands when it is listed as a dependency.

What sets this macro apart from other targets? Basically, it is executed
*after* the instructions given in the build procedure it is listed as a
dependency to, and it does not adjust ``.TARGET``, which is the variable
which contains the name of the target currently being built.

.. code:: programlisting

    clean: _SUBDIRUSE
        rm -f ${CLEANFILES}

In the above, ``clean`` will use the ``_SUBDIRUSE`` macro after it has
executed the instruction ``rm -f ${CLEANFILES}``. In effect, this causes
``clean`` to go further and further down the directory tree, deleting
built files as it goes *down*, not on the way back up.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.2.1.?Provided Targets
'''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``install`` and ``package`` both go down the directory tree calling
   the real versions of themselves in the subdirectories
   (``realinstall`` and ``realpackage`` respectively).

-  ``clean`` removes files created by the build process (and goes down
   the directory tree too). ``cleandir`` does the same, and also removes
   the object directory, if any.

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

5.3.2.3.?More on Conditionals
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``exists`` is another condition function which returns true if the
   given file exists.

-  ``empty`` returns true if the given variable is empty.

-  ``target`` returns true if the given target does not already exist.

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

5.3.2.4.?Looping Constructs in ``make         (.for)``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``.for`` provides a way to repeat a set of instructions for each
space-separated element in a variable. It does this by assigning a
variable to contain the current element in the list being examined.

.. code:: programlisting

    _SUBDIRUSE: .USE
    .for entry in ${SUBDIR}
        @${ECHO} "===> ${DIRPRFX}${entry}"
        @(cd ${.CURDIR}/${entry} && \
        ${MAKE} ${.TARGET:S/realpackage/package/:S/realinstall/install/} DIRPRFX=${DIRPRFX}${entry}/ )
    .endfor

In the above, if ``SUBDIR`` is empty, no action is taken; if it has one
or more elements, the instructions between ``.for`` and ``.endfor``
would repeat for every element, with ``entry`` being replaced with the
value of the current element.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------+---------------------------+----------------------------------+
| `Prev <doc-build-makefiles.html>`__?                            | `Up <doc-build.html>`__   | ?\ `Next <the-website.html>`__   |
+-----------------------------------------------------------------+---------------------------+----------------------------------+
| 5.2.?Understanding ``Makefile``\ s in the Documentation Tree?   | `Home <index.html>`__     | ?Chapter?6.?The Website          |
+-----------------------------------------------------------------+---------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
