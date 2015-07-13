==================================
4.3.?Document-Specific Information
==================================

.. raw:: html

   <div class="navheader">

4.3.?Document-Specific Information
`Prev <structure-locale.html>`__?
Chapter?4.?Documentation Directory Structure
?\ `Next <doc-build.html>`__

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

4.3.?Document-Specific Information
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section contains specific notes about particular documents managed
by the FDP.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1.?The Handbook
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

``books/handbook/``
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Handbook is written in DocBook XML using the FreeBSD DocBook
extended DTD.

The Handbook is organized as a DocBook ``book``. The book is divided
into ``part``\ s, each of which contains several ``chapter``\ s.
``chapter``\ s are further subdivided into sections (``sect1``) and
subsections (``sect2``, ``sect3``) and so on.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1.1.?Physical Organization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a number of files and directories within the ``handbook``
directory.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The Handbook's organization may change over time, and this document may
lag in detailing the organizational changes. Post questions about
Handbook organization to the `FreeBSD documentation project mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.

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

4.3.1.1.1.?\ ``Makefile``
'''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``Makefile`` defines some variables that affect how the XML source
is converted to other formats, and lists the various source files that
make up the Handbook. It then includes the standard ``doc.project.mk``,
to bring in the rest of the code that handles converting documents from
one format to another.

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

4.3.1.1.2.?\ ``book.xml``
'''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is the top level document in the Handbook. It contains the
Handbook's `DOCTYPE
declaration <xml-primer-doctype-declaration.html>`__, as well as the
elements that describe the Handbook's structure.

``book.xml`` uses `parameter
entities <xml-primer-entities.html#xml-primer-parameter-entities>`__ to
load in the files with the ``.ent`` extension. These files (described
later) then define `general
entities <xml-primer-entities.html#xml-primer-general-entities>`__ that
are used throughout the rest of the Handbook.

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

4.3.1.1.3.?\ ``directory``/chapter.xml
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Each chapter in the Handbook is stored in a file called ``chapter.xml``
in a separate directory from the other chapters. Each directory is named
after the value of the ``id`` attribute on the ``chapter`` element.

For example, if one of the chapter files contains:

.. code:: programlisting

    <chapter id="kernelconfig">
    ...
    </chapter>

Then it will be called ``chapter.xml`` in the ``kernelconfig``
directory. In general, the entire contents of the chapter are in this
one file.

When the XHTML version of the Handbook is produced, this will yield
``kernelconfig.html``. This is because of the ``id`` value, and is not
related to the name of the directory.

In earlier versions of the Handbook, the files were stored in the same
directory as ``book.xml``, and named after the value of the ``id``
attribute on the file's ``chapter`` element. Now, it is possible to
include images in each chapter. Images for each Handbook chapter are
stored within ``share/images/books/handbook``. The localized version of
these images should be placed in the same directory as the XML sources
for each chapter. Namespace collisions are inevitable, and it is easier
to work with several directories with a few files in them than it is to
work with one directory that has many files in it.

A brief look will show that there are many directories with individual
``chapter.xml`` files, including ``basics/chapter.xml``,
``introduction/chapter.xml``, and ``printing/chapter.xml``.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Do not name chapters or directories after their ordering within the
Handbook. This ordering can change as the content within the Handbook is
reorganized. Reorganization should be possible without renaming files,
unless entire chapters are being promoted or demoted within the
hierarchy.

.. raw:: html

   </div>

The ``chapter.xml`` files are not complete XML documents that can be
built individually. They can only be built as parts of the whole
Handbook.

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

+----------------------------------------------------+---------------------------+-----------------------------------------------+
| `Prev <structure-locale.html>`__?                  | `Up <structure.html>`__   | ?\ `Next <doc-build.html>`__                  |
+----------------------------------------------------+---------------------------+-----------------------------------------------+
| 4.2.?The ``lang``.\ *``encoding``*/ Directories?   | `Home <index.html>`__     | ?Chapter?5.?The Documentation Build Process   |
+----------------------------------------------------+---------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
