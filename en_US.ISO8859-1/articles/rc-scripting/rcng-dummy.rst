=================
3.?A dummy script
=================

.. raw:: html

   <div class="navheader">

3.?A dummy script
`Prev <rcng-task.html>`__?
?
?\ `Next <rcng-confdummy.html>`__

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

3.?A dummy script
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following script just emits a message each time the system boots up:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    #!/bin/sh

    . /etc/rc.subr

    name="dummy"
    start_cmd="${name}_start"
    stop_cmd=":"

    dummy_start()
    {
        echo "Nothing started."
    }

    load_rc_config $name
    run_rc_command "$1"

.. raw:: html

   </div>

Things to note are:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#rcng-dummy-shebang>`__        | An interpreted script should begin   |
|                                      | with the magic “shebang” line. That  |
|                                      | line specifies the interpreter       |
|                                      | program for the script. Due to the   |
|                                      | shebang line, the script can be      |
|                                      | invoked exactly like a binary        |
|                                      | program provided that it has the     |
|                                      | execute bit set. (See                |
|                                      | `chmod(1) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=chmod&sektion=1>`__. |
|                                      | )                                    |
|                                      | For example, a system admin can run  |
|                                      | our script manually, from the        |
|                                      | command line:                        |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     # /etc/rc.d/dummy start          |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | In order to be properly managed by   |
|                                      | the ``rc.d`` framework, its scripts  |
|                                      | need to be written in the            |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | language. If you have a service or   |
|                                      | port that uses a binary control      |
|                                      | utility or a startup routine written |
|                                      | in another language, install that    |
|                                      | element in ``/usr/sbin`` (for the    |
|                                      | system) or ``/usr/local/sbin`` (for  |
|                                      | ports) and call it from a            |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | script in the appropriate ``rc.d``   |
|                                      | directory.                           |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="tip" xmlns="">        |
|                                      |                                      |
|                                      | Tip:                                 |
|                                      | ~~~~                                 |
|                                      |                                      |
|                                      | If you would like to learn the       |
|                                      | details of why ``rc.d`` scripts must |
|                                      | be written in the                    |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | language, see how ``/etc/rc``        |
|                                      | invokes them by means of             |
|                                      | ``run_rc_script``, then study the    |
|                                      | implementation of ``run_rc_script``  |
|                                      | in ``/etc/rc.subr``.                 |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|2| <#rcng-dummy-include>`__        | In ``/etc/rc.subr``, a number of     |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | functions are defined for an         |
|                                      | ``rc.d`` script to use. The          |
|                                      | functions are documented in          |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
|                                      | While it is theoretically possible   |
|                                      | to write an ``rc.d`` script without  |
|                                      | ever using                           |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__,                                 |
|                                      | its functions prove extremely handy  |
|                                      | and make the job an order of         |
|                                      | magnitude easier. So it is no        |
|                                      | surprise that everybody resorts to   |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | in ``rc.d`` scripts. We are not      |
|                                      | going to be an exception.            |
|                                      |                                      |
|                                      | An ``rc.d`` script must “source”     |
|                                      | ``/etc/rc.subr`` (include it using   |
|                                      | “``.``”) *before* it calls           |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | functions so that                    |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | has an opportunity to learn the      |
|                                      | functions. The preferred style is to |
|                                      | source ``/etc/rc.subr`` first of     |
|                                      | all.                                 |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | Some useful functions related to     |
|                                      | networking are provided by another   |
|                                      | include file, ``/etc/network.subr``. |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|3| <#rcng-dummy-name>`__           | The mandatory variable ``name``      |
|                                      | specifies the name of our script. It |
|                                      | is required by                       |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__.                                 |
|                                      | That is, each ``rc.d`` script *must* |
|                                      | set ``name`` before it calls         |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | functions.                           |
|                                      |                                      |
|                                      | Now it is the right time to choose a |
|                                      | unique name for our script once and  |
|                                      | for all. We will use it in a number  |
|                                      | of places while developing the       |
|                                      | script. For a start, let us give the |
|                                      | same name to the script file, too.   |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | The current style of ``rc.d``        |
|                                      | scripting is to enclose values       |
|                                      | assigned to variables in double      |
|                                      | quotes. Keep in mind that it is just |
|                                      | a style issue that may not always be |
|                                      | applicable. You can safely omit      |
|                                      | quotes from around simple words      |
|                                      | without                              |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | metacharacters in them, while in     |
|                                      | certain cases you will need single   |
|                                      | quotes to prevent any interpretation |
|                                      | of the value by                      |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__.       |
|                                      | A programmer should be able to tell  |
|                                      | the language syntax from style       |
|                                      | conventions and use both of them     |
|                                      | wisely.                              |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|4| <#rcng-dummy-startcmd>`__       | The main idea behind                 |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | is that an ``rc.d`` script provides  |
|                                      | handlers, or methods, for            |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | to invoke. In particular, ``start``, |
|                                      | ``stop``, and other arguments to an  |
|                                      | ``rc.d`` script are handled this     |
|                                      | way. A method is a                   |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | expression stored in a variable      |
|                                      | named ``argument``\ \_cmd, where     |
|                                      | *``argument``* corresponds to what   |
|                                      | can be specified on the script's     |
|                                      | command line. We will see later how  |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | provides default methods for the     |
|                                      | standard arguments.                  |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | To make the code in ``rc.d`` more    |
|                                      | uniform, it is common to use         |
|                                      | ``${name}`` wherever appropriate.    |
|                                      | Thus a number of lines can be just   |
|                                      | copied from one script to another.   |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|5| <#rcng-dummy-stopcmd>`__        | We should keep in mind that          |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | provides default methods for the     |
|                                      | standard arguments. Consequently, we |
|                                      | must override a standard method with |
|                                      | a no-op                              |
|                                      | `sh(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=sh&sektion=1>`__        |
|                                      | expression if we want it to do       |
|                                      | nothing.                             |
+--------------------------------------+--------------------------------------+
| `|6| <#rcng-dummy-startfn>`__        | The body of a sophisticated method   |
|                                      | can be implemented as a function. It |
|                                      | is a good idea to make the function  |
|                                      | name meaningful.                     |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="important" xmlns="">  |
|                                      |                                      |
|                                      | Important:                           |
|                                      | ~~~~~~~~~~                           |
|                                      |                                      |
|                                      | It is strongly recommended to add    |
|                                      | the prefix ``${name}`` to the names  |
|                                      | of all functions defined in our      |
|                                      | script so they never clash with the  |
|                                      | functions from                       |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | or another common include file.      |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|7| <#rcng-dummy-loadconfig>`__     | This call to                         |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | loads                                |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables. Our script makes no use   |
|                                      | of them yet, but it still is         |
|                                      | recommended to load                  |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | because there can be                 |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables controlling                |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | itself.                              |
+--------------------------------------+--------------------------------------+
| `|8| <#rcng-dummy-runcommand>`__     | Usually this is the last command in  |
|                                      | an ``rc.d`` script. It invokes the   |
|                                      | `rc.subr(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.subr&sektion=8> |
|                                      | `__                                  |
|                                      | machinery to perform the requested   |
|                                      | action using the variables and       |
|                                      | methods our script has provided.     |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+-------------------------------------+
| `Prev <rcng-task.html>`__?   | ?                       | ?\ `Next <rcng-confdummy.html>`__   |
+------------------------------+-------------------------+-------------------------------------+
| 2.?Outlining the task?       | `Home <index.html>`__   | ?4.?A configurable dummy script     |
+------------------------------+-------------------------+-------------------------------------+

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
