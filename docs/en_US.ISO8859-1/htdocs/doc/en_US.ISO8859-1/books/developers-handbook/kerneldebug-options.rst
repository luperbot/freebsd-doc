==============================================
10.9.?Glossary of Kernel Options for Debugging
==============================================

.. raw:: html

   <div class="navheader">

10.9.?Glossary of Kernel Options for Debugging
`Prev <kerneldebug-dcons.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <architectures.html>`__

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

10.9.?Glossary of Kernel Options for Debugging
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides a brief glossary of compile-time kernel options
used for debugging:

.. raw:: html

   <div class="itemizedlist">

-  ``options KDB``: compiles in the kernel debugger framework. Required
   for ``options DDB`` and ``options GDB``. Little or no performance
   overhead. By default, the debugger will be entered on panic instead
   of an automatic reboot.

-  ``options KDB_UNATTENDED``: change the default value of the
   ``debug.debugger_on_panic`` sysctl to 0, which controls whether the
   debugger is entered on panic. When ``options KDB`` is not compiled
   into the kernel, the behavior is to automatically reboot on panic;
   when it is compiled into the kernel, the default behavior is to drop
   into the debugger unless ``options KDB_UNATTENDED`` is compiled in.
   If you want to leave the kernel debugger compiled into the kernel but
   want the system to come back up unless you're on-hand to use the
   debugger for diagnostics, use this option.

-  ``options KDB_TRACE``: change the default value of the
   ``debug.trace_on_panic`` sysctl to 1, which controls whether the
   debugger automatically prints a stack trace on panic. Especially if
   running with ``options       KDB_UNATTENDED``, this can be helpful to
   gather basic debugging information on the serial or firewire console
   while still rebooting to recover.

-  ``options DDB``: compile in support for the console debugger, DDB.
   This interactive debugger runs on whatever the active low-level
   console of the system is, which includes the video console, serial
   console, or firewire console. It provides basic integrated debugging
   facilities, such as stack tracing, process and thread listing,
   dumping of lock state, VM state, file system state, and kernel memory
   management. DDB does not require software running on a second machine
   or being able to generate a core dump or full debugging kernel
   symbols, and provides detailed diagnostics of the kernel at run-time.
   Many bugs can be fully diagnosed using only DDB output. This option
   depends on ``options KDB``.

-  ``options GDB``: compile in support for the remote debugger, GDB,
   which can operate over serial cable or firewire. When the debugger is
   entered, GDB may be attached to inspect structure contents, generate
   stack traces, etc. Some kernel state is more awkward to access than
   in DDB, which is able to generate useful summaries of kernel state
   automatically, such as automatically walking lock debugging or kernel
   memory management structures, and a second machine running the
   debugger is required. On the other hand, GDB combines information
   from the kernel source and full debugging symbols, and is aware of
   full data structure definitions, local variables, and is scriptable.
   This option is not required to run GDB on a kernel core dump. This
   option depends on ``options KDB``.

-  ``options BREAK_TO_DEBUGGER``,
   ``options       ALT_BREAK_TO_DEBUGGER``: allow a break signal or
   alternative signal on the console to enter the debugger. If the
   system hangs without a panic, this is a useful way to reach the
   debugger. Due to the current kernel locking, a break signal generated
   on a serial console is significantly more reliable at getting into
   the debugger, and is generally recommended. This option has little or
   no performance impact.

-  ``options INVARIANTS``: compile into the kernel a large number of
   run-time assertion checks and tests, which constantly test the
   integrity of kernel data structures and the invariants of kernel
   algorithms. These tests can be expensive, so are not compiled in by
   default, but help provide useful "fail stop" behavior, in which
   certain classes of undesired behavior enter the debugger before
   kernel data corruption occurs, making them easier to debug. Tests
   include memory scrubbing and use-after-free testing, which is one of
   the more significant sources of overhead. This option depends on
   ``options INVARIANT_SUPPORT``.

-  ``options INVARIANT_SUPPORT``: many of the tests present in
   ``options INVARIANTS`` require modified data structures or additional
   kernel symbols to be defined.

-  ``options WITNESS``: this option enables run-time lock order tracking
   and verification, and is an invaluable tool for deadlock diagnosis.
   WITNESS maintains a graph of acquired lock orders by lock type, and
   checks the graph at each acquire for cycles (implicit or explicit).
   If a cycle is detected, a warning and stack trace are generated to
   the console, indicating that a potential deadlock might have
   occurred. WITNESS is required in order to use the ``show locks``,
   ``show       witness`` and ``show alllocks`` DDB commands. This debug
   option has significant performance overhead, which may be somewhat
   mitigated through the use of ``options       WITNESS_SKIPSPIN``.
   Detailed documentation may be found in
   `witness(4) <http://www.FreeBSD.org/cgi/man.cgi?query=witness&sektion=4>`__.

-  ``options WITNESS_SKIPSPIN``: disable run-time checking of spinlock
   lock order with WITNESS. As spin locks are acquired most frequently
   in the scheduler, and scheduler events occur often, this option can
   significantly speed up systems running with WITNESS. This option
   depends on ``options       WITNESS``.

-  ``options WITNESS_KDB``: change the default value of the
   ``debug.witness.kdb`` sysctl to 1, which causes WITNESS to enter the
   debugger when a lock order violation is detected, rather than simply
   printing a warning. This option depends on ``options WITNESS``.

-  ``options SOCKBUF_DEBUG``: perform extensive run-time consistency
   checking on socket buffers, which can be useful for debugging both
   socket bugs and race conditions in protocols and device drivers that
   interact with sockets. This option significantly impacts network
   performance, and may change the timing in device driver races.

-  ``options DEBUG_VFS_LOCKS``: track lock acquisition points for
   lockmgr/vnode locks, expanding the amount of information displayed by
   ``show lockedvnods`` in DDB. This option has a measurable performance
   impact.

-  ``options DEBUG_MEMGUARD``: a replacement for the
   `malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
   kernel memory allocator that uses the VM system to detect reads or
   writes from allocated memory after free. Details may be found in
   `memguard(9) <http://www.FreeBSD.org/cgi/man.cgi?query=memguard&sektion=9>`__.
   This option has a significant performance impact, but can be very
   helpful in debugging kernel memory corruption bugs.

-  ``options DIAGNOSTIC``: enable additional, more expensive diagnostic
   tests along the lines of ``options       INVARIANTS``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-----------------------------+------------------------------------+
| `Prev <kerneldebug-dcons.html>`__?   | `Up <kerneldebug.html>`__   | ?\ `Next <architectures.html>`__   |
+--------------------------------------+-----------------------------+------------------------------------+
| 10.8.?Kernel debugging with Dcons?   | `Home <index.html>`__       | ?Part?IV.?Architectures            |
+--------------------------------------+-----------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
