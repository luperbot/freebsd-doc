==================
11.3.?System Calls
==================

.. raw:: html

   <div class="navheader">

11.3.?System Calls
`Prev <x86-the-tools.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-return-values.html>`__

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

11.3.?System Calls
------------------

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

11.3.1.?Default Calling Convention
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, the FreeBSD kernel uses the C calling convention. Further,
although the kernel is accessed using ``int 80h``, it is assumed the
program will call a function that issues ``int 80h``, rather than
issuing ``int 80h`` directly.

This convention is very convenient, and quite superior to the Microsoft?
convention used by MS-DOS?. Why? Because the UNIX? convention allows any
program written in any language to access the kernel.

An assembly language program can do that as well. For example, we could
open a file:

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

This is a very clean and portable way of coding. If you need to port the
code to a UNIX? system which uses a different interrupt, or a different
way of passing parameters, all you need to change is the kernel
procedure.

But assembly language programmers like to shave off cycles. The above
example requires a ``call/ret`` combination. We can eliminate it by
``push``\ ing an extra dword:

.. code:: programlisting

    open:
        push    dword mode
        push    dword flags
        push    dword path
        mov eax, 5
        push    eax     ; Or any other dword
        int 80h
        add esp, byte 16

The ``5`` that we have placed in ``EAX`` identifies the kernel function,
in this case ``open``.

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

11.3.2.?Alternate Calling Convention
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is an extremely flexible system. It offers other ways of calling
the kernel. For it to work, however, the system must have Linux
emulation installed.

Linux is a UNIX? like system. However, its kernel uses the same
system-call convention of passing parameters in registers MS-DOS? does.
As with the UNIX? convention, the function number is placed in ``EAX``.
The parameters, however, are not passed on the stack but in
``EBX, ECX, EDX, ESI, EDI, EBP``:

.. code:: programlisting

    open:
        mov eax, 5
        mov ebx, path
        mov ecx, flags
        mov edx, mode
        int 80h

This convention has a great disadvantage over the UNIX? way, at least as
far as assembly language programming is concerned: Every time you make a
kernel call you must ``push`` the registers, then ``pop`` them later.
This makes your code bulkier and slower. Nevertheless, FreeBSD gives you
a choice.

If you do choose the Linux convention, you must let the system know
about it. After your program is assembled and linked, you need to brand
the executable:

.. code:: screen

    % brandelf -t Linux filename

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

11.3.3.?Which Convention Should You Use?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are coding specifically for FreeBSD, you should always use the
UNIX? convention: It is faster, you can store global variables in
registers, you do not have to brand the executable, and you do not
impose the installation of the Linux emulation package on the target
system.

If you want to create portable code that can also run on Linux, you will
probably still want to give the FreeBSD users as efficient a code as
possible. I will show you how you can accomplish that after I have
explained the basics.

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

11.3.4.?Call Numbers
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To tell the kernel which system service you are calling, place its
number in ``EAX``. Of course, you need to know what the number is.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.3.4.1.?The ``syscalls`` File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The numbers are listed in ``syscalls``. ``locate syscalls`` finds this
file in several different formats, all produced automatically from
``syscalls.master``.

You can find the master file for the default UNIX? calling convention in
``/usr/src/sys/kern/syscalls.master``. If you need to use the other
convention implemented in the Linux emulation mode, read
``/usr/src/sys/i386/linux/syscalls.master``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Not only do FreeBSD and Linux use different calling conventions, they
sometimes use different numbers for the same functions.

.. raw:: html

   </div>

``syscalls.master`` describes how the call is to be made:

.. code:: programlisting

    0   STD NOHIDE  { int nosys(void); } syscall nosys_args int
    1   STD NOHIDE  { void exit(int rval); } exit rexit_args void
    2   STD POSIX   { int fork(void); }
    3   STD POSIX   { ssize_t read(int fd, void *buf, size_t nbyte); }
    4   STD POSIX   { ssize_t write(int fd, const void *buf, size_t nbyte); }
    5   STD POSIX   { int open(char *path, int flags, int mode); }
    6   STD POSIX   { int close(int fd); }
    etc...

It is the leftmost column that tells us the number to place in ``EAX``.

The rightmost column tells us what parameters to ``push``. They are
``push``\ ed *from right to left*.

.. raw:: html

   <div class="informalexample">

For example, to ``open`` a file, we need to ``push`` the ``mode`` first,
then ``flags``, then the address at which the ``path`` is stored.

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

+----------------------------------+-------------------------+----------------------------------------+
| `Prev <x86-the-tools.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-return-values.html>`__   |
+----------------------------------+-------------------------+----------------------------------------+
| 11.2.?The Tools?                 | `Home <index.html>`__   | ?11.4.?Return Values                   |
+----------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
