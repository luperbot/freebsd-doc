===============================
Chapter?31.?Advanced Networking
===============================

.. raw:: html

   <div class="navheader">

Chapter?31.?Advanced Networking
`Prev <firewalls-ipf.html>`__?
Part?IV.?Network Communication
?\ `Next <network-routing.html>`__

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

Chapter?31.?Advanced Networking
-------------------------------

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

`31.1.
Synopsis <advanced-networking.html#advanced-networking-synopsis>`__
`31.2. Gateways and Routes <network-routing.html>`__
`31.3. Wireless Networking <network-wireless.html>`__
`31.4. USB Tethering <network-usb-tethering.html>`__
`31.5. Bluetooth <network-bluetooth.html>`__
`31.6. Bridging <network-bridging.html>`__
`31.7. Link Aggregation and Failover <network-aggregation.html>`__
`31.8. Diskless Operation with PXE <network-diskless.html>`__
`31.9. IPv6 <network-ipv6.html>`__
`31.10. Common Address Redundancy Protocol (CARP) <carp.html>`__

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

31.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This chapter covers a number of advanced networking topics.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  The basics of gateways and routes.

-  How to set up USB tethering.

-  How to set up IEEE? 802.11 and Bluetooth? devices.

-  How to make FreeBSD act as a bridge.

-  How to set up network PXE booting.

-  How to set up IPv6 on a FreeBSD machine.

-  How to enable and utilize the features of the Common Address
   Redundancy Protocol (CARP) in FreeBSD.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand the basics of the ``/etc/rc`` scripts.

-  Be familiar with basic network terminology.

-  Know how to configure and install a new FreeBSD kernel (`Chapter?9,
   *Configuring the FreeBSD Kernel* <kernelconfig.html>`__).

-  Know how to install additional third-party software (`Chapter?5,
   *Installing Applications: Packages and Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------------+--------------------------------------+
| `Prev <firewalls-ipf.html>`__?   | `Up <network-communication.html>`__   | ?\ `Next <network-routing.html>`__   |
+----------------------------------+---------------------------------------+--------------------------------------+
| 30.5.?IPFILTER (IPF)?            | `Home <index.html>`__                 | ?31.2.?Gateways and Routes           |
+----------------------------------+---------------------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
