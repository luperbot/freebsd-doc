=========================
10.11.?xxx\_isa\_shutdown
=========================

.. raw:: html

   <div class="navheader">

10.11.?xxx\_isa\_shutdown
`Prev <isa-driver-detach.html>`__?
Chapter?10.?ISA Device Drivers
?\ `Next <isa-driver-intr.html>`__

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

10.11.?xxx\_isa\_shutdown
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This routine is called when the system is about to be shut down. It is
expected to bring the hardware to some consistent state. For most of the
ISA devices no special action is required, so the function is not really
necessary because the device will be re-initialized on reboot anyway.
But some devices have to be shut down with a special procedure, to make
sure that they will be properly detected after soft reboot (this is
especially true for many devices with proprietary identification
protocols). In any case disabling DMA and interrupts in the device
registers and stopping any ongoing transfers is a good idea. The exact
action depends on the hardware, so we do not consider it here in any
detail.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------+--------------------------------------+
| `Prev <isa-driver-detach.html>`__?   | `Up <isa-driver.html>`__   | ?\ `Next <isa-driver-intr.html>`__   |
+--------------------------------------+----------------------------+--------------------------------------+
| 10.10.?xxx\_isa\_detach?             | `Home <index.html>`__      | ?10.12.?xxx\_intr                    |
+--------------------------------------+----------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
