==============
11.14.?Caveats
==============

.. raw:: html

   <div class="navheader">

11.14.?Caveats
`Prev <x86-fpu.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-acknowledgements.html>`__

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

11.14.?Caveats
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Assembly language programmers who "grew up" under MS-DOS? and Windows?
often tend to take shortcuts. Reading the keyboard scan codes and
writing directly to video memory are two classical examples of practices
which, under MS-DOS? are not frowned upon but considered the right thing
to do.

The reason? Both the PC BIOS and MS-DOS? are notoriously slow when
performing these operations.

You may be tempted to continue similar practices in the UNIX?
environment. For example, I have seen a web site which explains how to
access the keyboard scan codes on a popular UNIX? clone.

That is generally a *very bad idea* in UNIX? environment! Let me explain
why.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.14.1.?UNIX? Is Protected
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For one thing, it may simply not be possible. UNIX? runs in protected
mode. Only the kernel and device drivers are allowed to access hardware
directly. Perhaps a particular UNIX? clone will let you read the
keyboard scan codes, but chances are a real UNIX? operating system will
not. And even if one version may let you do it, the next one may not, so
your carefully crafted software may become a dinosaur overnight.

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

11.14.2.?UNIX? Is an Abstraction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

But there is a much more important reason not to try accessing the
hardware directly (unless, of course, you are writing a device driver),
even on the UNIX? like systems that let you do it:

*UNIX? is an abstraction!*

There is a major difference in the philosophy of design between MS-DOS?
and UNIX?. MS-DOS? was designed as a single-user system. It is run on a
computer with a keyboard and a video screen attached directly to that
computer. User input is almost guaranteed to come from that keyboard.
Your program's output virtually always ends up on that screen.

This is NEVER guaranteed under UNIX?. It is quite common for a UNIX?
user to pipe and redirect program input and output:

.. code:: screen

    % program1 | program2 | program3 > file1

If you have written program2, your input does not come from the keyboard
but from the output of program1. Similarly, your output does not go to
the screen but becomes the input for program3 whose output, in turn,
goes to ``file1``.

But there is more! Even if you made sure that your input comes from, and
your output goes to, the terminal, there is no guarantee the terminal is
a PC: It may not have its video memory where you expect it, nor may its
keyboard be producing PC-style scan codes. It may be a Macintosh?, or
any other computer.

Now you may be shaking your head: My software is in PC assembly
language, how can it run on a Macintosh?? But I did not say your
software would be running on a Macintosh?, only that its terminal may be
a Macintosh?.

Under UNIX?, the terminal does not have to be directly attached to the
computer that runs your software, it can even be on another continent,
or, for that matter, on another planet. It is perfectly possible that a
Macintosh? user in Australia connects to a UNIX? system in North America
(or anywhere else) via telnet. The software then runs on one computer,
while the terminal is on a different computer: If you try to read the
scan codes, you will get the wrong input!

Same holds true about any other hardware: A file you are reading may be
on a disk you have no direct access to. A camera you are reading images
from may be on a space shuttle, connected to you via satellites.

That is why under UNIX? you must never make any assumptions about where
your data is coming from and going to. Always let the system handle the
physical access to the hardware.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

These are caveats, not absolute rules. Exceptions are possible. For
example, if a text editor has determined it is running on a local
machine, it may want to read the scan codes directly for improved
control. I am not mentioning these caveats to tell you what to do or
what not to do, just to make you aware of certain pitfalls that await
you if you have just arrived to UNIX? form MS-DOS?. Of course, creative
people often break rules, and it is OK as long as they know they are
breaking them and why.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-------------------------------------------+
| `Prev <x86-fpu.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-acknowledgements.html>`__   |
+----------------------------+-------------------------+-------------------------------------------+
| 11.13.?Using the FPU?      | `Home <index.html>`__   | ?11.15.?Acknowledgements                  |
+----------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
