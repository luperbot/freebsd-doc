=====================================
10.3.?Debugging a Crash Dump with DDD
=====================================

.. raw:: html

   <div class="navheader">

10.3.?Debugging a Crash Dump with DDD
`Prev <kerneldebug-gdb.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <kerneldebug-online-ddb.html>`__

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

10.3.?Debugging a Crash Dump with DDD
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Examining a kernel crash dump with a graphical debugger like ``ddd`` is
also possible (you will need to install the
`devel/ddd <http://www.freebsd.org/cgi/url.cgi?ports/devel/ddd/pkg-descr>`__
port in order to use the ``ddd`` debugger). Add the ``-k`` option to the
``ddd`` command line you would use normally. For example;

.. code:: screen

    # ddd --debugger kgdb kernel.debug /var/crash/vmcore.0

You should then be able to go about looking at the crash dump using
``ddd``'s graphical interface.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+-----------------------------+---------------------------------------------+
| `Prev <kerneldebug-gdb.html>`__?                     | `Up <kerneldebug.html>`__   | ?\ `Next <kerneldebug-online-ddb.html>`__   |
+------------------------------------------------------+-----------------------------+---------------------------------------------+
| 10.2.?Debugging a Kernel Crash Dump with ``kgdb``?   | `Home <index.html>`__       | ?10.4.?On-Line Kernel Debugging Using DDB   |
+------------------------------------------------------+-----------------------------+---------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
