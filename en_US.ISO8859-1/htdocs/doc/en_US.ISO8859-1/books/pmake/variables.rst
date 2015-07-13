==============
2.3.?Variables
==============

.. raw:: html

   <div class="navheader">

2.3.?Variables
`Prev <shellcmds.html>`__?
Chapter?2.?The Basics of PMake
?\ `Next <comments.html>`__

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

2.3.?Variables
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PMake, like Make before it, has the ability to save text in variables to
be recalled later at your convenience. Variables in PMake are used much
like variables in the shell and, by tradition, consist of all upper-case
letters (you do not have to use all upper-case letters. In fact there is
nothing to stop you from calling a variable ``@^&$%$``. Just tradition).
Variables are assigned-to using lines of the form:

.. code:: programlisting

    VARIABLE = value

appended-to by:

.. code:: programlisting

    VARIABLE += value

conditionally assigned-to (if the variable is not already defined) by:

.. code:: programlisting

    VARIABLE ?= value

and assigned-to with expansion (i.e. the value is expanded (see below)
before being assigned to the variable—useful for placing a value at the
beginning of a variable, or other things) by:

.. code:: programlisting

    VARIABLE := value

Any whitespace before value is stripped off. When appending, a space is
placed between the old value and the stuff being appended.

The final way a variable may be assigned to is using:

.. code:: programlisting

    VARIABLE != shell-command

In this case, shell-command has all its variables expanded (see below)
and is passed off to a shell to execute. The output of the shell is then
placed in the variable. Any newlines (other than the final one) are
replaced by spaces before the assignment is made. This is typically used
to find the current directory via a line like:

.. code:: programlisting

    CWD             != pwd

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This is intended to be used to execute commands that produce small
amounts of output (e.g.?pwd). The implementation is less than
intelligent and will likely freeze if you execute something that
produces thousands of bytes of output (8 Kb is the limit on many UNIX?
systems). The value of a variable may be retrieved by enclosing the
variable name in parentheses or curly braces and preceding the whole
thing with a dollar sign.

.. raw:: html

   </div>

For example, to set the variable ``CFLAGS`` to the string
``-I/sprite/src/lib/libc -O,`` you would place a line:

.. code:: programlisting

    CFLAGS = -I/sprite/src/lib/libc -O

in the makefile and use the word ``$(CFLAGS)`` wherever you would like
the string ``-I/sprite/src/lib/libc -O`` to appear. This is called
variable expansion.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Unlike Make, PMake will not expand a variable unless it knows the
variable exists. E.g.?if you have a ``${i}`` in a shell command and you
have not assigned a value to the variable ``i`` (the empty string is
considered a value, by the way), where Make would have substituted the
empty string, PMake will leave the ``${i}`` alone. To keep PMake from
substituting for a variable it knows, precede the dollar sign with
another dollar sign (e.g.?to pass ``${HOME}`` to the shell, use
``$${HOME}``). This causes PMake, in effect, to expand the ``$`` macro,
which expands to a single ``$``.

.. raw:: html

   </div>

For compatibility, Make's style of variable expansion will be used if
you invoke PMake with any of the compatibility flags (``-V``, ``-B`` or
``-M``. The ``-V`` flag alters just the variable expansion). There are
two different times at which variable expansion occurs: when parsing a
dependency line, the expansion occurs immediately upon reading the line.
If any variable used on a dependency line is undefined, PMake will print
a message and exit. Variables in shell commands are expanded when the
command is executed. Variables used inside another variable are expanded
whenever the outer variable is expanded (the expansion of an inner
variable has no effect on the outer variable. For example, if the outer
variable is used on a dependency line and in a shell command, and the
inner variable changes value between when the dependency line is read
and the shell command is executed, two different values will be
substituted for the outer variable).

Variables come in four flavors, though they are all expanded the same
and all look about the same. They are (in order of expanding scope):

.. raw:: html

   <div class="itemizedlist">

-  Local variables.

-  Command-line variables.

-  Global variables.

-  Environment variables.

.. raw:: html

   </div>

The classification of variables does not matter much, except that the
classes are searched from the top (local) to the bottom (environment)
when looking up a variable. The first one found wins.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1.?Local Variables
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Each target can have as many as seven local variables. These are
variables that are only “visible” within that target's shell script and
contain such things as the target's name, all of its sources (from all
its dependency lines), those sources that were out-of-date, etc. Four
local variables are defined for all targets. They are:

.. raw:: html

   <div class="variablelist">

``.TARGET``
    The name of the target.

``.OODATE``
    The list of the sources for the target that were considered
    out-of-date. The order in the list is not guaranteed to be the same
    as the order in which the dependencies were given.

``.ALLSRC``
    The list of all sources for this target in the order in which they
    were given.

``.PREFIX``
    The target without its suffix and without any leading path. E.g.?for
    the target ``../../lib/compat/fsRead.c``, this variable would
    contain ``fsRead``.

.. raw:: html

   </div>

Three other local variables are set only for certain targets under
special circumstances. These are the ``.IMPSRC,`` ``.ARCHIVE,`` and
``.MEMBER`` variables. When they are set and how they are used is
described later.

Four of these variables may be used in sources as well as in shell
scripts. These are ``.TARGET``, ``.PREFIX``, ``.ARCHIVE`` and
``.MEMBER``. The variables in the sources are expanded once for each
target on the dependency line, providing what is known as a “dynamic
source,” allowing you to specify several dependency lines at once. For
example:

.. code:: programlisting

    $(OBJS)         : $(.PREFIX).c

will create a dependency between each object file and its corresponding
C source file.

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

2.3.2.?Command-line Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Command-line variables are set when PMake is first invoked by giving a
variable assignment as one of the arguments. For example:

.. code:: screen

    pmake "CFLAGS = -I/sprite/src/lib/libc -O"

would make ``CFLAGS`` be a command-line variable with the given value.
Any assignments to ``CFLAGS`` in the makefile will have no effect,
because once it is set, there is (almost) nothing you can do to change a
command-line variable (the search order, you see). Command-line
variables may be set using any of the four assignment operators, though
only ``=`` and ``?=`` behave as you would expect them to, mostly because
assignments to command-line variables are performed before the makefile
is read, thus the values set in the makefile are unavailable at the
time. ``+=`` is the same as ``=``, because the old value of the variable
is sought only in the scope in which the assignment is taking place (for
reasons of efficiency that I will not get into here). ``:=`` and ``?=``
will work if the only variables used are in the environment. ``!=`` is
sort of pointless to use from the command line, since the same effect
can no doubt be accomplished using the shell's own command substitution
mechanisms (backquotes and all that).

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

2.3.3.?Global Variables
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Global variables are those set or appended-to in the makefile. There are
two classes of global variables: those you set and those PMake sets. As
I said before, the ones you set can have any name you want them to have,
except they may not contain a colon or an exclamation point. The
variables PMake sets (almost) always begin with a period and always
contain upper-case letters, only. The variables are as follows:

.. raw:: html

   <div class="variablelist">

``.PMAKE``
    The name by which PMake was invoked is stored in this variable. For
    compatibility, the name is also stored in the ``MAKE`` variable.

``.MAKEFLAGS``
    All the relevant flags with which PMake was invoked. This does not
    include such things as ``-f`` or variable assignments. Again for
    compatibility, this value is stored in the ``MFLAGS`` variable as
    well.

.. raw:: html

   </div>

Two other variables, ``.INCLUDES`` and ``.LIBS,`` are covered in the
section on special targets in `Chapter?3, *Short-cuts and Other Nice
Things* <shortcuts.html>`__.

Global variables may be deleted using lines of the form:

.. code:: programlisting

    #undef variable

The ``#`` must be the first character on the line. Note that this may
only be done on global variables.

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

2.3.4.?Environment Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Environment variables are passed by the shell that invoked PMake and are
given by PMake to each shell it invokes. They are expanded like any
other variable, but they cannot be altered in any way.

One special environment variable, ``PMAKE``, is examined by PMake for
command-line flags, variable assignments, etc., it should always use.
This variable is examined before the actual arguments to PMake are. In
addition, all flags given to PMake, either through the ``PMAKE``
variable or on the command line, are placed in this environment variable
and exported to each shell PMake executes. Thus recursive invocations of
PMake automatically receive the same flags as the top-most one.

Using all these variables, you can compress the sample makefile even
more:

.. code:: programlisting

    OBJS            = a.o b.o c.o

    program         : $(OBJS)
            cc $(.ALLSRC) -o $(.TARGET)

    $(OBJS)         : defs.h

    a.o             : a.c
            cc -c a.c

    b.o             : b.c
            cc -c b.c

    c.o             : c.c
            cc -c c.c

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+-------------------------------+
| `Prev <shellcmds.html>`__?   | `Up <basics.html>`__    | ?\ `Next <comments.html>`__   |
+------------------------------+-------------------------+-------------------------------+
| 2.2.?Shell Commands?         | `Home <index.html>`__   | ?2.4.?Comments                |
+------------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
