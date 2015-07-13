============
3.?Emulation
============

.. raw:: html

   <div class="navheader">

3.?Emulation
`Prev <inside.html>`__?
?
?\ `Next <md.html>`__

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

3.?Emulation
------------

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

3.1.?How emulation works in FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As stated earlier, FreeBSD supports running binaries from several other
UNIX?es. This works because FreeBSD has an abstraction called the
execution class loader. This wedges into the
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
syscall, so when
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
is about to execute a binary it examines its type.

There are basically two types of binaries in FreeBSD. Shell-like text
scripts which are identified by ``#!`` as their first two characters and
normal (typically *ELF*) binaries, which are a representation of a
compiled executable object. The vast majority (one could say all of
them) of binaries in FreeBSD are from type ELF. ELF files contain a
header, which specifies the OS ABI for this ELF file. By reading this
information, the operating system can accurately determine what type of
binary the given file is.

Every OS ABI must be registered in the FreeBSD kernel. This applies to
the FreeBSD native OS ABI, as well. So when
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
executes a binary it iterates through the list of registered APIs and
when it finds the right one it starts to use the information contained
in the OS ABI description (its syscall table, ``errno`` translation
table, etc.). So every time the process calls a syscall, it uses its own
set of syscalls instead of some global one. This effectively provides a
very elegant and easy way of supporting execution of various binary
formats.

The nature of emulation of different OSes (and also some other
subsystems) led developers to invite a handler event mechanism. There
are various places in the kernel, where a list of event handlers are
called. Every subsystem can register an event handler and they are
called accordingly. For example, when a process exits there is a handler
called that possibly cleans up whatever the subsystem needs to be
cleaned.

Those simple facilities provide basically everything that is needed for
the emulation infrastructure and in fact these are basically the only
things necessary to implement the Linux? emulation layer.

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

3.2.?Common primitives in the FreeBSD kernel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Emulation layers need some support from the operating system. I am going
to describe some of the supported primitives in the FreeBSD operating
system.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.?Locking primitives
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Contributed by: Attilio Rao ``<attilio@FreeBSD.org>``

The FreeBSD synchronization primitive set is based on the idea to supply
a rather huge number of different primitives in a way that the better
one can be used for every particular, appropriate situation.

To a high level point of view you can consider three kinds of
synchronization primitives in the FreeBSD kernel:

.. raw:: html

   <div class="itemizedlist">

-  atomic operations and memory barriers

-  locks

-  scheduling barriers

.. raw:: html

   </div>

Below there are descriptions for the 3 families. For every lock, you
should really check the linked manpage (where possible) for more
detailed explanations.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.1.?Atomic operations and memory barriers
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Atomic operations are implemented through a set of functions performing
simple arithmetics on memory operands in an atomic way with respect to
external events (interrupts, preemption, etc.). Atomic operations can
guarantee atomicity just on small data types (in the magnitude order of
the ``.long.`` architecture C data type), so should be rarely used
directly in the end-level code, if not only for very simple operations
(like flag setting in a bitmap, for example). In fact, it is rather
simple and common to write down a wrong semantic based on just atomic
operations (usually referred as lock-less). The FreeBSD kernel offers a
way to perform atomic operations in conjunction with a memory barrier.
The memory barriers will guarantee that an atomic operation will happen
following some specified ordering with respect to other memory accesses.
For example, if we need that an atomic operation happen just after all
other pending writes (in terms of instructions reordering buffers
activities) are completed, we need to explicitly use a memory barrier in
conjunction to this atomic operation. So it is simple to understand why
memory barriers play a key role for higher-level locks building (just as
refcounts, mutexes, etc.). For a detailed explanatory on atomic
operations, please refer to
`atomic(9) <http://www.FreeBSD.org/cgi/man.cgi?query=atomic&sektion=9>`__.
It is far, however, noting that atomic operations (and memory barriers
as well) should ideally only be used for building front-ending locks (as
mutexes).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.2.?Refcounts
''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Refcounts are interfaces for handling reference counters. They are
implemented through atomic operations and are intended to be used just
for cases, where the reference counter is the only one thing to be
protected, so even something like a spin-mutex is deprecated. Using the
refcount interface for structures, where a mutex is already used is
often wrong since we should probably close the reference counter in some
already protected paths. A manpage discussing refcount does not exist
currently, just check ``sys/refcount.h`` for an overview of the existing
API.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.3.?Locks
''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD kernel has huge classes of locks. Every lock is defined by some
peculiar properties, but probably the most important is the event linked
to contesting holders (or in other terms, the behaviour of threads
unable to acquire the lock). FreeBSD's locking scheme presents three
different behaviours for contenders:

.. raw:: html

   <div class="orderedlist">

#. spinning

#. blocking

#. sleeping

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

numbers are not casual

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.4.?Spinning locks
'''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Spin locks let waiters to spin until they cannot acquire the lock. An
important matter do deal with is when a thread contests on a spin lock
if it is not descheduled. Since the FreeBSD kernel is preemptive, this
exposes spin lock at the risk of deadlocks that can be solved just
disabling interrupts while they are acquired. For this and other reasons
(like lack of priority propagation support, poorness in load balancing
schemes between CPUs, etc.), spin locks are intended to protect very
small paths of code, or ideally not to be used at all if not explicitly
requested (explained later).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.5.?Blocking
'''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Block locks let waiters to be descheduled and blocked until the lock
owner does not drop it and wakes up one or more contenders. In order to
avoid starvation issues, blocking locks do priority propagation from the
waiters to the owner. Block locks must be implemented through the
turnstile interface and are intended to be the most used kind of locks
in the kernel, if no particular conditions are met.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.6.?Sleeping
'''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sleep locks let waiters to be descheduled and fall asleep until the lock
holder does not drop it and wakes up one or more waiters. Since sleep
locks are intended to protect large paths of code and to cater
asynchronous events, they do not do any form of priority propagation.
They must be implemented through the
`sleepqueue(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sleepqueue&sektion=9>`__
interface.

The order used to acquire locks is very important, not only for the
possibility to deadlock due at lock order reversals, but even because
lock acquisition should follow specific rules linked to locks natures.
If you give a look at the table above, the practical rule is that if a
thread holds a lock of level n (where the level is the number listed
close to the kind of lock) it is not allowed to acquire a lock of
superior levels, since this would break the specified semantic for a
path. For example, if a thread holds a block lock (level 2), it is
allowed to acquire a spin lock (level 1) but not a sleep lock (level 3),
since block locks are intended to protect smaller paths than sleep lock
(these rules are not about atomic operations or scheduling barriers,
however).

This is a list of lock with their respective behaviours:

.. raw:: html

   <div class="itemizedlist">

-  spin mutex - spinning -
   `mutex(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mutex&sektion=9>`__

-  sleep mutex - blocking -
   `mutex(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mutex&sektion=9>`__

-  pool mutex - blocking -
   `mtx\_pool(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mtx_pool&sektion=9>`__

-  sleep family - sleeping -
   `sleep(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sleep&sektion=9>`__
   pause tsleep msleep msleep spin msleep rw msleep sx

-  condvar - sleeping -
   `condvar(9) <http://www.FreeBSD.org/cgi/man.cgi?query=condvar&sektion=9>`__

-  rwlock - blocking -
   `rwlock(9) <http://www.FreeBSD.org/cgi/man.cgi?query=rwlock&sektion=9>`__

-  sxlock - sleeping -
   `sx(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sx&sektion=9>`__

-  lockmgr - sleeping -
   `lockmgr(9) <http://www.FreeBSD.org/cgi/man.cgi?query=lockmgr&sektion=9>`__

-  semaphores - sleeping -
   `sema(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sema&sektion=9>`__

.. raw:: html

   </div>

Among these locks only mutexes, sxlocks, rwlocks and lockmgrs are
intended to handle recursion, but currently recursion is only supported
by mutexes and lockmgrs.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.7.?Scheduling barriers
''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Scheduling barriers are intended to be used in order to drive scheduling
of threading. They consist mainly of three different stubs:

.. raw:: html

   <div class="itemizedlist">

-  critical sections (and preemption)

-  sched\_bind

-  sched\_pin

.. raw:: html

   </div>

Generally, these should be used only in a particular context and even if
they can often replace locks, they should be avoided because they do not
let the diagnose of simple eventual problems with locking debugging
tools (as
`witness(4) <http://www.FreeBSD.org/cgi/man.cgi?query=witness&sektion=4>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.8.?Critical sections
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD kernel has been made preemptive basically to deal with
interrupt threads. In fact, in order to avoid high interrupt latency,
time-sharing priority threads can be preempted by interrupt threads (in
this way, they do not need to wait to be scheduled as the normal path
previews). Preemption, however, introduces new racing points that need
to be handled, as well. Often, in order to deal with preemption, the
simplest thing to do is to completely disable it. A critical section
defines a piece of code (borderlined by the pair of functions
`critical\_enter(9) <http://www.FreeBSD.org/cgi/man.cgi?query=critical_enter&sektion=9>`__
and
`critical\_exit(9) <http://www.FreeBSD.org/cgi/man.cgi?query=critical_exit&sektion=9>`__,
where preemption is guaranteed to not happen (until the protected code
is fully executed). This can often replace a lock effectively but should
be used carefully in order to not lose the whole advantage that
preemption brings.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.9.?sched\_pin/sched\_unpin
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Another way to deal with preemption is the ``sched_pin()`` interface. If
a piece of code is closed in the ``sched_pin()`` and ``sched_unpin()``
pair of functions it is guaranteed that the respective thread, even if
it can be preempted, it will always be executed on the same CPU. Pinning
is very effective in the particular case when we have to access at
per-cpu datas and we assume other threads will not change those data.
The latter condition will determine a critical section as a too strong
condition for our code.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.10.?sched\_bind/sched\_unbind
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``sched_bind`` is an API used in order to bind a thread to a particular
CPU for all the time it executes the code, until a ``sched_unbind``
function call does not unbind it. This feature has a key role in
situations where you cannot trust the current state of CPUs (for
example, at very early stages of boot), as you want to avoid your thread
to migrate on inactive CPUs. Since ``sched_bind`` and ``sched_unbind``
manipulate internal scheduler structures, they need to be enclosed in
``sched_lock`` acquisition/releasing when used.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.2.?Proc structure
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Various emulation layers sometimes require some additional per-process
data. It can manage separate structures (a list, a tree etc.) containing
these data for every process but this tends to be slow and memory
consuming. To solve this problem the FreeBSD ``proc`` structure contains
``p_emuldata``, which is a void pointer to some emulation layer specific
data. This ``proc`` entry is protected by the proc mutex.

The FreeBSD ``proc`` structure contains a ``p_sysent`` entry that
identifies, which ABI this process is running. In fact, it is a pointer
to the ``sysentvec`` described above. So by comparing this pointer to
the address where the ``sysentvec`` structure for the given ABI is
stored we can effectively determine whether the process belongs to our
emulation layer. The code typically looks like:

.. code:: programlisting

    if (__predict_true(p->p_sysent != &elf_Linux?_sysvec))
          return;

As you can see, we effectively use the ``__predict_true`` modifier to
collapse the most common case (FreeBSD process) to a simple return
operation thus preserving high performance. This code should be turned
into a macro because currently it is not very flexible, i.e. we do not
support Linux?64 emulation nor A.OUT Linux? processes on i386.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.3.?VFS
^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD VFS subsystem is very complex but the Linux? emulation layer
uses just a small subset via a well defined API. It can either operate
on vnodes or file handlers. Vnode represents a virtual vnode, i.e.
representation of a node in VFS. Another representation is a file
handler, which represents an opened file from the perspective of a
process. A file handler can represent a socket or an ordinary file. A
file handler contains a pointer to its vnode. More then one file handler
can point to the same vnode.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.3.1.?namei
''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
routine is a central entry point to pathname lookup and translation. It
traverses the path point by point from the starting point to the end
point using lookup function, which is internal to VFS. The
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
syscall can cope with symlinks, absolute and relative paths. When a path
is looked up using
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
it is inputed to the name cache. This behaviour can be suppressed. This
routine is used all over the kernel and its performance is very
critical.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.3.2.?vn\_fullpath
'''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`vn\_fullpath(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vn_fullpath&sektion=9>`__
function takes the best effort to traverse VFS name cache and returns a
path for a given (locked) vnode. This process is unreliable but works
just fine for the most common cases. The unreliability is because it
relies on VFS cache (it does not traverse the on medium structures), it
does not work with hardlinks, etc. This routine is used in several
places in the Linuxulator.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.3.3.?Vnode operations
'''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``fgetvp`` - given a thread and a file descriptor number it returns
   the associated vnode

-  `vn\_lock(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vn_lock&sektion=9>`__
   - locks a vnode

-  ``vn_unlock`` - unlocks a vnode

-  `VOP\_READDIR(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VOP_READDIR&sektion=9>`__
   - reads a directory referenced by a vnode

-  `VOP\_GETATTR(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VOP_GETATTR&sektion=9>`__
   - gets attributes of a file or a directory referenced by a vnode

-  `VOP\_LOOKUP(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VOP_LOOKUP&sektion=9>`__
   - looks up a path to a given directory

-  `VOP\_OPEN(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VOP_OPEN&sektion=9>`__
   - opens a file referenced by a vnode

-  `VOP\_CLOSE(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VOP_CLOSE&sektion=9>`__
   - closes a file referenced by a vnode

-  `vput(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vput&sektion=9>`__
   - decrements the use count for a vnode and unlocks it

-  `vrele(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vrele&sektion=9>`__
   - decrements the use count for a vnode

-  `vref(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vref&sektion=9>`__
   - increments the use count for a vnode

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.3.4.?File handler operations
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``fget`` - given a thread and a file descriptor number it returns
   associated file handler and references it

-  ``fdrop`` - drops a reference to a file handler

-  ``fhold`` - references a file handler

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+---------------------------------------+
| `Prev <inside.html>`__?   | ?                       | ?\ `Next <md.html>`__                 |
+---------------------------+-------------------------+---------------------------------------+
| 2.?A look inside…?        | `Home <index.html>`__   | ?4.?Linux? emulation layer -MD part   |
+---------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
