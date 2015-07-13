==========================
Chapter?22.?Virtualization
==========================

.. raw:: html

   <div class="navheader">

Chapter?22.?Virtualization
`Prev <filesystems-linux.html>`__?
Part?III.?System Administration
?\ `Next <virtualization-guest.html>`__

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

Chapter?22.?Virtualization
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   <div>

bhyve section by Allan Jude.

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

`22.1. Synopsis <virtualization.html#virtualization-synopsis>`__
`22.2. FreeBSD as a Guest OS <virtualization-guest.html>`__
`22.3. FreeBSD as a Host with
VirtualBox <virtualization-host-virtualbox.html>`__
`22.4. FreeBSD as a Host with bhyve <virtualization-host-bhyve.html>`__

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

22.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Virtualization software allows multiple operating systems to run
simultaneously on the same computer. Such software systems for PCs often
involve a host operating system which runs the virtualization software
and supports any number of guest operating systems.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  The difference between a host operating system and a guest operating
   system.

-  How to install FreeBSD on an Intel?-based Apple? Mac? computer.

-  How to install FreeBSD on Microsoft??Windows? with Virtual PC.

-  How to install FreeBSD as a guest in bhyve.

-  How to tune a FreeBSD system for best performance under
   virtualization.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand the `basics of UNIX? and FreeBSD <basics.html>`__.

-  Know how to `install FreeBSD <install.html>`__.

-  Know how to `set up a network
   connection <advanced-networking.html>`__.

-  Know how to `install additional third-party software <ports.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------------+-------------------------------------------+
| `Prev <filesystems-linux.html>`__?   | `Up <system-administration.html>`__   | ?\ `Next <virtualization-guest.html>`__   |
+--------------------------------------+---------------------------------------+-------------------------------------------+
| 21.2.?Linux? File Systems?           | `Home <index.html>`__                 | ?22.2.?FreeBSD as a Guest OS              |
+--------------------------------------+---------------------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
