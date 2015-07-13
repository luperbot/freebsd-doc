==================================
4.4.?A Shell is a Shell is a Shell
==================================

.. raw:: html

   <div class="navheader">

4.4.?A Shell is a Shell is a Shell
`Prev <condition.html>`__?
Chapter?4.?PMake for Gods
?\ `Next <compatibility.html>`__

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

4.4.?A Shell is a Shell is a Shell
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In normal operation, the Bourne Shell (better known as sh) is used to
execute the commands to re-create targets. PMake also allows you to
specify a different shell for it to use when executing these commands.
There are several things PMake must know about the shell you wish to
use. These things are specified as the sources for the ``.SHELL`` target
by keyword, as follows:

.. raw:: html

   <div class="variablelist">

``path=path``
    PMake needs to know where the shell actually resides, so it can
    execute it. If you specify this and nothing else, PMake will use the
    last component of the path and look in its table of the shells it
    knows and use the specification it finds, if any. Use this if you
    just want to use a different version of the Bourne or C Shell (yes,
    PMake knows how to use the C Shell too).

``name=name``
    This is the name by which the shell is to be known. It is a single
    word and, if no other keywords are specified (other than path), it
    is the name by which PMake attempts to find a specification for it
    (as mentioned above). You can use this if you would just rather use
    the C Shell than the Bourne Shell (``.SHELL: name=csh`` will do it).

``quiet=echo-off`` command
    As mentioned before, PMake actually controls whether commands are
    printed by introducing commands into the shell's input stream. This
    keyword, and the next two, control what those commands are. The
    ``quiet`` keyword is the command used to turn echoing off. Once it
    is turned off, echoing is expected to remain off until the
    ``echo-on`` command is given.

``echo=echo-on`` command
    The command PMake should give to turn echoing back on again.

``filter=printed echo-off`` command
    Many shells will echo the ``echo-off`` command when it is given.
    This keyword tells PMake in what format the shell actually prints
    the ``echo-off`` command. Wherever PMake sees this string in the
    shell's output, it will delete it and any following whitespace, up
    to and including the next newline. See the example at the end of
    this section for more details.

``echoFlag=flag`` to turn echoing on
    Unless a target has been marked ``.SILENT``, PMake wants to start
    the shell running with echoing on. To do this, it passes this flag
    to the shell as one of its arguments. If either this or the next
    flag begins with a ``-``, the flags will be passed to the shell as
    separate arguments. Otherwise, the two will be concatenated (if they
    are used at the same time, of course).

``errFlag=flag`` to turn error checking on
    Likewise, unless a target is marked ``.IGNORE``, PMake wishes
    error-checking to be on from the very start. To this end, it will
    pass this flag to the shell as an argument. The same rules for an
    initial ``-`` apply as for the ``echoFlag``.

``check=command`` to turn error checking on
    Just as for echo-control, error-control is achieved by inserting
    commands into the shell's input stream. This is the command to make
    the shell check for errors. It also serves another purpose if the
    shell does not have error-control as commands, but I will get into
    that in a minute. Again, once error checking has been turned on, it
    is expected to remain on until it is turned off again.

``ignore=command``\ to turn error checking off
    This is the command PMake uses to turn error checking off. It has
    another use if the shell does not do errorcontrol, but I will tell
    you about that...now.

``hasErrCtl=yes`` or ``no``
    This takes a value that is either ``yes`` or ``no``. Now you might
    think that the existence of the check and ignore keywords would be
    enough to tell PMake if the shell can do error-control, but you
    would be wrong. If ``hasErrCtl`` is ``yes``, PMake uses the check
    and ignore commands in a straight-forward manner. If this is no,
    however, their use is rather different. In this case, the check
    command is used as a template, in which the string ``%s`` is
    replaced by the command that is about to be executed, to produce a
    command for the shell that will echo the command to be executed. The
    ignore command is also used as a template, again with ``%s``
    replaced by the command to be executed, to produce a command that
    will execute the command to be executed and ignore any error it
    returns. When these strings are used as templates, you must provide
    newline(s) (``\n``) in the appropriate place(s).

.. raw:: html

   </div>

The strings that follow these keywords may be enclosed in single or
double quotes (the quotes will be stripped off) and may contain the
usual C backslash-characters (``\n`` is newline, ``\r`` is return,
``\b`` is backspace, ``\'`` escapes a single-quote inside single-quotes,
``\"`` escapes a double-quote inside double-quotes). Now for an example.

This is actually the contents of the <shx.mk> system makefile, and
causes PMake to use the Bourne Shell in such a way that each command is
printed as it is executed. That is, if more than one command is given on
a line, each will be printed separately. Similarly, each time the body
of a loop is executed, the commands within that loop will be printed,
etc. The specification runs like this:

.. code:: programlisting

    #
    # This is a shell specification to have the Bourne shell echo
    # the commands just before executing them, rather than when it reads
    # them. Useful if you want to see how variables are being expanded, etc.
    #
    .SHELL    : path=/bin/sh \
         quiet="set -" \
         echo="set -x" \
         filter="+ set - " \
         echoFlag=x \
         errFlag=e \
         hasErrCtl=yes \
         check="set -e" \
         ignore="set +e"

It tells PMake the following:

.. raw:: html

   <div class="itemizedlist">

-  The shell is located in the file ``/bin/sh``. It need not tell PMake
   that the name of the shell is sh as PMake can figure that out for
   itself (it is the last component of the path).

-  The command to stop echoing is set ``-``.

-  The command to start echoing is set ``-x``.

-  When the echo off command is executed, the shell will print ``+`` set
   ``-`` (The ``+`` comes from using the ``-x`` flag (rather than the
   ``-v`` flag PMake usually uses)). PMake will remove all occurrences
   of this string from the output, so you do not notice extra commands
   you did not put there.

-  The flag the Bourne Shell will take to start echoing in this way is
   the ``-x`` flag. The Bourne Shell will only take its flag arguments
   concatenated as its first argument, so neither this nor the errFlag
   specification begins with a ``-``.

-  The flag to use to turn error-checking on from the start is ``-e``.

-  The shell can turn error-checking on and off, and the commands to do
   so are ``set +e`` and ``set -e``, respectively.

.. raw:: html

   </div>

I should note that this specification is for Bourne Shells that are not
part of Berkeley UNIX?, as shells from Berkeley do not do error control.
You can get a similar effect, however, by changing the last three lines
to be:

.. code:: programlisting

    hasErrCtl=no \
    check="echo \"+ %s\"\n" \
    ignore="sh -c '%s || exit 0\n"

This will cause PMake to execute the two commands:

.. code:: programlisting

    echo "+ cmd"
    sh -c 'cmd || true'

for each command for which errors are to be ignored. (In case you are
wondering, the thing for ignore tells the shell to execute another shell
without error checking on and always exit 0, since the \|\|\ ```` causes
the exit 0 to be executed only if the first command exited non-zero, and
if the first command exited zero, the shell will also exit zero, since
that is the last command it executed).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+------------------------------------+
| `Prev <condition.html>`__?   | `Up <gods.html>`__      | ?\ `Next <compatibility.html>`__   |
+------------------------------+-------------------------+------------------------------------+
| 4.3.?On the Condition...?    | `Home <index.html>`__   | ?4.5.?Compatibility                |
+------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
