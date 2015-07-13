===========================================
Chapter?2.?Installing FreeBSD?9.X and Later
===========================================

.. raw:: html

   <div class="navheader">

Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
`Prev <history.html>`__?
Part?I.?Getting Started
?\ `Next <bsdinstall-hardware.html>`__

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

Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
---------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Restructured, reorganized, and parts rewritten by Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated for bsdinstall by Gavin Atkinson and Warren Block.

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated for root-on-ZFS by Allan Jude.

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

`2.1. Synopsis <bsdinstall.html#bsdinstall-synopsis>`__
`2.2. Minimum Hardware Requirements <bsdinstall-hardware.html>`__
`2.3. Pre-Installation Tasks <bsdinstall-pre.html>`__
`2.4. Starting the Installation <bsdinstall-start.html>`__
`2.5. Using bsdinstall <using-bsdinstall.html>`__
`2.6. Allocating Disk Space <bsdinstall-partitioning.html>`__
`2.7. Committing to the Installation <bsdinstall-final-warning.html>`__
`2.8. Post-Installation <bsdinstall-post.html>`__
`2.9. Troubleshooting <bsdinstall-install-trouble.html>`__
`2.10. Using the Live CD <using-live-cd.html>`__

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

2.1.?Synopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginning with FreeBSD?9.0-RELEASE, FreeBSD provides an easy to use,
text-based installation program named bsdinstall. This chapter describes
how to install FreeBSD using bsdinstall. The use of sysinstall, which is
the installation program used by FreeBSD?8.x, is covered in `Chapter?3,
*Installing FreeBSD?8.\ *``X``** <install.html>`__.

In general, the installation instructions in this chapter are written
for the i386™ and AMD64 architectures. Where applicable, instructions
specific to other platforms will be listed. There may be minor
differences between the installer and what is shown here, so use this
chapter as a general guide rather than as a set of literal instructions.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Users who prefer to install FreeBSD using a graphical installer may be
interested in pc-sysinstall, the installer used by the PC-BSD Project.
It can be used to install either a graphical desktop (PC-BSD) or a
command line version of FreeBSD. Refer to the PC-BSD Users Handbook for
details
(http://wiki.pcbsd.org/index.php/PC-BSD%C2%AE_Users_Handbook/10.1).

.. raw:: html

   </div>

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  The minimum hardware requirements and FreeBSD supported
   architectures.

-  How to create the FreeBSD installation media.

-  How to start bsdinstall.

-  The questions bsdinstall will ask, what they mean, and how to answer
   them.

-  How to troubleshoot a failed installation.

-  How to access a live version of FreeBSD before committing to an
   installation.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Read the supported hardware list that shipped with the version of
   FreeBSD to be installed and verify that the system's hardware is
   supported.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------------+------------------------------------------+
| `Prev <history.html>`__?          | `Up <getting-started.html>`__   | ?\ `Next <bsdinstall-hardware.html>`__   |
+-----------------------------------+---------------------------------+------------------------------------------+
| 1.3.?About the FreeBSD?Project?   | `Home <index.html>`__           | ?2.2.?Minimum Hardware Requirements      |
+-----------------------------------+---------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
