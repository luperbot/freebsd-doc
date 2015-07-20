=========================================
29.4. Network Information System (NIS/YP)
=========================================

.. raw:: html

   <div class="navheader">

29.4. Network Information System (NIS/YP)
`????? <network-nfs.html>`__?
???????? 29. ???????????? ???????
?\ `??????? <network-dhcp.html>`__

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

29.4. Network Information System (NIS/YP)
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   <div>

Enhanced by Eric Ogren ??? Udo Erdelhoff.

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

29.4.1. What Is It?
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NIS, which stands for Network Information Services, was developed by Sun
Microsystems to centralize administration of UNIX(R) (originally
SunOSTM) systems. It has now essentially become an industry standard;
all major UNIX(R) like systems (SolarisTM, HP-UX, AIX(R), Linux, NetBSD,
OpenBSD, FreeBSD, etc) support NIS.

NIS was formerly known as Yellow Pages, but because of trademark issues,
Sun changed the name. The old term (and yp) is still often seen and
used.

It is a RPC-based client/server system that allows a group of machines
within an NIS domain to share a common set of configuration files. This
permits a system administrator to set up NIS client systems with only
minimal configuration data and add, remove or modify configuration data
from a single location.

It is similar to the Windows?NT(R) domain system; although the internal
implementation of the two are not at all similar, the basic
functionality can be compared.

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

29.4.2. Terms/Processes You Should Know
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are several terms and several important user processes that you
will come across when attempting to implement NIS on FreeBSD, whether
you are trying to create an NIS server or act as an NIS client:

.. raw:: html

   <div class="informaltable">

+------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Term             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
+==================+==================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| NIS domainname   | An NIS master server and all of its clients (including its slave servers) have a NIS domainname. Similar to an Windows?NT(R) domain name, the NIS domainname does not have anything to do with DNS.                                                                                                                                                                                                                                                                                                                                                                                              |
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| rpcbind          | Must be running in order to enable RPC (Remote Procedure Call, a network protocol used by NIS). If rpcbind is not running, it will be impossible to run an NIS server, or to act as an NIS client.                                                                                                                                                                                                                                                                                                                                                                                               |
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ypbind           | ?Binds? an NIS client to its NIS server. It will take the NIS domainname from the system, and using RPC, connect to the server. ypbind is the core of client-server communication in an NIS environment; if ypbind dies on a client machine, it will not be able to access the NIS server.                                                                                                                                                                                                                                                                                                       |
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ypserv           | Should only be running on NIS servers; this is the NIS server process itself. If `ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__ dies, then the server will no longer be able to respond to NIS requests (hopefully, there is a slave server to take over for it). There are some implementations of NIS (but not the FreeBSD one), that do not try to reconnect to another server if the server it used before dies. Often, the only thing that helps in this case is to restart the server process (or even the whole server) or the ypbind process on the client.   |
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| rpc.yppasswdd    | Another process that should only be running on NIS master servers; this is a daemon that will allow NIS clients to change their NIS passwords. If this daemon is not running, users will have to login to the NIS master server and change their passwords there.                                                                                                                                                                                                                                                                                                                                |
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

29.4.3. How Does It Work?
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are three types of hosts in an NIS environment: master servers,
slave servers, and clients. Servers act as a central repository for host
configuration information. Master servers hold the authoritative copy of
this information, while slave servers mirror this information for
redundancy. Clients rely on the servers to provide this information to
them.

Information in many files can be shared in this manner. The
``master.passwd``, ``group``, and ``hosts`` files are commonly shared
via NIS. Whenever a process on a client needs information that would
normally be found in these files locally, it makes a query to the NIS
server that it is bound to instead.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.3.1. Machine Types
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  A *NIS master server*. This server, analogous to a Windows?NT(R)
   primary domain controller, maintains the files used by all of the NIS
   clients. The ``passwd``, ``group``, and other various files used by
   the NIS clients live on the master server.

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   It is possible for one machine to be an NIS master server for more
   than one NIS domain. However, this will not be covered in this
   introduction, which assumes a relatively small-scale NIS environment.

   .. raw:: html

      </div>

-  *NIS slave servers*. Similar to the Windows?NT(R) backup domain
   controllers, NIS slave servers maintain copies of the NIS master's
   data files. NIS slave servers provide the redundancy, which is needed
   in important environments. They also help to balance the load of the
   master server: NIS Clients always attach to the NIS server whose
   response they get first, and this includes slave-server-replies.

-  *NIS clients*. NIS clients, like most Windows?NT(R) workstations,
   authenticate against the NIS server (or the Windows?NT(R) domain
   controller in the Windows?NT(R) workstations case) to log on.

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

29.4.4. Using NIS/YP
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section will deal with setting up a sample NIS environment.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.1. Planning
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Let us assume that you are the administrator of a small university lab.
This lab, which consists of 15 FreeBSD machines, currently has no
centralized point of administration; each machine has its own
``/etc/passwd`` and ``/etc/master.passwd``. These files are kept in sync
with each other only through manual intervention; currently, when you
add a user to the lab, you must run ``adduser`` on all 15 machines.
Clearly, this has to change, so you have decided to convert the lab to
use NIS, using two of the machines as servers.

Therefore, the configuration of the lab now looks something like:

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

If you are setting up a NIS scheme for the first time, it is a good idea
to think through how you want to go about it. No matter what the size of
your network, there are a few decisions that need to be made.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.1.1. Choosing a NIS Domain Name
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This might not be the ?domainname? that you are used to. It is more
accurately called the ?NIS domainname?. When a client broadcasts its
requests for info, it includes the name of the NIS domain that it is
part of. This is how multiple servers on one network can tell which
server should answer which request. Think of the NIS domainname as the
name for a group of hosts that are related in some way.

Some organizations choose to use their Internet domainname for their NIS
domainname. This is not recommended as it can cause confusion when
trying to debug network problems. The NIS domainname should be unique
within your network and it is helpful if it describes the group of
machines it represents. For example, the Art department at Acme Inc.
might be in the ?acme-art? NIS domain. For this example, assume you have
chosen the name ``test-domain``.

However, some operating systems (notably SunOSTM) use their NIS domain
name as their Internet domain name. If one or more machines on your
network have this restriction, you *must* use the Internet domain name
as your NIS domain name.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.1.2. Physical Server Requirements
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are several things to keep in mind when choosing a machine to use
as a NIS server. One of the unfortunate things about NIS is the level of
dependency the clients have on the server. If a client cannot contact
the server for its NIS domain, very often the machine becomes unusable.
The lack of user and group information causes most systems to
temporarily freeze up. With this in mind you should make sure to choose
a machine that will not be prone to being rebooted regularly, or one
that might be used for development. The NIS server should ideally be a
stand alone machine whose sole purpose in life is to be an NIS server.
If you have a network that is not very heavily used, it is acceptable to
put the NIS server on a machine running other services, just keep in
mind that if the NIS server becomes unavailable, it will affect *all* of
your NIS clients adversely.

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

29.4.4.2. NIS Servers
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The canonical copies of all NIS information are stored on a single
machine called the NIS master server. The databases used to store the
information are called NIS maps. In FreeBSD, these maps are stored in
``/var/yp/[domainname]`` where ``[domainname]`` is the name of the NIS
domain being served. A single NIS server can support several domains at
once, therefore it is possible to have several such directories, one for
each supported domain. Each domain will have its own independent set of
maps.

NIS master and slave servers handle all NIS requests with the ``ypserv``
daemon. ``ypserv`` is responsible for receiving incoming requests from
NIS clients, translating the requested domain and map name to a path to
the corresponding database file and transmitting data from the database
back to the client.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.2.1. Setting Up a NIS Master Server
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setting up a master NIS server can be relatively straight forward,
depending on your needs. FreeBSD comes with support for NIS
out-of-the-box. All you need is to add the following lines to
``/etc/rc.conf``, and FreeBSD will do the rest for you.

.. raw:: html

   <div class="procedure">

#. .. code:: programlisting

       nisdomainname="test-domain"

   This line will set the NIS domainname to ``test-domain`` upon network
   setup (e.g. after reboot).

#. .. code:: programlisting

       nis_server_enable="YES"

   This will tell FreeBSD to start up the NIS server processes when the
   networking is next brought up.

#. .. code:: programlisting

       nis_yppasswdd_enable="YES"

   This will enable the ``rpc.yppasswdd`` daemon which, as mentioned
   above, will allow users to change their NIS password from a client
   machine.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Depending on your NIS setup, you may need to add further entries. See
the `section about NIS servers that are also NIS
clients <network-nis.html#network-nis-server-is-client>`__, below, for
details.

.. raw:: html

   </div>

Now, all you have to do is to run the command ``/etc/netstart`` as
superuser. It will set up everything for you, using the values you
defined in ``/etc/rc.conf``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.2.2. Initializing the NIS Maps
'''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The *NIS maps* are database files, that are kept in the ``/var/yp``
directory. They are generated from configuration files in the ``/etc``
directory of the NIS master, with one exception: the
``/etc/master.passwd`` file. This is for a good reason, you do not want
to propagate passwords to your ``root`` and other administrative
accounts to all the servers in the NIS domain. Therefore, before we
initialize the NIS maps, you should:

.. code:: screen

    # cp /etc/master.passwd /var/yp/master.passwd
    # cd /var/yp
    # vi master.passwd

You should remove all entries regarding system accounts (``bin``,
``tty``, ``kmem``, ``games``, etc), as well as any accounts that you do
not want to be propagated to the NIS clients (for example ``root`` and
any other UID 0 (superuser) accounts).

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Make sure the ``/var/yp/master.passwd`` is neither group nor world
readable (mode 600)! Use the ``chmod`` command, if appropriate.

.. raw:: html

   </div>

When you have finished, it is time to initialize the NIS maps! FreeBSD
includes a script named ``ypinit`` to do this for you (see its manual
page for more information). Note that this script is available on most
UNIX(R) Operating Systems, but not on all. On Digital UNIX/Compaq Tru64
UNIX it is called ``ypsetup``. Because we are generating maps for an NIS
master, we are going to pass the ``-m`` option to ``ypinit``. To
generate the NIS maps, assuming you already performed the steps above,
run:

.. code:: screen

    ellington# ypinit -m test-domain
    Server Type: MASTER Domain: test-domain
    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.
    Do you want this procedure to quit on non-fatal errors? [y/n: n] n
    Ok, please remember to go back and redo manually whatever fails.
    If you don't, something might not work.
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

``ypinit`` should have created ``/var/yp/Makefile`` from
``/var/yp/Makefile.dist``. When created, this file assumes that you are
operating in a single server NIS environment with only FreeBSD machines.
Since ``test-domain`` has a slave server as well, you must edit
``/var/yp/Makefile``:

.. code:: screen

    ellington# vi /var/yp/Makefile

You should comment out the line that says

.. code:: programlisting

    NOPUSH = "True"

(if it is not commented out already).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.2.3. Setting up a NIS Slave Server
'''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setting up an NIS slave server is even more simple than setting up the
master. Log on to the slave server and edit the file ``/etc/rc.conf`` as
you did before. The only difference is that we now must use the ``-s``
option when running ``ypinit``. The ``-s`` option requires the name of
the NIS master be passed to it as well, so our command line looks like:

.. code:: screen

    coltrane# ypinit -s ellington test-domain

    Server Type: SLAVE Domain: test-domain Master: ellington

    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.

    Do you want this procedure to quit on non-fatal errors? [y/n: n]  n

    Ok, please remember to go back and redo manually whatever fails.
    If you don't, something might not work.
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
    Don't forget to update map ypservers on ellington.

You should now have a directory called ``/var/yp/test-domain``. Copies
of the NIS master server's maps should be in this directory. You will
need to make sure that these stay updated. The following
``/etc/crontab`` entries on your slave servers should do the job:

.. code:: programlisting

    20      *       *       *       *       root   /usr/libexec/ypxfr passwd.byname
    21      *       *       *       *       root   /usr/libexec/ypxfr passwd.byuid

These two lines force the slave to sync its maps with the maps on the
master server. Although these entries are not mandatory, since the
master server attempts to ensure any changes to its NIS maps are
communicated to its slaves and because password information is vital to
systems depending on the server, it is a good idea to force the updates.
This is more important on busy networks where map updates might not
always complete.

Now, run the command ``/etc/netstart`` on the slave server as well,
which again starts the NIS server.

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

29.4.4.3. NIS Clients
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An NIS client establishes what is called a binding to a particular NIS
server using the ``ypbind`` daemon. ``ypbind`` checks the system's
default domain (as set by the ``domainname`` command), and begins
broadcasting RPC requests on the local network. These requests specify
the name of the domain for which ``ypbind`` is attempting to establish a
binding. If a server that has been configured to serve the requested
domain receives one of the broadcasts, it will respond to ``ypbind``,
which will record the server's address. If there are several servers
available (a master and several slaves, for example), ``ypbind`` will
use the address of the first one to respond. From that point on, the
client system will direct all of its NIS requests to that server.
``ypbind`` will occasionally ?ping? the server to make sure it is still
up and running. If it fails to receive a reply to one of its pings
within a reasonable amount of time, ``ypbind`` will mark the domain as
unbound and begin broadcasting again in the hopes of locating another
server.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.4.3.1. Setting Up a NIS Client
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setting up a FreeBSD machine to be a NIS client is fairly
straightforward.

.. raw:: html

   <div class="procedure">

#. Edit the file ``/etc/rc.conf`` and add the following lines in order
   to set the NIS domainname and start ``ypbind`` upon network startup:

   .. code:: programlisting

       nisdomainname="test-domain"
       nis_client_enable="YES"

#. To import all possible password entries from the NIS server, remove
   all user accounts from your ``/etc/master.passwd`` file and use
   ``vipw`` to add the following line to the end of the file:

   .. code:: programlisting

       +:::::::::

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   This line will afford anyone with a valid account in the NIS server's
   password maps an account. There are many ways to configure your NIS
   client by changing this line. See the `netgroups
   section <network-nis.html#network-netgroups>`__ below for more
   information. For more detailed reading see O'Reilly's book on
   ``Managing NFS and NIS``.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   You should keep at least one local account (i.e. not imported via
   NIS) in your ``/etc/master.passwd`` and this account should also be a
   member of the group ``wheel``. If there is something wrong with NIS,
   this account can be used to log in remotely, become ``root``, and fix
   things.

   .. raw:: html

      </div>

#. To import all possible group entries from the NIS server, add this
   line to your ``/etc/group`` file:

   .. code:: programlisting

       +:*::

.. raw:: html

   </div>

After completing these steps, you should be able to run ``ypcat passwd``
and see the NIS server's passwd map.

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

29.4.5. NIS Security
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In general, any remote user can issue an RPC to
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
and retrieve the contents of your NIS maps, provided the remote user
knows your domainname. To prevent such unauthorized transactions,
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
supports a feature called ?securenets? which can be used to restrict
access to a given set of hosts. At startup,
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
will attempt to load the securenets information from a file called
``/var/yp/securenets``.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

This path varies depending on the path specified with the ``-p`` option.
This file contains entries that consist of a network specification and a
network mask separated by white space. Lines starting with ?#? are
considered to be comments. A sample securenets file might look like
this:

.. raw:: html

   </div>

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
``/var/yp/securenets`` file does not exist, ``ypserv`` will allow
connections from any host.

The ``ypserv`` program also has support for Wietse Venema's TCP Wrapper
package. This allows the administrator to use the TCP Wrapper
configuration files for access control instead of
``/var/yp/securenets``.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

While both of these access control mechanisms provide some security,
they, like the privileged port test, are vulnerable to ?IP spoofing?
attacks. All NIS-related traffic should be blocked at your firewall.

Servers using ``/var/yp/securenets`` may fail to serve legitimate NIS
clients with archaic TCP/IP implementations. Some of these
implementations set all host bits to zero when doing broadcasts and/or
fail to observe the subnet mask when calculating the broadcast address.
While some of these problems can be fixed by changing the client
configuration, other problems may force the retirement of the client
systems in question or the abandonment of ``/var/yp/securenets``.

Using ``/var/yp/securenets`` on a server with such an archaic
implementation of TCP/IP is a really bad idea and will lead to loss of
NIS functionality for large parts of your network.

The use of the TCP Wrapper package increases the latency of your NIS
server. The additional delay may be long enough to cause timeouts in
client programs, especially in busy networks or with slow NIS servers.
If one or more of your client systems suffers from these symptoms, you
should convert the client systems in question into NIS slave servers and
force them to bind to themselves.

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

29.4.6. Barring Some Users from Logging On
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In our lab, there is a machine ``basie`` that is supposed to be a
faculty only workstation. We do not want to take this machine out of the
NIS domain, yet the ``passwd`` file on the master NIS server contains
accounts for both faculty and students. What can we do?

There is a way to bar specific users from logging on to a machine, even
if they are present in the NIS database. To do this, all you must do is
add ``-username`` to the end of the ``/etc/master.passwd`` file on the
client machine, where *``username``* is the username of the user you
wish to bar from logging in. This should preferably be done using
``vipw``, since ``vipw`` will sanity check your changes to
``/etc/master.passwd``, as well as automatically rebuild the password
database when you finish editing. For example, if we wanted to bar user
``bill`` from logging on to ``basie`` we would:

.. code:: screen

    basie# vipw
    [add -bill to the end, exit]
    vipw: rebuilding the database...
    vipw: done

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
    +:::::::::
    -bill

    basie#

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

29.4.7. Using Netgroups
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Udo Erdelhoff.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The method shown in the previous section works reasonably well if you
need special rules for a very small number of users and/or machines. On
larger networks, you *will* forget to bar some users from logging onto
sensitive machines, or you may even have to modify each machine
separately, thus losing the main benefit of NIS: *centralized*
administration.

The NIS developers' solution for this problem is called *netgroups*.
Their purpose and semantics can be compared to the normal groups used by
UNIX(R) file systems. The main differences are the lack of a numeric ID
and the ability to define a netgroup by including both user accounts and
other netgroups.

Netgroups were developed to handle large, complex networks with hundreds
of users and machines. On one hand, this is a Good Thing if you are
forced to deal with such a situation. On the other hand, this complexity
makes it almost impossible to explain netgroups with really simple
examples. The example used in the remainder of this section demonstrates
this problem.

Let us assume that your successful introduction of NIS in your
laboratory caught your superiors' interest. Your next job is to extend
your NIS domain to cover some of the other machines on campus. The two
tables contain the names of the new users and new machines as well as
brief descriptions of them.

.. raw:: html

   <div class="informaltable">

+-----------------------------------------+--------------------------------------------+
| User Name(s)                            | Description                                |
+=========================================+============================================+
| ``alpha``, ``beta``                     | Normal employees of the IT department      |
+-----------------------------------------+--------------------------------------------+
| ``charlie``, ``delta``                  | The new apprentices of the IT department   |
+-----------------------------------------+--------------------------------------------+
| ``echo``, ``foxtrott``, ``golf``, ...   | Ordinary employees                         |
+-----------------------------------------+--------------------------------------------+
| ``able``, ``baker``, ...                | The current interns                        |
+-----------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------------------------------------------------------+------------------------------------------------------------------------------------------------------+
| Machine Name(s)                                                  | Description                                                                                          |
+==================================================================+======================================================================================================+
| ``war``, ``death``, ``famine``, ``pollution``                    | Your most important servers. Only the IT employees are allowed to log onto these machines.           |
+------------------------------------------------------------------+------------------------------------------------------------------------------------------------------+
| ``pride``, ``greed``, ``envy``, ``wrath``, ``lust``, ``sloth``   | Less important servers. All members of the IT department are allowed to login onto these machines.   |
+------------------------------------------------------------------+------------------------------------------------------------------------------------------------------+
| ``one``, ``two``, ``three``, ``four``, ...                       | Ordinary workstations. Only the *real* employees are allowed to use these machines.                  |
+------------------------------------------------------------------+------------------------------------------------------------------------------------------------------+
| ``trashcan``                                                     | A very old machine without any critical data. Even the intern is allowed to use this box.            |
+------------------------------------------------------------------+------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

If you tried to implement these restrictions by separately blocking each
user, you would have to add one ``-user`` line to each system's
``passwd`` for each user who is not allowed to login onto that system.
If you forget just one entry, you could be in trouble. It may be
feasible to do this correctly during the initial setup, however you
*will* eventually forget to add the lines for new users during
day-to-day operations. After all, Murphy was an optimist.

Handling this situation with netgroups offers several advantages. Each
user need not be handled separately; you assign a user to one or more
netgroups and allow or forbid logins for all members of the netgroup. If
you add a new machine, you will only have to define login restrictions
for netgroups. If a new user is added, you will only have to add the
user to one or more netgroups. Those changes are independent of each
other: no more ?for each combination of user and machine do...? If your
NIS setup is planned carefully, you will only have to modify exactly one
central configuration file to grant or deny access to machines.

The first step is the initialization of the NIS map netgroup. FreeBSD's
`ypinit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypinit&sektion=8>`__
does not create this map by default, but its NIS implementation will
support it once it has been created. To create an empty map, simply type

.. code:: screen

    ellington# vi /var/yp/netgroup

and start adding content. For our example, we need at least four
netgroups: IT employees, IT apprentices, normal employees and interns.

.. code:: programlisting

    IT_EMP  (,alpha,test-domain)    (,beta,test-domain)
    IT_APP  (,charlie,test-domain)  (,delta,test-domain)
    USERS   (,echo,test-domain)     (,foxtrott,test-domain) \
            (,golf,test-domain)
    INTERNS (,able,test-domain)     (,baker,test-domain)

``IT_EMP``, ``IT_APP`` etc. are the names of the netgroups. Each
bracketed group adds one or more user accounts to it. The three fields
inside a group are:

.. raw:: html

   <div class="orderedlist">

#. The name of the host(s) where the following items are valid. If you
   do not specify a hostname, the entry is valid on all hosts. If you do
   specify a hostname, you will enter a realm of darkness, horror and
   utter confusion.

#. The name of the account that belongs to this netgroup.

#. The NIS domain for the account. You can import accounts from other
   NIS domains into your netgroup if you are one of the unlucky fellows
   with more than one NIS domain.

.. raw:: html

   </div>

Each of these fields can contain wildcards. See
`netgroup(5) <http://www.FreeBSD.org/cgi/man.cgi?query=netgroup&sektion=5>`__
for details.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Netgroup names longer than 8 characters should not be used, especially
if you have machines running other operating systems within your NIS
domain. The names are case sensitive; using capital letters for your
netgroup names is an easy way to distinguish between user, machine and
netgroup names.

Some NIS clients (other than FreeBSD) cannot handle netgroups with a
large number of entries. For example, some older versions of SunOSTM
start to cause trouble if a netgroup contains more than 15 *entries*.
You can circumvent this limit by creating several sub-netgroups with 15
users or less and a real netgroup that consists of the sub-netgroups:

.. code:: programlisting

    BIGGRP1  (,joe1,domain)  (,joe2,domain)  (,joe3,domain) [...]
    BIGGRP2  (,joe16,domain)  (,joe17,domain) [...]
    BIGGRP3  (,joe31,domain)  (,joe32,domain)
    BIGGROUP  BIGGRP1 BIGGRP2 BIGGRP3

You can repeat this process if you need more than 225 users within a
single netgroup.

.. raw:: html

   </div>

Activating and distributing your new NIS map is easy:

.. code:: screen

    ellington# cd /var/yp
    ellington# make

This will generate the three NIS maps ``netgroup``, ``netgroup.byhost``
and ``netgroup.byuser``. Use
`ypcat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypcat&sektion=1>`__
to check if your new NIS maps are available:

.. code:: screen

    ellington% ypcat -k netgroup
    ellington% ypcat -k netgroup.byhost
    ellington% ypcat -k netgroup.byuser

The output of the first command should resemble the contents of
``/var/yp/netgroup``. The second command will not produce output if you
have not specified host-specific netgroups. The third command can be
used to get the list of netgroups for a user.

The client setup is quite simple. To configure the server ``war``, you
only have to start
`vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
and replace the line

.. code:: programlisting

    +:::::::::

with

.. code:: programlisting

    +@IT_EMP:::::::::

Now, only the data for the users defined in the netgroup ``IT_EMP`` is
imported into ``war``'s password database and only these users are
allowed to login.

Unfortunately, this limitation also applies to the ``~`` function of the
shell and all routines converting between user names and numerical user
IDs. In other words, ``cd     ~user`` will not work, ``ls -l`` will show
the numerical ID instead of the username and ``find . -user joe -print``
will fail with No such user. To fix this, you will have to import all
user entries *without allowing them to login onto your servers*.

This can be achieved by adding another line to ``/etc/master.passwd``.
This line should contain:

``+:::::::::/sbin/nologin``, meaning ?Import all entries but replace the
shell with ``/sbin/nologin`` in the imported entries?. You can replace
any field in the ``passwd`` entry by placing a default value in your
``/etc/master.passwd``.

.. raw:: html

   <div class="warning" xmlns="">

?????????????:
~~~~~~~~~~~~~~

Make sure that the line ``+:::::::::/sbin/nologin`` is placed after
``+@IT_EMP:::::::::``. Otherwise, all user accounts imported from NIS
will have ``/sbin/nologin`` as their login shell.

.. raw:: html

   </div>

After this change, you will only have to change one NIS map if a new
employee joins the IT department. You could use a similar approach for
the less important servers by replacing the old ``+:::::::::`` in their
local version of ``/etc/master.passwd`` with something like this:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@IT_APP:::::::::
    +:::::::::/sbin/nologin

The corresponding lines for the normal workstations could be:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@USERS:::::::::
    +:::::::::/sbin/nologin

And everything would be fine until there is a policy change a few weeks
later: The IT department starts hiring interns. The IT interns are
allowed to use the normal workstations and the less important servers;
and the IT apprentices are allowed to login onto the main servers. You
add a new netgroup ``IT_INTERN``, add the new IT interns to this
netgroup and start to change the configuration on each and every
machine... As the old saying goes: ?Errors in centralized planning lead
to global mess?.

NIS' ability to create netgroups from other netgroups can be used to
prevent situations like these. One possibility is the creation of
role-based netgroups. For example, you could create a netgroup called
``BIGSRV`` to define the login restrictions for the important servers,
another netgroup called ``SMALLSRV`` for the less important servers and
a third netgroup called ``USERBOX`` for the normal workstations. Each of
these netgroups contains the netgroups that are allowed to login onto
these machines. The new entries for your NIS map netgroup should look
like this:

.. code:: programlisting

    BIGSRV    IT_EMP  IT_APP
    SMALLSRV  IT_EMP  IT_APP  ITINTERN
    USERBOX   IT_EMP  ITINTERN USERS

This method of defining login restrictions works reasonably well if you
can define groups of machines with identical restrictions.
Unfortunately, this is the exception and not the rule. Most of the time,
you will need the ability to define login restrictions on a per-machine
basis.

Machine-specific netgroup definitions are the other possibility to deal
with the policy change outlined above. In this scenario, the
``/etc/master.passwd`` of each box contains two lines starting with ?+?.
The first of them adds a netgroup with the accounts allowed to login
onto this machine, the second one adds all other accounts with
``/sbin/nologin`` as shell. It is a good idea to use the ?ALL-CAPS?
version of the machine name as the name of the netgroup. In other words,
the lines should look like this:

.. code:: programlisting

    +@BOXNAME:::::::::
    +:::::::::/sbin/nologin

Once you have completed this task for all your machines, you will not
have to modify the local versions of ``/etc/master.passwd`` ever again.
All further changes can be handled by modifying the NIS map. Here is an
example of a possible netgroup map for this scenario with some
additional goodies:

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

If you are using some kind of database to manage your user accounts, you
should be able to create the first part of the map with your database's
report tools. This way, new users will automatically have access to the
boxes.

One last word of caution: It may not always be advisable to use
machine-based netgroups. If you are deploying a couple of dozen or even
hundreds of identical machines for student labs, you should use
role-based netgroups instead of machine-based netgroups to keep the size
of the NIS map within reasonable limits.

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

29.4.8. Important Things to Remember
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are still a couple of things that you will need to do differently
now that you are in an NIS environment.

.. raw:: html

   <div class="itemizedlist">

-  Every time you wish to add a user to the lab, you must add it to the
   master NIS server *only*, and *you must remember to rebuild the NIS
   maps*. If you forget to do this, the new user will not be able to
   login anywhere except on the NIS master. For example, if we needed to
   add a new user ``jsmith`` to the lab, we would:

   .. code:: screen

       # pw useradd jsmith
       # cd /var/yp
       # make test-domain

   You could also run ``adduser jsmith`` instead of
   ``pw useradd jsmith``.

-  *Keep the administration accounts out of the NIS maps*. You do not
   want to be propagating administrative accounts and passwords to
   machines that will have users that should not have access to those
   accounts.

-  *Keep the NIS master and slave secure, and minimize their downtime*.
   If somebody either hacks or simply turns off these machines, they
   have effectively rendered many people without the ability to login to
   the lab.

   This is the chief weakness of any centralized administration system.
   If you do not protect your NIS servers, you will have a lot of angry
   users!

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

29.4.9. NIS v1 Compatibility
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD's ypserv has some support for serving NIS v1 clients. FreeBSD's
NIS implementation only uses the NIS v2 protocol, however other
implementations include support for the v1 protocol for backwards
compatibility with older systems. The ypbind daemons supplied with these
systems will try to establish a binding to an NIS v1 server even though
they may never actually need it (and they may persist in broadcasting in
search of one even after they receive a response from a v2 server). Note
that while support for normal client calls is provided, this version of
ypserv does not handle v1 map transfer requests; consequently, it cannot
be used as a master or slave in conjunction with older NIS servers that
only support the v1 protocol. Fortunately, there probably are not any
such servers still in use today.

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

29.4.10. NIS Servers That Are Also NIS Clients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Care must be taken when running ypserv in a multi-server domain where
the server machines are also NIS clients. It is generally a good idea to
force the servers to bind to themselves rather than allowing them to
broadcast bind requests and possibly become bound to each other. Strange
failure modes can result if one server goes down and others are
dependent upon it. Eventually all the clients will time out and attempt
to bind to other servers, but the delay involved can be considerable and
the failure mode is still present since the servers might bind to each
other all over again.

You can force a host to bind to a particular server by running
``ypbind`` with the ``-S`` flag. If you do not want to do this manually
each time you reboot your NIS server, you can add the following lines to
your ``/etc/rc.conf``:

.. code:: programlisting

    nis_client_enable="YES" # run client stuff as well
    nis_client_flags="-S NIS domain,server"

See
`ypbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypbind&sektion=8>`__
for further information.

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

29.4.11. Password Formats
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the most common issues that people run into when trying to
implement NIS is password format compatibility. If your NIS server is
using DES encrypted passwords, it will only support clients that are
also using DES. For example, if you have SolarisTM NIS clients in your
network, then you will almost certainly need to use DES encrypted
passwords.

To check which format your servers and clients are using, look at
``/etc/login.conf``. If the host is configured to use DES encrypted
passwords, then the ``default`` class will contain an entry like this:

.. code:: programlisting

    default:\
        :passwd_format=des:\
        :copyright=/etc/COPYRIGHT:\
        [Further entries elided]

Other possible values for the ``passwd_format`` capability include
``blf`` and ``md5`` (for Blowfish and MD5 encrypted passwords,
respectively).

If you have made changes to ``/etc/login.conf``, you will also need to
rebuild the login capability database, which is achieved by running the
following command as ``root``:

.. code:: screen

    # cap_mkdb /etc/login.conf

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The format of passwords already in ``/etc/master.passwd`` will not be
updated until a user changes his password for the first time *after* the
login capability database is rebuilt.

.. raw:: html

   </div>

Next, in order to ensure that passwords are encrypted with the format
that you have chosen, you should also check that the ``crypt_default``
in ``/etc/auth.conf`` gives precedence to your chosen password format.
To do this, place the format that you have chosen first in the list. For
example, when using DES encrypted passwords, the entry would be:

.. code:: programlisting

    crypt_default   =   des blf md5

Having followed the above steps on each of the FreeBSD based NIS servers
and clients, you can be sure that they all agree on which password
format is used within your network. If you have trouble authenticating
on an NIS client, this is a pretty good place to start looking for
possible problems. Remember: if you want to deploy an NIS server for a
heterogenous network, you will probably have to use DES on all systems
because it is the lowest common standard.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-----------------------------------+-------------------------------------------------+
| `????? <network-nfs.html>`__?      | `???? <network-servers.html>`__   | ?\ `??????? <network-dhcp.html>`__              |
+------------------------------------+-----------------------------------+-------------------------------------------------+
| 29.3. Network File System (NFS)?   | `???? <index.html>`__             | ?29.5. Automatic Network Configuration (DHCP)   |
+------------------------------------+-----------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
