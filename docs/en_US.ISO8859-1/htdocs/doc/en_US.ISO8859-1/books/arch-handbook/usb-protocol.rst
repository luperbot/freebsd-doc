======================================
13.5.?USB Drivers Protocol Information
======================================

.. raw:: html

   <div class="navheader">

13.5.?USB Drivers Protocol Information
`Prev <usb-devprobe.html>`__?
Chapter?13.?USB Devices
?\ `Next <newbus.html>`__

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

13.5.?USB Drivers Protocol Information
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The protocol used over pipes other than the default pipe is undefined by
the USB specification. Information on this can be found from various
sources. The most accurate source is the developer's section on the USB
home pages. From these pages, a growing number of deviceclass
specifications are available. These specifications specify what a
compliant device should look like from a driver perspective, basic
functionality it needs to provide and the protocol that is to be used
over the communication channels. The USB specification includes the
description of the Hub Class. A class specification for Human Interface
Devices (HID) has been created to cater for keyboards, tablets, bar-code
readers, buttons, knobs, switches, etc. A third example is the class
specification for mass storage devices. For a full list of device
classes see the developers section on the USB home pages.

For many devices the protocol information has not yet been published
however. Information on the protocol being used might be available from
the company making the device. Some companies will require you to sign a
Non -Disclosure Agreement (NDA) before giving you the specifications.
This in most cases precludes making the driver open source.

Another good source of information is the Linux driver sources, as a
number of companies have started to provide drivers for Linux for their
devices. It is always a good idea to contact the authors of those
drivers for their source of information.

Example: Human Interface Devices The specification for the Human
Interface Devices like keyboards, mice, tablets, buttons, dials,etc. is
referred to in other device class specifications and is used in many
devices.

For example audio speakers provide endpoints to the digital to analogue
converters and possibly an extra pipe for a microphone. They also
provide a HID endpoint in a separate interface for the buttons and dials
on the front of the device. The same is true for the monitor control
class. It is straightforward to build support for these interfaces
through the available kernel and userland libraries together with the
HID class driver or the generic driver. Another device that serves as an
example for interfaces within one configuration driven by different
device drivers is a cheap keyboard with built-in legacy mouse port. To
avoid having the cost of including the hardware for a USB hub in the
device, manufacturers combined the mouse data received from the PS/2
port on the back of the keyboard and the key presses from the keyboard
into two separate interfaces in the same configuration. The mouse and
keyboard drivers each attach to the appropriate interface and allocate
the pipes to the two independent endpoints.

Example: Firmware download Many devices that have been developed are
based on a general purpose processor with an additional USB core added
to it. Because the development of drivers and firmware for USB devices
is still very new, many devices require the downloading of the firmware
after they have been connected.

The procedure followed is straightforward. The device identifies itself
through a vendor and product Id. The first driver probes and attaches to
it and downloads the firmware into it. After that the device soft resets
itself and the driver is detached. After a short pause the device
announces its presence on the bus. The device will have changed its
vendor/product/revision Id to reflect the fact that it has been supplied
with firmware and as a consequence a second driver will probe it and
attach to it.

An example of these types of devices is the ActiveWire I/O board, based
on the EZ-USB chip. For this chip a generic firmware downloader is
available. The firmware downloaded into the ActiveWire board changes the
revision Id. It will then perform a soft reset of the USB part of the
EZ-USB chip to disconnect from the USB bus and again reconnect.

Example: Mass Storage Devices Support for mass storage devices is mainly
built around existing protocols. The Iomega USB Zipdrive is based on the
SCSI version of their drive. The SCSI commands and status messages are
wrapped in blocks and transferred over the bulk pipes to and from the
device, emulating a SCSI controller over the USB wire. ATAPI and UFI
commands are supported in a similar fashion.

The Mass Storage Specification supports 2 different types of wrapping of
the command block.The initial attempt was based on sending the command
and status through the default pipe and using bulk transfers for the
data to be moved between the host and the device. Based on experience a
second approach was designed that was based on wrapping the command and
status blocks and sending them over the bulk out and in endpoint. The
specification specifies exactly what has to happen when and what has to
be done in case an error condition is encountered. The biggest challenge
when writing drivers for these devices is to fit USB based protocol into
the existing support for mass storage devices. CAM provides hooks to do
this in a fairly straight forward way. ATAPI is less simple as
historically the IDE interface has never had many different appearances.

The support for the USB floppy from Y-E Data is again less
straightforward as a new command set has been designed.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-----------------------------+
| `Prev <usb-devprobe.html>`__?    | `Up <usb.html>`__       | ?\ `Next <newbus.html>`__   |
+----------------------------------+-------------------------+-----------------------------+
| 13.4.?Device Probe and Attach?   | `Home <index.html>`__   | ?Chapter?14.?Newbus         |
+----------------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
