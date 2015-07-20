========================
17.6. Modulkonfiguration
========================

.. raw:: html

   <div class="navheader">

17.6. Modulkonfiguration
`Zur?ck <mac-planning.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-seeotheruids.html>`__

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

17.6. Modulkonfiguration
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jedes Modul, das in der MAC enthalten ist, kann entweder direkt in den
Kernel eingef?gt werden oder als Kernelmodul in der Laufzeit des Systems
geladen werden. Empfohlen wird, den Modulnamen in der Datei
``/boot/loader.conf`` anzuf?gen, so dass das Modul am Anfang des
Bootvorgangs eingebunden wird.

Die folgenden Abschnitte werden verschiedene MAC Module und ihre
jeweiligen Vor- und Nachteile vorstellen. Au?erdem wird erkl?rt, wie sie
in bestimmte Umgebungen eingearbeitet werden k?nnen. Einige Module
unterst?tzen die Verwendung von ``Labels``, das hei?t Zugriffskontrolle
durch hinzuf?gen einer Kennzeichnung in der Art von „dieses ist erlaubt,
jenes aber nicht“. Eine Label-Konfigurationdatei kontrolliert unter
anderem, wie auf Dateien zugegriffen oder wie ?ber das Netzwerk
kommuniziert werden darf. Im vorangehenden Abschnitt wurde bereits
erl?utert, wie die Option ``multilabel`` auf Dateisysteme angewendet
wird, um eine Zugriffskontrolle auf einzelne Dateien oder ganze
Dateisysteme zu konfigurieren.

Eine ``single label`` Konfiguration erzwingt ein einzelnes Label f?r das
gesamte System. Daher wird die ``tunefs``-Option ``multilabel`` genannt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <mac-planning.html>`__?           | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-seeotheruids.html>`__   |
+-------------------------------------------+-------------------------------+-----------------------------------------+
| 17.5. Planung eines Sicherheitsmodells?   | `Zum Anfang <index.html>`__   | ?17.7. Das MAC Modul seeotheruids       |
+-------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
