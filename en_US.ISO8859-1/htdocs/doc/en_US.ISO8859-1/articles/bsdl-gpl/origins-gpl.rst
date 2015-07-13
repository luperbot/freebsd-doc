=========================
5.?The origins of the GPL
=========================

.. raw:: html

   <div class="navheader">

5.?The origins of the GPL
`Prev <current-bsdl.html>`__?
?
?\ `Next <origins-lgpl.html>`__

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

5.?The origins of the GPL
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While the future of Unix had been so muddled in the late 1980s and early
1990s, the GPL, another development with important licensing
considerations, reached fruition.

Richard Stallman, the developer of Emacs, was a member of the staff at
MIT when his lab switched from home-grown to proprietary systems.
Stallman became upset when he found that he could not legally add minor
improvements to the system. (Many of Stallman's co-workers had left to
form two companies based on software developed at MIT and licensed by
MIT; there appears to have been disagreement over access to the source
code for this software). Stallman devised an alternative to the
commercial software license and called it the GPL, or "GNU Public
License". He also started a non-profit foundation, the `Free Software
Foundation <http://www.fsf.org>`__ (FSF), which intended to develop an
entire operating system, including all associated software, that would
not be subject to proprietary licensing. This system was called GNU, for
"GNU is Not Unix".

The GPL was designed to be the antithesis of the standard proprietary
license. To this end, any modifications that were made to a GPL program
were required to be given back to the GPL community (by requiring that
the source of the program be available to the user) and any program that
used or linked to GPL code was required to be under the GPL. The GPL was
intended to keep software from becoming proprietary. As the last
paragraph of the GPL states:

“This General Public License does not permit incorporating your program
into proprietary programs.”[1]

The `GPL <http://www.opensource.org/licenses/gpl-license.php>`__ is a
complex license so here are some rules of thumb when using the GPL:

.. raw:: html

   <div class="itemizedlist">

-  you can charge as much as you want for distributing, supporting, or
   documenting the software, but you cannot sell the software itself.

-  the rule-of-thumb states that if GPL source is required for a program
   to compile, the program must be under the GPL. Linking statically to
   a GPL library requires a program to be under the GPL.

-  the GPL requires that any patents associated with GPLed software must
   be licensed for everyone's free use.

-  simply aggregating software together, as when multiple programs are
   put on one disk, does not count as including GPLed programs in
   non-GPLed programs.

-  output of a program does not count as a derivative work. This enables
   the gcc compiler to be used in commercial environments without legal
   problems.

-  since the Linux kernel is under the GPL, any code statically linked
   with the Linux kernel must be GPLed. This requirement can be
   circumvented by dynamically linking loadable kernel modules. This
   permits companies to distribute binary drivers, but often has the
   disadvantage that they will only work for particular versions of the
   Linux kernel.

.. raw:: html

   </div>

Due in part to its complexity, in many parts of the world today the
legalities of the GPL are being ignored in regard to Linux and related
software. The long-term ramifications of this are unclear.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+-------------------------+-----------------------------------------+
| `Prev <current-bsdl.html>`__?                       | ?                       | ?\ `Next <origins-lgpl.html>`__         |
+-----------------------------------------------------+-------------------------+-----------------------------------------+
| 4.?The Current State of FreeBSD and BSD Licenses?   | `Home <index.html>`__   | ?6.?The origins of Linux and the LGPL   |
+-----------------------------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
