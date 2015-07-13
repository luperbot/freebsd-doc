=============================
13.4.?Device Probe and Attach
=============================

.. raw:: html

   <div class="navheader">

13.4.?Device Probe and Attach
`Prev <usb-dev.html>`__?
Chapter?13.?USB Devices
?\ `Next <usb-protocol.html>`__

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

13.4.?Device Probe and Attach
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After the notification by the hub that a new device has been connected,
the service layer switches on the port, providing the device with 100 mA
of current. At this point the device is in its default state and
listening to device address 0. The services layer will proceed to
retrieve the various descriptors through the default pipe. After that it
will send a Set Address request to move the device away from the default
device address (address 0). Multiple device drivers might be able to
support the device. For example a modem driver might be able to support
an ISDN TA through the AT compatibility interface. A driver for that
specific model of the ISDN adapter might however be able to provide much
better support for this device. To support this flexibility, the probes
return priorities indicating their level of support. Support for a
specific revision of a product ranks the highest and the generic driver
the lowest priority. It might also be that multiple drivers could attach
to one device if there are multiple interfaces within one configuration.
Each driver only needs to support a subset of the interfaces.

The probing for a driver for a newly attached device checks first for
device specific drivers. If not found, the probe code iterates over all
supported configurations until a driver attaches in a configuration. To
support devices with multiple drivers on different interfaces, the probe
iterates over all interfaces in a configuration that have not yet been
claimed by a driver. Configurations that exceed the power budget for the
hub are ignored. During attach the driver should initialise the device
to its proper state, but not reset it, as this will make the device
disconnect itself from the bus and restart the probing process for it.
To avoid consuming unnecessary bandwidth should not claim the interrupt
pipe at attach time, but should postpone allocating the pipe until the
file is opened and the data is actually used. When the file is closed
the pipe should be closed again, even though the device might still be
attached.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.4.1.?Device Disconnect and Detach
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A device driver should expect to receive errors during any transaction
with the device. The design of USB supports and encourages the
disconnection of devices at any point in time. Drivers should make sure
that they do the right thing when the device disappears.

Furthermore a device that has been disconnected and reconnected will not
be reattached at the same device instance. This might change in the
future when more devices support serial numbers (see the device
descriptor) or other means of defining an identity for a device have
been developed.

The disconnection of a device is signaled by a hub in the interrupt
packet delivered to the hub driver. The status change information
indicates which port has seen a connection change. The device detach
method for all device drivers for the device connected on that port are
called and the structures cleaned up. If the port status indicates that
in the mean time a device has been connected to that port, the procedure
for probing and attaching the device will be started. A device reset
will produce a disconnect-connect sequence on the hub and will be
handled as described above.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-------------------------------------------+
| `Prev <usb-dev.html>`__?        | `Up <usb.html>`__       | ?\ `Next <usb-protocol.html>`__           |
+---------------------------------+-------------------------+-------------------------------------------+
| 13.3.?USB Device Information?   | `Home <index.html>`__   | ?13.5.?USB Drivers Protocol Information   |
+---------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
