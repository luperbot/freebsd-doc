========
30.3.?PF
========

.. raw:: html

   <div class="navheader">

30.3.?PF
`Prev <firewalls-concepts.html>`__?
Chapter?30.?Firewalls
?\ `Next <firewalls-ipfw.html>`__

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

30.3.?PF
--------

.. raw:: html

   </div>

.. raw:: html

   <div>

Revised and updated by John Ferrell.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since FreeBSD?5.3, a ported version of OpenBSD's PF firewall has been
included as an integrated part of the base system. PF is a complete,
full-featured firewall that has optional support for ALTQ (Alternate
Queuing), which provides Quality of Service (QoS).

The OpenBSD Project maintains the definitive reference for PF in the `PF
FAQ <http://www.openbsd.org/faq/pf/>`__. Peter Hansteen maintains a
thorough PF tutorial at http://home.nuug.no/~peter/pf/.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

When reading the `PF FAQ <http://www.openbsd.org/faq/pf/>`__, keep in
mind that different versions of FreeBSD contain different versions of
PF. FreeBSD?8.\ *``X``* uses the same version of PF as OpenBSD?4.1 and
FreeBSD?9.\ *``X``* and later uses the same version of PF as
OpenBSD?4.5.

.. raw:: html

   </div>

The `FreeBSD packet filter mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-pf>`__ is a good
place to ask questions about configuring and running the PF firewall.
Check the mailing list archives before asking a question as it may have
already been answered.

More information about porting PF to FreeBSD can be found at
``http://pf4freebsd.love2party.net/``.

This section of the Handbook focuses on PF as it pertains to FreeBSD. It
demonstrates how to enable PF and ALTQ. It then provides several
examples for creating rulesets on a FreeBSD system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.3.1.?Enabling PF
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to use PF, its kernel module must be first loaded. This section
describes the entries that can be added to ``/etc/rc.conf`` in order to
enable PF.

Start by adding the following line to ``/etc/rc.conf``:

.. code:: programlisting

    pf_enable="YES"

Additional options, described in
`pfctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pfctl&sektion=8>`__,
can be passed to PF when it is started. Add this entry to
``/etc/rc.conf`` and specify any required flags between the two quotes
(``""``):

.. code:: programlisting

    pf_flags=""                     # additional flags for pfctl startup

PF will not start if it cannot find its ruleset configuration file. The
default ruleset is already created and is named ``/etc/pf.conf``. If a
custom ruleset has been saved somewhere else, add a line to
``/etc/rc.conf`` which specifies the full path to the file:

.. code:: programlisting

    pf_rules="/path/to/pf.conf"

Logging support for PF is provided by
`pflog(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pflog&sektion=4>`__.
To enable logging support, add this line to ``/etc/rc.conf``:

.. code:: programlisting

    pflog_enable="YES"

The following lines can also be added in order to change the default
location of the log file or to specify any additional flags to pass to
`pflog(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pflog&sektion=4>`__
when it is started:

.. code:: programlisting

    pflog_logfile="/var/log/pflog"  # where pflogd should store the logfile
    pflog_flags=""                  # additional flags for pflogd startup

Finally, if there is a LAN behind the firewall and packets need to be
forwarded for the computers on the LAN, or NAT is required, add the
following option:

.. code:: programlisting

    gateway_enable="YES"            # Enable as LAN gateway

After saving the needed edits, PF can be started with logging support by
typing:

.. code:: screen

    # service pf start
    # service pflog start

By default, PF reads its configuration rules from ``/etc/pf.conf`` and
modifies, drops, or passes packets according to the rules or definitions
specified in this file. The FreeBSD installation includes several sample
files located in ``/usr/share/examples/pf/``. Refer to the `PF
FAQ <http://www.openbsd.org/faq/pf/>`__ for complete coverage of PF
rulesets.

To control PF, use ``pfctl``. `Table?30.1, “Useful ``pfctl``
Options” <firewalls-pf.html#pfctl>`__ summarizes some useful options to
this command. Refer to
`pfctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pfctl&sektion=8>`__
for a description of all available options:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?30.1.?Useful ``pfctl`` Options

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------------------------------+------------------------------------------------------------------------------+
| Command                                        | Purpose                                                                      |
+================================================+==============================================================================+
| ``pfctl           -e``                         | Enable PF.                                                                   |
+------------------------------------------------+------------------------------------------------------------------------------+
| ``pfctl           -d``                         | Disable PF.                                                                  |
+------------------------------------------------+------------------------------------------------------------------------------+
| ``pfctl -F all           -f /etc/pf.conf``     | Flush all NAT, filter, state, and table rules and reload ``/etc/pf.conf``.   |
+------------------------------------------------+------------------------------------------------------------------------------+
| ``pfctl -s [ rules | nat           state ]``   | Report on the filter rules, NAT rules, or state table.                       |
+------------------------------------------------+------------------------------------------------------------------------------+
| ``pfctl -vnf           /etc/pf.conf``          | Check ``/etc/pf.conf`` for errors, but do not load ruleset.                  |
+------------------------------------------------+------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

`security/sudo <http://www.freebsd.org/cgi/url.cgi?ports/security/sudo/pkg-descr>`__
is useful for running commands like ``pfctl`` that require elevated
privileges. It can be installed from the Ports Collection.

.. raw:: html

   </div>

To keep an eye on the traffic that passes through the PF firewall,
consider installing the
`sysutils/pftop <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/pftop/pkg-descr>`__
package or port. Once installed, pftop can be run to view a running
snapshot of traffic in a format which is similar to
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__.

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

30.3.2.?Enabling ALTQ
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

On FreeBSD, ALTQ can be used with PF to provide Quality of Service
(QOS). Once ALTQ is enabled, queues can be defined in the ruleset which
determine the processing priority of outbound packets.

Before enabling ALTQ, refer to
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__ to
determine if the drivers for the network cards installed on the system
support it.

ALTQ is not available as a loadable kernel module. If the system's
interfaces support ALTQ, create a custom kernel using the instructions
in `Chapter?9, *Configuring the FreeBSD Kernel* <kernelconfig.html>`__.
The following kernel options are available. The first is needed to
enable ALTQ. At least one of the other options is necessary to specify
the queueing scheduler algorithm:

.. code:: programlisting

    options         ALTQ
    options         ALTQ_CBQ        # Class Based Queuing (CBQ)
    options         ALTQ_RED        # Random Early Detection (RED)
    options         ALTQ_RIO        # RED In/Out
    options         ALTQ_HFSC       # Hierarchical Packet Scheduler (HFSC)
    options         ALTQ_PRIQ       # Priority Queuing (PRIQ)

The following scheduler algorithms are available:

.. raw:: html

   <div class="variablelist">

CBQ
    Class Based Queuing (CBQ) is used to divide a connection's bandwidth
    into different classes or queues to prioritize traffic based on
    filter rules.

RED
    Random Early Detection (RED) is used to avoid network congestion by
    measuring the length of the queue and comparing it to the minimum
    and maximum thresholds for the queue. When the queue is over the
    maximum, all new packets are randomly dropped.

RIO
    In Random Early Detection In and Out (RIO) mode, RED maintains
    multiple average queue lengths and multiple threshold values, one
    for each QOS level.

HFSC
    Hierarchical Fair Service Curve Packet Scheduler (HFSC) is described
    in ``http://www-2.cs.cmu.edu/~hzhang/HFSC/main.html``.

PRIQ
    Priority Queuing (PRIQ) always passes traffic that is in a higher
    queue first.

.. raw:: html

   </div>

More information about the scheduling algorithms and example rulesets
are available at ``http://www.openbsd.org/faq/pf/queueing.html``.

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

30.3.3.?PF Rulesets
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Peter N. M. Hansteen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates how to create a customized ruleset. It starts
with the simplest of rulesets and builds upon its concepts using several
examples to demonstrate real-world usage of PF's many features.

The simplest possible ruleset is for a single machine that does not run
any services and which needs access to one network, which may be the
Internet. To create this minimal ruleset, edit ``/etc/pf.conf`` so it
looks like this:

.. code:: programlisting

    block in all
    pass out all keep state

The first rule denies all incoming traffic by default. The second rule
allows connections created by this system to pass out, while retaining
state information on those connections. This state information allows
return traffic for those connections to pass back and should only be
used on machines that can be trusted. The ruleset can be loaded with:

.. code:: screen

    # pfctl -e ; pfctl -f /etc/pf.conf

In addition to keeping state, PF provides *lists* and *macros* which can
be defined for use when creating rules. Macros can include lists and
need to be defined before use. As an example, insert these lines at the
very top of the ruleset:

.. code:: programlisting

    tcp_services = "{ ssh, smtp, domain, www, pop3, auth, pop3s }"
    udp_services = "{ domain }"

PF understands port names as well as port numbers, as long as the names
are listed in ``/etc/services``. This example creates two macros. The
first is a list of seven TCP port names and the second is one UDP port
name. Once defined, macros can be used in rules. In this example, all
traffic is blocked except for the connections initiated by this system
for the seven specified TCP services and the one specified UDP service:

.. code:: programlisting

    tcp_services = "{ ssh, smtp, domain, www, pop3, auth, pop3s }"
    udp_services = "{ domain }"
    block all
    pass out proto tcp to any port $tcp_services keep state
    pass proto udp to any port $udp_services keep state

Even though UDP is considered to be a stateless protocol, PF is able to
track some state information. For example, when a UDP request is passed
which asks a name server about a domain name, PF will watch for the
response in order to pass it back.

Whenever an edit is made to a ruleset, the new rules must be loaded so
they can be used:

.. code:: screen

    # pfctl -f /etc/pf.conf

If there are no syntax errors, ``pfctl`` will not output any messages
during the rule load. Rules can also be tested before attempting to load
them:

.. code:: screen

    # pfctl -nf /etc/pf.conf

Including ``-n`` causes the rules to be interpreted only, but not
loaded. This provides an opportunity to correct any errors. At all
times, the last valid ruleset loaded will be enforced until either PF is
disabled or a new ruleset is loaded.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Adding ``-v`` to a ``pfctl`` ruleset verify or load will display the
fully parsed rules exactly the way they will be loaded. This is
extremely useful when debugging rules.

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

30.3.3.1.?A Simple Gateway with NAT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates how to configure a FreeBSD system running PF
to act as a gateway for at least one other machine. The gateway needs at
least two network interfaces, each connected to a separate network. In
this example, ``xl1`` is connected to the Internet and ``xl0`` is
connected to the internal network.

First, enable the gateway in order to let the machine forward the
network traffic it receives on one interface to another interface. This
sysctl setting will forward IPv4 packets:

.. code:: screen

    # sysctl net.inet.ip.forwarding=1

To forward IPv6 traffic, use:

.. code:: screen

    # sysctl net.inet6.ip6.forwarding=1

To enable these settings at system boot, add the following to
``/etc/rc.conf``:

.. code:: programlisting

    gateway_enable="YES"      #for ipv4
    ipv6_gateway_enable="YES"   #for ipv6

Verify with ``ifconfig`` that both of the interfaces are up and running.

Next, create the PF rules to allow the gateway to pass traffic. While
the following rule allows stateful traffic to pass from the Internet to
hosts on the network, the ``to`` keyword does not guarantee passage all
the way from source to destination:

.. code:: programlisting

    pass in on xl1 from xl1:network to xl0:network port $ports keep state

That rule only lets the traffic pass in to the gateway on the internal
interface. To let the packets go further, a matching rule is needed:

.. code:: programlisting

    pass out on xl0 from xl1:network to xl0:network port $ports keep state

While these two rules will work, rules this specific are rarely needed.
For a busy network admin, a readable ruleset is a safer ruleset. The
remainder of this section demonstrates how to keep the rules as simple
as possible for readability. For example, those two rules could be
replaced with one rule:

.. code:: programlisting

    pass from xl1:network to any port $ports keep state

The ``interface:network`` notation can be replaced with a macro to make
the ruleset even more readable. For example, a ``$localnet`` macro could
be defined as the network directly attached to the internal interface
(``$xl1:network``). Alternatively, the definition of ``$localnet`` could
be changed to an *IP address/netmask* notation to denote a network, such
as ``192.168.100.1/24`` for a subnet of private addresses.

If required, ``$localnet`` could even be defined as a list of networks.
Whatever the specific needs, a sensible ``$localnet`` definition could
be used in a typical pass rule as follows:

.. code:: programlisting

    pass from $localnet to any port $ports keep state

The following sample ruleset allows all traffic initiated by machines on
the internal network. It first defines two macros to represent the
external and internal 3COM interfaces of the gateway.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

For dialup users, the external interface will use ``tun0``. For an ADSL
connection, specifically those using PPP over Ethernet (PPPoE), the
correct external interface is ``tun0``, not the physical Ethernet
interface.

.. raw:: html

   </div>

.. code:: programlisting

    ext_if = "xl0" # macro for external interface - use tun0 for PPPoE
    int_if = "xl1"  # macro for internal interface
    localnet = $int_if:network
    # ext_if IP address could be dynamic, hence ($ext_if)
    nat on $ext_if from $localnet to any -> ($ext_if)
    block all
    pass from { lo0, $localnet } to any keep state

This ruleset introduces the ``nat`` rule which is used to handle the
network address translation from the non-routable addresses inside the
internal network to the IP address assigned to the external interface.
The parentheses surrounding the last part of the nat rule ``($ext_if)``
is included when the IP address of the external interface is dynamically
assigned. It ensures that network traffic runs without serious
interruptions even if the external IP address changes.

Note that this ruleset probably allows more traffic to pass out of the
network than is needed. One reasonable setup could create this macro:

.. code:: programlisting

    client_out = "{ ftp-data, ftp, ssh, domain, pop3, auth, nntp, http, \
        https, cvspserver, 2628, 5999, 8000, 8080 }"

to use in the main pass rule:

.. code:: programlisting

    pass inet proto tcp from $localnet to any port $client_out \
        flags S/SA keep state

A few other pass rules may be needed. This one enables SSH on the
external interface::

.. code:: programlisting

    pass in inet proto tcp to $ext_if port ssh

This macro definition and rule allows DNS and NTP for internal clients:

.. code:: programlisting

    udp_services = "{ domain, ntp }"
    pass quick inet proto { tcp, udp } to any port $udp_services keep state

Note the ``quick`` keyword in this rule. Since the ruleset consists of
several rules, it is important to understand the relationships between
the rules in a ruleset. Rules are evaluated from top to bottom, in the
sequence they are written. For each packet or connection evaluated by
PF, *the last matching rule* in the ruleset is the one which is applied.
However, when a packet matches a rule which contains the ``quick``
keyword, the rule processing stops and the packet is treated according
to that rule. This is very useful when an exception to the general rules
is needed.

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

30.3.3.2.?Creating an FTP Proxy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuring working FTP rules can be problematic due to the nature of
the FTP protocol. FTP pre-dates firewalls by several decades and is
insecure in its design. The most common points against using FTP
include:

.. raw:: html

   <div class="itemizedlist">

-  Passwords are transferred in the clear.

-  The protocol demands the use of at least two TCP connections (control
   and data) on separate ports.

-  When a session is established, data is communicated using randomly
   selected ports.

.. raw:: html

   </div>

All of these points present security challenges, even before considering
any potential security weaknesses in client or server software. More
secure alternatives for file transfer exist, such as
`sftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sftp&sektion=1>`__ or
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__,
which both feature authentication and data transfer over encrypted
connections..

For those situations when FTP is required, PF provides redirection of
FTP traffic to a small proxy program called
`ftp-proxy(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp-proxy&sektion=8>`__,
which is included in the base system of FreeBSD. The role of the proxy
is to dynamically insert and delete rules in the ruleset, using a set of
anchors, in order to correctly handle FTP traffic.

To enable the FTP proxy, add this line to ``/etc/rc.conf``:

.. code:: programlisting

    ftpproxy_enable="YES"

Then start the proxy by running ``service         ftp-proxy start``.

For a basic configuration, three elements need to be added to
``/etc/pf.conf``. First, the anchors which the proxy will use to insert
the rules it generates for the FTP sessions:

.. code:: programlisting

    nat-anchor "ftp-proxy/*"
    rdr-anchor "ftp-proxy/*"

Second, a pass rule is needed to allow FTP traffic in to the proxy.

Third, redirection and NAT rules need to be defined before the filtering
rules. Insert this ``rdr`` rule immediately after the ``nat`` rule:

.. code:: programlisting

    rdr pass on $int_if proto tcp from any to any port ftp -> 127.0.0.1 port 8021

Finally, allow the redirected traffic to pass:

.. code:: programlisting

    pass out proto tcp from $proxy to any port ftp

where ``$proxy`` expands to the address the proxy daemon is bound to.

Save ``/etc/pf.conf``, load the new rules, and verify from a client that
FTP connections are working:

.. code:: screen

    # pfctl -f /etc/pf.conf

This example covers a basic setup where the clients in the local network
need to contact FTP servers elsewhere. This basic configuration should
work well with most combinations of FTP clients and servers. As shown in
`ftp-proxy(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp-proxy&sektion=8>`__,
the proxy's behavior can be changed in various ways by adding options to
the ``ftpproxy_flags=`` line. Some clients or servers may have specific
quirks that must be compensated for in the configuration, or there may
be a need to integrate the proxy in specific ways such as assigning FTP
traffic to a specific queue.

For ways to run an FTP server protected by PF and
`ftp-proxy(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp-proxy&sektion=8>`__,
configure a separate ``ftp-proxy`` in reverse mode, using ``-R``, on a
separate port with its own redirecting pass rule.

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

30.3.3.3.?Managing ICMP
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many of the tools used for debugging or troubleshooting a TCP/IP network
rely on the Internet Control Message Protocol (ICMP), which was designed
specifically with debugging in mind.

The ICMP protocol sends and receives *control messages* between hosts
and gateways, mainly to provide feedback to a sender about any unusual
or difficult conditions enroute to the target host. Routers use ICMP to
negotiate packet sizes and other transmission parameters in a process
often referred to as *path MTU discovery*.

From a firewall perspective, some ICMP control messages are vulnerable
to known attack vectors. Also, letting all diagnostic traffic pass
unconditionally makes debugging easier, but it also makes it easier for
others to extract information about the network. For these reasons, the
following rule may not be optimal:

.. code:: programlisting

    pass inet proto icmp from any to any

One solution is to let all ICMP traffic from the local network through
while stopping all probes from outside the network:

.. code:: programlisting

    pass inet proto icmp from $localnet to any keep state
    pass inet proto icmp from any to $ext_if keep state

Additional options are available which demonstrate some of PF's
flexibility. For example, rather than allowing all ICMP messages, one
can specify the messages used by
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
and
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__.
Start by defining a macro for that type of message:

.. code:: programlisting

    icmp_types = "echoreq"

and a rule which uses the macro:

.. code:: programlisting

    pass inet proto icmp all icmp-type $icmp_types keep state

If other types of ICMP packets are needed, expand ``icmp_types`` to a
list of those packet types. Type
``more         /usr/src/contrib/pf/pfctl/pfctl_parser.c`` to see the
list of ICMP message types supported by PF. Refer to
http://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
for an explanation of each message type.

Since Unix ``traceroute`` uses UDP by default, another rule is needed to
allow Unix ``traceroute``:

.. code:: programlisting

    # allow out the default range for traceroute(8):
    pass out on $ext_if inet proto udp from any to any port 33433 >< 33626 keep state

Since ``TRACERT.EXE`` on Microsoft Windows systems uses ICMP echo
request messages, only the first rule is needed to allow network traces
from those systems. Unix ``traceroute`` can be instructed to use other
protocols as well, and will use ICMP echo request messages if ``-I`` is
used. Check the
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__
man page for details.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.3.3.3.1.?Path MTU Discovery
''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Internet protocols are designed to be device independent, and one
consequence of device independence is that the optimal packet size for a
given connection cannot always be predicted reliably. The main
constraint on packet size is the *Maximum Transmission Unit* (MTU) which
sets the upper limit on the packet size for an interface. Type
``ifconfig`` to view the MTUs for a system's network interfaces.

TCP/IP uses a process known as path MTU discovery to determine the right
packet size for a connection. This process sends packets of varying
sizes with the “Do not fragment” flag set, expecting an ICMP return
packet of “type 3, code 4” when the upper limit has been reached. Type 3
means “destination unreachable”, and code 4 is short for “fragmentation
needed, but the do-not-fragment flag is set”. To allow path MTU
discovery in order to support connections to other MTUs, add the
``destination unreachable`` type to the ``icmp_types`` macro:

.. code:: programlisting

    icmp_types = "{ echoreq, unreach }"

Since the pass rule already uses that macro, it does not need to be
modified in order to support the new ICMP type:

.. code:: programlisting

    pass inet proto icmp all icmp-type $icmp_types keep state

PF allows filtering on all variations of ICMP types and codes. The list
of possible types and codes are documented in
`icmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=icmp&sektion=4>`__
and
`icmp6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=icmp6&sektion=4>`__.

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

30.3.3.4.?Using Tables
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some types of data are relevant to filtering and redirection at a given
time, but their definition is too long to be included in the ruleset
file. PF supports the use of tables, which are defined lists that can be
manipulated without needing to reload the entire ruleset, and which can
provide fast lookups. Table names are always enclosed within ``< >``,
like this:

.. code:: programlisting

    table <clients> { 192.168.2.0/24, !192.168.2.5 }

In this example, the ``192.168.2.0/24`` network is part of the table,
except for the address ``192.168.2.5``, which is excluded using the
``!`` operator. It is also possible to load tables from files where each
item is on a separate line, as seen in this example ``/etc/clients``:

.. code:: programlisting

    192.168.2.0/24
    !192.168.2.5

To refer to the file, define the table like this:

.. code:: programlisting

    table <clients> persist file "/etc/clients"

Once the table is defined, it can be referenced by a rule:

.. code:: programlisting

    pass inet proto tcp from <clients> to any port $client_out flags S/SA keep state

A table's contents can be manipulated live, using ``pfctl``. This
example adds another network to the table:

.. code:: screen

    # pfctl -t clients -T add 192.168.1.0/16

Note that any changes made this way will take affect now, making them
ideal for testing, but will not survive a power failure or reboot. To
make the changes permanent, modify the definition of the table in the
ruleset or edit the file that the table refers to. One can maintain the
on-disk copy of the table using a
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
job which dumps the table's contents to disk at regular intervals, using
a command such as ``pfctl -t clients -T show         >/etc/clients``.
Alternatively, ``/etc/clients`` can be updated with the in-memory table
contents:

.. code:: screen

    # pfctl -t clients -T replace -f /etc/clients

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

30.3.3.5.?Using Overload Tables to Protect SSH
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Those who run SSH on an external interface have probably seen something
like this in the authentication logs:

.. code:: programlisting

    Sep 26 03:12:34 skapet sshd[25771]: Failed password for root from 200.72.41.31 port 40992 ssh2
    Sep 26 03:12:34 skapet sshd[5279]: Failed password for root from 200.72.41.31 port 40992 ssh2
    Sep 26 03:12:35 skapet sshd[5279]: Received disconnect from 200.72.41.31: 11: Bye Bye
    Sep 26 03:12:44 skapet sshd[29635]: Invalid user admin from 200.72.41.31
    Sep 26 03:12:44 skapet sshd[24703]: input_userauth_request: invalid user admin
    Sep 26 03:12:44 skapet sshd[24703]: Failed password for invalid user admin from 200.72.41.31 port 41484 ssh2

This is indicative of a brute force attack where somebody or some
program is trying to discover the user name and password which will let
them into the system.

If external SSH access is needed for legitimate users, changing the
default port used by SSH can offer some protection. However, PF provides
a more elegant solution. Pass rules can contain limits on what
connecting hosts can do and violators can be banished to a table of
addresses which are denied some or all access. It is even possible to
drop all existing connections from machines which overreach the limits.

To configure this, create this table in the tables section of the
ruleset:

.. code:: programlisting

    table <bruteforce> persist

Then, somewhere early in the ruleset, add rules to block brute access
while allowing legitimate access:

.. code:: programlisting

    block quick from <bruteforce>
    pass inet proto tcp from any to $localnet port $tcp_services \
        flags S/SA keep state \
        (max-src-conn 100, max-src-conn-rate 15/5, \
        overload <bruteforce> flush global)

The part in parentheses defines the limits and the numbers should be
changed to meet local requirements. It can be read as follows:

``max-src-conn`` is the number of simultaneous connections allowed from
one host.

``max-src-conn-rate`` is the rate of new connections allowed from any
single host (*``15``*) per number of seconds (*``5``*).

``overload <bruteforce>`` means that any host which exceeds these limits
gets its address added to the ``bruteforce`` table. The ruleset blocks
all traffic from addresses in the ``bruteforce`` table.

Finally, ``flush global`` says that when a host reaches the limit, that
all (``global``) of that host's connections will be terminated
(``flush``).

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

These rules will *not* block slow bruteforcers, as described in
http://home.nuug.no/~peter/hailmary2013/.

.. raw:: html

   </div>

This example ruleset is intended mainly as an illustration. For example,
if a generous number of connections in general are wanted, but the
desire is to be more restrictive when it comes to ssh, supplement the
rule above with something like the one below, early on in the rule set:

.. code:: programlisting

    pass quick proto { tcp, udp } from any to any port ssh \
        flags S/SA keep state \
        (max-src-conn 15, max-src-conn-rate 5/3, \
        overload <bruteforce> flush global)

.. raw:: html

   <div class="note" xmlns="">

It May Not be Necessary to Block All Overloaders:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is worth noting that the overload mechanism is a general technique
which does not apply exclusively to SSH, and it is not always optimal to
entirely block all traffic from offenders.

For example, an overload rule could be used to protect a mail service or
a web service, and the overload table could be used in a rule to assign
offenders to a queue with a minimal bandwidth allocation or to redirect
to a specific web page.

.. raw:: html

   </div>

Over time, tables will be filled by overload rules and their size will
grow incrementally, taking up more memory. Sometimes an IP address that
is blocked is a dynamically assigned one, which has since been assigned
to a host who has a legitimate reason to communicate with hosts in the
local network.

For situations like these, pfctl provides the ability to expire table
entries. For example, this command will remove ``<bruteforce>`` table
entries which have not been referenced for ``86400`` seconds:

.. code:: screen

    # pfctl -t bruteforce -T expire 86400

Similar functionality is provided by
`security/expiretable <http://www.freebsd.org/cgi/url.cgi?ports/security/expiretable/pkg-descr>`__,
which removes table entries which have not been accessed for a specified
period of time.

Once installed, expiretable can be run to remove ``<bruteforce>`` table
entries older than a specified age. This example removes all entries
older than 24 hours:

.. code:: programlisting

    /usr/local/sbin/expiretable -v -d -t 24h bruteforce

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

30.3.3.6.?Protecting Against SPAM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Not to be confused with the spamd daemon which comes bundled with
spamassassin,
`mail/spamd <http://www.freebsd.org/cgi/url.cgi?ports/mail/spamd/pkg-descr>`__
can be configured with PF to provide an outer defense against SPAM. This
spamd hooks into the PF configuration using a set of redirections.

Spammers tend to send a large number of messages, and SPAM is mainly
sent from a few spammer friendly networks and a large number of hijacked
machines, both of which are reported to *blacklists* fairly quickly.

When an SMTP connection from an address in a blacklist is received,
spamd presents its banner and immediately switches to a mode where it
answers SMTP traffic one byte at a time. This technique, which is
intended to waste as much time as possible on the spammer's end, is
called *tarpitting*. The specific implementation which uses one byte
SMTP replies is often referred to as *stuttering*.

This example demonstrates the basic procedure for setting up spamd with
automatically updated blacklists. Refer to the man pages which are
installed with
`mail/spamd <http://www.freebsd.org/cgi/url.cgi?ports/mail/spamd/pkg-descr>`__
for more information.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?30.1.?Configuring spamd

.. raw:: html

   </div>

#. Install the
   `mail/spamd <http://www.freebsd.org/cgi/url.cgi?ports/mail/spamd/pkg-descr>`__
   package or port. In order to use spamd's greylisting features,
   `fdescfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fdescfs&sektion=5>`__
   must be mounted at ``/dev/fd``. Add the following line to
   ``/etc/fstab``:

   .. code:: programlisting

        fdescfs /dev/fd fdescfs rw 0 0

   Then, mount the filesystem:

   .. code:: programlisting

       # mount fdescfs

#. Next, edit the PF ruleset to include:

   .. code:: programlisting

       table <spamd> persist
       table <spamd-white> persist
       rdr pass on $ext_if inet proto tcp from <spamd> to \
           { $ext_if, $localnet } port smtp -> 127.0.0.1 port 8025
       rdr pass on $ext_if inet proto tcp from !<spamd-white> to \
           { $ext_if, $localnet } port smtp -> 127.0.0.1 port 8025

   The two tables ``<spamd>`` and ``<spamd-white>`` are essential. SMTP
   traffic from an address listed in\ `` <spamd>`` but not in
   ``<spamd-white>`` is redirected to the spamd daemon listening at port
   8025.

#. The next step is to configure spamd in ``/usr/local/etc/spamd.conf``
   and to add some ``rc.conf`` parameters.

   The installation of
   `mail/spamd <http://www.freebsd.org/cgi/url.cgi?ports/mail/spamd/pkg-descr>`__
   includes a sample configuration file
   (``/usr/local/etc/spamd.conf.sample``) and a man page for
   ``spamd.conf``. Refer to these for additional configuration options
   beyond those shown in this example.

   One of the first lines in the configuration file that does not begin
   with a ``#`` comment sign contains the block which defines the
   ``all`` list, which specifies the lists to use:

   .. code:: programlisting

       all:\
           :traplist:whitelist:

   This entry adds the desired blacklists, separated by colons (``:``).
   To use a whitelist to subtract addresses from a blacklist, add the
   name of the whitelist *immediately* after the name of that blacklist.
   For example: ``:blacklist:whitelist:``.

   This is followed by the specified blacklist's definition:

   .. code:: programlisting

       traplist:\
           :black:\
           :msg="SPAM. Your address %A has sent spam within the last 24 hours":\
           :method=http:\
           :file=www.openbsd.org/spamd/traplist.gz

   where the first line is the name of the blacklist and the second line
   specifies the list type. The ``msg`` field contains the message to
   display to blacklisted senders during the SMTP dialogue. The
   ``method`` field specifies how spamd-setup fetches the list data;
   supported methods are ``http``, ``ftp``, from a ``file`` in a mounted
   file system, and via ``exec`` of an external program. Finally, the
   ``file`` field specifies the name of the file spamd expects to
   receive.

   The definition of the specified whitelist is similar, but omits the
   ``msg`` field since a message is not needed:

   .. code:: programlisting

       whitelist:\
           :white:\
           :method=file:\
           :file=/var/mail/whitelist.txt

   .. raw:: html

      <div class="tip" xmlns="">

   Choose Data Sources with Care:
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Using all the blacklists in the sample ``spamd.conf`` will blacklist
   large blocks of the Internet. Administrators need to edit the file to
   create an optimal configuration which uses applicable data sources
   and, when necessary, uses custom lists.

   .. raw:: html

      </div>

   Next, add this entry to ``/etc/rc.conf``. Additional flags are
   described in the man page specified by the comment:

   .. code:: programlisting

       spamd_flags="-v" # use "" and see spamd-setup(8) for flags

   When finished, reload the ruleset, start spamd by typing
   ``service start obspamd``, and complete the configuration using
   ``spamd-setup``. Finally, create a
   `cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
   job which calls ``spamd-setup`` to update the tables at reasonable
   intervals.

.. raw:: html

   </div>

On a typical gateway in front of a mail server, hosts will soon start
getting trapped within a few seconds to several minutes.

PF also supports *greylisting*, which temporarily rejects messages from
unknown hosts with *``45n``* codes. Messages from greylisted hosts which
try again within a reasonable time are let through. Traffic from senders
which are set up to behave within the limits set by RFC 1123 and RFC
2821 are immediately let through.

More information about greylisting as a technique can be found at the
`greylisting.org <http://www.greylisting.org/>`__ web site. The most
amazing thing about greylisting, apart from its simplicity, is that it
still works. Spammers and malware writers have been very slow to adapt
in order to bypass this technique.

The basic procedure for configuring greylisting is as follows:

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?30.2.?Configuring Greylisting

.. raw:: html

   </div>

#. Make sure that
   `fdescfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fdescfs&sektion=5>`__
   is mounted as described in Step 1 of the previous Procedure.

#. To run spamd in greylisting mode, add this line to ``/etc/rc.conf``:

   .. code:: programlisting

       spamd_grey="YES"  # use spamd greylisting if YES

   Refer to the spamd man page for descriptions of additional related
   parameters.

#. To complete the greylisting setup:

   .. code:: programlisting

       # service restart obspamd
       # service start spamlogd

.. raw:: html

   </div>

Behind the scenes, the spamdb database tool and the spamlogd whitelist
updater perform essential functions for the greylisting feature. spamdb
is the administrator's main interface to managing the black, grey, and
white lists via the contents of the ``/var/db/spamdb`` database.

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

30.3.3.7.?Network Hygiene
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how ``block-policy``, ``scrub``, and
``antispoof`` can be used to make the ruleset behave sanely.

The ``block-policy`` is an option which can be set in the ``options``
part of the ruleset, which precedes the redirection and filtering rules.
This option determines which feedback, if any, PF sends to hosts that
are blocked by a rule. The option has two possible values: ``drop``
drops blocked packets with no feedback, and ``return`` returns a status
code such as ``Connection refused``.

If not set, the default policy is ``drop``. To change the
``block-policy``, specify the desired value:

.. code:: programlisting

    set block-policy return

In PF, ``scrub`` is a keyword which enables network packet
normalization. This process reassembles fragmented packets and drops TCP
packets that have invalid flag combinations. Enabling ``scrub`` provides
a measure of protection against certain kinds of attacks based on
incorrect handling of packet fragments. A number of options are
available, but the simplest form is suitable for most configurations:

.. code:: programlisting

    scrub in all

Some services, such as NFS, require specific fragment handling options.
Refer to http://www.openbsd.gr/faq/pf/scrub.html for more information.

This example reassembles fragments, clears the “do not fragment” bit,
and sets the maximum segment size to 1440 bytes:

.. code:: programlisting

    scrub in all fragment reassemble no-df max-mss 1440

The ``antispoof`` mechanism protects against activity from spoofed or
forged IP addresses, mainly by blocking packets appearing on interfaces
and in directions which are logically not possible.

These rules weed out spoofed traffic coming in from the rest of the
world as well as any spoofed packets which originate in the local
network:

.. code:: programlisting

    antispoof for $ext_if
    antispoof for $int_if

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

30.3.3.8.?Handling Non-Routable Addresses
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Even with a properly configured gateway to handle network address
translation, one may have to compensate for other people's
misconfigurations. A common misconfiguration is to let traffic with
non-routable addresses out to the Internet. Since traffic from
non-routeable addresses can play a part in several DoS attack
techniques, consider explicitly blocking traffic from non-routeable
addresses from entering the network through the external interface.

In this example, a macro containing non-routable addresses is defined,
then used in blocking rules. Traffic to and from these addresses is
quietly dropped on the gateway's external interface.

.. code:: programlisting

    martians = "{ 127.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12, \
              10.0.0.0/8, 169.254.0.0/16, 192.0.2.0/24, \
              0.0.0.0/8, 240.0.0.0/4 }"

    block drop in quick on $ext_if from $martians to any
    block drop out quick on $ext_if from any to $martians

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+-------------------------------------+
| `Prev <firewalls-concepts.html>`__?   | `Up <firewalls.html>`__   | ?\ `Next <firewalls-ipfw.html>`__   |
+---------------------------------------+---------------------------+-------------------------------------+
| 30.2.?Firewall Concepts?              | `Home <index.html>`__     | ?30.4.?IPFW                         |
+---------------------------------------+---------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
