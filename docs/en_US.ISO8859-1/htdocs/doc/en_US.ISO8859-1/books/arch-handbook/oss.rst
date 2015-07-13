===========================
Chapter?15.?Sound Subsystem
===========================

.. raw:: html

   <div class="navheader">

Chapter?15.?Sound Subsystem
`Prev <newbus-api.html>`__?
Part?II.?Device Drivers
?\ `Next <oss-files.html>`__

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

Chapter?15.?Sound Subsystem
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Jean-Francois Dockes.

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

`15.1. Introduction <oss.html#oss-intro>`__
`15.2. Files <oss-files.html>`__
`15.3. Probing, Attaching, etc. <pcm-probe-and-attach.html>`__
`15.4. Interfaces <oss-interfaces.html>`__

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

15.1.?Introduction
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD sound subsystem cleanly separates generic sound handling
issues from device-specific ones. This makes it easier to add support
for new hardware.

The `pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__
framework is the central piece of the sound subsystem. It mainly
implements the following elements:

.. raw:: html

   <div class="itemizedlist">

-  A system call interface (read, write, ioctls) to digitized sound and
   mixer functions. The ioctl command set is compatible with the legacy
   *OSS* or *Voxware* interface, allowing common multimedia applications
   to be ported without modification.

-  Common code for processing sound data (format conversions, virtual
   channels).

-  A uniform software interface to hardware-specific audio interface
   modules.

-  Additional support for some common hardware interfaces (ac97), or
   shared hardware-specific code (ex: ISA DMA routines).

.. raw:: html

   </div>

The support for specific sound cards is implemented by hardware-specific
drivers, which provide channel and mixer interfaces to plug into the
generic ``pcm`` code.

In this chapter, the term ``pcm`` will refer to the central, common part
of the sound driver, as opposed to the hardware-specific modules.

The prospective driver writer will of course want to start from an
existing module and use the code as the ultimate reference. But, while
the sound code is nice and clean, it is also mostly devoid of comments.
This document tries to give an overview of the framework interface and
answer some questions that may arise while adapting the existing code.

As an alternative, or in addition to starting from a working example,
you can find a commented driver template at
http://people.FreeBSD.org/~cg/template.c

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------+--------------------------------+
| `Prev <newbus-api.html>`__?   | `Up <devicedrivers.html>`__   | ?\ `Next <oss-files.html>`__   |
+-------------------------------+-------------------------------+--------------------------------+
| 14.3.?Newbus API?             | `Home <index.html>`__         | ?15.2.?Files                   |
+-------------------------------+-------------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
