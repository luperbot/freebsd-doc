=======================
11.12.?One-Pointed Mind
=======================

.. raw:: html

   <div class="navheader">

11.12.?One-Pointed Mind
`Prev <x86-files.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-fpu.html>`__

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

11.12.?One-Pointed Mind
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As a student of Zen, I like the idea of a one-pointed mind: Do one thing
at a time, and do it well.

This, indeed, is very much how UNIX? works as well. While a typical
Windows? application is attempting to do everything imaginable (and is,
therefore, riddled with bugs), a typical UNIX? program does only one
thing, and it does it well.

The typical UNIX? user then essentially assembles his own applications
by writing a shell script which combines the various existing programs
by piping the output of one program to the input of another.

When writing your own UNIX? software, it is generally a good idea to see
what parts of the problem you need to solve can be handled by existing
programs, and only write your own programs for that part of the problem
that you do not have an existing solution for.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.12.1.?CSV
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

I will illustrate this principle with a specific real-life example I was
faced with recently:

I needed to extract the 11th field of each record from a database I
downloaded from a web site. The database was a CSV file, i.e., a list of
*comma-separated values*. That is quite a standard format for sharing
data among people who may be using different database software.

The first line of the file contains the list of various fields separated
by commas. The rest of the file contains the data listed line by line,
with values separated by commas.

I tried awk, using the comma as a separator. But because several lines
contained a quoted comma, awk was extracting the wrong field from those
lines.

Therefore, I needed to write my own software to extract the 11th field
from the CSV file. However, going with the UNIX? spirit, I only needed
to write a simple filter that would do the following:

.. raw:: html

   <div class="itemizedlist">

-  Remove the first line from the file;

-  Change all unquoted commas to a different character;

-  Remove all quotation marks.

.. raw:: html

   </div>

Strictly speaking, I could use sed to remove the first line from the
file, but doing so in my own program was very easy, so I decided to do
it and reduce the size of the pipeline.

At any rate, writing a program like this took me about 20 minutes.
Writing a program that extracts the 11th field from the CSV file would
take a lot longer, and I could not reuse it to extract some other field
from some other database.

This time I decided to let it do a little more work than a typical
tutorial program would:

.. raw:: html

   <div class="itemizedlist">

-  It parses its command line for options;

-  It displays proper usage if it finds wrong arguments;

-  It produces meaningful error messages.

.. raw:: html

   </div>

Here is its usage message:

.. code:: screen

    Usage: csv [-t<delim>] [-c<comma>] [-p] [-o <outfile>] [-i <infile>]

All parameters are optional, and can appear in any order.

The *``-t``* parameter declares what to replace the commas with. The
``tab`` is the default here. For example, *``-t;``* will replace all
unquoted commas with semicolons.

I did not need the *``-c``* option, but it may come in handy in the
future. It lets me declare that I want a character other than a comma
replaced with something else. For example, *``-c@``* will replace all at
signs (useful if you want to split a list of email addresses to their
user names and domains).

The *``-p``* option preserves the first line, i.e., it does not delete
it. By default, we delete the first line because in a CSV file it
contains the field names rather than data.

The *``-i``* and *``-o``* options let me specify the input and the
output files. Defaults are ``stdin`` and ``stdout``, so this is a
regular UNIX? filter.

I made sure that both *``-i filename``* and *``-ifilename``* are
accepted. I also made sure that only one input and one output files may
be specified.

To get the 11th field of each record, I can now do:

.. code:: screen

    % csv '-t;' data.csv | awk '-F;' '{print $11}'

The code stores the options (except for the file descriptors) in
``EDX``: The comma in ``DH``, the new separator in ``DL``, and the flag
for the *``-p``* option in the highest bit of ``EDX``, so a check for
its sign will give us a quick decision what to do.

Here is the code:

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

Much of it is taken from ``hex.asm`` above. But there is one important
difference: I no longer call ``write`` whenever I am outputting a line
feed. Yet, the code can be used interactively.

I have found a better solution for the interactive problem since I first
started writing this chapter. I wanted to make sure each line is printed
out separately only when needed. After all, there is no need to flush
out every line when used non-interactively.

The new solution I use now is to call ``write`` every time I find the
input buffer empty. That way, when running in the interactive mode, the
program reads one line from the user's keyboard, processes it, and sees
its input buffer is empty. It flushes its output and reads the next
line.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.12.1.1.?The Dark Side of Buffering
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This change prevents a mysterious lockup in a very specific case. I
refer to it as the *dark side of buffering*, mostly because it presents
a danger that is not quite obvious.

It is unlikely to happen with a program like the csv above, so let us
consider yet another filter: In this case we expect our input to be raw
data representing color values, such as the *red*, *green*, and *blue*
intensities of a pixel. Our output will be the negative of our input.

Such a filter would be very simple to write. Most of it would look just
like all the other filters we have written so far, so I am only going to
show you its inner loop:

.. code:: programlisting

    .loop:
        call    getchar
        not al      ; Create a negative
        call    putchar
        jmp short .loop

Because this filter works with raw data, it is unlikely to be used
interactively.

But it could be called by image manipulation software. And, unless it
calls ``write`` before each call to ``read``, chances are it will lock
up.

Here is what might happen:

.. raw:: html

   <div class="procedure">

#. The image editor will load our filter using the C function
   ``popen()``.

#. It will read the first row of pixels from a bitmap or pixmap.

#. It will write the first row of pixels to the *pipe* leading to the
   ``fd.in`` of our filter.

#. Our filter will read each pixel from its input, turn it to a
   negative, and write it to its output buffer.

#. Our filter will call ``getchar`` to fetch the next pixel.

#. ``getchar`` will find an empty input buffer, so it will call
   ``read``.

#. ``read`` will call the ``SYS_read`` system call.

#. The *kernel* will suspend our filter until the image editor sends
   more data to the pipe.

#. The image editor will read from the other pipe, connected to the
   ``fd.out`` of our filter so it can set the first row of the output
   image *before* it sends us the second row of the input.

#. The *kernel* suspends the image editor until it receives some output
   from our filter, so it can pass it on to the image editor.

.. raw:: html

   </div>

At this point our filter waits for the image editor to send it more data
to process, while the image editor is waiting for our filter to send it
the result of the processing of the first row. But the result sits in
our output buffer.

The filter and the image editor will continue waiting for each other
forever (or, at least, until they are killed). Our software has just
entered a `race condition <secure-race-conditions.html>`__.

This problem does not exist if our filter flushes its output buffer
*before* asking the *kernel* for more input data.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+------------------------------+
| `Prev <x86-files.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-fpu.html>`__   |
+------------------------------+-------------------------+------------------------------+
| 11.11.?Working with Files?   | `Home <index.html>`__   | ?11.13.?Using the FPU        |
+------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
