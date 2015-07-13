==================================
FreeBSD 10.0-RELEASE Release Notes
==================================

.. raw:: html

   <div class="article">

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

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2013-2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

IBM, AIX, OS/2, PowerPC, PS/2, S/390, and ThinkPad are trademarks of
International Business Machines Corporation in the United States, other
countries, or both.

IEEE, POSIX, and 802 are registered trademarks of Institute of
Electrical and Electronics Engineers, Inc. in the United States.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

SPARC, SPARC64, and UltraSPARC are trademarks of SPARC International,
Inc in the United States and other countries. SPARC International, Inc
owns all of the SPARC trademarks and under licensing agreements allows
the proper use of these trademarks by its members.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on 2014-01-14 by hrs.

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

The release notes for FreeBSD 10.0-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 10.0-STABLE development
line. This document lists applicable security advisories that were
issued since the last release, as well as significant changes to the
FreeBSD kernel and userland. Some brief remarks on upgrading are also
presented.

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

`1. Introduction <#intro>`__
`2. What's New <#new>`__
`3. Upgrading from previous releases of FreeBSD <#upgrade>`__

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

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document contains the release notes for FreeBSD 10.0-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

The latest, up-to-date version of the release notes are available online
at ``http://www.FreeBSD.org/releases/10.0R/relnotes.html``.

This distribution of FreeBSD 10.0-RELEASE is a release distribution. It
can be found at ``http://www.FreeBSD.org/releases/`` or any of its
mirrors. More information on obtaining this (or other) release
distributions of FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
10.0-RELEASE can be found on the FreeBSD Web site.

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

2.?What's New
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes the most user-visible new or changed features in
FreeBSD since 9.2-RELEASE.

Typical release note items document recent security advisories issued
after 9.2-RELEASE, new drivers or hardware support, new commands or
options, major bug fixes, or contributed software upgrades. They may
also list changes to major ports/packages or release engineering
practices. Clearly the release notes cannot list every single change
made to FreeBSD between releases; this document focuses primarily on
security advisories, user-visible changes, and major architectural
improvements.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Problems described in the following security advisories have been fixed.
For more information, consult the individual advisories available from
`FreeBSD Security Information <http://security.FreeBSD.org/>`__.

.. raw:: html

   <div class="informaltable">

+--------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------+
| Advisory                                                                                         | Date               | Topic                                                         |
+==================================================================================================+====================+===============================================================+
| `SA-13:14.openssh <http://www.freebsd.org/security/advisories/FreeBSD-SA-13:14.openssh.asc>`__   | 19?November?2013   | OpenSSH AES-GCM memory corruption vulnerability               |
+--------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------+
| `SA-14:01.bsnmpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:01.bsnmpd.asc>`__     | 14?January?2014    | bsnmpd remote denial of service vulnerability                 |
+--------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------+
| `SA-14:02.ntpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:02.ntpd.asc>`__         | 14?January?2014    | ntpd distributed reflection Denial of Service vulnerability   |
+--------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------+
| `SA-14:03.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:03.openssl.asc>`__   | 14?January?2014    | OpenSSL multiple vulnerabilities                              |
+--------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------+
| `SA-14:04.bind <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:04.bind.asc>`__         | 14?January?2014    | BIND remote denial of service vulnerability                   |
+--------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.?Kernel Changes
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Capsicum has been enabled in the kernel by default, allowing sandboxing
of several programs that work within the “capabilities mode”.

[amd64,i386] The drm2(4) Radeon GPU driver, which works for GPUs up-to
Radeon HD 6000 and partially supports the Radeon HD 7000 family, has
been added. This driver was ported from Linux 3.8.
`[r254885] <http://svn.freebsd.org/viewvc/base?view=revision&revision=254885>`__

The use of unmapped VMIO buffers eliminates the need to perform TLB
shootdown for mapping on buffer creation and reuse, greatly reducing the
amount of IPIs for shootdown on big-SMP machines and eliminating up to
25-30% of the system time on i/o intensive workloads.
`[r248508] <http://svn.freebsd.org/viewvc/base?view=revision&revision=248508>`__

[amd64] The maximum amount of memory the FreeBSD kernel can address has
been increased from 1TB to 4TB.
`[r254466] <http://svn.freebsd.org/viewvc/base?view=revision&revision=254466>`__

The `ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__
kernel debugger now has an output capture facility. Input and output
from `ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__
can now be captured to a memory buffer for later inspection using
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
or a textdump. The new ``capture`` command controls this feature.

The `ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__
debugger now supports a simple scripting facility, which supports a set
of named scripts consisting of a set of
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__
commands. These commands can be managed from within
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__ or
with the use of the new
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8>`__
utility. More details can be found in the
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__
manual page.

[amd64,i386] Support was added for the new Intel on-CPU Bull Mountain
random number generator, found on IvyBridge and supposedly later CPUs,
accessible with the RDRAND instruction.
`[r240135] <http://svn.freebsd.org/viewvc/base?view=revision&revision=240135>`__

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.?Virtualization support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

[amd64] The BSD Hypervisor,
`bhyve(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=8>`__
is included with FreeBSD.
`bhyve(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=8>`__
requires Intel CPUs with VT-x and Extended Page Table (EPT) support.
These features are on all Nehalem models and beyond (e.g. Nehalem and
newer), but not on the lower-end Atom CPUs.
`[r245652] <http://svn.freebsd.org/viewvc/base?view=revision&revision=245652>`__

`virtio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio&sektion=4>`__
support has been added.
`virtio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio&sektion=4>`__
is the name for the paravirtualization interface developed for the Linux
KVM, but since adopted to other virtual machine hypervisors (with the
notable exception of Xen). This work brings in a BSD-licensed clean-room
implementation of the virtio kernel drivers for disk IO
(`virtio\_blk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio_blk&sektion=4>`__
and
`virtio\_scsi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio_scsi&sektion=4>`__),
network IO
(`vtnet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vtnet&sektion=4>`__),
memory ballooning
(`virtio\_balloon(4) <http://www.FreeBSD.org/cgi/man.cgi?query=virtio_balloon&sektion=4>`__),
and PCI. Tested with on Qemu/KVM, VirtualBox, and
`bhyve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bhyve&sektion=4>`__.
`[r227652] <http://svn.freebsd.org/viewvc/base?view=revision&revision=227652>`__

[amd64,i386] Paravirtualized drivers which support Microsoft Hyper-V
have been imported and made part of the amd64 GENERIC kernel. For i386,
these drivers are not part of GENERIC, so the following lines must be
added to ``/boot/loader.conf`` to load these drivers:
`[r255524] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255524>`__

.. code:: programlisting

    hv_ata_pci_disengage_load="YES"
    hv_netsvc_load="YES"
    hv_utils_load="YES"
    hv_vmbus_load="YES"

Alternatively, the Hyper-V drivers can be added to the i386 kernel by
adding ``device hyperv`` to the kernel config, and then recompiling the
kernel. Please refer to `FreeBSD and Microsoft Windows Server Hyper-V
support <http://wiki.freebsd.org/HyperV>`__ for full instructions on how
to set up Hyper-V support under FreeBSD.

The `vmx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vmx&sektion=4>`__
driver has been added.
`vmx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vmx&sektion=4>`__ is a
VMware VMXNET3 ethernet driver ported from OpenBSD.
`[r254738] <http://svn.freebsd.org/viewvc/base?view=revision&revision=254738>`__

[amd64,i386] Xen PVHVM virtualization is now part of the GENERIC kernel.
`[r255744] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255744>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.2.?ARM support
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Raspberry PI support has been added. Refer to these `setup
instructions <http://kernelnomicon.org/?p=164>`__ and this `quick start
guide <http://www.raspberrypi.org/quick-start-guide>`__.
`[r239922] <http://svn.freebsd.org/viewvc/base?view=revision&revision=239922>`__

The default ABI on ARM is now the ARM EABI. This brings a number of
improvements and allows future support for VFP and Thumb-2.
`[r253396] <http://svn.freebsd.org/viewvc/base?view=revision&revision=253396>`__

ARM support has been greatly improved, including support for ARMv6 and
ARMv7, SMP and thread-local storage (TLS). Additionally support for some
newer SoC like the MV78x60 and OMAP4 was added. See the
`announcement <http://lists.freebsd.org/pipermail/freebsd-arm/2012-August/003757.html>`__
for further details.
`[r239268] <http://svn.freebsd.org/viewvc/base?view=revision&revision=239268>`__

Superpages support on ARM has been added. Superpages support provides
improved performance and scalability by allowing TLB translations to
dynamically cover large physical memory regions. All ARMv6 and
ARMv7-based platforms can take advantage of this feature. See the `ARM
Superpages status <https://wiki.freebsd.org/ARMSuperpages>`__ page for
further details.
`[r254918] <http://svn.freebsd.org/viewvc/base?view=revision&revision=254918>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.3.?Hardware Support
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.3.1.?Multimedia Support
'''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Support for version 2.0 of the USB Audio reference design has been
added. New devices should support higher bandwidth, increased sampling
frequency and wider dynamic range.
`[r240609] <http://svn.freebsd.org/viewvc/base?view=revision&revision=240609>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.3.2.?Network Interface Support
''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The firmware for the
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4>`__
driver has been to 1.4.55.
`[r236212] <http://svn.freebsd.org/viewvc/base?view=revision&revision=236212>`__

The `re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4>`__
driver has been overhauled to fix a number of issues. This driver now
has Wake On LAN (WOL) support.

The `vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4>`__
driver has been overhauled to fix a number of outstanding issues. It
also now works on all architectures.

[amd64,i386] The
`wpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wpi&sektion=4>`__
driver has been updated to include a number of stability fixes.

The
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4>`__
driver has been updated to support 40G/10G Ethernet NICs based on
Chelsio's Terminator 5 (T5) ASIC.
`[r248925] <http://svn.freebsd.org/viewvc/base?view=revision&revision=248925>`__

The iw\_cxgbe driver has been added. This is an experimental iWARP/RDMA
driver (kernel verbs only) for Chelsio's T4 and T5 based cards.
`[r256694] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256694>`__

The Open Fabrics Enterprise Distribution (OFED) and OFED Infiniband core
has been updated to the same version as supplied by Linux version 3.7
`[r255932] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255932>`__

The Mellanox Infiniband driver has been updated to firmware version
2.30.3200 for ConnectX3 NICs. Support has been added for ConnectX3 VPI
NICs, where each port can be used as Infiniband 56 GB/s or Ethernet 40
GB/s. Support has been added for dynamically loading kernel modules for
Infiniband core (ibcore) and IP over Infiniband (ipoib).
`[r255932] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255932>`__

`netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4>`__
has been added.
`netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4>`__
is a framework for high-performance direct-to-hardware packet IO,
offering low latency and high PPS rates to userland applications while
bypassing any kernel-side packet processing. With
`netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4>`__
it is trivially possible to fully saturate a 10 Gbps network interface
with minimal packet sizes. For more information, see: `Netmap
Project <http://info.iet.unipi.it/~luigi/netmap/>`__.
`[r227614] <http://svn.freebsd.org/viewvc/base?view=revision&revision=227614>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.4.?Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
has been rewritten to make addresses more sane from the viewpoint of
routing daemons such as quagga/zebra. It also brings support for a
single redundant address on the subnet (carpdev), switching state with
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__,
better locking and using modern kernel interfaces to allocate multicast
memberships. Configuration of the CARP protocol via
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
has changed, as well as the format of CARP events submitted to
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__.
See
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
for more information. The arpbalance feature of
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__ is
currently not supported anymore.
`[r228571] <http://svn.freebsd.org/viewvc/base?view=revision&revision=228571>`__

The `pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4>`__
firewall now supports fine-grain locking and better utilization on
multi-CPU machines, resulting in significant improvements in
performance.
`[r240233] <http://svn.freebsd.org/viewvc/base?view=revision&revision=240233>`__

Support for up to 65536 routing tables has been introduced.
`[r250700] <http://svn.freebsd.org/viewvc/base?view=revision&revision=250700>`__

Support for setting/matching differentiated services codepoints (DSCP)
in IP header has been added to
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__.
`[r248552] <http://svn.freebsd.org/viewvc/base?view=revision&revision=248552>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.5.?Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4>`__
driver now supports volumes larger than 2TB in size.

The
`hptrr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptrr&sektion=4>`__
driver has been updated to version 1.2 from Highpoint.

`nvme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nvme&sektion=4>`__
has been added and provides NVM Express support. NVM Express is an
optimized register interface, command set and feature set of PCI Express
(PCIe)-based Solid-State Drives (SSDs). For more information, see
`nvmexpress.org <http://www.nvmexpress.org/>`__.
`[r240616] <http://svn.freebsd.org/viewvc/base?view=revision&revision=240616>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.6.?File Systems
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A new kernel-based iSCSI target and initiator has been added.
`[r255570] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255570>`__

UFS filesystems can now be enlarged with
`growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8>`__
while mounted read-write. This is especially useful for virtual
machines, allowing the addition of more harddrive space without
interruption of service.
`[r243246] <http://svn.freebsd.org/viewvc/base?view=revision&revision=243246>`__

A state of the art FUSE implementation is now part of the base system.
It allows the use of nearly all fusefs file systems.
`[r241519] <http://svn.freebsd.org/viewvc/base?view=revision&revision=241519>`__

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.6.1.?ZFS
''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__
now supports installing ZFS on the root file system. It includes a
single configuration menu that allows you to select all of the required
details, including which drives to use, what ZFS RAID level to use
(taking into consideration the selected number of drives), GPT or MBR,
GELI encryption, forcing 4K sectors, pool name, etc.
`[r256361] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256361>`__

Support for L2ARC compression has been added to ZFS.
`[r252140] <http://svn.freebsd.org/viewvc/base?view=revision&revision=252140>`__

The zio nop-write improvement from Illumos was imported into FreeBSD. To
reduce I/O, nop-write skips overwriting data if the (cryptographically
secure) checksum of new data matches the checksum of existing data. It
also saves space if snapshots are in use. This improvement only works on
datasets with enabled compression, disabled deduplication and sha256
checksums. ZFS will now compare the checksums of incoming writes to the
checksum of the existing on-disk data and avoid issuing any write I/O
for data that has not changed. This will reduce I/O as well as space
usage because if the old block is referenced by a snapshot, both copies
of the block are kept even though both contain the same data.
`[r243524] <http://svn.freebsd.org/viewvc/base?view=revision&revision=243524>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.?Userland Changes
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

On platforms where
`clang(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang&sektion=1>`__
is the default system compiler (such as i386, amd64, arm), GCC and GNU
libstdc++ are no longer built by default.
`clang(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang&sektion=1>`__
and libc++ from LLVM are used on these platforms by instead. GCC 4.2.1
and libstdc++ are still built and used by default on pc98 and all other
platforms where
`clang(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang&sektion=1>`__
is not the default system compiler.
`[r255321] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255321>`__

`clang(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang&sektion=1>`__
and llvm have been updated to version 3.3 release. Please refer to
`Clang 3.3 Release
Notes <http://llvm.org/releases/3.3/tools/clang/docs/ReleaseNotes.html>`__.
`[r251662] <http://svn.freebsd.org/viewvc/base?view=revision&revision=251662>`__

BIND has been removed from the base system.
`unbound(8) <http://www.FreeBSD.org/cgi/man.cgi?query=unbound&sektion=8>`__,
which is maintained by NLnet Labs, has been imported to support local
DNS resolution functionality with DNSSEC. Note that it is not a
replacement of BIND and the latest versions of BIND is still available
in the Ports Collection. With this change, nslookup and dig are no
longer a part of the base system. Users should instead use
`host(1) <http://www.FreeBSD.org/cgi/man.cgi?query=host&sektion=1>`__
and
`drill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=drill&sektion=1>`__
Alternatively, nslookup and dig can be obtained by installing
``dns/bind-tools`` port.
`[r255949] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255949>`__

sysinstall has been removed from the base system. Auxiliary libraries
and tools used by sysinstall such as libdisk, libftpio, and sade have
also been removed. sysinstall has been replaced by
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__
and
`bsdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdconfig&sektion=8>`__.
`[r225937] <http://svn.freebsd.org/viewvc/base?view=revision&revision=225937>`__

`freebsd-version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-version&sektion=1>`__
has been added. This tool makes a best effort to determine the version
and patch level of the installed kernel and userland.
`[r256106] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256106>`__

GNU patch has been removed from the base system, and replaced by a
BSD-licensed
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1>`__
program.
`[r255191] <http://svn.freebsd.org/viewvc/base?view=revision&revision=255191>`__

GNU sort has been removed from the base system, and replaced by a
BSD-licensed
`sort(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sort&sektion=1>`__
program.
`[r241511] <http://svn.freebsd.org/viewvc/base?view=revision&revision=241511>`__

Berkeley yacc (byacc) has been imported from `invisible
island <http://invisible-island.net/byacc/>`__. This brings bison
compatibilities to
`yacc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yacc&sektion=1>`__
while preserving full backwards compatibility with previous version of
`yacc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yacc&sektion=1>`__.
`[r235723] <http://svn.freebsd.org/viewvc/base?view=revision&revision=235723>`__

`lex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lex&sektion=1>`__ has
been replaced by flex 2.5.37.
`[r250881] <http://svn.freebsd.org/viewvc/base?view=revision&revision=250881>`__

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
has been replaced with the “Portable” BSD make tool (bmake) from NetBSD.
`[r250699] <http://svn.freebsd.org/viewvc/base?view=revision&revision=250699>`__

Support for usernames up to 32 characters.
`[r243023] <http://svn.freebsd.org/viewvc/base?view=revision&revision=243023>`__

The
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
utility now supports a ``-M`` option to set the mode of a new user's
home directory.

BSD-licensed versions of
`ar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ar&sektion=1>`__ and
`ranlib(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ranlib&sektion=1>`__,
based on
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3>`__,
have replaced the GNU Binutils versions of these utilities.

BSD-licensed versions of
`bc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bc&sektion=1>`__ and
`dc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=1>`__ have
replaced their GNU counterparts.

`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__
now supports a ``-v`` flag for verbose output and a ``-f`` flag to
ignore errors with the same semantics as (for example)
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__.

For compatibility with other implementations,
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1>`__ now
supports a ``-a`` flag, which is equivalent to specifying the ``-RrP``
flags.

BSD-licensed version of
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__
based on
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3>`__,
has replaced the GNU cpio. Note that the GNU cpio is still installed as
``gcpio``.

The `env(1) <http://www.FreeBSD.org/cgi/man.cgi?query=env&sektion=1>`__
program now supports ``-u     name`` which will completely unset the
given variable *``name``* by removing it from the environment, instead
of just setting it to a null value.

The
`fdopendir(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fdopendir&sektion=3>`__
library function has been added.

The
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__
library now supports HTTP 1.1 If-Modified-Since behavior. The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1>`__
program now supports ``-i filename`` which will only download the
specified HTTP URL if the content is newer than *``filename``*.

`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__
has been enhanced by the addition of a number of primaries that were
present in GNU find but not FreeBSD
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__.

`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1>`__
now supports a new ``add-kld`` command to make it easier to debug crash
dumps with kernel modules.

The `ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
program now supports a ``-D`` option to specify a date format string to
be used with the long format (``-l``) output.

`nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1>`__ now
supports a ``-O`` switch to disable the use of TCP options.

`nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1>`__'s
``-o`` switch has been deprecated. It will be removed in a future
release.

The
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8>`__
utility now returns ``2`` when the packet transmission was successful
but no responses were received (this is the same behavior as
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__).
It returned a non-zero value before this change.

The
`realpath(1) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=1>`__
utility now supports a ``-q`` flag to suppress warnings; it now also
accepts multiple paths on its command line.

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ has
many bug fixes, some new features, and will now refuse to parse some
invalid scripts. Additionally, it now has filename completion and
defaults to the “emacs” editing mode.

The
`split(1) <http://www.FreeBSD.org/cgi/man.cgi?query=split&sektion=1>`__
utility now supports a ``-n`` flag to split a file into a certain number
of chunks.

The `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
utility now supports a ``-Z`` flag to enable
`compress(1) <http://www.FreeBSD.org/cgi/man.cgi?query=compress&sektion=1>`__-style
compression/decompression.

The `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
utility now supports a ``--numeric-owner`` flag to ignore user/group
names on create and extract.

The `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
utility now supports the ``-S`` flag to sparsify files on extraction.

The `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
utility now supports a ``-s`` flag to substitute filenames based on the
specified regular expression.

The
`tcgetsid(3) <http://www.FreeBSD.org/cgi/man.cgi?query=tcgetsid&sektion=3>`__
library function has been added to return the process group ID for the
session leader for the controlling terminal. It is defined in IEEE Std
1003.1-2001 (POSIX).

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__ now
supports a ``-P`` flag to provide per-CPU usage statistics.

`zdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zdump&sektion=8>`__
is now working properly on 64-bit architectures.

`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__
now has the ability to print the AS number for each hop with the new
``-a`` switch; a new ``-A`` option allows selecting a particular WHOIS
server.

`traceroute6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute6&sektion=8>`__
now supports a ``-U`` flag to send probe packets with no upper-layer
protocol, rather than the usual UDP probe packets.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1.?\ ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``rc.d/sendmail`` now generates and uses an SSL certificate by default
when ``sendmail_enable="YES"``. This will allow remote MTA to use
STARTTLS to encrypt incoming email. The certification is signed with a
key that is thrown away and is not a substitute for generating your own
properly if you need to use STARTTLS authentication. Options to control
the certificate generation is documented in ``rc.d/sendmail``.
`[r256773] <http://svn.freebsd.org/viewvc/base?view=revision&revision=256773>`__

The followoing
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
scripts have been added:

.. raw:: html

   <div class="informaltable">

+----------------------------------------------------------------------------+---------------------------------------------------------+
| `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ Script   | Function                                                |
+============================================================================+=========================================================+
| ``ctld``                                                                   | iSCSI target daemon startup script                      |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``iscsictl``                                                               | iSCSI initiator management utility startup script       |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``iscsid``                                                                 | iSCSI initiatior daemon startup script                  |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``kfd``                                                                    | Kerberos ticket forwarding daemon startup script        |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``local_unbound``                                                          | Unbound startup script for the local caching resolver   |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``postrandom``                                                             | Generates a new entropy file at system boot             |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``swap``                                                                   | Replaces ``swap1``; enable swap at system boot          |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``swaplate``                                                               | Enables swap with “late” set at system boot             |
+----------------------------------------------------------------------------+---------------------------------------------------------+
| ``utx``                                                                    | User accounting database startup and shutdown script    |
+----------------------------------------------------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

The following
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
scripts have been removed:

.. raw:: html

   <div class="informaltable">

+----------------------------------------------------------------------------+-----------------------------------------+
| `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ Script   | Reason                                  |
+============================================================================+=========================================+
| ``encswap``                                                                | Replaced by ``swap`` and ``swaplate``   |
+----------------------------------------------------------------------------+-----------------------------------------+
| ``named``                                                                  | Removed with BIND                       |
+----------------------------------------------------------------------------+-----------------------------------------+
| ``swap1``                                                                  | Replaced by ``swap`` and ``swaplate``   |
+----------------------------------------------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.?Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`jemalloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=jemalloc&sektion=3>`__
has been updated to 3.4.0. See `this
link <http://www.facebook.com/jemalloc/>`__ for more details.
`[r251300] <http://svn.freebsd.org/viewvc/base?view=revision&revision=251300>`__

AMD has been updated from 6.0.10 to 6.1.5.

awk has been updated to the 20121220 release.

CVS has been removed from the base system, but is still available from
Ports Collection.
`[r251794] <http://svn.freebsd.org/viewvc/base?view=revision&revision=251794>`__

Subversion has been imported into the base system and is installed as
svnlite. svnlite should only be used for checking out the FreeBSD source
trees and committing, and does not replace the full Subversion port.
`[r251886] <http://svn.freebsd.org/viewvc/base?view=revision&revision=251886>`__

file has been updated to 5.11.
`[r234449] <http://svn.freebsd.org/viewvc/base?view=revision&revision=234449>`__

hostapd has been updated from 0.5.8 to 0.5.10.
`[r252726] <http://svn.freebsd.org/viewvc/base?view=revision&revision=252726>`__

IPFilter has been updated to 5.1.2.

less has been updated to v458.
`[r250592] <http://svn.freebsd.org/viewvc/base?view=revision&revision=250592>`__

ncurses has been updated to 5.7-20081102.

OpenSSH has been updated to 6.4.

OpenPAM has been updated to the Micrampelis release.
`[r236109] <http://svn.freebsd.org/viewvc/base?view=revision&revision=236109>`__

sendmail has been updated from 8.14.1 to 8.14.7.

The timezone database has been updated from the tzdata2008h release to
the tzdata2009m release.

The stdtime part of libc,
`zdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zdump&sektion=8>`__
and `zic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zic&sektion=8>`__
have been updated from the tzcode2004a release to the tzcode2009h
release. If you have upgraded from source or via the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__,
then please run
`tzsetup(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tzsetup&sektion=8>`__
to install a new ``/etc/localtime``.

WPA Supplicant has been updated to 2.0.
`[r252726] <http://svn.freebsd.org/viewvc/base?view=revision&revision=252726>`__

xz has been updated from snapshot as of 12 April 2010 to 5.0.0.

`nvi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nvi&sektion=1>`__ has
been updated to 2.1.2.
`[r258231] <http://svn.freebsd.org/viewvc/base?view=revision&revision=258231>`__

`nvi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nvi&sektion=1>`__
supports wide-character locales.
`[r254225] <http://svn.freebsd.org/viewvc/base?view=revision&revision=254225>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.5.?Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The pkg\_add, pkg\_create, pkg\_delete, pkg\_info, pkg\_updating, and
pkg\_version utilities have been removed.
`pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__ must
now be used to install binary packages.
`pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__ is
the next generation FreeBSD package manager, also referred to as
“pkgng”. If upgrading from a previous FreeBSD release, be sure to run
pkg2ng to convert the old package database to the new format.
`[r257444] <http://svn.freebsd.org/viewvc/base?view=revision&revision=257444>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.6.?Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The supported version of the GNOME desktop environment (x11/gnome2) has
been updated from 2.20.1 to 2.22.

.. raw:: html

   </div>

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

3.?Upgrading from previous releases of FreeBSD
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

[amd64,i386] Beginning with FreeBSD 6.2-RELEASE, binary upgrades between
RELEASE versions (and snapshots of the various security branches) are
supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC or SMP kernels distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility requires that the host being upgraded have Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported, according
to the instructions in ``/usr/src/UPDATING``.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Upgrading FreeBSD should, of course, only be attempted after backing up
*all* data and configuration files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD release should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
