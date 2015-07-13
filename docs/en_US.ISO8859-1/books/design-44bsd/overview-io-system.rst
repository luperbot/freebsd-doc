===============
2.6.?I/O System
===============

.. raw:: html

   <div class="navheader">

2.6.?I/O System
`Prev <overview-memory-management.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-filesystem.html>`__

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

2.6.?I/O System
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The basic model of the UNIX I/O system is a sequence of bytes that can
be accessed either randomly or sequentially. There are no *access
methods* and no *control blocks* in a typical UNIX user process.

Different programs expect various levels of structure, but the kernel
does not impose structure on I/O. For instance, the convention for text
files is lines of ASCII characters separated by a single newline
character (the ASCII line-feed character), but the kernel knows nothing
about this convention. For the purposes of most programs, the model is
further simplified to being a stream of data bytes, or an *I/O stream*.
It is this single common data form that makes the characteristic UNIX
tool-based approach work `[Kernighan & Pike,
1984] <overview.html#biblio-kernighan>`__. An I/O stream from one
program can be fed as input to almost any other program. (This kind of
traditional UNIX I/O stream should not be confused with the Eighth
Edition stream I/O system or with the System V, Release 3 STREAMS, both
of which can be accessed as traditional I/O streams.)

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.6.1.?Descriptors and I/O
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

UNIX processes use *descriptors* to reference I/O streams. Descriptors
are small unsigned integers obtained from the *open* and *socket* system
calls. The *open* system call takes as arguments the name of a file and
a permission mode to specify whether the file should be open for reading
or for writing, or for both. This system call also can be used to create
a new, empty file. A *read* or *write* system call can be applied to a
descriptor to transfer data. The *close* system call can be used to
deallocate any descriptor.

Descriptors represent underlying objects supported by the kernel, and
are created by system calls specific to the type of object. In 4.4BSD,
three kinds of objects can be represented by descriptors: files, pipes,
and sockets.

.. raw:: html

   <div class="itemizedlist">

-  A *file* is a linear array of bytes with at least one name. A file
   exists until all its names are deleted explicitly and no process
   holds a descriptor for it. A process acquires a descriptor for a file
   by opening that file's name with the *open* system call. I/O devices
   are accessed as files.

-  A *pipe* is a linear array of bytes, as is a file, but it is used
   solely as an I/O stream, and it is unidirectional. It also has no
   name, and thus cannot be opened with *open*. Instead, it is created
   by the *pipe* system call, which returns two descriptors, one of
   which accepts input that is sent to the other descriptor reliably,
   without duplication, and in order. The system also supports a named
   pipe or FIFO. A FIFO has properties identical to a pipe, except that
   it appears in the filesystem; thus, it can be opened using the *open*
   system call. Two processes that wish to communicate each open the
   FIFO: One opens it for reading, the other for writing.

-  A *socket* is a transient object that is used for interprocess
   communication; it exists only as long as some process holds a
   descriptor referring to it. A socket is created by the *socket*
   system call, which returns a descriptor for it. There are different
   kinds of sockets that support various communication semantics, such
   as reliable delivery of data, preservation of message ordering, and
   preservation of message boundaries.

.. raw:: html

   </div>

In systems before 4.2BSD, pipes were implemented using the filesystem;
when sockets were introduced in 4.2BSD, pipes were reimplemented as
sockets.

The kernel keeps for each process a *descriptor table*, which is a table
that the kernel uses to translate the external representation of a
descriptor into an internal representation. (The descriptor is merely an
index into this table.) The descriptor table of a process is inherited
from that process's parent, and thus access to the objects to which the
descriptors refer also is inherited. The main ways that a process can
obtain a descriptor are by opening or creation of an object, and by
inheritance from the parent process. In addition, socket IPC allows
passing of descriptors in messages between unrelated processes on the
same machine.

Every valid descriptor has an associated *file offset* in bytes from the
beginning of the object. Read and write operations start at this offset,
which is updated after each data transfer. For objects that permit
random access, the file offset also may be set with the *lseek* system
call. Ordinary files permit random access, and some devices do, as well.
Pipes and sockets do not.

When a process terminates, the kernel reclaims all the descriptors that
were in use by that process. If the process was holding the final
reference to an object, the object's manager is notified so that it can
do any necessary cleanup actions, such as final deletion of a file or
deallocation of a socket.

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

2.6.2.?Descriptor Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most processes expect three descriptors to be open already when they
start running. These descriptors are 0, 1, 2, more commonly known as
*standard input*, *standard output*, and *standard error*, respectively.
Usually, all three are associated with the user's terminal by the login
process (see Section 14.6) and are inherited through *fork* and *exec*
by processes run by the user. Thus, a program can read what the user
types by reading standard input, and the program can send output to the
user's screen by writing to standard output. The standard error
descriptor also is open for writing and is used for error output,
whereas standard output is used for ordinary output.

These (and other) descriptors can be mapped to objects other than the
terminal; such mapping is called *I/O redirection*, and all the standard
shells permit users to do it. The shell can direct the output of a
program to a file by closing descriptor 1 (standard output) and opening
the desired output file to produce a new descriptor 1. It can similarly
redirect standard input to come from a file by closing descriptor 0 and
opening the file.

Pipes allow the output of one program to be input to another program
without rewriting or even relinking of either program. Instead of
descriptor 1 (standard output) of the source program being set up to
write to the terminal, it is set up to be the input descriptor of a
pipe. Similarly, descriptor 0 (standard input) of the sink program is
set up to reference the output of the pipe, instead of the terminal
keyboard. The resulting set of two processes and the connecting pipe is
known as a *pipeline*. Pipelines can be arbitrarily long series of
processes connected by pipes.

The *open*, *pipe*, and *socket* system calls produce new descriptors
with the lowest unused number usable for a descriptor. For pipelines to
work, some mechanism must be provided to map such descriptors into 0 and
1. The *dup* system call creates a copy of a descriptor that points to
the same file-table entry. The new descriptor is also the lowest unused
one, but if the desired descriptor is closed first, *dup* can be used to
do the desired mapping. Care is required, however: If descriptor 1 is
desired, and descriptor 0 happens also to have been closed, descriptor 0
will be the result. To avoid this problem, the system provides the
*dup2* system call; it is like *dup*, but it takes an additional
argument specifying the number of the desired descriptor (if the desired
descriptor was already open, *dup2* closes it before reusing it).

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

2.6.3.?Devices
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hardware devices have filenames, and may be accessed by the user via the
same system calls used for regular files. The kernel can distinguish a
*device special file* or *special file*, and can determine to what
device it refers, but most processes do not need to make this
determination. Terminals, printers, and tape drives are all accessed as
though they were streams of bytes, like 4.4BSD disk files. Thus, device
dependencies and peculiarities are kept in the kernel as much as
possible, and even in the kernel most of them are segregated in the
device drivers.

Hardware devices can be categorized as either *structured* or
*unstructured*; they are known as *block* or *character* devices,
respectively. Processes typically access devices through *special files*
in the filesystem. I/O operations to these files are handled by
kernel-resident software modules termed *device drivers*. Most
network-communication hardware devices are accessible through only the
interprocess-communication facilities, and do not have special files in
the filesystem name space, because the *raw-socket* interface provides a
more natural interface than does a special file.

Structured or block devices are typified by disks and magnetic tapes,
and include most random-access devices. The kernel supports
read-modify-write-type buffering actions on block-oriented structured
devices to allow the latter to be read and written in a totally random
byte-addressed fashion, like regular files. Filesystems are created on
block devices.

Unstructured devices are those devices that do not support a block
structure. Familiar unstructured devices are communication lines, raster
plotters, and unbuffered magnetic tapes and disks. Unstructured devices
typically support large block I/O transfers.

Unstructured files are called *character devices* because the first of
these to be implemented were terminal device drivers. The kernel
interface to the driver for these devices proved convenient for other
devices that were not block structured.

Device special files are created by the *mknod* system call. There is an
additional system call, *ioctl*, for manipulating the underlying device
parameters of special files. The operations that can be done differ for
each device. This system call allows the special characteristics of
devices to be accessed, rather than overloading the semantics of other
system calls. For example, there is an *ioctl* on a tape drive to write
an end-of-tape mark, instead of there being a special or modified
version of *write*.

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

2.6.4.?Socket IPC
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The 4.2BSD kernel introduced an IPC mechanism more flexible than pipes,
based on *sockets*. A socket is an endpoint of communication referred to
by a descriptor, just like a file or a pipe. Two processes can each
create a socket, and then connect those two endpoints to produce a
reliable byte stream. Once connected, the descriptors for the sockets
can be read or written by processes, just as the latter would do with a
pipe. The transparency of sockets allows the kernel to redirect the
output of one process to the input of another process residing on
another machine. A major difference between pipes and sockets is that
pipes require a common parent process to set up the communications
channel. A connection between sockets can be set up by two unrelated
processes, possibly residing on different machines.

System V provides local interprocess communication through FIFOs (also
known as *named pipes*). FIFOs appear as an object in the filesystem
that unrelated processes can open and send data through in the same way
as they would communicate through a pipe. Thus, FIFOs do not require a
common parent to set them up; they can be connected after a pair of
processes are up and running. Unlike sockets, FIFOs can be used on only
a local machine; they cannot be used to communicate between processes on
different machines. FIFOs are implemented in 4.4BSD only because they
are required by the POSIX.1 standard. Their functionality is a subset of
the socket interface.

The socket mechanism requires extensions to the traditional UNIX I/O
system calls to provide the associated naming and connection semantics.
Rather than overloading the existing interface, the developers used the
existing interfaces to the extent that the latter worked without being
changed, and designed new interfaces to handle the added semantics. The
*read* and *write* system calls were used for byte-stream type
connections, but six new system calls were added to allow sending and
receiving addressed messages such as network datagrams. The system calls
for writing messages include *send*, *sendto*, and *sendmsg*. The system
calls for reading messages include *recv*, *recvfrom*, and *recvmsg*. In
retrospect, the first two in each class are special cases of the others;
*recvfrom* and *sendto* probably should have been added as library
interfaces to *recvmsg* and *sendmsg*, respectively.

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

2.6.5.?Scatter/Gather I/O
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In addition to the traditional *read* and *write* system calls, 4.2BSD
introduced the ability to do scatter/gather I/O. Scatter input uses the
*readv* system call to allow a single read to be placed in several
different buffers. Conversely, the *writev* system call allows several
different buffers to be written in a single atomic write. Instead of
passing a single buffer and length parameter, as is done with *read* and
*write*, the process passes in a pointer to an array of buffers and
lengths, along with a count describing the size of the array.

This facility allows buffers in different parts of a process address
space to be written atomically, without the need to copy them to a
single contiguous buffer. Atomic writes are necessary in the case where
the underlying abstraction is record based, such as tape drives that
output a tape block on each write request. It is also convenient to be
able to read a single request into several different buffers (such as a
record header into one place and the data into another). Although an
application can simulate the ability to scatter data by reading the data
into a large buffer and then copying the pieces to their intended
destinations, the cost of memory-to-memory copying in such cases often
would more than double the running time of the affected application.

Just as *send* and *recv* could have been implemented as library
interfaces to *sendto* and *recvfrom*, it also would have been possible
to simulate *read* with *readv* and *write* with *writev*. However,
*read* and *write* are used so much more frequently that the added cost
of simulating them would not have been worthwhile.

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

2.6.6.?Multiple Filesystem Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With the expansion of network computing, it became desirable to support
both local and remote filesystems. To simplify the support of multiple
filesystems, the developers added a new virtual node or *vnode*
interface to the kernel. The set of operations exported from the vnode
interface appear much like the filesystem operations previously
supported by the local filesystem. However, they may be supported by a
wide range of filesystem types:

.. raw:: html

   <div class="itemizedlist">

-  Local disk-based filesystems

-  Files imported using a variety of remote filesystem protocols

-  Read-only CD-ROM filesystems

-  Filesystems providing special-purpose interfaces -- for example, the
   ``/proc`` filesystem

.. raw:: html

   </div>

A few variants of 4.4BSD, such as FreeBSD, allow filesystems to be
loaded dynamically when the filesystems are first referenced by the
*mount* system call. The vnode interface is described in Section 6.5;
its ancillary support routines are described in Section 6.6; several of
the special-purpose filesystems are described in Section 6.7.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+--------------------------+------------------------------------------+
| `Prev <overview-memory-management.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-filesystem.html>`__   |
+-----------------------------------------------+--------------------------+------------------------------------------+
| 2.5.?Memory Management?                       | `Home <index.html>`__    | ?2.7.?Filesystems                        |
+-----------------------------------------------+--------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
