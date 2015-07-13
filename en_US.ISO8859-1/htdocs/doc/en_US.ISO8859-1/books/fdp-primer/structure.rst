============================================
Chapter?4.?Documentation Directory Structure
============================================

.. raw:: html

   <div class="navheader">

Chapter?4.?Documentation Directory Structure
`Prev <working-copy-subversion-references.html>`__?
?
?\ `Next <structure-locale.html>`__

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

`4.1. The Top Level, ``doc/`` <structure.html#structure-top>`__
`4.2. The ``lang``.\ *``encoding``*/
Directories <structure-locale.html>`__
`4.3. Document-Specific Information <structure-document.html>`__

.. raw:: html

   </div>

Files and directories in the ``doc/`` tree follow a structure meant to:

.. raw:: html

   <div class="orderedlist">

#. Make it easy to automate converting the document to other formats.

#. Promote consistency between the different documentation
   organizations, to make it easier to switch between working on
   different documents.

#. Make it easy to decide where in the tree new documentation should be
   placed.

.. raw:: html

   </div>

In addition, the documentation tree must accommodate documents in many
different languages and encodings. It is important that the
documentation tree structure does not enforce any particular defaults or
cultural preferences.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?The Top Level, ``doc/``
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two types of directory under ``doc/``, each with very specific
directory names and meanings.

.. raw:: html

   <div class="informaltable">

+-----------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Directory                   | Usage                                                                                                                                                                                                                                                                                                                                                                                                                                          |
+=============================+================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| ``share``                   | Contains files that are not specific to the various translations and encodings of the documentation. Contains subdirectories to further categorize the information. For example, the files that comprise the `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__ infrastructure are in ``share/mk``, while the additional XML support files (such as the FreeBSD extended DocBook DTD) are in ``share/xml``.                 |
+-----------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``lang``.\ *``encoding``*   | One directory exists for each available translation and encoding of the documentation, for example ``en_US.ISO8859-1/`` and ``zh_TW.UTF-8/``. The names are long, but by fully specifying the language and encoding we prevent any future headaches when a translation team wants to provide documentation in the same language but in more than one encoding. This also avoids problems that might be caused by a future switch to Unicode.   |
+-----------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+-------------------------+----------------------------------------------------+
| `Prev <working-copy-subversion-references.html>`__?   | ?                       | ?\ `Next <structure-locale.html>`__                |
+-------------------------------------------------------+-------------------------+----------------------------------------------------+
| 3.8.?Subversion References?                           | `Home <index.html>`__   | ?4.2.?The ``lang``.\ *``encoding``*/ Directories   |
+-------------------------------------------------------+-------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
