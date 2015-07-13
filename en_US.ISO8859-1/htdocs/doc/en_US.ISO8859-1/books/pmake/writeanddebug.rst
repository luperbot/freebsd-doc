=====================================
2.6.?Writing and Debugging a Makefile
=====================================

.. raw:: html

   <div class="navheader">

2.6.?Writing and Debugging a Makefile
`Prev <parellelism.html>`__?
Chapter?2.?The Basics of PMake
?\ `Next <invoking.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.6.?Writing and Debugging a Makefile
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now you know most of what is in a ``Makefile``, what do you do next?
There are two choices: use one of the uncommonly-available makefile
generators or write your own makefile (I leave out the third choice of
ignoring PMake and doing everything by hand as being beyond the bounds
of common sense).

When faced with the writing of a makefile, it is usually best to start
from first principles: just what are you trying to do? What do you want
the makefile finally to produce? To begin with a somewhat traditional
example, let's say you need to write a makefile to create a program,
``expr``, that takes standard infix expressions and converts them to
prefix form (for no readily apparent reason). You have got three source
files, in C, that make up the program: ``main.c``, ``parse.c``, and
``output.c``. Harking back to my pithy advice about dependency lines,
you write the first line of the file:

.. code:: programlisting

    expr            : main.o parse.o output.o

because you remember ``expr`` is made from ``.o`` files, not ``.c``
files. Similarly for the ``.o`` files you produce the lines:

.. code:: programlisting

    main.o          : main.c

    parse.o         : parse.c

    output.o        : output.c

    main.o parse.o output.o : defs.h

Great. You have now got the dependencies specified. What you need now is
commands. These commands, remember, must produce the target on the
dependency line, usually by using the sources you have listed. You
remember about local variables? Good, so it should come to you as no
surprise when you write:

.. code:: programlisting

    expr            : main.o parse.o output.o
        cc -o $(.TARGET) $(.ALLSRC)

Why use the variables? If your program grows to produce postfix
expressions too (which, of course, requires a name change or two), it is
one fewer place you have to change the file. You cannot do this for the
object files, however, because they depend on their corresponding source
files and ``defs.h``, thus if you said:

.. code:: programlisting

    cc -c $(.ALLSRC)

you will get (for ``main.o``):

.. code:: programlisting

    cc -c main.c defs.h

which is wrong. So you round out the makefile with these lines:

.. code:: programlisting

    main.o          : main.c
        cc -c main.c

    parse.o         : parse.c
        cc -c parse.c

    output.o        : output.c
        cc -c output.c

The makefile is now complete and will, in fact, create the program you
want it to without unnecessary compilations or excessive typing on your
part. There are two things wrong with it, however (aside from it being
altogether too long, something I will address in `Chapter?3, *Short-cuts
and Other Nice Things* <shortcuts.html>`__):

.. raw:: html

   <div class="orderedlist">

#. The string ``main.o parse.o output.o`` is repeated twice,
   necessitating two changes when you add postfix (you were planning on
   that, were not you?). This is in direct violation of de Boor's First
   Rule of writing makefiles:

   Anything that needs to be written more than once should be placed in
   a variable. I cannot emphasize this enough as being very important to
   the maintenance of a makefile and its program.

#. There is no way to alter the way compilations are performed short of
   editing the makefile and making the change in all places. This is
   evil and violates de Boor's Second Rule, which follows directly from
   the first:

   Any flags or programs used inside a makefile should be placed in a
   variable so they may be changed, temporarily or permanently, with the
   greatest ease.

.. raw:: html

   </div>

The makefile should more properly read:

.. code:: programlisting

    OBJS            = main.o parse.o output.o

    expr            : $(OBJS)
        $(CC) $(CFLAGS) -o $(.TARGET) $(.ALLSRC)

    main.o          : main.c
        $(CC) $(CFLAGS) -c main.c

    parse.o         : parse.c
        $(CC) $(CFLAGS) -c parse.c

    output.o        : output.c
        $(CC) $(CFLAGS) -c output.c

    $(OBJS)         : defs.h

Alternatively, if you like the idea of dynamic sources mentioned in
`Section?2.3.1, “Local Variables” <variables.html#localvariables>`__,
you could write it like this:

.. code:: programlisting

    OBJS            = main.o parse.o output.o

    expr            : $(OBJS)
        $(CC) $(CFLAGS) -o $(.TARGET) $(.ALLSRC)

    $(OBJS)         : $(.PREFIX).c defs.h
        $(CC) $(CFLAGS) -c $(.PREFIX).c

These two rules and examples lead to de Boor's First Corollary:
*Variables are your friends*.

Once you have written the makefile comes the sometimes-difficult task of
making sure the darn thing works. Your most helpful tool to make sure
the makefile is at least syntactically correct is the ``-n`` flag, which
allows you to see if PMake will choke on the makefile. The second thing
the ``-n`` flag lets you do is see what PMake would do without it
actually doing it, thus you can make sure the right commands would be
executed were you to give PMake its head.

When you find your makefile is not behaving as you hoped, the first
question that comes to mind (after “What time is it, anyway?”) is “Why
not?” In answering this, two flags will serve you well: ``-d m`` and “-p
2”. The first causes PMake to tell you as it examines each target in the
makefile and indicate why it is deciding whatever it is deciding. You
can then use the information printed for other targets to see where you
went wrong. The “-p 2” flag makes PMake print out its internal state
when it is done, allowing you to see that you forgot to make that one
chapter depend on that file of macros you just got a new version of. The
output from “-p 2” is intended to resemble closely a real makefile, but
with additional information provided and with variables expanded in
those commands PMake actually printed or executed.

Something to be especially careful about is circular dependencies. For
example:

.. code:: programlisting

    a         : b

    b         : c d

    d         : a

In this case, because of how PMake works, ``c`` is the only thing PMake
will examine, because ``d`` and ``a`` will effectively fall off the edge
of the universe, making it impossible to examine ``b`` (or them, for
that matter). PMake will tell you (if run in its normal mode) all the
targets involved in any cycle it looked at (i.e.?if you have two cycles
in the graph (naughty, naughty), but only try to make a target in one of
them, PMake will only tell you about that one. You will have to try to
make the other to find the second cycle). When run as Make, it will only
print the first target in the cycle.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+-------------------------------+
| `Prev <parellelism.html>`__?   | `Up <basics.html>`__    | ?\ `Next <invoking.html>`__   |
+--------------------------------+-------------------------+-------------------------------+
| 2.5.?Parallelism?              | `Home <index.html>`__   | ?2.7.?Invoking PMake          |
+--------------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
