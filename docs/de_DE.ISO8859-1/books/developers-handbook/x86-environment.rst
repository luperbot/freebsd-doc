=========================
11.10. Die UNIX?-Umgebung
=========================

.. raw:: html

   <div class="navheader">

11.10. Die UNIX?-Umgebung
`Zur?ck <x86-command-line.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-files.html>`__

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

11.10. Die UNIX?-Umgebung
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Fabian Ruch.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein entscheidendes Konzept hinter UNIX? ist die Umgebung, die durch
*Umgebungsvariablen* festgelegt wird. Manche werden vom System gesetzt,
andere von Ihnen und wieder andere von der shell oder irgendeinem
Programm, das ein anderes l?dt.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.10.1. Umgebungsvariablen herausfinden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ich sagte vorher, dass wenn ein Programm mit der Ausf?hrung beginnt, der
Stack ``argc`` gefolgt vom durch NULL beendeten ``argv``-Array und etwas
Anderem enth?lt. Das "etwas Andere" ist die *Umgebung* oder, um genauer
zu sein, ein durch NULL beendetes Array von Zeigern auf
*Umgebungsvariablen*. Davon wird oft als ``env`` gesprochen.

Der Aufbau von ``env`` entspricht dem von ``argv``, eine Liste von
Speicheradressen gefolgt von NULL (``0``). In diesem Fall gibt es kein
``"envc"``—wir finden das Ende heraus, indem wir nach dem letzten NULL
suchen.

Die Variablen liegen normalerweise in der Form ``name=value`` vor, aber
manchmal kann der ``=value``-Teil fehlen. Wir m?ssen diese M?glichkeit
in Betracht ziehen.

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

11.10.2. webvars
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ich k?nnte Ihnen einfach etwas Code zeigen, der die Umgebung in der Art
vom UNIX?-Befehl env ausgibt. Aber ich dachte, dass es interessanter
sei, ein einfaches CGI-Werkzeug in Assembler zu schreiben.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.10.2.1. CGI: Ein kurzer ?berblick
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ich habe eine `detaillierte
CGI-Anleitung <http://www.whizkidtech.redprince.net/cgi-bin/tutorial>`__
auf meiner Webseite, aber hier ist ein sehr kurzer ?berblick ?ber CGI:

.. raw:: html

   <div class="itemizedlist">

-  Der Webserver kommuniziert mit dem CGI-Programm, indem er
   *Umgebungsvariablen* setzt.

-  Das CGI-Programm schreibt seine Ausgabe auf ``stdout``. Der Webserver
   liest von da.

-  Die Ausgabe muss mit einem HTTP-Kopfteil gefolgt von zwei Leerzeilen
   beginnen.

-  Das Programm gibt dann den HTML-Code oder was f?r einen Datentyp es
   auch immer verarbeitet aus.

-  

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   W?hrend bestimmte *Umgebungsvariablen* Standardnamen benutzen,
   unterscheiden sich andere, abh?ngig vom Webserver. Dies macht webvars
   zu einem recht n?tzlichen Werkzeug.

   .. raw:: html

      </div>

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

11.10.2.2. Der Code
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unser webvars-Programm muss also den HTTP-Kopfteil gefolgt von etwas
HTML-Auszeichnung versenden. Dann muss es die *Umgebungsvariablen* eine
nach der anderen auslesen und sie als Teil der HTML-Seite versenden.

Nun der Code. Ich habe Kommentare und Erkl?rungen direkt in den Code
eingef?gt:

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

Dieser Code erzeugt eine 1.396-Byte gro?e Bin?rdatei. Das meiste davon
sind Daten, d.h., die HTML-Auszeichnung, die wir versenden m?ssen.

Assemblieren Sie es wie immer:

.. code:: screen

    % nasm -f elf webvars.asm
    % ld -s -o webvars webvars.o

Um es zu benutzen, m?ssen Sie ``webvars`` auf Ihren Webserver hochladen.
Abh?ngig von Ihrer Webserver-Konfiguration, m?ssen Sie es vielleicht in
einem speziellen ``cgi-bin``-Verzeichnis ablegen oder es mit einer
``.cgi``-Dateierweiterung versehen.

Schlie?lich ben?tigen Sie Ihren Webbrowser, um sich die Ausgabe
anzusehen. Um die Ausgabe auf meinem Webserver zu sehen, gehen Sie bitte
auf
```http://www.int80h.org/webvars/`` <http://www.int80h.org/webvars/>`__.
Falls Sie neugierig sind, welche zus?tzlichen Variablen in einem
passwortgesch?tzten Webverzeichnis vorhanden sind, gehen Sie auf
```http://www.int80h.org/private/`` <http://www.int80h.org/private/>`__
unter Benutzung des Benutzernamens **``asm``** und des Passworts
**``programmer``**.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <x86-command-line.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-files.html>`__   |
+---------------------------------------+-------------------------------+----------------------------------+
| 11.9. Kommandozeilenparameter?        | `Zum Anfang <index.html>`__   | ?11.11. Arbeiten mit Dateien     |
+---------------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
