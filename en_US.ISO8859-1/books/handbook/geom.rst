=======================================================
Chapter?19.?GEOM: Modular Disk Transformation Framework
=======================================================

.. raw:: html

   <div class="navheader">

Chapter?19.?GEOM: Modular Disk Transformation Framework
`Prev <disks-hast.html>`__?
Part?III.?System Administration
?\ `Next <geom-striping.html>`__

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

Chapter?19.?GEOM: Modular Disk Transformation Framework
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

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

`19.1. Synopsis <geom.html#geom-synopsis>`__
`19.2. RAID0 - Striping <geom-striping.html>`__
`19.3. RAID1 - Mirroring <geom-mirror.html>`__
`19.4. RAID3 - Byte-level Striping with Dedicated
Parity <geom-raid3.html>`__
`19.5. Software RAID Devices <geom-graid.html>`__
`19.6. GEOM Gate Network <geom-ggate.html>`__
`19.7. Labeling Disk Devices <geom-glabel.html>`__
`19.8. UFS Journaling Through GEOM <geom-gjournal.html>`__

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

19.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, the GEOM framework permits access and control to classes,
such as Master Boot Records and BSD labels, through the use of
providers, or the disk devices in ``/dev``. By supporting various
software RAID configurations, GEOM transparently provides access to the
operating system and operating system utilities.

This chapter covers the use of disks under the GEOM framework in
FreeBSD. This includes the major RAID control utilities which use the
framework for configuration. This chapter is not a definitive guide to
RAID configurations and only GEOM-supported RAID classifications are
discussed.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  What type of RAID support is available through GEOM.

-  How to use the base utilities to configure, maintain, and manipulate
   the various RAID levels.

-  How to mirror, stripe, encrypt, and remotely connect disk devices
   through GEOM.

-  How to troubleshoot disks attached to the GEOM framework.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand how FreeBSD treats disk devices (`Chapter?18,
   *Storage* <disks.html>`__).

-  Know how to configure and install a new kernel (`Chapter?9,
   *Configuring the FreeBSD Kernel* <kernelconfig.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------------+------------------------------------+
| `Prev <disks-hast.html>`__?               | `Up <system-administration.html>`__   | ?\ `Next <geom-striping.html>`__   |
+-------------------------------------------+---------------------------------------+------------------------------------+
| 18.14.?Highly Available Storage (HAST)?   | `Home <index.html>`__                 | ?19.2.?RAID0 - Striping            |
+-------------------------------------------+---------------------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
