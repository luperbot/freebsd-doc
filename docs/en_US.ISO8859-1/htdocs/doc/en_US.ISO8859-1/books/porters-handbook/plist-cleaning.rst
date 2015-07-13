======================
7.2.?Empty Directories
======================

.. raw:: html

   <div class="navheader">

7.2.?Empty Directories
`Prev <plist.html>`__?
Chapter?7.?Advanced ``pkg-plist`` Practices
?\ `Next <plist-config.html>`__

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

7.2.?Empty Directories
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

7.2.1.?Cleaning Up Empty Directories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When being de-installed, a port has to remove empty directories it
created. Most of these directories are removed automatically by
`pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__, but
for directories created outside of ``${PREFIX}``, or empty directories,
some more work needs to be done. This is usually accomplished by adding
``@dir`` lines for those directories. Subdirectories must be deleted
before deleting parent directories.

.. code:: programlisting

    [...]
    @dir /var/games/oneko/saved-games
    @dir /var/games/oneko

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

7.2.2.?Creating Empty Directories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Empty directories created during port installation need special
attention. They must be present when the package is created. If they are
not created by the port code, create them in the ``Makefile``:

.. code:: programlisting

    post-stage:
        @${MKDIR} ${STAGEDIR}${PREFIX}/some/directory

Add the directory to ``pkg-plist`` like any other. For example:

.. code:: programlisting

    @dir some/directory

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------+-----------------------------------+
| `Prev <plist.html>`__?                         | `Up <plist.html>`__     | ?\ `Next <plist-config.html>`__   |
+------------------------------------------------+-------------------------+-----------------------------------+
| Chapter?7.?Advanced ``pkg-plist`` Practices?   | `Home <index.html>`__   | ?7.3.?Configuration Files         |
+------------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
