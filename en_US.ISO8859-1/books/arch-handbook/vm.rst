================================
Chapter?7.?Virtual Memory System
================================

.. raw:: html

   <div class="navheader">

Chapter?7.?Virtual Memory System
`Prev <mac-conclusion.html>`__?
Part?I.?Kernel
?\ `Next <vm-cache.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?7.?Virtual Memory System
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Matthew Dillon.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`7.1. Management of Physical
Memory—\ ``vm_page_t`` <vm.html#vm-physmem>`__
`7.2. The Unified Buffer Cache—\ ``vm_object_t`` <vm-cache.html>`__
`7.3. Filesystem I/O—\ ``struct buf`` <vm-fileio.html>`__
`7.4. Mapping Page
Tables—\ ``vm_map_t,     vm_entry_t`` <vm-pagetables.html>`__
`7.5. KVM Memory Mapping <vm-kvm.html>`__
`7.6. Tuning the FreeBSD VM System <vm-tuning.html>`__

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

7.1.?Management of Physical Memory—\ ``vm_page_t``
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Physical memory is managed on a page-by-page basis through the
``vm_page_t`` structure. Pages of physical memory are categorized
through the placement of their respective ``vm_page_t`` structures on
one of several paging queues.

A page can be in a wired, active, inactive, cache, or free state. Except
for the wired state, the page is typically placed in a doubly link list
queue representing the state that it is in. Wired pages are not placed
on any queue.

FreeBSD implements a more involved paging queue for cached and free
pages in order to implement page coloring. Each of these states involves
multiple queues arranged according to the size of the processor's L1 and
L2 caches. When a new page needs to be allocated, FreeBSD attempts to
obtain one that is reasonably well aligned from the point of view of the
L1 and L2 caches relative to the VM object the page is being allocated
for.

Additionally, a page may be held with a reference count or locked with a
busy count. The VM system also implements an “ultimate locked” state for
a page using the PG\_BUSY bit in the page's flags.

In general terms, each of the paging queues operates in a LRU fashion. A
page is typically placed in a wired or active state initially. When
wired, the page is usually associated with a page table somewhere. The
VM system ages the page by scanning pages in a more active paging queue
(LRU) in order to move them to a less-active paging queue. Pages that
get moved into the cache are still associated with a VM object but are
candidates for immediate reuse. Pages in the free queue are truly free.
FreeBSD attempts to minimize the number of pages in the free queue, but
a certain minimum number of truly free pages must be maintained in order
to accommodate page allocation at interrupt time.

If a process attempts to access a page that does not exist in its page
table but does exist in one of the paging queues (such as the inactive
or cache queues), a relatively inexpensive page reactivation fault
occurs which causes the page to be reactivated. If the page does not
exist in system memory at all, the process must block while the page is
brought in from disk.

FreeBSD dynamically tunes its paging queues and attempts to maintain
reasonable ratios of pages in the various queues as well as attempts to
maintain a reasonable breakdown of clean versus dirty pages. The amount
of rebalancing that occurs depends on the system's memory load. This
rebalancing is implemented by the pageout daemon and involves laundering
dirty pages (syncing them with their backing store), noticing when pages
are activity referenced (resetting their position in the LRU queues or
moving them between queues), migrating pages between queues when the
queues are out of balance, and so forth. FreeBSD's VM system is willing
to take a reasonable number of reactivation page faults to determine how
active or how idle a page actually is. This leads to better decisions
being made as to when to launder or swap-out a page.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+----------------------------------------------------+
| `Prev <mac-conclusion.html>`__?   | `Up <kernel.html>`__    | ?\ `Next <vm-cache.html>`__                        |
+-----------------------------------+-------------------------+----------------------------------------------------+
| 6.9.?Conclusion?                  | `Home <index.html>`__   | ?7.2.?The Unified Buffer Cache—\ ``vm_object_t``   |
+-----------------------------------+-------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
