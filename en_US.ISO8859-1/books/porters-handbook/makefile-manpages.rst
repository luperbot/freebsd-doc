===============
5.10.?Man Pages
===============

.. raw:: html

   <div class="navheader">

5.10.?Man Pages
`Prev <makefile-masterdir.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-info.html>`__

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

5.10.?Man Pages
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port anchors its man tree somewhere other than ``PREFIX``, use
``MANDIRS`` to specify those directories. Note that the files
corresponding to manual pages must be placed in ``pkg-plist`` along with
the rest of the files. The purpose of ``MANDIRS`` is to enable automatic
compression of manual pages, therefore the file names are suffixed with
``.gz``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+------------------------------------+
| `Prev <makefile-masterdir.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-info.html>`__   |
+---------------------------------------+---------------------------+------------------------------------+
| 5.9.?\ ``MASTERDIR``?                 | `Home <index.html>`__     | ?5.11.?Info Files                  |
+---------------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
