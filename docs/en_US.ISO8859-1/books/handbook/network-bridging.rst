==============
31.6.?Bridging
==============

.. raw:: html

   <div class="navheader">

31.6.?Bridging
`Prev <network-bluetooth.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <network-aggregation.html>`__

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

31.6.?Bridging
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Andrew Thompson.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is sometimes useful to divide a network, such as an Ethernet segment,
into network segments without having to create IP subnets and use a
router to connect the segments together. A device that connects two
networks together in this fashion is called a “bridge”.

A bridge works by learning the MAC addresses of the devices on each of
its network interfaces. It forwards traffic between networks only when
the source and destination MAC addresses are on different networks. In
many respects, a bridge is like an Ethernet switch with very few ports.
A FreeBSD system with multiple network interfaces can be configured to
act as a bridge.

Bridging can be useful in the following situations:

.. raw:: html

   <div class="variablelist">

Connecting Networks
    The basic operation of a bridge is to join two or more network
    segments. There are many reasons to use a host-based bridge instead
    of networking equipment, such as cabling constraints or firewalling.
    A bridge can also connect a wireless interface running in hostap
    mode to a wired network and act as an access point.

Filtering/Traffic Shaping Firewall
    A bridge can be used when firewall functionality is needed without
    routing or Network Address Translation (NAT).

    An example is a small company that is connected via DSL or ISDN to
    an ISP. There are thirteen public IP addresses from the ISP and ten
    computers on the network. In this situation, using a router-based
    firewall is difficult because of subnetting issues. A bridge-based
    firewall can be configured without any IP addressing issues.

Network Tap
    A bridge can join two network segments in order to inspect all
    Ethernet frames that pass between them using
    `bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__
    and
    `tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
    on the bridge interface or by sending a copy of all frames out an
    additional interface known as a span port.

Layer 2 VPN
    Two Ethernet networks can be joined across an IP link by bridging
    the networks to an EtherIP tunnel or a
    `tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4>`__
    based solution such as OpenVPN.

Layer 2 Redundancy
    A network can be connected together with multiple links and use the
    Spanning Tree Protocol (STP) to block redundant paths.

.. raw:: html

   </div>

This section describes how to configure a FreeBSD system as a bridge
using
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4>`__.
A netgraph bridging driver is also available, and is described in
`ng\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bridge&sektion=4>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Packet filtering can be used with any firewall package that hooks into
the
`pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9>`__
framework. The bridge can be used as a traffic shaper with
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__ or
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__.

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

31.6.1.?Enabling the Bridge
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD,
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4>`__
is a kernel module which is automatically loaded by
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
when creating a bridge interface. It is also possible to compile bridge
support into a custom kernel by adding ``device if_bridge`` to the
custom kernel configuration file.

The bridge is created using interface cloning. To create the bridge
interface:

.. code:: screen

    # ifconfig bridge create
    bridge0
    # ifconfig bridge0
    bridge0: flags=8802<BROADCAST,SIMPLEX,MULTICAST> metric 0 mtu 1500
            ether 96:3d:4b:f1:79:7a
            id 00:00:00:00:00:00 priority 32768 hellotime 2 fwddelay 15
            maxage 20 holdcnt 6 proto rstp maxaddr 100 timeout 1200
            root id 00:00:00:00:00:00 priority 0 ifcost 0 port 0

When a bridge interface is created, it is automatically assigned a
randomly generated Ethernet address. The ``maxaddr`` and ``timeout``
parameters control how many MAC addresses the bridge will keep in its
forwarding table and how many seconds before each entry is removed after
it is last seen. The other parameters control how STP operates.

Next, specify which network interfaces to add as members of the bridge.
For the bridge to forward packets, all member interfaces and the bridge
need to be up:

.. code:: screen

    # ifconfig bridge0 addm fxp0 addm fxp1 up
    # ifconfig fxp0 up
    # ifconfig fxp1 up

The bridge can now forward Ethernet frames between ``fxp0`` and
``fxp1``. Add the following lines to ``/etc/rc.conf`` so the bridge is
created at startup:

.. code:: programlisting

    cloned_interfaces="bridge0"
    ifconfig_bridge0="addm fxp0 addm fxp1 up"
    ifconfig_fxp0="up"
    ifconfig_fxp1="up"

If the bridge host needs an IP address, set it on the bridge interface,
not on the member interfaces. The address can be set statically or via
DHCP. This example sets a static IP address:

.. code:: screen

    # ifconfig bridge0 inet 192.168.0.1/24

It is also possible to assign an IPv6 address to a bridge interface. To
make the changes permanent, add the addressing information to
``/etc/rc.conf``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When packet filtering is enabled, bridged packets will pass through the
filter inbound on the originating interface on the bridge interface, and
outbound on the appropriate interfaces. Either stage can be disabled.
When direction of the packet flow is important, it is best to firewall
on the member interfaces rather than the bridge itself.

The bridge has several configurable settings for passing non-IP and IP
packets, and layer2 firewalling with
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__.
See
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4>`__
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

31.6.2.?Enabling Spanning Tree
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For an Ethernet network to function properly, only one active path can
exist between two devices. The STP protocol detects loops and puts
redundant links into a blocked state. Should one of the active links
fail, STP calculates a different tree and enables one of the blocked
paths to restore connectivity to all points in the network.

The Rapid Spanning Tree Protocol (RSTP or 802.1w) provides backwards
compatibility with legacy STP. RSTP provides faster convergence and
exchanges information with neighboring switches to quickly transition to
forwarding mode without creating loops. FreeBSD supports RSTP and STP as
operating modes, with RSTP being the default mode.

STP can be enabled on member interfaces using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
For a bridge with ``fxp0`` and ``fxp1`` as the current interfaces,
enable STP with:

.. code:: screen

    # ifconfig bridge0 stp fxp0 stp fxp1
    bridge0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            ether d6:cf:d5:a0:94:6d
            id 00:01:02:4b:d4:50 priority 32768 hellotime 2 fwddelay 15
            maxage 20 holdcnt 6 proto rstp maxaddr 100 timeout 1200
            root id 00:01:02:4b:d4:50 priority 32768 ifcost 0 port 0
            member: fxp0 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 3 priority 128 path cost 200000 proto rstp
                    role designated state forwarding
            member: fxp1 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 4 priority 128 path cost 200000 proto rstp
                    role designated state forwarding

This bridge has a spanning tree ID of ``00:01:02:4b:d4:50`` and a
priority of ``32768``. As the ``root id`` is the same, it indicates that
this is the root bridge for the tree.

Another bridge on the network also has STP enabled:

.. code:: screen

    bridge0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            ether 96:3d:4b:f1:79:7a
            id 00:13:d4:9a:06:7a priority 32768 hellotime 2 fwddelay 15
            maxage 20 holdcnt 6 proto rstp maxaddr 100 timeout 1200
            root id 00:01:02:4b:d4:50 priority 32768 ifcost 400000 port 4
            member: fxp0 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 4 priority 128 path cost 200000 proto rstp
                    role root state forwarding
            member: fxp1 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 5 priority 128 path cost 200000 proto rstp
                    role designated state forwarding

The line
``root id 00:01:02:4b:d4:50 priority 32768       ifcost 400000 port 4``
shows that the root bridge is ``00:01:02:4b:d4:50`` and has a path cost
of ``400000`` from this bridge. The path to the root bridge is via
``port 4`` which is ``fxp0``.

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

31.6.3.?Bridge Interface Parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several ``ifconfig`` parameters are unique to bridge interfaces. This
section summarizes some common uses for these parameters. The complete
list of available parameters is described in
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.

.. raw:: html

   <div class="variablelist">

private
    A private interface does not forward any traffic to any other port
    that is also designated as a private interface. The traffic is
    blocked unconditionally so no Ethernet frames will be forwarded,
    including ARP packets. If traffic needs to be selectively blocked, a
    firewall should be used instead.

span
    A span port transmits a copy of every Ethernet frame received by the
    bridge. The number of span ports configured on a bridge is
    unlimited, but if an interface is designated as a span port, it
    cannot also be used as a regular bridge port. This is most useful
    for snooping a bridged network passively on another host connected
    to one of the span ports of the bridge. For example, to send a copy
    of all frames out the interface named ``fxp4``:

    .. code:: screen

        # ifconfig bridge0 span fxp4

sticky
    If a bridge member interface is marked as sticky, dynamically
    learned address entries are treated at static entries in the
    forwarding cache. Sticky entries are never aged out of the cache or
    replaced, even if the address is seen on a different interface. This
    gives the benefit of static address entries without the need to
    pre-populate the forwarding table. Clients learned on a particular
    segment of the bridge can not roam to another segment.

    An example of using sticky addresses is to combine the bridge with
    VLANs in order to isolate customer networks without wasting IP
    address space. Consider that ``CustomerA`` is on ``vlan100``,
    ``CustomerB`` is on ``vlan101``, and the bridge has the address
    ``192.168.0.1``:

    .. code:: screen

        # ifconfig bridge0 addm vlan100 sticky vlan100 addm vlan101 sticky vlan101
        # ifconfig bridge0 inet 192.168.0.1/24

    In this example, both clients see ``192.168.0.1`` as their default
    gateway. Since the bridge cache is sticky, one host can not spoof
    the MAC address of the other customer in order to intercept their
    traffic.

    Any communication between the VLANs can be blocked using a firewall
    or, as seen in this example, private interfaces:

    .. code:: screen

        # ifconfig bridge0 private vlan100 private vlan101

    The customers are completely isolated from each other and the full
    ``/24`` address range can be allocated without subnetting.

    The number of unique source MAC addresses behind an interface can be
    limited. Once the limit is reached, packets with unknown source
    addresses are dropped until an existing host cache entry expires or
    is removed.

    The following example sets the maximum number of Ethernet devices
    for ``CustomerA`` on ``vlan100`` to 10:

    .. code:: screen

        # ifconfig bridge0 ifmaxaddr vlan100 10

.. raw:: html

   </div>

Bridge interfaces also support monitor mode, where the packets are
discarded after
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__
processing and are not processed or forwarded further. This can be used
to multiplex the input of two or more interfaces into a single
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__
stream. This is useful for reconstructing the traffic for network taps
that transmit the RX/TX signals out through two separate interfaces. For
example, to read the input from four network interfaces as one stream:

.. code:: screen

    # ifconfig bridge0 addm fxp0 addm fxp1 addm fxp2 addm fxp3 monitor up
    # tcpdump -i bridge0

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

31.6.4.?SNMP Monitoring
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The bridge interface and STP parameters can be monitored via
`bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1>`__
which is included in the FreeBSD base system. The exported bridge MIBs
conform to IETF standards so any SNMP client or monitoring package can
be used to retrieve the data.

To enable monitoring on the bridge, uncomment this line in
``/etc/snmp.config`` by removing the beginning ``#`` symbol:

.. code:: programlisting

    begemotSnmpdModulePath."bridge" = "/usr/lib/snmp_bridge.so"

Other configuration settings, such as community names and access lists,
may need to be modified in this file. See
`bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1>`__
and
`snmp\_bridge(3) <http://www.FreeBSD.org/cgi/man.cgi?query=snmp_bridge&sektion=3>`__
for more information. Once these edits are saved, add this line to
``/etc/rc.conf``:

.. code:: programlisting

    bsnmpd_enable="YES"

Then, start
`bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1>`__:

.. code:: screen

    # service bsnmpd start

The following examples use the Net-SNMP software
(`net-mgmt/net-snmp <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/net-snmp/pkg-descr>`__)
to query a bridge from a client system. The
`net-mgmt/bsnmptools <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/bsnmptools/pkg-descr>`__
port can also be used. From the SNMP client which is running Net-SNMP,
add the following lines to ``$HOME/.snmp/snmp.conf`` in order to import
the bridge MIB definitions:

.. code:: programlisting

    mibdirs +/usr/share/snmp/mibs
    mibs +BRIDGE-MIB:RSTP-MIB:BEGEMOT-MIB:BEGEMOT-BRIDGE-MIB

To monitor a single bridge using the IETF BRIDGE-MIB (RFC4188):

.. code:: screen

    % snmpwalk -v 2c -c public bridge1.example.com mib-2.dot1dBridge
    BRIDGE-MIB::dot1dBaseBridgeAddress.0 = STRING: 66:fb:9b:6e:5c:44
    BRIDGE-MIB::dot1dBaseNumPorts.0 = INTEGER: 1 ports
    BRIDGE-MIB::dot1dStpTimeSinceTopologyChange.0 = Timeticks: (189959) 0:31:39.59 centi-seconds
    BRIDGE-MIB::dot1dStpTopChanges.0 = Counter32: 2
    BRIDGE-MIB::dot1dStpDesignatedRoot.0 = Hex-STRING: 80 00 00 01 02 4B D4 50
    ...
    BRIDGE-MIB::dot1dStpPortState.3 = INTEGER: forwarding(5)
    BRIDGE-MIB::dot1dStpPortEnable.3 = INTEGER: enabled(1)
    BRIDGE-MIB::dot1dStpPortPathCost.3 = INTEGER: 200000
    BRIDGE-MIB::dot1dStpPortDesignatedRoot.3 = Hex-STRING: 80 00 00 01 02 4B D4 50
    BRIDGE-MIB::dot1dStpPortDesignatedCost.3 = INTEGER: 0
    BRIDGE-MIB::dot1dStpPortDesignatedBridge.3 = Hex-STRING: 80 00 00 01 02 4B D4 50
    BRIDGE-MIB::dot1dStpPortDesignatedPort.3 = Hex-STRING: 03 80
    BRIDGE-MIB::dot1dStpPortForwardTransitions.3 = Counter32: 1
    RSTP-MIB::dot1dStpVersion.0 = INTEGER: rstp(2)

The ``dot1dStpTopChanges.0`` value is two, indicating that the STP
bridge topology has changed twice. A topology change means that one or
more links in the network have changed or failed and a new tree has been
calculated. The ``dot1dStpTimeSinceTopologyChange.0`` value will show
when this happened.

To monitor multiple bridge interfaces, the private BEGEMOT-BRIDGE-MIB
can be used:

.. code:: screen

    % snmpwalk -v 2c -c public bridge1.example.com
    enterprises.fokus.begemot.begemotBridge
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseName."bridge0" = STRING: bridge0
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseName."bridge2" = STRING: bridge2
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseAddress."bridge0" = STRING: e:ce:3b:5a:9e:13
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseAddress."bridge2" = STRING: 12:5e:4d:74:d:fc
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseNumPorts."bridge0" = INTEGER: 1
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseNumPorts."bridge2" = INTEGER: 1
    ...
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTimeSinceTopologyChange."bridge0" = Timeticks: (116927) 0:19:29.27 centi-seconds
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTimeSinceTopologyChange."bridge2" = Timeticks: (82773) 0:13:47.73 centi-seconds
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTopChanges."bridge0" = Counter32: 1
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTopChanges."bridge2" = Counter32: 1
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpDesignatedRoot."bridge0" = Hex-STRING: 80 00 00 40 95 30 5E 31
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpDesignatedRoot."bridge2" = Hex-STRING: 80 00 00 50 8B B8 C6 A9

To change the bridge interface being monitored via the
``mib-2.dot1dBridge`` subtree:

.. code:: screen

    % snmpset -v 2c -c private bridge1.example.com
    BEGEMOT-BRIDGE-MIB::begemotBridgeDefaultBridgeIf.0 s bridge2

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------------+------------------------------------------+
| `Prev <network-bluetooth.html>`__?   | `Up <advanced-networking.html>`__   | ?\ `Next <network-aggregation.html>`__   |
+--------------------------------------+-------------------------------------+------------------------------------------+
| 31.5.?Bluetooth?                     | `Home <index.html>`__               | ?31.7.?Link Aggregation and Failover     |
+--------------------------------------+-------------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
