=================================================
7.4.?Mapping Page Tables—vm\_map\_t, vm\_entry\_t
=================================================

.. raw:: html

   <div class="navheader">

7.4.?Mapping Page Tables—\ ``vm_map_t,     vm_entry_t``
`Prev <vm-fileio.html>`__?
Chapter?7.?Virtual Memory System
?\ `Next <vm-kvm.html>`__

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

7.4.?Mapping Page Tables—\ ``vm_map_t,     vm_entry_t``
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD separates the physical page table topology from the VM system.
All hard per-process page tables can be reconstructed on the fly and are
usually considered throwaway. Special page tables such as those managing
KVM are typically permanently preallocated. These page tables are not
throwaway.

FreeBSD associates portions of vm\_objects with address ranges in
virtual memory through ``vm_map_t`` and ``vm_entry_t`` structures. Page
tables are directly synthesized from the ``vm_map_t``/``vm_entry_t``/
``vm_object_t`` hierarchy. Recall that I mentioned that physical pages
are only directly associated with a ``vm_object``; that is not quite
true. ``vm_page_t``'s are also linked into page tables that they are
actively associated with. One ``vm_page_t`` can be linked into several
*pmaps*, as page tables are called. However, the hierarchical
association holds, so all references to the same page in the same object
reference the same ``vm_page_t`` and thus give us buffer cache
unification across the board.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-----------------------------+
| `Prev <vm-fileio.html>`__?              | `Up <vm.html>`__        | ?\ `Next <vm-kvm.html>`__   |
+-----------------------------------------+-------------------------+-----------------------------+
| 7.3.?Filesystem I/O—\ ``struct buf``?   | `Home <index.html>`__   | ?7.5.?KVM Memory Mapping    |
+-----------------------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
