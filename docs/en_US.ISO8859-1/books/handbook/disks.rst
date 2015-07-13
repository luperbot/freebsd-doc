===================
Chapter?18.?Storage
===================

.. raw:: html

   <div class="navheader">

Chapter?18.?Storage
`Prev <audit-administration.html>`__?
Part?III.?System Administration
?\ `Next <disks-adding.html>`__

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

Chapter?18.?Storage
-------------------

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

`18.1. Synopsis <disks.html#disks-synopsis>`__
`18.2. Adding Disks <disks-adding.html>`__
`18.3. Resizing and Growing Disks <disks-growing.html>`__
`18.4. USB Storage Devices <usb-disks.html>`__
`18.5. Creating and Using CD Media <creating-cds.html>`__
`18.6. Creating and Using DVD Media <creating-dvds.html>`__
`18.7. Creating and Using Floppy Disks <floppies.html>`__
`18.8. Backup Basics <backup-basics.html>`__
`18.9. Memory Disks <disks-virtual.html>`__
`18.10. File System Snapshots <snapshots.html>`__
`18.11. Disk Quotas <quotas.html>`__
`18.12. Encrypting Disk Partitions <disks-encrypting.html>`__
`18.13. Encrypting Swap <swap-encrypting.html>`__
`18.14. Highly Available Storage (HAST) <disks-hast.html>`__

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

18.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This chapter covers the use of disks and storage media in FreeBSD. This
includes SCSI and IDE disks, CD and DVD media, memory-backed disks, and
USB storage devices.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  How to add additional hard disks to a FreeBSD system.

-  How to grow the size of a disk's partition on FreeBSD.

-  How to configure FreeBSD to use USB storage devices.

-  How to use CD and DVD media on a FreeBSD system.

-  How to use the backup programs available under FreeBSD.

-  How to set up memory disks.

-  What file system snapshots are and how to use them efficiently.

-  How to use quotas to limit disk space usage.

-  How to encrypt disks and swap to secure them against attackers.

-  How to configure a highly available storage network.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Know how to `configure and install a new FreeBSD
   kernel <kernelconfig.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------------------+-----------------------------------+
| `Prev <audit-administration.html>`__?   | `Up <system-administration.html>`__   | ?\ `Next <disks-adding.html>`__   |
+-----------------------------------------+---------------------------------------+-----------------------------------+
| 17.4.?Working with Audit Trails?        | `Home <index.html>`__                 | ?18.2.?Adding Disks               |
+-----------------------------------------+---------------------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
