===========================
Chapter?3.?The Working Copy
===========================

.. raw:: html

   <div class="navheader">

Chapter?3.?The Working Copy
`Prev <tools-optional.html>`__?
?
?\ `Next <working-copy-choosing-mirror.html>`__

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

`3.1. Documentation and Manual
Pages <working-copy.html#working-copy-doc-and-src>`__
`3.2. Choosing a Mirror <working-copy-choosing-mirror.html>`__
`3.3. Choosing a Directory <working-copy-choosing-directory.html>`__
`3.4. Checking Out a Copy <working-copy-checking-out.html>`__
`3.5. Updating a Working Copy <working-copy-updating.html>`__
`3.6. Reverting Changes <working-copy-revert.html>`__
`3.7. Making a Diff <working-copy-making-diff.html>`__
`3.8. Subversion References <working-copy-subversion-references.html>`__

.. raw:: html

   </div>

The *working copy* is a copy of the FreeBSD repository documentation
tree downloaded onto the local computer. Changes are made to the local
working copy, tested, and then submitted as patches to be committed to
the main repository.

A full copy of the documentation tree can occupy 700 megabytes of disk
space. Allow for a full gigabyte of space to have room for temporary
files and test versions of various output formats.

`Subversion <../../../../doc/en_US.ISO8859-1/books/handbook/svn.html>`__
is used to manage the FreeBSD documentation files. It is installed by
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
as one of the required applications.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Documentation and Manual Pages
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD documentation is not just books and articles. Manual pages for
all the commands and configuration files are also part of the
documentation, and part of the FDP's territory. Two repositories are
involved: ``doc`` for the books and articles, and ``base`` for the
operating system and manual pages. To edit manual pages, the ``base``
repository must be checked out separately.

Repositories may contain multiple versions of documentation and source
code. New modifications are almost always made only to the latest
version, called ``head``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+---------------------------------------------------+
| `Prev <tools-optional.html>`__?   | ?                       | ?\ `Next <working-copy-choosing-mirror.html>`__   |
+-----------------------------------+-------------------------+---------------------------------------------------+
| 2.2.?Optional Tools?              | `Home <index.html>`__   | ?3.2.?Choosing a Mirror                           |
+-----------------------------------+-------------------------+---------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
