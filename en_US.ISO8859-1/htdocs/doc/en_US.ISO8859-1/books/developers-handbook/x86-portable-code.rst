============================
11.5.?Creating Portable Code
============================

.. raw:: html

   <div class="navheader">

11.5.?Creating Portable Code
`Prev <x86-return-values.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-first-program.html>`__

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

11.5.?Creating Portable Code
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Portability is generally not one of the strengths of assembly language.
Yet, writing assembly language programs for different platforms is
possible, especially with nasm. I have written assembly language
libraries that can be assembled for such different operating systems as
Windows? and FreeBSD.

It is all the more possible when you want your code to run on two
platforms which, while different, are based on similar architectures.

For example, FreeBSD is UNIX?, Linux is UNIX? like. I only mentioned
three differences between them (from an assembly language programmer's
perspective): The calling convention, the function numbers, and the way
of returning values.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.5.1.?Dealing with Function Numbers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In many cases the function numbers are the same. However, even when they
are not, the problem is easy to deal with: Instead of using numbers in
your code, use constants which you have declared differently depending
on the target architecture:

.. code:: programlisting

    %ifdef  LINUX
    %define SYS_execve  11
    %else
    %define SYS_execve  59
    %endif

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

11.5.2.?Dealing with Conventions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Both, the calling convention, and the return value (the ``errno``
problem) can be resolved with macros:

.. code:: programlisting

    %ifdef  LINUX

    %macro  system  0
        call    kernel
    %endmacro

    align 4
    kernel:
        push    ebx
        push    ecx
        push    edx
        push    esi
        push    edi
        push    ebp

        mov ebx, [esp+32]
        mov ecx, [esp+36]
        mov edx, [esp+40]
        mov esi, [esp+44]
        mov ebp, [esp+48]
        int 80h

        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx

        or  eax, eax
        js  .errno
        clc
        ret

    .errno:
        neg eax
        stc
        ret

    %else

    %macro  system  0
        int 80h
    %endmacro

    %endif

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

11.5.3.?Dealing with Other Portability Issues
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The above solutions can handle most cases of writing code portable
between FreeBSD and Linux. Nevertheless, with some kernel services the
differences are deeper.

In that case, you need to write two different handlers for those
particular system calls, and use conditional assembly. Luckily, most of
your code does something other than calling the kernel, so usually you
will only need a few such conditional sections in your code.

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

11.5.4.?Using a Library
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You can avoid portability issues in your main code altogether by writing
a library of system calls. Create a separate library for FreeBSD, a
different one for Linux, and yet other libraries for more operating
systems.

In your library, write a separate function (or procedure, if you prefer
the traditional assembly language terminology) for each system call. Use
the C calling convention of passing parameters. But still use ``EAX`` to
pass the call number in. In that case, your FreeBSD library can be very
simple, as many seemingly different functions can be just labels to the
same code:

.. code:: programlisting

    sys.open:
    sys.close:
    [etc...]
        int 80h
        ret

Your Linux library will require more different functions. But even here
you can group system calls using the same number of parameters:

.. code:: programlisting

    sys.exit:
    sys.close:
    [etc... one-parameter functions]
        push    ebx
        mov ebx, [esp+12]
        int 80h
        pop ebx
        jmp sys.return

    ...

    sys.return:
        or  eax, eax
        js  sys.err
        clc
        ret

    sys.err:
        neg eax
        stc
        ret

The library approach may seem inconvenient at first because it requires
you to produce a separate file your code depends on. But it has many
advantages: For one, you only need to write it once and can use it for
all your programs. You can even let other assembly language programmers
use it, or perhaps use one written by someone else. But perhaps the
greatest advantage of the library is that your code can be ported to
other systems, even by other programmers, by simply writing a new
library without any changes to your code.

If you do not like the idea of having a library, you can at least place
all your system calls in a separate assembly language file and link it
with your main program. Here, again, all porters have to do is create a
new object file to link with your main program.

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

11.5.5.?Using an Include File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are releasing your software as (or with) source code, you can use
macros and place them in a separate file, which you include in your
code.

Porters of your software will simply write a new include file. No
library or external object file is necessary, yet your code is portable
without any need to edit the code.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This is the approach we will use throughout this chapter. We will name
our include file ``system.inc``, and add to it whenever we deal with a
new system call.

.. raw:: html

   </div>

We can start our ``system.inc`` by declaring the standard file
descriptors:

.. code:: programlisting

    %define stdin   0
    %define stdout  1
    %define stderr  2

Next, we create a symbolic name for each system call:

.. code:: programlisting

    %define SYS_nosys   0
    %define SYS_exit    1
    %define SYS_fork    2
    %define SYS_read    3
    %define SYS_write   4
    ; [etc...]

We add a short, non-global procedure with a long name, so we do not
accidentally reuse the name in our code:

.. code:: programlisting

    section .text
    align 4
    access.the.bsd.kernel:
        int 80h
        ret

We create a macro which takes one argument, the syscall number:

.. code:: programlisting

    %macro  system  1
        mov eax, %1
        call    access.the.bsd.kernel
    %endmacro

Finally, we create macros for each syscall. These macros take no
arguments.

.. code:: programlisting

    %macro  sys.exit    0
        system  SYS_exit
    %endmacro

    %macro  sys.fork    0
        system  SYS_fork
    %endmacro

    %macro  sys.read    0
        system  SYS_read
    %endmacro

    %macro  sys.write   0
        system  SYS_write
    %endmacro

    ; [etc...]

Go ahead, enter it into your editor and save it as ``system.inc``. We
will add more to it as we discuss more syscalls.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+----------------------------------------+
| `Prev <x86-return-values.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-first-program.html>`__   |
+--------------------------------------+-------------------------+----------------------------------------+
| 11.4.?Return Values?                 | `Home <index.html>`__   | ?11.6.?Our First Program               |
+--------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
