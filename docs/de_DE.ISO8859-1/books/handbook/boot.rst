================================
Kapitel 13. FreeBSDs Bootvorgang
================================

.. raw:: html

   <div class="navheader">

Kapitel 13. FreeBSDs Bootvorgang
`Zur?ck <ACPI-debug.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <boot-introduction.html>`__

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

Kapitel 13. FreeBSDs Bootvorgang
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Hans-Christian Ebke.

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

`13.1. ?bersicht <boot.html#boot-synopsis>`__
`13.2. Das Problem des Bootens <boot-introduction.html>`__
`13.3. Boot-Manager und Boot-Phasen <boot-blocks.html>`__
`13.4. Kernel Interaktion w?hrend des
Bootprozesses <boot-kernel.html>`__
`13.5. Konfiguration von Ger?ten <device-hints.html>`__
`13.6. Init: Initialisierung der Prozess-Kontrolle <boot-init.html>`__
`13.7. Der Shutdown-Vorgang <boot-shutdown.html>`__

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

13.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Starten des Computers und das Laden des Betriebssystems wird im
Allgemeinen als „Bootstrap-Vorgang“ bezeichnet, oder einfach als
„Booten“. FreeBSDs Bootvorgang erm?glicht gro?e Flexibilit?t, was das
Anpassen dessen anbelangt, was passiert, wenn das System gestartet wird.
Es kann zwischen verschiedenen Betriebssystemen, die auf demselben
Computer installiert sind oder verschiedenen Versionen desselben
Betriebssystems oder installierten Kernels gew?hlt werden.

Dieses Kapitel zeigt die zur Verf?gung stehenden
Konfigurationsm?glichkeiten und wie man den Bootvorgang anpasst. Dies
schlie?t alles ein, bis der Kernel gestartet worden ist, der dann alle
Ger?te gefunden hat und
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
gestartet hat. Falls Sie sich nicht ganz sicher sind, wann dies
passiert: Es passiert, wenn die Farbe des Textes w?hrend des
Bootvorgangs von wei? zu Hellgrau wechselt.

Dieses Kapitel informiert ?ber folgende Punkte:

.. raw:: html

   <div class="itemizedlist">

-  Die Komponenten des FreeBSD-Bootvorgangs und deren Interaktion.

-  Die Optionen, mit denen Sie den FreeBSD-Bootvorgang steuern k?nnen.

-  Wie Ger?te mit
   `device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5>`__
   konfiguriert werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

nur x86:
~~~~~~~~

Dieses Kapitel erkl?rt den Bootvorgang von FreeBSD auf Intel X86
Plattformen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+----------------------------------------------+------------------------------------------+
| `Zur?ck <ACPI-debug.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <boot-introduction.html>`__   |
+---------------------------------+----------------------------------------------+------------------------------------------+
| 12.17. ACPI-Fehlersuche?        | `Zum Anfang <index.html>`__                  | ?13.2. Das Problem des Bootens           |
+---------------------------------+----------------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
