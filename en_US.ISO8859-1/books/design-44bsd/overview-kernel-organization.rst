========================
2.2.?Kernel Organization
========================

.. raw:: html

   <div class="navheader">

2.2.?Kernel Organization
`Prev <overview.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-kernel-service.html>`__

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

2.2.?Kernel Organization
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In this section, we view the organization of the 4.4BSD kernel in two
ways:

.. raw:: html

   <div class="orderedlist">

#. As a static body of software, categorized by the functionality
   offered by the modules that make up the kernel

#. By its dynamic operation, categorized according to the services
   provided to users

.. raw:: html

   </div>

The largest part of the kernel implements the system services that
applications access through system calls. In 4.4BSD, this software has
been organized according to the following:

.. raw:: html

   <div class="itemizedlist">

-  Basic kernel facilities: timer and system-clock handling, descriptor
   management, and process management

-  Memory-management support: paging and swapping

-  Generic system interfaces: the I/O, control, and multiplexing
   operations performed on descriptors

-  The filesystem: files, directories, pathname translation, file
   locking, and I/O buffer management

-  Terminal-handling support: the terminal-interface driver and terminal
   line disciplines

-  Interprocess-communication facilities: sockets

-  Support for network communication: communication protocols and
   generic network facilities, such as routing

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?2.1.?Machine-independent software in the 4.4BSD kernel

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

Category
Lines of code
Percentage of kernel
total machine independent
162,617
80.4
headers
9,393
4.6
initialization
1,107
0.6
kernel facilities
8,793
4.4
generic interfaces
4,782
2.4
interprocess communication
4,540
2.2
terminal handling
3,911
1.9
virtual memory
11,813
5.8
vnode management
7,954
3.9
filesystem naming
6,550
3.2
fast filestore
4,365
2.2
log-structure filestore
4,337
2.1
memory-based filestore
645
0.3
cd9660 filesystem
4,177
2.1
miscellaneous filesystems (10)
12,695
6.3
network filesystem
17,199
8.5
network communication
8,630
4.3
internet protocols
11,984
5.9
ISO protocols
23,924
11.8
X.25 protocols
10,626
5.3
XNS protocols
5,192
2.6

.. raw:: html

   </div>

.. raw:: html

   </div>

Most of the software in these categories is machine independent and is
portable across different hardware architectures.

The machine-dependent aspects of the kernel are isolated from the
mainstream code. In particular, none of the machine-independent code
contains conditional code for specific architecture. When an
architecture-dependent action is needed, the machine-independent code
calls an architecture-dependent function that is located in the
machine-dependent code. The software that is machine dependent includes

.. raw:: html

   <div class="itemizedlist">

-  Low-level system-startup actions

-  Trap and fault handling

-  Low-level manipulation of the run-time context of a process

-  Configuration and initialization of hardware devices

-  Run-time support for I/O devices

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?2.2.?Machine-dependent software for the HP300 in the 4.4BSD kernel

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

Category
Lines of code
Percentage of kernel
total machine dependent
39,634
19.6
machine dependent headers
1,562
0.8
device driver headers
3,495
1.7
device driver source
17,506
8.7
virtual memory
3,087
1.5
other machine dependent
6,287
3.1
routines in assembly language
3,014
1.5
HP/UX compatibility
4,683
2.3

.. raw:: html

   </div>

.. raw:: html

   </div>

`Table?2.1, “Machine-independent software in the 4.4BSD
kernel” <overview-kernel-organization.html#table-mach-indep>`__
summarizes the machine-independent software that constitutes the 4.4BSD
kernel for the HP300. The numbers in column 2 are for lines of C source
code, header files, and assembly language. Virtually all the software in
the kernel is written in the C programming language; less than 2 percent
is written in assembly language. As the statistics in `Table?2.2,
“Machine-dependent software for the HP300 in the 4.4BSD
kernel” <overview-kernel-organization.html#table-mach-dep>`__ show, the
machine-dependent software, excluding HP/UX and device support, accounts
for a minuscule 6.9 percent of the kernel.

Only a small part of the kernel is devoted to initializing the system.
This code is used when the system is *bootstrapped* into operation and
is responsible for setting up the kernel hardware and software
environment (see Chapter 14). Some operating systems (especially those
with limited physical memory) discard or *overlay* the software that
performs these functions after that software has been executed. The
4.4BSD kernel does not reclaim the memory used by the startup code
because that memory space is barely 0.5 percent of the kernel resources
used on a typical machine. Also, the startup code does not appear in one
place in the kernel -- it is scattered throughout, and it usually
appears in places logically associated with what is being initialized.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+--------------------------+----------------------------------------------+
| `Prev <overview.html>`__?               | `Up <overview.html>`__   | ?\ `Next <overview-kernel-service.html>`__   |
+-----------------------------------------+--------------------------+----------------------------------------------+
| Chapter?2.?Design Overview of 4.4BSD?   | `Home <index.html>`__    | ?2.3.?Kernel Services                        |
+-----------------------------------------+--------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
