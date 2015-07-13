===========
4.9.?Shells
===========

.. raw:: html

   <div class="navheader">

4.9.?Shells
`Prev <basics-processes.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <editors.html>`__

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

4.9.?Shells
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A *shell* provides a command line interface for interacting with the
operating system. A shell receives commands from the input channel and
executes them. Many shells provide built in functions to help with
everyday tasks such as file management, file globbing, command line
editing, command macros, and environment variables. FreeBSD comes with
several shells, including the Bourne shell
(`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__) and
the extended C shell
(`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__).
Other shells are available from the FreeBSD Ports Collection, such as
``zsh`` and ``bash``.

The shell that is used is really a matter of taste. A C programmer might
feel more comfortable with a C-like shell such as
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__. A
Linux? user might prefer ``bash``. Each shell has unique properties that
may or may not work with a user's preferred working environment, which
is why there is a choice of which shell to use.

One common shell feature is filename completion. After a user types the
first few letters of a command or filename and presses **Tab**, the
shell completes the rest of the command or filename. Consider two files
called ``foobar`` and ``football``. To delete ``foobar``, the user might
type ``rm foo`` and press **Tab** to complete the filename.

But the shell only shows ``rm foo``. It was unable to complete the
filename because both ``foobar`` and ``football`` start with ``foo``.
Some shells sound a beep or show all the choices if more than one name
matches. The user must then type more characters to identify the desired
filename. Typing a ``t`` and pressing **Tab** again is enough to let the
shell determine which filename is desired and fill in the rest.

Another feature of the shell is the use of environment variables.
Environment variables are a variable/key pair stored in the shell's
environment. This environment can be read by any program invoked by the
shell, and thus contains a lot of program configuration. `Table?4.4,
“Common Environment Variables” <shells.html#shell-env-vars>`__ provides
a list of common environment variables and their meanings. Note that the
names of environment variables are always in uppercase.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?4.4.?Common Environment Variables

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------+------------------------------------------------------------------------------------------------+
| Variable       | Description                                                                                    |
+================+================================================================================================+
| ``USER``       | Current logged in user's name.                                                                 |
+----------------+------------------------------------------------------------------------------------------------+
| ``PATH``       | Colon-separated list of directories to search for binaries.                                    |
+----------------+------------------------------------------------------------------------------------------------+
| ``DISPLAY``    | Network name of the Xorg display to connect to, if available.                                  |
+----------------+------------------------------------------------------------------------------------------------+
| ``SHELL``      | The current shell.                                                                             |
+----------------+------------------------------------------------------------------------------------------------+
| ``TERM``       | The name of the user's type of terminal. Used to determine the capabilities of the terminal.   |
+----------------+------------------------------------------------------------------------------------------------+
| ``TERMCAP``    | Database entry of the terminal escape codes to perform various terminal functions.             |
+----------------+------------------------------------------------------------------------------------------------+
| ``OSTYPE``     | Type of operating system.                                                                      |
+----------------+------------------------------------------------------------------------------------------------+
| ``MACHTYPE``   | The system's CPU architecture.                                                                 |
+----------------+------------------------------------------------------------------------------------------------+
| ``EDITOR``     | The user's preferred text editor.                                                              |
+----------------+------------------------------------------------------------------------------------------------+
| ``PAGER``      | The user's preferred utility for viewing text one page at a time.                              |
+----------------+------------------------------------------------------------------------------------------------+
| ``MANPATH``    | Colon-separated list of directories to search for manual pages.                                |
+----------------+------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

How to set an environment variable differs between shells. In
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__
and `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__,
use ``setenv`` to set environment variables. In
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ and
``bash``, use ``export`` to set the current environment variables. This
example sets the default ``EDITOR`` to ``/usr/local/bin/emacs`` for the
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__
shell:

.. code:: screen

    % setenv EDITOR /usr/local/bin/emacs

The equivalent command for ``bash`` would be:

.. code:: screen

    % export EDITOR="/usr/local/bin/emacs"

To expand an environment variable in order to see its current setting,
type a ``$`` character in front of its name on the command line. For
example, ``echo $TERM`` displays the current ``$TERM`` setting.

Shells treat special characters, known as meta-characters, as special
representations of data. The most common meta-character is ``*``, which
represents any number of characters in a filename. Meta-characters can
be used to perform filename globbing. For example, ``echo     *`` is
equivalent to ``ls`` because the shell takes all the files that match
``*`` and ``echo`` lists them on the command line.

To prevent the shell from interpreting a special character, escape it
from the shell by starting it with a backslash (``\``). For example,
``echo     $TERM`` prints the terminal setting whereas ``echo \$TERM``
literally prints the string ``$TERM``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.9.1.?Changing the Shell
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The easiest way to permanently change the default shell is to use
``chsh``. Running this command will open the editor that is configured
in the ``EDITOR`` environment variable, which by default is set to
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__.
Change the ``Shell:`` line to the full path of the new shell.

Alternately, use ``chsh -s`` which will set the specified shell without
opening an editor. For example, to change the shell to ``bash``:

.. code:: screen

    % chsh -s /usr/local/bin/bash

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The new shell *must* be present in ``/etc/shells``. If the shell was
installed from the FreeBSD Ports Collection as described in `Chapter?5,
*Installing Applications: Packages and Ports* <ports.html>`__, it should
be automatically added to this file. If it is missing, add it using this
command, replacing the path with the path of the shell:

.. code:: screen

    # echo /usr/local/bin/bash >> /etc/shells

Then, rerun
`chsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chsh&sektion=1>`__.

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

4.9.2.?Advanced Shell Techniques
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The UNIX? shell is not just a command interpreter, it acts as a powerful
tool which allows users to execute commands, redirect their output,
redirect their input and chain commands together to improve the final
command output. When this functionality is mixed with built in commands,
the user is provided with an environment that can maximize efficiency.

Shell redirection is the action of sending the output or the input of a
command into another command or into a file. To capture the output of
the `ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
command, for example, into a file, simply redirect the output:

.. code:: screen

    % ls > directory_listing.txt

The ``directory_listing.txt`` file will now contain the directory
contents. Some commands allow you to read input in a similar one, such
as
`sort(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sort&sektion=1>`__.
To sort this listing, redirect the input:

.. code:: screen

    % sort < directory_listing.txt

The input will be sorted and placed on the screen. To redirect that
input into another file, one could redirect the output of
`sort(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sort&sektion=1>`__ by
mixing the direction:

.. code:: screen

    % sort < directory_listing.txt > sorted.txt

In all of the previous examples, the commands are performing redirection
using file descriptors. Every unix system has file descriptors; however,
here we will focus on three, so named as Standard Input, Standard
Output, and Standard Error. Each one has a purpose, where input could be
a keyboard or a mouse, something that provides input. Output could be a
screen or paper in a printer for example. And error would be anything
that is used for diagnostic or error messages. All three are considered
I/O based file descriptors and sometimes considered streams.

Through the use of these descriptors, short named stdin, stdout, and
stderr, the shell allows output and input to be passed around through
various commands and redirected to or from a file. Another method of
redirection is the pipe operator.

The UNIX? pipe operator, “\|” allows the output of one command to be
directly passed, or directed to another program. Basically a pipe will
allow the standard output of a command to be passed as standard input to
another command, for example:

.. code:: screen

    % cat directory_listing.txt | sort | less

In that example, the contents of ``directory_listing.txt`` will be
sorted and the output passed to
`less(1) <http://www.FreeBSD.org/cgi/man.cgi?query=less&sektion=1>`__.
This allows the user to scroll through the output at their own pace and
prevent it from scrolling off the screen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+------------------------------+
| `Prev <basics-processes.html>`__?   | `Up <basics.html>`__    | ?\ `Next <editors.html>`__   |
+-------------------------------------+-------------------------+------------------------------+
| 4.8.?Processes and Daemons?         | `Home <index.html>`__   | ?4.10.?Text Editors          |
+-------------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
