===========================================================================================
10.4.?Configuration File and the Order of Identifying and Probing During Auto-Configuration
===========================================================================================

.. raw:: html

   <div class="navheader">

10.4.?Configuration File and the Order of Identifying and Probing During
Auto-Configuration
`Prev <isa-driver-device-t.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-resources.html>`__

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

10.4.?Configuration File and the Order of Identifying and Probing During Auto-Configuration
-------------------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ISA devices are described in the kernel configuration file like:

.. code:: programlisting

    device xxx0 at isa? port 0x300 irq 10 drq 5
           iomem 0xd0000 flags 0x1 sensitive

The values of port, IRQ and so on are converted to the resource values
associated with the device. They are optional, depending on the device's
needs and abilities for auto-configuration. For example, some devices do
not need DRQ at all and some allow the driver to read the IRQ setting
from the device configuration ports. If a machine has multiple ISA buses
the exact bus may be specified in the configuration line, like ``isa0``
or ``isa1``, otherwise the device would be searched for on all the ISA
buses.

``sensitive`` is a resource requesting that this device must be probed
before all non-sensitive devices. It is supported but does not seem to
be used in any current driver.

For legacy ISA devices in many cases the drivers are still able to
detect the configuration parameters. But each device to be configured in
the system must have a config line. If two devices of some type are
installed in the system but there is only one configuration line for the
corresponding driver, ie:

.. code:: programlisting

    device xxx0 at isa?

then only one device will be configured.

But for the devices supporting automatic identification by the means of
Plug-n-Play or some proprietary protocol one configuration line is
enough to configure all the devices in the system, like the one above or
just simply:

.. code:: programlisting

    device xxx at isa?

If a driver supports both auto-identified and legacy devices and both
kinds are installed at once in one machine then it is enough to describe
in the config file the legacy devices only. The auto-identified devices
will be added automatically.

When an ISA bus is auto-configured the events happen as follows:

All the drivers' identify routines (including the PnP identify routine
which identifies all the PnP devices) are called in random order. As
they identify the devices they add them to the list on the ISA bus.
Normally the drivers' identify routines associate their drivers with the
new devices. The PnP identify routine does not know about the other
drivers yet so it does not associate any with the new devices it adds.

The PnP devices are put to sleep using the PnP protocol to prevent them
from being probed as legacy devices.

The probe routines of non-PnP devices marked as ``sensitive`` are
called. If probe for a device went successfully, the attach routine is
called for it.

The probe and attach routines of all non-PNP devices are called
likewise.

The PnP devices are brought back from the sleep state and assigned the
resources they request: I/O and memory address ranges, IRQs and DRQs,
all of them not conflicting with the attached legacy devices.

Then for each PnP device the probe routines of all the present ISA
drivers are called. The first one that claims the device gets attached.
It is possible that multiple drivers would claim the device with
different priority; in this case, the highest-priority driver wins. The
probe routines must call ``ISA_PNP_PROBE()`` to compare the actual PnP
ID with the list of the IDs supported by the driver and if the ID is not
in the table return failure. That means that absolutely every driver,
even the ones not supporting any PnP devices must call
``ISA_PNP_PROBE()``, at least with an empty PnP ID table to return
failure on unknown PnP devices.

The probe routine returns a positive value (the error code) on error,
zero or negative value on success.

The negative return values are used when a PnP device supports multiple
interfaces. For example, an older compatibility interface and a newer
advanced interface which are supported by different drivers. Then both
drivers would detect the device. The driver which returns a higher value
in the probe routine takes precedence (in other words, the driver
returning 0 has highest precedence, returning -1 is next, returning -2
is after it and so on). In result the devices which support only the old
interface will be handled by the old driver (which should return -1 from
the probe routine) while the devices supporting the new interface as
well will be handled by the new driver (which should return 0 from the
probe routine). If multiple drivers return the same value then the one
called first wins. So if a driver returns value 0 it may be sure that it
won the priority arbitration.

The device-specific identify routines can also assign not a driver but a
class of drivers to the device. Then all the drivers in the class are
probed for this device, like the case with PnP. This feature is not
implemented in any existing driver and is not considered further in this
document.

Because the PnP devices are disabled when probing the legacy devices
they will not be attached twice (once as legacy and once as PnP). But in
case of device-dependent identify routines it is the responsibility of
the driver to make sure that the same device will not be attached by the
driver twice: once as legacy user-configured and once as
auto-identified.

Another practical consequence for the auto-identified devices (both PnP
and device-specific) is that the flags can not be passed to them from
the kernel configuration file. So they must either not use the flags at
all or use the flags from the device unit 0 for all the auto-identified
devices or use the sysctl interface instead of flags.

Other unusual configurations may be accommodated by accessing the
configuration resources directly with functions of families
``resource_query_*()`` and ``resource_*_value()``. Their implementations
are located in ``kern/subr_bus.c``. The old IDE disk driver
``i386/isa/wd.c`` contains examples of such use. But the standard means
of configuration must always be preferred. Leave parsing the
configuration resources to the bus configuration code.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------+-------------------------------------------+
| `Prev <isa-driver-device-t.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-resources.html>`__   |
+----------------------------------------+----------------------------+-------------------------------------------+
| 10.3.?\ ``device_t`` Pointer?          | `Home <index.html>`__      | ?10.5.?Resources                          |
+----------------------------------------+----------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
