================
8.2.?pkg-install
================

.. raw:: html

   <div class="navheader">

8.2.?\ ``pkg-install``
`Prev <pkg-files.html>`__?
Chapter?8.?\ ``pkg-*``
?\ `Next <pkg-deinstall.html>`__

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

8.2.?\ ``pkg-install``
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port needs to execute commands when the binary package is
installed with ``pkg add`` or ``pkg install``, use ``pkg-install``. This
script will automatically be added to the package. It will be run twice
by ``pkg``, the first time as
``${SH}     pkg-install ${PKGNAME} PRE-INSTALL`` before the package is
installed, and the second time as
``${SH} pkg-install ${PKGNAME}     POST-INSTALL`` after it has been
installed. ``$2`` can be tested to determine which mode the script is
being run in. The ``PKG_PREFIX`` environmental variable will be set to
the package installation directory.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+------------------------------------+
| `Prev <pkg-files.html>`__?   | `Up <pkg-files.html>`__   | ?\ `Next <pkg-deinstall.html>`__   |
+------------------------------+---------------------------+------------------------------------+
| Chapter?8.?\ ``pkg-*``?      | `Home <index.html>`__     | ?8.3.?\ ``pkg-deinstall``          |
+------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
