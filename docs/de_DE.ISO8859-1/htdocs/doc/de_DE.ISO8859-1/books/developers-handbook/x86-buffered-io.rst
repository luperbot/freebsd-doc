====================================
11.8. Gepufferte Eingabe und Ausgabe
====================================

.. raw:: html

   <div class="navheader">

11.8. Gepufferte Eingabe und Ausgabe
`Zur?ck <x86-unix-filters.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-command-line.html>`__

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

11.8. Gepufferte Eingabe und Ausgabe
------------------------------------

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

Wir k?nnen die Effizienz unseres Codes erh?hen, indem wir die Ein- und
Ausgabe puffern. Wir erzeugen einen Eingabepuffer und lesen dann eine
Folge von Bytes auf einmal. Danach holen wir sie Byte f?r Byte aus dem
Puffer.

Wir erzeugen ebenfalls einen Ausgabepuffer. Darin speichern wir unsere
Ausgabe bis er voll ist. Dann bitten wir den Kernel den Inhalt des
Puffers nach ``stdout`` zu schreiben.

Diese Programm endet, wenn es keine weitere Eingaben gibt. Aber wir
m?ssen den Kernel immernoch bitten den Inhalt des Ausgabepuffers ein
letztes Mal nach ``stdout`` zu schreiben, denn sonst w?rde ein Teil der
Ausgabe zwar im Ausgabepuffer landen, aber niemals ausgegeben werden.
Bitte vergessen Sie das nicht, sonst fragen Sie sich sp?ter warum ein
Teil Ihrer Ausgabe verschwunden ist.

.. code:: programlisting

    %include  'system.inc'

    %define BUFSIZE 2048

    section .data
    hex db  '0123456789ABCDEF'

    section .bss
    ibuffer resb    BUFSIZE
    obuffer resb    BUFSIZE

    section .text
    global  _start
    _start:
        sub eax, eax
        sub ebx, ebx
        sub ecx, ecx
        mov edi, obuffer

    .loop:
        ; read a byte from stdin
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
        push    dword stdin
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
        push    dword stdout
        sys.write
        add esp, byte 12
        sub eax, eax
        sub ecx, ecx    ; buffer is empty now
        ret

Als dritten Abschnitt im Quelltext haben wir ``.bss``. Dieser Abschnitt
wird nicht in unsere ausf?hrbare Datei eingebunden und kann daher nicht
initialisiert werden. Wir verwenden ``resb`` anstelle von ``db``. Dieses
reserviert einfach die angeforderte Menge an uninitialisiertem Speicher
zu unserer Verwendung.

Wir nutzen, die Tatsache, dass das System die Register nicht ver?ndert:
Wir benutzen Register, wo wir anderenfalls globale Variablen im
Abschnitt ``.data`` verwenden m?ssten. Das ist auch der Grund, warum die
UNIX?-Konvention, Parameter auf dem Stack zu ?bergeben, der von
Microsoft, hierf?r Register zu verwenden, ?berlegen ist: Wir k?nnen
Register f?r unsere eigenen Zwecke verwenden.

Wir verwenden ``EDI`` und ``ESI`` als Zeiger auf das n?chste zu lesende
oder schreibende Byte. Wir verwenden ``EBX`` und ``ECX``, um die Anzahl
der Bytes in den beiden Puffern zu z?hlen, damit wir wissen, wann wir
die Ausgabe an das System ?bergeben, oder neue Eingabe vom System
entgegen nehmen m?ssen.

Lassen Sie uns sehen, wie es funktioniert:

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    Here I come!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A
    ^D %

Nicht was Sie erwartet haben? Das Programm hat die Ausgabe nicht auf dem
Bildschirm ausgegeben bis sie **``^D``** gedr?ckt haben. Das kann man
leicht zu beheben indem man drei Zeilen Code einf?gt, welche die Ausgabe
jedesmal schreiben, wenn wir einen Zeilenumbruch in ``0A`` umgewandelt
haben. Ich habe die betreffenden Zeilen mit > markiert (kopieren Sie die
> bitte nicht mit in Ihre ``hex.asm``).

.. code:: programlisting

    %include    'system.inc'

    %define BUFSIZE 2048

    section .data
    hex db  '0123456789ABCDEF'

    section .bss
    ibuffer resb    BUFSIZE
    obuffer resb    BUFSIZE

    section .text
    global  _start
    _start:
        sub eax, eax
        sub ebx, ebx
        sub ecx, ecx
        mov edi, obuffer

    .loop:
        ; read a byte from stdin
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
    >    cmp al, 0Ah
    >    jne .loop
    >    call    write
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
        push    dword stdin
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
        push    dword stdout
        sys.write
        add esp, byte 12
        sub eax, eax
        sub ecx, ecx    ; buffer is empty now
        ret

Lassen Sie uns jetzt einen Blick darauf werfen, wie es funktioniert.

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A
    Here I come!
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A
    ^D %

Nicht schlecht f?r eine 644 Byte gro?e Bin?rdatei, oder?

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser Ansatz f?r gepufferte Ein- und Ausgabe enth?lt eine Gefahr, auf
die ich im Abschnitt `Die dunkle Seite des
Buffering <x86-one-pointed-mind.html#x86-buffered-dark-side>`__ eingehen
werde.

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

11.8.1. Ein Zeichen ungelesen machen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Das ist vielleicht ein etwas fortgeschrittenes Thema, das vor allem f?r
Programmierer interessant ist, die mit der Theorie von Compilern
vertraut sind. Wenn Sie wollen, k?nnen Sie `zum n?chsten Abschnitt
springen <x86-command-line.html>`__ und das hier vielleicht sp?ter
lesen.

.. raw:: html

   </div>

Unser Beispielprogramm ben?tigt es zwar nicht, aber etwas
anspruchsvollere Filter m?ssen h?ufig vorausschauen. Mit anderen Worten,
sie m?ssen wissen was das n?chste Zeichen ist (oder sogar mehrere
Zeichen). Wenn das n?chste Zeichen einen bestimmten Wert hat, ist es
Teil des aktuellen Tokens, ansonsten nicht.

Zum Beispiel k?nnten Sie den Eingabestrom f?r eine Text-Zeichenfolge
parsen (z.B. wenn Sie einen Compiler einer Sprache implementieren): Wenn
einem Buchstaben ein anderer Buchstabe oder vielleicht eine Ziffer
folgt, ist er ein Teil des Tokens, das Sie verarbeiten. Wenn ihm ein
Leerzeichen folgt, oder ein anderer Wert, ist er nicht Teil des
aktuellen Tokens.

Das f?hrt uns zu einem interessanten Problem: Wie kann man ein Zeichen
zur?ck in den Eingabestrom geben, damit es sp?ter noch einmal gelesen
werden kann?

Eine m?gliche L?sung ist, das Zeichen in einer Variable zu speichern und
ein Flag zu setzen. Wir k?nnen ``getchar`` so anpassen, dass es das Flag
?berpr?ft und, wenn es gesetzt ist, das Byte aus der Variable anstatt
dem Eingabepuffer liest und das Flag zur?ck setzt. Aber nat?rlich macht
uns das langsamer.

Die Sprache C hat eine Funktion ``ungetc()`` f?r genau diesen Zweck.
Gibt es einen schnellen Weg, diese in unserem Code zu implementieren?
Ich m?chte Sie bitten nach oben zu scrollen und sich die Prozedur
``getchar`` anzusehen und zu versuchen eine sch?ne und schnelle L?sung
zu finden, bevor Sie den n?chsten Absatz lesen. Kommen Sie danach
hierher zur?ck und schauen sich meine L?sung an.

Der Schl?ssel dazu ein Zeichen an den Eingabestrom zur?ckzugeben, liegt
darin, wie wir das Zeichen bekommen:

Als erstes ?berpr?fen wir, ob der Puffer leer ist, indem wir den Wert
von ``EBX`` testen. Wenn er null ist, rufen wir die Prozedur ``read``
auf.

Wenn ein Zeichen bereit ist verwenden wir ``lodsb``, dann verringern wir
den Wert von ``EBX``. Die Anweisung ``lodsb`` ist letztendlich identisch
mit:

.. code:: programlisting

      mov al, [esi]
          inc   esi

Das Byte, welches wir abgerufen haben, verbleibt im Puffer bis ``read``
zum n?chsten Mal aufgerufen wird. Wir wissen nicht wann das passiert,
aber wir wissen, dass es nicht vor dem n?chsten Aufruf von ``getchar``
passiert. Daher ist alles was wir tun m?ssen um das Byte in den Strom
"zur?ckzugeben" ist den Wert von ``ESI`` zu verringern und den von
``EBX`` zu erh?hen:

.. code:: programlisting

    ungetc:
          dec   esi
          inc   ebx
          ret

Aber seien Sie vorsichtig! Wir sind auf der sicheren Seite, solange wir
immer nur ein Zeichen im Voraus lesen. Wenn wir mehrere kommende Zeichen
betrachten und ``ungetc`` mehrmals hintereinander aufrufen, wird es
meistens funktionieren, aber nicht immer (und es wird ein schwieriger
Debug). Warum?

Solange ``getchar`` ``read`` nicht aufrufen muss, befinden sich alle im
Voraus gelesenen Bytes noch im Puffer und ``ungetc`` arbeitet
fehlerfrei. Aber sobald ``getchar`` ``read`` aufruft ver?ndert sich der
Inhalt des Puffers.

Wir k?nnen uns immer darauf verlassen, dass ``ungetc`` auf dem zuletzt
mit ``getchar`` gelesenen Zeichen korrekt arbeitet, aber nicht auf
irgendetwas, das davor gelesen wurde.

Wenn Ihr Programm mehr als ein Byte im Voraus lesen soll, haben Sie
mindestens zwei M?glichkeiten:

Die einfachste L?sung ist, Ihr Programm so zu ?ndern, dass es immer nur
ein Byte im Voraus liest, wenn das m?glich ist.

Wenn Sie diese M?glichkeit nicht haben, bestimmen Sie zuerst die
maximale Anzahl an Zeichen, die Ihr Programm auf einmal an den
Eingabestrom zur?ckgeben muss. Erh?hen Sie diesen Wert leicht, nur um
sicherzugehen, vorzugsweise auf ein Vielfaches von 16—damit er sich
sch?n ausrichtet. Dann passen Sie den ``.bss`` Abschnitt Ihres Codes an
und erzeugen einen kleinen Reserver-Puffer, direkt vor ihrem
Eingabepuffer, in etwa so:

.. code:: programlisting

    section  .bss
          resb  16  ; or whatever the value you came up with
      ibuffer   resb    BUFSIZE
      obuffer   resb    BUFSIZE

Au?erdem m?ssen Sie ``ungetc`` anpassen, sodass es den Wert des Bytes,
das zur?ckgegeben werden soll, in ``AL`` ?bergibt:

.. code:: programlisting

    ungetc:
          dec   esi
          inc   ebx
          mov   [esi], al
          ret

Mit dieser ?nderung k?nnen Sie sicher ``ungetc`` bis zu 17 Mal
hintereinander gqapaufrufen (der erste Aufruf erfolgt noch im Puffer,
die anderen 16 entweder im Puffer oder in der Reserve).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <x86-unix-filters.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-command-line.html>`__   |
+---------------------------------------+-------------------------------+-----------------------------------------+
| 11.7. UNIX?-Filter schreiben?         | `Zum Anfang <index.html>`__   | ?11.9. Kommandozeilenparameter          |
+---------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
