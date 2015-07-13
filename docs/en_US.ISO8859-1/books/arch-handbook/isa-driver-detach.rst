=======================
10.10.?xxx\_isa\_detach
=======================

.. raw:: html

   <div class="navheader">

10.10.?xxx\_isa\_detach
`Prev <isa-driver-attach.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-shutdown.html>`__

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

10.10.?xxx\_isa\_detach
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If this function is present in the driver and the driver is compiled as
a loadable module then the driver gets the ability to be unloaded. This
is an important feature if the hardware supports hot plug. But the ISA
bus does not support hot plug, so this feature is not particularly
important for the ISA devices. The ability to unload a driver may be
useful when debugging it, but in many cases installation of the new
version of the driver would be required only after the old version
somehow wedges the system and a reboot will be needed anyway, so the
efforts spent on writing the detach routine may not be worth it. Another
argument that unloading would allow upgrading the drivers on a
production machine seems to be mostly theoretical. Installing a new
version of a driver is a dangerous operation which should never be
performed on a production machine (and which is not permitted when the
system is running in secure mode). Still, the detach routine may be
provided for the sake of completeness.

The detach routine returns 0 if the driver was successfully detached or
the error code otherwise.

The logic of detach is a mirror of the attach. The first thing to do is
to detach the driver from its kernel subsystem. If the device is
currently open then the driver has two choices: refuse to be detached or
forcibly close and proceed with detach. The choice used depends on the
ability of the particular kernel subsystem to do a forced close and on
the preferences of the driver's author. Generally the forced close seems
to be the preferred alternative.

.. code:: programlisting

              struct xxx_softc *sc = device_get_softc(dev);
              int error;

              error = xxx_detach_subsystem(sc);
              if(error)
                  return error;

Next the driver may want to reset the hardware to some consistent state.
That includes stopping any ongoing transfers, disabling the DMA channels
and interrupts to avoid memory corruption by the device. For most of the
drivers this is exactly what the shutdown routine does, so if it is
included in the driver we can just call it.

``xxx_isa_shutdown(dev);``

And finally release all the resources and return success.

.. code:: programlisting

              xxx_free_resources(sc);
              return 0;

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------+------------------------------------------+
| `Prev <isa-driver-attach.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-shutdown.html>`__   |
+--------------------------------------+----------------------------+------------------------------------------+
| 10.9.?xxx\_isa\_attach?              | `Home <index.html>`__      | ?10.11.?xxx\_isa\_shutdown               |
+--------------------------------------+----------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
