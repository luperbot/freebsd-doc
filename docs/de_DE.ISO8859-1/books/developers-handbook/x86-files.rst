===========================
11.11. Arbeiten mit Dateien
===========================

.. raw:: html

   <div class="navheader">

11.11. Arbeiten mit Dateien
`Zur?ck <x86-environment.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-one-pointed-mind.html>`__

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

11.11. Arbeiten mit Dateien
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Paul Keller und Fabian Borschel.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir haben bereits einfache Arbeiten mit Dateien gemacht: Wir wissen wie
wir sie ?ffnen und schliessen, oder wie man sie mit Hilfe von Buffern
liest und schreibt. Aber UNIX? bietet viel mehr Funktionalit?t wenn es
um Dateien geht. Wir werden einige von ihnen in dieser Sektion
untersuchen und dann mit einem netten Datei Konvertierungs Werkzeug
abschliessen.

In der Tat, Lasst uns am Ende beginnen, also mit dem Datei
Konvertierungs Werkzeug. Es macht Programmieren immer einfacher, wenn
wir bereits am Anfang wissen was das End Produkt bezwecken soll.

Eines der ersten Programme die ich f?r UNIX? schrieb war `
tuc <ftp://ftp.int80h.org/unix/tuc/>`__, ein Text-Zu-UNIX? Datei
Konvertierer. Es konvertiert eine Text Datei von einem anderen
Betriebssystem zu einer UNIX? Text Datei. Mit anderen Worten, es ?ndert
die verschiedenen Arten von Zeilen Begrenzungen zu der Zeilen
Begrenzungs Konvention von UNIX?. Es speichert die Ausgabe in einer
anderen Datei. Optional konvertiert es eine UNIX? Text Datei zu einer
DOS Text Datei.

Ich habe tuc sehr oft benutzt, aber nur von irgendeinem anderen OS nach
UNIX? zu konvertieren, niemals anders herum. Ich habe mir immer
gew?nscht das die Datei einfach ?berschrieben wird anstatt das ich die
Ausgabe in eine andere Datei senden muss. Meistens, habe ich diesen
Befehl verwendet:

.. code:: screen

    % tuc myfile tempfile
    % mv tempfile myfile

Es w?re sch? ein ftuc zu haben, also, *fast tuc*, und es so zu benutzen:

.. code:: screen

    % ftuc myfile

In diesem Kapitel werden wir dann, ftuc in Assembler schreiben (das
Original tuc ist in C), und verschiedene Datei-Orientierte Kernel
Dienste in dem Prozess studieren.

Auf erste Sicht, ist so eine Datei Konvertierung sehr simpel: Alles was
du zu tun hast, ist die Wagenr?ckl?ufe zu entfernen, richtig?

Wenn du mit ja geantwortet hast, denk nochmal dar?ber nach: Dieses
Vorgehen wird die meiste Zeit funktionieren (zumindest mit MSDOS Text
Dateien), aber gelegentlich fehlschlagen.

Das Problem ist das nicht alle UNIX? Text Dateien ihre Zeilen mit einer
Wagen R?cklauf / Zeilenvorschub Sequenz beenden. Manche benutzen
Wagenr?cklauf ohne Zeilenvorschub. Andere kombinieren mehrere leere
Zeilen in einen einzigen Wagenr?cklauf gefolgt von mehreren
Zeilenvorsch?ben. Und so weiter.

Ein Text Datei Konvertierer muss dann also in der Lage sein mit allen
m?glichen Zeilenenden umzugehen:

.. raw:: html

   <div class="itemizedlist">

-  Wagenr?cklauf / Zeilenvorschub

-  Wagenr?cklauf

-  Zeilenvorschub / Wagenr?cklauf

-  Zeilenvorschub

.. raw:: html

   </div>

Es sollte au?erdem in der Lage sein mit Dateien umzugehen die irgendeine
Art von Kombination der oben stehenden M?glichkeiten verwendet. (z.B.,
Wagenr?cklauf gefolgt von mehreren Zeilenvorsch?ben).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.11.1. Endlicher Zustandsautomat
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Problem wird einfach gel?st in dem man eine Technik benutzt die sich
*Endlicher Zustandsautomat* nennt, urspr?nglich wurde sie von den
Designern digitaler elektronischer Schaltkreise entwickelt. Eine
*Endlicher Zustandsautomat* ist ein digitaler Schaltkreis dessen Ausgabe
nicht nur von der Eingabe abh?ngig ist sondern auch von der vorherigen
Eingabe, d.h., von seinem Status. Der Mikroprozessor ist ein Beispiel
f?r einen *Endlichen Zustandsautomaten* : Unser Assembler Sprach Code
wird zu Maschinensprache ?bersetzt in der manche Assembler Sprach Codes
ein einzelnes Byte produzieren, w?hrend andere mehrere Bytes
produzieren. Da der Microprozessor die Bytes einzeln aus dem Speicher
liest, ?ndern manche nur seinen Status anstatt eine Ausgabe zu
produzieren. Wenn alle Bytes eines OP Codes gelesen wurden, produziert
der Mikroprozessor eine Ausgabe, oder ?ndert den Wert eines Registers,
etc.

Aus diesem Grund, ist jede Software eigentlich nur eine Sequenz von
Status Anweisungen f?r den Mikroprozessor. Dennoch, ist das Konzept
eines *Endlichen Zustandsautomaten* auch im Software Design sehr
hilfreich.

Unser Text Datei Konvertierer kann als *Endlicher Zustandsautomat* mit 3
m?glichen Stati desgined werden. Wir k?nnten diese von 0-2 benennen,
aber es wird uns das Leben leichter machen wenn wir ihnen symbolische
Namen geben:

.. raw:: html

   <div class="itemizedlist">

-  ordinary

-  cr

-  lf

.. raw:: html

   </div>

Unser Programm wird in dem ordinary Status starten. W?hrend dieses
Status, h?ngt die Aktion des Programms von seiner Eingabe wie folgt ab:

.. raw:: html

   <div class="itemizedlist">

-  Wenn die Eingabe etwas anderes als ein Wagenr?cklauf oder einem
   Zeilenvorschub ist, wird die Eingabe einfach nur an die Ausgabe
   geschickt. Der Status bleibt unver?ndert.

-  Wenn die Eingabe ein Wagenr?cklauf ist, wird der Status auf cr
   gesetzt. Die Eingabe wird dann verworfen, d.h., es entsteht keine
   Ausgabe.

-  Wenn die Eingabe ein Zeilenvorschub ist, wird der Status auf lf
   gesetzt. Die Eingabe wird dann verworfen.

.. raw:: html

   </div>

Wann immer wir in dem cr Status sind, ist das weil die letzte Eingabe
ein Wagenr?cklauf war, welcher nicht verarbeitet wurde. Was unsere
Software in diesem Status macht h?ngt von der aktuellen Eingabe ab:

.. raw:: html

   <div class="itemizedlist">

-  Wenn die Eingabe irgendetwas anderes als ein Wagenr?cklauf oder ein
   Zeilenvorschub ist, dann gib einen Zeilenvorschub aus, dann gib die
   Eingabe aus und dann ?ndere den Status zu ordinary.

-  Wenn die Eingabe ein Wagenr?cklauf ist, haben wir zwei (oder mehr)
   Wagenr?ckl?ufe in einer Reihe. Wir verwerfen die Eingabe, wir geben
   einen Zeilenvorschub aus und lassen den Status unver?ndert.

-  Wenn die Eingabe ein Zeilenvorschub ist, geben wir den Zeilenvorschub
   aus und ?ndern den Status zu ordinary. Achte darauf, dass das nicht
   das gleiche wie in dem Fall oben dr?ber ist – w?rden wir versuchen
   beide zu kombinieren, w?rden wir zwei Zeilenvorsch?be anstatt einen
   ausgeben.

.. raw:: html

   </div>

Letztendlich, sind wir in dem lf Status nachdem wir einen Zeilenvorschub
empfangen haben der nicht nach einem Wagenr?cklauf kam. Das wird
passieren wenn unsere Datei bereits im UNIX? Format ist, oder jedesmal
wenn mehrere Zeilen in einer Reihe durch einen einzigen Wagenr?cklauf
gefolgt von mehreren Zeilenvorsch?ben ausgedr?ckt wird, oder wenn die
Zeile mit einer Zeilenvorschub / Wagenr?cklauf Sequenz endet. Wir
sollten mit unserer Eingabe in diesem Status folgenderma?en umgehen:

.. raw:: html

   <div class="itemizedlist">

-  Wenn die Eingabe irgendetwas anderes als ein Wagenr?cklauf oder ein
   Zeilenvorschub ist, geben wir einen Zeilenvorschub aus, geben dann
   die Eingabe aus und ?ndern dann den Status zu ordinary. Das ist exakt
   die gleiche Aktion wie in dem cr Status nach dem Empfangen der selben
   Eingabe.

-  Wenn die Eingabe ein Wagenr?cklauf ist, verwerfen wir die Eingabe,
   geben einen Zeilenvorschub aus und ?ndern dann den Status zu
   ordinary.

-  Wenn die Eingabe ein Zeilenvorschub ist, geben wir den Zeilenvorschub
   aus und lassen den Status unver?ndert.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.11.1.1. Der Endg?ltige Status
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der obige *Endliche Zustandsautomat* funktioniert f?r die gesamte Datei,
aber l?sst die M?glichkeit das die letzte Zeile ignoriert wird. Das wird
jedesmal passieren wenn die Datei mit einem einzigen Wagenr?cklauf oder
einem einzigen Zeilenvorschub endet. Daran habe ich nicht gedacht als
ich tuc schrieb, nur um festzustellen, da? das letzte Zeilenende
gelegentlich weggelassen wird.

Das Problem wird einfach dadurch gel?st, indem man den Status ?berpr?ft
nachdem die gesamte Datei verarbeitet wurde. Wenn der Status nicht
ordinary ist, m?ssen wir nur den letzten Zeilenvorschub ausgeben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Nachdem wir unseren Algorithmus nun als einen *Endlichen
Zustandsautomaten* formuliert haben, k?nnten wir einfach einen
festgeschalteten digitalen elektronischen Schaltkreis (einen "Chip")
designen, der die Umwandlung f?r uns ?bernimmt. Nat?rlich w?re das sehr
viel teurer, als ein Assembler Programm zu schreiben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.11.1.2. Der Ausgabe Z?hler
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weil unser Datei Konvertierungs Programm m?glicherweise zwei Zeichen zu
einem kombiniert, m?ssen wir einen Ausgabe Z?hler verwenden. Wir
initialisieren den Z?hler zu ``0`` und erh?hen ihn jedes mal wenn wir
ein Zeichen an die Ausgabe schicken. Am Ende des Programms, wird der
Z?hler uns sagen auf welche Gr?sse wir die Datei setzen m?ssen.

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

11.11.2. Implementieren von EZ als Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der schwerste Teil beim arbeiten mit einer *Endlichen Zustandsmaschine*
ist das analysieren des Problems und dem ausdr?cken als eine *Endliche
Zustandsmaschine*. That geschafft, schreibt sich die Software fast wie
von selbst.

In eine h?heren Sprache, wie etwa C, gibt es mehrere Hauptans?tze. Einer
w?re ein ``switch`` Angabe zu verwenden die ausw?hlt welche Funktion
genutzt werden soll. Zum Beispiel,

.. code:: programlisting

        switch (state) {
        default:
        case REGULAR:
            regular(inputchar);
            break;
        case CR:
            cr(inputchar);
            break;
        case LF:
            lf(inputchar);
            break;
        }
          

Ein anderer Ansatz ist es ein Array von Funktions Zeigern zu benutzen,
etwa wie folgt:

.. code:: programlisting

        (output[state])(inputchar);
          

Noch ein anderer ist es aus ``state`` einen Funktions Zeiger zu machen
und ihn zu der entsprechenden Funktion zeigen zu lassen:

.. code:: programlisting

        (*state)(inputchar);
          

Das ist der Ansatz den wir in unserem Programm verwenden werden, weil es
in Assembler sehr einfach und schnell geht. Wir werden einfach die
Adresse der Prozedur in ``EBX`` speichern und dann einfach das ausgeben:

.. code:: programlisting

        call    ebx
          

Das ist wahrscheinlich schneller als die Adresse im Code zu hardcoden
weil der Mikroprozessor die Adresse nicht aus dem Speicher lesen muss—es
ist bereits in einer der Register gespeichert. Ich sagte
*wahrscheinlich* weil durch das Cachen neuerer Mikroprozessoren beide
Varianten in etwa gleich schnell sind.

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

11.11.3. Speicher abgebildete Dateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weil unser Programm nur mit einzelnen Dateien funktioniert, k?nnen wir
nicht den Ansatz verwedenden der zuvor funktioniert hat, d.h., von einer
Eingabe Datei zu lesen und in eine Ausgabe Datei zu schreiben.

UNIX? erlaubt es uns eine Datei, oder einen Bereich einer Datei, in den
Speicher abzubilden. Um das zu tun, m?ssen wir zuerst eine Datei mit den
entsprechenden Lese/Schreib Flags ?ffnen. Dann benutzen wir den ``mmap``
system call um sie in den Speicher abzubilden. Ein Vorteil von ``mmap``
ist, das es automatisch mit virtuellem Speicher arbeitet: Wir k?nnen
mehr von der Datei im Speicher abbilden als wir ?berhaupt physikalischen
Speicher zur Verf?gung haben, noch immer haben wir aber durch normale OP
Codes wie ``mov``, ``lods``, und ``stos`` Zugriff darauf. Egal welche
?nderungen wir an dem Speicherabbild der Datei vornehmen, sie werden vom
System in die Datei geschrieben. Wir m?ssen die Datei nicht offen
lassen: So lange sie abgebildet bleibt, k?nnen wir von ihr lesen und in
sie schreiben.

Ein 32-bit Intel Mikroprozessor kann auf bis zu vier Gigabyte Speicher
zugreifen – physisch oder virtuell. Das FreeBSD System erlaubt es uns
bis zu der H?lfte f?r die Datei Abbildung zu verwenden.

Zur Vereinfachung, werden wir in diesem Tutorial nur Dateien
konvertieren die in ihrere Gesamtheit im Speicher abgebildet werden
k?nnen. Es gibt wahrscheinlich nicht all zu viele Text Dateien die eine
Gr?sse von zwei Gigabyte ?berschreiben. Falls unser Programm doch auf
eine trifft, wird es einfach eine Meldung anzeigen mit dem Vorschlag das
originale tuc statt dessen zu verwenden.

Wenn du deine Kopie von ``syscalls.master`` ?berpr?fst, wirst du zwei
verschiedene Systemaufrufe finden die sich ``mmap`` nennen. Das kommt
von der Entwicklung von UNIX?: Es gab das traditionelle BSD ``mmap``,
Systemaufruf 71. Dieses wurde durch das POSIX? ``mmap`` ersetzt,
Systemaufruf 197. Das FreeBSD System unterst?tzt beide, weil ?ltere
Programme mit der originalen BSD Version geschrieben wurden. Da neue
Software die POSIX? Version nutzt, werden wir diese auch verwenden.

Die ``syscalls.master`` Datei zeigt die POSIX? Version wie folgt:

.. code:: programlisting

    197 STD BSD { caddr_t mmap(caddr_t addr, size_t len, int prot, \
                    int flags, int fd, long pad, off_t pos); }
          

Das weicht etwas von dem ab was
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2>`__
sagt. Das ist weil
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2>`__
die C Version beschreibt.

Der Unterschiede liegt in dem ``long pad`` Argument, welches in der C
Version nicht vorhanden ist. Wie auch immer, der FreeBSD Systemaufruf
f?gt einen 32-bit Block ein nachdem es ein 64-Bit Argument auf den Stack
ge\ ``push``\ t hat. In diesem Fall, ist ``off_t`` ein 64-Bit Wert.

Wenn wir fertig sind mit dem Arbeiten einer im Speicher abgebildeten
Datei, entfernen wir das Speicherabbild mit dem ``munmap`` Systemaufruf:

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

F?r eine detailliert Behandlung von ``mmap``, sieh in W. Richard
Stevens' `Unix Network Programming, Volume 2, Chapter
12 <http://www.int80h.org/cgi-bin/isbn?isbn=0130810819>`__ nach.

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

11.11.4. Feststellen der Datei Gr?sse
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weil wir ``mmap`` sagen m?ssen wie viele Bytes von Datei wir im Speicher
abbilden wollen und wir au?erdem die gesamte Datei abbilden wollen,
m?ssen wir die Gr?sse der Datei feststellen.

Wir k?nnen den ``fstat`` Systemaufruf verwenden um alle Informationen
?ber eine ge?ffnete Datei zu erhalten die uns das System geben kann. Das
beinhaltet die Datei Gr?sse.

Und wieder, zeigt uns ``syscalls.master`` zwei Versionen von ``fstat``,
eine traditionelle (Systemaufruf 62), und eine POSIX? (Systemaufruf 189)
Variante. Nat?rlich, verwenden wir die POSIX? Version:

.. code:: programlisting

    189 STD POSIX   { int fstat(int fd, struct stat *sb); }
          

Das ist ein sehr unkomplizierter Aufruf: Wir ?bergeben ihm die Adresse
einer ``stat`` Structure und den Deskriptor einer ge?ffneten Datei. Es
wird den Inhalt der ``stat`` Struktur ausf?llen.

Ich muss allerdings sagen, das ich versucht habe die ``stat`` Struktur
in dem ``.bss`` Bereich zu deklarieren, und ``fstat`` mochte es nicht:
Es setzte das Carry Flag welches einen Fehler anzeigt. Nachdem ich den
Code ver?nderte so dass er die Struktur auf dem Stack anlegt, hat alles
gut funktioniert.

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

11.11.5. ?ndern der Dateigr?sse
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dadurch das unser Programm Wagenr?cklauf/Zeilenvorschub-Sequenzen in
einfache Zeilenvorsch?be zusammenfassen k?nnte, k?nnte unsere Ausgabe
kleiner sein als unsere Eingabe. Und da wir die Ausgabe in dieselbe
Datei um, aus der wir unsere Eingabe erhalten, m?ssen wir eventuell die
Dateigr?sse anpassen.

Der Systemaufruf ``ftruncate`` erlaubt uns, dies zu tun. Abgesehen von
dem etwas ungl?cklich gew?hlten Namen ``ftruncate`` k?nnen wir mit
dieser Funktion eine Datei vergr?ssern, oder verkleinern.

Und ja, wir werden zwei Versionen von ``ftruncate`` in
``syscalls.master`` finden, eine ?ltere (130) und eine neuere (201). Wir
werden die neuere Version verwenden:

.. code:: programlisting

    201 STD BSD { int ftruncate(int fd, int pad, off_t length); }
          

Beachten Sie bitte, dass hier wieder ``int     pad`` verwendet wird.

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

11.11.6. ftuc
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir wissen jetzt alles n?tige, um ftuc zu schreiben. Wir beginnen, indem
wir ein paar neue Zeilen der Datei ``system.inc`` hinzuf?gen. Als erstes
definieren wir irgendwo am Anfang der Datei einige Konstanten und
Strukturen:

.. code:: programlisting

    ;;;;;;; open flags
    %define O_RDONLY    0
    %define O_WRONLY    1
    %define O_RDWR  2

    ;;;;;;; mmap flags
    %define PROT_NONE   0
    %define PROT_READ   1
    %define PROT_WRITE  2
    %define PROT_EXEC   4
    ;;
    %define MAP_SHARED  0001h
    %define MAP_PRIVATE 0002h

    ;;;;;;; stat structure
    struc   stat
    st_dev      resd    1   ; = 0
    st_ino      resd    1   ; = 4
    st_mode     resw    1   ; = 8, size is 16 bits
    st_nlink    resw    1   ; = 10, ditto
    st_uid      resd    1   ; = 12
    st_gid      resd    1   ; = 16
    st_rdev     resd    1   ; = 20
    st_atime    resd    1   ; = 24
    st_atimensec    resd    1   ; = 28
    st_mtime    resd    1   ; = 32
    st_mtimensec    resd    1   ; = 36
    st_ctime    resd    1   ; = 40
    st_ctimensec    resd    1   ; = 44
    st_size     resd    2   ; = 48, size is 64 bits
    st_blocks   resd    2   ; = 56, ditto
    st_blksize  resd    1   ; = 64
    st_flags    resd    1   ; = 68
    st_gen      resd    1   ; = 72
    st_lspare   resd    1   ; = 76
    st_qspare   resd    4   ; = 80
    endstruc
          

Wir definieren die neuen Systemaufrufe:

.. code:: programlisting

    %define SYS_mmap    197
    %define SYS_munmap  73
    %define SYS_fstat   189
    %define SYS_ftruncate   201
          

Wir f?gen die Makros hinzu:

.. code:: programlisting

    %macro  sys.mmap    0
        system  SYS_mmap
    %endmacro

    %macro  sys.munmap  0
        system  SYS_munmap
    %endmacro

    %macro  sys.ftruncate   0
        system  SYS_ftruncate
    %endmacro

    %macro  sys.fstat   0
        system  SYS_fstat
    %endmacro
          

Und hier ist unser Code:

.. code:: programlisting

    ;;;;;;; Fast Text-to-Unix Conversion (ftuc.asm) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;
    ;; Started: 21-Dec-2000
    ;; Updated: 22-Dec-2000
    ;;
    ;; Copyright 2000 G. Adam Stanislav.
    ;; All rights reserved.
    ;;
    ;;;;;;; v.1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    %include    'system.inc'

    section .data
        db  'Copyright 2000 G. Adam Stanislav.', 0Ah
        db  'All rights reserved.', 0Ah
    usg db  'Usage: ftuc filename', 0Ah
    usglen  equ $-usg
    co  db  "ftuc: Can't open file.", 0Ah
    colen   equ $-co
    fae db  'ftuc: File access error.', 0Ah
    faelen  equ $-fae
    ftl db  'ftuc: File too long, use regular tuc instead.', 0Ah
    ftllen  equ $-ftl
    mae db  'ftuc: Memory allocation error.', 0Ah
    maelen  equ $-mae

    section .text

    align 4
    memerr:
        push    dword maelen
        push    dword mae
        jmp short error

    align 4
    toolong:
        push    dword ftllen
        push    dword ftl
        jmp short error

    align 4
    facerr:
        push    dword faelen
        push    dword fae
        jmp short error

    align 4
    cantopen:
        push    dword colen
        push    dword co
        jmp short error

    align 4
    usage:
        push    dword usglen
        push    dword usg

    error:
        push    dword stderr
        sys.write

        push    dword 1
        sys.exit

    align 4
    global  _start
    _start:
        pop eax     ; argc
        pop eax     ; program name
        pop ecx     ; file to convert
        jecxz   usage

        pop eax
        or  eax, eax    ; Too many arguments?
        jne usage

        ; Open the file
        push    dword O_RDWR
        push    ecx
        sys.open
        jc  cantopen

        mov ebp, eax    ; Save fd

        sub esp, byte stat_size
        mov ebx, esp

        ; Find file size
        push    ebx
        push    ebp     ; fd
        sys.fstat
        jc  facerr

        mov edx, [ebx + st_size + 4]

        ; File is too long if EDX != 0 ...
        or  edx, edx
        jne near toolong
        mov ecx, [ebx + st_size]
        ; ... or if it is above 2 GB
        or  ecx, ecx
        js  near toolong

        ; Do nothing if the file is 0 bytes in size
        jecxz   .quit

        ; Map the entire file in memory
        push    edx
        push    edx     ; starting at offset 0
        push    edx     ; pad
        push    ebp     ; fd
        push    dword MAP_SHARED
        push    dword PROT_READ | PROT_WRITE
        push    ecx     ; entire file size
        push    edx     ; let system decide on the address
        sys.mmap
        jc  near memerr

        mov edi, eax
        mov esi, eax
        push    ecx     ; for SYS_munmap
        push    edi

        ; Use EBX for state machine
        mov ebx, ordinary
        mov ah, 0Ah
        cld

    .loop:
        lodsb
        call    ebx
        loop    .loop

        cmp ebx, ordinary
        je  .filesize

        ; Output final lf
        mov al, ah
        stosb
        inc edx

    .filesize:
        ; truncate file to new size
        push    dword 0     ; high dword
        push    edx     ; low dword
        push    eax     ; pad
        push    ebp
        sys.ftruncate

        ; close it (ebp still pushed)
        sys.close

        add esp, byte 16
        sys.munmap

    .quit:
        push    dword 0
        sys.exit

    align 4
    ordinary:
        cmp al, 0Dh
        je  .cr

        cmp al, ah
        je  .lf

        stosb
        inc edx
        ret

    align 4
    .cr:
        mov ebx, cr
        ret

    align 4
    .lf:
        mov ebx, lf
        ret

    align 4
    cr:
        cmp al, 0Dh
        je  .cr

        cmp al, ah
        je  .lf

        xchg    al, ah
        stosb
        inc edx

        xchg    al, ah
        ; fall through

    .lf:
        stosb
        inc edx
        mov ebx, ordinary
        ret

    align 4
    .cr:
        mov al, ah
        stosb
        inc edx
        ret

    align 4
    lf:
        cmp al, ah
        je  .lf

        cmp al, 0Dh
        je  .cr

        xchg    al, ah
        stosb
        inc edx

        xchg    al, ah
        stosb
        inc edx
        mov ebx, ordinary
        ret

    align 4
    .cr:
        mov ebx, ordinary
        mov al, ah
        ; fall through

    .lf:
        stosb
        inc edx
        ret
          

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Verwenden Sie dieses Programm nicht mit Dateien, die sich auf
Datentr?gern befinden, welche mit MS-DOS? oder Windows? formatiert
wurden. Anscheinend gibt es im Code von FreeBSD einen subtilen Bug, wenn
``mmap`` auf solchen Datentr?gern verwendet wird: Wenn die Datei eine
bestimmte Gr?sse ?berschreitet, f?llt ``mmap`` den Speicher mit lauter
Nullen, und ?berschreibt damit anschliessend den Dateiinhalt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+---------------------------------------------+
| `Zur?ck <x86-environment.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-one-pointed-mind.html>`__   |
+--------------------------------------+-------------------------------+---------------------------------------------+
| 11.10. Die UNIX?-Umgebung?           | `Zum Anfang <index.html>`__   | ?11.12. One-Pointed Mind                    |
+--------------------------------------+-------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
