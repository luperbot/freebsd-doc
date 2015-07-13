============================
3.5.?Updating a Working Copy
============================

.. raw:: html

   <div class="navheader">

3.5.?Updating a Working Copy
`Prev <working-copy-checking-out.html>`__?
Chapter?3.?The Working Copy
?\ `Next <working-copy-revert.html>`__

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

3.5.?Updating a Working Copy
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The documents and files in the FreeBSD repository change daily. People
modify files and commit changes frequently. Even a short time after an
initial checkout, there will already be differences between the local
working copy and the main FreeBSD repository. To update the local
version with the changes that have been made to the main repository, use
``svn update`` on the directory containing the local working copy:

.. code:: screen

    % svn update ~/doc

Get in the protective habit of using ``svn update`` before editing
document files. Someone else may have edited that file very recently,
and the local working copy will not include the latest changes until it
has been updated. Editing the newest version of a file is much easier
than trying to combine an older, edited local file with the newer
version from the repository.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+------------------------------+------------------------------------------+
| `Prev <working-copy-checking-out.html>`__?   | `Up <working-copy.html>`__   | ?\ `Next <working-copy-revert.html>`__   |
+----------------------------------------------+------------------------------+------------------------------------------+
| 3.4.?Checking Out a Copy?                    | `Home <index.html>`__        | ?3.6.?Reverting Changes                  |
+----------------------------------------------+------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
