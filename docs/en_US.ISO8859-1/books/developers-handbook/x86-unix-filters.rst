===========================
11.7.?Writing UNIX? Filters
===========================

.. raw:: html

   <div class="navheader">

11.7.?Writing UNIX? Filters
`Prev <x86-first-program.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-buffered-io.html>`__

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

11.7.?Writing UNIX? Filters
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A common type of UNIX? application is a filter—a program that reads data
from the ``stdin``, processes it somehow, then writes the result to
``stdout``.

In this chapter, we shall develop a simple filter, and learn how to read
from ``stdin`` and write to ``stdout``. This filter will convert each
byte of its input into a hexadecimal number followed by a blank space.

.. code:: programlisting

    %include    'system.inc'

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

In the data section we create an array called ``hex``. It contains the
16 hexadecimal digits in ascending order. The array is followed by a
buffer which we will use for both input and output. The first two bytes
of the buffer are initially set to ``0``. This is where we will write
the two hexadecimal digits (the first byte also is where we will read
the input). The third byte is a space.

The code section consists of four parts: Reading the byte, converting it
to a hexadecimal number, writing the result, and eventually exiting the
program.

To read the byte, we ask the system to read one byte from ``stdin``, and
store it in the first byte of the ``buffer``. The system returns the
number of bytes read in ``EAX``. This will be ``1`` while data is
coming, or ``0``, when no more input data is available. Therefore, we
check the value of ``EAX``. If it is ``0``, we jump to ``.done``,
otherwise we continue.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

For simplicity sake, we are ignoring the possibility of an error
condition at this time.

.. raw:: html

   </div>

The hexadecimal conversion reads the byte from the ``buffer`` into
``EAX``, or actually just ``AL``, while clearing the remaining bits of
``EAX`` to zeros. We also copy the byte to ``EDX`` because we need to
convert the upper four bits (nibble) separately from the lower four
bits. We store the result in the first two bytes of the buffer.

Next, we ask the system to write the three bytes of the buffer, i.e.,
the two hexadecimal digits and the blank space, to ``stdout``. We then
jump back to the beginning of the program and process the next byte.

Once there is no more input left, we ask the system to exit our program,
returning a zero, which is the traditional value meaning the program was
successful.

Go ahead, and save the code in a file named ``hex.asm``, then type the
following (the **``^D``** means press the control key and type **``D``**
while holding the control key down):

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A Here I come!
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A ^D %

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If you are migrating to UNIX? from MS-DOS?, you may be wondering why
each line ends with ``0A`` instead of ``0D 0A``. This is because UNIX?
does not use the cr/lf convention, but a "new line" convention, which is
``0A`` in hexadecimal.

.. raw:: html

   </div>

Can we improve this? Well, for one, it is a bit confusing because once
we have converted a line of text, our input no longer starts at the
beginning of the line. We can modify it to print a new line instead of a
space after each ``0A``:

.. code:: programlisting

    %include    'system.inc'

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

We have stored the space in the ``CL`` register. We can do this safely
because, unlike Microsoft??Windows?, UNIX? system calls do not modify
the value of any register they do not use to return a value in.

That means we only need to set ``CL`` once. We have, therefore, added a
new label ``.loop`` and jump to it for the next byte instead of jumping
at ``_start``. We have also added the ``.hex`` label so we can either
have a blank space or a new line as the third byte of the ``buffer``.

Once you have changed ``hex.asm`` to reflect these changes, type:

.. code:: screen

    % nasm -f elf hex.asm
    % ld -s -o hex hex.o
    % ./hex
    Hello, World!
    48 65 6C 6C 6F 2C 20 57 6F 72 6C 64 21 0A
    Here I come!
    48 65 72 65 20 49 20 63 6F 6D 65 21 0A
    ^D %

That looks better. But this code is quite inefficient! We are making a
system call for every single byte twice (once to read it, another time
to write the output).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+--------------------------------------+
| `Prev <x86-first-program.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-buffered-io.html>`__   |
+--------------------------------------+-------------------------+--------------------------------------+
| 11.6.?Our First Program?             | `Home <index.html>`__   | ?11.8.?Buffered Input and Output     |
+--------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
