======================
3.6.?Reverting Changes
======================

.. raw:: html

   <div class="navheader">

3.6.?Reverting Changes
`Prev <working-copy-updating.html>`__?
Chapter?3.?The Working Copy
?\ `Next <working-copy-making-diff.html>`__

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

3.6.?Reverting Changes
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes it turns out that changes were not necessary after all, or the
writer just wants to start over. Files can be “reset” to their unchanged
form with ``svn revert``. For example, to erase the edits made to
``chapter.xml`` and reset it to unmodified form:

.. code:: screen

    % svn revert chapter.xml

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+------------------------------+-----------------------------------------------+
| `Prev <working-copy-updating.html>`__?   | `Up <working-copy.html>`__   | ?\ `Next <working-copy-making-diff.html>`__   |
+------------------------------------------+------------------------------+-----------------------------------------------+
| 3.5.?Updating a Working Copy?            | `Home <index.html>`__        | ?3.7.?Making a Diff                           |
+------------------------------------------+------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
