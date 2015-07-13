=======================================
Chapter?13.?The FreeBSD Booting Process
=======================================

.. raw:: html

   <div class="navheader">

Chapter?13.?The FreeBSD Booting Process
`Prev <acpi-overview.html>`__?
Part?III.?System Administration
?\ `Next <boot-introduction.html>`__

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

Chapter?13.?The FreeBSD Booting Process
---------------------------------------

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

`13.1. Synopsis <boot.html#boot-synopsis>`__
`13.2. FreeBSD Boot Process <boot-introduction.html>`__
`13.3. Configuring Boot Time Splash Screens <boot-splash.html>`__
`13.4. Device Hints <device-hints.html>`__
`13.5. Shutdown Sequence <boot-shutdown.html>`__

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

13.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The process of starting a computer and loading the operating system is
referred to as “the bootstrap process”, or “booting”. FreeBSD's boot
process provides a great deal of flexibility in customizing what happens
when the system starts, including the ability to select from different
operating systems installed on the same computer, different versions of
the same operating system, or a different installed kernel.

This chapter details the configuration options that can be set. It
demonstrates how to customize the FreeBSD boot process, including
everything that happens until the FreeBSD kernel has started, probed for
devices, and started
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__.
This occurs when the text color of the boot messages changes from bright
white to grey.

After reading this chapter, you will recognize:

.. raw:: html

   <div class="itemizedlist">

-  The components of the FreeBSD bootstrap system and how they interact.

-  The options that can be passed to the components in the FreeBSD
   bootstrap in order to control the boot process.

-  How to configure a customized boot splash screen.

-  The basics of setting device hints.

-  How to boot into single- and multi-user mode and how to properly shut
   down a FreeBSD system.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This chapter only describes the boot process for FreeBSD running on x86
and amd64 systems.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------------------+----------------------------------------+
| `Prev <acpi-overview.html>`__?          | `Up <system-administration.html>`__   | ?\ `Next <boot-introduction.html>`__   |
+-----------------------------------------+---------------------------------------+----------------------------------------+
| 12.13.?Power and Resource Management?   | `Home <index.html>`__                 | ?13.2.?FreeBSD Boot Process            |
+-----------------------------------------+---------------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
