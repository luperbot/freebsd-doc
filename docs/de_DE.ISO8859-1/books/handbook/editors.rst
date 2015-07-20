===================
4.10. Text-Editoren
===================

.. raw:: html

   <div class="navheader">

4.10. Text-Editoren
`Zur?ck <shells.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <basics-devices.html>`__

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

4.10. Text-Editoren
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine gro?er Teil der Konfiguration wird bei FreeBSD durch das Editieren
von Textdateien erledigt. Deshalb ist es eine gute Idee, mit einem
Texteditor vertraut zu werden. FreeBSD hat ein paar davon im Basissystem
und sehr viel mehr in der Ports-Sammlung.

Der am leichtesten und einfachsten zu erlernende Editor nennt sich ee,
was f?r *easy editor* steht. Um ee zu starten, gibt man in der
Kommandozeile ``ee filename`` ein, wobei *``filename``* den Namen der zu
editierenden Datei darstellt. Um zum Beispiel ``/etc/rc.conf`` zu
editieren, tippen Sie ``ee /etc/rc.conf`` ein. Einmal im Editor, finden
Sie alle Editor-Funktionen oben im Display aufgelistet. Das
Einschaltungszeichen ``^`` steht f?r die **Ctrl** (oder **Strg**) Taste,
mit ``^e`` ist also die Tastenkombination **Ctrl**+**e** gemeint. Um ee
zu verlassen, dr?cken Sie **Esc** und w?hlen dann
``leave         editor`` aus. Der Editor fragt nach, ob Sie speichern
m?chten, wenn die Datei ver?ndert wurde.

FreeBSD verf?gt ?ber leistungsf?higere Editoren wie vi als Teil des
Basissystems, andere Editoren wie emacs oder vim sind Teil der
Ports-Sammlung. Diese Editoren bieten h?here Funktionalit?t und
Leistungsf?higkeit, jedoch auf Kosten einer etwas schwierigeren
Erlernbarkeit. Wenn Sie viele Textdateien editieren, sparen Sie auf
lange Sicht mehr Zeit durch das Erlernen von Editoren wie vim oder emacs
ein.

Viele Anwendungen, die Dateien ver?ndern oder Texteingabe erwarten,
werden automatisch einen Texteditor ?ffnen. Um den Standardeditor zu
?ndern, setzen Sie die Umgebungsvariable ``EDITOR``. Um mehr dar?ber zu
erfahren, lesen Sie den Abschnitt `Shells <shells.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <shells.html>`__?   | `Nach oben <basics.html>`__   | ?\ `Weiter <basics-devices.html>`__   |
+-----------------------------+-------------------------------+---------------------------------------+
| 4.9. Shells?                | `Zum Anfang <index.html>`__   | ?4.11. Ger?te und Ger?tedateien       |
+-----------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
