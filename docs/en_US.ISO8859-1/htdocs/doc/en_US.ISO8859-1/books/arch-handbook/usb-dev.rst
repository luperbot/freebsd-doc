============================
13.3.?USB Device Information
============================

.. raw:: html

   <div class="navheader">

13.3.?USB Device Information
`Prev <usb-hc.html>`__?
Chapter?13.?USB Devices
?\ `Next <usb-devprobe.html>`__

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

13.3.?USB Device Information
----------------------------

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

13.3.1.?Device Configuration Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Each device provides different levels of configuration information. Each
device has one or more configurations, of which one is selected during
probe/attach. A configuration provides power and bandwidth requirements.
Within each configuration there can be multiple interfaces. A device
interface is a collection of endpoints. For example USB speakers can
have an interface for the audio data (Audio Class) and an interface for
the knobs, dials and buttons (HID Class). All interfaces in a
configuration are active at the same time and can be attached to by
different drivers. Each interface can have alternates, providing
different quality of service parameters. In for example cameras this is
used to provide different frame sizes and numbers of frames per second.

Within each interface, 0 or more endpoints can be specified. Endpoints
are the unidirectional access points for communicating with a device.
They provide buffers to temporarily store incoming or outgoing data from
the device. Each endpoint has a unique address within a configuration,
the endpoint's number plus its direction. The default endpoint, endpoint
0, is not part of any interface and available in all configurations. It
is managed by the services layer and not directly available to device
drivers.

This hierarchical configuration information is described in the device
by a standard set of descriptors (see section 9.6 of the USB
specification). They can be requested through the Get Descriptor
Request. The services layer caches these descriptors to avoid
unnecessary transfers on the USB bus. Access to the descriptors is
provided through function calls.

.. raw:: html

   <div class="itemizedlist">

-  Device descriptors: General information about the device, like
   Vendor, Product and Revision Id, supported device class, subclass and
   protocol if applicable, maximum packet size for the default endpoint,
   etc.

-  Configuration descriptors: The number of interfaces in this
   configuration, suspend and resume functionality supported and power
   requirements.

-  Interface descriptors: interface class, subclass and protocol if
   applicable, number of alternate settings for the interface and the
   number of endpoints.

-  Endpoint descriptors: Endpoint address, direction and type, maximum
   packet size supported and polling frequency if type is interrupt
   endpoint. There is no descriptor for the default endpoint (endpoint
   0) and it is never counted in an interface descriptor.

-  String descriptors: In the other descriptors string indices are
   supplied for some fields.These can be used to retrieve descriptive
   strings, possibly in multiple languages.

.. raw:: html

   </div>

Class specifications can add their own descriptor types that are
available through the GetDescriptor Request.

Pipes Communication to end points on a device flows through so-called
pipes. Drivers submit transfers to endpoints to a pipe and provide a
callback to be called on completion or failure of the transfer
(asynchronous transfers) or wait for completion (synchronous transfer).
Transfers to an endpoint are serialised in the pipe. A transfer can
either complete, fail or time-out (if a time-out has been set). There
are two types of time-outs for transfers. Time-outs can happen due to
time-out on the USBbus (milliseconds). These time-outs are seen as
failures and can be due to disconnection of the device. A second form of
time-out is implemented in software and is triggered when a transfer
does not complete within a specified amount of time (seconds). These are
caused by a device acknowledging negatively (NAK) the transferred
packets. The cause for this is the device not being ready to receive
data, buffer under- or overrun or protocol errors.

If a transfer over a pipe is larger than the maximum packet size
specified in the associated endpoint descriptor, the host controller
(OHCI) or the HC driver (UHCI) will split the transfer into packets of
maximum packet size, with the last packet possibly smaller than the
maximum packet size.

Sometimes it is not a problem for a device to return less data than
requested. For example abulk-in-transfer to a modem might request 200
bytes of data, but the modem has only 5 bytes available at that time.
The driver can set the short packet (SPD) flag. It allows the host
controller to accept a packet even if the amount of data transferred is
less than requested. This flag is only valid for in-transfers, as the
amount of data to be sent to a device is always known beforehand. If an
unrecoverable error occurs in a device during a transfer the pipe is
stalled. Before any more data is accepted or sent the driver needs to
resolve the cause of the stall and clear the endpoint stall condition
through send the clear endpoint halt device request over the default
pipe. The default endpoint should never stall.

There are four different types of endpoints and corresponding pipes: -
Control pipe / default pipe: There is one control pipe per device,
connected to the default endpoint (endpoint 0). The pipe carries the
device requests and associated data. The difference between transfers
over the default pipe and other pipes is that the protocol for the
transfers is described in the USB specification. These requests are used
to reset and configure the device. A basic set of commands that must be
supported by each device is provided in chapter 9 of the USB
specification. The commands supported on this pipe can be extended by a
device class specification to support additional functionality.

.. raw:: html

   <div class="itemizedlist">

-  Bulk pipe: This is the USB equivalent to a raw transmission medium.

-  Interrupt pipe: The host sends a request for data to the device and
   if the device has nothing to send, it will NAK the data packet.
   Interrupt transfers are scheduled at a frequency specified when
   creating the pipe.

-  Isochronous pipe: These pipes are intended for isochronous data, for
   example video or audio streams, with fixed latency, but no guaranteed
   delivery. Some support for pipes of this type is available in the
   current implementation. Packets in control, bulk and interrupt
   transfers are retried if an error occurs during transmission or the
   device acknowledges the packet negatively (NAK) due to for example
   lack of buffer space to store the incoming data. Isochronous packets
   are however not retried in case of failed delivery or NAK of a packet
   as this might violate the timing constraints.

.. raw:: html

   </div>

The availability of the necessary bandwidth is calculated during the
creation of the pipe. Transfers are scheduled within frames of 1
millisecond. The bandwidth allocation within a frame is prescribed by
the USB specification, section 5.6 [ 2]. Isochronous and interrupt
transfers are allowed to consume up to 90% of the bandwidth within a
frame. Packets for control and bulk transfers are scheduled after all
isochronous and interrupt packets and will consume all the remaining
bandwidth.

More information on scheduling of transfers and bandwidth reclamation
can be found in chapter 5 of the USB specification, section 1.3 of the
UHCI specification, and section 3.4.2 of the OHCI specification.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+-----------------------------------+
| `Prev <usb-hc.html>`__?   | `Up <usb.html>`__       | ?\ `Next <usb-devprobe.html>`__   |
+---------------------------+-------------------------+-----------------------------------+
| 13.2.?Host Controllers?   | `Home <index.html>`__   | ?13.4.?Device Probe and Attach    |
+---------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
