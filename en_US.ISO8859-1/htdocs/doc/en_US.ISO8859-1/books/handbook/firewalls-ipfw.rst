==========
30.4.?IPFW
==========

.. raw:: html

   <div class="navheader">

30.4.?IPFW
`Prev <firewalls-pf.html>`__?
Chapter?30.?Firewalls
?\ `Next <firewalls-ipf.html>`__

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

30.4.?IPFW
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPFW is a stateful firewall written for FreeBSD which supports both IPv4
and IPv6. It is comprised of several components: the kernel firewall
filter rule processor and its integrated packet accounting facility, the
logging facility, NAT, the
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
traffic shaper, a forward facility, a bridge facility, and an ipstealth
facility.

FreeBSD provides a sample ruleset in ``/etc/rc.firewall`` which defines
several firewall types for common scenarios to assist novice users in
generating an appropriate ruleset. IPFW provides a powerful syntax which
advanced users can use to craft customized rulesets that meet the
security requirements of a given environment.

This section describes how to enable IPFW, provides an overview of its
rule syntax, and demonstrates several rulesets for common configuration
scenarios.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.4.1.?Enabling IPFW
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPFW is included in the basic FreeBSD install as a kernel loadable
module, meaning that a custom kernel is not needed in order to enable
IPFW.

For those users who wish to statically compile IPFW support into a
custom kernel, refer to the instructions in `Chapter?9, *Configuring the
FreeBSD Kernel* <kernelconfig.html>`__. The following options are
available for the custom kernel configuration file:

.. code:: programlisting

    options    IPFIREWALL          # enables IPFW
    options    IPFIREWALL_VERBOSE       # enables logging for rules with log keyword
    options    IPFIREWALL_VERBOSE_LIMIT=5   # limits number of logged packets per-entry
    options    IPFIREWALL_DEFAULT_TO_ACCEPT # sets default policy to pass what is not explicitly denied
    options    IPDIVERT         # enables NAT

To configure the system to enable IPFW at boot time, add the following
entry to ``/etc/rc.conf``:

.. code:: programlisting

    firewall_enable="YES"

To use one of the default firewall types provided by FreeBSD, add
another line which specifies the type:

.. code:: programlisting

    firewall_type="open"

The available types are:

.. raw:: html

   <div class="itemizedlist">

-  ``open``: passes all traffic.

-  ``client``: protects only this machine.

-  ``simple``: protects the whole network.

-  ``closed``: entirely disables IP traffic except for the loopback
   interface.

-  ``workstation``: protects only this machine using stateful rules.

-  ``UNKNOWN``: disables the loading of firewall rules.

-  ``filename``: full path of the file containing the firewall ruleset.

.. raw:: html

   </div>

If ``firewall_type`` is set to either ``client`` or ``simple``, modify
the default rules found in ``/etc/rc.firewall`` to fit the configuration
of the system.

Note that the ``filename`` type is used to load a custom ruleset.

An alternate way to load a custom ruleset is to set the
``firewall_script`` variable to the absolute path of an *executable
script* that includes IPFW commands. The examples used in this section
assume that the ``firewall_script`` is set to ``/etc/ipfw.rules``:

.. code:: programlisting

    firewall_script="/etc/ipfw.rules"

To enable logging, include this line:

.. code:: programlisting

    firewall_logging="YES"

There is no ``/etc/rc.conf`` variable to set logging limits. To limit
the number of times a rule is logged per connection attempt, specify the
number using this line in ``/etc/sysctl.conf``:

.. code:: programlisting

    net.inet.ip.fw.verbose_limit=5

After saving the needed edits, start the firewall. To enable logging
limits now, also set the ``sysctl`` value specified above:

.. code:: screen

    # service ipfw start
    # sysctl net.inet.ip.fw.verbose_limit=5

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

30.4.2.?IPFW Rule Syntax
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a packet enters the IPFW firewall, it is compared against the first
rule in the ruleset and progresses one rule at a time, moving from top
to bottom in sequence. When the packet matches the selection parameters
of a rule, the rule's action is executed and the search of the ruleset
terminates for that packet. This is referred to as “first match wins”.
If the packet does not match any of the rules, it gets caught by the
mandatory IPFW default rule number 65535, which denies all packets and
silently discards them. However, if the packet matches a rule that
contains the ``count``, ``skipto``, or ``tee`` keywords, the search
continues. Refer to
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
for details on how these keywords affect rule processing.

When creating an IPFW rule, keywords must be written in the following
order. Some keywords are mandatory while other keywords are optional.
The words shown in uppercase represent a variable and the words shown in
lowercase must precede the variable that follows it. The ``#`` symbol is
used to mark the start of a comment and may appear at the end of a rule
or on its own line. Blank lines are ignored.

*``CMD RULE_NUMBER set SET_NUMBER ACTION log       LOG_AMOUNT PROTO from SRC SRC_PORT to DST DST_PORT       OPTIONS``*

This section provides an overview of these keywords and their options.
It is not an exhaustive list of every possible option. Refer to
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
for a complete description of the rule syntax that can be used when
creating IPFW rules.

.. raw:: html

   <div class="variablelist">

CMD
    Every rule must start with *``ipfw add``*.

RULE\_NUMBER
    Each rule is associated with a number from ``1`` to ``65534``. The
    number is used to indicate the order of rule processing. Multiple
    rules can have the same number, in which case they are applied
    according to the order in which they have been added.

SET\_NUMBER
    Each rule is associated with a set number from ``0`` to ``31``. Sets
    can be individually disabled or enabled, making it possible to
    quickly add or delete a set of rules. If a SET\_NUMBER is not
    specified, the rule will be added to set ``0``.

ACTION
    A rule can be associated with one of the following actions. The
    specified action will be executed when the packet matches the
    selection criterion of the rule.

    *``allow | accept | pass |         permit``*: these keywords are
    equivalent and allow packets that match the rule.

    *``check-state``*: checks the packet against the dynamic state
    table. If a match is found, execute the action associated with the
    rule which generated this dynamic rule, otherwise move to the next
    rule. A ``check-state`` rule does not have selection criterion. If
    no ``check-state`` rule is present in the ruleset, the dynamic rules
    table is checked at the first ``keep-state`` or ``limit`` rule.

    *``count``*: updates counters for all packets that match the rule.
    The search continues with the next rule.

    *``deny | drop``*: either word silently discards packets that match
    this rule.

    Additional actions are available. Refer to
    `ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
    for details.

LOG\_AMOUNT
    When a packet matches a rule with the ``log`` keyword, a message
    will be logged to
    `syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
    with a facility name of ``SECURITY``. Logging only occurs if the
    number of packets logged for that particular rule does not exceed a
    specified LOG\_AMOUNT. If no LOG\_AMOUNT is specified, the limit is
    taken from the value of ``net.inet.ip.fw.verbose_limit``. A value of
    zero removes the logging limit. Once the limit is reached, logging
    can be re-enabled by clearing the logging counter or the packet
    counter for that rule, using ``ipfw reset log``.

    .. raw:: html

       <div class="note" xmlns="">

    Note:
    ~~~~~

    Logging is done after all other packet matching conditions have been
    met, and before performing the final action on the packet. The
    administrator decides which rules to enable logging on.

    .. raw:: html

       </div>

PROTO
    This optional value can be used to specify any protocol name or
    number found in ``/etc/protocols``.

SRC
    The ``from`` keyword must be followed by the source address or a
    keyword that represents the source address. An address can be
    represented by ``any``, ``me`` (any address configured on an
    interface on this system), ``me6``, (any IPv6 address configured on
    an interface on this system), or ``table`` followed by the number of
    a lookup table which contains a list of addresses. When specifying
    an IP address, it can be optionally followed by its CIDR mask or
    subnet mask. For example, ``1.2.3.4/25`` or
    ``1.2.3.4:255.255.255.128``.

SRC\_PORT
    An optional source port can be specified using the port number or
    name from ``/etc/services``.

DST
    The ``to`` keyword must be followed by the destination address or a
    keyword that represents the destination address. The same keywords
    and addresses described in the SRC section can be used to describe
    the destination.

DST\_PORT
    An optional destination port can be specified using the port number
    or name from ``/etc/services``.

OPTIONS
    Several keywords can follow the source and destination. As the name
    suggests, OPTIONS are optional. Commonly used options include ``in``
    or ``out``, which specify the direction of packet flow,
    ``icmptypes`` followed by the type of ICMP message, and
    ``keep-state``.

    When a *``keep-state``* rule is matched, the firewall will create a
    dynamic rule which matches bidirectional traffic between the source
    and destination addresses and ports using the same protocol.

    The dynamic rules facility is vulnerable to resource depletion from
    a SYN-flood attack which would open a huge number of dynamic rules.
    To counter this type of attack with IPFW, use ``limit``. This option
    limits the number of simultaneous sessions by checking the open
    dynamic rules, counting the number of times this rule and IP address
    combination occurred. If this count is greater than the value
    specified by ``limit``, the packet is discarded.

    Dozens of OPTIONS are available. Refer to
    `ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
    for a description of each available option.

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

30.4.3.?Example Ruleset
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates how to create an example stateful firewall
ruleset script named ``/etc/ipfw.rules``. In this example, all
connection rules use ``in`` or ``out`` to clarify the direction. They
also use ``via`` *``interface-name``* to specify the interface the
packet is traveling over.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When first creating or testing a firewall ruleset, consider temporarily
setting this tunable:

.. code:: programlisting

    net.inet.ip.fw.default_to_accept="1"

This sets the default policy of
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__ to
be more permissive than the default ``deny ip from any to         any``,
making it slightly more difficult to get locked out of the system right
after a reboot.

.. raw:: html

   </div>

The firewall script begins by indicating that it is a Bourne shell
script and flushes any existing rules. It then creates the ``cmd``
variable so that ``ipfw add`` does not have to be typed at the beginning
of every rule. It also defines the ``pif`` variable which represents the
name of the interface that is attached to the Internet.

.. code:: programlisting

    #!/bin/sh
    # Flush out the list before we begin.
    ipfw -q -f flush

    # Set rules command prefix
    cmd="ipfw -q add"
    pif="dc0"     # interface name of NIC attached to Internet

The first two rules allow all traffic on the trusted internal interface
and on the loopback interface:

.. code:: programlisting

    # Change xl0 to LAN NIC interface name
    $cmd 00005 allow all from any to any via xl0

    # No restrictions on Loopback Interface
    $cmd 00010 allow all from any to any via lo0

The next rule allows the packet through if it matches an existing entry
in the dynamic rules table:

.. code:: programlisting

    $cmd 00101 check-state

The next set of rules defines which stateful connections internal
systems can create to hosts on the Internet:

.. code:: programlisting

    # Allow access to public DNS
    # Replace x.x.x.x with the IP address of a public DNS server
    # and repeat for each DNS server in /etc/resolv.conf
    $cmd 00110 allow tcp from any to x.x.x.x 53 out via $pif setup keep-state
    $cmd 00111 allow udp from any to x.x.x.x 53 out via $pif keep-state

    # Allow access to ISP's DHCP server for cable/DSL configurations.
    # Use the first rule and check log for IP address.
    # Then, uncomment the second rule, input the IP address, and delete the first rule
    $cmd 00120 allow log udp from any to any 67 out via $pif keep-state
    #$cmd 00120 allow udp from any to x.x.x.x 67 out via $pif keep-state

    # Allow outbound HTTP and HTTPS connections
    $cmd 00200 allow tcp from any to any 80 out via $pif setup keep-state
    $cmd 00220 allow tcp from any to any 443 out via $pif setup keep-state

    # Allow outbound email connections
    $cmd 00230 allow tcp from any to any 25 out via $pif setup keep-state
    $cmd 00231 allow tcp from any to any 110 out via $pif setup keep-state

    # Allow outbound ping
    $cmd 00250 allow icmp from any to any out via $pif keep-state

    # Allow outbound NTP
    $cmd 00260 allow tcp from any to any 37 out via $pif setup keep-state

    # Allow outbound SSH
    $cmd 00280 allow tcp from any to any 22 out via $pif setup keep-state

    # deny and log all other outbound connections
    $cmd 00299 deny log all from any to any out via $pif

The next set of rules controls connections from Internet hosts to the
internal network. It starts by denying packets typically associated with
attacks and then explicitly allows specific types of connections. All
the authorized services that originate from the Internet use ``limit``
to prevent flooding.

.. code:: programlisting

    # Deny all inbound traffic from non-routable reserved address spaces
    $cmd 00300 deny all from 192.168.0.0/16 to any in via $pif     #RFC 1918 private IP
    $cmd 00301 deny all from 172.16.0.0/12 to any in via $pif      #RFC 1918 private IP
    $cmd 00302 deny all from 10.0.0.0/8 to any in via $pif         #RFC 1918 private IP
    $cmd 00303 deny all from 127.0.0.0/8 to any in via $pif        #loopback
    $cmd 00304 deny all from 0.0.0.0/8 to any in via $pif          #loopback
    $cmd 00305 deny all from 169.254.0.0/16 to any in via $pif     #DHCP auto-config
    $cmd 00306 deny all from 192.0.2.0/24 to any in via $pif       #reserved for docs
    $cmd 00307 deny all from 204.152.64.0/23 to any in via $pif    #Sun cluster interconnect
    $cmd 00308 deny all from 224.0.0.0/3 to any in via $pif        #Class D & E multicast

    # Deny public pings
    $cmd 00310 deny icmp from any to any in via $pif

    # Deny ident
    $cmd 00315 deny tcp from any to any 113 in via $pif

    # Deny all Netbios services.
    $cmd 00320 deny tcp from any to any 137 in via $pif
    $cmd 00321 deny tcp from any to any 138 in via $pif
    $cmd 00322 deny tcp from any to any 139 in via $pif
    $cmd 00323 deny tcp from any to any 81 in via $pif

    # Deny fragments
    $cmd 00330 deny all from any to any frag in via $pif

    # Deny ACK packets that did not match the dynamic rule table
    $cmd 00332 deny tcp from any to any established in via $pif

    # Allow traffic from ISP's DHCP server.
    # Replace x.x.x.x with the same IP address used in rule 00120.
    #$cmd 00360 allow udp from any to x.x.x.x 67 in via $pif keep-state

    # Allow HTTP connections to internal web server
    $cmd 00400 allow tcp from any to me 80 in via $pif setup limit src-addr 2

    # Allow inbound SSH connections
    $cmd 00410 allow tcp from any to me 22 in via $pif setup limit src-addr 2

    # Reject and log all other incoming connections
    $cmd 00499 deny log all from any to any in via $pif

The last rule logs all packets that do not match any of the rules in the
ruleset:

.. code:: programlisting

    # Everything else is denied and logged
    $cmd 00999 deny log all from any to any

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

30.4.4.?Configuring NAT
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD's built-in NAT daemon,
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__,
works in conjunction with IPFW to provide network address translation.
This can be used to provide an Internet Connection Sharing solution so
that several internal computers can connect to the Internet using a
single IP address.

To do this, the FreeBSD machine connected to the Internet must act as a
gateway. This system must have two NICs, where one is connected to the
Internet and the other is connected to the internal LAN. Each machine
connected to the LAN should be assigned an IP address in the private
network space, as defined by `RFC
1918 <ftp://ftp.isi.edu/in-notes/rfc1918.txt>`__, and have the default
gateway set to the
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
system's internal IP address.

Some additional configuration is needed in order to activate the NAT
function of IPFW. If the system has a custom kernel, the kernel
configuration file needs to include ``option IPDIVERT`` along with the
other ``IPFIREWALL`` options described in `Section?30.4.1, “Enabling
IPFW” <firewalls-ipfw.html#firewalls-ipfw-enable>`__.

To enable NAT support at boot time, the following must be in
``/etc/rc.conf``:

.. code:: programlisting

    gateway_enable="YES"        # enables the gateway
    natd_enable="YES"       # enables NAT
    natd_interface="rl0"        # specify interface name of NIC attached to Internet
    natd_flags="-dynamic -m"    # -m = preserve port numbers; additional options are listed in natd(8)

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is also possible to specify a configuration file which contains the
options to pass to
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__:

.. code:: programlisting

    natd_flags="-f /etc/natd.conf"

The specified file must contain a list of configuration options, one per
line. For example:

.. code:: programlisting

    redirect_port tcp 192.168.0.2:6667 6667
    redirect_port tcp 192.168.0.3:80 80

For more information about this configuration file, consult
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__.

.. raw:: html

   </div>

Next, add the NAT rules to the firewall ruleset. When the rulest
contains stateful rules, the positioning of the NAT rules is critical
and the ``skipto`` action is used. The ``skipto`` action requires a rule
number so that it knows which rule to jump to.

The following example builds upon the firewall ruleset shown in the
previous section. It adds some additional entries and modifies some
existing rules in order to configure the firewall for NAT. It starts by
adding some additional variables which represent the rule number to skip
to, the ``keep-state`` option, and a list of TCP ports which will be
used to reduce the number of rules:

.. code:: programlisting

    #!/bin/sh
    ipfw -q -f flush
    cmd="ipfw -q add"
    skip="skipto 500"
    pif=dc0
    ks="keep-state"
    good_tcpo="22,25,37,53,80,443,110"

The inbound NAT rule is inserted *after* the two rules which allow all
traffic on the trusted internal interface and on the loopback interface
and *before* the ``check-state`` rule. It is important that the rule
number selected for this NAT rule, in this example ``100``, is higher
than the first two rules and lower than the ``check-state`` rule:

.. code:: programlisting

    $cmd 005 allow all from any to any via xl0  # exclude LAN traffic
    $cmd 010 allow all from any to any via lo0  # exclude loopback traffic
    $cmd 100 divert natd ip from any to any in via $pif # NAT any inbound packets
    # Allow the packet through if it has an existing entry in the dynamic rules table
    $cmd 101 check-state

The outbound rules are modified to replace the ``allow`` action with the
``$skip`` variable, indicating that rule processing will continue at
rule ``500``. The seven ``tcp`` rules have been replaced by rule ``125``
as the ``$good_tcpo`` variable contains the seven allowed outbound
ports.

.. code:: programlisting

    # Authorized outbound packets
    $cmd 120 $skip udp from any to x.x.x.x 53 out via $pif $ks
    $cmd 121 $skip udp from any to x.x.x.x 67 out via $pif $ks
    $cmd 125 $skip tcp from any to any $good_tcpo out via $pif setup $ks
    $cmd 130 $skip icmp from any to any out via $pif $ks

The inbound rules remain the same, except for the very last rule which
removes the `` via $pif`` in order to catch both inbound and outbound
rules. The NAT rule must follow this last outbound rule, must have a
higher number than that last rule, and the rule number must be
referenced by the ``skipto`` action. In this ruleset, rule number
``500`` diverts all packets which match the outbound rules to
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
for NAT processing. The next rule allows any packet which has undergone
NAT processing to pass.

.. code:: programlisting

    $cmd 499 deny log all from any to any
    $cmd 500 divert natd ip from any to any out via $pif # skipto location for outbound stateful rules
    $cmd 510 allow ip from any to any

In this example, rules ``100``, ``101``, ``125``, ``500``, and ``510``
control the address translation of the outbound and inbound packets so
that the entries in the dynamic state table always register the private
LAN IP address.

Consider an internal web browser which initializes a new outbound HTTP
session over port 80. When the first outbound packet enters the
firewall, it does not match rule ``100`` because it is headed out rather
than in. It passes rule ``101`` because this is the first packet and it
has not been posted to the dynamic state table yet. The packet finally
matches rule ``125`` as it is outbound on an allowed port and has a
source IP address from the internal LAN. On matching this rule, two
actions take place. First, the ``keep-state`` action adds an entry to
the dynamic state table and the specified action, ``skipto rule 500``,
is executed. Next, the packet undergoes NAT and is sent out to the
Internet. This packet makes its way to the destination web server, where
a response packet is generated and sent back. This new packet enters the
top of the ruleset. It matches rule ``100`` and has its destination IP
address mapped back to the original internal address. It then is
processed by the ``check-state`` rule, is found in the table as an
existing session, and is released to the LAN.

On the inbound side, the ruleset has to deny bad packets and allow only
authorized services. A packet which matches an inbound rule is posted to
the dynamic state table and the packet is released to the LAN. The
packet generated as a response is recognized by the ``check-state`` rule
as belonging to an existing session. It is then sent to rule ``500`` to
undergo NAT before being released to the outbound interface.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.4.4.1.?Port Redirection
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The drawback with
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ is
that the LAN clients are not accessible from the Internet. Clients on
the LAN can make outgoing connections to the world but cannot receive
incoming ones. This presents a problem if trying to run Internet
services on one of the LAN client machines. A simple way around this is
to redirect selected Internet ports on the
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
machine to a LAN client.

For example, an IRC server runs on client ``A`` and a web server runs on
client ``B``. For this to work properly, connections received on ports
6667 (IRC) and 80 (HTTP) must be redirected to the respective machines.

The syntax for ``-redirect_port`` is as follows:

.. code:: programlisting

         -redirect_port proto targetIP:targetPORT[-targetPORT]
                     [aliasIP:]aliasPORT[-aliasPORT]
                     [remoteIP[:remotePORT[-remotePORT]]]

In the above example, the argument should be:

.. code:: programlisting

        -redirect_port tcp 192.168.0.2:6667 6667
        -redirect_port tcp 192.168.0.3:80 80

This redirects the proper TCP ports to the LAN client machines.

Port ranges over individual ports can be indicated with
``-redirect_port``. For example,
*``tcp 192.168.0.2:2000-3000         2000-3000``* would redirect all
connections received on ports 2000 to 3000 to ports 2000 to 3000 on
client ``A``.

These options can be used when directly running
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__,
placed within the ``natd_flags=""`` option in ``/etc/rc.conf``, or
passed via a configuration file.

For further configuration options, consult
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__

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

30.4.4.2.?Address Redirection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Address redirection is useful if more than one IP address is available.
Each LAN client can be assigned its own external IP address by
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__,
which will then rewrite outgoing packets from the LAN clients with the
proper external IP address and redirects all traffic incoming on that
particular IP address back to the specific LAN client. This is also
known as static NAT. For example, if IP addresses ``128.1.1.1``,
``128.1.1.2``, and ``128.1.1.3`` are available, ``128.1.1.1`` can be
used as the
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
machine's external IP address, while ``128.1.1.2`` and ``128.1.1.3`` are
forwarded back to LAN clients ``A`` and ``B``.

The ``-redirect_address`` syntax is as follows:

.. code:: programlisting

    -redirect_address localIP publicIP

.. raw:: html

   <div class="informaltable">

+------------+------------------------------------------------------------+
| localIP    | The internal IP address of the LAN client.                 |
+------------+------------------------------------------------------------+
| publicIP   | The external IP address corresponding to the LAN client.   |
+------------+------------------------------------------------------------+

.. raw:: html

   </div>

In the example, this argument would read:

.. code:: programlisting

    -redirect_address 192.168.0.2 128.1.1.2
    -redirect_address 192.168.0.3 128.1.1.3

Like ``-redirect_port``, these arguments are placed within the
``natd_flags=""`` option of ``/etc/rc.conf``, or passed via a
configuration file. With address redirection, there is no need for port
redirection since all data received on a particular IP address is
redirected.

The external IP addresses on the
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
machine must be active and aliased to the external interface. Refer to
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
for details.

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

30.4.5.?The IPFW Command
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``ipfw`` can be used to make manual, single rule additions or deletions
to the active firewall while it is running. The problem with using this
method is that all the changes are lost when the system reboots. It is
recommended to instead write all the rules in a file and to use that
file to load the rules at boot time and to replace the currently running
firewall rules whenever that file changes.

``ipfw`` is a useful way to display the running firewall rules to the
console screen. The IPFW accounting facility dynamically creates a
counter for each rule that counts each packet that matches the rule.
During the process of testing a rule, listing the rule with its counter
is one way to determine if the rule is functioning as expected.

To list all the running rules in sequence:

.. code:: screen

    # ipfw list

To list all the running rules with a time stamp of when the last time
the rule was matched:

.. code:: screen

    # ipfw -t list

The next example lists accounting information and the packet count for
matched rules along with the rules themselves. The first column is the
rule number, followed by the number of matched packets and bytes,
followed by the rule itself.

.. code:: screen

    # ipfw -a list

To list dynamic rules in addition to static rules:

.. code:: screen

    # ipfw -d list

To also show the expired dynamic rules:

.. code:: screen

    # ipfw -d -e list

To zero the counters:

.. code:: screen

    # ipfw zero

To zero the counters for just the rule with number *``NUM``*:

.. code:: screen

    # ipfw zero NUM

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.4.5.1.?Logging Firewall Messages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Even with the logging facility enabled, IPFW will not generate any rule
logging on its own. The firewall administrator decides which rules in
the ruleset will be logged, and adds the ``log`` keyword to those rules.
Normally only deny rules are logged. It is customary to duplicate the
“ipfw default deny everything” rule with the ``log`` keyword included as
the last rule in the ruleset. This way, it is possible to see all the
packets that did not match any of the rules in the ruleset.

Logging is a two edged sword. If one is not careful, an over abundance
of log data or a DoS attack can fill the disk with log files. Log
messages are not only written to syslogd, but also are displayed on the
root console screen and soon become annoying.

The ``IPFIREWALL_VERBOSE_LIMIT=5`` kernel option limits the number of
consecutive messages sent to
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__,
concerning the packet matching of a given rule. When this option is
enabled in the kernel, the number of consecutive messages concerning a
particular rule is capped at the number specified. There is nothing to
be gained from 200 identical log messages. With this option set to five,
five consecutive messages concerning a particular rule would be logged
to syslogd and the remainder identical consecutive messages would be
counted and posted to syslogd with a phrase like the following:

.. code:: programlisting

    last message repeated 45 times

All logged packets messages are written by default to
``/var/log/security``, which is defined in ``/etc/syslog.conf``.

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

30.4.5.2.?Building a Rule Script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most experienced IPFW users create a file containing the rules and code
them in a manner compatible with running them as a script. The major
benefit of doing this is the firewall rules can be refreshed in mass
without the need of rebooting the system to activate them. This method
is convenient in testing new rules as the procedure can be executed as
many times as needed. Being a script, symbolic substitution can be used
for frequently used values to be substituted into multiple rules.

This example script is compatible with the syntax used by the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__,
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__, and
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__
shells. Symbolic substitution fields are prefixed with a dollar sign
($). Symbolic fields do not have the $ prefix. The value to populate the
symbolic field must be enclosed in double quotes ("").

Start the rules file like this:

.. code:: programlisting

    ############### start of example ipfw rules script #############
    #
    ipfw -q -f flush       # Delete all rules
    # Set defaults
    oif="tun0"             # out interface
    odns="192.0.2.11"      # ISP's DNS server IP address
    cmd="ipfw -q add "     # build rule prefix
    ks="keep-state"        # just too lazy to key this each time
    $cmd 00500 check-state
    $cmd 00502 deny all from any to any frag
    $cmd 00501 deny tcp from any to any established
    $cmd 00600 allow tcp from any to any 80 out via $oif setup $ks
    $cmd 00610 allow tcp from any to $odns 53 out via $oif setup $ks
    $cmd 00611 allow udp from any to $odns 53 out via $oif $ks
    ################### End of example ipfw rules script ############

The rules are not important as the focus of this example is how the
symbolic substitution fields are populated.

If the above example was in ``/etc/ipfw.rules``, the rules could be
reloaded by the following command:

.. code:: screen

    # sh /etc/ipfw.rules

``/etc/ipfw.rules`` can be located anywhere and the file can have any
name.

The same thing could be accomplished by running these commands by hand:

.. code:: screen

    # ipfw -q -f flush
    # ipfw -q add check-state
    # ipfw -q add deny all from any to any frag
    # ipfw -q add deny tcp from any to any established
    # ipfw -q add allow tcp from any to any 80 out via tun0 setup keep-state
    # ipfw -q add allow tcp from any to 192.0.2.11 53 out via tun0 setup keep-state
    # ipfw -q add 00611 allow udp from any to 192.0.2.11 53 out via tun0 keep-state

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+---------------------------+------------------------------------+
| `Prev <firewalls-pf.html>`__?   | `Up <firewalls.html>`__   | ?\ `Next <firewalls-ipf.html>`__   |
+---------------------------------+---------------------------+------------------------------------+
| 30.3.?PF?                       | `Home <index.html>`__     | ?30.5.?IPFILTER (IPF)              |
+---------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
