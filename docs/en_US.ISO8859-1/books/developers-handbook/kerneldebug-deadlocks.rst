=========================
10.7.?Debugging Deadlocks
=========================

.. raw:: html

   <div class="navheader">

10.7.?Debugging Deadlocks
`Prev <kerneldebug-console.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <kerneldebug-dcons.html>`__

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

10.7.?Debugging Deadlocks
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You may experience so called deadlocks, a situation where a system stops
doing useful work. To provide a helpful bug report in this situation,
use `ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__
as described in the previous section. Include the output of ``ps`` and
``trace`` for suspected processes in the report.

If possible, consider doing further investigation. The recipe below is
especially useful if you suspect that a deadlock occurs in the VFS
layer. Add these options to the kernel configuration file.

.. code:: programlisting

    makeoptions    DEBUG=-g
    options     INVARIANTS
    options     INVARIANT_SUPPORT
    options     WITNESS
    options     WITNESS_SKIPSPIN
    options     DEBUG_LOCKS
    options     DEBUG_VFS_LOCKS
    options     DIAGNOSTIC

When a deadlock occurs, in addition to the output of the ``ps`` command,
provide information from the ``show pcpu``, ``show allpcpu``,
``show locks``, ``show alllocks``, ``show lockedvnods`` and
``alltrace``.

To obtain meaningful backtraces for threaded processes, use
``thread thread-id`` to switch to the thread stack, and do a backtrace
with ``where``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-----------------------------+----------------------------------------+
| `Prev <kerneldebug-console.html>`__?   | `Up <kerneldebug.html>`__   | ?\ `Next <kerneldebug-dcons.html>`__   |
+----------------------------------------+-----------------------------+----------------------------------------+
| 10.6.?Debugging a Console Driver?      | `Home <index.html>`__       | ?10.8.?Kernel debugging with Dcons     |
+----------------------------------------+-----------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
