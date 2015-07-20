=======================
11.12. One-Pointed Mind
=======================

.. raw:: html

   <div class="navheader">

11.12. One-Pointed Mind
`Zur?ck <x86-files.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-fpu.html>`__

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

11.12. One-Pointed Mind
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Daniel Seuffert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als ein Zen-Sch?ler liebe ich die Idee eines fokussierten Bewu?tseins:
Tu nur ein Ding zur gleichen Zeit, aber mache es richtig.

Das ist ziemlich genau die gleiche Idee, welche UNIX? richtig
funktionieren l?sst. W?hrend eine typische Windows?-Applikation versucht
alles Vorstellbare zu tun (und daher mit Fehler durchsetzt ist),
versucht eine UNIX?-Applikation nur eine Funktion zu erf?llen und das
gut.

Der typische UNIX?-Nutzer stellt sich sein eigenes System durch
Shell-Skripte zusammen, die er selbst schreibt, und welche die Vorteile
bestehender Applikationen dadurch kombinieren, indem sie die Ausgabe
eines Programmes als Eingabe in ein anderes Programm durch eine Pipe
?bergeben.

Wenn Sie ihre eigene UNIX?-Software schreiben, ist es generell eine gute
Idee zu betrachten, welcher Teil der Probleml?sung durch bestehende
Programme bewerkstelligt werden kann. Man schreibt nur die Programme
selbst, f?r die keine vorhandene L?sung existiert.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.12.1. CSV
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ich will dieses Prinzip an einem besonderen Beispiel aus der realen Welt
demonstrieren, mit dem ich k?rzlich konfrontiert wurde:

Ich mu?te jeweils das elfte Feld von jedem Datensatz aus einer Datenbank
extrahieren, die ich von einer Webseite heruntergeladen hatte. Die
Datenbank war eine CSV-Datei, d.h. eine Liste von *Komma-getrennten
Werten*. Dies ist ein ziemlich gew?hnliches Format f?r den
Code-Austausch zwischen Menschen, die eine unterschiedliche
Datenbank-Software nutzen.

Die erste Zeile der Datei enth?lt eine Liste der Felder durch Kommata
getrennt. Der Rest der Datei enth?lt die einzelnen Datens?tze mit durch
Kommata getrennten Werten in jeder Zeile.

Ich versuchte awk unter Nutzung des Kommas als Trenner. Da aber einige
Zeilen durch in Bindestriche gesetzte Kommata getrennt waren,
extrahierte awk das falsche Feld aus diesen Zeilen.

Daher mu?te ich meine eigene Software schreiben, um das elfte Feld aus
der CSV-Datei auszulesen. Aber durch Anwendung der UNIX?-Philosophie
mu?te ich nur einen einfachen Filter schreiben, das Folgende tat:

.. raw:: html

   <div class="itemizedlist">

-  Entferne die erste Zeile aus der Datei.

-  ?ndere alle Kommata ohne Anf?hrungszeichen in einen anderen
   Buchstaben.

-  Entferne alle Anf?hrungszeichen.

.. raw:: html

   </div>

Streng genommen k?nnte ich sed benutzen, um die erste Zeile der Datei zu
entfernen, aber das zu Bewerkstelligen war in meinem Programm sehr
einfach, also entschloss ich mich dazu und reduzierte dadurch die Gr??e
der Pipeline.

Unter Ber?cksichtigung aller Faktoren kostete mich das Schreiben dieses
Programmes ca. 20 Minuten. Das Schreiben eines Programmes, welches
jeweils das elfte Feld aus einer CSV-Datei extrahiert h?tte wesentlich
l?nger gedauert und ich h?tte es nicht wiederverwenden k?nnen, um ein
anderes Feld aus irgendeiner anderen Datenbank zu extrahieren.

Diesmal entschied ich mich dazu, etwas mehr Arbeit zu investieren, als
man normalerweise f?r ein typisches Tutorial verwenden w?rde:

.. raw:: html

   <div class="itemizedlist">

-  Es parst die Kommandozeilen nach Optionen.

-  Es zeigt die richtige Nutzung an, falls es ein falsches Argument
   findet.

-  Es gibt vern?nftige Fehlermeldungen aus.

.. raw:: html

   </div>

Hier ist ein Beispiel f?r seine Nutzung:

.. code:: screen

    Usage: csv [-t<delim>] [-c<comma>] [-p] [-o <outfile>] [-i <infile>]

Alle Parameter sind optional und k?nnen in beliebiger Reihenfolge
auftauchen.

Der *``-t``*-Parameter legt fest, was zu die Kommata zu ersetzen sind.
Der ``tab`` ist die Vorgabe hierf?r. Zum Beispiel wird *``-t;``* alle
unquotierten Kommata mit Semikolon ersetzen.

Ich brauche die *``-c``*-Option nicht, aber sie k?nnte zuk?nftig
n?tzlich sein. Sie erm?glicht mir festzulegen, da? ich einen anderen
Buchstaben als das Kommata mit etwas anderem ersetzen m?chte. Zum
Beispiel wird der Parameter *``-c@``* alle @-Zeichen ersetzen (n?tzlich,
falls man eine Liste von Email-Adressen in Nutzername und Domain
aufsplitten will).

Die *``-p``*-Option erh?lt die erste Zeile, d.h. die erste Zeile der
Datei wird nicht gel?scht. Als Vorgabe l?schen wir die erste Zeile, weil
die CSV-Datei in der ersten Zeile keine Daten, sondern
Feldbeschreibungen enth?lt.

Die Parameter *``-i``*- und *``-o``*-Optionen erlauben es mir, die
Ausgabe- und Eingabedateien festzulegen. Vorgabe sind ``stdin`` und
``stdout``, also ist es ein regul?rer UNIX?-Filter.

Ich habe sichergestellt, da? sowohl *``-i     filename``* und
*``-ifilename``* akzeptiert werden. Genauso habe ich daf?r Sorge
getragen, da? sowohl Eingabe- als auch Ausgabedateien festgelegt werden
k?nnen.

Um das elfte Feld jeden Datensatzes zu erhalten kann ich nun folgendes
eingeben:

.. code:: screen

    % csv '-t;' data.csv | awk '-F;' '{print $11}'

Der Code speichert die Optionen (bis auf die Dateideskriptoren) in
``EDX``: Das Kommata in ``DH``, den neuen Feldtrenner in ``DL`` und das
Flag f?r die *``-p``*-Option in dem h?chsten Bit von ``EDX``. Ein kurzer
Abgleich des Zeichens wird uns also eine schnelle Entscheidung dar?ber
erlauben, was zu tun ist.

Hier ist der Code:

.. code:: programlisting

    ;;;;;;; csv.asm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;
    ; Convert a comma-separated file to a something-else separated file.
    ;
    ; Started:  31-May-2001
    ; Updated:   1-Jun-2001
    ;
    ; Copyright (c) 2001 G. Adam Stanislav
    ; All rights reserved.
    ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    %include    'system.inc'

    %define BUFSIZE 2048

    section .data
    fd.in   dd  stdin
    fd.out  dd  stdout
    usg db  'Usage: csv [-t<delim>] [-c<comma>] [-p] [-o <outfile>] [-i <infile>]', 0Ah
    usglen  equ $-usg
    iemsg   db  "csv: Can't open input file", 0Ah
    iemlen  equ $-iemsg
    oemsg   db  "csv: Can't create output file", 0Ah
    oemlen  equ $-oemsg

    section .bss
    ibuffer resb    BUFSIZE
    obuffer resb    BUFSIZE

    section .text
    align 4
    ierr:
        push    dword iemlen
        push    dword iemsg
        push    dword stderr
        sys.write
        push    dword 1     ; return failure
        sys.exit

    align 4
    oerr:
        push    dword oemlen
        push    dword oemsg
        push    dword stderr
        sys.write
        push    dword 2
        sys.exit

    align 4
    usage:
        push    dword usglen
        push    dword usg
        push    dword stderr
        sys.write
        push    dword 3
        sys.exit

    align 4
    global  _start
    _start:
        add esp, byte 8 ; discard argc and argv[0]
        mov edx, (',' << 8) | 9

    .arg:
        pop ecx
        or  ecx, ecx
        je  near .init      ; no more arguments

        ; ECX contains the pointer to an argument
        cmp byte [ecx], '-'
        jne usage

        inc ecx
        mov ax, [ecx]

    .o:
        cmp al, 'o'
        jne .i

        ; Make sure we are not asked for the output file twice
        cmp dword [fd.out], stdout
        jne usage

        ; Find the path to output file - it is either at [ECX+1],
        ; i.e., -ofile --
        ; or in the next argument,
        ; i.e., -o file

        inc ecx
        or  ah, ah
        jne .openoutput
        pop ecx
        jecxz   usage

    .openoutput:
        push    dword 420   ; file mode (644 octal)
        push    dword 0200h | 0400h | 01h
        ; O_CREAT | O_TRUNC | O_WRONLY
        push    ecx
        sys.open
        jc  near oerr

        add esp, byte 12
        mov [fd.out], eax
        jmp short .arg

    .i:
        cmp al, 'i'
        jne .p

        ; Make sure we are not asked twice
        cmp dword [fd.in], stdin
        jne near usage

        ; Find the path to the input file
        inc ecx
        or  ah, ah
        jne .openinput
        pop ecx
        or  ecx, ecx
        je near usage

    .openinput:
        push    dword 0     ; O_RDONLY
        push    ecx
        sys.open
        jc  near ierr       ; open failed

        add esp, byte 8
        mov [fd.in], eax
        jmp .arg

    .p:
        cmp al, 'p'
        jne .t
        or  ah, ah
        jne near usage
        or  edx, 1 << 31
        jmp .arg

    .t:
        cmp al, 't'     ; redefine output delimiter
        jne .c
        or  ah, ah
        je  near usage
        mov dl, ah
        jmp .arg

    .c:
        cmp al, 'c'
        jne near usage
        or  ah, ah
        je  near usage
        mov dh, ah
        jmp .arg

    align 4
    .init:
        sub eax, eax
        sub ebx, ebx
        sub ecx, ecx
        mov edi, obuffer

        ; See if we are to preserve the first line
        or  edx, edx
        js  .loop

    .firstline:
        ; get rid of the first line
        call    getchar
        cmp al, 0Ah
        jne .firstline

    .loop:
        ; read a byte from stdin
        call    getchar

        ; is it a comma (or whatever the user asked for)?
        cmp al, dh
        jne .quote

        ; Replace the comma with a tab (or whatever the user wants)
        mov al, dl

    .put:
        call    putchar
        jmp short .loop

    .quote:
        cmp al, '"'
        jne .put

        ; Print everything until you get another quote or EOL. If it
        ; is a quote, skip it. If it is EOL, print it.
    .qloop:
        call    getchar
        cmp al, '"'
        je  .loop

        cmp al, 0Ah
        je  .put

        call    putchar
        jmp short .qloop

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
        jecxz   .read
        call    write

    .read:
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
        jecxz   .ret    ; nothing to write
        sub edi, ecx    ; start of buffer
        push    ecx
        push    edi
        push    dword [fd.out]
        sys.write
        add esp, byte 12
        sub eax, eax
        sub ecx, ecx    ; buffer is empty now
    .ret:
        ret

Vieles daraus ist aus ``hex.asm`` entnommen worden. Aber es gibt einen
wichtigen Unterschied: Ich rufe nicht l?nger ``write`` auf, wann immer
ich eine Zeilenvorschub ausgebe. Nun kann der Code sogar interaktiv
genutzt werden.

Ich habe eine bessere L?sung gefunden f?r das Interaktivit?tsproblem
seit ich mit dem Schreiben dieses Kapitels begonnen habe. Ich wollte
sichergehen, da? jede Zeile einzeln ausgegeben werden kann, falls
erforderlich. Aber schlussendlich gibt es keinen Bedarf jede Zeile
einzeln auszugeben, falls nicht-interaktiv genutzt.

Die neue L?sung besteht darin, die Funktion ``write`` jedesmal
aufzurufen, wenn ich den Eingabepuffer leer vorfinde. Auf diesem Wege
liest das Programm im interaktiven Modus eine Zeile aus der Tastatur des
Nutzers, verarbeitet sie und stellt fest, ob deren Eingabepuffer leer
ist, dann leert es seine Ausgabe und liest die n?chste Zeile.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.12.1.1. Die dunkle Seite des Buffering
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese ?nderung verhindert einen mysteri?sen Aufh?nger in einem
speziellen Fall. Ich bezeichne dies als die *dunkle Seite des
Buffering*, haupts?chlich, weil es eine nicht offensichtliche Gefahr
darstellt.

Es ist unwahrscheinlich, da? dies mit dem csv-Programm oben geschieht
aber lassen Sie uns einen weiteren Filter betrachten: Nehmen wir an ihre
Eingabe sind rohe Daten, die Farbwerte darstellen, wie z.B. die
Intensit?t eines Pixel mit den Farben *rot*, *gr?n* und *blau*. Unsere
Ausgabe wird der negative Wert unserer Eingabe sein.

Solch ein Filter w?rde sehr einfach zu schreiben sein. Der gr??te Teil
davon w?rde so aussehen wie all die anderen Filter, die wir bisher
geschrieben haben, daher beziehe ich mich nur auf den Kern der Prozedur:

.. code:: programlisting

    .loop:
        call    getchar
        not al      ; Create a negative
        call    putchar
        jmp short .loop

Da dieser Filter mit rohen Daten arbeitet ist es unwahrscheinlich, da?
er interaktiv genutzt werden wird.

Aber das Programm k?nnte als Bildbearbeitungssoftware tituliert werden.
Wenn es nicht ``write`` vor jedem Aufruf von ``read`` durchf?hrt, ist
die M?glichkeit gegeben, das es sich aufh?ngt.

Dies k?nnte passieren:

.. raw:: html

   <div class="procedure">

#. Der Bildeditor wird unseren Filter laden mittels der C-Funktion
   ``popen()``.

#. Er wird die erste Zeile von Pixeln laden aus einer Bitmap oder
   Pixmap.

#. Er wird die erste Zeile von Pixeln geschrieben in die *Pipe*, welche
   zur Variable ``fd.in`` unseres Filters f?hrt.

#. Unser Filter wird jeden Pixel auslesen von der Eingabe, in in seinen
   negativen Wert umkehren und ihn in den Ausgabepuffer schreiben.

#. Unser Filter wird die Funktion ``getchar`` aufrufen, um das n?chste
   Pixel abzurufen.

#. Die Funktion ``getchar`` wird einen leeren Eingabepuffer vorfinden
   und daher die Funktion ``read`` aufrufen.

#. ``read`` wird den Systemaufruf ``SYS_read`` starten.

#. Der *Kernel* wird unseren Filter unterbrechen, bis der Bildeditor
   mehr Daten zur Pipe sendet.

#. Der Bildedior wird aus der anderen Pipe lesen, welche verbunden ist
   mit ``fd.out`` unseres Filters, damit er die erste Zeile des
   auszugebenden Bildes setzen kann *bevor* er uns die zweite Zeile der
   Eingabe einliest.

#. Der *Kernel* unterbricht den Bildeditor, bis er eine Ausgabe unseres
   Filters erh?lt, um ihn an den Bildeditor weiterzureichen.

.. raw:: html

   </div>

An diesem Punkt wartet unser Filter auf den Bildeditor, da? er ihm mehr
Daten zur Verarbeitung schicken m?ge. Gleichzeitig wartet der Bildeditor
darauf, da? unser Filter das Resultat der Berechnung ersten Zeile
sendet. Aber das Ergebnis sitzt in unserem Ausgabepuffer.

Der Filter und der Bildeditor werden fortfahren bis in die Ewigkeit
aufeinander zu warten (oder zumindest bis sie per kill entsorgt werden).
Unsere Software hat den eine `Race
Condition <secure-race-conditions.html>`__ erreicht.

Das Problem tritt nicht auf, wenn unser Filter seinen Ausgabepuffer
leert *bevor* er vom *Kernel* mehr Eingabedaten anfordert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------------+--------------------------------+
| `Zur?ck <x86-files.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-fpu.html>`__   |
+--------------------------------+-------------------------------+--------------------------------+
| 11.11. Arbeiten mit Dateien?   | `Zum Anfang <index.html>`__   | ?11.13. Die FPU verwenden      |
+--------------------------------+-------------------------------+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
