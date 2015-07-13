==============================
Chapter?2.?The Basics of PMake
==============================

.. raw:: html

   <div class="navheader">

Chapter?2.?The Basics of PMake
`Prev <intro.html>`__?
?
?\ `Next <shellcmds.html>`__

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

`2.1. Dependency Lines <basics.html#deplines>`__
`2.2. Shell Commands <shellcmds.html>`__
`2.3. Variables <variables.html>`__
`2.4. Comments <comments.html>`__
`2.5. Parallelism <parellelism.html>`__
`2.6. Writing and Debugging a Makefile <writeanddebug.html>`__
`2.7. Invoking PMake <invoking.html>`__
`2.8. Summary <summary.html>`__

.. raw:: html

   </div>

PMake takes as input a file that tells which files depend on which other
files to be complete and what to do about files that are “out-of-date”.
This file is known as a “makefile” and is usually kept in the top-most
directory of the system to be built. While you can call the makefile
anything you want, PMake will look for ``Makefile`` and ``makefile`` (in
that order) in the current directory if you do not tell it otherwise. To
specify a different makefile, use the ``-f`` flag, e.g.

.. code:: screen

    % pmake -f program.mk

A makefile has four different types of lines in it:

.. raw:: html

   <div class="itemizedlist">

-  File dependency specifications

-  Creation commands

-  Variable assignments

-  Comments, include statements and conditional directives

.. raw:: html

   </div>

Any line may be continued over multiple lines by ending it with a
backslash. The backslash, following newline and any initial whitespace
on the following line are compressed into a single space before the
input line is examined by PMake.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Dependency Lines
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As mentioned in the introduction, in any system, there are dependencies
between the files that make up the system. For instance, in a program
made up of several C source files and one header file, the C files will
need to be re-compiled should the header file be changed. For a document
of several chapters and one macro file, the chapters will need to be
reprocessed if any of the macros changes. These are dependencies and are
specified by means of dependency lines in the makefile.

On a dependency line, there are targets and sources, separated by a
one-?or two-character operator. The targets “depend” on the sources and
are usually created from them. Any number of targets and sources may be
specified on a dependency line. All the targets in the line are made to
depend on all the sources. Targets and sources need not be actual files,
but every source must be either an actual file or another target in the
makefile. If you run out of room, use a backslash at the end of the line
to continue onto the next one.

Any file may be a target and any file may be a source, but the
relationship between the two (or however many) is determined by the
“operator” that separates them. Three types of operators exist: one
specifies that the datedness of a target is determined by the state of
its sources, while another specifies other files (the sources) that need
to be dealt with before the target can be re-created. The third operator
is very similar to the first, with the additional condition that the
target is out-of-date if it has no sources. These operations are
represented by the colon, the exclamation point and the double-colon,
respectively, and are mutually exclusive. Their exact semantics are as
follows:

.. raw:: html

   <div class="informaltable">

+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``:``    | If a colon is used, a target on the line is considered to be “out-of-date” (and in need of creation) if any of the sources has been modified more recently than the target, or the target does not exist. Under this operation, steps will be taken to re-create the target only if it is found to be out-of-date by using these two rules.                                                                           |
+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``!``    | If an exclamation point is used, the target will always be re-created, but this will not happen until all of its sources have been examined and re-created, if necessary.                                                                                                                                                                                                                                             |
+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``::``   | If a double-colon is used, a target is “out-of-date” if any of the sources has been modified more recently than the target, or the target does not exist, or the target has no sources. If the target is out-of-date according to these rules, it will be re-created. This operator also does something else to the targets, but I will go into that in the next section (see `Shell Commands <shellcmds.html>`__).   |
+----------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Enough words, now for an example. Take that C program I mentioned
earlier. Say there are three C files (``a.c``, ``b.c`` and ``c.c``) each
of which includes the file ``defs.h``. The dependencies between the
files could then be expressed as follows:

.. code:: programlisting

    program         : a.o b.o c.o

    a.o b.o c.o     : defs.h

    a.o             : a.c

    b.o             : b.c

    c.o             : c.c

You may be wondering at this point, where ``a.o``, ``b.o`` and ``c.o``
came in and why they depend on ``defs.h`` and the C files do not. The
reason is quite simple: ``program`` cannot be made by linking together
``.c`` files—it must be made from ``.o`` files. Likewise, if you change
``defs.h``, it is not the ``.c`` files that need to be re-created, it is
the ``.o`` files. If you think of dependencies in these terms—which
files (targets) need to be created from which files (sources)—you should
have no problems.

An important thing to notice about the above example, is that all the
``.o`` files appear as targets on more than one line. This is perfectly
all right: the target is made to depend on all the sources mentioned on
all the dependency lines. For example, ``a.o`` depends on both
``defs.h`` and ``a.c``.

The order of the dependency lines in the makefile is important: the
first target on the first dependency line in the makefile will be the
one that gets made if you do not say otherwise. That is why program
comes first in the example makefile, above.

Both targets and sources may contain the standard C-Shell wildcard
characters (``{``, ``}``, ``*``, ``?``, ``[``, and ``]``), but the
non-curly-brace ones may only appear in the final component (the file
portion) of the target or source. The characters mean the following
things:

.. raw:: html

   <div class="informaltable">

+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``{}``   | These enclose a comma-separated list of options and cause the pattern to be expanded once for each element of the list. Each expansion contains a different element. For example, ``src/{whiffle,beep,fish}.c`` expands to the three words ``src/whiffle.c``, ``src/beep.c``, and ``src/fish.c``. These braces may be nested and, unlike the other wildcard characters, the resulting words need not be actual files. All other wildcard characters are expanded using the files that exist when PMake is started.   |
+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``*``    | This matches zero or more characters of any sort. ``src/*.c`` will expand to the same three words as above as long as src contains those three files (and no other files that end in ``.c``).>                                                                                                                                                                                                                                                                                                                       |
+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``?``    | Matches any single character.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``[]``   | This is known as a character class and contains either a list of single characters, or a series of character ranges (``a-z``, for example means all characters between ``a`` and ``z``), or both. It matches any single character contained in the list. For example, ``[A-Za-z]`` will match all letters, while ``[0123456789]`` will match all numbers.                                                                                                                                                            |
+----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+--------------------------------+
| `Prev <intro.html>`__?     | ?                       | ?\ `Next <shellcmds.html>`__   |
+----------------------------+-------------------------+--------------------------------+
| Chapter?1.?Introduction?   | `Home <index.html>`__   | ?2.2.?Shell Commands           |
+----------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
