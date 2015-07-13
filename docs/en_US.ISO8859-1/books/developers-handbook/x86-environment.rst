========================
11.10.?UNIX? Environment
========================

.. raw:: html

   <div class="navheader">

11.10.?UNIX? Environment
`Prev <x86-command-line.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-files.html>`__

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

11.10.?UNIX? Environment
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An important UNIX? concept is the environment, which is defined by
*environment variables*. Some are set by the system, others by you, yet
others by the shell, or any program that loads another program.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.10.1.?How to Find Environment Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

I said earlier that when a program starts executing, the stack contains
``argc`` followed by the NULL-terminated ``argv`` array, followed by
something else. The "something else" is the *environment*, or, to be
more precise, a NULL-terminated array of pointers to *environment
variables*. This is often referred to as ``env``.

The structure of ``env`` is the same as that of ``argv``, a list of
memory addresses followed by a NULL (``0``). In this case, there is no
``"envc"``—we figure out where the array ends by searching for the final
NULL.

The variables usually come in the ``name=value`` format, but sometimes
the ``=value`` part may be missing. We need to account for that
possibility.

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

11.10.2.?webvars
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

I could just show you some code that prints the environment the same way
the UNIX? env command does. But I thought it would be more interesting
to write a simple assembly language CGI utility.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.10.2.1.?CGI: A Quick Overview
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

I have a `detailed CGI
tutorial <http://www.whizkidtech.redprince.net/cgi-bin/tutorial>`__ on
my web site, but here is a very quick overview of CGI:

.. raw:: html

   <div class="itemizedlist">

-  The web server communicates with the CGI program by setting
   *environment variables*.

-  The CGI program sends its output to ``stdout``. The web server reads
   it from there.

-  It must start with an HTTP header followed by two blank lines.

-  It then prints the HTML code, or whatever other type of data it is
   producing.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

While certain *environment variables* use standard names, others vary,
depending on the web server. That makes webvars quite a useful
diagnostic tool.

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

11.10.2.2.?The Code
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Our webvars program, then, must send out the HTTP header followed by
some HTML mark-up. It then must read the *environment variables* one by
one and send them out as part of the HTML page.

The code follows. I placed comments and explanations right inside the
code:

.. code:: programlisting

    ;;;;;;; webvars.asm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;
    ; Copyright (c) 2000 G. Adam Stanislav
    ; All rights reserved.
    ;
    ; Redistribution and use in source and binary forms, with or without
    ; modification, are permitted provided that the following conditions
    ; are met:
    ; 1. Redistributions of source code must retain the above copyright
    ;    notice, this list of conditions and the following disclaimer.
    ; 2. Redistributions in binary form must reproduce the above copyright
    ;    notice, this list of conditions and the following disclaimer in the
    ;    documentation and/or other materials provided with the distribution.
    ;
    ; THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
    ; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    ; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
    ; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
    ; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    ; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
    ; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
    ; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    ; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
    ; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
    ; SUCH DAMAGE.
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;
    ; Version 1.0
    ;
    ; Started:   8-Dec-2000
    ; Updated:   8-Dec-2000
    ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    %include    'system.inc'

    section .data
    http    db  'Content-type: text/html', 0Ah, 0Ah
        db  '<?xml version="1.0" encoding="utf-8"?>', 0Ah
        db  '<!DOCTYPE html PUBLIC "-//W3C/DTD XHTML Strict//EN" '
        db  '"DTD/xhtml1-strict.dtd">', 0Ah
        db  '<html xmlns="http://www.w3.org/1999/xhtml" '
        db  'xml.lang="en" lang="en">', 0Ah
        db  '<head>', 0Ah
        db  '<title>Web Environment</title>', 0Ah
        db  '<meta name="author" content="G. Adam Stanislav" />', 0Ah
        db  '</head>', 0Ah, 0Ah
        db  '<body bgcolor="#ffffff" text="#000000" link="#0000ff" '
        db  'vlink="#840084" alink="#0000ff">', 0Ah
        db  '<div class="webvars">', 0Ah
        db  '<h1>Web Environment</h1>', 0Ah
        db  '<p>The following <b>environment variables</b> are defined '
        db  'on this web server:</p>', 0Ah, 0Ah
        db  '<table align="center" width="80" border="0" cellpadding="10" '
        db  'cellspacing="0" class="webvars">', 0Ah
    httplen equ $-http
    left    db  '<tr>', 0Ah
        db  '<td class="name"><tt>'
    leftlen equ $-left
    middle  db  '</tt></td>', 0Ah
        db  '<td class="value"><tt><b>'
    midlen  equ $-middle
    undef   db  '<i>(undefined)</i>'
    undeflen    equ $-undef
    right   db  '</b></tt></td>', 0Ah
        db  '</tr>', 0Ah
    rightlen    equ $-right
    wrap    db  '</table>', 0Ah
        db  '</div>', 0Ah
        db  '</body>', 0Ah
        db  '</html>', 0Ah, 0Ah
    wraplen equ $-wrap

    section .text
    global  _start
    _start:
        ; First, send out all the http and xhtml stuff that is
        ; needed before we start showing the environment
        push    dword httplen
        push    dword http
        push    dword stdout
        sys.write

        ; Now find how far on the stack the environment pointers
        ; are. We have 12 bytes we have pushed before "argc"
        mov eax, [esp+12]

        ; We need to remove the following from the stack:
        ;
        ;   The 12 bytes we pushed for sys.write
        ;   The  4 bytes of argc
        ;   The EAX*4 bytes of argv
        ;   The  4 bytes of the NULL after argv
        ;
        ; Total:
        ;   20 + eax * 4
        ;
        ; Because stack grows down, we need to ADD that many bytes
        ; to ESP.
        lea esp, [esp+20+eax*4]
        cld     ; This should already be the case, but let's be sure.

        ; Loop through the environment, printing it out
    .loop:
        pop edi
        or  edi, edi    ; Done yet?
        je  near .wrap

        ; Print the left part of HTML
        push    dword leftlen
        push    dword left
        push    dword stdout
        sys.write

        ; It may be tempting to search for the '=' in the env string next.
        ; But it is possible there is no '=', so we search for the
        ; terminating NUL first.
        mov esi, edi    ; Save start of string
        sub ecx, ecx
        not ecx     ; ECX = FFFFFFFF
        sub eax, eax
    repne   scasb
        not ecx     ; ECX = string length + 1
        mov ebx, ecx    ; Save it in EBX

        ; Now is the time to find '='
        mov edi, esi    ; Start of string
        mov al, '='
    repne   scasb
        not ecx
        add ecx, ebx    ; Length of name

        push    ecx
        push    esi
        push    dword stdout
        sys.write

        ; Print the middle part of HTML table code
        push    dword midlen
        push    dword middle
        push    dword stdout
        sys.write

        ; Find the length of the value
        not ecx
        lea ebx, [ebx+ecx-1]

        ; Print "undefined" if 0
        or  ebx, ebx
        jne .value

        mov ebx, undeflen
        mov edi, undef

    .value:
        push    ebx
        push    edi
        push    dword stdout
        sys.write

        ; Print the right part of the table row
        push    dword rightlen
        push    dword right
        push    dword stdout
        sys.write

        ; Get rid of the 60 bytes we have pushed
        add esp, byte 60

        ; Get the next variable
        jmp .loop

    .wrap:
        ; Print the rest of HTML
        push    dword wraplen
        push    dword wrap
        push    dword stdout
        sys.write

        ; Return success
        push    dword 0
        sys.exit

This code produces a 1,396-byte executable. Most of it is data, i.e.,
the HTML mark-up we need to send out.

Assemble and link it as usual:

.. code:: screen

    % nasm -f elf webvars.asm
    % ld -s -o webvars webvars.o

To use it, you need to upload ``webvars`` to your web server. Depending
on how your web server is set up, you may have to store it in a special
``cgi-bin`` directory, or perhaps rename it with a ``.cgi`` extension.

Then you need to use your browser to view its output. To see its output
on my web server, please go to
```http://www.int80h.org/webvars/`` <http://www.int80h.org/webvars/>`__.
If curious about the additional environment variables present in a
password protected web directory, go to
```http://www.int80h.org/private/`` <http://www.int80h.org/private/>`__,
using the name **``asm``** and password **``programmer``**.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+--------------------------------+
| `Prev <x86-command-line.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-files.html>`__   |
+-------------------------------------+-------------------------+--------------------------------+
| 11.9.?Command Line Arguments?       | `Home <index.html>`__   | ?11.11.?Working with Files     |
+-------------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
