=========================================
8.2.?Basic Tools and Locking Fundamentals
=========================================

.. raw:: html

   <div class="navheader">

8.2.?Basic Tools and Locking Fundamentals
`Prev <smp.html>`__?
Chapter?8.?SMPng Design Document
?\ `Next <smp-design.html>`__

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

8.2.?Basic Tools and Locking Fundamentals
-----------------------------------------

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

8.2.1.?Atomic Instructions and Memory Barriers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are several existing treatments of memory barriers and atomic
instructions, so this section will not include a lot of detail. To put
it simply, one can not go around reading variables without a lock if a
lock is used to protect writes to that variable. This becomes obvious
when you consider that memory barriers simply determine relative order
of memory operations; they do not make any guarantee about timing of
memory operations. That is, a memory barrier does not force the contents
of a CPU's local cache or store buffer to flush. Instead, the memory
barrier at lock release simply ensures that all writes to the protected
data will be visible to other CPU's or devices if the write to release
the lock is visible. The CPU is free to keep that data in its cache or
store buffer as long as it wants. However, if another CPU performs an
atomic instruction on the same datum, the first CPU must guarantee that
the updated value is made visible to the second CPU along with any other
operations that memory barriers may require.

For example, assuming a simple model where data is considered visible
when it is in main memory (or a global cache), when an atomic
instruction is triggered on one CPU, other CPU's store buffers and
caches must flush any writes to that same cache line along with any
pending operations behind a memory barrier.

This requires one to take special care when using an item protected by
atomic instructions. For example, in the sleep mutex implementation, we
have to use an ``atomic_cmpset`` rather than an ``atomic_set`` to turn
on the ``MTX_CONTESTED`` bit. The reason is that we read the value of
``mtx_lock`` into a variable and then make a decision based on that
read. However, the value we read may be stale, or it may change while we
are making our decision. Thus, when the ``atomic_set`` executed, it may
end up setting the bit on another value than the one we made the
decision on. Thus, we have to use an ``atomic_cmpset`` to set the value
only if the value we made the decision on is up-to-date and valid.

Finally, atomic instructions only allow one item to be updated or read.
If one needs to atomically update several items, then a lock must be
used instead. For example, if two counters must be read and have values
that are consistent relative to each other, then those counters must be
protected by a lock rather than by separate atomic instructions.

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

8.2.2.?Read Locks Versus Write Locks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Read locks do not need to be as strong as write locks. Both types of
locks need to ensure that the data they are accessing is not stale.
However, only write access requires exclusive access. Multiple threads
can safely read a value. Using different types of locks for reads and
writes can be implemented in a number of ways.

First, sx locks can be used in this manner by using an exclusive lock
when writing and a shared lock when reading. This method is quite
straightforward.

A second method is a bit more obscure. You can protect a datum with
multiple locks. Then for reading that data you simply need to have a
read lock of one of the locks. However, to write to the data, you need
to have a write lock of all of the locks. This can make writing rather
expensive but can be useful when data is accessed in various ways. For
example, the parent process pointer is protected by both the
``proctree_lock`` sx lock and the per-process mutex. Sometimes the proc
lock is easier as we are just checking to see who a parent of a process
is that we already have locked. However, other places such as
``inferior`` need to walk the tree of processes via parent pointers and
locking each process would be prohibitive as well as a pain to guarantee
that the condition you are checking remains valid for both the check and
the actions taken as a result of the check.

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

8.2.3.?Locking Conditions and Results
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you need a lock to check the state of a variable so that you can take
an action based on the state you read, you can not just hold the lock
while reading the variable and then drop the lock before you act on the
value you read. Once you drop the lock, the variable can change
rendering your decision invalid. Thus, you must hold the lock both while
reading the variable and while performing the action as a result of the
test.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-----------------------------------------+
| `Prev <smp.html>`__?                | `Up <smp.html>`__       | ?\ `Next <smp-design.html>`__           |
+-------------------------------------+-------------------------+-----------------------------------------+
| Chapter?8.?SMPng Design Document?   | `Home <index.html>`__   | ?8.3.?General Architecture and Design   |
+-------------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
