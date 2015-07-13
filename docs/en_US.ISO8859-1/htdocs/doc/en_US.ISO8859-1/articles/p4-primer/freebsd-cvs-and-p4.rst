========================================================
14.?Interactions Between FreeBSD Subversion and Perforce
========================================================

.. raw:: html

   <div class="navheader">

14.?Interactions Between FreeBSD Subversion and Perforce
`Prev <renaming-files.html>`__?
?
?\ `Next <offline-ops.html>`__

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

14.?Interactions Between FreeBSD Subversion and Perforce
--------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD Perforce and Subversion repositories are completely
separate. However, changes to Subversion are tracked at near-real-time
in Perforce. Every 2 minutes, the Subversion server is polled for
updates in the HEAD branch, and those updates are committed to Perforce
in the ``//depot/vendor/freebsd/...`` tree. This tree is then available
for branching and integrating to derivative projects. Any project that
directly modifies that FreeBSD source code should have this tree as its
branch parent (or grandparent, depending on the needs), and periodic
integrations and syncs should be done so that your tree stays up to date
and avoids conflicts with mainline development.

The bridge between Subversion and Perforce is one-way; changes to
Subversion will be reflected in Perforce, but changes in Perforce will
not be reflected in Subversion.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+----------------------------------+
| `Prev <renaming-files.html>`__?   | ?                       | ?\ `Next <offline-ops.html>`__   |
+-----------------------------------+-------------------------+----------------------------------+
| 13.?Renaming Files?               | `Home <index.html>`__   | ?15.?Offline Operation           |
+-----------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
