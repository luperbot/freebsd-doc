==================
8.3.?pkg-deinstall
==================

.. raw:: html

   <div class="navheader">

8.3.?\ ``pkg-deinstall``
`Prev <pkg-install.html>`__?
Chapter?8.?\ ``pkg-*``
?\ `Next <pkg-names.html>`__

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

8.3.?\ ``pkg-deinstall``
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This script executes when a package is removed.

This script will be run twice by ``pkg     delete`` The first time as
``${SH}     pkg-deinstall ${PKGNAME} DEINSTALL`` before the port is
de-installed and the second time as
``${SH} pkg-deinstall ${PKGNAME}     POST-DEINSTALL`` after the port has
been de-installed. ``$2`` can be tested to determine which mode the
script is being run in. The ``PKG_PREFIX`` environmental variable will
be set to the package installation directory

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+-----------------------------------------+
| `Prev <pkg-install.html>`__?   | `Up <pkg-files.html>`__   | ?\ `Next <pkg-names.html>`__            |
+--------------------------------+---------------------------+-----------------------------------------+
| 8.2.?\ ``pkg-install``?        | `Home <index.html>`__     | ?8.4.?Changing the Names of ``pkg-*``   |
+--------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
