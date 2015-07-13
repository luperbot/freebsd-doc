==================================================
Chapter?1.?Bootstrapping and Kernel Initialization
==================================================

.. raw:: html

   <div class="navheader">

Chapter?1.?Bootstrapping and Kernel Initialization
`Prev <kernel.html>`__?
Part?I.?Kernel
?\ `Next <boot-overview.html>`__

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

Chapter?1.?Bootstrapping and Kernel Initialization
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Sergey Lyubka.

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated and enhanced by Sergio Andr?s G?mez del Real.

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

`1.1. Synopsis <boot.html#boot-synopsis>`__
`1.2. Overview <boot-overview.html>`__
`1.3. The BIOS <boot-bios.html>`__
`1.4. The Master Boot Record (``boot0``) <boot-boot0.html>`__
`1.5. ``boot1`` Stage <boot-boot1.html>`__
`1.6. The BTX Server <btx-server.html>`__
`1.7. boot2 Stage <boot2.html>`__
`1.8. loader Stage <boot-loader.html>`__
`1.9. Kernel Initialization <boot-kernel.html>`__

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

1.1.?Synopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This chapter is an overview of the boot and system initialization
processes, starting from the BIOS (firmware) POST, to the first user
process creation. Since the initial steps of system startup are very
architecture dependent, the IA-32 architecture is used as an example.

The FreeBSD boot process can be surprisingly complex. After control is
passed from the BIOS, a considerable amount of low-level configuration
must be done before the kernel can be loaded and executed. This setup
must be done in a simple and flexible manner, allowing the user a great
deal of customization possibilities.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+------------------------------------+
| `Prev <kernel.html>`__?   | `Up <kernel.html>`__    | ?\ `Next <boot-overview.html>`__   |
+---------------------------+-------------------------+------------------------------------+
| Part?I.?Kernel?           | `Home <index.html>`__   | ?1.2.?Overview                     |
+---------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
