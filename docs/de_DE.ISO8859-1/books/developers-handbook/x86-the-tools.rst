===================
11.2. Die Werkzeuge
===================

.. raw:: html

   <div class="navheader">

11.2. Die Werkzeuge
`Zur?ck <x86.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-system-calls.html>`__

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

11.2. Die Werkzeuge
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

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.2.1. Der Assembler
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das wichtigste Werkzeug der Assembler-Programmierung ist der Assembler,
diese Software ?bersetzt Assembler-Sprache in Maschinencode.

F?r FreeBSD stehen zwei verschiedene Assembler zur Verf?gung. Der erste
ist `as(1) <http://www.FreeBSD.org/cgi/man.cgi?query=as&sektion=1>`__,
der die traditionelle UNIX?-Assembler-Sprache verwendet. Dieser ist Teil
des Systems.

Der andere ist /usr/ports/devel/nasm. Dieser benutzt die Intel-Syntax
und sein Vorteil ist, dass es Code f? viele Vetriebssysteme ?bersetzen
kann. Er muss gesondert installiert werden, aber ist v?llig frei.

In diesem Kapitel wird die nasm-Syntax verwendet. Einerseits weil es die
meisten Assembler-Programmierer, die von anderen Systemen zu FreeBSD
kommen, leichter verstehen werden. Und offen gesagt, weil es das ist,
was ich gewohnt bin.

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

11.2.2. Der Linker
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Ausgabe des Assemblers muss, genau wie der Code jedes Compilers,
gebunden werden, um eine ausf?hrbare Datei zu bilden.

Der Linker
`ld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ld&sektion=1>`__ ist
der Standard und Teil von FreeBSD. Er funktioniert mit dem Code beider
Assembler.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <x86.html>`__?                      | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-system-calls.html>`__   |
+---------------------------------------------+-------------------------------+-----------------------------------------+
| Kapitel 11. x86-Assembler-Programmierung?   | `Zum Anfang <index.html>`__   | ?11.3. Systemaufrufe                    |
+---------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
