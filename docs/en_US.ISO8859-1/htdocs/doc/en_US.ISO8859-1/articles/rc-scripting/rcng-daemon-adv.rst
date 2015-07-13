=============================================
6.?Startup and shutdown of an advanced daemon
=============================================

.. raw:: html

   <div class="navheader">

6.?Startup and shutdown of an advanced daemon
`Prev <rcng-daemon.html>`__?
?
?\ `Next <rcng-hookup.html>`__

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

6.?Startup and shutdown of an advanced daemon
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Let us add some meat onto the bones of the previous script and make it
more complex and featureful. The default methods can do a good job for
us, but we may need some of their aspects tweaked. Now we will learn how
to tune the default methods to our needs.

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    #!/bin/sh

    . /etc/rc.subr

    name=mumbled
    rcvar=mumbled_enable

    command="/usr/sbin/${name}"
    command_args="mock arguments > /dev/null 2>&1"

    pidfile="/var/run/${name}.pid"

    required_files="/etc/${name}.conf /usr/share/misc/${name}.rules"

    sig_reload="USR1"

    start_precmd="${name}_prestart"
    stop_postcmd="echo Bye-bye"

    extra_commands="reload plugh xyzzy"

    plugh_cmd="mumbled_plugh"
    xyzzy_cmd="echo 'Nothing happens.'"

    mumbled_prestart()
    {
        if checkyesno mumbled_smart; then
            rc_flags="-o smart ${rc_flags}"
        fi
        case "$mumbled_mode" in
        foo)
            rc_flags="-frotz ${rc_flags}"
            ;;
        bar)
            rc_flags="-baz ${rc_flags}"
            ;;
        *)
            warn "Invalid value for mumbled_mode"
            return 1
            ;;
        esac
        run_rc_command xyzzy
        return 0
    }

    mumbled_plugh()
    {
        echo 'A hollow voice says "plugh".'
    }

    load_rc_config $name
    run_rc_command "$1"

.. raw:: html

   </div>

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#rcng-daemon-adv-args>`__      | Additional arguments to ``$command`` |
|                                      | can be passed in ``command_args``.   |
|                                      | They will be added to the command    |
|                                      | line after ``$mumbled_flags``. Since |
|                                      | the final command line is passed to  |
|                                      | ``eval`` for its actual execution,   |
|                                      | input and output redirections can be |
|                                      | specified in ``command_args``.       |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | *Never* include dashed options, like |
|                                      | ``-X`` or ``--foo``, in              |
|                                      | ``command_args``. The contents of    |
|                                      | ``command_args`` will appear at the  |
|                                      | end of the final command line, hence |
|                                      | they are likely to follow arguments  |
|                                      | present in ``${name}_flags``; but    |
|                                      | most commands will not recognize     |
|                                      | dashed options after ordinary        |
|                                      | arguments. A better way of passing   |
|                                      | additional options to ``$command``   |
|                                      | is to add them to the beginning of   |
|                                      | ``${name}_flags``. Another way is to |
|                                      | modify ``rc_flags`` `as shown        |
|                                      | later <rcng-daemon-adv.html#rc-flags |
|                                      | >`__.                                |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|2| <#rcng-daemon-adv-pid>`__       | A good-mannered daemon should create |
|                                      | a *pidfile* so that its process can  |
|                                      | be found more easily and reliably.   |
|                                      | The variable ``pidfile``, if set,    |
|                                      | tells                                |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | where it can find the pidfile for    |
|                                      | its default methods to use.          |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | In fact,                             |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | will also use the pidfile to see if  |
|                                      | the daemon is already running before |
|                                      | starting it. This check can be       |
|                                      | skipped by using the ``faststart``   |
|                                      | argument.                            |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|3| <#rcng-daemon-adv-reqfiles>`__  | If the daemon cannot run unless      |
|                                      | certain files exist, just list them  |
|                                      | in ``required_files``, and           |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | will check that those files do exist |
|                                      | before starting the daemon. There    |
|                                      | also are ``required_dirs`` and       |
|                                      | ``required_vars`` for directories    |
|                                      | and environment variables,           |
|                                      | respectively. They all are described |
|                                      | in detail in                         |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | The default method from              |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | can be forced to skip the            |
|                                      | prerequisite checks by using         |
|                                      | ``forcestart`` as the argument to    |
|                                      | the script.                          |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|4| <#rcng-daemon-adv-sig>`__       | We can customize signals to send to  |
|                                      | the daemon in case they differ from  |
|                                      | the well-known ones. In particular,  |
|                                      | ``sig_reload`` specifies the signal  |
|                                      | that makes the daemon reload its     |
|                                      | configuration; it is SIGHUP by       |
|                                      | default. Another signal is sent to   |
|                                      | stop the daemon process; the default |
|                                      | is SIGTERM, but this can be changed  |
|                                      | by setting ``sig_stop``              |
|                                      | appropriately.                       |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | The signal names should be specified |
|                                      | to                                   |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | without the ``SIG`` prefix, as it is |
|                                      | shown in the example. The FreeBSD    |
|                                      | version of                           |
|                                      | `kill(1) <http://www.FreeBSD.org/cgi |
|                                      | /man.cgi?query=kill&sektion=1>`__    |
|                                      | can recognize the ``SIG`` prefix,    |
|                                      | but the versions from other OS types |
|                                      | may not.                             |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|5| <#rcng-daemon-adv-precmd>`__    | Performing additional tasks before   |
| `|6| <#rcng-daemon-adv-postcmd>`__   | or after the default methods is      |
|                                      | easy. For each command-argument      |
|                                      | supported by our script, we can      |
|                                      | define ``argument``\ \_precmd and    |
|                                      | ``argument``\ \_postcmd. These       |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | commands are invoked before and      |
|                                      | after the respective method, as it   |
|                                      | is evident from their names.         |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | Overriding a default method with a   |
|                                      | custom ``argument``\ \_cmd still     |
|                                      | does not prevent us from making use  |
|                                      | of ``argument``\ \_precmd or         |
|                                      | ``argument``\ \_postcmd if we need   |
|                                      | to. In particular, the former is     |
|                                      | good for checking custom,            |
|                                      | sophisticated conditions that should |
|                                      | be met before performing the command |
|                                      | itself. Using ``argument``\ \_precmd |
|                                      | along with ``argument``\ \_cmd lets  |
|                                      | us logically separate the checks     |
|                                      | from the action.                     |
|                                      |                                      |
|                                      | Do not forget that you can cram any  |
|                                      | valid                                |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | expressions into the methods, pre-,  |
|                                      | and post-commands you define. Just   |
|                                      | invoking a function that makes the   |
|                                      | real job is a good style in most     |
|                                      | cases, but never let style limit     |
|                                      | your understanding of what is going  |
|                                      | on behind the curtain.               |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|7| <#rcng-daemon-adv-extra>`__     | If we would like to implement custom |
|                                      | arguments, which can also be thought |
|                                      | of as *commands* to our script, we   |
|                                      | need to list them in                 |
|                                      | ``extra_commands`` and provide       |
|                                      | methods to handle them.              |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | The ``reload`` command is special.   |
|                                      | On the one hand, it has a preset     |
|                                      | method in                            |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
|                                      | On the other hand, ``reload`` is not |
|                                      | offered by default. The reason is    |
|                                      | that not all daemons use the same    |
|                                      | reload mechanism and some have       |
|                                      | nothing to reload at all. So we need |
|                                      | to ask explicitly that the builtin   |
|                                      | functionality be provided. We can do |
|                                      | so via ``extra_commands``.           |
|                                      |                                      |
|                                      | What do we get from the default      |
|                                      | method for ``reload``? Quite often   |
|                                      | daemons reload their configuration   |
|                                      | upon reception of a signal —         |
|                                      | typically, SIGHUP. Therefore         |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | attempts to reload the daemon by     |
|                                      | sending a signal to it. The signal   |
|                                      | is preset to SIGHUP but can be       |
|                                      | customized via ``sig_reload`` if     |
|                                      | necessary.                           |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|8| <#rcng-daemon-adv-methods>`__   | Our script supports two non-standard |
| `|14| <#rcng-daemon-adv-plugh>`__    | commands, ``plugh`` and ``xyzzy``.   |
|                                      | We saw them listed in                |
|                                      | ``extra_commands``, and now it is    |
|                                      | time to provide methods for them.    |
|                                      | The method for ``xyzzy`` is just     |
|                                      | inlined while that for ``plugh`` is  |
|                                      | implemented as the ``mumbled_plugh`` |
|                                      | function.                            |
|                                      |                                      |
|                                      | Non-standard commands are not        |
|                                      | invoked during startup or shutdown.  |
|                                      | Usually they are for the system      |
|                                      | admin's convenience. They can also   |
|                                      | be used from other subsystems, e.g., |
|                                      | `devd(8) <http://www.FreeBSD.org/cgi |
|                                      | /man.cgi?query=devd&sektion=8>`__    |
|                                      | if specified in                      |
|                                      | `devd.conf(5) <http://www.FreeBSD.or |
|                                      | g/cgi/man.cgi?query=devd.conf&sektio |
|                                      | n=5>`__.                             |
|                                      |                                      |
|                                      | The full list of available commands  |
|                                      | can be found in the usage line       |
|                                      | printed by                           |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | when the script is invoked without   |
|                                      | arguments. For example, here is the  |
|                                      | usage line from the script under     |
|                                      | study:                               |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     # /etc/rc.d/mumbled              |
|                                      |     Usage: /etc/rc.d/mumbled [fast|f |
|                                      | orce|one](start|stop|restart|rcvar|r |
|                                      | eload|plugh|xyzzy|status|poll)       |
+--------------------------------------+--------------------------------------+
| `|13| <#rcng-daemon-adv-run>`__      | A script can invoke its own standard |
|                                      | or non-standard commands if needed.  |
|                                      | This may look similar to calling     |
|                                      | functions, but we know that commands |
|                                      | and shell functions are not always   |
|                                      | the same thing. For instance,        |
|                                      | ``xyzzy`` is not implemented as a    |
|                                      | function here. In addition, there    |
|                                      | can be a pre-command and             |
|                                      | post-command, which should be        |
|                                      | invoked orderly. So the proper way   |
|                                      | for a script to run its own command  |
|                                      | is by means of                       |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__,                                 |
|                                      | as shown in the example.             |
+--------------------------------------+--------------------------------------+
| `|9| <#rcng-daemon-adv-yn>`__        | A handy function named               |
|                                      | ``checkyesno`` is provided by        |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
|                                      | It takes a variable name as its      |
|                                      | argument and returns a zero exit     |
|                                      | code if and only if the variable is  |
|                                      | set to ``YES``, or ``TRUE``, or      |
|                                      | ``ON``, or ``1``, case insensitive;  |
|                                      | a non-zero exit code is returned     |
|                                      | otherwise. In the latter case, the   |
|                                      | function tests the variable for      |
|                                      | being set to ``NO``, ``FALSE``,      |
|                                      | ``OFF``, or ``0``, case insensitive; |
|                                      | it prints a warning message if the   |
|                                      | variable contains anything else,     |
|                                      | i.e., junk.                          |
|                                      |                                      |
|                                      | Keep in mind that for                |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | a zero exit code means true and a    |
|                                      | non-zero exit code means false.      |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="important" xmlns="">  |
|                                      |                                      |
|                                      | Important:                           |
|                                      | ~~~~~~~~~~                           |
|                                      |                                      |
|                                      | The ``checkyesno`` function takes a  |
|                                      | *variable name*. Do not pass the     |
|                                      | expanded *value* of a variable to    |
|                                      | it; it will not work as expected.    |
|                                      |                                      |
|                                      | The following is the correct usage   |
|                                      | of ``checkyesno``:                   |
|                                      |                                      |
|                                      | .. code:: programlisting             |
|                                      |                                      |
|                                      |     if checkyesno mumbled_enable; th |
|                                      | en                                   |
|                                      |             foo                      |
|                                      |     fi                               |
|                                      |                                      |
|                                      | On the contrary, calling             |
|                                      | ``checkyesno`` as shown below will   |
|                                      | not work — at least not as expected: |
|                                      |                                      |
|                                      | .. code:: programlisting             |
|                                      |                                      |
|                                      |     if checkyesno "${mumbled_enable} |
|                                      | "; then                              |
|                                      |             foo                      |
|                                      |     fi                               |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|10| <#rcng-daemon-adv-rcflags>`__  | We can affect the flags to be passed |
|                                      | to ``$command`` by modifying         |
|                                      | ``rc_flags`` in ``$start_precmd``.   |
+--------------------------------------+--------------------------------------+
| `|11| <#rcng-daemon-adv-warn>`__     | In certain cases we may need to emit |
|                                      | an important message that should go  |
|                                      | to syslog as well. This can be done  |
|                                      | easily with the following            |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | functions: ``debug``, ``info``,      |
|                                      | ``warn``, and ``err``. The latter    |
|                                      | function then exits the script with  |
|                                      | the code specified.                  |
+--------------------------------------+--------------------------------------+
| `|12| <#rcng-daemon-adv-preret>`__   | The exit codes from methods and      |
|                                      | their pre-commands are not just      |
|                                      | ignored by default. If               |
|                                      | ``argument``\ \_precmd returns a     |
|                                      | non-zero exit code, the main method  |
|                                      | will not be performed. In turn,      |
|                                      | ``argument``\ \_postcmd will not be  |
|                                      | invoked unless the main method       |
|                                      | returns a zero exit code.            |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | However,                             |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | can be instructed from the command   |
|                                      | line to ignore those exit codes and  |
|                                      | invoke all commands anyway by        |
|                                      | prefixing an argument with           |
|                                      | ``force``, as in ``forcestart``.     |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------+-------------------------------------------------+
| `Prev <rcng-daemon.html>`__?                  | ?                       | ?\ `Next <rcng-hookup.html>`__                  |
+-----------------------------------------------+-------------------------+-------------------------------------------------+
| 5.?Startup and shutdown of a simple daemon?   | `Home <index.html>`__   | ?7.?Connecting a script to the rc.d framework   |
+-----------------------------------------------+-------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |14| image:: ./imagelib/callouts/14.png
.. |13| image:: ./imagelib/callouts/13.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
.. |11| image:: ./imagelib/callouts/11.png
.. |12| image:: ./imagelib/callouts/12.png
