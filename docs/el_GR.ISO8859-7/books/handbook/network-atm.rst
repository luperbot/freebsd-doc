=======================================
31.11. Asynchronous Transfer Mode (ATM)
=======================================

.. raw:: html

   <div class="navheader">

31.11. Asynchronous Transfer Mode (ATM)
`????? <network-ipv6.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <carp.html>`__

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

31.11. Asynchronous Transfer Mode (ATM)
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Harti Brandt.

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

31.11.1. Configuring classical IP over ATM (PVCs)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Classical IP over ATM (CLIP) is the simplest method to use Asynchronous
Transfer Mode (ATM) with IP. It can be used with switched connections
(SVCs) and with permanent connections (PVCs). This section describes how
to set up a network based on PVCs.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.11.1.1. Fully meshed configurations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first method to set up a CLIP with PVCs is to connect each machine
to each other machine in the network via a dedicated PVC. While this is
simple to configure it tends to become impractical for a larger number
of machines. The example supposes that we have four machines in the
network, each connected to the ATM network with an ATM adapter card. The
first step is the planning of the IP addresses and the ATM connections
between the machines. We use the following:

.. raw:: html

   <div class="informaltable">

+-------------+---------------------+
| Host        | IP Address          |
+=============+=====================+
| ``hostA``   | ``192.168.173.1``   |
+-------------+---------------------+
| ``hostB``   | ``192.168.173.2``   |
+-------------+---------------------+
| ``hostC``   | ``192.168.173.3``   |
+-------------+---------------------+
| ``hostD``   | ``192.168.173.4``   |
+-------------+---------------------+

.. raw:: html

   </div>

To build a fully meshed net we need one ATM connection between each pair
of machines:

.. raw:: html

   <div class="informaltable">

+-------------------------+------------------+
| Machines                | VPI.VCI couple   |
+=========================+==================+
| ``hostA`` - ``hostB``   | 0.100            |
+-------------------------+------------------+
| ``hostA`` - ``hostC``   | 0.101            |
+-------------------------+------------------+
| ``hostA`` - ``hostD``   | 0.102            |
+-------------------------+------------------+
| ``hostB`` - ``hostC``   | 0.103            |
+-------------------------+------------------+
| ``hostB`` - ``hostD``   | 0.104            |
+-------------------------+------------------+
| ``hostC`` - ``hostD``   | 0.105            |
+-------------------------+------------------+

.. raw:: html

   </div>

The VPI and VCI values at each end of the connection may of course
differ, but for simplicity we assume that they are the same. Next we
need to configure the ATM interfaces on each host:

.. code:: screen

    hostA# ifconfig hatm0 192.168.173.1 up
    hostB# ifconfig hatm0 192.168.173.2 up
    hostC# ifconfig hatm0 192.168.173.3 up
    hostD# ifconfig hatm0 192.168.173.4 up

assuming that the ATM interface is ``hatm0`` on all hosts. Now the PVCs
need to be configured on ``hostA`` (we assume that they are already
configured on the ATM switches, you need to consult the manual for the
switch on how to do this).

.. code:: screen

    hostA# atmconfig natm add 192.168.173.2 hatm0 0 100 llc/snap ubr
    hostA# atmconfig natm add 192.168.173.3 hatm0 0 101 llc/snap ubr
    hostA# atmconfig natm add 192.168.173.4 hatm0 0 102 llc/snap ubr

    hostB# atmconfig natm add 192.168.173.1 hatm0 0 100 llc/snap ubr
    hostB# atmconfig natm add 192.168.173.3 hatm0 0 103 llc/snap ubr
    hostB# atmconfig natm add 192.168.173.4 hatm0 0 104 llc/snap ubr

    hostC# atmconfig natm add 192.168.173.1 hatm0 0 101 llc/snap ubr
    hostC# atmconfig natm add 192.168.173.2 hatm0 0 103 llc/snap ubr
    hostC# atmconfig natm add 192.168.173.4 hatm0 0 105 llc/snap ubr

    hostD# atmconfig natm add 192.168.173.1 hatm0 0 102 llc/snap ubr
    hostD# atmconfig natm add 192.168.173.2 hatm0 0 104 llc/snap ubr
    hostD# atmconfig natm add 192.168.173.3 hatm0 0 105 llc/snap ubr

Of course other traffic contracts than UBR can be used given the ATM
adapter supports those. In this case the name of the traffic contract is
followed by the parameters of the traffic. Help for the
`atmconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atmconfig&sektion=8>`__
tool can be obtained with:

.. code:: screen

    # atmconfig help natm add

or in the
`atmconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atmconfig&sektion=8>`__
manual page.

The same configuration can also be done via ``/etc/rc.conf``. For
``hostA`` this would look like:

.. code:: programlisting

    network_interfaces="lo0 hatm0"
    ifconfig_hatm0="inet 192.168.173.1 up"
    natm_static_routes="hostB hostC hostD"
    route_hostB="192.168.173.2 hatm0 0 100 llc/snap ubr"
    route_hostC="192.168.173.3 hatm0 0 101 llc/snap ubr"
    route_hostD="192.168.173.4 hatm0 0 102 llc/snap ubr"

The current state of all CLIP routes can be obtained with:

.. code:: screen

    hostA# atmconfig natm show

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------------+----------------------------------------------------+
| `????? <network-ipv6.html>`__?   | `???? <advanced-networking.html>`__   | ?\ `??????? <carp.html>`__                         |
+----------------------------------+---------------------------------------+----------------------------------------------------+
| 31.10. IPv6?                     | `???? <index.html>`__                 | ?31.12. Common Access Redundancy Protocol (CARP)   |
+----------------------------------+---------------------------------------+----------------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
