=====================
10.8.?xxx\_isa\_probe
=====================

.. raw:: html

   <div class="navheader">

10.8.?xxx\_isa\_probe
`Prev <isa-driver-dma.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-attach.html>`__

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

10.8.?xxx\_isa\_probe
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This function probes if a device is present. If the driver supports
auto-detection of some part of device configuration (such as interrupt
vector or memory address) this auto-detection must be done in this
routine.

As for any other bus, if the device cannot be detected or is detected
but failed the self-test or some other problem happened then it returns
a positive value of error. The value ENXIO must be returned if the
device is not present. Other error values may mean other conditions.
Zero or negative values mean success. Most of the drivers return zero as
success.

The negative return values are used when a PnP device supports multiple
interfaces. For example, an older compatibility interface and a newer
advanced interface which are supported by different drivers. Then both
drivers would detect the device. The driver which returns a higher value
in the probe routine takes precedence (in other words, the driver
returning 0 has highest precedence, one returning -1 is next, one
returning -2 is after it and so on). In result the devices which support
only the old interface will be handled by the old driver (which should
return -1 from the probe routine) while the devices supporting the new
interface as well will be handled by the new driver (which should return
0 from the probe routine).

The device descriptor struct xxx\_softc is allocated by the system
before calling the probe routine. If the probe routine returns an error
the descriptor will be automatically deallocated by the system. So if a
probing error occurs the driver must make sure that all the resources it
used during probe are deallocated and that nothing keeps the descriptor
from being safely deallocated. If the probe completes successfully the
descriptor will be preserved by the system and later passed to the
routine ``xxx_isa_attach()``. If a driver returns a negative value it
can not be sure that it will have the highest priority and its attach
routine will be called. So in this case it also must release all the
resources before returning and if necessary allocate them again in the
attach routine. When ``xxx_isa_probe()`` returns 0 releasing the
resources before returning is also a good idea and a well-behaved driver
should do so. But in cases where there is some problem with releasing
the resources the driver is allowed to keep resources between returning
0 from the probe routine and execution of the attach routine.

A typical probe routine starts with getting the device descriptor and
unit:

.. code:: programlisting

             struct xxx_softc *sc = device_get_softc(dev);
              int unit = device_get_unit(dev);
              int pnperror;
              int error = 0;

              sc->dev = dev; /* link it back */
              sc->unit = unit;        

Then check for the PnP devices. The check is carried out by a table
containing the list of PnP IDs supported by this driver and
human-readable descriptions of the device models corresponding to these
IDs.

.. code:: programlisting

            pnperror=ISA_PNP_PROBE(device_get_parent(dev), dev,
            xxx_pnp_ids); if(pnperror == ENXIO) return ENXIO;
            

The logic of ISA\_PNP\_PROBE is the following: If this card (device
unit) was not detected as PnP then ENOENT will be returned. If it was
detected as PnP but its detected ID does not match any of the IDs in the
table then ENXIO is returned. Finally, if it has PnP support and it
matches on of the IDs in the table, 0 is returned and the appropriate
description from the table is set by ``device_set_desc()``.

If a driver supports only PnP devices then the condition would look
like:

.. code:: programlisting

              if(pnperror != 0)
                  return pnperror;        

No special treatment is required for the drivers which do not support
PnP because they pass an empty PnP ID table and will always get ENXIO if
called on a PnP card.

The probe routine normally needs at least some minimal set of resources,
such as I/O port number to find the card and probe it. Depending on the
hardware the driver may be able to discover the other necessary
resources automatically. The PnP devices have all the resources pre-set
by the PnP subsystem, so the driver does not need to discover them by
itself.

Typically the minimal information required to get access to the device
is the I/O port number. Then some devices allow to get the rest of
information from the device configuration registers (though not all
devices do that). So first we try to get the port start value:

.. code:: programlisting

     sc->port0 = bus_get_resource_start(dev,
            SYS_RES_IOPORT, 0 /*rid*/); if(sc->port0 == 0) return ENXIO;
            

The base port address is saved in the structure softc for future use. If
it will be used very often then calling the resource function each time
would be prohibitively slow. If we do not get a port we just return an
error. Some device drivers can instead be clever and try to probe all
the possible ports, like this:

.. code:: programlisting

              /* table of all possible base I/O port addresses for this device */
              static struct xxx_allports {
                  u_short port; /* port address */
                  short used; /* flag: if this port is already used by some unit */
              } xxx_allports = {
                  { 0x300, 0 },
                  { 0x320, 0 },
                  { 0x340, 0 },
                  { 0, 0 } /* end of table */
              };

              ...
              int port, i;
              ...

              port =  bus_get_resource_start(dev, SYS_RES_IOPORT, 0 /*rid*/);
              if(port !=0 ) {
                  for(i=0; xxx_allports[i].port!=0; i++) {
                      if(xxx_allports[i].used || xxx_allports[i].port != port)
                          continue;

                      /* found it */
                      xxx_allports[i].used = 1;
                      /* do probe on a known port */
                      return xxx_really_probe(dev, port);
                  }
                  return ENXIO; /* port is unknown or already used */
              }

              /* we get here only if we need to guess the port */
              for(i=0; xxx_allports[i].port!=0; i++) {
                  if(xxx_allports[i].used)
                      continue;

                  /* mark as used - even if we find nothing at this port
                   * at least we won't probe it in future
                   */
                   xxx_allports[i].used = 1;

                  error = xxx_really_probe(dev, xxx_allports[i].port);
                  if(error == 0) /* found a device at that port */
                      return 0;
              }
              /* probed all possible addresses, none worked */
              return ENXIO;

Of course, normally the driver's ``identify()`` routine should be used
for such things. But there may be one valid reason why it may be better
to be done in ``probe()``: if this probe would drive some other
sensitive device crazy. The probe routines are ordered with
consideration of the ``sensitive`` flag: the sensitive devices get
probed first and the rest of the devices later. But the ``identify()``
routines are called before any probes, so they show no respect to the
sensitive devices and may upset them.

Now, after we got the starting port we need to set the port count
(except for PnP devices) because the kernel does not have this
information in the configuration file.

.. code:: programlisting

             if(pnperror /* only for non-PnP devices */
             && bus_set_resource(dev, SYS_RES_IOPORT, 0, sc->port0,
             XXX_PORT_COUNT)<0)
                 return ENXIO;

Finally allocate and activate a piece of port address space (special
values of start and end mean “use those we set by
``bus_set_resource()``”):

.. code:: programlisting

              sc->port0_rid = 0;
              sc->port0_r = bus_alloc_resource(dev, SYS_RES_IOPORT,
              &sc->port0_rid,
                  /*start*/ 0, /*end*/ ~0, /*count*/ 0, RF_ACTIVE);

              if(sc->port0_r == NULL)
                  return ENXIO;

Now having access to the port-mapped registers we can poke the device in
some way and check if it reacts like it is expected to. If it does not
then there is probably some other device or no device at all at this
address.

Normally drivers do not set up the interrupt handlers until the attach
routine. Instead they do probes in the polling mode using the
``DELAY()`` function for timeout. The probe routine must never hang
forever, all the waits for the device must be done with timeouts. If the
device does not respond within the time it is probably broken or
misconfigured and the driver must return error. When determining the
timeout interval give the device some extra time to be on the safe side:
although ``DELAY()`` is supposed to delay for the same amount of time on
any machine it has some margin of error, depending on the exact CPU.

If the probe routine really wants to check that the interrupts really
work it may configure and probe the interrupts too. But that is not
recommended.

.. code:: programlisting

              /* implemented in some very device-specific way */
              if(error = xxx_probe_ports(sc))
                  goto bad; /* will deallocate the resources before returning */
            

The function ``xxx_probe_ports()`` may also set the device description
depending on the exact model of device it discovers. But if there is
only one supported device model this can be as well done in a hardcoded
way. Of course, for the PnP devices the PnP support sets the description
from the table automatically.

.. code:: programlisting

              if(pnperror)
                  device_set_desc(dev, "Our device model 1234");
            

Then the probe routine should either discover the ranges of all the
resources by reading the device configuration registers or make sure
that they were set explicitly by the user. We will consider it with an
example of on-board memory. The probe routine should be as non-intrusive
as possible, so allocation and check of functionality of the rest of
resources (besides the ports) would be better left to the attach
routine.

The memory address may be specified in the kernel configuration file or
on some devices it may be pre-configured in non-volatile configuration
registers. If both sources are available and different, which one should
be used? Probably if the user bothered to set the address explicitly in
the kernel configuration file they know what they are doing and this one
should take precedence. An example of implementation could be:

.. code:: programlisting

              /* try to find out the config address first */
              sc->mem0_p = bus_get_resource_start(dev, SYS_RES_MEMORY, 0 /*rid*/);
              if(sc->mem0_p == 0) { /* nope, not specified by user */
                  sc->mem0_p = xxx_read_mem0_from_device_config(sc);


              if(sc->mem0_p == 0)
                      /* can't get it from device config registers either */
                      goto bad;
              } else {
                  if(xxx_set_mem0_address_on_device(sc) < 0)
                      goto bad; /* device does not support that address */
              }

              /* just like the port, set the memory size,
               * for some devices the memory size would not be constant
               * but should be read from the device configuration registers instead
               * to accommodate different models of devices. Another option would
               * be to let the user set the memory size as "msize" configuration
               * resource which will be automatically handled by the ISA bus.
               */
               if(pnperror) { /* only for non-PnP devices */
                  sc->mem0_size = bus_get_resource_count(dev, SYS_RES_MEMORY, 0 /*rid*/);
                  if(sc->mem0_size == 0) /* not specified by user */
                      sc->mem0_size = xxx_read_mem0_size_from_device_config(sc);

                  if(sc->mem0_size == 0) {
                      /* suppose this is a very old model of device without
                       * auto-configuration features and the user gave no preference,
                       * so assume the minimalistic case
                       * (of course, the real value will vary with the driver)
                       */
                      sc->mem0_size = 8*1024;
                  }

                  if(xxx_set_mem0_size_on_device(sc) < 0)
                      goto bad; /* device does not support that size */

                  if(bus_set_resource(dev, SYS_RES_MEMORY, /*rid*/0,
                          sc->mem0_p, sc->mem0_size)<0)
                      goto bad;
              } else {
                  sc->mem0_size = bus_get_resource_count(dev, SYS_RES_MEMORY, 0 /*rid*/);
              }        

Resources for IRQ and DRQ are easy to check by analogy.

If all went well then release all the resources and return success.

.. code:: programlisting

              xxx_free_resources(sc);
              return 0;

Finally, handle the troublesome situations. All the resources should be
deallocated before returning. We make use of the fact that before the
structure softc is passed to us it gets zeroed out, so we can find out
if some resource was allocated: then its descriptor is non-zero.

.. code:: programlisting

              bad:

              xxx_free_resources(sc);
              if(error)
                    return error;
              else /* exact error is unknown */
                  return ENXIO;

That would be all for the probe routine. Freeing of resources is done
from multiple places, so it is moved to a function which may look like:

.. code:: programlisting

    static void
               xxx_free_resources(sc)
                  struct xxx_softc *sc;
              {
                  /* check every resource and free if not zero */

                  /* interrupt handler */
                  if(sc->intr_r) {
                      bus_teardown_intr(sc->dev, sc->intr_r, sc->intr_cookie);
                      bus_release_resource(sc->dev, SYS_RES_IRQ, sc->intr_rid,
                          sc->intr_r);
                      sc->intr_r = 0;
                  }

                  /* all kinds of memory maps we could have allocated */
                  if(sc->data_p) {
                      bus_dmamap_unload(sc->data_tag, sc->data_map);
                      sc->data_p = 0;
                  }
                   if(sc->data) { /* sc->data_map may be legitimately equal to 0 */
                      /* the map will also be freed */
                      bus_dmamem_free(sc->data_tag, sc->data, sc->data_map);
                      sc->data = 0;
                  }
                  if(sc->data_tag) {
                      bus_dma_tag_destroy(sc->data_tag);
                      sc->data_tag = 0;
                  }

                  ... free other maps and tags if we have them ...

                  if(sc->parent_tag) {
                      bus_dma_tag_destroy(sc->parent_tag);
                      sc->parent_tag = 0;
                  }

                  /* release all the bus resources */
                  if(sc->mem0_r) {
                      bus_release_resource(sc->dev, SYS_RES_MEMORY, sc->mem0_rid,
                          sc->mem0_r);
                      sc->mem0_r = 0;
                  }
                  ...
                  if(sc->port0_r) {
                      bus_release_resource(sc->dev, SYS_RES_IOPORT, sc->port0_rid,
                          sc->port0_r);
                      sc->port0_r = 0;
                  }
              }

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+----------------------------+----------------------------------------+
| `Prev <isa-driver-dma.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-attach.html>`__   |
+-----------------------------------+----------------------------+----------------------------------------+
| 10.7.?DMA?                        | `Home <index.html>`__      | ?10.9.?xxx\_isa\_attach                |
+-----------------------------------+----------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
