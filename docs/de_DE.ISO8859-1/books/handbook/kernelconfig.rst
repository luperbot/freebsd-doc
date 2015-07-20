============================================
Kapitel 9. Konfiguration des FreeBSD-Kernels
============================================

.. raw:: html

   <div class="navheader">

Kapitel 9. Konfiguration des FreeBSD-Kernels
`Zur?ck <scanners.html>`__?
Teil?II.?Oft benutzte Funktionen
?\ `Weiter <kernelconfig-custom-kernel.html>`__

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

Kapitel 9. Konfiguration des FreeBSD-Kernels
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Erweitert und neu strukturiert von Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Urspr?nglich ver?ffentlicht von Jake Hamby.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Robert Altschaffel.

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

`9.1. ?bersicht <kernelconfig.html#kernelconfig-synopsis>`__
`9.2. Wieso einen eigenen Kernel
bauen? <kernelconfig-custom-kernel.html>`__
`9.3. Informationen ?ber die vorhandene Hardware
beschaffen <kernelconfig-devices.html>`__
`9.4. Kerneltreiber, Subsysteme und
Module <kernelconfig-modules.html>`__
`9.5. Erstellen und Installation eines angepassten
Kernels <kernelconfig-building.html>`__
`9.6. Die Kernelkonfigurationsdatei <kernelconfig-config.html>`__
`9.7. Wenn etwas schiefgeht <kernelconfig-trouble.html>`__

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

9.1. ?bersicht
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Kernel ist das Herz des FreeBSD Betriebssystems. Er ist
verantwortlich f?r die Speicherverwaltung, das Durchsetzen von
Sicherheitsdirektiven, Netzwerkf?higkeit, Festplattenzugriffen und
vieles mehr. Obwohl FreeBSD es immer mehr erm?glicht, dynamisch
konfiguriert zu werden, ist es ab und an notwendig, den Kernel neu zu
konfigurieren und zu kompilieren.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie Folgendes wissen:

.. raw:: html

   <div class="itemizedlist">

-  Wieso Sie Ihren Kernel neu konfigurieren sollten.

-  Wie Sie eine Kernelkonfigurationsdatei erstellen oder ver?ndern.

-  Wie Sie mit der Konfigurationsdatei einen neuen Kernel kompilieren.

-  Wie Sie den neuen Kernel installieren.

-  Was zu tun ist, falls etwas schiefgeht.

.. raw:: html

   </div>

Alle Kommandos, aus den Beispielen dieses Kapitels, m?ssen mit
``root``-Rechten ausgef?hrt werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------------+---------------------------------------------------+
| `Zur?ck <scanners.html>`__?   | `Nach oben <common-tasks.html>`__   | ?\ `Weiter <kernelconfig-custom-kernel.html>`__   |
+-------------------------------+-------------------------------------+---------------------------------------------------+
| 8.7. Scanner?                 | `Zum Anfang <index.html>`__         | ?9.2. Wieso einen eigenen Kernel bauen?           |
+-------------------------------+-------------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
