=========================================
Kapitel 33. Weiterf?hrende Netzwerkthemen
=========================================

.. raw:: html

   <div class="navheader">

Kapitel 33. Weiterf?hrende Netzwerkthemen
`Zur?ck <firewalls-ipfw.html>`__?
Teil?IV.?Netzwerke
?\ `Weiter <network-routing.html>`__

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

Kapitel 33. Weiterf?hrende Netzwerkthemen
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Johann Kois.

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

Inhaltsverzeichnis

.. raw:: html

   </div>

`33.1.
?bersicht <advanced-networking.html#advanced-networking-synopsis>`__
`33.2. Gateways und Routen <network-routing.html>`__
`33.3. Drahtlose Netzwerke <network-wireless.html>`__
`33.4. USB Tethering <network-usb-tethering.html>`__
`33.5. Bluetooth <network-bluetooth.html>`__
`33.6. LAN-Kopplung mit einer Bridge <network-bridging.html>`__
`33.7. Link-Aggregation und Failover <network-aggregation.html>`__
`33.8. Plattenloser Betrieb mit PXE <network-diskless.html>`__
`33.9. ISDN – dienstintegrierendes digitales
Netzwerk <network-isdn.html>`__
`33.10. IPv6 – Internet Protocol Version 6 <network-ipv6.html>`__
`33.11. CARP - Common Address Redundancy Protocol <carp.html>`__

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

33.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel beschreibt verschiedene weiterf?hrende Netzwerkthemen.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie

.. raw:: html

   <div class="itemizedlist">

-  Die Grundlagen von Gateways und Routen kennen.

-  Wissen, wie man USB Tethering einrichtet.

-  Bluetooth?- sowie drahtlose, der Norm IEEE??802.11 entsprechende,
   Ger?te mit FreeBSD verwenden k?nnen.

-  Eine Bridge unter FreeBSD einrichten k?nnen.

-  Wissen, wie man mithilfe von PXE ?ber ein Netzwerk bootet.

-  IPv6 auf einem FreeBSD-Rechner einrichten k?nnen.

-  CARP, das Common Address Redundancy Protocol, unter FreeBSD einsetzen
   k?nnen.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  Die Grundlagen der ``/etc/rc``-Skripte verstanden haben.

-  Mit der grundlegenden Netzwerkterminologie vertraut sein.

-  Einen neuen FreeBSD-Kernel konfigurieren und installieren k?nnen
   (`Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__).

-  Wissen, wie man zus?tzliche Softwarepakete von Drittherstellern
   installiert (`Kapitel?5, *Installieren von Anwendungen: Pakete und
   Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------------------+----------------------------------------+
| `Zur?ck <firewalls-ipfw.html>`__?   | `Nach oben <network-communication.html>`__   | ?\ `Weiter <network-routing.html>`__   |
+-------------------------------------+----------------------------------------------+----------------------------------------+
| 32.6. IPFW?                         | `Zum Anfang <index.html>`__                  | ?33.2. Gateways und Routen             |
+-------------------------------------+----------------------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
