==============
31.5. Bridging
==============

.. raw:: html

   <div class="navheader">

31.5. Bridging
`????? <network-bluetooth.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-diskless.html>`__

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

31.5. Bridging
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Steve Peterson.

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

31.5.1. Introduction
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is sometimes useful to divide one physical network (such as an
Ethernet segment) into two separate network segments without having to
create IP subnets and use a router to connect the segments together. A
device that connects two networks together in this fashion is called a
?bridge?. A FreeBSD system with two network interface cards can act as a
bridge.

The bridge works by learning the MAC layer addresses (Ethernet
addresses) of the devices on each of its network interfaces. It forwards
traffic between two networks only when its source and destination are on
different networks.

In many respects, a bridge is like an Ethernet switch with very few
ports.

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

31.5.2. Situations Where Bridging Is Appropriate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two common situations in which a bridge is used today.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.5.2.1. High Traffic on a Segment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Situation one is where your physical network segment is overloaded with
traffic, but you do not want for whatever reason to subnet the network
and interconnect the subnets with a router.

Let us consider an example of a newspaper where the Editorial and
Production departments are on the same subnetwork. The Editorial users
all use server ``A`` for file service, and the Production users are on
server ``B``. An Ethernet network is used to connect all users together,
and high loads on the network are slowing things down.

If the Editorial users could be segregated on one network segment and
the Production users on another, the two network segments could be
connected with a bridge. Only the network traffic destined for
interfaces on the ?other? side of the bridge would be sent to the other
network, reducing congestion on each network segment.

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

31.5.2.2. Filtering/Traffic Shaping Firewall
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The second common situation is where firewall functionality is needed
without network address translation (NAT).

An example is a small company that is connected via DSL or ISDN to their
ISP. They have a 13 globally-accessible IP addresses from their ISP and
have 10 PCs on their network. In this situation, using a router-based
firewall is difficult because of subnetting issues.

A bridge-based firewall can be configured and dropped into the path just
downstream of their DSL/ISDN router without any IP numbering issues.

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

31.5.3. Configuring a Bridge
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

31.5.3.1. Network Interface Card Selection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A bridge requires at least two network cards to function. Unfortunately,
not all network interface cards support bridging. Read
`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4>`__
for details on the cards that are supported.

Install and test the two network cards before continuing.

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

31.5.3.2. Kernel Configuration Changes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable kernel support for bridging, add the:

.. code:: programlisting

    options BRIDGE

statement to your kernel configuration file, and rebuild your kernel.

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

31.5.3.3. Firewall Support
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are planning to use the bridge as a firewall, you will need to
add the ``IPFIREWALL`` option as well. Read `?????????30,
*Firewalls* <firewalls.html>`__ for general information on configuring
the bridge as a firewall.

If you need to allow non-IP packets (such as ARP) to flow through the
bridge, there are three options available. The first is to add the
following option to the kernel and rebuild:

.. code:: programlisting

    option    IPFIREWALL_DEFAULT_TO_ACCEPT

The second is to set the firewall type to ?``open``? in the ``rc.conf``
file:

.. code:: programlisting

    firewall_type="open"

Note that these options will make the firewall seem completely
transparent; any packet or connection will be permitted by default. This
may require significant changes to the firewall ruleset.

The third option is to apply the following
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
rule:

.. code:: screen

    # ipfw add allow mac-type arp layer2

Or add it to the current firewall ruleset. This rule effectively allows
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8>`__
packets through, so it must be be applied near the beginning of the
ruleset for early evaluation.

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

31.5.3.4. Traffic Shaping Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you want to use the bridge as a traffic shaper, you will need to add
the ``DUMMYNET`` option to your kernel configuration. Read
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
for further information.

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

31.5.4. Enabling the Bridge
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Add the line:

.. code:: programlisting

    net.link.ether.bridge.enable=1

to ``/etc/sysctl.conf`` to enable the bridge at runtime, and the line:

.. code:: programlisting

    net.link.ether.bridge.config=if1,if2

to enable bridging on the specified interfaces (replace *``if1``* and
*``if2``* with the names of your two network interfaces). If you want
the bridged packets to be filtered by
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__,
you should add:

.. code:: programlisting

    net.link.ether.bridge.ipfw=1

as well.

For versions prior to FreeBSD?5.2-RELEASE, use instead the following
lines:

.. code:: programlisting

    net.link.ether.bridge=1
    net.link.ether.bridge_cfg=if1,if2
    net.link.ether.bridge_ipfw=1

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

31.5.5. Other Information
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you want to be able to
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ into
the bridge from the network, it is correct to assign one of the network
cards an IP address. The consensus is that assigning both cards an
address is a bad idea.

If you have multiple bridges on your network, there cannot be more than
one path between any two workstations. Technically, this means that
there is no support for spanning tree link management.

A bridge can add latency to your
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
times, especially for traffic from one segment to another.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------------------+------------------------------------------+
| `????? <network-bluetooth.html>`__?   | `???? <advanced-networking.html>`__   | ?\ `??????? <network-diskless.html>`__   |
+---------------------------------------+---------------------------------------+------------------------------------------+
| 31.4. Bluetooth?                      | `???? <index.html>`__                 | ?31.6. Diskless Operation                |
+---------------------------------------+---------------------------------------+------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
