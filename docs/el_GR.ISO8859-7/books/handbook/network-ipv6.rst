===========
31.10. IPv6
===========

.. raw:: html

   <div class="navheader">

31.10. IPv6
`????? <network-plip.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-atm.html>`__

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

31.10. IPv6
-----------

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

IPv6 (also known as IPng ?IP next generation?) is the new version of the
well known IP protocol (also known as IPv4). Like the other current
\*BSD systems, FreeBSD includes the KAME IPv6 reference implementation.
So your FreeBSD system comes with all you will need to experiment with
IPv6. This section focuses on getting IPv6 configured and running.

In the early 1990s, people became aware of the rapidly diminishing
address space of IPv4. Given the expansion rate of the Internet there
were two major concerns:

.. raw:: html

   <div class="itemizedlist">

-  Running out of addresses. Today this is not so much of a concern
   anymore since RFC1918 private address space (``10.0.0.0/8``,
   ``172.16.0.0/12``, and ``192.168.0.0/16``) and Network Address
   Translation (NAT) are being employed.

-  Router table entries were getting too large. This is still a concern
   today.

.. raw:: html

   </div>

IPv6 deals with these and many other issues:

.. raw:: html

   <div class="itemizedlist">

-  128 bit address space. In other words theoretically there are
   340,282,366,920,938,463,463,374,607,431,768,211,456 addresses
   available. This means there are approximately 6.67 \* 10^27 IPv6
   addresses per square meter on our planet.

-  Routers will only store network aggregation addresses in their
   routing tables thus reducing the average space of a routing table to
   8192 entries.

.. raw:: html

   </div>

There are also lots of other useful features of IPv6 such as:

.. raw:: html

   <div class="itemizedlist">

-  Address autoconfiguration
   (`RFC2462 <http://www.ietf.org/rfc/rfc2462.txt>`__)

-  Anycast addresses (?one-out-of many?)

-  Mandatory multicast addresses

-  IPsec (IP security)

-  Simplified header structure

-  Mobile IP

-  IPv6-to-IPv4 transition mechanisms

.. raw:: html

   </div>

For more information see:

.. raw:: html

   <div class="itemizedlist">

-  IPv6 overview at
   `playground.sun.com <http://playground.sun.com/pub/ipng/html/ipng-main.html>`__

-  `KAME.net <http://www.kame.net>`__

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

31.10.1. Background on IPv6 Addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are different types of IPv6 addresses: Unicast, Anycast and
Multicast.

Unicast addresses are the well known addresses. A packet sent to a
unicast address arrives exactly at the interface belonging to the
address.

Anycast addresses are syntactically indistinguishable from unicast
addresses but they address a group of interfaces. The packet destined
for an anycast address will arrive at the nearest (in router metric)
interface. Anycast addresses may only be used by routers.

Multicast addresses identify a group of interfaces. A packet destined
for a multicast address will arrive at all interfaces belonging to the
multicast group.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The IPv4 broadcast address (usually ``xxx.xxx.xxx.255``) is expressed by
multicast addresses in IPv6.

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

??????? 31.2. Reserved IPv6 addresses

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| IPv6 address             | Prefixlength (Bits)   | Description                | Notes                                                                                   |
+==========================+=======================+============================+=========================================================================================+
| ``::``                   | 128 bits              | unspecified                | cf. ``0.0.0.0`` in IPv4                                                                 |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| ``::1``                  | 128 bits              | loopback address           | cf. ``127.0.0.1`` in IPv4                                                               |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| ``::00:xx:xx:xx:xx``     | 96 bits               | embedded IPv4              | The lower 32 bits are the IPv4 address. Also called ?IPv4 compatible IPv6 address?      |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| ``::ff:xx:xx:xx:xx``     | 96 bits               | IPv4 mapped IPv6 address   | The lower 32 bits are the IPv4 address. For hosts which do not support IPv6.            |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| ``fe80::`` - ``feb::``   | 10 bits               | link-local                 | cf. loopback address in IPv4                                                            |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| ``fec0::`` - ``fef::``   | 10 bits               | site-local                 | ?                                                                                       |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| ``ff::``                 | 8 bits                | multicast                  | ?                                                                                       |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+
| ``001`` (base 2)         | 3 bits                | global unicast             | All global unicast addresses are assigned from this pool. The first 3 bits are ?001?.   |
+--------------------------+-----------------------+----------------------------+-----------------------------------------------------------------------------------------+

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

31.10.2. Reading IPv6 Addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The canonical form is represented as: ``x:x:x:x:x:x:x:x``, each ?x?
being a 16 Bit hex value. For example
``FEBC:A574:382B:23C1:AA49:4592:4EFE:9982``

Often an address will have long substrings of all zeros therefore one
such substring per address can be abbreviated by ?::?. Also up to three
leading ?0?s per hexquad can be omitted. For example ``fe80::1``
corresponds to the canonical form
``fe80:0000:0000:0000:0000:0000:0000:0001``.

A third form is to write the last 32 Bit part in the well known
(decimal) IPv4 style with dots ?.? as separators. For example
``2002::10.0.0.1`` corresponds to the (hexadecimal) canonical
representation ``2002:0000:0000:0000:0000:0000:0a00:0001`` which in turn
is equivalent to writing ``2002::a00:1``.

By now the reader should be able to understand the following:

.. code:: screen

    # ifconfig

.. code:: programlisting

    rl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
             inet 10.0.0.10 netmask 0xffffff00 broadcast 10.0.0.255
             inet6 fe80::200:21ff:fe03:8e1%rl0 prefixlen 64 scopeid 0x1
             ether 00:00:21:03:08:e1
             media: Ethernet autoselect (100baseTX )
             status: active

``fe80::200:21ff:fe03:8e1%rl0`` is an auto configured link-local
address. It is generated from the MAC address as part of the auto
configuration.

For further information on the structure of IPv6 addresses see
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

31.10.3. Getting Connected
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Currently there are four ways to connect to other IPv6 hosts and
networks:

.. raw:: html

   <div class="itemizedlist">

-  Getting an IPv6 network from your upstream provider. Talk to your
   Internet provider for instructions.

-  Tunnel via 6-to-4 (`RFC3068 <http://www.ietf.org/rfc/rfc3068.txt>`__)

-  Use the
   `net/freenet6 <http://www.freebsd.org/cgi/url.cgi?ports/net/freenet6/pkg-descr>`__
   port if you are on a dial-up connection.

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

31.10.4. DNS in the IPv6 World
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There used to be two types of DNS records for IPv6. The IETF has
declared A6 records obsolete. AAAA records are the standard now.

Using AAAA records is straightforward. Assign your hostname to the new
IPv6 address you just received by adding:

.. code:: programlisting

    MYHOSTNAME           AAAA    MYIPv6ADDR

To your primary zone DNS file. In case you do not serve your own DNS
zones ask your DNS provider. Current versions of bind (version 8.3 and
9) and
`dns/djbdns <http://www.freebsd.org/cgi/url.cgi?ports/dns/djbdns/pkg-descr>`__
(with the IPv6 patch) support AAAA records.

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

31.10.5. Applying the needed changes to ``/etc/rc.conf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

31.10.5.1. IPv6 Client Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These settings will help you configure a machine that will be on your
LAN and act as a client, not a router. To have
`rtsol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsol&sektion=8>`__
autoconfigure your interface on boot all you need to add is:

.. code:: programlisting

    ipv6_enable="YES"

To statically assign an IP address such as
``       2001:471:1f11:251:290:27ff:fee0:2093``, to your ``fxp0``
interface, add:

.. code:: programlisting

    ipv6_ifconfig_fxp0="2001:471:1f11:251:290:27ff:fee0:2093"

To assign a default router of ``2001:471:1f11:251::1`` add the following
to ``/etc/rc.conf``:

.. code:: programlisting

    ipv6_defaultrouter="2001:471:1f11:251::1"

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

31.10.5.2. IPv6 Router/Gateway Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This will help you take the directions that your tunnel provider has
given you and convert it into settings that will persist through
reboots. To restore your tunnel on startup use something like the
following in ``/etc/rc.conf``:

List the Generic Tunneling interfaces that will be configured, for
example ``gif0``:

.. code:: programlisting

    gif_interfaces="gif0"

To configure the interface with a local endpoint of *``MY_IPv4_ADDR``*
to a remote endpoint of *``REMOTE_IPv4_ADDR``*:

.. code:: programlisting

    gifconfig_gif0="MY_IPv4_ADDR REMOTE_IPv4_ADDR"

To apply the IPv6 address you have been assigned for use as your IPv6
tunnel endpoint, add:

.. code:: programlisting

    ipv6_ifconfig_gif0="MY_ASSIGNED_IPv6_TUNNEL_ENDPOINT_ADDR"

Then all you have to do is set the default route for IPv6. This is the
other side of the IPv6 tunnel:

.. code:: programlisting

    ipv6_defaultrouter="MY_IPv6_REMOTE_TUNNEL_ENDPOINT_ADDR"

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

31.10.5.3. IPv6 Tunnel Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the server is to route IPv6 between the rest of your network and the
world, the following ``/etc/rc.conf`` setting will also be needed:

.. code:: programlisting

    ipv6_gateway_enable="YES"

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

31.10.6. Router Advertisement and Host Auto Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section will help you setup
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
to advertise the IPv6 default route.

To enable
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
you will need the following in your ``/etc/rc.conf``:

.. code:: programlisting

    rtadvd_enable="YES"

It is important that you specify the interface on which to do IPv6
router solicitation. For example to tell
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
to use ``fxp0``:

.. code:: programlisting

    rtadvd_interfaces="fxp0"

Now we must create the configuration file, ``/etc/rtadvd.conf``. Here is
an example:

.. code:: programlisting

    fxp0:\
        :addrs#1:addr="2001:471:1f11:246::":prefixlen#64:tc=ether:

Replace ``fxp0`` with the interface you are going to be using.

Next, replace ``2001:471:1f11:246::`` with the prefix of your
allocation.

If you are dedicated a ``/64`` subnet you will not need to change
anything else. Otherwise, you will need to change the ``prefixlen#`` to
the correct value.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------------+--------------------------------------------+
| `????? <network-plip.html>`__?   | `???? <advanced-networking.html>`__   | ?\ `??????? <network-atm.html>`__          |
+----------------------------------+---------------------------------------+--------------------------------------------+
| 31.9. Parallel Line IP (PLIP)?   | `???? <index.html>`__                 | ?31.11. Asynchronous Transfer Mode (ATM)   |
+----------------------------------+---------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
