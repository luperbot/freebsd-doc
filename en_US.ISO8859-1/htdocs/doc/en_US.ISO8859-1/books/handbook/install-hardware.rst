==========================
3.2.?Hardware Requirements
==========================

.. raw:: html

   <div class="navheader">

3.2.?Hardware Requirements
`Prev <install.html>`__?
Chapter?3.?Installing FreeBSD?8.\ *``X``*
?\ `Next <install-pre.html>`__

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

3.2.?Hardware Requirements
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.?Minimal Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The minimal configuration to install FreeBSD varies with the FreeBSD
version and the hardware architecture.

A summary of this information is given in the following sections.
Depending on the method chosen to install FreeBSD, a floppy drive, CDROM
drive, or network adapter may be needed. Instructions on how to prepare
the installation media can be found in `Section?3.3.7, “Prepare the Boot
Media” <install-pre.html#install-boot-media>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.1.?FreeBSD/i386 and FreeBSD/pc98
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Both FreeBSD/i386 and FreeBSD/pc98 require a 486 or better processor, at
least 24?MB of RAM, and at least 150?MB of free hard drive space for the
most minimal installation.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In the case of older hardware, installing more RAM and more hard drive
space is often more important than a faster processor.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.2.?FreeBSD/amd64
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two classes of processors capable of running FreeBSD/amd64.
The first are AMD64 processors, including the AMD?Athlon™64,
AMD?Athlon™64-FX, and AMD?Opteron™ or better processors.

The second class of processors includes those using the Intel? EM64T
architecture. Examples of these processors include the Intel??Core™?2
Duo, Quad, Extreme processor families, and the Intel??Xeon™ 3000, 5000,
and 7000 sequences of processors.

If the machine is based on an nVidia nForce3 Pro-150, the BIOS setup
*must* be used to disable the IO APIC. If this option does not exist,
disable ACPI instead as there are bugs in the Pro-150 chipset.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.3.?FreeBSD/sparc64
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To install FreeBSD/sparc64, use a supported platform (see
`Section?3.2.2, “Supported
Hardware” <install-hardware.html#install-hardware-supported>`__).

A dedicated disk is needed for FreeBSD/sparc64 as it is not possible to
share a disk with another operating system at this time.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.2.?Supported Hardware
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A list of supported hardware is provided with each FreeBSD release in
the FreeBSD Hardware Notes. This document can usually be found in a file
named ``HARDWARE.TXT``, in the top-level directory of a CDROM or FTP
distribution, or in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__'s
documentation menu. It lists, for a given architecture, which hardware
devices are known to be supported by each release of FreeBSD. Copies of
the supported hardware list for various releases and architectures can
also be found on the `Release
Information <http://www.FreeBSD.org/releases/index.html>`__ page of the
FreeBSD website.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+----------------------------------+
| `Prev <install.html>`__?                     | `Up <install.html>`__   | ?\ `Next <install-pre.html>`__   |
+----------------------------------------------+-------------------------+----------------------------------+
| Chapter?3.?Installing FreeBSD?8.\ *``X``*?   | `Home <index.html>`__   | ?3.3.?Pre-installation Tasks     |
+----------------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
