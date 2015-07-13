========================
5.?Network Configuration
========================

.. raw:: html

   <div class="navheader">

5.?Network Configuration
`Prev <startup.html>`__?
?
?\ `Next <firewall.html>`__

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

5.?Network Configuration
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Instead of a generic *ethX* identifier that Linux? uses to identify a
network interface, FreeBSD uses the driver name followed by a number.
The following output from
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
shows two Intel??Pro?1000 network interfaces (``em0`` and ``em1``):

.. code:: screen

    % ifconfig
    em0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            options=b<RXCSUM,TXCSUM,VLAN_MTU>
            inet 10.10.10.100 netmask 0xffffff00 broadcast 10.10.10.255
            ether 00:50:56:a7:70:b2
            media: Ethernet autoselect (1000baseTX <full-duplex>)
            status: active
    em1: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            options=b<RXCSUM,TXCSUM,VLAN_MTU>
            inet 192.168.10.222 netmask 0xffffff00 broadcast 192.168.10.255
            ether 00:50:56:a7:03:2b
            media: Ethernet autoselect (1000baseTX <full-duplex>)
            status: active

An IP address can be assigned to an interface using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
To remain persistent across reboots, the IP configuration must be
included in ``/etc/rc.conf``. The following ``/etc/rc.conf`` entries
specify the hostname, IP address, and default gateway:

.. code:: programlisting

    hostname="server1.example.com"
    ifconfig_em0="inet 10.10.10.100 netmask 255.255.255.0"
    defaultrouter="10.10.10.1"

Use the following entries to instead configure an interface for DHCP:

.. code:: programlisting

    hostname="server1.example.com"
    ifconfig_em0="DHCP"

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-------------------------------+
| `Prev <startup.html>`__?   | ?                       | ?\ `Next <firewall.html>`__   |
+----------------------------+-------------------------+-------------------------------+
| 4.?System Startup?         | `Home <index.html>`__   | ?6.?Firewall                  |
+----------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
