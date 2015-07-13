=========================================
FreeBSD/sparc64 5.0-CURRENT Release Notes
=========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/sparc64 5.0-CURRENT Release Notes
=========================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.315 2002/04/05 17:03:33 bmah Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 5.0-CURRENT contain a summary of the
changes made in the FreeBSD base system since 4.0-RELEASE. Both changes
for kernel and userland are listed, as well as applicable security
advisories that were issued since the last release. Some brief remarks
on upgrading are also presented.

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
2.1.1 `Processor/Motherboard Support <#AEN289>`__
2.1.2 `Bootloader Changes <#AEN316>`__
2.1.3 `Network Interface Support <#AEN338>`__
2.1.4 `Network Protocols <#AEN567>`__
2.1.5 `Disks and Storage <#AEN693>`__
2.1.6 `Filesystems <#AEN834>`__
2.1.7 `PCCARD Support <#AEN909>`__
2.1.8 `Multimedia Support <#AEN930>`__
2.1.9 `Contributed Software <#AEN954>`__
2.2 `Security-Related Changes <#SECURITY>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 `Contributed Software <#AEN2668>`__
2.3.2 `Ports/Packages Collection <#AEN3076>`__
3 `Upgrading from previous releases of FreeBSD <#AEN3169>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This document contains the release notes for FreeBSD 5.0-CURRENT on the
UltraSPARC hardware platform. It describes new features of FreeBSD that
have been added (or changed) since 4.0-RELEASE. It also provides some
notes on upgrading from previous versions of FreeBSD.

The snapshot distribution to which these release notes apply represents
a point along the 5-CURRENT development branch between 4.0-RELEASE and
the future 5.0-RELEASE. Some pre-built, binary snapshot distributions
along this branch can be found at
ftp://ftp.FreeBSD.org/pub/FreeBSD/development/sparc64/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
============

This section describes the most user-visible new or changed features in
FreeBSD since 4.0-RELEASE. Typical release note items document new
drivers or hardware support, new commands or options, major bugfixes, or
contributed software upgrades. Security advisories issued after
4.0-RELEASE are also listed. In general, changes described here are
unique to the 5-CURRENT branch unless specifically marked as [MERGED]
features.

Many additional changes were made to FreeBSD that are not listed here
for lack of space. For example, documentation was corrected and
improved, minor bugs were fixed, insecure coding practices were audited
and corrected, and source code was cleaned up.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Kernel Changes
------------------

The
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver for AGP devices has been added. [MERGED]

A new
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+5.0-current>`__
command ``show pcpu`` lists some of the per-CPU data.

Two new
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+5.0-current>`__
commands, ``hwatch`` and ``dhwatch``, have been introduced. Analogous to
``watch`` and ``dwatch``, they install hardware watchpoints (as opposed
to software watchpoints) if supported by the architecture. [MERGED]

`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__,
which allows entries in the ``/dev`` directory to be built automatically
and supports more flexible attachment of devices, has been largely
reworked.
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__
is now enabled by default and can be disabled by the ``NODEVFS`` kernel
option.

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

Support has been added for EBus-based devices.

Each
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.0-current>`__
environment can now run under its own securelevel.

The tunable sysctl variables for
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.0-current>`__
have moved from ``jail.*`` to the ``security.*`` hierarchy. Other
security-related sysctl variables have moved from ``kern.security.*`` to
``security.*``.

The ``kern.maxvnodes`` limit now properly limits the number of vnodes in
use. Previously only vnodes with no cached pages could be freed; this
could allow the number of vnodes to grow without limit on large-memory
machines accessing many small files. A ``vnlru`` kernel thread helps to
flush and reuse vnodes. [MERGED]

The kernel message buffer is now accessible by the (machine-independent)
``kern.msgbuf`` sysctl variable;
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer needs to be SGID ``kmem``. [MERGED]

The
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+5.0-current>`__
event notification facility was added to the FreeBSD kernel. This is a
new interface which is able to replace
`poll(2) <http://www.FreeBSD.org/cgi/man.cgi?query=poll&sektion=2&manpath=FreeBSD+5.0-current>`__/`select(2) <http://www.FreeBSD.org/cgi/man.cgi?query=select&sektion=2&manpath=FreeBSD+5.0-current>`__,
offering improved performance, as well as the ability to report many
different types of events. Support for monitoring changes in sockets,
pipes, fifos, and files are present, as well as for signals and
processes. [MERGED]

The
`labpc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=labpc&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been removed due to \`\`bitrot''.

The loader and kernel linker now look for files named ``linker.hints``
in each directory with KLDs for a module name and version to KLD
filename mapping. The new
`kldxref(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldxref&sektion=8&manpath=FreeBSD+5.0-current>`__
utility is used to generate these files.

Linux emulation now supports the kernel functionality required by the
```emulators/linux_base-7`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/linux_base-7/pkg-descr>`__
(RedHat 7.X emulation) port. [MERGED]

Linux emulation now requires ``options SYSVSEM`` in the kernel
configuration. [MERGED]

`lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lomac&sektion=4&manpath=FreeBSD+5.0-current>`__,
a Low-Watermark Mandatory Access Control security facility, has been
added as a kernel module. It provides a drop-in security mechanism in
addition to the traditional UID-based security facilities, requiring no
additional configuration from the administrator. Work on this feature
was sponsored by DARPA and NAI Labs.

The ``maxusers`` kernel configuration parameter is now a boot-time
tunable variable. The kernel parameters derived from ``maxusers`` are
now also tunables and can be overridden at boot-time. The ``hz``
parameter is also now a tunable. [MERGED]

Specifying a value of ``0`` for the ``maxusers`` kernel configuration
parameter will now cause an appropriate value to be calculated at
boot-time (between 32 and 384, depending on the amount of memory
present). This value is now the default for all ``GENERIC`` kernels.
[MERGED]

The kernel configuration parameters ``MAXTSIZ``, ``DFLDSIZ``,
``MAXDSIZ``, ``DFLSSIZ``, ``MAXSSIZ``, and ``SGROWSIZ`` are all loader
tunables (``kern.maxtsiz``, ``kern.maxdfldsiz``, etc.). [MERGED]

`mutex(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mutex&sektion=9&manpath=FreeBSD+5.0-current>`__
profiling code has been added, enabled by the ``MUTEX_PROFILING`` kernel
configuration option. It enables the ``debug.mutex.prof.*`` hierarchy of
sysctl variables.

A
`nmdm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nmdm&sektion=4&manpath=FreeBSD+5.0-current>`__
null-modem terminal driver has been added. [MERGED]

The ``O_DIRECT`` flag has been added to
`open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=open&sektion=2&manpath=FreeBSD+5.0-current>`__
and
`fcntl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fcntl&sektion=2&manpath=FreeBSD+5.0-current>`__.
Specifying this flag for open files will attempt to minimize the cache
effects of reading and writing. [MERGED]

An
`orm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=orm&sektion=4&manpath=FreeBSD+5.0-current>`__
device has been added to claim the option ROMs in the ISA memory I/O
space, to prevent other drivers from mistakenly assigning addresses that
conflict with these ROMs. [MERGED]

POSIX.1b Shared Memory Objects are now supported. The implementation
uses regular files, but automatically enables the MAP\_NOSYNC flag when
they are
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+5.0-current>`__-ed.
[MERGED]

Replaced the ``PQ_*CACHE`` options with a single ``PQ_CACHESIZE`` option
to be set to the cache size in kilobytes. The old options are still
supported for backwards compatibility. [MERGED]

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

Support has been added for SBus-based devices.

The
`snp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snp&sektion=4&manpath=FreeBSD+5.0-current>`__
device is no longer static and can now be compiled as a module. [MERGED]

The
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports keyboard-controlled pasting, by default bound to
**Shift**-**Insert**.

Support for USB devices was added to the ``GENERIC`` kernel and to the
installation programs to support USB devices out of the box. Note that
SRM does not support USB devices at the moment, so you must still use an
AT keyboard if you are not using a serial console. [MERGED]

The ucom device driver has been added, to support USB modems, serial
devices, and other programs that need to look like a tty. The related
uplcom and uvscom drivers provide specific support for the Prolific
PL-2303 serial adapter and the SUNTAC Slipper U VS-10U, respectively.

To increase security, the ``UCONSOLE`` kernel configuration option has
been removed.

The ``USER_LDT`` kernel option is now activated by default.

A VESA S3 linear framebuffer driver has been added.

Write combining for crashdumps has been implemented. This feature is
useful when write caching is disabled on both SCSI and IDE disks, where
large memory dumps could take up to an hour to complete. [MERGED]

Extremely large swap areas (>67 GB) no longer panic the system.

The ``buildkernel`` target now gets the name of the configuration(s) to
build from the ``KERNCONF`` variable, not ``KERNEL``. It is no longer
required, in some cases, for a ``buildworld`` to precede a
``buildkernel``. (The ``buildworld`` is still required when upgrading
across major releases, across **binutil** updates and when
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__
changes version.) [MERGED]

The out-of-swap process termination code now begins killing processes
earlier to avoid deadlocks; it now also takes into account the swap
space used by processes when computing the process sizes. [MERGED]

Linker sets are now self-contained;
`gensetdefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gensetdefs&sektion=8&manpath=FreeBSD+5.0-current>`__
is unnecessary and has been removed.

Network device cloning has been implemented, and the
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+5.0-current>`__
device has been modified to take advantage of it. Thus, instead of
specifying how many
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+5.0-current>`__
interfaces are available in kernel configuration files,
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__'s
``create`` option should be used when another device instance is
desired. [MERGED]

It is now possible to hardwire kernel environment variables (such as
tuneables) at compile-time using
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__'s
``ENV`` directive.

Idle zeroing of pages can be enabled with the ``vm.idlezero_enable``
sysctl variable.

Coredumps of large processes (or of a large number of processes) no
longer lock up the machine for long periods of time. [MERGED]

The Kernel-Scheduled Entity project has made changes to the kernel
scheduler to more efficiently handle multi-threaded programs.

The kernel now has support for multiple low-level console devices. The
new
`conscontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=conscontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
utility helps to manage the different consoles.

The kernel on the installation CDs is now separated from the ``mfsroot``
image. This permits the use of a full kernel when installing from CD on
machines that support CD booting (instead of the stripped-down kernel
used on floppies). [MERGED]

The system load average computation now adds some jitter to the timing
of samples, in order to avoid synchronization with processes that run
periodically. [MERGED]

If a debugging kernel with modules is being built (i.e. using
``makeoptions           DEBUG=-g``), the modules will now be built with
debugging support as well, for completeness. A side effect of this
change is that modules built and installed with debugging kernels will
now occupy more space on disk than they did previously. [MERGED]

The kernel dump device can now be set via the ``dumpdev`` loader
tunable. As a result, it is now possible to obtain crash dumps from
panics during the late stages of kernel initialization (before the
system enters into single-user mode). [MERGED]

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

The UltraSPARC platform is now supported by FreeBSD. The following
machines are supported to at least some degree: Ultra 1/2/5/10/30/60,
Enterprise 220R/420R, Netra T1 AC200/DC200, Netra T 105, and Blade 100.
SMP is supported, and has been tested on the Ultra 2, Ultra 60,
Enterprise 220R, and Enterprise 420R.

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
`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.0-current>`__
driver for Cisco Aironet cards now supports Wired Equivalent Privacy
(WEP) encryption, settable via
`ancontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ancontrol&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The
`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports the Cisco Aironet 350 series of adaptors. [MERGED]

The
`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports \`\`monitor'' mode, settable via the ``-M`` option
to
`ancontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ancontrol&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The
`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports Cisco LEAP, as well as the \`\`Home'' WEP key. The
Linux Aironet utilities are now supported under emulation. [MERGED]

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports NICs based on the Xircom 3201 and Conexant LANfinity
RS7112 chips.

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for VLANs. [MERGED]

The
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now performs round-robin arbitration between the transmit and
receive units of the 21143, instead of giving priority to the receive
unit. This gives a 10-15% performance improvement in the forwarding rate
under heavy load. [MERGED]

A bug in the
`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.0-current>`__
driver that could cause panics with very short packets and BPF or
bridging active has been fixed. [MERGED]

The
`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for D-Link DL10022 chips, necessary for the
NetGear FA-410TX and other cards. As a result, ``device miibus`` is
required in kernel configurations using the
`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+5.0-current>`__
driver. [MERGED]

The
`faith(4) <http://www.FreeBSD.org/cgi/man.cgi?query=faith&sektion=4&manpath=FreeBSD+5.0-current>`__
device is now loadable, unloadable, and clonable. [MERGED]

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now requires a ``device miibus`` entry in the kernel
configuration file. [MERGED]

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now contains a workaround for PCI protocol violations caused by
defects in some systems based on the Intel ICH2/ICH2-M chip. The
workaround is to rewrite the EEPROM on the interface to disable Dynamic
Standby Mode; once the EEPROM is rewritten, the system needs to be
rebooted for the new settings to take effect. [MERGED]

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports Intel's loadable microcode to implement receive-side
interrupt coalescing and packet bundling, on NICs that support these
features. This support can be activated by the use of the ``link0``
option to
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The gem driver has been added to support the Sun GEM Gigabit Ethernet
and ERI Fast Ethernet adapters.

The
`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been added to support NICs based on the Intel 82542 and 82543
Gigabit Ethernet controller chips. Both fiber and copper variants of the
cards are supported. Both boards support VLAN tagging/insertion, and the
82543 additionally supports TCP/IP checksum offload. [MERGED]

The hme driver has been added to support the Sun HME Fast Ethernet
adapter, onboard on many Sun Ultra series machines.

The
`lge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lge&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been added to support the Level 1 LXT1001 NetCellerator
Gigabit Ethernet controller chip. This device is used on some fiber
optic GigE cards from SMC, D-Link and Addtron. Jumbograms and TCP/IP
checksum offload on receive are supported, although hardware VLAN
filtering is not. [MERGED]

Added the
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.0-current>`__
driver, which supports PCI Gigabit Ethernet adapters based on the
National Semiconductor DP83820 and DP83821 Gigabit Ethernet controller
chips, including the D-Link DGE-500T, SMC EZ Card 1000 (SMC9462TX),
Asante FriendlyNet GigaNIC 1000TA and 1000TPC and Addtron AEG320T. This
driver supports transmit and receive checksum offloading. [MERGED]

The
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+5.0-current>`__
driver, which supports the AMD PCnet/FAST, PCnet/FAST+, PCnet/FAST III,
PCnet/PRO, PCnet/Home, and HomePNA adapters, has been added. Although
these cards are already supported by the
`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+5.0-current>`__
driver, the
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+5.0-current>`__
driver runs these chips in 32-bit mode and uses the RX alignment feature
to achieve zero-copy receive. This driver is also machine-independent,
so it will work on both the i386 and Alpha platforms. The
`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+5.0-current>`__
driver is still needed to support non-PCI cards. [MERGED]

The
`ray(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ray&sektion=4&manpath=FreeBSD+5.0-current>`__
driver, which supports the Webgear Aviator wireless network cards, has
been committed. The operation of
`ray(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ray&sektion=4&manpath=FreeBSD+5.0-current>`__
interfaces can be modified by
`raycontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=raycontrol&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

Added support for PCI Ethernet adapters based on the SiS 900 and SiS
7016 Fast Ethernet controller chips (for example, as seen on the SiS 635
and 735 motherboard chipsets), as well as the National Semiconductor
DP83815 chipset (including the NetGear FA311-TX and FA312-TX) in the
form of the
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.0-current>`__
driver. This device has support for VLANs. [MERGED]

The
`stf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stf&sektion=4&manpath=FreeBSD+5.0-current>`__
device is now clonable.

The
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+5.0-current>`__
driver, a virtual Ethernet device driver for bridged configurations, has
been added. This device is clonable. [MERGED]

The
`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports the Alteon AceNIC 1000baseT Gigabit Ethernet and
Netgear GA620T 1000baseT Gigabit cards. [MERGED]

The
`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+5.0-current>`__
driver correctly masks VLAN tags. [MERGED]

The
`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been added to support NICs based on the 3Com 3XP
Typhoon/Sidewinder (3CR990) chipset. [MERGED]

`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+5.0-current>`__
devices are now loadable, unloadable, and clonable. [MERGED]

The
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for Prism II and Prism 2.5-based NICs.
104/128-bit WEP now works on Prism cards. [MERGED]

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports the 3Com 3C556 and 3C556B MiniPCI adapters used on
some laptops. [MERGED]

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports reception of VLAN tagged frames (on the
\`\`Cyclone'' or newer chipsets). [MERGED]

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports send- and receive-side TCP/IP checksum offloading
for NICs implementing this feature, such as the 3C905B, 3C905C, and
3C980C. [MERGED]

A bug in the
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.0-current>`__
driver, related to statistics overflow interrupt handling, was causing
slowdowns at medium to high packet rates; this has been fixed. [MERGED]

The per-interface ``ifnet`` structure now has the ability to indicate a
set of capabilities supported by a network interface, and which ones are
enabled.
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
has support for querying these capabilities. [MERGED]

Performance with hosts having a large number of IP aliases has been
improved, by replacing the per-interface ``if_inaddr`` linear list with
a hash table. [MERGED]

Network devices now automatically appear as special files in
``/dev/net``. Interface hardware ioctls (not protocol or routing) can be
performed on these devices. The ``SIOCGIFCONF`` ioctl may be performed
on the special ``/dev/network`` node.

Selected network drivers now implement a semi-polling mode, which makes
systems much more resilient to attacks and overloads. To enable polling,
the following options are required in a kernel configuration file:

.. code:: PROGRAMLISTING

        options DEVICE_POLLING
        options HZ=1000 # not compulsory but strongly recommended

The ``kern.polling.enable`` sysctl variable will then activate polling
mode; with the ``kern.polling.user_frac`` sysctl indicating the
percentage of CPU time to be reserved for userland. The devices
initially supporting polling are
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.0-current>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.0-current>`__,
and
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.0-current>`__.
More details can be found in the
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.0-current>`__
manual page. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4 Network Protocols
~~~~~~~~~~~~~~~~~~~~~~~

`accept\_filter(9) <http://www.FreeBSD.org/cgi/man.cgi?query=accept_filter&sektion=9&manpath=FreeBSD+5.0-current>`__,
a kernel feature to reduce overheads when accepting and reading new
connections on listening sockets, has been added. [MERGED]

The ``proxy`` modifier to
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+5.0-current>`__'s
``-d`` option has been renamed to ``pub``, for consistency with the
``-s`` option. The ``only`` keyword has been added to the ``-s`` and
``-S`` flags, to be used in creating \`\`proxy-only'' published entries.
[MERGED]

The read timeout feature of
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+5.0-current>`__
now works more correctly with
`select(2) <http://www.FreeBSD.org/cgi/man.cgi?query=select&sektion=2&manpath=FreeBSD+5.0-current>`__/`poll(2) <http://www.FreeBSD.org/cgi/man.cgi?query=poll&sektion=2&manpath=FreeBSD+5.0-current>`__,
and therefore with pthreads. [MERGED]

`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4&manpath=FreeBSD+5.0-current>`__
and
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+5.0-current>`__
have received some enhancements and bug fixes, and are now loadable
modules. [MERGED]

`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4&manpath=FreeBSD+5.0-current>`__
now has better support for multiple, fully-independent bridging
clusters, and is much more stable in the presence of dynamic attachments
and detatchments. Full support for VLANs is also supported. [MERGED]

ICMP ECHO and TSTAMP replies are now rate limited. TCP RSTs generated
due to packets sent to open and unopen ports are now limited by separate
counters. Each rate limiting queue now has its own description.

ICMP ``UNREACH_FILTER_PROHIB`` messages can now RST TCP connections in
the ``SYN_SENT`` state if the correct sequence numbers are sent back, as
controlled by the ``net.inet.tcp.icmp_may_rst`` sysctl. [MERGED]

IP multicast now works on VLAN devices. Several other bugs in the VLAN
code have also been fixed.

A bug in the IPSec processing for IPv4, which caused the inbound SPD
checks to be ignored, has been fixed. [MERGED]

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.0-current>`__
now filters correctly in the presence of ECN bits in TCP segments.
[MERGED]

A new
`ng\_eth(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_eth&sektion=4&manpath=FreeBSD+5.0-current>`__
netgraph node allows Ethernet type packets to be filtered to different
hooks depending on ethertype.

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

The
`ng\_mppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_mppc&sektion=4&manpath=FreeBSD+5.0-current>`__
and
`ng\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bridge&sektion=4&manpath=FreeBSD+5.0-current>`__
node types have been added to the
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+5.0-current>`__
subsystem. The
`ng\_ether(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ether&sektion=4&manpath=FreeBSD+5.0-current>`__
node is now dynamically loadable. Miscellaneous bug fixes and
enhancements have also been made. [MERGED]

A new netgraph node type
`ng\_one2many(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_one2many&sektion=4&manpath=FreeBSD+5.0-current>`__
for multiplexing and demultiplexing packets over multiple links has been
added. [MERGED]

A new sysctl ``net.inet.ip.check_interface``, which is on by default,
causes IP to verify that an incoming packet arrives on an interface that
has an address matching the packet's destination address. [MERGED]

A new sysctl ``net.link.ether.inet.log_arp_wrong_iface`` has been added
to control the suppression of logging when ARP replies arrive on the
wrong interface. [MERGED]

A new ``options RANDOM_IP_ID`` kernel option causes the ID field of IP
packets to be randomized. This closes a minor information leak which
allows a remote observer to determine the rate at which the machine is
generating packets, since the default behavior is to increment a counter
for each packet sent. [MERGED]

TCP has received some bug fixes for its delayed ACK behavior. [MERGED]

TCP now supports the NewReno modification to the TCP Fast Recovery
algorithm. This behavior can be controlled via the
``net.inet.tcp.newreno`` sysctl variable. [MERGED]

TCP now uses a more aggressive timeout for initial SYN segments; this
allows initial connection attempts to be dropped much faster. [MERGED]

The ``TCP_COMPAT_42`` kernel option has been removed. [MERGED]

The ``TCP_RESTRICT_RST`` kernel option has been removed. Similar
functionality can be achieved with the ``net.inet.tcp.blackhole`` sysctl
variable. [MERGED]

TCP now has RFC 1323 extensions enabled by default in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.0-current>`__.
[MERGED]

RFC 1323 and RFC 1644 TCP extensions are now disabled for a connection
in progress if no response has been received by the third SYN segment
sent. This behavior tries to work around (very old) terminal servers
with buggy VJ header compression implementations. [MERGED]

The TCP implementation no longer requires the allocation of a TCP
template structure for each connection; this should reduce the buffer
usage on large systems handling many connections. [MERGED]

TCP's default buffer sizes, controlled by the ``net.inet.tcp.sendspace``
and ``net.inet.tcp.recvspace`` sysctl variables, have been increased to
32K and 64K respectively. Previously, the default for both buffer sizes
was 16K. To try to avoid increasing congestion, the default value for
``net.inet.tcp.local_slowstart_flightsize`` has been changed from
infinity to 4. [MERGED]

.. raw:: html

   <div class="NOTE">

    **Note:** On busy hosts, the new larger buffer sizes may require
    manually increasing the ``NMBCLUSTERS`` parameter, either in the
    kernel configuration file or via the ``kern.ipc.nmbclusters`` loader
    tunable. ``netstat                 -mb`` can be used to monitor the
    state of mbuf clusters.

.. raw:: html

   </div>

TCP now supports RFC 1948 (Defending Against Sequence Number Attacks).
This functionality is controlled by the ``net.inet.tcp.strict_rfc1948``
and ``net.inet.tcp.isn_reseed_interval`` sysctl variables. [MERGED]

The TCP implementation in FreeBSD now implements a cache of outstanding,
received SYN segments. Incoming SYN segments now cause entries to be
placed in the cache until the TCP three-way handshake is complete, at
which point, memory is allocated for the connection as usual. In
addition, all TCP Initial Sequence Numbers (ISNs) are used as cookies,
allowing entries in the cache to be dropped, but still have their
corresponding ACKs accepted later. The combination of the so-called
\`\`syncache'' and \`\`syncookies'' features makes a host much more
resistant to TCP-based Denial of Service attacks. Work on this feature
was sponsored by DARPA and NAI Labs. [MERGED]

A bug in the TCP implementation, which could cause connections to stall
if a sender saw a zero-sized window, has been corrected. [MERGED]

The TCP implementation now properly ignores packets addressed to
IP-layer broadcast addresses. [MERGED]

The ephemeral port range used for TCP and UDP has been changed to
49152-65535 (the old default was 1024-5000). This increases the number
of concurrent outgoing connections/streams.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5 Disks and Storage
~~~~~~~~~~~~~~~~~~~~~~~

The
`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has received numerous updates, bugfixes, and enhancements. Among
various improvements are improved compatibility with chips in \`\`RAID
Port'' mode and systems with AAA and/or ARO cards installed, as well as
performance improvements. Some bugs were also fixed, including a rare
hang on Ultra2/U160 controllers. [MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for ATA100 controllers. In addition, it now
supports the ServerWorks ROSB4 ATA33 chipset, the CMD 648 ATA66 and CMD
649 ATA100 chipsets, and the Cyrix 5530. [MERGED]

To provide more flexible configuration, the various options for the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver are now boot loader tunables, rather than kernel configure-time
options. [MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for tagged queuing, which is enabled by the
``hw.ata.tags`` loader tunable. [MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for ATA \`\`pseudo'' RAID controllers as the
Promise Fasttrak and HighPoint HPT370 controllers. [MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports a wider variety of SiS chipsets, as listed in the
Hardware Notes. [MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for creating, deleting, querying, and rebuilding
ATA RAIDs under control of
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The BurnProof(TM) feature, for applicable ATAPI CD-ROM burners, is now
supported. [MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for 48-bit addressing. Devices larger than 137GB
are now supported. [MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now contains fixes for some data corruption problems on systems
using the VIA 82C686B Southbridge chip. [MERGED]

The CAM error recovery code has been updated.

The
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now has support for write operations. This allows writing to
DVD-RAM, PD and similar drives that probe as CD devices. Note that
change affects only random-access writeable devices, not sequential-only
writeable devices such as CD-R drives, which are supported by
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1&manpath=FreeBSD+5.0-current>`__
(a part of
```sysutils/cdrtools`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
in the Ports Collection. [MERGED]

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

The ida disk driver now has crashdump support. [MERGED]

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver is now proactive about discovering Fibre Channel topology
changes.

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports target mode for Qlogic SCSI cards, including Ultra2
and Ultra3 and dual bus cards.

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+5.0-current>`__
driver now supports the Qlogic 2300 and 2312 Optical Fibre Channel PCI
cards. [MERGED]

`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+5.0-current>`__,
the memory disk device, has had the functionality of
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4&manpath=FreeBSD+5.0-current>`__
incorporated into it.
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+5.0-current>`__
devices can now be configured by
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+5.0-current>`__.
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4&manpath=FreeBSD+5.0-current>`__
has been removed. The Memory Filesystem (MFS) has also been removed.

Some problems in
`sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4&manpath=FreeBSD+5.0-current>`__
error handling have been fixed, including the \`\`tape drive spinning
indefinitely upon
`mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1&manpath=FreeBSD+5.0-current>`__
``stat``'' problem.

The
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.0-current>`__
volume manager has received some bug fixes and enhancements.

The
`wd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wd&sektion=4&manpath=FreeBSD+5.0-current>`__
compatibility devices were removed from the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver. [MERGED]

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

Due to a licensing change, softupdates have been integrated into the
main portion of the kernel source tree. As a consequence, softupdates
are now available with the ``GENERIC`` kernel. [MERGED]

A filesystem snapshot capability has been added to FFS. Details can be
found in ``/usr/src/sys/ufs/ffs/README.snapshot``.

Softupdates for FFS have received some bug fixes and enhancements.

When running with softupdates,
`statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2&manpath=FreeBSD+5.0-current>`__
and
`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.0-current>`__
will track the number of blocks and files that are committed to being
freed.

A bug in FFS that could cause superblock corruption on very large
filesystems has been corrected. [MERGED]

The Inode Filesystem (IFS) has been added; more information can be found
in ``/usr/src/sys/ufs/ifs/README``.

The ISO-9660 filesystem now has a hook that supports a loadable
character conversion routine. The
```sysutils/cd9660_unicode`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/cd9660_unicode/pkg-descr>`__
port contains a set of common conversions. [MERGED]

`kernfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=kernfs&sektion=5&manpath=FreeBSD+5.0-current>`__
is obsolete and has been retired.

A bug in the NFS client that caused bogus access times with
``O_EXCL|O_CREAT`` opens was fixed. [MERGED]

A new NFS hash function (based on the Fowler/Noll/Vo hash algorithm) has
been implemented to improve NFS performance by increasing the efficiency
of the ``nfsnode`` hash tables. [MERGED]

Client-side NFS locks have been implemented.

The client-side and server-side of the NFS code in the kernel used to be
intertwined in various complex ways. They have been split apart for ease
of maintenance and further development.

Support for filesystem Access Control Lists (ACLs) has been introduced,
allowing more fine-grained control of discretionary access control on
files and directories. This support was integrated from the TrustedBSD
Project. More details can be found in
``/usr/src/sys/ufs/ufs/README.acls``.

The directory layout preference algorithm for FFS (``dirprefs``) has
been changed. Rather than scattering directory blocks across a disk, it
attempts to group related directory blocks together. Operations
traversing large directory hierarchies, such as the FreeBSD Ports tree,
have shown marked speedups. This change is transparent and automatic for
new directories. [MERGED]

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

A simple hash-based lookup optimization for large directories called
``dirhash`` has been added. Conditional on the ``UFS_DIRHASH`` kernel
option (enabled by default in the ``GENERIC`` kernel), it improves the
speed of operations on very large directories at the expense of some
memory. [MERGED]

The virtual memory subsystem now backs UFS directory memory requirements
by default (this behavior is controlled via the ``vfs.vmiodirenable``
sysctl variable). [MERGED]

A bug that prevented the root filesystem from being mounted from a SCSI
CDROM has been fixed (ATAPI CDROMs were always supported). [MERGED]

A number of bugs in the filesystem code, discovered through the use of
the **fsx** filesystem test tool, have been fixed. Under certain
circumstances (primarily related to use of NFS), these bugs could cause
data corruption or kernel panics. [MERGED]

Network filesystems (such as NFS and smbfs filesystems) listed in
``/etc/fstab`` can now be properly mounted during startup
initialization; their mounts are deferred until after the network is
initialized.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7 PCCARD Support
~~~~~~~~~~~~~~~~~~~~

On many modern hosts, PCCARD devices can be configured to route their
interrupts via either the ISA or PCI interrupt paths. The
`pcic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcic&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been updated to support both interrupt paths (formerly, only
routing via ISA was supported). [MERGED] In most cases, configuration of
PCMCIA devices in laptops is simpler and more flexible. In addition,
various Cardbus bridge PCI cards (such as those used by Orinoco PCI
NICs) are now supported. Some hosts may experience problems, such as
hangs or panics, with PCI interrupt routing; they can frequently be made
to work by forcing the older-style ISA interrupt routing. The following
lines, placed in ``/boot/loader.conf``, may fix the problem:

.. code:: PROGRAMLISTING

        hw.pcic.intr_path="1"
          hw.pcic.irq="0"

When installing FreeBSD on such a system, typing the following lines to
the boot loader may be helpful in starting up FreeBSD for the first
time:

.. code:: SCREEN

        ok set hw.pcic.intr_path="1"
        ok set hw.pcic.irq="0"

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8 Multimedia Support
~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: PROGRAMLISTING

        snd_maestro3_load="YES"

The
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has been updated to 2.18. This update provides a number of new
features. New tuner types have been added, and improvements to the KLD
module and to memory allocation have been made. Bugs in
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.0-current>`__
when unloading and reloading have been fixed. Support for new Hauppauge
Model 44xxx WinTV Cards (the ones with no audio mux) has been added.
[MERGED]

When sound modules are built, one can now load all the drivers and
infrastructure by ``kldload snd``. [MERGED]

A new API has been added for sound cards with hardware volume control.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

The Forth Inspired Command Language (**FICL**) used in the boot loader
has been updated to 2.05.

Support for Advanced Configuration and Power Interface (ACPI), a
multi-vendor standard for configuration and power management, has been
added. This functionality has been provided by the **Intel ACPI
Component Architecture** project, as of the ACPI CA 20020308 snapshot.
Some backward compatability for applications using the older APM
standard has been provided.

.. raw:: html

   <div class="SECT4">

--------------

2.1.9.1 IPFilter
^^^^^^^^^^^^^^^^

**IPFilter** has been updated to 3.4.25.

**IPFilter** now supports IPv6. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.1.9.3 KAME
^^^^^^^^^^^^

The IPv6 stack is now based on a snapshot based on the KAME Project's
IPv6 snapshot as of 28 May, 2001. Most of the items listed in this
section are a result of this import. `Section
2.3.1.3 <#KAME-USERLAND>`__ lists userland updates to the KAME IPv6
stack. [MERGED]

`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+5.0-current>`__
is now based on RFC 2893, rather than RFC 1933. The ``IFF_LINK2``
interface flag can be used to control ingress filtering. [MERGED]

**IPSec** has received some enhancements, including the ability to use
the Rijndael and SHA2 algorithms. IPSec RC5 support has been removed due
to patent issues. [MERGED]

`stf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stf&sektion=4&manpath=FreeBSD+5.0-current>`__
now conforms to RFC 3056; the ``IFF_LINK2`` interface flag can be used
to control ingress filtering. [MERGED]

IPv6 has better checking of illegal addresses (such as loopback
addresses) on physical networks. [MERGED]

The ``IPV6_V6ONLY`` socket option is now completely supported. The
kernel's default behavior with respect to this option is controlled by
the ``net.inet6.ip6.v6only`` sysctl variable. [MERGED]

RFC 3041 (Privacy Extensions for Stateless Address Autoconfiguration) is
now supported. It can be enabled via the ``net.inet6.ip6.use_tempaddr``
sysctl variable. [MERGED]

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

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
now allows the user to select one of two \`\`security profiles'' at
install-time. These profiles enable different levels of system security
by enabling or disabling various system services in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
on new installs. [MERGED]

A bug in which malformed ELF executable images can hang the system has
been fixed (see security advisory FreeBSD-SA-00:41). [MERGED]

A security hole in Linux emulation was fixed (see security advisory
FreeBSD-SA-00:42). [MERGED]

String-handling library calls in many programs were fixed to reduce the
possibility of buffer overflow-related exploits. [MERGED]

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

The
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.0-current>`__
binary is no longer SUID root by default. [MERGED]

Some fixes were applied to the Kerberos IV implementation related to
environment variables, a possible buffer overrun, and overwriting ticket
files. [MERGED]

`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1&manpath=FreeBSD+5.0-current>`__
now does a better job of sanitizing its environment. [MERGED]

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

A number of programs have had output formatting strings corrected so as
to reduce the risk of vulnerabilities. [MERGED]

A number of programs that use temporary files now do so more securely.
[MERGED]

A bug in ICMP that could cause an attacker to disrupt TCP and UDP
\`\`sessions'' has been corrected. [MERGED]

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

**OpenSSH** now switches to the user's UID before attempting to unlink
the authentication forwarding file, nullifying the effects of a race.

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

All services in ``inetd.conf`` are now disabled by default for new
installations.
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
gives the option of enabling or disabling
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
on new installations, as well as editing ``inetd.conf``. [MERGED]

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

A security hole in the form of a buffer overflow in the
`semop(2) <http://www.FreeBSD.org/cgi/man.cgi?query=semop&sektion=2&manpath=FreeBSD+5.0-current>`__
system call has been closed. [MERGED]

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
`FreeBSD-SA-02:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:18.zlib.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
--------------------

If the first argument to
`ancontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ancontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
or
`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
doesn't start with a ``-``, it is assumed to be an interface.

`apmd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=apmd&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to monitor battery levels and execute commands based
on percentage or minutes of battery life remaining via the
``apm_battery`` configuration directive. See the commented-out examples
in ``/etc/apmd.conf`` for the syntax. [MERGED]

`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+5.0-current>`__
now prints the applicable interface name for each ARP entry. [MERGED]

`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+5.0-current>`__
now prints ``[fddi]`` or ``[atm]`` tags for addresses on interfaces of
those types.

`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+5.0-current>`__
has been added to control various aspects of the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.0-current>`__
driver. [MERGED]

The system
`awk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=awk&sektion=1&manpath=FreeBSD+5.0-current>`__
refers to **BWK awk** on the sparc64 platform. It remains **GNU awk** on
other platforms.

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-m`` option for multisession mode (the default behavior
now is to close disks as single-session). A ``-l`` option to take a list
of image files from a filename was also added; ``-`` can be used as a
filename for ``stdin``. [MERGED]

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports Disk At Once (DAO) mode, selectable via the ``-d`` flag.

`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to write VCDs/SVCDs.

`c89(1) <http://www.FreeBSD.org/cgi/man.cgi?query=c89&sektion=1&manpath=FreeBSD+5.0-current>`__
has been converted from a shell script to a binary executable, fixing
some minor bugs. [MERGED]

`cat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cat&sektion=1&manpath=FreeBSD+5.0-current>`__
now has the ability to read from UNIX-domain sockets. [MERGED]

`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``cdid`` command, which calculates and displays the CD
serial number, using the same algorithm used by the CDDB database.
[MERGED]

`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses the ``CDROM`` environment variable to pick a default device.
[MERGED]

`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports ``next`` and ``prev`` commands to skip forwards or
backwards a specified number of tracks while playing an audio CD.
[MERGED]

`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1&manpath=FreeBSD+5.0-current>`__
has moved from ``/usr/bin`` to ``/bin``.

`chio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chio&sektion=1&manpath=FreeBSD+5.0-current>`__
now has the ability to specify elements by volume tag instead of by
their physical location as well as the ability to return an element to
its previous location. [MERGED]

`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-h`` for changing the mode of a symbolic link.

`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8&manpath=FreeBSD+5.0-current>`__
now correctly follows symbolic links named as command line arguments if
run without ``-R``. [MERGED]

`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer takes ``.`` as a user/group delimeter. This change was made to
support usernames containing a ``.``.

Use of the ``CSMG_*`` macros no longer require inclusion of
``<sys/param.h>``

`col(1) <http://www.FreeBSD.org/cgi/man.cgi?query=col&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-p`` flag to force unknown control sequences to be passed
through unchanged. [MERGED]

The ``compat3x`` distribution has been updated to include libraries
present in FreeBSD 3.5.1-RELEASE. [MERGED]

A ``compat4x`` distribution has been added for compatibility with
FreeBSD 4-STABLE.

`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__
is now better about converting various warnings that should have been
errors into actual fatal errors with an exit code. This ensures that
``make buildkernel`` doesn't quietly ignore them and build a bogus
kernel without a human to read the errors. [MERGED]

A number of buffer overflows in
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.0-current>`__
have been fixed. [MERGED]

`ctags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ctags&sektion=1&manpath=FreeBSD+5.0-current>`__
no longer creates a corrupt tags file if the source file used ``//``
(C++-style) comments. [MERGED]

The
`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+5.0-current>`__
program, a command-line interface to
`daemon(3) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=3&manpath=FreeBSD+5.0-current>`__,
has been added. It detaches itself from its controlling terminal and
executes a program specified on the command line. This allows the user
to run an arbitrary program as if it were written to be a daemon.

devinfo, a simple tool to print the device tree and resource usage by
devices, has been added.

`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-l`` option to only display information about
locally-mounted filesystems. [MERGED]

`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports partition sizes expressed in kilobytes, megabytes, or
gigabytes, in addition to sectors. [MERGED]

`diskpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=diskpart&sektion=8&manpath=FreeBSD+5.0-current>`__
has been declared obsolete, and has been removed.

`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8&manpath=FreeBSD+5.0-current>`__
now has a ``-a`` option to show the entire message buffer, including
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.0-current>`__
records and ``/dev/console`` output. [MERGED]

`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-I`` command-line flag to ignore/skip files and
subdirectories matching a specified shell-glob mask. [MERGED]

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports inheritance of the ``nodump`` flag down a hierarchy.
[MERGED]

The ``-T`` option to
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer swallows an extra argument. [MERGED]

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
has a new ``-D`` option, allowing the path to the ``/etc/dumpdates``
file to be changed. [MERGED]

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
now supplies progress information in its process title, useful for
monitoring automated backups. [MERGED]

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a new ``-S`` to allow it to just print out the dump size
estimates and exit.

`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8&manpath=FreeBSD+5.0-current>`__
now takes a ``-f`` option to allow limiting the prototype quota
distribution (specified with ``-p``) to a single filesystem. [MERGED]

``/etc/rc.firewall`` and ``/etc/rc.firewall6`` will no longer add their
own hardcoded rules in the cases of a rules file in the
``firewall_type`` variable or a non-existent firewall type. (The
motivation for this change is to avoid acting on assumptions about a
site's firewall policies.) In addition, the ``closed`` firewall type now
works as documented in the
`rc.firewall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.firewall&sektion=8&manpath=FreeBSD+5.0-current>`__
manual page. [MERGED]

The functionality of ``/etc/security`` has been been moved into a set of
scripts under the
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+5.0-current>`__
framework, to make local customization easier and more maintainable.
These scripts now reside in ``/etc/periodic/security/``. [MERGED]

`fbtab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fbtab&sektion=5&manpath=FreeBSD+5.0-current>`__
now accepts glob matching patterns for target devices, not just
individual devices and directories.

`fdread(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdread&sektion=1&manpath=FreeBSD+5.0-current>`__,
a program to read data from floppy disks, has been added. It is a
counterpart to
`fdwrite(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdwrite&sektion=1&manpath=FreeBSD+5.0-current>`__
and is designed to provide a means of recovering at least some data from
bad media, and to obviate for a complex invocation of
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1&manpath=FreeBSD+5.0-current>`__.

`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes the ``-empty`` flag, which returns true if a file or directory
is empty. [MERGED]

`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes the ``-iname`` and ``-ipath`` primaries for case-insensitive
matches, and the ``-regexp`` and ``-iregexp`` primaries for
regular-expression matches. The ``-E`` flag now enables extended regular
expressions. [MERGED]

`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+5.0-current>`__
now has the ``-anewer``, ``-cnewer``, ``-mnewer``, ``-okdir``, and
``-newer[acm][acmt]`` primaries for comparisons of file timestamps. The
latter primaries can be specified with various units of time. [MERGED]

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
now has the ability to support fingering aliases, via the
`finger.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=finger.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
file. [MERGED]

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+5.0-current>`__
now has support for a ``.pubkey`` file.

`fmt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fmt&sektion=1&manpath=FreeBSD+5.0-current>`__
has been rewritten; the rewrite fixes a number of bugs compared to its
prior behavior. [MERGED]

`fmtcheck(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fmtcheck&sektion=3&manpath=FreeBSD+5.0-current>`__,
a function for checking consistency of format string arguments, has been
added. [MERGED]

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

Shortly after the receipt of a ``SIGINFO`` signal (normally control-T
from the controlling tty),
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.0-current>`__
will now output a line indicating the current phase number and progress
information relevant to the current phase. [MERGED]

`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports background filesystem checks to mounted FFS filesystems
with the ``-B`` option (softupdates must be enabled on these
filesystems). The ``-F`` flag now determines whether a specified
filesystem needs foreground checking.

A new
`fsck\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_msdosfs&sektion=8&manpath=FreeBSD+5.0-current>`__
utility has been added to check the consistency of MS-DOS filesystems.
[MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-r`` flag for read-only mode and a ``-E`` flag to
disable ``EPSV``. It also has some fixes to reduce information leakage
and the ability to specify compile-time port ranges. [MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports ``-o`` and ``-O`` options to disable the ``RETR`` command;
the former for everybody, and the latter only for guest users. Coupled
with ``-A`` and appropriate file permissions, these can be used to
create a relatively safe anonymous FTP drop box for others to upload to.

The
`getprogname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprogname&sektion=3&manpath=FreeBSD+5.0-current>`__
and
`setprogname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setprogname&sektion=3&manpath=FreeBSD+5.0-current>`__
library functions have been added to manipulate the name of the current
program. They are used by error-reporting routines to produce consistent
output. [MERGED]

`gprof(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gprof&sektion=1&manpath=FreeBSD+5.0-current>`__
now has a ``-K`` option to enable dynamic symbol resolution from the
currently-running kernel. With this change, properly-compiled KLD
modules are now able to be profiled.

`growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8&manpath=FreeBSD+5.0-current>`__,
a utility for growing FFS filesystems, has been added.
`ffsinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ffsinfo&sektion=8&manpath=FreeBSD+5.0-current>`__,
a utility for dump all the meta-information of an existing filesystem,
has also been added. [MERGED]

The
`groups(1) <http://www.FreeBSD.org/cgi/man.cgi?query=groups&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`whoami(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whoami&sektion=1&manpath=FreeBSD+5.0-current>`__
shell scripts are now unnecessary; their functionality has been
completely folded into
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The
`ibcs2(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ibcs2&sektion=8&manpath=FreeBSD+5.0-current>`__,
`linux(8) <http://www.FreeBSD.org/cgi/man.cgi?query=linux&sektion=8&manpath=FreeBSD+5.0-current>`__,
`osf1(8) <http://www.FreeBSD.org/cgi/man.cgi?query=osf1&sektion=8&manpath=FreeBSD+5.0-current>`__,
and
`svr4(8) <http://www.FreeBSD.org/cgi/man.cgi?query=svr4&sektion=8&manpath=FreeBSD+5.0-current>`__
scripts, whose sole purpose was to load emulation kernel modules, have
been removed. The kernel module system will automatically load them as
needed to fulfill dependencies.

`indent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=indent&sektion=1&manpath=FreeBSD+5.0-current>`__
has gained some new formatting options. [MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
can set the link-layer address of an interface using the ``link``
parameter. [MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
can now accept addresses in slash/CIDR notation. [MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
now has support for setting parameters for IEEE 802.11 wireless network
devices.
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.0-current>`__
and
`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+5.0-current>`__
devices are supported, and partial support is provided for
`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+5.0-current>`__
devices. [MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer displays the list of supported media by default. Instead it
displays it when the ``-m`` flag is given. [MERGED]

The syntax of
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__'s
support for
`faithd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=faithd&sektion=8&manpath=FreeBSD+5.0-current>`__
is now compatible with that of other BSDs. [MERGED]

The ``ident`` protocol support in
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
has been cleaned up and updated. [MERGED]

`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to manage UNIX-domain sockets. [MERGED]

`install(1) <http://www.FreeBSD.org/cgi/man.cgi?query=install&sektion=1&manpath=FreeBSD+5.0-current>`__
has a number of new features, including the ``-b`` and ``-B`` options
for backing up existing target files and the ``-S`` option for
\`\`safe'' (atomic copy) operation. The ``-c`` (copy) flag is now the
default, and the ``-D`` (debugging) flag has been withdrawn.
`install(1) <http://www.FreeBSD.org/cgi/man.cgi?query=install&sektion=1&manpath=FreeBSD+5.0-current>`__
now issues a warning if ``-d`` (create directories) and ``-C`` (copy
changed files only) are used together. [MERGED]

IP Filter is now supported by the
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
boot-time configuration and initialization. [MERGED]

`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports the ``-t`` option to turn on a
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.0-current>`__-like
display. [MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
will now avoid the display of dynamic firewall rules unless the ``-d``
flag is passed to it. The ``-e`` option lists expired dynamic rules.
[MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
has a new feature (``me``) that allows for packet matching on interfaces
with dynamically-changing IP addresses. [MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
has a new ``limit`` type of firewall rule, which limits the number of
sessions between address pairs. [MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
filter rules can now match on the value of the IPv4 precedence field.

`ip6fw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6fw&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to use a preprocessor and use the ``-q`` (quiet)
flag when reading from a file. [MERGED]

`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1&manpath=FreeBSD+5.0-current>`__,
a command to dump the kernel environment, has been added. [MERGED]

`keyinfo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=keyinfo&sektion=1&manpath=FreeBSD+5.0-current>`__
is now a C program, rather than a Perl script. [MERGED]

`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+5.0-current>`__
is now a C program, rather than a Perl script. As a result, its ``-m``
option now uses the regular expression syntax of
`regex(3) <http://www.FreeBSD.org/cgi/man.cgi?query=regex&sektion=3&manpath=FreeBSD+5.0-current>`__,
rather than that of
`perl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=perl&sektion=1&manpath=FreeBSD+5.0-current>`__.
[MERGED]

`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+5.0-current>`__
now allows non-root users to kill SUID root processes that they started,
the same as the Perl version did. [MERGED]

The
`kldconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
utility has been added to make it easier to manipulate the kernel module
search path. [MERGED]

ktrdump, a utility to dump the ktr trace buffer from userland, has been
added.

`last(1) <http://www.FreeBSD.org/cgi/man.cgi?query=last&sektion=1&manpath=FreeBSD+5.0-current>`__
now implements a ``-d`` that provides a \`\`snapshot'' of who was logged
in at a particular date and time. [MERGED]

`last(1) <http://www.FreeBSD.org/cgi/man.cgi?query=last&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-y`` flag, which causes the year to be included in the
session start time.

The
`lastlogin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lastlogin&sektion=8&manpath=FreeBSD+5.0-current>`__
utility, which prints the last login time of each user, has been
imported from NetBSD. [MERGED]

`ldconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ldconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
now checks directory ownerships and permissions for greater security;
these checks can be disabled with the ``-i`` flag. [MERGED]

`ldd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ldd&sektion=1&manpath=FreeBSD+5.0-current>`__
can now be used on shared libraries, in addition to executables.
[MERGED]

`ldd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ldd&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-a`` flag to list all the objects that are needed by
each loaded object.

``libc`` is now thread-safe by default; ``libc_r`` contains only thread
functions.

``libcrypt`` and ``libdescrypt`` have been unified to provide a
configurable password authentication hash library. Both the md5 and des
hash methods are provided unless the des hash is specifically compiled
out. [MERGED]

``libcrypt`` now has support for Blowfish password hashing. [MERGED]

``libstand`` now has support for filesystems containing
**bzip2**-compressed files. [MERGED]

``libstand`` now has support for overwriting the contents of a file on a
UFS filesystem (it cannot expand or truncate files because the
filesystem may be dirty or inconsistent).

``libstand`` now has support for loading large kernels and modules split
across several physical media.

The default TCP port range used by ``libfetch`` for passive FTP
retrievals has changed; this affects the behavior of
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+5.0-current>`__,
which has gained the ``-U`` option to restore the old behavior. [MERGED]

``libfetch`` now has support for an authentication callback. [MERGED]

``libfetch`` now has support for a ``HTTP_USER_AGENT`` environment
variable. [MERGED]

``libgmp`` has been superceded by ``libmp``.

The functions from ``libposix1e`` have been integrated into ``libc``.

``libusb`` has been renamed as ``libusbhid``, following NetBSD's naming
conventions. [MERGED]

`ln(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ln&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes an ``-i`` option to request user confirmation before
overwriting an existing file. [MERGED]

`ln(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ln&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-h`` flag to avoid following a target that is a link, with
a ``-n`` flag for compatibility with other implementations. [MERGED]

`logger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logger&sektion=1&manpath=FreeBSD+5.0-current>`__
can now send messages directly to a remote syslog. [MERGED]

`login(1) <http://www.FreeBSD.org/cgi/man.cgi?query=login&sektion=1&manpath=FreeBSD+5.0-current>`__
now exports environment variables set by **PAM** modules. [MERGED]

`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8&manpath=FreeBSD+5.0-current>`__
has been improved; ``lpc clean`` is now somewhat safer, and a new
``lpc           tclean`` command has been added to check to see what
files would be removed by ``lpc           clean``. [MERGED]

`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now takes two new options: ``-c`` will log all connection errors to
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.0-current>`__,
while ``-W`` will allow connections from non-reserved ports. [MERGED]

`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now has some support for ``o``-type print-file actions in its control
files, which allows printing of PostScript files generated by **MacOS**
10.1. [MERGED]

`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1&manpath=FreeBSD+5.0-current>`__,
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1&manpath=FreeBSD+5.0-current>`__,
and
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+5.0-current>`__
have received a few minor enhancements. [MERGED]

Catching up with most other network utilities in the base system,
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1&manpath=FreeBSD+5.0-current>`__,
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+5.0-current>`__,
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.0-current>`__,
and
`logger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logger&sektion=1&manpath=FreeBSD+5.0-current>`__
are now all IPv6-capable. [MERGED]

``lprm -`` now works for remote printer queues. [MERGED]

`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+5.0-current>`__
can produce colorized listings with the ``-G`` flag (and appropriate
terminal support). The ``CLICOLOR`` environment variable can be set to
enable colorized listings by default. [MERGED]

`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-E`` flag to avoid sending messages with empty bodies.
[MERGED]

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.0-current>`__
has gained the ``:C///`` (regular expression substitution), ``:L``
(lowercase), and ``:U`` (uppercase) variable modifiers. These were added
to reduce the differences between the FreeBSD and OpenBSD/NetBSD
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.0-current>`__
programs. [MERGED]

Bugs in
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.0-current>`__,
among which include broken null suffix behavior, bad assumptions about
current directory permissions, and potential buffer overflows, have been
fixed. [MERGED]

The new ``CPUTYPE`` ``make.conf`` variable controls the compilation of
processor-specific optimizations in various pieces of code such as
**OpenSSL**. [MERGED]

The FreeBSD ``Makefile`` infrastructure now supports the ``WARNS``
directive from NetBSD. This directive controls the addition of compiler
warning flags to ``CFLAGS`` in a relatively compiler-neutral manner.
[MERGED]

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

`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+5.0-current>`__
now sources an ``/etc/mergemaster.rc`` file and also prompts the user to
run recommended commands (such as ``newaliases``) as needed. [MERGED]

`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+5.0-current>`__
now takes a ``-a`` option to control mouse acceleration. [MERGED]

`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8&manpath=FreeBSD+5.0-current>`__
now includes support for a file that lists pathnames to be excluded when
creating and verifying prototypes. This makes it easier to use
`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8&manpath=FreeBSD+5.0-current>`__
as a part of an intrusion-detection system. [MERGED]

`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-log_ipfw_denied`` option to log packets that cannot be
re-injected because they are blocked by
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.0-current>`__
rules. [MERGED]

The \`\`in use'' percentage metric displayed by
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.0-current>`__
now really reflects the percentage of network mbufs used. [MERGED]

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.0-current>`__
now has a ``-W`` flag that tells it not to truncate addresses, even if
they're too long for the column they're printed in. [MERGED]

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.0-current>`__
now keeps track of input and output packets on a per-address basis for
each interface. [MERGED]

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.0-current>`__
now has a ``-z`` flag to reset statistics. [MERGED]

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.0-current>`__
now has a ``-S`` flag to print address numerically but port names
symbolically. [MERGED]

`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
now implements write combining, which can make creation of new
filesystems up to seven times faster. [MERGED]

`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
now takes a ``-U`` option to enable softupdates on a new filesystem.
[MERGED]

The default number of cylinders per group in
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
is now computed to be the maximum allowable given the current filesystem
parameters. It can be overridden with the ``-c`` option. Formerly, the
default was fixed at 16. This change leads to better
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.0-current>`__
performance and reduced fragmentation. [MERGED]

The default block and fragment sizes for new filesystems created by
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
are now 16384 and 2048 bytes, respectively (the old defaults were 8192
and 1024 bytes). This change generally provides increased performance,
at the expense of some wasted disk space. [MERGED]

A number of archaic features of
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.0-current>`__
have been removed; these implement tuning features that are essentially
useless on modern hard disks. These features were controlled by the
``-O``, ``-d``, ``-k``, ``-l``, ``-n``, ``-p``, ``-r``, ``-t``, and
``-x`` flags.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to compress log files using
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__.
[MERGED]

**NFS** now works over IPv6.

`ngctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ngctl&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``write`` command to send a data packet down a given
hook. [MERGED]

`nl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nl&sektion=1&manpath=FreeBSD+5.0-current>`__,
a line numbering filter program, has been added. [MERGED]

**nsswitch** support has been merged from NetBSD. By creating an
`nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
file, FreeBSD can be configured so that various databases such as
`passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+5.0-current>`__
and
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5&manpath=FreeBSD+5.0-current>`__
can be looked up using flat files, NIS, or Hesiod. The old
``hosts.conf`` file is no longer used.

**PAM** support has been added for account management and sessions.

**PAM** configuration is now specified by files in ``/etc/pam.d/``,
rather than a single ``/etc/pam.conf`` file. ``/etc/pam.d/README`` has
more details.

A number of new **PAM** modules have been added.

`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+5.0-current>`__
now select the password hash algorithm at run time. See the
``passwd_format`` attribute in ``/etc/login.conf``. [MERGED]

`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1&manpath=FreeBSD+5.0-current>`__
has received a number of enhancements, including
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+5.0-current>`__
functionality,
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.0-current>`__
compatibility enhancements, ``-z`` and ``-Z`` flags for
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`compress(1) <http://www.FreeBSD.org/cgi/man.cgi?query=compress&sektion=1&manpath=FreeBSD+5.0-current>`__
functionality, and a number of bug fixes.

`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-v`` option to display the vendor/device information of
configured devices, in conjunction with the ``-l`` option. The default
vendor/device database can be found at ``/usr/share/misc/pci_vendors``.
[MERGED]

The behavior of
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+5.0-current>`__
is now controlled by ``/etc/defaults/periodic.conf`` and
``/etc/periodic.conf``. [MERGED]

`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-m`` option to set the TTL of outgoing packets.
[MERGED]

`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-A`` option to beep when packets are lost. [MERGED]

Userland
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.0-current>`__
has received a number of updates and bug fixes. [MERGED]

`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.0-current>`__
has gained the ``tcpmssfixup`` option, which adjusts outgoing and
incoming TCP SYN packets so that the maximum receive segment size is no
larger than allowed by the interface MTU. [MERGED]

`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports IPv6.

`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+5.0-current>`__
(the control program for kernel-level PPP) is now installed mode
``4550`` and ``root``\ ``:``\ ``dialer``, rather than mode ``4555`` (in
other words, it is no longer world-executable). Users of
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+5.0-current>`__
may need to change their group settings. [MERGED]

The ``-W`` option to
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.0-current>`__
(to extract information from a specified swap device) has been useless
for some time; it has been removed. [MERGED]

`pwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pwd&sektion=1&manpath=FreeBSD+5.0-current>`__
can now double as
`realpath(1) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=1&manpath=FreeBSD+5.0-current>`__,
a program to resolve pathnames to their underlying physical paths.
[MERGED]

The pseudo-random number generator implemented by
`rand(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rand&sektion=3&manpath=FreeBSD+5.0-current>`__
has been improved to provide less biased results.

`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.0-current>`__
now has an framework for handling dependencies between
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.0-current>`__
variables. [MERGED]

`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.0-current>`__
now deletes all non-directory files in ``/var/run`` and
``/var/spool/lock`` at boot time. [MERGED]

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
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+5.0-current>`__
in FreeBSD now implements EDNS0 support, which will be necessary when
working with IPv6 transport-ready resolvers/DNS servers. [MERGED]

The
`rfork\_thread(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rfork_thread&sektion=3&manpath=FreeBSD+5.0-current>`__
library call has been added as a helper function to
`rfork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=rfork&sektion=2&manpath=FreeBSD+5.0-current>`__.
Using this function should avoid the need to implement complex stack
swap code. [MERGED]

The ``-v`` option to
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1&manpath=FreeBSD+5.0-current>`__
now displays the entire pathname of a file being removed.

`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+5.0-current>`__
is now more verbose when changing indirect routes, in the case of a
gateway route that is the same route as the one being modified. [MERGED]

`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+5.0-current>`__
now uses ``host``/``bits`` syntax instead of ``net``/``bits`` syntax,
for compatibility with
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.0-current>`__.
[MERGED]

`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+5.0-current>`__
can now create \`\`proxy only'' published ARP entries. [MERGED]

The
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+5.0-current>`__
``add`` command now supports the ``-ifp`` and ``-ifa`` modifiers.
[MERGED]

`rpcbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcbind&sektion=8&manpath=FreeBSD+5.0-current>`__
has replaced
`portmap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portmap&sektion=8&manpath=FreeBSD+5.0-current>`__.

`rpcgen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcgen&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses ``/usr/bin/cpp`` (as on NetBSD), not ``/usr/libexec/cpp``.

`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+5.0-current>`__
has been imported from NetBSD. This daemon provides support for
servicing client NFS locks.

The performance of the ELF dynamic linker
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+5.0-current>`__
has been improved. [MERGED]

RSA Security has waived all patent rights to the **RSA** algorithm. As a
result, the native **OpenSSL** implementation of the RSA algorithm is
now activated by default, and the
```security/rsaref`` <http://www.FreeBSD.org/cgi/url.cgi?ports/security/rsaref/pkg-descr>`__
port and the ``librsaUSA`` and ``librsaINTL`` libraries are no longer
required for USA and non-USA residents respectively. [MERGED]

`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+5.0-current>`__
will now print the names of all objects that cause each object to be
loaded, if the ``LD_TRACE_LOADED_OBJECTS_ALL`` environment variable is
defined.

`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-k`` option to prevent clearing a crash dump after
saving it. It also attempts to avoid writing large stretches of zeros to
crash dump files to save space and time. [MERGED]

`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8&manpath=FreeBSD+5.0-current>`__
now works correctly on machines with 2 GB or more of RAM. [MERGED]

`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-E`` option for extended regular expression support.
[MERGED]

`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-a`` option to include a file into the ``Fix:`` section of
a problem report. [MERGED]

The
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1&manpath=FreeBSD+5.0-current>`__
commands have been added to manage filesystem Access Control Lists.

`setproctitle(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setproctitle&sektion=3&manpath=FreeBSD+5.0-current>`__
has been moved from ``libutil`` to ``libc``. [MERGED]

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
now implements ``test`` as a built-in command for improved efficiency.
[MERGED]

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.0-current>`__
no longer implements ``printf`` as a built-in command because it was
considered less valuable compared to the other built-in commands (this
functionality is, of course, still available through the
`printf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=1&manpath=FreeBSD+5.0-current>`__
executable).

`sockstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sockstat&sektion=1&manpath=FreeBSD+5.0-current>`__
now has ``-c`` and ``-l`` flags for listing connected and listening
sockets, respectively. [MERGED]

`split(1) <http://www.FreeBSD.org/cgi/man.cgi?query=split&sektion=1&manpath=FreeBSD+5.0-current>`__
now has the ability to split a file longer than 2GB. [MERGED]

In preparation for meeting SUSv2/POSIX ``<sys/select.h>`` requirements,
``struct selinfo`` and related functions have been moved to
``<sys/selinfo.h>``.

The
`strnstr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strnstr&sektion=3&manpath=FreeBSD+5.0-current>`__
and
`strcasestr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strcasestr&sektion=3&manpath=FreeBSD+5.0-current>`__
variants of
`strstr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strstr&sektion=3&manpath=FreeBSD+5.0-current>`__
have been implemented. [MERGED]

`stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1&manpath=FreeBSD+5.0-current>`__
now has support for an ``erase2`` control character, so that, for
example, both the **Delete** and **Backspace** keys can be used to erase
characters. [MERGED]

`style.perl(7) <http://www.FreeBSD.org/cgi/man.cgi?query=style.perl&sektion=7&manpath=FreeBSD+5.0-current>`__,
a style guide for Perl code in the FreeBSD base system, has been added.
[MERGED]

`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses **PAM** for authentication.

Boot-time
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+5.0-current>`__
configuration was moved to a machine-independent ``/etc/rc.syscons``.
[MERGED]

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-N`` option to print out variable names only. [MERGED]

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+5.0-current>`__
has replaced the ``-A`` and ``-X`` options with ``-ao`` and ``-ax``
respectively; the former options are now deprecated. The ``-w`` option
is deprecated as well; it is not needed to determine the user's
intentions. [MERGED]

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-e`` option to separate variable names and values by
``=`` rather than ``:``. This feature is useful for producing output
that can be fed back to
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
now properly preserves ``/etc/mail`` during a binary upgrade. [MERGED]

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
now uses some more intuitive defaults thanks to some new dialog support
functions. [MERGED]

The default root partition in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
is now 100MB on the i386 and 120MB on the Alpha.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
now lives in ``/usr/sbin``, which simplifies the installation process.
The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
manpage is also installed in a more consistent fashion now.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to load KLDs as a part of the installation. [MERGED]

When run from the installation media,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
will automatically load any device drivers found in the
``/stand/modules`` directory of the ``mfsroot`` floppy or filesystem
image. Note that any drivers so loaded will not appear in the kernel's
boot messages; the
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
debugging screen will provide additional information. [MERGED]

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
now enables Soft Updates by default on all filesystems it creates,
except for the root filesystem. [MERGED]

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
has received updates for its \`\`auto'' partitioning mode which provide
more reasonable defaults for the sizes of partitions that are created;
auto-sized partitions can now also recover the space that becomes
available when other partitions are deleted. [MERGED]

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.0-current>`__
can take a ``-n`` option to disable DNS queries for every request.
[MERGED]

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``LOG_CONSOLE`` facility (disabled by default), which can
be used to log ``/dev/console`` output. [MERGED]

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.0-current>`__
now has the ability to bind to a specific address (as opposed to using
every available one) via the ``-b`` option. [MERGED]

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.0-current>`__
now accepts a ``-c`` flag to disable repeated line compression. [MERGED]

`tail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tail&sektion=1&manpath=FreeBSD+5.0-current>`__
now has the ability to work on files longer than 2GB. [MERGED]

`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports the ``TAR_RSH`` variable, principally to enable the use of
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.0-current>`__
as a transport. [MERGED]

`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1&manpath=FreeBSD+5.0-current>`__
now does autologin and encryption by default; a new ``-y`` option turns
off encryption.

`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-u`` flag to allow connections to UNIX-domain
(``AF_UNIX``) sockets. [MERGED]

`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now takes the ``-c`` and ``-C`` options, which allow the server to
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.0-current>`__
based on the IP address of the connecting client.
`tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
can now transfer files larger than 65535 blocks. [MERGED]

`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports RFC 2349 (TFTP Timeout Interval and Transfer Size Options);
this feature is required by some firmware like EFI boot managers (at
least on HP i2000 Itanium servers) in order to boot an image using
**TFTP**.

A version of Transport Independent RPC (**TI-RPC**) has been imported.

`tmpnam(3) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpnam&sektion=3&manpath=FreeBSD+5.0-current>`__
will now use the ``TMPDIR`` environment variable, if set, to specify the
location of temporary files. [MERGED]

`tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1&manpath=FreeBSD+5.0-current>`__
has been updated from **OpenBSD**, and has the ability to act as a
`cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1&manpath=FreeBSD+5.0-current>`__
substitute.

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.0-current>`__
will now use the full width of its tty.

`touch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=touch&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-h`` option to operate on a symbolic link, rather than
what the link points to.

The
`truncate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truncate&sektion=1&manpath=FreeBSD+5.0-current>`__
utility, which truncates or extends the length of files, has been added.
[MERGED]

Ukrainian language support has been added to the FreeBSD console.
[MERGED]

**UUCP** has been removed from the base system. It can be found in the
Ports Collection, in
```net/freebsd-uucp`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/freebsd-uucp/pkg-descr>`__.

`units(1) <http://www.FreeBSD.org/cgi/man.cgi?query=units&sektion=1&manpath=FreeBSD+5.0-current>`__
has received some updates and bugfixes. [MERGED]

`usbdevs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdevs&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a ``-d`` flag to show the device driver associated with
each device.

The
`usbhidctl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=usbhidctl&sektion=1&manpath=FreeBSD+5.0-current>`__
utility has been added to manipulate USB Human Interface Devices.
[MERGED]

`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+5.0-current>`__
now accepts a ``-o`` option to set its output file.

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now accepts a ``-g`` parameter to select custom text geometry in the
``VESA_800x600`` raster text mode. [MERGED]

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now allows the user to omit the font size specification when loading a
font, and has some better error-handling. [MERGED]

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-p`` option to take a snapshot of a
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+5.0-current>`__
video buffer. These snapshots can be manipulated by the
```graphics/scr2png`` <http://www.FreeBSD.org/cgi/url.cgi?ports/graphics/scr2png/pkg-descr>`__
utility in the Ports Collection. [MERGED]

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-C`` option to clear the history buffer for a given
tty, as well as a ``-h`` option to set the size of the history buffer.
[MERGED]

The default stripe size in
`vinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=8&manpath=FreeBSD+5.0-current>`__
has been changed from 256KB to 279KB, to spread out superblocks more
evenly between stripes.

`wall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=wall&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-g`` flag to write a message to all users of a given
group. [MERGED]

`watch(8) <http://www.FreeBSD.org/cgi/man.cgi?query=watch&sektion=8&manpath=FreeBSD+5.0-current>`__
now takes a ``-f`` option to specify a
`snp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snp&sektion=4&manpath=FreeBSD+5.0-current>`__
device to use. [MERGED]

`which(1) <http://www.FreeBSD.org/cgi/man.cgi?query=which&sektion=1&manpath=FreeBSD+5.0-current>`__
is now a C program, rather than a Perl script.

`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+5.0-current>`__
now directs queries for IP addresses to ARIN. If a query to ARIN
references APNIC or RIPE, the appropriate server will also be queried,
provided that the ``-Q`` option is not specified. [MERGED]

`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+5.0-current>`__
supports a ``-c`` option to specify a country code to help direct
queries towards a particular whois server. [MERGED]

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-J`` ``replstr`` option that allows the user to tell
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+5.0-current>`__
to insert the data read from standard input at a specific point in the
command line arguments rather than at the end. [MERGED]

The compiler chain now uses the FSF-supplied C/C++ runtime
initialization code. This change brings about better compatibility with
code generated from the various egcs and gcc ports, as well as the stock
public FSF source. [MERGED]

The threads library has gained some signal handling changes, bug fixes,
and performance enhancements (including zero system call thread
switching).
`gdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gdb&sektion=1&manpath=FreeBSD+5.0-current>`__
thread support has been updated to match these changes. [MERGED]

Significant additions have been made to internationalization support;
FreeBSD now has complete locale support for the ``LC_MONETARY``,
``LC_NUMERIC``, and ``LC_MESSAGES`` categories. A number of applications
have been updated to take advantage of this support.

Locale names have been changed to improve compatibility with the names
used by X11R6, as well as a number of other UNIX versions. As an
example, the ``en_US.ISO_8859-1`` locale name has been changed to
``en_US.ISO8859-1``. Entries in ``/etc/locale.alias`` provide backward
compatibility. [MERGED]

``/usr/src/share/examples/BSD_daemon/`` now contains a scalable Beastie
graphic. [MERGED]

As part of an ongoing process, many manual pages were improved, both in
terms of their formatting markup and in their content. [MERGED]

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

**am-utils** has been updated to 6.0.7.

A 10 February 2002 snapshot of **awk** from Bell Labs (variously known
as \`\`BWK awk'' or \`\`The One True AWK'') has been imported. It is
available as ``awk`` on the sparc64 architecture, and ``nawk`` on other
architectures.

**bc** has been updated from 1.04 to 1.06. [MERGED]

The ISC library from the **BIND** distribution is now built as
``libisc``. [MERGED]

**BIND** is now built with the ``NOADDITIONAL`` flag, which causes
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.0-current>`__
to operate in a more consistent fashion for certain common
misconfigurations. [MERGED]

**BIND** has been updated to 8.3.1-REL. [MERGED]

**Binutils** has been updated to 2.12.0.

**bzip2** 1.0.2 has been imported; this brings the
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__
program and the ``libbz2`` library to the base system. [MERGED]

The
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+5.0-current>`__
**Easy Editor** has been updated to 1.4.2. [MERGED]

**file** has been updated to 3.37.

**gcc** has been updated to a snapshot of the 2.95 development branch
from 20 March 2002 (this snapshot includes changes made after the
release of **gcc**\ 2.95.3).

`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1&manpath=FreeBSD+5.0-current>`__
now uses a unified ``libgcc`` rather than a separate one for threaded
and non-threaded programs. ``/usr/lib/libgcc_r.a`` can be removed.
[MERGED]

`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports the environment variable ``GCC_OPTIONS``, which can hold a
set of default options for **GCC**. [MERGED]

**GNATS** has been updated to 3.113. [MERGED]

**GNU awk** has been updated to 3.1.0. It is available as ``gawk`` on
the sparc64 architecture, and as ``awk`` on other architectures.

**gperf** has been updated to 2.7.2.

**groff** and its related utilities have been updated to FSF version
1.17.2. This import brings in a new
`mdoc(7) <http://www.FreeBSD.org/cgi/man.cgi?query=mdoc&sektion=7&manpath=FreeBSD+5.0-current>`__
macro package (sometimes referred to as ``mdocNG``), which removes many
of the limitations of its predecessor. [MERGED]

**Heimdal** has been updated to 0.3f.

The version of **IPFilter** provided with FreeBSD now includes the
`ipfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfs&sektion=8&manpath=FreeBSD+5.0-current>`__
program, which allows state information created for NAT entries and
stateful rules to be saved to disk and restored after a reboot.
Boot-time configuration of these features is supported by
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.0-current>`__.
[MERGED]

The **ISC DHCP** client has been updated to 3.0.1RC8.

**Kerberos IV** has been updated to 1.0.5. [MERGED]

The
`more(1) <http://www.FreeBSD.org/cgi/man.cgi?query=more&sektion=1&manpath=FreeBSD+5.0-current>`__
command has been replaced by
`less(1) <http://www.FreeBSD.org/cgi/man.cgi?query=less&sektion=1&manpath=FreeBSD+5.0-current>`__,
although it can still be run as ``more``. [MERGED] Version 371 of
**less** has been imported.

**libpcap** has been updated to 0.6.2. [MERGED]

**libreadline** has been updated to 4.2.

**libz** has been updated to 1.1.4.

**lint** has been updated to snapshot of NetBSD
`lint(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lint&sektion=1&manpath=FreeBSD+5.0-current>`__
as of 3 March 2002.

**lukemftp** (the FTP client from NetBSD) has replaced the FreeBSD
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+5.0-current>`__
program. Among its new features are more automation methods, better
standards compliance, transfer rate throttling, and a customizable
command-line prompt. Some environment variables and command-line
arguments have changed.

The FTP daemon from NetBSD, otherwise known as **lukemftpd**, has been
imported and is available as
`lukemftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lukemftpd&sektion=8&manpath=FreeBSD+5.0-current>`__.

**ncurses** has been updated to 5.2-20010512.

The **NTP** suite of programs has been updated to 4.1.0. [MERGED]

**OpenPAM** (\`\`Centaury'' release) has been imported, replacing
**Linux-PAM**.

The **OPIE** one-time-password suite has been updated to 2.4. It has
completely replaced the functionality of **S/Key**.

**Perl** has been updated to version 5.6.1.

`routed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=routed&sektion=8&manpath=FreeBSD+5.0-current>`__
has been updated to version 2.22. [MERGED]

`sort(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sort&sektion=1&manpath=FreeBSD+5.0-current>`__
from **NetBSD** (as of 22 March 2002) is now the system sorting program,
replacing **GNU sort**.

**tcpdump** has been updated to 3.6.3. [MERGED]

The
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+5.0-current>`__
shell has been replaced by
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+5.0-current>`__,
although it can still be run as ``csh``. **tcsh** has been updated to
version 6.11. [MERGED]

The contributed version of **tcp\_wrappers** now includes the
`tcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpd&sektion=8&manpath=FreeBSD+5.0-current>`__
helper daemon. While not strictly necessary in a standard FreeBSD
installation (because
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
already incorporates this functionality), this may be useful for
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+5.0-current>`__
replacements such as **xinetd**.

**texinfo** has been updated to 4.1. [MERGED]

**top** has been updated to version 3.5b12.

`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+5.0-current>`__
now takes its default maximum TTL value from the ``net.inet.ip.ttl``
sysctl variable. [MERGED]

The timezone database has been updated to the ``tzdata2002c`` release.
[MERGED]

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.1 CVS
^^^^^^^^^^^

**cvs** has been updated to 1.11.1p1. [MERGED]

The default value for
`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+5.0-current>`__'s
``CVS_RSH`` variable is now ``ssh``, rather than ``rsh``. [MERGED]

`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-T`` option to update a sandbox's ``CVS/Template`` file
from the repository. [MERGED]

`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+5.0-current>`__
``diff`` now supports the ``-j`` option to perform differences against a
revision relative to a branch tag. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.2 CVSup
^^^^^^^^^^^^^

**CVSup**, a frequently used utility in the FreeBSD Ports Collection,
was formerly installable using several ports and packages. The
```net/cvsup-bin`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/cvsup-bin/pkg-descr>`__
and
```net/cvsupd-bin`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/cvsupd-bin/pkg-descr>`__
ports/packages are no longer necessary or available; the
```net/cvsup`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/cvsup/pkg-descr>`__
port should be used instead. [MERGED]

**CVSup** has been updated to 16.1\_3, which is available in the FreeBSD
Ports Collection as
```net/cvsup`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/cvsup/pkg-descr>`__.
This update fixes a long-standing (but only recently encountered) bug
which affects the timestamps on all files after Sun Sep 9 01:46:40 UTC
2001 (1,000,000,000 seconds after the UNIX epoch). [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.3 KAME
^^^^^^^^^^^^

The IPv6 stack is now based on a snapshot based on the KAME Project's
IPv6 snapshot as of 28 May, 2001. Most of the items listed in this
section are a result of this import. `Section 2.1.9.3 <#KAME-KERNEL>`__
lists kernel updates to the KAME IPv6 stack. [MERGED]

`faithd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=faithd&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports a configuration file for access control. [MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
can now perform the functions of
`gifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__.
[MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.0-current>`__
can now perform the functions of
`prefix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=prefix&sektion=8&manpath=FreeBSD+5.0-current>`__.
`prefix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=prefix&sektion=8&manpath=FreeBSD+5.0-current>`__
is now a shell script for partial backwards compatibility. [MERGED]

`ndp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndp&sektion=8&manpath=FreeBSD+5.0-current>`__
now implements garbage collection for stale NDP entries, as described in
RFC 2461 (Neighbor Discovery for IP Version 6 (IPv6)). [MERGED]

`pim6dd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pim6dd&sektion=8&manpath=FreeBSD+5.0-current>`__
and
`pim6sd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pim6sd&sektion=8&manpath=FreeBSD+5.0-current>`__
have been removed due to restrictive licensing conditions. These
programs are available in the ports collection as
```net/pim6dd`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/pim6dd/pkg-descr>`__
and
```net/pim6sd`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/pim6sd/pkg-descr>`__.
[MERGED]

`route6d(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route6d&sektion=8&manpath=FreeBSD+5.0-current>`__
now supports an ``-n`` flag to avoid updating the kernel forwarding
table. [MERGED]

The ``-R`` (router renumbering) option to
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+5.0-current>`__
is currently ignored. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.4 OpenSSH
^^^^^^^^^^^^^^^

**OpenSSH** has been updated to 2.9, which provides support for the SSH2
protocol (now the default) and DSA keys.
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1&manpath=FreeBSD+5.0-current>`__
can now handle DSA keys, with support for authentication forwarding.
**OpenSSH** users in the USA no longer need to rely on the
restrictively-licensed RSAREF toolkit which is required to handle RSA
keys. Among other new features: A client and server for
`sftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sftp&sektion=1&manpath=FreeBSD+5.0-current>`__
has been added.
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1&manpath=FreeBSD+5.0-current>`__
can now handle files larger than 2 GBytes. A limit on the number of
outstanding, unauthenticated connections in
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.0-current>`__
has been added. Support has been added for the Rijndael encryption
algorithm. Rekeying of existing sessions is now supported, and an
experimental **SOCKS4** proxy has been added to
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.0-current>`__.
[MERGED]

**OpenSSH** has been updated to version 3.1. Among the changes:

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

**OpenSSH** can now authenticate using **OPIE** passwords.

**PAM** support for **OpenSSH** has been added.

A long-standing bug in **OpenSSH**, which sometimes resulted in a
dropped session when an X11-forwarded client was closed, was fixed.

**Kerberos** compatibility has been added to **OpenSSH**. [MERGED]

**OpenSSH** has been modified to be more resistant to traffic analysis
by requiring that \`\`non-echoed'' characters are still echoed back in a
null packet, as well as by padding passwords sent so as not to hint at
password lengths. [MERGED]

`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.0-current>`__
is now enabled by default on new installs. [MERGED]

`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.0-current>`__
``X11Forwarding`` is now turned on by default on the server (any risk is
to the client, where it is already disabled by default). [MERGED]

In ``/etc/ssh/sshd_config``, the ``ConnectionsPerPeriod`` parameter has
been deprecated in favor of ``MaxStartups``. [MERGED]

**OpenSSH** now has a ``VersionAddendum`` configuration setting for
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.0-current>`__
to allow changing the part of the **OpenSSH** version string after the
main version number.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.5 OpenSSL
^^^^^^^^^^^^^^^

**OpenSSL** has been updated to 0.9.6c.

**OpenSSL** now has support for machine-dependent ASM optimizations,
activated by the new ``MACHINE_CPU`` and/or ``CPUTYPE`` ``make.conf``
variables. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.6 sendmail
^^^^^^^^^^^^^^^^

**sendmail** has been updated from version 8.9.3 to version 8.12.2.
Important changes include:
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.0-current>`__
is no longer installed as a set-user-ID root binary (now set-group-ID
smmsp); new default file locations (see
``/usr/src/contrib/sendmail/cf/README``);
`newaliases(1) <http://www.FreeBSD.org/cgi/man.cgi?query=newaliases&sektion=1&manpath=FreeBSD+5.0-current>`__
is limited to ``root`` and trusted users; STARTTLS encryption; and the
MSA port (587) is turned on by default. See
``/usr/src/contrib/sendmail/RELEASE_NOTES`` for more information.
[MERGED]

`mail.local(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mail.local&sektion=8&manpath=FreeBSD+5.0-current>`__
is no longer installed as a set-user-ID binary. If you are using a
``/etc/mail/sendmail.cf`` from the default ``sendmail.cf`` included with
FreeBSD any time after 3.1.0, you are fine. If you are using a
hand-configured ``sendmail.cf`` and ``mail.local`` for delivery, check
to make sure the ``F=S`` flag is set on the ``Mlocal`` line. Those with
``.mc`` files who need to add the flag can do so by adding the following
line to their ``.mc`` file and regenerating the ``sendmail.cf`` file:

.. code:: PROGRAMLISTING

        MODIFY_MAILER_FLAGS(`LOCAL',`+S')dnl

Note that ``FEATURE(`local_lmtp')`` already does this. [MERGED]

The default ``/etc/mail/sendmail.cf`` disables the SMTP ``EXPN`` and
``VRFY`` commands. [MERGED]

`vacation(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vacation&sektion=1&manpath=FreeBSD+5.0-current>`__
has been updated to use the version included with **sendmail**. [MERGED]

The **sendmail** configuration building tools are installed in
``/usr/share/sendmail/cf/``. [MERGED]

New ``make.conf`` options: ``SENDMAIL_MC`` and
``SENDMAIL_ADDITIONAL_MC``. See ``/usr/share/examples/etc/make.conf``
for more information. [MERGED]

``/etc/mail/Makefile`` now supports: the new ``SENDMAIL_MC``
``make.conf`` option; the ability to build ``.cf`` files from ``.mc``
files; generalized map rebuilding; rebuilding the aliases file; and the
ability to stop, start, and restart **sendmail**. [MERGED]

The ``smmsp`` and ``mailnull`` users have been added to
``/etc/master.passwd``. In the absence of a ``confDEF_USER_ID`` setting,
by default, **sendmail** will use the ``mailnull`` user for extra
security. Previously, if the ``mailnull`` user did not exist, the
``daemon`` user was used. This change may generate some permissions
issues when mailing to files or to programs (such as
```mail/majordomo`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/majordomo/pkg-descr>`__).
[MERGED] The previous behavior can be restored by adding the following
line to a system's ``*``.mc configuration file:

.. code:: PROGRAMLISTING

        define(`confDEF_USER_ID', `daemon')

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2 Ports/Packages Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**BSDPAN**, a collection of modules that provides tighter integration of
**Perl** into the FreeBSD Ports Collection, has been added.

`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.0-current>`__
can now work with packages that have been compressed using
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__.
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.0-current>`__
will use the PACKAGEROOT environment variable to determine a mirror site
for new packages. [MERGED]

`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.0-current>`__
now records dependencies in dependency order rather than in the order
specified on the command line. This improves the functioning of
``pkg_add -r``. [MERGED]

`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-b`` to create a package file from a locally-installed
package. [MERGED]

When requested to delete multiple packages,
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1&manpath=FreeBSD+5.0-current>`__
will now attempt to remove them in dependency order rather than the
order specified on the command line. [MERGED]

`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1&manpath=FreeBSD+5.0-current>`__
now can perform glob/regexp matching of package names. In addition, it
supports a ``-a`` option for removing all packages and a ``-i`` option
for
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1&manpath=FreeBSD+5.0-current>`__-style
interactive confirmation. [MERGED]

`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports a ``-r`` option for recursive package removal. [MERGED]

`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+5.0-current>`__
now supports globbing against names of installed packages. The ``-G``
option disables this behavior, and the ``-x`` option causes regular
expression matching instead of shell globbing. [MERGED]

`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+5.0-current>`__
can now accept a ``-g`` flag for verifying an installed package against
its recorded checksums (to see if it's been modified post-installation).
Naturally, this mechanism is only as secure as the contents of
``/var/db/pkg`` if it's to be used for auditing purposes. [MERGED]

`pkg\_sign(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_sign&sektion=1&manpath=FreeBSD+5.0-current>`__
and
`pkg\_check(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_check&sektion=1&manpath=FreeBSD+5.0-current>`__
have been added to digitally sign and verify the signatures on binary
package files. [MERGED]

`pkg\_update(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_update&sektion=1&manpath=FreeBSD+5.0-current>`__,
a utility to update installed packages and update their dependencies,
has been added. [MERGED]

`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.0-current>`__
now has a version number comparison routine that corresponds to the
Porters Handbook. It also has a ``-t`` option for testing address
comparisons. [MERGED]

`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.0-current>`__
now takes a ``-s`` flag to limit its operation to ports/packages
matching a given string. [MERGED]

Version numbers of installed packages have a new (backward-compatible)
syntax, which supports the ``PORTREVISION`` and ``PORTEPOCH`` variables
in Ports Collection ``Makefile``\ s. These changes help keep track of
changes in the ports collection entries such as security patches or
FreeBSD-specific updates, which aren't reflected in the original,
third-party software distributions.
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.0-current>`__
can now compare these new-style version numbers. [MERGED]

To improve performance and disk utilization, the \`\`ports skeletons''
in the FreeBSD Ports Collection have been restructured. Installed ports
and packages should not be affected. [MERGED]

All packages and ports now contain an \`\`origin'' directive, which
makes it easier for programs such as
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.0-current>`__
to determine the directory from which a package was built. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
=============================================

If you're upgrading from a previous release of FreeBSD, you generally
will have three options:

-  Using the binary upgrade option of
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__.
   This option is perhaps the quickest, although it presumes that your
   installation of FreeBSD uses no special compilation options.

-  Performing a complete reinstall of FreeBSD. Technically, this is not
   an upgrading method, and in any case is usually less convenient than
   a binary upgrade, in that it requires you to manually backup and
   restore the contents of ``/etc``. However, it may be useful in cases
   where you want (or need) to change the partitioning of your disks.

-  From source code in ``/usr/src``. This route is more flexible, but
   requires more disk space, time, and more technical expertise.
   Upgrading from very old versions of FreeBSD may be problematic; in
   cases like this, it is usually more effective to perform a binary
   upgrade or a complete reinstall.

Please read the ``INSTALL.TXT`` file for more information, preferably
*before* beginning an upgrade. If you are upgrading from source, please
be sure to read ``/usr/src/UPDATING`` as well.

Finally, if you want to use one of various means to track the -STABLE or
-CURRENT branches of FreeBSD, please be sure to consult the
`\`\`-CURRENT vs.
-STABLE'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/current-stable.html>`__
section of the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

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
ftp://ftp.FreeBSD.org/pub/FreeBSD/development/sparc64/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 5-CURRENT should subscribe to the
<current@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
