=============================
31.9. Parallel Line IP (PLIP)
=============================

.. raw:: html

   <div class="navheader">

31.9. Parallel Line IP (PLIP)
`????? <network-natd.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-ipv6.html>`__

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

31.9. Parallel Line IP (PLIP)
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PLIP lets us run TCP/IP between parallel ports. It is useful on machines
without network cards, or to install on laptops. In this section, we
will discuss:

.. raw:: html

   <div class="itemizedlist">

-  Creating a parallel (laplink) cable.

-  Connecting two computers with PLIP.

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

31.9.1. Creating a Parallel Cable
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You can purchase a parallel cable at most computer supply stores. If you
cannot do that, or you just want to know how it is done, the following
table shows how to make one out of a normal parallel printer cable.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

??????? 31.1. Wiring a Parallel Cable for Networking

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| A-name                           | A-End                            | B-End                            | Descr.   | Post/Bit                         |
+==================================+==================================+==================================+==========+==================================+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA0                          | | 2                              | | 15                             |          | | 0/0x01                         |
| |  -ERROR                        | |  15                            | |  2                             |          | |  1/0x08                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA1                          | | 3                              | | 13                             |          | | 0/0x02                         |
| |  +SLCT                         | |  13                            | |  3                             |          | |  1/0x10                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA2                          | | 4                              | | 12                             |          | | 0/0x04                         |
| |  +PE                           | |  12                            | |  4                             |          | |  1/0x20                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Strobe   | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA3                          | | 5                              | | 10                             |          | | 0/0x08                         |
| |  -ACK                          | |  10                            | |  5                             |          | |  1/0x40                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA4                          | | 6                              | | 11                             |          | | 0/0x10                         |
| |  BUSY                          | |  11                            | |  6                             |          | |  1/0x80                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| GND                              | 18-25                            | 18-25                            | GND      | -                                |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+

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

31.9.2. Setting Up PLIP
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, you have to get a laplink cable. Then, confirm that both
computers have a kernel with
`lpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lpt&sektion=4>`__
driver support:

.. code:: screen

    # grep lp /var/run/dmesg.boot
    lpt0: <Printer> on ppbus0
    lpt0: Interrupt-driven port

The parallel port must be an interrupt driven port, you should have
lines similar to the following in your in the ``/boot/device.hints``
file:

.. code:: programlisting

    hint.ppc.0.at="isa"
    hint.ppc.0.irq="7"

Then check if the kernel configuration file has a ``device plip`` line
or if the ``plip.ko`` kernel module is loaded. In both cases the
parallel networking interface should appear when you use the
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
command to display it:

.. code:: screen

    # ifconfig plip0
    plip0: flags=8810<POINTOPOINT,SIMPLEX,MULTICAST> mtu 1500

Plug the laplink cable into the parallel interface on both computers.

Configure the network interface parameters on both sites as ``root``.
For example, if you want to connect the host ``host1`` with another
machine ``host2``:

.. code:: programlisting

                     host1 <-----> host2
    IP Address    10.0.0.1      10.0.0.2

Configure the interface on ``host1`` by doing:

.. code:: screen

    # ifconfig plip0 10.0.0.1 10.0.0.2

Configure the interface on ``host2`` by doing:

.. code:: screen

    # ifconfig plip0 10.0.0.2 10.0.0.1

You now should have a working connection. Please read the manual pages
`lp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lp&sektion=4>`__ and
`lpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lpt&sektion=4>`__ for
more details.

You should also add both hosts to ``/etc/hosts``:

.. code:: programlisting

    127.0.0.1               localhost.my.domain localhost
    10.0.0.1                host1.my.domain host1
    10.0.0.2                host2.my.domain

To confirm the connection works, go to each host and ping the other. For
example, on ``host1``:

.. code:: screen

    # ifconfig plip0
    plip0: flags=8851<UP,POINTOPOINT,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            inet 10.0.0.1 --> 10.0.0.2 netmask 0xff000000
    # netstat -r
    Routing tables

    Internet:
    Destination        Gateway          Flags     Refs     Use      Netif Expire
    host2              host1            UH          0       0       plip0
    # ping -c 4 host2
    PING host2 (10.0.0.2): 56 data bytes
    64 bytes from 10.0.0.2: icmp_seq=0 ttl=255 time=2.774 ms
    64 bytes from 10.0.0.2: icmp_seq=1 ttl=255 time=2.530 ms
    64 bytes from 10.0.0.2: icmp_seq=2 ttl=255 time=2.556 ms
    64 bytes from 10.0.0.2: icmp_seq=3 ttl=255 time=2.714 ms

    --- host2 ping statistics ---
    4 packets transmitted, 4 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 2.530/2.643/2.774/0.103 ms

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------------+--------------------------------------+
| `????? <network-natd.html>`__?       | `???? <advanced-networking.html>`__   | ?\ `??????? <network-ipv6.html>`__   |
+--------------------------------------+---------------------------------------+--------------------------------------+
| 31.8. Network Address Translation?   | `???? <index.html>`__                 | ?31.10. IPv6                         |
+--------------------------------------+---------------------------------------+--------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
