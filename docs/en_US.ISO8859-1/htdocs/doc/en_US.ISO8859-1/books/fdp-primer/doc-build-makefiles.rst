======================================================
5.2.?Understanding Makefiles in the Documentation Tree
======================================================

.. raw:: html

   <div class="navheader">

5.2.?Understanding ``Makefile``\ s in the Documentation Tree
`Prev <doc-build.html>`__?
Chapter?5.?The Documentation Build Process
?\ `Next <make-includes.html>`__

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

5.2.?Understanding ``Makefile``\ s in the Documentation Tree
------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are three main types of ``Makefile``\ s in the FreeBSD
Documentation Project tree.

.. raw:: html

   <div class="itemizedlist">

-  `Subdirectory ``Makefile``\ s <doc-build-makefiles.html#sub-make>`__
   simply pass commands to those directories below them.

-  `Documentation ``Makefile``\ s <doc-build-makefiles.html#doc-make>`__
   describe the document(s) that should be produced from this directory.

-  `Make includes <make-includes.html>`__ are the glue that perform the
   document production, and are usually of the form ``doc.xxx``.mk.

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

5.2.1.?Subdirectory ``Makefile``\ s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These ``Makefile``\ s usually take the form of:

.. code:: programlisting

    SUBDIR =articles
    SUBDIR+=books

    COMPAT_SYMLINK = en

    DOC_PREFIX?= ${.CURDIR}/..
    .include "${DOC_PREFIX}/share/mk/doc.project.mk"

The first four non-empty lines define the
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
variables ``SUBDIR``, ``COMPAT_SYMLINK``, and ``DOC_PREFIX``.

The ``SUBDIR`` statement and ``COMPAT_SYMLINK`` statement show how to
assign a value to a variable, overriding any previous value.

The second ``SUBDIR`` statement shows how a value is appended to the
current value of a variable. The ``SUBDIR`` variable is now
``articles       books``.

The ``DOC_PREFIX`` assignment shows how a value is assigned to the
variable, but only if it is not already defined. This is useful if
``DOC_PREFIX`` is not where this ``Makefile`` thinks it is - the user
can override this and provide the correct value.

What does it all mean? ``SUBDIR`` mentions which subdirectories below
this one the build process should pass any work on to.

``COMPAT_SYMLINK`` is specific to compatibility symlinks (amazingly
enough) for languages to their official encoding (``doc/en`` would point
to ``en_US.ISO-8859-1``).

``DOC_PREFIX`` is the path to the root of the FreeBSD Document Project
tree. This is not always that easy to find, and is also easily
overridden, to allow for flexibility. ``.CURDIR`` is a
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
builtin variable with the path to the current directory.

The final line includes the FreeBSD Documentation Project's project-wide
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
system file ``doc.project.mk`` which is the glue which converts these
variables into build instructions.

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

5.2.2.?Documentation ``Makefile``\ s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These ``Makefile``\ s set
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
variables that describe how to build the documentation contained in that
directory.

Here is an example:

.. code:: programlisting

    MAINTAINER=nik@FreeBSD.org

    DOC?= book

    FORMATS?= html-split html

    INSTALL_COMPRESSED?= gz
    INSTALL_ONLY_COMPRESSED?=

    # SGML content
    SRCS=  book.xml

    DOC_PREFIX?= ${.CURDIR}/../../..

    .include "$(DOC_PREFIX)/share/mk/docproj.docbook.mk"

The ``MAINTAINER`` variable allows committers to claim ownership of a
document in the FreeBSD Documentation Project, and take responsibility
for maintaining it.

``DOC`` is the name (sans the ``.xml`` extension) of the main document
created by this directory. ``SRCS`` lists all the individual files that
make up the document. This should also include important files in which
a change should result in a rebuild.

``FORMATS`` indicates the default formats that should be built for this
document. ``INSTALL_COMPRESSED`` is the default list of compression
techniques that should be used in the document build.
``INSTALL_ONLY_COMPRESS``, empty by default, should be non-empty if only
compressed documents are desired in the build.

The ``DOC_PREFIX`` and include statements should be familiar already.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+---------------------------+-----------------------------------------------------+
| `Prev <doc-build.html>`__?                    | `Up <doc-build.html>`__   | ?\ `Next <make-includes.html>`__                    |
+-----------------------------------------------+---------------------------+-----------------------------------------------------+
| Chapter?5.?The Documentation Build Process?   | `Home <index.html>`__     | ?5.3.?FreeBSD Documentation Project Make Includes   |
+-----------------------------------------------+---------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
