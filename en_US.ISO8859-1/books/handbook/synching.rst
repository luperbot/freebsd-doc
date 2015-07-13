==========================
24.5.?Synchronizing Source
==========================

.. raw:: html

   <div class="navheader">

24.5.?Synchronizing Source
`Prev <current-stable.html>`__?
Chapter?24.?Updating and Upgrading FreeBSD
?\ `Next <makeworld.html>`__

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

24.5.?Synchronizing Source
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are various methods for staying up-to-date with the FreeBSD
sources. This section compares the primary services, Subversion and CTM.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

While it is possible to update only parts of the source tree, the only
supported update procedure is to update the entire tree and recompile
all the programs that run in user space, such as those in ``/bin`` and
``/sbin``, and kernel sources. Updating only part of the source tree,
only the kernel, or only the userland programs will often result in
problems ranging from compile errors to kernel panics or data
corruption.

.. raw:: html

   </div>

Subversion uses the *pull* model of updating sources. The user, or a
``cron`` script, invokes the ``svn`` program which updates the local
version of the source. Subversion is the preferred method for updating
local source trees as updates are up-to-the-minute and the user controls
when updates are downloaded. It is easy to restrict updates to specific
files or directories and the requested updates are generated on the fly
by the server. How to synchronize source using Subversion is described
in `Section?A.4, “Using Subversion” <svn.html>`__.

CTM does not interactively compare the local sources with those on the
master archive or otherwise pull them across. Instead, a script which
identifies changes in files since its previous run is executed several
times a day on the master CTM machine. Any detected changes are
compressed, stamped with a sequence-number, and encoded for transmission
over email in printable ASCII only. Once downloaded, these *deltas* can
be run through ``ctm.rmail`` which will automatically decode, verify,
and apply the changes to the user's copy of the sources. This process is
more efficient than Subversion and places less strain on server
resources since it is a *push*, rather than a *pull*, model.
Instructions for using CTM to synchronize source can be found at
`Section?A.3, “Using CTM” <ctm.html>`__.

If a user inadvertently wipes out portions of the local archive,
Subversion will detect and rebuild the damaged portions. CTM will not,
and if a user deletes some portion of the source tree and does not have
a backup, they will have to start from scratch from the most recent
*base delta* and rebuild it all with CTM.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+------------------------------------+--------------------------------+
| `Prev <current-stable.html>`__?        | `Up <updating-upgrading.html>`__   | ?\ `Next <makeworld.html>`__   |
+----------------------------------------+------------------------------------+--------------------------------+
| 24.4.?Tracking a Development Branch?   | `Home <index.html>`__              | ?24.6.?Rebuilding World        |
+----------------------------------------+------------------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
