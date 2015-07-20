========================
Kapitel 29. PPP und SLIP
========================

.. raw:: html

   <div class="navheader">

Kapitel 29. PPP und SLIP
`Zur?ck <serialconsole-setup.html>`__?
Teil?IV.?Netzwerke
?\ `Weiter <userppp.html>`__

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

Kapitel 29. PPP und SLIP
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Restrukturiert, neu organisiert und aktualisiert von Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Thomas Schwarzkopf.

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

`29.1. ?bersicht <ppp-and-slip.html#ppp-and-slip-synopsis>`__
`29.2. User-PPP <userppp.html>`__
`29.3. Kernel-PPP <ppp.html>`__
`29.4. Probleme bei PPP-Verbindungen <ppp-troubleshoot.html>`__
`29.5. PPP over Ethernet (PPPoE) <pppoe.html>`__
`29.6. PPP over ATM (PPPoA) <pppoa.html>`__
`29.7. SLIP <slip.html>`__

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

29.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter FreeBSD stehen verschiedene M?glichkeiten zur Verf?gung, um
Computer miteinander zu verbinden. Der Aufbau einer Netzwerk- oder
Internetverbindung mit Hilfe eines Einwahlmodems – f?r den eigenen oder
f?r andere Rechner – erfordert den Einsatz von PPP oder SLIP.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie wissen:

.. raw:: html

   <div class="itemizedlist">

-  Wie Sie User-PPP einrichten.

-  Wie Sie Kernel-PPP einrichten (nur f?r FreeBSD?7.X relevant).

-  Was zu tun ist, um PPPoE (PPP over Ethernet) einzurichten.

-  Wie Sie PPPoA (PPP over ATM) einrichten.

-  Wie Sie einen SLIP-Client und -Server einrichten und konfigurieren
   ((nur f?r FreeBSD?7.X relevant)

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  mit den grundlegenden Begriffen der Netzwerktechnik vertraut sein.

-  die Grundlagen und den Zweck einer Einwahlverbindung sowie PPP
   und/oder SLIP kennen.

.. raw:: html

   </div>

Sie fragen sich vielleicht, worin denn der Hauptunterschied zwischen
User-PPP und Kernel-PPP liegt. Die Antwort ist einfach: User-PPP
verarbeitet die ein- und ausgehenden Daten im Userland, statt im Kernel.
Dies ist zwar aufw?ndig, im Hinblick auf die Daten, die dadurch zwischen
Kernel und Userland hin und her kopiert werden m?ssen, doch es
erm?glicht auch eine PPP-Implementierung mit weitaus mehr Funktionen.
User-PPP verwendet das Ger?t ``tun``, um mit anderen Rechnern zu
kommunizieren, w?hrend Kernel-PPP hierf?r das Ger?t ``ppp`` benutzt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

In diesem Kapitel wird durchg?ngig vom Programm ppp gesprochen, wenn
damit User-PPP gemeint ist. Ausnahmen werden gemacht, wenn eine
Unterscheidung gegen?ber anderer PPP-Software, wie pppd (nur unter
FreeBSD?7.X), notwendig wird. Soweit nichts anderes angegeben ist,
sollten alle Befehle, die in diesem Kapitel erkl?rt werden, als ``root``
ausgef?hrt werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+----------------------------------------------+--------------------------------+
| `Zur?ck <serialconsole-setup.html>`__?    | `Nach oben <network-communication.html>`__   | ?\ `Weiter <userppp.html>`__   |
+-------------------------------------------+----------------------------------------------+--------------------------------+
| 28.6. Einrichten der seriellen Konsole?   | `Zum Anfang <index.html>`__                  | ?29.2. User-PPP                |
+-------------------------------------------+----------------------------------------------+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
