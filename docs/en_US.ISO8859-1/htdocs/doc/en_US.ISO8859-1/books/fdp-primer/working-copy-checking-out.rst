========================
3.4.?Checking Out a Copy
========================

.. raw:: html

   <div class="navheader">

3.4.?Checking Out a Copy
`Prev <working-copy-choosing-directory.html>`__?
Chapter?3.?The Working Copy
?\ `Next <working-copy-updating.html>`__

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

3.4.?Checking Out a Copy
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A download of a working copy from the repository is called a *checkout*,
and done with ``svn checkout``. This example checks out a copy of the
latest version (``head``) of the main documentation tree:

.. code:: screen

    % svn checkout https://svn0.us-west.FreeBSD.org/doc/head ~/doc

A checkout of the source code to work on manual pages is very similar:

.. code:: screen

    % svn checkout https://svn0.us-west.FreeBSD.org/base/head ~/src

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+------------------------------+--------------------------------------------+
| `Prev <working-copy-choosing-directory.html>`__?   | `Up <working-copy.html>`__   | ?\ `Next <working-copy-updating.html>`__   |
+----------------------------------------------------+------------------------------+--------------------------------------------+
| 3.3.?Choosing a Directory?                         | `Home <index.html>`__        | ?3.5.?Updating a Working Copy              |
+----------------------------------------------------+------------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
