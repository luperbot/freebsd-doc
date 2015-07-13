====================
12.6.?Errors Summary
====================

.. raw:: html

   <div class="navheader">

12.6.?Errors Summary
`Prev <scsi-interrupts.html>`__?
Chapter?12.?Common Access Method SCSI Controllers
?\ `Next <scsi-timeout.html>`__

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

12.6.?Errors Summary
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When executing an I/O request many things may go wrong. The reason of
error can be reported in the CCB status with great detail. Examples of
use are spread throughout this document. For completeness here is the
summary of recommended responses for the typical error conditions:

.. raw:: html

   <div class="itemizedlist">

-  *CAM\_RESRC\_UNAVAIL* - some resource is temporarily unavailable and
   the SIM driver cannot generate an event when it will become
   available. An example of this resource would be some intra-controller
   hardware resource for which the controller does not generate an
   interrupt when it becomes available.

-  *CAM\_UNCOR\_PARITY* - unrecovered parity error occurred

-  *CAM\_DATA\_RUN\_ERR* - data overrun or unexpected data phase (going
   in other direction than specified in CAM\_DIR\_MASK) or odd transfer
   length for wide transfer

-  *CAM\_SEL\_TIMEOUT* - selection timeout occurred (target does not
   respond)

-  *CAM\_CMD\_TIMEOUT* - command timeout occurred (the timeout function
   ran)

-  *CAM\_SCSI\_STATUS\_ERROR* - the device returned error

-  *CAM\_AUTOSENSE\_FAIL* - the device returned error and the REQUEST
   SENSE COMMAND failed

-  *CAM\_MSG\_REJECT\_REC* - MESSAGE REJECT message was received

-  *CAM\_SCSI\_BUS\_RESET* - received SCSI bus reset

-  *CAM\_REQ\_CMP\_ERR* - “impossible” SCSI phase occurred or something
   else as weird or just a generic error if further detail is not
   available

-  *CAM\_UNEXP\_BUSFREE* - unexpected disconnect occurred

-  *CAM\_BDR\_SENT* - BUS DEVICE RESET message was sent to the target

-  *CAM\_UNREC\_HBA\_ERROR* - unrecoverable Host Bus Adapter Error

-  *CAM\_REQ\_TOO\_BIG* - the request was too large for this controller

-  *CAM\_REQUEUE\_REQ* - this request should be re-queued to preserve
   transaction ordering. This typically occurs when the SIM recognizes
   an error that should freeze the queue and must place other queued
   requests for the target at the sim level back into the XPT queue.
   Typical cases of such errors are selection timeouts, command timeouts
   and other like conditions. In such cases the troublesome command
   returns the status indicating the error, the and the other commands
   which have not be sent to the bus yet get re-queued.

-  *CAM\_LUN\_INVALID* - the LUN ID in the request is not supported by
   the SCSI controller

-  *CAM\_TID\_INVALID* - the target ID in the request is not supported
   by the SCSI controller

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+-----------------------------------+
| `Prev <scsi-interrupts.html>`__?   | `Up <scsi.html>`__      | ?\ `Next <scsi-timeout.html>`__   |
+------------------------------------+-------------------------+-----------------------------------+
| 12.5.?Interrupts?                  | `Home <index.html>`__   | ?12.7.?Timeout Handling           |
+------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
