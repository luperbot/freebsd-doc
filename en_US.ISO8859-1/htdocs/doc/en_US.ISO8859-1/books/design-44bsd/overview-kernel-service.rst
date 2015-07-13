====================
2.3.?Kernel Services
====================

.. raw:: html

   <div class="navheader">

2.3.?Kernel Services
`Prev <overview-kernel-organization.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-process-management.html>`__

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

2.3.?Kernel Services
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The boundary between the kernel- and user-level code is enforced by
hardware-protection facilities provided by the underlying hardware. The
kernel operates in a separate address space that is inaccessible to user
processes. Privileged operations -- such as starting I/O and halting the
central processing unit (CPU) -- are available to only the kernel.
Applications request services from the kernel with *system calls*.
System calls are used to cause the kernel to execute complicated
operations, such as writing data to secondary storage, and simple
operations, such as returning the current time of day. All system calls
appear *synchronous* to applications: The application does not run while
the kernel does the actions associated with a system call. The kernel
may finish some operations associated with a system call after it has
returned. For example, a *write* system call will copy the data to be
written from the user process to a kernel buffer while the process
waits, but will usually return from the system call before the kernel
buffer is written to the disk.

A system call usually is implemented as a hardware trap that changes the
CPU's execution mode and the current address-space mapping. Parameters
supplied by users in system calls are validated by the kernel before
being used. Such checking ensures the integrity of the system. All
parameters passed into the kernel are copied into the kernel's address
space, to ensure that validated parameters are not changed as a side
effect of the system call. System-call results are returned by the
kernel, either in hardware registers or by their values being copied to
user-specified memory addresses. Like parameters passed into the kernel,
addresses used for the return of results must be validated to ensure
that they are part of an application's address space. If the kernel
encounters an error while processing a system call, it returns an error
code to the user. For the C programming language, this error code is
stored in the global variable *errno*, and the function that executed
the system call returns the value -1.

User applications and the kernel operate independently of each other.
4.4BSD does not store I/O control blocks or other
operating-system-related data structures in the application's address
space. Each user-level application is provided an independent address
space in which it executes. The kernel makes most state changes, such as
suspending a process while another is running, invisible to the
processes involved.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+--------------------------+--------------------------------------------------+
| `Prev <overview-kernel-organization.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-process-management.html>`__   |
+-------------------------------------------------+--------------------------+--------------------------------------------------+
| 2.2.?Kernel Organization?                       | `Home <index.html>`__    | ?2.4.?Process Management                         |
+-------------------------------------------------+--------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
