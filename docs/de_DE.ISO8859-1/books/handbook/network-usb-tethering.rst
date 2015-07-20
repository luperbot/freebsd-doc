===================
33.4. USB Tethering
===================

.. raw:: html

   <div class="navheader">

33.4. USB Tethering
`Zur?ck <network-wireless.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-bluetooth.html>`__

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

33.4. USB Tethering
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Viele Mobiltelefone bieten die M?glichkeit, ihre Datenverbindung ?ber
USB (oft "Tethering" genannt) zu teilen. Diese Funktion verwendet das
RNDIS oder CDC-Protokoll.

Bevor Sie ein Ger?t anschlie?en, laden Sie den entsprechenden Treiber in
den Kernel:

.. code:: screen

    # kldload if_urndis
    # kldload cdce

Sobald das Ger?t angeschlossen ist, steht es Ihnen unter ``ue``\ *``0``*
wie ein normales Netzwerkger?t zur Verf?gung. Stellen Sie sicher, dass
die Option „USB Tethering“ auf dem Ger?t aktiviert ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------------------+------------------------------------------+
| `Zur?ck <network-wireless.html>`__?   | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-bluetooth.html>`__   |
+---------------------------------------+--------------------------------------------+------------------------------------------+
| 33.3. Drahtlose Netzwerke?            | `Zum Anfang <index.html>`__                | ?33.5. Bluetooth                         |
+---------------------------------------+--------------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
