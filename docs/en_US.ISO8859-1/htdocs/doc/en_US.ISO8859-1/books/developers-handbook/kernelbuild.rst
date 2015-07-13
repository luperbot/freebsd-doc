===================================================
Chapter?9.?Building and Installing a FreeBSD Kernel
===================================================

.. raw:: html

   <div class="navheader">

Chapter?9.?Building and Installing a FreeBSD Kernel
`Prev <kernel.html>`__?
Part?III.?Kernel
?\ `Next <kernelbuild-new.html>`__

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

Chapter?9.?Building and Installing a FreeBSD Kernel
---------------------------------------------------

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

`9.1. Building a Kernel the “Traditional”
Way <kernelbuild.html#kernelbuild-traditional>`__
`9.2. Building a Kernel the “New” Way <kernelbuild-new.html>`__

.. raw:: html

   </div>

Being a kernel developer requires understanding of the kernel build
process. To debug the FreeBSD kernel it is required to be able to build
one. There are two known ways to do so:

.. raw:: html

   <div class="itemizedlist">

-  The “Traditional” Way

-  The “New” Way

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is supposed that the reader of this chapter is familiar with the
information described in the `Building and Installing a Custom
Kernel <../handbook/kernelconfig-building.html>`__ chapter of the
FreeBSD Handbook. If this is not the case, please read through the above
mentioned chapter to understand how the build process works.

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

9.1.?Building a Kernel the “Traditional” Way
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Up to version 4.X of FreeBSD this was the recommended way to build a new
kernel. It can still be used on newer versions (instead of the
“buildkernel” target of the toplevel ``/usr/src/`` makefiles). Building
the kernel this way may be useful when working on the kernel code and it
may actually be faster than the “New” procedure when only a single
option or two were tweaked in the kernel configuration file. On the
other hand, it might lead to unexpected kernel build breakage when used
by beginners on newer versions of FreeBSD.

.. raw:: html

   <div class="procedure">

#. Run
   `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
   to generate the kernel source code:

   .. code:: screen

       # /usr/sbin/config MYKERNEL

#. Change into the build directory.
   `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
   will print the name of this directory after being run as above.

   .. code:: screen

       # cd ../compile/MYKERNEL

#. Compile the kernel:

   .. code:: screen

       # make depend
       # make

#. Install the new kernel:

   .. code:: screen

       # make install

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+-----------------------------------------+
| `Prev <kernel.html>`__?   | `Up <kernel.html>`__    | ?\ `Next <kernelbuild-new.html>`__      |
+---------------------------+-------------------------+-----------------------------------------+
| Part?III.?Kernel?         | `Home <index.html>`__   | ?9.2.?Building a Kernel the “New” Way   |
+---------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
