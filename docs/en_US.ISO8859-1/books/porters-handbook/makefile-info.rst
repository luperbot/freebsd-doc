================
5.11.?Info Files
================

.. raw:: html

   <div class="navheader">

5.11.?Info Files
`Prev <makefile-manpages.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-options.html>`__

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

5.11.?Info Files
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the package needs to install GNU info files, list them in ``INFO``
(without the trailing ``.info``), one entry per document. These files
are assumed to be installed to ``PREFIX/INFO_PATH``. Change
``INFO_PATH`` if the package uses a different location. However, this is
not recommended. These entries contain just the path relative to
``PREFIX/INFO_PATH``. For example,
`lang/gcc34 <http://www.freebsd.org/cgi/url.cgi?ports/lang/gcc34/pkg-descr>`__
installs info files to ``PREFIX/INFO_PATH/gcc34``, and ``INFO`` will be
something like this:

.. code:: programlisting

    INFO=   gcc34/cpp gcc34/cppinternals gcc34/g77 ...

Appropriate installation/de-installation code will be automatically
added to the temporary ``pkg-plist`` before package registration.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------+---------------------------------------+
| `Prev <makefile-manpages.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-options.html>`__   |
+--------------------------------------+---------------------------+---------------------------------------+
| 5.10.?Man Pages?                     | `Home <index.html>`__     | ?5.12.?Makefile Options               |
+--------------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
