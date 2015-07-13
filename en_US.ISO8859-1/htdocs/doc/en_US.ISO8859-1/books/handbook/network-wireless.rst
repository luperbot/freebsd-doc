=========================
31.3.?Wireless Networking
=========================

.. raw:: html

   <div class="navheader">

31.3.?Wireless Networking
`Prev <network-routing.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <network-usb-tethering.html>`__

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

31.3.?Wireless Networking
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Loader, Marc Fonvieille and Murray Stokely.

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

31.3.1.?Wireless Networking Basics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most wireless networks are based on the IEEE? 802.11 standards. A basic
wireless network consists of multiple stations communicating with radios
that broadcast in either the 2.4GHz or 5GHz band, though this varies
according to the locale and is also changing to enable communication in
the 2.3GHz and 4.9GHz ranges.

802.11 networks are organized in two ways. In *infrastructure mode*, one
station acts as a master with all the other stations associating to it,
the network is known as a BSS, and the master station is termed an
access point (AP). In a BSS, all communication passes through the AP;
even when one station wants to communicate with another wireless
station, messages must go through the AP. In the second form of network,
there is no master and stations communicate directly. This form of
network is termed an IBSS and is commonly known as an *ad-hoc network*.

802.11 networks were first deployed in the 2.4GHz band using protocols
defined by the IEEE? 802.11 and 802.11b standard. These specifications
include the operating frequencies and the MAC layer characteristics,
including framing and transmission rates, as communication can occur at
various rates. Later, the 802.11a standard defined operation in the 5GHz
band, including different signaling mechanisms and higher transmission
rates. Still later, the 802.11g standard defined the use of 802.11a
signaling and transmission mechanisms in the 2.4GHz band in such a way
as to be backwards compatible with 802.11b networks.

Separate from the underlying transmission techniques, 802.11 networks
have a variety of security mechanisms. The original 802.11
specifications defined a simple security protocol called WEP. This
protocol uses a fixed pre-shared key and the RC4 cryptographic cipher to
encode data transmitted on a network. Stations must all agree on the
fixed key in order to communicate. This scheme was shown to be easily
broken and is now rarely used except to discourage transient users from
joining networks. Current security practice is given by the IEEE?
802.11i specification that defines new cryptographic ciphers and an
additional protocol to authenticate stations to an access point and
exchange keys for data communication. Cryptographic keys are
periodically refreshed and there are mechanisms for detecting and
countering intrusion attempts. Another security protocol specification
commonly used in wireless networks is termed WPA, which was a precursor
to 802.11i. WPA specifies a subset of the requirements found in 802.11i
and is designed for implementation on legacy hardware. Specifically, WPA
requires only the TKIP cipher that is derived from the original WEP
cipher. 802.11i permits use of TKIP but also requires support for a
stronger cipher, AES-CCM, for encrypting data. The AES cipher was not
required in WPA because it was deemed too computationally costly to be
implemented on legacy hardware.

The other standard to be aware of is 802.11e. It defines protocols for
deploying multimedia applications, such as streaming video and voice
over IP (VoIP), in an 802.11 network. Like 802.11i, 802.11e also has a
precursor specification termed WME (later renamed WMM) that has been
defined by an industry group as a subset of 802.11e that can be deployed
now to enable multimedia applications while waiting for the final
ratification of 802.11e. The most important thing to know about 802.11e
and WME/WMM is that it enables prioritized traffic over a wireless
network through Quality of Service (QoS) protocols and enhanced media
access protocols. Proper implementation of these protocols enables high
speed bursting of data and prioritized traffic flow.

FreeBSD supports networks that operate using 802.11a, 802.11b, and
802.11g. The WPA and 802.11i security protocols are likewise supported
(in conjunction with any of 11a, 11b, and 11g) and QoS and traffic
prioritization required by the WME/WMM protocols are supported for a
limited set of wireless devices.

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

31.3.2.?Quick Start
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Connecting a computer to an existing wireless network is a very common
situation. This procedure shows the steps required.

.. raw:: html

   <div class="procedure">

#. Obtain the SSID (Service Set Identifier) and PSK (Pre-Shared Key) for
   the wireless network from the network administrator.

#. Identify the wireless adapter. The FreeBSD ``GENERIC`` kernel
   includes drivers for many common wireless adapters. If the wireless
   adapter is one of those models, it will be shown in the output from
   `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__:

   .. code:: screen

       % ifconfig | grep -B3 -i wireless

   If a wireless adapter is not listed, an additional kernel module
   might be required, or it might be a model not supported by FreeBSD.

   This example shows the Atheros ``ath0`` wireless adapter.

#. Add an entry for this network to ``/etc/wpa_supplicant.conf``. If the
   file does not exist, create it. Replace *``myssid``* and *``mypsk``*
   with the SSID and PSK provided by the network administrator.

   .. code:: programlisting

       network={
           ssid="myssid"
           psk="mypsk"
       }

#. Add entries to ``/etc/rc.conf`` to configure the network on startup:

   .. code:: programlisting

       wlans_ath0="wlan0"
       ifconfig_wlan0="WPA SYNCDHCP"

#. Restart the computer, or restart the network service to connect to
   the network:

   .. code:: screen

       # service netif restart

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

31.3.3.?Basic Setup
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

31.3.3.1.?Kernel Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To use wireless networking, a wireless networking card is needed and the
kernel needs to be configured with the appropriate wireless networking
support. The kernel is separated into multiple modules so that only the
required support needs to be configured.

The most commonly used wireless devices are those that use parts made by
Atheros. These devices are supported by
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__ and
require the following line to be added to ``/boot/loader.conf``:

.. code:: programlisting

    if_ath_load="YES"

The Atheros driver is split up into three separate pieces: the driver
(`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__),
the hardware support layer that handles chip-specific functions
(`ath\_hal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath_hal&sektion=4>`__),
and an algorithm for selecting the rate for transmitting frames. When
this support is loaded as kernel modules, any dependencies are
automatically handled. To load support for a different type of wireless
device, specify the module for that device. This example is for devices
based on the Intersil Prism parts
(`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4>`__)
driver:

.. code:: programlisting

    if_wi_load="YES"

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The examples in this section use an
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__
device and the device name in the examples must be changed according to
the configuration. A list of available wireless drivers and supported
adapters can be found in the FreeBSD Hardware Notes, available on the
`Release Information <http://www.FreeBSD.org/releases/index.html>`__
page of the FreeBSD website. If a native FreeBSD driver for the wireless
device does not exist, it may be possible to use the Windows? driver
with the help of the
`NDIS <config-network-setup.html#config-network-ndis>`__ driver wrapper.

.. raw:: html

   </div>

In addition, the modules that implement cryptographic support for the
security protocols to use must be loaded. These are intended to be
dynamically loaded on demand by the
`wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan&sektion=4>`__
module, but for now they must be manually configured. The following
modules are available:
`wlan\_wep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_wep&sektion=4>`__,
`wlan\_ccmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_ccmp&sektion=4>`__,
and
`wlan\_tkip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_tkip&sektion=4>`__.
The
`wlan\_ccmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_ccmp&sektion=4>`__
and
`wlan\_tkip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_tkip&sektion=4>`__
drivers are only needed when using the WPA or 802.11i security
protocols. If the network does not use encryption,
`wlan\_wep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_wep&sektion=4>`__
support is not needed. To load these modules at boot time, add the
following lines to ``/boot/loader.conf``:

.. code:: programlisting

    wlan_wep_load="YES"
    wlan_ccmp_load="YES"
    wlan_tkip_load="YES"

Once this information has been added to ``/boot/loader.conf``, reboot
the FreeBSD box. Alternately, load the modules by hand using
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

For users who do not want to use modules, it is possible to compile
these drivers into the kernel by adding the following lines to a custom
kernel configuration file:

.. code:: programlisting

    device wlan              # 802.11 support
    device wlan_wep          # 802.11 WEP support
    device wlan_ccmp         # 802.11 CCMP support
    device wlan_tkip         # 802.11 TKIP support
    device wlan_amrr         # AMRR transmit rate control algorithm
    device ath               # Atheros pci/cardbus NIC's
    device ath_hal           # pci/cardbus chip support
    options AH_SUPPORT_AR5416 # enable AR5416 tx/rx descriptors
    device ath_rate_sample   # SampleRate tx rate control for ath

With this information in the kernel configuration file, recompile the
kernel and reboot the FreeBSD machine.

.. raw:: html

   </div>

Information about the wireless device should appear in the boot
messages, like this:

.. code:: screen

    ath0: <Atheros 5212> mem 0x88000000-0x8800ffff irq 11 at device 0.0 on cardbus1
    ath0: [ITHREAD]
    ath0: AR2413 mac 7.9 RF2413 phy 4.5

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

31.3.4.?Infrastructure Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Infrastructure (BSS) mode is the mode that is typically used. In this
mode, a number of wireless access points are connected to a wired
network. Each wireless network has its own name, called the SSID.
Wireless clients connect to the wireless access points.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.?FreeBSD Clients
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.1.?How to Find Access Points
'''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To scan for available networks, use
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
This request may take a few moments to complete as it requires the
system to switch to each available wireless frequency and probe for
available access points. Only the superuser can initiate a scan:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 up scan
    SSID/MESH ID    BSSID              CHAN RATE   S:N     INT CAPS
    dlinkap         00:13:46:49:41:76   11   54M -90:96   100 EPS  WPA WME
    freebsdap       00:11:95:c3:0d:ac    1   54M -83:96   100 EPS  WPA

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The interface must be ``up`` before it can scan. Subsequent scan
requests do not require the interface to be marked as up again.

.. raw:: html

   </div>

The output of a scan request lists each BSS/IBSS network found. Besides
listing the name of the network, the ``SSID``, the output also shows the
``BSSID``, which is the MAC address of the access point. The ``CAPS``
field identifies the type of each network and the capabilities of the
stations operating there:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?31.2.?Station Capability Codes

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Capability Code   | Meaning                                                                                                                                                                                                  |
+===================+==========================================================================================================================================================================================================+
| ``E``             | Extended Service Set (ESS). Indicates that the station is part of an infrastructure network rather than an IBSS/ad-hoc network.                                                                          |
+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``I``             | IBSS/ad-hoc network. Indicates that the station is part of an ad-hoc network rather than an ESS network.                                                                                                 |
+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``P``             | Privacy. Encryption is required for all data frames exchanged within the BSS using cryptographic means such as WEP, TKIP or AES-CCMP.                                                                    |
+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``S``             | Short Preamble. Indicates that the network is using short preambles, defined in 802.11b High Rate/DSSS PHY, and utilizes a 56 bit sync field rather than the 128 bit field used in long preamble mode.   |
+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``s``             | Short slot time. Indicates that the 802.11g network is using a short slot time because there are no legacy (802.11b) stations present.                                                                   |
+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

One can also display the current list of known networks with:

.. code:: screen

    # ifconfig wlan0 list scan

This information may be updated automatically by the adapter or manually
with a ``scan`` request. Old data is automatically removed from the
cache, so over time this list may shrink unless more scans are done.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.2.?Basic Settings
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides a simple example of how to make the wireless
network adapter work in FreeBSD without encryption. Once familiar with
these concepts, it is strongly recommend to use
`WPA <network-wireless.html#network-wireless-wpa>`__ to set up the
wireless network.

There are three basic steps to configure a wireless network: select an
access point, authenticate the station, and configure an IP address. The
following sections discuss each step.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.2.1.?Selecting an Access Point
                                       

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most of the time, it is sufficient to let the system choose an access
point using the builtin heuristics. This is the default behaviour when
an interface is marked as up or it is listed in ``/etc/rc.conf``:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="DHCP"

If there are multiple access points, a specific one can be selected by
its SSID:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="ssid your_ssid_here DHCP"

In an environment where there are multiple access points with the same
SSID, which is often done to simplify roaming, it may be necessary to
associate to one specific device. In this case, the BSSID of the access
point can be specified, with or without the SSID:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="ssid your_ssid_here bssid xx:xx:xx:xx:xx:xx DHCP"

There are other ways to constrain the choice of an access point, such as
limiting the set of frequencies the system will scan on. This may be
useful for a multi-band wireless card as scanning all the possible
channels can be time-consuming. To limit operation to a specific band,
use the ``mode`` parameter:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="mode 11g ssid your_ssid_here DHCP"

This example will force the card to operate in 802.11g, which is defined
only for 2.4GHz frequencies so any 5GHz channels will not be considered.
This can also be achieved with the ``channel`` parameter, which locks
operation to one specific frequency, and the ``chanlist`` parameter, to
specify a list of channels for scanning. More information about these
parameters can be found in
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.2.2.?Authentication
                            

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once an access point is selected, the station needs to authenticate
before it can pass data. Authentication can happen in several ways. The
most common scheme, open authentication, allows any station to join the
network and communicate. This is the authentication to use for test
purposes the first time a wireless network is setup. Other schemes
require cryptographic handshakes to be completed before data traffic can
flow, either using pre-shared keys or secrets, or more complex schemes
that involve backend services such as RADIUS. Open authentication is the
default setting. The next most common setup is WPA-PSK, also known as
WPA Personal, which is described in `Section?31.3.4.1.3.1,
“WPA-PSK” <network-wireless.html#network-wireless-wpa-wpa-psk>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If using an Apple? AirPort? Extreme base station for an access point,
shared-key authentication together with a WEP key needs to be
configured. This can be configured in ``/etc/rc.conf`` or by using
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__.
For a single AirPort? base station, access can be configured with:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="authmode shared wepmode on weptxkey 1 wepkey 01234567 DHCP"

In general, shared key authentication should be avoided because it uses
the WEP key material in a highly-constrained manner, making it even
easier to crack the key. If WEP must be used for compatibility with
legacy devices, it is better to use WEP with ``open`` authentication.
More information regarding WEP can be found in `Section?31.3.4.1.4,
“WEP” <network-wireless.html#network-wireless-wep>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.2.3.?Getting an IP Address with DHCP
                                             

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once an access point is selected and the authentication parameters are
set, an IP address must be obtained in order to communicate. Most of the
time, the IP address is obtained via DHCP. To achieve that, edit
``/etc/rc.conf`` and add ``DHCP`` to the configuration for the device:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="DHCP"

The wireless interface is now ready to bring up:

.. code:: screen

    # service netif start

Once the interface is running, use
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
to see the status of the interface ``ath0``:

.. code:: screen

    # ifconfig wlan0
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            ether 00:11:95:d5:43:62
            inet 192.168.1.100 netmask 0xffffff00 broadcast 192.168.1.255
            media: IEEE 802.11 Wireless Ethernet OFDM/54Mbps mode 11g
            status: associated
            ssid dlinkap channel 11 (2462 Mhz 11g) bssid 00:13:46:49:41:76
            country US ecm authmode OPEN privacy OFF txpower 21.5 bmiss 7
            scanvalid 60 bgscan bgscanintvl 300 bgscanidle 250 roam:rssi 7
            roam:rate 5 protmode CTS wme burst

The ``status: associated`` line means that it is connected to the
wireless network. The ``bssid 00:13:46:49:41:76`` is the MAC address of
the access point and ``authmode OPEN`` indicates that the communication
is not encrypted.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.2.4.?Static IP Address
                               

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In an IP address cannot be obtained from a DHCP server, set a fixed IP
address. Replace the ``DHCP`` keyword shown above with the address
information. Be sure to retain any other parameters for selecting the
access point:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="inet 192.168.1.100 netmask 255.255.255.0 ssid your_ssid_here"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.3.?WPA
'''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wi-Fi Protected Access (WPA) is a security protocol used together with
802.11 networks to address the lack of proper authentication and the
weakness of WEP. WPA leverages the 802.1X authentication protocol and
uses one of several ciphers instead of WEP for data integrity. The only
cipher required by WPA is the Temporary Key Integrity Protocol (TKIP).
TKIP is a cipher that extends the basic RC4 cipher used by WEP by adding
integrity checking, tamper detection, and measures for responding to
detected intrusions. TKIP is designed to work on legacy hardware with
only software modification. It represents a compromise that improves
security but is still not entirely immune to attack. WPA also specifies
the AES-CCMP cipher as an alternative to TKIP, and that is preferred
when possible. For this specification, the term WPA2 or RSN is commonly
used.

WPA defines authentication and encryption protocols. Authentication is
most commonly done using one of two techniques: by 802.1X and a backend
authentication service such as RADIUS, or by a minimal handshake between
the station and the access point using a pre-shared secret. The former
is commonly termed WPA Enterprise and the latter is known as WPA
Personal. Since most people will not set up a RADIUS backend server for
their wireless network, WPA-PSK is by far the most commonly encountered
configuration for WPA.

The control of the wireless connection and the key negotiation or
authentication with a server is done using
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__.
This program requires a configuration file,
``/etc/wpa_supplicant.conf``, to run. More information regarding this
file can be found in
`wpa\_supplicant.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant.conf&sektion=5>`__.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.3.1.?WPA-PSK
                     

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

WPA-PSK, also known as WPA Personal, is based on a pre-shared key (PSK)
which is generated from a given password and used as the master key in
the wireless network. This means every wireless user will share the same
key. WPA-PSK is intended for small networks where the use of an
authentication server is not possible or desired.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Always use strong passwords that are sufficiently long and made from a
rich alphabet so that they will not be easily guessed or attacked.

.. raw:: html

   </div>

The first step is the configuration of ``/etc/wpa_supplicant.conf`` with
the SSID and the pre-shared key of the network:

.. code:: programlisting

    network={
      ssid="freebsdap"
      psk="freebsdmall"
    }

Then, in ``/etc/rc.conf``, indicate that the wireless device
configuration will be done with WPA and the IP address will be obtained
with DHCP:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="WPA DHCP"

Then, bring up the interface:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 5
    DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 6
    DHCPOFFER from 192.168.0.1
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67
    DHCPACK from 192.168.0.1
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/36Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

Or, try to configure the interface manually using the information in
``/etc/wpa_supplicant.conf``:

.. code:: screen

    # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf
    Trying to associate with 00:11:95:c3:0d:ac (SSID='freebsdap' freq=2412 MHz)
    Associated with 00:11:95:c3:0d:ac
    WPA: Key negotiation completed with 00:11:95:c3:0d:ac [PTK=CCMP GTK=CCMP]
    CTRL-EVENT-CONNECTED - Connection to 00:11:95:c3:0d:ac completed (auth) [id=0 id_str=]

The next operation is to launch
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
to get the IP address from the DHCP server:

.. code:: screen

    # dhclient wlan0
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67
    DHCPACK from 192.168.0.1
    bound to 192.168.0.254 -- renewal in 300 seconds.
    # ifconfig wlan0
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/36Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If ``/etc/rc.conf`` has an ``ifconfig_wlan0="DHCP"`` entry,
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
will be launched automatically after
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__
associates with the access point.

.. raw:: html

   </div>

If DHCP is not possible or desired, set a static IP address after
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__
has authenticated the station:

.. code:: screen

    # ifconfig wlan0 inet 192.168.0.100 netmask 255.255.255.0
    # ifconfig wlan0
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.100 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/36Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

When DHCP is not used, the default gateway and the nameserver also have
to be manually set:

.. code:: screen

    # route add default your_default_router
    # echo "nameserver your_DNS_server" >> /etc/resolv.conf

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.3.2.?WPA with EAP-TLS
                              

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The second way to use WPA is with an 802.1X backend authentication
server. In this case, WPA is called WPA Enterprise to differentiate it
from the less secure WPA Personal. Authentication in WPA Enterprise is
based on the Extensible Authentication Protocol (EAP).

EAP does not come with an encryption method. Instead, EAP is embedded
inside an encrypted tunnel. There are many EAP authentication methods,
but EAP-TLS, EAP-TTLS, and EAP-PEAP are the most common.

EAP with Transport Layer Security (EAP-TLS) is a well-supported wireless
authentication protocol since it was the first EAP method to be
certified by the `Wi-Fi Alliance <http://www.wi-fi.org/>`__. EAP-TLS
requires three certificates to run: the certificate of the Certificate
Authority (CA) installed on all machines, the server certificate for the
authentication server, and one client certificate for each wireless
client. In this EAP method, both the authentication server and wireless
client authenticate each other by presenting their respective
certificates, and then verify that these certificates were signed by the
organization's CA.

As previously, the configuration is done via
``/etc/wpa_supplicant.conf``:

.. code:: programlisting

    network={
      ssid="freebsdap" 
      proto=RSN  
      key_mgmt=WPA-EAP 
      eap=TLS 
      identity="loader" 
      ca_cert="/etc/certs/cacert.pem" 
      client_cert="/etc/certs/clientcert.pem" 
      private_key="/etc/certs/clientkey.pem" 
      private_key_passwd="freebsdmallclient" 
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-tls-ssid>`__               | This field indicates the network     |
|                                      | name (SSID).                         |
+--------------------------------------+--------------------------------------+
| `|2| <#co-tls-proto>`__              | This example uses the RSN IEEE?      |
|                                      | 802.11i protocol, also known as      |
|                                      | WPA2.                                |
+--------------------------------------+--------------------------------------+
| `|3| <#co-tls-kmgmt>`__              | The ``key_mgmt`` line refers to the  |
|                                      | key management protocol to use. In   |
|                                      | this example, it is WPA using EAP    |
|                                      | authentication.                      |
+--------------------------------------+--------------------------------------+
| `|4| <#co-tls-eap>`__                | This field indicates the EAP method  |
|                                      | for the connection.                  |
+--------------------------------------+--------------------------------------+
| `|5| <#co-tls-id>`__                 | The ``identity`` field contains the  |
|                                      | identity string for EAP.             |
+--------------------------------------+--------------------------------------+
| `|6| <#co-tls-cacert>`__             | The ``ca_cert`` field indicates the  |
|                                      | pathname of the CA certificate file. |
|                                      | This file is needed to verify the    |
|                                      | server certificate.                  |
+--------------------------------------+--------------------------------------+
| `|7| <#co-tls-clientcert>`__         | The ``client_cert`` line gives the   |
|                                      | pathname to the client certificate   |
|                                      | file. This certificate is unique to  |
|                                      | each wireless client of the network. |
+--------------------------------------+--------------------------------------+
| `|8| <#co-tls-pkey>`__               | The ``private_key`` field is the     |
|                                      | pathname to the client certificate   |
|                                      | private key file.                    |
+--------------------------------------+--------------------------------------+
| `|9| <#co-tls-pwd>`__                | The ``private_key_passwd`` field     |
|                                      | contains the passphrase for the      |
|                                      | private key.                         |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Then, add the following lines to ``/etc/rc.conf``:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="WPA DHCP"

The next step is to bring up the interface:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 7
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 15
    DHCPACK from 192.168.0.20
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet DS/11Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

It is also possible to bring up the interface manually using
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__
and
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.3.3.?WPA with EAP-TTLS
                               

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With EAP-TTLS, both the authentication server and the client need a
certificate. With EAP-TTLS, a client certificate is optional. This
method is similar to a web server which creates a secure SSL tunnel even
if visitors do not have client-side certificates. EAP-TTLS uses an
encrypted TLS tunnel for safe transport of the authentication data.

The required configuration can be added to ``/etc/wpa_supplicant.conf``:

.. code:: programlisting

    network={
      ssid="freebsdap"
      proto=RSN
      key_mgmt=WPA-EAP
      eap=TTLS 
      identity="test" 
      password="test" 
      ca_cert="/etc/certs/cacert.pem" 
      phase2="auth=MD5" 
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ttls-eap>`__               | This field specifies the EAP method  |
|                                      | for the connection.                  |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ttls-id>`__                | The ``identity`` field contains the  |
|                                      | identity string for EAP              |
|                                      | authentication inside the encrypted  |
|                                      | TLS tunnel.                          |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ttls-passwd>`__            | The ``password`` field contains the  |
|                                      | passphrase for the EAP               |
|                                      | authentication.                      |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ttls-cacert>`__            | The ``ca_cert`` field indicates the  |
|                                      | pathname of the CA certificate file. |
|                                      | This file is needed to verify the    |
|                                      | server certificate.                  |
+--------------------------------------+--------------------------------------+
| `|5| <#co-ttls-pha2>`__              | This field specifies the             |
|                                      | authentication method used in the    |
|                                      | encrypted TLS tunnel. In this        |
|                                      | example, EAP with MD5-Challenge is   |
|                                      | used. The “inner authentication”     |
|                                      | phase is often called “phase2”.      |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Next, add the following lines to ``/etc/rc.conf``:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="WPA DHCP"

The next step is to bring up the interface:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 7
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 15
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 21
    DHCPACK from 192.168.0.20
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet DS/11Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.3.4.?WPA with EAP-PEAP
                               

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

PEAPv0/EAP-MSCHAPv2 is the most common PEAP method. In this chapter, the
term PEAP is used to refer to that method.

.. raw:: html

   </div>

Protected EAP (PEAP) is designed as an alternative to EAP-TTLS and is
the most used EAP standard after EAP-TLS. In a network with mixed
operating systems, PEAP should be the most supported standard after
EAP-TLS.

PEAP is similar to EAP-TTLS as it uses a server-side certificate to
authenticate clients by creating an encrypted TLS tunnel between the
client and the authentication server, which protects the ensuing
exchange of authentication information. PEAP authentication differs from
EAP-TTLS as it broadcasts the username in the clear and only the
password is sent in the encrypted TLS tunnel. EAP-TTLS will use the TLS
tunnel for both the username and password.

Add the following lines to ``/etc/wpa_supplicant.conf`` to configure the
EAP-PEAP related settings:

.. code:: programlisting

    network={
      ssid="freebsdap"
      proto=RSN
      key_mgmt=WPA-EAP
      eap=PEAP 
      identity="test" 
      password="test" 
      ca_cert="/etc/certs/cacert.pem" 
      phase1="peaplabel=0" 
      phase2="auth=MSCHAPV2" 
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-peap-eap>`__               | This field specifies the EAP method  |
|                                      | for the connection.                  |
+--------------------------------------+--------------------------------------+
| `|2| <#co-peap-id>`__                | The ``identity`` field contains the  |
|                                      | identity string for EAP              |
|                                      | authentication inside the encrypted  |
|                                      | TLS tunnel.                          |
+--------------------------------------+--------------------------------------+
| `|3| <#co-peap-passwd>`__            | The ``password`` field contains the  |
|                                      | passphrase for the EAP               |
|                                      | authentication.                      |
+--------------------------------------+--------------------------------------+
| `|4| <#co-peap-cacert>`__            | The ``ca_cert`` field indicates the  |
|                                      | pathname of the CA certificate file. |
|                                      | This file is needed to verify the    |
|                                      | server certificate.                  |
+--------------------------------------+--------------------------------------+
| `|5| <#co-peap-pha1>`__              | This field contains the parameters   |
|                                      | for the first phase of               |
|                                      | authentication, the TLS tunnel.      |
|                                      | According to the authentication      |
|                                      | server used, specify a specific      |
|                                      | label for authentication. Most of    |
|                                      | the time, the label will be “client  |
|                                      | EAP encryption” which is set by      |
|                                      | using ``peaplabel=0``. More          |
|                                      | information can be found in          |
|                                      | `wpa\_supplicant.conf(5) <http://www |
|                                      | .FreeBSD.org/cgi/man.cgi?query=wpa_s |
|                                      | upplicant.conf&sektion=5>`__.        |
+--------------------------------------+--------------------------------------+
| `|6| <#co-peap-pha2>`__              | This field specifies the             |
|                                      | authentication protocol used in the  |
|                                      | encrypted TLS tunnel. In the case of |
|                                      | PEAP, it is ``auth=MSCHAPV2``.       |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Add the following to ``/etc/rc.conf``:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="WPA DHCP"

Then, bring up the interface:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 7
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 15
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 21
    DHCPACK from 192.168.0.20
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet DS/11Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.4.1.4.?WEP
'''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wired Equivalent Privacy (WEP) is part of the original 802.11 standard.
There is no authentication mechanism, only a weak form of access control
which is easily cracked.

WEP can be set up using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 inet 192.168.1.100 netmask 255.255.255.0 \
            ssid my_net wepmode on weptxkey 3 wepkey 3:0x3456789012

.. raw:: html

   <div class="itemizedlist">

-  The ``weptxkey`` specifies which WEP key will be used in the
   transmission. This example uses the third key. This must match the
   setting on the access point. When unsure which key is used by the
   access point, try ``1`` (the first key) for this value.

-  The ``wepkey`` selects one of the WEP keys. It should be in the
   format *``index:key``*. Key ``1`` is used by default; the index only
   needs to be set when using a key other than the first key.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Replace the ``0x3456789012`` with the key configured for use on the
   access point.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Refer to
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
for further information.

The
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__
facility can be used to configure a wireless interface with WEP. The
example above can be set up by adding the following lines to
``/etc/wpa_supplicant.conf``:

.. code:: programlisting

    network={
      ssid="my_net"
      key_mgmt=NONE
      wep_key3=3456789012
      wep_tx_keyidx=3
    }

Then:

.. code:: screen

    # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf
    Trying to associate with 00:13:46:49:41:76 (SSID='dlinkap' freq=2437 MHz)
    Associated with 00:13:46:49:41:76

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

31.3.5.?Ad-hoc Mode
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IBSS mode, also called ad-hoc mode, is designed for point to point
connections. For example, to establish an ad-hoc network between the
machines ``A`` and ``B``, choose two IP addresses and a SSID.

On ``A``:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode adhoc
    # ifconfig wlan0 inet 192.168.0.1 netmask 255.255.255.0 ssid freebsdap
    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:c3:0d:ac
          inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <adhoc>
          status: running
          ssid freebsdap channel 2 (2417 Mhz 11g) bssid 02:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 scanvalid 60
          protmode CTS wme burst

The ``adhoc`` parameter indicates that the interface is running in IBSS
mode.

``B`` should now be able to detect ``A``:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode adhoc
    # ifconfig wlan0 up scan
      SSID/MESH ID    BSSID              CHAN RATE   S:N     INT CAPS
      freebsdap       02:11:95:c3:0d:ac    2   54M -64:-96  100 IS   WME

The ``I`` in the output confirms that ``A`` is in ad-hoc mode. Now,
configure ``B`` with a different IP address:

.. code:: screen

    # ifconfig wlan0 inet 192.168.0.2 netmask 255.255.255.0 ssid freebsdap
    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.2 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <adhoc>
          status: running
          ssid freebsdap channel 2 (2417 Mhz 11g) bssid 02:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 scanvalid 60
          protmode CTS wme burst

Both ``A`` and ``B`` are now ready to exchange information.

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

31.3.6.?FreeBSD Host Access Points
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD can act as an Access Point (AP) which eliminates the need to buy
a hardware AP or run an ad-hoc network. This can be particularly useful
when a FreeBSD machine is acting as a gateway to another network such as
the Internet.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.6.1.?Basic Settings
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before configuring a FreeBSD machine as an AP, the kernel must be
configured with the appropriate networking support for the wireless card
as well as the security protocols being used. For more details, see
`Section?31.3.3, “Basic
Setup” <network-wireless.html#network-wireless-basic>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The NDIS driver wrapper for Windows? drivers does not currently support
AP operation. Only native FreeBSD wireless drivers support AP mode.

.. raw:: html

   </div>

Once wireless networking support is loaded, check if the wireless device
supports the host-based access point mode, also known as hostap mode:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 list caps
    drivercaps=6f85edc1<STA,FF,TURBOP,IBSS,HOSTAP,AHDEMO,TXPMGT,SHSLOT,SHPREAMBLE,MONITOR,MBSS,WPA1,WPA2,BURST,WME,WDS,BGSCAN,TXFRAG>
    cryptocaps=1f<WEP,TKIP,AES,AES_CCM,TKIPMIC>

This output displays the card's capabilities. The ``HOSTAP`` word
confirms that this wireless card can act as an AP. Various supported
ciphers are also listed: WEP, TKIP, and AES. This information indicates
which security protocols can be used on the AP.

The wireless device can only be put into hostap mode during the creation
of the network pseudo-device, so a previously created device must be
destroyed first:

.. code:: screen

    # ifconfig wlan0 destroy

then regenerated with the correct option before setting the other
parameters:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode hostap
    # ifconfig wlan0 inet 192.168.0.1 netmask 255.255.255.0 ssid freebsdap mode 11g channel 1

Use
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
again to see the status of the ``wlan0`` interface:

.. code:: screen

    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:c3:0d:ac
          inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <hostap>
          status: running
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 scanvalid 60
          protmode CTS wme burst dtimperiod 1 -dfs

The ``hostap`` parameter indicates the interface is running in the
host-based access point mode.

The interface configuration can be done automatically at boot time by
adding the following lines to ``/etc/rc.conf``:

.. code:: programlisting

    wlans_ath0="wlan0"
    create_args_wlan0="wlanmode hostap"
    ifconfig_wlan0="inet 192.168.0.1 netmask 255.255.255.0 ssid freebsdap mode 11g channel 1"

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

31.3.6.2.?Host-based Access Point Without Authentication or Encryption
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Although it is not recommended to run an AP without any authentication
or encryption, this is a simple way to check if the AP is working. This
configuration is also important for debugging client issues.

Once the AP is configured, initiate a scan from another wireless machine
to find the AP:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 up scan
    SSID/MESH ID    BSSID              CHAN RATE   S:N     INT CAPS
    freebsdap       00:11:95:c3:0d:ac    1   54M -66:-96  100 ES   WME

The client machine found the AP and can be associated with it:

.. code:: screen

    # ifconfig wlan0 inet 192.168.0.2 netmask 255.255.255.0 ssid freebsdap
    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.2 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/54Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 bmiss 7
          scanvalid 60 bgscan bgscanintvl 300 bgscanidle 250 roam:rssi 7
          roam:rate 5 protmode CTS wme burst

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

31.3.6.3.?WPA2 Host-based Access Point
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section focuses on setting up a FreeBSD access point using the WPA2
security protocol. More details regarding WPA and the configuration of
WPA-based wireless clients can be found in `Section?31.3.4.1.3,
“WPA” <network-wireless.html#network-wireless-wpa>`__.

The
`hostapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hostapd&sektion=8>`__
daemon is used to deal with client authentication and key management on
the WPA2-enabled AP.

The following configuration operations are performed on the FreeBSD
machine acting as the AP. Once the AP is correctly working,
`hostapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hostapd&sektion=8>`__
can be automatically started at boot with this line in ``/etc/rc.conf``:

.. code:: programlisting

    hostapd_enable="YES"

Before trying to configure
`hostapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hostapd&sektion=8>`__,
first configure the basic settings introduced in `Section?31.3.6.1,
“Basic Settings” <network-wireless.html#network-wireless-ap-basic>`__.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.3.6.3.1.?WPA2-PSK
''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

WPA2-PSK is intended for small networks where the use of a backend
authentication server is not possible or desired.

The configuration is done in ``/etc/hostapd.conf``:

.. code:: programlisting

    interface=wlan0                  
    debug=1                          
    ctrl_interface=/var/run/hostapd  
    ctrl_interface_group=wheel       
    ssid=freebsdap                   
    wpa=2                            
    wpa_passphrase=freebsdmall       
    wpa_key_mgmt=WPA-PSK             
    wpa_pairwise=CCMP                

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ap-wpapsk-iface>`__        | Wireless interface used for the      |
|                                      | access point.                        |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ap-wpapsk-dbug>`__         | Level of verbosity used during the   |
|                                      | execution of                         |
|                                      | `hostapd(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=hostapd&sektion=8> |
|                                      | `__.                                 |
|                                      | A value of ``1`` represents the      |
|                                      | minimal level.                       |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ap-wpapsk-ciface>`__       | Pathname of the directory used by    |
|                                      | `hostapd(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=hostapd&sektion=8> |
|                                      | `__                                  |
|                                      | to store domain socket files for     |
|                                      | communication with external programs |
|                                      | such as                              |
|                                      | `hostapd\_cli(8) <http://www.FreeBSD |
|                                      | .org/cgi/man.cgi?query=hostapd_cli&s |
|                                      | ektion=8>`__.                        |
|                                      | The default value is used in this    |
|                                      | example.                             |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ap-wpapsk-cifacegrp>`__    | The group allowed to access the      |
|                                      | control interface files.             |
+--------------------------------------+--------------------------------------+
| `|5| <#co-ap-wpapsk-ssid>`__         | The wireless network name, or SSID,  |
|                                      | that will appear in wireless scans.  |
+--------------------------------------+--------------------------------------+
| `|6| <#co-ap-wpapsk-wpa>`__          | Enable WPA and specify which WPA     |
|                                      | authentication protocol will be      |
|                                      | required. A value of ``2``           |
|                                      | configures the AP for WPA2 and is    |
|                                      | recommended. Set to ``1`` only if    |
|                                      | the obsolete WPA is required.        |
+--------------------------------------+--------------------------------------+
| `|7| <#co-ap-wpapsk-pass>`__         | ASCII passphrase for WPA             |
|                                      | authentication.                      |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="warning" xmlns="">    |
|                                      |                                      |
|                                      | Warning:                             |
|                                      | ~~~~~~~~                             |
|                                      |                                      |
|                                      | Always use strong passwords that are |
|                                      | at least 8 characters long and made  |
|                                      | from a rich alphabet so that they    |
|                                      | will not be easily guessed or        |
|                                      | attacked.                            |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|8| <#co-ap-wpapsk-kmgmt>`__        | The key management protocol to use.  |
|                                      | This example sets WPA-PSK.           |
+--------------------------------------+--------------------------------------+
| `|9| <#co-ap-wpapsk-pwise>`__        | Encryption algorithms accepted by    |
|                                      | the access point. In this example,   |
|                                      | only the CCMP (AES) cipher is        |
|                                      | accepted. CCMP is an alternative to  |
|                                      | TKIP and is strongly preferred when  |
|                                      | possible. TKIP should be allowed     |
|                                      | only when there are stations         |
|                                      | incapable of using CCMP.             |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

The next step is to start
`hostapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hostapd&sektion=8>`__:

.. code:: screen

    # service hostapd forcestart

.. code:: screen

    # ifconfig wlan0
    wlan0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> metric 0 mtu 1500
        ether 04:f0:21:16:8e:10
        inet6 fe80::6f0:21ff:fe16:8e10%wlan0 prefixlen 64 scopeid 0x9
        nd6 options=21<PERFORMNUD,AUTO_LINKLOCAL>
        media: IEEE 802.11 Wireless Ethernet autoselect mode 11na <hostap>
        status: running
        ssid No5ignal channel 36 (5180 MHz 11a ht/40+) bssid 04:f0:21:16:8e:10
        country US ecm authmode WPA2/802.11i privacy MIXED deftxkey 2
        AES-CCM 2:128-bit AES-CCM 3:128-bit txpower 17 mcastrate 6 mgmtrate 6
        scanvalid 60 ampdulimit 64k ampdudensity 8 shortgi wme burst
        dtimperiod 1 -dfs
        groups: wlan

Once the AP is running, the clients can associate with it. See
`Section?31.3.4.1.3,
“WPA” <network-wireless.html#network-wireless-wpa>`__ for more details.
It is possible to see the stations associated with the AP using
``ifconfig           wlan0`` list sta.

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

31.3.6.4.?WEP Host-based Access Point
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is not recommended to use WEP for setting up an AP since there is no
authentication mechanism and the encryption is easily cracked. Some
legacy wireless cards only support WEP and these cards will only support
an AP without authentication or encryption.

The wireless device can now be put into hostap mode and configured with
the correct SSID and IP address:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode hostap
    # ifconfig wlan0 inet 192.168.0.1 netmask 255.255.255.0 \
        ssid freebsdap wepmode on weptxkey 3 wepkey 3:0x3456789012 mode 11g

.. raw:: html

   <div class="itemizedlist">

-  The ``weptxkey`` indicates which WEP key will be used in the
   transmission. This example uses the third key as key numbering starts
   with ``1``. This parameter must be specified in order to encrypt the
   data.

-  The ``wepkey`` sets the selected WEP key. It should be in the format
   *``index:key``*. If the index is not given, key ``1`` is set. The
   index needs to be set when using keys other than the first key.

.. raw:: html

   </div>

Use
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
to see the status of the ``wlan0`` interface:

.. code:: screen

    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:c3:0d:ac
          inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <hostap>
          status: running
          ssid freebsdap channel 4 (2427 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy ON deftxkey 3 wepkey 3:40-bit
          txpower 21.5 scanvalid 60 protmode CTS wme burst dtimperiod 1 -dfs

From another wireless machine, it is now possible to initiate a scan to
find the AP:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 up scan
    SSID            BSSID              CHAN RATE  S:N   INT CAPS
    freebsdap       00:11:95:c3:0d:ac    1   54M 22:1   100 EPS

In this example, the client machine found the AP and can associate with
it using the correct parameters. See `Section?31.3.4.1.4,
“WEP” <network-wireless.html#network-wireless-wep>`__ for more details.

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

31.3.7.?Using Both Wired and Wireless Connections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A wired connection provides better performance and reliability, while a
wireless connection provides flexibility and mobility. Laptop users
typically want to roam seamlessly between the two types of connections.

On FreeBSD, it is possible to combine two or even more network
interfaces together in a “failover” fashion. This type of configuration
uses the most preferred and available connection from a group of network
interfaces, and the operating system switches automatically when the
link state changes.

Link aggregation and failover is covered in `Section?31.7, “Link
Aggregation and Failover” <network-aggregation.html>`__ and an example
for using both wired and wireless connections is provided at
`Example?31.3, “Failover Mode Between Ethernet and Wireless
Interfaces” <network-aggregation.html#networking-lagg-wired-and-wireless>`__.

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

31.3.8.?Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes a number of steps to help troubleshoot common
wireless networking problems.

.. raw:: html

   <div class="itemizedlist">

-  If the access point is not listed when scanning, check that the
   configuration has not limited the wireless device to a limited set of
   channels.

-  If the device cannot associate with an access point, verify that the
   configuration matches the settings on the access point. This includes
   the authentication scheme and any security protocols. Simplify the
   configuration as much as possible. If using a security protocol such
   as WPA or WEP, configure the access point for open authentication and
   no security to see if traffic will pass.

   Debugging support is provided by
   `wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__.
   Try running this utility manually with ``-dd`` and look at the system
   logs.

-  Once the system can associate with the access point, diagnose the
   network configuration using tools like
   `ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__.

-  There are many lower-level debugging tools. Debugging messages can be
   enabled in the 802.11 protocol support layer using
   `wlandebug(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wlandebug&sektion=8>`__.
   On a FreeBSD system prior to FreeBSD?9.1, this program can be found
   in ``/usr/src/tools/tools/net80211``. For example, to enable console
   messages related to scanning for access points and the 802.11
   protocol handshakes required to arrange communication:

   .. code:: screen

       # wlandebug -i ath0 +scan+auth+debug+assoc
         net.wlan.0.debug: 0 => 0xc80000<assoc,auth,scan>

   Many useful statistics are maintained by the 802.11 layer and
   ``wlanstats``, found in ``/usr/src/tools/tools/net80211``, will dump
   this information. These statistics should display all errors
   identified by the 802.11 layer. However, some errors are identified
   in the device drivers that lie below the 802.11 layer so they may not
   show up. To diagnose device-specific problems, refer to the drivers'
   documentation.

.. raw:: html

   </div>

If the above information does not help to clarify the problem, submit a
problem report and include output from the above tools.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------------+--------------------------------------------+
| `Prev <network-routing.html>`__?   | `Up <advanced-networking.html>`__   | ?\ `Next <network-usb-tethering.html>`__   |
+------------------------------------+-------------------------------------+--------------------------------------------+
| 31.2.?Gateways and Routes?         | `Home <index.html>`__               | ?31.4.?USB Tethering                       |
+------------------------------------+-------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
