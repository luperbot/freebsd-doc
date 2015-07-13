===================
11.2.?Bus Resources
===================

.. raw:: html

   <div class="navheader">

11.2.?Bus Resources
`Prev <pci.html>`__?
Chapter?11.?PCI Devices
?\ `Next <scsi.html>`__

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

11.2.?Bus Resources
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides an object-oriented mechanism for requesting resources
from a parent bus. Almost all devices will be a child member of some
sort of bus (PCI, ISA, USB, SCSI, etc) and these devices need to acquire
resources from their parent bus (such as memory segments, interrupt
lines, or DMA channels).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.2.1.?Base Address Registers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To do anything particularly useful with a PCI device you will need to
obtain the *Base Address Registers* (BARs) from the PCI Configuration
space. The PCI-specific details of obtaining the BAR are abstracted in
the ``bus_alloc_resource()`` function.

For example, a typical driver might have something similar to this in
the ``attach()`` function:

.. code:: programlisting

        sc->bar0id = PCIR_BAR(0);
        sc->bar0res = bus_alloc_resource(dev, SYS_RES_MEMORY, &sc->bar0id,
                      0, ~0, 1, RF_ACTIVE);
        if (sc->bar0res == NULL) {
            printf("Memory allocation of PCI base register 0 failed!\n");
            error = ENXIO;
            goto fail1;
        }

        sc->bar1id = PCIR_BAR(1);
        sc->bar1res = bus_alloc_resource(dev, SYS_RES_MEMORY, &sc->bar1id,
                      0, ~0, 1, RF_ACTIVE);
        if (sc->bar1res == NULL) {
            printf("Memory allocation of PCI base register 1 failed!\n");
            error =  ENXIO;
            goto fail2;
        }
        sc->bar0_bt = rman_get_bustag(sc->bar0res);
        sc->bar0_bh = rman_get_bushandle(sc->bar0res);
        sc->bar1_bt = rman_get_bustag(sc->bar1res);
        sc->bar1_bh = rman_get_bushandle(sc->bar1res);

Handles for each base address register are kept in the ``softc``
structure so that they can be used to write to the device later.

These handles can then be used to read or write from the device
registers with the ``bus_space_*`` functions. For example, a driver
might contain a shorthand function to read from a board specific
register like this:

.. code:: programlisting

    uint16_t
    board_read(struct ni_softc *sc, uint16_t address)
    {
        return bus_space_read_2(sc->bar1_bt, sc->bar1_bh, address);
    }

Similarly, one could write to the registers with:

.. code:: programlisting

    void
    board_write(struct ni_softc *sc, uint16_t address, uint16_t value)
    {
        bus_space_write_2(sc->bar1_bt, sc->bar1_bh, address, value);
    }

These functions exist in 8bit, 16bit, and 32bit versions and you should
use ``bus_space_{read|write}_{1|2|4}`` accordingly.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In FreeBSD 7.0 and later, you can use the ``bus_*`` functions instead of
``bus_space_*``. The ``bus_*`` functions take a struct resource \*
pointer instead of a bus tag and handle. Thus, you could drop the bus
tag and bus handle members from the ``softc`` and rewrite the
``board_read()`` function as:

.. code:: programlisting

    uint16_t
    board_read(struct ni_softc *sc, uint16_t address)
    {
        return (bus_read(sc->bar1res, address));
    }

.. raw:: html

   </div>

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

11.2.2.?Interrupts
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Interrupts are allocated from the object-oriented bus code in a way
similar to the memory resources. First an IRQ resource must be allocated
from the parent bus, and then the interrupt handler must be set up to
deal with this IRQ.

Again, a sample from a device ``attach()`` function says more than
words.

.. code:: programlisting

    /* Get the IRQ resource */

        sc->irqid = 0x0;
        sc->irqres = bus_alloc_resource(dev, SYS_RES_IRQ, &(sc->irqid),
                      0, ~0, 1, RF_SHAREABLE | RF_ACTIVE);
        if (sc->irqres == NULL) {
        printf("IRQ allocation failed!\n");
        error = ENXIO;
        goto fail3;
        }

        /* Now we should set up the interrupt handler */

        error = bus_setup_intr(dev, sc->irqres, INTR_TYPE_MISC,
                   my_handler, sc, &(sc->handler));
        if (error) {
        printf("Couldn't set up irq\n");
        goto fail4;
        }

Some care must be taken in the detach routine of the driver. You must
quiesce the device's interrupt stream, and remove the interrupt handler.
Once ``bus_teardown_intr()`` has returned, you know that your interrupt
handler will no longer be called and that all threads that might have
been executing this interrupt handler have returned. Since this function
can sleep, you must not hold any mutexes when calling this function.

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

11.2.3.?DMA
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section is obsolete, and present only for historical reasons. The
proper methods for dealing with these issues is to use the
``bus_space_dma*()`` functions instead. This paragraph can be removed
when this section is updated to reflect that usage. However, at the
moment, the API is in a bit of flux, so once that settles down, it would
be good to update this section to reflect that.

On the PC, peripherals that want to do bus-mastering DMA must deal with
physical addresses. This is a problem since FreeBSD uses virtual memory
and deals almost exclusively with virtual addresses. Fortunately, there
is a function, ``vtophys()`` to help.

.. code:: programlisting

    #include <vm/vm.h>
    #include <vm/pmap.h>

    #define vtophys(virtual_address) (...)

The solution is a bit different on the alpha however, and what we really
want is a function called ``vtobus()``.

.. code:: programlisting

    #if defined(__alpha__)
    #define vtobus(va)      alpha_XXX_dmamap((vm_offset_t)va)
    #else
    #define vtobus(va)      vtophys(va)
    #endif

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

11.2.4.?Deallocating Resources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is very important to deallocate all of the resources that were
allocated during ``attach()``. Care must be taken to deallocate the
correct stuff even on a failure condition so that the system will remain
usable while your driver dies.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+------------------------------------------------------+
| `Prev <pci.html>`__?       | `Up <pci.html>`__       | ?\ `Next <scsi.html>`__                              |
+----------------------------+-------------------------+------------------------------------------------------+
| Chapter?11.?PCI Devices?   | `Home <index.html>`__   | ?Chapter?12.?Common Access Method SCSI Controllers   |
+----------------------------+-------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
