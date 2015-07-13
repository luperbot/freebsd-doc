================================
8.4.?Specific Locking Strategies
================================

.. raw:: html

   <div class="navheader">

8.4.?Specific Locking Strategies
`Prev <smp-design.html>`__?
Chapter?8.?SMPng Design Document
?\ `Next <smp-implementation-notes.html>`__

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

8.4.?Specific Locking Strategies
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

8.4.1.?Credentials
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``struct ucred`` is the kernel's internal credential structure, and is
generally used as the basis for process-driven access control within the
kernel. BSD-derived systems use a “copy-on-write” model for credential
data: multiple references may exist for a credential structure, and when
a change needs to be made, the structure is duplicated, modified, and
then the reference replaced. Due to wide-spread caching of the
credential to implement access control on open, this results in
substantial memory savings. With a move to fine-grained SMP, this model
also saves substantially on locking operations by requiring that
modification only occur on an unshared credential, avoiding the need for
explicit synchronization when consuming a known-shared credential.

Credential structures with a single reference are considered mutable;
shared credential structures must not be modified or a race condition is
risked. A mutex, ``cr_mtxp`` protects the reference count of
``struct ucred`` so as to maintain consistency. Any use of the structure
requires a valid reference for the duration of the use, or the structure
may be released out from under the illegitimate consumer.

The ``struct ucred`` mutex is a leaf mutex and is implemented via a
mutex pool for performance reasons.

Usually, credentials are used in a read-only manner for access control
decisions, and in this case ``td_ucred`` is generally preferred because
it requires no locking. When a process' credential is updated the
``proc`` lock must be held across the check and update operations thus
avoid races. The process credential ``p_ucred`` must be used for check
and update operations to prevent time-of-check, time-of-use races.

If system call invocations will perform access control after an update
to the process credential, the value of ``td_ucred`` must also be
refreshed to the current process value. This will prevent use of a stale
credential following a change. The kernel automatically refreshes the
``td_ucred`` pointer in the thread structure from the process
``p_ucred`` whenever a process enters the kernel, permitting use of a
fresh credential for kernel access control.

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

8.4.2.?File Descriptors and File Descriptor Tables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Details to follow.

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

8.4.3.?Jail Structures
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``struct prison`` stores administrative details pertinent to the
maintenance of jails created using the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__
API. This includes the per-jail hostname, IP address, and related
settings. This structure is reference-counted since pointers to
instances of the structure are shared by many credential structures. A
single mutex, ``pr_mtx`` protects read and write access to the reference
count and all mutable variables inside the struct jail. Some variables
are set only when the jail is created, and a valid reference to the
``struct prison`` is sufficient to read these values. The precise
locking of each entry is documented via comments in ``sys/jail.h``.

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

8.4.4.?MAC Framework
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TrustedBSD MAC Framework maintains data in a variety of kernel
objects, in the form of ``struct     label``. In general, labels in
kernel objects are protected by the same lock as the remainder of the
kernel object. For example, the ``v_label`` label in ``struct vnode`` is
protected by the vnode lock on the vnode.

In addition to labels maintained in standard kernel objects, the MAC
Framework also maintains a list of registered and active policies. The
policy list is protected by a global mutex (``mac_policy_list_lock``)
and a busy count (also protected by the mutex). Since many access
control checks may occur in parallel, entry to the framework for a
read-only access to the policy list requires holding the mutex while
incrementing (and later decrementing) the busy count. The mutex need not
be held for the duration of the MAC entry operation--some operations,
such as label operations on file system objects--are long-lived. To
modify the policy list, such as during policy registration and
de-registration, the mutex must be held and the reference count must be
zero, to prevent modification of the list while it is in use.

A condition variable, ``mac_policy_list_not_busy``, is available to
threads that need to wait for the list to become unbusy, but this
condition variable must only be waited on if the caller is holding no
other locks, or a lock order violation may be possible. The busy count,
in effect, acts as a form of shared/exclusive lock over access to the
framework: the difference is that, unlike with an sx lock, consumers
waiting for the list to become unbusy may be starved, rather than
permitting lock order problems with regards to the busy count and other
locks that may be held on entry to (or inside) the MAC Framework.

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

8.4.5.?Modules
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For the module subsystem there exists a single lock that is used to
protect the shared data. This lock is a shared/exclusive (SX) lock and
has a good chance of needing to be acquired (shared or exclusively),
therefore there are a few macros that have been added to make access to
the lock more easy. These macros can be located in ``sys/module.h`` and
are quite basic in terms of usage. The main structures protected under
this lock are the ``module_t`` structures (when shared) and the global
``modulelist_t`` structure, modules. One should review the related
source code in ``kern/kern_module.c`` to further understand the locking
strategy.

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

8.4.6.?Newbus Device Tree
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The newbus system will have one sx lock. Readers will hold a shared
(read) lock
(`sx\_slock(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sx_slock&sektion=9>`__)
and writers will hold an exclusive (write) lock
(`sx\_xlock(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sx_xlock&sektion=9>`__).
Internal functions will not do locking at all. Externally visible ones
will lock as needed. Those items that do not matter if the race is won
or lost will not be locked, since they tend to be read all over the
place (e.g.,
`device\_get\_softc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=device_get_softc&sektion=9>`__).
There will be relatively few changes to the newbus data structures, so a
single lock should be sufficient and not impose a performance penalty.

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

8.4.7.?Pipes
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

...

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

8.4.8.?Processes and Threads
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

- process hierarchy

- proc locks, references

- thread-specific copies of proc entries to freeze during system calls,
including td\_ucred

- inter-process operations

- process groups and sessions

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

8.4.9.?Scheduler
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lots of references to ``sched_lock`` and notes pointing at specific
primitives and related magic elsewhere in the document.

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

8.4.10.?Select and Poll
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``select`` and ``poll`` functions permit threads to block waiting on
events on file descriptors--most frequently, whether or not the file
descriptors are readable or writable.

...

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

8.4.11.?SIGIO
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The SIGIO service permits processes to request the delivery of a SIGIO
signal to its process group when the read/write status of specified file
descriptors changes. At most one process or process group is permitted
to register for SIGIO from any given kernel object, and that process or
group is referred to as the owner. Each object supporting SIGIO
registration contains pointer field that is ``NULL`` if the object is
not registered, or points to a ``struct sigio`` describing the
registration. This field is protected by a global mutex, ``sigio_lock``.
Callers to SIGIO maintenance functions must pass in this field “by
reference” so that local register copies of the field are not made when
unprotected by the lock.

One ``struct sigio`` is allocated for each registered object associated
with any process or process group, and contains back-pointers to the
object, owner, signal information, a credential, and the general
disposition of the registration. Each process or progress group contains
a list of registered ``struct sigio`` structures, ``p_sigiolst`` for
processes, and ``pg_sigiolst`` for process groups. These lists are
protected by the process or process group locks respectively. Most
fields in each ``struct     sigio`` are constant for the duration of the
registration, with the exception of the ``sio_pgsigio`` field which
links the ``struct sigio`` into the process or process group list.
Developers implementing new kernel objects supporting SIGIO will, in
general, want to avoid holding structure locks while invoking SIGIO
supporting functions, such as ``fsetown`` or ``funsetown`` to avoid
defining a lock order between structure locks and the global SIGIO lock.
This is generally possible through use of an elevated reference count on
the structure, such as reliance on a file descriptor reference to a pipe
during a pipe operation.

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

8.4.12.?Sysctl
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``sysctl`` MIB service is invoked from both within the kernel and
from userland applications using a system call. At least two issues are
raised in locking: first, the protection of the structures maintaining
the namespace, and second, interactions with kernel variables and
functions that are accessed by the sysctl interface. Since sysctl
permits the direct export (and modification) of kernel statistics and
configuration parameters, the sysctl mechanism must become aware of
appropriate locking semantics for those variables. Currently, sysctl
makes use of a single global sx lock to serialize use of ``sysctl``;
however, it is assumed to operate under Giant and other protections are
not provided. The remainder of this section speculates on locking and
semantic changes to sysctl.

- Need to change the order of operations for sysctl's that update values
from read old, copyin and copyout, write new to copyin, lock, read old
and write new, unlock, copyout. Normal sysctl's that just copyout the
old value and set a new value that they copyin may still be able to
follow the old model. However, it may be cleaner to use the second model
for all of the sysctl handlers to avoid lock operations.

- To allow for the common case, a sysctl could embed a pointer to a
mutex in the SYSCTL\_FOO macros and in the struct. This would work for
most sysctl's. For values protected by sx locks, spin mutexes, or other
locking strategies besides a single sleep mutex, SYSCTL\_PROC nodes
could be used to get the locking right.

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

8.4.13.?Taskqueue
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The taskqueue's interface has two basic locks associated with it in
order to protect the related shared data. The ``taskqueue_queues_mutex``
is meant to serve as a lock to protect the ``taskqueue_queues`` TAILQ.
The other mutex lock associated with this system is the one in the
``struct taskqueue`` data structure. The use of the synchronization
primitive here is to protect the integrity of the data in the
``struct     taskqueue``. It should be noted that there are no separate
macros to assist the user in locking down his/her own work since these
locks are most likely not going to be used outside of
``kern/subr_taskqueue.c``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <smp-design.html>`__?             | `Up <smp.html>`__       | ?\ `Next <smp-implementation-notes.html>`__   |
+-----------------------------------------+-------------------------+-----------------------------------------------+
| 8.3.?General Architecture and Design?   | `Home <index.html>`__   | ?8.5.?Implementation Notes                    |
+-----------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
