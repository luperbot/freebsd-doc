================
7.?Page Coloring
================

.. raw:: html

   <div class="navheader">

7.?Page Coloring
`Prev <page-table-optimizations.html>`__?
?
?\ `Next <conclusion.html>`__

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

7.?Page Coloring
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We will end with the page coloring optimizations. Page coloring is a
performance optimization designed to ensure that accesses to contiguous
pages in virtual memory make the best use of the processor cache. In
ancient times (i.e. 10+ years ago) processor caches tended to map
virtual memory rather than physical memory. This led to a huge number of
problems including having to clear the cache on every context switch in
some cases, and problems with data aliasing in the cache. Modern
processor caches map physical memory precisely to solve those problems.
This means that two side-by-side pages in a processes address space may
not correspond to two side-by-side pages in the cache. In fact, if you
are not careful side-by-side pages in virtual memory could wind up using
the same page in the processor cache—leading to cacheable data being
thrown away prematurely and reducing CPU performance. This is true even
with multi-way set-associative caches (though the effect is mitigated
somewhat).

FreeBSD's memory allocation code implements page coloring optimizations,
which means that the memory allocation code will attempt to locate free
pages that are contiguous from the point of view of the cache. For
example, if page 16 of physical memory is assigned to page 0 of a
process's virtual memory and the cache can hold 4 pages, the page
coloring code will not assign page 20 of physical memory to page 1 of a
process's virtual memory. It would, instead, assign page 21 of physical
memory. The page coloring code attempts to avoid assigning page 20
because this maps over the same cache memory as page 16 and would result
in non-optimal caching. This code adds a significant amount of
complexity to the VM memory allocation subsystem as you can well
imagine, but the result is well worth the effort. Page Coloring makes VM
memory as deterministic as physical memory in regards to cache
performance.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------+---------------------------------+
| `Prev <page-table-optimizations.html>`__?   | ?                       | ?\ `Next <conclusion.html>`__   |
+---------------------------------------------+-------------------------+---------------------------------+
| 6.?Page Table Optimizations?                | `Home <index.html>`__   | ?8.?Conclusion                  |
+---------------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
