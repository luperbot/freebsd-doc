====================================
Chapter?2.?Design Overview of 4.4BSD
====================================

.. raw:: html

   <div class="navheader">

Chapter?2.?Design Overview of 4.4BSD
`Prev <index.html>`__?
?
?\ `Next <overview-kernel-organization.html>`__

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

`2.1. 4.4BSD Facilities and the
Kernel <overview.html#overview-facilities>`__
`2.2. Kernel Organization <overview-kernel-organization.html>`__
`2.3. Kernel Services <overview-kernel-service.html>`__
`2.4. Process Management <overview-process-management.html>`__
`2.5. Memory Management <overview-memory-management.html>`__
`2.6. I/O System <overview-io-system.html>`__
`2.7. Filesystems <overview-filesystem.html>`__
`2.8. Filestores <overview-filestore.html>`__
`2.9. Network Filesystem <overview-nfs.html>`__
`2.10. Terminals <overview-terminal.html>`__
`2.11. Interprocess Communication <overview-ipc.html>`__
`2.12. Network Communication <overview-network-communication.html>`__
`2.13. Network Implementation <overview-network-implementation.html>`__
`2.14. System Operation <overview-operation.html>`__
`References <overview.html#references>`__

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

2.1.?4.4BSD Facilities and the Kernel
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The 4.4BSD kernel provides four basic facilities: processes, a
filesystem, communications, and system startup. This section outlines
where each of these four basic services is described in this book.

.. raw:: html

   <div class="orderedlist">

#. Processes constitute a thread of control in an address space.
   Mechanisms for creating, terminating, and otherwise controlling
   processes are described in Chapter 4. The system multiplexes separate
   virtual-address spaces for each process; this memory management is
   discussed in Chapter 5.

#. The user interface to the filesystem and devices is similar; common
   aspects are discussed in Chapter 6. The filesystem is a set of named
   files, organized in a tree-structured hierarchy of directories, and
   of operations to manipulate them, as presented in Chapter 7. Files
   reside on physical media such as disks. 4.4BSD supports several
   organizations of data on the disk, as set forth in Chapter 8. Access
   to files on remote machines is the subject of Chapter 9. Terminals
   are used to access the system; their operation is the subject of
   Chapter 10.

#. Communication mechanisms provided by traditional UNIX systems include
   simplex reliable byte streams between related processes (see pipes,
   Section 11.1), and notification of exceptional events (see signals,
   Section 4.7). 4.4BSD also has a general interprocess-communication
   facility. This facility, described in Chapter 11, uses access
   mechanisms distinct from those of the filesystem, but, once a
   connection is set up, a process can access it as though it were a
   pipe. There is a general networking framework, discussed in Chapter
   12, that is normally used as a layer underlying the IPC facility.
   Chapter 13 describes a particular networking implementation in
   detail.

#. Any real operating system has operational issues, such as how to
   start it running. Startup and operational issues are described in
   Chapter 14.

.. raw:: html

   </div>

Sections 2.3 through 2.14 present introductory material related to
Chapters 3 through 14. We shall define terms, mention basic system
calls, and explore historical developments. Finally, we shall give the
reasons for many major design decisions.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.1.?The Kernel
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The *kernel* is the part of the system that runs in protected mode and
mediates access by all user programs to the underlying hardware (e.g.,
CPU, disks, terminals, network links) and software constructs (e.g.,
filesystem, network protocols). The kernel provides the basic system
facilities; it creates and manages processes, and provides functions to
access the filesystem and communication facilities. These functions,
called *system calls* appear to user processes as library subroutines.
These system calls are the only interface that processes have to these
facilities. Details of the system-call mechanism are given in Chapter 3,
as are descriptions of several kernel mechanisms that do not execute as
the direct result of a process doing a system call.

A *kernel* in traditional operating-system terminology, is a small
nucleus of software that provides only the minimal facilities necessary
for implementing additional operating-system services. In contemporary
research operating systems -- such as Chorus `[Rozier et al,
1988] <overview.html#biblio-rozier>`__, Mach `[Accetta et al,
1986] <overview.html#biblio-accetta>`__, Tunis `[Ewens et al,
1985] <overview.html#biblio-ewens>`__, and the V Kernel `[Cheriton,
1988] <overview.html#biblio-cheriton>`__ -- this division of
functionality is more than just a logical one. Services such as
filesystems and networking protocols are implemented as client
application processes of the nucleus or kernel.

The 4.4BSD kernel is not partitioned into multiple processes. This basic
design decision was made in the earliest versions of UNIX. The first two
implementations by Ken Thompson had no memory mapping, and thus made no
hardware-enforced distinction between user and kernel space `[Ritchie,
1988] <overview.html#biblio-ritchie>`__. A message-passing system could
have been implemented as readily as the actually implemented model of
kernel and user processes. The monolithic kernel was chosen for
simplicity and performance. And the early kernels were small; the
inclusion of facilities such as networking into the kernel has increased
its size. The current trend in operating-systems research is to reduce
the kernel size by placing such services in user space.

Users ordinarily interact with the system through a command-language
interpreter, called a *shell*, and perhaps through additional user
application programs. Such programs and the shell are implemented with
processes. Details of such programs are beyond the scope of this book,
which instead concentrates almost exclusively on the kernel.

Sections 2.3 and 2.4 describe the services provided by the 4.4BSD
kernel, and give an overview of the latter's design. Later chapters
describe the detailed design and implementation of these services as
they appear in 4.4BSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="bibliography">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

References
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Accetta et al, 1986] “Mach: A New Kernel Foundation for UNIX
Development"”. M. Accetta, R. Baron, W. Bolosky, D. Golub, R. Rashid, A.
Tevanian, and M. Young. 93-113. *USENIX Association Conference
Proceedings*. USENIX Association. June 1986.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Cheriton, 1988] “The V Distributed System”. D. R. Cheriton. 314-333.
*Comm ACM, 31, 3*. March 1988.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Ewens et al, 1985] “Tunis: A Distributed Multiprocessor Operating
System”. P. Ewens, D. R. Blythe, M. Funkenhauser, and R. C. Holt.
247-254. *USENIX Assocation Conference Proceedings*. USENIX Association.
June 1985.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Gingell et al, 1987] “Virtual Memory Architecture in SunOS”. R.
Gingell, J. Moran, and W. Shannon. 81-94. *USENIX Association Conference
Proceedings*. USENIX Association. June 1987.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Kernighan & Pike, 1984] *The UNIX Programming Environment*. B. W.
Kernighan and R. Pike. Prentice-Hall. Englewood Cliffs NJ . 1984.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Macklem, 1994] *The 4.4BSD NFS Implementation*. R. Macklem. 6:1-14.
*4.4BSD System Manager's Manual*. O'Reilly & Associates, Inc..
Sebastopol CA . 1994.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[McKusick & Karels, 1988] “Design of a General Purpose Memory Allocator
for the 4.3BSD UNIX Kernel”. M. K. McKusick and M. J. Karels. 295-304.
*USENIX Assocation Conference Proceedings*. USENIX Assocation. June
1998.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[McKusick et al, 1994] *Berkeley Software Architecture Manual, 4.4BSD
Edition*. M. K. McKusick, M. J. Karels, S. J. Leffler, W. N. Joy, and R.
S. Faber. 5:1-42. *4.4BSD Programmer's Supplementary Documents*.
O'Reilly & Associates, Inc.. Sebastopol CA . 1994.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Ritchie, 1988] *Early Kernel Design*. private communication. D. M.
Ritchie. March 1988.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Rosenblum & Ousterhout, 1992] “The Design and Implementation of a
Log-Structured File System”. M. Rosenblum and K. Ousterhout. 26-52. *ACM
Transactions on Computer Systems, 10, 1*. Association for Computing
Machinery. February 1992.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Rozier et al, 1988] “Chorus Distributed Operating Systems”. M. Rozier,
V. Abrossimov, F. Armand, I. Boule, M. Gien, M. Guillemont, F. Herrmann,
C. Kaiser, S. Langlois, P. Leonard, and W. Neuhauser. 305-370. *USENIX
Computing Systems, 1, 4*. Fall 1988.

.. raw:: html

   </div>

.. raw:: html

   <div class="biblioentry">

[Tevanian, 1987] *Architecture-Independent Virtual Memory Management for
Parallel and Distributed Environments: The Mach Approach*. Technical
Report CMU-CS-88-106,. A. Tevanian. Department of Computer Science,
Carnegie-Mellon University. Pittsburgh PA . December 1987.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------+-------------------------+---------------------------------------------------+
| `Prev <index.html>`__?                                          | ?                       | ?\ `Next <overview-kernel-organization.html>`__   |
+-----------------------------------------------------------------+-------------------------+---------------------------------------------------+
| The Design and Implementation of the 4.4BSD Operating System?   | `Home <index.html>`__   | ?2.2.?Kernel Organization                         |
+-----------------------------------------------------------------+-------------------------+---------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
