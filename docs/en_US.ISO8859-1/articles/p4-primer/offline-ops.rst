=====================
15.?Offline Operation
=====================

.. raw:: html

   <div class="navheader">

15.?Offline Operation
`Prev <freebsd-cvs-and-p4.html>`__?
?
?\ `Next <soc.html>`__

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

15.?Offline Operation
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One weakness of Perforce is that it assumes that network access to the
server is always available. Most state, history, and metadata is saved
on the server, and there is no provision for replicating the server like
there is with SVN. It is possible to run a proxy server, but it only
provides very limited utility for offline operation.

The best way to work offline is to make sure that your client has no
open files and is fully synced before going offline. Then when editing a
file, manually change the permissions to read-write. When you get back
online, run the commands listed in the `Section?12, “Working with
Diffs” <working-with-diffs.html>`__ to automatically identify files that
have been edited, added, and removed. It is quite common to be surprised
by Perforce overwriting a locally changed file that was not opened for
edit, so be extra vigilant with this.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------+-------------------------+----------------------------------------+
| `Prev <freebsd-cvs-and-p4.html>`__?                         | ?                       | ?\ `Next <soc.html>`__                 |
+-------------------------------------------------------------+-------------------------+----------------------------------------+
| 14.?Interactions Between FreeBSD Subversion and Perforce?   | `Home <index.html>`__   | ?16.?Notes for Google Summer of Code   |
+-------------------------------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
