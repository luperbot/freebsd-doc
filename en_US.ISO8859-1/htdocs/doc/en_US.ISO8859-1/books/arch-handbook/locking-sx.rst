===========================
2.2.?Shared Exclusive Locks
===========================

.. raw:: html

   <div class="navheader">

2.2.?Shared Exclusive Locks
`Prev <locking.html>`__?
Chapter?2.?Locking Notes
?\ `Next <locking-atomic.html>`__

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

2.2.?Shared Exclusive Locks
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These locks provide basic reader-writer type functionality and may be
held by a sleeping process. Currently they are backed by
`lockmgr(9) <http://www.FreeBSD.org/cgi/man.cgi?query=lockmgr&sektion=9>`__.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?2.2.?Shared Exclusive Lock List

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+---------------------------------------------------------------------------------------------------+
| Variable Name       | Protectees                                                                                        |
+=====================+===================================================================================================+
| ``allproc_lock``    | ``allproc`` ``zombproc`` ``pidhashtbl`` ``proc``.\ ``p_list`` ``proc``.\ ``p_hash`` ``nextpid``   |
+---------------------+---------------------------------------------------------------------------------------------------+
| ``proctree_lock``   | ``proc``.\ ``p_children`` ``proc``.\ ``p_sibling``                                                |
+---------------------+---------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+----------------------------------------+
| `Prev <locking.html>`__?    | `Up <locking.html>`__   | ?\ `Next <locking-atomic.html>`__      |
+-----------------------------+-------------------------+----------------------------------------+
| Chapter?2.?Locking Notes?   | `Home <index.html>`__   | ?2.3.?Atomically Protected Variables   |
+-----------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
