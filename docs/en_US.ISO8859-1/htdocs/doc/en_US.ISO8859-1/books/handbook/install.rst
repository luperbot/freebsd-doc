=================================
Chapter?3.?Installing FreeBSD?8.X
=================================

.. raw:: html

   <div class="navheader">

Chapter?3.?Installing FreeBSD?8.\ *``X``*
`Prev <using-live-cd.html>`__?
Part?I.?Getting Started
?\ `Next <install-hardware.html>`__

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

Chapter?3.?Installing FreeBSD?8.\ *``X``*
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Restructured, reorganized, and parts rewritten by Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

The sysinstall walkthrough, screenshots, and general copy by Randy
Pratt.

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

`3.1. Synopsis <install.html#install-synopsis>`__
`3.2. Hardware Requirements <install-hardware.html>`__
`3.3. Pre-installation Tasks <install-pre.html>`__
`3.4. Starting the Installation <install-start.html>`__
`3.5. Introducing sysinstall(8) <using-sysinstall.html>`__
`3.6. Allocating Disk Space <install-steps.html>`__
`3.7. Choosing What to Install <install-choosing.html>`__
`3.8. Choosing the Installation Media <install-media.html>`__
`3.9. Committing to the Installation <install-final-warning.html>`__
`3.10. Post-installation <install-post.html>`__
`3.11. Troubleshooting <install-trouble.html>`__
`3.12. Advanced Installation Guide <install-advanced.html>`__
`3.13. Preparing Custom Installation Media <install-diff-media.html>`__

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

3.1.?Synopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides a text-based, easy to use installation program. FreeBSD
9.0-RELEASE and later use the installation program known as
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__
while FreeBSD?8.\ *``X``* uses
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__.
This chapter describes how to use
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__.
The use of
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__
is covered in `Chapter?2, *Installing FreeBSD?9.\ *``X``* and
Later* <bsdinstall.html>`__.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  How to create the FreeBSD installation media.

-  How FreeBSD refers to and subdivides hard disks.

-  How to start
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__.

-  The questions
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
   asks, what they mean, and how to answer them.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Read the supported hardware list that shipped with the version of
   FreeBSD to install, and verify that the system's hardware is
   supported.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In general, these installation instructions are written for the i386™
and FreeBSD/amd64 architectures. Where applicable, instructions specific
to other platforms will be listed. There may be minor differences
between the installer and what is shown here. This chapter should be
used as a general guide rather than a literal installation manual.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------+---------------------------------------+
| `Prev <using-live-cd.html>`__?   | `Up <getting-started.html>`__   | ?\ `Next <install-hardware.html>`__   |
+----------------------------------+---------------------------------+---------------------------------------+
| 2.10.?Using the Live CD?         | `Home <index.html>`__           | ?3.2.?Hardware Requirements           |
+----------------------------------+---------------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
