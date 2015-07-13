===================================
4.2.?The lang.encoding/ Directories
===================================

.. raw:: html

   <div class="navheader">

4.2.?The ``lang``.\ *``encoding``*/ Directories
`Prev <structure.html>`__?
Chapter?4.?Documentation Directory Structure
?\ `Next <structure-document.html>`__

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

4.2.?The ``lang``.\ *``encoding``*/ Directories
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These directories contain the documents themselves. The documentation is
split into up to three more categories at this level, indicated by the
different directory names.

.. raw:: html

   <div class="informaltable">

+----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Directory      | Usage                                                                                                                                                                                                                                                                                      |
+================+============================================================================================================================================================================================================================================================================================+
| ``articles``   | Documentation marked up as a DocBook ``article`` (or equivalent). Reasonably short, and broken up into sections. Normally only available as one XHTML file.                                                                                                                                |
+----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``books``      | Documentation marked up as a DocBook ``book`` (or equivalent). Book length, and broken up into chapters. Normally available as both one large XHTML file (for people with fast connections, or who want to print it easily from a browser) and as a collection of linked, smaller files.   |
+----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``man``        | For translations of the system manual pages. This directory will contain one or more ``mann`` directories, corresponding to the sections that have been translated.                                                                                                                        |
+----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Not every ``lang``.\ *``encoding``* directory will have all of these
subdirectories. It depends on how much translation has been accomplished
by that translation team.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+---------------------------+-----------------------------------------+
| `Prev <structure.html>`__?                      | `Up <structure.html>`__   | ?\ `Next <structure-document.html>`__   |
+-------------------------------------------------+---------------------------+-----------------------------------------+
| Chapter?4.?Documentation Directory Structure?   | `Home <index.html>`__     | ?4.3.?Document-Specific Information     |
+-------------------------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
