=====================================
9.?Changes, Descriptions, and History
=====================================

.. raw:: html

   <div class="navheader">

9.?Changes, Descriptions, and History
`Prev <editing.html>`__?
?
?\ `Next <diffs.html>`__

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

9.?Changes, Descriptions, and History
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Changes to the Perforce depot can be listed via ``p4 changes``. This
will provide a brief description of each change, who made the change,
and what its change number was. A change can be examined in detail via
``p4 describe     changenumber``. This will provide the submit log and
the diffs of the actual change.

Commonly, ``p4?describe`` is used in one of three ways:

.. raw:: html

   <div class="variablelist">

``p4 describe -s       CHANGE``
    List a short description of changeset *CHANGE*, including the commit
    log of the particular changeset and a list of the files it affected.

``p4 describe -du       CHANGE``
    List a description of changeset *CHANGE*, including the commit log
    of the particular changeset, a list of the files it affected and a
    patch for each modified file, in a format similar to “unified diff”
    patches (but not exactly the same).

``p4 describe -dc       CHANGE``
    List a description of changeset *CHANGE*, including the commit log
    of the particular changeset, a list of the files it affected and a
    patch for each modified file, in a format similar to “context diff”
    patches (but not exactly the same).

.. raw:: html

   </div>

The history of a file, including all submits, integrations, and branches
of it will be shown by ``p4 filelog     filename``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+----------------------------+
| `Prev <editing.html>`__?   | ?                       | ?\ `Next <diffs.html>`__   |
+----------------------------+-------------------------+----------------------------+
| 8.?Editing?                | `Home <index.html>`__   | ?10.?Diffs                 |
+----------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
