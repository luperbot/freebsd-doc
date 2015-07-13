======================
2.5.?Memory Management
======================

.. raw:: html

   <div class="navheader">

2.5.?Memory Management
`Prev <overview-process-management.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-io-system.html>`__

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

2.5.?Memory Management
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Each process has its own private address space. The address space is
initially divided into three logical segments: *text*, *data*, and
*stack*. The text segment is read-only and contains the machine
instructions of a program. The data and stack segments are both readable
and writable. The data segment contains the initialized and
uninitialized data portions of a program, whereas the stack segment
holds the application's run-time stack. On most machines, the stack
segment is extended automatically by the kernel as the process executes.
A process can expand or contract its data segment by making a system
call, whereas a process can change the size of its text segment only
when the segment's contents are overlaid with data from the filesystem,
or when debugging takes place. The initial contents of the segments of a
child process are duplicates of the segments of a parent process.

The entire contents of a process address space do not need to be
resident for a process to execute. If a process references a part of its
address space that is not resident in main memory, the system *pages*
the necessary information into memory. When system resources are scarce,
the system uses a two-level approach to maintain available resources. If
a modest amount of memory is available, the system will take memory
resources away from processes if these resources have not been used
recently. Should there be a severe resource shortage, the system will
resort to *swapping* the entire context of a process to secondary
storage. The *demand paging* and *swapping* done by the system are
effectively transparent to processes. A process may, however, advise the
system about expected future memory utilization as a performance aid.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.5.1.?BSD Memory-Management Design Decisions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The support of large sparse address spaces, mapped files, and shared
memory was a requirement for 4.2BSD. An interface was specified, called
*mmap*, that allowed unrelated processes to request a shared mapping of
a file into their address spaces. If multiple processes mapped the same
file into their address spaces, changes to the file's portion of an
address space by one process would be reflected in the area mapped by
the other processes, as well as in the file itself. Ultimately, 4.2BSD
was shipped without the *mmap* interface, because of pressure to make
other features, such as networking, available.

Further development of the *mmap* interface continued during the work on
4.3BSD. Over 40 companies and research groups participated in the
discussions leading to the revised architecture that was described in
the Berkeley Software Architecture Manual `[McKusick et al,
1994] <overview.html#biblio-mckusick-1>`__. Several of the companies
have implemented the revised interface `[Gingell et al,
1987] <overview.html#biblio-gingell>`__.

Once again, time pressure prevented 4.3BSD from providing an
implementation of the interface. Although the latter could have been
built into the existing 4.3BSD virtual-memory system, the developers
decided not to put it in because that implementation was nearly 10 years
old. Furthermore, the original virtual-memory design was based on the
assumption that computer memories were small and expensive, whereas
disks were locally connected, fast, large, and inexpensive. Thus, the
virtual-memory system was designed to be frugal with its use of memory
at the expense of generating extra disk traffic. In addition, the 4.3BSD
implementation was riddled with VAX memory-management hardware
dependencies that impeded its portability to other computer
architectures. Finally, the virtual-memory system was not designed to
support the tightly coupled multiprocessors that are becoming
increasingly common and important today.

Attempts to improve the old implementation incrementally seemed doomed
to failure. A completely new design, on the other hand, could take
advantage of large memories, conserve disk transfers, and have the
potential to run on multiprocessors. Consequently, the virtual-memory
system was completely replaced in 4.4BSD. The 4.4BSD virtual-memory
system is based on the Mach 2.0 VM system `[Tevanian,
1987] <overview.html#biblio-tevanian>`__. with updates from Mach 2.5 and
Mach 3.0. It features efficient support for sharing, a clean separation
of machine-independent and machine-dependent features, as well as
(currently unused) multiprocessor support. Processes can map files
anywhere in their address space. They can share parts of their address
space by doing a shared mapping of the same file. Changes made by one
process are visible in the address space of the other process, and also
are written back to the file itself. Processes can also request private
mappings of a file, which prevents any changes that they make from being
visible to other processes mapping the file or being written back to the
file itself.

Another issue with the virtual-memory system is the way that information
is passed into the kernel when a system call is made. 4.4BSD always
copies data from the process address space into a buffer in the kernel.
For read or write operations that are transferring large quantities of
data, doing the copy can be time consuming. An alternative to doing the
copying is to remap the process memory into the kernel. The 4.4BSD
kernel always copies the data for several reasons:

.. raw:: html

   <div class="itemizedlist">

-  Often, the user data are not page aligned and are not a multiple of
   the hardware page length.

-  If the page is taken away from the process, it will no longer be able
   to reference that page. Some programs depend on the data remaining in
   the buffer even after those data have been written.

-  If the process is allowed to keep a copy of the page (as it is in
   current 4.4BSD semantics), the page must be made *copy-on-write*. A
   copy-on-write page is one that is protected against being written by
   being made read-only. If the process attempts to modify the page, the
   kernel gets a write fault. The kernel then makes a copy of the page
   that the process can modify. Unfortunately, the typical process will
   immediately try to write new data to its output buffer, forcing the
   data to be copied anyway.

-  When pages are remapped to new virtual-memory addresses, most
   memory-management hardware requires that the hardware
   address-translation cache be purged selectively. The cache purges are
   often slow. The net effect is that remapping is slower than copying
   for blocks of data less than 4 to 8 Kbyte.

.. raw:: html

   </div>

The biggest incentives for memory mapping are the needs for accessing
big files and for passing large quantities of data between processes.
The *mmap* interface provides a way for both of these tasks to be done
without copying.

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

2.5.2.?Memory Management Inside the Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The kernel often does allocations of memory that are needed for only the
duration of a single system call. In a user process, such short-term
memory would be allocated on the run-time stack. Because the kernel has
a limited run-time stack, it is not feasible to allocate even
moderate-sized blocks of memory on it. Consequently, such memory must be
allocated through a more dynamic mechanism. For example, when the system
must translate a pathname, it must allocate a 1-Kbyte buffer to hold the
name. Other blocks of memory must be more persistent than a single
system call, and thus could not be allocated on the stack even if there
was space. An example is protocol-control blocks that remain throughout
the duration of a network connection.

Demands for dynamic memory allocation in the kernel have increased as
more services have been added. A generalized memory allocator reduces
the complexity of writing code inside the kernel. Thus, the 4.4BSD
kernel has a single memory allocator that can be used by any part of the
system. It has an interface similar to the C library routines *malloc*
and *free* that provide memory allocation to application programs
`[McKusick & Karels, 1988] <overview.html#biblio-mckusick-2>`__. Like
the C library interface, the allocation routine takes a parameter
specifying the size of memory that is needed. The range of sizes for
memory requests is not constrained; however, physical memory is
allocated and is not paged. The free routine takes a pointer to the
storage being freed, but does not require the size of the piece of
memory being freed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+--------------------------+-----------------------------------------+
| `Prev <overview-process-management.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-io-system.html>`__   |
+------------------------------------------------+--------------------------+-----------------------------------------+
| 2.4.?Process Management?                       | `Home <index.html>`__    | ?2.6.?I/O System                        |
+------------------------------------------------+--------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
