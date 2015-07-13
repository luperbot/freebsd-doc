======================
12.7.?Timeout Handling
======================

.. raw:: html

   <div class="navheader">

12.7.?Timeout Handling
`Prev <scsi-errors.html>`__?
Chapter?12.?Common Access Method SCSI Controllers
?\ `Next <usb.html>`__

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

12.7.?Timeout Handling
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the timeout for an HCB expires that request should be aborted, just
like with an XPT\_ABORT request. The only difference is that the
returned status of aborted request should be CAM\_CMD\_TIMEOUT instead
of CAM\_REQ\_ABORTED (that is why implementation of the abort better be
done as a function). But there is one more possible problem: what if the
abort request itself will get stuck? In this case the SCSI bus should be
reset, just like with an XPT\_RESET\_BUS request (and the idea about
implementing it as a function called from both places applies here too).
Also we should reset the whole SCSI bus if a device reset request got
stuck. So after all the timeout function would look like:

.. code:: programlisting

    static void
    xxx_timeout(void *arg)
    {
        struct xxx_hcb *hcb = (struct xxx_hcb *)arg;
        struct xxx_softc *softc;
        struct ccb_hdr *ccb_h;

        softc = hcb->softc;
        ccb_h = &hcb->ccb->ccb_h;

        if(hcb->flags & HCB_BEING_ABORTED
        || ccb_h->func_code == XPT_RESET_DEV) {
            xxx_reset_bus(softc);
        } else {
            xxx_abort_ccb(hcb->ccb, CAM_CMD_TIMEOUT);
        }
    }

When we abort a request all the other disconnected requests to the same
target/LUN get aborted too. So there appears a question, should we
return them with status CAM\_REQ\_ABORTED or CAM\_CMD\_TIMEOUT? The
current drivers use CAM\_CMD\_TIMEOUT. This seems logical because if one
request got timed out then probably something really bad is happening to
the device, so if they would not be disturbed they would time out by
themselves.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------+
| `Prev <scsi-errors.html>`__?   | `Up <scsi.html>`__      | ?\ `Next <usb.html>`__     |
+--------------------------------+-------------------------+----------------------------+
| 12.6.?Errors Summary?          | `Home <index.html>`__   | ?Chapter?13.?USB Devices   |
+--------------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
