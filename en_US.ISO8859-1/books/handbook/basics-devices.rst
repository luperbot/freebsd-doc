==============================
4.11.?Devices and Device Nodes
==============================

.. raw:: html

   <div class="navheader">

4.11.?Devices and Device Nodes
`Prev <editors.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <basics-more-information.html>`__

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

4.11.?Devices and Device Nodes
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A device is a term used mostly for hardware-related activities in a
system, including disks, printers, graphics cards, and keyboards. When
FreeBSD boots, the majority of the boot messages refer to devices being
detected. A copy of the boot messages are saved to
``/var/run/dmesg.boot``.

Each device has a device name and number. For example, ``ada0`` is the
first SATA hard drive, while ``kbd0`` represents the keyboard.

Most devices in a FreeBSD must be accessed through special files called
device nodes, which are located in ``/dev``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+----------------------------------------------+
| `Prev <editors.html>`__?   | `Up <basics.html>`__    | ?\ `Next <basics-more-information.html>`__   |
+----------------------------+-------------------------+----------------------------------------------+
| 4.10.?Text Editors?        | `Home <index.html>`__   | ?4.12.?Manual Pages                          |
+----------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
