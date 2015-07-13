==============
2.6.?Debugging
==============

.. raw:: html

   <div class="navheader">

2.6.?Debugging
`Prev <tools-make.html>`__?
Chapter?2.?Programming Tools
?\ `Next <emacs.html>`__

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

2.6.?Debugging
--------------

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

2.6.1.?The Debugger
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The debugger that comes with FreeBSD is called ``gdb`` (GNU debugger).
You start it up by typing

.. code:: screen

    % gdb progname

although many people prefer to run it inside Emacs. You can do this by:

.. code:: screen

    M-x gdb RET progname RET

Using a debugger allows you to run the program under more controlled
circumstances. Typically, you can step through the program a line at a
time, inspect the value of variables, change them, tell the debugger to
run up to a certain point and then stop, and so on. You can even attach
to a program that is already running, or load a core file to investigate
why the program crashed. It is even possible to debug the kernel, though
that is a little trickier than the user applications we will be
discussing in this section.

``gdb`` has quite good on-line help, as well as a set of info pages, so
this section will concentrate on a few of the basic commands.

Finally, if you find its text-based command-prompt style off-putting,
there is a graphical front-end for it
(`devel/xxgdb <http://www.freebsd.org/cgi/url.cgi?ports/devel/xxgdb/pkg-descr>`__)
in the Ports Collection.

This section is intended to be an introduction to using ``gdb`` and does
not cover specialized topics such as debugging the kernel.

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

2.6.2.?Running a program in the debugger
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You will need to have compiled the program with the ``-g`` option to get
the most out of using ``gdb``. It will work without, but you will only
see the name of the function you are in, instead of the source code. If
you see a line like:

.. code:: screen

    … (no debugging symbols found) …

when ``gdb`` starts up, you will know that the program was not compiled
with the ``-g`` option.

At the ``gdb`` prompt, type **``break main``**. This will tell the
debugger that you are not interested in watching the preliminary set-up
code in the program being run, and that it should stop execution at the
beginning of your code. Now type **``run``** to start the program—it
will start at the beginning of the set-up code and then get stopped by
the debugger when it calls ``main()``. (If you have ever wondered where
``main()`` gets called from, now you know!).

You can now step through the program, a line at a time, by pressing
``n``. If you get to a function call, you can step into it by pressing
``s``. Once you are in a function call, you can return from stepping
into a function call by pressing ``f``. You can also use ``up`` and
``down`` to take a quick look at the caller.

Here is a simple example of how to spot a mistake in a program with
``gdb``. This is our program (with a deliberate mistake):

.. code:: programlisting

    #include <stdio.h>

    int bazz(int anint);

    main() {
        int i;

        printf("This is my program\n");
        bazz(i);
        return 0;
    }

    int bazz(int anint) {
        printf("You gave me %d\n", anint);
        return anint;
    }

This program sets i to be ``5`` and passes it to a function ``bazz()``
which prints out the number we gave it.

When we compile and run the program we get

.. code:: screen

    % cc -g -o temp temp.c
    % ./temp
    This is my program
    anint = 4231

That was not what we expected! Time to see what is going on!

.. code:: screen

    % gdb temp
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for details.
    GDB 4.13 (i386-unknown-freebsd), Copyright 1994 Free Software Foundation, Inc.
    (gdb) break main                Skip the set-up code
    Breakpoint 1 at 0x160f: file temp.c, line 9.    gdb puts breakpoint at main()
    (gdb) run                   Run as far as main()
    Starting program: /home/james/tmp/temp      Program starts running

    Breakpoint 1, main () at temp.c:9       gdb stops at main()
    (gdb) n                     Go to next line
    This is my program              Program prints out
    (gdb) s                     step into bazz()
    bazz (anint=4231) at temp.c:17          gdb displays stack frame
    (gdb)

Hang on a minute! How did anint get to be ``4231``? Did we not we set it
to be ``5`` in ``main()``? Let's move up to ``main()`` and have a look.

.. code:: screen

    (gdb) up                    Move up call stack
    #1  0x1625 in main () at temp.c:11      gdb displays stack frame
    (gdb) p i                   Show us the value of i
    $1 = 4231                   gdb displays 4231

Oh dear! Looking at the code, we forgot to initialize i. We meant to put

.. code:: programlisting

    …
    main() {
        int i;

        i = 5;
        printf("This is my program\n");
    …

but we left the ``i=5;`` line out. As we did not initialize i, it had
whatever number happened to be in that area of memory when the program
ran, which in this case happened to be ``4231``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``gdb`` displays the stack frame every time we go into or out of a
function, even if we are using ``up`` and ``down`` to move around the
call stack. This shows the name of the function and the values of its
arguments, which helps us keep track of where we are and what is going
on. (The stack is a storage area where the program stores information
about the arguments passed to functions and where to go when it returns
from a function call).

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

2.6.3.?Examining a core file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A core file is basically a file which contains the complete state of the
process when it crashed. In “the good old days”, programmers had to
print out hex listings of core files and sweat over machine code
manuals, but now life is a bit easier. Incidentally, under FreeBSD and
other 4.4BSD systems, a core file is called ``progname``.core instead of
just ``core``, to make it clearer which program a core file belongs to.

To examine a core file, start up ``gdb`` in the usual way. Instead of
typing ``break`` or ``run``, type

.. code:: screen

    (gdb) core progname.core

If you are not in the same directory as the core file, you will have to
do **``dir       /path/to/core/file``** first.

You should see something like this:

.. code:: screen

    % gdb a.out
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for details.
    GDB 4.13 (i386-unknown-freebsd), Copyright 1994 Free Software Foundation, Inc.
    (gdb) core a.out.core
    Core was generated by `a.out'.
    Program terminated with signal 11, Segmentation fault.
    Cannot access memory at address 0x7020796d.
    #0  0x164a in bazz (anint=0x5) at temp.c:17
    (gdb)

In this case, the program was called ``a.out``, so the core file is
called ``a.out.core``. We can see that the program crashed due to trying
to access an area in memory that was not available to it in a function
called ``bazz``.

Sometimes it is useful to be able to see how a function was called, as
the problem could have occurred a long way up the call stack in a
complex program. The ``bt`` command causes ``gdb`` to print out a
back-trace of the call stack:

.. code:: screen

    (gdb) bt
    #0  0x164a in bazz (anint=0x5) at temp.c:17
    #1  0xefbfd888 in end ()
    #2  0x162c in main () at temp.c:11
    (gdb)

The ``end()`` function is called when a program crashes; in this case,
the ``bazz()`` function was called from ``main()``.

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

2.6.4.?Attaching to a running program
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the neatest features about ``gdb`` is that it can attach to a
program that is already running. Of course, that assumes you have
sufficient permissions to do so. A common problem is when you are
stepping through a program that forks, and you want to trace the child,
but the debugger will only let you trace the parent.

What you do is start up another ``gdb``, use ``ps`` to find the process
ID for the child, and do

.. code:: screen

    (gdb) attach pid

in ``gdb``, and then debug as usual.

“That is all very well,” you are probably thinking, “but by the time I
have done that, the child process will be over the hill and far away”.
Fear not, gentle reader, here is how to do it (courtesy of the ``gdb``
info pages):

.. code:: screen

    …
    if ((pid = fork()) < 0)      /* _Always_ check this */
        error();
    else if (pid == 0) {        /* child */
        int PauseMode = 1;

        while (PauseMode)
            sleep(10);  /* Wait until someone attaches to us */
        …
    } else {            /* parent */
        …

Now all you have to do is attach to the child, set PauseMode to ``0``,
and wait for the ``sleep()`` call to return!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+--------------------------------------------------+
| `Prev <tools-make.html>`__?   | `Up <tools.html>`__     | ?\ `Next <emacs.html>`__                         |
+-------------------------------+-------------------------+--------------------------------------------------+
| 2.5.?Make?                    | `Home <index.html>`__   | ?2.7.?Using Emacs as a Development Environment   |
+-------------------------------+-------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
