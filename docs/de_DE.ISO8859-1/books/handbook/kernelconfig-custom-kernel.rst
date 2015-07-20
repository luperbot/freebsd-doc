======================================
9.2. Wieso einen eigenen Kernel bauen?
======================================

.. raw:: html

   <div class="navheader">

9.2. Wieso einen eigenen Kernel bauen?
`Zur?ck <kernelconfig.html>`__?
Kapitel 9. Konfiguration des FreeBSD-Kernels
?\ `Weiter <kernelconfig-devices.html>`__

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

9.2. Wieso einen eigenen Kernel bauen?
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Traditionell besa? FreeBSD einen monolithischen Kernel. Das bedeutet,
dass der Kernel ein einziges gro?es Programm war, das eine bestimmte
Auswahl an Hardware unterst?tzte. Also musste man immer, wenn man das
Kernelverhalten ver?ndern wollte, zum Beispiel wenn man neue Hardware
hinzuf?gen wollte, einen neuen Kernel kompilieren, installieren und das
System neu starten.

Heutzutage vertritt FreeBSD immer mehr die Idee eines modularen Kernels,
bei dem bestimmte Funktionen, je nach Bedarf, als Module geladen werden
k?nnen. Ein bekanntes Beispiel daf?r sind die Module f?r die
PCMCIA-Karten in Laptops, die zum Starten nicht zwingend ben?tigt und
erst bei Bedarf geladen werden.

Trotzdem ist es noch immer n?tig, einige statische Kernelkonfigurationen
durchzuf?hren. In einigen F?llen ist die Funktion zu systemnah, um durch
ein Modul realisiert zu werden. In anderen F?llen hat eventuell noch
niemand ein ladbares Kernelmodul f?r diese Funktion geschrieben.

Das Erstellen eines angepa?ten Kernels ist eines der wichtigsten Rituale
f?r erfahrene BSD-Benutzer. Obwohl dieser Prozess recht viel Zeit in
Anspruch nimmt, bringt er doch viele Vorteile f?r Ihr FreeBSD System.
Der ``GENERIC``-Kernel muss eine Vielzahl unterschiedlicher Hardware
unterst?tzen, im Gegensatz dazu unterst?tzt ein angepasster Kernel nur
*Ihre* Hardware. Dies hat einige Vorteile:

.. raw:: html

   <div class="itemizedlist">

-  Schnellerer Bootvorgang. Da der Kernel nur nach der Hardware des
   Systems sucht, kann sich die Zeit f?r einen Systemstart erheblich
   verk?rzen.

-  Geringerer Speicherbedarf. Ein eigener Kernel ben?tigt in der Regel
   weniger Speicher als ein ``GENERIC``-Kernel durch das Entfernen von
   Funktionen und Ger?tetreibern. Das ist vorteilhaft, denn der Kernel
   verweilt immer im RAM und verhindert dadurch, dass dieser Speicher
   von Anwendungen genutzt wird. Insbesondere profitieren Systeme mit
   wenig RAM davon.

-  Zus?tzliche Hardwareunterst?tzung. Ein angepasster Kernel kann
   Unterst?tzung f?r Ger?te wie Soundkarten bieten, die im
   ``GENERIC``-Kernel nicht enthalten sind.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-------------------------------------+---------------------------------------------------------------+
| `Zur?ck <kernelconfig.html>`__?                 | `Nach oben <kernelconfig.html>`__   | ?\ `Weiter <kernelconfig-devices.html>`__                     |
+-------------------------------------------------+-------------------------------------+---------------------------------------------------------------+
| Kapitel 9. Konfiguration des FreeBSD-Kernels?   | `Zum Anfang <index.html>`__         | ?9.3. Informationen ?ber die vorhandene Hardware beschaffen   |
+-------------------------------------------------+-------------------------------------+---------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
