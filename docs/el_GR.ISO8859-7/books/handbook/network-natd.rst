=================================
31.8. Network Address Translation
=================================

.. raw:: html

   <div class="navheader">

31.8. Network Address Translation
`????? <network-isdn.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-plip.html>`__

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

31.8. Network Address Translation
---------------------------------

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

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.8.1. Overview
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD's Network Address Translation daemon, commonly known as
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ is
a daemon that accepts incoming raw IP packets, changes the source to the
local machine and re-injects these packets back into the outgoing IP
packet stream.
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
does this by changing the source IP address and port such that when data
is received back, it is able to determine the original location of the
data and forward it back to its original requester.

The most common use of NAT is to perform what is commonly known as
Internet Connection Sharing.

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

31.8.2. Setup
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Due to the diminishing IP space in IPv4, and the increased number of
users on high-speed consumer lines such as cable or DSL, people are
increasingly in need of an Internet Connection Sharing solution. The
ability to connect several computers online through one connection and
IP address makes
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ a
reasonable choice.

Most commonly, a user has a machine connected to a cable or DSL line
with one IP address and wishes to use this one connected computer to
provide Internet access to several more over a LAN.

To do this, the FreeBSD machine on the Internet must act as a gateway.
This gateway machine must have two NICs-one for connecting to the
Internet router, the other connecting to a LAN. All the machines on the
LAN are connected through a hub or switch.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

There are many ways to get a LAN connected to the Internet through a
FreeBSD gateway. This example will only cover a gateway with at least
two NICs.

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|Network Layout|

.. raw:: html

   </div>

A setup like this is commonly used to share an Internet connection. One
of the LAN machines is connected to the Internet. The rest of the
machines access the Internet through that ?gateway? machine.

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

31.8.3. Configuration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following options must be in the kernel configuration file:

.. code:: programlisting

    options IPFIREWALL
    options IPDIVERT

Additionally, at choice, the following may also be suitable:

.. code:: programlisting

    options IPFIREWALL_DEFAULT_TO_ACCEPT
    options IPFIREWALL_VERBOSE

The following must be in ``/etc/rc.conf``:

.. code:: programlisting

    gateway_enable="YES" 
    firewall_enable="YES" 
    firewall_type="OPEN" 
    natd_enable="YES"
    natd_interface="fxp0" 
    natd_flags="" 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-natd-gateway-enable>`__    | Sets up the machine to act as a      |
|                                      | gateway. Running                     |
|                                      | ``sysctl net.inet.ip.forwarding=1``  |
|                                      | would have the same effect.          |
+--------------------------------------+--------------------------------------+
| `|2| <#co-natd-firewall-enable>`__   | Enables the firewall rules in        |
|                                      | ``/etc/rc.firewall`` at boot.        |
+--------------------------------------+--------------------------------------+
| `|3| <#co-natd-firewall-type>`__     | This specifies a predefined firewall |
|                                      | ruleset that allows anything in. See |
|                                      | ``/etc/rc.firewall`` for additional  |
|                                      | types.                               |
+--------------------------------------+--------------------------------------+
| `|4| <#co-natd-natd-interface>`__    | Indicates which interface to forward |
|                                      | packets through (the interface       |
|                                      | connected to the Internet).          |
+--------------------------------------+--------------------------------------+
| `|5| <#co-natd-natd-flags>`__        | Any additional configuration options |
|                                      | passed to                            |
|                                      | `natd(8) <http://www.FreeBSD.org/cgi |
|                                      | /man.cgi?query=natd&sektion=8>`__    |
|                                      | on boot.                             |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Having the previous options defined in ``/etc/rc.conf`` would run
``natd -interface fxp0`` at boot. This can also be run manually.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

It is also possible to use a configuration file for
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
when there are too many options to pass. In this case, the configuration
file must be defined by adding the following line to ``/etc/rc.conf``:

.. code:: programlisting

    natd_flags="-f /etc/natd.conf"

The ``/etc/natd.conf`` file will contain a list of configuration
options, one per line. For example the next section case would use the
following file:

.. code:: programlisting

    redirect_port tcp 192.168.0.2:6667 6667
    redirect_port tcp 192.168.0.3:80 80

For more information about the configuration file, consult the
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
manual page about the ``-f`` option.

.. raw:: html

   </div>

Each machine and interface behind the LAN should be assigned IP address
numbers in the private network space as defined by `RFC
1918 <ftp://ftp.isi.edu/in-notes/rfc1918.txt>`__ and have a default
gateway of the natd machine's internal IP address.

For example, client ``A`` and ``B`` behind the LAN have IP addresses of
``192.168.0.2`` and ``192.168.0.3``, while the natd machine's LAN
interface has an IP address of ``192.168.0.1``. Client ``A`` and ``B``'s
default gateway must be set to that of the natd machine,
``192.168.0.1``. The natd machine's external, or Internet interface does
not require any special modification for
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ to
work.

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

31.8.4. Port Redirection
~~~~~~~~~~~~~~~~~~~~~~~~

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
to redirect selected Internet ports on the natd machine to a LAN client.

For example, an IRC server runs on client ``A``, and a web server runs
on client ``B``. For this to work properly, connections received on
ports 6667 (IRC) and 80 (web) must be redirected to the respective
machines.

The ``-redirect_port`` must be passed to
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
with the proper options. The syntax is as follows:

.. code:: programlisting

         -redirect_port proto targetIP:targetPORT[-targetPORT]
                     [aliasIP:]aliasPORT[-aliasPORT]
                     [remoteIP[:remotePORT[-remotePORT]]]

In the above example, the argument should be:

.. code:: programlisting

        -redirect_port tcp 192.168.0.2:6667 6667
        -redirect_port tcp 192.168.0.3:80 80

This will redirect the proper *tcp* ports to the LAN client machines.

The ``-redirect_port`` argument can be used to indicate port ranges over
individual ports. For example,
*``tcp         192.168.0.2:2000-3000 2000-3000``* would redirect all
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

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.8.5. Address Redirection
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Address redirection is useful if several IP addresses are available, yet
they must be on one machine. With this,
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
can assign each LAN client its own external IP address.
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
then rewrites outgoing packets from the LAN clients with the proper
external IP address and redirects all traffic incoming on that
particular IP address back to the specific LAN client. This is also
known as static NAT. For example, the IP addresses ``128.1.1.1``,
``128.1.1.2``, and ``128.1.1.3`` belong to the natd gateway machine.
``128.1.1.1`` can be used as the natd gateway machine's external IP
address, while ``128.1.1.2`` and ``128.1.1.3`` are forwarded back to LAN
clients ``A`` and ``B``.

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

Like ``-redirect_port``, these arguments are also placed within the
``natd_flags=""`` option of ``/etc/rc.conf``, or passed via a
configuration file. With address redirection, there is no need for port
redirection since all data received on a particular IP address is
redirected.

The external IP addresses on the natd machine must be active and aliased
to the external interface. Look at
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
to do so.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------------+--------------------------------------+
| `????? <network-isdn.html>`__?   | `???? <advanced-networking.html>`__   | ?\ `??????? <network-plip.html>`__   |
+----------------------------------+---------------------------------------+--------------------------------------+
| 31.7. ISDN?                      | `???? <index.html>`__                 | ?31.9. Parallel Line IP (PLIP)       |
+----------------------------------+---------------------------------------+--------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

.. |Network Layout| image:: advanced-networking/natd.png
.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
