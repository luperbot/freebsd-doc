=================================================
Chapter?12.?Common Access Method SCSI Controllers
=================================================

.. raw:: html

   <div class="navheader">

Chapter?12.?Common Access Method SCSI Controllers
`Prev <pci-bus.html>`__?
Part?II.?Device Drivers
?\ `Next <scsi-general.html>`__

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

Chapter?12.?Common Access Method SCSI Controllers
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Sergey Babkin.

.. raw:: html

   </div>

.. raw:: html

   <div>

Modifications for Handbook made by Murray Stokely.

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

`12.1. Synopsis <scsi.html#scsi-synopsis>`__
`12.2. General Architecture <scsi-general.html>`__
`12.3. Polling <scsi-polling.html>`__
`12.4. Asynchronous Events <scsi-async.html>`__
`12.5. Interrupts <scsi-interrupts.html>`__
`12.6. Errors Summary <scsi-errors.html>`__
`12.7. Timeout Handling <scsi-timeout.html>`__

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

12.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document assumes that the reader has a general understanding of
device drivers in FreeBSD and of the SCSI protocol. Much of the
information in this document was extracted from the drivers:

.. raw:: html

   <div class="itemizedlist">

-  ncr (``/sys/pci/ncr.c``) by Wolfgang Stanglmeier and Stefan Esser

-  sym (``/sys/dev/sym/sym_hipd.c``) by Gerard Roudier

-  aic7xxx (``/sys/dev/aic7xxx/aic7xxx.c``) by Justin T. Gibbs

.. raw:: html

   </div>

and from the CAM code itself (by Justin T. Gibbs, see ``/sys/cam/*``).
When some solution looked the most logical and was essentially verbatim
extracted from the code by Justin T. Gibbs, I marked it as
“recommended”.

The document is illustrated with examples in pseudo-code. Although
sometimes the examples have many details and look like real code, it is
still pseudo-code. It was written to demonstrate the concepts in an
understandable way. For a real driver other approaches may be more
modular and efficient. It also abstracts from the hardware details, as
well as issues that would cloud the demonstrated concepts or that are
supposed to be described in the other chapters of the developers
handbook. Such details are commonly shown as calls to functions with
descriptive names, comments or pseudo-statements. Fortunately real life
full-size examples with all the details can be found in the real
drivers.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------------+-----------------------------------+
| `Prev <pci-bus.html>`__?   | `Up <devicedrivers.html>`__   | ?\ `Next <scsi-general.html>`__   |
+----------------------------+-------------------------------+-----------------------------------+
| 11.2.?Bus Resources?       | `Home <index.html>`__         | ?12.2.?General Architecture       |
+----------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
