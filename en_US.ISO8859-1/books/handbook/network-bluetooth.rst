===============
31.5.?Bluetooth
===============

.. raw:: html

   <div class="navheader">

31.5.?Bluetooth
`Prev <network-usb-tethering.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <network-bridging.html>`__

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

31.5.?Bluetooth
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

Bluetooth is a wireless technology for creating personal networks
operating in the 2.4 GHz unlicensed band, with a range of 10 meters.
Networks are usually formed ad-hoc from portable devices such as
cellular phones, handhelds, and laptops. Unlike Wi-Fi wireless
technology, Bluetooth offers higher level service profiles, such as
FTP-like file servers, file pushing, voice transport, serial line
emulation, and more.

This section describes the use of a USB Bluetooth dongle on a FreeBSD
system. It then describes the various Bluetooth protocols and utilities.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.5.1.?Loading Bluetooth Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Bluetooth stack in FreeBSD is implemented using the
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4>`__
framework. A broad variety of Bluetooth USB dongles is supported by
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__.
Broadcom BCM2033 based Bluetooth devices are supported by the
`ubtbcmfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubtbcmfw&sektion=4>`__
and
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__
drivers. The 3Com Bluetooth PC Card 3CRWB60-A is supported by the
`ng\_bt3c(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bt3c&sektion=4>`__
driver. Serial and UART based Bluetooth devices are supported by
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__,
`ng\_h4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_h4&sektion=4>`__,
and
`hcseriald(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcseriald&sektion=8>`__.

Before attaching a device, determine which of the above drivers it uses,
then load the driver. For example, if the device uses the
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__
driver:

.. code:: screen

    # kldload ng_ubt

If the Bluetooth device will be attached to the system during system
startup, the system can be configured to load the module at boot time by
adding the driver to ``/boot/loader.conf``:

.. code:: programlisting

    ng_ubt_load="YES"

Once the driver is loaded, plug in the USB dongle. If the driver load
was successful, output similar to the following should appear on the
console and in ``/var/log/messages``:

.. code:: screen

    ubt0: vendor 0x0a12 product 0x0001, rev 1.10/5.25, addr 2
    ubt0: Interface 0 endpoints: interrupt=0x81, bulk-in=0x82, bulk-out=0x2
    ubt0: Interface 1 (alt.config 5) endpoints: isoc-in=0x83, isoc-out=0x3,
          wMaxPacketSize=49, nframes=6, buffer size=294

To start and stop the Bluetooth stack, use its startup script. It is a
good idea to stop the stack before unplugging the device. When starting
the stack, the output should be similar to the following:

.. code:: screen

    # service bluetooth start ubt0
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

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.5.2.?Finding Other Bluetooth Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Host Controller Interface (HCI) provides a uniform method for
accessing Bluetooth baseband capabilities. In FreeBSD, a netgraph HCI
node is created for each Bluetooth device. For more details, refer to
`ng\_hci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hci&sektion=4>`__.

One of the most common tasks is discovery of Bluetooth devices within RF
proximity. This operation is called *inquiry*. Inquiry and other HCI
related operations are done using
`hccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hccontrol&sektion=8>`__.
The example below shows how to find out which Bluetooth devices are in
range. The list of devices should be displayed in a few seconds. Note
that a remote device will only answer the inquiry if it is set to
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

The ``BD_ADDR`` is the unique address of a Bluetooth device, similar to
the MAC address of a network card. This address is needed for further
communication with a device and it is possible to assign a human
readable name to a BD\_ADDR. Information regarding the known Bluetooth
hosts is contained in ``/etc/bluetooth/hosts``. The following example
shows how to obtain the human readable name that was assigned to the
remote device:

.. code:: screen

    % hccontrol -n ubt0hci remote_name_request 00:80:37:29:19:a4
    BD_ADDR: 00:80:37:29:19:a4
    Name: Pav's T39

If an inquiry is performed on a remote Bluetooth device, it will find
the computer as “your.host.name (ubt0)”. The name assigned to the local
device can be changed at any time.

The Bluetooth system provides a point-to-point connection between two
Bluetooth units, or a point-to-multipoint connection which is shared
among several Bluetooth devices. The following example shows how to
obtain the list of active baseband connections for the local device:

.. code:: screen

    % hccontrol -n ubt0hci read_connection_list
    Remote BD_ADDR    Handle Type Mode Role Encrypt Pending Queue State
    00:80:37:29:19:a4     41  ACL    0 MAST    NONE       0     0 OPEN

A *connection handle* is useful when termination of the baseband
connection is required, though it is normally not required to do this by
hand. The stack will automatically terminate inactive baseband
connections.

.. code:: screen

    # hccontrol -n ubt0hci disconnect 41
    Connection handle: 41
    Reason: Connection terminated by local host [0x16]

Type ``hccontrol help`` for a complete listing of available HCI
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

31.5.3.?Device Pairing
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, Bluetooth communication is not authenticated, and any device
can talk to any other device. A Bluetooth device, such as a cellular
phone, may choose to require authentication to provide a particular
service. Bluetooth authentication is normally done with a *PIN code*, an
ASCII string up to 16 characters in length. The user is required to
enter the same PIN code on both devices. Once the user has entered the
PIN code, both devices will generate a *link key*. After that, the link
key can be stored either in the devices or in a persistent storage. Next
time, both devices will use the previously generated link key. This
procedure is called *pairing*. Note that if the link key is lost by
either device, the pairing must be repeated.

The
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
daemon is responsible for handling Bluetooth authentication requests.
The default configuration file is ``/etc/bluetooth/hcsecd.conf``. An
example section for a cellular phone with the PIN code set to ``1234``
is shown below:

.. code:: programlisting

    device {
            bdaddr  00:80:37:29:19:a4;
            name    "Pav's T39";
            key     nokey;
            pin     "1234";
          }

The only limitation on PIN codes is length. Some devices, such as
Bluetooth headsets, may have a fixed PIN code built in. The ``-d``
switch forces
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
to stay in the foreground, so it is easy to see what is happening. Set
the remote device to receive pairing and initiate the Bluetooth
connection to the remote device. The remote device should indicate that
pairing was accepted and request the PIN code. Enter the same PIN code
listed in ``hcsecd.conf``. Now the computer and the remote device are
paired. Alternatively, pairing can be initiated on the remote device.

The following line can be added to ``/etc/rc.conf`` to configure
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
to start automatically on system start:

.. code:: programlisting

    hcsecd_enable="YES"

The following is a sample of the
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
daemon output:

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

31.5.4.?Network Access with PPP Profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A Dial-Up Networking (DUN) profile can be used to configure a cellular
phone as a wireless modem for connecting to a dial-up Internet access
server. It can also be used to configure a computer to receive data
calls from a cellular phone.

Network access with a PPP profile can be used to provide LAN access for
a single Bluetooth device or multiple Bluetooth devices. It can also
provide PC to PC connection using PPP networking over serial cable
emulation.

In FreeBSD, these profiles are implemented with
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ and
the
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
wrapper which converts a Bluetooth connection into something PPP can
use. Before a profile can be used, a new PPP label must be created in
``/etc/ppp/ppp.conf``. Consult
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
for examples.

In this example,
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
is used to open a connection to a remote device with a ``BD_ADDR`` of
``00:80:37:29:19:a4`` on a DUN RFCOMM channel:

.. code:: screen

    # rfcomm_pppd -a 00:80:37:29:19:a4 -c -C dun -l rfcomm-dialup

The actual channel number will be obtained from the remote device using
the SDP protocol. It is possible to specify the RFCOMM channel by hand,
and in this case
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
will not perform the SDP query. Use
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__
to find out the RFCOMM channel on the remote device.

In order to provide network access with the PPP LAN service,
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
must be running and a new entry for LAN clients must be created in
``/etc/ppp/ppp.conf``. Consult
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
for examples. Finally, start the RFCOMM PPP server on a valid RFCOMM
channel number. The RFCOMM PPP server will automatically register the
Bluetooth LAN service with the local SDP daemon. The example below shows
how to start the RFCOMM PPP server.

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

31.5.5.?Bluetooth Protocols
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides an overview of the various Bluetooth protocols,
their function, and associated utilities.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.5.5.1.?Logical Link Control and Adaptation Protocol (L2CAP)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Logical Link Control and Adaptation Protocol (L2CAP) provides
connection-oriented and connectionless data services to upper layer
protocols. L2CAP permits higher level protocols and applications to
transmit and receive L2CAP data packets up to 64 kilobytes in length.

L2CAP is based around the concept of *channels*. A channel is a logical
connection on top of a baseband connection, where each channel is bound
to a single protocol in a many-to-one fashion. Multiple channels can be
bound to the same protocol, but a channel cannot be bound to multiple
protocols. Each L2CAP packet received on a channel is directed to the
appropriate higher level protocol. Multiple channels can share the same
baseband connection.

In FreeBSD, a netgraph L2CAP node is created for each Bluetooth device.
This node is normally connected to the downstream Bluetooth HCI node and
upstream Bluetooth socket nodes. The default name for the L2CAP node is
“devicel2cap”. For more details refer to
`ng\_l2cap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2cap&sektion=4>`__.

A useful command is
`l2ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2ping&sektion=8>`__,
which can be used to ping other devices. Some Bluetooth implementations
might not return all of the data sent to them, so ``0         bytes`` in
the following example is normal.

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
It is similar to
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__,
but for Bluetooth network-related data structures. The example below
shows the same logical connection as
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

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.5.5.2.?Radio Frequency Communication (RFCOMM)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The RFCOMM protocol provides emulation of serial ports over the L2CAP
protocol. RFCOMM is a simple transport protocol, with additional
provisions for emulating the 9 circuits of RS-232 (EIATIA-232-E) serial
ports. It supports up to 60 simultaneous connections (RFCOMM channels)
between two Bluetooth devices.

For the purposes of RFCOMM, a complete communication path involves two
applications running on the communication endpoints with a communication
segment between them. RFCOMM is intended to cover applications that make
use of the serial ports of the devices in which they reside. The
communication segment is a direct connect Bluetooth link from one device
to another.

RFCOMM is only concerned with the connection between the devices in the
direct connect case, or between the device and a modem in the network
case. RFCOMM can support other configurations, such as modules that
communicate via Bluetooth wireless technology on one side and provide a
wired interface on the other side.

In FreeBSD, RFCOMM is implemented at the Bluetooth sockets layer.

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

31.5.5.3.?Service Discovery Protocol (SDP)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
server's service records without any prior information about the
services. This process of looking for any offered services is called
*browsing*.

The Bluetooth SDP server,
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__,
and command line client,
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__,
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

Note that each service has a list of attributes, such as the RFCOMM
channel. Depending on the service, the user might need to make note of
some of the attributes. Some Bluetooth implementations do not support
service browsing and may return an empty list. In this case, it is
possible to search for the specific service. The example below shows how
to search for the OBEX Object Push (OPUSH) service:

.. code:: screen

    % sdpcontrol -a 00:01:03:fc:6e:ec search OPUSH

Offering services on FreeBSD to Bluetooth clients is done with the
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
server. The following line can be added to ``/etc/rc.conf``:

.. code:: programlisting

    sdpd_enable="YES"

Then the
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
daemon can be started with:

.. code:: screen

    # service sdpd start

The local server application that wants to provide a Bluetooth service
to remote clients will register the service with the local SDP daemon.
An example of such an application is
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__.
Once started, it will register the Bluetooth LAN service with the local
SDP daemon.

The list of services registered with the local SDP server can be
obtained by issuing a SDP browse query via the local control channel:

.. code:: screen

    # sdpcontrol -l browse

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

31.5.5.4.?OBEX Object Push (OPUSH)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Object Exchange (OBEX) is a widely used protocol for simple file
transfers between mobile devices. Its main use is in infrared
communication, where it is used for generic file transfers between
notebooks or PDAs, and for sending business cards or calendar entries
between cellular phones and other devices with Personal Information
Manager (PIM) applications.

The OBEX server and client are implemented by obexapp, which can be
installed using the
`comms/obexapp <http://www.freebsd.org/cgi/url.cgi?ports/comms/obexapp/pkg-descr>`__
package or port.

The OBEX client is used to push and/or pull objects from the OBEX
server. An example object is a business card or an appointment. The OBEX
client can obtain the RFCOMM channel number from the remote device via
SDP. This can be done by specifying the service name instead of the
RFCOMM channel number. Supported service names are: ``IrMC``, ``FTRN``,
and ``OPUSH``. It is also possible to specify the RFCOMM channel as a
number. Below is an example of an OBEX session where the device
information object is pulled from the cellular phone, and a new object,
the business card, is pushed into the phone's directory.

.. code:: screen

    % obexapp -a 00:80:37:29:19:a4 -C IrMC
    obex> get telecom/devinfo.txt devinfo-t39.txt
    Success, response: OK, Success (0x20)
    obex> put new.vcf
    Success, response: OK, Success (0x20)
    obex> di
    Success, response: OK, Success (0x20)

In order to provide the OPUSH service,
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
must be running and a root folder, where all incoming objects will be
stored, must be created. The default path to the root folder is
``/var/spool/obex``. Finally, start the OBEX server on a valid RFCOMM
channel number. The OBEX server will automatically register the OPUSH
service with the local SDP daemon. The example below shows how to start
the OBEX server.

.. code:: screen

    # obexapp -s -C 10

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

31.5.5.5.?Serial Port Profile (SPP)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Serial Port Profile (SPP) allows Bluetooth devices to perform serial
cable emulation. This profile allows legacy applications to use
Bluetooth as a cable replacement, through a virtual serial port
abstraction.

In FreeBSD,
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
implements SPP and a pseudo tty is used as a virtual serial port
abstraction. The example below shows how to connect to a remote device's
serial port service. A RFCOMM channel does not have to be specified as
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
can obtain it from the remote device via SDP. To override this, specify
a RFCOMM channel on the command line.

.. code:: screen

    # rfcomm_sppd -a 00:07:E0:00:0B:CA -t
    rfcomm_sppd[94692]: Starting on /dev/pts/6...
    /dev/pts/6

Once connected, the pseudo tty can be used as serial port:

.. code:: screen

    # cu -l /dev/pts/6

The pseudo tty is printed on stdout and can be read by wrapper scripts:

.. code:: programlisting

    PTS=`rfcomm_sppd -a 00:07:E0:00:0B:CA -t`
    cu -l $PTS

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

31.5.6.?Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, when FreeBSD is accepting a new connection, it tries to
perform a role switch and become master. Some older Bluetooth devices
which do not support role switching will not be able to connect. Since
role switching is performed when a new connection is being established,
it is not possible to ask the remote device if it supports role
switching. However, there is a HCI option to disable role switching on
the local side:

.. code:: screen

    # hccontrol -n ubt0hci write_node_role_switch 0

To display Bluetooth packets, use the third-party package hcidump, which
can be installed using the
`comms/hcidump <http://www.freebsd.org/cgi/url.cgi?ports/comms/hcidump/pkg-descr>`__
package or port. This utility is similar to
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
and can be used to display the contents of Bluetooth packets on the
terminal and to dump the Bluetooth packets to a file.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------------+---------------------------------------+
| `Prev <network-usb-tethering.html>`__?   | `Up <advanced-networking.html>`__   | ?\ `Next <network-bridging.html>`__   |
+------------------------------------------+-------------------------------------+---------------------------------------+
| 31.4.?USB Tethering?                     | `Home <index.html>`__               | ?31.6.?Bridging                       |
+------------------------------------------+-------------------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
