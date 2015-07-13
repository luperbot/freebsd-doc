============================
11.9.?Command Line Arguments
============================

.. raw:: html

   <div class="navheader">

11.9.?Command Line Arguments
`Prev <x86-buffered-io.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-environment.html>`__

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

11.9.?Command Line Arguments
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Our hex program will be more useful if it can read the names of an input
and output file from its command line, i.e., if it can process the
command line arguments. But... Where are they?

Before a UNIX? system starts a program, it ``push``\ es some data on the
stack, then jumps at the ``_start`` label of the program. Yes, I said
jumps, not calls. That means the data can be accessed by reading
``[esp+offset]``, or by simply ``pop``\ ping it.

The value at the top of the stack contains the number of command line
arguments. It is traditionally called ``argc``, for "argument count."

Command line arguments follow next, all ``argc`` of them. These are
typically referred to as ``argv``, for "argument value(s)." That is, we
get ``argv[0]``, ``argv[1]``, ``...``, ``argv[argc-1]``. These are not
the actual arguments, but pointers to arguments, i.e., memory addresses
of the actual arguments. The arguments themselves are NUL-terminated
character strings.

The ``argv`` list is followed by a NULL pointer, which is simply a
``0``. There is more, but this is enough for our purposes right now.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If you have come from the MS-DOS? programming environment, the main
difference is that each argument is in a separate string. The second
difference is that there is no practical limit on how many arguments
there can be.

.. raw:: html

   </div>

Armed with this knowledge, we are almost ready for the next version of
``hex.asm``. First, however, we need to add a few lines to
``system.inc``:

First, we need to add two new entries to our list of system call
numbers:

.. code:: programlisting

    %define SYS_open    5
    %define SYS_close   6

Then we add two new macros at the end of the file:

.. code:: programlisting

    %macro  sys.open    0
        system  SYS_open
    %endmacro

    %macro  sys.close   0
        system  SYS_close
    %endmacro

Here, then, is our modified source code:

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

In our ``.data`` section we now have two new variables, ``fd.in`` and
``fd.out``. We store the input and output file descriptors here.

In the ``.text`` section we have replaced the references to ``stdin``
and ``stdout`` with ``[fd.in]`` and ``[fd.out]``.

The ``.text`` section now starts with a simple error handler, which does
nothing but exit the program with a return value of ``1``. The error
handler is before ``_start`` so we are within a short distance from
where the errors occur.

Naturally, the program execution still begins at ``_start``. First, we
remove ``argc`` and ``argv[0]`` from the stack: They are of no interest
to us (in this program, that is).

We pop ``argv[1]`` to ``ECX``. This register is particularly suited for
pointers, as we can handle NULL pointers with ``jecxz``. If ``argv[1]``
is not NULL, we try to open the file named in the first argument.
Otherwise, we continue the program as before: Reading from ``stdin``,
writing to ``stdout``. If we fail to open the input file (e.g., it does
not exist), we jump to the error handler and quit.

If all went well, we now check for the second argument. If it is there,
we open the output file. Otherwise, we send the output to ``stdout``. If
we fail to open the output file (e.g., it exists and we do not have the
write permission), we, again, jump to the error handler.

The rest of the code is the same as before, except we close the input
and output files before exiting, and, as mentioned, we use ``[fd.in]``
and ``[fd.out]``.

Our executable is now a whopping 768 bytes long.

Can we still improve it? Of course! Every program can be improved. Here
are a few ideas of what we could do:

.. raw:: html

   <div class="itemizedlist">

-  Have our error handler print a message to ``stderr``.

-  Add error handlers to the ``read`` and ``write`` functions.

-  Close ``stdin`` when we open an input file, ``stdout`` when we open
   an output file.

-  Add command line switches, such as *``-i``* and *``-o``*, so we can
   list the input and output files in any order, or perhaps read from
   ``stdin`` and write to a file.

-  Print a usage message if command line arguments are incorrect.

.. raw:: html

   </div>

I shall leave these enhancements as an exercise to the reader: You
already know everything you need to know to implement them.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+--------------------------------------+
| `Prev <x86-buffered-io.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-environment.html>`__   |
+------------------------------------+-------------------------+--------------------------------------+
| 11.8.?Buffered Input and Output?   | `Home <index.html>`__   | ?11.10.?UNIX? Environment            |
+------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
