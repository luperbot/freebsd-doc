====================
30.5.?IPFILTER (IPF)
====================

.. raw:: html

   <div class="navheader">

30.5.?IPFILTER (IPF)
`Prev <firewalls-ipfw.html>`__?
Chapter?30.?Firewalls
?\ `Next <advanced-networking.html>`__

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

30.5.?IPFILTER (IPF)
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPFILTER, also known as IPF, is a cross-platform, open source firewall
which has been ported to several operating systems, including FreeBSD,
NetBSD, OpenBSD, and Solaris™.

IPFILTER is a kernel-side firewall and NAT mechanism that can be
controlled and monitored by userland programs. Firewall rules can be set
or deleted using ipf, NAT rules can be set or deleted using ipnat,
run-time statistics for the kernel parts of IPFILTER can be printed
using ipfstat, and ipmon can be used to log IPFILTER actions to the
system log files.

IPF was originally written using a rule processing logic of “the last
matching rule wins” and only used stateless rules. Since then, IPF has
been enhanced to include the ``quick`` and ``keep state`` options.

For a detailed explanation of the legacy rules processing method, refer
to ``http://coombs.anu.edu.au/~avalon/ip-filter.html``.

The IPF FAQ is at ``http://www.phildev.net/ipf/index.html``. A
searchable archive of the IPFilter mailing list is available at
``http://marc.info/?l=ipfilter``.

This section of the Handbook focuses on IPF as it pertains to FreeBSD.
It provides examples of rules that contain the ``quick`` and
``keep state`` options.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.5.1.?Enabling IPF
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPF is included in the basic FreeBSD install as a kernel loadable
module, meaning that a custom kernel is not needed in order to enable
IPF.

For users who prefer to statically compile IPF support into a custom
kernel, refer to the instructions in `Chapter?9, *Configuring the
FreeBSD Kernel* <kernelconfig.html>`__. The following kernel options are
available:

.. code:: programlisting

    options IPFILTER
    options IPFILTER_LOG
    options IPFILTER_LOOKUP
    options IPFILTER_DEFAULT_BLOCK

where ``options IPFILTER`` enables support for IPFILTER,
``options IPFILTER_LOG`` enables IPF logging using the ``ipl`` packet
logging pseudo-device for every rule that has the ``log`` keyword,
``IPFILTER_LOOKUP`` enables IP pools in order to speed up IP lookups,
and ``options       IPFILTER_DEFAULT_BLOCK`` changes the default
behavior so that any packet not matching a firewall ``pass`` rule gets
blocked.

To configure the system to enable IPF at boot time, add the following
entries to ``/etc/rc.conf``. These entries will also enable logging and
``default pass       all``. To change the default policy to
``block all`` without compiling a custom kernel, remember to add a
``block all`` rule at the end of the ruleset.

.. code:: programlisting

    ipfilter_enable="YES"             # Start ipf firewall
    ipfilter_rules="/etc/ipf.rules"   # loads rules definition text file
    ipmon_enable="YES"                # Start IP monitor log
    ipmon_flags="-Ds"                 # D = start as daemon
                                      # s = log to syslog
                                      # v = log tcp window, ack, seq
                                      # n = map IP & port to names

If NAT functionality is needed, also add these lines:

.. code:: programlisting

    gateway_enable="YES"              # Enable as LAN gateway
    ipnat_enable="YES"                # Start ipnat function
    ipnat_rules="/etc/ipnat.rules"    # rules definition file for ipnat

Then, to start IPF now:

.. code:: programlisting

    # service ipfilter start

To load the firewall rules, specify the name of the ruleset file using
``ipf``. The following command can be used to replace the currently
running firewall rules:

.. code:: screen

    # ipf -Fa -f /etc/ipf.rules

where ``-Fa`` flushes all the internal rules tables and ``-f`` specifies
the file containing the rules to load.

This provides the ability to make changes to a custom ruleset and update
the running firewall with a fresh copy of the rules without having to
reboot the system. This method is convenient for testing new rules as
the procedure can be executed as many times as needed.

Refer to
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8>`__ for
details on the other flags available with this command.

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

30.5.2.?IPF Rule Syntax
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes the IPF rule syntax used to create stateful
rules. When creating rules, keep in mind that unless the ``quick``
keyword appears in a rule, every rule is read in order, with the *last
matching rule* being the one that is applied. This means that even if
the first rule to match a packet is a ``pass``, if there is a later
matching rule that is a ``block``, the packet will be dropped. Sample
rulesets can be found in ``/usr/share/examples/ipfilter``.

When creating rules, a ``#`` character is used to mark the start of a
comment and may appear at the end of a rule, to explain that rule's
function, or on its own line. Any blank lines are ignored.

The keywords which are used in rules must be written in a specific
order, from left to right. Some keywords are mandatory while others are
optional. Some keywords have sub-options which may be keywords
themselves and also include more sub-options. The keyword order is as
follows, where the words shown in uppercase represent a variable and the
words shown in lowercase must precede the variable that follows it:

*``ACTION DIRECTION OPTIONS proto PROTO_TYPE       from SRC_ADDR SRC_PORT to DST_ADDR DST_PORT       TCP_FLAG|ICMP_TYPE keep state STATE``*

This section describes each of these keywords and their options. It is
not an exhaustive list of every possible option. Refer to
`ipf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=5>`__ for
a complete description of the rule syntax that can be used when creating
IPF rules and examples for using each keyword.

.. raw:: html

   <div class="variablelist">

ACTION
    The action keyword indicates what to do with the packet if it
    matches that rule. Every rule *must* have an action. The following
    actions are recognized:

    ``block``: drops the packet.

    ``pass``: allows the packet.

    ``log``: generates a log record.

    ``count``: counts the number of packets and bytes which can provide
    an indication of how often a rule is used.

    ``auth``: queues the packet for further processing by another
    program.

    ``call``: provides access to functions built into IPF that allow
    more complex actions.

    ``decapsulate``: removes any headers in order to process the
    contents of the packet.

DIRECTION
    Next, each rule must explicitly state the direction of traffic using
    one of these keywords:

    ``in``: the rule is applied against an inbound packet.

    ``out``: the rule is applied against an outbound packet.

    ``all``: the rule applies to either direction.

    If the system has multiple interfaces, the interface can be
    specified along with the direction. An example would be
    ``in on fxp0``.

OPTIONS
    Options are optional. However, if multiple options are specified,
    they must be used in the order shown here.

    ``log``: when performing the specified ACTION, the contents of the
    packet's headers will be written to the
    `ipl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipl&sektion=4>`__
    packet log pseudo-device.

    ``quick``: if a packet matches this rule, the ACTION specified by
    the rule occurs and no further processing of any following rules
    will occur for this packet.

    ``on``: must be followed by the interface name as displayed by
    `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
    The rule will only match if the packet is going through the
    specified interface in the specified direction.

    When using the ``log`` keyword, the following qualifiers may be used
    in this order:

    ``body``: indicates that the first 128 bytes of the packet contents
    will be logged after the headers.

    ``first``: if the ``log`` keyword is being used in conjunction with
    a ``keep state`` option, this option is recommended so that only the
    triggering packet is logged and not every packet which matches the
    stateful connection.

    Additional options are available to specify error return messages.
    Refer to
    `ipf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=5>`__
    for more details.

PROTO\_TYPE
    The protocol type is optional. However, it is mandatory if the rule
    needs to specify a SRC\_PORT or a DST\_PORT as it defines the type
    of protocol. When specifying the type of protocol, use the ``proto``
    keyword followed by either a protocol number or name from
    ``/etc/protocols``. Example protocol names include ``tcp``, ``udp``,
    or ``icmp``. If PROTO\_TYPE is specified but no SRC\_PORT or
    DST\_PORT is specified, all port numbers for that protocol will
    match that rule.

SRC\_ADDR
    The ``from`` keyword is mandatory and is followed by a keyword which
    represents the source of the packet. The source can be a hostname,
    an IP address followed by the CIDR mask, an address pool, or the
    keyword ``all``. Refer to
    `ipf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=5>`__
    for examples.

    There is no way to match ranges of IP addresses which do not express
    themselves easily using the dotted numeric form / mask-length
    notation. The
    `net-mgmt/ipcalc <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/ipcalc/pkg-descr>`__
    package or port may be used to ease the calculation of the CIDR
    mask. Additional information is available at the utility's web page:
    ``http://jodies.de/ipcalc``.

SRC\_PORT
    The port number of the source is optional. However, if it is used,
    it requires PROTO\_TYPE to be first defined in the rule. The port
    number must also be preceded by the ``proto`` keyword.

    A number of different comparison operators are supported: ``=``
    (equal to), ``!=`` (not equal to), ``<`` (less than), ``>`` (greater
    than), ``<=`` (less than or equal to), and ``>=`` (greater than or
    equal to).

    To specify port ranges, place the two port numbers between ``<>``
    (less than and greater than ), ``><`` (greater than and less than ),
    or ``:`` (greater than or equal to and less than or equal to).

DST\_ADDR
    The ``to`` keyword is mandatory and is followed by a keyword which
    represents the destination of the packet. Similar to SRC\_ADDR, it
    can be a hostname, an IP address followed by the CIDR mask, an
    address pool, or the keyword ``all``.

DST\_PORT
    Similar to SRC\_PORT, the port number of the destination is
    optional. However, if it is used, it requires PROTO\_TYPE to be
    first defined in the rule. The port number must also be preceded by
    the ``proto`` keyword.

TCP\_FLAG\|ICMP\_TYPE
    If ``tcp`` is specifed as the PROTO\_TYPE, flags can be specified as
    letters, where each letter represents one of the possible TCP flags
    used to determine the state of a connection. Possible values are:
    ``S`` (SYN), ``A`` (ACK), ``P`` (PSH), ``F`` (FIN), ``U`` (URG),
    ``R`` (RST), ``C`` (CWN), and ``E`` (ECN).

    If ``icmp`` is specifed as the PROTO\_TYPE, the ICMP type to match
    can be specified. Refer to
    `ipf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=5>`__
    for the allowable types.

STATE
    If a ``pass`` rule contains ``keep state``, IPF will add an entry to
    its dynamic state table and allow subsequent packets that match the
    connection. IPF can track state for TCP, UDP, and ICMP sessions. Any
    packet that IPF can be certain is part of an active session, even if
    it is a different protocol, will be allowed.

    In IPF, packets destined to go out through the interface connected
    to the public Internet are first checked against the dynamic state
    table. If the packet matches the next expected packet comprising an
    active session conversation, it exits the firewall and the state of
    the session conversation flow is updated in the dynamic state table.
    Packets that do not belong to an already active session are checked
    against the outbound ruleset. Packets coming in from the interface
    connected to the public Internet are first checked against the
    dynamic state table. If the packet matches the next expected packet
    comprising an active session, it exits the firewall and the state of
    the session conversation flow is updated in the dynamic state table.
    Packets that do not belong to an already active session are checked
    against the inbound ruleset.

    Several keywords can be added after ``keep state``. If used, these
    keywords set various options that control stateful filtering, such
    as setting connection limits or connection age. Refer to
    `ipf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=5>`__
    for the list of available options and their descriptions.

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

30.5.3.?Example Ruleset
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates how to create an example ruleset which only
allows services matching ``pass`` rules and blocks all others.

FreeBSD uses the loopback interface (``lo0``) and the IP address
``127.0.0.1`` for internal communication. The firewall ruleset must
contain rules to allow free movement of these internally used packets:

.. code:: programlisting

    # no restrictions on loopback interface
    pass in quick on lo0 all
    pass out quick on lo0 all

The public interface connected to the Internet is used to authorize and
control access of all outbound and inbound connections. If one or more
interfaces are cabled to private networks, those internal interfaces may
require rules to allow packets originating from the LAN to flow between
the internal networks or to the interface attached to the Internet. The
ruleset should be organized into three major sections: any trusted
internal interfaces, outbound connections through the public interface,
and inbound connections through the public interface.

These two rules allow all traffic to pass through a trusted LAN
interface named ``xl0``:

.. code:: programlisting

    # no restrictions on inside LAN interface for private network
    pass out quick on xl0 all
    pass in quick on xl0 all

The rules for the public interface's outbound and inbound sections
should have the most frequently matched rules placed before less
commonly matched rules, with the last rule in the section blocking and
logging all packets for that interface and direction.

This set of rules defines the outbound section of the public interface
named ``dc0``. These rules keep state and identify the specific services
that internal systems are authorized for public Internet access. All the
rules use ``quick`` and specify the appropriate port numbers and, where
applicable, destination addresses.

.. code:: programlisting

    # interface facing Internet (outbound)
    # Matches session start requests originating from or behind the
    # firewall, destined for the Internet.

    # Allow outbound access to public DNS servers.
    # Replace x.x.x. with address listed in /etc/resolv.conf.
    # Repeat for each DNS server.
    pass out quick on dc0 proto tcp from any to x.x.x. port = 53 flags S keep state
    pass out quick on dc0 proto udp from any to xxx port = 53 keep state

    # Allow access to ISP's specified DHCP server for cable or DSL networks.
    # Use the first rule, then check log for the IP address of DHCP server.
    # Then, uncomment the second rule, replace z.z.z.z with the IP address,
    # and comment out the first rule
    pass out log quick on dc0 proto udp from any to any port = 67 keep state
    #pass out quick on dc0 proto udp from any to z.z.z.z port = 67 keep state

    # Allow HTTP and HTTPS
    pass out quick on dc0 proto tcp from any to any port = 80 flags S keep state
    pass out quick on dc0 proto tcp from any to any port = 443 flags S keep state

    # Allow email
    pass out quick on dc0 proto tcp from any to any port = 110 flags S keep state
    pass out quick on dc0 proto tcp from any to any port = 25 flags S keep state

    # Allow NTP
    pass out quick on dc0 proto tcp from any to any port = 37 flags S keep state

    # Allow FTP
    pass out quick on dc0 proto tcp from any to any port = 21 flags S keep state

    # Allow SSH
    pass out quick on dc0 proto tcp from any to any port = 22 flags S keep state

    # Allow ping
    pass out quick on dc0 proto icmp from any to any icmp-type 8 keep state

    # Block and log everything else
    block out log first quick on dc0 all

This example of the rules in the inbound section of the public interface
blocks all undesirable packets first. This reduces the number of packets
that are logged by the last rule.

.. code:: programlisting

    # interface facing Internet (inbound)
    # Block all inbound traffic from non-routable or reserved address spaces
    block in quick on dc0 from 192.168.0.0/16 to any    #RFC 1918 private IP
    block in quick on dc0 from 172.16.0.0/12 to any     #RFC 1918 private IP
    block in quick on dc0 from 10.0.0.0/8 to any        #RFC 1918 private IP
    block in quick on dc0 from 127.0.0.0/8 to any       #loopback
    block in quick on dc0 from 0.0.0.0/8 to any         #loopback
    block in quick on dc0 from 169.254.0.0/16 to any    #DHCP auto-config
    block in quick on dc0 from 192.0.2.0/24 to any      #reserved for docs
    block in quick on dc0 from 204.152.64.0/23 to any   #Sun cluster interconnect
    block in quick on dc0 from 224.0.0.0/3 to any       #Class D & E multicast

    # Block fragments and too short tcp packets
    block in quick on dc0 all with frags
    block in quick on dc0 proto tcp all with short

    # block source routed packets
    block in quick on dc0 all with opt lsrr
    block in quick on dc0 all with opt ssrr

    # Block OS fingerprint attempts and log first occurrence
    block in log first quick on dc0 proto tcp from any to any flags FUP

    # Block anything with special options
    block in quick on dc0 all with ipopts

    # Block public pings and ident
    block in quick on dc0 proto icmp all icmp-type 8
    block in quick on dc0 proto tcp from any to any port = 113

    # Block incoming Netbios services
    block in log first quick on dc0 proto tcp/udp from any to any port = 137
    block in log first quick on dc0 proto tcp/udp from any to any port = 138
    block in log first quick on dc0 proto tcp/udp from any to any port = 139
    block in log first quick on dc0 proto tcp/udp from any to any port = 81

Any time there are logged messages on a rule with the ``log first``
option, run ``ipfstat -hio`` to evaluate how many times the rule has
been matched. A large number of matches may indicate that the system is
under attack.

The rest of the rules in the inbound section define which connections
are allowed to be initiated from the Internet. The last rule denies all
connections which were not explicitly allowed by previous rules in this
section.

.. code:: programlisting

    # Allow traffic in from ISP's DHCP server. Replace z.z.z.z with
    # the same IP address used in the outbound section.
    pass in quick on dc0 proto udp from z.z.z.z to any port = 68 keep state

    # Allow public connections to specified internal web server
    pass in quick on dc0 proto tcp from any to x.x.x.x port = 80 flags S keep state

    # Block and log only first occurrence of all remaining traffic.
    block in log first quick on dc0 all

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

30.5.4.?Configuring NAT
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable NAT, add these statements to ``/etc/rc.conf`` and specify the
name of the file containing the NAT rules:

.. code:: programlisting

    gateway_enable="YES"
    ipnat_enable="YES"
    ipnat_rules="/etc/ipnat.rules"

NAT rules are flexible and can accomplish many different things to fit
the needs of both commercial and home users. The rule syntax presented
here has been simplified to demonstrate common usage. For a complete
rule syntax description, refer to
`ipnat(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipnat&sektion=5>`__.

The basic syntax for a NAT rule is as follows, where ``map`` starts the
rule and *``IF``* should be replaced with the name of the external
interface:

.. code:: programlisting

    map IF LAN_IP_RANGE -> PUBLIC_ADDRESS

The *``LAN_IP_RANGE``* is the range of IP addresses used by internal
clients. Usually, it is a private address range such as
``192.168.1.0/24``. The *``PUBLIC_ADDRESS``* can either be the static
external IP address or the keyword ``0/32`` which represents the IP
address assigned to *``IF``*.

In IPF, when a packet arrives at the firewall from the LAN with a public
destination, it first passes through the outbound rules of the firewall
ruleset. Then, the packet is passed to the NAT ruleset which is read
from the top down, where the first matching rule wins. IPF tests each
NAT rule against the packet's interface name and source IP address. When
a packet's interface name matches a NAT rule, the packet's source IP
address in the private LAN is checked to see if it falls within the IP
address range specified in *``LAN_IP_RANGE``*. On a match, the packet
has its source IP address rewritten with the public IP address specified
by *``PUBLIC_ADDRESS``*. IPF posts an entry in its internal NAT table so
that when the packet returns from the Internet, it can be mapped back to
its original private IP address before being passed to the firewall
rules for further processing.

For networks that have large numbers of internal systems or multiple
subnets, the process of funneling every private IP address into a single
public IP address becomes a resource problem. Two methods are available
to relieve this issue.

The first method is to assign a range of ports to use as source ports.
By adding the ``portmap`` keyword, NAT can be directed to only use
source ports in the specified range:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 0/32 portmap tcp/udp 20000:60000

Alternately, use the ``auto`` keyword which tells NAT to determine the
ports that are available for use:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 0/32 portmap tcp/udp auto

The second method is to use a pool of public addresses. This is useful
when there are too many LAN addresses to fit into a single public
address and a block of public IP addresses is available. These public
addresses can be used as a pool from which NAT selects an IP address as
a packet's address is mapped on its way out.

The range of public IP addresses can be specified using a netmask or
CIDR notation. These two rules are equivalent:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 204.134.75.0/255.255.255.0
    map dc0 192.168.1.0/24 -> 204.134.75.0/24

A common practice is to have a publically accessible web server or mail
server segregated to an internal network segment. The traffic from these
servers still has to undergo NAT, but port redirection is needed to
direct inbound traffic to the correct server. For example, to map a web
server using the internal address ``10.0.10.25`` to its public IP
address of ``20.20.20.5``, use this rule:

.. code:: programlisting

    rdr dc0 20.20.20.5/32 port 80 -> 10.0.10.25 port 80

If it is the only web server, this rule would also work as it redirects
all external HTTP requests to ``10.0.10.25``:

.. code:: programlisting

    rdr dc0 0.0.0.0/0 port 80 -> 10.0.10.25 port 80

IPF has a built in FTP proxy which can be used with NAT. It monitors all
outbound traffic for active or passive FTP connection requests and
dynamically creates temporary filter rules containing the port number
used by the FTP data channel. This eliminates the need to open large
ranges of high order ports for FTP connections.

In this example, the first rule calls the proxy for outbound FTP traffic
from the internal LAN. The second rule passes the FTP traffic from the
firewall to the Internet, and the third rule handles all non-FTP traffic
from the internal LAN:

.. code:: programlisting

    map dc0 10.0.10.0/29 -> 0/32 proxy port 21 ftp/tcp
    map dc0 0.0.0.0/0 -> 0/32 proxy port 21 ftp/tcp
    map dc0 10.0.10.0/29 -> 0/32

The FTP ``map`` rules go before the NAT rule so that when a packet
matches an FTP rule, the FTP proxy creates temporary filter rules to let
the FTP session packets pass and undergo NAT. All LAN packets that are
not FTP will not match the FTP rules but will undergo NAT if they match
the third rule.

Without the FTP proxy, the following firewall rules would instead be
needed. Note that without the proxy, all ports above ``1024`` need to be
allowed:

.. code:: programlisting

    # Allow out LAN PC client FTP to public Internet
    # Active and passive modes
    pass out quick on rl0 proto tcp from any to any port = 21 flags S keep state

    # Allow out passive mode data channel high order port numbers
    pass out quick on rl0 proto tcp from any to any port > 1024 flags S keep state

    # Active mode let data channel in from FTP server
    pass in quick on rl0 proto tcp from any to any port = 20 flags S keep state

Whenever the file containing the NAT rules is edited, run ``ipnat`` with
``-CF`` to delete the current NAT rules and flush the contents of the
dynamic translation table. Include ``-f`` and specify the name of the
NAT ruleset to load:

.. code:: screen

    # ipnat -CF -f /etc/ipnat.rules

To display the NAT statistics:

.. code:: screen

    # ipnat -s

To list the NAT table's current mappings:

.. code:: screen

    # ipnat -l

To turn verbose mode on and display information relating to rule
processing and active rules and table entries:

.. code:: screen

    # ipnat -v

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

30.5.5.?Viewing IPF Statistics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPF includes
`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8>`__
which can be used to retrieve and display statistics which are gathered
as packets match rules as they go through the firewall. Statistics are
accumulated since the firewall was last started or since the last time
they were reset to zero using ``ipf       -Z``.

The default ``ipfstat`` output looks like this:

.. code:: screen

    input packets: blocked 99286 passed 1255609 nomatch 14686 counted 0
     output packets: blocked 4200 passed 1284345 nomatch 14687 counted 0
     input packets logged: blocked 99286 passed 0
     output packets logged: blocked 0 passed 0
     packets logged: input 0 output 0
     log failures: input 3898 output 0
     fragment state(in): kept 0 lost 0
     fragment state(out): kept 0 lost 0
     packet state(in): kept 169364 lost 0
     packet state(out): kept 431395 lost 0
     ICMP replies: 0 TCP RSTs sent: 0
     Result cache hits(in): 1215208 (out): 1098963
     IN Pullups succeeded: 2 failed: 0
     OUT Pullups succeeded: 0 failed: 0
     Fastroute successes: 0 failures: 0
     TCP cksum fails(in): 0 (out): 0
     Packet log flags set: (0)

Several options are available. When supplied with either ``-i`` for
inbound or ``-o`` for outbound, the command will retrieve and display
the appropriate list of filter rules currently installed and in use by
the kernel. To also see the rule numbers, include ``-n``. For example,
``ipfstat       -on`` displays the outbound rules table with rule
numbers:

.. code:: screen

    @1 pass out on xl0 from any to any
    @2 block out on dc0 from any to any
    @3 pass out quick on dc0 proto tcp/udp from any to any keep state

Include ``-h`` to prefix each rule with a count of how many times the
rule was matched. For example, ``ipfstat -oh`` displays the outbound
internal rules table, prefixing each rule with its usage count:

.. code:: screen

    2451423 pass out on xl0 from any to any
    354727 block out on dc0 from any to any
    430918 pass out quick on dc0 proto tcp/udp from any to any keep state

To display the state table in a format similar to
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__, use
``ipfstat -t``. When the firewall is under attack, this option provides
the ability to identify and see the attacking packets. The optional
sub-flags give the ability to select the destination or source IP, port,
or protocol to be monitored in real time. Refer to
`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8>`__
for details.

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

30.5.6.?IPF Logging
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPF provides ``ipmon``, which can be used to write the firewall's
logging information in a human readable format. It requires that
``options IPFILTER_LOG`` be first added to a custom kernel using the
instructions in `Chapter?9, *Configuring the FreeBSD
Kernel* <kernelconfig.html>`__.

This command is typically run in daemon mode in order to provide a
continuous system log file so that logging of past events may be
reviewed. Since FreeBSD has a built in
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
facility to automatically rotate system logs, the default ``rc.conf``
``ipmon_flags`` statement uses ``-Ds``:

.. code:: programlisting

    ipmon_flags="-Ds" # D = start as daemon
                      # s = log to syslog
                      # v = log tcp window, ack, seq
                      # n = map IP & port to names

Logging provides the ability to review, after the fact, information such
as which packets were dropped, what addresses they came from, and where
they were going. This information is useful in tracking down attackers.

Once the logging facility is enabled in ``rc.conf`` and started with
``service       ipmon start``, IPF will only log the rules which contain
the ``log`` keyword. The firewall administrator decides which rules in
the ruleset should be logged and normally only deny rules are logged. It
is customary to include the ``log`` keyword in the last rule in the
ruleset. This makes it possible to see all the packets that did not
match any of the rules in the ruleset.

By default, ``ipmon -Ds`` mode uses ``local0`` as the logging facility.
The following logging levels can be used to further segregate the logged
data:

.. code:: screen

    LOG_INFO - packets logged using the "log" keyword as the action rather than pass or block.
    LOG_NOTICE - packets logged which are also passed
    LOG_WARNING - packets logged which are also blocked
    LOG_ERR - packets which have been logged and which can be considered short due to an incomplete header

In order to setup IPF to log all data to ``/var/log/ipfilter.log``,
first create the empty file:

.. code:: screen

    # touch /var/log/ipfilter.log

Then, to write all logged messages to the specified file, add the
following statement to ``/etc/syslog.conf``:

.. code:: programlisting

    local0.* /var/log/ipfilter.log

To activate the changes and instruct
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
to read the modified ``/etc/syslog.conf``, run
``service syslogd reload``.

Do not forget to edit ``/etc/newsyslog.conf`` to rotate the new log
file.

Messages generated by ``ipmon`` consist of data fields separated by
white space. Fields common to all messages are:

.. raw:: html

   <div class="orderedlist">

#. The date of packet receipt.

#. The time of packet receipt. This is in the form HH:MM:SS.F, for
   hours, minutes, seconds, and fractions of a second.

#. The name of the interface that processed the packet.

#. The group and rule number of the rule in the format ``@0:17``.

#. The action: ``p`` for passed, ``b`` for blocked, ``S`` for a short
   packet, ``n`` did not match any rules, and ``L`` for a log rule.

#. The addresses written as three fields: the source address and port
   separated by a comma, the -> symbol, and the destination address and
   port. For example:
   ``209.53.17.22,80 ->           198.73.220.17,1722``.

#. ``PR`` followed by the protocol name or number: for example,
   ``PR tcp``.

#. ``len`` followed by the header length and total length of the packet:
   for example, ``len 20 40``.

.. raw:: html

   </div>

If the packet is a TCP packet, there will be an additional field
starting with a hyphen followed by letters corresponding to any flags
that were set. Refer to
`ipf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=5>`__ for
a list of letters and their flags.

If the packet is an ICMP packet, there will be two fields at the end:
the first always being “icmp” and the next being the ICMP message and
sub-message type, separated by a slash. For example: ``icmp 3/3`` for a
port unreachable message.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------+------------------------------------------+
| `Prev <firewalls-ipfw.html>`__?   | `Up <firewalls.html>`__   | ?\ `Next <advanced-networking.html>`__   |
+-----------------------------------+---------------------------+------------------------------------------+
| 30.4.?IPFW?                       | `Home <index.html>`__     | ?Chapter?31.?Advanced Networking         |
+-----------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
