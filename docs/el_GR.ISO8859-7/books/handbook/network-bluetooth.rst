===============
31.4. Bluetooth
===============

.. raw:: html

   <div class="navheader">

31.4. Bluetooth
`????? <network-wireless.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-bridging.html>`__

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

31.4. Bluetooth
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Pav Lucistnik.

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

31.4.1. Introduction
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bluetooth is a wireless technology for creating personal networks
operating in the 2.4 GHz unlicensed band, with a range of 10 meters.
Networks are usually formed ad-hoc from portable devices such as
cellular phones, handhelds and laptops. Unlike the other popular
wireless technology, Wi-Fi, Bluetooth offers higher level service
profiles, e.g. FTP-like file servers, file pushing, voice transport,
serial line emulation, and more.

The Bluetooth stack in FreeBSD is implemented using the Netgraph
framework (see
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4>`__).
A broad variety of Bluetooth USB dongles is supported by the
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__
driver. The Broadcom BCM2033 chip based Bluetooth devices are supported
via the
`ubtbcmfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubtbcmfw&sektion=4>`__
and
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__
drivers. The 3Com Bluetooth PC Card 3CRWB60-A is supported by the
`ng\_bt3c(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bt3c&sektion=4>`__
driver. Serial and UART based Bluetooth devices are supported via
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__,
`ng\_h4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_h4&sektion=4>`__
and
`hcseriald(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcseriald&sektion=8>`__.
This section describes the use of the USB Bluetooth dongle.

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

31.4.2. Plugging in the Device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default Bluetooth device drivers are available as kernel modules.
Before attaching a device, you will need to load the driver into the
kernel:

.. code:: screen

    # kldload ng_ubt

If the Bluetooth device is present in the system during system startup,
load the module from ``/boot/loader.conf``:

.. code:: programlisting

    ng_ubt_load="YES"

Plug in your USB dongle. The output similar to the following will appear
on the console (or in syslog):

.. code:: screen

    ubt0: vendor 0x0a12 product 0x0001, rev 1.10/5.25, addr 2
    ubt0: Interface 0 endpoints: interrupt=0x81, bulk-in=0x82, bulk-out=0x2
    ubt0: Interface 1 (alt.config 5) endpoints: isoc-in=0x83, isoc-out=0x3,
          wMaxPacketSize=49, nframes=6, buffer size=294

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The Bluetooth stack has to be started manually on FreeBSD 6.0, and on
FreeBSD 5.X before 5.5. It is done automatically from
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__ on
FreeBSD 5.5, 6.1 and newer.

Copy ``/usr/share/examples/netgraph/bluetooth/rc.bluetooth`` into some
convenient place, like ``/etc/rc.bluetooth``. This script is used to
start and stop the Bluetooth stack. It is a good idea to stop the stack
before unplugging the device, but it is not (usually) fatal. When
starting the stack, you will receive output similar to the following:

.. code:: screen

    # /etc/rc.bluetooth start ubt0
    BD_ADDR: 00:02:72:00:d4:1a
    Features: 0xff 0xff 0xf 00 00 00 00 00
    <3-Slot> <5-Slot> <Encryption> <Slot offset>
    <Timing accuracy> <Switch> <Hold mode> <Sniff mode>
    <Park mode> <RSSI> <Channel quality> <SCO link>
    <HV2 packets> <HV3 packets> <u-law log> <A-law log> <CVSD>
    <Paging scheme> <Power control> <Transparent SCO data>
    Max. ACL packet size: 192 bytes
    Number of ACL packets: 8
    Max. SCO packet size: 64 bytes
    Number of SCO packets: 8

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

31.4.3. Host Controller Interface (HCI)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Host Controller Interface (HCI) provides a command interface to the
baseband controller and link manager, and access to hardware status and
control registers. This interface provides a uniform method of accessing
the Bluetooth baseband capabilities. HCI layer on the Host exchanges
data and commands with the HCI firmware on the Bluetooth hardware. The
Host Controller Transport Layer (i.e. physical bus) driver provides both
HCI layers with the ability to exchange information with each other.

A single Netgraph node of type *hci* is created for a single Bluetooth
device. The HCI node is normally connected to the Bluetooth device
driver node (downstream) and the L2CAP node (upstream). All HCI
operations must be performed on the HCI node and not on the device
driver node. Default name for the HCI node is ?devicehci?. For more
details refer to the
`ng\_hci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hci&sektion=4>`__
manual page.

One of the most common tasks is discovery of Bluetooth devices in RF
proximity. This operation is called *inquiry*. Inquiry and other HCI
related operations are done with the
`hccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hccontrol&sektion=8>`__
utility. The example below shows how to find out which Bluetooth devices
are in range. You should receive the list of devices in a few seconds.
Note that a remote device will only answer the inquiry if it put into
*discoverable* mode.

.. code:: screen

    % hccontrol -n ubt0hci inquiry
    Inquiry result, num_responses=1
    Inquiry result #0
           BD_ADDR: 00:80:37:29:19:a4
           Page Scan Rep. Mode: 0x1
           Page Scan Period Mode: 00
           Page Scan Mode: 00
           Class: 52:02:04
           Clock offset: 0x78ef
    Inquiry complete. Status: No error [00]

``BD_ADDR`` is unique address of a Bluetooth device, similar to MAC
addresses of a network card. This address is needed for further
communication with a device. It is possible to assign human readable
name to a BD\_ADDR. The ``/etc/bluetooth/hosts`` file contains
information regarding the known Bluetooth hosts. The following example
shows how to obtain human readable name that was assigned to the remote
device:

.. code:: screen

    % hccontrol -n ubt0hci remote_name_request 00:80:37:29:19:a4
    BD_ADDR: 00:80:37:29:19:a4
    Name: Pav's T39

If you perform an inquiry on a remote Bluetooth device, it will find
your computer as ?your.host.name (ubt0)?. The name assigned to the local
device can be changed at any time.

The Bluetooth system provides a point-to-point connection (only two
Bluetooth units involved), or a point-to-multipoint connection. In the
point-to-multipoint connection the connection is shared among several
Bluetooth devices. The following example shows how to obtain the list of
active baseband connections for the local device:

.. code:: screen

    % hccontrol -n ubt0hci read_connection_list
    Remote BD_ADDR    Handle Type Mode Role Encrypt Pending Queue State
    00:80:37:29:19:a4     41  ACL    0 MAST    NONE       0     0 OPEN

A *connection handle* is useful when termination of the baseband
connection is required. Note, that it is normally not required to do it
by hand. The stack will automatically terminate inactive baseband
connections.

.. code:: screen

    # hccontrol -n ubt0hci disconnect 41
    Connection handle: 41
    Reason: Connection terminated by local host [0x16]

Refer to ``hccontrol help`` for a complete listing of available HCI
commands. Most of the HCI commands do not require superuser privileges.

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

31.4.4. Logical Link Control and Adaptation Protocol (L2CAP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Logical Link Control and Adaptation Protocol (L2CAP) provides
connection-oriented and connectionless data services to upper layer
protocols with protocol multiplexing capability and segmentation and
reassembly operation. L2CAP permits higher level protocols and
applications to transmit and receive L2CAP data packets up to 64
kilobytes in length.

L2CAP is based around the concept of *channels*. Channel is a logical
connection on top of baseband connection. Each channel is bound to a
single protocol in a many-to-one fashion. Multiple channels can be bound
to the same protocol, but a channel cannot be bound to multiple
protocols. Each L2CAP packet received on a channel is directed to the
appropriate higher level protocol. Multiple channels can share the same
baseband connection.

A single Netgraph node of type *l2cap* is created for a single Bluetooth
device. The L2CAP node is normally connected to the Bluetooth HCI node
(downstream) and Bluetooth sockets nodes (upstream). Default name for
the L2CAP node is ?devicel2cap?. For more details refer to the
`ng\_l2cap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2cap&sektion=4>`__
manual page.

A useful command is
`l2ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2ping&sektion=8>`__,
which can be used to ping other devices. Some Bluetooth implementations
might not return all of the data sent to them, so ``0 bytes`` in the
following example is normal.

.. code:: screen

    # l2ping -a 00:80:37:29:19:a4
    0 bytes from 0:80:37:29:19:a4 seq_no=0 time=48.633 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=1 time=37.551 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=2 time=28.324 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=3 time=46.150 ms result=0

The
`l2control(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2control&sektion=8>`__
utility is used to perform various operations on L2CAP nodes. This
example shows how to obtain the list of logical connections (channels)
and the list of baseband connections for the local device:

.. code:: screen

    % l2control -a 00:02:72:00:d4:1a read_channel_list
    L2CAP channels:
    Remote BD_ADDR     SCID/ DCID   PSM  IMTU/ OMTU State
    00:07:e0:00:0b:ca    66/   64     3   132/  672 OPEN
    % l2control -a 00:02:72:00:d4:1a read_connection_list
    L2CAP connections:
    Remote BD_ADDR    Handle Flags Pending State
    00:07:e0:00:0b:ca     41 O           0 OPEN

Another diagnostic tool is
`btsockstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=btsockstat&sektion=1>`__.
It does a job similar to as
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__
does, but for Bluetooth network-related data structures. The example
below shows the same logical connection as
`l2control(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2control&sektion=8>`__
above.

.. code:: screen

    % btsockstat
    Active L2CAP sockets
    PCB      Recv-Q Send-Q Local address/PSM       Foreign address   CID   State
    c2afe900      0      0 00:02:72:00:d4:1a/3     00:07:e0:00:0b:ca 66    OPEN
    Active RFCOMM sessions
    L2PCB    PCB      Flag MTU   Out-Q DLCs State
    c2afe900 c2b53380 1    127   0     Yes  OPEN
    Active RFCOMM sockets
    PCB      Recv-Q Send-Q Local address     Foreign address   Chan DLCI State
    c2e8bc80      0    250 00:02:72:00:d4:1a 00:07:e0:00:0b:ca 3    6    OPEN

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

31.4.5. RFCOMM Protocol
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The RFCOMM protocol provides emulation of serial ports over the L2CAP
protocol. The protocol is based on the ETSI standard TS 07.10. RFCOMM is
a simple transport protocol, with additional provisions for emulating
the 9 circuits of RS-232 (EIATIA-232-E) serial ports. The RFCOMM
protocol supports up to 60 simultaneous connections (RFCOMM channels)
between two Bluetooth devices.

For the purposes of RFCOMM, a complete communication path involves two
applications running on different devices (the communication endpoints)
with a communication segment between them. RFCOMM is intended to cover
applications that make use of the serial ports of the devices in which
they reside. The communication segment is a Bluetooth link from one
device to another (direct connect).

RFCOMM is only concerned with the connection between the devices in the
direct connect case, or between the device and a modem in the network
case. RFCOMM can support other configurations, such as modules that
communicate via Bluetooth wireless technology on one side and provide a
wired interface on the other side.

In FreeBSD the RFCOMM protocol is implemented at the Bluetooth sockets
layer.

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

31.4.6. Pairing of Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, Bluetooth communication is not authenticated, and any device
can talk to any other device. A Bluetooth device (for example, cellular
phone) may choose to require authentication to provide a particular
service (for example, Dial-Up service). Bluetooth authentication is
normally done with *PIN codes*. A PIN code is an ASCII string up to 16
characters in length. User is required to enter the same PIN code on
both devices. Once user has entered the PIN code, both devices will
generate a *link key*. After that the link key can be stored either in
the devices themselves or in a persistent storage. Next time both
devices will use previously generated link key. The described above
procedure is called *pairing*. Note that if the link key is lost by any
device then pairing must be repeated.

The
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
daemon is responsible for handling of all Bluetooth authentication
requests. The default configuration file is
``/etc/bluetooth/hcsecd.conf``. An example section for a cellular phone
with the PIN code arbitrarily set to ?1234? is shown below:

.. code:: programlisting

    device {
            bdaddr  00:80:37:29:19:a4;
            name    "Pav's T39";
            key     nokey;
            pin     "1234";
          }

There is no limitation on PIN codes (except length). Some devices (for
example Bluetooth headsets) may have a fixed PIN code built in. The
``-d`` switch forces the
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
daemon to stay in the foreground, so it is easy to see what is
happening. Set the remote device to receive pairing and initiate the
Bluetooth connection to the remote device. The remote device should say
that pairing was accepted, and request the PIN code. Enter the same PIN
code as you have in ``hcsecd.conf``. Now your PC and the remote device
are paired. Alternatively, you can initiate pairing on the remote
device.

On FreeBSD 5.5, 6.1 and newer, the following line can be added to the
``/etc/rc.conf`` file to have hcsecd started automatically on system
start:

.. code:: programlisting

    hcsecd_enable="YES"

The following is a sample of the hcsecd daemon output:

.. code:: programlisting

    hcsecd[16484]: Got Link_Key_Request event from 'ubt0hci', remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Found matching entry, remote bdaddr 0:80:37:29:19:a4, name 'Pav's T39', link key doesn't exist
    hcsecd[16484]: Sending Link_Key_Negative_Reply to 'ubt0hci' for remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Got PIN_Code_Request event from 'ubt0hci', remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Found matching entry, remote bdaddr 0:80:37:29:19:a4, name 'Pav's T39', PIN code exists
    hcsecd[16484]: Sending PIN_Code_Reply to 'ubt0hci' for remote bdaddr 0:80:37:29:19:a4

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

31.4.7. Service Discovery Protocol (SDP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Service Discovery Protocol (SDP) provides the means for client
applications to discover the existence of services provided by server
applications as well as the attributes of those services. The attributes
of a service include the type or class of service offered and the
mechanism or protocol information needed to utilize the service.

SDP involves communication between a SDP server and a SDP client. The
server maintains a list of service records that describe the
characteristics of services associated with the server. Each service
record contains information about a single service. A client may
retrieve information from a service record maintained by the SDP server
by issuing a SDP request. If the client, or an application associated
with the client, decides to use a service, it must open a separate
connection to the service provider in order to utilize the service. SDP
provides a mechanism for discovering services and their attributes, but
it does not provide a mechanism for utilizing those services.

Normally, a SDP client searches for services based on some desired
characteristics of the services. However, there are times when it is
desirable to discover which types of services are described by an SDP
server's service records without any a priori information about the
services. This process of looking for any offered services is called
*browsing*.

The Bluetooth SDP server
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
and command line client
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__
are included in the standard FreeBSD installation. The following example
shows how to perform a SDP browse query.

.. code:: screen

    % sdpcontrol -a 00:01:03:fc:6e:ec browse
    Record Handle: 00000000
    Service Class ID List:
            Service Discovery Server (0x1000)
    Protocol Descriptor List:
            L2CAP (0x0100)
                    Protocol specific parameter #1: u/int/uuid16 1
                    Protocol specific parameter #2: u/int/uuid16 1

    Record Handle: 0x00000001
    Service Class ID List:
            Browse Group Descriptor (0x1001)

    Record Handle: 0x00000002
    Service Class ID List:
            LAN Access Using PPP (0x1102)
    Protocol Descriptor List:
            L2CAP (0x0100)
            RFCOMM (0x0003)
                    Protocol specific parameter #1: u/int8/bool 1
    Bluetooth Profile Descriptor List:
            LAN Access Using PPP (0x1102) ver. 1.0

... and so on. Note that each service has a list of attributes (RFCOMM
channel for example). Depending on the service you might need to make a
note of some of the attributes. Some Bluetooth implementations do not
support service browsing and may return an empty list. In this case it
is possible to search for the specific service. The example below shows
how to search for the OBEX Object Push (OPUSH) service:

.. code:: screen

    % sdpcontrol -a 00:01:03:fc:6e:ec search OPUSH

Offering services on FreeBSD to Bluetooth clients is done with the
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
server. On FreeBSD 5.5, 6.1 and newer, the following line can be added
to the ``/etc/rc.conf`` file:

.. code:: programlisting

    sdpd_enable="YES"

Then the sdpd daemon can be started with:

.. code:: screen

    # /etc/rc.d/sdpd start

On FreeBSD 6.0, and on FreeBSD 5.X before 5.5, sdpd is not integrated
into the system startup scripts. It has to be started manually with:

.. code:: screen

    # sdpd

The local server application that wants to provide Bluetooth service to
the remote clients will register service with the local SDP daemon. The
example of such application is
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__.
Once started it will register Bluetooth LAN service with the local SDP
daemon.

The list of services registered with the local SDP server can be
obtained by issuing SDP browse query via local control channel:

.. code:: screen

    # sdpcontrol -l browse

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

31.4.8. Dial-Up Networking (DUN) and Network Access with PPP (LAN) Profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Dial-Up Networking (DUN) profile is mostly used with modems and
cellular phones. The scenarios covered by this profile are the
following:

.. raw:: html

   <div class="itemizedlist">

-  use of a cellular phone or modem by a computer as a wireless modem
   for connecting to a dial-up Internet access server, or using other
   dial-up services;

-  use of a cellular phone or modem by a computer to receive data calls.

.. raw:: html

   </div>

Network Access with PPP (LAN) profile can be used in the following
situations:

.. raw:: html

   <div class="itemizedlist">

-  LAN access for a single Bluetooth device;

-  LAN access for multiple Bluetooth devices;

-  PC to PC (using PPP networking over serial cable emulation).

.. raw:: html

   </div>

In FreeBSD both profiles are implemented with
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ and
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
- a wrapper that converts RFCOMM Bluetooth connection into something PPP
can operate with. Before any profile can be used, a new PPP label in the
``/etc/ppp/ppp.conf`` must be created. Consult
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
manual page for examples.

In the following example
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
will be used to open RFCOMM connection to remote device with BD\_ADDR
00:80:37:29:19:a4 on DUN RFCOMM channel. The actual RFCOMM channel
number will be obtained from the remote device via SDP. It is possible
to specify RFCOMM channel by hand, and in this case
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
will not perform SDP query. Use
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__
to find out RFCOMM channel on the remote device.

.. code:: screen

    # rfcomm_pppd -a 00:80:37:29:19:a4 -c -C dun -l rfcomm-dialup

In order to provide Network Access with PPP (LAN) service the
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
server must be running. A new entry for LAN clients must be created in
the ``/etc/ppp/ppp.conf`` file. Consult
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
manual page for examples. Finally, start RFCOMM PPP server on valid
RFCOMM channel number. The RFCOMM PPP server will automatically register
Bluetooth LAN service with the local SDP daemon. The example below shows
how to start RFCOMM PPP server.

.. code:: screen

    # rfcomm_pppd -s -C 7 -l rfcomm-server

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

31.4.9. OBEX Object Push (OPUSH) Profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OBEX is a widely used protocol for simple file transfers between mobile
devices. Its main use is in infrared communication, where it is used for
generic file transfers between notebooks or PDAs, and for sending
business cards or calendar entries between cellular phones and other
devices with PIM applications.

The OBEX server and client are implemented as a third-party package
obexapp, which is available as
`comms/obexapp <http://www.freebsd.org/cgi/url.cgi?ports/comms/obexapp/pkg-descr>`__
port.

OBEX client is used to push and/or pull objects from the OBEX server. An
object can, for example, be a business card or an appointment. The OBEX
client can obtain RFCOMM channel number from the remote device via SDP.
This can be done by specifying service name instead of RFCOMM channel
number. Supported service names are: IrMC, FTRN and OPUSH. It is
possible to specify RFCOMM channel as a number. Below is an example of
an OBEX session, where device information object is pulled from the
cellular phone, and a new object (business card) is pushed into the
phone's directory.

.. code:: screen

    % obexapp -a 00:80:37:29:19:a4 -C IrMC
    obex> get telecom/devinfo.txt devinfo-t39.txt
    Success, response: OK, Success (0x20)
    obex> put new.vcf
    Success, response: OK, Success (0x20)
    obex> di
    Success, response: OK, Success (0x20)

In order to provide OBEX Object Push service,
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
server must be running. A root folder, where all incoming objects will
be stored, must be created. The default path to the root folder is
``/var/spool/obex``. Finally, start OBEX server on valid RFCOMM channel
number. The OBEX server will automatically register OBEX Object Push
service with the local SDP daemon. The example below shows how to start
OBEX server.

.. code:: screen

    # obexapp -s -C 10

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

31.4.10. Serial Port Profile (SPP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Serial Port Profile (SPP) allows Bluetooth devices to perform RS232
(or similar) serial cable emulation. The scenario covered by this
profile deals with legacy applications using Bluetooth as a cable
replacement, through a virtual serial port abstraction.

The
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
utility implements the Serial Port profile. A pseudo tty is used as a
virtual serial port abstraction. The example below shows how to connect
to a remote device Serial Port service. Note that you do not have to
specify a RFCOMM channel -
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
can obtain it from the remote device via SDP. If you would like to
override this, specify a RFCOMM channel on the command line.

.. code:: screen

    # rfcomm_sppd -a 00:07:E0:00:0B:CA -t /dev/ttyp6
    rfcomm_sppd[94692]: Starting on /dev/ttyp6...

Once connected, the pseudo tty can be used as serial port:

.. code:: screen

    # cu -l ttyp6

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

31.4.11. Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~

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

31.4.11.1. A remote device cannot connect
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some older Bluetooth devices do not support role switching. By default,
when FreeBSD is accepting a new connection, it tries to perform a role
switch and become master. Devices, which do not support this will not be
able to connect. Note that role switching is performed when a new
connection is being established, so it is not possible to ask the remote
device if it does support role switching. There is a HCI option to
disable role switching on the local side:

.. code:: screen

    # hccontrol -n ubt0hci write_node_role_switch 0

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

31.4.11.2. Something is going wrong, can I see what exactly is happening?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Yes, you can. Use the third-party package hcidump, which is available as
`comms/hcidump <http://www.freebsd.org/cgi/url.cgi?ports/comms/hcidump/pkg-descr>`__
port. The hcidump utility is similar to
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__.
It can be used to display the content of the Bluetooth packets on the
terminal and to dump the Bluetooth packets to a file.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------------+------------------------------------------+
| `????? <network-wireless.html>`__?   | `???? <advanced-networking.html>`__   | ?\ `??????? <network-bridging.html>`__   |
+--------------------------------------+---------------------------------------+------------------------------------------+
| 31.3. Wireless Networking?           | `???? <index.html>`__                 | ?31.5. Bridging                          |
+--------------------------------------+---------------------------------------+------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
