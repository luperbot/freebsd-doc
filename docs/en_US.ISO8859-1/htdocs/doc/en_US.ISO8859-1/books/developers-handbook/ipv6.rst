=========================
Chapter?8.?IPv6 Internals
=========================

.. raw:: html

   <div class="navheader">

Chapter?8.?IPv6 Internals
`Prev <sockets-concurrent-servers.html>`__?
Part?II.?Interprocess Communication
?\ `Next <kernel.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?8.?IPv6 Internals
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`8.1. IPv6/IPsec Implementation <ipv6.html#ipv6-implementation>`__

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

8.1.?IPv6/IPsec Implementation
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Yoshinobu Inoue.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section should explain IPv6 and IPsec related implementation
internals. These functionalities are derived from `KAME
project <http://www.kame.net/>`__

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1.?IPv6
~~~~~~~~~~~

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

8.1.1.1.?Conformance
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The IPv6 related functions conforms, or tries to conform to the latest
set of IPv6 specifications. For future reference we list some of the
relevant documents below (*NOTE*: this is not a complete list - this is
too hard to maintain...).

For details please refer to specific chapter in the document, RFCs,
manual pages, or comments in the source code.

Conformance tests have been performed on the KAME STABLE kit at TAHI
project. Results can be viewed at ``http://www.tahi.org/report/KAME/``.
We also attended Univ. of New Hampshire IOL tests
(``http://www.iol.unh.edu/``) in the past, with our past snapshots.

.. raw:: html

   <div class="itemizedlist">

-  RFC1639: FTP Operation Over Big Address Records (FOOBAR)

   .. raw:: html

      <div class="itemizedlist">

   -  RFC2428 is preferred over RFC1639. FTP clients will first try
      RFC2428, then RFC1639 if failed.

   .. raw:: html

      </div>

-  RFC1886: DNS Extensions to support IPv6

-  RFC1933: Transition Mechanisms for IPv6 Hosts and Routers

   .. raw:: html

      <div class="itemizedlist">

   -  IPv4 compatible address is not supported.

   -  automatic tunneling (described in 4.3 of this RFC) is not
      supported.

   -  `gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__
      interface implements IPv[46]-over-IPv[46] tunnel in a generic way,
      and it covers "configured tunnel" described in the spec. See
      `23.5.1.5 <ipv6.html#gif>`__ in this document for details.

   .. raw:: html

      </div>

-  RFC1981: Path MTU Discovery for IPv6

-  RFC2080: RIPng for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  usr.sbin/route6d support this.

   .. raw:: html

      </div>

-  RFC2292: Advanced Sockets API for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  For supported library functions/kernel APIs, see
      ``sys/netinet6/ADVAPI``.

   .. raw:: html

      </div>

-  RFC2362: Protocol Independent Multicast-Sparse Mode (PIM-SM)

   .. raw:: html

      <div class="itemizedlist">

   -  RFC2362 defines packet formats for PIM-SM.
      ``draft-ietf-pim-ipv6-01.txt`` is written based on this.

   .. raw:: html

      </div>

-  RFC2373: IPv6 Addressing Architecture

   .. raw:: html

      <div class="itemizedlist">

   -  supports node required addresses, and conforms to the scope
      requirement.

   .. raw:: html

      </div>

-  RFC2374: An IPv6 Aggregatable Global Unicast Address Format

   .. raw:: html

      <div class="itemizedlist">

   -  supports 64-bit length of Interface ID.

   .. raw:: html

      </div>

-  RFC2375: IPv6 Multicast Address Assignments

   .. raw:: html

      <div class="itemizedlist">

   -  Userland applications use the well-known addresses assigned in the
      RFC.

   .. raw:: html

      </div>

-  RFC2428: FTP Extensions for IPv6 and NATs

   .. raw:: html

      <div class="itemizedlist">

   -  RFC2428 is preferred over RFC1639. FTP clients will first try
      RFC2428, then RFC1639 if failed.

   .. raw:: html

      </div>

-  RFC2460: IPv6 specification

-  RFC2461: Neighbor discovery for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  See `23.5.1.2 <ipv6.html#neighbor-discovery>`__ in this document
      for details.

   .. raw:: html

      </div>

-  RFC2462: IPv6 Stateless Address Autoconfiguration

   .. raw:: html

      <div class="itemizedlist">

   -  See `23.5.1.4 <ipv6.html#ipv6-pnp>`__ in this document for
      details.

   .. raw:: html

      </div>

-  RFC2463: ICMPv6 for IPv6 specification

   .. raw:: html

      <div class="itemizedlist">

   -  See `23.5.1.9 <ipv6.html#icmpv6>`__ in this document for details.

   .. raw:: html

      </div>

-  RFC2464: Transmission of IPv6 Packets over Ethernet Networks

-  RFC2465: MIB for IPv6: Textual Conventions and General Group

   .. raw:: html

      <div class="itemizedlist">

   -  Necessary statistics are gathered by the kernel. Actual IPv6 MIB
      support is provided as a patchkit for ucd-snmp.

   .. raw:: html

      </div>

-  RFC2466: MIB for IPv6: ICMPv6 group

   .. raw:: html

      <div class="itemizedlist">

   -  Necessary statistics are gathered by the kernel. Actual IPv6 MIB
      support is provided as patchkit for ucd-snmp.

   .. raw:: html

      </div>

-  RFC2467: Transmission of IPv6 Packets over FDDI Networks

-  RFC2497: Transmission of IPv6 packet over ARCnet Networks

-  RFC2553: Basic Socket Interface Extensions for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  IPv4 mapped address (3.7) and special behavior of IPv6 wildcard
      bind socket (3.8) are supported. See
      `23.5.1.12 <ipv6.html#ipv6-wildcard-socket>`__ in this document
      for details.

   .. raw:: html

      </div>

-  RFC2675: IPv6 Jumbograms

   .. raw:: html

      <div class="itemizedlist">

   -  See `23.5.1.7 <ipv6.html#ipv6-jumbo>`__ in this document for
      details.

   .. raw:: html

      </div>

-  RFC2710: Multicast Listener Discovery for IPv6

-  RFC2711: IPv6 router alert option

-  ``draft-ietf-ipngwg-router-renum-08``: Router renumbering for IPv6

-  ``draft-ietf-ipngwg-icmp-namelookups-02``: IPv6 Name Lookups Through
   ICMP

-  ``draft-ietf-ipngwg-icmp-name-lookups-03``: IPv6 Name Lookups Through
   ICMP

-  ``draft-ietf-pim-ipv6-01.txt``: PIM for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  `pim6dd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pim6dd&sektion=8>`__
      implements dense mode.
      `pim6sd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pim6sd&sektion=8>`__
      implements sparse mode.

   .. raw:: html

      </div>

-  ``draft-itojun-ipv6-tcp-to-anycast-00``: Disconnecting TCP connection
   toward IPv6 anycast address

-  ``draft-yamamoto-wideipv6-comm-model-00``

   .. raw:: html

      <div class="itemizedlist">

   -  See `23.5.1.6 <ipv6.html#ipv6-sas>`__ in this document for
      details.

   .. raw:: html

      </div>

-  ``draft-ietf-ipngwg-scopedaddr-format-00.txt         ``: An Extension
   of Format for IPv6 Scoped Addresses

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

8.1.1.2.?Neighbor Discovery
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neighbor Discovery is fairly stable. Currently Address Resolution,
Duplicated Address Detection, and Neighbor Unreachability Detection are
supported. In the near future we will be adding Proxy Neighbor
Advertisement support in the kernel and Unsolicited Neighbor
Advertisement transmission command as admin tool.

If DAD fails, the address will be marked "duplicated" and message will
be generated to syslog (and usually to console). The "duplicated" mark
can be checked with
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
It is administrators' responsibility to check for and recover from DAD
failures. The behavior should be improved in the near future.

Some of the network driver loops multicast packets back to itself, even
if instructed not to do so (especially in promiscuous mode). In such
cases DAD may fail, because DAD engine sees inbound NS packet (actually
from the node itself) and considers it as a sign of duplicate. You may
want to look at #if condition marked "heuristics" in
sys/netinet6/nd6\_nbr.c:nd6\_dad\_timer() as workaround (note that the
code fragment in "heuristics" section is not spec conformant).

Neighbor Discovery specification (RFC2461) does not talk about neighbor
cache handling in the following cases:

.. raw:: html

   <div class="orderedlist">

#. when there was no neighbor cache entry, node received unsolicited
   RS/NS/NA/redirect packet without link-layer address

#. neighbor cache handling on medium without link-layer address (we need
   a neighbor cache entry for IsRouter bit)

.. raw:: html

   </div>

For first case, we implemented workaround based on discussions on IETF
ipngwg mailing list. For more details, see the comments in the source
code and email thread started from (IPng 7155), dated Feb 6 1999.

IPv6 on-link determination rule (RFC2461) is quite different from
assumptions in BSD network code. At this moment, no on-link
determination rule is supported where default router list is empty
(RFC2461, section 5.2, last sentence in 2nd paragraph - note that the
spec misuse the word "host" and "node" in several places in the
section).

To avoid possible DoS attacks and infinite loops, only 10 options on ND
packet is accepted now. Therefore, if you have 20 prefix options
attached to RA, only the first 10 prefixes will be recognized. If this
troubles you, please ask it on FREEBSD-CURRENT mailing list and/or
modify nd6\_maxndopt in ``sys/netinet6/nd6.c``. If there are high
demands we may provide sysctl knob for the variable.

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

8.1.1.3.?Scope Index
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 uses scoped addresses. Therefore, it is very important to specify
scope index (interface index for link-local address, or site index for
site-local address) with an IPv6 address. Without scope index, scoped
IPv6 address is ambiguous to the kernel, and kernel will not be able to
determine the outbound interface for a packet.

Ordinary userland applications should use advanced API (RFC2292) to
specify scope index, or interface index. For similar purpose,
sin6\_scope\_id member in sockaddr\_in6 structure is defined in RFC2553.
However, the semantics for sin6\_scope\_id is rather vague. If you care
about portability of your application, we suggest you to use advanced
API rather than sin6\_scope\_id.

In the kernel, an interface index for link-local scoped address is
embedded into 2nd 16bit-word (3rd and 4th byte) in IPv6 address. For
example, you may see something like:

.. code:: screen

        fe80:1::200:f8ff:fe01:6317
        

in the routing table and interface address structure (struct
in6\_ifaddr). The address above is a link-local unicast address which
belongs to a network interface whose interface identifier is 1. The
embedded index enables us to identify IPv6 link local addresses over
multiple interfaces effectively and with only a little code change.

Routing daemons and configuration programs, like
`route6d(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route6d&sektion=8>`__
and
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__,
will need to manipulate the "embedded" scope index. These programs use
routing sockets and ioctls (like SIOCGIFADDR\_IN6) and the kernel API
will return IPv6 addresses with 2nd 16bit-word filled in. The APIs are
for manipulating kernel internal structure. Programs that use these APIs
have to be prepared about differences in kernels anyway.

When you specify scoped address to the command line, NEVER write the
embedded form (such as ff02:1::1 or fe80:2::fedc). This is not supposed
to work. Always use standard form, like ff02::1 or fe80::fedc, with
command line option for specifying interface (like
``ping6 -I ne0 ff02::1``). In general, if a command does not have
command line option to specify outgoing interface, that command is not
ready to accept scoped address. This may seem to be opposite from IPv6's
premise to support "dentist office" situation. We believe that
specifications need some improvements for this.

Some of the userland tools support extended numeric IPv6 syntax, as
documented in ``draft-ietf-ipngwg-scopedaddr-format-00.txt``. You can
specify outgoing link, by using name of the outgoing interface like
"fe80::1%ne0". This way you will be able to specify link-local scoped
address without much trouble.

To use this extension in your program, you will need to use
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__,
and
`getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3>`__
with NI\_WITHSCOPEID. The implementation currently assumes 1-to-1
relationship between a link and an interface, which is stronger than
what specs say.

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

8.1.1.4.?Plug and Play
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most of the IPv6 stateless address autoconfiguration is implemented in
the kernel. Neighbor Discovery functions are implemented in the kernel
as a whole. Router Advertisement (RA) input for hosts is implemented in
the kernel. Router Solicitation (RS) output for endhosts, RS input for
routers, and RA output for routers are implemented in the userland.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1.4.1.?Assignment of link-local, and special addresses
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 link-local address is generated from IEEE802 address (Ethernet MAC
address). Each of interface is assigned an IPv6 link-local address
automatically, when the interface becomes up (IFF\_UP). Also, direct
route for the link-local address is added to routing table.

Here is an output of netstat command:

.. code:: screen

    Internet6:
    Destination                   Gateway                   Flags      Netif Expire
    fe80:1::%ed0/64               link#1                    UC          ed0
    fe80:2::%ep0/64               link#2                    UC          ep0

Interfaces that has no IEEE802 address (pseudo interfaces like tunnel
interfaces, or ppp interfaces) will borrow IEEE802 address from other
interfaces, such as Ethernet interfaces, whenever possible. If there is
no IEEE802 hardware attached, a last resort pseudo-random value,
MD5(hostname), will be used as source of link-local address. If it is
not suitable for your usage, you will need to configure the link-local
address manually.

If an interface is not capable of handling IPv6 (such as lack of
multicast support), link-local address will not be assigned to that
interface. See section 2 for details.

Each interface joins the solicited multicast address and the link-local
all-nodes multicast addresses (e.g. fe80::1:ff01:6317 and ff02::1,
respectively, on the link the interface is attached). In addition to a
link-local address, the loopback address (::1) will be assigned to the
loopback interface. Also, ::1/128 and ff01::/32 are automatically added
to routing table, and loopback interface joins node-local multicast
group ff01::1.

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

8.1.1.4.2.?Stateless address autoconfiguration on hosts
'''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In IPv6 specification, nodes are separated into two categories:
*routers* and *hosts*. Routers forward packets addressed to others,
hosts does not forward the packets. net.inet6.ip6.forwarding defines
whether this node is router or host (router if it is 1, host if it is
0).

When a host hears Router Advertisement from the router, a host may
autoconfigure itself by stateless address autoconfiguration. This
behavior can be controlled by net.inet6.ip6.accept\_rtadv (host
autoconfigures itself if it is set to 1). By autoconfiguration, network
address prefix for the receiving interface (usually global address
prefix) is added. Default route is also configured. Routers periodically
generate Router Advertisement packets. To request an adjacent router to
generate RA packet, a host can transmit Router Solicitation. To generate
a RS packet at any time, use the *rtsol* command.
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8>`__
daemon is also available.
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8>`__
generates Router Solicitation whenever necessary, and it works great for
nomadic usage (notebooks/laptops). If one wishes to ignore Router
Advertisements, use sysctl to set net.inet6.ip6.accept\_rtadv to 0.

To generate Router Advertisement from a router, use the
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
daemon.

Note that, IPv6 specification assumes the following items, and
nonconforming cases are left unspecified:

.. raw:: html

   <div class="itemizedlist">

-  Only hosts will listen to router advertisements

-  Hosts have single network interface (except loopback)

.. raw:: html

   </div>

Therefore, this is unwise to enable net.inet6.ip6.accept\_rtadv on
routers, or multi-interface host. A misconfigured node can behave
strange (nonconforming configuration allowed for those who would like to
do some experiments).

To summarize the sysctl knob:

.. code:: screen

       accept_rtadv    forwarding  role of the node
        ---     ---     ---
        0       0       host (to be manually configured)
        0       1       router
        1       0       autoconfigured host
                        (spec assumes that host has single
                        interface only, autoconfigured host
                        with multiple interface is
                        out-of-scope)
        1       1       invalid, or experimental
                        (out-of-scope of spec)

RFC2462 has validation rule against incoming RA prefix information
option, in 5.5.3 (e). This is to protect hosts from malicious (or
misconfigured) routers that advertise very short prefix lifetime. There
was an update from Jim Bound to ipngwg mailing list (look for "(ipng
6712)" in the archive) and it is implemented Jim's update.

See `23.5.1.2 <ipv6.html#neighbor-discovery>`__ in the document for
relationship between DAD and autoconfiguration.

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

8.1.1.5.?Generic tunnel interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GIF (Generic InterFace) is a pseudo interface for configured tunnel.
Details are described in
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__.
Currently

.. raw:: html

   <div class="itemizedlist">

-  v6 in v6

-  v6 in v4

-  v4 in v6

-  v4 in v4

.. raw:: html

   </div>

are available. Use
`gifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gifconfig&sektion=8>`__
to assign physical (outer) source and destination address to gif
interfaces. Configuration that uses same address family for inner and
outer IP header (v4 in v4, or v6 in v6) is dangerous. It is very easy to
configure interfaces and routing tables to perform infinite level of
tunneling. *Please be warned*.

gif can be configured to be ECN-friendly. See
`23.5.4.5 <ipv6.html#ipsec-ecn>`__ for ECN-friendliness of tunnels, and
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__ for
how to configure.

If you would like to configure an IPv4-in-IPv6 tunnel with gif
interface, read
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__
carefully. You will need to remove IPv6 link-local address automatically
assigned to the gif interface.

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

8.1.1.6.?Source Address Selection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Current source selection rule is scope oriented (there are some
exceptions - see below). For a given destination, a source IPv6 address
is selected by the following rule:

.. raw:: html

   <div class="orderedlist">

#. If the source address is explicitly specified by the user (e.g. via
   the advanced API), the specified address is used.

#. If there is an address assigned to the outgoing interface (which is
   usually determined by looking up the routing table) that has the same
   scope as the destination address, the address is used.

   This is the most typical case.

#. If there is no address that satisfies the above condition, choose a
   global address assigned to one of the interfaces on the sending node.

#. If there is no address that satisfies the above condition, and
   destination address is site local scope, choose a site local address
   assigned to one of the interfaces on the sending node.

#. If there is no address that satisfies the above condition, choose the
   address associated with the routing table entry for the destination.
   This is the last resort, which may cause scope violation.

.. raw:: html

   </div>

For instance, ::1 is selected for ff01::1, fe80:1::200:f8ff:fe01:6317
for fe80:1::2a0:24ff:feab:839b (note that embedded interface index -
described in `23.5.1.3 <ipv6.html#ipv6-scope-index>`__ - helps us choose
the right source address. Those embedded indices will not be on the
wire). If the outgoing interface has multiple address for the scope, a
source is selected longest match basis (rule 3). Suppose
2001:0DB8:808:1:200:f8ff:fe01:6317 and
2001:0DB8:9:124:200:f8ff:fe01:6317 are given to the outgoing interface.
2001:0DB8:808:1:200:f8ff:fe01:6317 is chosen as the source for the
destination 2001:0DB8:800::1.

Note that the above rule is not documented in the IPv6 spec. It is
considered "up to implementation" item. There are some cases where we do
not use the above rule. One example is connected TCP session, and we use
the address kept in tcb as the source. Another example is source address
for Neighbor Advertisement. Under the spec (RFC2461 7.2.2) NA's source
should be the target address of the corresponding NS's target. In this
case we follow the spec rather than the above longest-match rule.

For new connections (when rule 1 does not apply), deprecated addresses
(addresses with preferred lifetime = 0) will not be chosen as source
address if other choices are available. If no other choices are
available, deprecated address will be used as a last resort. If there
are multiple choice of deprecated addresses, the above scope rule will
be used to choose from those deprecated addresses. If you would like to
prohibit the use of deprecated address for some reason, configure
net.inet6.ip6.use\_deprecated to 0. The issue related to deprecated
address is described in RFC2462 5.5.4 (NOTE: there is some debate
underway in IETF ipngwg on how to use "deprecated" address).

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

8.1.1.7.?Jumbo Payload
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Jumbo Payload hop-by-hop option is implemented and can be used to
send IPv6 packets with payloads longer than 65,535 octets. But currently
no physical interface whose MTU is more than 65,535 is supported, so
such payloads can be seen only on the loopback interface (i.e. lo0).

If you want to try jumbo payloads, you first have to reconfigure the
kernel so that the MTU of the loopback interface is more than 65,535
bytes; add the following to the kernel configuration file:

``       options       "LARGE_LOMTU"       #To test jumbo payload     ``

and recompile the new kernel.

Then you can test jumbo payloads by the
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8>`__
command with -b and -s options. The -b option must be specified to
enlarge the size of the socket buffer and the -s option specifies the
length of the packet, which should be more than 65,535. For example,
type as follows:

.. code:: screen

    % ping6 -b 70000 -s 68000 ::1

The IPv6 specification requires that the Jumbo Payload option must not
be used in a packet that carries a fragment header. If this condition is
broken, an ICMPv6 Parameter Problem message must be sent to the sender.
specification is followed, but you cannot usually see an ICMPv6 error
caused by this requirement.

When an IPv6 packet is received, the frame length is checked and
compared to the length specified in the payload length field of the IPv6
header or in the value of the Jumbo Payload option, if any. If the
former is shorter than the latter, the packet is discarded and
statistics are incremented. You can see the statistics as output of
`netstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=8>`__
command with \`-s -p ip6' option:

.. code:: screen

    % netstat -s -p ip6
          ip6:
            (snip)
            1 with data size < data length

So, kernel does not send an ICMPv6 error unless the erroneous packet is
an actual Jumbo Payload, that is, its packet size is more than 65,535
bytes. As described above, currently no physical interface with such a
huge MTU is supported, so it rarely returns an ICMPv6 error.

TCP/UDP over jumbogram is not supported at this moment. This is because
we have no medium (other than loopback) to test this. Contact us if you
need this.

IPsec does not work on jumbograms. This is due to some specification
twists in supporting AH with jumbograms (AH header size influences
payload length, and this makes it real hard to authenticate inbound
packet with jumbo payload option as well as AH).

There are fundamental issues in \*BSD support for jumbograms. We would
like to address those, but we need more time to finalize these. To name
a few:

.. raw:: html

   <div class="itemizedlist">

-  mbuf pkthdr.len field is typed as "int" in 4.4BSD, so it will not
   hold jumbogram with len > 2G on 32bit architecture CPUs. If we would
   like to support jumbogram properly, the field must be expanded to
   hold 4G + IPv6 header + link-layer header. Therefore, it must be
   expanded to at least int64\_t (u\_int32\_t is NOT enough).

-  We mistakingly use "int" to hold packet length in many places. We
   need to convert them into larger integral type. It needs a great
   care, as we may experience overflow during packet length computation.

-  We mistakingly check for ip6\_plen field of IPv6 header for packet
   payload length in various places. We should be checking mbuf
   pkthdr.len instead. ip6\_input() will perform sanity check on jumbo
   payload option on input, and we can safely use mbuf pkthdr.len
   afterwards.

-  TCP code needs a careful update in bunch of places, of course.

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

8.1.1.8.?Loop prevention in header processing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 specification allows arbitrary number of extension headers to be
placed onto packets. If we implement IPv6 packet processing code in the
way BSD IPv4 code is implemented, kernel stack may overflow due to long
function call chain. sys/netinet6 code is carefully designed to avoid
kernel stack overflow. Because of this, sys/netinet6 code defines its
own protocol switch structure, as "struct ip6protosw" (see
``netinet6/ip6protosw.h``). There is no such update to IPv4 part
(sys/netinet) for compatibility, but small change is added to its
pr\_input() prototype. So "struct ipprotosw" is also defined. Because of
this, if you receive IPsec-over-IPv4 packet with massive number of IPsec
headers, kernel stack may blow up. IPsec-over-IPv6 is okay. (Off-course,
for those all IPsec headers to be processed, each such IPsec header must
pass each IPsec check. So an anonymous attacker will not be able to do
such an attack.)

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

8.1.1.9.?ICMPv6
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After RFC2463 was published, IETF ipngwg has decided to disallow ICMPv6
error packet against ICMPv6 redirect, to prevent ICMPv6 storm on a
network medium. This is already implemented into the kernel.

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

8.1.1.10.?Applications
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For userland programming, we support IPv6 socket API as specified in
RFC2553, RFC2292 and upcoming Internet drafts.

TCP/UDP over IPv6 is available and quite stable. You can enjoy
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__,
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1>`__,
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__,
`rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1>`__,
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__,
etc. These applications are protocol independent. That is, they
automatically chooses IPv4 or IPv6 according to DNS.

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

8.1.1.11.?Kernel Internals
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While ip\_forward() calls ip\_output(), ip6\_forward() directly calls
if\_output() since routers must not divide IPv6 packets into fragments.

ICMPv6 should contain the original packet as long as possible up to
1280. UDP6/IP6 port unreach, for instance, should contain all extension
headers and the \*unchanged\* UDP6 and IP6 headers. So, all IP6
functions except TCP never convert network byte order into host byte
order, to save the original packet.

tcp\_input(), udp6\_input() and icmp6\_input() can not assume that IP6
header is preceding the transport headers due to extension headers. So,
in6\_cksum() was implemented to handle packets whose IP6 header and
transport header is not continuous. TCP/IP6 nor UDP6/IP6 header
structures do not exist for checksum calculation.

To process IP6 header, extension headers and transport headers easily,
network drivers are now required to store packets in one internal mbuf
or one or more external mbufs. A typical old driver prepares two
internal mbufs for 96 - 204 bytes data, however, now such packet data is
stored in one external mbuf.

``netstat -s -p ip6`` tells you whether or not your driver conforms such
requirement. In the following example, "cce0" violates the requirement.
(For more information, refer to Section 2.)

.. code:: screen

    Mbuf statistics:
                    317 one mbuf
                    two or more mbuf::
                            lo0 = 8
                cce0 = 10
                    3282 one ext mbuf
                    0 two or more ext mbuf
        

Each input function calls IP6\_EXTHDR\_CHECK in the beginning to check
if the region between IP6 and its header is continuous.
IP6\_EXTHDR\_CHECK calls m\_pullup() only if the mbuf has M\_LOOP flag,
that is, the packet comes from the loopback interface. m\_pullup() is
never called for packets coming from physical network interfaces.

Both IP and IP6 reassemble functions never call m\_pullup().

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

8.1.1.12.?IPv4 mapped address and IPv6 wildcard socket
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

RFC2553 describes IPv4 mapped address (3.7) and special behavior of IPv6
wildcard bind socket (3.8). The spec allows you to:

.. raw:: html

   <div class="itemizedlist">

-  Accept IPv4 connections by AF\_INET6 wildcard bind socket.

-  Transmit IPv4 packet over AF\_INET6 socket by using special form of
   the address like ::ffff:10.1.1.1.

.. raw:: html

   </div>

but the spec itself is very complicated and does not specify how the
socket layer should behave. Here we call the former one "listening side"
and the latter one "initiating side", for reference purposes.

You can perform wildcard bind on both of the address families, on the
same port.

The following table show the behavior of FreeBSD 4.x.

.. code:: screen

    listening side          initiating side
                    (AF_INET6 wildcard      (connection to ::ffff:10.1.1.1)
                    socket gets IPv4 conn.)
                    ---                     ---
    FreeBSD 4.x     configurable            supported
                    default: enabled
        

The following sections will give you more details, and how you can
configure the behavior.

Comments on listening side:

It looks that RFC2553 talks too little on wildcard bind issue,
especially on the port space issue, failure mode and relationship
between AF\_INET/INET6 wildcard bind. There can be several separate
interpretation for this RFC which conform to it but behaves differently.
So, to implement portable application you should assume nothing about
the behavior in the kernel. Using
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
is the safest way. Port number space and wildcard bind issues were
discussed in detail on ipv6imp mailing list, in mid March 1999 and it
looks that there is no concrete consensus (means, up to implementers).
You may want to check the mailing list archives.

If a server application would like to accept IPv4 and IPv6 connections,
there will be two alternatives.

One is using AF\_INET and AF\_INET6 socket (you will need two sockets).
Use
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
with AI\_PASSIVE into ai\_flags, and
`socket(2) <http://www.FreeBSD.org/cgi/man.cgi?query=socket&sektion=2>`__
and
`bind(2) <http://www.FreeBSD.org/cgi/man.cgi?query=bind&sektion=2>`__ to
all the addresses returned. By opening multiple sockets, you can accept
connections onto the socket with proper address family. IPv4 connections
will be accepted by AF\_INET socket, and IPv6 connections will be
accepted by AF\_INET6 socket.

Another way is using one AF\_INET6 wildcard bind socket. Use
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
with AI\_PASSIVE into ai\_flags and with AF\_INET6 into ai\_family, and
set the 1st argument hostname to NULL. And
`socket(2) <http://www.FreeBSD.org/cgi/man.cgi?query=socket&sektion=2>`__
and
`bind(2) <http://www.FreeBSD.org/cgi/man.cgi?query=bind&sektion=2>`__ to
the address returned. (should be IPv6 unspecified addr). You can accept
either of IPv4 and IPv6 packet via this one socket.

To support only IPv6 traffic on AF\_INET6 wildcard binded socket
portably, always check the peer address when a connection is made toward
AF\_INET6 listening socket. If the address is IPv4 mapped address, you
may want to reject the connection. You can check the condition by using
IN6\_IS\_ADDR\_V4MAPPED() macro.

To resolve this issue more easily, there is system dependent
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2>`__
option, IPV6\_BINDV6ONLY, used like below.

.. code:: screen

       int on;

        setsockopt(s, IPPROTO_IPV6, IPV6_BINDV6ONLY,
               (char *)&on, sizeof (on)) < 0));
        

When this call succeed, then this socket only receive IPv6 packets.

Comments on initiating side:

Advise to application implementers: to implement a portable IPv6
application (which works on multiple IPv6 kernels), we believe that the
following is the key to the success:

.. raw:: html

   <div class="itemizedlist">

-  NEVER hardcode AF\_INET nor AF\_INET6.

-  Use
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
   and
   `getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3>`__
   throughout the system. Never use gethostby\*(), getaddrby\*(),
   inet\_\*() or getipnodeby\*(). (To update existing applications to be
   IPv6 aware easily, sometime getipnodeby\*() will be useful. But if
   possible, try to rewrite the code to use
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
   and
   `getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3>`__.)

-  If you would like to connect to destination, use
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
   and try all the destination returned, like
   `telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
   does.

-  Some of the IPv6 stack is shipped with buggy
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__.
   Ship a minimal working version with your application and use that as
   last resort.

.. raw:: html

   </div>

If you would like to use AF\_INET6 socket for both IPv4 and IPv6
outgoing connection, you will need to use
`getipnodebyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getipnodebyname&sektion=3>`__.
When you would like to update your existing application to be IPv6 aware
with minimal effort, this approach might be chosen. But please note that
it is a temporal solution, because
`getipnodebyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getipnodebyname&sektion=3>`__
itself is not recommended as it does not handle scoped IPv6 addresses at
all. For IPv6 name resolution,
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
is the preferred API. So you should rewrite your application to use
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__,
when you get the time to do it.

When writing applications that make outgoing connections, story goes
much simpler if you treat AF\_INET and AF\_INET6 as totally separate
address family. {set,get}sockopt issue goes simpler, DNS issue will be
made simpler. We do not recommend you to rely upon IPv4 mapped address.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1.12.1.?unified tcp and inpcb code
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD 4.x uses shared tcp code between IPv4 and IPv6 (from
sys/netinet/tcp\*) and separate udp4/6 code. It uses unified inpcb
structure.

The platform can be configured to support IPv4 mapped address. Kernel
configuration is summarized as follows:

.. raw:: html

   <div class="itemizedlist">

-  By default, AF\_INET6 socket will grab IPv4 connections in certain
   condition, and can initiate connection to IPv4 destination embedded
   in IPv4 mapped IPv6 address.

-  You can disable it on entire system with sysctl like below.

   ``sysctl net.inet6.ip6.mapped_addr=0``

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1.12.1.1.?listening side
                            

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Each socket can be configured to support special AF\_INET6 wildcard bind
(enabled by default). You can disable it on each socket basis with
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2>`__
like below.

.. code:: screen

      int on;

        setsockopt(s, IPPROTO_IPV6, IPV6_BINDV6ONLY,
               (char *)&on, sizeof (on)) < 0));
        

Wildcard AF\_INET6 socket grabs IPv4 connection if and only if the
following conditions are satisfied:

.. raw:: html

   <div class="itemizedlist">

-  there is no AF\_INET socket that matches the IPv4 connection

-  the AF\_INET6 socket is configured to accept IPv4 traffic, i.e.
   getsockopt(IPV6\_BINDV6ONLY) returns 0.

.. raw:: html

   </div>

There is no problem with open/close ordering.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1.12.1.2.?initiating side
                             

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD 4.x supports outgoing connection to IPv4 mapped address
(::ffff:10.1.1.1), if the node is configured to support IPv4 mapped
address.

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

8.1.1.13.?sockaddr\_storage
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When RFC2553 was about to be finalized, there was discussion on how
struct sockaddr\_storage members are named. One proposal is to prepend
"\_\_" to the members (like "\_\_ss\_len") as they should not be
touched. The other proposal was not to prepend it (like "ss\_len") as we
need to touch those members directly. There was no clear consensus on
it.

As a result, RFC2553 defines struct sockaddr\_storage as follows:

.. code:: screen

        struct sockaddr_storage {
            u_char  __ss_len;   /* address length */
            u_char  __ss_family;    /* address family */
            /* and bunch of padding */
        };
        

On the contrary, XNET draft defines as follows:

.. code:: screen

        struct sockaddr_storage {
            u_char  ss_len;     /* address length */
            u_char  ss_family;  /* address family */
            /* and bunch of padding */
        };
        

In December 1999, it was agreed that RFC2553bis should pick the latter
(XNET) definition.

Current implementation conforms to XNET definition, based on RFC2553bis
discussion.

If you look at multiple IPv6 implementations, you will be able to see
both definitions. As an userland programmer, the most portable way of
dealing with it is to:

.. raw:: html

   <div class="orderedlist">

#. ensure ss\_family and/or ss\_len are available on the platform, by
   using GNU autoconf,

#. have -Dss\_family=\_\_ss\_family to unify all occurrences (including
   header file) into \_\_ss\_family, or

#. never touch \_\_ss\_family. cast to sockaddr \* and use sa\_family
   like:

   .. code:: screen

          struct sockaddr_storage ss;
           family = ((struct sockaddr *)&ss)->sa_family
               

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

8.1.2.?Network Drivers
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now following two items are required to be supported by standard
drivers:

.. raw:: html

   <div class="orderedlist">

#. mbuf clustering requirement. In this stable release, we changed
   MINCLSIZE into MHLEN+1 for all the operating systems in order to make
   all the drivers behave as we expect.

#. multicast. If
   `ifmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifmcstat&sektion=8>`__
   yields no multicast group for a interface, that interface has to be
   patched.

.. raw:: html

   </div>

If any of the drivers do not support the requirements, then the drivers
can not be used for IPv6 and/or IPsec communication. If you find any
problem with your card using IPv6/IPsec, then, please report it to the
`FreeBSD problem reports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__.

(NOTE: In the past we required all PCMCIA drivers to have a call to
in6\_ifattach(). We have no such requirement any more)

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

8.1.3.?Translator
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We categorize IPv4/IPv6 translator into 4 types:

.. raw:: html

   <div class="itemizedlist">

-  *Translator A* --- It is used in the early stage of transition to
   make it possible to establish a connection from an IPv6 host in an
   IPv6 island to an IPv4 host in the IPv4 ocean.

-  *Translator B* --- It is used in the early stage of transition to
   make it possible to establish a connection from an IPv4 host in the
   IPv4 ocean to an IPv6 host in an IPv6 island.

-  *Translator C* --- It is used in the late stage of transition to make
   it possible to establish a connection from an IPv4 host in an IPv4
   island to an IPv6 host in the IPv6 ocean.

-  *Translator D* --- It is used in the late stage of transition to make
   it possible to establish a connection from an IPv6 host in the IPv6
   ocean to an IPv4 host in an IPv4 island.

.. raw:: html

   </div>

TCP relay translator for category A is supported. This is called
"FAITH". We also provide IP header translator for category A. (The
latter is not yet put into FreeBSD 4.x yet.)

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.3.1.?FAITH TCP relay translator
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FAITH system uses TCP relay daemon called
`faithd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=faithd&sektion=8>`__
helped by the kernel. FAITH will reserve an IPv6 address prefix, and
relay TCP connection toward that prefix to IPv4 destination.

For example, if the reserved IPv6 prefix is 2001:0DB8:0200:ffff::, and
the IPv6 destination for TCP connection is
2001:0DB8:0200:ffff::163.221.202.12, the connection will be relayed
toward IPv4 destination 163.221.202.12.

.. code:: screen

     destination IPv4 node (163.221.202.12)
          ^
          | IPv4 tcp toward 163.221.202.12
        FAITH-relay dual stack node
          ^
          | IPv6 TCP toward 2001:0DB8:0200:ffff::163.221.202.12
        source IPv6 node
        

`faithd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=faithd&sektion=8>`__
must be invoked on FAITH-relay dual stack node.

For more details, consult ``src/usr.sbin/faithd/README``

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

8.1.4.?IPsec
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPsec is mainly organized by three components.

.. raw:: html

   <div class="orderedlist">

#. Policy Management

#. Key Management

#. AH and ESP handling

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

8.1.4.1.?Policy Management
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The kernel implements experimental policy management code. There are two
way to manage security policy. One is to configure per-socket policy
using
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2>`__.
In this cases, policy configuration is described in
`ipsec\_set\_policy(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec_set_policy&sektion=3>`__.
The other is to configure kernel packet filter-based policy using
PF\_KEY interface, via
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8>`__.

The policy entry is not re-ordered with its indexes, so the order of
entry when you add is very significant.

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

8.1.4.2.?Key Management
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The key management code implemented in this kit (sys/netkey) is a
home-brew PFKEY v2 implementation. This conforms to RFC2367.

The home-brew IKE daemon, "racoon" is included in the kit
(kame/kame/racoon). Basically you will need to run racoon as daemon,
then set up a policy to require keys (like
``ping -P 'out ipsec esp/transport//use'``). The kernel will contact
racoon daemon as necessary to exchange keys.

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

8.1.4.3.?AH and ESP handling
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPsec module is implemented as "hooks" to the standard IPv4/IPv6
processing. When sending a packet, ip{,6}\_output() checks if ESP/AH
processing is required by checking if a matching SPD (Security Policy
Database) is found. If ESP/AH is needed, {esp,ah}{4,6}\_output() will be
called and mbuf will be updated accordingly. When a packet is received,
{esp,ah}4\_input() will be called based on protocol number, i.e.
(\*inetsw[proto])(). {esp,ah}4\_input() will decrypt/check authenticity
of the packet, and strips off daisy-chained header and padding for
ESP/AH. It is safe to strip off the ESP/AH header on packet reception,
since we will never use the received packet in "as is" form.

By using ESP/AH, TCP4/6 effective data segment size will be affected by
extra daisy-chained headers inserted by ESP/AH. Our code takes care of
the case.

Basic crypto functions can be found in directory "sys/crypto". ESP/AH
transform are listed in {esp,ah}\_core.c with wrapper functions. If you
wish to add some algorithm, add wrapper function in {esp,ah}\_core.c,
and add your crypto algorithm code into sys/crypto.

Tunnel mode is partially supported in this release, with the following
restrictions:

.. raw:: html

   <div class="itemizedlist">

-  IPsec tunnel is not combined with GIF generic tunneling interface. It
   needs a great care because we may create an infinite loop between
   ip\_output() and tunnelifp->if\_output(). Opinion varies if it is
   better to unify them, or not.

-  MTU and Don't Fragment bit (IPv4) considerations need more checking,
   but basically works fine.

-  Authentication model for AH tunnel must be revisited. We will need to
   improve the policy management engine, eventually.

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

8.1.4.4.?Conformance to RFCs and IDs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The IPsec code in the kernel conforms (or, tries to conform) to the
following standards:

"old IPsec" specification documented in ``rfc182[5-9].txt``

"new IPsec" specification documented in ``rfc240[1-6].txt``,
``rfc241[01].txt``, ``rfc2451.txt`` and
``draft-mcdonald-simple-ipsec-api-01.txt`` (draft expired, but you can
take from ftp://ftp.kame.net/pub/internet-drafts/). (NOTE: IKE
specifications, ``rfc241[7-9].txt`` are implemented in userland, as
"racoon" IKE daemon)

Currently supported algorithms are:

.. raw:: html

   <div class="itemizedlist">

-  old IPsec AH

   .. raw:: html

      <div class="itemizedlist">

   -  null crypto checksum (no document, just for debugging)

   -  keyed MD5 with 128bit crypto checksum (``rfc1828.txt``)

   -  keyed SHA1 with 128bit crypto checksum (no document)

   -  HMAC MD5 with 128bit crypto checksum (``rfc2085.txt``)

   -  HMAC SHA1 with 128bit crypto checksum (no document)

   .. raw:: html

      </div>

-  old IPsec ESP

   .. raw:: html

      <div class="itemizedlist">

   -  null encryption (no document, similar to ``rfc2410.txt``)

   -  DES-CBC mode (``rfc1829.txt``)

   .. raw:: html

      </div>

-  new IPsec AH

   .. raw:: html

      <div class="itemizedlist">

   -  null crypto checksum (no document, just for debugging)

   -  keyed MD5 with 96bit crypto checksum (no document)

   -  keyed SHA1 with 96bit crypto checksum (no document)

   -  HMAC MD5 with 96bit crypto checksum (``rfc2403.txt``)

   -  HMAC SHA1 with 96bit crypto checksum (``rfc2404.txt``)

   .. raw:: html

      </div>

-  new IPsec ESP

   .. raw:: html

      <div class="itemizedlist">

   -  null encryption (``rfc2410.txt``)

   -  DES-CBC with derived IV
      (``draft-ietf-ipsec-ciph-des-derived-01.txt``, draft expired)

   -  DES-CBC with explicit IV (``rfc2405.txt``)

   -  3DES-CBC with explicit IV (``rfc2451.txt``)

   -  BLOWFISH CBC (``rfc2451.txt``)

   -  CAST128 CBC (``rfc2451.txt``)

   -  RC5 CBC (``rfc2451.txt``)

   -  each of the above can be combined with:

      .. raw:: html

         <div class="itemizedlist">

      -  ESP authentication with HMAC-MD5(96bit)

      -  ESP authentication with HMAC-SHA1(96bit)

      .. raw:: html

         </div>

   .. raw:: html

      </div>

.. raw:: html

   </div>

The following algorithms are NOT supported:

.. raw:: html

   <div class="itemizedlist">

-  old IPsec AH

   .. raw:: html

      <div class="itemizedlist">

   -  HMAC MD5 with 128bit crypto checksum + 64bit replay prevention
      (``rfc2085.txt``)

   -  keyed SHA1 with 160bit crypto checksum + 32bit padding
      (``rfc1852.txt``)

   .. raw:: html

      </div>

.. raw:: html

   </div>

IPsec (in kernel) and IKE (in userland as "racoon") has been tested at
several interoperability test events, and it is known to interoperate
with many other implementations well. Also, current IPsec implementation
as quite wide coverage for IPsec crypto algorithms documented in RFC (we
cover algorithms without intellectual property issues only).

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

8.1.4.5.?ECN consideration on IPsec tunnels
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ECN-friendly IPsec tunnel is supported as described in
``draft-ipsec-ecn-00.txt``.

Normal IPsec tunnel is described in RFC2401. On encapsulation, IPv4 TOS
field (or, IPv6 traffic class field) will be copied from inner IP header
to outer IP header. On decapsulation outer IP header will be simply
dropped. The decapsulation rule is not compatible with ECN, since ECN
bit on the outer IP TOS/traffic class field will be lost.

To make IPsec tunnel ECN-friendly, we should modify encapsulation and
decapsulation procedure. This is described in
http://www.aciri.org/floyd/papers/draft-ipsec-ecn-00.txt, chapter 3.

IPsec tunnel implementation can give you three behaviors, by setting
net.inet.ipsec.ecn (or net.inet6.ipsec6.ecn) to some value:

.. raw:: html

   <div class="itemizedlist">

-  RFC2401: no consideration for ECN (sysctl value -1)

-  ECN forbidden (sysctl value 0)

-  ECN allowed (sysctl value 1)

.. raw:: html

   </div>

Note that the behavior is configurable in per-node manner, not per-SA
manner (draft-ipsec-ecn-00 wants per-SA configuration, but it looks too
much for me).

The behavior is summarized as follows (see source code for more detail):

.. code:: screen

                    encapsulate                     decapsulate
                    ---                             ---
    RFC2401         copy all TOS bits               drop TOS bits on outer
                    from inner to outer.            (use inner TOS bits as is)

    ECN forbidden   copy TOS bits except for ECN    drop TOS bits on outer
                    (masked with 0xfc) from inner   (use inner TOS bits as is)
                    to outer.  set ECN bits to 0.

    ECN allowed     copy TOS bits except for ECN    use inner TOS bits with some
                    CE (masked with 0xfe) from      change.  if outer ECN CE bit
                    inner to outer.                 is 1, enable ECN CE bit on
                    set ECN CE bit to 0.            the inner.

        

General strategy for configuration is as follows:

.. raw:: html

   <div class="itemizedlist">

-  if both IPsec tunnel endpoint are capable of ECN-friendly behavior,
   you should better configure both end to “ECN allowed” (sysctl value
   1).

-  if the other end is very strict about TOS bit, use "RFC2401" (sysctl
   value -1).

-  in other cases, use "ECN forbidden" (sysctl value 0).

.. raw:: html

   </div>

The default behavior is "ECN forbidden" (sysctl value 0).

For more information, please refer to:

http://www.aciri.org/floyd/papers/draft-ipsec-ecn-00.txt, RFC2481
(Explicit Congestion Notification), src/sys/netinet6/{ah,esp}\_input.c

(Thanks goes to Kenjiro Cho ``<kjc@csl.sony.co.jp>`` for detailed
analysis)

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

8.1.4.6.?Interoperability
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here are (some of) platforms that KAME code have tested IPsec/IKE
interoperability in the past. Note that both ends may have modified
their implementation, so use the following list just for reference
purposes.

Altiga, Ashley-laurent (vpcom.com), Data Fellows (F-Secure), Ericsson
ACC, FreeS/WAN, HITACHI, IBM AIX?, IIJ, Intel, Microsoft? Windows?NT?,
NIST (linux IPsec + plutoplus), Netscreen, OpenBSD, RedCreek,
Routerware, SSH, Secure Computing, Soliton, Toshiba, VPNet, Yamaha
RT100i

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

+-----------------------------------------------+-------------------------+-----------------------------+
| `Prev <sockets-concurrent-servers.html>`__?   | `Up <ipc.html>`__       | ?\ `Next <kernel.html>`__   |
+-----------------------------------------------+-------------------------+-----------------------------+
| 7.7.?Concurrent Servers?                      | `Home <index.html>`__   | ?Part?III.?Kernel           |
+-----------------------------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
