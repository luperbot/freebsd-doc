===========================
3.2. Hardware-Anforderungen
===========================

.. raw:: html

   <div class="navheader">

3.2. Hardware-Anforderungen
`Zur?ck <bsdinstall.html>`__?
Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
?\ `Weiter <bsdinstall-pre.html>`__

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

3.2. Hardware-Anforderungen
---------------------------

.. raw:: html

   </div>

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

3.2.1. Minimalkonfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Minimalkonfiguration zur Installation von FreeBSD variiert mit der
Version von FreeBSD und der Hardwarearchitektur.

Eine Zusammenfassung dieser Informationen wird in den folgenden
Abschnitten gegeben. Abh?ngig von der Installationsmethode, die Sie
verwenden, um FreeBSD zu installieren, werden Sie unter Umst?nden ein
unterst?tztes CD-ROM-Laufwerk ben?tigen und in manchen F?llen eine
Netzwerkkarte. Dies wird im Abschnitt `Abschnitt?3.3.5, „Die
Installationsmedien
beschaffen“ <bsdinstall-pre.html#bsdinstall-installation-media>`__
genauer betrachtet.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.1. FreeBSD/i386
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD/i386 ben?tigt einen 486er oder einen schnelleren Prozessor und
mindestens 64?MB RAM. Es sollte mindestens 1.1?GB freier
Festplattenspeicher f?r die Installation zur Verf?gung stehen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Auf alten Rechnern hat die Aufr?stung von RAM und dem Festplattenplatz
normalerweise einen h?heren geschwindigkeitssteigernden Effekt als einen
schnelleren Prozessor einzubauen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.2. FreeBSD/amd64
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei Klassen von Prozessoren, die in der Lage sind, auf
FreeBSD/amd64 zu laufen. Die erste Klasse sind AMD64-Prozessoren, was
sowohl AMD?Athlon™64, AMD?Athlon™64-FX, AMD?Opteron™ oder bessere
Prozessoren beinhaltet.

Die zweite Klasse von Prozessoren, die FreeBSD/amd64 benutzen kann,
besteht aus der Intel??EM64T-Architektur. Beispiele dieser Prozessoren
beinhalten die Intel??Core™?2 Duo, Quad, Extreme Prozessorfamilien, die
Intel??Xeon™ 3000, 5000, und 7000 Reihe von Prozessoren, sowie die
Intel??Core™ i3, i5 and i7 Prozessoren.

Sollten Sie einen Rechner basierend auf der nVidia nForce3 Pro-150
besitzen, *m?ssen* Sie im BIOS das IO APIC deaktivieren. Falls Sie keine
solche Option zum deaktivieren besitzen, werden Sie wahrscheinlich ACPI
deaktivieren m?ssen. Der Pro-150 Chipsatz enth?lt Fehler, f?r die wir
noch keine Abhilfe gefunden haben.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.3. FreeBSD/powerpc Apple? Macintosh?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle neuen Apple? Macintosh? Systeme mit eingebautem USB werden
unterst?tzt. SMP wird auf Maschinen mit mehreren CPUs unterst?tzt.

Ein 32-bit Kernel kann nur die ersten 2?GB des Hauptspeichers verwenden.
FireWire? wird auf den blauen und weissen PowerMac G3s nicht
unterst?tzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.4. FreeBSD/sparc64
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Systeme, die von FreeBSD/sparc64 unterst?tzt werden, sind auf der
`FreeBSD/sparc64 <http://www.freebsd.org/platforms/sparc.html>`__-Projektseite
aufgelistet.

Eine dedizierte Platte wird f?r FreeBSD/sparc64 ben?tigt. Es ist nicht
m?glich, eine Platte mit einem anderen Betriebssystem zur gleichen Zeit
zu teilen.

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

3.2.2. Unterst?tzte Hardware
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hardwarearchitekturen und von FreeBSD unterst?tzte Ger?te werden in der
Datei mit Hardware Notes aufgelistet. Normalerweise heisst diese Datei
``HARDWARE.TXT`` und befindet sich im Wurzelverzeichnis des
Ver?ffentlichungsmediums. Kopien dieser unterst?tzten Hardwareliste ist
ebenfalls auf der Seite `Release
Information <http://www.FreeBSD.org/releases/index.html>`__ der FreeBSD
Webseite abrufbar.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------+-----------------------------------+---------------------------------------+
| `Zur?ck <bsdinstall.html>`__?                              | `Nach oben <bsdinstall.html>`__   | ?\ `Weiter <bsdinstall-pre.html>`__   |
+------------------------------------------------------------+-----------------------------------+---------------------------------------+
| Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren?   | `Zum Anfang <index.html>`__       | ?3.3. Vor der Installation            |
+------------------------------------------------------------+-----------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
