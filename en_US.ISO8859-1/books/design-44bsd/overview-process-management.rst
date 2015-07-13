=======================
2.4.?Process Management
=======================

.. raw:: html

   <div class="navheader">

2.4.?Process Management
`Prev <overview-kernel-service.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-memory-management.html>`__

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

2.4.?Process Management
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

4.4BSD supports a multitasking environment. Each task or thread of
execution is termed a *process*. The *context* of a 4.4BSD process
consists of user-level state, including the contents of its address
space and the run-time environment, and kernel-level state, which
includes scheduling parameters, resource controls, and identification
information. The context includes everything used by the kernel in
providing services for the process. Users can create processes, control
the processes' execution, and receive notification when the processes'
execution status changes. Every process is assigned a unique value,
termed a *process identifier* (PID). This value is used by the kernel to
identify a process when reporting status changes to a user, and by a
user when referencing a process in a system call.

The kernel creates a process by duplicating the context of another
process. The new process is termed a *child process* of the original
*parent process* The context duplicated in process creation includes
both the user-level execution state of the process and the process's
system state managed by the kernel. Important components of the kernel
state are described in Chapter 4.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.1.?Process lifecycle

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Process-management system calls|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The process lifecycle is depicted in `Figure?2.1, “Process
lifecycle” <overview-process-management.html#fig-process-lifecycle>`__.
A process may create a new process that is a copy of the original by
using the *fork* system call. The *fork* call returns twice: once in the
parent process, where the return value is the process identifier of the
child, and once in the child process, where the return value is 0. The
parent-child relationship induces a hierarchical structure on the set of
processes in the system. The new process shares all its parent's
resources, such as file descriptors, signal-handling status, and memory
layout.

Although there are occasions when the new process is intended to be a
copy of the parent, the loading and execution of a different program is
a more useful and typical action. A process can overlay itself with the
memory image of another program, passing to the newly created image a
set of parameters, using the system call *execve*. One parameter is the
name of a file whose contents are in a format recognized by the system
-- either a binary-executable file or a file that causes the execution
of a specified interpreter program to process its contents.

A process may terminate by executing an *exit* system call, sending 8
bits of exit status to its parent. If a process wants to communicate
more than a single byte of information with its parent, it must either
set up an interprocess-communication channel using pipes or sockets, or
use an intermediate file. Interprocess communication is discussed
extensively in Chapter 11.

A process can suspend execution until any of its child processes
terminate using the *wait* system call, which returns the PID and exit
status of the terminated child process. A parent process can arrange to
be notified by a signal when a child process exits or terminates
abnormally. Using the *wait4* system call, the parent can retrieve
information about the event that caused termination of the child process
and about resources consumed by the process during its lifetime. If a
process is orphaned because its parent exits before it is finished, then
the kernel arranges for the child's exit status to be passed back to a
special system process *init*: see Sections 3.1 and 14.6).

The details of how the kernel creates and destroys processes are given
in Chapter 5.

Processes are scheduled for execution according to a *process-priority*
parameter. This priority is managed by a kernel-based scheduling
algorithm. Users can influence the scheduling of a process by specifying
a parameter (*nice*) that weights the overall scheduling priority, but
are still obligated to share the underlying CPU resources according to
the kernel's scheduling policy.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1.?Signals
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The system defines a set of *signals* that may be delivered to a
process. Signals in 4.4BSD are modeled after hardware interrupts. A
process may specify a user-level subroutine to be a *handler* to which a
signal should be delivered. When a signal is generated, it is blocked
from further occurrence while it is being *caught* by the handler.
Catching a signal involves saving the current process context and
building a new one in which to run the handler. The signal is then
delivered to the handler, which can either abort the process or return
to the executing process (perhaps after setting a global variable). If
the handler returns, the signal is unblocked and can be generated (and
caught) again.

Alternatively, a process may specify that a signal is to be *ignored*,
or that a default action, as determined by the kernel, is to be taken.
The default action of certain signals is to terminate the process. This
termination may be accompanied by creation of a *core file* that
contains the current memory image of the process for use in postmortem
debugging.

Some signals cannot be caught or ignored. These signals include
*SIGKILL*, which kills runaway processes, and the job-control signal
*SIGSTOP*.

A process may choose to have signals delivered on a special stack so
that sophisticated software stack manipulations are possible. For
example, a language supporting coroutines needs to provide a stack for
each coroutine. The language run-time system can allocate these stacks
by dividing up the single stack provided by 4.4BSD. If the kernel does
not support a separate signal stack, the space allocated for each
coroutine must be expanded by the amount of space required to catch a
signal.

All signals have the same *priority*. If multiple signals are pending
simultaneously, the order in which signals are delivered to a process is
implementation specific. Signal handlers execute with the signal that
caused their invocation to be blocked, but other signals may yet occur.
Mechanisms are provided so that processes can protect critical sections
of code against the occurrence of specified signals.

The detailed design and implementation of signals is described in
Section 4.7.

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

2.4.2.?Process Groups and Sessions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Processes are organized into *process groups*. Process groups are used
to control access to terminals and to provide a means of distributing
signals to collections of related processes. A process inherits its
process group from its parent process. Mechanisms are provided by the
kernel to allow a process to alter its process group or the process
group of its descendents. Creating a new process group is easy; the
value of a new process group is ordinarily the process identifier of the
creating process.

The group of processes in a process group is sometimes referred to as a
*job* and is manipulated by high-level system software, such as the
shell. A common kind of job created by a shell is a *pipeline* of
several processes connected by pipes, such that the output of the first
process is the input of the second, the output of the second is the
input of the third, and so forth. The shell creates such a job by
forking a process for each stage of the pipeline, then putting all those
processes into a separate process group.

A user process can send a signal to each process in a process group, as
well as to a single process. A process in a specific process group may
receive software interrupts affecting the group, causing the group to
suspend or resume execution, or to be interrupted or terminated.

A terminal has a process-group identifier assigned to it. This
identifier is normally set to the identifier of a process group
associated with the terminal. A job-control shell may create a number of
process groups associated with the same terminal; the terminal is the
*controlling terminal* for each process in these groups. A process may
read from a descriptor for its controlling terminal only if the
terminal's process-group identifier matches that of the process. If the
identifiers do not match, the process will be blocked if it attempts to
read from the terminal. By changing the process-group identifier of the
terminal, a shell can arbitrate a terminal among several different jobs.
This arbitration is called *job control* and is described, with process
groups, in Section 4.8.

Just as a set of related processes can be collected into a process
group, a set of process groups can be collected into a *session*. The
main uses for sessions are to create an isolated environment for a
daemon process and its children, and to collect together a user's login
shell and the jobs that that shell spawns.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+--------------------------+-------------------------------------------------+
| `Prev <overview-kernel-service.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-memory-management.html>`__   |
+--------------------------------------------+--------------------------+-------------------------------------------------+
| 2.3.?Kernel Services?                      | `Home <index.html>`__    | ?2.5.?Memory Management                         |
+--------------------------------------------+--------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Process-management system calls| image:: fig1.png
