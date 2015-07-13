==========
8.?Editing
==========

.. raw:: html

   <div class="navheader">

8.?Editing
`Prev <submit.html>`__?
?
?\ `Next <changes.html>`__

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

8.?Editing
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The state of each file in the client is tracked and saved on the server.
In order to avoid collisions from multiple people working on the same
file at once, Perforce tracks which files are opened for edit, and uses
this to help with submit, sync, and integration operations later on.

To open a file for editing, use ``p4 edit`` like so:

.. code:: screen

    % p4 edit filename

This marks the file on the server as being in the *edit* state, which
then allows it to be submitted after changes are made, or marks it for
special handling when doing an integration or sync operation. Note that
editing is not exclusive in Perforce. Multiple people can have the same
file in the edit state (you will be informed of others when you run
``edit``), and you can submit your changes even when others are still
editing the file.

When someone else submits a change to a file that you are editing, you
will need to resolve his changes with yours before your submit will
succeed. The easiest way to do this is to either run a ``p4 sync`` or
``p4     submit`` and let it fail with the conflict, then run
``p4 resolve`` to manually resolve and accept his changes into your
copy, then run ``p4 submit`` to commit your changes to the repository.

If you have a file open for edit and you want to throw away your changes
and revert it to its original state, run ``p4 revert`` like so:

.. code:: screen

    % p4 revert filename

This resyncs the file to the contents of the server, and removes the
edit attribute from the server. Any local changes that you had will be
lost. This is quite useful when you have a made changes to a file but
later decide that you do not want to keep them.

When a file is synced, it is marked read-only in the filesystem. When
you tell the server to open it for editing, it is changed to read-write
on the filesystem. While these permissions can easily be overridden by
hand, they are meant to gently remind you that you should being using
``p4     edit``. Files that have local changes but are not in the edit
state may get overwritten when doing a ``p4     sync``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+------------------------------------------+
| `Prev <submit.html>`__?   | ?                       | ?\ `Next <changes.html>`__               |
+---------------------------+-------------------------+------------------------------------------+
| 7.?Submit?                | `Home <index.html>`__   | ?9.?Changes, Descriptions, and History   |
+---------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
