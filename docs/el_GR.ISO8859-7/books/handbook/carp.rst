===============================================
31.12. Common Access Redundancy Protocol (CARP)
===============================================

.. raw:: html

   <div class="navheader">

31.12. Common Access Redundancy Protocol (CARP)
`????? <network-atm.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <appendices.html>`__

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

31.12. Common Access Redundancy Protocol (CARP)
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Common Access Redundancy Protocol, or CARP allows multiple hosts to
share the same IP address. In some configurations, this may be used for
availability or load balancing. Hosts may use separate IP addresses as
well, as in the example provided here.

To enable support for CARP, the FreeBSD kernel must be rebuilt with the
following option:

.. code:: programlisting

    device   carp

CARP functionality should now be available and may be tuned via several
``sysctl`` OIDs. Devices themselves may be loaded via the ``ifconfig``
command:

.. code:: screen

    # ifconfig carp0 create

In a real environment, these interfaces will need unique identification
numbers known as a VHID. This VHID or Virtual Host Identification will
be used to distinguish the host on the network.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.12.1. Using CARP For Server Availability (CARP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One use of CARP, as noted above, is for server availability. This
example will provide failover support for three hosts, all with unique
IP addresses and providing the same web content. These machines will act
in conjunction with a Round Robin DNS configuration. The failover
machine will have two additional CARP interfaces, one for each of the
content server's IPs. When a failure occurs, the failover server should
pick up the failed machine's IP address. This means the failure should
go completely unnoticed to the user. The failover server requires
identical content and services as the other content servers it is
expected to pick up load for.

The two machines should be configured identically other than their
issued hostnames and VHIDs. This example calls these machines
``hosta.example.org`` and ``hostb.example.org`` respectively. First, the
required lines for a CARP configuration have to be added to ``rc.conf``.
For ``hosta.example.org``, the ``rc.conf`` file should contain the
following lines:

.. code:: programlisting

    hostname="hosta.example.org"
    ifconfig_fxp0="inet 192.168.1.3 netmask 255.255.255.0"
    cloned_interfaces="carp0"
    ifconfig_carp0="vhid 1 pass testpast 192.168.1.50/24"

On ``hostb.example.org`` the following lines should be in ``rc.conf``:

.. code:: programlisting

    hostname="hostb.example.org"
    ifconfig_fxp0="inet 192.168.1.4 netmask 255.255.255.0"
    cloned_interfaces="carp0"
    ifconfig_carp0="vhid 2 pass testpass 192.168.1.51/24"

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

It is very important that the passwords, specified by the ``pass``
option to ``ifconfig``, are identical. The ``carp`` devices will only
listen to and accept advertisements from machines with the correct
password. The VHID must also be different for each machine.

.. raw:: html

   </div>

The third machine, ``provider.example.org``, should be prepared so that
it may handle failover from either host. This machine will require two
``carp`` devices, one to handle each host. The appropriate ``rc.conf``
configuration lines will be similar to the following:

.. code:: programlisting

    hostname="provider.example.org"
    ifconfig_fxp0="inet 192.168.1.5 netmask 255.255.255.0"
    cloned_interfaces="carp0 carp1"
    ifconfig_carp0="vhid 1 advskew 100 pass testpass 192.168.1.50/24"
    ifconfig_carp1="vhid 2 advskew 100 pass testpass 192.168.1.51/24"

Having the two ``carp`` devices will allow ``provider.example.org`` to
notice and pick up the IP address of either machine should it stop
responding.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The default FreeBSD kernel *may* have preemption enabled. If so,
``provider.example.org`` may not relinquish the IP address back to the
original content server. In this case, an administrator may ?nudge? the
interface. The following command should be issued on
``provider.example.org``:

.. code:: screen

    # ifconfig carp0 down && ifconfig carp0 up

This should be done on the ``carp`` interface which corresponds to the
correct host.

.. raw:: html

   </div>

At this point, CARP should be completely enabled and available for
testing. For testing, either networking has to be restarted or the
machines need to be rebooted.

More information is always available in the
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
manual page.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------------------+------------------------------------+
| `????? <network-atm.html>`__?              | `???? <advanced-networking.html>`__   | ?\ `??????? <appendices.html>`__   |
+--------------------------------------------+---------------------------------------+------------------------------------+
| 31.11. Asynchronous Transfer Mode (ATM)?   | `???? <index.html>`__                 | ???????V.????????????              |
+--------------------------------------------+---------------------------------------+------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
