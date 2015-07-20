============================
11.7. UNIX?-Filter schreiben
============================

.. raw:: html

   <div class="navheader">

11.7. UNIX?-Filter schreiben
`Zur?ck <x86-first-program.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-buffered-io.html>`__

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

11.7. UNIX?-Filter schreiben
----------------------------

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

Ein h?ufiger Typ von UNIX?-Anwendungen ist ein Filter — ein Programm,
das Eingaben von ``stdin`` liest, sie verarbeitet und das Ergebnis nach
``stdout`` schreibt.

In diesem Kapitel m?chten wir einen einfachen Filter entwickeln und
lernen, wie wir von ``stdin`` lesen und nach ``stdout`` schreiben.
Dieser Filter soll jedes Byte seiner Eingabe in eine hexadezimale Zahl
gefolgt von einem Leerzeichen umwandeln.

.. code:: programlisting

    %include  'system.inc'

    section .data
    hex db  '0123456789ABCDEF'
    buffer  db  0, 0, ' '

    section .text
    global  _start
    _start:
        ; read a byte from stdin
        push    dword 1
        push    dword buffer
        push    dword stdin
        sys.read
        add esp, byte 12
        or  eax, eax
        je  .done

        ; convert it to hex
        movzx   eax, byte [buffer]
        mov edx, eax
        shr dl, 4
        mov dl, [hex+edx]
        mov [buffer], dl
        and al, 0Fh
        mov al, [hex+eax]
        mov [buffer+1], al

        ; print it
        push    dword 3
        push    dword buffer
        push    dword stdout
        sys.write
        add esp, byte 12
        jmp short _start

    .done:
        push    dword 0
        sys.exit

Im Datenabschnitt erzeugen wir ein Array mit Namen ``hex``. Es enth?lt
die 16 hexadezimalen Ziffern in aufsteigender Reihenfolge. Diesem Array
folgt ein Puffer, den wir sowohl f?r die Ein- als auch f?r die Ausgabe
verwenden. Die ersten beiden Bytes dieses Puffers werden am Anfang auf
``0`` gesetzt. Dorthin schreiben wir die beiden hexadezimalen Ziffern
(das erste Byte ist auch die Stelle an die wir die Eingabe lesen). Das
dritte Byte ist ein Leerzeichen.

Der Code-Abschnitt besteht aus vier Teilen: Das Byte lesen, es in eine
hexadezimale Zahl umwandeln, das Ergebnis schreiben und letztendlich das
Programm verlassen.

Um das Byte zu lesen, bitten wir das System ein Byte von ``stdin`` zu
lesen und speichern es im ersten Byte von ``buffer``. Das System gibt
die Anzahl an Bytes, die gelesen wurden, in ``EAX`` zur?ck. Diese wird
``1`` sein, wenn eine Eingabe empfangen wird und ``0``, wenn keine
Eingabedaten mehr verf?gbar sind. Deshalb ?berpr?fen wir den Wert von
``EAX``. Wenn dieser ``0`` ist, springen wir zu ``.done``, ansonsten
fahren wir fort.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Zu Gunsten der Einfachheit ignorieren wir hier die M?glichkeit eines
Fehlers.

.. raw:: html

   </div>

Die Umwandlungsroutine in eine Hexadezimalzahl liest das Byte aus
``buffer`` in ``EAX``, oder genaugenommen nur in ``AL``, wobei die
?brigen Bits von ``EAX`` auf null gesetzt werden. Au?erdem kopieren wir
das Byte nach ``EDX``, da wir die oberen vier Bits (Nibble) getrennt von
den unteren vier Bits umwandeln m?ssen. Das Ergebnis speichern wir in
den ersten beiden Bytes des Puffers.

Als N?chstes bitten wir das System die drei Bytes in den Puffer zu
schreiben, also die zwei hexadezimalen Ziffern und das Leerzeichen nach
``stdout``. Danach springen wir wieder an den Anfang des Programms und
verarbeiten das n?chste Byte.

Wenn die gesamte Eingabe verarbeitet ist, bitten wie das System unser
Programm zu beenden und null zur?ckzuliefern, welches traditionell die
Bedeutung hat, dass unser Programm erfolgreich war.

Fahren Sie fort und speichern Sie den Code in eine Datei namens
``hex.asm``. Geben Sie danach folgendes ein (**``^D``** bedeutet, dass
Sie die Steuerungstaste dr?cken und dann **``D``** eingeben, w?hrend Sie
Steuerung gedr?ckt halten):

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A Here I come!
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A ^D %

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie von MS-DOS? zu UNIX? wechseln, wundern Sie sich vielleicht,
warum jede Zeile mit ``0A`` an Stelle von ``0D     0A`` endet. Das liegt
daran, dass UNIX? nicht die CR/LF-Konvention, sondern die "new
line"-Konvention verwendet, welches hexadezimal als ``0A`` dargestellt
wird.

.. raw:: html

   </div>

K?nnen wir das Programm verbessern? Nun, einerseits ist es etwas
verwirrend, dass die Eingabe, nachdem wir eine Zeile verarbeitet haben,
nicht wieder am Anfang der Zeile beginnt. Deshalb k?nnen wir unser
Programm anpassen um einen Zeilenumbruch an Stelle eines Leerzeichens
nach jedem ``0A`` auszugeben:

.. code:: programlisting

    %include  'system.inc'

    section .data
    hex db  '0123456789ABCDEF'
    buffer  db  0, 0, ' '

    section .text
    global  _start
    _start:
        mov cl, ' '

    .loop:
        ; read a byte from stdin
        push    dword 1
        push    dword buffer
        push    dword stdin
        sys.read
        add esp, byte 12
        or  eax, eax
        je  .done

        ; convert it to hex
        movzx   eax, byte [buffer]
        mov [buffer+2], cl
        cmp al, 0Ah
        jne .hex
        mov [buffer+2], al

    .hex:
        mov edx, eax
        shr dl, 4
        mov dl, [hex+edx]
        mov [buffer], dl
        and al, 0Fh
        mov al, [hex+eax]
        mov [buffer+1], al

        ; print it
        push    dword 3
        push    dword buffer
        push    dword stdout
        sys.write
        add esp, byte 12
        jmp short .loop

    .done:
        push    dword 0
        sys.exit

Wir haben das Leerzeichen im Register ``CL`` abgelegt. Das k?nnen wir
bedenkenlos tun, da UNIX?-Systemaufrufe im Gegensatz zu denen von
Microsoft??Windows? keine Werte von Registern ?ndern in denen sie keine
Werte zur?ckliefern.

Das bedeutet, dass wir ``CL`` nur einmal setzen m?ssen. Daf?r haben wir
ein neues Label ``.loop`` eingef?gt, zu dem wir an Stelle von ``_start``
springen, um das n?chste Byte einzulesen. Au?erdem haben wir das Label
``.hex`` eingef?gt, somit k?nnen wir wahlweise ein Leerzeichen oder
einen Zeilenumbruch im dritten Byte von ``buffer`` ablegen.

Nachdem Sie ``hex.asm`` entsprechend der Neuerungen ge?ndert haben,
geben Sie Folgendes ein:

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A
    Here I come!
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A
    ^D %

Das sieht doch schon besser aus. Aber der Code ist ziemlich ineffizient!
Wir f?hren f?r jeden einzelne Byte zweimal einen Systemaufruf aus (einen
zum Lesen und einen um es in die Ausgabe zu schreiben).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <x86-first-program.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-buffered-io.html>`__    |
+----------------------------------------+-------------------------------+-----------------------------------------+
| 11.6. Unser erstes Programm?           | `Zum Anfang <index.html>`__   | ?11.8. Gepufferte Eingabe und Ausgabe   |
+----------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
