===============
10.5.?Resources
===============

.. raw:: html

   <div class="navheader">

10.5.?Resources
`Prev <isa-driver-config.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-busmem.html>`__

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

10.5.?Resources
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The information that a user enters into the kernel configuration file is
processed and passed to the kernel as configuration resources. This
information is parsed by the bus configuration code and transformed into
a value of structure device\_t and the bus resources associated with it.
The drivers may access the configuration resources directly using
functions ``resource_*`` for more complex cases of configuration.
However, generally this is neither needed nor recommended, so this issue
is not discussed further here.

The bus resources are associated with each device. They are identified
by type and number within the type. For the ISA bus the following types
are defined:

.. raw:: html

   <div class="itemizedlist">

-  *SYS\_RES\_IRQ* - interrupt number

-  *SYS\_RES\_DRQ* - ISA DMA channel number

-  *SYS\_RES\_MEMORY* - range of device memory mapped into the system
   memory space

-  *SYS\_RES\_IOPORT* - range of device I/O registers

.. raw:: html

   </div>

The enumeration within types starts from 0, so if a device has two
memory regions it would have resources of type ``SYS_RES_MEMORY``
numbered 0 and 1. The resource type has nothing to do with the C
language type, all the resource values have the C language type
``unsigned long`` and must be cast as necessary. The resource numbers do
not have to be contiguous, although for ISA they normally would be. The
permitted resource numbers for ISA devices are:

.. code:: programlisting

              IRQ: 0-1
              DRQ: 0-1
              MEMORY: 0-3
              IOPORT: 0-7

All the resources are represented as ranges, with a start value and
count. For IRQ and DRQ resources the count would normally be equal to 1.
The values for memory refer to the physical addresses.

Three types of activities can be performed on resources:

.. raw:: html

   <div class="itemizedlist">

-  set/get

-  allocate/release

-  activate/deactivate

.. raw:: html

   </div>

Setting sets the range used by the resource. Allocation reserves the
requested range that no other driver would be able to reserve it (and
checking that no other driver reserved this range already). Activation
makes the resource accessible to the driver by doing whatever is
necessary for that (for example, for memory it would be mapping into the
kernel virtual address space).

The functions to manipulate resources are:

.. raw:: html

   <div class="itemizedlist">

-  ``int bus_set_resource(device_t dev, int type,             int rid, u_long start, u_long count)``

   Set a range for a resource. Returns 0 if successful, error code
   otherwise. Normally, this function will return an error only if one
   of ``type``, ``rid``, ``start`` or ``count`` has a value that falls
   out of the permitted range.

   .. raw:: html

      <div class="itemizedlist">

   -  dev - driver's device

   -  type - type of resource, SYS\_RES\_\*

   -  rid - resource number (ID) within type

   -  start, count - resource range

   .. raw:: html

      </div>

-  ``int bus_get_resource(device_t dev, int type,           int rid, u_long *startp, u_long *countp)``

   Get the range of resource. Returns 0 if successful, error code if the
   resource is not defined yet.

-  ``u_long bus_get_resource_start(device_t dev,             int type, int rid) u_long bus_get_resource_count (device_t             dev, int type, int rid)``

   Convenience functions to get only the start or count. Return 0 in
   case of error, so if the resource start has 0 among the legitimate
   values it would be impossible to tell if the value is 0 or an error
   occurred. Luckily, no ISA resources for add-on drivers may have a
   start value equal to 0.

-  ``void bus_delete_resource(device_t dev, int             type, int rid)``

   Delete a resource, make it undefined.

-  ``struct resource *             bus_alloc_resource(device_t dev, int type, int *rid,             u_long start, u_long end, u_long count, u_int             flags)``

   Allocate a resource as a range of count values not allocated by
   anyone else, somewhere between start and end. Alas, alignment is not
   supported. If the resource was not set yet it is automatically
   created. The special values of start 0 and end ~0 (all ones) means
   that the fixed values previously set by ``bus_set_resource()`` must
   be used instead: start and count as themselves and end=(start+count),
   in this case if the resource was not defined before then an error is
   returned. Although rid is passed by reference it is not set anywhere
   by the resource allocation code of the ISA bus. (The other buses may
   use a different approach and modify it).

.. raw:: html

   </div>

Flags are a bitmap, the flags interesting for the caller are:

.. raw:: html

   <div class="itemizedlist">

-  *RF\_ACTIVE* - causes the resource to be automatically activated
   after allocation.

-  *RF\_SHAREABLE* - resource may be shared at the same time by multiple
   drivers.

-  *RF\_TIMESHARE* - resource may be time-shared by multiple drivers,
   i.e., allocated at the same time by many but activated only by one at
   any given moment of time.

-  Returns 0 on error. The allocated values may be obtained from the
   returned handle using methods ``rhand_*()``.

-  ``int bus_release_resource(device_t dev, int             type, int rid, struct resource *r)``

-  Release the resource, r is the handle returned by
   ``bus_alloc_resource()``. Returns 0 on success, error code otherwise.

-  ``int bus_activate_resource(device_t dev, int             type, int rid, struct resource *r)``
   ``int bus_deactivate_resource(device_t dev, int             type, int rid, struct resource *r)``

-  Activate or deactivate resource. Return 0 on success, error code
   otherwise. If the resource is time-shared and currently activated by
   another driver then ``EBUSY`` is returned.

-  ``int bus_setup_intr(device_t dev, struct             resource *r, int flags, driver_intr_t *handler, void *arg,             void **cookiep)``
   ``int             bus_teardown_intr(device_t dev, struct resource *r, void             *cookie)``

-  Associate or de-associate the interrupt handler with a device. Return
   0 on success, error code otherwise.

-  r - the activated resource handler describing the IRQ

   flags - the interrupt priority level, one of:

   .. raw:: html

      <div class="itemizedlist">

   -  ``INTR_TYPE_TTY`` - terminals and other likewise character-type
      devices. To mask them use ``spltty()``.

   -  ``(INTR_TYPE_TTY |                 INTR_TYPE_FAST)`` - terminal
      type devices with small input buffer, critical to the data loss on
      input (such as the old-fashioned serial ports). To mask them use
      ``spltty()``.

   -  ``INTR_TYPE_BIO`` - block-type devices, except those on the CAM
      controllers. To mask them use ``splbio()``.

   -  ``INTR_TYPE_CAM`` - CAM (Common Access Method) bus controllers. To
      mask them use ``splcam()``.

   -  ``INTR_TYPE_NET`` - network interface controllers. To mask them
      use ``splimp()``.

   -  ``INTR_TYPE_MISC`` - miscellaneous devices. There is no other way
      to mask them than by ``splhigh()`` which masks all interrupts.

   .. raw:: html

      </div>

.. raw:: html

   </div>

When an interrupt handler executes all the other interrupts matching its
priority level will be masked. The only exception is the MISC level for
which no other interrupts are masked and which is not masked by any
other interrupt.

.. raw:: html

   <div class="itemizedlist">

-  *handler* - pointer to the handler function, the type driver\_intr\_t
   is defined as ``void             driver_intr_t(void *)``

-  *arg* - the argument passed to the handler to identify this
   particular device. It is cast from void\* to any real type by the
   handler. The old convention for the ISA interrupt handlers was to use
   the unit number as argument, the new (recommended) convention is
   using a pointer to the device softc structure.

-  *cookie[p]* - the value received from ``setup()`` is used to identify
   the handler when passed to ``teardown()``

.. raw:: html

   </div>

A number of methods are defined to operate on the resource handlers
(struct resource \*). Those of interest to the device driver writers
are:

.. raw:: html

   <div class="itemizedlist">

-  ``u_long rman_get_start(r) u_long             rman_get_end(r)`` Get
   the start and end of allocated resource range.

-  ``void *rman_get_virtual(r)`` Get the virtual address of activated
   memory resource.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------------------------------------------+----------------------------+----------------------------------------+
| `Prev <isa-driver-config.html>`__?                                                             | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-busmem.html>`__   |
+------------------------------------------------------------------------------------------------+----------------------------+----------------------------------------+
| 10.4.?Configuration File and the Order of Identifying and Probing During Auto-Configuration?   | `Home <index.html>`__      | ?10.6.?Bus Memory Mapping              |
+------------------------------------------------------------------------------------------------+----------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
