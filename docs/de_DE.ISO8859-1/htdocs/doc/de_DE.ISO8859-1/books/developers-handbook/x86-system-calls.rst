===================
11.3. Systemaufrufe
===================

.. raw:: html

   <div class="navheader">

11.3. Systemaufrufe
`Zur?ck <x86-the-tools.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-return-values.html>`__

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

11.3. Systemaufrufe
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

11.3.1. Standard-Aufrufkonvention
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Standardm??ig benutzt der FreeBSD-Kernel die C-Aufrufkonvention.
Weiterhin wird, obwohl auf den Kernel durch ``int 80h`` zugegriffen
wird, angenommen, dass das Programm eine Funktion aufruft, die
``int 80h`` verwendet, anstatt ``int 80h`` direkt aufzurufen.

Diese Konvention ist sehr praktisch und der Microsoft?-Konvention von
MS-DOS? ?berlegen. Warum? Weil es die UNIX?-Konvention jedem Programm,
egal in welcher Sprache es geschrieben ist, erlaubt auf den Kernel
zuzugreifen.

Ein Assembler-Programm kann das ebenfalls. Beispielsweise k?nnten wir
eine Datei ?ffnen:

.. code:: programlisting

    kernel:
        int 80h ; Call kernel
        ret

    open:
        push    dword mode
        push    dword flags
        push    dword path
        mov eax, 5
        call    kernel
        add esp, byte 12
        ret

Das ist ein sehr sauberer und portabler Programmierstil. Wenn Sie das
Programm auf ein anderes UNIX? portieren, das einen anderen Interrupt
oder eie andere Art der Parameter?bergabe verwendet, m?ssen sie nur die
Prozedur kernel ?ndern.

Aber Assembler-Programmierer lieben es Taktzyklen zu schinden. Das obige
Beispiel ben?tigt eine ``call/ret``-Kombination. Das k?nnen wir
entfernen, indem wir einen weiteren Parameter mit ``push`` ?bergeben:

.. code:: programlisting

    open:
        push    dword mode
        push    dword flags
        push    dword path
        mov eax, 5
        push    eax     ; Or any other dword
        int 80h
        add esp, byte 16

Die Konstante ``5``, die wir in ``EAX`` ablegen, identifiziert die
Kernel-Funktion, die wir aufrufen. In diesem Fall ist das ``open``.

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

11.3.2. Alternative Aufruf-Konvention
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD ist ein extrem flexibles System. Es bietet noch andere Wege, um
den Kernel aufzurufen. Damit diese funktionieren muss allerdings die
Linux-Emulation installiert sein.

Linux ist ein UNIX?-artiges System. Allerdings verwendet dessen Kernel
die gleiche Systemaufruf-Konvention, bei der Parameter in Registern
abgelegt werden, wie MS-DOS?. Genau wie bei der UNIX?-Konvention wird
die Nummer der Funktion in ``EAX`` abgelegt. Allerdings werden die
Parameter nicht auf den Stack gelegt, sondern in die Register
``EBX, ECX, EDX, ESI, EDI,     EBP``:

.. code:: programlisting

    open:
        mov eax, 5
        mov ebx, path
        mov ecx, flags
        mov edx, mode
        int 80h

Diese Konvention hat einen gro?en Nachteil gegen?ber der von UNIX?, was
die Assembler-Programmierung angeht: Jedesmal, wenn Sie einen
Kernel-Aufruf machen, m?ssen Sie die Register ``push``\ en und sie
sp?ter ``pop``\ en. Das macht Ihren Code unf?rmiger und langsamer.
Dennoch l?sst FreeBSD ihnen die Wahl.

Wenn Sie sich f?r die Linux-Konvention entscheiden, m?ssen Sie es das
System wissen lassen. Nachdem ihr Programm ?bersetzt und gebunden wurde,
m?ssen Sie die ausf?hrbare Datei kennzeichnen:

.. code:: screen

    %
        brandelf -t Linux
        filename

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

11.3.3. Welche Konvention Sie verwenden sollten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie speziell f?r FreeBSD programmieren, sollten Sie die
UNIX?-Konvention verwenden: Diese ist schneller, Sie k?nnen globale
Variablen in Registern ablegen, Sie m?ssen die ausf?hrbare Datei nicht
kennzeichnen und Sie erzwingen nicht die Installation der
Linux-Emulation auf dem Zielsystem.

Wenn Sie portablen Programmcode erzeugen wollen, der auch unter Linux
funktioniert, wollen Sie den FreeBSD-Nutzern vielleicht dennoch den
effizientesten Programmcode bieten, der m?glich ist. Ich werde Ihnen
zeigen, wie Sie das erreichen k?nnen, nachdem ich die Grundlagen erkl?rt
habe.

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

11.3.4. Aufruf-Nummern
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um dem Kernel mitzuteilen welchen Dienst Sie aufrufen, legen Sie dessen
Nummer in ``EAX`` ab. Nat?rlich m?ssen Sie dazu wissen welche Nummer die
Richtige ist.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.3.4.1. Die Datei ``syscalls``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Nummer der Funktionen sind in der Datei ``syscalls`` aufgef?hrt.
Mittels ``locate syscalls`` finden Sie diese in verschiedenen Formaten,
die alle auf die gleiche Weise aus ``syscalls.master`` erzeugt werden.

Die Master-Datei f?r die UNIX?-Standard-Aufrufkonvention finden sie
unter ``/usr/src/sys/kern/syscalls.master``. Falls Sie die andere
Konvention, die im Linux-Emulations-Modus implementiert ist, verwenden
m?chten, lesen Sie bitte ``/usr/src/sys/i386/linux/syscalls.master``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

FreeBSD und Linux unterscheiden sich nicht nur in den
Aufrufkonventionen, sie haben teilweise auch verschiedene Nummern f?r
die gleiche Funktion.

.. raw:: html

   </div>

``syscalls.master`` beschreibt, wie der Aufruf gemacht werden muss:

.. code:: programlisting

    0  STD NOHIDE  { int nosys(void); } syscall nosys_args int
    1   STD NOHIDE  { void exit(int rval); } exit rexit_args void
    2   STD POSIX   { int fork(void); }
    3   STD POSIX   { ssize_t read(int fd, void *buf, size_t nbyte); }
    4   STD POSIX   { ssize_t write(int fd, const void *buf, size_t nbyte); }
    5   STD POSIX   { int open(char *path, int flags, int mode); }
    6   STD POSIX   { int close(int fd); }
    etc...

In der ersten Spalte steht die Nummer, die in ``EAX`` abgelegt werden
muss.

Die Spalte ganz rechts sagt uns welche Parameter wir ``push``\ en
m?ssen. Die Reihenfolge ist dabei *von rechts nach links*.

.. raw:: html

   <div class="informalexample">

Um beispielsweise eine Datei mittels ``open`` zu ?ffnen, m?ssen wir
zuerst den ``mode`` auf den Stack ``push``\ en, danach die ``flags``,
dann die Adresse an der der ``path`` gespeichert ist.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+------------------------------------------+
| `Zur?ck <x86-the-tools.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-return-values.html>`__   |
+------------------------------------+-------------------------------+------------------------------------------+
| 11.2. Die Werkzeuge?               | `Zum Anfang <index.html>`__   | ?11.4. R?ckgabewerte                     |
+------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
