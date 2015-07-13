========================
10.6.?Bus Memory Mapping
========================

.. raw:: html

   <div class="navheader">

10.6.?Bus Memory Mapping
`Prev <isa-driver-resources.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-dma.html>`__

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

10.6.?Bus Memory Mapping
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In many cases data is exchanged between the driver and the device
through the memory. Two variants are possible:

(a) memory is located on the device card

(b) memory is the main memory of the computer

In case (a) the driver always copies the data back and forth between the
on-card memory and the main memory as necessary. To map the on-card
memory into the kernel virtual address space the physical address and
length of the on-card memory must be defined as a ``SYS_RES_MEMORY``
resource. That resource can then be allocated and activated, and its
virtual address obtained using ``rman_get_virtual()``. The older drivers
used the function ``pmap_mapdev()`` for this purpose, which should not
be used directly any more. Now it is one of the internal steps of
resource activation.

Most of the ISA cards will have their memory configured for physical
location somewhere in range 640KB-1MB. Some of the ISA cards require
larger memory ranges which should be placed somewhere under 16MB
(because of the 24-bit address limitation on the ISA bus). In that case
if the machine has more memory than the start address of the device
memory (in other words, they overlap) a memory hole must be configured
at the address range used by devices. Many BIOSes allow configuration of
a memory hole of 1MB starting at 14MB or 15MB. FreeBSD can handle the
memory holes properly if the BIOS reports them properly (this feature
may be broken on old BIOSes).

In case (b) just the address of the data is sent to the device, and the
device uses DMA to actually access the data in the main memory. Two
limitations are present: First, ISA cards can only access memory below
16MB. Second, the contiguous pages in virtual address space may not be
contiguous in physical address space, so the device may have to do
scatter/gather operations. The bus subsystem provides ready solutions
for some of these problems, the rest has to be done by the drivers
themselves.

Two structures are used for DMA memory allocation, ``bus_dma_tag_t`` and
``bus_dmamap_t``. Tag describes the properties required for the DMA
memory. Map represents a memory block allocated according to these
properties. Multiple maps may be associated with the same tag.

Tags are organized into a tree-like hierarchy with inheritance of the
properties. A child tag inherits all the requirements of its parent tag,
and may make them more strict but never more loose.

Normally one top-level tag (with no parent) is created for each device
unit. If multiple memory areas with different requirements are needed
for each device then a tag for each of them may be created as a child of
the parent tag.

The tags can be used to create a map in two ways.

First, a chunk of contiguous memory conformant with the tag requirements
may be allocated (and later may be freed). This is normally used to
allocate relatively long-living areas of memory for communication with
the device. Loading of such memory into a map is trivial: it is always
considered as one chunk in the appropriate physical memory range.

Second, an arbitrary area of virtual memory may be loaded into a map.
Each page of this memory will be checked for conformance to the map
requirement. If it conforms then it is left at its original location. If
it is not then a fresh conformant “bounce page” is allocated and used as
intermediate storage. When writing the data from the non-conformant
original pages they will be copied to their bounce pages first and then
transferred from the bounce pages to the device. When reading the data
would go from the device to the bounce pages and then copied to their
non-conformant original pages. The process of copying between the
original and bounce pages is called synchronization. This is normally
used on a per-transfer basis: buffer for each transfer would be loaded,
transfer done and buffer unloaded.

The functions working on the DMA memory are:

.. raw:: html

   <div class="itemizedlist">

-  ``int bus_dma_tag_create(bus_dma_tag_t parent,           bus_size_t alignment, bus_size_t boundary, bus_addr_t           lowaddr, bus_addr_t highaddr, bus_dma_filter_t *filter, void           *filterarg, bus_size_t maxsize, int nsegments, bus_size_t           maxsegsz, int flags, bus_dma_tag_t *dmat)``

   Create a new tag. Returns 0 on success, the error code otherwise.

   .. raw:: html

      <div class="itemizedlist">

   -  *parent* - parent tag, or NULL to create a top-level tag.

   -  *alignment* - required physical alignment of the memory area to be
      allocated for this tag. Use value 1 for “no specific alignment”.
      Applies only to the future ``bus_dmamem_alloc()`` but not
      ``bus_dmamap_create()`` calls.

   -  *boundary* - physical address boundary that must not be crossed
      when allocating the memory. Use value 0 for “no boundary”. Applies
      only to the future ``bus_dmamem_alloc()`` but not
      ``bus_dmamap_create()`` calls. Must be power of 2. If the memory
      is planned to be used in non-cascaded DMA mode (i.e., the DMA
      addresses will be supplied not by the device itself but by the ISA
      DMA controller) then the boundary must be no larger than 64KB
      (64\*1024) due to the limitations of the DMA hardware.

   -  *lowaddr, highaddr* - the names are slightly misleading; these
      values are used to limit the permitted range of physical addresses
      used to allocate the memory. The exact meaning varies depending on
      the planned future use:

      .. raw:: html

         <div class="itemizedlist">

      -  For ``bus_dmamem_alloc()`` all the addresses from 0 to
         lowaddr-1 are considered permitted, the higher ones are
         forbidden.

      -  For ``bus_dmamap_create()`` all the addresses outside the
         inclusive range [lowaddr; highaddr] are considered accessible.
         The addresses of pages inside the range are passed to the
         filter function which decides if they are accessible. If no
         filter function is supplied then all the range is considered
         unaccessible.

      -  For the ISA devices the normal values (with no filter function)
         are:

         lowaddr = BUS\_SPACE\_MAXADDR\_24BIT

         highaddr = BUS\_SPACE\_MAXADDR

      .. raw:: html

         </div>

   -  *filter, filterarg* - the filter function and its argument. If
      NULL is passed for filter then the whole range [lowaddr, highaddr]
      is considered unaccessible when doing ``bus_dmamap_create()``.
      Otherwise the physical address of each attempted page in range
      [lowaddr; highaddr] is passed to the filter function which decides
      if it is accessible. The prototype of the filter function is:
      ``int filterfunc(void *arg,               bus_addr_t paddr)``. It
      must return 0 if the page is accessible, non-zero otherwise.

   -  *maxsize* - the maximal size of memory (in bytes) that may be
      allocated through this tag. In case it is difficult to estimate or
      could be arbitrarily big, the value for ISA devices would be
      ``BUS_SPACE_MAXSIZE_24BIT``.

   -  *nsegments* - maximal number of scatter-gather segments supported
      by the device. If unrestricted then the value
      ``BUS_SPACE_UNRESTRICTED`` should be used. This value is
      recommended for the parent tags, the actual restrictions would
      then be specified for the descendant tags. Tags with nsegments
      equal to ``BUS_SPACE_UNRESTRICTED`` may not be used to actually
      load maps, they may be used only as parent tags. The practical
      limit for nsegments seems to be about 250-300, higher values will
      cause kernel stack overflow (the hardware can not normally support
      that many scatter-gather buffers anyway).

   -  *maxsegsz* - maximal size of a scatter-gather segment supported by
      the device. The maximal value for ISA device would be
      ``BUS_SPACE_MAXSIZE_24BIT``.

   -  *flags* - a bitmap of flags. The only interesting flags are:

      .. raw:: html

         <div class="itemizedlist">

      -  *BUS\_DMA\_ALLOCNOW* - requests to allocate all the potentially
         needed bounce pages when creating the tag.

      -  *BUS\_DMA\_ISA* - mysterious flag used only on Alpha machines.
         It is not defined for the i386 machines. Probably it should be
         used by all the ISA drivers for Alpha machines but it looks
         like there are no such drivers yet.

      .. raw:: html

         </div>

   -  *dmat* - pointer to the storage for the new tag to be returned.

   .. raw:: html

      </div>

-  ``int bus_dma_tag_destroy(bus_dma_tag_t       dmat)``

   Destroy a tag. Returns 0 on success, the error code otherwise.

   dmat - the tag to be destroyed.

-  ``int bus_dmamem_alloc(bus_dma_tag_t dmat,           void** vaddr, int flags, bus_dmamap_t           *mapp)``

   Allocate an area of contiguous memory described by the tag. The size
   of memory to be allocated is tag's maxsize. Returns 0 on success, the
   error code otherwise. The result still has to be loaded by
   ``bus_dmamap_load()`` before being used to get the physical address
   of the memory.

   .. raw:: html

      <div class="itemizedlist">

   -  *dmat* - the tag

   -  *vaddr* - pointer to the storage for the kernel virtual address of
      the allocated area to be returned.

   -  flags - a bitmap of flags. The only interesting flag is:

      .. raw:: html

         <div class="itemizedlist">

      -  *BUS\_DMA\_NOWAIT* - if the memory is not immediately available
         return the error. If this flag is not set then the routine is
         allowed to sleep until the memory becomes available.

      .. raw:: html

         </div>

   -  *mapp* - pointer to the storage for the new map to be returned.

   .. raw:: html

      </div>

-  ``void bus_dmamem_free(bus_dma_tag_t dmat, void               *vaddr, bus_dmamap_t map)``

   Free the memory allocated by ``bus_dmamem_alloc()``. At present,
   freeing of the memory allocated with ISA restrictions is not
   implemented. Because of this the recommended model of use is to keep
   and re-use the allocated areas for as long as possible. Do not
   lightly free some area and then shortly allocate it again. That does
   not mean that ``bus_dmamem_free()`` should not be used at all:
   hopefully it will be properly implemented soon.

   .. raw:: html

      <div class="itemizedlist">

   -  *dmat* - the tag

   -  *vaddr* - the kernel virtual address of the memory

   -  *map* - the map of the memory (as returned from
      ``bus_dmamem_alloc()``)

   .. raw:: html

      </div>

-  ``int bus_dmamap_create(bus_dma_tag_t dmat, int               flags, bus_dmamap_t *mapp)``

   Create a map for the tag, to be used in ``bus_dmamap_load()`` later.
   Returns 0 on success, the error code otherwise.

   .. raw:: html

      <div class="itemizedlist">

   -  *dmat* - the tag

   -  *flags* - theoretically, a bit map of flags. But no flags are
      defined yet, so at present it will be always 0.

   -  *mapp* - pointer to the storage for the new map to be returned

   .. raw:: html

      </div>

-  ``int bus_dmamap_destroy(bus_dma_tag_t dmat,               bus_dmamap_t map)``

   Destroy a map. Returns 0 on success, the error code otherwise.

   .. raw:: html

      <div class="itemizedlist">

   -  dmat - the tag to which the map is associated

   -  map - the map to be destroyed

   .. raw:: html

      </div>

-  ``int bus_dmamap_load(bus_dma_tag_t dmat,               bus_dmamap_t map, void *buf, bus_size_t buflen,               bus_dmamap_callback_t *callback, void *callback_arg, int               flags)``

   Load a buffer into the map (the map must be previously created by
   ``bus_dmamap_create()`` or ``bus_dmamem_alloc()``). All the pages of
   the buffer are checked for conformance to the tag requirements and
   for those not conformant the bounce pages are allocated. An array of
   physical segment descriptors is built and passed to the callback
   routine. This callback routine is then expected to handle it in some
   way. The number of bounce buffers in the system is limited, so if the
   bounce buffers are needed but not immediately available the request
   will be queued and the callback will be called when the bounce
   buffers will become available. Returns 0 if the callback was executed
   immediately or EINPROGRESS if the request was queued for future
   execution. In the latter case the synchronization with queued
   callback routine is the responsibility of the driver.

   .. raw:: html

      <div class="itemizedlist">

   -  *dmat* - the tag

   -  *map* - the map

   -  *buf* - kernel virtual address of the buffer

   -  *buflen* - length of the buffer

   -  *callback*,\ ``                   callback_arg`` - the callback
      function and its argument

   .. raw:: html

      </div>

   The prototype of callback function is:

   ``void callback(void *arg, bus_dma_segment_t               *seg, int nseg, int error)``

   .. raw:: html

      <div class="itemizedlist">

   -  *arg* - the same as callback\_arg passed to ``bus_dmamap_load()``

   -  *seg* - array of the segment descriptors

   -  *nseg* - number of descriptors in array

   -  *error* - indication of the segment number overflow: if it is set
      to EFBIG then the buffer did not fit into the maximal number of
      segments permitted by the tag. In this case only the permitted
      number of descriptors will be in the array. Handling of this
      situation is up to the driver: depending on the desired semantics
      it can either consider this an error or split the buffer in two
      and handle the second part separately

   .. raw:: html

      </div>

   Each entry in the segments array contains the fields:

   .. raw:: html

      <div class="itemizedlist">

   -  *ds\_addr* - physical bus address of the segment

   -  *ds\_len* - length of the segment

   .. raw:: html

      </div>

-  ``void bus_dmamap_unload(bus_dma_tag_t dmat,               bus_dmamap_t map)``

   unload the map.

   .. raw:: html

      <div class="itemizedlist">

   -  *dmat* - tag

   -  *map* - loaded map

   .. raw:: html

      </div>

-  ``void bus_dmamap_sync (bus_dma_tag_t dmat,               bus_dmamap_t map, bus_dmasync_op_t op)``

   Synchronise a loaded buffer with its bounce pages before and after
   physical transfer to or from device. This is the function that does
   all the necessary copying of data between the original buffer and its
   mapped version. The buffers must be synchronized both before and
   after doing the transfer.

   .. raw:: html

      <div class="itemizedlist">

   -  *dmat* - tag

   -  *map* - loaded map

   -  *op* - type of synchronization operation to perform:

   .. raw:: html

      </div>

   .. raw:: html

      <div class="itemizedlist">

   -  ``BUS_DMASYNC_PREREAD`` - before reading from device into buffer

   -  ``BUS_DMASYNC_POSTREAD`` - after reading from device into buffer

   -  ``BUS_DMASYNC_PREWRITE`` - before writing the buffer to device

   -  ``BUS_DMASYNC_POSTWRITE`` - after writing the buffer to device

   .. raw:: html

      </div>

.. raw:: html

   </div>

As of now PREREAD and POSTWRITE are null operations but that may change
in the future, so they must not be ignored in the driver.
Synchronization is not needed for the memory obtained from
``bus_dmamem_alloc()``.

Before calling the callback function from ``bus_dmamap_load()`` the
segment array is stored in the stack. And it gets pre-allocated for the
maximal number of segments allowed by the tag. Because of this the
practical limit for the number of segments on i386 architecture is about
250-300 (the kernel stack is 4KB minus the size of the user structure,
size of a segment array entry is 8 bytes, and some space must be left).
Because the array is allocated based on the maximal number this value
must not be set higher than really needed. Fortunately, for most of
hardware the maximal supported number of segments is much lower. But if
the driver wants to handle buffers with a very large number of
scatter-gather segments it should do that in portions: load part of the
buffer, transfer it to the device, load next part of the buffer, and so
on.

Another practical consequence is that the number of segments may limit
the size of the buffer. If all the pages in the buffer happen to be
physically non-contiguous then the maximal supported buffer size for
that fragmented case would be (nsegments \* page\_size). For example, if
a maximal number of 10 segments is supported then on i386 maximal
guaranteed supported buffer size would be 40K. If a higher size is
desired then special tricks should be used in the driver.

If the hardware does not support scatter-gather at all or the driver
wants to support some buffer size even if it is heavily fragmented then
the solution is to allocate a contiguous buffer in the driver and use it
as intermediate storage if the original buffer does not fit.

Below are the typical call sequences when using a map depend on the use
of the map. The characters -> are used to show the flow of time.

For a buffer which stays practically fixed during all the time between
attachment and detachment of a device:

bus\_dmamem\_alloc -> bus\_dmamap\_load -> ...use buffer... -> ->
bus\_dmamap\_unload -> bus\_dmamem\_free

For a buffer that changes frequently and is passed from outside the
driver:

.. code:: programlisting

              bus_dmamap_create ->
              -> bus_dmamap_load -> bus_dmamap_sync(PRE...) -> do transfer ->
              -> bus_dmamap_sync(POST...) -> bus_dmamap_unload ->
              ...
              -> bus_dmamap_load -> bus_dmamap_sync(PRE...) -> do transfer ->
              -> bus_dmamap_sync(POST...) -> bus_dmamap_unload ->
              -> bus_dmamap_destroy        

When loading a map created by ``bus_dmamem_alloc()`` the passed address
and size of the buffer must be the same as used in
``bus_dmamem_alloc()``. In this case it is guaranteed that the whole
buffer will be mapped as one segment (so the callback may be based on
this assumption) and the request will be executed immediately
(EINPROGRESS will never be returned). All the callback needs to do in
this case is to save the physical address.

A typical example would be:

.. code:: programlisting

              static void
            alloc_callback(void *arg, bus_dma_segment_t *seg, int nseg, int error)
            {
              *(bus_addr_t *)arg = seg[0].ds_addr;
            }

              ...
              int error;
              struct somedata {
                ....
              };
              struct somedata *vsomedata; /* virtual address */
              bus_addr_t psomedata; /* physical bus-relative address */
              bus_dma_tag_t tag_somedata;
              bus_dmamap_t map_somedata;
              ...

              error=bus_dma_tag_create(parent_tag, alignment,
               boundary, lowaddr, highaddr, /*filter*/ NULL, /*filterarg*/ NULL,
               /*maxsize*/ sizeof(struct somedata), /*nsegments*/ 1,
               /*maxsegsz*/ sizeof(struct somedata), /*flags*/ 0,
               &tag_somedata);
              if(error)
              return error;

              error = bus_dmamem_alloc(tag_somedata, &vsomedata, /* flags*/ 0,
                 &map_somedata);
              if(error)
                 return error;

              bus_dmamap_load(tag_somedata, map_somedata, (void *)vsomedata,
                 sizeof (struct somedata), alloc_callback,
                 (void *) &psomedata, /*flags*/0);        

Looks a bit long and complicated but that is the way to do it. The
practical consequence is: if multiple memory areas are allocated always
together it would be a really good idea to combine them all into one
structure and allocate as one (if the alignment and boundary limitations
permit).

When loading an arbitrary buffer into the map created by
``bus_dmamap_create()`` special measures must be taken to synchronize
with the callback in case it would be delayed. The code would look like:

.. code:: programlisting

              {
               int s;
               int error;

               s = splsoftvm();
               error = bus_dmamap_load(
                   dmat,
                   dmamap,
                   buffer_ptr,
                   buffer_len,
                   callback,
                   /*callback_arg*/ buffer_descriptor,
                   /*flags*/0);
               if (error == EINPROGRESS) {
                   /*
                    * Do whatever is needed to ensure synchronization
                    * with callback. Callback is guaranteed not to be started
                    * until we do splx() or tsleep().
                    */
                  }
               splx(s);
              }        

Two possible approaches for the processing of requests are:

1. If requests are completed by marking them explicitly as done (such as
the CAM requests) then it would be simpler to put all the further
processing into the callback driver which would mark the request when it
is done. Then not much extra synchronization is needed. For the flow
control reasons it may be a good idea to freeze the request queue until
this request gets completed.

2. If requests are completed when the function returns (such as classic
read or write requests on character devices) then a synchronization flag
should be set in the buffer descriptor and ``tsleep()`` called. Later
when the callback gets called it will do its processing and check this
synchronization flag. If it is set then the callback should issue a
wakeup. In this approach the callback function could either do all the
needed processing (just like the previous case) or simply save the
segments array in the buffer descriptor. Then after callback completes
the calling function could use this saved segments array and do all the
processing.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------+-------------------------------------+
| `Prev <isa-driver-resources.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-dma.html>`__   |
+-----------------------------------------+----------------------------+-------------------------------------+
| 10.5.?Resources?                        | `Home <index.html>`__      | ?10.7.?DMA                          |
+-----------------------------------------+----------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
