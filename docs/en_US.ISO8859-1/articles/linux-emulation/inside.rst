=================
2.?A look inside…
=================

.. raw:: html

   <div class="navheader">

2.?A look inside…
`Prev <index.html>`__?
?
?\ `Next <freebsd-emulation.html>`__

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

2.?A look inside…
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In this section we are going to describe every operating system in
question. How they deal with syscalls, trapframes etc., all the
low-level stuff. We also describe the way they understand common UNIX?
primitives like what a PID is, what a thread is, etc. In the third
subsection we talk about how UNIX? on UNIX? emulation could be done in
general.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?What is UNIX?
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

UNIX? is an operating system with a long history that has influenced
almost every other operating system currently in use. Starting in the
1960s, its development continues to this day (although in different
projects). UNIX? development soon forked into two main ways: the BSDs
and System III/V families. They mutually influenced themselves by
growing a common UNIX? standard. Among the contributions originated in
BSD we can name virtual memory, TCP/IP networking, FFS, and many others.
The System V branch contributed to SysV interprocess communication
primitives, copy-on-write, etc. UNIX? itself does not exist any more but
its ideas have been used by many other operating systems world wide thus
forming the so called UNIX?-like operating systems. These days the most
influential ones are Linux?, Solaris, and possibly (to some extent)
FreeBSD. There are in-company UNIX? derivatives (AIX, HP-UX etc.), but
these have been more and more migrated to the aforementioned systems.
Let us summarize typical UNIX? characteristics.

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

2.2.?Technical details
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every running program constitutes a process that represents a state of
the computation. Running process is divided between kernel-space and
user-space. Some operations can be done only from kernel space (dealing
with hardware etc.), but the process should spend most of its lifetime
in the user space. The kernel is where the management of the processes,
hardware, and low-level details take place. The kernel provides a
standard unified UNIX? API to the user space. The most important ones
are covered below.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.?Communication between kernel and user space process
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Common UNIX? API defines a syscall as a way to issue commands from a
user space process to the kernel. The most common implementation is
either by using an interrupt or specialized instruction (think of
``SYSENTER``/``SYSCALL`` instructions for ia32). Syscalls are defined by
a number. For example in FreeBSD, the syscall number?85 is the
`swapon(2) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=2>`__
syscall and the syscall number?132 is
`mkfifo(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mkfifo&sektion=2>`__.
Some syscalls need parameters, which are passed from the user-space to
the kernel-space in various ways (implementation dependant). Syscalls
are synchronous.

Another possible way to communicate is by using a *trap*. Traps occur
asynchronously after some event occurs (division by zero, page fault
etc.). A trap can be transparent for a process (page fault) or can
result in a reaction like sending a *signal* (division by zero).

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

2.2.2.?Communication between processes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are other APIs (System V IPC, shared memory etc.) but the single
most important API is signal. Signals are sent by processes or by the
kernel and received by processes. Some signals can be ignored or handled
by a user supplied routine, some result in a predefined action that
cannot be altered or ignored.

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

2.2.3.?Process management
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kernel instances are processed first in the system (so called init).
Every running process can create its identical copy using the
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2>`__
syscall. Some slightly modified versions of this syscall were introduced
but the basic semantic is the same. Every running process can morph into
some other process using the
`exec(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exec&sektion=3>`__
syscall. Some modifications of this syscall were introduced but all
serve the same basic purpose. Processes end their lives by calling the
`exit(2) <http://www.FreeBSD.org/cgi/man.cgi?query=exit&sektion=2>`__
syscall. Every process is identified by a unique number called PID.
Every process has a defined parent (identified by its PID).

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

2.2.4.?Thread management
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Traditional UNIX? does not define any API nor implementation for
threading, while POSIX? defines its threading API but the implementation
is undefined. Traditionally there were two ways of implementing threads.
Handling them as separate processes (1:1 threading) or envelope the
whole thread group in one process and managing the threading in
userspace (1:N threading). Comparing main features of each approach:

1:1 threading

.. raw:: html

   <div class="itemizedlist">

-  - heavyweight threads

-  - the scheduling cannot be altered by the user (slightly mitigated by
   the POSIX? API)

-  + no syscall wrapping necessary

-  + can utilize multiple CPUs

.. raw:: html

   </div>

1:N threading

.. raw:: html

   <div class="itemizedlist">

-  + lightweight threads

-  + scheduling can be easily altered by the user

-  - syscalls must be wrapped

-  - cannot utilize more than one CPU

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

2.3.?What is FreeBSD?
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD project is one of the oldest open source operating systems
currently available for daily use. It is a direct descendant of the
genuine UNIX? so it could be claimed that it is a true UNIX? although
licensing issues do not permit that. The start of the project dates back
to the early 1990's when a crew of fellow BSD users patched the 386BSD
operating system. Based on this patchkit a new operating system arose
named FreeBSD for its liberal license. Another group created the NetBSD
operating system with different goals in mind. We will focus on FreeBSD.

FreeBSD is a modern UNIX?-based operating system with all the features
of UNIX?. Preemptive multitasking, multiuser facilities, TCP/IP
networking, memory protection, symmetric multiprocessing support,
virtual memory with merged VM and buffer cache, they are all there. One
of the interesting and extremely useful features is the ability to
emulate other UNIX?-like operating systems. As of December?2006 and
7-CURRENT development, the following emulation functionalities are
supported:

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD/i386 emulation on FreeBSD/amd64

-  FreeBSD/i386 emulation on FreeBSD/ia64

-  Linux?-emulation of Linux? operating system on FreeBSD

-  NDIS-emulation of Windows networking drivers interface

-  NetBSD-emulation of NetBSD operating system

-  PECoff-support for PECoff FreeBSD executables

-  SVR4-emulation of System V revision 4 UNIX?

.. raw:: html

   </div>

Actively developed emulations are the Linux? layer and various
FreeBSD-on-FreeBSD layers. Others are not supposed to work properly nor
be usable these days.

FreeBSD development happens in a central CVS repository where only a
selected team of so called committers can write. This repository
possesses several branches; the most interesting are the HEAD branch, in
FreeBSD nomenclature called -CURRENT, and RELENG\_X branches, where X
stands for a number indicating a major version of FreeBSD. As of
December?2006, there are development branches for 6.X development
(RELENG\_6) and for the 5.X development (RELENG\_5). Other branches are
closed and not actively maintained or only fed with security patches by
the Security Officer of the FreeBSD project.

Historically the active development was done in the HEAD branch so it
was considered extremely unstable and supposed to happen to break at any
time. This is not true any more as the Perforce (commercial version
control system) repository was introduced so that active development
happen there. There are many branches in Perforce where development of
certain parts of the system happens and these branches are from time to
time merged back to the main CVS repository thus effectively putting the
given feature to the FreeBSD operating system. The same happened with
the ``rdivacky_linuxolator`` branch where development of this thesis
code was going on.

More info about the FreeBSD operating system can be found at [2].

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1.?Technical details
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is traditional flavor of UNIX? in the sense of dividing the run
of processes into two halves: kernel space and user space run. There are
two types of process entry to the kernel: a syscall and a trap. There is
only one way to return. In the subsequent sections we will describe the
three gates to/from the kernel. The whole description applies to the
i386 architecture as the Linuxulator only exists there but the concept
is similar on other architectures. The information was taken from [1]
and the source code.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1.1.?System entries
'''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD has an abstraction called an execution class loader, which is a
wedge into the
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
syscall. This employs a structure ``sysentvec``, which describes an
executable ABI. It contains things like errno translation table, signal
translation table, various functions to serve syscall needs (stack
fixup, coredumping, etc.). Every ABI the FreeBSD kernel wants to support
must define this structure, as it is used later in the syscall
processing code and at some other places. System entries are handled by
trap handlers, where we can access both the kernel-space and the
user-space at once.

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

2.3.1.2.?Syscalls
'''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Syscalls on FreeBSD are issued by executing interrupt ``0x80`` with
register ``%eax`` set to a desired syscall number with arguments passed
on the stack.

When a process issues an interrupt ``0x80``, the ``int0x80`` syscall
trap handler is issued (defined in ``sys/i386/i386/exception.s``), which
prepares arguments (i.e. copies them on to the stack) for a call to a C
function
`syscall(2) <http://www.FreeBSD.org/cgi/man.cgi?query=syscall&sektion=2>`__
(defined in ``sys/i386/i386/trap.c``), which processes the passed in
trapframe. The processing consists of preparing the syscall (depending
on the ``sysvec`` entry), determining if the syscall is 32-bit or 64-bit
one (changes size of the parameters), then the parameters are copied,
including the syscall. Next, the actual syscall function is executed
with processing of the return code (special cases for ``ERESTART`` and
``EJUSTRETURN`` errors). Finally an ``userret()`` is scheduled,
switching the process back to the users-pace. The parameters to the
actual syscall handler are passed in the form of ``struct thread *td``,
``struct syscall args *`` arguments where the second parameter is a
pointer to the copied in structure of parameters.

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

2.3.1.3.?Traps
''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Handling of traps in FreeBSD is similar to the handling of syscalls.
Whenever a trap occurs, an assembler handler is called. It is chosen
between alltraps, alltraps with regs pushed or calltrap depending on the
type of the trap. This handler prepares arguments for a call to a C
function ``trap()`` (defined in ``sys/i386/i386/trap.c``), which then
processes the occurred trap. After the processing it might send a signal
to the process and/or exit to userland using ``userret()``.

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

2.3.1.4.?Exits
''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Exits from kernel to userspace happen using the assembler routine
``doreti`` regardless of whether the kernel was entered via a trap or
via a syscall. This restores the program status from the stack and
returns to the userspace.

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

2.3.1.5.?UNIX? primitives
'''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD operating system adheres to the traditional UNIX? scheme, where
every process has a unique identification number, the so called *PID*
(Process ID). PID numbers are allocated either linearly or randomly
ranging from ``0`` to ``PID_MAX``. The allocation of PID numbers is done
using linear searching of PID space. Every thread in a process receives
the same PID number as result of the
`getpid(2) <http://www.FreeBSD.org/cgi/man.cgi?query=getpid&sektion=2>`__
call.

There are currently two ways to implement threading in FreeBSD. The
first way is M:N threading followed by the 1:1 threading model. The
default library used is M:N threading (``libpthread``) and you can
switch at runtime to 1:1 threading (``libthr``). The plan is to switch
to 1:1 library by default soon. Although those two libraries use the
same kernel primitives, they are accessed through different API(es). The
M:N library uses the ``kse_*`` family of syscalls while the 1:1 library
uses the ``thr_*`` family of syscalls. Because of this, there is no
general concept of thread ID shared between kernel and userspace. Of
course, both threading libraries implement the pthread thread ID API.
Every kernel thread (as described by ``struct thread``) has td tid
identifier but this is not directly accessible from userland and solely
serves the kernel's needs. It is also used for 1:1 threading library as
pthread's thread ID but handling of this is internal to the library and
cannot be relied on.

As stated previously there are two implementations of threading in
FreeBSD. The M:N library divides the work between kernel space and
userspace. Thread is an entity that gets scheduled in the kernel but it
can represent various number of userspace threads. M userspace threads
get mapped to N kernel threads thus saving resources while keeping the
ability to exploit multiprocessor parallelism. Further information about
the implementation can be obtained from the man page or [1]. The 1:1
library directly maps a userland thread to a kernel thread thus greatly
simplifying the scheme. None of these designs implement a fairness
mechanism (such a mechanism was implemented but it was removed recently
because it caused serious slowdown and made the code more difficult to
deal with).

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

2.4.?What is Linux?
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux? is a UNIX?-like kernel originally developed by Linus Torvalds,
and now being contributed to by a massive crowd of programmers all
around the world. From its mere beginnings to todays, with wide support
from companies such as IBM or Google, Linux? is being associated with
its fast development pace, full hardware support and benevolent dictator
model of organization.

Linux? development started in 1991 as a hobbyist project at University
of Helsinki in Finland. Since then it has obtained all the features of a
modern UNIX?-like OS: multiprocessing, multiuser support, virtual
memory, networking, basically everything is there. There are also highly
advanced features like virtualization etc.

As of 2006 Linux? seems to be the most widely used open source operating
system with support from independent software vendors like Oracle,
RealNetworks, Adobe, etc. Most of the commercial software distributed
for Linux? can only be obtained in a binary form so recompilation for
other operating systems is impossible.

Most of the Linux? development happens in a Git version control system.
Git is a distributed system so there is no central source of the Linux?
code, but some branches are considered prominent and official. The
version number scheme implemented by Linux? consists of four numbers
A.B.C.D. Currently development happens in 2.6.C.D, where C represents
major version, where new features are added or changed while D is a
minor version for bugfixes only.

More information can be obtained from [4].

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1.?Technical details
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux? follows the traditional UNIX? scheme of dividing the run of a
process in two halves: the kernel and user space. The kernel can be
entered in two ways: via a trap or via a syscall. The return is handled
only in one way. The further description applies to Linux??2.6 on the
i386™ architecture. This information was taken from [3].

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1.1.?Syscalls
'''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Syscalls in Linux? are performed (in userspace) using ``syscallX``
macros where X substitutes a number representing the number of
parameters of the given syscall. This macro translates to a code that
loads ``%eax`` register with a number of the syscall and executes
interrupt ``0x80``. After this syscall return is called, which
translates negative return values to positive ``errno`` values and sets
``res`` to ``-1`` in case of an error. Whenever the interrupt ``0x80``
is called the process enters the kernel in system call trap handler.
This routine saves all registers on the stack and calls the selected
syscall entry. Note that the Linux? calling convention expects
parameters to the syscall to be passed via registers as shown here:

.. raw:: html

   <div class="orderedlist">

#. parameter -> ``%ebx``

#. parameter -> ``%ecx``

#. parameter -> ``%edx``

#. parameter -> ``%esi``

#. parameter -> ``%edi``

#. parameter -> ``%ebp``

.. raw:: html

   </div>

There are some exceptions to this, where Linux? uses different calling
convention (most notably the ``clone`` syscall).

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

2.4.1.2.?Traps
''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The trap handlers are introduced in ``arch/i386/kernel/traps.c`` and
most of these handlers live in ``arch/i386/kernel/entry.S``, where
handling of the traps happens.

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

2.4.1.3.?Exits
''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Return from the syscall is managed by syscall
`exit(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exit&sektion=3>`__,
which checks for the process having unfinished work, then checks whether
we used user-supplied selectors. If this happens stack fixing is applied
and finally the registers are restored from the stack and the process
returns to the userspace.

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

2.4.1.4.?UNIX? primitives
'''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In the 2.6 version, the Linux? operating system redefined some of the
traditional UNIX? primitives, notably PID, TID and thread. PID is
defined not to be unique for every process, so for some processes
(threads)
`getppid(2) <http://www.FreeBSD.org/cgi/man.cgi?query=getppid&sektion=2>`__
returns the same value. Unique identification of process is provided by
TID. This is because *NPTL* (New POSIX? Thread Library) defines threads
to be normal processes (so called 1:1 threading). Spawning a new process
in Linux??2.6 happens using the ``clone`` syscall (fork variants are
reimplemented using it). This clone syscall defines a set of flags that
affect behaviour of the cloning process regarding thread implementation.
The semantic is a bit fuzzy as there is no single flag telling the
syscall to create a thread.

Implemented clone flags are:

.. raw:: html

   <div class="itemizedlist">

-  ``CLONE_VM`` - processes share their memory space

-  ``CLONE_FS`` - share umask, cwd and namespace

-  ``CLONE_FILES`` - share open files

-  ``CLONE_SIGHAND`` - share signal handlers and blocked signals

-  ``CLONE_PARENT`` - share parent

-  ``CLONE_THREAD`` - be thread (further explanation below)

-  ``CLONE_NEWNS`` - new namespace

-  ``CLONE_SYSVSEM`` - share SysV undo structures

-  ``CLONE_SETTLS`` - setup TLS at supplied address

-  ``CLONE_PARENT_SETTID`` - set TID in the parent

-  ``CLONE_CHILD_CLEARTID`` - clear TID in the child

-  ``CLONE_CHILD_SETTID`` - set TID in the child

.. raw:: html

   </div>

``CLONE_PARENT`` sets the real parent to the parent of the caller. This
is useful for threads because if thread A creates thread B we want
thread B to be parented to the parent of the whole thread group.
``CLONE_THREAD`` does exactly the same thing as ``CLONE_PARENT``,
``CLONE_VM`` and ``CLONE_SIGHAND``, rewrites PID to be the same as PID
of the caller, sets exit signal to be none and enters the thread group.
``CLONE_SETTLS`` sets up GDT entries for TLS handling. The
``CLONE_*_*TID`` set of flags sets/clears user supplied address to TID
or 0.

As you can see the ``CLONE_THREAD`` does most of the work and does not
seem to fit the scheme very well. The original intention is unclear
(even for authors, according to comments in the code) but I think
originally there was one threading flag, which was then parcelled among
many other flags but this separation was never fully finished. It is
also unclear what this partition is good for as glibc does not use that
so only hand-written use of the clone permits a programmer to access
this features.

For non-threaded programs the PID and TID are the same. For threaded
programs the first thread PID and TID are the same and every created
thread shares the same PID and gets assigned a unique TID (because
``CLONE_THREAD`` is passed in) also parent is shared for all processes
forming this threaded program.

The code that implements
`pthread\_create(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread_create&sektion=3>`__
in NPTL defines the clone flags like this:

.. code:: programlisting

    int clone_flags = (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGNAL

     | CLONE_SETTLS | CLONE_PARENT_SETTID

    | CLONE_CHILD_CLEARTID | CLONE_SYSVSEM
    #if __ASSUME_NO_CLONE_DETACHED == 0

    | CLONE_DETACHED
    #endif

    | 0);

The ``CLONE_SIGNAL`` is defined like

.. code:: programlisting

    #define CLONE_SIGNAL (CLONE_SIGHAND | CLONE_THREAD)

the last 0 means no signal is sent when any of the threads exits.

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

2.5.?What is emulation
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

According to a dictionary definition, emulation is the ability of a
program or device to imitate another program or device. This is achieved
by providing the same reaction to a given stimulus as the emulated
object. In practice, the software world mostly sees three types of
emulation - a program used to emulate a machine (QEMU, various game
console emulators etc.), software emulation of a hardware facility
(OpenGL emulators, floating point units emulation etc.) and operating
system emulation (either in kernel of the operating system or as a
userspace program).

Emulation is usually used in a place, where using the original component
is not feasible nor possible at all. For example someone might want to
use a program developed for a different operating system than they use.
Then emulation comes in handy. Sometimes there is no other way but to
use emulation - e.g. when the hardware device you try to use does not
exist (yet/anymore) then there is no other way but emulation. This
happens often when porting an operating system to a new (non-existent)
platform. Sometimes it is just cheaper to emulate.

Looking from an implementation point of view, there are two main
approaches to the implementation of emulation. You can either emulate
the whole thing - accepting possible inputs of the original object,
maintaining inner state and emitting correct output based on the state
and/or input. This kind of emulation does not require any special
conditions and basically can be implemented anywhere for any
device/program. The drawback is that implementing such emulation is
quite difficult, time-consuming and error-prone. In some cases we can
use a simpler approach. Imagine you want to emulate a printer that
prints from left to right on a printer that prints from right to left.
It is obvious that there is no need for a complex emulation layer but
simply reversing of the printed text is sufficient. Sometimes the
emulating environment is very similar to the emulated one so just a thin
layer of some translation is necessary to provide fully working
emulation! As you can see this is much less demanding to implement, so
less time-consuming and error-prone than the previous approach. But the
necessary condition is that the two environments must be similar enough.
The third approach combines the two previous. Most of the time the
objects do not provide the same capabilities so in a case of emulating
the more powerful one on the less powerful we have to emulate the
missing features with full emulation described above.

This master thesis deals with emulation of UNIX? on UNIX?, which is
exactly the case, where only a thin layer of translation is sufficient
to provide full emulation. The UNIX? API consists of a set of syscalls,
which are usually self contained and do not affect some global kernel
state.

There are a few syscalls that affect inner state but this can be dealt
with by providing some structures that maintain the extra state.

No emulation is perfect and emulations tend to lack some parts but this
usually does not cause any serious drawbacks. Imagine a game console
emulator that emulates everything but music output. No doubt that the
games are playable and one can use the emulator. It might not be that
comfortable as the original game console but its an acceptable
compromise between price and comfort.

The same goes with the UNIX? API. Most programs can live with a very
limited set of syscalls working. Those syscalls tend to be the oldest
ones
(`read(2) <http://www.FreeBSD.org/cgi/man.cgi?query=read&sektion=2>`__/`write(2) <http://www.FreeBSD.org/cgi/man.cgi?query=write&sektion=2>`__,
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2>`__
family,
`signal(3) <http://www.FreeBSD.org/cgi/man.cgi?query=signal&sektion=3>`__
handling,
`exit(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exit&sektion=3>`__,
`socket(2) <http://www.FreeBSD.org/cgi/man.cgi?query=socket&sektion=2>`__
API) hence it is easy to emulate because their semantics is shared among
all UNIX?es, which exist todays.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------------------+
| `Prev <index.html>`__?         | ?                       | ?\ `Next <freebsd-emulation.html>`__   |
+--------------------------------+-------------------------+----------------------------------------+
| Linux? emulation in FreeBSD?   | `Home <index.html>`__   | ?3.?Emulation                          |
+--------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
