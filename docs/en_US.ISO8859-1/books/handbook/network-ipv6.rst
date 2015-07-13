==========
31.9.?IPv6
==========

.. raw:: html

   <div class="navheader">

31.9.?IPv6
`Prev <network-diskless.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <carp.html>`__

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

31.9.?IPv6
----------

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally Written by Aaron Kaplan.

.. raw:: html

   </div>

.. raw:: html

   <div>

Restructured and Added by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Extended by Brad Davis.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 is the new version of the well known IP protocol, also known as
IPv4. IPv6 provides several advantages over IPv4 as well as many new
features:

.. raw:: html

   <div class="itemizedlist">

-  Its 128-bit address space allows for
   340,282,366,920,938,463,463,374,607,431,768,211,456 addresses. This
   addresses the IPv4 address shortage and eventual IPv4 address
   exhaustion.

-  Routers only store network aggregation addresses in their routing
   tables, thus reducing the average space of a routing table to 8192
   entries. This addresses the scalability issues associated with IPv4,
   which required every allocated block of IPv4 addresses to be
   exchanged between Internet routers, causing their routing tables to
   become too large to allow efficient routing.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  Address autoconfiguration
   (`RFC2462 <http://www.ietf.org/rfc/rfc2462.txt>`__).

-  Mandatory multicast addresses.

-  Built-in IPsec (IP security).

-  Simplified header structure.

-  Support for mobile IP.

-  IPv6-to-IPv4 transition mechanisms.

.. raw:: html

   </div>

FreeBSD includes the http://www.kame.net/ IPv6 reference implementation
and comes with everything needed to use IPv6. This section focuses on
getting IPv6 configured and running.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.9.1.?Background on IPv6 Addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are three different types of IPv6 addresses:

.. raw:: html

   <div class="variablelist">

Unicast
    A packet sent to a unicast address arrives at the interface
    belonging to the address.

Anycast
    These addresses are syntactically indistinguishable from unicast
    addresses but they address a group of interfaces. The packet
    destined for an anycast address will arrive at the nearest router
    interface. Anycast addresses are only used by routers.

Multicast
    These addresses identify a group of interfaces. A packet destined
    for a multicast address will arrive at all interfaces belonging to
    the multicast group. The IPv4 broadcast address, usually
    ``xxx.xxx.xxx.255``, is expressed by multicast addresses in IPv6.

.. raw:: html

   </div>

When reading an IPv6 address, the canonical form is represented as
``x:x:x:x:x:x:x:x``, where each ``x`` represents a 16 bit hex value. An
example is ``FEBC:A574:382B:23C1:AA49:4592:4EFE:9982``.

Often, an address will have long substrings of all zeros. A ``::``
(double colon) can be used to replace one substring per address. Also,
up to three leading ``0``\ s per hex value can be omitted. For example,
``fe80::1`` corresponds to the canonical form
``fe80:0000:0000:0000:0000:0000:0000:0001``.

A third form is to write the last 32 bits using the well known IPv4
notation. For example, ``2002::10.0.0.1`` corresponds to the hexadecimal
canonical representation ``2002:0000:0000:0000:0000:0000:0a00:0001``,
which in turn is equivalent to ``2002::a00:1``.

To view a FreeBSD system's IPv6 address, use
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__:

.. code:: screen

    # ifconfig

.. code:: programlisting

    rl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
             inet 10.0.0.10 netmask 0xffffff00 broadcast 10.0.0.255
             inet6 fe80::200:21ff:fe03:8e1%rl0 prefixlen 64 scopeid 0x1
             ether 00:00:21:03:08:e1
             media: Ethernet autoselect (100baseTX )
             status: active

In this example, ``fe80::200:21ff:fe03:8e1%rl0`` is an auto-configured
link-local address which was automatically generated from the MAC
address.

Some IPv6 addresses are reserved. A summary of these reserved addresses
is seen in `Table?31.3, “Reserved IPv6
Addresses” <network-ipv6.html#reservedip6>`__:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?31.3.?Reserved IPv6 Addresses

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| IPv6 address           | Prefixlength (Bits)   | Description                | Notes                                                                                                                  |
+========================+=======================+============================+========================================================================================================================+
| ``::``                 | 128 bits              | unspecified                | Equivalent to ``0.0.0.0`` in IPv4.                                                                                     |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| ``::1``                | 128 bits              | loopback address           | Equivalent to ``127.0.0.1`` in IPv4.                                                                                   |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| ``::00:xx:xx:xx:xx``   | 96 bits               | embedded IPv4              | The lower 32 bits are the compatible IPv4 address.                                                                     |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| ``::ff:xx:xx:xx:xx``   | 96 bits               | IPv4 mapped IPv6 address   | The lower 32 bits are the IPv4 address for hosts which do not support IPv6.                                            |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| ``fe80::/10``          | 10 bits               | link-local                 | Equivalent to 169.254.0.0/16 in IPv4.                                                                                  |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| ``fc00::/7``           | 7 bits                | unique-local               | Unique local addresses are intended for local communication and are only routable within a set of cooperating sites.   |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| ``ff00::``             | 8 bits                | multicast                  | ?                                                                                                                      |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+
| ``2000::-3fff:: ``     | 3 bits                | global unicast             | All global unicast addresses are assigned from this pool. The first 3 bits are ``001``.                                |
+------------------------+-----------------------+----------------------------+------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

For further information on the structure of IPv6 addresses, refer to
`RFC3513 <http://www.ietf.org/rfc/rfc3513.txt>`__.

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

31.9.2.?Configuring IPv6
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To configure a FreeBSD system as an IPv6 client, add these two lines to
``rc.conf``:

.. code:: programlisting

    ifconfig_em0_ipv6="inet6 accept_rtadv"
    rtsold_enable="YES"

The first line enables the specified interface to receive router
solicitation messages. The second line enables the router solicitation
daemon,
`rtsol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsol&sektion=8>`__.

For FreeBSD?8.\ *``x``*, add a third line:

.. code:: programlisting

    ipv6_enable="YES"

If the interface needs a statically assigned IPv6 address, add an entry
to specify the static address and associated prefix length:

.. code:: programlisting

    ifconfig_fxp0_ipv6="inet6 2001:db8:4672:6565:2026:5043:2d42:5344 prefixlen 64"

On a FreeBSD?8.\ *``x``* system, that line uses this format instead:

.. code:: programlisting

    ipv6_ifconfig_fxp0="2001:db8:4672:6565:2026:5043:2d42:5344"

To assign a default router, specify its address:

.. code:: programlisting

    ipv6_defaultrouter="2001:db8:4672:6565::1"

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

31.9.3.?Connecting to a Provider
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to connect to other IPv6 networks, one must have a provider or
a tunnel that supports IPv6:

.. raw:: html

   <div class="itemizedlist">

-  Contact an Internet Service Provider to see if they offer IPv6.

-  `SixXS <http://www.sixxs.net>`__ offers tunnels with end-points all
   around the globe.

-  `Hurricane Electric <http://www.tunnelbroker.net>`__ offers tunnels
   with end-points all around the globe.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Install the
`net/freenet6 <http://www.freebsd.org/cgi/url.cgi?ports/net/freenet6/pkg-descr>`__
package or port for a dial-up connection.

.. raw:: html

   </div>

This section demonstrates how to take the directions from a tunnel
provider and convert them into ``/etc/rc.conf`` settings that will
persist through reboots.

The first ``/etc/rc.conf`` entry creates the generic tunneling interface
``gif0``:

.. code:: programlisting

    gif_interfaces="gif0"

Next, configure that interface with the IPv4 addresses of the local and
remote endpoints. Replace *``MY_IPv4_ADDR``* and *``REMOTE_IPv4_ADDR``*
with the actual IPv4 addresses:

.. code:: programlisting

    gifconfig_gif0="MY_IPv4_ADDR REMOTE_IPv4_ADDR"

To apply the IPv6 address that has been assigned for use as the IPv6
tunnel endpoint, add this line, replacing
*``MY_ASSIGNED_IPv6_TUNNEL_ENDPOINT_ADDR``* with the assigned address:

.. code:: programlisting

    ifconfig_gif0_ipv6="inet6 MY_ASSIGNED_IPv6_TUNNEL_ENDPOINT_ADDR"

For FreeBSD?8.\ *``x``*, that line should instead use this format:

.. code:: programlisting

    ipv6_ifconfig_gif0="MY_ASSIGNED_IPv6_TUNNEL_ENDPOINT_ADDR"

Then, set the default route for the other side of the IPv6 tunnel.
Replace *``MY_IPv6_REMOTE_TUNNEL_ENDPOINT_ADDR``* with the default
gateway address assigned by the provider:

.. code:: programlisting

    ipv6_defaultrouter="MY_IPv6_REMOTE_TUNNEL_ENDPOINT_ADDR"

If the FreeBSD system will route IPv6 packets between the rest of the
network and the world, enable the gateway using this line:

.. code:: programlisting

    ipv6_gateway_enable="YES"

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

31.9.4.?Router Advertisement and Host Auto Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates how to setup
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
to advertise the IPv6 default route.

To enable
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__,
add the following to ``/etc/rc.conf``:

.. code:: programlisting

    rtadvd_enable="YES"

It is important to specify the interface on which to do IPv6 router
solicitation. For example, to tell
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
to use ``fxp0``:

.. code:: programlisting

    rtadvd_interfaces="fxp0"

Next, create the configuration file, ``/etc/rtadvd.conf`` as seen in
this example:

.. code:: programlisting

    fxp0:\
        :addrs#1:addr="2001:471:1f11:246::":prefixlen#64:tc=ether:

Replace ``fxp0`` with the interface to be used and
``2001:471:1f11:246::`` with the prefix of the allocation.

For a dedicated ``/64`` subnet, nothing else needs to be changed.
Otherwise, change the ``prefixlen#`` to the correct value.

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

31.9.5.?IPv6 and IPv6 Address Mapping
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When IPv6 is enabled on a server, there may be a need to enable IPv4
mapped IPv6 address communication. This compatibility option allows for
IPv4 addresses to be represented as IPv6 addresses. Permitting IPv6
applications to communicate with IPv4 and vice versa may be a security
issue.

This option may not be required in most cases and is available only for
compatibility. This option will allow IPv6-only applications to work
with IPv4 in a dual stack environment. This is most useful for third
party applications which may not support an IPv6-only environment. To
enable this feature, add the following to ``/etc/rc.conf``:

.. code:: programlisting

    ipv6_ipv4mapping="YES"

Reviewing the information in RFC 3493, section 3.6 and 3.7 as well as
RFC 4038 section 4.2 may be useful to some adminstrators.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------------+-----------------------------------------------------+
| `Prev <network-diskless.html>`__?    | `Up <advanced-networking.html>`__   | ?\ `Next <carp.html>`__                             |
+--------------------------------------+-------------------------------------+-----------------------------------------------------+
| 31.8.?Diskless Operation with PXE?   | `Home <index.html>`__               | ?31.10.?Common Address Redundancy Protocol (CARP)   |
+--------------------------------------+-------------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
