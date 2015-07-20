===================
11.4. R?ckgabewerte
===================

.. raw:: html

   <div class="navheader">

11.4. R?ckgabewerte
`Zur?ck <x86-system-calls.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-portable-code.html>`__

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

11.4. R?ckgabewerte
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Hagen K?hl.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Systemaufruf w?re meistens nicht sehr n?tzlich, wenn er nicht
irgendeinen Wert zur?ckgibt: Beispielsweise den Dateideskriptor einer
ge?ffneten Datei, die Anzahl an Bytes die in einen Puffer gelesen wurde,
die Systemzeit, etc.

Au?erdem muss Sie das System informieren, falls ein Fehler auftritt:
Wenn eine Datei nicht existiert, die Systemressourcen ersch?pft sind,
wir ein ung?ltiges Argument ?bergeben haben, etc.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.4.1. Manualpages
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der herk?mmliche Ort, um nach Informationen ?ber verschiedene
Systemaufrufe unter UNIX?-Systemen zu suchen, sind die Manualpages.
FreeBSD beschreibt seine Systemaufrufe in Abschnitt 2, manchmal auch
Abschnitt 3.

In `open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=open&sektion=2>`__
steht beispielsweise:

.. raw:: html

   <div class="blockquote">

    Falls erfolgreich, gibt ``open()`` einen nicht negativen
    Integerwert, als Dateideskriptor bezeichnet, zur?ck. Es gibt ``-1``
    im Fehlerfall zur?ck und setzt ``errno`` um den Fehler anzuzeigen.

.. raw:: html

   </div>

Ein Assembler-Programmierer, der neu bei UNIX? und FreeBSD ist, wird
sich sofort fragen: Wo finde ich ``errno`` und wie erreiche ich es?

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Information der Manualpage bezieht sich auf C-Programme. Der
Assembler-Programmierer ben?tigt zus?tzliche Informationen.

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

11.4.2. Wo sind die R?ckgabewerde?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Leider gilt: Es kommt darauf an... F?r die meisten Systemaufrufe liegt
er in ``EAX``, aber nicht f?r alle. Eine gute Daumenregel, wenn man zum
ersten Mal mit einem Systemaufruf arbeitet, ist in ``EAX`` nach dem
R?ckgabewert zu suchen. Wenn er nicht dort ist, sind weitere
Untersuchungen n?tig.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Mir ist ein Systemaufruf bekannt, der den R?ckgabewert in ``EDX``
ablegt: ``SYS_fork`` Alle anderen mit denen ich bisher gearbeitet habe
verwenden ``EAX``. Allerdings habe ich noch nicht mit allen gearbeitet.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Wenn Sie die Antwort weder hier, noch irgendwo anders finden, studieren
Sie den Quelltext von libc und sehen sich an, wie es mit dem Kernel
zusammenarbeitet.

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

11.4.3. Wo ist ``errno``?
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tats?chlich, nirgendwo...

``errno`` ist ein Teil der Sprache C, nicht des UNIX?-Kernels. Wenn man
direkt auf Kernel-Dienste zugreift, wird der Fehlercode in ``EAX``
zur?ckgegeben, das selbe Register in dem der R?ckgabewert, bei einem
erfolgreichen Aufruf landet.

Das macht auch Sinn. Wenn kein Fehler auftritt, gibt es keinen
Fehlercode. Wenn ein Fehler auftritt, gibt es keinen R?ckgabewert. Ein
einziges Register kann also beides enthalten.

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

11.4.4. Feststellen, dass ein Fehler aufgetreten ist
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die Standard FreeBSD-Aufrufkonvention verwenden wird das
``carry flag`` gel?scht wenn der Aufruf erfolgreich ist und gesetzt wenn
ein Fehler auftritt.

Wenn Sie den Linux-Emulationsmodus verwenden ist der vorzeichenbehaftete
Wert in ``EAX`` nicht negativ, bei einem erfolgreichen Aufruf. Wenn ein
Fehler auftritt ist der Wert negativ, also ``-errno``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+------------------------------------------+
| `Zur?ck <x86-system-calls.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-portable-code.html>`__   |
+---------------------------------------+-------------------------------+------------------------------------------+
| 11.3. Systemaufrufe?                  | `Zum Anfang <index.html>`__   | ?11.5. Portablen Code erzeugen           |
+---------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
