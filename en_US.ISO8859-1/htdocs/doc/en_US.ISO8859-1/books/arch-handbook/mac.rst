=======================================
Chapter?6.?The TrustedBSD MAC Framework
=======================================

.. raw:: html

   <div class="navheader">

Chapter?6.?The TrustedBSD MAC Framework
`Prev <sysinit-using.html>`__?
Part?I.?Kernel
?\ `Next <mac-synopsis.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?6.?The TrustedBSD MAC Framework
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Chris Costello and Robert Watson.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`6.1. MAC Documentation Copyright <mac.html#mac-copyright>`__
`6.2. Synopsis <mac-synopsis.html>`__
`6.3. Introduction <mac-introduction.html>`__
`6.4. Policy Background <mac-background.html>`__
`6.5. MAC Framework Kernel
Architecture <mac-framework-kernel-arch.html>`__
`6.6. MAC Policy Architecture <mac-policy-architecture.html>`__
`6.7. MAC Policy Entry Point
Reference <mac-entry-point-reference.html>`__
`6.8. Userland Architecture <mac-userland-arch.html>`__
`6.9. Conclusion <mac-conclusion.html>`__

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

6.1.?MAC Documentation Copyright
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This documentation was developed for the FreeBSD Project by Chris
Costello at Safeport Network Services and Network Associates
Laboratories, the Security Research Division of Network Associates, Inc.
under DARPA/SPAWAR contract N66001-01-C-8035 (“CBOSS”), as part of the
DARPA CHATS research program.

Redistribution and use in source (SGML DocBook) and 'compiled' forms
(SGML, HTML, PDF, PostScript, RTF and so forth) with or without
modification, are permitted provided that the following conditions are
met:

.. raw:: html

   <div class="orderedlist">

#. Redistributions of source code (SGML DocBook) must retain the above
   copyright notice, this list of conditions and the following
   disclaimer as the first lines of this file unmodified.

#. Redistributions in compiled form (transformed to other DTDs,
   converted to PDF, PostScript, RTF and other formats) must reproduce
   the above copyright notice, this list of conditions and the following
   disclaimer in the documentation and/or other materials provided with
   the distribution.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

THIS DOCUMENTATION IS PROVIDED BY THE NETWORKS ASSOCIATES TECHNOLOGY,
INC "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL NETWORKS ASSOCIATES
TECHNOLOGY, INC BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
DOCUMENTATION, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-----------------------------------+
| `Prev <sysinit-using.html>`__?   | `Up <kernel.html>`__    | ?\ `Next <mac-synopsis.html>`__   |
+----------------------------------+-------------------------+-----------------------------------+
| 5.3.?Using SYSINIT?              | `Home <index.html>`__   | ?6.2.?Synopsis                    |
+----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
