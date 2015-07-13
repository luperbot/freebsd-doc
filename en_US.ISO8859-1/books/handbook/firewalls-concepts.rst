=======================
30.2.?Firewall Concepts
=======================

.. raw:: html

   <div class="navheader">

30.2.?Firewall Concepts
`Prev <firewalls.html>`__?
Chapter?30.?Firewalls
?\ `Next <firewalls-pf.html>`__

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

30.2.?Firewall Concepts
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A ruleset contains a group of rules which pass or block packets based on
the values contained in the packet. The bi-directional exchange of
packets between hosts comprises a session conversation. The firewall
ruleset processes both the packets arriving from the public Internet, as
well as the packets produced by the system as a response to them. Each
TCP/IP service is predefined by its protocol and listening port. Packets
destined for a specific service originate from the source address using
an unprivileged port and target the specific service port on the
destination address. All the above parameters can be used as selection
criteria to create rules which will pass or block services.

To lookup unknown port numbers, refer to ``/etc/services``.
Alternatively, visit
``http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers`` and do
a port number lookup to find the purpose of a particular port number.

Check out this link for port numbers used by Trojans
``http://www.sans.org/security-resources/idfaq/oddports.php``.

FTP has two modes: active mode and passive mode. The difference is in
how the data channel is acquired. Passive mode is more secure as the
data channel is acquired by the ordinal ftp session requester. For a
good explanation of FTP and the different modes, see
``http://www.slacksite.com/other/ftp.html``.

A firewall ruleset can be either “exclusive” or “inclusive”. An
exclusive firewall allows all traffic through except for the traffic
matching the ruleset. An inclusive firewall does the reverse as it only
allows traffic matching the rules through and blocks everything else.

An inclusive firewall offers better control of the outgoing traffic,
making it a better choice for systems that offer services to the public
Internet. It also controls the type of traffic originating from the
public Internet that can gain access to a private network. All traffic
that does not match the rules is blocked and logged. Inclusive firewalls
are generally safer than exclusive firewalls because they significantly
reduce the risk of allowing unwanted traffic.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Unless noted otherwise, all configuration and example rulesets in this
chapter create inclusive firewall rulesets.

.. raw:: html

   </div>

Security can be tightened further using a “stateful firewall”. This type
of firewall keeps track of open connections and only allows traffic
which either matches an existing connection or opens a new, allowed
connection.

Stateful filtering treats traffic as a bi-directional exchange of
packets comprising a session. When state is specified on a matching rule
the firewall dynamically generates internal rules for each anticipated
packet being exchanged during the session. It has sufficient matching
capabilities to determine if a packet is valid for a session. Any
packets that do not properly fit the session template are automatically
rejected.

When the session completes, it is removed from the dynamic state table.

Stateful filtering allows one to focus on blocking/passing new sessions.
If the new session is passed, all its subsequent packets are allowed
automatically and any impostor packets are automatically rejected. If a
new session is blocked, none of its subsequent packets are allowed.
Stateful filtering provides advanced matching abilities capable of
defending against the flood of different attack methods employed by
attackers.

NAT stands for *Network Address Translation*. NAT function enables the
private LAN behind the firewall to share a single ISP-assigned IP
address, even if that address is dynamically assigned. NAT allows each
computer in the LAN to have Internet access, without having to pay the
ISP for multiple Internet accounts or IP addresses.

NAT will automatically translate the private LAN IP address for each
system on the LAN to the single public IP address as packets exit the
firewall bound for the public Internet. It also performs the reverse
translation for returning packets.

According to RFC 1918, the following IP address ranges are reserved for
private networks which will never be routed directly to the public
Internet, and therefore are available for use with NAT:

.. raw:: html

   <div class="itemizedlist">

-  ``10.0.0.0/8``.

-  ``172.16.0.0/12``.

-  ``192.168.0.0/16``.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

When working with the firewall rules, be *very careful*. Some
configurations *can lock the administrator out* of the server. To be on
the safe side, consider performing the initial firewall configuration
from the local console rather than doing it remotely over ssh.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+-----------------------------------+
| `Prev <firewalls.html>`__?   | `Up <firewalls.html>`__   | ?\ `Next <firewalls-pf.html>`__   |
+------------------------------+---------------------------+-----------------------------------+
| Chapter?30.?Firewalls?       | `Home <index.html>`__     | ?30.3.?PF                         |
+------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
