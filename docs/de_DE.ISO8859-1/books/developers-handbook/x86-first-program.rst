===========================
11.6. Unser erstes Programm
===========================

.. raw:: html

   <div class="navheader">

11.6. Unser erstes Programm
`Zur?ck <x86-portable-code.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-unix-filters.html>`__

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

11.6. Unser erstes Programm
---------------------------

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

Jetzt sind wir bereit f?r unser erstes Programm, das ?bliche Hello,
World!

.. code:: programlisting

     1: %include    'system.inc'
     2:
     3: section .data
     4: hello   db  'Hello, World!', 0Ah
     5: hbytes  equ $-hello
     6:
     7: section .text
     8: global  _start
     9: _start:
    10: push    dword hbytes
    11: push    dword hello
    12: push    dword stdout
    13: sys.write
    14:
    15: push    dword 0
    16: sys.exit

Hier folgt die Erkl?rung des Programms: Zeile 1 f?gt die Definitionen
ein, die Makros und den Code aus ``system.inc``.

Die Zeilen 3 bis 5 enthalten die Daten: Zeile 3 beginnt den
Datenabschnitt/das Datensegment. Zeile 4 enth?lt die Zeichenkette
"Hello, World!", gefolgt von einem Zeilenumbruch (``0Ah``). Zeile 5
erstellt eine Konstante, die die L?nge der Zeichenkette aus Zeile 4 in
Bytes enth?lt.

Die Zeilen 7 bis 16 enthalten den Code. Beachten Sie bitte, dass FreeBSD
das Dateiformat *elf* f?r diese ausf?hrbare Datei verwendet, bei dem
jedes Programm mit dem Label ``_start`` beginnt (oder, um genau zu sein,
wird dies vom Linker erwartet). Diese Label muss global sein.

Die Zeilen 10 bis 13 weisen das System an ``hbytes`` Bytes der
Zeichenkette ``hello`` nach ``stdout`` zu schreiben.

Die Zeilen 15 und 16 weisen das System an das Programm mit dem
R?ckgabewert ``0`` zu beenden. Der Systemaufruf ``SYS_exit`` kehrt
niemals zur?ck, somit endet das Programm hier.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie von MS-DOS?-Assembler zu UNIX? gekommen sind, sind Sie es
vielleicht gewohnt direktauf die Video-Hardware zu schreiben. Unter
FreeBSD m?ssen Sie sich darum keine Gedanken machen, ebenso bei jeder
anderen Art von UNIX?. Soweit es Sie betrifft schreiben Sie in eine
Datei namens ``stdout``. Das kann der Bildschirm, oder ein
telnet-Terminal, eine wirkliche Datei, oder die Eingabe eines anderen
Programms sein. Es liegt beim System herauszufinden, welches davon es
tats?chlich ist.

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

11.6.1. Den Code assemblieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Geben Sie den Code (au?er den Zeilennummern) in einen Editor ein und
speichern Sie ihn in einer Datei namens ``hello.asm``. Um es zu
assemblieren ben?tigen Sie nasm.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.6.1.1. nasm installieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie nasm noch nicht installiert haben geben Sie folgendes ein:

.. code:: screen

    % su
    Password:your root password
    # cd /usr/ports/devel/nasm
    # make install
    # exit
    %

Sie k?nnen auch **``make install       clean``** anstatt
**``make       install``** eingeben, wenn Sie den Quelltext von nasm
nicht behalten m?chten.

Auf jeden Fall wird FreeBSD nasm automatisch aus dem Internet
herunterladen, es kompilieren und auf Ihrem System installieren.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn es sich bei Ihrem System nicht um FreeBSD handelt, m?ssen Sie nasm
von dessen `Homepage <https://sourceforge.net/projects/nasm>`__
herunterladen. Sie k?nnen es aber dennoch verwenden um FreeBSD code zu
assemblieren.

.. raw:: html

   </div>

Nun k?nnen Sie den Code assemblieren, binden und ausf?hren:

.. code:: screen

    % nasm -f elf hello.asm
    % ld -s -o hello hello.o
    % ./hello
    Hello, World!
    %

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <x86-portable-code.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-unix-filters.html>`__   |
+----------------------------------------+-------------------------------+-----------------------------------------+
| 11.5. Portablen Code erzeugen?         | `Zum Anfang <index.html>`__   | ?11.7. UNIX?-Filter schreiben           |
+----------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
