===================
31.4.?USB Tethering
===================

.. raw:: html

   <div class="navheader">

31.4.?USB Tethering
`Prev <network-wireless.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <network-bluetooth.html>`__

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

31.4.?USB Tethering
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many cellphones provide the option to share their data connection over
USB (often called "tethering"). This feature uses either the RNDIS, CDC
or a custom Apple? iPhone?/iPad? protocol.

.. raw:: html

   <div class="itemizedlist">

-  Android™ devices generally use the
   `urndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urndis&sektion=4>`__
   driver.

-  Apple? devices use the
   `ipheth(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipheth&sektion=4>`__
   driver.

-  Older devices will often use the
   `cdce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cdce&sektion=4>`__
   driver.

.. raw:: html

   </div>

Before attaching a device, load the appropriate driver into the kernel:

.. code:: screen

    # kldload if_urndis
    # kldload if_cdce
    # kldload if_ipheth

Once the device is attached ``ue``\ *``0``* will be available for use
like a normal network device. Be sure that the “USB tethering” option is
enabled on the device.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------------+----------------------------------------+
| `Prev <network-wireless.html>`__?   | `Up <advanced-networking.html>`__   | ?\ `Next <network-bluetooth.html>`__   |
+-------------------------------------+-------------------------------------+----------------------------------------+
| 31.3.?Wireless Networking?          | `Home <index.html>`__               | ?31.5.?Bluetooth                       |
+-------------------------------------+-------------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
