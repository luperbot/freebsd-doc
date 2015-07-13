=======================================
Chapter?11.?Linux? Binary Compatibility
=======================================

.. raw:: html

   <div class="navheader">

Chapter?11.?Linux? Binary Compatibility
`Prev <printing-other.html>`__?
Part?II.?Common Tasks
?\ `Next <linuxemu-lbc-install.html>`__

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

Chapter?11.?Linux? Binary Compatibility
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Restructured and parts updated by Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally contributed by Brian N. Handy and Rich Murphey.

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

`11.1. Synopsis <linuxemu.html#linuxemu-synopsis>`__
`11.2. Configuring Linux? Binary
Compatibility <linuxemu-lbc-install.html>`__
`11.3. Advanced Topics <linuxemu-advanced.html>`__

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

11.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides 32-bit binary compatibility with Linux?, allowing users
to install and run most 32-bit Linux? binaries on a FreeBSD system
without having to first modify the binary. It has even been reported
that, in some situations, 32-bit Linux? binaries perform better on
FreeBSD than they do on Linux?.

However, some Linux?-specific operating system features are not
supported under FreeBSD. For example, Linux? binaries will not work on
FreeBSD if they overly use i386™ specific calls, such as enabling
virtual 8086 mode. In addition, 64-bit Linux? binaries are not supported
at this time.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  How to enable Linux? binary compatibility on a FreeBSD system.

-  How to install additional Linux? shared libraries.

-  How to install Linux? applications on a FreeBSD system.

-  The implementation details of Linux? compatibility in FreeBSD.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Know how to install `additional third-party software <ports.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+------------------------------+--------------------------------------------------+
| `Prev <printing-other.html>`__?   | `Up <common-tasks.html>`__   | ?\ `Next <linuxemu-lbc-install.html>`__          |
+-----------------------------------+------------------------------+--------------------------------------------------+
| 10.6.?Other Printing Systems?     | `Home <index.html>`__        | ?11.2.?Configuring Linux? Binary Compatibility   |
+-----------------------------------+------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
