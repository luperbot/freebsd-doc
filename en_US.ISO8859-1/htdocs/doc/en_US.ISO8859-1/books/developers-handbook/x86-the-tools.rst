===============
11.2.?The Tools
===============

.. raw:: html

   <div class="navheader">

11.2.?The Tools
`Prev <x86.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-system-calls.html>`__

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

11.2.?The Tools
---------------

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

11.2.1.?The Assembler
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The most important tool for assembly language programming is the
assembler, the software that converts assembly language code into
machine language.

Two very different assemblers are available for FreeBSD. One is
`as(1) <http://www.FreeBSD.org/cgi/man.cgi?query=as&sektion=1>`__, which
uses the traditional UNIX? assembly language syntax. It comes with the
system.

The other is /usr/ports/devel/nasm. It uses the Intel syntax. Its main
advantage is that it can assemble code for many operating systems. It
needs to be installed separately, but is completely free.

This chapter uses nasm syntax because most assembly language programmers
coming to FreeBSD from other operating systems will find it easier to
understand. And, because, quite frankly, that is what I am used to.

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

11.2.2.?The Linker
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The output of the assembler, like that of any compiler, needs to be
linked to form an executable file.

The standard
`ld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ld&sektion=1>`__ linker
comes with FreeBSD. It works with the code assembled with either
assembler.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+-------------------------+---------------------------------------+
| `Prev <x86.html>`__?                             | `Up <x86.html>`__       | ?\ `Next <x86-system-calls.html>`__   |
+--------------------------------------------------+-------------------------+---------------------------------------+
| Chapter?11.?x86 Assembly Language Programming?   | `Home <index.html>`__   | ?11.3.?System Calls                   |
+--------------------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
