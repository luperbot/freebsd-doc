======================================
29.4.?Network Information System (NIS)
======================================

.. raw:: html

   <div class="navheader">

29.4.?Network Information System (NIS)
`Prev <network-nfs.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-ldap.html>`__

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

29.4.?Network Information System (NIS)
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Network Information System (NIS) is designed to centralize
administration of UNIX?-like systems such as Solaris™, HP-UX, AIX?,
Linux, NetBSD, OpenBSD, and FreeBSD. NIS was originally known as Yellow
Pages but the name was changed due to trademark issues. This is the
reason why NIS commands begin with ``yp``.

NIS is a Remote Procedure Call (RPC)-based client/server system that
allows a group of machines within an NIS domain to share a common set of
configuration files. This permits a system administrator to set up NIS
client systems with only minimal configuration data and to add, remove,
or modify configuration data from a single location.

FreeBSD uses version 2 of the NIS protocol.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.1.?NIS Terms and Processes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Table 28.1 summarizes the terms and important processes used by NIS:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?29.1.?NIS Terminology

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Term                                                                                      | Description                                                                                                                                                                                                                                                                                                                         |
+===========================================================================================+=====================================================================================================================================================================================================================================================================================================================================+
| NIS domain name                                                                           | NIS servers and clients share an NIS domain name. Typically, this name does not have anything to do with DNS.                                                                                                                                                                                                                       |
+-------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `rpcbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcbind&sektion=8>`__               | This service enables RPC and must be running in order to run an NIS server or act as an NIS client.                                                                                                                                                                                                                                 |
+-------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `ypbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypbind&sektion=8>`__                 | This service binds an NIS client to its NIS server. It will take the NIS domain name and use RPC to connect to the server. It is the core of client/server communication in an NIS environment. If this service is not running on a client machine, it will not be able to access the NIS server.                                   |
+-------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__                 | This is the process for the NIS server. If this service stops running, the server will no longer be able to respond to NIS requests so hopefully, there is a slave server to take over. Some non-FreeBSD clients will not try to reconnect using a slave server and the ypbind process may need to be restarted on these clients.   |
+-------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| `rpc.yppasswdd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.yppasswdd&sektion=8>`__   | This process only runs on NIS master servers. This daemon allows NIS clients to change their NIS passwords. If this daemon is not running, users will have to login to the NIS master server and change their passwords there.                                                                                                      |
+-------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

29.4.2.?Machine Types
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are three types of hosts in an NIS environment:

.. raw:: html

   <div class="itemizedlist">

-  NIS master server

   This server acts as a central repository for host configuration
   information and maintains the authoritative copy of the files used by
   all of the NIS clients. The ``passwd``, ``group``, and other various
   files used by NIS clients are stored on the master server. While it
   is possible for one machine to be an NIS master server for more than
   one NIS domain, this type of configuration will not be covered in
   this chapter as it assumes a relatively small-scale NIS environment.

-  NIS slave servers

   NIS slave servers maintain copies of the NIS master's data files in
   order to provide redundancy. Slave servers also help to balance the
   load of the master server as NIS clients always attach to the NIS
   server which responds first.

-  NIS clients

   NIS clients authenticate against the NIS server during log on.

.. raw:: html

   </div>

Information in many files can be shared using NIS. The
``master.passwd``, ``group``, and ``hosts`` files are commonly shared
via NIS. Whenever a process on a client needs information that would
normally be found in these files locally, it makes a query to the NIS
server that it is bound to instead.

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

29.4.3.?Planning Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes a sample NIS environment which consists of 15
FreeBSD machines with no centralized point of administration. Each
machine has its own ``/etc/passwd`` and ``/etc/master.passwd``. These
files are kept in sync with each other only through manual intervention.
Currently, when a user is added to the lab, the process must be repeated
on all 15 machines.

The configuration of the lab will be as follows:

.. raw:: html

   <div class="informaltable">

+-----------------+---------------------+-------------------------+
| Machine name    | IP address          | Machine role            |
+=================+=====================+=========================+
| ``ellington``   | ``10.0.0.2``        | NIS master              |
+-----------------+---------------------+-------------------------+
| ``coltrane``    | ``10.0.0.3``        | NIS slave               |
+-----------------+---------------------+-------------------------+
| ``basie``       | ``10.0.0.4``        | Faculty workstation     |
+-----------------+---------------------+-------------------------+
| ``bird``        | ``10.0.0.5``        | Client machine          |
+-----------------+---------------------+-------------------------+
| ``cli[1-11]``   | ``10.0.0.[6-17]``   | Other client machines   |
+-----------------+---------------------+-------------------------+

.. raw:: html

   </div>

If this is the first time an NIS scheme is being developed, it should be
thoroughly planned ahead of time. Regardless of network size, several
decisions need to be made as part of the planning process.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.3.1.?Choosing a NIS Domain Name
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a client broadcasts its requests for info, it includes the name of
the NIS domain that it is part of. This is how multiple servers on one
network can tell which server should answer which request. Think of the
NIS domain name as the name for a group of hosts.

Some organizations choose to use their Internet domain name for their
NIS domain name. This is not recommended as it can cause confusion when
trying to debug network problems. The NIS domain name should be unique
within the network and it is helpful if it describes the group of
machines it represents. For example, the Art department at Acme Inc.
might be in the “acme-art” NIS domain. This example will use the domain
name ``test-domain``.

However, some non-FreeBSD operating systems require the NIS domain name
to be the same as the Internet domain name. If one or more machines on
the network have this restriction, the Internet domain name *must* be
used as the NIS domain name.

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

29.4.3.2.?Physical Server Requirements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are several things to keep in mind when choosing a machine to use
as a NIS server. Since NIS clients depend upon the availability of the
server, choose a machine that is not rebooted frequently. The NIS server
should ideally be a stand alone machine whose sole purpose is to be an
NIS server. If the network is not heavily used, it is acceptable to put
the NIS server on a machine running other services. However, if the NIS
server becomes unavailable, it will adversely affect all NIS clients.

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

29.4.4.?Configuring the NIS Master Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The canonical copies of all NIS files are stored on the master server.
The databases used to store the information are called NIS maps. In
FreeBSD, these maps are stored in ``/var/yp/[domainname]`` where
``[domainname]`` is the name of the NIS domain. Since multiple domains
are supported, it is possible to have several directories, one for each
domain. Each domain will have its own independent set of maps.

NIS master and slave servers handle all NIS requests through
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__.
This daemon is responsible for receiving incoming requests from NIS
clients, translating the requested domain and map name to a path to the
corresponding database file, and transmitting data from the database
back to the client.

Setting up a master NIS server can be relatively straight forward,
depending on environmental needs. Since FreeBSD provides built-in NIS
support, it only needs to be enabled by adding the following lines to
``/etc/rc.conf``:

.. code:: programlisting

    nisdomainname="test-domain"  
    nis_server_enable="YES"     
    nis_yppasswdd_enable="YES"  

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#network-nis-co-domainname>`__ | This line sets the NIS domain name   |
|                                      | to ``test-domain``.                  |
+--------------------------------------+--------------------------------------+
| `|2| <#network-nis-co-server>`__     | This automates the start up of the   |
|                                      | NIS server processes when the system |
|                                      | boots.                               |
+--------------------------------------+--------------------------------------+
| `|3| <#network-nis-co-yppasswdd>`__  | This enables the                     |
|                                      | `rpc.yppasswdd(8) <http://www.FreeBS |
|                                      | D.org/cgi/man.cgi?query=rpc.yppasswd |
|                                      | d&sektion=8>`__                      |
|                                      | daemon so that users can change      |
|                                      | their NIS password from a client     |
|                                      | machine.                             |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Care must be taken in a multi-server domain where the server machines
are also NIS clients. It is generally a good idea to force the servers
to bind to themselves rather than allowing them to broadcast bind
requests and possibly become bound to each other. Strange failure modes
can result if one server goes down and others are dependent upon it.
Eventually, all the clients will time out and attempt to bind to other
servers, but the delay involved can be considerable and the failure mode
is still present since the servers might bind to each other all over
again.

A server that is also a client can be forced to bind to a particular
server by adding these additional lines to ``/etc/rc.conf``:

.. code:: programlisting

    nis_client_enable="YES" # run client stuff as well
    nis_client_flags="-S NIS domain,server"

After saving the edits, type ``/etc/netstart`` to restart the network
and apply the values defined in ``/etc/rc.conf``. Before initializing
the NIS maps, start
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__:

.. code:: screen

    # service ypserv start

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.1.?Initializing the NIS Maps
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NIS maps are generated from the configuration files in ``/etc`` on the
NIS master, with one exception: ``/etc/master.passwd``. This is to
prevent the propagation of passwords to all the servers in the NIS
domain. Therefore, before the NIS maps are initialized, configure the
primary password files:

.. code:: screen

    # cp /etc/master.passwd /var/yp/master.passwd
    # cd /var/yp
    # vi master.passwd

It is advisable to remove all entries for system accounts as well as any
user accounts that do not need to be propagated to the NIS clients, such
as the ``root`` and any other administrative accounts.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Ensure that the ``/var/yp/master.passwd`` is neither group or world
readable by setting its permissions to ``600``.

.. raw:: html

   </div>

After completing this task, initialize the NIS maps. FreeBSD includes
the
`ypinit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypinit&sektion=8>`__
script to do this. When generating maps for the master server, include
``-m`` and specify the NIS domain name:

.. code:: screen

    ellington# ypinit -m test-domain
    Server Type: MASTER Domain: test-domain
    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.
    Do you want this procedure to quit on non-fatal errors? [y/n: n] n
    Ok, please remember to go back and redo manually whatever fails.
    If not, something might not work.
    At this point, we have to construct a list of this domains YP servers.
    rod.darktech.org is already known as master server.
    Please continue to add any slave servers, one per line. When you are
    done with the list, type a <control D>.
    master server   :  ellington
    next host to add:  coltrane
    next host to add:  ^D
    The current list of NIS servers looks like this:
    ellington
    coltrane
    Is this correct?  [y/n: y] y

    [..output from map generation..]

    NIS Map update completed.
    ellington has been setup as an YP master server without any errors.

This will create ``/var/yp/Makefile`` from ``/var/yp/Makefile.dist``. By
default, this file assumes that the environment has a single NIS server
with only FreeBSD clients. Since ``test-domain`` has a slave server,
edit this line in ``/var/yp/Makefile`` so that it begins with a comment
(``#``):

.. code:: programlisting

    NOPUSH = "True"

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

29.4.4.2.?Adding New Users
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every time a new user is created, the user account must be added to the
master NIS server and the NIS maps rebuilt. Until this occurs, the new
user will not be able to login anywhere except on the NIS master. For
example, to add the new user ``jsmith`` to the ``test-domain`` domain,
run these commands on the master server:

.. code:: screen

    # pw useradd jsmith
    # cd /var/yp
    # make test-domain

The user could also be added using ``adduser         jsmith`` instead of
``pw useradd         smith``.

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

29.4.5.?Setting up a NIS Slave Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To set up an NIS slave server, log on to the slave server and edit
``/etc/rc.conf`` as for the master server. Do not generate any NIS maps,
as these already exist on the master server. When running ``ypinit`` on
the slave server, use ``-s`` (for slave) instead of ``-m`` (for master).
This option requires the name of the NIS master in addition to the
domain name, as seen in this example:

.. code:: screen

    coltrane# ypinit -s ellington test-domain

    Server Type: SLAVE Domain: test-domain Master: ellington

    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.

    Do you want this procedure to quit on non-fatal errors? [y/n: n]  n

    Ok, please remember to go back and redo manually whatever fails.
    If not, something might not work.
    There will be no further questions. The remainder of the procedure
    should take a few minutes, to copy the databases from ellington.
    Transferring netgroup...
    ypxfr: Exiting: Map successfully transferred
    Transferring netgroup.byuser...
    ypxfr: Exiting: Map successfully transferred
    Transferring netgroup.byhost...
    ypxfr: Exiting: Map successfully transferred
    Transferring master.passwd.byuid...
    ypxfr: Exiting: Map successfully transferred
    Transferring passwd.byuid...
    ypxfr: Exiting: Map successfully transferred
    Transferring passwd.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring group.bygid...
    ypxfr: Exiting: Map successfully transferred
    Transferring group.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring services.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring rpc.bynumber...
    ypxfr: Exiting: Map successfully transferred
    Transferring rpc.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring protocols.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring master.passwd.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring networks.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring networks.byaddr...
    ypxfr: Exiting: Map successfully transferred
    Transferring netid.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring hosts.byaddr...
    ypxfr: Exiting: Map successfully transferred
    Transferring protocols.bynumber...
    ypxfr: Exiting: Map successfully transferred
    Transferring ypservers...
    ypxfr: Exiting: Map successfully transferred
    Transferring hosts.byname...
    ypxfr: Exiting: Map successfully transferred

    coltrane has been setup as an YP slave server without any errors.
    Remember to update map ypservers on ellington.

This will generate a directory on the slave server called
``/var/yp/test-domain`` which contains copies of the NIS master server's
maps. Adding these ``/etc/crontab`` entries on each slave server will
force the slaves to sync their maps with the maps on the master server:

.. code:: programlisting

    20      *       *       *       *       root   /usr/libexec/ypxfr passwd.byname
    21      *       *       *       *       root   /usr/libexec/ypxfr passwd.byuid

These entries are not mandatory because the master server automatically
attempts to push any map changes to its slaves. However, since clients
may depend upon the slave server to provide correct password
information, it is recommended to force frequent password map updates.
This is especially important on busy networks where map updates might
not always complete.

To finish the configuration, run ``/etc/netstart`` on the slave server
in order to start the NIS services.

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

29.4.6.?Setting Up an NIS Client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An NIS client binds to an NIS server using
`ypbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypbind&sektion=8>`__.
This daemon broadcasts RPC requests on the local network. These requests
specify the domain name configured on the client. If an NIS server in
the same domain receives one of the broadcasts, it will respond to
ypbind, which will record the server's address. If there are several
servers available, the client will use the address of the first server
to respond and will direct all of its NIS requests to that server. The
client will automatically ping the server on a regular basis to make
sure it is still available. If it fails to receive a reply within a
reasonable amount of time, ypbind will mark the domain as unbound and
begin broadcasting again in the hopes of locating another server.

To configure a FreeBSD machine to be an NIS client:

.. raw:: html

   <div class="procedure">

#. Edit ``/etc/rc.conf`` and add the following lines in order to set the
   NIS domain name and start
   `ypbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypbind&sektion=8>`__
   during network startup:

   .. code:: programlisting

       nisdomainname="test-domain"
       nis_client_enable="YES"

#. To import all possible password entries from the NIS server, use
   ``vipw`` to remove all user accounts except one from
   ``/etc/master.passwd``. When removing the accounts, keep in mind that
   at least one local account should remain and this account should be a
   member of ``wheel``. If there is a problem with NIS, this local
   account can be used to log in remotely, become the superuser, and fix
   the problem. Before saving the edits, add the following line to the
   end of the file:

   .. code:: programlisting

       +:::::::::

   This line configures the client to provide anyone with a valid
   account in the NIS server's password maps an account on the client.
   There are many ways to configure the NIS client by modifying this
   line. One method is described in `Section?29.4.8, “Using
   Netgroups” <network-nis.html#network-netgroups>`__. For more detailed
   reading, refer to the book ``Managing NFS and NIS``, published by
   O'Reilly Media.

#. To import all possible group entries from the NIS server, add this
   line to ``/etc/group``:

   .. code:: programlisting

       +:*::

.. raw:: html

   </div>

To start the NIS client immediately, execute the following commands as
the superuser:

.. code:: screen

    # /etc/netstart
    # service ypbind start

After completing these steps, running ``ypcat passwd`` on the client
should show the server's ``passwd`` map.

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

29.4.7.?NIS Security
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since RPC is a broadcast-based service, any system running ypbind within
the same domain can retrieve the contents of the NIS maps. To prevent
unauthorized transactions,
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
supports a feature called “securenets” which can be used to restrict
access to a given set of hosts. By default, this information is stored
in ``/var/yp/securenets``, unless
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
is started with ``-p`` and an alternate path. This file contains entries
that consist of a network specification and a network mask separated by
white space. Lines starting with ``#`` are considered to be comments. A
sample ``securenets`` might look like this:

.. code:: programlisting

    # allow connections from local host -- mandatory
    127.0.0.1     255.255.255.255
    # allow connections from any host
    # on the 192.168.128.0 network
    192.168.128.0 255.255.255.0
    # allow connections from any host
    # between 10.0.0.0 to 10.0.15.255
    # this includes the machines in the testlab
    10.0.0.0      255.255.240.0

If
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
receives a request from an address that matches one of these rules, it
will process the request normally. If the address fails to match a rule,
the request will be ignored and a warning message will be logged. If the
``securenets`` does not exist, ``ypserv`` will allow connections from
any host.

`Section?14.4, “TCP Wrapper” <tcpwrappers.html>`__ is an alternate
mechanism for providing access control instead of ``securenets``. While
either access control mechanism adds some security, they are both
vulnerable to “IP spoofing” attacks. All NIS-related traffic should be
blocked at the firewall.

Servers using ``securenets`` may fail to serve legitimate NIS clients
with archaic TCP/IP implementations. Some of these implementations set
all host bits to zero when doing broadcasts or fail to observe the
subnet mask when calculating the broadcast address. While some of these
problems can be fixed by changing the client configuration, other
problems may force the retirement of these client systems or the
abandonment of ``securenets``.

The use of TCP Wrapper increases the latency of the NIS server. The
additional delay may be long enough to cause timeouts in client
programs, especially in busy networks with slow NIS servers. If one or
more clients suffer from latency, convert those clients into NIS slave
servers and force them to bind to themselves.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.7.1.?Barring Some Users
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In this example, the ``basie`` system is a faculty workstation within
the NIS domain. The ``passwd`` map on the master NIS server contains
accounts for both faculty and students. This section demonstrates how to
allow faculty logins on this system while refusing student logins.

To prevent specified users from logging on to a system, even if they are
present in the NIS database, use ``vipw`` to add ``-username`` with the
correct number of colons towards the end of ``/etc/master.passwd`` on
the client, where *``username``* is the username of a user to bar from
logging in. The line with the blocked user must be before the ``+`` line
that allows NIS users. In this example, ``bill`` is barred from logging
on to ``basie``:

.. code:: screen

    basie# cat /etc/master.passwd
    root:[password]:0:0::0:0:The super-user:/root:/bin/csh
    toor:[password]:0:0::0:0:The other super-user:/root:/bin/sh
    daemon:*:1:1::0:0:Owner of many system processes:/root:/sbin/nologin
    operator:*:2:5::0:0:System &:/:/sbin/nologin
    bin:*:3:7::0:0:Binaries Commands and Source,,,:/:/sbin/nologin
    tty:*:4:65533::0:0:Tty Sandbox:/:/sbin/nologin
    kmem:*:5:65533::0:0:KMem Sandbox:/:/sbin/nologin
    games:*:7:13::0:0:Games pseudo-user:/usr/games:/sbin/nologin
    news:*:8:8::0:0:News Subsystem:/:/sbin/nologin
    man:*:9:9::0:0:Mister Man Pages:/usr/share/man:/sbin/nologin
    bind:*:53:53::0:0:Bind Sandbox:/:/sbin/nologin
    uucp:*:66:66::0:0:UUCP pseudo-user:/var/spool/uucppublic:/usr/libexec/uucp/uucico
    xten:*:67:67::0:0:X-10 daemon:/usr/local/xten:/sbin/nologin
    pop:*:68:6::0:0:Post Office Owner:/nonexistent:/sbin/nologin
    nobody:*:65534:65534::0:0:Unprivileged user:/nonexistent:/sbin/nologin
    -bill:::::::::
    +:::::::::

    basie#

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

29.4.8.?Using Netgroups
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Barring specified users from logging on to individual systems becomes
unscaleable on larger networks and quickly loses the main benefit of
NIS: *centralized* administration.

Netgroups were developed to handle large, complex networks with hundreds
of users and machines. Their use is comparable to UNIX? groups, where
the main difference is the lack of a numeric ID and the ability to
define a netgroup by including both user accounts and other netgroups.

To expand on the example used in this chapter, the NIS domain will be
extended to add the users and systems shown in Tables 28.2 and 28.3:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?29.2.?Additional Users

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------------------------+-----------------------------+
| User Name(s)                            | Description                 |
+=========================================+=============================+
| ``alpha``, ``beta``                     | IT department employees     |
+-----------------------------------------+-----------------------------+
| ``charlie``, ``delta``                  | IT department apprentices   |
+-----------------------------------------+-----------------------------+
| ``echo``, ``foxtrott``, ``golf``, ...   | employees                   |
+-----------------------------------------+-----------------------------+
| ``able``, ``baker``, ...                | interns                     |
+-----------------------------------------+-----------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?29.3.?Additional Systems

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------------------------------------------------+----------------------------------------------------------------------------------------------+
| Machine Name(s)                                                  | Description                                                                                  |
+==================================================================+==============================================================================================+
| ``war``, ``death``, ``famine``, ``pollution``                    | Only IT employees are allowed to log onto these servers.                                     |
+------------------------------------------------------------------+----------------------------------------------------------------------------------------------+
| ``pride``, ``greed``, ``envy``, ``wrath``, ``lust``, ``sloth``   | All members of the IT department are allowed to login onto these servers.                    |
+------------------------------------------------------------------+----------------------------------------------------------------------------------------------+
| ``one``, ``two``, ``three``, ``four``, ...                       | Ordinary workstations used by employees.                                                     |
+------------------------------------------------------------------+----------------------------------------------------------------------------------------------+
| ``trashcan``                                                     | A very old machine without any critical data. Even interns are allowed to use this system.   |
+------------------------------------------------------------------+----------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

When using netgroups to configure this scenario, each user is assigned
to one or more netgroups and logins are then allowed or forbidden for
all members of the netgroup. When adding a new machine, login
restrictions must be defined for all netgroups. When a new user is
added, the account must be added to one or more netgroups. If the NIS
setup is planned carefully, only one central configuration file needs
modification to grant or deny access to machines.

The first step is the initialization of the NIS ``netgroup`` map. In
FreeBSD, this map is not created by default. On the NIS master server,
use an editor to create a map named ``/var/yp/netgroup``.

This example creates four netgroups to represent IT employees, IT
apprentices, employees, and interns:

.. code:: programlisting

    IT_EMP  (,alpha,test-domain)    (,beta,test-domain)
    IT_APP  (,charlie,test-domain)  (,delta,test-domain)
    USERS   (,echo,test-domain)     (,foxtrott,test-domain) \
            (,golf,test-domain)
    INTERNS (,able,test-domain)     (,baker,test-domain)

Each entry configures a netgroup. The first column in an entry is the
name of the netgroup. Each set of brackets represents either a group of
one or more users or the name of another netgroup. When specifying a
user, the three comma-delimited fields inside each group represent:

.. raw:: html

   <div class="orderedlist">

#. The name of the host(s) where the other fields representing the user
   are valid. If a hostname is not specified, the entry is valid on all
   hosts.

#. The name of the account that belongs to this netgroup.

#. The NIS domain for the account. Accounts may be imported from other
   NIS domains into a netgroup.

.. raw:: html

   </div>

If a group contains multiple users, separate each user with whitespace.
Additionally, each field may contain wildcards. See
`netgroup(5) <http://www.FreeBSD.org/cgi/man.cgi?query=netgroup&sektion=5>`__
for details.

Netgroup names longer than 8 characters should not be used. The names
are case sensitive and using capital letters for netgroup names is an
easy way to distinguish between user, machine and netgroup names.

Some non-FreeBSD NIS clients cannot handle netgroups containing more
than 15 entries. This limit may be circumvented by creating several
sub-netgroups with 15 users or fewer and a real netgroup consisting of
the sub-netgroups, as seen in this example:

.. code:: programlisting

    BIGGRP1  (,joe1,domain)  (,joe2,domain)  (,joe3,domain) [...]
    BIGGRP2  (,joe16,domain)  (,joe17,domain) [...]
    BIGGRP3  (,joe31,domain)  (,joe32,domain)
    BIGGROUP  BIGGRP1 BIGGRP2 BIGGRP3

Repeat this process if more than 225 (15 times 15) users exist within a
single netgroup.

To activate and distribute the new NIS map:

.. code:: screen

    ellington# cd /var/yp
    ellington# make

This will generate the three NIS maps ``netgroup``, ``netgroup.byhost``
and ``netgroup.byuser``. Use the map key option of
`ypcat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypcat&sektion=1>`__
to check if the new NIS maps are available:

.. code:: screen

    ellington% ypcat -k netgroup
    ellington% ypcat -k netgroup.byhost
    ellington% ypcat -k netgroup.byuser

The output of the first command should resemble the contents of
``/var/yp/netgroup``. The second command only produces output if
host-specific netgroups were created. The third command is used to get
the list of netgroups for a user.

To configure a client, use
`vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__ to
specify the name of the netgroup. For example, on the server named
``war``, replace this line:

.. code:: programlisting

    +:::::::::

with

.. code:: programlisting

    +@IT_EMP:::::::::

This specifies that only the users defined in the netgroup ``IT_EMP``
will be imported into this system's password database and only those
users are allowed to login to this system.

This configuration also applies to the ``~`` function of the shell and
all routines which convert between user names and numerical user IDs. In
other words, ``cd ~user`` will not work, ``ls -l`` will show the
numerical ID instead of the username, and
``find . -user joe       -print`` will fail with the message No such
user. To fix this, import all user entries without allowing them to
login into the servers. This can be achieved by adding an extra line:

.. code:: programlisting

    +:::::::::/sbin/nologin

This line configures the client to import all entries but to replace the
shell in those entries with ``/sbin/nologin``.

Make sure that extra line is placed *after* ``+@IT_EMP:::::::::``.
Otherwise, all user accounts imported from NIS will have
``/sbin/nologin`` as their login shell and no one will be able to login
to the system.

To configure the less important servers, replace the old ``+:::::::::``
on the servers with these lines:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@IT_APP:::::::::
    +:::::::::/sbin/nologin

The corresponding lines for the workstations would be:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@USERS:::::::::
    +:::::::::/sbin/nologin

NIS supports the creation of netgroups from other netgroups which can be
useful if the policy regarding user access changes. One possibility is
the creation of role-based netgroups. For example, one might create a
netgroup called ``BIGSRV`` to define the login restrictions for the
important servers, another netgroup called ``SMALLSRV`` for the less
important servers, and a third netgroup called ``USERBOX`` for the
workstations. Each of these netgroups contains the netgroups that are
allowed to login onto these machines. The new entries for the NIS
``netgroup`` map would look like this:

.. code:: programlisting

    BIGSRV    IT_EMP  IT_APP
    SMALLSRV  IT_EMP  IT_APP  ITINTERN
    USERBOX   IT_EMP  ITINTERN USERS

This method of defining login restrictions works reasonably well when it
is possible to define groups of machines with identical restrictions.
Unfortunately, this is the exception and not the rule. Most of the time,
the ability to define login restrictions on a per-machine basis is
required.

Machine-specific netgroup definitions are another possibility to deal
with the policy changes. In this scenario, the ``/etc/master.passwd`` of
each system contains two lines starting with “+”. The first line adds a
netgroup with the accounts allowed to login onto this machine and the
second line adds all other accounts with ``/sbin/nologin`` as shell. It
is recommended to use the “ALL-CAPS” version of the hostname as the name
of the netgroup:

.. code:: programlisting

    +@BOXNAME:::::::::
    +:::::::::/sbin/nologin

Once this task is completed on all the machines, there is no longer a
need to modify the local versions of ``/etc/master.passwd`` ever again.
All further changes can be handled by modifying the NIS map. Here is an
example of a possible ``netgroup`` map for this scenario:

.. code:: programlisting

    # Define groups of users first
    IT_EMP    (,alpha,test-domain)    (,beta,test-domain)
    IT_APP    (,charlie,test-domain)  (,delta,test-domain)
    DEPT1     (,echo,test-domain)     (,foxtrott,test-domain)
    DEPT2     (,golf,test-domain)     (,hotel,test-domain)
    DEPT3     (,india,test-domain)    (,juliet,test-domain)
    ITINTERN  (,kilo,test-domain)     (,lima,test-domain)
    D_INTERNS (,able,test-domain)     (,baker,test-domain)
    #
    # Now, define some groups based on roles
    USERS     DEPT1   DEPT2     DEPT3
    BIGSRV    IT_EMP  IT_APP
    SMALLSRV  IT_EMP  IT_APP    ITINTERN
    USERBOX   IT_EMP  ITINTERN  USERS
    #
    # And a groups for a special tasks
    # Allow echo and golf to access our anti-virus-machine
    SECURITY  IT_EMP  (,echo,test-domain)  (,golf,test-domain)
    #
    # machine-based netgroups
    # Our main servers
    WAR       BIGSRV
    FAMINE    BIGSRV
    # User india needs access to this server
    POLLUTION  BIGSRV  (,india,test-domain)
    #
    # This one is really important and needs more access restrictions
    DEATH     IT_EMP
    #
    # The anti-virus-machine mentioned above
    ONE       SECURITY
    #
    # Restrict a machine to a single user
    TWO       (,hotel,test-domain)
    # [...more groups to follow]

It may not always be advisable to use machine-based netgroups. When
deploying a couple of dozen or hundreds of systems, role-based netgroups
instead of machine-based netgroups may be used to keep the size of the
NIS map within reasonable limits.

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

29.4.9.?Password Formats
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NIS requires that all hosts within an NIS domain use the same format for
encrypting passwords. If users have trouble authenticating on an NIS
client, it may be due to a differing password format. In a heterogeneous
network, the format must be supported by all operating systems, where
DES is the lowest common standard.

To check which format a server or client is using, look at this section
of ``/etc/login.conf``:

.. code:: programlisting

    default:\
        :passwd_format=des:\
        :copyright=/etc/COPYRIGHT:\
        [Further entries elided]

In this example, the system is using the DES format. Other possible
values are ``blf`` for Blowfish and ``md5`` for MD5 encrypted passwords.

If the format on a host needs to be edited to match the one being used
in the NIS domain, the login capability database must be rebuilt after
saving the change:

.. code:: screen

    # cap_mkdb /etc/login.conf

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The format of passwords for existing user accounts will not be updated
until each user changes their password *after* the login capability
database is rebuilt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------------+-------------------------------------------------------+
| `Prev <network-nfs.html>`__?       | `Up <network-servers.html>`__   | ?\ `Next <network-ldap.html>`__                       |
+------------------------------------+---------------------------------+-------------------------------------------------------+
| 29.3.?Network File System (NFS)?   | `Home <index.html>`__           | ?29.5.?Lightweight Directory Access Protocol (LDAP)   |
+------------------------------------+---------------------------------+-------------------------------------------------------+

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
