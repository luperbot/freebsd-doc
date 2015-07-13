=============================
FreeBSD Architecture Handbook
=============================

.. raw:: html

   <div class="navheader">

FreeBSD Architecture Handbook
?
?
?\ `Next <kernel.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Copyright ? 2000-2006, 2012-2013 The FreeBSD Documentation Project

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

Welcome to the FreeBSD Architecture Handbook. This manual is a *work in
progress* and is the work of many individuals. Many sections do not yet
exist and some of those that do exist need to be updated. If you are
interested in helping with this project, send email to the `FreeBSD
documentation project mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.

The latest version of this document is always available from the
`FreeBSD World Wide Web server <../../../../index.html>`__. It may also
be downloaded in a variety of formats and compression options from the
`FreeBSD FTP server <ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/>`__ or one
of the numerous `mirror
sites <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

`I. Kernel <kernel.html>`__
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
`II. Device Drivers <devicedrivers.html>`__
`9. Writing FreeBSD Device Drivers <driverbasics.html>`__
`9.1. Introduction <driverbasics.html#driverbasics-intro>`__
`9.2. Dynamic Kernel Linker Facility - KLD <driverbasics-kld.html>`__
`9.3. Character Devices <driverbasics-char.html>`__
`9.4. Block Devices (Are Gone) <driverbasics-block.html>`__
`9.5. Network Drivers <driverbasics-net.html>`__
`10. ISA Device Drivers <isa-driver.html>`__
`10.1. Synopsis <isa-driver.html#isa-driver-synopsis>`__
`10.2. Basic Information <isa-driver-basics.html>`__
`10.3. ``device_t`` Pointer <isa-driver-device-t.html>`__
`10.4. Configuration File and the Order of Identifying and Probing
During Auto-Configuration <isa-driver-config.html>`__
`10.5. Resources <isa-driver-resources.html>`__
`10.6. Bus Memory Mapping <isa-driver-busmem.html>`__
`10.7. DMA <isa-driver-dma.html>`__
`10.8. xxx\_isa\_probe <isa-driver-probe.html>`__
`10.9. xxx\_isa\_attach <isa-driver-attach.html>`__
`10.10. xxx\_isa\_detach <isa-driver-detach.html>`__
`10.11. xxx\_isa\_shutdown <isa-driver-shutdown.html>`__
`10.12. xxx\_intr <isa-driver-intr.html>`__
`11. PCI Devices <pci.html>`__
`11.1. Probe and Attach <pci.html#pci-probe>`__
`11.2. Bus Resources <pci-bus.html>`__
`12. Common Access Method SCSI Controllers <scsi.html>`__
`12.1. Synopsis <scsi.html#scsi-synopsis>`__
`12.2. General Architecture <scsi-general.html>`__
`12.3. Polling <scsi-polling.html>`__
`12.4. Asynchronous Events <scsi-async.html>`__
`12.5. Interrupts <scsi-interrupts.html>`__
`12.6. Errors Summary <scsi-errors.html>`__
`12.7. Timeout Handling <scsi-timeout.html>`__
`13. USB Devices <usb.html>`__
`13.1. Introduction <usb.html#usb-intro>`__
`13.2. Host Controllers <usb-hc.html>`__
`13.3. USB Device Information <usb-dev.html>`__
`13.4. Device Probe and Attach <usb-devprobe.html>`__
`13.5. USB Drivers Protocol Information <usb-protocol.html>`__
`14. Newbus <newbus.html>`__
`14.1. Device Drivers <newbus.html#newbus-devdrivers>`__
`14.2. Overview of Newbus <newbus-overview.html>`__
`14.3. Newbus API <newbus-api.html>`__
`15. Sound Subsystem <oss.html>`__
`15.1. Introduction <oss.html#oss-intro>`__
`15.2. Files <oss-files.html>`__
`15.3. Probing, Attaching, etc. <pcm-probe-and-attach.html>`__
`15.4. Interfaces <oss-interfaces.html>`__
`16. PC Card <pccard.html>`__
`16.1. Adding a Device <pccard.html#pccard-adddev>`__
`III. Appendices <appendices.html>`__
`Bibliography <bi01.html>`__
`Index <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-figures">

.. raw:: html

   <div class="toc-title">

List of Figures

.. raw:: html

   </div>

1.1.
```sys/boot/i386/boot0/Makefile`` <boot-boot0.html#boot-boot0-makefile-as-is>`__
1.2.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-entrypoint>`__
1.3.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-relocation>`__
1.4.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-drivenumber>`__
1.5.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-savedrivenumber>`__
1.6.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-partition-scan>`__
1.7.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-test-drives>`__
1.8.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-prompt>`__
1.9.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-start-input>`__
1.10.
```sys/boot/i386/boot0/boot0.S`` <boot-boot0.html#boot-boot0-check-bootable>`__
1.11.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-entry>`__
1.12.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-main>`__
1.13.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-find-freebsd>`__
1.14.
```sys/boot/i386/boot2/Makefile`` <boot-boot1.html#boot-boot2-make-fake-partition>`__
1.15.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-nread>`__
1.16.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-xread1>`__
1.17.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-find-part>`__
1.18.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-main5>`__
1.19.
```sys/boot/i386/boot2/boot1.S`` <boot-boot1.html#boot-boot1-seta20>`__
1.20.
```sys/boot/i386/boot2/Makefile`` <btx-server.html#boot-boot1-make-boot>`__
1.21.
```sys/boot/i386/boot2/Makefile`` <btx-server.html#boot-boot1-make-boot1>`__
1.22.
```sys/boot/i386/boot2/Makefile`` <btx-server.html#boot-boot1-make-boot2>`__
1.23.
```sys/boot/i386/boot2/Makefile`` <btx-server.html#boot-boot1-make-boot2-more>`__
1.24.
```sys/boot/i386/boot2/boot2.h`` <btx-server.html#boot-boot1-make-boot2h>`__
1.25. ```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-header>`__
1.26. ```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-init>`__
1.27.
```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-clear-mem>`__
1.28. ```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-ivt>`__
1.29. ```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-idt>`__
1.30. ```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-tss>`__
1.31. ```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-prot>`__
1.32. ```sys/boot/i386/btx/btx/btx.S`` <btx-server.html#btx-end>`__
14.1. `*driver\_t* Implementation <newbus-api.html#idp73196240>`__
14.2. `Device States *device\_state\_t* <newbus-api.html#idp73198800>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

List of Tables

.. raw:: html

   </div>

2.1. `Mutex List <locking.html#idp67658960>`__
2.2. `Shared Exclusive Lock List <locking-sx.html#idp67768272>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

List of Examples

.. raw:: html

   </div>

5.1. `Example of a ``SYSINIT()`` <sysinit-using.html#idp68138192>`__
5.2. `Example of Adjusting ``SYSINIT()``
Order <sysinit-using.html#idp68141520>`__
5.3. `Example of a ``SYSUNINIT()`` <sysinit-using.html#idp68144976>`__
9.1. `Example of a Sample Echo Pseudo-Device Driver for
FreeBSD?10.X <driverbasics-char.html#idp72083536>`__
14.1. `Newbus Methods <newbus-overview.html#idp73157840>`__

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
| ?   | ?   | ?Part?I.?Kernel             |
+-----+-----+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
