==============
3.?SWAP Layers
==============

.. raw:: html

   <div class="navheader">

3.?SWAP Layers
`Prev <vm-objects.html>`__?
?
?\ `Next <freeing-pages.html>`__

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

3.?SWAP Layers
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Private data pages are initially either copy-on-write or zero-fill
pages. When a change, and therefore a copy, is made, the original
backing object (usually a file) can no longer be used to save a copy of
the page when the VM system needs to reuse it for other purposes. This
is where SWAP comes in. SWAP is allocated to create backing store for
memory that does not otherwise have it. FreeBSD allocates the swap
management structure for a VM Object only when it is actually needed.
However, the swap management structure has had problems historically:

.. raw:: html

   <div class="itemizedlist">

-  Under FreeBSD 3.X the swap management structure preallocates an array
   that encompasses the entire object requiring swap backing store—even
   if only a few pages of that object are swap-backed. This creates a
   kernel memory fragmentation problem when large objects are mapped, or
   processes with large runsizes (RSS) fork.

-  Also, in order to keep track of swap space, a “list of holes” is kept
   in kernel memory, and this tends to get severely fragmented as well.
   Since the “list of holes” is a linear list, the swap allocation and
   freeing performance is a non-optimal O(n)-per-page.

-  It requires kernel memory allocations to take place during the swap
   freeing process, and that creates low memory deadlock problems.

-  The problem is further exacerbated by holes created due to the
   interleaving algorithm.

-  Also, the swap block map can become fragmented fairly easily
   resulting in non-contiguous allocations.

-  Kernel memory must also be allocated on the fly for additional swap
   management structures when a swapout occurs.

.. raw:: html

   </div>

It is evident from that list that there was plenty of room for
improvement. For FreeBSD 4.X, I completely rewrote the swap subsystem:

.. raw:: html

   <div class="itemizedlist">

-  Swap management structures are allocated through a hash table rather
   than a linear array giving them a fixed allocation size and much
   finer granularity.

-  Rather then using a linearly linked list to keep track of swap space
   reservations, it now uses a bitmap of swap blocks arranged in a radix
   tree structure with free-space hinting in the radix node structures.
   This effectively makes swap allocation and freeing an O(1) operation.

-  The entire radix tree bitmap is also preallocated in order to avoid
   having to allocate kernel memory during critical low memory swapping
   operations. After all, the system tends to swap when it is low on
   memory so we should avoid allocating kernel memory at such times in
   order to avoid potential deadlocks.

-  To reduce fragmentation the radix tree is capable of allocating large
   contiguous chunks at once, skipping over smaller fragmented chunks.

.. raw:: html

   </div>

I did not take the final step of having an “allocating hint pointer”
that would trundle through a portion of swap as allocations were made in
order to further guarantee contiguous allocations or at least locality
of reference, but I ensured that such an addition could be made.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+------------------------------------+
| `Prev <vm-objects.html>`__?   | ?                       | ?\ `Next <freeing-pages.html>`__   |
+-------------------------------+-------------------------+------------------------------------+
| 2.?VM Objects?                | `Home <index.html>`__   | ?4.?When to free a page            |
+-------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
