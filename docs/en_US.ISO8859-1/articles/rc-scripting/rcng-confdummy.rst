==============================
4.?A configurable dummy script
==============================

.. raw:: html

   <div class="navheader">

4.?A configurable dummy script
`Prev <rcng-dummy.html>`__?
?
?\ `Next <rcng-daemon.html>`__

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

4.?A configurable dummy script
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now let us add some controls to our dummy script. As you may know,
``rc.d`` scripts are controlled with
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.
Fortunately,
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
hides all the complications from us. The following script uses
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
via
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
to see whether it is enabled in the first place, and to fetch a message
to show at boot time. These two tasks in fact are independent. On the
one hand, an ``rc.d`` script can just support enabling and disabling its
service. On the other hand, a mandatory ``rc.d`` script can have
configuration variables. We will do both things in the same script
though:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    #!/bin/sh

    . /etc/rc.subr

    name=dummy
    rcvar=dummy_enable

    start_cmd="${name}_start"
    stop_cmd=":"

    load_rc_config $name
    : ${dummy_enable:=no} 
    : ${dummy_msg="Nothing started."}

    dummy_start()
    {
        echo "$dummy_msg"
    }

    run_rc_command "$1"

.. raw:: html

   </div>

What changed in this example?

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#rcng-confdummy-rcvar>`__      | The variable ``rcvar`` specifies the |
|                                      | name of the ON/OFF knob variable.    |
+--------------------------------------+--------------------------------------+
| `|2| <#rcng-confdummy-loadconfig>`__ | Now ``load_rc_config`` is invoked    |
|                                      | earlier in the script, before any    |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables are accessed.              |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | While examining ``rc.d`` scripts,    |
|                                      | keep in mind that                    |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | defers the evaluation of expressions |
|                                      | in a function until the latter is    |
|                                      | called. Therefore it is not an error |
|                                      | to invoke ``load_rc_config`` as late |
|                                      | as just before ``run_rc_command``    |
|                                      | and still access                     |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables from the method functions  |
|                                      | exported to ``run_rc_command``. This |
|                                      | is because the method functions are  |
|                                      | to be called by ``run_rc_command``,  |
|                                      | which is invoked *after*             |
|                                      | ``load_rc_config``.                  |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|3| <#rcng-confdummy-enable>`__     | A warning will be emitted by         |
|                                      | ``run_rc_command`` if ``rcvar``      |
|                                      | itself is set, but the indicated     |
|                                      | knob variable is unset. If your      |
|                                      | ``rc.d`` script is for the base      |
|                                      | system, you should add a default     |
|                                      | setting for the knob to              |
|                                      | ``/etc/defaults/rc.conf`` and        |
|                                      | document it in                       |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__.                                 |
|                                      | Otherwise it is your script that     |
|                                      | should provide a default setting for |
|                                      | the knob. The canonical approach to  |
|                                      | the latter case is shown in the      |
|                                      | example.                             |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | You can make                         |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | act as though the knob is set to     |
|                                      | ``ON``, irrespective of its current  |
|                                      | setting, by prefixing the argument   |
|                                      | to the script with ``one`` or        |
|                                      | ``force``, as in ``onestart`` or     |
|                                      | ``forcestop``. Keep in mind though   |
|                                      | that ``force`` has other dangerous   |
|                                      | effects we will touch upon below,    |
|                                      | while ``one`` just overrides the     |
|                                      | ON/OFF knob. E.g., assume that       |
|                                      | ``dummy_enable`` is ``OFF``. The     |
|                                      | following command will run the       |
|                                      | ``start`` method in spite of the     |
|                                      | setting:                             |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     # /etc/rc.d/dummy onestart       |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|4| <#rcng-confdummy-opt>`__        | Now the message to be shown at boot  |
|                                      | time is no longer hard-coded in the  |
|                                      | script. It is specified by an        |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variable named ``dummy_msg``. This   |
|                                      | is a trivial example of how          |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables can control an ``rc.d``    |
|                                      | script.                              |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="important" xmlns="">  |
|                                      |                                      |
|                                      | Important:                           |
|                                      | ~~~~~~~~~~                           |
|                                      |                                      |
|                                      | The names of all                     |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables used exclusively by our    |
|                                      | script *must* have the same prefix:  |
|                                      | ``${name}_``. For example:           |
|                                      | ``dummy_mode``,                      |
|                                      | ``dummy_state_file``, and so on.     |
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
|                                      | While it is possible to use a        |
|                                      | shorter name internally, e.g., just  |
|                                      | ``msg``, adding the unique prefix    |
|                                      | ``${name}_`` to all global names     |
|                                      | introduced by our script will save   |
|                                      | us from possible collisions with the |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | namespace.                           |
|                                      |                                      |
|                                      | As a rule, ``rc.d`` scripts of the   |
|                                      | base system need not provide         |
|                                      | defaults for their                   |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables because the defaults       |
|                                      | should be set in                     |
|                                      | ``/etc/defaults/rc.conf`` instead.   |
|                                      | On the other hand, ``rc.d`` scripts  |
|                                      | for ports should provide the         |
|                                      | defaults as shown in the example.    |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|5| <#rcng-confdummy-msg>`__        | Here we use ``dummy_msg`` to         |
|                                      | actually control our script, i.e.,   |
|                                      | to emit a variable message. Use of a |
|                                      | shell function is overkill here,     |
|                                      | since it only runs a single command; |
|                                      | an equally valid alternative is:     |
|                                      |                                      |
|                                      | .. code:: programlisting             |
|                                      |                                      |
|                                      |     start_cmd="echo \"$dummy_msg\""  |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+-----------------------------------------------+
| `Prev <rcng-dummy.html>`__?   | ?                       | ?\ `Next <rcng-daemon.html>`__                |
+-------------------------------+-------------------------+-----------------------------------------------+
| 3.?A dummy script?            | `Home <index.html>`__   | ?5.?Startup and shutdown of a simple daemon   |
+-------------------------------+-------------------------+-----------------------------------------------+

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
