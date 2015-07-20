=============================
11.9. Kommandozeilenparameter
=============================

.. raw:: html

   <div class="navheader">

11.9. Kommandozeilenparameter
`Zur?ck <x86-buffered-io.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-environment.html>`__

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

11.9. Kommandozeilenparameter
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Fabian Ruch.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unser hex-Programm wird n?tzlicher, wenn es die Dateinamen der Ein- und
Ausgabedatei ?ber die Kommandozeile einlesen kann, d.h., wenn es
Kommandozeilenparameter verarbeiten kann. Aber... Wo sind die?

Bevor ein UNIX?-System ein Programm ausf?hrt, legt es einige Daten auf
dem Stack ab (``push``) und springt dann an das ``_start``-Label des
Programms. Ja, ich sagte springen, nicht aufrufen. Das bedeutet, dass
auf die Daten zugegriffen werden kann, indem ``[esp+offset]`` ausgelesen
wird oder die Daten einfach vom Stack genommen werden (``pop``).

Der Wert ganz oben auf dem Stack enth?lt die Zahl der
Kommandozeilenparameter. Er wird traditionell ``argc`` wie "argument
count" genannt.

Die Kommandozeilenparameter folgen einander, alle ``argc``. Von diesen
wird ?blicherweise als ``argv`` wie "argument value(s)" gesprochen. So
erhalten wir ``argv[0]``, ``argv[1]``, ``...`` und ``argv[argc-1]``.
Dies sind nicht die eigentlichen Parameter, sondern Zeiger (Pointer) auf
diese, d.h., Speicheradressen der tats?chlichen Parameter. Die Parameter
selbst sind durch NULL beendete Zeichenketten.

Der ``argv``-Liste folgt ein NULL-Zeiger, was einfach eine ``0`` ist. Es
gibt noch mehr, aber dies ist erst einmal genug f?r unsere Zwecke.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls Sie von der MS-DOS?-Programmierumgebung kommen, ist der gr??te
Unterschied die Tatsache, dass jeder Parameter eine separate
Zeichenkette ist. Der zweite Unterschied ist, dass es praktisch keine
Grenze gibt, wie viele Parameter vorhanden sein k?nnen.

.. raw:: html

   </div>

Ausger?stet mit diesen Kenntnissen, sind wir beinahe bereit f?r eine
weitere Version von ``hex.asm``. Zuerst m?ssen wir jedoch noch ein paar
Zeilen zu ``system.inc`` hinzuf?gen:

Erstens ben?tigen wir zwei neue Eintr?ge in unserer Liste mit den
Systemaufrufnummern:

.. code:: programlisting

    %define SYS_open    5
    %define SYS_close   6

Zweitens f?gen wir zwei neue Makros am Ende der Datei ein:

.. code:: programlisting

    %macro    sys.open    0
        system  SYS_open
    %endmacro

    %macro  sys.close   0
        system  SYS_close
    %endmacro

Und hier ist schlie?lich unser ver?nderter Quelltext:

.. code:: programlisting

    %include    'system.inc'

    %define BUFSIZE 2048

    section .data
    fd.in   dd  stdin
    fd.out  dd  stdout
    hex db  '0123456789ABCDEF'

    section .bss
    ibuffer resb    BUFSIZE
    obuffer resb    BUFSIZE

    section .text
    align 4
    err:
        push    dword 1     ; return failure
        sys.exit

    align 4
    global  _start
    _start:
        add esp, byte 8 ; discard argc and argv[0]

        pop ecx
        jecxz   .init       ; no more arguments

        ; ECX contains the path to input file
        push    dword 0     ; O_RDONLY
        push    ecx
        sys.open
        jc  err     ; open failed

        add esp, byte 8
        mov [fd.in], eax

        pop ecx
        jecxz   .init       ; no more arguments

        ; ECX contains the path to output file
        push    dword 420   ; file mode (644 octal)
        push    dword 0200h | 0400h | 01h
        ; O_CREAT | O_TRUNC | O_WRONLY
        push    ecx
        sys.open
        jc  err

        add esp, byte 12
        mov [fd.out], eax

    .init:
        sub eax, eax
        sub ebx, ebx
        sub ecx, ecx
        mov edi, obuffer

    .loop:
        ; read a byte from input file or stdin
        call    getchar

        ; convert it to hex
        mov dl, al
        shr al, 4
        mov al, [hex+eax]
        call    putchar

        mov al, dl
        and al, 0Fh
        mov al, [hex+eax]
        call    putchar

        mov al, ' '
        cmp dl, 0Ah
        jne .put
        mov al, dl

    .put:
        call    putchar
        cmp al, dl
        jne .loop
        call    write
        jmp short .loop

    align 4
    getchar:
        or  ebx, ebx
        jne .fetch

        call    read

    .fetch:
        lodsb
        dec ebx
        ret

    read:
        push    dword BUFSIZE
        mov esi, ibuffer
        push    esi
        push    dword [fd.in]
        sys.read
        add esp, byte 12
        mov ebx, eax
        or  eax, eax
        je  .done
        sub eax, eax
        ret

    align 4
    .done:
        call    write       ; flush output buffer

        ; close files
        push    dword [fd.in]
        sys.close

        push    dword [fd.out]
        sys.close

        ; return success
        push    dword 0
        sys.exit

    align 4
    putchar:
        stosb
        inc ecx
        cmp ecx, BUFSIZE
        je  write
        ret

    align 4
    write:
        sub edi, ecx    ; start of buffer
        push    ecx
        push    edi
        push    dword [fd.out]
        sys.write
        add esp, byte 12
        sub eax, eax
        sub ecx, ecx    ; buffer is empty now
        ret

In unserem ``.data``-Abschnitt befinden sich nun die zwei neuen
Variablen ``fd.in`` und ``fd.out``. Hier legen wir die Dateideskriptoren
der Ein- und Ausgabedatei ab.

Im ``.text``-Abschnitt haben wir die Verweise auf ``stdin`` und
``stdout`` durch ``[fd.in]`` und ``[fd.out]`` ersetzt.

Der ``.text``-Abschnitt beginnt nun mit einer einfachen
Fehlerbehandlung, welche nur das Programm mit einem R?ckgabewert von
``1`` beendet. Die Fehlerbehandlung befindet sich vor ``_start``, sodass
wir in geringer Entfernung von der Stelle sind, an der der Fehler
auftritt.

Selbstverst?ndlich beginnt die Programmausf?hrung immer noch bei
``_start``. Zuerst entfernen wir ``argc`` und ``argv[0]`` vom Stack: Sie
sind f?r uns nicht von Interesse (sprich, in diesem Programm).

Wir nehmen ``argv[1]`` vom Stack und legen es in ``ECX`` ab. Dieses
Register ist besonders f?r Zeiger geeignet, da wir mit ``jecxz``
NULL-Zeiger verarbeiten k?nnen. Falls ``argv[1]`` nicht NULL ist,
versuchen wir, die Datei zu ?ffnen, die der erste Parameter festlegt.
Andernfalls fahren wir mit dem Programm fort wie vorher: Lesen von
``stdin`` und Schreiben nach ``stdout``. Falls wir die Eingabedatei
nicht ?ffnen k?nnen (z.B. sie ist nicht vorhanden), springen wir zur
Fehlerbehandlung und beenden das Programm.

Falls es keine Probleme gibt, sehen wir nun nach dem zweiten Parameter.
Falls er vorhanden ist, ?ffnen wir die Ausgabedatei. Andernfalls
schreiben wir die Ausgabe nach ``stdout``. Falls wir die Ausgabedatei
nicht ?ffnen k?nnen (z.B. sie ist zwar vorhanden, aber wir haben keine
Schreibberechtigung), springen wir auch wieder in die Fehlerbehandlung.

Der Rest des Codes ist derselbe wie vorher, au?er dem Schlie?en der Ein-
und Ausgabedatei vor dem Verlassen des Programms und, wie bereits
erw?hnt, die Benutzung von ``[fd.in]`` und ``[fd.out]``.

Unsere Bin?rdatei ist nun kolossale 768 Bytes gro?.

K?nnen wir das Programm immer noch verbessern? Nat?rlich! Jedes Programm
kann verbessert werden. Hier finden sich einige Ideen, was wir tun
k?nnten:

.. raw:: html

   <div class="itemizedlist">

-  Die Fehlerbehandlung eine Warnung auf ``stderr`` ausgeben lassen.

-  Den ``Lese``- und ``Schreib``\ funkionen eine Fehlerbehandlung
   hinzuf?gen.

-  Schlie?en von ``stdin``, sobald wir eine Eingabedatei ?ffnen, von
   ``stdout``, sobald wir eine Ausgabedatei ?ffnen.

-  Hinzuf?gen von Kommandozeilenschaltern wie zum Beispiel *``-i``* und
   *``-o``*, sodass wir die Ein- und Ausgabedatei in irgendeiner
   Reihenfolge angeben oder vielleicht von ``stdin`` lesen und in eine
   Datei schreiben k?nnen.

-  Ausgeben einer Gebrauchsanweisung, falls die Kommandozeilenparameter
   fehlerhaft sind.

.. raw:: html

   </div>

Ich beabsichtige, diese Verbesserungen dem Leser als ?bung zu
hinterlassen: Sie wissen bereits alles, das Sie wissen m?ssen, um die
Verbesserungen durchzuf?hren.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <x86-buffered-io.html>`__?      | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-environment.html>`__   |
+-----------------------------------------+-------------------------------+----------------------------------------+
| 11.8. Gepufferte Eingabe und Ausgabe?   | `Zum Anfang <index.html>`__   | ?11.10. Die UNIX?-Umgebung             |
+-----------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
