=========================
Chapter?3.?Kernel Objects
=========================

.. raw:: html

   <div class="navheader">

Chapter?3.?Kernel Objects
`Prev <locking-atomic.html>`__?
Part?I.?Kernel
?\ `Next <kernel-objects-operation.html>`__

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

Chapter?3.?Kernel Objects
-------------------------

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

`3.1. Terminology <kernel-objects.html#kernel-objects-term>`__
`3.2. Kobj Operation <kernel-objects-operation.html>`__
`3.3. Using Kobj <kernel-objects-using.html>`__

.. raw:: html

   </div>

Kernel Objects, or *Kobj* provides an object-oriented C programming
system for the kernel. As such the data being operated on carries the
description of how to operate on it. This allows operations to be added
and removed from an interface at run time and without breaking binary
compatibility.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Terminology
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

Object
    A set of data - data structure - data allocation.

Method
    An operation - function.

Class
    One or more methods.

Interface
    A standard set of one or more methods.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <locking-atomic.html>`__?        | `Up <kernel.html>`__    | ?\ `Next <kernel-objects-operation.html>`__   |
+----------------------------------------+-------------------------+-----------------------------------------------+
| 2.3.?Atomically Protected Variables?   | `Home <index.html>`__   | ?3.2.?Kobj Operation                          |
+----------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
