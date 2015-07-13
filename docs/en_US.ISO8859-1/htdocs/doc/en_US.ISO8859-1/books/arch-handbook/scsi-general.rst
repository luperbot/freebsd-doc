==========================
12.2.?General Architecture
==========================

.. raw:: html

   <div class="navheader">

12.2.?General Architecture
`Prev <scsi.html>`__?
Chapter?12.?Common Access Method SCSI Controllers
?\ `Next <scsi-polling.html>`__

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

12.2.?General Architecture
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CAM stands for Common Access Method. It is a generic way to address the
I/O buses in a SCSI-like way. This allows a separation of the generic
device drivers from the drivers controlling the I/O bus: for example the
disk driver becomes able to control disks on both SCSI, IDE, and/or any
other bus so the disk driver portion does not have to be rewritten (or
copied and modified) for every new I/O bus. Thus the two most important
active entities are:

.. raw:: html

   <div class="itemizedlist">

-  *Peripheral Modules* - a driver for peripheral devices (disk, tape,
   CD-ROM, etc.)

-  *SCSI Interface Modules* (SIM) - a Host Bus Adapter drivers for
   connecting to an I/O bus such as SCSI or IDE.

.. raw:: html

   </div>

A peripheral driver receives requests from the OS, converts them to a
sequence of SCSI commands and passes these SCSI commands to a SCSI
Interface Module. The SCSI Interface Module is responsible for passing
these commands to the actual hardware (or if the actual hardware is not
SCSI but, for example, IDE then also converting the SCSI commands to the
native commands of the hardware).

Because we are interested in writing a SCSI adapter driver here, from
this point on we will consider everything from the SIM standpoint.

A typical SIM driver needs to include the following CAM-related header
files:

.. code:: programlisting

    #include <cam/cam.h>
    #include <cam/cam_ccb.h>
    #include <cam/cam_sim.h>
    #include <cam/cam_xpt_sim.h>
    #include <cam/cam_debug.h>
    #include <cam/scsi/scsi_all.h>

The first thing each SIM driver must do is register itself with the CAM
subsystem. This is done during the driver's ``xxx_attach()`` function
(here and further xxx\_ is used to denote the unique driver name
prefix). The ``xxx_attach()`` function itself is called by the system
bus auto-configuration code which we do not describe here.

This is achieved in multiple steps: first it is necessary to allocate
the queue of requests associated with this SIM:

.. code:: programlisting

        struct cam_devq *devq;

        if(( devq = cam_simq_alloc(SIZE) )==NULL) {
            error; /* some code to handle the error */
        }

Here ``SIZE`` is the size of the queue to be allocated, maximal number
of requests it could contain. It is the number of requests that the SIM
driver can handle in parallel on one SCSI card. Commonly it can be
calculated as:

.. code:: programlisting

    SIZE = NUMBER_OF_SUPPORTED_TARGETS * MAX_SIMULTANEOUS_COMMANDS_PER_TARGET

Next we create a descriptor of our SIM:

.. code:: programlisting

        struct cam_sim *sim;

        if(( sim = cam_sim_alloc(action_func, poll_func, driver_name,
                softc, unit, mtx, max_dev_transactions,
                max_tagged_dev_transactions, devq) )==NULL) {
            cam_simq_free(devq);
            error; /* some code to handle the error */
        }

Note that if we are not able to create a SIM descriptor we free the
``devq`` also because we can do nothing else with it and we want to
conserve memory.

If a SCSI card has multiple SCSI buses on it then each bus requires its
own ``cam_sim`` structure.

An interesting question is what to do if a SCSI card has more than one
SCSI bus, do we need one ``devq`` structure per card or per SCSI bus?
The answer given in the comments to the CAM code is: either way, as the
driver's author prefers.

The arguments are:

.. raw:: html

   <div class="itemizedlist">

-  ``action_func`` - pointer to the driver's ``xxx_action`` function.

   .. raw:: html

      <div class="funcsynopsis">

   +--------------------------------------------------+------------------------------------------------+-----+
   | ``static void         xxx_action           (``   | struct cam\_sim \*simunion ccb \*ccb\ ``)``;   | ?   |
   +--------------------------------------------------+------------------------------------------------+-----+

   .. raw:: html

      <div class="paramdef-list">

   ``         struct cam_sim *sim,         union ccb *ccb           ``;

   .. raw:: html

      </div>

   .. raw:: html

      <div class="funcprototype-spacer">

   ?

   .. raw:: html

      </div>

   .. raw:: html

      </div>

-  ``poll_func`` - pointer to the driver's ``xxx_poll()``

   .. raw:: html

      <div class="funcsynopsis">

   +------------------------------------------------+---------------------------------+-----+
   | ``static void         xxx_poll           (``   | struct cam\_sim \*sim\ ``)``;   | ?   |
   +------------------------------------------------+---------------------------------+-----+

   .. raw:: html

      <div class="paramdef-list">

   ``         struct cam_sim *sim           ``;

   .. raw:: html

      </div>

   .. raw:: html

      <div class="funcprototype-spacer">

   ?

   .. raw:: html

      </div>

   .. raw:: html

      </div>

-  driver\_name - the name of the actual driver, such as “ncr” or “wds”.

-  ``softc`` - pointer to the driver's internal descriptor for this SCSI
   card. This pointer will be used by the driver in future to get
   private data.

-  unit - the controller unit number, for example for controller “mps0”
   this number will be 0

-  mtx - Lock associated with this SIM. For SIMs that don't know about
   locking, pass in Giant. For SIMs that do, pass in the lock used to
   guard this SIM's data structures. This lock will be held when
   xxx\_action and xxx\_poll are called.

-  max\_dev\_transactions - maximal number of simultaneous transactions
   per SCSI target in the non-tagged mode. This value will be almost
   universally equal to 1, with possible exceptions only for the
   non-SCSI cards. Also the drivers that hope to take advantage by
   preparing one transaction while another one is executed may set it to
   2 but this does not seem to be worth the complexity.

-  max\_tagged\_dev\_transactions - the same thing, but in the tagged
   mode. Tags are the SCSI way to initiate multiple transactions on a
   device: each transaction is assigned a unique tag and the transaction
   is sent to the device. When the device completes some transaction it
   sends back the result together with the tag so that the SCSI adapter
   (and the driver) can tell which transaction was completed. This
   argument is also known as the maximal tag depth. It depends on the
   abilities of the SCSI adapter.

.. raw:: html

   </div>

Finally we register the SCSI buses associated with our SCSI adapter:

.. code:: programlisting

        if(xpt_bus_register(sim, softc, bus_number) != CAM_SUCCESS) {
            cam_sim_free(sim, /*free_devq*/ TRUE);
            error; /* some code to handle the error */
        }

If there is one ``devq`` structure per SCSI bus (i.e., we consider a
card with multiple buses as multiple cards with one bus each) then the
bus number will always be 0, otherwise each bus on the SCSI card should
be get a distinct number. Each bus needs its own separate structure
cam\_sim.

After that our controller is completely hooked to the CAM system. The
value of ``devq`` can be discarded now: sim will be passed as an
argument in all further calls from CAM and devq can be derived from it.

CAM provides the framework for such asynchronous events. Some events
originate from the lower levels (the SIM drivers), some events originate
from the peripheral drivers, some events originate from the CAM
subsystem itself. Any driver can register callbacks for some types of
the asynchronous events, so that it would be notified if these events
occur.

A typical example of such an event is a device reset. Each transaction
and event identifies the devices to which it applies by the means of
“path”. The target-specific events normally occur during a transaction
with this device. So the path from that transaction may be re-used to
report this event (this is safe because the event path is copied in the
event reporting routine but not deallocated nor passed anywhere
further). Also it is safe to allocate paths dynamically at any time
including the interrupt routines, although that incurs certain overhead,
and a possible problem with this approach is that there may be no free
memory at that time. For a bus reset event we need to define a wildcard
path including all devices on the bus. So we can create the path for the
future bus reset events in advance and avoid problems with the future
memory shortage:

.. code:: programlisting

        struct cam_path *path;

        if(xpt_create_path(&path, /*periph*/NULL,
                    cam_sim_path(sim), CAM_TARGET_WILDCARD,
                    CAM_LUN_WILDCARD) != CAM_REQ_CMP) {
            xpt_bus_deregister(cam_sim_path(sim));
            cam_sim_free(sim, /*free_devq*/TRUE);
            error; /* some code to handle the error */
        }

        softc->wpath = path;
        softc->sim = sim;

As you can see the path includes:

.. raw:: html

   <div class="itemizedlist">

-  ID of the peripheral driver (NULL here because we have none)

-  ID of the SIM driver (``cam_sim_path(sim)``)

-  SCSI target number of the device (CAM\_TARGET\_WILDCARD means “all
   devices”)

-  SCSI LUN number of the subdevice (CAM\_LUN\_WILDCARD means “all
   LUNs”)

.. raw:: html

   </div>

If the driver can not allocate this path it will not be able to work
normally, so in that case we dismantle that SCSI bus.

And we save the path pointer in the ``softc`` structure for future use.
After that we save the value of sim (or we can also discard it on the
exit from ``xxx_probe()`` if we wish).

That is all for a minimalistic initialization. To do things right there
is one more issue left.

For a SIM driver there is one particularly interesting event: when a
target device is considered lost. In this case resetting the SCSI
negotiations with this device may be a good idea. So we register a
callback for this event with CAM. The request is passed to CAM by
requesting CAM action on a CAM control block for this type of request:

.. code:: programlisting

        struct ccb_setasync csa;

        xpt_setup_ccb(&csa.ccb_h, path, /*priority*/5);
        csa.ccb_h.func_code = XPT_SASYNC_CB;
        csa.event_enable = AC_LOST_DEVICE;
        csa.callback = xxx_async;
        csa.callback_arg = sim;
        xpt_action((union ccb *)&csa);

Now we take a look at the ``xxx_action()`` and ``xxx_poll()`` driver
entry points.

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+------------------------------------------------+-----+
| ``static void         xxx_action       (``   | struct cam\_sim \*simunion ccb \*ccb\ ``)``;   | ?   |
+----------------------------------------------+------------------------------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``         struct cam_sim *sim,         union ccb *ccb       ``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

Do some action on request of the CAM subsystem. Sim describes the SIM
for the request, CCB is the request itself. CCB stands for “CAM Control
Block”. It is a union of many specific instances, each describing
arguments for some type of transactions. All of these instances share
the CCB header where the common part of arguments is stored.

CAM supports the SCSI controllers working in both initiator (“normal”)
mode and target (simulating a SCSI device) mode. Here we only consider
the part relevant to the initiator mode.

There are a few function and macros (in other words, methods) defined to
access the public data in the struct sim:

.. raw:: html

   <div class="itemizedlist">

-  ``cam_sim_path(sim)`` - the path ID (see above)

-  ``cam_sim_name(sim)`` - the name of the sim

-  ``cam_sim_softc(sim)`` - the pointer to the softc (driver private
   data) structure

-  `` cam_sim_unit(sim)`` - the unit number

-  `` cam_sim_bus(sim)`` - the bus ID

.. raw:: html

   </div>

To identify the device, ``xxx_action()`` can get the unit number and
pointer to its structure softc using these functions.

The type of request is stored in ``ccb->ccb_h.func_code``. So generally
``xxx_action()`` consists of a big switch:

.. code:: programlisting

        struct xxx_softc *softc = (struct xxx_softc *) cam_sim_softc(sim);
        struct ccb_hdr *ccb_h = &ccb->ccb_h;
        int unit = cam_sim_unit(sim);
        int bus = cam_sim_bus(sim);

        switch(ccb_h->func_code) {
        case ...:
            ...
        default:
            ccb_h->status = CAM_REQ_INVALID;
            xpt_done(ccb);
            break;
        }

As can be seen from the default case (if an unknown command was
received) the return code of the command is set into
``ccb->ccb_h.status`` and the completed CCB is returned back to CAM by
calling ``xpt_done(ccb)``.

``xpt_done()`` does not have to be called from ``xxx_action()``: For
example an I/O request may be enqueued inside the SIM driver and/or its
SCSI controller. Then when the device would post an interrupt signaling
that the processing of this request is complete ``xpt_done()`` may be
called from the interrupt handling routine.

Actually, the CCB status is not only assigned as a return code but a CCB
has some status all the time. Before CCB is passed to the
``xxx_action()`` routine it gets the status CCB\_REQ\_INPROG meaning
that it is in progress. There are a surprising number of status values
defined in ``/sys/cam/cam.h`` which should be able to represent the
status of a request in great detail. More interesting yet, the status is
in fact a “bitwise or” of an enumerated status value (the lower 6 bits)
and possible additional flag-like bits (the upper bits). The enumerated
values will be discussed later in more detail. The summary of them can
be found in the Errors Summary section. The possible status flags are:

.. raw:: html

   <div class="itemizedlist">

-  *CAM\_DEV\_QFRZN* - if the SIM driver gets a serious error (for
   example, the device does not respond to the selection or breaks the
   SCSI protocol) when processing a CCB it should freeze the request
   queue by calling ``xpt_freeze_simq()``, return the other enqueued but
   not processed yet CCBs for this device back to the CAM queue, then
   set this flag for the troublesome CCB and call ``xpt_done()``. This
   flag causes the CAM subsystem to unfreeze the queue after it handles
   the error.

-  *CAM\_AUTOSNS\_VALID* - if the device returned an error condition and
   the flag CAM\_DIS\_AUTOSENSE is not set in CCB the SIM driver must
   execute the REQUEST SENSE command automatically to extract the sense
   (extended error information) data from the device. If this attempt
   was successful the sense data should be saved in the CCB and this
   flag set.

-  *CAM\_RELEASE\_SIMQ* - like CAM\_DEV\_QFRZN but used in case there is
   some problem (or resource shortage) with the SCSI controller itself.
   Then all the future requests to the controller should be stopped by
   ``xpt_freeze_simq()``. The controller queue will be restarted after
   the SIM driver overcomes the shortage and informs CAM by returning
   some CCB with this flag set.

-  *CAM\_SIM\_QUEUED* - when SIM puts a CCB into its request queue this
   flag should be set (and removed when this CCB gets dequeued before
   being returned back to CAM). This flag is not used anywhere in the
   CAM code now, so its purpose is purely diagnostic.

-  *CAM\_QOS\_VALID* - The QOS data is now valid.

.. raw:: html

   </div>

The function ``xxx_action()`` is not allowed to sleep, so all the
synchronization for resource access must be done using SIM or device
queue freezing. Besides the aforementioned flags the CAM subsystem
provides functions ``xpt_release_simq()`` and ``xpt_release_devq()`` to
unfreeze the queues directly, without passing a CCB to CAM.

The CCB header contains the following fields:

.. raw:: html

   <div class="itemizedlist">

-  *path* - path ID for the request

-  *target\_id* - target device ID for the request

-  *target\_lun* - LUN ID of the target device

-  *timeout* - timeout interval for this command, in milliseconds

-  *timeout\_ch* - a convenience place for the SIM driver to store the
   timeout handle (the CAM subsystem itself does not make any
   assumptions about it)

-  *flags* - various bits of information about the request spriv\_ptr0,
   spriv\_ptr1 - fields reserved for private use by the SIM driver (such
   as linking to the SIM queues or SIM private control blocks);
   actually, they exist as unions: spriv\_ptr0 and spriv\_ptr1 have the
   type (void \*), spriv\_field0 and spriv\_field1 have the type
   unsigned long, sim\_priv.entries[0].bytes and
   sim\_priv.entries[1].bytes are byte arrays of the size consistent
   with the other incarnations of the union and sim\_priv.bytes is one
   array, twice bigger.

.. raw:: html

   </div>

The recommended way of using the SIM private fields of CCB is to define
some meaningful names for them and use these meaningful names in the
driver, like:

.. code:: programlisting

    #define ccb_some_meaningful_name    sim_priv.entries[0].bytes
    #define ccb_hcb spriv_ptr1 /* for hardware control block */

The most common initiator mode requests are:

.. raw:: html

   <div class="itemizedlist">

-  *XPT\_SCSI\_IO* - execute an I/O transaction

   The instance “struct ccb\_scsiio csio” of the union ccb is used to
   transfer the arguments. They are:

   .. raw:: html

      <div class="itemizedlist">

   -  *cdb\_io* - pointer to the SCSI command buffer or the buffer
      itself

   -  *cdb\_len* - SCSI command length

   -  *data\_ptr* - pointer to the data buffer (gets a bit complicated
      if scatter/gather is used)

   -  *dxfer\_len* - length of the data to transfer

   -  *sglist\_cnt* - counter of the scatter/gather segments

   -  *scsi\_status* - place to return the SCSI status

   -  *sense\_data* - buffer for the SCSI sense information if the
      command returns an error (the SIM driver is supposed to run the
      REQUEST SENSE command automatically in this case if the CCB flag
      CAM\_DIS\_AUTOSENSE is not set)

   -  *sense\_len* - the length of that buffer (if it happens to be
      higher than size of sense\_data the SIM driver must silently
      assume the smaller value) resid, sense\_resid - if the transfer of
      data or SCSI sense returned an error these are the returned
      counters of the residual (not transferred) data. They do not seem
      to be especially meaningful, so in a case when they are difficult
      to compute (say, counting bytes in the SCSI controller's FIFO
      buffer) an approximate value will do as well. For a successfully
      completed transfer they must be set to zero.

   -  *tag\_action* - the kind of tag to use:

      .. raw:: html

         <div class="itemizedlist">

      -  CAM\_TAG\_ACTION\_NONE - do not use tags for this transaction

      -  MSG\_SIMPLE\_Q\_TAG, MSG\_HEAD\_OF\_Q\_TAG,
         MSG\_ORDERED\_Q\_TAG - value equal to the appropriate tag
         message (see /sys/cam/scsi/scsi\_message.h); this gives only
         the tag type, the SIM driver must assign the tag value itself

      .. raw:: html

         </div>

   .. raw:: html

      </div>

   The general logic of handling this request is the following:

   The first thing to do is to check for possible races, to make sure
   that the command did not get aborted when it was sitting in the
   queue:

   .. code:: programlisting

           struct ccb_scsiio *csio = &ccb->csio;

           if ((ccb_h->status & CAM_STATUS_MASK) != CAM_REQ_INPROG) {
               xpt_done(ccb);
               return;
           }

   Also we check that the device is supported at all by our controller:

   .. code:: programlisting

           if(ccb_h->target_id > OUR_MAX_SUPPORTED_TARGET_ID
           || cch_h->target_id == OUR_SCSI_CONTROLLERS_OWN_ID) {
               ccb_h->status = CAM_TID_INVALID;
               xpt_done(ccb);
               return;
           }
           if(ccb_h->target_lun > OUR_MAX_SUPPORTED_LUN) {
               ccb_h->status = CAM_LUN_INVALID;
               xpt_done(ccb);
               return;
           }

   Then allocate whatever data structures (such as card-dependent
   hardware control block) we need to process this request. If we can
   not then freeze the SIM queue and remember that we have a pending
   operation, return the CCB back and ask CAM to re-queue it. Later when
   the resources become available the SIM queue must be unfrozen by
   returning a ccb with the ``CAM_SIMQ_RELEASE`` bit set in its status.
   Otherwise, if all went well, link the CCB with the hardware control
   block (HCB) and mark it as queued.

   .. code:: programlisting

           struct xxx_hcb *hcb = allocate_hcb(softc, unit, bus);

           if(hcb == NULL) {
               softc->flags |= RESOURCE_SHORTAGE;
               xpt_freeze_simq(sim, /*count*/1);
               ccb_h->status = CAM_REQUEUE_REQ;
               xpt_done(ccb);
               return;
           }

           hcb->ccb = ccb; ccb_h->ccb_hcb = (void *)hcb;
           ccb_h->status |= CAM_SIM_QUEUED;

   Extract the target data from CCB into the hardware control block.
   Check if we are asked to assign a tag and if yes then generate an
   unique tag and build the SCSI tag messages. The SIM driver is also
   responsible for negotiations with the devices to set the maximal
   mutually supported bus width, synchronous rate and offset.

   .. code:: programlisting

           hcb->target = ccb_h->target_id; hcb->lun = ccb_h->target_lun;
           generate_identify_message(hcb);
           if( ccb_h->tag_action != CAM_TAG_ACTION_NONE )
               generate_unique_tag_message(hcb, ccb_h->tag_action);
           if( !target_negotiated(hcb) )
               generate_negotiation_messages(hcb);

   Then set up the SCSI command. The command storage may be specified in
   the CCB in many interesting ways, specified by the CCB flags. The
   command buffer can be contained in CCB or pointed to, in the latter
   case the pointer may be physical or virtual. Since the hardware
   commonly needs physical address we always convert the address to the
   physical one, typically using the busdma API.

   In case if a physical address is requested it is OK to return the CCB
   with the status CAM\_REQ\_INVALID, the current drivers do that. If
   necessary a physical address can be also converted or mapped back to
   a virtual address but with big pain, so we do not do that.

   .. code:: programlisting

           if(ccb_h->flags & CAM_CDB_POINTER) {
               /* CDB is a pointer */
               if(!(ccb_h->flags & CAM_CDB_PHYS)) {
                   /* CDB pointer is virtual */
                   hcb->cmd = vtobus(csio->cdb_io.cdb_ptr);
               } else {
                   /* CDB pointer is physical */
                   hcb->cmd = csio->cdb_io.cdb_ptr ;
               }
           } else {
               /* CDB is in the ccb (buffer) */
               hcb->cmd = vtobus(csio->cdb_io.cdb_bytes);
           }
           hcb->cmdlen = csio->cdb_len;

   Now it is time to set up the data. Again, the data storage may be
   specified in the CCB in many interesting ways, specified by the CCB
   flags. First we get the direction of the data transfer. The simplest
   case is if there is no data to transfer:

   .. code:: programlisting

           int dir = (ccb_h->flags & CAM_DIR_MASK);

           if (dir == CAM_DIR_NONE)
               goto end_data;

   Then we check if the data is in one chunk or in a scatter-gather
   list, and the addresses are physical or virtual. The SCSI controller
   may be able to handle only a limited number of chunks of limited
   length. If the request hits this limitation we return an error. We
   use a special function to return the CCB to handle in one place the
   HCB resource shortages. The functions to add chunks are
   driver-dependent, and here we leave them without detailed
   implementation. See description of the SCSI command (CDB) handling
   for the details on the address-translation issues. If some variation
   is too difficult or impossible to implement with a particular card it
   is OK to return the status CAM\_REQ\_INVALID. Actually, it seems like
   the scatter-gather ability is not used anywhere in the CAM code now.
   But at least the case for a single non-scattered virtual buffer must
   be implemented, it is actively used by CAM.

   .. code:: programlisting

           int rv;

           initialize_hcb_for_data(hcb);

           if((!(ccb_h->flags & CAM_SCATTER_VALID)) {
               /* single buffer */
               if(!(ccb_h->flags & CAM_DATA_PHYS)) {
                   rv = add_virtual_chunk(hcb, csio->data_ptr, csio->dxfer_len, dir);
                   }
               } else {
                   rv = add_physical_chunk(hcb, csio->data_ptr, csio->dxfer_len, dir);
               }
           } else {
               int i;
               struct bus_dma_segment *segs;
               segs = (struct bus_dma_segment *)csio->data_ptr;

               if ((ccb_h->flags & CAM_SG_LIST_PHYS) != 0) {
                   /* The SG list pointer is physical */
                   rv = setup_hcb_for_physical_sg_list(hcb, segs, csio->sglist_cnt);
               } else if (!(ccb_h->flags & CAM_DATA_PHYS)) {
                   /* SG buffer pointers are virtual */
                   for (i = 0; i < csio->sglist_cnt; i++) {
                       rv = add_virtual_chunk(hcb, segs[i].ds_addr,
                           segs[i].ds_len, dir);
                       if (rv != CAM_REQ_CMP)
                           break;
                   }
               } else {
                   /* SG buffer pointers are physical */
                   for (i = 0; i < csio->sglist_cnt; i++) {
                       rv = add_physical_chunk(hcb, segs[i].ds_addr,
                           segs[i].ds_len, dir);
                       if (rv != CAM_REQ_CMP)
                           break;
                   }
               }
           }
           if(rv != CAM_REQ_CMP) {
               /* we expect that add_*_chunk() functions return CAM_REQ_CMP
                * if they added a chunk successfully, CAM_REQ_TOO_BIG if
                * the request is too big (too many bytes or too many chunks),
                * CAM_REQ_INVALID in case of other troubles
                */
               free_hcb_and_ccb_done(hcb, ccb, rv);
               return;
           }
           end_data:

   If disconnection is disabled for this CCB we pass this information to
   the hcb:

   .. code:: programlisting

           if(ccb_h->flags & CAM_DIS_DISCONNECT)
               hcb_disable_disconnect(hcb);

   If the controller is able to run REQUEST SENSE command all by itself
   then the value of the flag CAM\_DIS\_AUTOSENSE should also be passed
   to it, to prevent automatic REQUEST SENSE if the CAM subsystem does
   not want it.

   The only thing left is to set up the timeout, pass our hcb to the
   hardware and return, the rest will be done by the interrupt handler
   (or timeout handler).

   .. code:: programlisting

           ccb_h->timeout_ch = timeout(xxx_timeout, (caddr_t) hcb,
               (ccb_h->timeout * hz) / 1000); /* convert milliseconds to ticks */
           put_hcb_into_hardware_queue(hcb);
           return;

   And here is a possible implementation of the function returning CCB:

   .. code:: programlisting

           static void
           free_hcb_and_ccb_done(struct xxx_hcb *hcb, union ccb *ccb, u_int32_t status)
           {
               struct xxx_softc *softc = hcb->softc;

               ccb->ccb_h.ccb_hcb = 0;
               if(hcb != NULL) {
                   untimeout(xxx_timeout, (caddr_t) hcb, ccb->ccb_h.timeout_ch);
                   /* we're about to free a hcb, so the shortage has ended */
                   if(softc->flags & RESOURCE_SHORTAGE)  {
                       softc->flags &= ~RESOURCE_SHORTAGE;
                       status |= CAM_RELEASE_SIMQ;
                   }
                   free_hcb(hcb); /* also removes hcb from any internal lists */
               }
               ccb->ccb_h.status = status |
                   (ccb->ccb_h.status & ~(CAM_STATUS_MASK|CAM_SIM_QUEUED));
               xpt_done(ccb);
           }

-  *XPT\_RESET\_DEV* - send the SCSI “BUS DEVICE RESET” message to a
   device

   There is no data transferred in CCB except the header and the most
   interesting argument of it is target\_id. Depending on the controller
   hardware a hardware control block just like for the XPT\_SCSI\_IO
   request may be constructed (see XPT\_SCSI\_IO request description)
   and sent to the controller or the SCSI controller may be immediately
   programmed to send this RESET message to the device or this request
   may be just not supported (and return the status CAM\_REQ\_INVALID).
   Also on completion of the request all the disconnected transactions
   for this target must be aborted (probably in the interrupt routine).

   Also all the current negotiations for the target are lost on reset,
   so they might be cleaned too. Or they clearing may be deferred,
   because anyway the target would request re-negotiation on the next
   transaction.

-  *XPT\_RESET\_BUS* - send the RESET signal to the SCSI bus

   No arguments are passed in the CCB, the only interesting argument is
   the SCSI bus indicated by the struct sim pointer.

   A minimalistic implementation would forget the SCSI negotiations for
   all the devices on the bus and return the status CAM\_REQ\_CMP.

   The proper implementation would in addition actually reset the SCSI
   bus (possible also reset the SCSI controller) and mark all the CCBs
   being processed, both those in the hardware queue and those being
   disconnected, as done with the status CAM\_SCSI\_BUS\_RESET. Like:

   .. code:: programlisting

           int targ, lun;
           struct xxx_hcb *h, *hh;
           struct ccb_trans_settings neg;
           struct cam_path *path;

           /* The SCSI bus reset may take a long time, in this case its completion
            * should be checked by interrupt or timeout. But for simplicity
            * we assume here that it is really fast.
            */
           reset_scsi_bus(softc);

           /* drop all enqueued CCBs */
           for(h = softc->first_queued_hcb; h != NULL; h = hh) {
               hh = h->next;
               free_hcb_and_ccb_done(h, h->ccb, CAM_SCSI_BUS_RESET);
           }

           /* the clean values of negotiations to report */
           neg.bus_width = 8;
           neg.sync_period = neg.sync_offset = 0;
           neg.valid = (CCB_TRANS_BUS_WIDTH_VALID
               | CCB_TRANS_SYNC_RATE_VALID | CCB_TRANS_SYNC_OFFSET_VALID);

           /* drop all disconnected CCBs and clean negotiations  */
           for(targ=0; targ <= OUR_MAX_SUPPORTED_TARGET; targ++) {
               clean_negotiations(softc, targ);

               /* report the event if possible */
               if(xpt_create_path(&path, /*periph*/NULL,
                       cam_sim_path(sim), targ,
                       CAM_LUN_WILDCARD) == CAM_REQ_CMP) {
                   xpt_async(AC_TRANSFER_NEG, path, &neg);
                   xpt_free_path(path);
               }

               for(lun=0; lun <= OUR_MAX_SUPPORTED_LUN; lun++)
                   for(h = softc->first_discon_hcb[targ][lun]; h != NULL; h = hh) {
                       hh=h->next;
                       free_hcb_and_ccb_done(h, h->ccb, CAM_SCSI_BUS_RESET);
                   }
           }

           ccb->ccb_h.status = CAM_REQ_CMP;
           xpt_done(ccb);

           /* report the event */
           xpt_async(AC_BUS_RESET, softc->wpath, NULL);
           return;

   Implementing the SCSI bus reset as a function may be a good idea
   because it would be re-used by the timeout function as a last resort
   if the things go wrong.

-  *XPT\_ABORT* - abort the specified CCB

   The arguments are transferred in the instance “struct ccb\_abort cab”
   of the union ccb. The only argument field in it is:

   *abort\_ccb* - pointer to the CCB to be aborted

   If the abort is not supported just return the status CAM\_UA\_ABORT.
   This is also the easy way to minimally implement this call, return
   CAM\_UA\_ABORT in any case.

   The hard way is to implement this request honestly. First check that
   abort applies to a SCSI transaction:

   .. code:: programlisting

           struct ccb *abort_ccb;
           abort_ccb = ccb->cab.abort_ccb;

           if(abort_ccb->ccb_h.func_code != XPT_SCSI_IO) {
               ccb->ccb_h.status = CAM_UA_ABORT;
               xpt_done(ccb);
               return;
           }

   Then it is necessary to find this CCB in our queue. This can be done
   by walking the list of all our hardware control blocks in search for
   one associated with this CCB:

   .. code:: programlisting

           struct xxx_hcb *hcb, *h;

           hcb = NULL;

           /* We assume that softc->first_hcb is the head of the list of all
            * HCBs associated with this bus, including those enqueued for
            * processing, being processed by hardware and disconnected ones.
            */
           for(h = softc->first_hcb; h != NULL; h = h->next) {
               if(h->ccb == abort_ccb) {
                   hcb = h;
                   break;
               }
           }

           if(hcb == NULL) {
               /* no such CCB in our queue */
               ccb->ccb_h.status = CAM_PATH_INVALID;
               xpt_done(ccb);
               return;
           }

           hcb=found_hcb;

   Now we look at the current processing status of the HCB. It may be
   either sitting in the queue waiting to be sent to the SCSI bus, being
   transferred right now, or disconnected and waiting for the result of
   the command, or actually completed by hardware but not yet marked as
   done by software. To make sure that we do not get in any races with
   hardware we mark the HCB as being aborted, so that if this HCB is
   about to be sent to the SCSI bus the SCSI controller will see this
   flag and skip it.

   .. code:: programlisting

           int hstatus;

           /* shown as a function, in case special action is needed to make
            * this flag visible to hardware
            */
           set_hcb_flags(hcb, HCB_BEING_ABORTED);

           abort_again:

           hstatus = get_hcb_status(hcb);
           switch(hstatus) {
           case HCB_SITTING_IN_QUEUE:
               remove_hcb_from_hardware_queue(hcb);
               /* FALLTHROUGH */
           case HCB_COMPLETED:
               /* this is an easy case */
               free_hcb_and_ccb_done(hcb, abort_ccb, CAM_REQ_ABORTED);
               break;

   If the CCB is being transferred right now we would like to signal to
   the SCSI controller in some hardware-dependent way that we want to
   abort the current transfer. The SCSI controller would set the SCSI
   ATTENTION signal and when the target responds to it send an ABORT
   message. We also reset the timeout to make sure that the target is
   not sleeping forever. If the command would not get aborted in some
   reasonable time like 10 seconds the timeout routine would go ahead
   and reset the whole SCSI bus. Because the command will be aborted in
   some reasonable time we can just return the abort request now as
   successfully completed, and mark the aborted CCB as aborted (but not
   mark it as done yet).

   .. code:: programlisting

           case HCB_BEING_TRANSFERRED:
               untimeout(xxx_timeout, (caddr_t) hcb, abort_ccb->ccb_h.timeout_ch);
               abort_ccb->ccb_h.timeout_ch =
                   timeout(xxx_timeout, (caddr_t) hcb, 10 * hz);
               abort_ccb->ccb_h.status = CAM_REQ_ABORTED;
               /* ask the controller to abort that HCB, then generate
                * an interrupt and stop
                */
               if(signal_hardware_to_abort_hcb_and_stop(hcb) < 0) {
                   /* oops, we missed the race with hardware, this transaction
                    * got off the bus before we aborted it, try again */
                   goto abort_again;
               }

               break;

   If the CCB is in the list of disconnected then set it up as an abort
   request and re-queue it at the front of hardware queue. Reset the
   timeout and report the abort request to be completed.

   .. code:: programlisting

           case HCB_DISCONNECTED:
               untimeout(xxx_timeout, (caddr_t) hcb, abort_ccb->ccb_h.timeout_ch);
               abort_ccb->ccb_h.timeout_ch =
                   timeout(xxx_timeout, (caddr_t) hcb, 10 * hz);
               put_abort_message_into_hcb(hcb);
               put_hcb_at_the_front_of_hardware_queue(hcb);
               break;
           }
           ccb->ccb_h.status = CAM_REQ_CMP;
           xpt_done(ccb);
           return;

   That is all for the ABORT request, although there is one more issue.
   Because the ABORT message cleans all the ongoing transactions on a
   LUN we have to mark all the other active transactions on this LUN as
   aborted. That should be done in the interrupt routine, after the
   transaction gets aborted.

   Implementing the CCB abort as a function may be quite a good idea,
   this function can be re-used if an I/O transaction times out. The
   only difference would be that the timed out transaction would return
   the status CAM\_CMD\_TIMEOUT for the timed out request. Then the case
   XPT\_ABORT would be small, like that:

   .. code:: programlisting

           case XPT_ABORT:
               struct ccb *abort_ccb;
               abort_ccb = ccb->cab.abort_ccb;

               if(abort_ccb->ccb_h.func_code != XPT_SCSI_IO) {
                   ccb->ccb_h.status = CAM_UA_ABORT;
                   xpt_done(ccb);
                   return;
               }
               if(xxx_abort_ccb(abort_ccb, CAM_REQ_ABORTED) < 0)
                   /* no such CCB in our queue */
                   ccb->ccb_h.status = CAM_PATH_INVALID;
               else
                   ccb->ccb_h.status = CAM_REQ_CMP;
               xpt_done(ccb);
               return;

-  *XPT\_SET\_TRAN\_SETTINGS* - explicitly set values of SCSI transfer
   settings

   The arguments are transferred in the instance “struct
   ccb\_trans\_setting cts” of the union ccb:

   .. raw:: html

      <div class="itemizedlist">

   -  *valid* - a bitmask showing which settings should be updated:

   -  *CCB\_TRANS\_SYNC\_RATE\_VALID* - synchronous transfer rate

   -  *CCB\_TRANS\_SYNC\_OFFSET\_VALID* - synchronous offset

   -  *CCB\_TRANS\_BUS\_WIDTH\_VALID* - bus width

   -  *CCB\_TRANS\_DISC\_VALID* - set enable/disable disconnection

   -  *CCB\_TRANS\_TQ\_VALID* - set enable/disable tagged queuing

   -  *flags* - consists of two parts, binary arguments and
      identification of sub-operations. The binary arguments are:

      .. raw:: html

         <div class="itemizedlist">

      -  *CCB\_TRANS\_DISC\_ENB* - enable disconnection

      -  *CCB\_TRANS\_TAG\_ENB* - enable tagged queuing

      .. raw:: html

         </div>

   -  the sub-operations are:

      .. raw:: html

         <div class="itemizedlist">

      -  *CCB\_TRANS\_CURRENT\_SETTINGS* - change the current
         negotiations

      -  *CCB\_TRANS\_USER\_SETTINGS* - remember the desired user values
         sync\_period, sync\_offset - self-explanatory, if
         sync\_offset==0 then the asynchronous mode is requested
         bus\_width - bus width, in bits (not bytes)

      .. raw:: html

         </div>

   .. raw:: html

      </div>

   Two sets of negotiated parameters are supported, the user settings
   and the current settings. The user settings are not really used much
   in the SIM drivers, this is mostly just a piece of memory where the
   upper levels can store (and later recall) its ideas about the
   parameters. Setting the user parameters does not cause re-negotiation
   of the transfer rates. But when the SCSI controller does a
   negotiation it must never set the values higher than the user
   parameters, so it is essentially the top boundary.

   The current settings are, as the name says, current. Changing them
   means that the parameters must be re-negotiated on the next transfer.
   Again, these “new current settings” are not supposed to be forced on
   the device, just they are used as the initial step of negotiations.
   Also they must be limited by actual capabilities of the SCSI
   controller: for example, if the SCSI controller has 8-bit bus and the
   request asks to set 16-bit wide transfers this parameter must be
   silently truncated to 8-bit transfers before sending it to the
   device.

   One caveat is that the bus width and synchronous parameters are per
   target while the disconnection and tag enabling parameters are per
   lun.

   The recommended implementation is to keep 3 sets of negotiated (bus
   width and synchronous transfer) parameters:

   .. raw:: html

      <div class="itemizedlist">

   -  *user* - the user set, as above

   -  *current* - those actually in effect

   -  *goal* - those requested by setting of the “current” parameters

   .. raw:: html

      </div>

   The code looks like:

   .. code:: programlisting

           struct ccb_trans_settings *cts;
           int targ, lun;
           int flags;

           cts = &ccb->cts;
           targ = ccb_h->target_id;
           lun = ccb_h->target_lun;
           flags = cts->flags;
           if(flags & CCB_TRANS_USER_SETTINGS) {
               if(flags & CCB_TRANS_SYNC_RATE_VALID)
                   softc->user_sync_period[targ] = cts->sync_period;
               if(flags & CCB_TRANS_SYNC_OFFSET_VALID)
                   softc->user_sync_offset[targ] = cts->sync_offset;
               if(flags & CCB_TRANS_BUS_WIDTH_VALID)
                   softc->user_bus_width[targ] = cts->bus_width;

               if(flags & CCB_TRANS_DISC_VALID) {
                   softc->user_tflags[targ][lun] &= ~CCB_TRANS_DISC_ENB;
                   softc->user_tflags[targ][lun] |= flags & CCB_TRANS_DISC_ENB;
               }
               if(flags & CCB_TRANS_TQ_VALID) {
                   softc->user_tflags[targ][lun] &= ~CCB_TRANS_TQ_ENB;
                   softc->user_tflags[targ][lun] |= flags & CCB_TRANS_TQ_ENB;
               }
           }
           if(flags & CCB_TRANS_CURRENT_SETTINGS) {
               if(flags & CCB_TRANS_SYNC_RATE_VALID)
                   softc->goal_sync_period[targ] =
                       max(cts->sync_period, OUR_MIN_SUPPORTED_PERIOD);
               if(flags & CCB_TRANS_SYNC_OFFSET_VALID)
                   softc->goal_sync_offset[targ] =
                       min(cts->sync_offset, OUR_MAX_SUPPORTED_OFFSET);
               if(flags & CCB_TRANS_BUS_WIDTH_VALID)
                   softc->goal_bus_width[targ] = min(cts->bus_width, OUR_BUS_WIDTH);

               if(flags & CCB_TRANS_DISC_VALID) {
                   softc->current_tflags[targ][lun] &= ~CCB_TRANS_DISC_ENB;
                   softc->current_tflags[targ][lun] |= flags & CCB_TRANS_DISC_ENB;
               }
               if(flags & CCB_TRANS_TQ_VALID) {
                   softc->current_tflags[targ][lun] &= ~CCB_TRANS_TQ_ENB;
                   softc->current_tflags[targ][lun] |= flags & CCB_TRANS_TQ_ENB;
               }
           }
           ccb->ccb_h.status = CAM_REQ_CMP;
           xpt_done(ccb);
           return;

   Then when the next I/O request will be processed it will check if it
   has to re-negotiate, for example by calling the function
   target\_negotiated(hcb). It can be implemented like this:

   .. code:: programlisting

           int
           target_negotiated(struct xxx_hcb *hcb)
           {
               struct softc *softc = hcb->softc;
               int targ = hcb->targ;

               if( softc->current_sync_period[targ] != softc->goal_sync_period[targ]
               || softc->current_sync_offset[targ] != softc->goal_sync_offset[targ]
               || softc->current_bus_width[targ] != softc->goal_bus_width[targ] )
                   return 0; /* FALSE */
               else
                   return 1; /* TRUE */
           }

   After the values are re-negotiated the resulting values must be
   assigned to both current and goal parameters, so for future I/O
   transactions the current and goal parameters would be the same and
   ``target_negotiated()`` would return TRUE. When the card is
   initialized (in ``xxx_attach()``) the current negotiation values must
   be initialized to narrow asynchronous mode, the goal and current
   values must be initialized to the maximal values supported by
   controller.

   *XPT\_GET\_TRAN\_SETTINGS* - get values of SCSI transfer settings

   This operations is the reverse of XPT\_SET\_TRAN\_SETTINGS. Fill up
   the CCB instance “struct ccb\_trans\_setting cts” with data as
   requested by the flags CCB\_TRANS\_CURRENT\_SETTINGS or
   CCB\_TRANS\_USER\_SETTINGS (if both are set then the existing drivers
   return the current settings). Set all the bits in the valid field.

   *XPT\_CALC\_GEOMETRY* - calculate logical (BIOS) geometry of the disk

   The arguments are transferred in the instance “struct
   ccb\_calc\_geometry ccg” of the union ccb:

   .. raw:: html

      <div class="itemizedlist">

   -  *block\_size* - input, block (A.K.A sector) size in bytes

   -  *volume\_size* - input, volume size in bytes

   -  *cylinders* - output, logical cylinders

   -  *heads* - output, logical heads

   -  *secs\_per\_track* - output, logical sectors per track

   .. raw:: html

      </div>

   If the returned geometry differs much enough from what the SCSI
   controller BIOS thinks and a disk on this SCSI controller is used as
   bootable the system may not be able to boot. The typical calculation
   example taken from the aic7xxx driver is:

   .. code:: programlisting

           struct    ccb_calc_geometry *ccg;
           u_int32_t size_mb;
           u_int32_t secs_per_cylinder;
           int   extended;

           ccg = &ccb->ccg;
           size_mb = ccg->volume_size
               / ((1024L * 1024L) / ccg->block_size);
           extended = check_cards_EEPROM_for_extended_geometry(softc);

           if (size_mb > 1024 && extended) {
               ccg->heads = 255;
               ccg->secs_per_track = 63;
           } else {
               ccg->heads = 64;
               ccg->secs_per_track = 32;
           }
           secs_per_cylinder = ccg->heads * ccg->secs_per_track;
           ccg->cylinders = ccg->volume_size / secs_per_cylinder;
           ccb->ccb_h.status = CAM_REQ_CMP;
           xpt_done(ccb);
           return;

   This gives the general idea, the exact calculation depends on the
   quirks of the particular BIOS. If BIOS provides no way set the
   “extended translation” flag in EEPROM this flag should normally be
   assumed equal to 1. Other popular geometries are:

   .. code:: programlisting

           128 heads, 63 sectors - Symbios controllers
           16 heads, 63 sectors - old controllers

   Some system BIOSes and SCSI BIOSes fight with each other with
   variable success, for example a combination of Symbios 875/895 SCSI
   and Phoenix BIOS can give geometry 128/63 after power up and 255/63
   after a hard reset or soft reboot.

-  *XPT\_PATH\_INQ* - path inquiry, in other words get the SIM driver
   and SCSI controller (also known as HBA - Host Bus Adapter) properties

   The properties are returned in the instance “struct ccb\_pathinq cpi”
   of the union ccb:

   .. raw:: html

      <div class="itemizedlist">

   -  version\_num - the SIM driver version number, now all drivers use
      1

   -  hba\_inquiry - bitmask of features supported by the controller:

   -  PI\_MDP\_ABLE - supports MDP message (something from SCSI3?)

   -  PI\_WIDE\_32 - supports 32 bit wide SCSI

   -  PI\_WIDE\_16 - supports 16 bit wide SCSI

   -  PI\_SDTR\_ABLE - can negotiate synchronous transfer rate

   -  PI\_LINKED\_CDB - supports linked commands

   -  PI\_TAG\_ABLE - supports tagged commands

   -  PI\_SOFT\_RST - supports soft reset alternative (hard reset and
      soft reset are mutually exclusive within a SCSI bus)

   -  target\_sprt - flags for target mode support, 0 if unsupported

   -  hba\_misc - miscellaneous controller features:

   -  PIM\_SCANHILO - bus scans from high ID to low ID

   -  PIM\_NOREMOVE - removable devices not included in scan

   -  PIM\_NOINITIATOR - initiator role not supported

   -  PIM\_NOBUSRESET - user has disabled initial BUS RESET

   -  hba\_eng\_cnt - mysterious HBA engine count, something related to
      compression, now is always set to 0

   -  vuhba\_flags - vendor-unique flags, unused now

   -  max\_target - maximal supported target ID (7 for 8-bit bus, 15 for
      16-bit bus, 127 for Fibre Channel)

   -  max\_lun - maximal supported LUN ID (7 for older SCSI controllers,
      63 for newer ones)

   -  async\_flags - bitmask of installed Async handler, unused now

   -  hpath\_id - highest Path ID in the subsystem, unused now

   -  unit\_number - the controller unit number, cam\_sim\_unit(sim)

   -  bus\_id - the bus number, cam\_sim\_bus(sim)

   -  initiator\_id - the SCSI ID of the controller itself

   -  base\_transfer\_speed - nominal transfer speed in KB/s for
      asynchronous narrow transfers, equals to 3300 for SCSI

   -  sim\_vid - SIM driver's vendor id, a zero-terminated string of
      maximal length SIM\_IDLEN including the terminating zero

   -  hba\_vid - SCSI controller's vendor id, a zero-terminated string
      of maximal length HBA\_IDLEN including the terminating zero

   -  dev\_name - device driver name, a zero-terminated string of
      maximal length DEV\_IDLEN including the terminating zero, equal to
      cam\_sim\_name(sim)

   .. raw:: html

      </div>

   The recommended way of setting the string fields is using strncpy,
   like:

   .. code:: programlisting

           strncpy(cpi->dev_name, cam_sim_name(sim), DEV_IDLEN);

   After setting the values set the status to CAM\_REQ\_CMP and mark the
   CCB as done.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+-------------------------+-----------------------------------+
| `Prev <scsi.html>`__?                                | `Up <scsi.html>`__      | ?\ `Next <scsi-polling.html>`__   |
+------------------------------------------------------+-------------------------+-----------------------------------+
| Chapter?12.?Common Access Method SCSI Controllers?   | `Home <index.html>`__   | ?12.3.?Polling                    |
+------------------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
