=============================
11.?Adding and Removing Files
=============================

.. raw:: html

   <div class="navheader">

11.?Adding and Removing Files
`Prev <diffs.html>`__?
?
?\ `Next <working-with-diffs.html>`__

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

11.?Adding and Removing Files
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Integrating a branch will bring existing files into your tree, but you
may still want to add new files or remove existing ones. Adding files is
easily done be creating the file and then running ``p4 add`` like so:

.. code:: screen

    % p4 add filename

If you want to add a whole tree of files, run a command like:

.. code:: screen

    % find . -type f | xargs p4 add

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Perforce can track UNIX symlinks too, so you can probably use
“``\!?-type?d``” as the matching expression in
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__
above. We do not commit symlinks into the source tree of FreeBSD though,
so this should not be necessary.

.. raw:: html

   </div>

Doing a ``p4 submit`` will then copy the file to the depot on the
server. It is very important to only add files, not directories.
Explicitly adding a directory will cause Perforce to treat it like a
file, which is not what you want.

Removing a file is just as easy with the ``p4`` delete command like so:

.. code:: screen

    % p4 delete filename

This will mark the file for deletion from the depot the next time that a
submit is run. It will also remove the local copy of the file, so
beware.

Of course, deleting a file does not actually remove it from the
repository.

Deleted files can be resurrected by syncing them to a prior version. The
only way to permanently remove a file is to use ``p4 obliterate``. This
command is irreversible and expensive, so it is only available to those
with admin access.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+-----------------------------------------+
| `Prev <diffs.html>`__?   | ?                       | ?\ `Next <working-with-diffs.html>`__   |
+--------------------------+-------------------------+-----------------------------------------+
| 10.?Diffs?               | `Home <index.html>`__   | ?12.?Working with Diffs                 |
+--------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
