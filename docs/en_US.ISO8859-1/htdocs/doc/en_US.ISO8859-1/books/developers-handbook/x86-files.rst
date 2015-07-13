=========================
11.11.?Working with Files
=========================

.. raw:: html

   <div class="navheader">

11.11.?Working with Files
`Prev <x86-environment.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-one-pointed-mind.html>`__

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

11.11.?Working with Files
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We have already done some basic file work: We know how to open and close
them, how to read and write them using buffers. But UNIX? offers much
more functionality when it comes to files. We will examine some of it in
this section, and end up with a nice file conversion utility.

Indeed, let us start at the end, that is, with the file conversion
utility. It always makes programming easier when we know from the start
what the end product is supposed to do.

One of the first programs I wrote for UNIX? was
`tuc <ftp://ftp.int80h.org/unix/tuc/>`__, a text-to-UNIX? file
converter. It converts a text file from other operating systems to a
UNIX? text file. In other words, it changes from different kind of line
endings to the newline convention of UNIX?. It saves the output in a
different file. Optionally, it converts a UNIX? text file to a DOS text
file.

I have used tuc extensively, but always only to convert from some other
OS to UNIX?, never the other way. I have always wished it would just
overwrite the file instead of me having to send the output to a
different file. Most of the time, I end up using it like this:

.. code:: screen

    % tuc myfile tempfile
    % mv tempfile myfile

It would be nice to have a ftuc, i.e., *fast tuc*, and use it like this:

.. code:: screen

    % ftuc myfile

In this chapter, then, we will write ftuc in assembly language (the
original tuc is in C), and study various file-oriented kernel services
in the process.

At first sight, such a file conversion is very simple: All you have to
do is strip the carriage returns, right?

If you answered yes, think again: That approach will work most of the
time (at least with MS DOS text files), but will fail occasionally.

The problem is that not all non UNIX? text files end their line with the
carriage return / line feed sequence. Some use carriage returns without
line feeds. Others combine several blank lines into a single carriage
return followed by several line feeds. And so on.

A text file converter, then, must be able to handle any possible line
endings:

.. raw:: html

   <div class="itemizedlist">

-  carriage return / line feed

-  carriage return

-  line feed / carriage return

-  line feed

.. raw:: html

   </div>

It should also handle files that use some kind of a combination of the
above (e.g., carriage return followed by several line feeds).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.11.1.?Finite State Machine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The problem is easily solved by the use of a technique called *finite
state machine*, originally developed by the designers of digital
electronic circuits. A *finite state machine* is a digital circuit whose
output is dependent not only on its input but on its previous input,
i.e., on its state. The microprocessor is an example of a *finite state
machine*: Our assembly language code is assembled to machine language in
which some assembly language code produces a single byte of machine
language, while others produce several bytes. As the microprocessor
fetches the bytes from the memory one by one, some of them simply change
its state rather than produce some output. When all the bytes of the op
code are fetched, the microprocessor produces some output, or changes
the value of a register, etc.

Because of that, all software is essentially a sequence of state
instructions for the microprocessor. Nevertheless, the concept of
*finite state machine* is useful in software design as well.

Our text file converter can be designed as a *finite state machine* with
three possible states. We could call them states 0-2, but it will make
our life easier if we give them symbolic names:

.. raw:: html

   <div class="itemizedlist">

-  ordinary

-  cr

-  lf

.. raw:: html

   </div>

Our program will start in the ordinary state. During this state, the
program action depends on its input as follows:

.. raw:: html

   <div class="itemizedlist">

-  If the input is anything other than a carriage return or line feed,
   the input is simply passed on to the output. The state remains
   unchanged.

-  If the input is a carriage return, the state is changed to cr. The
   input is then discarded, i.e., no output is made.

-  If the input is a line feed, the state is changed to lf. The input is
   then discarded.

.. raw:: html

   </div>

Whenever we are in the cr state, it is because the last input was a
carriage return, which was unprocessed. What our software does in this
state again depends on the current input:

.. raw:: html

   <div class="itemizedlist">

-  If the input is anything other than a carriage return or line feed,
   output a line feed, then output the input, then change the state to
   ordinary.

-  If the input is a carriage return, we have received two (or more)
   carriage returns in a row. We discard the input, we output a line
   feed, and leave the state unchanged.

-  If the input is a line feed, we output the line feed and change the
   state to ordinary. Note that this is not the same as the first case
   above – if we tried to combine them, we would be outputting two line
   feeds instead of one.

.. raw:: html

   </div>

Finally, we are in the lf state after we have received a line feed that
was not preceded by a carriage return. This will happen when our file
already is in UNIX? format, or whenever several lines in a row are
expressed by a single carriage return followed by several line feeds, or
when line ends with a line feed / carriage return sequence. Here is how
we need to handle our input in this state:

.. raw:: html

   <div class="itemizedlist">

-  If the input is anything other than a carriage return or line feed,
   we output a line feed, then output the input, then change the state
   to ordinary. This is exactly the same action as in the cr state upon
   receiving the same kind of input.

-  If the input is a carriage return, we discard the input, we output a
   line feed, then change the state to ordinary.

-  If the input is a line feed, we output the line feed, and leave the
   state unchanged.

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

11.11.1.1.?The Final State
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The above *finite state machine* works for the entire file, but leaves
the possibility that the final line end will be ignored. That will
happen whenever the file ends with a single carriage return or a single
line feed. I did not think of it when I wrote tuc, just to discover that
occasionally it strips the last line ending.

This problem is easily fixed by checking the state after the entire file
was processed. If the state is not ordinary, we simply need to output
one last line feed.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Now that we have expressed our algorithm as a *finite state machine*, we
could easily design a dedicated digital electronic circuit (a "chip") to
do the conversion for us. Of course, doing so would be considerably more
expensive than writing an assembly language program.

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

11.11.1.2.?The Output Counter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because our file conversion program may be combining two characters into
one, we need to use an output counter. We initialize it to ``0``, and
increase it every time we send a character to the output. At the end of
the program, the counter will tell us what size we need to set the file
to.

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

11.11.2.?Implementing FSM in Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The hardest part of working with a *finite state machine* is analyzing
the problem and expressing it as a *finite state machine*. That
accomplished, the software almost writes itself.

In a high-level language, such as C, there are several main approaches.
One is to use a ``switch`` statement which chooses what function should
be run. For example,

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

Another approach is by using an array of function pointers, something
like this:

.. code:: programlisting

        (output[state])(inputchar);

Yet another is to have ``state`` be a function pointer, set to point at
the appropriate function:

.. code:: programlisting

        (*state)(inputchar);

This is the approach we will use in our program because it is very easy
to do in assembly language, and very fast, too. We will simply keep the
address of the right procedure in ``EBX``, and then just issue:

.. code:: programlisting

        call    ebx

This is possibly faster than hardcoding the address in the code because
the microprocessor does not have to fetch the address from the memory—it
is already stored in one of its registers. I said *possibly* because
with the caching modern microprocessors do, either way may be equally
fast.

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

11.11.3.?Memory Mapped Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because our program works on a single file, we cannot use the approach
that worked for us before, i.e., to read from an input file and to write
to an output file.

UNIX? allows us to map a file, or a section of a file, into memory. To
do that, we first need to open the file with the appropriate read/write
flags. Then we use the ``mmap`` system call to map it into the memory.
One nice thing about ``mmap`` is that it automatically works with
virtual memory: We can map more of the file into the memory than we have
physical memory available, yet still access it through regular memory op
codes, such as ``mov``, ``lods``, and ``stos``. Whatever changes we make
to the memory image of the file will be written to the file by the
system. We do not even have to keep the file open: As long as it stays
mapped, we can read from it and write to it.

The 32-bit Intel microprocessors can access up to four gigabytes of
memory – physical or virtual. The FreeBSD system allows us to use up to
a half of it for file mapping.

For simplicity sake, in this tutorial we will only convert files that
can be mapped into the memory in their entirety. There are probably not
too many text files that exceed two gigabytes in size. If our program
encounters one, it will simply display a message suggesting we use the
original tuc instead.

If you examine your copy of ``syscalls.master``, you will find two
separate syscalls named ``mmap``. This is because of evolution of UNIX?:
There was the traditional BSD ``mmap``, syscall 71. That one was
superseded by the POSIX? ``mmap``, syscall 197. The FreeBSD system
supports both because older programs were written by using the original
BSD version. But new software uses the POSIX? version, which is what we
will use.

The ``syscalls.master`` file lists the POSIX? version like this:

.. code:: programlisting

    197 STD BSD { caddr_t mmap(caddr_t addr, size_t len, int prot, \
                    int flags, int fd, long pad, off_t pos); }

This differs slightly from what
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2>`__
says. That is because
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2>`__
describes the C version.

The difference is in the ``long pad`` argument, which is not present in
the C version. However, the FreeBSD syscalls add a 32-bit pad after
``push``\ ing a 64-bit argument. In this case, ``off_t`` is a 64-bit
value.

When we are finished working with a memory-mapped file, we unmap it with
the ``munmap`` syscall:

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

For an in-depth treatment of ``mmap``, see W. Richard Stevens' `Unix
Network Programming, Volume 2, Chapter
12 <http://www.int80h.org/cgi-bin/isbn?isbn=0130810819>`__.

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

11.11.4.?Determining File Size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because we need to tell ``mmap`` how many bytes of the file to map into
the memory, and because we want to map the entire file, we need to
determine the size of the file.

We can use the ``fstat`` syscall to get all the information about an
open file that the system can give us. That includes the file size.

Again, ``syscalls.master`` lists two versions of ``fstat``, a
traditional one (syscall 62), and a POSIX? one (syscall 189). Naturally,
we will use the POSIX? version:

.. code:: programlisting

    189 STD POSIX   { int fstat(int fd, struct stat *sb); }

This is a very straightforward call: We pass to it the address of a
``stat`` structure and the descriptor of an open file. It will fill out
the contents of the ``stat`` structure.

I do, however, have to say that I tried to declare the ``stat``
structure in the ``.bss`` section, and ``fstat`` did not like it: It set
the carry flag indicating an error. After I changed the code to allocate
the structure on the stack, everything was working fine.

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

11.11.5.?Changing the File Size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because our program may combine carriage return / line feed sequences
into straight line feeds, our output may be smaller than our input.
However, since we are placing our output into the same file we read the
input from, we may have to change the size of the file.

The ``ftruncate`` system call allows us to do just that. Despite its
somewhat misleading name, the ``ftruncate`` system call can be used to
both truncate the file (make it smaller) and to grow it.

And yes, we will find two versions of ``ftruncate`` in
``syscalls.master``, an older one (130), and a newer one (201). We will
use the newer one:

.. code:: programlisting

    201 STD BSD { int ftruncate(int fd, int pad, off_t length); }

Please note that this one contains a ``int pad`` again.

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

11.11.6.?ftuc
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We now know everything we need to write ftuc. We start by adding some
new lines in ``system.inc``. First, we define some constants and
structures, somewhere at or near the beginning of the file:

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

We define the new syscalls:

.. code:: programlisting

    %define SYS_mmap    197
    %define SYS_munmap  73
    %define SYS_fstat   189
    %define SYS_ftruncate   201

We add the macros for their use:

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

And here is our code:

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

Warning:
~~~~~~~~

Do not use this program on files stored on a disk formatted by MS-DOS?
or Windows?. There seems to be a subtle bug in the FreeBSD code when
using ``mmap`` on these drives mounted under FreeBSD: If the file is
over a certain size, ``mmap`` will just fill the memory with zeros, and
then copy them to the file overwriting its contents.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+-------------------------------------------+
| `Prev <x86-environment.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-one-pointed-mind.html>`__   |
+------------------------------------+-------------------------+-------------------------------------------+
| 11.10.?UNIX? Environment?          | `Home <index.html>`__   | ?11.12.?One-Pointed Mind                  |
+------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
