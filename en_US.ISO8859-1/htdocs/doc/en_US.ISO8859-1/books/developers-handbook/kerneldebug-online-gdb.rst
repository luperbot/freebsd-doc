===============================================
10.5.?On-Line Kernel Debugging Using Remote GDB
===============================================

.. raw:: html

   <div class="navheader">

10.5.?On-Line Kernel Debugging Using Remote GDB
`Prev <kerneldebug-online-ddb.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <kerneldebug-console.html>`__

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

10.5.?On-Line Kernel Debugging Using Remote GDB
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This feature has been supported since FreeBSD 2.2, and it is actually a
very neat one.

GDB has already supported *remote debugging* for a long time. This is
done using a very simple protocol along a serial line. Unlike the other
methods described above, you will need two machines for doing this. One
is the host providing the debugging environment, including all the
sources, and a copy of the kernel binary with all the symbols in it, and
the other one is the target machine that simply runs a similar copy of
the very same kernel (but stripped of the debugging information).

You should configure the kernel in question with ``config     -g`` if
building the “traditional” way. If building the “new” way, make sure
that ``makeoptions DEBUG=-g`` is in the configuration. In both cases,
include ``DDB`` in the configuration, and compile it as usual. This
gives a large binary, due to the debugging information. Copy this kernel
to the target machine, strip the debugging symbols off with
``strip -x``, and boot it using the ``-d`` boot option. Connect the
serial line of the target machine that has "flags 080" set on its uart
device to any serial line of the debugging host. See
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4>`__
for information on how to set the flags on an uart device. Now, on the
debugging machine, go to the compile directory of the target kernel, and
start ``gdb``:

.. code:: screen

    % kgdb kernel
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for details.
    GDB 4.16 (i386-unknown-freebsd),
    Copyright 1996 Free Software Foundation, Inc...
    (kgdb) 

Initialize the remote debugging session (assuming the first serial port
is being used) by:

.. code:: screen

    (kgdb) target remote /dev/cuau0

Now, on the target host (the one that entered DDB right before even
starting the device probe), type:

.. code:: screen

    Debugger("Boot flags requested debugger")
    Stopped at Debugger+0x35: movb  $0, edata+0x51bc
    db> gdb

DDB will respond with:

.. code:: screen

    Next trap will enter GDB remote protocol mode

Every time you type ``gdb``, the mode will be toggled between remote GDB
and local DDB. In order to force a next trap immediately, simply type
``s`` (step). Your hosting GDB will now gain control over the target
kernel:

.. code:: screen

    Remote debugging using /dev/cuau0
    Debugger (msg=0xf01b0383 "Boot flags requested debugger")
        at ../../i386/i386/db_interface.c:257
    (kgdb)

You can use this session almost as any other GDB session, including full
access to the source, running it in gud-mode inside an Emacs window
(which gives you an automatic source code display in another Emacs
window), etc.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-----------------------------+------------------------------------------+
| `Prev <kerneldebug-online-ddb.html>`__?     | `Up <kerneldebug.html>`__   | ?\ `Next <kerneldebug-console.html>`__   |
+---------------------------------------------+-----------------------------+------------------------------------------+
| 10.4.?On-Line Kernel Debugging Using DDB?   | `Home <index.html>`__       | ?10.6.?Debugging a Console Driver        |
+---------------------------------------------+-----------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
