=======================
10.3.?device\_t Pointer
=======================

.. raw:: html

   <div class="navheader">

10.3.?\ ``device_t`` Pointer
`Prev <isa-driver-basics.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-config.html>`__

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

10.3.?\ ``device_t`` Pointer
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``device_t`` is the pointer type for the device structure. Here we
consider only the methods interesting from the device driver writer's
standpoint. The methods to manipulate values in the device structure
are:

.. raw:: html

   <div class="itemizedlist">

-  ``device_t       device_get_parent(dev)`` Get the parent bus of a
   device.

-  ``driver_t       device_get_driver(dev)`` Get pointer to its driver
   structure.

-  ``char       *device_get_name(dev)`` Get the driver name, such as
   ``"xxx"`` for our example.

-  ``int device_get_unit(dev)`` Get the unit number (units are numbered
   from 0 for the devices associated with each driver).

-  ``char       *device_get_nameunit(dev)`` Get the device name
   including the unit number, such as “xxx0”, “xxx1” and so on.

-  ``char       *device_get_desc(dev)`` Get the device description.
   Normally it describes the exact model of device in human-readable
   form.

-  ``device_set_desc(dev,       desc)`` Set the description. This makes
   the device description point to the string desc which may not be
   deallocated or changed after that.

-  ``device_set_desc_copy(dev,       desc)`` Set the description. The
   description is copied into an internal dynamically allocated buffer,
   so the string desc may be changed afterwards without adverse effects.

-  ``void       *device_get_softc(dev)`` Get pointer to the device
   descriptor (struct ``xxx_softc``) associated with this device.

-  ``u_int32_t       device_get_flags(dev)`` Get the flags specified for
   the device in the configuration file.

.. raw:: html

   </div>

A convenience function ``device_printf(dev, fmt,     ...)`` may be used
to print the messages from the device driver. It automatically prepends
the unitname and colon to the message.

The device\_t methods are implemented in the file ``kern/bus_subr.c``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------+------------------------------------------------------------------------------------------------+
| `Prev <isa-driver-basics.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-config.html>`__                                                           |
+--------------------------------------+----------------------------+------------------------------------------------------------------------------------------------+
| 10.2.?Basic Information?             | `Home <index.html>`__      | ?10.4.?Configuration File and the Order of Identifying and Probing During Auto-Configuration   |
+--------------------------------------+----------------------------+------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
