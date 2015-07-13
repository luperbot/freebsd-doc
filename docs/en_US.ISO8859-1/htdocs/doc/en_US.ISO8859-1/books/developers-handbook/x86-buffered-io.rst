===============================
11.8.?Buffered Input and Output
===============================

.. raw:: html

   <div class="navheader">

11.8.?Buffered Input and Output
`Prev <x86-unix-filters.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-command-line.html>`__

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

11.8.?Buffered Input and Output
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We can improve the efficiency of our code by buffering our input and
output. We create an input buffer and read a whole sequence of bytes at
one time. Then we fetch them one by one from the buffer.

We also create an output buffer. We store our output in it until it is
full. At that time we ask the kernel to write the contents of the buffer
to ``stdout``.

The program ends when there is no more input. But we still need to ask
the kernel to write the contents of our output buffer to ``stdout`` one
last time, otherwise some of our output would make it to the output
buffer, but never be sent out. Do not forget that, or you will be
wondering why some of your output is missing.

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

We now have a third section in the source code, named ``.bss``. This
section is not included in our executable file, and, therefore, cannot
be initialized. We use ``resb`` instead of ``db``. It simply reserves
the requested size of uninitialized memory for our use.

We take advantage of the fact that the system does not modify the
registers: We use registers for what, otherwise, would have to be global
variables stored in the ``.data`` section. This is also why the UNIX?
convention of passing parameters to system calls on the stack is
superior to the Microsoft convention of passing them in the registers:
We can keep the registers for our own use.

We use ``EDI`` and ``ESI`` as pointers to the next byte to be read from
or written to. We use ``EBX`` and ``ECX`` to keep count of the number of
bytes in the two buffers, so we know when to dump the output to, or read
more input from, the system.

Let us see how it works now:

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    Here I come!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A
    ^D %

Not what you expected? The program did not print the output until we
pressed **``^D``**. That is easy to fix by inserting three lines of code
to write the output every time we have converted a new line to ``0A``. I
have marked the three lines with > (do not copy the > in your
``hex.asm``).

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

Now, let us see how it works:

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A
    Here I come!
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A
    ^D %

Not bad for a 644-byte executable, is it!

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This approach to buffered input/output still contains a hidden danger. I
will discuss—and fix—it later, when I talk about the `dark side of
buffering <x86-one-pointed-mind.html#x86-buffered-dark-side>`__.

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

11.8.1.?How to Unread a Character
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

This may be a somewhat advanced topic, mostly of interest to programmers
familiar with the theory of compilers. If you wish, you may `skip to the
next section <x86-command-line.html>`__, and perhaps read this later.

.. raw:: html

   </div>

While our sample program does not require it, more sophisticated filters
often need to look ahead. In other words, they may need to see what the
next character is (or even several characters). If the next character is
of a certain value, it is part of the token currently being processed.
Otherwise, it is not.

For example, you may be parsing the input stream for a textual string
(e.g., when implementing a language compiler): If a character is
followed by another character, or perhaps a digit, it is part of the
token you are processing. If it is followed by white space, or some
other value, then it is not part of the current token.

This presents an interesting problem: How to return the next character
back to the input stream, so it can be read again later?

One possible solution is to store it in a character variable, then set a
flag. We can modify ``getchar`` to check the flag, and if it is set,
fetch the byte from that variable instead of the input buffer, and reset
the flag. But, of course, that slows us down.

The C language has an ``ungetc()`` function, just for that purpose. Is
there a quick way to implement it in our code? I would like you to
scroll back up and take a look at the ``getchar`` procedure and see if
you can find a nice and fast solution before reading the next paragraph.
Then come back here and see my own solution.

The key to returning a character back to the stream is in how we are
getting the characters to start with:

First we check if the buffer is empty by testing the value of ``EBX``.
If it is zero, we call the ``read`` procedure.

If we do have a character available, we use ``lodsb``, then decrease the
value of ``EBX``. The ``lodsb`` instruction is effectively identical to:

.. code:: programlisting

        mov al, [esi]
        inc esi

The byte we have fetched remains in the buffer until the next time
``read`` is called. We do not know when that happens, but we do know it
will not happen until the next call to ``getchar``. Hence, to "return"
the last-read byte back to the stream, all we have to do is decrease the
value of ``ESI`` and increase the value of ``EBX``:

.. code:: programlisting

    ungetc:
        dec esi
        inc ebx
        ret

But, be careful! We are perfectly safe doing this if our look-ahead is
at most one character at a time. If we are examining more than one
upcoming character and call ``ungetc`` several times in a row, it will
work most of the time, but not all the time (and will be tough to
debug). Why?

Because as long as ``getchar`` does not have to call ``read``, all of
the pre-read bytes are still in the buffer, and our ``ungetc`` works
without a glitch. But the moment ``getchar`` calls ``read``, the
contents of the buffer change.

We can always rely on ``ungetc`` working properly on the last character
we have read with ``getchar``, but not on anything we have read before
that.

If your program reads more than one byte ahead, you have at least two
choices:

If possible, modify the program so it only reads one byte ahead. This is
the simplest solution.

If that option is not available, first of all determine the maximum
number of characters your program needs to return to the input stream at
one time. Increase that number slightly, just to be sure, preferably to
a multiple of 16—so it aligns nicely. Then modify the ``.bss`` section
of your code, and create a small "spare" buffer right before your input
buffer, something like this:

.. code:: programlisting

    section .bss
        resb    16  ; or whatever the value you came up with
    ibuffer resb    BUFSIZE
    obuffer resb    BUFSIZE

You also need to modify your ``ungetc`` to pass the value of the byte to
unget in ``AL``:

.. code:: programlisting

    ungetc:
        dec esi
        inc ebx
        mov [esi], al
        ret

With this modification, you can call ``ungetc`` up to 17 times in a row
safely (the first call will still be within the buffer, the remaining 16
may be either within the buffer or within the "spare").

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+---------------------------------------+
| `Prev <x86-unix-filters.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-command-line.html>`__   |
+-------------------------------------+-------------------------+---------------------------------------+
| 11.7.?Writing UNIX? Filters?        | `Home <index.html>`__   | ?11.9.?Command Line Arguments         |
+-------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
