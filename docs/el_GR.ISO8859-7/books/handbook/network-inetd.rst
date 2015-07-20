==============================
29.2. The inetd ?Super-Server?
==============================

.. raw:: html

   <div class="navheader">

29.2. The inetd ?Super-Server?
`????? <network-servers.html>`__?
???????? 29. ???????????? ???????
?\ `??????? <network-nfs.html>`__

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

29.2. The inetd ?Super-Server?
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated for FreeBSD 6.1-RELEASE by The FreeBSD Documentation Project.

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

29.2.1. Overview
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
is sometimes referred to as the ?Internet Super-Server? because it
manages connections for several services. When a connection is received
by inetd, it determines which program the connection is destined for,
spawns the particular process and delegates the socket to it (the
program is invoked with the service socket as its standard input, output
and error descriptors). Running inetd for servers that are not heavily
used can reduce the overall system load, when compared to running each
daemon individually in stand-alone mode.

Primarily, inetd is used to spawn other daemons, but several trivial
protocols are handled directly, such as chargen, auth, and daytime.

This section will cover the basics in configuring inetd through its
command-line options and its configuration file, ``/etc/inetd.conf``.

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

29.2.2. Settings
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

inetd is initialized through the
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
system. The ``inetd_enable`` option is set to ``NO`` by default, but may
be turned on by sysinstall during installation, depending on the
configuration chosen by the user. Placing:

.. code:: programlisting

    inetd_enable="YES"

or

.. code:: programlisting

    inetd_enable="NO"

into ``/etc/rc.conf`` will enable or disable inetd starting at boot
time. The command:

.. code:: programlisting

    /etc/rc.d/inetd rcvar

can be run to display the current effective setting.

Additionally, different command-line options can be passed to inetd via
the ``inetd_flags`` option.

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

29.2.3. Command-Line Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like most server daemons, inetd has a number of options that it can be
passed in order to modify its behaviour. The full list of options reads:

``inetd``
``[-d] [-l] [-w] [-W] [-c maximum] [-C rate] [-a address | hostname]            [-p filename] [-R rate] [-s maximum] [configuration file]``

Options can be passed to inetd using the ``inetd_flags`` option in
``/etc/rc.conf``. By default, ``inetd_flags`` is set to ``-wW -C 60``,
which turns on TCP wrapping for inetd's services, and prevents any
single IP address from requesting any service more than 60 times in any
given minute.

Novice users may be pleased to note that these parameters usually do not
need to be modified, although we mention the rate-limiting options below
as they be useful should you find that you are receiving an excessive
amount of connections. A full list of options can be found in the
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
manual.

.. raw:: html

   <div class="variablelist">

-c maximum
    Specify the default maximum number of simultaneous invocations of
    each service; the default is unlimited. May be overridden on a
    per-service basis with the ``max-child`` parameter.

-C rate
    Specify the default maximum number of times a service can be invoked
    from a single IP address in one minute; the default is unlimited.
    May be overridden on a per-service basis with the
    ``max-connections-per-ip-per-minute`` parameter.

-R rate
    Specify the maximum number of times a service can be invoked in one
    minute; the default is 256. A rate of 0 allows an unlimited number
    of invocations.

-s maximum
    Specify the maximum number of times a service can be invoked from a
    single IP address at any one time; the default is unlimited. May be
    overridden on a per-service basis with the ``max-child-per-ip``
    parameter.

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

29.2.4. ``inetd.conf``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuration of inetd is done via the file ``/etc/inetd.conf``.

When a modification is made to ``/etc/inetd.conf``, inetd can be forced
to re-read its configuration file by running the command:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 29.1. Reloading the inetd configuration file

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # /etc/rc.d/inetd reload

.. raw:: html

   </div>

.. raw:: html

   </div>

Each line of the configuration file specifies an individual daemon.
Comments in the file are preceded by a ?#?. The format of each entry in
``/etc/inetd.conf`` is as follows:

.. code:: programlisting

    service-name
    socket-type
    protocol
    {wait|nowait}[/max-child[/max-connections-per-ip-per-minute[/max-child-per-ip]]]
    user[:group][/login-class]
    server-program
    server-program-arguments

An example entry for the
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8>`__
daemon using IPv4 might read:

.. code:: programlisting

    ftp     stream  tcp     nowait  root    /usr/libexec/ftpd       ftpd -l

.. raw:: html

   <div class="variablelist">

service-name
    This is the service name of the particular daemon. It must
    correspond to a service listed in ``/etc/services``. This determines
    which port inetd must listen to. If a new service is being created,
    it must be placed in ``/etc/services`` first.

socket-type
    Either ``stream``, ``dgram``, ``raw``, or ``seqpacket``. ``stream``
    must be used for connection-based, TCP daemons, while ``dgram`` is
    used for daemons utilizing the UDP transport protocol.

protocol
    One of the following:

    .. raw:: html

       <div class="informaltable">

    +-------------+------------------------+
    | Protocol    | Explanation            |
    +=============+========================+
    | tcp, tcp4   | TCP IPv4               |
    +-------------+------------------------+
    | udp, udp4   | UDP IPv4               |
    +-------------+------------------------+
    | tcp6        | TCP IPv6               |
    +-------------+------------------------+
    | udp6        | UDP IPv6               |
    +-------------+------------------------+
    | tcp46       | Both TCP IPv4 and v6   |
    +-------------+------------------------+
    | udp46       | Both UDP IPv4 and v6   |
    +-------------+------------------------+

    .. raw:: html

       </div>

{wait\|nowait}[/max-child[/max-connections-per-ip-per-minute[/max-child-per-ip]]]
    ``wait|nowait`` indicates whether the daemon invoked from inetd is
    able to handle its own socket or not. ``dgram`` socket types must
    use the ``wait`` option, while stream socket daemons, which are
    usually multi-threaded, should use ``nowait``. ``wait`` usually
    hands off multiple sockets to a single daemon, while ``nowait``
    spawns a child daemon for each new socket.

    The maximum number of child daemons inetd may spawn can be set using
    the ``max-child`` option. If a limit of ten instances of a
    particular daemon is needed, a ``/10`` would be placed after
    ``nowait``. Specifying ``/0`` allows an unlimited number of children

    In addition to ``max-child``, two other options which limit the
    maximum connections from a single place to a particular daemon can
    be enabled. ``max-connections-per-ip-per-minute`` limits the number
    of connections from any particular IP address per minutes, e.g. a
    value of ten would limit any particular IP address connecting to a
    particular service to ten attempts per minute. ``max-child-per-ip``
    limits the number of children that can be started on behalf on any
    single IP address at any moment. These options are useful to prevent
    intentional or unintentional excessive resource consumption and
    Denial of Service (DoS) attacks to a machine.

    In this field, either of ``wait`` or ``nowait`` is mandatory.
    ``max-child``, ``max-connections-per-ip-per-minute`` and
    ``max-child-per-ip`` are optional.

    A stream-type multi-threaded daemon without any ``max-child``,
    ``max-connections-per-ip-per-minute`` or ``max-child-per-ip`` limits
    would simply be: ``nowait``.

    The same daemon with a maximum limit of ten daemons would read:
    ``nowait/10``.

    The same setup with a limit of twenty connections per IP address per
    minute and a maximum total limit of ten child daemons would read:
    ``nowait/10/20``.

    These options are utilized by the default settings of the
    `fingerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fingerd&sektion=8>`__
    daemon, as seen here:

    .. code:: programlisting

        finger stream  tcp     nowait/3/10 nobody /usr/libexec/fingerd fingerd -s

    Finally, an example of this field with a maximum of 100 children in
    total, with a maximum of 5 for any one IP address would read:
    ``nowait/100/0/5``.

user
    This is the username that the particular daemon should run as. Most
    commonly, daemons run as the ``root`` user. For security purposes,
    it is common to find some servers running as the ``daemon`` user, or
    the least privileged ``nobody`` user.

server-program
    The full path of the daemon to be executed when a connection is
    received. If the daemon is a service provided by inetd internally,
    then ``internal`` should be used.

server-program-arguments
    This works in conjunction with ``server-program`` by specifying the
    arguments, starting with ``argv[0]``, passed to the daemon on
    invocation. If ``mydaemon -d`` is the command line, ``mydaemon -d``
    would be the value of ``server-program-arguments``. Again, if the
    daemon is an internal service, use ``internal`` here.

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

29.2.5. Security
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Depending on the choices made at install time, many of inetd's services
may be enabled by default. If there is no apparent need for a particular
daemon, consider disabling it. Place a ?#? in front of the daemon in
question in ``/etc/inetd.conf``, and then `reload the inetd
configuration <network-inetd.html#network-inetd-reread>`__. Some
daemons, such as fingerd, may not be desired at all because they provide
information that may be useful to an attacker.

Some daemons are not security-conscious and have long, or non-existent,
timeouts for connection attempts. This allows an attacker to slowly send
connections to a particular daemon, thus saturating available resources.
It may be a good idea to place ``max-connections-per-ip-per-minute``,
``max-child`` or ``max-child-per-ip`` limitations on certain daemons if
you find that you have too many connections.

By default, TCP wrapping is turned on. Consult the
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
manual page for more information on placing TCP restrictions on various
inetd invoked daemons.

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

29.2.6. Miscellaneous
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

daytime, time, echo, discard, chargen, and auth are all internally
provided services of inetd.

The auth service provides identity network services, and is configurable
to a certain degree, whilst the others are simply on or off.

Consult the
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
manual page for more in-depth information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-----------------------------------+-------------------------------------+
| `????? <network-servers.html>`__?    | `???? <network-servers.html>`__   | ?\ `??????? <network-nfs.html>`__   |
+--------------------------------------+-----------------------------------+-------------------------------------+
| ???????? 29. ???????????? ????????   | `???? <index.html>`__             | ?29.3. Network File System (NFS)    |
+--------------------------------------+-----------------------------------+-------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
