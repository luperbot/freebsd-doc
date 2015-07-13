=========
10.7.?DMA
=========

.. raw:: html

   <div class="navheader">

10.7.?DMA
`Prev <isa-driver-busmem.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-probe.html>`__

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

10.7.?DMA
---------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Direct Memory Access (DMA) is implemented in the ISA bus through the
DMA controller (actually, two of them but that is an irrelevant detail).
To make the early ISA devices simple and cheap the logic of the bus
control and address generation was concentrated in the DMA controller.
Fortunately, FreeBSD provides a set of functions that mostly hide the
annoying details of the DMA controller from the device drivers.

The simplest case is for the fairly intelligent devices. Like the bus
master devices on PCI they can generate the bus cycles and memory
addresses all by themselves. The only thing they really need from the
DMA controller is bus arbitration. So for this purpose they pretend to
be cascaded slave DMA controllers. And the only thing needed from the
system DMA controller is to enable the cascaded mode on a DMA channel by
calling the following function when attaching the driver:

``void isa_dmacascade(int channel_number)``

All the further activity is done by programming the device. When
detaching the driver no DMA-related functions need to be called.

For the simpler devices things get more complicated. The functions used
are:

.. raw:: html

   <div class="itemizedlist">

-  ``int isa_dma_acquire(int chanel_number)``

   Reserve a DMA channel. Returns 0 on success or EBUSY if the channel
   was already reserved by this or a different driver. Most of the ISA
   devices are not able to share DMA channels anyway, so normally this
   function is called when attaching a device. This reservation was made
   redundant by the modern interface of bus resources but still must be
   used in addition to the latter. If not used then later, other DMA
   routines will panic.

-  ``int isa_dma_release(int chanel_number)``

   Release a previously reserved DMA channel. No transfers must be in
   progress when the channel is released (in addition the device must
   not try to initiate transfer after the channel is released).

-  ``void isa_dmainit(int chan, u_int             bouncebufsize)``

   Allocate a bounce buffer for use with the specified channel. The
   requested size of the buffer can not exceed 64KB. This bounce buffer
   will be automatically used later if a transfer buffer happens to be
   not physically contiguous or outside of the memory accessible by the
   ISA bus or crossing the 64KB boundary. If the transfers will be
   always done from buffers which conform to these conditions (such as
   those allocated by ``bus_dmamem_alloc()`` with proper limitations)
   then ``isa_dmainit()`` does not have to be called. But it is quite
   convenient to transfer arbitrary data using the DMA controller. The
   bounce buffer will automatically care of the scatter-gather issues.

   .. raw:: html

      <div class="itemizedlist">

   -  *chan* - channel number

   -  *bouncebufsize* - size of the bounce buffer in bytes

   .. raw:: html

      </div>

-  ``void isa_dmastart(int flags, caddr_t addr, u_int             nbytes, int chan)``

   Prepare to start a DMA transfer. This function must be called to set
   up the DMA controller before actually starting transfer on the
   device. It checks that the buffer is contiguous and falls into the
   ISA memory range, if not then the bounce buffer is automatically
   used. If bounce buffer is required but not set up by
   ``isa_dmainit()`` or too small for the requested transfer size then
   the system will panic. In case of a write request with bounce buffer
   the data will be automatically copied to the bounce buffer.

-  flags - a bitmask determining the type of operation to be done. The
   direction bits B\_READ and B\_WRITE are mutually exclusive.

   .. raw:: html

      <div class="itemizedlist">

   -  B\_READ - read from the ISA bus into memory

   -  B\_WRITE - write from the memory to the ISA bus

   -  B\_RAW - if set then the DMA controller will remember the buffer
      and after the end of transfer will automatically re-initialize
      itself to repeat transfer of the same buffer again (of course, the
      driver may change the data in the buffer before initiating another
      transfer in the device). If not set then the parameters will work
      only for one transfer, and ``isa_dmastart()`` will have to be
      called again before initiating the next transfer. Using B\_RAW
      makes sense only if the bounce buffer is not used.

   .. raw:: html

      </div>

-  addr - virtual address of the buffer

-  nbytes - length of the buffer. Must be less or equal to 64KB. Length
   of 0 is not allowed: the DMA controller will understand it as 64KB
   while the kernel code will understand it as 0 and that would cause
   unpredictable effects. For channels number 4 and higher the length
   must be even because these channels transfer 2 bytes at a time. In
   case of an odd length the last byte will not be transferred.

-  chan - channel number

-  ``void isa_dmadone(int flags, caddr_t addr, int             nbytes, int chan)``

   Synchronize the memory after device reports that transfer is done. If
   that was a read operation with a bounce buffer then the data will be
   copied from the bounce buffer to the original buffer. Arguments are
   the same as for ``isa_dmastart()``. Flag B\_RAW is permitted but it
   does not affect ``isa_dmadone()`` in any way.

-  ``int isa_dmastatus(int channel_number)``

   Returns the number of bytes left in the current transfer to be
   transferred. In case the flag B\_READ was set in ``isa_dmastart()``
   the number returned will never be equal to zero. At the end of
   transfer it will be automatically reset back to the length of buffer.
   The normal use is to check the number of bytes left after the device
   signals that the transfer is completed. If the number of bytes is not
   0 then something probably went wrong with that transfer.

-  ``int isa_dmastop(int channel_number)``

   Aborts the current transfer and returns the number of bytes left
   untransferred.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------+---------------------------------------+
| `Prev <isa-driver-busmem.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-probe.html>`__   |
+--------------------------------------+----------------------------+---------------------------------------+
| 10.6.?Bus Memory Mapping?            | `Home <index.html>`__      | ?10.8.?xxx\_isa\_probe                |
+--------------------------------------+----------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
