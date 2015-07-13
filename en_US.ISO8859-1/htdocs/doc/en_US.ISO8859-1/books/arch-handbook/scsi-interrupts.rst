================
12.5.?Interrupts
================

.. raw:: html

   <div class="navheader">

12.5.?Interrupts
`Prev <scsi-async.html>`__?
Chapter?12.?Common Access Method SCSI Controllers
?\ `Next <scsi-errors.html>`__

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

12.5.?Interrupts
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The exact type of the interrupt routine depends on the type of the
peripheral bus (PCI, ISA and so on) to which the SCSI controller is
connected.

The interrupt routines of the SIM drivers run at the interrupt level
splcam. So ``splcam()`` should be used in the driver to synchronize
activity between the interrupt routine and the rest of the driver (for a
multiprocessor-aware driver things get yet more interesting but we
ignore this case here). The pseudo-code in this document happily ignores
the problems of synchronization. The real code must not ignore them. A
simple-minded approach is to set ``splcam()`` on the entry to the other
routines and reset it on return thus protecting them by one big critical
section. To make sure that the interrupt level will be always restored a
wrapper function can be defined, like:

.. code:: programlisting

        static void
        xxx_action(struct cam_sim *sim, union ccb *ccb)
        {
            int s;
            s = splcam();
            xxx_action1(sim, ccb);
            splx(s);
        }

        static void
        xxx_action1(struct cam_sim *sim, union ccb *ccb)
        {
            ... process the request ...
        }

This approach is simple and robust but the problem with it is that
interrupts may get blocked for a relatively long time and this would
negatively affect the system's performance. On the other hand the
functions of the ``spl()`` family have rather high overhead, so vast
amount of tiny critical sections may not be good either.

The conditions handled by the interrupt routine and the details depend
very much on the hardware. We consider the set of “typical” conditions.

First, we check if a SCSI reset was encountered on the bus (probably
caused by another SCSI controller on the same SCSI bus). If so we drop
all the enqueued and disconnected requests, report the events and
re-initialize our SCSI controller. It is important that during this
initialization the controller will not issue another reset or else two
controllers on the same SCSI bus could ping-pong resets forever. The
case of fatal controller error/hang could be handled in the same place,
but it will probably need also sending RESET signal to the SCSI bus to
reset the status of the connections with the SCSI devices.

.. code:: programlisting

        int fatal=0;
        struct ccb_trans_settings neg;
        struct cam_path *path;

        if( detected_scsi_reset(softc)
        || (fatal = detected_fatal_controller_error(softc)) ) {
            int targ, lun;
            struct xxx_hcb *h, *hh;

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
                        if(fatal)
                            free_hcb_and_ccb_done(h, h->ccb, CAM_UNREC_HBA_ERROR);
                        else
                            free_hcb_and_ccb_done(h, h->ccb, CAM_SCSI_BUS_RESET);
                    }
            }

            /* report the event */
            xpt_async(AC_BUS_RESET, softc->wpath, NULL);

            /* re-initialization may take a lot of time, in such case
             * its completion should be signaled by another interrupt or
             * checked on timeout - but for simplicity we assume here that
             * it is really fast
             */
            if(!fatal) {
                reinitialize_controller_without_scsi_reset(softc);
            } else {
                reinitialize_controller_with_scsi_reset(softc);
            }
            schedule_next_hcb(softc);
            return;
        }

If interrupt is not caused by a controller-wide condition then probably
something has happened to the current hardware control block. Depending
on the hardware there may be other non-HCB-related events, we just do
not consider them here. Then we analyze what happened to this HCB:

.. code:: programlisting

        struct xxx_hcb *hcb, *h, *hh;
        int hcb_status, scsi_status;
        int ccb_status;
        int targ;
        int lun_to_freeze;

        hcb = get_current_hcb(softc);
        if(hcb == NULL) {
            /* either stray interrupt or something went very wrong
             * or this is something hardware-dependent
             */
            handle as necessary;
            return;
        }

        targ = hcb->target;
        hcb_status = get_status_of_current_hcb(softc);

First we check if the HCB has completed and if so we check the returned
SCSI status.

.. code:: programlisting

        if(hcb_status == COMPLETED) {
            scsi_status = get_completion_status(hcb);

Then look if this status is related to the REQUEST SENSE command and if
so handle it in a simple way.

.. code:: programlisting

            if(hcb->flags & DOING_AUTOSENSE) {
                if(scsi_status == GOOD) { /* autosense was successful */
                    hcb->ccb->ccb_h.status |= CAM_AUTOSNS_VALID;
                    free_hcb_and_ccb_done(hcb, hcb->ccb, CAM_SCSI_STATUS_ERROR);
                } else {
            autosense_failed:
                    free_hcb_and_ccb_done(hcb, hcb->ccb, CAM_AUTOSENSE_FAIL);
                }
                schedule_next_hcb(softc);
                return;
            }

Else the command itself has completed, pay more attention to details. If
auto-sense is not disabled for this CCB and the command has failed with
sense data then run REQUEST SENSE command to receive that data.

.. code:: programlisting

            hcb->ccb->csio.scsi_status = scsi_status;
            calculate_residue(hcb);

            if( (hcb->ccb->ccb_h.flags & CAM_DIS_AUTOSENSE)==0
            && ( scsi_status == CHECK_CONDITION
                    || scsi_status == COMMAND_TERMINATED) ) {
                /* start auto-SENSE */
                hcb->flags |= DOING_AUTOSENSE;
                setup_autosense_command_in_hcb(hcb);
                restart_current_hcb(softc);
                return;
            }
            if(scsi_status == GOOD)
                free_hcb_and_ccb_done(hcb, hcb->ccb, CAM_REQ_CMP);
            else
                free_hcb_and_ccb_done(hcb, hcb->ccb, CAM_SCSI_STATUS_ERROR);
            schedule_next_hcb(softc);
            return;
        }

One typical thing would be negotiation events: negotiation messages
received from a SCSI target (in answer to our negotiation attempt or by
target's initiative) or the target is unable to negotiate (rejects our
negotiation messages or does not answer them).

.. code:: programlisting

        switch(hcb_status) {
        case TARGET_REJECTED_WIDE_NEG:
            /* revert to 8-bit bus */
            softc->current_bus_width[targ] = softc->goal_bus_width[targ] = 8;
            /* report the event */
            neg.bus_width = 8;
            neg.valid = CCB_TRANS_BUS_WIDTH_VALID;
            xpt_async(AC_TRANSFER_NEG, hcb->ccb.ccb_h.path_id, &neg);
            continue_current_hcb(softc);
            return;
        case TARGET_ANSWERED_WIDE_NEG:
            {
                int wd;

                wd = get_target_bus_width_request(softc);
                if(wd <= softc->goal_bus_width[targ]) {
                    /* answer is acceptable */
                    softc->current_bus_width[targ] =
                    softc->goal_bus_width[targ] = neg.bus_width = wd;

                    /* report the event */
                    neg.valid = CCB_TRANS_BUS_WIDTH_VALID;
                    xpt_async(AC_TRANSFER_NEG, hcb->ccb.ccb_h.path_id, &neg);
                } else {
                    prepare_reject_message(hcb);
                }
            }
            continue_current_hcb(softc);
            return;
        case TARGET_REQUESTED_WIDE_NEG:
            {
                int wd;

                wd = get_target_bus_width_request(softc);
                wd = min (wd, OUR_BUS_WIDTH);
                wd = min (wd, softc->user_bus_width[targ]);

                if(wd != softc->current_bus_width[targ]) {
                    /* the bus width has changed */
                    softc->current_bus_width[targ] =
                    softc->goal_bus_width[targ] = neg.bus_width = wd;

                    /* report the event */
                    neg.valid = CCB_TRANS_BUS_WIDTH_VALID;
                    xpt_async(AC_TRANSFER_NEG, hcb->ccb.ccb_h.path_id, &neg);
                }
                prepare_width_nego_rsponse(hcb, wd);
            }
            continue_current_hcb(softc);
            return;
        }

Then we handle any errors that could have happened during auto-sense in
the same simple-minded way as before. Otherwise we look closer at the
details again.

.. code:: programlisting

        if(hcb->flags & DOING_AUTOSENSE)
            goto autosense_failed;

        switch(hcb_status) {

The next event we consider is unexpected disconnect. Which is considered
normal after an ABORT or BUS DEVICE RESET message and abnormal in other
cases.

.. code:: programlisting

        case UNEXPECTED_DISCONNECT:
            if(requested_abort(hcb)) {
                /* abort affects all commands on that target+LUN, so
                 * mark all disconnected HCBs on that target+LUN as aborted too
                 */
                for(h = softc->first_discon_hcb[hcb->target][hcb->lun];
                        h != NULL; h = hh) {
                    hh=h->next;
                    free_hcb_and_ccb_done(h, h->ccb, CAM_REQ_ABORTED);
                }
                ccb_status = CAM_REQ_ABORTED;
            } else if(requested_bus_device_reset(hcb)) {
                int lun;

                /* reset affects all commands on that target, so
                 * mark all disconnected HCBs on that target+LUN as reset
                 */

                for(lun=0; lun <= OUR_MAX_SUPPORTED_LUN; lun++)
                    for(h = softc->first_discon_hcb[hcb->target][lun];
                            h != NULL; h = hh) {
                        hh=h->next;
                        free_hcb_and_ccb_done(h, h->ccb, CAM_SCSI_BUS_RESET);
                    }

                /* send event */
                xpt_async(AC_SENT_BDR, hcb->ccb->ccb_h.path_id, NULL);

                /* this was the CAM_RESET_DEV request itself, it is completed */
                ccb_status = CAM_REQ_CMP;
            } else {
                calculate_residue(hcb);
                ccb_status = CAM_UNEXP_BUSFREE;
                /* request the further code to freeze the queue */
                hcb->ccb->ccb_h.status |= CAM_DEV_QFRZN;
                lun_to_freeze = hcb->lun;
            }
            break;

If the target refuses to accept tags we notify CAM about that and return
back all commands for this LUN:

.. code:: programlisting

        case TAGS_REJECTED:
            /* report the event */
            neg.flags = 0 & ~CCB_TRANS_TAG_ENB;
            neg.valid = CCB_TRANS_TQ_VALID;
            xpt_async(AC_TRANSFER_NEG, hcb->ccb.ccb_h.path_id, &neg);

            ccb_status = CAM_MSG_REJECT_REC;
            /* request the further code to freeze the queue */
            hcb->ccb->ccb_h.status |= CAM_DEV_QFRZN;
            lun_to_freeze = hcb->lun;
            break;

Then we check a number of other conditions, with processing basically
limited to setting the CCB status:

.. code:: programlisting

        case SELECTION_TIMEOUT:
            ccb_status = CAM_SEL_TIMEOUT;
            /* request the further code to freeze the queue */
            hcb->ccb->ccb_h.status |= CAM_DEV_QFRZN;
            lun_to_freeze = CAM_LUN_WILDCARD;
            break;
        case PARITY_ERROR:
            ccb_status = CAM_UNCOR_PARITY;
            break;
        case DATA_OVERRUN:
        case ODD_WIDE_TRANSFER:
            ccb_status = CAM_DATA_RUN_ERR;
            break;
        default:
            /* all other errors are handled in a generic way */
            ccb_status = CAM_REQ_CMP_ERR;
            /* request the further code to freeze the queue */
            hcb->ccb->ccb_h.status |= CAM_DEV_QFRZN;
            lun_to_freeze = CAM_LUN_WILDCARD;
            break;
        }

Then we check if the error was serious enough to freeze the input queue
until it gets proceeded and do so if it is:

.. code:: programlisting

        if(hcb->ccb->ccb_h.status & CAM_DEV_QFRZN) {
            /* freeze the queue */
            xpt_freeze_devq(ccb->ccb_h.path, /*count*/1);

            /* re-queue all commands for this target/LUN back to CAM */

            for(h = softc->first_queued_hcb; h != NULL; h = hh) {
                hh = h->next;

                if(targ == h->targ
                && (lun_to_freeze == CAM_LUN_WILDCARD || lun_to_freeze == h->lun) )
                    free_hcb_and_ccb_done(h, h->ccb, CAM_REQUEUE_REQ);
            }
        }
        free_hcb_and_ccb_done(hcb, hcb->ccb, ccb_status);
        schedule_next_hcb(softc);
        return;

This concludes the generic interrupt handling although specific
controllers may require some additions.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+----------------------------------+
| `Prev <scsi-async.html>`__?   | `Up <scsi.html>`__      | ?\ `Next <scsi-errors.html>`__   |
+-------------------------------+-------------------------+----------------------------------+
| 12.4.?Asynchronous Events?    | `Home <index.html>`__   | ?12.6.?Errors Summary            |
+-------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
