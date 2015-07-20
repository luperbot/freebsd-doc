=========================================
9.4. Kerneltreiber, Subsysteme und Module
=========================================

.. raw:: html

   <div class="navheader">

9.4. Kerneltreiber, Subsysteme und Module
`Zur?ck <kernelconfig-devices.html>`__?
Kapitel 9. Konfiguration des FreeBSD-Kernels
?\ `Weiter <kernelconfig-building.html>`__

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

9.4. Kerneltreiber, Subsysteme und Module
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie einen angepassten Kernel erstellen, ?berlegen Sie sich bitte,
warum Sie dies tun wollen. Wenn Sie lediglich eine bestimmte
Hardwareunterst?tzung ben?tigen, existiert diese vielleicht schon als
Kernelmodul.

Kernelmodule existieren im Verzeichnis ``/boot/kernel`` und k?nnen
dynamisch in den laufenden Kernel ?ber
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
geladen werden. Die meisten, wenn nicht sogar alle, Kerneltreiber
besitzen ein spezifisches Modul und eine Manualpage. Beispielsweise
erw?hnte der letzte Abschnitt den drahtlosen Ethernettreiber ``ath``.
Dieses Ger?t hat die folgende Information in seiner Manualpage:

.. code:: programlisting

    Alternatively, to load the driver as a module at boot time, place the
    following line in loader.conf(5):

        if_ath_load="YES"

Wie dort angegeben, wird das Modul durch die Zeile ``if_ath_load="YES"``
in der Datei ``/boot/loader.conf`` dynamisch beim Systemstart geladen.

Allerdings gibt es in manchen F?llen kein dazugeh?riges Modul. Das gilt
insbesondere f?r bestimmte Teilsysteme und sehr wichtige Treiber.
Beispielsweise ist das Fast File System (FFS) eine notwendige
Kerneloption, genauso wie die Netzwerkunterst?tzung (INET). Die einzige
M?glichkeit, herauszufinden, ob ein Treiber ben?tigt ist, ist die
?berpr?fung des jeweiligen Moduls.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Es ist erstaunlich einfach, einen defekten Kernel zu erhalten
(beispielsweise durch das Entfernen der eingebauten Unterst?tzung f?r
ein Ger?t oder einer Kerneloption). Wenn beispielsweise der
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4>`__-Treiber
aus der Kernelkonfigurationsdatei entfernt wird, kann ein System, das
den ATA-Festplattentreiber ben?tigt, nicht mehr starten, ohne dass Sie
das entsprechende Kernelmodul durch einen Eintrag in ``loader.conf``
aufnehmen. Wenn Sie nicht sicher sind, wie Sie vorgehen sollen,
?berpr?fen Sie zuerst das Modul. Im Zweifelsfall belassen Sie die
Unterst?tzung f?r ein bestimmtes Ger?t besser im Kernel.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------+-------------------------------------+--------------------------------------------------------------+
| `Zur?ck <kernelconfig-devices.html>`__?                       | `Nach oben <kernelconfig.html>`__   | ?\ `Weiter <kernelconfig-building.html>`__                   |
+---------------------------------------------------------------+-------------------------------------+--------------------------------------------------------------+
| 9.3. Informationen ?ber die vorhandene Hardware beschaffen?   | `Zum Anfang <index.html>`__         | ?9.5. Erstellen und Installation eines angepassten Kernels   |
+---------------------------------------------------------------+-------------------------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
