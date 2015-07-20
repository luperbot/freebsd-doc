=======================
12.10. ?????? ?????????
=======================

.. raw:: html

   <div class="navheader">

12.10. ?????? ?????????
`????? <configtuning-virtual-hosts.html>`__?
???????? 12. ??????? ??? ??????????????
?\ `??????? <configtuning-sysctl.html>`__

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

12.10. ?????? ?????????
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

12.10.1. ? ????????? ``/etc``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?? ?????? ????????? ????????????? ?? ??????????. ??????? ??? ??????
?????:

.. raw:: html

   <div class="informaltable">

+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc``                  | ??????? ????????? ??? ??????????, data here is system-specific.                                                                                              |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/defaults``         | Default versions of system configuration files.                                                                                                              |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/mail``             | Extra `sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__ configuration, other MTA configuration files.                            |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/ppp``              | Configuration for both user- and kernel-ppp programs.                                                                                                        |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/namedb``           | Default location for `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__ data. Normally ``named.conf`` and zone files are stored here.   |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/usr/local/etc``        | Configuration files for installed applications. May contain per-application subdirectories.                                                                  |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/usr/local/etc/rc.d``   | Start/stop scripts for installed applications.                                                                                                               |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/var/db``               | Automatically generated system-specific database files, such as the package database, the locate database, and so on                                         |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

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

12.10.2. Hostnames
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

12.10.2.1. ``/etc/resolv.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/resolv.conf`` dictates how FreeBSD's resolver accesses the
Internet Domain Name System (DNS).

The most common entries to ``resolv.conf`` are:

.. raw:: html

   <div class="informaltable">

+------------------+-----------------------------------------------------------------------------------------------------------------------------------+
| ``nameserver``   | The IP address of a name server the resolver should query. The servers are queried in the order listed with a maximum of three.   |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------+
| ``search``       | Search list for hostname lookup. This is normally determined by the domain of the local hostname.                                 |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------+
| ``domain``       | The local domain name.                                                                                                            |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

A typical ``resolv.conf``:

.. code:: programlisting

    search example.com
    nameserver 147.11.1.11
    nameserver 147.11.100.30

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Only one of the ``search`` and ``domain`` options should be used.

.. raw:: html

   </div>

If you are using DHCP,
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
usually rewrites ``resolv.conf`` with information received from the DHCP
server.

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

12.10.2.2. ``/etc/hosts``
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/hosts`` is a simple text database reminiscent of the old
Internet. It works in conjunction with DNS and NIS providing name to IP
address mappings. Local computers connected via a LAN can be placed in
here for simplistic naming purposes instead of setting up a
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
server. Additionally, ``/etc/hosts`` can be used to provide a local
record of Internet names, reducing the need to query externally for
commonly accessed names.

.. code:: programlisting

    # $FreeBSD$
    #
    # Host Database
    # This file should contain the addresses and aliases
    # for local hosts that share this file.
    # In the presence of the domain name service or NIS, this file may
    # not be consulted at all; see /etc/nsswitch.conf for the resolution order.
    #
    #
    ::1                     localhost localhost.my.domain myname.my.domain
    127.0.0.1               localhost localhost.my.domain myname.my.domain

    #
    # Imaginary network.
    #10.0.0.2               myname.my.domain myname
    #10.0.0.3               myfriend.my.domain myfriend
    #
    # According to RFC 1918, you can use the following IP networks for
    # private nets which will never be connected to the Internet:
    #
    #       10.0.0.0        -   10.255.255.255
    #       172.16.0.0      -   172.31.255.255
    #       192.168.0.0     -   192.168.255.255
    #
    # In case you want to be able to connect to the Internet, you need
    # real official assigned numbers.  PLEASE PLEASE PLEASE do not try
    # to invent your own network numbers but instead get one from your
    # network provider (if any) or from the Internet Registry (ftp to
    # rs.internic.net, directory `/templates').
    #

``/etc/hosts`` takes on the simple format of:

.. code:: programlisting

    [Internet address] [official hostname] [alias1] [alias2] ...

For example:

.. code:: programlisting

    10.0.0.1 myRealHostname.example.com myRealHostname foobar1 foobar2

Consult
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
for more information.

.. raw:: html

   </div>

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

12.10.3. Log File Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

12.10.3.1. ``syslog.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``syslog.conf`` is the configuration file for the
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
program. It indicates which types of ``syslog`` messages are logged to
particular log files.

.. code:: programlisting

    # $FreeBSD$
    #
    #       Spaces ARE valid field separators in this file. However,
    #       other *nix-like systems still insist on using tabs as field
    #       separators. If you are sharing this file between systems, you
    #       may want to use only tabs as field separators here.
    #       Consult the syslog.conf(5) manual page.
    *.err;kern.debug;auth.notice;mail.crit          /dev/console
    *.notice;kern.debug;lpr.info;mail.crit;news.err /var/log/messages
    security.*                                      /var/log/security
    mail.info                                       /var/log/maillog
    lpr.info                                        /var/log/lpd-errs
    cron.*                                          /var/log/cron
    *.err                                           root
    *.notice;news.err                               root
    *.alert                                         root
    *.emerg                                         *
    # uncomment this to log all writes to /dev/console to /var/log/console.log
    #console.info                                   /var/log/console.log
    # uncomment this to enable logging of all log messages to /var/log/all.log
    #*.*                                            /var/log/all.log
    # uncomment this to enable logging to a remote log host named loghost
    #*.*                                            @loghost
    # uncomment these if you're running inn
    # news.crit                                     /var/log/news/news.crit
    # news.err                                      /var/log/news/news.err
    # news.notice                                   /var/log/news/news.notice
    !startslip
    *.*                                             /var/log/slip.log
    !ppp
    *.*                                             /var/log/ppp.log

Consult the
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__
manual page for more information.

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

12.10.3.2. ``newsyslog.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``newsyslog.conf`` is the configuration file for
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__,
a program that is normally scheduled to run by
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__.
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
determines when log files require archiving or rearranging. ``logfile``
is moved to ``logfile.0``, ``logfile.0`` is moved to ``logfile.1``, and
so on. Alternatively, the log files may be archived in
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__
format causing them to be named: ``logfile.0.gz``, ``logfile.1.gz``, and
so on.

``newsyslog.conf`` indicates which log files are to be managed, how many
are to be kept, and when they are to be touched. Log files can be
rearranged and/or archived when they have either reached a certain size,
or at a certain periodic time/date.

.. code:: programlisting

    # configuration file for newsyslog
    # $FreeBSD$
    #
    # filename          [owner:group]    mode count size when [ZB] [/pid_file] [sig_num]
    /var/log/cron                           600  3     100  *     Z
    /var/log/amd.log                        644  7     100  *     Z
    /var/log/kerberos.log                   644  7     100  *     Z
    /var/log/lpd-errs                       644  7     100  *     Z
    /var/log/maillog                        644  7     *    @T00  Z
    /var/log/sendmail.st                    644  10    *    168   B
    /var/log/messages                       644  5     100  *     Z
    /var/log/all.log                        600  7     *    @T00  Z
    /var/log/slip.log                       600  3     100  *     Z
    /var/log/ppp.log                        600  3     100  *     Z
    /var/log/security                       600  10    100  *     Z
    /var/log/wtmp                           644  3     *    @01T05 B
    /var/log/daily.log                      640  7     *    @T00  Z
    /var/log/weekly.log                     640  5     1    $W6D0 Z
    /var/log/monthly.log                    640  12    *    $M1D0 Z
    /var/log/console.log                    640  5     100  *     Z

Consult the
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
manual page for more information.

.. raw:: html

   </div>

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

12.10.4. ``sysctl.conf``
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``sysctl.conf`` looks much like ``rc.conf``. Values are set in a
``variable=value`` form. The specified values are set after the system
goes into multi-user mode. Not all variables are settable in this mode.

To turn off logging of fatal signal exits and prevent users from seeing
processes started from other users, the following tunables can be set in
``sysctl.conf``:

.. code:: programlisting

    # Do not log fatal signal exits (e.g. sig 11)
    kern.logsigexit=0

    # Prevent users from seeing information about processes that
    # are being run under another UID.
    security.bsd.see_other_uids=0

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+---------------------------------+---------------------------------------------+
| `????? <configtuning-virtual-hosts.html>`__?   | `???? <config-tuning.html>`__   | ?\ `??????? <configtuning-sysctl.html>`__   |
+------------------------------------------------+---------------------------------+---------------------------------------------+
| 12.9. ???????? Hosts?                          | `???? <index.html>`__           | ?12.11. Tuning with sysctl                  |
+------------------------------------------------+---------------------------------+---------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
