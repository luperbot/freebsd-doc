================================
10.6.?Debugging a Console Driver
================================

.. raw:: html

   <div class="navheader">

10.6.?Debugging a Console Driver
`Prev <kerneldebug-online-gdb.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <kerneldebug-deadlocks.html>`__

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

10.6.?Debugging a Console Driver
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since you need a console driver to run DDB on, things are more
complicated if the console driver itself is failing. You might remember
the use of a serial console (either with modified boot blocks, or by
specifying ``-h`` at the ``Boot:`` prompt), and hook up a standard
terminal onto your first serial port. DDB works on any configured
console driver, including a serial console.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+-----------------------------+--------------------------------------------+
| `Prev <kerneldebug-online-gdb.html>`__?            | `Up <kerneldebug.html>`__   | ?\ `Next <kerneldebug-deadlocks.html>`__   |
+----------------------------------------------------+-----------------------------+--------------------------------------------+
| 10.5.?On-Line Kernel Debugging Using Remote GDB?   | `Home <index.html>`__       | ?10.7.?Debugging Deadlocks                 |
+----------------------------------------------------+-----------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
