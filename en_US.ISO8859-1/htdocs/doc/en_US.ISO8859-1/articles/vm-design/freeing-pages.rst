======================
4.?When to free a page
======================

.. raw:: html

   <div class="navheader">

4.?When to free a page
`Prev <swap-layers.html>`__?
?
?\ `Next <prefault-optimizations.html>`__

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

4.?When to free a page
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since the VM system uses all available memory for disk caching, there
are usually very few truly-free pages. The VM system depends on being
able to properly choose pages which are not in use to reuse for new
allocations. Selecting the optimal pages to free is possibly the
single-most important function any VM system can perform because if it
makes a poor selection, the VM system may be forced to unnecessarily
retrieve pages from disk, seriously degrading system performance.

How much overhead are we willing to suffer in the critical path to avoid
freeing the wrong page? Each wrong choice we make will cost us hundreds
of thousands of CPU cycles and a noticeable stall of the affected
processes, so we are willing to endure a significant amount of overhead
in order to be sure that the right page is chosen. This is why FreeBSD
tends to outperform other systems when memory resources become stressed.

The free page determination algorithm is built upon a history of the use
of memory pages. To acquire this history, the system takes advantage of
a page-used bit feature that most hardware page tables have.

In any case, the page-used bit is cleared and at some later point the VM
system comes across the page again and sees that the page-used bit has
been set. This indicates that the page is still being actively used. If
the bit is still clear it is an indication that the page is not being
actively used. By testing this bit periodically, a use history (in the
form of a counter) for the physical page is developed. When the VM
system later needs to free up some pages, checking this history becomes
the cornerstone of determining the best candidate page to reuse.

.. raw:: html

   <div class="sidebar">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   <div class="-title" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For those platforms that do not have this feature, the system actually
emulates a page-used bit. It unmaps or protects a page, forcing a page
fault if the page is accessed again. When the page fault is taken, the
system simply marks the page as having been used and unprotects the page
so that it may be used. While taking such page faults just to determine
if a page is being used appears to be an expensive proposition, it is
much less expensive than reusing the page for some other purpose only to
find that a process needs it back and then have to go to disk.

.. raw:: html

   </div>

FreeBSD makes use of several page queues to further refine the selection
of pages to reuse as well as to determine when dirty pages must be
flushed to their backing store. Since page tables are dynamic entities
under FreeBSD, it costs virtually nothing to unmap a page from the
address space of any processes using it. When a page candidate has been
chosen based on the page-use counter, this is precisely what is done.
The system must make a distinction between clean pages which can
theoretically be freed up at any time, and dirty pages which must first
be written to their backing store before being reusable. When a page
candidate has been found it is moved to the inactive queue if it is
dirty, or the cache queue if it is clean. A separate algorithm based on
the dirty-to-clean page ratio determines when dirty pages in the
inactive queue must be flushed to disk. Once this is accomplished, the
flushed pages are moved from the inactive queue to the cache queue. At
this point, pages in the cache queue can still be reactivated by a VM
fault at relatively low cost. However, pages in the cache queue are
considered to be “immediately freeable” and will be reused in an LRU
(least-recently used) fashion when the system needs to allocate new
memory.

It is important to note that the FreeBSD VM system attempts to separate
clean and dirty pages for the express reason of avoiding unnecessary
flushes of dirty pages (which eats I/O bandwidth), nor does it move
pages between the various page queues gratuitously when the memory
subsystem is not being stressed. This is why you will see some systems
with very low cache queue counts and high active queue counts when doing
a ``systat -vm`` command. As the VM system becomes more stressed, it
makes a greater effort to maintain the various page queues at the levels
determined to be the most effective.

An urban myth has circulated for years that Linux did a better job
avoiding swapouts than FreeBSD, but this in fact is not true. What was
actually occurring was that FreeBSD was proactively paging out unused
pages in order to make room for more disk cache while Linux was keeping
unused pages in core and leaving less memory available for cache and
process pages. I do not know whether this is still true today.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------------------------+
| `Prev <swap-layers.html>`__?   | ?                       | ?\ `Next <prefault-optimizations.html>`__    |
+--------------------------------+-------------------------+----------------------------------------------+
| 3.?SWAP Layers?                | `Home <index.html>`__   | ?5.?Pre-Faulting and Zeroing Optimizations   |
+--------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
