==========================================
5.?Startup and shutdown of a simple daemon
==========================================

.. raw:: html

   <div class="navheader">

5.?Startup and shutdown of a simple daemon
`Prev <rcng-confdummy.html>`__?
?
?\ `Next <rcng-daemon-adv.html>`__

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

5.?Startup and shutdown of a simple daemon
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We said earlier that
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
could provide default methods. Obviously, such defaults cannot be too
general. They are suited for the common case of starting and shutting
down a simple daemon program. Let us assume now that we need to write an
``rc.d`` script for such a daemon called ``mumbled``. Here it is:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    #!/bin/sh

    . /etc/rc.subr

    name=mumbled
    rcvar=mumbled_enable

    command="/usr/sbin/${name}"

    load_rc_config $name
    run_rc_command "$1"

.. raw:: html

   </div>

Pleasingly simple, isn't it? Let us examine our little script. The only
new thing to note is as follows:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#rcng-daemon-basic-cmd>`__     | The ``command`` variable is          |
|                                      | meaningful to                        |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
|                                      | If it is set,                        |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | will act according to the scenario   |
|                                      | of serving a conventional daemon. In |
|                                      | particular, the default methods will |
|                                      | be provided for such arguments:      |
|                                      | ``start``, ``stop``, ``restart``,    |
|                                      | ``poll``, and ``status``.            |
|                                      |                                      |
|                                      | The daemon will be started by        |
|                                      | running ``$command`` with            |
|                                      | command-line flags specified by      |
|                                      | ``$mumbled_flags``. Thus all the     |
|                                      | input data for the default ``start`` |
|                                      | method are available in the          |
|                                      | variables set by our script. Unlike  |
|                                      | ``start``, other methods may require |
|                                      | additional information about the     |
|                                      | process started. For instance,       |
|                                      | ``stop`` must know the PID of the    |
|                                      | process to terminate it. In the      |
|                                      | present case,                        |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | will scan through the list of all    |
|                                      | processes, looking for a process     |
|                                      | with its name equal to               |
|                                      | ``$procname``. The latter is another |
|                                      | variable of meaning to               |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__,                                 |
|                                      | and its value defaults to that of    |
|                                      | ``command``. In other words, when we |
|                                      | set ``command``, ``procname`` is     |
|                                      | effectively set to the same value.   |
|                                      | This enables our script to kill the  |
|                                      | daemon and to check if it is running |
|                                      | in the first place.                  |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | Some programs are in fact executable |
|                                      | scripts. The system runs such a      |
|                                      | script by starting its interpreter   |
|                                      | and passing the name of the script   |
|                                      | to it as a command-line argument.    |
|                                      | This is reflected in the list of     |
|                                      | processes, which can confuse         |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
|                                      | You should additionally set          |
|                                      | ``command_interpreter`` to let       |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | know the actual name of the process  |
|                                      | if ``$command`` is a script.         |
|                                      |                                      |
|                                      | For each ``rc.d`` script, there is   |
|                                      | an optional                          |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variable that takes precedence over  |
|                                      | ``command``. Its name is constructed |
|                                      | as follows: ``${name}_program``,     |
|                                      | where ``name`` is the mandatory      |
|                                      | variable we discussed                |
|                                      | `earlier <rcng-dummy.html#name-var>` |
|                                      | __.                                  |
|                                      | E.g., in this case it will be        |
|                                      | ``mumbled_program``. It is           |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | that arranges ``${name}_program`` to |
|                                      | override ``command``.                |
|                                      |                                      |
|                                      | Of course,                           |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | will permit you to set               |
|                                      | ``${name}_program`` from             |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | or the script itself even if         |
|                                      | ``command`` is unset. In that case,  |
|                                      | the special properties of            |
|                                      | ``${name}_program`` are lost, and it |
|                                      | becomes an ordinary variable your    |
|                                      | script can use for its own purposes. |
|                                      | However, the sole use of             |
|                                      | ``${name}_program`` is discouraged   |
|                                      | because using it together with       |
|                                      | ``command`` became an idiom of       |
|                                      | ``rc.d`` scripting.                  |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
|                                      |                                      |
|                                      | For more detailed information on     |
|                                      | default methods, refer to            |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+--------------------------------------------------+
| `Prev <rcng-confdummy.html>`__?   | ?                       | ?\ `Next <rcng-daemon-adv.html>`__               |
+-----------------------------------+-------------------------+--------------------------------------------------+
| 4.?A configurable dummy script?   | `Home <index.html>`__   | ?6.?Startup and shutdown of an advanced daemon   |
+-----------------------------------+-------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
