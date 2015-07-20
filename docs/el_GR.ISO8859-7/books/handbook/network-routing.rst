=========================
31.2. Gateways and Routes
=========================

.. raw:: html

   <div class="navheader">

31.2. Gateways and Routes
`????? <advanced-networking.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-wireless.html>`__

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

31.2. Gateways and Routes
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Coranth Gryphon.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For one machine to be able to find another over a network, there must be
a mechanism in place to describe how to get from one to the other. This
is called *routing*. A ?route? is a defined pair of addresses: a
?destination? and a ?gateway?. The pair indicates that if you are trying
to get to this *destination*, communicate through this *gateway*. There
are three types of destinations: individual hosts, subnets, and
?default?. The ?default route? is used if none of the other routes
apply. We will talk a little bit more about default routes later on.
There are also three types of gateways: individual hosts, interfaces
(also called ?links?), and Ethernet hardware addresses (MAC addresses).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.2.1. An Example
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To illustrate different aspects of routing, we will use the following
example from ``netstat``:

.. code:: screen

    % netstat -r
    Routing tables

    Destination      Gateway            Flags     Refs     Use     Netif Expire

    default          outside-gw         UGSc       37      418      ppp0
    localhost        localhost          UH          0      181       lo0
    test0            0:e0:b5:36:cf:4f   UHLW        5    63288       ed0     77
    10.20.30.255     link#1             UHLW        1     2421
    example.com      link#1             UC          0        0
    host1            0:e0:a8:37:8:1e    UHLW        3     4601       lo0
    host2            0:e0:a8:37:8:1e    UHLW        0        5       lo0 =>
    host2.example.com link#1             UC          0        0
    224              link#1             UC          0        0

The first two lines specify the default route (which we will cover in
the `next section <network-routing.html#network-routing-default>`__) and
the ``localhost`` route.

The interface (``Netif`` column) that this routing table specifies to
use for ``localhost`` is ``lo0``, also known as the loopback device.
This says to keep all traffic for this destination internal, rather than
sending it out over the LAN, since it will only end up back where it
started.

The next thing that stands out are the addresses beginning with
``0:e0:``. These are Ethernet hardware addresses, which are also known
as MAC addresses. FreeBSD will automatically identify any hosts
(``test0`` in the example) on the local Ethernet and add a route for
that host, directly to it over the Ethernet interface, ``ed0``. There is
also a timeout (``Expire`` column) associated with this type of route,
which is used if we fail to hear from the host in a specific amount of
time. When this happens, the route to this host will be automatically
deleted. These hosts are identified using a mechanism known as RIP
(Routing Information Protocol), which figures out routes to local hosts
based upon a shortest path determination.

FreeBSD will also add subnet routes for the local subnet
(``10.20.30.255`` is the broadcast address for the subnet ``10.20.30``,
and ``example.com`` is the domain name associated with that subnet). The
designation ``link#1`` refers to the first Ethernet card in the machine.
You will notice no additional interface is specified for those.

Both of these groups (local network hosts and local subnets) have their
routes automatically configured by a daemon called routed. If this is
not run, then only routes which are statically defined (i.e. entered
explicitly) will exist.

The ``host1`` line refers to our host, which it knows by Ethernet
address. Since we are the sending host, FreeBSD knows to use the
loopback interface (``lo0``) rather than sending it out over the
Ethernet interface.

The two ``host2`` lines are an example of what happens when we use an
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
alias (see the section on Ethernet for reasons why we would do this).
The ``=>`` symbol after the ``lo0`` interface says that not only are we
using the loopback (since this address also refers to the local host),
but specifically it is an alias. Such routes only show up on the host
that supports the alias; all other hosts on the local network will
simply have a ``link#1`` line for such routes.

The final line (destination subnet ``224``) deals with multicasting,
which will be covered in another section.

Finally, various attributes of each route can be seen in the ``Flags``
column. Below is a short table of some of these flags and their
meanings:

.. raw:: html

   <div class="informaltable">

+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| U   | Up: The route is active.                                                                                                                 |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| H   | Host: The route destination is a single host.                                                                                            |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| G   | Gateway: Send anything for this destination on to this remote system, which will figure out from there where to send it.                 |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| S   | Static: This route was configured manually, not automatically generated by the system.                                                   |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| C   | Clone: Generates a new route based upon this route for machines we connect to. This type of route is normally used for local networks.   |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| W   | WasCloned: Indicated a route that was auto-configured based upon a local area network (Clone) route.                                     |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+
| L   | Link: Route involves references to Ethernet hardware.                                                                                    |
+-----+------------------------------------------------------------------------------------------------------------------------------------------+

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

31.2.2. Default Routes
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the local system needs to make a connection to a remote host, it
checks the routing table to determine if a known path exists. If the
remote host falls into a subnet that we know how to reach (Cloned
routes), then the system checks to see if it can connect along that
interface.

If all known paths fail, the system has one last option: the ?default?
route. This route is a special type of gateway route (usually the only
one present in the system), and is always marked with a ``c`` in the
flags field. For hosts on a local area network, this gateway is set to
whatever machine has a direct connection to the outside world (whether
via PPP link, DSL, cable modem, T1, or another network interface).

If you are configuring the default route for a machine which itself is
functioning as the gateway to the outside world, then the default route
will be the gateway machine at your Internet Service Provider's (ISP)
site.

Let us look at an example of default routes. This is a common
configuration:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

The hosts ``Local1`` and ``Local2`` are at your site. ``Local1`` is
connected to an ISP via a dial up PPP connection. This PPP server
computer is connected through a local area network to another gateway
computer through an external interface to the ISPs Internet feed.

The default routes for each of your machines will be:

.. raw:: html

   <div class="informaltable">

+----------+-------------------+-------------+
| Host     | Default Gateway   | Interface   |
+==========+===================+=============+
| Local2   | Local1            | Ethernet    |
+----------+-------------------+-------------+
| Local1   | T1-GW             | PPP         |
+----------+-------------------+-------------+

.. raw:: html

   </div>

A common question is ?Why (or how) would we set the ``T1-GW`` to be the
default gateway for ``Local1``, rather than the ISP server it is
connected to??.

Remember, since the PPP interface is using an address on the ISP's local
network for your side of the connection, routes for any other machines
on the ISP's local network will be automatically generated. Hence, you
will already know how to reach the ``T1-GW`` machine, so there is no
need for the intermediate step of sending traffic to the ISP server.

It is common to use the address ``X.X.X.1`` as the gateway address for
your local network. So (using the same example), if your local class-C
address space was ``10.20.30`` and your ISP was using ``10.9.9`` then
the default routes would be:

.. raw:: html

   <div class="informaltable">

+----------------------------------+-----------------------+
| Host                             | Default Route         |
+==================================+=======================+
| Local2 (10.20.30.2)              | Local1 (10.20.30.1)   |
+----------------------------------+-----------------------+
| Local1 (10.20.30.1, 10.9.9.30)   | T1-GW (10.9.9.1)      |
+----------------------------------+-----------------------+

.. raw:: html

   </div>

You can easily define the default route via the ``/etc/rc.conf`` file.
In our example, on the ``Local2`` machine, we added the following line
in ``/etc/rc.conf``:

.. code:: programlisting

    defaultrouter="10.20.30.1"

It is also possible to do it directly from the command line with the
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__
command:

.. code:: screen

    # route add default 10.20.30.1

For more information on manual manipulation of network routing tables,
consult
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__
manual page.

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

31.2.3. Dual Homed Hosts
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There is one other type of configuration that we should cover, and that
is a host that sits on two different networks. Technically, any machine
functioning as a gateway (in the example above, using a PPP connection)
counts as a dual-homed host. But the term is really only used to refer
to a machine that sits on two local-area networks.

In one case, the machine has two Ethernet cards, each having an address
on the separate subnets. Alternately, the machine may only have one
Ethernet card, and be using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
aliasing. The former is used if two physically separate Ethernet
networks are in use, the latter if there is one physical network
segment, but two logically separate subnets.

Either way, routing tables are set up so that each subnet knows that
this machine is the defined gateway (inbound route) to the other subnet.
This configuration, with the machine acting as a router between the two
subnets, is often used when we need to implement packet filtering or
firewall security in either or both directions.

If you want this machine to actually forward packets between the two
interfaces, you need to tell FreeBSD to enable this ability. See the
next section for more details on how to do this.

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

31.2.4. Building a Router
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A network router is simply a system that forwards packets from one
interface to another. Internet standards and good engineering practice
prevent the FreeBSD Project from enabling this by default in FreeBSD.
You can enable this feature by changing the following variable to
``YES`` in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__:

.. code:: programlisting

    gateway_enable=YES          # Set to YES if this host will be a gateway

This option will set the
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable ``net.inet.ip.forwarding`` to ``1``. If you should need to stop
routing temporarily, you can reset this to ``0`` temporarily.

Your new router will need routes to know where to send the traffic. If
your network is simple enough you can use static routes. FreeBSD also
comes with the standard BSD routing daemon
`routed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=routed&sektion=8>`__,
which speaks RIP (both version 1 and version 2) and IRDP. Support for
BGP v4, OSPF v2, and other sophisticated routing protocols is available
with the
`net/zebra <http://www.freebsd.org/cgi/url.cgi?ports/net/zebra/pkg-descr>`__
package. Commercial products such as GateD(R) are also available for
more complex network routing solutions.

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

31.2.5. Setting Up Static Routes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Al Hoang.

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

31.2.5.1. Manual Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Let us assume we have a network as follows:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

In this scenario, ``RouterA`` is our FreeBSD machine that is acting as a
router to the rest of the Internet. It has a default route set to
``10.0.0.1`` which allows it to connect with the outside world. We will
assume that ``RouterB`` is already configured properly and knows how to
get wherever it needs to go. (This is simple in this picture. Just add a
default route on ``RouterB`` using ``192.168.1.1`` as the gateway.)

If we look at the routing table for ``RouterA`` we would see something
like the following:

.. code:: screen

    % netstat -nr
    Routing tables

    Internet:
    Destination        Gateway            Flags    Refs      Use  Netif  Expire
    default            10.0.0.1           UGS         0    49378    xl0
    127.0.0.1          127.0.0.1          UH          0        6    lo0
    10.0.0/24          link#1             UC          0        0    xl0
    192.168.1/24       link#2             UC          0        0    xl1

With the current routing table ``RouterA`` will not be able to reach our
Internal Net 2. It does not have a route for ``192.168.2.0/24``. One way
to alleviate this is to manually add the route. The following command
would add the Internal Net 2 network to ``RouterA``'s routing table
using ``192.168.1.2`` as the next hop:

.. code:: screen

    # route add -net 192.168.2.0/24 192.168.1.2

Now ``RouterA`` can reach any hosts on the ``192.168.2.0/24`` network.

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

31.2.5.2. Persistent Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The above example is perfect for configuring a static route on a running
system. However, one problem is that the routing information will not
persist if you reboot your FreeBSD machine. The way to handle the
addition of a static route is to put it in your ``/etc/rc.conf`` file:

.. code:: programlisting

    # Add Internal Net 2 as a static route
    static_routes="internalnet2"
    route_internalnet2="-net 192.168.2.0/24 192.168.1.2"

The ``static_routes`` configuration variable is a list of strings
separated by a space. Each string references to a route name. In our
above example we only have one string in ``static_routes``. This string
is *``internalnet2``*. We then add a configuration variable called
``route_internalnet2`` where we put all of the configuration parameters
we would give to the
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__
command. For our example above we would have used the command:

.. code:: screen

    # route add -net 192.168.2.0/24 192.168.1.2

so we need ``"-net 192.168.2.0/24 192.168.1.2"``.

As said above, we can have more than one string in ``static_routes``.
This allows us to create multiple static routes. The following lines
shows an example of adding static routes for the ``192.168.0.0/24`` and
``192.168.1.0/24`` networks on an imaginary router:

.. code:: programlisting

    static_routes="net1 net2"
    route_net1="-net 192.168.0.0/24 192.168.0.1"
    route_net2="-net 192.168.1.0/24 192.168.1.1"

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

31.2.6. Routing Propagation
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We have already talked about how we define our routes to the outside
world, but not about how the outside world finds us.

We already know that routing tables can be set up so that all traffic
for a particular address space (in our examples, a class-C subnet) can
be sent to a particular host on that network, which will forward the
packets inbound.

When you get an address space assigned to your site, your service
provider will set up their routing tables so that all traffic for your
subnet will be sent down your PPP link to your site. But how do sites
across the country know to send to your ISP?

There is a system (much like the distributed DNS information) that keeps
track of all assigned address-spaces, and defines their point of
connection to the Internet Backbone. The ?Backbone? are the main trunk
lines that carry Internet traffic across the country, and around the
world. Each backbone machine has a copy of a master set of tables, which
direct traffic for a particular network to a specific backbone carrier,
and from there down the chain of service providers until it reaches your
network.

It is the task of your service provider to advertise to the backbone
sites that they are the point of connection (and thus the path inward)
for your site. This is known as route propagation.

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

31.2.7. Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes, there is a problem with routing propagation, and some sites
are unable to connect to you. Perhaps the most useful command for trying
to figure out where routing is breaking down is the
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__
command. It is equally useful if you cannot seem to make a connection to
a remote machine (i.e.
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
fails).

The
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__
command is run with the name of the remote host you are trying to
connect to. It will show the gateway hosts along the path of the
attempt, eventually either reaching the target host, or terminating
because of a lack of connection.

For more information, see the manual page for
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__.

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

31.2.8. Multicast Routing
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD supports both multicast applications and multicast routing
natively. Multicast applications do not require any special
configuration of FreeBSD; applications will generally run out of the
box. Multicast routing requires that support be compiled into the
kernel:

.. code:: programlisting

    options MROUTING

In addition, the multicast routing daemon,
`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__
must be configured to set up tunnels and DVMRP via
``/etc/mrouted.conf``. More details on multicast configuration may be
found in the manual page for
`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+---------------------------------------+------------------------------------------+
| `????? <advanced-networking.html>`__?        | `???? <advanced-networking.html>`__   | ?\ `??????? <network-wireless.html>`__   |
+----------------------------------------------+---------------------------------------+------------------------------------------+
| ???????? 31. ??????????? ?????? ??????????   | `???? <index.html>`__                 | ?31.3. Wireless Networking               |
+----------------------------------------------+---------------------------------------+------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

.. |image0| image:: advanced-networking/net-routing.png
.. |image1| image:: advanced-networking/static-routes.png
