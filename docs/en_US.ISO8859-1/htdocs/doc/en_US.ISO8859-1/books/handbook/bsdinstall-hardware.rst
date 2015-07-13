==================================
2.2.?Minimum Hardware Requirements
==================================

.. raw:: html

   <div class="navheader">

2.2.?Minimum Hardware Requirements
`Prev <bsdinstall.html>`__?
Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
?\ `Next <bsdinstall-pre.html>`__

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

2.2.?Minimum Hardware Requirements
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The hardware requirements to install FreeBSD vary by the FreeBSD version
and the hardware architecture. Hardware architectures and devices
supported by a FreeBSD release are listed on the Release Information
page of the FreeBSD web site
(`http://www.FreeBSD.org/releases/index.html <../../../../releases/index.html>`__).

A FreeBSD installation will require a minimum 64?MB of RAM and 1.5?GB of
free hard drive space for the most minimal installation. However, that
is a *minimal* install, leaving almost no free space. RAM requirements
depend on usage. Specialized FreeBSD systems can run in as little as
128MB RAM while desktop systems should have at least 4?GB of RAM.

The processor requirements for each architecture can be summarized as
follows:

.. raw:: html

   <div class="variablelist">

amd64
    This is the most common type of processor desktop and laptop
    computers will have. Other vendors may call this architecture
    x86-64.

    There are two primary vendors of amd64 processors: Intel? (which
    produces Intel64 class processors) and AMD (which produces AMD64).

    Examples of amd64 compatible processsors include: AMD?Athlon™64,
    AMD?Opteron™, multi-core Intel??Xeon™, and Intel??Core™?2 and later
    processors.

i386
    This architecture is the 32-bit x86 architecture.

    Almost all i386-compatible processors with a floating point unit are
    supported. All Intel? processors 486 or higher are supported.

    FreeBSD will take advantage of Physical Address Extensions (PAE)
    support on CPUs that support this feature. A kernel with the PAE
    feature enabled will detect memory above 4?GB and allow it to be
    used by the system. This feature places constraints on the device
    drivers and other features of FreeBSD which may be used; refer to
    `pae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pae&sektion=4>`__
    for details.

ia64
    Currently supported processors are the Itanium? and the Itanium? 2.
    Supported chipsets include the HP zx1, Intel? 460GX, and Intel?
    E8870. Both Uniprocessor (UP) and Symmetric Multi-processor (SMP)
    configurations are supported.

pc98
    NEC PC-9801/9821 series with almost all i386-compatible processors,
    including 80486, Pentium?, Pentium? Pro, and Pentium? II, are all
    supported. All i386-compatible processors by AMD, Cyrix, IBM, and
    IDT are also supported. EPSON PC-386/486/586 series, which are
    compatible with NEC PC-9801 series, are supported. The NEC
    FC-9801/9821 and NEC SV-98 series should be supported.

    High-resolution mode is not supported. NEC PC-98XA/XL/RL/XL^2, and
    NEC PC-H98 series are supported in normal (PC-9801 compatible) mode
    only. The SMP-related features of FreeBSD are not supported. The New
    Extend Standard Architecture (NESA) bus used in the PC-H98, SV-H98,
    and FC-H98 series, is not supported.

powerpc
    All New World ROM Apple? Mac? systems with built-in USB are
    supported. SMP is supported on machines with multiple CPUs.

    A 32-bit kernel can only use the first 2?GB of RAM.

sparc64
    Systems supported by FreeBSD/sparc64 are listed at the
    FreeBSD/sparc64 Project
    (`http://www.freebsd.org/platforms/sparc.html <../../../../platforms/sparc.html>`__).

    SMP is supported on all systems with more than 1 processor. A
    dedicated disk is required as it is not possible to share a disk
    with another operating system at this time.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------+----------------------------+-------------------------------------+
| `Prev <bsdinstall.html>`__?                            | `Up <bsdinstall.html>`__   | ?\ `Next <bsdinstall-pre.html>`__   |
+--------------------------------------------------------+----------------------------+-------------------------------------+
| Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later?   | `Home <index.html>`__      | ?2.3.?Pre-Installation Tasks        |
+--------------------------------------------------------+----------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
