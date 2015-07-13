==================================
5.?Linux? emulation layer -MI part
==================================

.. raw:: html

   <div class="navheader">

5.?Linux? emulation layer -MI part
`Prev <md.html>`__?
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

5.?Linux? emulation layer -MI part
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section talks about machine independent part of the Linuxulator. It
covers the emulation infrastructure needed for Linux? 2.6 emulation, the
thread local storage (TLS) implementation (on i386) and futexes. Then we
talk briefly about some syscalls.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?Description of NPTL
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the major areas of progress in development of Linux? 2.6 was
threading. Prior to 2.6, the Linux? threading support was implemented in
the linuxthreads library. The library was a partial implementation of
POSIX? threading. The threading was implemented using separate processes
for each thread using the ``clone`` syscall to let them share the
address space (and other things). The main weaknesses of this approach
was that every thread had a different PID, signal handling was broken
(from the pthreads perspective), etc. Also the performance was not very
good (use of ``SIGUSR`` signals for threads synchronization, kernel
resource consumption, etc.) so to overcome these problems a new
threading system was developed and named NPTL.

The NPTL library focused on two things but a third thing came along so
it is usually considered a part of NPTL. Those two things were embedding
of threads into a process structure and futexes. The additional third
thing was TLS, which is not directly required by NPTL but the whole NPTL
userland library depends on it. Those improvements yielded in much
improved performance and standards conformance. NPTL is a standard
threading library in Linux? systems these days.

The FreeBSD Linuxulator implementation approaches the NPTL in three main
areas. The TLS, futexes and PID mangling, which is meant to simulate the
Linux? threads. Further sections describe each of these areas.

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

5.2.?Linux? 2.6 emulation infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These sections deal with the way Linux? threads are managed and how we
simulate that in FreeBSD.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.1.?Runtime determining of 2.6 emulation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Linux? emulation layer in FreeBSD supports runtime setting of the
emulated version. This is done via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
namely ``compat.linux.osrelease``, which is set to 2.4.2 by default (as
of April 2007) and with all Linux? versions up to 2.6 it just determined
what
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1>`__
outputs. It is different with 2.6 emulation where setting this
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
affects runtime behaviour of the emulation layer. When set to 2.6.x it
sets the value of ``linux_use_linux26`` while setting to something else
keeps it unset. This variable (plus per-prison variables of the very
same kind) determines whether 2.6 infrastructure (mainly PID mangling)
is used in the code or not. The version setting is done system-wide and
this affects all Linux? processes. The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
should not be changed when running any Linux? binary as it might harm
things.

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

5.2.2.?Linux? processes and thread identifiers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The semantics of Linux? threading are a little confusing and uses
entirely different nomenclature to FreeBSD. A process in Linux? consists
of a ``struct task`` embedding two identifier fields - PID and TGID. PID
is *not* a process ID but it is a thread ID. The TGID identifies a
thread group in other words a process. For single-threaded process the
PID equals the TGID.

The thread in NPTL is just an ordinary process that happens to have TGID
not equal to PID and have a group leader not equal to itself (and shared
VM etc. of course). Everything else happens in the same way as to an
ordinary process. There is no separation of a shared status to some
external structure like in FreeBSD. This creates some duplication of
information and possible data inconsistency. The Linux? kernel seems to
use task -> group information in some places and task information
elsewhere and it is really not very consistent and looks error-prone.

Every NPTL thread is created by a call to the ``clone`` syscall with a
specific set of flags (more in the next subsection). The NPTL implements
strict 1:1 threading.

In FreeBSD we emulate NPTL threads with ordinary FreeBSD processes that
share VM space, etc. and the PID gymnastic is just mimicked in the
emulation specific structure attached to the process. The structure
attached to the process looks like:

.. code:: programlisting

    struct linux_emuldata {
      pid_t pid;

      int *child_set_tid; /* in clone(): Child.s TID to set on clone */
      int *child_clear_tid;/* in clone(): Child.s TID to clear on exit */

      struct linux_emuldata_shared *shared;

      int pdeath_signal; /* parent death signal */

      LIST_ENTRY(linux_emuldata) threads; /* list of linux threads */
    };

The PID is used to identify the FreeBSD process that attaches this
structure. The ``child_se_tid`` and ``child_clear_tid`` are used for TID
address copyout when a process exits and is created. The ``shared``
pointer points to a structure shared among threads. The
``pdeath_signal`` variable identifies the parent death signal and the
``threads`` pointer is used to link this structure to the list of
threads. The ``linux_emuldata_shared`` structure looks like:

.. code:: programlisting

    struct linux_emuldata_shared {

      int refs;

      pid_t group_pid;

      LIST_HEAD(, linux_emuldata) threads; /* head of list of linux threads */
    };

The ``refs`` is a reference counter being used to determine when we can
free the structure to avoid memory leaks. The ``group_pid`` is to
identify PID ( = TGID) of the whole process ( = thread group). The
``threads`` pointer is the head of the list of threads in the process.

The ``linux_emuldata`` structure can be obtained from the process using
``em_find``. The prototype of the function is:

.. code:: programlisting

    struct linux_emuldata *em_find(struct proc *, int locked);

Here, ``proc`` is the process we want the emuldata structure from and
the locked parameter determines whether we want to lock or not. The
accepted values are ``EMUL_DOLOCK`` and ``EMUL_DOUNLOCK``. More about
locking later.

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

5.2.3.?PID mangling
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because of the described different view knowing what a process ID and
thread ID is between FreeBSD and Linux? we have to translate the view
somehow. We do it by PID mangling. This means that we fake what a PID
(=TGID) and TID (=PID) is between kernel and userland. The rule of thumb
is that in kernel (in Linuxulator) PID = PID and TGID = shared -> group
pid and to userland we present ``PID = shared -> group_pid`` and
``TID = proc -> p_pid``. The PID member of ``linux_emuldata structure``
is a FreeBSD PID.

The above affects mainly getpid, getppid, gettid syscalls. Where we use
PID/TGID respectively. In copyout of TIDs in ``child_clear_tid`` and
``child_set_tid`` we copy out FreeBSD PID.

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

5.2.4.?Clone syscall
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``clone`` syscall is the way threads are created in Linux?. The
syscall prototype looks like this:

.. code:: programlisting

    int linux_clone(l_int flags, void *stack, void *parent_tidptr, int dummy,
    void * child_tidptr);

The ``flags`` parameter tells the syscall how exactly the processes
should be cloned. As described above, Linux? can create processes
sharing various things independently, for example two processes can
share file descriptors but not VM, etc. Last byte of the ``flags``
parameter is the exit signal of the newly created process. The ``stack``
parameter if non-\ ``NULL`` tells, where the thread stack is and if it
is ``NULL`` we are supposed to copy-on-write the calling process stack
(i.e. do what normal
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2>`__
routine does). The ``parent_tidptr`` parameter is used as an address for
copying out process PID (i.e. thread id) once the process is
sufficiently instantiated but is not runnable yet. The ``dummy``
parameter is here because of the very strange calling convention of this
syscall on i386. It uses the registers directly and does not let the
compiler do it what results in the need of a dummy syscall. The
``child_tidptr`` parameter is used as an address for copying out PID
once the process has finished forking and when the process exits.

The syscall itself proceeds by setting corresponding flags depending on
the flags passed in. For example, ``CLONE_VM`` maps to RFMEM (sharing of
VM), etc. The only nit here is ``CLONE_FS`` and ``CLONE_FILES`` because
FreeBSD does not allow setting this separately so we fake it by not
setting RFFDG (copying of fd table and other fs information) if either
of these is defined. This does not cause any problems, because those
flags are always set together. After setting the flags the process is
forked using the internal ``fork1`` routine, the process is instrumented
not to be put on a run queue, i.e. not to be set runnable. After the
forking is done we possibly reparent the newly created process to
emulate ``CLONE_PARENT`` semantics. Next part is creating the emulation
data. Threads in Linux? does not signal their parents so we set exit
signal to be 0 to disable this. After that setting of ``child_set_tid``
and ``child_clear_tid`` is performed enabling the functionality later in
the code. At this point we copy out the PID to the address specified by
``parent_tidptr``. The setting of process stack is done by simply
rewriting thread frame ``%esp`` register (``%rsp`` on amd64). Next part
is setting up TLS for the newly created process. After this
`vfork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=vfork&sektion=2>`__
semantics might be emulated and finally the newly created process is put
on a run queue and copying out its PID to the parent process via
``clone`` return value is done.

The ``clone`` syscall is able and in fact is used for emulating classic
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2>`__
and
`vfork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=vfork&sektion=2>`__
syscalls. Newer glibc in a case of 2.6 kernel uses ``clone`` to
implement
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2>`__
and
`vfork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=vfork&sektion=2>`__
syscalls.

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

5.2.5.?Locking
^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The locking is implemented to be per-subsystem because we do not expect
a lot of contention on these. There are two locks: ``emul_lock`` used to
protect manipulating of ``linux_emuldata`` and ``emul_shared_lock`` used
to manipulate ``linux_emuldata_shared``. The ``emul_lock`` is a
nonsleepable blocking mutex while ``emul_shared_lock`` is a sleepable
blocking ``sx_lock``. Because of the per-subsystem locking we can
coalesce some locks and that is why the em find offers the non-locking
access.

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

5.3.?TLS
~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section deals with TLS also known as thread local storage.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.1.?Introduction to threading
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Threads in computer science are entities within a process that can be
scheduled independently from each other. The threads in the process
share process wide data (file descriptors, etc.) but also have their own
stack for their own data. Sometimes there is a need for process-wide
data specific to a given thread. Imagine a name of the thread in
execution or something like that. The traditional UNIX? threading API,
pthreads provides a way to do it via
`pthread\_key\_create(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread_key_create&sektion=3>`__,
`pthread\_setspecific(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread_setspecific&sektion=3>`__
and
`pthread\_getspecific(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread_getspecific&sektion=3>`__
where a thread can create a key to the thread local data and using
`pthread\_getspecific(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread_getspecific&sektion=3>`__
or
`pthread\_getspecific(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread_getspecific&sektion=3>`__
to manipulate those data. You can easily see that this is not the most
comfortable way this could be accomplished. So various producers of
C/C++ compilers introduced a better way. They defined a new modifier
keyword thread that specifies that a variable is thread specific. A new
method of accessing such variables was developed as well (at least on
i386). The pthreads method tends to be implemented in userspace as a
trivial lookup table. The performance of such a solution is not very
good. So the new method uses (on i386) segment registers to address a
segment, where TLS area is stored so the actual accessing of a thread
variable is just appending the segment register to the address thus
addressing via it. The segment registers are usually ``%gs`` and ``%fs``
acting like segment selectors. Every thread has its own area where the
thread local data are stored and the segment must be loaded on every
context switch. This method is very fast and used almost exclusively in
the whole i386 UNIX? world. Both FreeBSD and Linux? implement this
approach and it yields very good results. The only drawback is the need
to reload the segment on every context switch which can slowdown context
switches. FreeBSD tries to avoid this overhead by using only 1 segment
descriptor for this while Linux? uses 3. Interesting thing is that
almost nothing uses more than 1 descriptor (only Wine seems to use 2) so
Linux? pays this unnecessary price for context switches.

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

5.3.2.?Segments on i386
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The i386 architecture implements the so called segments. A segment is a
description of an area of memory. The base address (bottom) of the
memory area, the end of it (ceiling), type, protection, etc. The memory
described by a segment can be accessed using segment selector registers
(``%cs``, ``%ds``, ``%ss``, ``%es``, ``%fs``, ``%gs``). For example let
us suppose we have a segment which base address is 0x1234 and length and
this code:

.. code:: programlisting

    mov %edx,%gs:0x10

This will load the content of the ``%edx`` register into memory location
0x1244. Some segment registers have a special use, for example ``%cs``
is used for code segment and ``%ss`` is used for stack segment but
``%fs`` and ``%gs`` are generally unused. Segments are either stored in
a global GDT table or in a local LDT table. LDT is accessed via an entry
in the GDT. The LDT can store more types of segments. LDT can be per
process. Both tables define up to 8191 entries.

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

5.3.3.?Implementation on Linux? i386
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two main ways of setting up TLS in Linux?. It can be set when
cloning a process using the ``clone`` syscall or it can call
``set_thread_area``. When a process passes ``CLONE_SETTLS`` flag to
``clone``, the kernel expects the memory pointed to by the ``%esi``
register a Linux? user space representation of a segment, which gets
translated to the machine representation of a segment and loaded into a
GDT slot. The GDT slot can be specified with a number or -1 can be used
meaning that the system itself should choose the first free slot. In
practice, the vast majority of programs use only one TLS entry and does
not care about the number of the entry. We exploit this in the emulation
and in fact depend on it.

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

5.3.4.?Emulation of Linux? TLS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

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

5.3.4.1.?i386
'''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Loading of TLS for the current thread happens by calling
``set_thread_area`` while loading TLS for a second process in ``clone``
is done in the separate block in ``clone``. Those two functions are very
similar. The only difference being the actual loading of the GDT
segment, which happens on the next context switch for the newly created
process while ``set_thread_area`` must load this directly. The code
basically does this. It copies the Linux? form segment descriptor from
the userland. The code checks for the number of the descriptor but
because this differs between FreeBSD and Linux? we fake it a little. We
only support indexes of 6, 3 and -1. The 6 is genuine Linux? number, 3
is genuine FreeBSD one and -1 means autoselection. Then we set the
descriptor number to constant 3 and copy out this to the userspace. We
rely on the userspace process using the number from the descriptor but
this works most of the time (have never seen a case where this did not
work) as the userspace process typically passes in 1. Then we convert
the descriptor from the Linux? form to a machine dependant form (i.e.
operating system independent form) and copy this to the FreeBSD defined
segment descriptor. Finally we can load it. We assign the descriptor to
threads PCB (process control block) and load the ``%gs`` segment using
``load_gs``. This loading must be done in a critical section so that
nothing can interrupt us. The ``CLONE_SETTLS`` case works exactly like
this just the loading using ``load_gs`` is not performed. The segment
used for this (segment number 3) is shared for this use between FreeBSD
processes and Linux? processes so the Linux? emulation layer does not
add any overhead over plain FreeBSD.

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

5.3.4.2.?amd64
''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The amd64 implementation is similar to the i386 one but there was
initially no 32bit segment descriptor used for this purpose (hence not
even native 32bit TLS users worked) so we had to add such a segment and
implement its loading on every context switch (when a flag signaling use
of 32bit is set). Apart from this the TLS loading is exactly the same
just the segment numbers are different and the descriptor format and the
loading differs slightly.

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

5.4.?Futexes
~~~~~~~~~~~~

.. raw:: html

   </div>

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

5.4.1.?Introduction to synchronization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Threads need some kind of synchronization and POSIX? provides some of
them: mutexes for mutual exclusion, read-write locks for mutual
exclusion with biased ratio of reads and writes and condition variables
for signaling a status change. It is interesting to note that POSIX?
threading API lacks support for semaphores. Those synchronization
routines implementations are heavily dependant on the type threading
support we have. In pure 1:M (userspace) model the implementation can be
solely done in userspace and thus be very fast (the condition variables
will probably end up being implemented using signals, i.e. not fast) and
simple. In 1:1 model, the situation is also quite clear - the threads
must be synchronized using kernel facilities (which is very slow because
a syscall must be performed). The mixed M:N scenario just combines the
first and second approach or rely solely on kernel. Threads
synchronization is a vital part of thread-enabled programming and its
performance can affect resulting program a lot. Recent benchmarks on
FreeBSD operating system showed that an improved sx\_lock implementation
yielded 40% speedup in *ZFS* (a heavy sx user), this is in-kernel stuff
but it shows clearly how important the performance of synchronization
primitives is.

Threaded programs should be written with as little contention on locks
as possible. Otherwise, instead of doing useful work the thread just
waits on a lock. Because of this, the most well written threaded
programs show little locks contention.

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

5.4.2.?Futexes introduction
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux? implements 1:1 threading, i.e. it has to use in-kernel
synchronization primitives. As stated earlier, well written threaded
programs have little lock contention. So a typical sequence could be
performed as two atomic increase/decrease mutex reference counter, which
is very fast, as presented by the following example:

.. code:: programlisting

    pthread_mutex_lock(&mutex);
    ....
    pthread_mutex_unlock(&mutex);

1:1 threading forces us to perform two syscalls for those mutex calls,
which is very slow.

The solution Linux??2.6 implements is called futexes. Futexes implement
the check for contention in userspace and call kernel primitives only in
a case of contention. Thus the typical case takes place without any
kernel intervention. This yields reasonably fast and flexible
synchronization primitives implementation.

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

5.4.3.?Futex API
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The futex syscall looks like this:

.. code:: programlisting

    int futex(void *uaddr, int op, int val, struct timespec *timeout, void *uaddr2, int val3);

In this example ``uaddr`` is an address of the mutex in userspace,
``op`` is an operation we are about to perform and the other parameters
have per-operation meaning.

Futexes implement the following operations:

.. raw:: html

   <div class="itemizedlist">

-  ``FUTEX_WAIT``

-  ``FUTEX_WAKE``

-  ``FUTEX_FD``

-  ``FUTEX_REQUEUE``

-  ``FUTEX_CMP_REQUEUE``

-  ``FUTEX_WAKE_OP``

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

5.4.3.1.?FUTEX\_WAIT
''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This operation verifies that on address ``uaddr`` the value ``val`` is
written. If not, ``EWOULDBLOCK`` is returned, otherwise the thread is
queued on the futex and gets suspended. If the argument ``timeout`` is
non-zero it specifies the maximum time for the sleeping, otherwise the
sleeping is infinite.

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

5.4.3.2.?FUTEX\_WAKE
''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This operation takes a futex at ``uaddr`` and wakes up ``val`` first
futexes queued on this futex.

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

5.4.3.3.?FUTEX\_FD
''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This operations associates a file descriptor with a given futex.

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

5.4.3.4.?FUTEX\_REQUEUE
'''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This operation takes ``val`` threads queued on futex at ``uaddr``, wakes
them up, and takes ``val2`` next threads and requeues them on futex at
``uaddr2``.

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

5.4.3.5.?FUTEX\_CMP\_REQUEUE
''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This operation does the same as ``FUTEX_REQUEUE`` but it checks that
``val3`` equals to ``val`` first.

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

5.4.3.6.?FUTEX\_WAKE\_OP
''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This operation performs an atomic operation on ``val3`` (which contains
coded some other value) and ``uaddr``. Then it wakes up ``val`` threads
on futex at ``uaddr`` and if the atomic operation returned a positive
number it wakes up ``val2`` threads on futex at ``uaddr2``.

The operations implemented in ``FUTEX_WAKE_OP``:

.. raw:: html

   <div class="itemizedlist">

-  ``FUTEX_OP_SET``

-  ``FUTEX_OP_ADD``

-  ``FUTEX_OP_OR``

-  ``FUTEX_OP_AND``

-  ``FUTEX_OP_XOR``

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

There is no ``val2`` parameter in the futex prototype. The ``val2`` is
taken from the ``struct timespec *timeout`` parameter for operations
``FUTEX_REQUEUE``, ``FUTEX_CMP_REQUEUE`` and ``FUTEX_WAKE_OP``.

.. raw:: html

   </div>

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

5.4.4.?Futex emulation in FreeBSD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The futex emulation in FreeBSD is taken from NetBSD and further extended
by us. It is placed in ``linux_futex.c`` and ``linux_futex.h`` files.
The ``futex`` structure looks like:

.. code:: programlisting

    struct futex {
      void *f_uaddr;
      int f_refcount;

      LIST_ENTRY(futex) f_list;

      TAILQ_HEAD(lf_waiting_paroc, waiting_proc) f_waiting_proc;
    };

And the structure ``waiting_proc`` is:

.. code:: programlisting

    struct waiting_proc {

      struct thread *wp_t;

      struct futex *wp_new_futex;

      TAILQ_ENTRY(waiting_proc) wp_list;
    };

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.1.?futex\_get / futex\_put
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A futex is obtained using the ``futex_get`` function, which searches a
linear list of futexes and returns the found one or creates a new futex.
When releasing a futex from the use we call the ``futex_put`` function,
which decreases a reference counter of the futex and if the refcount
reaches zero it is released.

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

5.4.4.2.?futex\_sleep
'''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a futex queues a thread for sleeping it creates a ``working_proc``
structure and puts this structure to the list inside the futex structure
then it just performs a
`tsleep(9) <http://www.FreeBSD.org/cgi/man.cgi?query=tsleep&sektion=9>`__
to suspend the thread. The sleep can be timed out. After
`tsleep(9) <http://www.FreeBSD.org/cgi/man.cgi?query=tsleep&sektion=9>`__
returns (the thread was woken up or it timed out) the ``working_proc``
structure is removed from the list and is destroyed. All this is done in
the ``futex_sleep`` function. If we got woken up from ``futex_wake`` we
have ``wp_new_futex`` set so we sleep on it. This way the actual
requeueing is done in this function.

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

5.4.4.3.?futex\_wake
''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Waking up a thread sleeping on a futex is performed in the
``futex_wake`` function. First in this function we mimic the strange
Linux? behaviour, where it wakes up N threads for all operations, the
only exception is that the REQUEUE operations are performed on N+1
threads. But this usually does not make any difference as we are waking
up all threads. Next in the function in the loop we wake up n threads,
after this we check if there is a new futex for requeueing. If so, we
requeue up to n2 threads on the new futex. This cooperates with
``futex_sleep``.

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

5.4.4.4.?futex\_wake\_op
''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``FUTEX_WAKE_OP`` operation is quite complicated. First we obtain
two futexes at addresses ``uaddr`` and ``uaddr2`` then we perform the
atomic operation using ``val3`` and ``uaddr2``. Then ``val`` waiters on
the first futex is woken up and if the atomic operation condition holds
we wake up ``val2`` (i.e. ``timeout``) waiter on the second futex.

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

5.4.4.5.?futex atomic operation
'''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The atomic operation takes two parameters ``encoded_op`` and ``uaddr``.
The encoded operation encodes the operation itself, comparing value,
operation argument, and comparing argument. The pseudocode for the
operation is like this one:

.. code:: programlisting

    oldval = *uaddr2
    *uaddr2 = oldval OP oparg

And this is done atomically. First a copying in of the number at
``uaddr`` is performed and the operation is done. The code handles page
faults and if no page fault occurs ``oldval`` is compared to ``cmparg``
argument with cmp comparator.

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

5.4.4.6.?Futex locking
''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Futex implementation uses two lock lists protecting ``sx_lock`` and
global locks (either Giant or another ``sx_lock``). Every operation is
performed locked from the start to the very end.

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

5.5.?Various syscalls implementation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In this section I am going to describe some smaller syscalls that are
worth mentioning because their implementation is not obvious or those
syscalls are interesting from other point of view.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.1.?\*at family of syscalls
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

During development of Linux? 2.6.16 kernel, the \*at syscalls were
added. Those syscalls (``openat`` for example) work exactly like their
at-less counterparts with the slight exception of the ``dirfd``
parameter. This parameter changes where the given file, on which the
syscall is to be performed, is. When the ``filename`` parameter is
absolute ``dirfd`` is ignored but when the path to the file is relative,
it comes to the play. The ``dirfd`` parameter is a directory relative to
which the relative pathname is checked. The ``dirfd`` parameter is a
file descriptor of some directory or ``AT_FDCWD``. So for example the
``openat`` syscall can be like this:

.. code:: programlisting

    file descriptor 123 = /tmp/foo/, current working directory = /tmp/

    openat(123, /tmp/bah\, flags, mode) /* opens /tmp/bah */
    openat(123, bah\, flags, mode)      /* opens /tmp/foo/bah */
    openat(AT_FDWCWD, bah\, flags, mode)    /* opens /tmp/bah */
    openat(stdio, bah\, flags, mode)    /* returns error because stdio is not a directory */

This infrastructure is necessary to avoid races when opening files
outside the working directory. Imagine that a process consists of two
threads, thread?A and thread?B. Thread?A issues
``open(./tmp/foo/bah., flags, mode)`` and before returning it gets
preempted and thread?B runs. Thread?B does not care about the needs of
thread?A and renames or removes ``/tmp/foo/``. We got a race. To avoid
this we can open ``/tmp/foo`` and use it as ``dirfd`` for ``openat``
syscall. This also enables user to implement per-thread working
directories.

Linux? family of \*at syscalls contains: ``linux_openat``,
``linux_mkdirat``, ``linux_mknodat``, ``linux_fchownat``,
``linux_futimesat``, ``linux_fstatat64``, ``linux_unlinkat``,
``linux_renameat``, ``linux_linkat``, ``linux_symlinkat``,
``linux_readlinkat``, ``linux_fchmodat`` and ``linux_faccessat``. All
these are implemented using the modified
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
routine and simple wrapping layer.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.1.1.?Implementation
'''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The implementation is done by altering the
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
routine (described above) to take additional parameter ``dirfd`` in its
``nameidata`` structure, which specifies the starting point of the
pathname lookup instead of using the current working directory every
time. The resolution of ``dirfd`` from file descriptor number to a vnode
is done in native \*at syscalls. When ``dirfd`` is ``AT_FDCWD`` the
``dvp`` entry in ``nameidata`` structure is ``NULL`` but when ``dirfd``
is a different number we obtain a file for this file descriptor, check
whether this file is valid and if there is vnode attached to it then we
get a vnode. Then we check this vnode for being a directory. In the
actual
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
routine we simply substitute the ``dvp`` vnode for ``dp`` variable in
the
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
function, which determines the starting point. The
`namei(9) <http://www.FreeBSD.org/cgi/man.cgi?query=namei&sektion=9>`__
is not used directly but via a trace of different functions on various
levels. For example the ``openat`` goes like this:

.. code:: programlisting

    openat() --> kern_openat() --> vn_open() -> namei()

For this reason ``kern_open`` and ``vn_open`` must be altered to
incorporate the additional ``dirfd`` parameter. No compat layer is
created for those because there are not many users of this and the users
can be easily converted. This general implementation enables FreeBSD to
implement their own \*at syscalls. This is being discussed right now.

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

5.5.2.?Ioctl
^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ioctl interface is quite fragile due to its generality. We have to
bear in mind that devices differ between Linux? and FreeBSD so some care
must be applied to do ioctl emulation work right. The ioctl handling is
implemented in ``linux_ioctl.c``, where ``linux_ioctl`` function is
defined. This function simply iterates over sets of ioctl handlers to
find a handler that implements a given command. The ioctl syscall has
three parameters, the file descriptor, command and an argument. The
command is a 16-bit number, which in theory is divided into high 8?bits
determining class of the ioctl command and low 8?bits, which are the
actual command within the given set. The emulation takes advantage of
this division. We implement handlers for each set, like
``sound_handler`` or ``disk_handler``. Each handler has a maximum
command and a minimum command defined, which is used for determining
what handler is used. There are slight problems with this approach
because Linux? does not use the set division consistently so sometimes
ioctls for a different set are inside a set they should not belong to
(SCSI generic ioctls inside cdrom set, etc.). FreeBSD currently does not
implement many Linux? ioctls (compared to NetBSD, for example) but the
plan is to port those from NetBSD. The trend is to use Linux? ioctls
even in the native FreeBSD drivers because of the easy porting of
applications.

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

5.5.3.?Debugging
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every syscall should be debuggable. For this purpose we introduce a
small infrastructure. We have the ldebug facility, which tells whether a
given syscall should be debugged (settable via a sysctl). For printing
we have LMSG and ARGS macros. Those are used for altering a printable
string for uniform debugging messages.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+---------------------------------+
| `Prev <md.html>`__?                   | ?                       | ?\ `Next <conclusion.html>`__   |
+---------------------------------------+-------------------------+---------------------------------+
| 4.?Linux? emulation layer -MD part?   | `Home <index.html>`__   | ?6.?Conclusion                  |
+---------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
