===========================
5.?Configuring The Firewall
===========================

.. raw:: html

   <div class="navheader">

5.?Configuring The Firewall
`Prev <filtering-bridges-enabling.html>`__?
?
?\ `Next <filtering-bridges-contributors.html>`__

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

5.?Configuring The Firewall
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now it is time to create your own file with custom firewall rules, in
order to secure the inside network. There will be some complication in
doing this because not all of the firewall functionalities are available
on bridged packets. Furthermore, there is a difference between the
packets that are in the process of being forwarded and packets that are
being received by the local machine. In general, incoming packets are
run through the firewall only once, not twice as is normally the case;
in fact they are filtered only upon receipt, so rules that use ``out``
or ``xmit`` will never match. Personally, I use ``in via`` which is an
older syntax, but one that has a sense when you read it. Another
limitation is that you are restricted to use only ``pass`` or ``drop``
commands for packets filtered by a bridge. Sophisticated things like
``divert``, ``forward`` or ``reject`` are not available. Such options
can still be used, but only on traffic to or from the bridge machine
itself (if it has an IP address).

New in FreeBSD 4.0, is the concept of stateful filtering. This is a big
improvement for UDP traffic, which typically is a request going out,
followed shortly thereafter by a response with the exact same set of IP
addresses and port numbers (but with source and destination reversed, of
course). For firewalls that have no statekeeping, there is almost no way
to deal with this sort of traffic as a single session. But with a
firewall that can “remember” an outgoing UDP packet and, for the next
few minutes, allow a response, handling UDP services is trivial. The
following example shows how to do it. It is possible to do the same
thing with TCP packets. This allows you to avoid some denial of service
attacks and other nasty tricks, but it also typically makes your state
table grow quickly in size.

Let's look at an example setup. Note first that at the top of
``/etc/rc.firewall`` there are already standard rules for the loopback
interface ``lo0``, so we should not have to care for them anymore.
Custom rules should be put in a separate file (say
``/etc/rc.firewall.local``) and loaded at system startup, by modifying
the row of ``/etc/rc.conf`` where we defined the ``open`` firewall:

.. code:: programlisting

    firewall_type="/etc/rc.firewall.local"

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

You have to specify the *full* path, otherwise it will not be loaded
with the risk to remain isolated from the network.

.. raw:: html

   </div>

For our example imagine to have the ``fxp0`` interface connected towards
the outside (Internet) and the ``xl0`` towards the inside (LAN). The
bridge machine has the IP ``1.2.3.4`` (it is not possible that your ISP
can give you an address quite like this, but for our example it is
good).

.. code:: programlisting

    # Things that we have kept state on before get to go through in a hurry
    add check-state

    # Throw away RFC 1918 networks
    add drop all from 10.0.0.0/8 to any in via fxp0
    add drop all from 172.16.0.0/12 to any in via fxp0
    add drop all from 192.168.0.0/16 to any in via fxp0

    # Allow the bridge machine to say anything it wants
    # (if the machine is IP-less do not include these rows)
    add pass tcp from 1.2.3.4 to any setup keep-state
    add pass udp from 1.2.3.4 to any keep-state
    add pass ip from 1.2.3.4 to any

    # Allow the inside hosts to say anything they want
    add pass tcp from any to any in via xl0 setup keep-state
    add pass udp from any to any in via xl0 keep-state
    add pass ip from any to any in via xl0

    # TCP section
    # Allow SSH
    add pass tcp from any to any 22 in via fxp0 setup keep-state
    # Allow SMTP only towards the mail server
    add pass tcp from any to relay 25 in via fxp0 setup keep-state
    # Allow zone transfers only by the slave name server [dns2.nic.it]
    add pass tcp from 193.205.245.8 to ns 53 in via fxp0 setup keep-state
    # Pass ident probes.  It is better than waiting for them to timeout
    add pass tcp from any to any 113 in via fxp0 setup keep-state
    # Pass the "quarantine" range
    add pass tcp from any to any 49152-65535 in via fxp0 setup keep-state

    # UDP section
    # Allow DNS only towards the name server
    add pass udp from any to ns 53 in via fxp0 keep-state
    # Pass the "quarantine" range
    add pass udp from any to any 49152-65535 in via fxp0 keep-state

    # ICMP section
    # Pass 'ping'
    add pass icmp from any to any icmptypes 8 keep-state
    # Pass error messages generated by 'traceroute'
    add pass icmp from any to any icmptypes 3
    add pass icmp from any to any icmptypes 11

    # Everything else is suspect
    add drop log all from any to any

Those of you who have set up firewalls before may notice some things
missing. In particular, there are no anti-spoofing rules, in fact we did
*not* add:

.. code:: programlisting

    add deny all from 1.2.3.4/8 to any in via fxp0

That is, drop packets that are coming in from the outside claiming to be
from our network. This is something that you would commonly do to be
sure that someone does not try to evade the packet filter, by generating
nefarious packets that look like they are from the inside. The problem
with that is that there is *at least* one host on the outside interface
that you do not want to ignore: the router. But usually, the ISP
anti-spoofs at their router, so we do not need to bother that much.

The last rule seems to be an exact duplicate of the default rule, that
is, do not let anything pass that is not specifically allowed. But there
is a difference: all suspected traffic will be logged.

There are two rules for passing SMTP and DNS traffic towards the mail
server and the name server, if you have them. Obviously the whole rule
set should be flavored to personal taste, this is only a specific
example (rule format is described accurately in the
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
man page). Note that in order for “relay” and “ns” to work, name service
lookups must work *before* the bridge is enabled. This is an example of
making sure that you set the IP on the correct network card.
Alternatively it is possible to specify the IP address instead of the
host name (required if the machine is IP-less).

People that are used to setting up firewalls are probably also used to
either having a ``reset`` or a ``forward`` rule for ident packets (TCP
port 113). Unfortunately, this is not an applicable option with the
bridge, so the best thing is to simply pass them to their destination.
As long as that destination machine is not running an ident daemon, this
is relatively harmless. The alternative is dropping connections on port
113, which creates some problems with services like IRC (the ident probe
must timeout).

The only other thing that is a little weird that you may have noticed is
that there is a rule to let the bridge machine speak, and another for
internal hosts. Remember that this is because the two sets of traffic
will take different paths through the kernel and into the packet filter.
The inside net will go through the bridge, while the local machine will
use the normal IP stack to speak. Thus the two rules to handle the
different cases. The ``in via       fxp0`` rules work for both paths. In
general, if you use ``in via`` rules throughout the filter, you will
need to make an exception for locally generated packets, because they
did not come in via any of our interfaces.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------+-----------------------------------------------------+
| `Prev <filtering-bridges-enabling.html>`__?   | ?                       | ?\ `Next <filtering-bridges-contributors.html>`__   |
+-----------------------------------------------+-------------------------+-----------------------------------------------------+
| 4.?Enabling the Bridge?                       | `Home <index.html>`__   | ?6.?Contributors                                    |
+-----------------------------------------------+-------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
