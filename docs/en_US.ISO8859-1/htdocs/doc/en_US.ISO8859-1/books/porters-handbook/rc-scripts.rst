=================================================
6.26.?Starting and Stopping Services (rc Scripts)
=================================================

.. raw:: html

   <div class="navheader">

6.26.?Starting and Stopping Services (``rc`` Scripts)
`Prev <using-databases.html>`__?
Chapter?6.?Special Considerations
?\ `Next <users-and-groups.html>`__

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

6.26.?Starting and Stopping Services (``rc`` Scripts)
-----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``rc.d`` scripts are used to start services on system startup, and to
give administrators a standard way of stopping, starting and restarting
the service. Ports integrate into the system ``rc.d`` framework. Details
on its usage can be found in `the rc.d Handbook
chapter <../../../../doc/en_US.ISO8859-1/books/handbook/configtuning-rcd.html>`__.
Detailed explanation of the available commands is provided in
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ and
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__.
Finally, there is `an
article <../../../../doc/en_US.ISO8859-1/articles/rc-scripting>`__ on
practical aspects of ``rc.d`` scripting.

With a mythical port called *``doorman``*, which needs to start a
*``doormand``* daemon. Add the following to the ``Makefile``:

.. code:: programlisting

    USE_RC_SUBR=    doormand

Multiple scripts may be listed and will be installed. Scripts must be
placed in the ``files`` subdirectory and a ``.in`` suffix must be added
to their filename. Standard ``SUB_LIST`` expansions will be ran against
this file. Use of the ``%%PREFIX%%`` and ``%%LOCALBASE%%`` expansions is
strongly encouraged as well. More on ``SUB_LIST`` in `the relevant
section <using-sub-files.html>`__.

As of FreeBSD?6.1-RELEASE, local ``rc.d`` scripts (including those
installed by ports) are included in the overall
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
of the base system.

An example simple ``rc.d`` script to start the doormand daemon:

.. code:: programlisting

    #!/bin/sh

    # $FreeBSD$
    #
    # PROVIDE: doormand
    # REQUIRE: LOGIN
    # KEYWORD: shutdown
    #
    # Add these lines to /etc/rc.conf.local or /etc/rc.conf
    # to enable this service:
    #
    # doormand_enable (bool): Set to NO by default.
    #               Set it to YES to enable doormand.
    # doormand_config (path): Set to %%PREFIX%%/etc/doormand/doormand.cf
    #               by default.

    . /etc/rc.subr

    name=doormand
    rcvar=doormand_enable

    load_rc_config $name

    : ${doormand_enable:="NO"}
    : ${doormand_config="%%PREFIX%%/etc/doormand/doormand.cf"}

    command=%%PREFIX%%/sbin/${name}
    pidfile=/var/run/${name}.pid

    command_args="-p $pidfile -f $doormand_config"

    run_rc_command "$1"

Unless there is a very good reason to start the service earlier, or it
runs as a particular user (other than root), all ports scripts must use:

.. code:: programlisting

    REQUIRE: LOGIN

If the startup script launches a daemon that must be shutdown, the
following will trigger a stop of the service on system shutdown:

.. code:: programlisting

    KEYWORD: shutdown

If the script is not starting a persistent service this is not
necessary.

For optional configuration elements the "=" style of default variable
assignment is preferable to the ":=" style here, since the former sets a
default value only if the variable is unset, and the latter sets one if
the variable is unset *or* null. A user might very well include
something like:

.. code:: programlisting

    doormand_flags=""

in their ``rc.conf.local``, and a variable substitution using ":=" would
inappropriately override the user's intention. The ``_enable`` variable
is not optional, and must use the ":" for the default.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.26.1.?Pre-Commit Checklist
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before contributing a port with an ``rc.d`` script, and more
importantly, before committing one, please consult this checklist to be
sure that it is ready.

The
`devel/rclint <http://www.freebsd.org/cgi/url.cgi?ports/devel/rclint/pkg-descr>`__
port can check for most of these, but it is not a substitute for proper
review.

.. raw:: html

   <div class="procedure">

#. If this is a new file, does it have a ``.sh`` extension? If so, that
   must be changed to just ``file``.in since ``rc.d`` files may not end
   with that extension.

#. Does the file have a ``$FreeBSD$`` tag?

#. Do the name of the file (minus ``.in``), the ``PROVIDE`` line, and
   ``$``\ *``name``* all match? The file name matching ``PROVIDE`` makes
   debugging easier, especially for
   `rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
   issues. Matching the file name and ``$``\ *``name``* makes it easier
   to figure out which variables are relevant in ``rc.conf[.local]``. It
   is also a policy for all new scripts, including those in the base
   system.

#. Is the ``REQUIRE`` line set to ``LOGIN``? This is mandatory for
   scripts that run as a non-root user. If it runs as root, is there a
   good reason for it to run prior to ``LOGIN``? If not, it must run
   after so that local scrips can be loosely grouped to a point in
   `rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
   after most everything in the base is already running.

#. Does the script start a persistent service? If so, it must have
   ``KEYWORD:           shutdown``.

#. Make sure there is no ``KEYWORD: FreeBSD`` present. This has not been
   necessary or desirable for years. It is also an indication that the
   new script was copy/pasted from an old script, so extra caution must
   be given to the review.

#. If the script uses an interpreted language like ``perl``, ``python``,
   or ``ruby``, make certain that ``command_interpreter`` is set
   appropriately, for example, for Perl, by adding ``PERL=${PERL}`` to
   ``SUB_LIST`` and using ``%%PERL%%``. Otherwise,

   .. code:: screen

       # service name stop

   will probably not work properly. See
   `service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__
   for more information.

#. Have all occurrences of ``/usr/local`` been replaced with
   ``%%PREFIX%%``?

#. Do the default variable assignments come after ``load_rc_config``?

#. Are there default assignments to empty strings? They should be
   removed, but double-check that the option is documented in the
   comments at the top of the file.

#. Are things that are set in variables actually used in the script?

#. Are options listed in the default *``name``*\ ``_flags`` things that
   are actually mandatory? If so, they must be in ``command_args``. The
   ``-d`` option is a red flag (pardon the pun) here, since it is
   usually the option to “daemonize” the process, and therefore is
   actually mandatory.

#. ``name``\ \_flags must never be included in ``command_args`` (and
   vice versa, although that error is less common).

#. Does the script execute any code unconditionally? This is frowned on.
   Usually these things must be dealt with through a ``start_precmd``.

#. All boolean tests must use the ``checkyesno`` function. No
   hand-rolled tests for ``[Yy][Ee][Ss]``, etc.

#. If there is a loop (for example, waiting for something to start) does
   it have a counter to terminate the loop? We do not want the boot to
   be stuck forever if there is an error.

#. Does the script create files or directories that need specific
   permissions, for example, a ``pid`` that needs to be owned by the
   user that runs the process? Rather than the traditional
   `touch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=touch&sektion=1>`__/`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__/`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
   routine, consider using
   `install(1) <http://www.FreeBSD.org/cgi/man.cgi?query=install&sektion=1>`__
   with the proper command line arguments to do the whole procedure with
   one step.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+---------------------------------------+
| `Prev <using-databases.html>`__?   | `Up <special.html>`__   | ?\ `Next <users-and-groups.html>`__   |
+------------------------------------+-------------------------+---------------------------------------+
| 6.25.?Using Databases?             | `Home <index.html>`__   | ?6.27.?Adding Users and Groups        |
+------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
