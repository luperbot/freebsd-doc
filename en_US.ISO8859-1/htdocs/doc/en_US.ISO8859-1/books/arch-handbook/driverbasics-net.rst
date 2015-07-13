====================
9.5.?Network Drivers
====================

.. raw:: html

   <div class="navheader">

9.5.?Network Drivers
`Prev <driverbasics-block.html>`__?
Chapter?9.?Writing FreeBSD Device Drivers
?\ `Next <isa-driver.html>`__

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

9.5.?Network Drivers
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Drivers for network devices do not use device nodes in order to be
accessed. Their selection is based on other decisions made inside the
kernel and instead of calling open(), use of a network device is
generally introduced by using the system call socket(2).

For more information see ifnet(9), the source of the loopback device,
and Bill Paul's network drivers.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+------------------------------+-----------------------------------+
| `Prev <driverbasics-block.html>`__?   | `Up <driverbasics.html>`__   | ?\ `Next <isa-driver.html>`__     |
+---------------------------------------+------------------------------+-----------------------------------+
| 9.4.?Block Devices (Are Gone)?        | `Home <index.html>`__        | ?Chapter?10.?ISA Device Drivers   |
+---------------------------------------+------------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
