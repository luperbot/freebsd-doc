===========================
6.?Page Table Optimizations
===========================

.. raw:: html

   <div class="navheader">

6.?Page Table Optimizations
`Prev <prefault-optimizations.html>`__?
?
?\ `Next <page-coloring-optimizations.html>`__

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

6.?Page Table Optimizations
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The page table optimizations make up the most contentious part of the
FreeBSD VM design and they have shown some strain with the advent of
serious use of ``mmap()``. I think this is actually a feature of most
BSDs though I am not sure when it was first introduced. There are two
major optimizations. The first is that hardware page tables do not
contain persistent state but instead can be thrown away at any time with
only a minor amount of management overhead. The second is that every
active page table entry in the system has a governing ``pv_entry``
structure which is tied into the ``vm_page`` structure. FreeBSD can
simply iterate through those mappings that are known to exist while
Linux must check all page tables that *might* contain a specific mapping
to see if it does, which can achieve O(n^2) overhead in certain
situations. It is because of this that FreeBSD tends to make better
choices on which pages to reuse or swap when memory is stressed, giving
it better performance under load. However, FreeBSD requires kernel
tuning to accommodate large-shared-address-space situations such as
those that can occur in a news system because it may run out of
``pv_entry`` structures.

Both Linux and FreeBSD need work in this area. FreeBSD is trying to
maximize the advantage of a potentially sparse active-mapping model (not
all processes need to map all pages of a shared library, for example),
whereas Linux is trying to simplify its algorithms. FreeBSD generally
has the performance advantage here at the cost of wasting a little extra
memory, but FreeBSD breaks down in the case where a large file is
massively shared across hundreds of processes. Linux, on the other hand,
breaks down in the case where many processes are sparsely-mapping the
same shared library and also runs non-optimally when trying to determine
whether a page can be reused or not.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+--------------------------------------------------+
| `Prev <prefault-optimizations.html>`__?      | ?                       | ?\ `Next <page-coloring-optimizations.html>`__   |
+----------------------------------------------+-------------------------+--------------------------------------------------+
| 5.?Pre-Faulting and Zeroing Optimizations?   | `Home <index.html>`__   | ?7.?Page Coloring                                |
+----------------------------------------------+-------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
