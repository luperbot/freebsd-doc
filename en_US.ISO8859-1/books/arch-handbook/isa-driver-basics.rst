=======================
10.2.?Basic Information
=======================

.. raw:: html

   <div class="navheader">

10.2.?Basic Information
`Prev <isa-driver.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-device-t.html>`__

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

10.2.?Basic Information
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A typical ISA driver would need the following include files:

.. code:: programlisting

    #include <sys/module.h>
    #include <sys/bus.h>
    #include <machine/bus.h>
    #include <machine/resource.h>
    #include <sys/rman.h>

    #include <isa/isavar.h>
    #include <isa/pnpvar.h>

They describe the things specific to the ISA and generic bus subsystem.

The bus subsystem is implemented in an object-oriented fashion, its main
structures are accessed by associated method functions.

The list of bus methods implemented by an ISA driver is like one for any
other bus. For a hypothetical driver named “xxx” they would be:

.. raw:: html

   <div class="itemizedlist">

-  ``static void xxx_isa_identify (driver_t *,           device_t);``
   Normally used for bus drivers, not device drivers. But for ISA
   devices this method may have special use: if the device provides some
   device-specific (non-PnP) way to auto-detect devices this routine may
   implement it.

-  ``static int xxx_isa_probe (device_t           dev);`` Probe for a
   device at a known (or PnP) location. This routine can also
   accommodate device-specific auto-detection of parameters for
   partially configured devices.

-  ``static int xxx_isa_attach (device_t           dev);`` Attach and
   initialize device.

-  ``static int xxx_isa_detach (device_t           dev);`` Detach device
   before unloading the driver module.

-  ``static int xxx_isa_shutdown (device_t           dev);`` Execute
   shutdown of the device before system shutdown.

-  ``static int xxx_isa_suspend (device_t           dev);`` Suspend the
   device before the system goes to the power-save state. May also abort
   transition to the power-save state.

-  ``static int xxx_isa_resume (device_t       dev);`` Resume the device
   activity after return from power-save state.

.. raw:: html

   </div>

``xxx_isa_probe()`` and ``xxx_isa_attach()`` are mandatory, the rest of
the routines are optional, depending on the device's needs.

The driver is linked to the system with the following set of
descriptions.

.. code:: programlisting

        /* table of supported bus methods */
        static device_method_t xxx_isa_methods[] = {
            /* list all the bus method functions supported by the driver */
            /* omit the unsupported methods */
            DEVMETHOD(device_identify,  xxx_isa_identify),
            DEVMETHOD(device_probe,     xxx_isa_probe),
            DEVMETHOD(device_attach,    xxx_isa_attach),
            DEVMETHOD(device_detach,    xxx_isa_detach),
            DEVMETHOD(device_shutdown,  xxx_isa_shutdown),
            DEVMETHOD(device_suspend,   xxx_isa_suspend),
            DEVMETHOD(device_resume,    xxx_isa_resume),

        DEVMETHOD_END
        };

        static driver_t xxx_isa_driver = {
            "xxx",
            xxx_isa_methods,
            sizeof(struct xxx_softc),
        };


        static devclass_t xxx_devclass;

        DRIVER_MODULE(xxx, isa, xxx_isa_driver, xxx_devclass,
            load_function, load_argument);

Here struct ``xxx_softc`` is a device-specific structure that contains
private driver data and descriptors for the driver's resources. The bus
code automatically allocates one softc descriptor per device as needed.

If the driver is implemented as a loadable module then
``load_function()`` is called to do driver-specific initialization or
clean-up when the driver is loaded or unloaded and load\_argument is
passed as one of its arguments. If the driver does not support dynamic
loading (in other words it must always be linked into the kernel) then
these values should be set to 0 and the last definition would look like:

.. code:: programlisting

     DRIVER_MODULE(xxx, isa, xxx_isa_driver,
           xxx_devclass, 0, 0);

If the driver is for a device which supports PnP then a table of
supported PnP IDs must be defined. The table consists of a list of PnP
IDs supported by this driver and human-readable descriptions of the
hardware types and models having these IDs. It looks like:

.. code:: programlisting

        static struct isa_pnp_id xxx_pnp_ids[] = {
            /* a line for each supported PnP ID */
            { 0x12345678,   "Our device model 1234A" },
            { 0x12345679,   "Our device model 1234B" },
            { 0,        NULL }, /* end of table */
        };

If the driver does not support PnP devices it still needs an empty PnP
ID table, like:

.. code:: programlisting

        static struct isa_pnp_id xxx_pnp_ids[] = {
            { 0,        NULL }, /* end of table */
        };

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+----------------------------+------------------------------------------+
| `Prev <isa-driver.html>`__?       | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-device-t.html>`__   |
+-----------------------------------+----------------------------+------------------------------------------+
| Chapter?10.?ISA Device Drivers?   | `Home <index.html>`__      | ?10.3.?\ ``device_t`` Pointer            |
+-----------------------------------+----------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
