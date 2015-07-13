===================================
2.3.?Atomically Protected Variables
===================================

.. raw:: html

   <div class="navheader">

2.3.?Atomically Protected Variables
`Prev <locking-sx.html>`__?
Chapter?2.?Locking Notes
?\ `Next <kernel-objects.html>`__

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

2.3.?Atomically Protected Variables
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An atomically protected variable is a special variable that is not
protected by an explicit lock. Instead, all data accesses to the
variables use special atomic operations as described in
`atomic(9) <http://www.FreeBSD.org/cgi/man.cgi?query=atomic&sektion=9>`__.
Very few variables are treated this way, although other synchronization
primitives such as mutexes are implemented with atomically protected
variables.

.. raw:: html

   <div class="itemizedlist">

-  ``mtx``.\ ``mtx_lock``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+-------------------------------------+
| `Prev <locking-sx.html>`__?    | `Up <locking.html>`__   | ?\ `Next <kernel-objects.html>`__   |
+--------------------------------+-------------------------+-------------------------------------+
| 2.2.?Shared Exclusive Locks?   | `Home <index.html>`__   | ?Chapter?3.?Kernel Objects          |
+--------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
