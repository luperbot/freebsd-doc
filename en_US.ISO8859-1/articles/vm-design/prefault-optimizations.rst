=========================================
5.?Pre-Faulting and Zeroing Optimizations
=========================================

.. raw:: html

   <div class="navheader">

5.?Pre-Faulting and Zeroing Optimizations
`Prev <freeing-pages.html>`__?
?
?\ `Next <page-table-optimizations.html>`__

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

5.?Pre-Faulting and Zeroing Optimizations
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Taking a VM fault is not expensive if the underlying page is already in
core and can simply be mapped into the process, but it can become
expensive if you take a whole lot of them on a regular basis. A good
example of this is running a program such as
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ or
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ over
and over again. If the program binary is mapped into memory but not
mapped into the page table, then all the pages that will be accessed by
the program will have to be faulted in every time the program is run.
This is unnecessary when the pages in question are already in the VM
Cache, so FreeBSD will attempt to pre-populate a process's page tables
with those pages that are already in the VM Cache. One thing that
FreeBSD does not yet do is pre-copy-on-write certain pages on exec. For
example, if you run the
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
program while running ``vmstat     1`` you will notice that it always
takes a certain number of page faults, even when you run it over and
over again. These are zero-fill faults, not program code faults (which
were pre-faulted in already). Pre-copying pages on exec or fork is an
area that could use more study.

A large percentage of page faults that occur are zero-fill faults. You
can usually see this by observing the ``vmstat -s`` output. These occur
when a process accesses pages in its BSS area. The BSS area is expected
to be initially zero but the VM system does not bother to allocate any
memory at all until the process actually accesses it. When a fault
occurs the VM system must not only allocate a new page, it must zero it
as well. To optimize the zeroing operation the VM system has the ability
to pre-zero pages and mark them as such, and to request pre-zeroed pages
when zero-fill faults occur. The pre-zeroing occurs whenever the CPU is
idle but the number of pages the system pre-zeros is limited in order to
avoid blowing away the memory caches. This is an excellent example of
adding complexity to the VM system in order to optimize the critical
path.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-----------------------------------------------+
| `Prev <freeing-pages.html>`__?   | ?                       | ?\ `Next <page-table-optimizations.html>`__   |
+----------------------------------+-------------------------+-----------------------------------------------+
| 4.?When to free a page?          | `Home <index.html>`__   | ?6.?Page Table Optimizations                  |
+----------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
