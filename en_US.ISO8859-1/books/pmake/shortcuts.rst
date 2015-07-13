===========================================
Chapter?3.?Short-cuts and Other Nice Things
===========================================

.. raw:: html

   <div class="navheader">

Chapter?3.?Short-cuts and Other Nice Things
`Prev <summary.html>`__?
?
?\ `Next <including.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`3.1. Transformation Rules <shortcuts.html#rules>`__
`3.2. Including Other Makefiles <including.html>`__
`3.3. Saving Commands <savingcmds.html>`__
`3.4. Target Attributes <targetattr.html>`__
`3.5. Special Targets <specialtargets.html>`__
`3.6. Modifying Variable Expansion <modyvarex.html>`__
`3.7. More Exercises <moreexercises.html>`__

.. raw:: html

   </div>

Based on what I have told you so far, you may have gotten the impression
that PMake is just a way of storing away commands and making sure you do
not forget to compile something. Good. That is just what it is. However,
the ways I have described have been inelegant, at best, and painful, at
worst. This chapter contains things that make the writing of makefiles
easier and the makefiles themselves shorter and easier to modify (and,
occasionally, simpler). In this chapter, I assume you are somewhat more
familiar with Sprite (or UNIX?, if that is what you are using) than I
did in `Chapter?2, *The Basics of PMake* <basics.html>`__, just so you
are on your toes. So without further ado…

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Transformation Rules
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As you know, a file's name consists of two parts: a base name, which
gives some hint as to the contents of the file, and a suffix, which
usually indicates the format of the file. Over the years, as UNIX? has
developed, naming conventions, with regard to suffixes, have also
developed that have become almost as incontrovertible as Law. E.g. a
file ending in ``.c`` is assumed to contain C source code; one with a
``.o`` suffix is assumed to be a compiled, relocatable object file that
may be linked into any program; a file with a ``.ms`` suffix is usually
a text file to be processed by Troff with the ``-ms`` macro package, and
so on. One of the best aspects of both Make and PMake comes from their
understanding of how the suffix of a file pertains to its contents and
their ability to do things with a file based solely on its suffix. This
ability comes from something known as a transformation rule. A
transformation rule specifies how to change a file with one suffix into
a file with another suffix.

A transformation rule looks much like a dependency line, except the
target is made of two known suffixes stuck together. Suffixes are made
known to PMake by placing them as sources on a dependency line whose
target is the special target ``.SUFFIXES``. E.g.:

.. code:: programlisting

    .SUFFIXES   : .o .c
    .c.o        :
        $(CC) $(CFLAGS) -c $(.IMPSRC)

The creation script attached to the target is used to trans form a file
with the first suffix (in this case, ``.c``) into a file with the second
suffix (here, ``.o``). In addition, the target inherits whatever
attributes have been applied to the transformation rule. The simple rule
given above says that to transform a C source file into an object file,
you compile it using cc with the ``-c`` flag. This rule is taken
straight from the system makefile. Many transformation rules (and
suffixes) are defined there, and I refer you to it for more examples
(type ``pmake -h`` to find out where it is).

There are several things to note about the transformation rule given
above:

.. raw:: html

   <div class="orderedlist">

#. The ``.IMPSRC`` variable. This variable is set to the “implied
   source” (the file from which the target is being created; the one
   with the first suffix), which, in this case, is the ``.c`` file.

#. The ``CFLAGS`` variable. Almost all of the transformation rules in
   the system makefile are set up using variables that you can alter in
   your makefile to tailor the rule to your needs. In this case, if you
   want all your C files to be compiled with the ``-g`` flag, to provide
   information for dbx, you would set the ``CFLAGS`` variable to contain
   ``-g`` (``CFLAGS  =       -g``) and PMake would take care of the
   rest.

.. raw:: html

   </div>

To give you a quick example, the makefile in `Section?2.3.4,
“Environment Variables” <variables.html#envvars>`__ could be changed to
this:

.. code:: programlisting

    OBJS            = a.o b.o c.o
    program         : $(OBJS)
         $(CC) -o $(.TARGET) $(.ALLSRC)
    $(OBJS)         : defs.h

The transformation rule I gave above takes the place of the 6 lines
`:sup:`[1]` <#ftn.idp64834256>`__:

.. code:: programlisting

    a.o             : a.c
        cc -c a.c
    b.o             : b.c
        cc -c b.c
    c.o             : c.c
        cc -c c.c

Now you may be wondering about the dependency between the ``.o`` and
``.c`` files – it is not mentioned anywhere in the new makefile. This is
because it is not needed: one of the effects of applying a
transformation rule is the target comes to depend on the implied source.
That's why it is called the implied source.

For a more detailed example. Say you have a makefile like this:

.. code:: programlisting

    a.out           : a.o b.o
        $(CC) $(.ALLSRC)

and a directory set up like this:

.. code:: screen

    total 4
    -rw-rw-r--  1 deboor        34 Sep  7 00:43 Makefile
    -rw-rw-r--  1 deboor       119 Oct  3 19:39 a.c
    -rw-rw-r--  1 deboor       201 Sep  7 00:43 a.o
    -rw-rw-r--  1 deboor        69 Sep  7 00:43 b.c

While just typing ``pmake`` will do the right thing, it is much more
informative to type ``pmake -d s``. This will show you what PMake is up
to as it processes the files. In this case, PMake prints the following:

.. code:: screen

    Suff_FindDeps (a.out)
         using existing source a.o
         applying .o -> .out to "a.o"
    Suff_FindDeps (a.o)
         trying a.c...got it
         applying .c -> .o to "a.c"
    Suff_FindDeps (b.o)
         trying b.c...got it
         applying .c -> .o to "b.c"
    Suff_FindDeps (a.c)
         trying a.y...not there
         trying a.l...not there
         trying a.c,v...not there
         trying a.y,v...not there
         trying a.l,v...not there
    Suff_FindDeps (b.c)
         trying b.y...not there
         trying b.l...not there
         trying b.c,v...not there
         trying b.y,v...not there
         trying b.l,v...not there
    --- a.o ---
    cc  -c a.c
    --- b.o ---
    cc  -c b.c
    --- a.out ---
    cc a.o b.o

``Suff_FindDeps`` is the name of a function in PMake that is called to
check for implied sources for a target using transformation rules. The
transformations it tries are, naturally enough, limited to the ones that
have been defined (a transformation may be defined multiple times, by
the way, but only the most recent one will be used). You will notice,
however, that there is a definite order to the suffixes that are tried.
This order is set by the relative positions of the suffixes on the
``.SUFFIXES`` line – the earlier a suffix appears, the earlier it is
checked as the source of a transformation. Once a suffix has been
defined, the only way to change its position in the pecking order is to
remove all the suffixes (by having a ``.SUFFIXES`` dependency line with
no sources) and redefine them in the order you want. (Previously-defined
transformation rules will be automatically redefined as the suffixes
they involve are re-entered.) Another way to affect the search order is
to make the dependency explicit. In the above example, ``a.out`` depends
on ``a.o`` and ``b.o``. Since a transformation exists from ``.o`` to
``.out``, PMake uses that, as indicated by the
``using existing source a.o`` message.

The search for a transformation starts from the suffix of the target and
continues through all the defined transformations, in the order dictated
by the suffix ranking, until an existing file with the same base (the
target name minus the suffix and any leading directories) is found. At
that point, one or more transformation rules will have been found to
change the one existing file into the target.

For example, ignoring what's in the system makefile for now, say you
have a makefile like this:

.. code:: screen

    .SUFFIXES       : .out .o .c .y .l
    .l.c            :
        lex $(.IMPSRC)
        mv lex.yy.c $(.TARGET)
    .y.c            :
        yacc $(.IMPSRC)
        mv y.tab.c $(.TARGET)
    .c.o            :
        cc -c $(.IMPSRC)
    .o.out          :
        cc -o $(.TARGET) $(.IMPSRC)

and the single file ``jive.l``. If you were to type
``pmake -rd ms jive.out``, you would get the following output for
``jive.out``:

.. code:: screen

    Suff_FindDeps (jive.out)
         trying jive.o...not there
         trying jive.c...not there
         trying jive.y...not there
         trying jive.l...got it
         applying .l -> .c to "jive.l"
         applying .c -> .o to "jive.c"
         applying .o -> .out to "jive.o"

and this is why: PMake starts with the target ``jive.out``, figures out
its suffix (``.out``) and looks for things it can transform to a
``.out`` file. In this case, it only finds ``.o``, so it looks for the
file ``jive.o``. It fails to find it, so it looks for transformations
into a ``.o`` file. Again it has only one choice: ``.c``. So it looks
for ``jive.c`` and, as you know, fails to find it. At this point it has
two choices: it can create the ``.c`` file from either a ``.y`` file or
a ``.l`` file. Since ``.y`` came first on the ``.SUFFIXES`` line, it
checks for ``jive.y`` first, but can not find it, so it looks for
``jive.l`` and, lo and behold, there it is. At this point, it has
defined a transformation path as follows:

.. raw:: html

   <div class="literallayout">

``.l``??->??\ ``.c``??->??\ ``.o``??->?\ ``.out``

.. raw:: html

   </div>

and applies the transformation rules accordingly. For completeness, and
to give you a better idea of what PMake actually did with this
three-step transformation, this is what PMake printed for the rest of
the process:

.. code:: screen

    Suff_FindDeps (jive.o)
         using existing source jive.c
         applying .c -> .o to "jive.c"
    Suff_FindDeps (jive.c)
         using existing source jive.l
         applying .l -> .c to "jive.l"
    Suff_FindDeps (jive.l)
    Examining jive.l...modified 17:16:01 Oct 4, 1987...up-to-date
    Examining jive.c...non-existent...out-of-date
    --- jive.c ---
    lex jive.l
    ... meaningless lex output deleted ...
    mv lex.yy.c jive.c
    Examining jive.o...non-existent...out-of-date
    --- jive.o ---
    cc -c jive.c
    Examining jive.out...non-existent...out-of-date
    --- jive.out ---
    cc -o jive.out jive.o

One final question remains: what does PMake do with targets that have no
known suffix? PMake simply pretends it actually has a known suffix and
searches for transformations accordingly. The suffix it chooses is the
source for the ``.NULL`` target mentioned later. In the system makefile,
``.out`` is chosen as the “null suffix” because most people use PMake to
create programs. You are, however, free and welcome to change it to a
suffix of your own choosing. The null suffix is ignored, however, when
PMake is in compatibility mode (see `Chapter?4, *PMake for
Gods* <gods.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64834256" class="footnote">

`:sup:`[1]` <#idp64834256>`__\ This is also somewhat cleaner, I think,
than the dynamic source solution presented in `Section?2.6, “Writing and
Debugging a Makefile” <writeanddebug.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-----------------------------------+
| `Prev <summary.html>`__?   | ?                       | ?\ `Next <including.html>`__      |
+----------------------------+-------------------------+-----------------------------------+
| 2.8.?Summary?              | `Home <index.html>`__   | ?3.2.?Including Other Makefiles   |
+----------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
