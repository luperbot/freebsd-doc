============================================
8.?Giving more flexibility to an rc.d script
============================================

.. raw:: html

   <div class="navheader">

8.?Giving more flexibility to an rc.d script
`Prev <rcng-hookup.html>`__?
?
?\ `Next <rcng-furthur.html>`__

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

8.?Giving more flexibility to an rc.d script
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When invoked during startup or shutdown, an ``rc.d`` script is supposed
to act on the entire subsystem it is responsible for. E.g.,
``/etc/rc.d/netif`` should start or stop all network interfaces
described by
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.
Either task can be uniquely indicated by a single command argument such
as ``start`` or ``stop``. Between startup and shutdown, ``rc.d`` scripts
help the admin to control the running system, and it is when the need
for more flexibility and precision arises. For instance, the admin may
want to add the settings of a new network interface to
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
and then to start it without interfering with the operation of the
existing interfaces. Next time the admin may need to shut down a single
network interface. In the spirit of the command line, the respective
``rc.d`` script calls for an extra argument, the interface name.

Fortunately,
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
allows for passing any number of arguments to script's methods (within
the system limits). Due to that, the changes in the script itself can be
minimal.

How can
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
gain access to the extra command-line arguments. Should it just grab
them directly? Not by any means. Firstly, an
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
function has no access to the positional parameters of its caller, but
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
is just a sack of such functions. Secondly, the good manner of ``rc.d``
dictates that it is for the main script to decide which arguments are to
be passed to its methods.

So the approach adopted by
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
is as follows: ``run_rc_command`` passes on all its arguments but the
first one to the respective method verbatim. The first, omitted,
argument is the name of the method itself: ``start``, ``stop``, etc. It
will be shifted out by ``run_rc_command``, so what is ``$2`` in the
original command line will be presented as ``$1`` to the method, and so
on.

To illustrate this opportunity, let us modify the primitive dummy script
so that its messages depend on the additional arguments supplied. Here
we go:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    #!/bin/sh

    . /etc/rc.subr

    name="dummy"
    start_cmd="${name}_start"
    stop_cmd=":"
    kiss_cmd="${name}_kiss"
    extra_commands="kiss"

    dummy_start()
    {
            if [ $# -gt 0 ]; then
                    echo "Greeting message: $*"
            else
                    echo "Nothing started."
            fi
    }

    dummy_kiss()
    {
            echo -n "A ghost gives you a kiss"
            if [ $# -gt 0 ]; then
                    echo -n " and whispers: $*"
            fi
            case "$*" in
            *[.!?])
                    echo
                    ;;
            *)
                    echo .
                    ;;
            esac
    }

    load_rc_config $name
    run_rc_command "$@"

.. raw:: html

   </div>

What essential changes can we notice in the script?

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#rcng-args-start>`__           | All arguments you type after         |
|                                      | ``start`` can end up as positional   |
|                                      | parameters to the respective method. |
|                                      | We can use them in any way according |
|                                      | to our task, skills, and fancy. In   |
|                                      | the current example, we just pass    |
|                                      | all of them to                       |
|                                      | `echo(1) <http://www.FreeBSD.org/cgi |
|                                      | /man.cgi?query=echo&sektion=1>`__    |
|                                      | as one string in the next line —     |
|                                      | note ``$*`` within the double        |
|                                      | quotes. Here is how the script can   |
|                                      | be invoked now:                      |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     # /etc/rc.d/dummy start          |
|                                      |     Nothing started.                 |
|                                      |     # /etc/rc.d/dummy start Hello wo |
|                                      | rld!                                 |
|                                      |     Greeting message: Hello world!   |
+--------------------------------------+--------------------------------------+
| `|2| <#rcng-args-kiss>`__            | The same applies to any method our   |
|                                      | script provides, not only to a       |
|                                      | standard one. We have added a custom |
|                                      | method named ``kiss``, and it can    |
|                                      | take advantage of the extra          |
|                                      | arguments not less than ``start``    |
|                                      | does. E.g.:                          |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     # /etc/rc.d/dummy kiss           |
|                                      |     A ghost gives you a kiss.        |
|                                      |     # /etc/rc.d/dummy kiss Once I wa |
|                                      | s Etaoin Shrdlu...                   |
|                                      |     A ghost gives you a kiss and whi |
|                                      | spers: Once I was Etaoin Shrdlu...   |
+--------------------------------------+--------------------------------------+
| `|3| <#rcng-args-all>`__             | If we want just to pass all extra    |
|                                      | arguments to any method, we can      |
|                                      | merely substitute ``"$@"`` for       |
|                                      | ``"$1"`` in the last line of our     |
|                                      | script, where we invoke              |
|                                      | ``run_rc_command``.                  |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="important" xmlns="">  |
|                                      |                                      |
|                                      | Important:                           |
|                                      | ~~~~~~~~~~                           |
|                                      |                                      |
|                                      | An                                   |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | programmer ought to understand the   |
|                                      | subtle difference between ``$*`` and |
|                                      | ``$@`` as the ways to designate all  |
|                                      | positional parameters. For its       |
|                                      | in-depth discussion, refer to a good |
|                                      | handbook on                          |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | scripting. *Do not* use the          |
|                                      | expressions until you fully          |
|                                      | understand them because their misuse |
|                                      | will result in buggy and insecure    |
|                                      | scripts.                             |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | Currently ``run_rc_command`` may     |
|                                      | have a bug that prevents it from     |
|                                      | keeping the original boundaries      |
|                                      | between arguments. That is,          |
|                                      | arguments with embedded whitespace   |
|                                      | may not be processed correctly. The  |
|                                      | bug stems from ``$*`` misuse.        |
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

+-------------------------------------------------+-------------------------+-----------------------------------+
| `Prev <rcng-hookup.html>`__?                    | ?                       | ?\ `Next <rcng-furthur.html>`__   |
+-------------------------------------------------+-------------------------+-----------------------------------+
| 7.?Connecting a script to the rc.d framework?   | `Home <index.html>`__   | ?9.?Further reading               |
+-------------------------------------------------+-------------------------+-----------------------------------+

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
