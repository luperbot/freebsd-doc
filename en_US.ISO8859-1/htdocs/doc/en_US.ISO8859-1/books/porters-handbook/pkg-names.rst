=================================
8.4.?Changing the Names of pkg-\*
=================================

.. raw:: html

   <div class="navheader">

8.4.?Changing the Names of ``pkg-*``
`Prev <pkg-deinstall.html>`__?
Chapter?8.?\ ``pkg-*``
?\ `Next <using-sub-files.html>`__

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

8.4.?Changing the Names of ``pkg-*``
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All the names of ``pkg-*`` are defined using variables that can be
changed in the ``Makefile`` if needed. This is especially useful when
sharing the same ``pkg-*`` files among several ports or when it is
necessary to write to one of these files. See `writing to places other
than ``WRKDIR`` <porting-wrkdir.html>`__ for why it is a bad idea to
write directly into the directory containing the ``pkg-*`` files.

Here is a list of variable names and their default values. (``PKGDIR``
defaults to ``${MASTERDIR}``.)

.. raw:: html

   <div class="informaltable">

+--------------------+-------------------------------+
| Variable           | Default value                 |
+====================+===============================+
| ``DESCR``          | ``${PKGDIR}/pkg-descr``       |
+--------------------+-------------------------------+
| ``PLIST``          | ``${PKGDIR}/pkg-plist``       |
+--------------------+-------------------------------+
| ``PKGINSTALL``     | ``${PKGDIR}/pkg-install``     |
+--------------------+-------------------------------+
| ``PKGDEINSTALL``   | ``${PKGDIR}/pkg-deinstall``   |
+--------------------+-------------------------------+
| ``PKGMESSAGE``     | ``${PKGDIR}/pkg-message``     |
+--------------------+-------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------+------------------------------------------------------+
| `Prev <pkg-deinstall.html>`__?   | `Up <pkg-files.html>`__   | ?\ `Next <using-sub-files.html>`__                   |
+----------------------------------+---------------------------+------------------------------------------------------+
| 8.3.?\ ``pkg-deinstall``?        | `Home <index.html>`__     | ?8.5.?Making Use of ``SUB_FILES`` and ``SUB_LIST``   |
+----------------------------------+---------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
