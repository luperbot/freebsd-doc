============================
29.2.?The inetd Super-Server
============================

.. raw:: html

   <div class="navheader">

29.2.?The inetd Super-Server
`Prev <network-servers.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-nfs.html>`__

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

29.2.?The inetd Super-Server
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
daemon is sometimes referred to as a Super-Server because it manages
connections for many services. Instead of starting multiple
applications, only the inetd service needs to be started. When a
connection is received for a service that is managed by inetd, it
determines which program the connection is destined for, spawns a
process for that program, and delegates the program a socket. Using
inetd for services that are not heavily used can reduce system load,
when compared to running each daemon individually in stand-alone mode.

Primarily, inetd is used to spawn other daemons, but several trivial
protocols are handled internally, such as chargen, auth, time, echo,
discard, and daytime.

This section covers the basics of configuring inetd.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.2.1.?Configuration File
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuration of inetd is done by editing ``/etc/inetd.conf``. Each line
of this configuration file represents an application which can be
started by inetd. By default, every line starts with a comment (``#``),
meaning that inetd is not listening for any applications. To configure
inetd to listen for an application's connections, remove the ``#`` at
the beginning of the line for that application.

After saving your edits, configure inetd to start at system boot by
editing ``/etc/rc.conf``:

.. code:: programlisting

    inetd_enable="YES"

To start inetd now, so that it listens for the service you configured,
type:

.. code:: screen

    # service inetd start

Once inetd is started, it needs to be notified whenever a modification
is made to ``/etc/inetd.conf``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?29.1.?Reloading the inetd Configuration File

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # service inetd reload

.. raw:: html

   </div>

.. raw:: html

   </div>

Typically, the default entry for an application does not need to be
edited beyond removing the ``#``. In some situations, it may be
appropriate to edit the default entry.

As an example, this is the default entry for
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8>`__
over IPv4:

.. code:: programlisting

    ftp     stream  tcp     nowait  root    /usr/libexec/ftpd       ftpd -l

The seven columns in an entry are as follows:

.. code:: programlisting

    service-name
    socket-type
    protocol
    {wait|nowait}[/max-child[/max-connections-per-ip-per-minute[/max-child-per-ip]]]
    user[:group][/login-class]
    server-program
    server-program-arguments

where:

.. raw:: html

   <div class="variablelist">

service-name
    The service name of the daemon to start. It must correspond to a
    service listed in ``/etc/services``. This determines which port
    inetd listens on for incoming connections to that service. When
    using a custom service, it must first be added to ``/etc/services``.

socket-type
    Either ``stream``, ``dgram``, ``raw``, or ``seqpacket``. Use
    ``stream`` for TCP connections and ``dgram`` for UDP services.

protocol
    Use one of the following protocol names:

    .. raw:: html

       <div class="informaltable">

    +-----------------+--------------------------+
    | Protocol Name   | Explanation              |
    +=================+==========================+
    | tcp or tcp4     | TCP IPv4                 |
    +-----------------+--------------------------+
    | udp or udp4     | UDP IPv4                 |
    +-----------------+--------------------------+
    | tcp6            | TCP IPv6                 |
    +-----------------+--------------------------+
    | udp6            | UDP IPv6                 |
    +-----------------+--------------------------+
    | tcp46           | Both TCP IPv4 and IPv6   |
    +-----------------+--------------------------+
    | udp46           | Both UDP IPv4 and IPv6   |
    +-----------------+--------------------------+

    .. raw:: html

       </div>

{wait\|nowait}[/max-child[/max-connections-per-ip-per-minute[/max-child-per-ip]]]
    In this field, ``wait`` or ``nowait`` must be specified.
    ``max-child``, ``max-connections-per-ip-per-minute`` and
    ``max-child-per-ip`` are optional.

    ``wait|nowait`` indicates whether or not the service is able to
    handle its own socket. ``dgram`` socket types must use ``wait``
    while ``stream`` daemons, which are usually multi-threaded, should
    use ``nowait``. ``wait`` usually hands off multiple sockets to a
    single daemon, while ``nowait`` spawns a child daemon for each new
    socket.

    The maximum number of child daemons inetd may spawn is set by
    ``max-child``. For example, to limit ten instances of the daemon,
    place a ``/10`` after ``nowait``. Specifying ``/0`` allows an
    unlimited number of children.

    ``max-connections-per-ip-per-minute`` limits the number of
    connections from any particular IP address per minute. Once the
    limit is reached, further connections from this IP address will be
    dropped until the end of the minute. For example, a value of ``/10``
    would limit any particular IP address to ten connection attempts per
    minute. ``max-child-per-ip`` limits the number of child processes
    that can be started on behalf on any single IP address at any
    moment. These options can limit excessive resource consumption and
    help to prevent Denial of Service attacks.

    An example can be seen in the default settings for
    `fingerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fingerd&sektion=8>`__:

    .. code:: programlisting

        finger stream  tcp     nowait/3/10 nobody /usr/libexec/fingerd fingerd -k -s

user
    The username the daemon will run as. Daemons typically run as
    ``root``, ``daemon``, or ``nobody``.

server-program
    The full path to the daemon. If the daemon is a service provided by
    inetd internally, use ``internal``.

server-program-arguments
    Used to specify any command arguments to be passed to the daemon on
    invocation. If the daemon is an internal service, use ``internal``.

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

29.2.2.?Command-Line Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like most server daemons, inetd has a number of options that can be used
to modify its behaviour. By default, inetd is started with
``-wW -C 60``. These options enable TCP wrappers for all services,
including internal services, and prevent any IP address from requesting
any service more than 60 times per minute.

To change the default options which are passed to inetd, add an entry
for ``inetd_flags`` in ``/etc/rc.conf``. If inetd is already running,
restart it with ``service inetd restart``.

The available rate limiting options are:

.. raw:: html

   <div class="variablelist">

-c maximum
    Specify the default maximum number of simultaneous invocations of
    each service, where the default is unlimited. May be overridden on a
    per-service basis by using ``max-child`` in ``/etc/inetd.conf``.

-C rate
    Specify the default maximum number of times a service can be invoked
    from a single IP address per minute. May be overridden on a
    per-service basis by using ``max-connections-per-ip-per-minute`` in
    ``/etc/inetd.conf``.

-R rate
    Specify the maximum number of times a service can be invoked in one
    minute, where the default is ``256``. A rate of ``0`` allows an
    unlimited number.

-s maximum
    Specify the maximum number of times a service can be invoked from a
    single IP address at any one time, where the default is unlimited.
    May be overridden on a per-service basis by using
    ``max-child-per-ip`` in ``/etc/inetd.conf``.

.. raw:: html

   </div>

Additional options are available. Refer to
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
for the full list of options.

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

29.2.3.?Security Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many of the daemons which can be managed by inetd are not
security-conscious. Some daemons, such as fingerd, can provide
information that may be useful to an attacker. Only enable the services
which are needed and monitor the system for excessive connection
attempts. ``max-connections-per-ip-per-minute``, ``max-child`` and
``max-child-per-ip`` can be used to limit such attacks.

By default, TCP wrappers is enabled. Consult
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
for more information on placing TCP restrictions on various inetd
invoked daemons.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------------+------------------------------------+
| `Prev <network-servers.html>`__?   | `Up <network-servers.html>`__   | ?\ `Next <network-nfs.html>`__     |
+------------------------------------+---------------------------------+------------------------------------+
| Chapter?29.?Network Servers?       | `Home <index.html>`__           | ?29.3.?Network File System (NFS)   |
+------------------------------------+---------------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
