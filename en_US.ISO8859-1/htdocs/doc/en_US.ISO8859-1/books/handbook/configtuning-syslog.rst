================================
12.7.?Configuring System Logging
================================

.. raw:: html

   <div class="navheader">

12.7.?Configuring System Logging
`Prev <configtuning-virtual-hosts.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-configfiles.html>`__

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

12.7.?Configuring System Logging
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Niclas Zeising.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Generating and reading system logs is an important aspect of system
administration. The information in system logs can be used to detect
hardware and software issues as well as application and system
configuration errors. This information also plays an important role in
security auditing and incident response. Most system daemons and
applications will generate log entries.

FreeBSD provides a system logger, syslogd, to manage logging. By
default, syslogd is started when the system boots. This is controlled by
the variable ``syslogd_enable`` in ``/etc/rc.conf``. There are numerous
application arguments that can be set using ``syslogd_flags`` in
``/etc/rc.conf``. Refer to
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
for more information on the available arguments.

This section describes how to configure the FreeBSD system logger for
both local and remote logging and how to perform log rotation and log
management.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.7.1.?Configuring Local Logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The configuration file, ``/etc/syslog.conf``, controls what syslogd does
with log entries as they are received. There are several parameters to
control the handling of incoming events. The *facility* describes which
subsystem generated the message, such as the kernel or a daemon, and the
*level* describes the severity of the event that occurred. This makes it
possible to configure if and where a log message is logged, depending on
the facility and level. It is also possible to take action depending on
the application that sent the message, and in the case of remote
logging, the hostname of the machine generating the logging event.

This configuration file contains one line per action, where the syntax
for each line is a selector field followed by an action field. The
syntax of the selector field is *``facility.level``* which will match
log messages from *``facility``* at level *``level``* or higher. It is
also possible to add an optional comparison flag before the level to
specify more precisely what is logged. Multiple selector fields can be
used for the same action, and are separated with a semicolon (``;``).
Using ``*`` will match everything. The action field denotes where to
send the log message, such as to a file or remote log host. As an
example, here is the default ``syslog.conf`` from FreeBSD:

.. code:: programlisting

    # $FreeBSD$
    #
    #       Spaces ARE valid field separators in this file. However,
    #       other *nix-like systems still insist on using tabs as field
    #       separators. If you are sharing this file between systems, you
    #       may want to use only tabs as field separators here.
    #       Consult the syslog.conf(5) manpage.
    *.err;kern.warning;auth.notice;mail.crit                /dev/console
    *.notice;authpriv.none;kern.debug;lpr.info;mail.crit;news.err   /var/log/messages
    security.*                                      /var/log/security
    auth.info;authpriv.info                         /var/log/auth.log
    mail.info                                       /var/log/maillog
    lpr.info                                        /var/log/lpd-errs
    ftp.info                                        /var/log/xferlog
    cron.*                                          /var/log/cron
    !-devd
    *.=debug                                        /var/log/debug.log
    *.emerg                                         *
    # uncomment this to log all writes to /dev/console to /var/log/console.log
    #console.info                                   /var/log/console.log
    # uncomment this to enable logging of all log messages to /var/log/all.log
    # touch /var/log/all.log and chmod it to mode 600 before it will work
    #*.*                                            /var/log/all.log
    # uncomment this to enable logging to a remote loghost named loghost
    #*.*                                            @loghost
    # uncomment these if you're running inn
    # news.crit                                     /var/log/news/news.crit
    # news.err                                      /var/log/news/news.err
    # news.notice                                   /var/log/news/news.notice
    # Uncomment this if you wish to see messages produced by devd
    # !devd
    # *.>=info
    !ppp
    *.*                                             /var/log/ppp.log
    !*

In this example:

.. raw:: html

   <div class="itemizedlist">

-  Line 8 matches all messages with a level of ``err`` or higher, as
   well as ``kern.warning``, ``auth.notice`` and ``mail.crit``, and
   sends these log messages to the console (``/dev/console``).

-  Line 12 matches all messages from the ``mail`` facility at level
   ``info`` or above and logs the messages to ``/var/log/maillog``.

-  Line 17 uses a comparison flag (``=``) to only match messages at
   level ``debug`` and logs them to ``/var/log/debug.log``.

-  Line 33 is an example usage of a program specification. This makes
   the rules following it only valid for the specified program. In this
   case, only the messages generated by ppp are logged to
   ``/var/log/ppp.log``.

.. raw:: html

   </div>

The available levels, in order from most to least critical are
``emerg``, ``alert``, ``crit``, ``err``, ``warning``, ``notice``,
``info``, and ``debug``.

The facilities, in no particular order, are ``auth``, ``authpriv``,
``console``, ``cron``, ``daemon``, ``ftp``, ``kern``, ``lpr``, ``mail``,
``mark``, ``news``, ``security``, ``syslog``, ``user``, ``uucp``, and
``local0`` through ``local7``. Be aware that other operating systems
might have different facilities.

To log everything of level ``notice`` and higher to
``/var/log/daemon.log``, add the following entry:

.. code:: programlisting

    daemon.notice                                        /var/log/daemon.log

For more information about the different levels and facilities, refer to
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
and
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__.
For more information about ``/etc/syslog.conf``, its syntax, and more
advanced usage examples, see
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__.

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

12.7.2.?Log Management and Rotation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Log files can grow quickly, taking up disk space and making it more
difficult to locate useful information. Log management attempts to
mitigate this. In FreeBSD, newsyslog is used to manage log files. This
built-in program periodically rotates and compresses log files, and
optionally creates missing log files and signals programs when log files
are moved. The log files may be generated by syslogd or by any other
program which generates log files. While newsyslog is normally run from
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
it is not a system daemon. In the default configuration, it runs every
hour.

To know which actions to take, newsyslog reads its configuration file,
``/etc/newsyslog.conf``. This file contains one line for each log file
that newsyslog manages. Each line states the file owner, permissions,
when to rotate that file, optional flags that affect log rotation, such
as compression, and programs to signal when the log is rotated. Here is
the default configuration in FreeBSD:

.. code:: programlisting

    # configuration file for newsyslog
    # $FreeBSD$
    #
    # Entries which do not specify the '/pid_file' field will cause the
    # syslogd process to be signalled when that log file is rotated.  This
    # action is only appropriate for log files which are written to by the
    # syslogd process (ie, files listed in /etc/syslog.conf).  If there
    # is no process which needs to be signalled when a given log file is
    # rotated, then the entry for that file should include the 'N' flag.
    #
    # The 'flags' field is one or more of the letters: BCDGJNUXZ or a '-'.
    #
    # Note: some sites will want to select more restrictive protections than the
    # defaults.  In particular, it may be desirable to switch many of the 644
    # entries to 640 or 600.  For example, some sites will consider the
    # contents of maillog, messages, and lpd-errs to be confidential.  In the
    # future, these defaults may change to more conservative ones.
    #
    # logfilename          [owner:group]    mode count size when  flags [/pid_file] [sig_num]
    /var/log/all.log                        600  7     *    @T00  J
    /var/log/amd.log                        644  7     100  *     J
    /var/log/auth.log                       600  7     100  @0101T JC
    /var/log/console.log                    600  5     100  *     J
    /var/log/cron                           600  3     100  *     JC
    /var/log/daily.log                      640  7     *    @T00  JN
    /var/log/debug.log                      600  7     100  *     JC
    /var/log/kerberos.log                   600  7     100  *     J
    /var/log/lpd-errs                       644  7     100  *     JC
    /var/log/maillog                        640  7     *    @T00  JC
    /var/log/messages                       644  5     100  @0101T JC
    /var/log/monthly.log                    640  12    *    $M1D0 JN
    /var/log/pflog                          600  3     100  *     JB    /var/run/pflogd.pid
    /var/log/ppp.log        root:network    640  3     100  *     JC
    /var/log/devd.log                       644  3     100  *     JC
    /var/log/security                       600  10    100  *     JC
    /var/log/sendmail.st                    640  10    *    168   B
    /var/log/utx.log                        644  3     *    @01T05 B
    /var/log/weekly.log                     640  5     1    $W6D0 JN
    /var/log/xferlog                        600  7     100  *     JC

Each line starts with the name of the log to be rotated, optionally
followed by an owner and group for both rotated and newly created files.
The ``mode`` field sets the permissions on the log file and ``count``
denotes how many rotated log files should be kept. The ``size`` and
``when`` fields tell newsyslog when to rotate the file. A log file is
rotated when either its size is larger than the ``size`` field or when
the time in the ``when`` filed has passed. An asterisk (``*``) means
that this field is ignored. The *``flags``* field gives further
instructions, such as how to compress the rotated file or to create the
log file if it is missing. The last two fields are optional and specify
the name of the Process ID (PID) file of a process and a signal number
to send to that process when the file is rotated.

For more information on all fields, valid flags, and how to specify the
rotation time, refer to
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__.
Since newsyslog is run from
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
it cannot rotate files more often than it is scheduled to run from
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__.

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

12.7.3.?Configuring Remote Logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Monitoring the log files of multiple hosts can become unwieldy as the
number of systems increases. Configuring centralized logging can reduce
some of the administrative burden of log file administration.

In FreeBSD, centralized log file aggregation, merging, and rotation can
be configured using syslogd and newsyslog. This section demonstrates an
example configuration, where host ``A``, named ``logserv.example.com``,
will collect logging information for the local network. Host ``B``,
named ``logclient.example.com``, will be configured to pass logging
information to the logging server.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.7.3.1.?Log Server Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A log server is a system that has been configured to accept logging
information from other hosts. Before configuring a log server, check the
following:

.. raw:: html

   <div class="itemizedlist">

-  If there is a firewall between the logging server and any logging
   clients, ensure that the firewall ruleset allows UDP port 514 for
   both the clients and the server.

-  The logging server and all client machines must have forward and
   reverse entries in the local DNS. If the network does not have a DNS
   server, create entries in each system's ``/etc/hosts``. Proper name
   resolution is required so that log entries are not rejected by the
   logging server.

.. raw:: html

   </div>

On the log server, edit ``/etc/syslog.conf`` to specify the name of the
client to receive log entries from, the logging facility to be used, and
the name of the log to store the host's log entries. This example adds
the hostname of ``B``, logs all facilities, and stores the log entries
in ``/var/log/logclient.log``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?12.1.?Sample Log Server Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    +logclient.example.com
    *.*     /var/log/logclient.log

.. raw:: html

   </div>

.. raw:: html

   </div>

When adding multiple log clients, add a similar two-line entry for each
client. More information about the available facilities may be found in
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__.

Next, configure ``/etc/rc.conf``:

.. code:: programlisting

    syslogd_enable="YES"
    syslogd_flags="-a logclient.example.com -v -v"

The first entry starts syslogd at system boot. The second entry allows
log entries from the specified client. The ``-v -v`` increases the
verbosity of logged messages. This is useful for tweaking facilities as
administrators are able to see what type of messages are being logged
under each facility.

Multiple ``-a`` options may be specified to allow logging from multiple
clients. IP addresses and whole netblocks may also be specified. Refer
to
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
for a full list of possible options.

Finally, create the log file:

.. code:: screen

    # touch /var/log/logclient.log

At this point, syslogd should be restarted and verified:

.. code:: screen

    # service syslogd restart
    # pgrep syslog

If a PID is returned, the server restarted successfully, and client
configuration can begin. If the server did not restart, consult
``/var/log/messages`` for the error.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.7.3.2.?Log Client Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A logging client sends log entries to a logging server on the network.
The client also keeps a local copy of its own logs.

Once a logging server has been configured, edit ``/etc/rc.conf`` on the
logging client:

.. code:: programlisting

    syslogd_enable="YES"
    syslogd_flags="-s -v -v"

The first entry enables syslogd on boot up. The second entry prevents
logs from being accepted by this client from other hosts (``-s``) and
increases the verbosity of logged messages.

Next, define the logging server in the client's ``/etc/syslog.conf``. In
this example, all logged facilities are sent to a remote system, denoted
by the ``@`` symbol, with the specified hostname:

.. code:: programlisting

    *.*      @logserv.example.com

After saving the edit, restart syslogd for the changes to take effect:

.. code:: screen

    # service syslogd restart

To test that log messages are being sent across the network, use
`logger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logger&sektion=1>`__
on the client to send a message to syslogd:

.. code:: screen

    # logger "Test message from logclient"

This message should now exist both in ``/var/log/messages`` on the
client and ``/var/log/logclient.log`` on the log server.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.7.3.3.?Debugging Log Servers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If no messages are being received on the log server, the cause is most
likely a network connectivity issue, a hostname resolution issue, or a
typo in a configuration file. To isolate the cause, ensure that both the
logging server and the logging client are able to ``ping`` each other
using the hostname specified in their ``/etc/rc.conf``. If this fails,
check the network cabling, the firewall ruleset, and the hostname
entries in the DNS server or ``/etc/hosts`` on both the logging server
and clients. Repeat until the ``ping`` is successful from both hosts.

If the ``ping`` succeeds on both hosts but log messages are still not
being received, temporarily increase logging verbosity to narrow down
the configuration issue. In the following example,
``/var/log/logclient.log`` on the logging server is empty and
``/var/log/messages`` on the logging client does not indicate a reason
for the failure. To increase debugging output, edit the
``syslogd_flags`` entry on the logging server and issue a restart:

.. code:: programlisting

    syslogd_flags="-d -a logclien.example.com -v -v"

.. code:: screen

    # service syslogd restart

Debugging data similar to the following will flash on the console
immediately after the restart:

.. code:: screen

    logmsg: pri 56, flags 4, from logserv.example.com, msg syslogd: restart
    syslogd: restarted
    logmsg: pri 6, flags 4, from logserv.example.com, msg syslogd: kernel boot file is /boot/kernel/kernel
    Logging to FILE /var/log/messages
    syslogd: kernel boot file is /boot/kernel/kernel
    cvthname(192.168.1.10)
    validate: dgram from IP 192.168.1.10, port 514, name logclient.example.com;
    rejected in rule 0 due to name mismatch.

In this example, the log messages are being rejected due to a typo which
results in a hostname mismatch. The client's hostname should be
``logclient``, not ``logclien``. Fix the typo, issue a restart, and
verify the results:

.. code:: screen

    # service syslogd restart
    logmsg: pri 56, flags 4, from logserv.example.com, msg syslogd: restart
    syslogd: restarted
    logmsg: pri 6, flags 4, from logserv.example.com, msg syslogd: kernel boot file is /boot/kernel/kernel
    syslogd: kernel boot file is /boot/kernel/kernel
    logmsg: pri 166, flags 17, from logserv.example.com,
    msg Dec 10 20:55:02 <syslog.err> logserv.example.com syslogd: exiting on signal 2
    cvthname(192.168.1.10)
    validate: dgram from IP 192.168.1.10, port 514, name logclient.example.com;
    accepted in rule 0.
    logmsg: pri 15, flags 0, from logclient.example.com, msg Dec 11 02:01:28 trhodes: Test message 2
    Logging to FILE /var/log/logclient.log
    Logging to FILE /var/log/messages

At this point, the messages are being properly received and placed in
the correct file.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.7.3.4.?Security Considerations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As with any network service, security requirements should be considered
before implementing a logging server. Log files may contain sensitive
data about services enabled on the local host, user accounts, and
configuration data. Network data sent from the client to the server will
not be encrypted or password protected. If a need for encryption exists,
consider using
`security/stunnel <http://www.freebsd.org/cgi/url.cgi?ports/security/stunnel/pkg-descr>`__,
which will transmit the logging data over an encrypted tunnel.

Local security is also an issue. Log files are not encrypted during use
or after log rotation. Local users may access log files to gain
additional insight into system configuration. Setting proper permissions
on log files is critical. The built-in log rotator, newsyslog, supports
setting permissions on newly created and rotated log files. Setting log
files to mode ``600`` should prevent unwanted access by local users.
Refer to
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__
for additional information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------+-----------------------------------------------+
| `Prev <configtuning-virtual-hosts.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-configfiles.html>`__   |
+-----------------------------------------------+-------------------------------+-----------------------------------------------+
| 12.6.?Virtual Hosts?                          | `Home <index.html>`__         | ?12.8.?Configuration Files                    |
+-----------------------------------------------+-------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
