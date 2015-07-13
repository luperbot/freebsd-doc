==================================
FreeBSD/pc98 5.0-DP2 Release Notes
==================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 5.0-DP2 Release Notes
==================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.452 2002/11/14 17:59:11 bmah Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 5.0-DP2 contain a summary of recent
changes made to the FreeBSD base system on the 5-CURRENT development
branch. Both changes for kernel and userland are listed, as well as
applicable security advisories that were issued since the last release.
Some brief remarks on upgrading are also presented.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Table of Contents**
1 `Introduction <#AEN13>`__
2 `What's New <#AEN18>`__
2.1 `Kernel Changes <#KERNEL>`__
2.1.1 `Processor/Motherboard Support <#AEN387>`__
2.1.2 `Bootloader Changes <#AEN425>`__
2.1.3 `Network Interface Support <#AEN447>`__
2.1.4 `Network Protocols <#AEN707>`__
2.1.5 `Disks and Storage <#AEN883>`__
2.1.6 `Filesystems <#AEN1103>`__
2.1.7 `PCCARD Support <#AEN1188>`__
2.1.8 `Multimedia Support <#AEN1211>`__
2.1.9 `Contributed Software <#AEN1242>`__
2.2 `Security-Related Changes <#SECURITY>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 `Contributed Software <#AEN3790>`__
2.3.2 `Ports/Packages Collection Infrastructure <#AEN4249>`__
2.4 `Release Engineering and Integration <#AEN4361>`__
2.5 `Documentation <#AEN4386>`__
3 `Upgrading from previous releases of FreeBSD <#AEN4434>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This document contains the release notes for FreeBSD 5.0-DP2 on the NEC
PC-98x1 hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

The snapshot distribution to which these release notes apply represents
a point along the 5-CURRENT development branch between 4.0-RELEASE and
the future 5.0-RELEASE. Some pre-built, binary snapshot distributions
along this branch can be found at http://snapshots.jp.FreeBSD.org/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
============

This section describes many of the user-visible new or changed features
in FreeBSD since 4.0-RELEASE. It includes items that are unique to the
5-CURRENT branch, as well as some features that may have been recently
merged to other branches (after FreeBSD 4.6-RELEASE). The later items
are marked as [MERGED].

Typical release note items document new drivers or hardware support, new
commands or options, major bugfixes, or contributed software upgrades.
Applicable security advisories issued after 4.0-RELEASE are also listed.

Many additional changes were made to FreeBSD that are not listed here
for lack of space. For example, documentation was corrected and
improved, minor bugs were fixed, insecure coding practices were audited
and corrected, and source code was cleaned up.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Kernel Changes
------------------

Execution of
`a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5&manpath=FreeBSD+5.0-current>`__
format executables now requires the ``COMPAT_AOUT`` option in the kernel
configuration or the loading of the ``aout.ko`` kernel module.

`acct(2) <http://www.FreeBSD.org/cgi/man.cgi?query=acct&sektion=2&manpath=FreeBSD+5.0-current>`__
has been changed to open the accounting file in append mode, so that
`accton(8) <http://www.FreeBSD.org/cgi/man.cgi?query=accton&sektion=8&manpath=FreeBSD+5.0-current>`__
can be used to enable accounting to an append-only file. [MERGED]

A new in-kernel cryptographic framework (see
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+5.0-current>`__
and
`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+5.0-current>`__)
has been imported from OpenBSD. It provides a consistent interface to
hardware and software implementations of cryptographic algorithms for
use by the kernel and access to cryptographic hardware for user-mode
applications. Hardware device drivers are provided to support hifn-based
cards
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+5.0-current>`__)
and Broadcom-based cards
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+5.0-current>`__).

A new
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+5.0-current>`__
command ``show pcpu`` lists some of the per-CPU data.

A ``devctl`` device has been added to allow userland programs to learn
when devices come and go in the device tree (different from the XXX).
This facility is primariliy used by the
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+5.0-current>`__
utility.

`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__,
which allows entries in the ``/dev`` directory to be built automatically
and supports more flexible attachment of devices, has been largely
reworked.
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__
is now enabled by default and can be disabled by the ``NODEVFS`` kernel
option.

The
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__
\`\`rule'' subsystem has been introduced. DEVFS rules permit the
administrator to define certain properties of new device nodes before
they become visible to the userland. Both static (e.g. ``/dev/speaker``)
and dynamic (e.g. ``/dev/bpf*``, some removable devices) nodes are
supported. Each
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__
mount may have a different ruleset assigned to it, permitting different
policies to be implemented for things like jails. Rules and rulesets are
manipulated with the
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8&manpath=FreeBSD+5.0-current>`__
utility.

The dgm driver has been removed in favor of the digi driver.

A new digi driver has been added to support PCI Xr-based and ISA Xem
Digiboard cards. A new
`digictl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=digictl&sektion=8&manpath=FreeBSD+5.0-current>`__
program is (mainly) used to re-initialize cards that have external port
modules attached such as the PC/Xem.

An
`eaccess(2) <http://www.FreeBSD.org/cgi/man.cgi?query=eaccess&sektion=2&manpath=FreeBSD+5.0-current>`__
system call has been added, similar to
`access(2) <http://www.FreeBSD.org/cgi/man.cgi?query=access&sektion=2&manpath=FreeBSD+5.0-current>`__
except that the former uses effective credentials rather than real
credentials.

Initial support has been added for Firewire devices (see
`firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?query=firewire&sektion=4&manpath=FreeBSD+5.0-current>`__).
[MERGED]

Each
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.0-current>`__
environment can now run under its own securelevel.

The tunable sysctl variables for
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.0-current>`__
have moved from ``jail.*`` to the ``security.*`` hierarchy. Other
security-related sysctl variables have moved from ``kern.security.*`` to
``security.*``.

The kernel environment is now dynamic, and can be changed via the new
`kenv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=2&manpath=FreeBSD+5.0-current>`__
system call.

The labpc(4) driver has been removed due to \`\`bitrot''.

The loader and kernel linker now look for files named ``linker.hints``
in each directory with KLDs for a module name and version to KLD
filename mapping. The new
`kldxref(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldxref&sektion=8&manpath=FreeBSD+5.0-current>`__
utility is used to generate these files.

`lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lomac&sektion=4&manpath=FreeBSD+5.0-current>`__,
a Low-Watermark Mandatory Access Control security facility, has been
added as a kernel module. It provides a drop-in security mechanism in
addition to the traditional UID-based security facilities, requiring no
additional configuration from the administrator. Work on this feature
was sponsored by DARPA and NAI Labs.

FreeBSD now supports an extensible Mandatory Access Control framework,
the TrustedBSD MAC Framework. It permits loadable kernel modules to link
to the kernel at compile-time, boot-time, or run-time, and augment the
system security policy. The framework permits modules to express
interest in a variety of events, and also provides common security
policy services such as label storage. A variety of sample policy
modules are shipped in this release, including implementations of fixed
and floating label Biba integrity models, Multi-Level Security (MLS)
with compartments, and a number of augmented UNIX security models
including a file system firewall. This feature will permit easier
development and maintenance of local and vendor security extensions. The
extensibility service is enabled by adding ``options MAC`` to the kernel
configuration.

.. raw:: html

   <div class="NOTE">

    **Note:** The MAC framework is considered an experimental feature in
    this release, and is not enabled by default

.. raw:: html

   </div>

`mutex(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mutex&sektion=9&manpath=FreeBSD+5.0-current>`__
profiling code has been added, enabled by the ``MUTEX_PROFILING`` kernel
configuration option. It enables the ``debug.mutex.prof.*`` hierarchy of
sysctl variables.

The ``P1003_1B`` kernel option is no longer used and has been removed.

PECOFF (Win32 Execution file format) support has been added.

The
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+5.0-current>`__
device has been rewritten to use the **Yarrow** algorithm. It harvests
entropy from a variety of interrupt sources, including the console
devices, Ethernet and point-to-point network interfaces, and
mass-storage devices. Entropy from the
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+5.0-current>`__
device is now periodically saved to files in ``/var/db/entropy``, as
well as at shutdown time. The semantics of ``/dev/random`` have changed;
it never blocks waiting for entropy bits but generates a stream of
pseudo-random data and now behaves exactly as ``/dev/urandom``.

A new kernel option, ``options           REGRESSION``, enables
interfaces and functionality intended for use during correctness and
regression testing.

``RLIMIT_VMEM`` support has been added. This feature defines a new
resource limit that covers a process's entire virtual memory space,
including
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+5.0-current>`__
space. This limit can be configured in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
via the new ``vmemoryuse`` variable. [MERGED]

A bug in the
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+5.0-current>`__
system call, in which headers counted against the size of the file to be
sent, has been fixed. [MERGED]

The
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports keyboard-controlled pasting, by default bound to
**Shift**-**Insert**.

The uaudio driver, for USB audio devices, has been added. [MERGED]

The ubsa driver has been added to support the Belkin F5U103 (and
compatible) USB-to-serial adaptors.

The
`ucom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucom&sektion=4&manpath=FreeBSD+5.0-current>`__
device driver has been added, to support USB modems, serial devices, and
other programs that need to look like a tty. The related
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+5.0-current>`__
and
`uvscom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvscom&sektion=4&manpath=FreeBSD+5.0-current>`__
drivers provide specific support for the Prolific PL-2303 serial adapter
and the SUNTAC Slipper U VS-10U, respectively. [MERGED]

To increase security, the ``UCONSOLE`` kernel configuration option has
been removed.

The UserConfig boot-time kernel configuration feature, usually used to
enable, disable, or configure ISA devices, has been removed. Its
functionality has been replaced by the kernel hints file in
``/boot/device.hints``.

The ``USER_LDT`` kernel option is now activated by default.

The
`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+5.0-current>`__
driver for connecting Handspring Visors via USB has been added. [MERGED]

A VESA S3 linear framebuffer driver has been added.

The kernel crashdump infrastructure has been revised, to support new
platforms and in general clean up the logic in the code. One implication
of this change is that the on-disk format for kernel dumps has changed,
and is now byte-order-agnostic.

Extremely large swap areas (>67 GB) no longer panic the system.

Linker sets are now self-contained; gensetdefs(8) is unnecessary and has
been removed.

It is now possible to hardwire kernel environment variables (such as
tuneables) at compile-time using
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__'s
``ENV`` directive.

Idle zeroing of pages can be enabled with the ``vm.idlezero_enable``
sysctl variable.

The FreeBSD kernel scheduler now supports Kernel-Scheduled Entities
(KSEs), which provides support for multiple threads of execution per
process similar to Scheduler Activations. At this point, the kernel has
most of the changes needed to support threading. The kernel scheduler
can schedule multiple threads per process, but only on a single CPU at a
time. More information can be found in
`kse(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kse&sektion=2&manpath=FreeBSD+5.0-current>`__.

.. raw:: html

   <div class="NOTE">

    **Note:** KSE is a work in progress.

.. raw:: html

   </div>

The kernel now has support for multiple low-level console devices. The
new
`conscontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=conscontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
utility helps to manage the different consoles.

The kernel memory allocator is now a slab memory allocator, similar to
that used in Solaris. This is a SMP-safe memory allocator that has
near-linear performance as the number of CPUs increases. It also allows
for reduced memory fragmentation.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1 Processor/Motherboard Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SMP support has been largely reworked, incorporating code from BSD/OS
5.0. One of the main features of SMPng (\`\`SMP Next Generation'') is to
allow more processes to run in kernel, without the need for spin locks
that can dramatically reduce the efficiency of multiple processors.
Interrupt handlers now have contexts associated with them that allow
them to be blocked, which reduces the need to lock out interrupts.

Support for the 80386 processor has been removed from the ``GENERIC``
kernel, as this code seriously pessimizes performance on other IA32
processors. The ``I386_CPU`` kernel option to support the 80386
processor is now mutually exclusive with support for other IA32
processors; this should slightly improve performance on the 80386 due to
the elimination of runtime processor type checks. Custom kernels that
will run on the 80386 can still be built by changing the cpu options in
the kernel configuration file to only include ``I386_CPU``.

The ``CPU_DISABLE_CMPXCHG`` kernel configuration option has been added.
Enabling this option has been shown to dramatically improve performance
on VMWare client OS installs.

.. raw:: html

   <div class="NOTE">

    **Note:** This option is not compatible with ``SMP`` kernels.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2 Bootloader Changes
~~~~~~~~~~~~~~~~~~~~~~~~

The kernel and modules have been moved to the directory
``/boot/kernel``, so they can be easily manipulated together. The boot
loader has been updated to make this change as seamless as possible.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3 Network Interface Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports NICs based on the Xircom 3201 and Conexant LANfinity
RS7112 chips.

The
`rp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been updated to version 3.02 and can now be built as a
module. [MERGED]

The
`stf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stf&sektion=4&manpath=FreeBSD+5.0-current>`__
device is now clonable.

The
`tx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tx&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports true multicast filtering.

Network devices now automatically appear as special files in
``/dev/net``. Interface hardware ioctls (not protocol or routing) can be
performed on these devices. The ``SIOCGIFCONF`` ioctl may be performed
on the special ``/dev/network`` node.

\`\`Zero copy'' support has been added to the networking stack. This
feature can eliminate a copy of network data between the kernel and
userland, which is one of the more significant bottlenecks in network
throughput. The send-side code should work with almost any network
adapter, while the receive-side code requires a network adapter with an
MTU of at least one memory page size (for example, jumbo frames on
Gigabit Ethernet). For more information, see
`zero\_copy(9) <http://www.FreeBSD.org/cgi/man.cgi?query=zero_copy&sektion=9&manpath=FreeBSD+5.0-current>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4 Network Protocols
~~~~~~~~~~~~~~~~~~~~~~~

A ``FAST_IPSEC`` kernel option now allows the IPsec implementation to
use the kernel crypo framework, along with its support for hardware
cryptographic acceleration.

.. raw:: html

   <div class="NOTE">

    **Note:** The ``FAST_IPSEC`` and ``IPSEC`` options are mutually
    exclusive.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Note:** The ``FAST_IPSEC`` option is, at the moment, not
    compatible with IPv6 or the ``INET6`` option.

.. raw:: html

   </div>

A
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+5.0-current>`__
driver, which can encapsulate IP packets using GRE (RFC 1701) or minimal
IP encapsulation for Mobile IP (RFC 2004), has been added.

ICMP ECHO and TSTAMP replies are now rate limited. TCP RSTs generated
due to packets sent to open and unopen ports are now limited by separate
counters. Each rate limiting queue now has its own description.

IP multicast now works on VLAN devices. Several other bugs in the VLAN
code have also been fixed.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.0-current>`__
has been re-implemented (the new version is commonly referred to as
\`\`IPFW2''). It now uses variable-sized representation of rules in the
kernel, similar to
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+5.0-current>`__
instructions. Most of the externally-visible behavior (i.e. through
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__)
should be unchanged., although
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports ``or`` connectives between match fields. [MERGED]

A new
`ng\_device(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_device&sektion=4&manpath=FreeBSD+5.0-current>`__
netgraph node type has been added, which creates a device entry in
``/dev``, to be used as the entry point to a networking graph.

The
`ng\_gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_gif&sektion=4&manpath=FreeBSD+5.0-current>`__
and
`ng\_gif\_demux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_gif_demux&sektion=4&manpath=FreeBSD+5.0-current>`__
netgraph nodes, for operating on
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+5.0-current>`__
devices, have been added.

The
`ng\_ip\_input(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ip_input&sektion=4&manpath=FreeBSD+5.0-current>`__
netgraph node, for queueing IP packets into the main IP input processing
code, has been added.

A new
`ng\_l2tp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2tp&sektion=4&manpath=FreeBSD+5.0-current>`__
netgraph node type, which implements the encapsulation layer of the L2TP
protocol as described in RFC 2661, has been added. [MERGED]

A new ng\_split node type has been added for splitting a bidirectional
packet flow into two unidirectional flows.

The ephemeral port range used for TCP and UDP has been changed to
49152-65535 (the old default was 1024-5000). This increases the number
of concurrent outgoing connections/streams.

The
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.0-current>`__
protocol's retransmission timer can now be manipulated with two sysctl
variables, ``net.inet.tcp.rexmit_min`` and ``net.inet.tcp.rexmit_slop``.
The default has been reduced from one second to 200ms (similar to the
Linux default) in order to better handle hicups over interactive
connections and improve recovery over lossy fast connections such as
wireless links.

The
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.0-current>`__
protocol now has the ability to dynamically limit the send-side window
to maximize bandwidth and minimize round trip times. The feature can be
enabled via the ``net.inet.tcp.inflight_enable`` sysctl. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5 Disks and Storage
~~~~~~~~~~~~~~~~~~~~~~~

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver (along with
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__)
now supports writing to media in DVD+RW drives.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports accessing ATA devices as SCSI devices via the CAM
layer and drivers
(`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-current>`__,
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+5.0-current>`__,
`st(4) <http://www.FreeBSD.org/cgi/man.cgi?query=st&sektion=4&manpath=FreeBSD+5.0-current>`__,
and
`pass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pass&sektion=4&manpath=FreeBSD+5.0-current>`__).
This feature requires ``device             atapicam`` in the kernel
configuration. More information can be found in
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for the Sil 0680 and VIA 8233/8235 controllers.
[MERGED]

The
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports the same ``CDRIOCREADSPEED`` and
``CDRIOCWRITESPEED`` ioctls that the
`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+5.0-current>`__
driver uses for setting the speed of CDROM access.

The
`fdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fdc&sektion=4&manpath=FreeBSD+5.0-current>`__
floppy disk has undergone a number of enhancements. Density selection
for common settings is now automatic; the driver is also much more
flexible in setting the densities of various subdevices.

The
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.0-current>`__
disk I/O request transformation framework has been added; this
extensible framework is designed to support a wide variety of operations
on I/O requests on their way from the upper kernel to the device
drivers.

.. raw:: html

   <div class="NOTE">

    **Note:** GEOM-enabled kernels no longer support \`\`compatability
    slices''. This feature (supported on the i386 and pc98 only) allowed
    a user to refer to a disk partition without specifying an MBR slice
    (e.g. ``/dev/ad0a``); the kernel would automatically find the first
    applicable FreeBSD slice and use it. On GEOM kernels, only the full
    partition names (e.g. ``/dev/ad0s1a``) are allowed when referring to
    partitions within MBR slices. This change should affect very few
    users.

.. raw:: html

   </div>

A GEOM Based Disk Encryption module has been added. It provides denial
of access to \`\`cold disks'', with four different cryptographic
barriers and up to four changeable pass-phrases. Much more information
can be found in the
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4&manpath=FreeBSD+5.0-current>`__
manual page. The
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8&manpath=FreeBSD+5.0-current>`__
userland utility provides an operation and management interface to this
module. This feature is not enabled by default; it requires
``options GEOM_BDE`` to be added to a kernel configuration file.

.. raw:: html

   <div class="NOTE">

    **Note:** This feature should be considered experimental.

.. raw:: html

   </div>

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver is now proactive about discovering Fibre Channel topology
changes.

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports target mode for Qlogic SCSI cards, including Ultra2
and Ultra3 and dual bus cards.

The
`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been removed due to breakage and licensing issues. [MERGED]

`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+5.0-current>`__,
the memory disk device, has had the functionality of
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4&manpath=FreeBSD+5.0-current>`__
incorporated into it.
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+5.0-current>`__
devices can now be configured by
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+5.0-current>`__.
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4&manpath=FreeBSD+5.0-current>`__
has been removed. The Memory Filesystem (MFS) has also been removed.

The mpt driver, for supporting the LSI Logic Fusion/MP architecture
Fiber Channel controllers, has been added. [MERGED]

The RAIDframe disk driver has been imported from NetBSD. This driver
provides software-based RAID 0, 1, 4, and 5 capabilities, as well as
other functionality. More information can be found in the
`raid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=raid&sektion=4&manpath=FreeBSD+5.0-current>`__
driver manual page. The
`raidctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=raidctl&sektion=8&manpath=FreeBSD+5.0-current>`__
utility is used to configure and unconfigure disk arrays. This feature
is not enabled by default, and requires ``device raidframe`` to be
configured into a kernel.

.. raw:: html

   <div class="NOTE">

    **Note:** This feature should be considered experimental.

.. raw:: html

   </div>

Some problems in
`sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4&manpath=FreeBSD+5.0-current>`__
error handling have been fixed, including the \`\`tape drive spinning
indefinitely upon
`mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1&manpath=FreeBSD+5.0-current>`__
``stat``'' problem.

The ``SCSI_DELAY`` configuration parameter can now be set at boot time
and runtime via the ``kern.cam.scsi_delay`` tunable/sysctl.

The trm driver has been added to support SCSI adapters using the Tekram
TRM-S1040 SCSI chipset.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6 Filesystems
~~~~~~~~~~~~~~~~~

Support for named extended attributes was added to the FreeBSD kernel.
This allows the kernel, and appropriately privileged userland processes,
to tag files and directories with attribute data. Extended attributes
were added to support the TrustedBSD Project, in particular ACLs,
capability data, and mandatory access control labels (see
``/usr/src/sys/ufs/ufs/README.extattr`` for details).

A filesystem snapshot capability has been added to FFS. Details can be
found in ``/usr/src/sys/ufs/ffs/README.snapshot``.

Softupdates for FFS have received some bug fixes and enhancements.

When running with softupdates,
`statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2&manpath=FreeBSD+5.0-current>`__
and
`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.0-current>`__
will track the number of blocks and files that are committed to being
freed.

`kernfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=kernfs&sektion=5&manpath=FreeBSD+5.0-current>`__
is obsolete and has been retired.

Client-side NFS locks have been implemented.

The client-side and server-side of the NFS code in the kernel used to be
intertwined in various complex ways. They have been split apart for ease
of maintenance and further development.

Support for filesystem Access Control Lists (ACLs) has been introduced,
allowing more fine-grained control of discretionary access control on
files and directories. This support was integrated from the TrustedBSD
Project. More details can be found in
``/usr/src/sys/ufs/ufs/README.acls``.

For consistency, the fdesc, fifo, null, msdos, portal, umap, and union
filesystems have been renamed to fdescfs, fifofs, msdosfs, nullfs,
portalfs, umapfs, and unionfs. Where applicable, modules and mount\_\*
programs have been renamed. Compatibility \`\`glue'' has been added to
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.0-current>`__
so that ``msdos`` filesystem entries in
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+5.0-current>`__
will work without changes.

pseudofs, a pseudo-filesystem framework, has been added.
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+5.0-current>`__
and
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__
have been modified to use pseudofs.

Network filesystems (such as NFS and smbfs filesystems) listed in
``/etc/fstab`` can now be properly mounted during startup
initialization; their mounts are deferred until after the network is
initialized.

Read-only support for the Universal Disk Format (UDF) has been added.
This format is used on packet-written CD-RWs and most commercial
DVD-Video disks. The
`mount\_udf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_udf&sektion=8&manpath=FreeBSD+5.0-current>`__
command can be used to mount these disks.

Basic support has been added for the UFS2 filesystem. Among its
features:

-  The inode has been expanded to 256 bytes to make space for 64-bit
   block pointers.

-  A file-creation time field has been added.

-  A native extended attributes implementation has been added,
   permitting total attribute size stored on an inode to be up to twice
   the filesystem block size. This storage is used for Access Control
   Lists and MAC labels, but may also be used by other system extensions
   and user applications.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7 PCCARD Support
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8 Multimedia Support
~~~~~~~~~~~~~~~~~~~~~~~~

A new API has been added for sound cards with hardware volume control.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

The Forth Inspired Command Language (**FICL**) used in the boot loader
has been updated to 3.02.

Support for Advanced Configuration and Power Interface (ACPI), a
multi-vendor standard for configuration and power management, has been
added. This functionality has been provided by the **Intel ACPI
Component Architecture** project, as of the ACPI CA 20020815 snapshot.
Some backward compatability for applications using the older APM
standard has been provided.

.. raw:: html

   <div class="SECT4">

--------------

2.1.9.1 IPFilter
^^^^^^^^^^^^^^^^

**IPFilter** has been updated to 3.4.29. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.1.9.3 KAME
^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Security-Related Changes
----------------------------

A bug in which malformed ELF executable images can hang the system has
been fixed (see security advisory FreeBSD-SA-00:41). [MERGED]

A security hole in Linux emulation was fixed (see security advisory
FreeBSD-SA-00:42). [MERGED]

TCP now uses stronger randomness in choosing its initial sequence
numbers (see security advisory FreeBSD-SA-00:52). [MERGED]

Several buffer overflows in
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+5.0-current>`__
were corrected (see security advisory FreeBSD-SA-00:61). [MERGED]

A security hole in
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.0-current>`__
was corrected (see security advisory FreeBSD-SA-00:62). [MERGED]

A potential security hole caused by an off-by-one-error in
`gethostbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyname&sektion=3&manpath=FreeBSD+5.0-current>`__
has been fixed (see security advisory FreeBSD-SA-00:63). [MERGED]

A potential buffer overflow in the
`ncurses(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ncurses&sektion=3&manpath=FreeBSD+5.0-current>`__
library, which could cause arbitrary code to be run from within
`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+5.0-current>`__,
has been corrected (see security advisory FreeBSD-SA-00:68). [MERGED]

A vulnerability in
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8&manpath=FreeBSD+5.0-current>`__
that could cause it to consume large amounts of server resources has
been fixed (see security advisory FreeBSD-SA-00:69). [MERGED]

The ``nat deny_incoming`` command in
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.0-current>`__
now works correctly (see security advisory FreeBSD-SA-00:70). [MERGED]

A vulnerability in
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+5.0-current>`__/`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+5.0-current>`__
temporary files that could allow overwriting of arbitrary user-writable
files has been closed (see security advisory FreeBSD-SA-00:76). [MERGED]

Several vulnerabilities in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__
were fixed (see security advisory FreeBSD-SA-00:77). [MERGED]

A bug in **OpenSSH** in which a server was unable to disable
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1&manpath=FreeBSD+5.0-current>`__
or ``X11Forwarding`` was fixed (see security advisory FreeBSD-SA-01:01).
[MERGED]

A bug in
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
and
`ip6fw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6fw&sektion=8&manpath=FreeBSD+5.0-current>`__
in which inbound TCP segments could incorrectly be treated as being part
of an ``established`` connection has been fixed (see security advisory
FreeBSD-SA-01:08). [MERGED]

A bug in
`crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1&manpath=FreeBSD+5.0-current>`__
that could allow users to read any file on the system in valid
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5&manpath=FreeBSD+5.0-current>`__
syntax has been fixed (see security advisory FreeBSD-SA-01:09). [MERGED]

A vulnerability in
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
that could allow read-access to the initial 16 bytes of
``wheel``-accessible files has been fixed (see security advisory
FreeBSD-SA-01:11). [MERGED]

A bug in
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+5.0-current>`__
that used insecure temporary files has been corrected (see security
advisory FreeBSD-SA-01:12). [MERGED]

**OpenSSH** now has code to prevent (instead of just mitigating through
connection limits) an attack that can lead to guessing the server key
(not host key) by regenerating the server key when an RSA failure is
detected (see security advisory FreeBSD-SA-01:24). [MERGED]

A bug in
`timed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=timed&sektion=8&manpath=FreeBSD+5.0-current>`__,
which caused it to crash if send certain malformed packets, has been
corrected (see security advisory FreeBSD-SA-01:28). [MERGED]

A bug in
`rwhod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rwhod&sektion=8&manpath=FreeBSD+5.0-current>`__,
which caused it to crash if send certain malformed packets, has been
corrected (see security advisory FreeBSD-SA-01:29). [MERGED]

A security hole in FreeBSD's FFS and EXT2FS implementations, which
allowed a race condition that could cause users to have unauthorized
access to data, has been fixed (see security advisory FreeBSD-SA-01:30).
[MERGED]

A remotely-exploitable vulnerability in
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8&manpath=FreeBSD+5.0-current>`__
has been closed (see security advisory FreeBSD-SA-01:31). [MERGED]

A security hole in **IPFilter**'s fragment cache has been closed (see
security advisory FreeBSD-SA-01:32). [MERGED]

Buffer overflows in
`glob(3) <http://www.FreeBSD.org/cgi/man.cgi?query=glob&sektion=3&manpath=FreeBSD+5.0-current>`__,
which could cause arbitrary code to be run on an FTP server, have been
closed. In addition, to prevent some forms of DOS attacks,
`glob(3) <http://www.FreeBSD.org/cgi/man.cgi?query=glob&sektion=3&manpath=FreeBSD+5.0-current>`__
allows specification of a limit on the number of pathname matches it
will return.
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now uses this feature (see security advisory FreeBSD-SA-01:33). [MERGED]

Initial sequence numbers in TCP are more thoroughly randomized (see
security advisory FreeBSD-SA-01:39). Due to some possible compatibility
issues, the behavior of this security fix can be enabled or disabled via
the ``net.inet.tcp.tcp_seq_genscheme`` sysctl variable.[MERGED]

A vulnerability in the
`fts(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fts&sektion=3&manpath=FreeBSD+5.0-current>`__
routines (used by applications for recursively traversing a filesystem)
could allow a program to operate on files outside the intended directory
hierarchy. This bug has been fixed (see security advisory
FreeBSD-SA-01:40). [MERGED]

A flaw allowed some signal handlers to remain in effect in a child
process after being exec-ed from its parent. This allowed an attacker to
execute arbitrary code in the context of a setuid binary. This flaw has
been corrected (see security advisory FreeBSD-SA-01:42). [MERGED]

A remote buffer overflow in
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+5.0-current>`__
has been fixed (see security advisory FreeBSD-SA-01:48). [MERGED]

A remote buffer overflow in
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8&manpath=FreeBSD+5.0-current>`__
has been fixed (see security advisory FreeBSD-SA-01:49). [MERGED]

The new ``net.inet.ip.maxfragpackets`` and
``net.inet.ip6.maxfragpackets`` sysctl variables limit the amount of
memory that can be consumed by IPv4 and IPv6 packet fragments, which
defends against some denial of service attacks (see security advisory
FreeBSD-SA-01:52). [MERGED]

A flaw in the implementation of the
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
``me`` rules on point-to-point links has been corrected. Formerly,
``me`` filter rules would match the remote IP address of a
point-to-point interface in addition to the intended local IP address
(see security advisory FreeBSD-SA-01:53). [MERGED]

A vulnerability in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__,
which could allow a process to read sensitive information from another
process's memory space, has been closed (see security advisory
FreeBSD-SA-01:55). [MERGED]

The ``PARANOID`` hostname checking in **tcp\_wrappers** now works as
advertised (see security advisory FreeBSD-SA-01:56). [MERGED]

A local root exploit in
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.0-current>`__
has been closed (see security advisory FreeBSD-SA-01:57). [MERGED]

A remote root vulnerability in
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+5.0-current>`__
has been closed (see security advisory FreeBSD-SA-01:58). [MERGED]

A race condition in
`rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8&manpath=FreeBSD+5.0-current>`__
that briefly exposed a world-readable ``/etc/master.passwd`` has been
fixed (see security advisory FreeBSD-SA-01:59). [MERGED]

A vulnerability in **UUCP** has been closed (see security advisory
FreeBSD-SA-01:62). All non-\ ``root``-owned binaries in standard system
paths now have the ``schg`` flag set to prevent exploit vectors when run
by
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+5.0-current>`__,
by ``root``, or by a user other then the one owning the binary. In
addition,
`uustat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uustat&sektion=1&manpath=FreeBSD+5.0-current>`__
is now run via ``/etc/periodic/daily/410.status-uucp`` as ``uucp``, not
``root``. In FreeBSD -CURRENT, **UUCP** has since been moved to the
Ports Collection and no longer a part of the base system. [MERGED]

A security hole in **OpenSSH**, which could allow users to execute code
with arbitrary privileges if ``UseLogin yes`` was set, has been closed.
Note that the default value of this setting is ``UseLogin no``. (See
security advisory FreeBSD-SA-01:63.) [MERGED]

The use of an insecure temporary directory by
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.0-current>`__
could permit a local attacker to modify the contents of binary packages
while they were being installed. This hole has been closed. (See
security advisory FreeBSD-SA-02:01.) [MERGED]

A race condition in
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+5.0-current>`__,
which could expose the contents of ``/etc/master.passwd``, has been
eliminated. (See security advisory FreeBSD-SA-02:02.) [MERGED]

A bug in
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+5.0-current>`__
could have allowed a process that had given up superuser privileges to
regain them. This bug has been fixed. (See security advisory
FreeBSD-SA-02:07.) [MERGED]

An \`\`off-by-one'' bug has been fixed in **OpenSSH**'s multiplexing
code. This bug could have allowed an authenticated remote user to cause
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.0-current>`__
to execute arbitrary code with superuser privileges, or allowed a
malicious SSH server to execute arbitrary code on the client system with
the privileges of the client user. (See security advisory
`FreeBSD-SA-02:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:13.openssh.asc>`__.)
[MERGED]

A programming error in **zlib** could result in attempts to free memory
multiple times. The
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+5.0-current>`__/`free(3) <http://www.FreeBSD.org/cgi/man.cgi?query=free&sektion=3&manpath=FreeBSD+5.0-current>`__
routines used in FreeBSD are not vulnerable to this error, but
applications receiving specially-crafted blocks of invalid compressed
data could be made to function incorrectly or abort. This **zlib** bug
has been fixed. For a workaround and solutions, see security advisory
`FreeBSD-SA-02:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:18.zlib.v1.2.asc>`__.
[MERGED]

Bugs in the TCP SYN cache (\`\`syncache'') and SYN cookie
(\`\`syncookie'') implementations, which could cause legitimate TCP/IP
traffic to crash a machine, have been fixed. For a workaround and
patches, see security advisory
`FreeBSD-SA-02:20 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:20.syncache.asc>`__.
[MERGED]

A routing table memory leak, which could allow a remote attacker to
exhaust the memory of a target machine, has been fixed. A workaround and
patches can be found in security advisory
`FreeBSD-SA-02:21 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:21.tcpip.asc>`__.
[MERGED]

A bug with memory-mapped I/O, which could cause a system crash, has been
fixed. For more information about a solution, see security advisory
`FreeBSD-SA-02:22 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:22.mmap.asc>`__.
[MERGED]

A security hole, in which SUID programs could be made to read from or
write to inappropriate files through manipulation of their standard I/O
file descriptors, has been fixed. Information regarding a solution can
be found in security advisory
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__.
[MERGED]

Some unexpected behavior could be allowed with
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+5.0-current>`__
because it does not require that an invoking user be a member of the
``wheel`` group when attempting to become the superuser (this is the
case with
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.0-current>`__).
To avoid this situation,
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+5.0-current>`__
is now installed non-SUID by default (effectively disabling it). More
information can be found in security advisory
`FreeBSD-SA-02:24 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:24.k5su.asc>`__.
[MERGED]

Multiple vulnerabilities were found in the
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__
utility, which could allow files to be overwritten without warning or
allow local users unintended access to files. These problems have been
corrected with a new import of **bzip2**. For more information, see
security advisory
`FreeBSD-SA-02:25 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:25.bzip2.asc>`__.
[MERGED]

A bug has been fixed in the implementation of the TCP SYN cache
(\`\`syncache''), which could allow a remote attacker to deny access to
a service when accept filters (see
`accept\_filter(9) <http://www.FreeBSD.org/cgi/man.cgi?query=accept_filter&sektion=9&manpath=FreeBSD+5.0-current>`__)
were in use. This bug has been fixed; for more information, see security
advisory
`FreeBSD-SA-02:26 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:26.accept.asc>`__.
[MERGED]

Due to a bug in
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.0-current>`__'s
use of shell globbing, users may be able to remove the contents of
arbitrary files if ``/tmp/.X11-unix`` does not exist and the system can
be made to reboot. This bug has been corrected (see security advisory
`FreeBSD-SA-02:27 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:27.rc.asc>`__).
[MERGED]

A buffer overflow in the resolver, which could be exploited by a
malicious domain name server or an attacker forging DNS messages, has
been fixed. See security advisory
`FreeBSD-SA-02:28 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:28.resolv.asc>`__
for more details. [MERGED]

A buffer overflow in
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+5.0-current>`__,
which could be triggered by badly-formed NFS packets, has been fixed.
See security advisory
`FreeBSD-SA-02:29 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:29.tcpdump.asc>`__
for more details. [MERGED]

`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+5.0-current>`__
can no longer trace the operation of formerly privileged processes; this
prevents the leakage of sensitive information that the process could
have obtained before abandoning its privileges. For a discussion of this
issue, see security advisory
`FreeBSD-SA-02:30 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:30.ktrace.asc>`__
for more details. [MERGED]

A race condition in
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+5.0-current>`__,
which could be used to change the permissions of an arbitrary file, has
been corrected. For more information, see security advisory
`FreeBSD-SA-02:32 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:32.pppd.asc>`__.
[MERGED]

Multiple buffer overflows in **OpenSSL** have been corrected, by way of
an upgrade to the base system version of **OpenSSL**. More details can
be found in security advisory
`FreeBSD-SA-02:33 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:33.openssl.asc>`__.
[MERGED]

A heap buffer overflow in the XDR decoder has been fixed. For more
details, see security advisory
`FreeBSD-SA-02:34 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:34.rpc.asc>`__.
[MERGED]

A bug that could allow local users to read and write arbitrary blocks on
an FFS filesystem has been corrected. More details can be found in
security advisory
`FreeBSD-SA-02:35 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:35.ffs.asc>`__.
[MERGED]

A bug in the NFS server code, which could allow a remote denial of
service attack, has been fixed. Security advisory
`FreeBSD-SA-02:36 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:36.nfs.asc>`__
has more details. [MERGED]

A bug that could allow local users to panic a system using the
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+5.0-current>`__
mechanism has been fixed. More information is contained in security
advisory
`FreeBSD-SA-02:37 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:37.kqueue.asc>`__.
[MERGED]

Several bounds-checking bugs in system calls, which could result in some
system calls returning a large portion of kernel memory, have been
fixed. More information can be found in security advisory
`FreeBSD-SA-02:38 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:38.signed-error.asc>`__.
[MERGED]

A bug that could allow applications using ``libkvm`` to leak sensitive
file descriptors has been corrected. (See security advisory
`FreeBSD-SA-02:39 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:39.libkvm.asc>`__
for more details.) [MERGED]

Buffer overflows in kadmind(8) and k5admin have been corrected. More
details can be found in security advisory
`FreeBSD-SA-02:40 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:40.kadmind.asc>`__.
[MERGED]

Errors in
`smrsh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=smrsh&sektion=8&manpath=FreeBSD+5.0-current>`__,
which could allow users to circumvent restrictions on what programs can
be executed, have been fixed. See
`FreeBSD-SA-02:41 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:41.smrsh.asc>`__
for details. [MERGED]

Buffer overflows in the DNS
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+5.0-current>`__,
which could cause some applications to fail, have been corrected. More
details are in
`FreeBSD-SA-02:42 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:42.resolv.asc>`__.
[MERGED]

Multiple vulnerabilities in **BIND** have been fixed, as described in
`FreeBSD-SA-02:43 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:43.bind.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
--------------------

Support for
`a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5&manpath=FreeBSD+5.0-current>`__
format executables in the compiler toolchain has been largely removed.

.. raw:: html

   <div class="NOTE">

    **Note:** This is a work in progress. Eventually,
    `a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5&manpath=FreeBSD+5.0-current>`__
    support will resurface in a series of ports/packages.

.. raw:: html

   </div>

`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+5.0-current>`__
now prints ``[fddi]`` or ``[atm]`` tags for addresses on interfaces of
those types.

The
`asa(1) <http://www.FreeBSD.org/cgi/man.cgi?query=asa&sektion=1&manpath=FreeBSD+5.0-current>`__
utility, to interpret FORTRAN carriage-control characters, has been
added.

`at(1) <http://www.FreeBSD.org/cgi/man.cgi?query=at&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports the ``-r`` command-line option to remove jobs and the
``-t`` option to specify times in POSIX time format.

The system
`awk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=awk&sektion=1&manpath=FreeBSD+5.0-current>`__
now refers to **BWK awk**.

`basename(1) <http://www.FreeBSD.org/cgi/man.cgi?query=basename&sektion=1&manpath=FreeBSD+5.0-current>`__
now accept ``-a`` and ``-s`` flags, which allow it to perform the
`basename(3) <http://www.FreeBSD.org/cgi/man.cgi?query=basename&sektion=3&manpath=FreeBSD+5.0-current>`__
function on multiple files.

`biff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=biff&sektion=1&manpath=FreeBSD+5.0-current>`__
now accepts a ``b`` argument to enable \`\`bell notification'' of new
mail (which does not disturb the terminal contents as ``biff y`` would).
[MERGED]

`biff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=biff&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses the first terminal associated with the standard input, standard
output or standard error file descriptor, in that order. Thus, it is
possible to use the redirection facilities of a shell
(``biff n <           /dev/ttyp1``) to toggle the notification for other
terminals.

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports Disk At Once (DAO) mode, selectable via the ``-d`` flag.
[MERGED]

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to write VCDs/SVCDs. [MERGED]

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
now accepts a value of ``max`` for its ``-s`` option to set the drive's
maximum write speed.

`bzgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzgrep&sektion=1&manpath=FreeBSD+5.0-current>`__,
`bzegrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzegrep&sektion=1&manpath=FreeBSD+5.0-current>`__,
and
`bzfgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzfgrep&sektion=1&manpath=FreeBSD+5.0-current>`__
have been added to perform
`grep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=grep&sektion=1&manpath=FreeBSD+5.0-current>`__-type
operations on
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__-compressed
files.

`calendar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=calendar&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-W`` option, which operates similar to ``-A`` but without
special treatment at weekends, and a ``-F``\ option to change the notion
of \`\`Friday''.

`catman(1) <http://www.FreeBSD.org/cgi/man.cgi?query=catman&sektion=1&manpath=FreeBSD+5.0-current>`__
is now a C program, instead of a Perl script.

`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``speed`` command to set the maximum speed to be used by
the drive (the maximum possible speed can be selected setting the speed
to ``max``).

A
`check\_utility\_compat(3) <http://www.FreeBSD.org/cgi/man.cgi?query=check_utility_compat&sektion=3&manpath=FreeBSD+5.0-current>`__
library function has been added to ``libc``, to determine whether
certain FreeBSD base system utilities should behave in FreeBSD
4-compatible mode or in a \`\`standard'' mode (default standard). The
configuration is done
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+5.0-current>`__-style,
with either an environment variable or a symbolic link.

`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1&manpath=FreeBSD+5.0-current>`__
has moved from ``/usr/bin`` to ``/bin``.

`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-h`` for changing the mode of a symbolic link.

`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1&manpath=FreeBSD+5.0-current>`__
now also, when the mode is modified, prints the old and new modes if the
``-v`` option is specified more than once.

`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer takes ``.`` as a user/group delimeter. This change was made to
support usernames containing a ``.``.

Use of the ``CSMG_*`` macros no longer require inclusion of
``<sys/param.h>``

A ``compat4x`` distribution has been added for compatibility with
FreeBSD 4-STABLE.

`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a (nonstandard) ``-n`` option to automatically answer \`\`no''
when it would ask to overwrite a file. [MERGED]

A new
`csplit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csplit&sektion=1&manpath=FreeBSD+5.0-current>`__
utility, which splits files based on context, has been added.

`ctags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ctags&sektion=1&manpath=FreeBSD+5.0-current>`__
now creates tags for typedefs, structs, unions, and enums by default
(implying the ``-t`` option). The new ``-T`` reverts to the old
behavior.

The
`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+5.0-current>`__
program, a command-line interface to
`daemon(3) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=3&manpath=FreeBSD+5.0-current>`__,
has been added. It detaches itself from its controlling terminal and
executes a program specified on the command line. This allows the user
to run an arbitrary program as if it were written to be a daemon.
[MERGED]

The
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+5.0-current>`__
utility, a userland daemon that can run arbitrary commands when devices
come and go in the device tree, has been added. This program is a
generalization of some of the functionality of
`pccardd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pccardd&sektion=8&manpath=FreeBSD+5.0-current>`__.

.. raw:: html

   <div class="NOTE">

    **Note:**
    `devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+5.0-current>`__
    is work-in-progress.

.. raw:: html

   </div>

`devinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devinfo&sektion=8&manpath=FreeBSD+5.0-current>`__,
a simple tool to print the device tree and resource usage by devices,
has been added.

diskpart(8) has been declared obsolete, and has been removed.

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a new ``-S`` flag to allow it to just print out the dump
size estimates and exit. [MERGED]

`expr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expr&sektion=1&manpath=FreeBSD+5.0-current>`__
is now compliant with POSIX.2-1992 (and thus also with POSIX.1-2001).
Some program depend on the old, historic behavior and do not properly
protect their arguments to keep them from being misinterpreted as
command-line options. (the
```devel/libtool`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/libtool/pkg-descr>`__
port/package, used by many GNU programs, is a notable example). The old
behavior can be requested by enabling compatibility mode for
`expr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expr&sektion=1&manpath=FreeBSD+5.0-current>`__
as described in
`check\_utility\_compat(3) <http://www.FreeBSD.org/cgi/man.cgi?query=check_utility_compat&sektion=3&manpath=FreeBSD+5.0-current>`__.

`fbtab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fbtab&sektion=5&manpath=FreeBSD+5.0-current>`__
now accepts glob matching patterns for target devices, not just
individual devices and directories.

`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer attempts to search for a device if none has been specified on
the command line, but instead tries to figure out the default device
name from the root device.

`fdread(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdread&sektion=1&manpath=FreeBSD+5.0-current>`__,
a program to read data from floppy disks, has been added. It is a
counterpart to
`fdwrite(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdwrite&sektion=1&manpath=FreeBSD+5.0-current>`__
and is designed to provide a means of recovering at least some data from
bad media, and to obviate for a complex invocation of
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1&manpath=FreeBSD+5.0-current>`__.

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
now has support for a ``.pubkey`` file. [MERGED]

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-g`` flag to restrict the printing of GECOS information
to the user's full name only. [MERGED]

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports the ``-4`` and ``-6`` flags to specify an address family
for remote queries. [MERGED]

`fold(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fold&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-b`` flag to break at byte positions and a ``-s`` flag
to break at word boundaries. [MERGED]

`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
wrappers have been imported; this feature provides infrastructure for
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
to work on different types of filesystems (analogous to
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.0-current>`__).

The behavior of
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
when dealing with various passes (a la ``/etc/fstab``) has been modified
to accommodate multiple-disk filesystems.

`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
now has support for foreground (``-F``) and background (``-B``) checks.
Traditionally,
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
is invoked before the filesystems are mounted and all checks are done to
completion at that time. If background checking is available,
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
is invoked twice. It is first invoked at the traditional time, before
the filesystems are mounted, with the ``-F`` flag to do checking on all
the filesystems that cannot do background checking. It is then invoked a
second time, after the system has completed going multiuser, with the
``-B`` flag to do checking on all the filesystems that can do background
checking. Unlike the foreground checking, the background checking is
started asynchronously so that other system activity can proceed even on
the filesystems that are being checked. Boot-time enabling of this
feature is controlled by the ``background_fsck`` option in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.0-current>`__.

`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports background filesystem checks to mounted FFS filesystems
with the ``-B`` option (softupdates must be enabled on these
filesystems). The ``-F`` flag now determines whether a specified
filesystem needs foreground checking.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports the ``-m`` option to permit guest users to modify existing
files if allowed by filesystem permissions. In particular, this enables
guest users to resume uploads. [MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports the ``-M`` option to prevent guest users from creating
directories. [MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports ``-o`` and ``-O`` options to disable the ``RETR`` command;
the former for everybody, and the latter only for guest users. Coupled
with ``-A`` and appropriate file permissions, these can be used to
create a relatively safe anonymous FTP drop box for others to upload to.
[MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports the ``-W`` option to disable logging FTP sessions to
`wtmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmp&sektion=5&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The
`getconf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getconf&sektion=1&manpath=FreeBSD+5.0-current>`__
utility has been added. It prints the values of POSIX or X/Open path or
system configuration variables. [MERGED]

gifconfig(8) is obsolete and has been removed. Its functionality is now
handled by the ``tunnel`` and ``deletetunnel`` commands of
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__.

`gprof(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gprof&sektion=1&manpath=FreeBSD+5.0-current>`__
now has a ``-K`` option to enable dynamic symbol resolution from the
currently-running kernel. With this change, properly-compiled KLD
modules are now able to be profiled.

The ibcs(8), linux(8), osf1(8), and svr4(8) scripts, whose sole purpose
was to load emulation kernel modules, have been removed. The kernel
module system will automatically load them as needed to fulfill
dependencies.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to set promiscuous mode on an interface, via the new
``promisc`` flag. [MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``monitor`` interface flag, which blocks transmission of
packets on that interface. This feature is useful for monitoring network
traffic without interacting with the network in question.

By default,
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
is no longer run by
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.0-current>`__
at boot-time, although
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
gives the option of enabling it during binary installations.
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
can also be enabled by adding the following line to ``/etc/rc.conf``:

.. code:: PROGRAMLISTING

        inetd_enable="YES"

`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the capability for limiting the maximum number of simultaneous
invocations of each service from a single IP address. [MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
filter rules can now match on the value of the IPv4 precedence field.

`kbdmap(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmap&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`vidfont(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidfont&sektion=1&manpath=FreeBSD+5.0-current>`__
have been converted from Perl to C.

`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1&manpath=FreeBSD+5.0-current>`__
now has the ability to set or delete kernel environment variables.

The kget(8) utility has been removed (it was only useful for UserConfig,
which is not present in FreeBSD 5.0-DP2).

`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+5.0-current>`__
no longer tries to kill zombie processes unless the ``-z`` flag is
specified.

`ktrdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrdump&sektion=8&manpath=FreeBSD+5.0-current>`__,
a utility to dump the ktr trace buffer from userland, has been added.

`ldd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ldd&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-a`` flag to list all the objects that are needed by
each loaded object.

``libc`` is now thread-safe by default; ``libc_r`` contains only thread
functions.

``libstand`` now has support for overwriting the contents of a file on a
UFS filesystem (it cannot expand or truncate files because the
filesystem may be dirty or inconsistent).

``libgmp`` has been superceded by ``libmp``.

The functions from ``libposix1e`` have been integrated into ``libc``.

`lock(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lock&sektion=1&manpath=FreeBSD+5.0-current>`__
now accepts a ``-v`` to disable switching VTYs while the current
terminal is locked. This permits locking the entire console from a
single terminal. [MERGED]

`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8&manpath=FreeBSD+5.0-current>`__
has been improved; ``lpc clean`` is now somewhat safer, and a new
``lpc           tclean`` command has been added to check to see what
files would be removed by ``lpc           clean``. ``lpc topq`` has been
reimplemented, and now allows for a much more flexible specification of
which jobs should be moved (such as a range of job numbers, or a
hostname). An ``lpc bottomq`` command has been added to move jobs to the
bottom of a print queue, and a new ``lpc setstatus`` command can be used
to set a printer's status message. [MERGED]

The
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+5.0-current>`__
program now supports a ``-m`` flag to list files across a page, a ``-p``
flag to force printing of a ``/`` after directories, and a ``-x`` flag
to sort filenames across a page. [MERGED]

`makewhatis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=makewhatis&sektion=1&manpath=FreeBSD+5.0-current>`__
is now a C program, instead of a Perl script.

`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+5.0-current>`__
is no longer installed SUID ``man``, in order to reduce vulnerabilities
associated with generating \`\`catpages'' (preformatted manual pages
cached for repeated viewing). As a result,
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+5.0-current>`__
can no longer create system catpages on a regular user's behalf. It is
still able to do so if the user has write permissions to the directory
holding catpages (e.g. a user's own manpages) or if the running user is
``root``.

The
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8&manpath=FreeBSD+5.0-current>`__
command has been added; it is a wrapper around
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+5.0-current>`__,
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+5.0-current>`__,
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__,
and
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.0-current>`__
that mimics the command line option set of the deprecated
`mount\_mfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_mfs&sektion=8&manpath=FreeBSD+5.0-current>`__.

`mesg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mesg&sektion=1&manpath=FreeBSD+5.0-current>`__
now conforms to SUSv3. Among other things, it now uses the first
terminal associated with the standard input, standard output or standard
error file descriptor, in that order. Thus, it is possible to use the
redirection facilities of a shell (``mesg n < /dev/ttyp1``) to control
write access for other terminals.

`mountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mountd&sektion=8&manpath=FreeBSD+5.0-current>`__
and
`nfsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsd&sektion=8&manpath=FreeBSD+5.0-current>`__
have moved from ``/sbin`` to ``/usr/sbin``.

`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a (nonstandard) ``-n`` option to automatically answer \`\`no''
when it would ask to overwrite a file. [MERGED]

A number of archaic features of
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
have been removed; these implement tuning features that are essentially
useless on modern hard disks. These features were controlled by the
``-O``, ``-d``, ``-k``, ``-l``, ``-n``, ``-p``, ``-r``, ``-t``, and
``-x`` flags.

`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-O`` flag to select the creation of UFS1 or UFS2
filesystems.

The
`newgrp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=newgrp&sektion=1&manpath=FreeBSD+5.0-current>`__
utility to change to a new group has been added.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.0-current>`__
now compresses log files using
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__
by default. (The former behavior of using
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.0-current>`__
can be specified in ``/etc/newsyslog.conf``.)

The
`nextboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nextboot&sektion=8&manpath=FreeBSD+5.0-current>`__
utility has been added to specify an alternate kernel and/or boot flags
to be used the next time the machine is booted. A previous incarnation
of this feature first appeared in FreeBSD 2.2.

**NFS** now works over IPv6.

`nice(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nice&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses the ``-n`` option to specify the \`\`niceness'' of the utility
being run. [MERGED]

**nsswitch** support has been merged from NetBSD. By creating an
`nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
file, FreeBSD can be configured so that various databases such as
`passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+5.0-current>`__
and
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5&manpath=FreeBSD+5.0-current>`__
can be looked up using flat files, NIS, or Hesiod. If
``/etc/nsswitch.conf`` does not exist, it will be automatically
generated from an existing ``/etc/hosts.conf`` at system startup time.
The ``/etc/hosts.conf`` file may be used by old executables; it will be
automatically generated from an existing ``/etc/nsswitch.conf`` during
system startup if it exists.

`od(1) <http://www.FreeBSD.org/cgi/man.cgi?query=od&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports the ``-A`` option to specify the input address base, the
``-N`` option to specify the number of bytes to dump, the ``-j`` option
to specify the number of bytes to skip, the ``-s`` option to output
signed decimal shorts, and the ``-t`` option to specify output type.
[MERGED]

**PAM** support has been added for account management and sessions.

**PAM** configuration is now specified by files in ``/etc/pam.d/``,
rather than a single ``/etc/pam.conf`` file. ``/etc/pam.d/README`` has
more details.

A
`pam\_echo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_echo&sektion=8&manpath=FreeBSD+5.0-current>`__
echo service module has been added.

A
`pam\_exec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_exec&sektion=8&manpath=FreeBSD+5.0-current>`__
program execution service module has been added.

A
`pam\_ftp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ftp&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added to allow authentication of anonymous FTP users.

A
`pam\_ftpusers(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ftpusers&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added to perform checks against the
`ftpusers(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpusers&sektion=5&manpath=FreeBSD+5.0-current>`__
file.

A
`pam\_ksu(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ksu&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added to do Kerberos 5 authentication and
``$HOME/.k5login`` authorization for
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.0-current>`__.

A
`pam\_lastlog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_lastlog&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added to record sessions in the
`utmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=utmp&sektion=5&manpath=FreeBSD+5.0-current>`__,
`wtmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmp&sektion=5&manpath=FreeBSD+5.0-current>`__,
and
`lastlog(5) <http://www.FreeBSD.org/cgi/man.cgi?query=lastlog&sektion=5&manpath=FreeBSD+5.0-current>`__
databases.

A
`pam\_login\_access(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_login_access&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added, to allow checking against ``/etc/login.access``.

The
`pam\_nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_nologin&sektion=8&manpath=FreeBSD+5.0-current>`__
module, which can disallow logins using
`nologin(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=5&manpath=FreeBSD+5.0-current>`__,
has been added.

The
`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8&manpath=FreeBSD+5.0-current>`__
and
`pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8&manpath=FreeBSD+5.0-current>`__
modules have been added to control authentication via
`opie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=opie&sektion=4&manpath=FreeBSD+5.0-current>`__.
[MERGED]

A
`pam\_passwdqc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_passwdqc&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added, to check the quality of passwords submitted
during password changes.

A
`pam\_rhosts(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rhosts&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added to support
`rhosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rhosts&sektion=5&manpath=FreeBSD+5.0-current>`__
authentication.

The
`pam\_rootok(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rootok&sektion=8&manpath=FreeBSD+5.0-current>`__
module, which can be used to authenticate only the superuser, has been
added.

A
`pam\_securetty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_securetty&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added to check the \`\`security'' of a TTY, as listed in
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5&manpath=FreeBSD+5.0-current>`__.

A
`pam\_self(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_self&sektion=8&manpath=FreeBSD+5.0-current>`__
module, which allows self-authentication of a user, has been added.

A
`pam\_wheel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_wheel&sektion=8&manpath=FreeBSD+5.0-current>`__
module has been added to permit authentication to members of a group,
which defaults to ``wheel``.

The
`pathchk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pathchk&sektion=1&manpath=FreeBSD+5.0-current>`__
utility, which checks pathnames for validity or portability between
POSIX systems, has been added. [MERGED]

`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-o`` flag to exit after receiving a reply.

prefix(8) is obsolete and has been removed. Its functionality is
provided by the ``eui64`` command to
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__.

The
`pselect(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pselect&sektion=3&manpath=FreeBSD+5.0-current>`__
library function (introduced by POSIX.1 as a slightly stronger version
of
`select(2) <http://www.FreeBSD.org/cgi/man.cgi?query=select&sektion=2&manpath=FreeBSD+5.0-current>`__)
has been added.

`pwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pwd&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports the ``-L`` flag to print the logical current working
directory. [MERGED]

`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-l`` flag to suppress quote checks on NFS filesystems.

The pseudo-random number generator implemented by
`rand(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rand&sektion=3&manpath=FreeBSD+5.0-current>`__
has been improved to provide less biased results.

`rcmd(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rcmd&sektion=3&manpath=FreeBSD+5.0-current>`__
now supports the use of the ``RSH`` environment variable to specify a
program to use other than
`rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1&manpath=FreeBSD+5.0-current>`__
for remote execution. As a result, programs such as
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__,
can use
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.0-current>`__
for remote transport.

`rdist(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rdist&sektion=1&manpath=FreeBSD+5.0-current>`__
has been retired from the base system, but is still available from
FreeBSD Ports Collection as
```net/44bsd-rdist`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/44bsd-rdist/pkg-descr>`__.

The
`renice(8) <http://www.FreeBSD.org/cgi/man.cgi?query=renice&sektion=8&manpath=FreeBSD+5.0-current>`__
command implements a ``-n`` option, which specifies an increment to be
applied to the priority of a process. [MERGED]

`rpcbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcbind&sektion=8&manpath=FreeBSD+5.0-current>`__
has replaced
`portmap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portmap&sektion=8&manpath=FreeBSD+5.0-current>`__.

`rpcgen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcgen&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses ``/usr/bin/cpp`` (as on NetBSD), not ``/usr/libexec/cpp``.

`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+5.0-current>`__
has been imported from NetBSD. This daemon provides support for
servicing client NFS locks.

`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+5.0-current>`__
will now print the names of all objects that cause each object to be
loaded, if the ``LD_TRACE_LOADED_OBJECTS_ALL`` environment variable is
defined.

`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-i`` option to enable in-place editing of files. [MERGED]

The
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1&manpath=FreeBSD+5.0-current>`__
commands have been added to manage filesystem Access Control Lists.

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
no longer implements ``printf`` as a built-in command because it was
considered less valuable compared to the other built-in commands (this
functionality is, of course, still available through the
`printf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=1&manpath=FreeBSD+5.0-current>`__
executable).

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-C`` option to prevent existing regular files from
being overwritten by output redirection, and a ``-u`` to give an error
if an unset variable is expanded. [MERGED]

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
built-in ``cd`` command now supports ``-L`` and ``-P`` flags to invoke
logical or physical modes of operation, respectively. Logical mode is
the default, but the default can be changed with the ``physical``
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
option. [MERGED]

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
built-in ``jobs`` command now supports a ``-s`` flag to output PIDs only
and a ``-l`` flag to add PIDs to the output. [MERGED]

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``bind`` built-in command, which allows the key bindings
for the shell's line editor to be changed.

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
built-in ``export`` and ``readonly`` commands now support a ``-p`` flag
to print their output in \`\`portable'' format. [MERGED]

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
no longer accepts invalid constructs as ``command`` & && ``command``,
``&& command``, or ``|| command``. [MERGED]

`spkrtest(8) <http://www.FreeBSD.org/cgi/man.cgi?query=spkrtest&sektion=8&manpath=FreeBSD+5.0-current>`__
is now a
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
script, rather than a Perl script.

`split(1) <http://www.FreeBSD.org/cgi/man.cgi?query=split&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-a`` option to specify the number of letters to use for
the suffix of split files. [MERGED]

In preparation for meeting SUSv2/POSIX ``<sys/select.h>`` requirements,
``struct selinfo`` and related functions have been moved to
``<sys/selinfo.h>``.

`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses **PAM** for authentication.

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+5.0-current>`__
now accepts a ``-d`` flag to print the descriptions of variables.

The default root partition in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
is now 100MB on the i386 and pc98, 120MB on the Alpha.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
now lives in ``/usr/sbin``, which simplifies the installation process.
The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
manpage is also installed in a more consistent fashion now.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer mounts the
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__
filesystem by default on new installs.

`tabs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tabs&sektion=1&manpath=FreeBSD+5.0-current>`__,
a utility to set terminal tab stops, has been added.

The
`termcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=termcap&sektion=5&manpath=FreeBSD+5.0-current>`__
database now uses the ``xterm`` terminal type from **XFree86**. As a
result,
`xterm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xterm&sektion=1&manpath=XFree86+4.2.0>`__
now supports color by default and the common workaround of setting
``TERM`` to ``xterm-color`` is no longer necessary. Use of the
``xterm-color`` terminal type may result in (benign) warnings from
applications.

`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports RFC 2349 (TFTP Timeout Interval and Transfer Size Options);
this feature is required by some firmware like EFI boot managers (at
least on HP i2000 Itanium servers) in order to boot an image using
**TFTP**.

A version of Transport Independent RPC (**TI-RPC**) has been imported.

`tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1&manpath=FreeBSD+5.0-current>`__
has been updated from **OpenBSD**, and has the ability to act as a
`cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1&manpath=FreeBSD+5.0-current>`__
substitute.

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.0-current>`__
will now use the full width of its tty.

`touch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=touch&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-h`` option to operate on a symbolic link, rather than
what the link points to.

`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+5.0-current>`__
now has basic support for equivalence classes for locales that support
them. [MERGED]

`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-C`` flag to complement the set of characters specified
by the first string argument.

`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports the ``-a`` and ``-l`` flags to enable and disable the
``FS_ACLS`` and ``FS_MULTILABEL`` administrative flags on UFS file
system.

A
`ugidfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ugidfw&sektion=8&manpath=FreeBSD+5.0-current>`__
utility has been added to manage the rulesets provided by the
``mac_bsdextended`` Mandatory Access Control policy, similar to
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__.

**UUCP** has been removed from the base system. It can be found in the
Ports Collection, in
```net/freebsd-uucp`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/freebsd-uucp/pkg-descr>`__.

`unexpand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unexpand&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-t`` to specify tabstops analogous to
`expand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expand&sektion=1&manpath=FreeBSD+5.0-current>`__.
[MERGED]

`usbdevs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdevs&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-d`` flag to show the device driver associated with
each device.

The base64 capabilities of
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+5.0-current>`__
can now be automatically enabled by invoking these utilities as
`b64encode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64encode&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+5.0-current>`__
respectively. [MERGED]

Functions to implement and manipulate OSF/DCE 1.1-compliant UUIDs have
been added to ``libc``. More information can be found in
`uuid(3) <http://www.FreeBSD.org/cgi/man.cgi?query=uuid&sektion=3&manpath=FreeBSD+5.0-current>`__.

The
`uuidgen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuidgen&sektion=1&manpath=FreeBSD+5.0-current>`__
utility has been added. It uses the new
`uuidgen(2) <http://www.FreeBSD.org/cgi/man.cgi?query=uuidgen&sektion=2&manpath=FreeBSD+5.0-current>`__
system call to generate one or more Universally Unique Identifiers
compatible with OSF/DCE 1.1 version 1 UUIDs.

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now accepts a ``-S`` to allow the user to disable VTY switching.
[MERGED]

The default stripe size in
`vinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=8&manpath=FreeBSD+5.0-current>`__
has been changed from 256KB to 279KB, to spread out superblocks more
evenly between stripes.

`wc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=wc&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-m`` flag to count characters, rather than bytes.

`whereis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whereis&sektion=1&manpath=FreeBSD+5.0-current>`__,
formerly a Perl script, has been rewritten in C. It now supports a
``-x`` flag to suppress the run of
`locate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locate&sektion=1&manpath=FreeBSD+5.0-current>`__,
and a ``-q`` flag suppresses the leading name of the query.

`whereis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whereis&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-a`` flag to report all matches instead of only the
first of each requested type.

`which(1) <http://www.FreeBSD.org/cgi/man.cgi?query=which&sektion=1&manpath=FreeBSD+5.0-current>`__
is now a C program, rather than a Perl script.

`who(1) <http://www.FreeBSD.org/cgi/man.cgi?query=who&sektion=1&manpath=FreeBSD+5.0-current>`__
now has a number of new options: ``-H`` shows column headings; ``-T``
shows
`mesg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mesg&sektion=1&manpath=FreeBSD+5.0-current>`__
state; ``-m`` is an equivalent to ``am i``; ``-u`` shows idle time;
``-q`` to list names in columns. [MERGED]

`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-l`` to list the stations associated in ``hostap`` mode
and a ``-L`` to list available access points.

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-I`` ``replstr`` option that allows the user to tell
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
to insert the data read from standard input at specific points in the
command line arguments rather than at the end. (A FreeBSD-specific
``-J`` option is similar.) [MERGED]

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-L`` option to force its utility argument to be called
after some number of lines. [MERGED]

Various routines in the C library now have support for \`\`wide''
characters. Among these are character class functions such as
`wctype(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wctype&sektion=3&manpath=FreeBSD+5.0-current>`__,
wide character I/O functions such as
`getwc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getwc&sektion=3&manpath=FreeBSD+5.0-current>`__,
formatted I/O functions such as
`wprintf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wprintf&sektion=3&manpath=FreeBSD+5.0-current>`__
and
`wscanf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wscanf&sektion=3&manpath=FreeBSD+5.0-current>`__.
Conversion functions to
`multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3&manpath=FreeBSD+5.0-current>`__
characters are also supported.

A number of utilities and libraries were enhanced to improve their
conformance with the Single UNIX Specification (SUSv3) and IEEE Std
1003.1-2001 (\`\`POSIX.1''). Specific features added have been listed in
the release notes for each utility. The standards conformance of each
utility or library function is generally listed in its manual page.

A number of games have been removed from the base system. These include:
adventure(6), arithmetic(6), atc(6), backgammon(6), battlestar(6),
bs(6), canfield(6), cribbage(6), fish(6), hack(6), hangman(6), larn(6),
mille(6), phantasia(6), piano(6), pig(6), quiz(6), rain(6), robots(6),
rogue(6), sail(6), snake(6), trek(6), wargames(6), worm(6), worms(6),
wump(6). dm(8), which was used to control access to games, is no longer
necessary, and has also been removed. The \`\`utility-like'' games, as
well as
`fortune(6) <http://www.FreeBSD.org/cgi/man.cgi?query=fortune&sektion=6&manpath=FreeBSD+5.0-current>`__,
remain.

.. raw:: html

   <div class="NOTE">

    **Note:** The affected programs will reappear as a port in the Ports
    Collection. This note will contain a pointer to that port, once it
    has been committed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

**am-utils** has been updated to 6.0.7.

A 10 February 2002 snapshot of **awk** from Bell Labs (variously known
as \`\`BWK awk'' or \`\`The One True AWK'') has been imported. It is
available as ``awk`` or ``nawk``.

**BIND** has been updated to 8.3.3. [MERGED]

**Binutils** has been updated to a pre-release snapshot of 2.13.1 from
11 October 2002.

**file** has been updated to 3.39.

**gcc** has been updated to a pre-release snapshot of **gcc** 3.2.1,
from 9 October 2002.

.. raw:: html

   <div class="WARNING">

    **Warning:** The C++ ABI from **gcc** 3.2.\ ``X`` is not compatible
    with previous versions.

.. raw:: html

   </div>

**gdb** has been updated to version 5.2.1.

**gperf** has been updated to 2.7.2.

**groff** and its related utilities have been updated to FSF version
1.18.1.

**Heimdal Kerberos** has been updated to a pre-0.5 snapshot from 16
September 2002.

The **ISC DHCP** client has been updated to 3.0.1RC9.

The
`more(1) <http://www.FreeBSD.org/cgi/man.cgi?query=more&sektion=1&manpath=FreeBSD+5.0-current>`__
command has been replaced by
`less(1) <http://www.FreeBSD.org/cgi/man.cgi?query=less&sektion=1&manpath=FreeBSD+5.0-current>`__,
although it can still be run as ``more``. [MERGED] Version 371 of
**less** has been imported.

An XML processing library, named ``libbsdxml``, has been added for the
benefit of XML-using utilities in the base system. It is based almost
entirely on an import of **expat** 1.95.5, but is installed under a
different name to avoid conflicts with any versions of **expat**
installed from the Ports Collection.

**libpcap** has been updated to 0.7.1. [MERGED]

**libreadline** has been updated to 4.2.

**libz** has been updated to 1.1.4.

**lint** has been updated to snapshot of NetBSD
`lint(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lint&sektion=1&manpath=FreeBSD+5.0-current>`__
as of 19 July 2002.

**lukemftp** 1.6 beta 2 (the FTP client from NetBSD) has replaced the
FreeBSD
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+5.0-current>`__
program. Among its new features are more automation methods, better
standards compliance, transfer rate throttling, and a customizable
command-line prompt. Some environment variables and command-line
arguments have changed.

The FTP daemon from NetBSD, otherwise known as **lukemftpd** 1.2 beta 1,
has been imported and is available as
`lukemftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lukemftpd&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1&manpath=FreeBSD+5.0-current>`__
has been imported from OpenBSD, as of 26 April 2002. [MERGED]

**ncurses** has been updated to 5.2-20020615.

The **NTP** suite of programs has been updated to 4.1.1b.

**OpenPAM** (\`\`Citronella'' release) has been imported, replacing
**Linux-PAM**.

The **OPIE** one-time-password suite has been updated to 2.4. It has
completely replaced the functionality of **S/Key**. [MERGED]

**Perl** has been removed from the FreeBSD base system. It can still be
installed from the FreeBSD Ports Collection or as a binary package;
moving it out of the base system will make future upgrades and
maintenence easier. To reduce the dependence of the base system on Perl,
many utilities have been rewritten as shell scripts or C programs
(specific notes are made for each affected utility). ``/usr/bin/perl``
is now a \`\`wrapper'' program, so that programs expecting to find a
Perl interpreter there will be able to function correctly.

.. raw:: html

   <div class="WARNING">

    **Warning:** The Perl removal and package integration work is
    ongoing.

.. raw:: html

   </div>

**GNU ptx** has been removed from the base system. It is not used
anywhere in the base system, and has not been recently updated or
maintained. Users requiring its functionality can install this utility
as a part of the
```textproc/textutils`` <http://www.FreeBSD.org/cgi/url.cgi?ports/textproc/textutils/pkg-descr>`__
port.

The ``rc.d`` framework from NetBSD has been imported. It breaks down the
system startup functionality into a number of small, \`\`task-oriented''
scripts in ``/etc/rc.d``, with dynamic-determined ordering of startup
scripts performed at boot-time.

Version 1.4.5 of the **smbfs** userland utilities has been imported.
[MERGED]

**GNU sort** has been updated to the version from **GNU textutils
2.0.21**.

`stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1&manpath=FreeBSD+5.0-current>`__
from **NetBSD**, as of 5 June 2002 has, been imported.

**GNU tar** has been updated to 1.13.25. [MERGED]

**tcpdump** has been updated to 3.7.1. [MERGED]

The
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+5.0-current>`__
shell has been replaced by
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+5.0-current>`__,
although it can still be run as ``csh``. **tcsh** has been updated to
version 6.12. [MERGED]

The contributed version of **tcp\_wrappers** now includes the
`tcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpd&sektion=8&manpath=FreeBSD+5.0-current>`__
helper daemon. While not strictly necessary in a standard FreeBSD
installation (because
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
already incorporates this functionality), this may be useful for
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
replacements such as **xinetd**. [MERGED]

**texinfo** has been updated to 4.2. [MERGED]

**top** has been updated to version 3.5b12. [MERGED]

**traceroute** has been updated to LBL version 1.4a12.

The timezone database has been updated to the ``tzdata2002d`` release.
[MERGED]

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.1 CVS
^^^^^^^^^^^

**cvs** has been updated to 1.11.2. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.2 CVSup
^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.3 KAME
^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.4 OpenSSH
^^^^^^^^^^^^^^^

**OpenSSH** has been updated to version 3.1. [MERGED] Among the changes:

-  The ``*2`` files are obsolete (for example, ``~/.ssh/known_hosts``
   can hold the contents of ``~/.ssh/known_hosts2``).

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+5.0-current>`__
   can import and export keys using the SECSH Public Key File Format,
   for key exchange with several commercial SSH implementations.

-  `ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1&manpath=FreeBSD+5.0-current>`__
   now adds all three default keys.

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+5.0-current>`__
   no longer defaults to a specific key type; one must be specified with
   the ``-t`` option.

**OpenSSH** has been updated to 3.4p1. [MERGED] The main changes are:

-  A \`\`privilege separation'' feature, which uses unprivileged
   processes to contain and restrict the effects of future compromises
   or programming errors.

-  Several bugfixes, including closure of a security hole that could
   lead to an integer overflow and undesired privilege escalation.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.5 OpenSSL
^^^^^^^^^^^^^^^

**OpenSSL** has been updated to 0.9.6g. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.6 sendmail
^^^^^^^^^^^^^^^^

**sendmail** has been updated from version 8.9.3 to version 8.12.6.
Important changes include:
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.0-current>`__
is no longer installed as a set-user-ID ``root`` binary (now
set-group-ID ``smmsp``); new default file locations (see
``/usr/src/contrib/sendmail/cf/README``);
`newaliases(1) <http://www.FreeBSD.org/cgi/man.cgi?query=newaliases&sektion=1&manpath=FreeBSD+5.0-current>`__
is limited to ``root`` and trusted users; STARTTLS encryption; and the
MSA port (587) is turned on by default. See
``/usr/src/contrib/sendmail/RELEASE_NOTES`` for more information.
[MERGED]

By default,
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer enables **sendmail** for inbound SMTP connections. Note that
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
may override this default for a binary installation, based on what
security profile is selected. This functionality can also be manually
enabled by adding the following line to ``/etc/rc.conf``:

.. code:: PROGRAMLISTING

        sendmail_enable="YES"

The permissions for **sendmail** alias and map databases built via
``/etc/mail/Makefile`` now default to mode 0640 to protect against a
file locking local denial of service. It can be changed by setting the
new ``SENDMAIL_MAP_PERMS`` ``make.conf`` option. [MERGED]

The permissions for the **sendmail** statistics file,
``/var/log/sendmail.st``, have been changed from mode 0644 to mode 0640
to protect against a file locking local denial of service. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**BSDPAN**, a collection of modules that provides tighter integration of
**Perl** into the FreeBSD Ports Collection, has been added.

For some time, FreeBSD 5.0-CURRENT (as well as some 4.X releases)
included a pkg\_update(1) utility to update installed packages, as well
as their dependencies. This utility has been removed; a superset of its
functionality can be found in the
```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__
port.

`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.0-current>`__,
formerly a Perl script, has been rewritten in C.

The Ports Collection infrastructure now uses **XFree86** 4.2.1 as the
default version of the X Window System for the purposes of satisfying
dependencies. To return to using **XFree86** 3.3.6, add the following
line to ``/etc/make.conf``: [MERGED]

.. code:: PROGRAMLISTING

        XFREE86_VERSION=3

The libraries installed by the
```emulators/linux_base`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
port (required for Linux emulation) have been updated; they now
correspond to those included with **Red Hat Linux** 7.1. [MERGED]

By default, packages generated by the Ports Collection (as well as the
packages on the FTP sites) are now compressed using
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__,
rather than
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.0-current>`__.
(Thus, they now have a ``.tbz`` extension, rather than a ``.tgz``
extension.) The package tools have been updated to handle the new
format.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Release Engineering and Integration
---------------------------------------

The ``bin`` distribution has been renamed ``base``, in order to make
creation of combined install/recovery disks easier.

It is now possible to make releases of FreeBSD 5-CURRENT on a FreeBSD
4-STABLE host and vice versa. Cross-architecture (building a release for
a target architecture on a host of a different architecture) releases
are also possible. See
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7&manpath=FreeBSD+5.0-current>`__
for details. [MERGED]

A third ``drivers.flp`` floppy has been added to floppy releases. It
holds loadable modules containing drivers that do not fit in the kernel
on the ``kern.flp`` disk or in the ``mfsroot.flp`` image.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Documentation
-----------------

A number of formerly-encumbered documents from the 4.4 BSD Programmer's
Supplementary Documents have been restored to ``/usr/share/doc/psd``.
These include:

-  *The UNIX Time-Sharing System* (``01.cacm``)

-  *UNIX Implementation* (``02.implement``)

-  *The UNIX I/O System* (``03.iosys``)

-  *UNIX Programming -- Second Edition* (``04.uprog``)

-  *The C Programming Language -- Reference Manual* (``06.Clang``)

-  *Yacc: Yet Another Compiler-Compiler* (``15.yacc``)

-  *Lex -- A Lexical Analyzer Generator* (``16.lex``)

-  *The M4 Macro Processor* (``17.m4``)

Several formerly-encumbered documents from the 4.4 BSD User's
Supplementary Documents have been restored to ``/usr/share/doc/usd``.
They include:

-  *NROFF/TROFF User's Manual* (``21.troff``)

-  *A TROFF Tutorial* (``22.trofftut``)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
=============================================

Users with existing FreeBSD systems are *highly* encouraged to read the
\`\`Early Adopter's Guide to FreeBSD 5.0''. This document generally has
the filename ``EARLY.TXT`` on the distribution media, or any other place
that the release notes can be found. It offers some notes on upgrading,
but more importantly, also discusses some of the relative merits of
upgrading to FreeBSD 5.\ ``X`` versus running FreeBSD 4.\ ``X``.

.. raw:: html

   <div class="IMPORTANT">

    **Important:** Upgrading FreeBSD should, of course, only be
    attempted after backing up *all* data and configuration files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
http://snapshots.jp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 5-CURRENT should subscribe to the
<current@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
