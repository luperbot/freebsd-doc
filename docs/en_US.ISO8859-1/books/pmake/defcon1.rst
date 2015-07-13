=================================================================
4.8.?DEFCON 1 – Imitation is the Not the Highest Form of Flattery
=================================================================

.. raw:: html

   <div class="navheader">

4.8.?DEFCON 1 – Imitation is the Not the Highest Form of Flattery
`Prev <defcon2.html>`__?
Chapter?4.?PMake for Gods
?\ `Next <theway.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.8.?DEFCON 1 – Imitation is the Not the Highest Form of Flattery
-----------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The final category of makefile is the one where every command requires
input, the dependencies are incompletely specified, or you simply cannot
create more than one target at a time, as mentioned earlier. In
addition, you may not have the time or desire to upgrade the makefile to
run smoothly with PMake. If you are the conservative sort, this is the
compatibility mode for you. It is entered either by giving PMake the
``-M`` flag (for Make), or by executing PMake as ``make.`` In either
case, PMake performs things exactly like Make (while still supporting
most of the nice new features PMake provides). This includes:

.. raw:: html

   <div class="itemizedlist">

-  No parallel execution.

-  Targets are made in the exact order specified by the makefile. The
   sources for each target are made in strict left-to-right order, etc.

-  A single Bourne shell is used to execute each command, thus the
   shell's ``$$`` variable is useless, changing directories does not
   work across command lines, etc.

-  If no special characters exist in a command line, PMake will break
   the command into words itself and execute the command directly,
   without executing a shell first. The characters that cause PMake to
   execute a shell are: ``#``, ``=``, ``|``, ``^``, ``(``, ``)``, ``{``,
   ``}``, ``;``, ``&``, ``>``, ``<``, ``*``, ``?``, ``[``, ``]``, ``:``,
   ``$``, `````, and ``\``. You should notice that these are all the
   characters that are given special meaning by the shell (except ``'``
   and ``,`` which PMake deals with all by its lonesome).

-  The use of the null suffix is turned off.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+-----------------------------+
| `Prev <defcon2.html>`__?                   | `Up <gods.html>`__      | ?\ `Next <theway.html>`__   |
+--------------------------------------------+-------------------------+-----------------------------+
| 4.7.?DEFCON 2 – The Number of the Beast?   | `Home <index.html>`__   | ?4.9.?The Way Things Work   |
+--------------------------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
