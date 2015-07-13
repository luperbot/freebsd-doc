===============================
FreeBSD and Solid State Devices
===============================

.. raw:: html

   <div class="navheader">

FreeBSD and Solid State Devices
?
?
?\ `Next <kernel.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

John Kozubik
~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| 
|  ????\ ``<john@kozubik.com>``
|  ??

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2001, 2009 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Copyright <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

This article covers the use of solid state disk devices in FreeBSD to
create embedded systems.

Embedded systems have the advantage of increased stability due to the
lack of integral moving parts (hard drives). Account must be taken,
however, for the generally low disk space available in the system and
the durability of the storage medium.

Specific topics to be covered include the types and attributes of solid
state media suitable for disk use in FreeBSD, kernel options that are of
interest in such an environment, the ``rc.initdiskless`` mechanisms that
automate the initialization of such systems and the need for read-only
filesystems, and building filesystems from scratch. The article will
conclude with some general strategies for small and read-only FreeBSD
environments.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Solid State Disk Devices <index.html#intro>`__
`2. Kernel Options <kernel.html>`__
`3. The ``rc`` Subsystem and Read-Only Filesystems <ro-fs.html>`__
`4. Building a File System from Scratch <ar01s04.html>`__
`5. System Strategies for Small and Read Only
Environments <strategies.html>`__

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

1.?Solid State Disk Devices
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The scope of this article will be limited to solid state disk devices
made from flash memory. Flash memory is a solid state memory (no moving
parts) that is non-volatile (the memory maintains data even after all
power sources have been disconnected). Flash memory can withstand
tremendous physical shock and is reasonably fast (the flash memory
solutions covered in this article are slightly slower than a EIDE hard
disk for write operations, and much faster for read operations). One
very important aspect of flash memory, the ramifications of which will
be discussed later in this article, is that each sector has a limited
rewrite capacity. You can only write, erase, and write again to a sector
of flash memory a certain number of times before the sector becomes
permanently unusable. Although many flash memory products automatically
map bad blocks, and although some even distribute write operations
evenly throughout the unit, the fact remains that there exists a limit
to the amount of writing that can be done to the device. Competitive
units have between 1,000,000 and 10,000,000 writes per sector in their
specification. This figure varies due to the temperature of the
environment.

Specifically, we will be discussing ATA compatible compact-flash units,
which are quite popular as storage media for digital cameras. Of
particular interest is the fact that they pin out directly to the IDE
bus and are compatible with the ATA command set. Therefore, with a very
simple and low-cost adaptor, these devices can be attached directly to
an IDE bus in a computer. Once implemented in this manner, operating
systems such as FreeBSD see the device as a normal hard disk (albeit
small).

Other solid state disk solutions do exist, but their expense, obscurity,
and relative unease of use places them beyond the scope of this article.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------+
| ?   | ?   | ?\ `Next <kernel.html>`__   |
+-----+-----+-----------------------------+
| ?   | ?   | ?2.?Kernel Options          |
+-----+-----+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
