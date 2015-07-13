==============
Part?I.?Kernel
==============

.. raw:: html

   <div class="navheader">

Part?I.?Kernel
`Prev <index.html>`__?
?
?\ `Next <boot.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="part">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

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

`1. Bootstrapping and Kernel Initialization <boot.html>`__
`1.1. Synopsis <boot.html#boot-synopsis>`__
`1.2. Overview <boot-overview.html>`__
`1.3. The BIOS <boot-bios.html>`__
`1.4. The Master Boot Record (``boot0``) <boot-boot0.html>`__
`1.5. ``boot1`` Stage <boot-boot1.html>`__
`1.6. The BTX Server <btx-server.html>`__
`1.7. boot2 Stage <boot2.html>`__
`1.8. loader Stage <boot-loader.html>`__
`1.9. Kernel Initialization <boot-kernel.html>`__
`2. Locking Notes <locking.html>`__
`2.1. Mutexes <locking.html#locking-mutexes>`__
`2.2. Shared Exclusive Locks <locking-sx.html>`__
`2.3. Atomically Protected Variables <locking-atomic.html>`__
`3. Kernel Objects <kernel-objects.html>`__
`3.1. Terminology <kernel-objects.html#kernel-objects-term>`__
`3.2. Kobj Operation <kernel-objects-operation.html>`__
`3.3. Using Kobj <kernel-objects-using.html>`__
`4. The Jail Subsystem <jail.html>`__
`4.1. Architecture <jail.html#jail-arch>`__
`4.2. Restrictions <jail-restrictions.html>`__
`5. The SYSINIT Framework <sysinit.html>`__
`5.1. Terminology <sysinit.html#sysinit-term>`__
`5.2. SYSINIT Operation <sysinit-operation.html>`__
`5.3. Using SYSINIT <sysinit-using.html>`__
`6. The TrustedBSD MAC Framework <mac.html>`__
`6.1. MAC Documentation Copyright <mac.html#mac-copyright>`__
`6.2. Synopsis <mac-synopsis.html>`__
`6.3. Introduction <mac-introduction.html>`__
`6.4. Policy Background <mac-background.html>`__
`6.5. MAC Framework Kernel
Architecture <mac-framework-kernel-arch.html>`__
`6.6. MAC Policy Architecture <mac-policy-architecture.html>`__
`6.7. MAC Policy Entry Point
Reference <mac-entry-point-reference.html>`__
`6.8. Userland Architecture <mac-userland-arch.html>`__
`6.9. Conclusion <mac-conclusion.html>`__
`7. Virtual Memory System <vm.html>`__
`7.1. Management of Physical
Memory—\ ``vm_page_t`` <vm.html#vm-physmem>`__
`7.2. The Unified Buffer Cache—\ ``vm_object_t`` <vm-cache.html>`__
`7.3. Filesystem I/O—\ ``struct buf`` <vm-fileio.html>`__
`7.4. Mapping Page
Tables—\ ``vm_map_t,     vm_entry_t`` <vm-pagetables.html>`__
`7.5. KVM Memory Mapping <vm-kvm.html>`__
`7.6. Tuning the FreeBSD VM System <vm-tuning.html>`__
`8. SMPng Design Document <smp.html>`__
`8.1. Introduction <smp.html#smp-intro>`__
`8.2. Basic Tools and Locking
Fundamentals <smp-lock-fundamentals.html>`__
`8.3. General Architecture and Design <smp-design.html>`__
`8.4. Specific Locking Strategies <smp-lock-strategies.html>`__
`8.5. Implementation Notes <smp-implementation-notes.html>`__
`8.6. Miscellaneous Topics <smp-misc.html>`__
`Glossary <smp.html#smp-glossary>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-------------------------------------------------------+
| `Prev <index.html>`__?           | ?                       | ?\ `Next <boot.html>`__                               |
+----------------------------------+-------------------------+-------------------------------------------------------+
| FreeBSD Architecture Handbook?   | `Home <index.html>`__   | ?Chapter?1.?Bootstrapping and Kernel Initialization   |
+----------------------------------+-------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
