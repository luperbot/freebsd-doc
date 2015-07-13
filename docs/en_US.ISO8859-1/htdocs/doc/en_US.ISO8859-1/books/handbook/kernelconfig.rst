=========================================
Chapter?9.?Configuring the FreeBSD Kernel
=========================================

.. raw:: html

   <div class="navheader">

Chapter?9.?Configuring the FreeBSD Kernel
`Prev <scanners.html>`__?
Part?II.?Common Tasks
?\ `Next <kernelconfig-custom-kernel.html>`__

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

Chapter?9.?Configuring the FreeBSD Kernel
-----------------------------------------

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

`9.1. Synopsis <kernelconfig.html#kernelconfig-synopsis>`__
`9.2. Why Build a Custom Kernel? <kernelconfig-custom-kernel.html>`__
`9.3. Finding the System Hardware <kernelconfig-devices.html>`__
`9.4. The Configuration File <kernelconfig-config.html>`__
`9.5. Building and Installing a Custom
Kernel <kernelconfig-building.html>`__
`9.6. If Something Goes Wrong <kernelconfig-trouble.html>`__

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

9.1.?Synopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The kernel is the core of the FreeBSD operating system. It is
responsible for managing memory, enforcing security controls,
networking, disk access, and much more. While much of FreeBSD is
dynamically configurable, it is still occasionally necessary to
configure and compile a custom kernel.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  When to build a custom kernel.

-  How to take a hardware inventory.

-  How to customize a kernel configuration file.

-  How to use the kernel configuration file to create and build a new
   kernel.

-  How to install the new kernel.

-  How to troubleshoot if things go wrong.

.. raw:: html

   </div>

All of the commands listed in the examples in this chapter should be
executed as ``root``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+------------------------------+-------------------------------------------------+
| `Prev <scanners.html>`__?   | `Up <common-tasks.html>`__   | ?\ `Next <kernelconfig-custom-kernel.html>`__   |
+-----------------------------+------------------------------+-------------------------------------------------+
| 8.7.?Image Scanners?        | `Home <index.html>`__        | ?9.2.?Why Build a Custom Kernel?                |
+-----------------------------+------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
