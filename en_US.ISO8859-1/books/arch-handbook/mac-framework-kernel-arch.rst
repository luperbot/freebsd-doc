======================================
6.5.?MAC Framework Kernel Architecture
======================================

.. raw:: html

   <div class="navheader">

6.5.?MAC Framework Kernel Architecture
`Prev <mac-background.html>`__?
Chapter?6.?The TrustedBSD MAC Framework
?\ `Next <mac-policy-architecture.html>`__

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

6.5.?MAC Framework Kernel Architecture
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TrustedBSD MAC Framework permits kernel modules to extend the
operating system security policy, as well as providing infrastructure
functionality required by many access control modules. If multiple
policies are simultaneously loaded, the MAC Framework will usefully (for
some definition of useful) compose the results of the policies.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.5.1.?Kernel Elements
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The MAC Framework contains a number of kernel elements:

.. raw:: html

   <div class="itemizedlist">

-  Framework management interfaces

-  Concurrency and synchronization primitives.

-  Policy registration

-  Extensible security label for kernel objects

-  Policy entry point composition operators

-  Label management primitives

-  Entry point API invoked by kernel services

-  Entry point API to policy modules

-  Entry points implementations (policy life cycle, object life
   cycle/label management, access control checks).

-  Policy-agnostic label-management system calls

-  ``mac_syscall()`` multiplex system call

-  Various security policies implemented as MAC policy modules

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

6.5.2.?Framework Management Interfaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TrustedBSD MAC Framework may be directly managed using sysctl's,
loader tunables, and system calls.

In most cases, sysctl's and loader tunables of the same name modify the
same parameters, and control behavior such as enforcement of protections
relating to various kernel subsystems. In addition, if MAC debugging
support is compiled into the kernel, several counters will be maintained
tracking label allocation. It is generally advisable that per-subsystem
enforcement controls not be used to control policy behavior in
production environments, as they broadly impact the operation of all
active policies. Instead, per-policy controls should be preferred, as
they provide greater granularity and greater operational consistency for
policy modules.

Loading and unloading of policy modules is performed using the system
module management system calls and other system interfaces, including
boot loader variables; policy modules will have the opportunity to
influence load and unload events, including preventing undesired
unloading of the policy.

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

6.5.3.?Policy List Concurrency and Synchronization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As the set of active policies may change at run-time, and the invocation
of entry points is non-atomic, synchronization is required to prevent
loading or unloading of policies while an entry point invocation is in
progress, freezing the set of active policies for the duration. This is
accomplished by means of a framework busy count: whenever an entry point
is entered, the busy count is incremented; whenever it is exited, the
busy count is decremented. While the busy count is elevated, policy list
changes are not permitted, and threads attempting to modify the policy
list will sleep until the list is not busy. The busy count is protected
by a mutex, and a condition variable is used to wake up sleepers waiting
on policy list modifications. One side effect of this synchronization
model is that recursion into the MAC Framework from within a policy
module is permitted, although not generally used.

Various optimizations are used to reduce the overhead of the busy count,
including avoiding the full cost of incrementing and decrementing if the
list is empty or contains only static entries (policies that are loaded
before the system starts, and cannot be unloaded). A compile-time option
is also provided which prevents any change in the set of loaded policies
at run-time, which eliminates the mutex locking costs associated with
supporting dynamically loaded and unloaded policies as synchronization
is no longer required.

As the MAC Framework is not permitted to block in some entry points, a
normal sleep lock cannot be used; as a result, it is possible for the
load or unload attempt to block for a substantial period of time waiting
for the framework to become idle.

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

6.5.4.?Label Synchronization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As kernel objects of interest may generally be accessed from more than
one thread at a time, and simultaneous entry of more than one thread
into the MAC Framework is permitted, security attribute storage
maintained by the MAC Framework is carefully synchronized. In general,
existing kernel synchronization on kernel object data is used to protect
MAC Framework security labels on the object: for example, MAC labels on
sockets are protected using the existing socket mutex. Likewise,
semantics for concurrent access are generally identical to those of the
container objects: for credentials, copy-on-write semantics are
maintained for label contents as with the remainder of the credential
structure. The MAC Framework asserts necessary locks on objects when
invoked with an object reference. Policy authors must be aware of these
synchronization semantics, as they will sometimes limit the types of
accesses permitted on labels: for example, when a read-only reference to
a credential is passed to a policy via an entry point, only read
operations are permitted on the label state attached to the credential.

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

6.5.5.?Policy Synchronization and Concurrency
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Policy modules must be written to assume that many kernel threads may
simultaneously enter one more policy entry points due to the parallel
and preemptive nature of the FreeBSD kernel. If the policy module makes
use of mutable state, this may require the use of synchronization
primitives within the policy to prevent inconsistent views on that state
resulting in incorrect operation of the policy. Policies will generally
be able to make use of existing FreeBSD synchronization primitives for
this purpose, including mutexes, sleep locks, condition variables, and
counting semaphores. However, policies should be written to employ these
primitives carefully, respecting existing kernel lock orders, and
recognizing that some entry points are not permitted to sleep, limiting
the use of primitives in those entry points to mutexes and wakeup
operations.

When policy modules call out to other kernel subsystems, they will
generally need to release any in-policy locks in order to avoid
violating the kernel lock order or risking lock recursion. This will
maintain policy locks as leaf locks in the global lock order, helping to
avoid deadlock.

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

6.5.6.?Policy Registration
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The MAC Framework maintains two lists of active policies: a static list,
and a dynamic list. The lists differ only with regards to their locking
semantics: an elevated reference count is not required to make use of
the static list. When kernel modules containing MAC Framework policies
are loaded, the policy module will use ``SYSINIT`` to invoke a
registration function; when a policy module is unloaded, ``SYSINIT``
will likewise invoke a de-registration function. Registration may fail
if a policy module is loaded more than once, if insufficient resources
are available for the registration (for example, the policy might
require labeling and insufficient labeling state might be available), or
other policy prerequisites might not be met (some policies may only be
loaded prior to boot). Likewise, de-registration may fail if a policy is
flagged as not unloadable.

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

6.5.7.?Entry Points
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kernel services interact with the MAC Framework in two ways: they invoke
a series of APIs to notify the framework of relevant events, and they
provide a policy-agnostic label structure pointer in security-relevant
objects. The label pointer is maintained by the MAC Framework via label
management entry points, and permits the Framework to offer a labeling
service to policy modules through relatively non-invasive changes to the
kernel subsystem maintaining the object. For example, label pointers
have been added to processes, process credentials, sockets, pipes,
vnodes, Mbufs, network interfaces, IP reassembly queues, and a variety
of other security-relevant structures. Kernel services also invoke the
MAC Framework when they perform important security decisions, permitting
policy modules to augment those decisions based on their own criteria
(possibly including data stored in security labels). Most of these
security critical decisions will be explicit access control checks;
however, some affect more general decision functions such as packet
matching for sockets and label transition at program execution.

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

6.5.8.?Policy Composition
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When more than one policy module is loaded into the kernel at a time,
the results of the policy modules will be composed by the framework
using a composition operator. This operator is currently hard-coded, and
requires that all active policies must approve a request for it to
return success. As policies may return a variety of error conditions
(success, access denied, object does not exist, ...), a precedence
operator selects the resulting error from the set of errors returned by
policies. In general, errors indicating that an object does not exist
will be preferred to errors indicating that access to an object is
denied. While it is not guaranteed that the resulting composition will
be useful or secure, we have found that it is for many useful selections
of policies. For example, traditional trusted systems often ship with
two or more policies using a similar composition.

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

6.5.9.?Labeling Support
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As many interesting access control extensions rely on security labels on
objects, the MAC Framework provides a set of policy-agnostic label
management system calls covering a variety of user-exposed objects.
Common label types include partition identifiers, sensitivity labels,
integrity labels, compartments, domains, roles, and types. By policy
agnostic, we mean that policy modules are able to completely define the
semantics of meta-data associated with an object. Policy modules
participate in the internalization and externalization of string-based
labels provides by user applications, and can expose multiple label
elements to applications if desired.

In-memory labels are stored in slab-allocated ``struct     label``,
which consists of a fixed-length array of unions, each holding a
``void *`` pointer and a ``long``. Policies registering for label
storage will be assigned a "slot" identifier, which may be used to
dereference the label storage. The semantics of the storage are left
entirely up to the policy module: modules are provided with a variety of
entry points associated with the kernel object life cycle, including
initialization, association/creation, and destruction. Using these
interfaces, it is possible to implement reference counting and other
storage models. Direct access to the object structure is generally not
required by policy modules to retrieve a label, as the MAC Framework
generally passes both a pointer to the object and a direct pointer to
the object's label into entry points. The primary exception to this rule
is the process credential, which must be manually dereferenced to access
the credential label. This may change in future revisions of the MAC
Framework.

Initialization entry points frequently include a sleeping disposition
flag indicating whether or not an initialization is permitted to sleep;
if sleeping is not permitted, a failure may be returned to cancel
allocation of the label (and hence object). This may occur, for example,
in the network stack during interrupt handling, where sleeping is not
permitted, or while the caller holds a mutex. Due to the performance
cost of maintaining labels on in-flight network packets (Mbufs),
policies must specifically declare a requirement that Mbuf labels be
allocated. Dynamically loaded policies making use of labels must be able
to handle the case where their init function has not been called on an
object, as objects may already exist when the policy is loaded. The MAC
Framework guarantees that uninitialized label slots will hold a 0 or
NULL value, which policies may use to detect uninitialized values.
However, as allocation of Mbuf labels is conditional, policies must also
be able to handle a NULL label pointer for Mbufs if they have been
loaded dynamically.

In the case of file system labels, special support is provided for the
persistent storage of security labels in extended attributes. Where
available, extended attribute transactions are used to permit consistent
compound updates of security labels on vnodes--currently this support is
present only in the UFS2 file system. Policy authors may choose to
implement multilabel file system object labels using one (or more)
extended attributes. For efficiency reasons, the vnode label
(``v_label``) is a cache of any on-disk label; policies are able to load
values into the cache when the vnode is instantiated, and update the
cache as needed. As a result, the extended attribute need not be
directly accessed with every access control check.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Currently, if a labeled policy permits dynamic unloading, its state slot
cannot be reclaimed, which places a strict (and relatively low) bound on
the number of unload-reload operations for labeled policies.

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

6.5.10.?System Calls
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The MAC Framework implements a number of system calls: most of these
calls support the policy-agnostic label retrieval and manipulation APIs
exposed to user applications.

The label management calls accept a label description structure,
``struct mac``, which contains a series of MAC label elements. Each
element contains a character string name, and character string value.
Each policy will be given the chance to claim a particular element name,
permitting policies to expose multiple independent elements if desired.
Policy modules perform the internalization and externalization between
kernel labels and user-provided labels via entry points, permitting a
variety of semantics. Label management system calls are generally
wrapped by user library functions to perform memory allocation and error
handling, simplifying user applications that must manage labels.

The following MAC-related system calls are present in the FreeBSD
kernel:

.. raw:: html

   <div class="itemizedlist">

-  ``mac_get_proc()`` may be used to retrieve the label of the current
   process.

-  ``mac_set_proc()`` may be used to request a change in the label of
   the current process.

-  ``mac_get_fd()`` may be used to retrieve the label of an object
   (file, socket, pipe, ...) referenced by a file descriptor.

-  ``mac_get_file()`` may be used to retrieve the label of an object
   referenced by a file system path.

-  ``mac_set_fd()`` may be used to request a change in the label of an
   object (file, socket, pipe, ...) referenced by a file descriptor.

-  ``mac_set_file()`` may be used to request a change in the label of an
   object referenced by a file system path.

-  ``mac_syscall()`` permits policy modules to create new system calls
   without modifying the system call table; it accepts a target policy
   name, operation number, and opaque argument for use by the policy.

-  ``mac_get_pid()`` may be used to request the label of another process
   by process id.

-  ``mac_get_link()`` is identical to ``mac_get_file()``, only it will
   not follow a symbolic link if it is the final entry in the path, so
   may be used to retrieve the label on a symlink.

-  ``mac_set_link()`` is identical to ``mac_set_file()``, only it will
   not follow a symbolic link if it is the final entry in a path, so may
   be used to manipulate the label on a symlink.

-  ``mac_execve()`` is identical to the ``execve()`` system call, only
   it also accepts a requested label to set the process label to when
   beginning execution of a new program. This change in label on
   execution is referred to as a "transition".

-  ``mac_get_peer()``, actually implemented via a socket option,
   retrieves the label of a remote peer on a socket, if available.

.. raw:: html

   </div>

In addition to these system calls, the ``SIOCSIGMAC`` and ``SIOCSIFMAC``
network interface ioctls permit the labels on network interfaces to be
retrieved and set.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+----------------------------------------------+
| `Prev <mac-background.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-policy-architecture.html>`__   |
+-----------------------------------+-------------------------+----------------------------------------------+
| 6.4.?Policy Background?           | `Home <index.html>`__   | ?6.6.?MAC Policy Architecture                |
+-----------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
