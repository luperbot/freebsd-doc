============================
3.5. Das bsdinstall-Werkzeug
============================

.. raw:: html

   <div class="navheader">

3.5. Das bsdinstall-Werkzeug
`Zur?ck <bsdinstall-start.html>`__?
Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
?\ `Weiter <bsdinstall-netinstall.html>`__

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

3.5. Das bsdinstall-Werkzeug
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

bsdinstall ist ein textbasiertes FreeBSD Installationsprogramm,
geschrieben von Nathan Whitehorn und im Jahr 2011 f?r FreeBSD?9.0
vorgestellt wurde.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Kris Moores pc-sysinstall ist in `PC-BSD <http://pcbsd.org>`__ enthalten
und kann ebenfalls verwendet werden, um `FreeBSD zu
installieren <http://wiki.pcbsd.org/index.php/Use_PC-BSD_Installer_to_Install_FreeBSD>`__.
Obwohl es manchmal mit bsdinstall verwechselt wird, sind die beiden
Programme nicht miteinander verwandt.

.. raw:: html

   </div>

Das bsdinstall Men?system wird durch die Pfeiltasten gesteuert,
**Enter**, **Tab**, **Space** und andere Tasten.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.5.1. Die Tastaturbelegung ausw?hlen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abh?ngig davon, welche Systemkonsole verwendet wird, fragt bsdinstall am
Anfang ab, ob eine nicht-Standard Tastaturbelegung festgelegt werden
soll.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.4. Tastaturbelegung festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Tastaturbelegung festlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn [?YES?] ausgew?hlt wird, wird der folgende
Tastaturauswahlbildschirm angezeigt. Andernfalls wird dieser
Auswahlbildschirm nicht gezeigt und eine Standardtastaturbelegung
genutzt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.5. Tastaturauswahlbildschirm

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Tastaturauswahlbildschirm|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie die Tastenbelegung, die Ihrer am System angeschlossenen
Tastatur am n?chsten kommt, indem Sie die Pfeiltasten Hoch/Runter
verwenden und anschliessend **Enter** dr?cken.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Durch dr?cken von **Esc** wird die Standardbelegung eingestellt. United
States of America ISO-8859-1 ist eine sichere Option, falls Sie sich
unsicher sind, welche Auswahl Sie treffen sollen.

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

3.5.2. Den Rechnernamen festlegen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als n?chstes fragt Sie bsdinstall nach dem Rechnernamen, der in dem neu
zu installierenden System verwendet werden soll.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.6. Festlegen des Rechnernamens

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Festlegen des Rechnernamens|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der eingegebene Rechnername sollte ein voll-qualifizierter Rechnername
sein, so wie z.B. ``machine3.example.com``

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

3.5.3. Auswahl der zu installierenden Komponenten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im n?chsten Schritt fragt Sie bsdinstall, die optionalen Komponenten f?r
die Installation auszuw?hlen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.7. Komponenten f?r die Installation ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Komponenten f?r die Installation ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Entscheidung, welche Komponenten auszuw?hlen sind, h?ngt
gr?sstenteils davon ab, f?r was das System k?nftig eingesetzt werden
soll und der zur Verf?gung stehende Plattenplatz. Der FreeBSD-Kernel und
die Systemprogramme (zusammengenommen auch als „Basissystem“ bezeichnet)
werden immer installiert.

Abh?ngig vom Typ der Installation, werden manche dieser Komponenten
nicht erscheinen.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Optionale Komponenten

.. raw:: html

   </div>

-  ``doc`` - Zus?tzliche Dokumentation, meistens eher von historischem
   Interesse. Dokumentation, wie Sie vom FreeBSD Dokumentationsprojekt
   bereitgestellt wird, kann zu einem sp?teren Zeitpunkt noch
   installiert werden.

-  ``games`` - Mehrere traditionelle BSD-Spiele, sowohl fortune, rot13
   und andere.

-  ``lib32`` - Kompatibilit?ts-Bibliotheken, um 32-bit Anwendungen auf
   der 64-bit Version von FreeBSD laufen zu lassen.

-  ``ports`` - Die FreeBSD Ports-Sammlung.

   Die Ports-Sammlung stellt eine einfache und praktische Art dar,
   Software zu installieren. Die Ports-Sammlung enth?lt nicht den
   n?tigen Quellcode, um die Software zu erstellen. Stattdessen handelt
   es sich um einen Sammlung von Dateien, die das herunterladen,
   erstellen und installieren von Drittanbietersoftware automatisiert.
   `Kapitel?5, *Installieren von Anwendungen: Pakete und
   Ports* <ports.html>`__ behandelt die Verwendung der Ports-Sammlung.

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Das Installationsprogramm pr?ft nicht, ob gen?gend Plattenplatz zur
   Verf?gung steht. W?hlen Sie diese Option nur, wenn Sie ?ber
   ausreichend Festplattenspeicher verf?gen. Seit FreeBSD?9.0, nimmt die
   Ports-Sammlung etwa 500?MB Plattenplatz ein. Sie k?nnen f?r neuere
   Versionen von FreeBSD einen gr?sseren Wert annehmen.

   .. raw:: html

      </div>

-  ``src`` - Quellcode f?r das System.

   FreeBSD wird mit allen Quellen f?r den Kernel und die Systemprogramme
   ausgeliefert. Obwohl dies f?r die meisten Anwendungen nicht ben?tigt
   wird, kann es doch f?r manche Software, die als Quellcode verbreitet
   wird (beispielsweise Ger?tetreiber oder Kernelmodule), oder um an
   FreeBSD selbst mitzuentwickeln, notwendig sein.

   Der komplette Quellcodebaum ben?tigt 1?GB Plattenplatz und um das
   gesamte Betriebssystem neu zu erstellen, werden zus?tzliche 5?GB
   Platz ben?tigt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-----------------------------------+----------------------------------------------+
| `Zur?ck <bsdinstall-start.html>`__?   | `Nach oben <bsdinstall.html>`__   | ?\ `Weiter <bsdinstall-netinstall.html>`__   |
+---------------------------------------+-----------------------------------+----------------------------------------------+
| 3.4. Die Installation starten?        | `Zum Anfang <index.html>`__       | ?3.6. Installation aus dem Netzwerk          |
+---------------------------------------+-----------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Tastaturbelegung festlegen| image:: bsdinstall/bsdinstall-keymap-select-default.png
.. |Tastaturauswahlbildschirm| image:: bsdinstall/bsdinstall-config-keymap.png
.. |Festlegen des Rechnernamens| image:: bsdinstall/bsdinstall-config-hostname.png
.. |Komponenten f?r die Installation ausw?hlen| image:: bsdinstall/bsdinstall-config-components.png
