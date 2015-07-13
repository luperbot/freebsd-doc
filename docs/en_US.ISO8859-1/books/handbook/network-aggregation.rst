===================================
31.7.?Link Aggregation and Failover
===================================

.. raw:: html

   <div class="navheader">

31.7.?Link Aggregation and Failover
`Prev <network-bridging.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <network-diskless.html>`__

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

31.7.?Link Aggregation and Failover
-----------------------------------

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

FreeBSD provides the
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__
interface which can be used to aggregate multiple network interfaces
into one virtual interface in order to provide failover and link
aggregation. Failover allows traffic to continue to flow as long as at
least one aggregated network interface has an established link. Link
aggregation works best on switches which support LACP, as this protocol
distributes traffic bi-directionally while responding to the failure of
individual links.

The aggregation protocols supported by the lagg interface determine
which ports are used for outgoing traffic and whether or not a specific
port accepts incoming traffic. The following protocols are supported by
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__:

.. raw:: html

   <div class="variablelist">

failover
    This mode sends and receives traffic only through the master port.
    If the master port becomes unavailable, the next active port is
    used. The first interface added to the virtual interface is the
    master port and all subsequently added interfaces are used as
    failover devices. If failover to a non-master port occurs, the
    original port becomes master once it becomes available again.

fec / loadbalance
    Cisco? Fast EtherChannel? (FEC) is found on older Cisco? switches.
    It provides a static setup and does not negotiate aggregation with
    the peer or exchange frames to monitor the link. If the switch
    supports LACP, that should be used instead.

lacp
    The IEEE? 802.3ad Link Aggregation Control Protocol (LACP)
    negotiates a set of aggregable links with the peer into one or more
    Link Aggregated Groups (LAGs). Each LAG is composed of ports of the
    same speed, set to full-duplex operation, and traffic is balanced
    across the ports in the LAG with the greatest total speed.
    Typically, there is only one LAG which contains all the ports. In
    the event of changes in physical connectivity, LACP will quickly
    converge to a new configuration.

    LACP balances outgoing traffic across the active ports based on
    hashed protocol header information and accepts incoming traffic from
    any active port. The hash includes the Ethernet source and
    destination address and, if available, the VLAN tag, and the IPv4 or
    IPv6 source and destination address.

roundrobin
    This mode distributes outgoing traffic using a round-robin scheduler
    through all active ports and accepts incoming traffic from any
    active port. Since this mode violates Ethernet frame ordering, it
    should be used with caution.

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

31.7.1.?Configuration Examples
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates how to configure a Cisco? switch and a FreeBSD
system for LACP load balancing. It then shows how to configure two
Ethernet interfaces in failover mode as well as how to configure
failover mode between an Ethernet and a wireless interface.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?31.1.?LACP Aggregation with a Cisco? Switch

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This example connects two
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4>`__
Ethernet interfaces on a FreeBSD machine to the first two Ethernet ports
on a Cisco? switch as a single load balanced and fault tolerant link.
More interfaces can be added to increase throughput and fault tolerance.
Replace the names of the Cisco? ports, Ethernet devices, channel group
number, and IP address shown in the example to match the local
configuration.

Frame ordering is mandatory on Ethernet links and any traffic between
two stations always flows over the same physical link, limiting the
maximum speed to that of one interface. The transmit algorithm attempts
to use as much information as it can to distinguish different traffic
flows and balance the flows across the available interfaces.

On the Cisco? switch, add the *``FastEthernet0/1``* and
*``FastEthernet0/2``* interfaces to channel group *``1``*:

.. code:: screen

    interface FastEthernet0/1
     channel-group 1 mode active
     channel-protocol lacp
    !
    interface FastEthernet0/2
     channel-group 1 mode active
     channel-protocol lacp

On the FreeBSD system, create the
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__
interface using the physical interfaces *``fxp0``* and *``fxp1``* and
bring the interfaces up with an IP address of *``10.0.0.3/24``*:

.. code:: screen

    # ifconfig fxp0 up
    # ifconfig fxp1 up
    # ifconfig lagg0 create 
    # ifconfig lagg0 up laggproto lacp laggport fxp0 laggport fxp1 10.0.0.3/24

Next, verify the status of the virtual interface:

.. code:: screen

    # ifconfig lagg0
    lagg0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=8<VLAN_MTU>
            ether 00:05:5d:71:8d:b8
            media: Ethernet autoselect
            status: active
            laggproto lacp
            laggport: fxp1 flags=1c<ACTIVE,COLLECTING,DISTRIBUTING>
            laggport: fxp0 flags=1c<ACTIVE,COLLECTING,DISTRIBUTING>

Ports marked as ``ACTIVE`` are part of the LAG that has been negotiated
with the remote switch. Traffic will be transmitted and received through
these active ports. Add ``-v`` to the above command to view the LAG
identifiers.

To see the port status on the Cisco? switch:

.. code:: screen

    switch# show lacp neighbor
    Flags:  S - Device is requesting Slow LACPDUs
            F - Device is requesting Fast LACPDUs
            A - Device is in Active mode       P - Device is in Passive mode

    Channel group 1 neighbors

    Partner's information:

                      LACP port                        Oper    Port     Port
    Port      Flags   Priority  Dev ID         Age     Key     Number   State
    Fa0/1     SA      32768     0005.5d71.8db8  29s    0x146   0x3      0x3D
    Fa0/2     SA      32768     0005.5d71.8db8  29s    0x146   0x4      0x3D

For more detail, type **``show lacp neighbor       detail``**.

To retain this configuration across reboots, add the following entries
to ``/etc/rc.conf`` on the FreeBSD system:

.. code:: programlisting

    ifconfig_fxp0="up"
    ifconfig_fxp1="up"
    cloned_interfaces="lagg0"
    ifconfig_lagg0="laggproto lacp laggport fxp0 laggport fxp1 10.0.0.3/24"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?31.2.?Failover Mode

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Failover mode can be used to switch over to a secondary interface if the
link is lost on the master interface. To configure failover, make sure
that the underlying physical interfaces are up, then create the
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__
interface. In this example, *``fxp0``* is the master interface,
*``fxp1``* is the secondary interface, and the virtual interface is
assigned an IP address of *``10.0.0.15/24``*:

.. code:: screen

    # ifconfig fxp0 up
    # ifconfig fxp1 up
    # ifconfig lagg0 create
    # ifconfig lagg0 up laggproto failover laggport fxp0 laggport fxp1 10.0.0.15/24

The virtual interface should look something like this:

.. code:: screen

    # ifconfig lagg0
    lagg0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=8<VLAN_MTU>
            ether 00:05:5d:71:8d:b8
            inet 10.0.0.15 netmask 0xffffff00 broadcast 10.0.0.255
            media: Ethernet autoselect
            status: active
            laggproto failover
            laggport: fxp1 flags=0<>
            laggport: fxp0 flags=5<MASTER,ACTIVE>

Traffic will be transmitted and received on *``fxp0``*. If the link is
lost on *``fxp0``*, *``fxp1``* will become the active link. If the link
is restored on the master interface, it will once again become the
active link.

To retain this configuration across reboots, add the following entries
to ``/etc/rc.conf``:

.. code:: programlisting

    ifconfig_fxp0="up"
    ifconfig_fxp1="up"
    cloned_interfaces="lagg0"
    ifconfig_lagg0="laggproto failover laggport fxp0 laggport fxp1 10.0.0.15/24"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?31.3.?Failover Mode Between Ethernet and Wireless Interfaces

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

For laptop users, it is usually desirable to configure the wireless
device as a secondary which is only used when the Ethernet connection is
not available. With
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__,
it is possible to configure a failover which prefers the Ethernet
connection for both performance and security reasons, while maintaining
the ability to transfer data over the wireless connection.

This is achieved by overriding the physical wireless interface's MAC
address with that of the Ethernet interface.

In this example, the Ethernet interface, *``bge0``*, is the master and
the wireless interface, *``wlan0``*, is the failover. The *``wlan0``*
device was created from *``iwn0``* wireless interface, which will be
configured with the MAC address of the Ethernet interface. First,
determine the MAC address of the Ethernet interface:

.. code:: screen

    # ifconfig bge0
    bge0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
        options=19b<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,VLAN_HWCSUM,TSO4>
        ether 00:21:70:da:ae:37
        inet6 fe80::221:70ff:feda:ae37%bge0 prefixlen 64 scopeid 0x2
        nd6 options=29<PERFORMNUD,IFDISABLED,AUTO_LINKLOCAL>
        media: Ethernet autoselect (1000baseT <full-duplex>)
        status: active

Replace *``bge0``* to match the system's Ethernet interface name. The
``ether`` line will contain the MAC address of the specified interface.
Now, change the MAC address of the underlying wireless interface:

.. code:: screen

    # ifconfig iwn0 ether 00:21:70:da:ae:37

Bring the wireless interface up, but do not set an IP address:

.. code:: screen

    # ifconfig wlan0 create wlandev iwn0 ssid my_router up

Make sure the *``bge0``* interface is up, then create the
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__
interface with *``bge0``* as master with failover to *``wlan0``*:

.. code:: screen

    # ifconfig bge0 up
    # ifconfig lagg0 create
    # ifconfig lagg0 up laggproto failover laggport bge0 laggport wlan0

The virtual interface should look something like this:

.. code:: screen

    # ifconfig lagg0
    lagg0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=8<VLAN_MTU>
            ether 00:21:70:da:ae:37
            media: Ethernet autoselect
            status: active
            laggproto failover
            laggport: wlan0 flags=0<>
            laggport: bge0 flags=5<MASTER,ACTIVE>

Then, start the DHCP client to obtain an IP address:

.. code:: screen

    # dhclient lagg0

To retain this configuration across reboots, add the following entries
to ``/etc/rc.conf``:

.. code:: programlisting

    ifconfig_bge0="up"
    ifconfig_iwn0="ether 00:21:70:da:ae:37"
    wlans_iwn0="wlan0"
    ifconfig_wlan0="WPA"
    cloned_interfaces="lagg0"
    ifconfig_lagg0="laggproto failover laggport bge0 laggport wlan0 DHCP"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------------+---------------------------------------+
| `Prev <network-bridging.html>`__?   | `Up <advanced-networking.html>`__   | ?\ `Next <network-diskless.html>`__   |
+-------------------------------------+-------------------------------------+---------------------------------------+
| 31.6.?Bridging?                     | `Home <index.html>`__               | ?31.8.?Diskless Operation with PXE    |
+-------------------------------------+-------------------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
