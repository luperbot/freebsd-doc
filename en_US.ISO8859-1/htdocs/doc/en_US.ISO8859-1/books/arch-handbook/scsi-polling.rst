=============
12.3.?Polling
=============

.. raw:: html

   <div class="navheader">

12.3.?Polling
`Prev <scsi-general.html>`__?
Chapter?12.?Common Access Method SCSI Controllers
?\ `Next <scsi-async.html>`__

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

12.3.?Polling
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------+---------------------------------+-----+
| ``static void       xxx_poll     (``   | struct cam\_sim \*sim\ ``)``;   | ?   |
+----------------------------------------+---------------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``       struct cam_sim *sim     ``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

The poll function is used to simulate the interrupts when the interrupt
subsystem is not functioning (for example, when the system has crashed
and is creating the system dump). The CAM subsystem sets the proper
interrupt level before calling the poll routine. So all it needs to do
is to call the interrupt routine (or the other way around, the poll
routine may be doing the real action and the interrupt routine would
just call the poll routine). Why bother about a separate function then?
Because of different calling conventions. The ``xxx_poll`` routine gets
the struct cam\_sim pointer as its argument when the PCI interrupt
routine by common convention gets pointer to the struct ``xxx_softc``
and the ISA interrupt routine gets just the device unit number. So the
poll routine would normally look as:

.. code:: programlisting

    static void
    xxx_poll(struct cam_sim *sim)
    {
        xxx_intr((struct xxx_softc *)cam_sim_softc(sim)); /* for PCI device */
    }

or

.. code:: programlisting

    static void
    xxx_poll(struct cam_sim *sim)
    {
        xxx_intr(cam_sim_unit(sim)); /* for ISA device */
    }

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+---------------------------------+
| `Prev <scsi-general.html>`__?   | `Up <scsi.html>`__      | ?\ `Next <scsi-async.html>`__   |
+---------------------------------+-------------------------+---------------------------------+
| 12.2.?General Architecture?     | `Home <index.html>`__   | ?12.4.?Asynchronous Events      |
+---------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
