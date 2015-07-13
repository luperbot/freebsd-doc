=======================
11.6.?Our First Program
=======================

.. raw:: html

   <div class="navheader">

11.6.?Our First Program
`Prev <x86-portable-code.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-unix-filters.html>`__

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

11.6.?Our First Program
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We are now ready for our first program, the mandatory Hello, World!

.. code:: programlisting

     1: %include    'system.inc'
     2:
     3: section .data
     4: hello   db  'Hello, World!', 0Ah
     5: hbytes  equ $-hello
     6:
     7: section .text
     8: global  _start
     9: _start:
    10: push    dword hbytes
    11: push    dword hello
    12: push    dword stdout
    13: sys.write
    14:
    15: push    dword 0
    16: sys.exit

Here is what it does: Line 1 includes the defines, the macros, and the
code from ``system.inc``.

Lines 3-5 are the data: Line 3 starts the data section/segment. Line 4
contains the string "Hello, World!" followed by a new line (``0Ah``).
Line 5 creates a constant that contains the length of the string from
line 4 in bytes.

Lines 7-16 contain the code. Note that FreeBSD uses the *elf* file
format for its executables, which requires every program to start at the
point labeled ``_start`` (or, more precisely, the linker expects that).
This label has to be global.

Lines 10-13 ask the system to write ``hbytes`` bytes of the ``hello``
string to ``stdout``.

Lines 15-16 ask the system to end the program with the return value of
``0``. The ``SYS_exit`` syscall never returns, so the code ends there.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If you have come to UNIX? from MS-DOS? assembly language background, you
may be used to writing directly to the video hardware. You will never
have to worry about this in FreeBSD, or any other flavor of UNIX?. As
far as you are concerned, you are writing to a file known as ``stdout``.
This can be the video screen, or a telnet terminal, or an actual file,
or even the input of another program. Which one it is, is for the system
to figure out.

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

11.6.1.?Assembling the Code
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Type the code (except the line numbers) in an editor, and save it in a
file named ``hello.asm``. You need nasm to assemble it.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.6.1.1.?Installing nasm
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you do not have nasm, type:

.. code:: screen

    % su
    Password:your root password
    # cd /usr/ports/devel/nasm
    # make install
    # exit
    %

You may type **``make install clean``** instead of just
**``make install``** if you do not want to keep nasm source code.

Either way, FreeBSD will automatically download nasm from the Internet,
compile it, and install it on your system.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If your system is not FreeBSD, you need to get nasm from its `home
page <https://sourceforge.net/projects/nasm>`__. You can still use it to
assemble FreeBSD code.

.. raw:: html

   </div>

Now you can assemble, link, and run the code:

.. code:: screen

    % nasm -f elf hello.asm
    % ld -s -o hello hello.o
    % ./hello
    Hello, World!
    %

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+---------------------------------------+
| `Prev <x86-portable-code.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-unix-filters.html>`__   |
+--------------------------------------+-------------------------+---------------------------------------+
| 11.5.?Creating Portable Code?        | `Home <index.html>`__   | ?11.7.?Writing UNIX? Filters          |
+--------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
