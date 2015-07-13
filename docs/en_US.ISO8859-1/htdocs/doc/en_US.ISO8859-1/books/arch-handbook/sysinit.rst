================================
Chapter?5.?The SYSINIT Framework
================================

.. raw:: html

   <div class="navheader">

Chapter?5.?The SYSINIT Framework
`Prev <jail-restrictions.html>`__?
Part?I.?Kernel
?\ `Next <sysinit-operation.html>`__

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

Chapter?5.?The SYSINIT Framework
--------------------------------

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

`5.1. Terminology <sysinit.html#sysinit-term>`__
`5.2. SYSINIT Operation <sysinit-operation.html>`__
`5.3. Using SYSINIT <sysinit-using.html>`__

.. raw:: html

   </div>

SYSINIT is the framework for a generic call sort and dispatch mechanism.
FreeBSD currently uses it for the dynamic initialization of the kernel.
SYSINIT allows FreeBSD's kernel subsystems to be reordered, and added,
removed, and replaced at kernel link time when the kernel or one of its
modules is loaded without having to edit a statically ordered
initialization routing and recompile the kernel. This system also allows
kernel modules, currently called *KLD's*, to be separately compiled,
linked, and initialized at boot time and loaded even later while the
system is already running. This is accomplished using the “kernel
linker” and “linker sets”.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?Terminology
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

Linker Set
    A linker technique in which the linker gathers statically declared
    data throughout a program's source files into a single contiguously
    addressable unit of data.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+----------------------------------------+
| `Prev <jail-restrictions.html>`__?   | `Up <kernel.html>`__    | ?\ `Next <sysinit-operation.html>`__   |
+--------------------------------------+-------------------------+----------------------------------------+
| 4.2.?Restrictions?                   | `Home <index.html>`__   | ?5.2.?SYSINIT Operation                |
+--------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
