=====================================
Kapitel 11. Linux-Bin?rkompatibilit?t
=====================================

.. raw:: html

   <div class="navheader">

Kapitel 11. Linux-Bin?rkompatibilit?t
`Zur?ck <printing-troubleshooting.html>`__?
Teil?II.?Oft benutzte Funktionen
?\ `Weiter <linuxemu-lbc-install.html>`__

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

Kapitel 11. Linux-Bin?rkompatibilit?t
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Restrukturiert und teilweise aktualisiert von Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Brian N. Handy und Rich Murphey.

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

`11.1. ?bersicht <linuxemu.html#linuxemu-synopsis>`__
`11.2. Installation <linuxemu-lbc-install.html>`__
`11.3. Mathematica? installieren <linuxemu-mathematica.html>`__
`11.4. Maple™ installieren <linuxemu-maple.html>`__
`11.5. MATLAB? installieren <linuxemu-matlab.html>`__
`11.6. Oracle? installieren <linuxemu-oracle.html>`__
`11.7. Weiterf?hrende Themen <linuxemu-advanced.html>`__

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

11.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD bietet Bin?rkompatibilit?t zu verschiedenen anderen UNIX?
Betriebssystemen, darunter auch Linux. Nun k?nnten Sie sich fragen,
warum FreeBSD in der Lage sein muss, Linux-Bin?rprogramme auszuf?hren?
Die Antwort auf diese Frage ist sehr einfach. Viele Unternehmen und
Entwickler programmieren bzw. entwickeln nur f?r Linux, da es „das
Neueste und Beste“ in der Computerwelt ist. F?r uns FreeBSD-Anwender
hei?t dies, genau diese Unternehmen und Entwickler zu bitten,
FreeBSD-Versionen ihrer Programme herauszubringen. Das Problem dabei ist
nur, dass die meisten dieser Firmen trotzdem nicht erkennen, wie viele
zus?tzliche Anwender ihre Produkte benutzen w?rden, wenn es auch
FreeBSD-Versionen g?be, und daher weiterhin ausschlie?lich f?r Linux
entwickeln. Was also kann ein FreeBSD-Anwender tun? Genau an diesem
Punkt kommt die Linux- Bin?rkompatibilit?t ins Spiel.

Um es auf den Punkt zu bringen, genau diese Kompatibilit?t erlaubt es
FreeBSD-Anwendern, etwa 90 % aller Linux-Anwendungen ohne
Code-?nderungen zu verwenden. Dies schlie?t solche Anwendungen wie
StarOffice™, Open Office, die Linux-Versionen von Netscape?,
Adobe??Acrobat?, RealPlayer?, Oracle?, WordPerfect?, Doom, Quake und
viele andere ein. Es wird sogar berichtet, dass diese Linux-Anwendungen
in manchen F?llen unter FreeBSD eine bessere Leistung als unter Linux
aufweisen.

Allerdings gibt es nach wie vor einige Linux-spezifische
Betriebssystem-Eigenschaften, die unter FreeBSD nicht unterst?tzt
werden. Linux-Anwendungen, die i386™-spezifische Aufrufe (wie die
Aktivierung des virtuellen 8086-Modus) verwenden, funktionieren unter
FreeBSD leider nicht.

Nach dem Lesen dieses Kapitels werden Sie

.. raw:: html

   <div class="itemizedlist">

-  wissen, wie Sie die Linux-Bin?rkompatibilit?t installieren bzw.
   aktivieren.

-  Wissen, wie man zus?tzliche Linux-Systembibliotheken unter FreeBSD
   installiert.

-  Linux-Anwendungen unter FreeBSD installieren k?nnen.

-  Wissen, wie die Linux-Bin?rkompatibilit?t unter FreeBSD verwirklicht
   wurde.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  wissen, wie man Software Dritter installiert (`Kapitel?5,
   *Installieren von Anwendungen: Pakete und Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------------+---------------------------------------------+
| `Zur?ck <printing-troubleshooting.html>`__?   | `Nach oben <common-tasks.html>`__   | ?\ `Weiter <linuxemu-lbc-install.html>`__   |
+-----------------------------------------------+-------------------------------------+---------------------------------------------+
| 10.7. Problembehandlung?                      | `Zum Anfang <index.html>`__         | ?11.2. Installation                         |
+-----------------------------------------------+-------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
