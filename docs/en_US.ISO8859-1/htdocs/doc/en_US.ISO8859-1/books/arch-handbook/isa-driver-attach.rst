======================
10.9.?xxx\_isa\_attach
======================

.. raw:: html

   <div class="navheader">

10.9.?xxx\_isa\_attach
`Prev <isa-driver-probe.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-detach.html>`__

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

10.9.?xxx\_isa\_attach
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The attach routine actually connects the driver to the system if the
probe routine returned success and the system had chosen to attach that
driver. If the probe routine returned 0 then the attach routine may
expect to receive the device structure softc intact, as it was set by
the probe routine. Also if the probe routine returns 0 it may expect
that the attach routine for this device shall be called at some point in
the future. If the probe routine returns a negative value then the
driver may make none of these assumptions.

The attach routine returns 0 if it completed successfully or error code
otherwise.

The attach routine starts just like the probe routine, with getting some
frequently used data into more accessible variables.

.. code:: programlisting

              struct xxx_softc *sc = device_get_softc(dev);
              int unit = device_get_unit(dev);
              int error = 0;

Then allocate and activate all the necessary resources. Because normally
the port range will be released before returning from probe, it has to
be allocated again. We expect that the probe routine had properly set
all the resource ranges, as well as saved them in the structure softc.
If the probe routine had left some resource allocated then it does not
need to be allocated again (which would be considered an error).

.. code:: programlisting

              sc->port0_rid = 0;
              sc->port0_r = bus_alloc_resource(dev, SYS_RES_IOPORT,  &sc->port0_rid,
                  /*start*/ 0, /*end*/ ~0, /*count*/ 0, RF_ACTIVE);

              if(sc->port0_r == NULL)
                   return ENXIO;

              /* on-board memory */
              sc->mem0_rid = 0;
              sc->mem0_r = bus_alloc_resource(dev, SYS_RES_MEMORY,  &sc->mem0_rid,
                  /*start*/ 0, /*end*/ ~0, /*count*/ 0, RF_ACTIVE);

              if(sc->mem0_r == NULL)
                    goto bad;

              /* get its virtual address */
              sc->mem0_v = rman_get_virtual(sc->mem0_r);

The DMA request channel (DRQ) is allocated likewise. To initialize it
use functions of the ``isa_dma*()`` family. For example:

``isa_dmacascade(sc->drq0);``

The interrupt request line (IRQ) is a bit special. Besides allocation
the driver's interrupt handler should be associated with it.
Historically in the old ISA drivers the argument passed by the system to
the interrupt handler was the device unit number. But in modern drivers
the convention suggests passing the pointer to structure softc. The
important reason is that when the structures softc are allocated
dynamically then getting the unit number from softc is easy while
getting softc from the unit number is difficult. Also this convention
makes the drivers for different buses look more uniform and allows them
to share the code: each bus gets its own probe, attach, detach and other
bus-specific routines while the bulk of the driver code may be shared
among them.

.. code:: programlisting

              sc->intr_rid = 0;
              sc->intr_r = bus_alloc_resource(dev, SYS_RES_MEMORY,  &sc->intr_rid,
                    /*start*/ 0, /*end*/ ~0, /*count*/ 0, RF_ACTIVE);

              if(sc->intr_r == NULL)
                  goto bad;

              /*
               * XXX_INTR_TYPE is supposed to be defined depending on the type of
               * the driver, for example as INTR_TYPE_CAM for a CAM driver
               */
              error = bus_setup_intr(dev, sc->intr_r, XXX_INTR_TYPE,
                  (driver_intr_t *) xxx_intr, (void *) sc, &sc->intr_cookie);
              if(error)
                  goto bad;

            

If the device needs to make DMA to the main memory then this memory
should be allocated like described before:

.. code:: programlisting

              error=bus_dma_tag_create(NULL, /*alignment*/ 4,
                  /*boundary*/ 0, /*lowaddr*/ BUS_SPACE_MAXADDR_24BIT,
                  /*highaddr*/ BUS_SPACE_MAXADDR, /*filter*/ NULL, /*filterarg*/ NULL,
                  /*maxsize*/ BUS_SPACE_MAXSIZE_24BIT,
                  /*nsegments*/ BUS_SPACE_UNRESTRICTED,
                  /*maxsegsz*/ BUS_SPACE_MAXSIZE_24BIT, /*flags*/ 0,
                  &sc->parent_tag);
              if(error)
                  goto bad;

              /* many things get inherited from the parent tag
               * sc->data is supposed to point to the structure with the shared data,
               * for example for a ring buffer it could be:
               * struct {
               *   u_short rd_pos;
               *   u_short wr_pos;
               *   char    bf[XXX_RING_BUFFER_SIZE]
               * } *data;
               */
              error=bus_dma_tag_create(sc->parent_tag, 1,
                  0, BUS_SPACE_MAXADDR, 0, /*filter*/ NULL, /*filterarg*/ NULL,
                  /*maxsize*/ sizeof(* sc->data), /*nsegments*/ 1,
                  /*maxsegsz*/ sizeof(* sc->data), /*flags*/ 0,
                  &sc->data_tag);
              if(error)
                  goto bad;

              error = bus_dmamem_alloc(sc->data_tag, &sc->data, /* flags*/ 0,
                  &sc->data_map);
              if(error)
                   goto bad;

              /* xxx_alloc_callback() just saves the physical address at
               * the pointer passed as its argument, in this case &sc->data_p.
               * See details in the section on bus memory mapping.
               * It can be implemented like:
               *
               * static void
               * xxx_alloc_callback(void *arg, bus_dma_segment_t *seg,
               *     int nseg, int error)
               * {
               *    *(bus_addr_t *)arg = seg[0].ds_addr;
               * }
               */
              bus_dmamap_load(sc->data_tag, sc->data_map, (void *)sc->data,
                  sizeof (* sc->data), xxx_alloc_callback, (void *) &sc->data_p,
                  /*flags*/0);

After all the necessary resources are allocated the device should be
initialized. The initialization may include testing that all the
expected features are functional.

.. code:: programlisting

              if(xxx_initialize(sc) < 0)
                   goto bad;        

The bus subsystem will automatically print on the console the device
description set by probe. But if the driver wants to print some extra
information about the device it may do so, for example:

.. code:: programlisting

            device_printf(dev, "has on-card FIFO buffer of %d bytes\n", sc->fifosize);
            

If the initialization routine experiences any problems then printing
messages about them before returning error is also recommended.

The final step of the attach routine is attaching the device to its
functional subsystem in the kernel. The exact way to do it depends on
the type of the driver: a character device, a block device, a network
device, a CAM SCSI bus device and so on.

If all went well then return success.

.. code:: programlisting

              error = xxx_attach_subsystem(sc);
              if(error)
                  goto bad;

              return 0;        

Finally, handle the troublesome situations. All the resources should be
deallocated before returning an error. We make use of the fact that
before the structure softc is passed to us it gets zeroed out, so we can
find out if some resource was allocated: then its descriptor is
non-zero.

.. code:: programlisting

              bad:

              xxx_free_resources(sc);
              if(error)
                  return error;
              else /* exact error is unknown */
                  return ENXIO;

That would be all for the attach routine.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------+----------------------------------------+
| `Prev <isa-driver-probe.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-detach.html>`__   |
+-------------------------------------+----------------------------+----------------------------------------+
| 10.8.?xxx\_isa\_probe?              | `Home <index.html>`__      | ?10.10.?xxx\_isa\_detach               |
+-------------------------------------+----------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
