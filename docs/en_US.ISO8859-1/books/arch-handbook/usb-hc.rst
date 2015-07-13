======================
13.2.?Host Controllers
======================

.. raw:: html

   <div class="navheader">

13.2.?Host Controllers
`Prev <usb.html>`__?
Chapter?13.?USB Devices
?\ `Next <usb-dev.html>`__

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

13.2.?Host Controllers
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The host controller (HC) controls the transmission of packets on the
bus. Frames of 1 millisecond are used. At the start of each frame the
host controller generates a Start of Frame (SOF) packet.

The SOF packet is used to synchronise to the start of the frame and to
keep track of the frame number. Within each frame packets are
transferred, either from host to device (out) or from device to host
(in). Transfers are always initiated by the host (polled transfers).
Therefore there can only be one host per USB bus. Each transfer of a
packet has a status stage in which the recipient of the data can return
either ACK (acknowledge reception), NAK (retry), STALL (error condition)
or nothing (garbled data stage, device not available or disconnected).
Section 8.5 of the USB 2.0 Specification explains the details of packets
in more detail. Four different types of transfers can occur on a USB
bus: control, bulk, interrupt and isochronous. The types of transfers
and their characteristics are described below.

Large transfers between the device on the USB bus and the device driver
are split up into multiple packets by the host controller or the HC
driver.

Device requests (control transfers) to the default endpoints are
special. They consist of two or three phases: SETUP, DATA (optional) and
STATUS. The set-up packet is sent to the device. If there is a data
phase, the direction of the data packet(s) is given in the set-up
packet. The direction in the status phase is the opposite of the
direction during the data phase, or IN if there was no data phase. The
host controller hardware also provides registers with the current status
of the root ports and the changes that have occurred since the last
reset of the status change register. Access to these registers is
provided through a virtualised hub as suggested in the USB
specification. The virtual hub must comply with the hub device class
given in chapter 11 of that specification. It must provide a default
pipe through which device requests can be sent to it. It returns the
standard andhub class specific set of descriptors. It should also
provide an interrupt pipe that reports changes happening at its ports.
There are currently two specifications for host controllers available:
Universal Host Controller Interface (UHCI) from Intel and Open Host
Controller Interface (OHCI) from Compaq, Microsoft, and National
Semiconductor. The UHCI specification has been designed to reduce
hardware complexity by requiring the host controller driver to supply a
complete schedule of the transfers for each frame. OHCI type controllers
are much more independent by providing a more abstract interface doing a
lot of work themselves.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.2.1.?UHCI
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The UHCI host controller maintains a framelist with 1024 pointers to per
frame data structures. It understands two different data types: transfer
descriptors (TD) and queue heads (QH). Each TD represents a packet to be
communicated to or from a device endpoint. QHs are a means to groupTDs
(and QHs) together.

Each transfer consists of one or more packets. The UHCI driver splits
large transfers into multiple packets. For every transfer, apart from
isochronous transfers, a QH is allocated. For every type of transfer
these QHs are collected at a QH for that type. Isochronous transfers
have to be executed first because of the fixed latency requirement and
are directly referred to by the pointer in the framelist. The last
isochronous TD refers to the QH for interrupt transfers for that frame.
All QHs for interrupt transfers point at the QH for control transfers,
which in turn points at the QH for bulk transfers. The following diagram
gives a graphical overview of this:

This results in the following schedule being run in each frame. After
fetching the pointer for the current frame from the framelist the
controller first executes the TDs for all the isochronous packets in
that frame. The last of these TDs refers to the QH for the interrupt
transfers for thatframe. The host controller will then descend from that
QH to the QHs for the individual interrupt transfers. After finishing
that queue, the QH for the interrupt transfers will refer the controller
to the QH for all control transfers. It will execute all the subqueues
scheduled there, followed by all the transfers queued at the bulk QH. To
facilitate the handling of finished or failed transfers different types
of interrupts are generated by the hardware at the end of each frame. In
the last TD for a transfer the Interrupt-On Completion bit is set by the
HC driver to flag an interrupt when the transfer has completed. An error
interrupt is flagged if a TD reaches its maximum error count. If the
short packet detect bit is set in a TD and less than the set packet
length is transferred this interrupt is flagged to notify the controller
driver of the completed transfer. It is the host controller driver's
task to find out which transfer has completed or produced an error. When
called the interrupt service routine will locate all the finished
transfers and call their callbacks.

Refer to the UHCI Specification for a more elaborate description.

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

13.2.2.?OHCI
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Programming an OHCI host controller is much simpler. The controller
assumes that a set of endpoints is available, and is aware of scheduling
priorities and the ordering of the types of transfers in a frame. The
main data structure used by the host controller is the endpoint
descriptor (ED) to which a queue of transfer descriptors (TDs) is
attached. The ED contains the maximum packet size allowed for an
endpoint and the controller hardware does the splitting into packets.
The pointers to the data buffers are updated after each transfer and
when the start and end pointer are equal, the TD is retired to the
done-queue. The four types of endpoints (interrupt, isochronous,
control, and bulk) have their own queues. Control and bulk endpoints are
queued each at their own queue. Interrupt EDs are queued in a tree, with
the level in the tree defining the frequency at which they run.

The schedule being run by the host controller in each frame looks as
follows. The controller will first run the non-periodic control and bulk
queues, up to a time limit set by the HC driver. Then the interrupt
transfers for that frame number are run, by using the lower five bits of
the frame number as an index into level 0 of the tree of interrupts EDs.
At the end of this tree the isochronous EDs are connected and these are
traversed subsequently. The isochronous TDs contain the frame number of
the first frame the transfer should be run in. After all the periodic
transfers have been run, the control and bulk queues are traversed
again. Periodically the interrupt service routine is called to process
the done queue and call the callbacks for each transfer and reschedule
interrupt and isochronous endpoints.

See the UHCI Specification for a more elaborate description. The middle
layer provides access to the device in a controlled way and maintains
resources in use by the different drivers and the services layer. The
layer takes care of the following aspects:

.. raw:: html

   <div class="itemizedlist">

-  The device configuration information

-  The pipes to communicate with a device

-  Probing and attaching and detaching form a device.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+---------------------------------+
| `Prev <usb.html>`__?       | `Up <usb.html>`__       | ?\ `Next <usb-dev.html>`__      |
+----------------------------+-------------------------+---------------------------------+
| Chapter?13.?USB Devices?   | `Home <index.html>`__   | ?13.3.?USB Device Information   |
+----------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
