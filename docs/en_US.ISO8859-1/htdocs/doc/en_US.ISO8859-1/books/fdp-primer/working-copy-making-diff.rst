==================
3.7.?Making a Diff
==================

.. raw:: html

   <div class="navheader">

3.7.?Making a Diff
`Prev <working-copy-revert.html>`__?
Chapter?3.?The Working Copy
?\ `Next <working-copy-subversion-references.html>`__

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

3.7.?Making a Diff
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After edits to a file or group of files are completed, the differences
between the local working copy and the version on the FreeBSD repository
must be collected into a single file for submission. These *diff* files
are produced by redirecting the output of ``svn diff`` into a file:

.. code:: screen

    % cd ~/doc
    % svn diff > doc-fix-spelling.diff

Give the file a meaningful name that identifies the contents. The
example above is for spelling fixes to the whole documentation tree.

If the diff file is to be submitted with the web “`Submit a FreeBSD
problem report <https://bugs.FreeBSD.org/bugzilla/enter_bug.cgi>`__”
interface, add a ``.txt`` extension to give the earnest and
simple-minded web form a clue that the contents are plain text.

Be careful: ``svn diff`` includes all changes made in the current
directory and any subdirectories. If there are files in the working copy
with edits that are not ready to be submitted yet, provide a list of
only the files that are to be included:

.. code:: screen

    % cd ~/doc
    % svn diff disks/chapter.xml printers/chapter.xml > disks-printers.diff

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+------------------------------+---------------------------------------------------------+
| `Prev <working-copy-revert.html>`__?   | `Up <working-copy.html>`__   | ?\ `Next <working-copy-subversion-references.html>`__   |
+----------------------------------------+------------------------------+---------------------------------------------------------+
| 3.6.?Reverting Changes?                | `Home <index.html>`__        | ?3.8.?Subversion References                             |
+----------------------------------------+------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
