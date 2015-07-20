================
10.2. Einf?hrung
================

.. raw:: html

   <div class="navheader">

10.2. Einf?hrung
`Zur?ck <printing.html>`__?
Kapitel 10. Drucken
?\ `Weiter <printing-intro-setup.html>`__

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

10.2. Einf?hrung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen Drucker mit FreeBSD zu benutzen, k?nnen Sie das Berkeley Line
Printer Spooling System, das auch als LPD-Drucksystem oder nur als LPD
bekannt ist, verwenden. Dieses System zur Verwaltung von Druckauftr?gen
ist das Standardsystem in FreeBSD. Dieses Kapitel f?hrt Sie in LPD und
dessen Konfiguration ein.

Wenn Sie bereits mit LPD oder einem anderen Drucksystem vertraut sind,
k?nnen Sie direkt im Abschnitt `Einfache
Drucker-Konfiguration <printing-intro-setup.html>`__ weiterlesen.

LPD steuert alle Aspekte rund um die Drucker, die an den Computer
angeschlossen sind. Es ist verantwortlich f?r:

.. raw:: html

   <div class="itemizedlist">

-  Die Zugriffskontrolle f?r direkt und ?ber das Netzwerk angeschlossene
   Drucker.

-  Die Entgegennahme von Dateien, die gedruckt werden sollen; eine so an
   das Drucksystem ?bergebene Datei wird als *Druckauftrag* bezeichnet.

-  Den gleichzeitigen Zugriff von mehreren Benutzern auf einen Drucker.
   Alle Druckauftr?ge werden in einer *Druckerwarteschlange* gesammelt,
   und nacheinander abgearbeitet.

-  Den Druck von *Deckbl?ttern* (auch als *Banner-* oder *Burst-*Seiten
   bezeichnet), damit Benutzer ihre Druckauftr?ge schnell innerhalb
   eines Stapels von ausgedruckten Dokumenten finden k?nnen.

-  Das Einstellen der korrekten Kommunikations-Parameter f?r Drucker,
   die seriell angeschlossen sind.

-  Das Senden von Druckauftr?gen an ein LPD-System auf einem anderen
   Computer.

-  Das Ausf?hren von speziellen Filtern, um Druckauftr?ge in die
   unterschiedlichen Seitenbeschreibungssprachen umzusetzen oder an die
   F?higkeiten eines Druckers anzupassen.

-  Das Erfassen von Verrechnungsdaten f?r Druckauftr?ge.

.. raw:: html

   </div>

Sie k?nnen LPD alle diese Funktionen, oder auch nur einen Teil davon,
ausf?hren lassen, indem Sie die Konfigurationsdatei (``/etc/printcap``)
anpassen, und indem Sie spezielle Filterprogramme bereitstellen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.2.1. Vorteile des Drucksystems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie der einzige Benutzer sind, der mit Ihrem Computer arbeitet,
fragen Sie sich vielleicht, warum Sie die Konfigurationsarbeit f?r das
Drucksystem auf sich nehmen sollten, wenn Sie Deckbl?tter,
Abrechnungsdaten oder Zugriffskontrolle nicht ben?tigen. Obwohl Sie
direkt auf den Drucker zugreifen k?nnen, bietet LPD eine Reihe von
Vorteilen:

.. raw:: html

   <div class="itemizedlist">

-  LPD druckt im Hintergrund; Sie m?ssen nicht erst darauf warten, dass
   Ihr Druckauftrag an den Drucker ?bermittelt worden ist.

-  LPD kann Druckauftr?ge mit Kopf- oder Fu?zeilen versehen, oder ein
   spezielles Dateiformat, wie DVI von TeX, automatisch in ein f?r den
   Drucker verst?ndliches Format umwandeln; Sie m?ssen diese Schritte
   nicht manuell ausf?hren.

-  Viele freie und kommerzielle Programme, mit denen Sie drucken k?nnen,
   erwarten, mithilfe des LPD-Drucksystems zu drucken. Wenn Sie das
   Drucksystem konfiguriert haben, k?nnen Sie einfacher mit neuer oder
   auch vorhandener Software drucken.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+---------------------------------+---------------------------------------------+
| `Zur?ck <printing.html>`__?   | `Nach oben <printing.html>`__   | ?\ `Weiter <printing-intro-setup.html>`__   |
+-------------------------------+---------------------------------+---------------------------------------------+
| Kapitel 10. Drucken?          | `Zum Anfang <index.html>`__     | ?10.3. Grund-Konfiguration                  |
+-------------------------------+---------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
