=======================
7.5.?KVM Memory Mapping
=======================

.. raw:: html

   <div class="navheader">

7.5.?KVM Memory Mapping
`Prev <vm-pagetables.html>`__?
Chapter?7.?Virtual Memory System
?\ `Next <vm-tuning.html>`__

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

7.5.?KVM Memory Mapping
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD uses KVM to hold various kernel structures. The single largest
entity held in KVM is the filesystem buffer cache. That is, mappings
relating to ``struct buf`` entities.

Unlike Linux, FreeBSD does *not* map all of physical memory into KVM.
This means that FreeBSD can handle memory configurations up to 4G on 32
bit platforms. In fact, if the mmu were capable of it, FreeBSD could
theoretically handle memory configurations up to 8TB on a 32 bit
platform. However, since most 32 bit platforms are only capable of
mapping 4GB of ram, this is a moot point.

KVM is managed through several mechanisms. The main mechanism used to
manage KVM is the *zone allocator*. The zone allocator takes a chunk of
KVM and splits it up into constant-sized blocks of memory in order to
allocate a specific type of structure. You can use ``vmstat -m`` to get
an overview of current KVM utilization broken down by zone.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------+-------------------------+--------------------------------------+
| `Prev <vm-pagetables.html>`__?                             | `Up <vm.html>`__        | ?\ `Next <vm-tuning.html>`__         |
+------------------------------------------------------------+-------------------------+--------------------------------------+
| 7.4.?Mapping Page Tables—\ ``vm_map_t,     vm_entry_t``?   | `Home <index.html>`__   | ?7.6.?Tuning the FreeBSD VM System   |
+------------------------------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
