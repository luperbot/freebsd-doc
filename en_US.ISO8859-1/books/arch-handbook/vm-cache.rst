===========================================
7.2.?The Unified Buffer Cache—vm\_object\_t
===========================================

.. raw:: html

   <div class="navheader">

7.2.?The Unified Buffer Cache—\ ``vm_object_t``
`Prev <vm.html>`__?
Chapter?7.?Virtual Memory System
?\ `Next <vm-fileio.html>`__

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

7.2.?The Unified Buffer Cache—\ ``vm_object_t``
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD implements the idea of a generic “VM object”. VM objects can be
associated with backing store of various types—unbacked, swap-backed,
physical device-backed, or file-backed storage. Since the filesystem
uses the same VM objects to manage in-core data relating to files, the
result is a unified buffer cache.

VM objects can be *shadowed*. That is, they can be stacked on top of
each other. For example, you might have a swap-backed VM object stacked
on top of a file-backed VM object in order to implement a MAP\_PRIVATE
mmap()ing. This stacking is also used to implement various sharing
properties, including copy-on-write, for forked address spaces.

It should be noted that a ``vm_page_t`` can only be associated with one
VM object at a time. The VM object shadowing implements the perceived
sharing of the same page across multiple instances.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-----------------------------------------+
| `Prev <vm.html>`__?                 | `Up <vm.html>`__        | ?\ `Next <vm-fileio.html>`__            |
+-------------------------------------+-------------------------+-----------------------------------------+
| Chapter?7.?Virtual Memory System?   | `Home <index.html>`__   | ?7.3.?Filesystem I/O—\ ``struct buf``   |
+-------------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
