=======================
19.9. Backup Strategies
=======================

.. raw:: html

   <div class="navheader">

19.9. Backup Strategies
`????? <backups-tapebackups.html>`__?
???????? 19. ???????????? ????
?\ `??????? <backup-basics.html>`__

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

19.9. Backup Strategies
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Original work by Lowell Gilbert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first requirement in devising a backup plan is to make sure that all
of the following problems are covered:

.. raw:: html

   <div class="itemizedlist">

-  Disk failure.

-  Accidental file deletion.

-  Random file corruption.

-  Complete machine destruction, say by fire, including destruction of
   any on-site backups.

.. raw:: html

   </div>

Some systems will be best served by having each of these problems
covered by a completely different technique. Except for strictly
personal systems with low-value data, it is unlikely that one technique
will cover all of them.

Some possible techniques include:

.. raw:: html

   <div class="itemizedlist">

-  Archives of the whole system, backed up onto permanent, off-site
   media. This provides protection against all of the problems listed
   above, but is slow and inconvenient to restore from. Copies of the
   backups can be stored on site or online, but there will still be
   inconveniences in restoring files, especially for non-privileged
   users.

-  Filesystem snapshots, which are really only helpful in the accidental
   file deletion scenario, but can be *very* helpful in that case, as
   well as quick and easy to deal with.

-  Copies of whole file systems or disks which can be created with a
   periodic
   `net/rsync <http://www.freebsd.org/cgi/url.cgi?ports/net/rsync/pkg-descr>`__
   of the whole machine. This is generally most useful in networks with
   unique requirements. For general protection against disk failure,
   this is usually inferior to RAID. For restoring accidentally deleted
   files, it can be comparable to UFS snapshots.

-  RAID, which minimizes or avoids downtime when a disk fails at the
   expense of having to deal with disk failures more often, because
   there are more disks, albeit at a much lower urgency.

-  Checking fingerprints of files using
   `mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8>`__.
   Although this is not a backup, this technique indicates when one
   needs to resort to backups. This is particularly important for
   offline backups, and should be checked periodically.

.. raw:: html

   </div>

It is quite easy to come up with more techniques, many of them
variations on the ones listed above. Specialized requirements usually
lead to specialized techniques. For example, backing up a live database
usually requires a method particular to the database software as an
intermediate step. The important thing is to know which dangers should
be protected against, and how each will be handled.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+---------------------------------------+
| `????? <backups-tapebackups.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <backup-basics.html>`__   |
+-----------------------------------------+-------------------------+---------------------------------------+
| 19.8. Creating and Using Data Tapes?    | `???? <index.html>`__   | ?19.10. Backup Basics                 |
+-----------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
