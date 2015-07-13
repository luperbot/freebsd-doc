=========================================
Chapter?9.?Writing FreeBSD Device Drivers
=========================================

.. raw:: html

   <div class="navheader">

Chapter?9.?Writing FreeBSD Device Drivers
`Prev <devicedrivers.html>`__?
Part?II.?Device Drivers
?\ `Next <driverbasics-kld.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?9.?Writing FreeBSD Device Drivers
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on intro(4) manual page by J?rg Wunsch.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`9.1. Introduction <driverbasics.html#driverbasics-intro>`__
`9.2. Dynamic Kernel Linker Facility - KLD <driverbasics-kld.html>`__
`9.3. Character Devices <driverbasics-char.html>`__
`9.4. Block Devices (Are Gone) <driverbasics-block.html>`__
`9.5. Network Drivers <driverbasics-net.html>`__

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

9.1.?Introduction
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This chapter provides a brief introduction to writing device drivers for
FreeBSD. A device in this context is a term used mostly for
hardware-related stuff that belongs to the system, like disks, printers,
or a graphics display with its keyboard. A device driver is the software
component of the operating system that controls a specific device. There
are also so-called pseudo-devices where a device driver emulates the
behavior of a device in software without any particular underlying
hardware. Device drivers can be compiled into the system statically or
loaded on demand through the dynamic kernel linker facility \`kld'.

Most devices in a UNIX?-like operating system are accessed through
device-nodes, sometimes also called special files. These files are
usually located under the directory ``/dev`` in the filesystem
hierarchy.

Device drivers can roughly be broken down into two categories; character
and network device drivers.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+----------------------------------------------+
| `Prev <devicedrivers.html>`__?   | `Up <devicedrivers.html>`__   | ?\ `Next <driverbasics-kld.html>`__          |
+----------------------------------+-------------------------------+----------------------------------------------+
| Part?II.?Device Drivers?         | `Home <index.html>`__         | ?9.2.?Dynamic Kernel Linker Facility - KLD   |
+----------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
