============================================
7.?Connecting a script to the rc.d framework
============================================

.. raw:: html

   <div class="navheader">

7.?Connecting a script to the rc.d framework
`Prev <rcng-daemon-adv.html>`__?
?
?\ `Next <rcng-args.html>`__

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

7.?Connecting a script to the rc.d framework
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After a script has been written, it needs to be integrated into
``rc.d``. The crucial step is to install the script in ``/etc/rc.d``
(for the base system) or ``/usr/local/etc/rc.d`` (for ports). Both
<``bsd.prog.mk``\ > and <``bsd.port.mk``\ > provide convenient hooks for
that, and usually you do not have to worry about the proper ownership
and mode. System scripts should be installed from ``src/etc/rc.d``
through the ``Makefile`` found there. Port scripts can be installed
using ``USE_RC_SUBR`` as described `in the Porter's
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook/rc-scripts.html>`__.

However, we should consider beforehand the place of our script in the
system startup sequence. The service handled by our script is likely to
depend on other services. For instance, a network daemon cannot function
without the network interfaces and routing up and running. Even if a
service seems to demand nothing, it can hardly start before the basic
filesystems have been checked and mounted.

We mentioned
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
already. Now it is time to have a close look at it. In a nutshell,
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
takes a set of files, examines their contents, and prints a
dependency-ordered list of files from the set to ``stdout``. The point
is to keep dependency information *inside* the files so that each file
can speak for itself only. A file can specify the following information:

.. raw:: html

   <div class="itemizedlist">

-  the names of the “conditions” (which means services to us) it
   *provides*;

-  the names of the “conditions” it *requires*;

-  the names of the “conditions” this file should run *before*;

-  additional *keywords* that can be used to select a subset from the
   whole set of files
   (`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
   can be instructed via options to include or omit the files having
   particular keywords listed.)

.. raw:: html

   </div>

It is no surprise that
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
can handle only text files with a syntax close to that of
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__. That
is, special lines understood by
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
look like
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
comments. The syntax of such special lines is rather rigid to simplify
their processing. See
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
for details.

Besides using
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
special lines, a script can insist on its dependency upon another
service by just starting it forcibly. This can be needed when the other
service is optional and will not start by itself because the system
admin has disabled it mistakenly in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.

With this general knowledge in mind, let us consider the simple daemon
script enhanced with dependency stuff:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    #!/bin/sh

    # PROVIDE: mumbled oldmumble 
    # REQUIRE: DAEMON cleanvar frotz
    # BEFORE:  LOGIN
    # KEYWORD: nojail shutdown

    . /etc/rc.subr

    name=mumbled
    rcvar=mumbled_enable

    command="/usr/sbin/${name}"
    start_precmd="${name}_prestart"

    mumbled_prestart()
    {
        if ! checkyesno frotz_enable && \
            ! /etc/rc.d/frotz forcestatus 1>/dev/null 2>&1; then
            force_depend frotz || return 1
        fi
        return 0
    }

    load_rc_config $name
    run_rc_command "$1"

.. raw:: html

   </div>

As before, detailed analysis follows:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#rcng-hookup-provide>`__       | That line declares the names of      |
|                                      | “conditions” our script provides.    |
|                                      | Now other scripts can record a       |
|                                      | dependency on our script by those    |
|                                      | names.                               |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | Usually a script specifies a single  |
|                                      | condition provided. However, nothing |
|                                      | prevents us from listing several     |
|                                      | conditions there, e.g., for          |
|                                      | compatibility reasons.               |
|                                      |                                      |
|                                      | In any case, the name of the main,   |
|                                      | or the only, ``PROVIDE:`` condition  |
|                                      | should be the same as ``${name}``.   |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|2| <#rcng-hookup-require>`__       | So our script indicates which        |
| `|3| <#rcng-hookup-before>`__        | “conditions” provided by other       |
|                                      | scripts it depends on. According to  |
|                                      | the lines, our script asks           |
|                                      | `rcorder(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rcorder&sektion=8> |
|                                      | `__                                  |
|                                      | to put it after the script(s)        |
|                                      | providing ``DAEMON`` and             |
|                                      | ``cleanvar``, but before that        |
|                                      | providing ``LOGIN``.                 |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="note" xmlns="">       |
|                                      |                                      |
|                                      | Note:                                |
|                                      | ~~~~~                                |
|                                      |                                      |
|                                      | The ``BEFORE:`` line should not be   |
|                                      | abused to work around an incomplete  |
|                                      | dependency list in the other script. |
|                                      | The appropriate case for using       |
|                                      | ``BEFORE:`` is when the other script |
|                                      | does not care about ours, but our    |
|                                      | script can do its task better if run |
|                                      | before the other one. A typical      |
|                                      | real-life example is the network     |
|                                      | interfaces vs. the firewall: While   |
|                                      | the interfaces do not depend on the  |
|                                      | firewall in doing their job, the     |
|                                      | system security will benefit from    |
|                                      | the firewall being ready before      |
|                                      | there is any network traffic.        |
|                                      |                                      |
|                                      | Besides conditions corresponding to  |
|                                      | a single service each, there are     |
|                                      | meta-conditions and their            |
|                                      | “placeholder” scripts used to ensure |
|                                      | that certain groups of operations    |
|                                      | are performed before others. These   |
|                                      | are denoted by ``UPPERCASE`` names.  |
|                                      | Their list and purposes can be found |
|                                      | in                                   |
|                                      | `rc(8) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=rc&sektion=8>`__.       |
|                                      |                                      |
|                                      | Keep in mind that putting a service  |
|                                      | name in the ``REQUIRE:`` line does   |
|                                      | not guarantee that the service will  |
|                                      | actually be running by the time our  |
|                                      | script starts. The required service  |
|                                      | may fail to start or just be         |
|                                      | disabled in                          |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__.                                 |
|                                      | Obviously,                           |
|                                      | `rcorder(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rcorder&sektion=8> |
|                                      | `__                                  |
|                                      | cannot track such details, and       |
|                                      | `rc(8) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=rc&sektion=8>`__        |
|                                      | will not do that either.             |
|                                      | Consequently, the application        |
|                                      | started by our script should be able |
|                                      | to cope with any required services   |
|                                      | being unavailable. In certain cases, |
|                                      | we can help it as discussed          |
|                                      | `below. <rcng-hookup.html#forcedep>` |
|                                      | __                                   |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|4| <#rcng-hookup-keyword>`__       | As we remember from the above text,  |
|                                      | `rcorder(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rcorder&sektion=8> |
|                                      | `__                                  |
|                                      | keywords can be used to select or    |
|                                      | leave out some scripts. Namely any   |
|                                      | `rcorder(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rcorder&sektion=8> |
|                                      | `__                                  |
|                                      | consumer can specify through ``-k``  |
|                                      | and ``-s`` options which keywords    |
|                                      | are on the “keep list” and “skip     |
|                                      | list”, respectively. From all the    |
|                                      | files to be dependency sorted,       |
|                                      | `rcorder(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rcorder&sektion=8> |
|                                      | `__                                  |
|                                      | will pick only those having a        |
|                                      | keyword from the keep list (unless   |
|                                      | empty) and not having a keyword from |
|                                      | the skip list.                       |
|                                      |                                      |
|                                      | In FreeBSD,                          |
|                                      | `rcorder(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rcorder&sektion=8> |
|                                      | `__                                  |
|                                      | is used by ``/etc/rc`` and           |
|                                      | ``/etc/rc.shutdown``. These two      |
|                                      | scripts define the standard list of  |
|                                      | FreeBSD ``rc.d`` keywords and their  |
|                                      | meanings as follows:                 |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="variablelist">        |
|                                      |                                      |
|                                      | ``nojail``                           |
|                                      |     The service is not for           |
|                                      |     `jail(8) <http://www.FreeBSD.org |
|                                      | /cgi/man.cgi?query=jail&sektion=8>`_ |
|                                      | _                                    |
|                                      |     environment. The automatic       |
|                                      |     startup and shutdown procedures  |
|                                      |     will ignore the script if inside |
|                                      |     a jail.                          |
|                                      |                                      |
|                                      | ``nostart``                          |
|                                      |     The service is to be started     |
|                                      |     manually or not started at all.  |
|                                      |     The automatic startup procedure  |
|                                      |     will ignore the script. In       |
|                                      |     conjunction with the             |
|                                      |     ``shutdown`` keyword, this can   |
|                                      |     be used to write scripts that do |
|                                      |     something only at system         |
|                                      |     shutdown.                        |
|                                      |                                      |
|                                      | ``shutdown``                         |
|                                      |     This keyword is to be listed     |
|                                      |     *explicitly* if the service      |
|                                      |     needs to be stopped before       |
|                                      |     system shutdown.                 |
|                                      |                                      |
|                                      |     .. raw:: html                    |
|                                      |                                      |
|                                      |        <div class="note" xmlns="">   |
|                                      |                                      |
|                                      |     Note:                            |
|                                      |     ~~~~~                            |
|                                      |                                      |
|                                      |     When the system is going to shut |
|                                      |     down, ``/etc/rc.shutdown`` runs. |
|                                      |     It assumes that most ``rc.d``    |
|                                      |     scripts have nothing to do at    |
|                                      |     that time. Therefore             |
|                                      |     ``/etc/rc.shutdown`` selectively |
|                                      |     invokes ``rc.d`` scripts with    |
|                                      |     the ``shutdown`` keyword,        |
|                                      |     effectively ignoring the rest of |
|                                      |     the scripts. For even faster     |
|                                      |     shutdown, ``/etc/rc.shutdown``   |
|                                      |     passes the ``faststop`` command  |
|                                      |     to the scripts it runs so that   |
|                                      |     they skip preliminary checks,    |
|                                      |     e.g., the pidfile check. As      |
|                                      |     dependent services should be     |
|                                      |     stopped before their             |
|                                      |     prerequisites,                   |
|                                      |     ``/etc/rc.shutdown`` runs the    |
|                                      |     scripts in reverse dependency    |
|                                      |     order.                           |
|                                      |                                      |
|                                      |     If writing a real ``rc.d``       |
|                                      |     script, you should consider      |
|                                      |     whether it is relevant at system |
|                                      |     shutdown time. E.g., if your     |
|                                      |     script does its work in response |
|                                      |     to the ``start`` command only,   |
|                                      |     then you need not include this   |
|                                      |     keyword. However, if your script |
|                                      |     manages a service, it is         |
|                                      |     probably a good idea to stop it  |
|                                      |     before the system proceeds to    |
|                                      |     the final stage of its shutdown  |
|                                      |     sequence described in            |
|                                      |     `halt(8) <http://www.FreeBSD.org |
|                                      | /cgi/man.cgi?query=halt&sektion=8>`_ |
|                                      | _.                                   |
|                                      |     In particular, a service should  |
|                                      |     be stopped explicitly if it      |
|                                      |     needs considerable time or       |
|                                      |     special actions to shut down     |
|                                      |     cleanly. A typical example of    |
|                                      |     such a service is a database     |
|                                      |     engine.                          |
|                                      |                                      |
|                                      |     .. raw:: html                    |
|                                      |                                      |
|                                      |        </div>                        |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|5| <#rcng-hookup-force>`__         | To begin with, ``force_depend``      |
|                                      | should be used with much care. It is |
|                                      | generally better to revise the       |
|                                      | hierarchy of configuration variables |
|                                      | for your ``rc.d`` scripts if they    |
|                                      | are interdependent.                  |
|                                      |                                      |
|                                      | If you still cannot do without       |
|                                      | ``force_depend``, the example offers |
|                                      | an idiom of how to invoke it         |
|                                      | conditionally. In the example, our   |
|                                      | ``mumbled`` daemon requires that     |
|                                      | another one, ``frotz``, be started   |
|                                      | in advance. However, ``frotz`` is    |
|                                      | optional, too; and                   |
|                                      | `rcorder(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rcorder&sektion=8> |
|                                      | `__                                  |
|                                      | knows nothing about such details.    |
|                                      | Fortunately, our script has access   |
|                                      | to all                               |
|                                      | `rc.conf(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=rc.conf&sektion=5> |
|                                      | `__                                  |
|                                      | variables. If ``frotz_enable`` is    |
|                                      | true, we hope for the best and rely  |
|                                      | on ``rc.d`` to have started          |
|                                      | ``frotz``. Otherwise we forcibly     |
|                                      | check the status of ``frotz``.       |
|                                      | Finally, we enforce our dependency   |
|                                      | on ``frotz`` if it is found to be    |
|                                      | not running. A warning message will  |
|                                      | be emitted by ``force_depend``       |
|                                      | because it should be invoked only if |
|                                      | a misconfiguration has been          |
|                                      | detected.                            |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+-------------------------+-------------------------------------------------+
| `Prev <rcng-daemon-adv.html>`__?                 | ?                       | ?\ `Next <rcng-args.html>`__                    |
+--------------------------------------------------+-------------------------+-------------------------------------------------+
| 6.?Startup and shutdown of an advanced daemon?   | `Home <index.html>`__   | ?8.?Giving more flexibility to an rc.d script   |
+--------------------------------------------------+-------------------------+-------------------------------------------------+

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
