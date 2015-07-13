======================
4.?On GEOM Programming
======================

.. raw:: html

   <div class="navheader">

4.?On GEOM Programming
`Prev <kernelprog.html>`__?
?
?

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

4.?On GEOM Programming
----------------------

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

4.1.?Ggate
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If maximum performance is not needed, a much simpler way of making a
data transformation is to implement it in userland via the ggate (GEOM
gate) facility. Unfortunately, there is no easy way to convert between,
or even share code between the two approaches.

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

4.2.?GEOM Class
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GEOM classes are transformations on the data. These transformations can
be combined in a tree-like fashion. Instances of GEOM classes are called
*geoms*.

Each GEOM class has several “class methods” that get called when there
is no geom instance available (or they are simply not bound to a single
instance):

.. raw:: html

   <div class="itemizedlist">

-  ``.init`` is called when GEOM becomes aware of a GEOM class (when the
   kernel module gets loaded.)

-  ``.fini`` gets called when GEOM abandons the class (when the module
   gets unloaded)

-  ``.taste`` is called next, once for each provider the system has
   available. If applicable, this function will usually create and start
   a geom instance.

-  ``.destroy_geom`` is called when the geom should be disbanded

-  ``.ctlconf`` is called when user requests reconfiguration of existing
   geom

.. raw:: html

   </div>

Also defined are the GEOM event functions, which will get copied to the
geom instance.

Field ``.geom`` in the ``g_class`` structure is a LIST of geoms
instantiated from the class.

These functions are called from the g\_event kernel thread.

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

4.3.?Softc
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The name “softc” is a legacy term for “driver private data”. The name
most probably comes from the archaic term “software control block”. In
GEOM, it is a structure (more precise: pointer to a structure) that can
be attached to a geom instance to hold whatever data is private to the
geom instance. Most GEOM classes have the following members:

.. raw:: html

   <div class="itemizedlist">

-  ``struct g_provider *provider`` : The “provider” this geom
   instantiates

-  ``uint16_t n_disks`` : Number of consumer this geom consumes

-  ``struct g_consumer **disks`` : Array of ``struct g_consumer*``. (It
   is not possible to use just single indirection because struct
   g\_consumer\* are created on our behalf by GEOM).

.. raw:: html

   </div>

The ``softc`` structure contains all the state of geom instance. Every
geom instance has its own softc.

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

4.4.?Metadata
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Format of metadata is more-or-less class-dependent, but MUST start with:

.. raw:: html

   <div class="itemizedlist">

-  16 byte buffer for null-terminated signature (usually the class name)

-  uint32 version ID

.. raw:: html

   </div>

It is assumed that geom classes know how to handle metadata with version
ID's lower than theirs.

Metadata is located in the last sector of the provider (and thus must
fit in it).

(All this is implementation-dependent but all existing code works like
that, and it is supported by libraries.)

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

4.5.?Labeling/creating a GEOM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The sequence of events is:

.. raw:: html

   <div class="itemizedlist">

-  user calls
   `geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
   utility (or one of its hardlinked friends)

-  the utility figures out which geom class it is supposed to handle and
   searches for ``geom_CLASSNAME``.so library (usually in
   ``/lib/geom``).

-  it
   `dlopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=dlopen&sektion=3>`__-s
   the library, extracts the definitions of command-line parameters and
   helper functions.

.. raw:: html

   </div>

In the case of creating/labeling a new geom, this is what happens:

.. raw:: html

   <div class="itemizedlist">

-  `geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8>`__
   looks in the command-line argument for the command (usually
   ``label``), and calls a helper function.

-  The helper function checks parameters and gathers metadata, which it
   proceeds to write to all concerned providers.

-  This “spoils” existing geoms (if any) and initializes a new round of
   “tasting” of the providers. The intended geom class recognizes the
   metadata and brings the geom up.

.. raw:: html

   </div>

(The above sequence of events is implementation-dependent but all
existing code works like that, and it is supported by libraries.)

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

4.6.?GEOM Command Structure
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The helper ``geom_CLASSNAME.so`` library exports ``class_commands``
structure, which is an array of ``struct g_command`` elements. Commands
are of uniform format and look like:

.. code:: programlisting

      verb [-options] geomname [other]

Common verbs are:

.. raw:: html

   <div class="itemizedlist">

-  label — to write metadata to devices so they can be recognized at
   tasting and brought up in geoms

-  destroy — to destroy metadata, so the geoms get destroyed

.. raw:: html

   </div>

Common options are:

.. raw:: html

   <div class="itemizedlist">

-  ``-v`` : be verbose

-  ``-f`` : force

.. raw:: html

   </div>

Many actions, such as labeling and destroying metadata can be performed
in userland. For this, ``struct g_command`` provides field ``gc_func``
that can be set to a function (in the same ``.so``) that will be called
to process a verb. If ``gc_func`` is NULL, the command will be passed to
kernel module, to ``.ctlreq`` function of the geom class.

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

4.7.?Geoms
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Geoms are instances of GEOM classes. They have internal data (a softc
structure) and some functions with which they respond to external
events.

The event functions are:

.. raw:: html

   <div class="itemizedlist">

-  ``.access`` : calculates permissions (read/write/exclusive)

-  ``.dumpconf`` : returns XML-formatted information about the geom

-  ``.orphan`` : called when some underlying provider gets disconnected

-  ``.spoiled`` : called when some underlying provider gets written to

-  ``.start`` : handles I/O

.. raw:: html

   </div>

These functions are called from the ``g_down`` kernel thread and there
can be no sleeping in this context, (see definition of sleeping
elsewhere) which limits what can be done quite a bit, but forces the
handling to be fast.

Of these, the most important function for doing actual useful work is
the ``.start``\ () function, which is called when a BIO request arrives
for a provider managed by a instance of geom class.

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

4.8.?GEOM Threads
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are three kernel threads created and run by the GEOM framework:

.. raw:: html

   <div class="itemizedlist">

-  ``g_down`` : Handles requests coming from high-level entities (such
   as a userland request) on the way to physical devices

-  ``g_up`` : Handles responses from device drivers to requests made by
   higher-level entities

-  ``g_event`` : Handles all other cases: creation of geom instances,
   access counting, “spoil” events, etc.

.. raw:: html

   </div>

When a user process issues “read data X at offset Y of a file” request,
this is what happens:

.. raw:: html

   <div class="itemizedlist">

-  The filesystem converts the request into a struct bio instance and
   passes it to the GEOM subsystem. It knows what geom instance should
   handle it because filesystems are hosted directly on a geom instance.

-  The request ends up as a call to the ``.start``\ () function made on
   the g\_down thread and reaches the top-level geom instance.

-  This top-level geom instance (for example the partition slicer)
   determines that the request should be routed to a lower-level
   instance (for example the disk driver). It makes a copy of the bio
   request (bio requests *ALWAYS* need to be copied between instances,
   with ``g_clone_bio``\ ()!), modifies the data offset and target
   provider fields and executes the copy with ``g_io_request``\ ()

-  The disk driver gets the bio request also as a call to ``.start``\ ()
   on the ``g_down`` thread. It talks to hardware, gets the data back,
   and calls ``g_io_deliver``\ () on the bio.

-  Now, the notification of bio completion “bubbles up” in the ``g_up``
   thread. First the partition slicer gets ``.done``\ () called in the
   ``g_up`` thread, it uses information stored in the bio to free the
   cloned ``bio`` structure (with ``g_destroy_bio``\ ()) and calls
   ``g_io_deliver``\ () on the original request.

-  The filesystem gets the data and transfers it to userland.

.. raw:: html

   </div>

See
`g\_bio(9) <http://www.FreeBSD.org/cgi/man.cgi?query=g_bio&sektion=9>`__
man page for information how the data is passed back and forth in the
``bio`` structure (note in particular the ``bio_parent`` and
``bio_children`` fields and how they are handled).

One important feature is: *THERE CAN BE NO SLEEPING IN G\_UP AND G\_DOWN
THREADS*. This means that none of the following things can be done in
those threads (the list is of course not complete, but only
informative):

.. raw:: html

   <div class="itemizedlist">

-  Calls to ``msleep``\ () and ``tsleep``\ (), obviously.

-  Calls to ``g_write_data``\ () and ``g_read_data``\ (), because these
   sleep between passing the data to consumers and returning.

-  Waiting for I/O.

-  Calls to
   `malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
   and ``uma_zalloc``\ () with ``M_WAITOK`` flag set

-  sx and other sleepable locks

.. raw:: html

   </div>

This restriction is here to stop GEOM code clogging the I/O request
path, since sleeping is usually not time-bound and there can be no
guarantees on how long will it take (there are some other, more
technical reasons also). It also means that there is not much that can
be done in those threads; for example, almost any complex thing requires
memory allocation. Fortunately, there is a way out: creating additional
kernel threads.

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

4.9.?Kernel Threads for Use in GEOM Code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kernel threads are created with
`kthread\_create(9) <http://www.FreeBSD.org/cgi/man.cgi?query=kthread_create&sektion=9>`__
function, and they are sort of similar to userland threads in behaviour,
only they cannot return to caller to signify termination, but must call
`kthread\_exit(9) <http://www.FreeBSD.org/cgi/man.cgi?query=kthread_exit&sektion=9>`__.

In GEOM code, the usual use of threads is to offload processing of
requests from ``g_down`` thread (the ``.start``\ () function). These
threads look like “event handlers”: they have a linked list of event
associated with them (on which events can be posted by various functions
in various threads so it must be protected by a mutex), take the events
from the list one by one and process them in a big ``switch``\ ()
statement.

The main benefit of using a thread to handle I/O requests is that it can
sleep when needed. Now, this sounds good, but should be carefully
thought out. Sleeping is well and very convenient but can very
effectively destroy performance of the geom transformation. Extremely
performance-sensitive classes probably should do all the work in
``.start``\ () function call, taking great care to handle out-of-memory
and similar errors.

The other benefit of having a event-handler thread like that is to
serialize all the requests and responses coming from different geom
threads into one thread. This is also very convenient but can be slow.
In most cases, handling of ``.done``\ () requests can be left to the
``g_up`` thread.

Mutexes in FreeBSD kernel (see
`mutex(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mutex&sektion=9>`__)
have one distinction from their more common userland cousins — the code
cannot sleep while holding a mutex). If the code needs to sleep a lot,
`sx(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sx&sektion=9>`__ locks
may be more appropriate. On the other hand, if you do almost everything
in a single thread, you may get away with no mutexes at all.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-----+
| `Prev <kernelprog.html>`__?         | ?                       | ?   |
+-------------------------------------+-------------------------+-----+
| 3.?On FreeBSD Kernel Programming?   | `Home <index.html>`__   | ?   |
+-------------------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
