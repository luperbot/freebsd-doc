=======================
12.2.?Starting Services
=======================

.. raw:: html

   <div class="navheader">

12.2.?Starting Services
`Prev <config-tuning.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-cron.html>`__

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

12.2.?Starting Services
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many users install third party software on FreeBSD from the Ports
Collection and require the installed services to be started upon system
initialization. Services, such as
`mail/postfix <http://www.freebsd.org/cgi/url.cgi?ports/mail/postfix/pkg-descr>`__
or
`www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__
are just two of the many software packages which may be started during
system initialization. This section explains the procedures available
for starting third party software.

In FreeBSD, most included services, such as
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
are started through the system start up scripts.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.2.1.?Extended Application Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now that FreeBSD includes ``rc.d``, configuration of application startup
is easier and provides more features. Using the key words discussed in
`Section?12.4, “Managing Services in
FreeBSD” <configtuning-rcd.html>`__, applications can be set to start
after certain other services and extra flags can be passed through
``/etc/rc.conf`` in place of hard coded flags in the start up script. A
basic script may look similar to the following:

.. code:: programlisting

    #!/bin/sh
    #
    # PROVIDE: utility
    # REQUIRE: DAEMON
    # KEYWORD: shutdown

    . /etc/rc.subr

    name=utility
    rcvar=utility_enable

    command="/usr/local/sbin/utility"

    load_rc_config $name

    #
    # DO NOT CHANGE THESE DEFAULT VALUES HERE
    # SET THEM IN THE /etc/rc.conf FILE
    #
    utility_enable=${utility_enable-"NO"}
    pidfile=${utility_pidfile-"/var/run/utility.pid"}

    run_rc_command "$1"

This script will ensure that the provided ``utility`` will be started
after the ``DAEMON`` pseudo-service. It also provides a method for
setting and tracking the process ID (PID).

This application could then have the following line placed in
``/etc/rc.conf``:

.. code:: programlisting

    utility_enable="YES"

This method allows for easier manipulation of command line arguments,
inclusion of the default functions provided in ``/etc/rc.subr``,
compatibility with
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__,
and provides for easier configuration via ``rc.conf``.

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

12.2.2.?Using Services to Start Services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Other services can be started using
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.
Working with
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
and its configuration is described in depth in `Section?29.2, “The inetd
Super-Server” <network-inetd.html>`__.

In some cases, it may make more sense to use
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__ to
start system services. This approach has a number of advantages as
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
runs these processes as the owner of the
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5>`__.
This allows regular users to start and maintain their own applications.

The ``@reboot`` feature of
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
may be used in place of the time specification. This causes the job to
run when
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__ is
started, normally during system initialization.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------+----------------------------------------+
| `Prev <config-tuning.html>`__?          | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-cron.html>`__   |
+-----------------------------------------+-------------------------------+----------------------------------------+
| Chapter?12.?Configuration and Tuning?   | `Home <index.html>`__         | ?12.3.?Configuring cron(8)             |
+-----------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
