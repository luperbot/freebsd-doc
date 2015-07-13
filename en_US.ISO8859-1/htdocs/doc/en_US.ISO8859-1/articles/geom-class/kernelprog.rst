================================
3.?On FreeBSD Kernel Programming
================================

.. raw:: html

   <div class="navheader">

3.?On FreeBSD Kernel Programming
`Prev <prelim.html>`__?
?
?\ `Next <geom.html>`__

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

3.?On FreeBSD Kernel Programming
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Memory Allocation
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

See
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__.
Basic memory allocation is only slightly different than its userland
equivalent. Most notably, ``malloc``\ () and ``free``\ () accept
additional parameters as is described in the man page.

A “malloc type” must be declared in the declaration section of a source
file, like this:

.. code:: programlisting

      static MALLOC_DEFINE(M_GJOURNAL, "gjournal data", "GEOM_JOURNAL Data");

To use this macro, ``sys/param.h``, ``sys/kernel.h`` and
``sys/malloc.h`` headers must be included.

There is another mechanism for allocating memory, the UMA (Universal
Memory Allocator). See
`uma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=uma&sektion=9>`__ for
details, but it is a special type of allocator mainly used for speedy
allocation of lists comprised of same-sized items (for example, dynamic
arrays of structs).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.?Lists and Queues
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

See
`queue(3) <http://www.FreeBSD.org/cgi/man.cgi?query=queue&sektion=3>`__.
There are a LOT of cases when a list of things needs to be maintained.
Fortunately, this data structure is implemented (in several ways) by C
macros included in the system. The most used list type is TAILQ because
it is the most flexible. It is also the one with largest memory
requirements (its elements are doubly-linked) and also the slowest
(although the speed variation is on the order of several CPU
instructions more, so it should not be taken seriously).

If data retrieval speed is very important, see
`tree(3) <http://www.FreeBSD.org/cgi/man.cgi?query=tree&sektion=3>`__
and
`hashinit(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hashinit&sektion=9>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.?BIOs
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Structure ``bio`` is used for any and all Input/Output operations
concerning GEOM. It basically contains information about what device
('provider') should satisfy the request, request type, offset, length,
pointer to a buffer, and a bunch of “user-specific” flags and fields
that can help implement various hacks.

The important thing here is that ``bio``\ s are handled asynchronously.
That means that, in most parts of the code, there is no analogue to
userland's
`read(2) <http://www.FreeBSD.org/cgi/man.cgi?query=read&sektion=2>`__
and
`write(2) <http://www.FreeBSD.org/cgi/man.cgi?query=write&sektion=2>`__
calls that do not return until a request is done. Rather, a
developer-supplied function is called as a notification when the request
gets completed (or results in error).

The asynchronous programming model (also called “event-driven”) is
somewhat harder than the much more used imperative one used in userland
(at least it takes a while to get used to it). In some cases the helper
routines ``g_write_data``\ () and ``g_read_data``\ () can be used, but
*not always*. In particular, they cannot be used when a mutex is held;
for example, the GEOM topology mutex or the internal mutex held during
the ``.start``\ () and ``.stop``\ () functions.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+---------------------------+
| `Prev <prelim.html>`__?   | ?                       | ?\ `Next <geom.html>`__   |
+---------------------------+-------------------------+---------------------------+
| 2.?Preliminaries?         | `Home <index.html>`__   | ?4.?On GEOM Programming   |
+---------------------------+-------------------------+---------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
