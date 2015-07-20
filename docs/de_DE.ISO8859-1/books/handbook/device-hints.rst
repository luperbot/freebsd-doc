===============================
13.5. Konfiguration von Ger?ten
===============================

.. raw:: html

   <div class="navheader">

13.5. Konfiguration von Ger?ten
`Zur?ck <boot-kernel.html>`__?
Kapitel 13. FreeBSDs Bootvorgang
?\ `Weiter <boot-init.html>`__

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

13.5. Konfiguration von Ger?ten
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Boot-Loader liest w?hrend des Systemstarts die Datei
`device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5>`__,
die Variablen, auch „device hints“ genannt, zur Konfiguration von
Ger?ten enth?lt.

Die Variablen k?nnen auch mit Kommandos in der `Phase?3 des
Boot-Loaders <boot-blocks.html#boot-loader>`__ bearbeitet werden. Neue
Variablen werden mit ``set`` gesetzt, ``unset`` l?scht schon definierte
Variablen und ``show`` zeigt Variablen an. Variablen aus
``/boot/device.hints`` k?nnen zu diesem Zeitpunkt ?berschrieben werden.
Die hier durchgef?hrten ?nderungen sind nicht permanent und beim
n?chsten Systemstart nicht mehr g?ltig.

Nach dem Systemstart k?nnen alle Variablen mit
`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1>`__
angezeigt werden.

Pro Zeile enth?lt ``/boot/device.hints`` eine Variable. Kommentare
werden, wie ?blich, durch ``#`` eingeleitet. Die verwendete Syntax
lautet:

.. code:: screen

    hint.driver.unit.keyword="value"

Der Boot-Loader verwendet die nachstehende Syntax:

.. code:: screen

    set hint.driver.unit.keyword=value

Der Ger?tetreiber wird mit *``driver``*, die Nummer des Ger?ts mit
*``unit``* angegeben. *``keyword``* ist eine Option aus der folgenden
Liste:

.. raw:: html

   <div class="itemizedlist">

-  ``at``: Gibt den Bus, auf dem sich das Ger?t befindet, an.

-  ``port``: Die Startadresse des I/O-Bereichs.

-  ``irq``: Gibt die zu verwendende Unterbrechungsanforderung (IRQ) an.

-  ``drq``: Die Nummer des DMA Kanals.

-  ``maddr``: Die physikalische Speicheradresse des Ger?ts.

-  ``flags``: Setzt verschiedene ger?tespezifische Optionen.

-  ``disabled``: Deaktiviert das Ger?t, wenn der Wert auf ``1`` gesetzt
   wird.

.. raw:: html

   </div>

Ein Ger?tetreiber kann mehr Optionen, als die hier beschriebenen,
besitzen oder ben?tigen. Schlagen Sie die Optionen bitte in der
Online-Hilfe des Treibers nach. Weitere Informationen erhalten Sie in
`device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5>`__,
`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1>`__,
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
und
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+-------------------------------+------------------------------------------------------+
| `Zur?ck <boot-kernel.html>`__?                        | `Nach oben <boot.html>`__     | ?\ `Weiter <boot-init.html>`__                       |
+-------------------------------------------------------+-------------------------------+------------------------------------------------------+
| 13.4. Kernel Interaktion w?hrend des Bootprozesses?   | `Zum Anfang <index.html>`__   | ?13.6. Init: Initialisierung der Prozess-Kontrolle   |
+-------------------------------------------------------+-------------------------------+------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
