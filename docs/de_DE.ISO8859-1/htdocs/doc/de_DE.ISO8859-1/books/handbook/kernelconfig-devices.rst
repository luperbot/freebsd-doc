==========================================================
9.3. Informationen ?ber die vorhandene Hardware beschaffen
==========================================================

.. raw:: html

   <div class="navheader">

9.3. Informationen ?ber die vorhandene Hardware beschaffen
`Zur?ck <kernelconfig-custom-kernel.html>`__?
Kapitel 9. Konfiguration des FreeBSD-Kernels
?\ `Weiter <kernelconfig-modules.html>`__

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

9.3. Informationen ?ber die vorhandene Hardware beschaffen
----------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie mit der Kernelkonfiguration beginnen, sollten Sie wissen, ?ber
welche Hardware Ihr System verf?gt. Verwenden Sie derzeit noch ein
anderes Betriebssystem, ist es meist sehr einfach, eine Liste der
installierten Hardware zu erzeugen. Verwenden Sie beispielsweise
Microsoft??Windows?, k?nnen Sie daf?r den Ger?temanager verwenden, den
Sie in der „Systemsteuerung“ finden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Einige Versionen von Microsoft??Windows? verf?gen ?ber ein System-Icon
auf dem Desktop, ?ber das Sie den Ger?temanager direkt aufrufen k?nnen.

.. raw:: html

   </div>

Haben Sie au?er FreeBSD kein weiteres Betriebssystem, m?ssen Sie diese
Informationen manuell zusammentragen. Eine M?glichkeit, an Informationen
?ber die vorhandene Hardware zu gelangen, ist der Einsatz von
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
in Kombination mit
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__. Die
meisten FreeBSD-Ger?tetreiber haben eine eigene Manualpage, die
Informationen ?ber die unterst?tzte Hardware enth?lt. W?hrend des
Systemstarts werden Informationen ?ber die vorhandene Hardware
ausgegeben. Die folgenden Zeilen zeigen beispielsweise an, dass der
``psm``-Treiber eine angeschlossene Maus gefunden hat:

.. code:: programlisting

    psm0: <PS/2 Mouse> irq 12 on atkbdc0
    psm0: [GIANT-LOCKED]
    psm0: [ITHREAD]
    psm0: model Generic PS/2 mouse, device ID 0

Dieser Treiber muss in Ihrer Kernelkonfigurationsdatei vorhanden sein
oder durch das Werkzeug
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
geladen werden.

Manchmal zeigt ``dmesg`` w?hrend des Systemstarts nur Systemmeldungen,
aber keine Informationen zur gefundenen Hardware an. In diesem Fall
k?nnen Sie diese Informationen durch das Studium der Datei
``/var/run/dmesg.boot`` herausfinden.

Eine weitere M?glichkeit bietet das Werkzeug
`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8>`__,
das ausf?hrliche Informationen bereitstellt. Dazu ein Beispiel:

.. code:: programlisting

    ath0@pci0:3:0:0:        class=0x020000 card=0x058a1014 chip=0x1014168c rev=0x01 hdr=0x00
        vendor     = 'Atheros Communications Inc.'
        device     = 'AR5212 Atheros AR5212 802.11abg wireless'
        class      = network
        subclass   = ethernet

Diese Zeilen, die Sie durch den Aufruf des Befehls ``pciconf -lv``
erhalten, zeigen, dass der Treiber ``ath`` eine drahtlose Ethernetkarte
gefunden hat. Durch Eingabe des Befehls ``man ath`` ?ffnet sich die
Manualpage
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__.

Rufen Sie
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__ mit
der Option ``-k`` auf, k?nnen Sie die Datenbank der Manualpages auch
durchsuchen. F?r das angegebene Beispiel w?rde dieser Befehl
beispielsweise so aussehen:

.. code:: screen

    # man -k Atheros

Dadurch erhalten Sie eine Liste aller Manualpages, die das angegebene
Suchkriterium enthalten:

.. code:: programlisting

    ath(4)                   - Atheros IEEE 802.11 wireless network driver
    ath_hal(4)               - Atheros Hardware Access Layer (HAL)

Mit diesen Informationen ausgestattet, sollte der Bau eines angepassten
Kernel keine allzugro?en Probleme mehr bereiten.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-------------------------------------+----------------------------------------------+
| `Zur?ck <kernelconfig-custom-kernel.html>`__?   | `Nach oben <kernelconfig.html>`__   | ?\ `Weiter <kernelconfig-modules.html>`__    |
+-------------------------------------------------+-------------------------------------+----------------------------------------------+
| 9.2. Wieso einen eigenen Kernel bauen??         | `Zum Anfang <index.html>`__         | ?9.4. Kerneltreiber, Subsysteme und Module   |
+-------------------------------------------------+-------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
