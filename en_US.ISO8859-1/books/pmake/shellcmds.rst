===================
2.2.?Shell Commands
===================

.. raw:: html

   <div class="navheader">

2.2.?Shell Commands
`Prev <basics.html>`__?
Chapter?2.?The Basics of PMake
?\ `Next <variables.html>`__

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

2.2.?Shell Commands
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

“Is not that nice,” you say to yourself, “but how are files actually
\`\`re-created'', as he likes to spell it?” The re-creation is
accomplished by commands you place in the makefile. These commands are
passed to the Bourne shell (better known as ``/bin/sh``) to be executed
and are expected to do what is necessary to update the target file
(PMake does not actually check to see if the target was created. It just
assumes it is there).

Shell commands in a makefile look a lot like shell commands you would
type at a terminal, with one important exception: each command in a
makefile must be preceded by at least one tab.

Each target has associated with it a shell script made up of one or more
of these shell commands. The creation script for a target should
immediately follow the dependency line for that target. While any given
target may appear on more than one dependency line, only one of these
dependency lines may be followed by a creation script, unless the ``::``
operator was used on the dependency line.

If the double-colon was used, each dependency line for the target may be
followed by a shell script. That script will only be executed if the
target on the associated dependency line is out-of-date with respect to
the sources on that line, according to the rules I gave earlier. I'll
give you a good example of this later on.

To expand on the earlier makefile, you might add commands as follows:

.. code:: programlisting

    program         : a.o b.o c.o
            cc a.o b.o c.o -o program

    a.o b.o c.o     : defs.h
    a.o             : a.c
           cc -c a.c

    b.o             : b.c
           cc -c b.c

    c.o             : c.c
           cc -c c.c

Something you should remember when writing a makefile is, the commands
will be executed if the target on the dependency line is out-of-date,
not the sources. In this example, the command ``cc -c a.c`` will be
executed if ``a.o`` is out-of-date. Because of the ``:`` operator, this
means that should ``a.c`` or ``defs.h`` have been modified more recently
than ``a.o``, the command will be executed (``a.o`` will be considered
out-of-date).

Remember how I said the only difference between a makefile shell command
and a regular shell command was the leading tab? I lied. There is
another way in which makefile commands differ from regular ones. The
first two characters after the initial whitespace are treated specially.
If they are any combination of ``@`` and ``-``, they cause PMake to do
different things.

In most cases, shell commands are printed before they are actually
executed. This is to keep you informed of what is going on. If an ``@``
appears, however, this echoing is suppressed. In the case of an echo
command, say

.. code:: programlisting

    echo Linking index

it would be rather silly to see

.. code:: screen

    echo Linking index
    Linking index

so PMake allows you to place an ``@`` before the command to prevent the
command from being printed:

.. code:: programlisting

    @echo Linking index

The other special character is the ``-``. In case you did not know,
shell commands finish with a certain “exit status”. This status is made
available by the operating system to whatever program invoked the
command. Normally this status will be ``0`` if everything went ok and
non-zero if something went wrong. For this reason, PMake will consider
an error to have occurred if one of the shells it invokes returns a
non-zero status. When it detects an error, PMake's usual action is to
abort whatever it is doing and exit with a non-zero status itself (any
other targets that were being created will continue being made, but
nothing new will be started. PMake will exit after the last job
finishes). This behavior can be altered, however, by placing a ``-`` at
the front of a command (e.g. ``-mv index index.old``), certain
command-line arguments, or doing other things, to be detailed later. In
such a case, the non-zero status is simply ignored and PMake keeps
chugging along.

Because all the commands are given to a single shell to execute, such
things as setting shell variables, changing directories, etc., last
beyond the command in which they are found. This also allows shell
compound commands (like for loops) to be entered in a natural manner.
Since this could cause problems for some makefiles that depend on each
command being executed by a single shell, PMake has a ``-B`` flag (it
stands for backwards-compatible) that forces each command to be given to
a separate shell. It also does several other things, all of which I
discourage since they are now old-fashioned.

A target's shell script is fed to the shell on its (the shell's) input
stream. This means that any commands, such as ci that need to get input
from the terminal will not work right – they will get the shell's input,
something they probably will not find to their liking. A simple way
around this is to give a command like this:

.. code:: screen

    ci $(SRCS) < /dev/tty

This would force the program's input to come from the terminal. If you
cannot do this for some reason, your only other alternative is to use
PMake in its fullest compatibility mode. See “Compatibility” in
`Chapter?4, *PMake for Gods* <gods.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+--------------------------------+
| `Prev <basics.html>`__?           | `Up <basics.html>`__    | ?\ `Next <variables.html>`__   |
+-----------------------------------+-------------------------+--------------------------------+
| Chapter?2.?The Basics of PMake?   | `Home <index.html>`__   | ?2.3.?Variables                |
+-----------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
