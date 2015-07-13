======================
12.?Working with Diffs
======================

.. raw:: html

   <div class="navheader">

12.?Working with Diffs
`Prev <add-rm-files.html>`__?
?
?\ `Next <renaming-files.html>`__

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

12.?Working with Diffs
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes you might need to apply a diff from another source to a tree
under Perforce control. If it is a large diff that affects lots of
files, it might be inconvenient to manually run ``p4 edit`` on each
file. There is a trick for making this easier. First, make sure that no
files are open on your client and that your tree is synced and up to
date. Then apply the diff using the normal tools, and coerce the
permissions on the files if needed. Then run the following commands:

.. code:: screen

    % p4 diff -se ... | xargs p4 edit
    % p4 diff -sd ... | xargs p4 delete
    % find . -type f | xargs p4 add

The first command tells Perforce to look for files that have changed,
even if they are not open. The second command tells Perforce to look for
files that no longer exist on the local machine but do exist on the
server. The third command then attempts to add all of the files that it
can find locally. This is a very brute-force method, but it works
because Perforce will only add the files that it does not already know
about. The result of running these commands will be a set of files that
are opened for edit, removal, or add, as appropriate.

Verify the active changelist with:

.. code:: screen

    % p4 changelist
    % p4 diff -du

and just do a ``p4 submit`` after that.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-------------------------------------+
| `Prev <add-rm-files.html>`__?    | ?                       | ?\ `Next <renaming-files.html>`__   |
+----------------------------------+-------------------------+-------------------------------------+
| 11.?Adding and Removing Files?   | `Home <index.html>`__   | ?13.?Renaming Files                 |
+----------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
