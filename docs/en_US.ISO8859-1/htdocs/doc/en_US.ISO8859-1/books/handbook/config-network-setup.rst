========================================
12.5.?Setting Up Network Interface Cards
========================================

.. raw:: html

   <div class="navheader">

12.5.?Setting Up Network Interface Cards
`Prev <configtuning-rcd.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-virtual-hosts.html>`__

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

12.5.?Setting Up Network Interface Cards
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adding and configuring a network interface card (NIC) is a common task
for any FreeBSD administrator.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.5.1.?Locating the Correct Driver
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, determine the model of the NIC and the chip it uses. FreeBSD
supports a wide variety of NICs. Check the Hardware Compatibility List
for the FreeBSD release to see if the NIC is supported.

If the NIC is supported, determine the name of the FreeBSD driver for
the NIC. Refer to ``/usr/src/sys/conf/NOTES`` and
``/usr/src/sys/arch``/conf/NOTES for the list of NIC drivers with some
information about the supported chipsets. When in doubt, read the manual
page of the driver as it will provide more information about the
supported hardware and any known limitations of the driver.

The drivers for common NICs are already present in the ``GENERIC``
kernel, meaning the NIC should be probed during boot. The system's boot
messages can be viewed by typing ``more /var/run/dmesg.boot`` and using
the spacebar to scroll through the text. In this example, two Ethernet
NICs using the
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4>`__ driver
are present on the system:

.. code:: screen

    dc0: <82c169 PNIC 10/100BaseTX> port 0xa000-0xa0ff mem 0xd3800000-0xd38
    000ff irq 15 at device 11.0 on pci0
    miibus0: <MII bus> on dc0
    bmtphy0: <BCM5201 10/100baseTX PHY> PHY 1 on miibus0
    bmtphy0:  10baseT, 10baseT-FDX, 100baseTX, 100baseTX-FDX, auto
    dc0: Ethernet address: 00:a0:cc:da:da:da
    dc0: [ITHREAD]
    dc1: <82c169 PNIC 10/100BaseTX> port 0x9800-0x98ff mem 0xd3000000-0xd30
    000ff irq 11 at device 12.0 on pci0
    miibus1: <MII bus> on dc1
    bmtphy1: <BCM5201 10/100baseTX PHY> PHY 1 on miibus1
    bmtphy1:  10baseT, 10baseT-FDX, 100baseTX, 100baseTX-FDX, auto
    dc1: Ethernet address: 00:a0:cc:da:da:db
    dc1: [ITHREAD]

If the driver for the NIC is not present in ``GENERIC``, but a driver is
available, the driver will need to be loaded before the NIC can be
configured and used. This may be accomplished in one of two ways:

.. raw:: html

   <div class="itemizedlist">

-  The easiest way is to load a kernel module for the NIC using
   `kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
   To also automatically load the driver at boot time, add the
   appropriate line to ``/boot/loader.conf``. Not all NIC drivers are
   available as modules.

-  Alternatively, statically compile support for the NIC into a custom
   kernel. Refer to ``/usr/src/sys/conf/NOTES``,
   ``/usr/src/sys/arch``/conf/NOTES and the manual page of the driver to
   determine which line to add to the custom kernel configuration file.
   For more information about recompiling the kernel, refer to
   `Chapter?9, *Configuring the FreeBSD Kernel* <kernelconfig.html>`__.
   If the NIC was detected at boot, the kernel does not need to be
   recompiled.

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

12.5.1.1.?Using Windows? NDIS Drivers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unfortunately, there are still many vendors that do not provide
schematics for their drivers to the open source community because they
regard such information as trade secrets. Consequently, the developers
of FreeBSD and other operating systems are left with two choices:
develop the drivers by a long and pain-staking process of reverse
engineering or using the existing driver binaries available for
Microsoft??Windows? platforms.

FreeBSD provides “native” support for the Network Driver Interface
Specification (NDIS). It includes
`ndisgen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndisgen&sektion=8>`__
which can be used to convert a Windows??XP driver into a format that can
be used on FreeBSD. Because the
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4>`__
driver uses a Windows??XP binary, it only runs on i386™ and amd64
systems. PCI, CardBus, PCMCIA, and USB devices are supported.

To use
`ndisgen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndisgen&sektion=8>`__,
three things are needed:

.. raw:: html

   <div class="orderedlist">

#. FreeBSD kernel sources.

#. A Windows??XP driver binary with a ``.SYS`` extension.

#. A Windows??XP driver configuration file with a ``.INF`` extension.

.. raw:: html

   </div>

Download the ``.SYS`` and ``.INF`` files for the specific NIC.
Generally, these can be found on the driver CD or at the vendor's
website. The following examples use ``W32DRIVER.SYS`` and
``W32DRIVER.INF``.

The driver bit width must match the version of FreeBSD. For
FreeBSD/i386, use a Windows? 32-bit driver. For FreeBSD/amd64, a
Windows? 64-bit driver is needed.

The next step is to compile the driver binary into a loadable kernel
module. As ``root``, use
`ndisgen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndisgen&sektion=8>`__:

.. code:: screen

    # ndisgen /path/to/W32DRIVER.INF /path/to/W32DRIVER.SYS

This command is interactive and prompts for any extra information it
requires. A new kernel module will be generated in the current
directory. Use
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
to load the new module:

.. code:: screen

    # kldload ./W32DRIVER_SYS.ko

In addition to the generated kernel module, the ``ndis.ko`` and
``if_ndis.ko`` modules must be loaded. This should happen automatically
when any module that depends on
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4>`__ is
loaded. If not, load them manually, using the following commands:

.. code:: screen

    # kldload ndis
    # kldload if_ndis

The first command loads the
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4>`__
miniport driver wrapper and the second loads the generated NIC driver.

Check
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
to see if there were any load errors. If all went well, the output
should be similar to the following:

.. code:: screen

    ndis0: <Wireless-G PCI Adapter> mem 0xf4100000-0xf4101fff irq 3 at device 8.0 on pci1
    ndis0: NDIS API version: 5.0
    ndis0: Ethernet address: 0a:b1:2c:d3:4e:f5
    ndis0: 11b rates: 1Mbps 2Mbps 5.5Mbps 11Mbps
    ndis0: 11g rates: 6Mbps 9Mbps 12Mbps 18Mbps 36Mbps 48Mbps 54Mbps

From here, ``ndis0`` can be configured like any other NIC.

To configure the system to load the
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4>`__
modules at boot time, copy the generated module, ``W32DRIVER_SYS.ko``,
to ``/boot/modules``. Then, add the following line to
``/boot/loader.conf``:

.. code:: programlisting

    W32DRIVER_SYS_load="YES"

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

12.5.2.?Configuring the Network Card
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the right driver is loaded for the NIC, the card needs to be
configured. It may have been configured at installation time by
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__.

To display the NIC configuration, enter the following command:

.. code:: screen

    % ifconfig
    dc0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=80008<VLAN_MTU,LINKSTATE>
            ether 00:a0:cc:da:da:da
            inet 192.168.1.3 netmask 0xffffff00 broadcast 192.168.1.255
            media: Ethernet autoselect (100baseTX <full-duplex>)
            status: active
    dc1: flags=8802<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=80008<VLAN_MTU,LINKSTATE>
            ether 00:a0:cc:da:da:db
            inet 10.0.0.1 netmask 0xffffff00 broadcast 10.0.0.255
            media: Ethernet 10baseT/UTP
            status: no carrier
    lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> metric 0 mtu 16384
            options=3<RXCSUM,TXCSUM>
            inet6 fe80::1%lo0 prefixlen 64 scopeid 0x4
            inet6 ::1 prefixlen 128
            inet 127.0.0.1 netmask 0xff000000
            nd6 options=3<PERFORMNUD,ACCEPT_RTADV>

In this example, the following devices were displayed:

.. raw:: html

   <div class="itemizedlist">

-  ``dc0``: The first Ethernet interface.

-  ``dc1``: The second Ethernet interface.

-  ``lo0``: The loopback device.

.. raw:: html

   </div>

FreeBSD uses the driver name followed by the order in which the card is
detected at boot to name the NIC. For example, ``sis2`` is the third NIC
on the system using the
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4>`__
driver.

In this example, ``dc0`` is up and running. The key indicators are:

.. raw:: html

   <div class="orderedlist">

#. ``UP`` means that the card is configured and ready.

#. The card has an Internet (``inet``) address, ``192.168.1.3``.

#. It has a valid subnet mask (``netmask``), where ``0xffffff00`` is the
   same as ``255.255.255.0``.

#. It has a valid broadcast address, ``192.168.1.255``.

#. The MAC address of the card (``ether``) is ``00:a0:cc:da:da:da``.

#. The physical media selection is on autoselection mode
   (``media: Ethernet autoselect (100baseTX           <full-duplex>)``).
   In this example, ``dc1`` is configured to run with ``10baseT/UTP``
   media. For more information on available media types for a driver,
   refer to its manual page.

#. The status of the link (``status``) is ``active``, indicating that
   the carrier signal is detected. For ``dc1``, the
   ``status: no carrier`` status is normal when an Ethernet cable is not
   plugged into the card.

.. raw:: html

   </div>

If the
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
output had shown something similar to:

.. code:: screen

    dc0: flags=8843<BROADCAST,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=80008<VLAN_MTU,LINKSTATE>
            ether 00:a0:cc:da:da:da
            media: Ethernet autoselect (100baseTX <full-duplex>)
            status: active

it would indicate the card has not been configured.

The card must be configured as ``root``. The NIC configuration can be
performed from the command line with
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
but will not persist after a reboot unless the configuration is also
added to ``/etc/rc.conf``. Add a line for each NIC present on the
system, as seen in this example:

.. code:: programlisting

    ifconfig_dc0="inet 192.168.1.3 netmask 255.255.255.0"
    ifconfig_dc1="inet 10.0.0.1 netmask 255.255.255.0 media 10baseT/UTP"

Replace ``dc0`` and ``dc1`` and the IP address information with the
correct values for the system. Refer to the man page for the driver,
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__,
and
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
for more details about the allowed options and the syntax of
``/etc/rc.conf``.

If the network was configured during installation, some entries for the
NIC(s) may be already present. Double check ``/etc/rc.conf`` before
adding any lines.

If the network is not using DNS, edit ``/etc/hosts`` to add the names
and IP addresses of the hosts on the LAN, if they are not already there.
For more information, refer to
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
and to ``/usr/share/examples/etc/hosts``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If there is no DHCP server and access to the Internet is needed,
manually configure the default gateway and the nameserver:

.. code:: screen

    # echo 'defaultrouter="your_default_router"' >> /etc/rc.conf
    # echo 'nameserver your_DNS_server' >> /etc/resolv.conf

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

12.5.3.?Testing and Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the necessary changes to ``/etc/rc.conf`` are saved, a reboot can
be used to test the network configuration and to verify that the system
restarts without any configuration errors. Alternatively, apply the
settings to the networking system with this command:

.. code:: screen

    # service netif restart

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If a default gateway has been set in ``/etc/rc.conf``, also issue this
command:

.. code:: screen

    # service routing restart

.. raw:: html

   </div>

Once the networking system has been relaunched, test the NICs.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.5.3.1.?Testing the Ethernet Card
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To verify that an Ethernet card is configured correctly,
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
the interface itself, and then
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
another machine on the LAN:

.. code:: screen

    % ping -c5 192.168.1.3
    PING 192.168.1.3 (192.168.1.3): 56 data bytes
    64 bytes from 192.168.1.3: icmp_seq=0 ttl=64 time=0.082 ms
    64 bytes from 192.168.1.3: icmp_seq=1 ttl=64 time=0.074 ms
    64 bytes from 192.168.1.3: icmp_seq=2 ttl=64 time=0.076 ms
    64 bytes from 192.168.1.3: icmp_seq=3 ttl=64 time=0.108 ms
    64 bytes from 192.168.1.3: icmp_seq=4 ttl=64 time=0.076 ms

    --- 192.168.1.3 ping statistics ---
    5 packets transmitted, 5 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 0.074/0.083/0.108/0.013 ms

.. code:: screen

    % ping -c5 192.168.1.2
    PING 192.168.1.2 (192.168.1.2): 56 data bytes
    64 bytes from 192.168.1.2: icmp_seq=0 ttl=64 time=0.726 ms
    64 bytes from 192.168.1.2: icmp_seq=1 ttl=64 time=0.766 ms
    64 bytes from 192.168.1.2: icmp_seq=2 ttl=64 time=0.700 ms
    64 bytes from 192.168.1.2: icmp_seq=3 ttl=64 time=0.747 ms
    64 bytes from 192.168.1.2: icmp_seq=4 ttl=64 time=0.704 ms

    --- 192.168.1.2 ping statistics ---
    5 packets transmitted, 5 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 0.700/0.729/0.766/0.025 ms

To test network resolution, use the host name instead of the IP address.
If there is no DNS server on the network, ``/etc/hosts`` must first be
configured.

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

12.5.3.2.?Troubleshooting
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When troubleshooting hardware and software configurations, check the
simple things first. Is the network cable plugged in? Are the network
services properly configured? Is the firewall configured correctly? Is
the NIC supported by FreeBSD? Before sending a bug report, always check
the Hardware Notes, update the version of FreeBSD to the latest STABLE
version, check the mailing list archives, and search the Internet.

If the card works, yet performance is poor, read through
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7>`__.
Also, check the network configuration as incorrect network settings can
cause slow connections.

Some users experience one or two device timeout messages, which is
normal for some cards. If they continue, or are bothersome, determine if
the device is conflicting with another device. Double check the cable
connections. Consider trying another card.

To resolve watchdog timeout errors, first check the network cable. Many
cards require a PCI slot which supports bus mastering. On some old
motherboards, only one PCI slot allows it, usually slot 0. Check the NIC
and the motherboard documentation to determine if that may be the
problem.

No route to host messages occur if the system is unable to route a
packet to the destination host. This can happen if no default route is
specified or if a cable is unplugged. Check the output of
``netstat -rn`` and make sure there is a valid route to the host. If
there is not, read `Chapter?31, *Advanced
Networking* <advanced-networking.html>`__.

ping: sendto: Permission denied error messages are often caused by a
misconfigured firewall. If a firewall is enabled on FreeBSD but no rules
have been defined, the default policy is to deny all traffic, even
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__.
Refer to `Chapter?30, *Firewalls* <firewalls.html>`__ for more
information.

Sometimes performance of the card is poor or below average. In these
cases, try setting the media selection mode from ``autoselect`` to the
correct media selection. While this works for most hardware, it may or
may not resolve the issue. Again, check all the network settings, and
refer to
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+-------------------------------------------------+
| `Prev <configtuning-rcd.html>`__?     | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-virtual-hosts.html>`__   |
+---------------------------------------+-------------------------------+-------------------------------------------------+
| 12.4.?Managing Services in FreeBSD?   | `Home <index.html>`__         | ?12.6.?Virtual Hosts                            |
+---------------------------------------+-------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
