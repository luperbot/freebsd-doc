==================
Chapter?14.?Newbus
==================

.. raw:: html

   <div class="navheader">

Chapter?14.?Newbus
`Prev <usb-protocol.html>`__?
Part?II.?Device Drivers
?\ `Next <newbus-overview.html>`__

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

Chapter?14.?Newbus
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Jeroen Ruigrok van der Werven (asmodai) and Hiten Pandya.

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

`14.1. Device Drivers <newbus.html#newbus-devdrivers>`__
`14.2. Overview of Newbus <newbus-overview.html>`__
`14.3. Newbus API <newbus-api.html>`__

.. raw:: html

   </div>

*Special thanks to Matthew N. Dodd, Warner Losh, Bill Paul, Doug Rabson,
Mike Smith, Peter Wemm and Scott Long*.

This chapter explains the Newbus device framework in detail.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.1.?Device Drivers
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.1.1.?Purpose of a Device Driver
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A device driver is a software component which provides the interface
between the kernel's generic view of a peripheral (e.g., disk, network
adapter) and the actual implementation of the peripheral. The *device
driver interface (DDI)* is the defined interface between the kernel and
the device driver component.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.1.2.?Types of Device Drivers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There used to be days in UNIX?, and thus FreeBSD, in which there were
four types of devices defined:

.. raw:: html

   <div class="itemizedlist">

-  block device drivers

-  character device drivers

-  network device drivers

-  pseudo-device drivers

.. raw:: html

   </div>

*Block devices* performed in a way that used fixed size blocks [of
data]. This type of driver depended on the so-called *buffer cache*,
which had cached accessed blocks of data in a dedicated part of memory.
Often this buffer cache was based on write-behind, which meant that when
data was modified in memory it got synced to disk whenever the system
did its periodical disk flushing, thus optimizing writes.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.1.3.?Character Devices
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

However, in the versions of FreeBSD 4.0 and onward the distinction
between block and character devices became non-existent.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------+--------------------------------------+
| `Prev <usb-protocol.html>`__?             | `Up <devicedrivers.html>`__   | ?\ `Next <newbus-overview.html>`__   |
+-------------------------------------------+-------------------------------+--------------------------------------+
| 13.5.?USB Drivers Protocol Information?   | `Home <index.html>`__         | ?14.2.?Overview of Newbus            |
+-------------------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
