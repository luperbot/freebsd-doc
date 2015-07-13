================================
Chapter?8.?SMPng Design Document
================================

.. raw:: html

   <div class="navheader">

Chapter?8.?SMPng Design Document
`Prev <vm-tuning.html>`__?
Part?I.?Kernel
?\ `Next <smp-lock-fundamentals.html>`__

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

Chapter?8.?SMPng Design Document
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by John Baldwin and Robert Watson.

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2002, 2004-2005 John Baldwin, Robert Watson

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

`8.1. Introduction <smp.html#smp-intro>`__
`8.2. Basic Tools and Locking
Fundamentals <smp-lock-fundamentals.html>`__
`8.3. General Architecture and Design <smp-design.html>`__
`8.4. Specific Locking Strategies <smp-lock-strategies.html>`__
`8.5. Implementation Notes <smp-implementation-notes.html>`__
`8.6. Miscellaneous Topics <smp-misc.html>`__
`Glossary <smp.html#smp-glossary>`__

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

8.1.?Introduction
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document presents the current design and implementation of the
SMPng Architecture. First, the basic primitives and tools are
introduced. Next, a general architecture for the FreeBSD kernel's
synchronization and execution model is laid out. Then, locking
strategies for specific subsystems are discussed, documenting the
approaches taken to introduce fine-grained synchronization and
parallelism for each subsystem. Finally, detailed implementation notes
are provided to motivate design choices, and make the reader aware of
important implications involving the use of specific primitives.

This document is a work-in-progress, and will be updated to reflect
on-going design and implementation activities associated with the SMPng
Project. Many sections currently exist only in outline form, but will be
fleshed out as work proceeds. Updates or suggestions regarding the
document may be directed to the document editors.

The goal of SMPng is to allow concurrency in the kernel. The kernel is
basically one rather large and complex program. To make the kernel
multi-threaded we use some of the same tools used to make other programs
multi-threaded. These include mutexes, shared/exclusive locks,
semaphores, and condition variables. For the definitions of these and
other SMP-related terms, please see the
`Glossary <smp.html#smp-glossary>`__ section of this article.

.. raw:: html

   </div>

.. raw:: html

   <div class="glossary">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Glossary
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

atomic
    An operation is atomic if all of its effects are visible to other
    CPUs together when the proper access protocol is followed. In the
    degenerate case are atomic instructions provided directly by machine
    architectures. At a higher level, if several members of a structure
    are protected by a lock, then a set of operations are atomic if they
    are all performed while holding the lock without releasing the lock
    in between any of the operations.

    See Also operation.

block
    A thread is blocked when it is waiting on a lock, resource, or
    condition. Unfortunately this term is a bit overloaded as a result.

    See Also sleep.

critical section
    A section of code that is not allowed to be preempted. A critical
    section is entered and exited using the
    `critical\_enter(9) <http://www.FreeBSD.org/cgi/man.cgi?query=critical_enter&sektion=9>`__
    API.

MD
    Machine dependent.

    See Also MI.

memory operation
    A memory operation reads and/or writes to a memory location.

MI
    Machine independent.

    See Also MD.

operation
    See memory operation.

primary interrupt context
    Primary interrupt context refers to the code that runs when an
    interrupt occurs. This code can either run an interrupt handler
    directly or schedule an asynchronous interrupt thread to execute the
    interrupt handlers for a given interrupt source.

realtime kernel thread
    A high priority kernel thread. Currently, the only realtime priority
    kernel threads are interrupt threads.

    See Also thread.

sleep
    A thread is asleep when it is blocked on a condition variable or a
    sleep queue via ``msleep`` or ``tsleep``.

    See Also block.

sleepable lock
    A sleepable lock is a lock that can be held by a thread which is
    asleep. Lockmgr locks and sx locks are currently the only sleepable
    locks in FreeBSD. Eventually, some sx locks such as the allproc and
    proctree locks may become non-sleepable locks.

    See Also sleep.

thread
    A kernel thread represented by a struct thread. Threads own locks
    and hold a single execution context.

wait channel
    A kernel virtual address that threads may sleep on.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+----------------------------------------------+
| `Prev <vm-tuning.html>`__?           | `Up <kernel.html>`__    | ?\ `Next <smp-lock-fundamentals.html>`__     |
+--------------------------------------+-------------------------+----------------------------------------------+
| 7.6.?Tuning the FreeBSD VM System?   | `Home <index.html>`__   | ?8.2.?Basic Tools and Locking Fundamentals   |
+--------------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
