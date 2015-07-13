===============
2.10.?Terminals
===============

.. raw:: html

   <div class="navheader">

2.10.?Terminals
`Prev <overview-nfs.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-ipc.html>`__

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

2.10.?Terminals
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Terminals support the standard system I/O operations, as well as a
collection of terminal-specific operations to control input-character
editing and output delays. At the lowest level are the terminal device
drivers that control the hardware terminal ports. Terminal input is
handled according to the underlying communication characteristics, such
as baud rate, and according to a set of software-controllable
parameters, such as parity checking.

Layered above the terminal device drivers are line disciplines that
provide various degrees of character processing. The default line
discipline is selected when a port is being used for an interactive
login. The line discipline is run in *canonical mode*; input is
processed to provide standard line-oriented editing functions, and input
is presented to a process on a line-by-line basis.

Screen editors and programs that communicate with other computers
generally run in *noncanonical mode* (also commonly referred to as *raw
mode* or *character-at-a-time mode*). In this mode, input is passed
through to the reading process immediately and without interpretation.
All special-character input processing is disabled, no erase or other
line editing processing is done, and all characters are passed to the
program that is reading from the terminal.

It is possible to configure the terminal in thousands of combinations
between these two extremes. For example, a screen editor that wanted to
receive user interrupts asynchronously might enable the special
characters that generate signals and enable output flow control, but
otherwise run in noncanonical mode; all other characters would be passed
through to the process uninterpreted.

On output, the terminal handler provides simple formatting services,
including

.. raw:: html

   <div class="itemizedlist">

-  Converting the line-feed character to the two-character
   carriage-return-line-feed sequence

-  Inserting delays after certain standard control characters

-  Expanding tabs

-  Displaying echoed nongraphic ASCII characters as a two-character
   sequence of the form \`\`^C'' (i.e., the ASCII caret character
   followed by the ASCII character that is the character's value offset
   from the ASCII \`\`@'' character).

.. raw:: html

   </div>

Each of these formatting services can be disabled individually by a
process through control requests.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+--------------------------+-------------------------------------+
| `Prev <overview-nfs.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-ipc.html>`__     |
+---------------------------------+--------------------------+-------------------------------------+
| 2.9.?Network Filesystem?        | `Home <index.html>`__    | ?2.11.?Interprocess Communication   |
+---------------------------------+--------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
