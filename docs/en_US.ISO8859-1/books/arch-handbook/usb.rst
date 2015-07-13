=======================
Chapter?13.?USB Devices
=======================

.. raw:: html

   <div class="navheader">

Chapter?13.?USB Devices
`Prev <scsi-timeout.html>`__?
Part?II.?Device Drivers
?\ `Next <usb-hc.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?13.?USB Devices
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Nick Hibma.

.. raw:: html

   </div>

.. raw:: html

   <div>

Modifications for Handbook made by Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`13.1. Introduction <usb.html#usb-intro>`__
`13.2. Host Controllers <usb-hc.html>`__
`13.3. USB Device Information <usb-dev.html>`__
`13.4. Device Probe and Attach <usb-devprobe.html>`__
`13.5. USB Drivers Protocol Information <usb-protocol.html>`__

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

13.1.?Introduction
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Universal Serial Bus (USB) is a new way of attaching devices to
personal computers. The bus architecture features two-way communication
and has been developed as a response to devices becoming smarter and
requiring more interaction with the host. USB support is included in all
current PC chipsets and is therefore available in all recently built
PCs. Apple's introduction of the USB-only iMac has been a major
incentive for hardware manufacturers to produce USB versions of their
devices. The future PC specifications specify that all legacy connectors
on PCs should be replaced by one or more USB connectors, providing
generic plug and play capabilities. Support for USB hardware was
available at a very early stage in NetBSD and was developed by Lennart
Augustsson for the NetBSD project. The code has been ported to FreeBSD
and we are currently maintaining a shared code base. For the
implementation of the USB subsystem a number of features of USB are
important.

*Lennart Augustsson has done most of the implementation of the USB
support for the NetBSD project. Many thanks for this incredible amount
of work. Many thanks also to Ardy and Dirk for their comments and
proofreading of this paper.*

.. raw:: html

   <div class="itemizedlist">

-  Devices connect to ports on the computer directly or on devices
   called hubs, forming a treelike device structure.

-  The devices can be connected and disconnected at run time.

-  Devices can suspend themselves and trigger resumes of the host system

-  As the devices can be powered from the bus, the host software has to
   keep track of power budgets for each hub.

-  Different quality of service requirements by the different device
   types together with the maximum of 126 devices that can be connected
   to the same bus, require proper scheduling of transfers on the shared
   bus to take full advantage of the 12Mbps bandwidth available. (over
   400Mbps with USB 2.0)

-  Devices are intelligent and contain easily accessible information
   about themselves

.. raw:: html

   </div>

The development of drivers for the USB subsystem and devices connected
to it is supported by the specifications that have been developed and
will be developed. These specifications are publicly available from the
USB home pages. Apple has been very strong in pushing for standards
based drivers, by making drivers for the generic classes available in
their operating system MacOS and discouraging the use of separate
drivers for each new device. This chapter tries to collate essential
information for a basic understanding of the USB 2.0 implementation
stack in FreeBSD/NetBSD. It is recommended however to read it together
with the relevant 2.0 specifications and other developer resources:

.. raw:: html

   <div class="itemizedlist">

-  USB 2.0 Specification
   (http://www.usb.org/developers/docs/usb20_docs/)

-  Universal Host Controller Interface (UHCI) Specification
   (`ftp://ftp.netbsd.org/pub/NetBSD/misc/blymn/uhci11d.pdf) <ftp://ftp.netbsd.org/pub/NetBSD/misc/blymn/uhci11d.pdf>`__

-  Open Host Controller Interface (OHCI)
   Specification(\ ftp://ftp.compaq.com/pub/supportinformation/papers/hcir1_0a.pdf)

-  Developer section of USB home page (http://www.usb.org/developers/)

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

13.1.1.?Structure of the USB Stack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The USB support in FreeBSD can be split into three layers. The lowest
layer contains the host controller driver, providing a generic interface
to the hardware and its scheduling facilities. It supports
initialisation of the hardware, scheduling of transfers and handling of
completed and/or failed transfers. Each host controller driver
implements a virtual hub providing hardware independent access to the
registers controlling the root ports on the back of the machine.

The middle layer handles the device connection and disconnection, basic
initialisation of the device, driver selection, the communication
channels (pipes) and does resource management. This services layer also
controls the default pipes and the device requests transferred over
them.

The top layer contains the individual drivers supporting specific
(classes of) devices. These drivers implement the protocol that is used
over the pipes other than the default pipe. They also implement
additional functionality to make the device available to other parts of
the kernel or userland. They use the USB driver interface (USBDI)
exposed by the services layer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------+-----------------------------+
| `Prev <scsi-timeout.html>`__?   | `Up <devicedrivers.html>`__   | ?\ `Next <usb-hc.html>`__   |
+---------------------------------+-------------------------------+-----------------------------+
| 12.7.?Timeout Handling?         | `Home <index.html>`__         | ?13.2.?Host Controllers     |
+---------------------------------+-------------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
