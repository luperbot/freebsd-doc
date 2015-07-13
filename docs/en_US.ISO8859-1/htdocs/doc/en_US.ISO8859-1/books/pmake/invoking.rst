===================
2.7.?Invoking PMake
===================

.. raw:: html

   <div class="navheader">

2.7.?Invoking PMake
`Prev <writeanddebug.html>`__?
Chapter?2.?The Basics of PMake
?\ `Next <summary.html>`__

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

2.7.?Invoking PMake
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PMake comes with a wide variety of flags to choose from. They may appear
in any order, interspersed with command-line variable assignments and
targets to create. The flags are as follows:

.. raw:: html

   <div class="variablelist">

``-d what``
    This causes PMake to spew out debugging information that may prove
    useful to you. If you cannot figure out why PMake is doing what it
    is doing, you might try using this flag. The *``what``* parameter is
    a string of single characters that tell PMake what aspects you are
    interested in. Most of what I describe will make little sense to
    you, unless you have dealt with Make before. Just remember where
    this table is and come back to it as you read on. The characters and
    the information they produce are as follows:

    .. raw:: html

       <div class="informaltable">

    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``a``   | Archive searching and caching.                                                                                              |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``c``   | Conditional evaluation.                                                                                                     |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``d``   | The searching and caching of directories.                                                                                   |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``j``   | Various snippets of information related to the running of the multiple shells. Not particularly interesting.                |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``m``   | The making of each target: what target is being examined; when it was last modified; whether it is out-of-date; etc.        |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``p``   | Makefile parsing.                                                                                                           |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``r``   | Remote execution.                                                                                                           |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``s``   | The application of suffix-transformation rules. (See `Chapter?3, *Short-cuts and Other Nice Things* <shortcuts.html>`__.)   |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``t``   | The maintenance of the list of targets.                                                                                     |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+
    | ``v``   | Variable assignment.                                                                                                        |
    +---------+-----------------------------------------------------------------------------------------------------------------------------+

    .. raw:: html

       </div>

    Of these all, the ``m`` and ``s`` letters will be most useful to
    you. If the ``-d`` is the final argument or the argument from which
    it would get these key letters (see below for a note about which
    argument would be used) begins with a –, all of these debugging
    flags will be set, resulting in massive amounts of output.

``-f`` makefile
    Specify a makefile to read different from the standard makefiles
    (``Makefile`` or ``makefile``). If makefile is ``-``, PMake uses the
    standard input. This is useful for making quick and dirty makefiles.

``-h``
    Prints out a summary of the various flags PMake accepts. It can also
    be used to find out what level of concurrency was compiled into the
    version of PMake you are using (look at ``-J`` and ``-L``) and
    various other information on how PMake was configured.

``-i``
    If you give this flag, PMake will ignore non-zero status returned by
    any of its shells. It is like placing a ``-`` before all the
    commands in the makefile.

``-k``
    This is similar to ``-i`` in that it allows PMake to continue when
    it sees an error, but unlike ``-i``, where PMake continues blithely
    as if nothing went wrong, ``-k`` causes it to recognize the error
    and only continue work on those things that do not depend on the
    target, either directly or indirectly (through depending on
    something that depends on it), whose creation returned the error.
    The ``k`` is for “keep going”.

``-l``
    PMake has the ability to lock a directory against other people
    executing it in the same directory (by means of a file called
    ``LOCK.make`` that it creates and checks for in the directory). This
    is a Good Thing because two people doing the same thing in the same
    place can be disastrous for the final product (too many cooks and
    all that). Whether this locking is the default is up to your system
    administrator. If locking is on, ``-l`` will turn it off, and vice
    versa. Note that this locking will not prevent you from invoking
    PMake twice in the same place–if you own the lock file, PMake will
    warn you about it but continue to execute.

``-m directory``
    Tells PMake another place to search for included makefiles via the
    <*``filename``*\ > style. Several ``-m`` options can be given to
    form a search path. If this construct is used the default system
    makefile search path is completely overridden.

``-n``
    This flag tells PMake not to execute the commands needed to update
    the out-of-date targets in the makefile. Rather, PMake will simply
    print the commands it would have executed and exit. This is
    particularly useful for checking the correctness of a makefile. If
    PMake does not do what you expect it to, it is a good chance the
    makefile is wrong.

``-p number``
    This causes PMake to print its input in a reasonable form, though
    not necessarily one that would make immediate sense to anyone but
    me. The number is a bitwise OR of 1 and 2, where 1 means it should
    print the input before doing any processing and 2 says it should
    print it after everything has been re-created. Thus ``-p 3`` would
    print it twice-a-once before processing and once after (you might
    find the difference between the two interesting). This is mostly
    useful to me, but you may find it informative in some bizarre
    circumstances.

``-q``
    If you give PMake this flag, it will not try to re-create anything.
    It will just see if anything is out-of-date and exit non-zero if so.

``-r``
    When PMake starts up, it reads a default makefile that tells it what
    sort of system it is on and gives it some idea of what to do if you
    do not tell it anything. I will tell you about it in `Chapter?3,
    *Short-cuts and Other Nice Things* <shortcuts.html>`__. If you give
    this flag, PMake will not read the default makefile.

``-s``
    This causes PMake to not print commands before they are executed. It
    is the equivalent of putting an “@” before every command in the
    makefile.

``-t``
    Rather than try to re-create a target, PMake will simply “touch” it
    so as to make it appear up-to-date. If the target did not exist
    before, it will when PMake finishes, but if the target did exist, it
    will appear to have been updated.

``-v``
    Targets can still be created in parallel, however. This is the mode
    PMake will enter if it is invoked either as ``smake`` or ``vmake``.

``-x``
    This tells PMake it is OK to export jobs to other machines, if they
    are available. It is used when running in Make mode, as exporting in
    this mode tends to make things run slower than if the commands were
    just executed locally.

``-B``
    Forces PMake to be as backwards-compatible with Make as possible
    while still being itself. This includes:

    .. raw:: html

       <div class="itemizedlist">

    -  Executing one shell per shell command

    -  Expanding anything that looks even vaguely like a variable, with
       the empty string replacing any variable PMake does not know.

    -  Refusing to allow you to escape a ``#`` with a backslash.

    -  Permitting undefined variables on dependency lines and
       conditionals (see below). Normally this causes PMake to abort.

    .. raw:: html

       </div>

``-C``
    This nullifies any and all compatibility mode flags you may have
    given or implied up to the time the ``-C`` is encountered. It is
    useful mostly in a makefile that you wrote for PMake to avoid bad
    things happening when someone runs PMake as make or has things set
    in the environment that tell it to be compatible. ``-C`` is not
    placed in the ``PMAKE`` environment variable or the ``.MAKEFLAGS``
    or ``MFLAGS`` global variables.

``-D variable``
    Allows you to define a variable to have “1” as its value. The
    variable is a global variable, not a command-line variable. This is
    useful mostly for people who are used to the C compiler arguments
    and those using conditionals, which I will get into in `Section?4.3,
    “On the Condition...” <condition.html>`__.

``-I directory``
    Tells PMake another place to search for included makefiles. Yet
    another thing to be explained in `Chapter?3, *Short-cuts and Other
    Nice Things* <shortcuts.html>`__ (`Section?3.2, “Including Other
    Makefiles” <including.html>`__, to be precise).

``-J number``
    Gives the absolute maximum number of targets to create at once on
    both local and remote machines.

``-L number``
    This specifies the maximum number of targets to create on the local
    machine at once. This may be ``0``, though you should be wary of
    doing this, as PMake may hang until a remote machine becomes
    available, if one is not available when it is started.

``-M``
    This is the flag that provides absolute, complete, full
    compatibility with Make. It still allows you to use all but a few of
    the features of PMake, but it is non-parallel. This is the mode
    PMake enters if you call it ``make``.

``-P``
    When creating targets in parallel, several shells are executing at
    once, each wanting to write its own two cents'-worth to the screen.
    This output must be captured by PMake in some way in order to
    prevent the screen from being filled with garbage even more
    indecipherable than you usually see. PMake has two ways of doing
    this, one of which provides for much cleaner output and a clear
    separation between the output of different jobs, the other of which
    provides a more immediate response so one can tell what is really
    happening. The former is done by notifying you when the creation of
    a target starts, capturing the output and transferring it to the
    screen all at once when the job finishes. The latter is done by
    catching the output of the shell (and its children) and buffering it
    until an entire line is received, then printing that line preceded
    by an indication of which job produced the output. Since I prefer
    this second method, it is the one used by default. The first method
    will be used if you give the ``-P`` flag to PMake.

``-V``
    As mentioned before, the ``-V`` flag tells PMake to use Make's style
    of expanding variables, substituting the empty string for any
    variable it does not know.

``-W``
    There are several times when PMake will print a message at you that
    is only a warning, i.e.?it can continue to work in spite of your
    having done something silly (such as forgotten a leading tab for a
    shell command). Sometimes you are well aware of silly things you
    have done and would like PMake to stop bothering you. This flag
    tells it to shut up about anything non-fatal.

``-X``
    This flag causes PMake to not attempt to export any jobs to another
    machine.

.. raw:: html

   </div>

Several flags may follow a single ``-``. Those flags that require
arguments take them from successive parameters. For example:

.. code:: screen

    pmake -fDnI server.mk DEBUG /chip2/X/server/include

will cause PMake to read ``server.mk`` as the input makefile, define the
variable ``DEBUG`` as a global variable and look for included makefiles
in the directory ``/chip2/X/server/include``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+------------------------------+
| `Prev <writeanddebug.html>`__?           | `Up <basics.html>`__    | ?\ `Next <summary.html>`__   |
+------------------------------------------+-------------------------+------------------------------+
| 2.6.?Writing and Debugging a Makefile?   | `Home <index.html>`__   | ?2.8.?Summary                |
+------------------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
