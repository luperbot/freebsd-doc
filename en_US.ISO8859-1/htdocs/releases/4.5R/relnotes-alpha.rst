=======================================
FreeBSD/alpha 4.5-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.5-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.22.2.191.2.1 2002/01/25 20:58:19 bmah Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 4.5-RELEASE contain a summary of the
changes made in the FreeBSD base system since 4.4-RELEASE. Both changes
for kernel and userland are listed, as well as applicable security
advisories for the base system that were issued since the last release.
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
2 `What's New <#AEN21>`__
2.1 `Kernel Changes <#KERNEL>`__
2.1.1 `Processor/Motherboard Support <#AEN74>`__
2.1.2 `Boot Loaders <#AEN77>`__
2.1.3 `Network Interface Support <#AEN93>`__
2.1.4 `Network Protocols <#AEN189>`__
2.1.5 `Disks and Storage <#AEN222>`__
2.1.6 `Filesystems <#AEN250>`__
2.1.7 `PCCARD Support <#AEN262>`__
2.1.8 `Multimedia Support <#AEN268>`__
2.1.9 `Contributed Software <#AEN274>`__
2.2 `Security-Related Changes <#SECURITY>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 `Contributed Software <#AEN597>`__
2.3.2 `Ports/Packages Collection <#AEN677>`__
3 `Upgrading from previous releases of FreeBSD <#AEN698>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This document contains the release notes for FreeBSD 4.5-RELEASE on the
Alpha/AXP hardware platform. It describes new features of FreeBSD that
have been added (or changed) since 4.4-RELEASE. It also provides some
notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 4.5-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/ or any of
its mirrors. More information on obtaining this (or other) release
distributions of FreeBSD can be found in the `\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/handbook/mirrors.html>`__ appendix in
the `FreeBSD Handbook <http://www.FreeBSD.org/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
============

This section describes the most user-visible new or changed features in
FreeBSD since 4.4-RELEASE. Typical release note items document new
drivers or hardware support, new commands or options, major bugfixes, or
contributed software upgrades. Security advisories for the base system
that were issued after 4.4-RELEASE are also listed.

Many additional changes were made to FreeBSD that are not listed here
for lack of space. For example, documentation was corrected and
improved, minor bugs were fixed, insecure coding practices were audited
and corrected, and source code was cleaned up.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Kernel Changes
------------------

The ``kern.maxvnodes`` limit now properly limits the number of vnodes in
use. Previously only vnodes with no cached pages could be freed; this
could allow the number of vnodes to grow without limit on large-memory
machines accessing many small files. A ``vnlru`` kernel thread helps to
flush and reuse vnodes.

Linux emulation now supports the kernel functionality required by the
```emulators/linux_base-7`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/linux_base-7/pkg-descr>`__
(RedHat 7.X emulation) port.

A ``MAXMEM`` kernel option, along with the ``hw.physmem`` loader
tunable, can be used to artificially reduce the memory size of a machine
for testing (or other purposes).

The kernel configuration parameters ``MAXTSIZ``, ``DFLDSIZ``,
``MAXDSIZ``, ``DFLSSIZ``, ``MAXSSIZ``, and ``SGROWSIZ`` are all loader
tunables (``kern.maxtsiz``, ``kern.maxdfldsiz``, etc.).

Specifying a value of ``0`` for the ``maxusers`` kernel configuration
parameter will now cause an appropriate value to be calculated at
boot-time (between 32 and 384, depending on the amount of memory
present). This value is now the default for all ``GENERIC`` kernels.

The console driver has gained support for TGA-based display adapters.

Coredumps of large processes (or of a large number of processes) no
longer lock up the machine for long periods of time.

The system load average computation now adds some jitter to the timing
of samples, in order to avoid synchronization with processes that run
periodically.

If a debugging kernel with modules is being built (i.e. using
``makeoptions           DEBUG=-g``), the modules will now be built with
debugging support as well, for completeness. A side effect of this
change is that modules built and installed with debugging kernels will
now occupy more space on disk than they did previously.

Compaq Tru64 and FreeBSD keep the year in the TOY clock chip in
different formats. Compaq Tru64 uses a year-value that is 52 years
higher than FreeBSD. In order to allow dual booting of an Alpha machine
without clobbering the TOY clock setting, FreeBSD now supports a boot
environment variable ``clock_compat_osf1`` to use Tru64's year values.
By setting this variable to ``1`` from the ``ok`` prompt of the loader
or by putting ``clock_compat_osf1=1`` in ``/boot/loader.conf``, an Alpha
can be dual booted without \`\`time warps''.

The kernel on the installation CDs is now separated from the ``mfsroot``
image. This provides more flexibility when building custom FreeBSD
distributions.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1 Processor/Motherboard Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The machine dependent code has been corrected to allow FreeBSD to run on
Alphaserver 2100 and 2100A machines based on EV5 Alpha processors.
Machines with EV4 Alpha processors were already supported.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2 Boot Loaders
~~~~~~~~~~~~~~~~~~

The FreeBSD boot loader is now capable of booting from filesystems with
block sizes larger than 8K.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3 Network Interface Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports \`\`monitor'' mode, settable via the ``-M`` option
to
`ancontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ancontrol&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__.

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports NICs based on the Conexant LANfinity RS7112 chip.

The
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now performs round-robin arbitration between the transmit and
receive units of the 21143, instead of giving priority to the receive
unit. This gives a 10-15% performance improvement in the forwarding rate
under heavy load.

The dgm driver has been updated from FreeBSD -CURRENT.

The
`faith(4) <http://www.FreeBSD.org/cgi/man.cgi?query=faith&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
device is now loadable, unloadable, and clonable.

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports Intel's loadable microcode to implement receive-side
interrupt coalescing and packet bundling, on NICs that support these
features. This support can be activated by the use of the ``link0``
option to
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__.

The
`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver has been added to support NICs based on the Intel 82542 and 82543
Gigabit Ethernet controller chips. Both fiber and copper variants of the
cards are supported. Both boards support VLAN tagging/insertion, and the
82543 additionally supports TCP/IP checksum offload.

The
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports the SiS 900-style on-board Ethernet controllers in
the SiS 635 and 735 motherboard chipsets.

The
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports VLANs.

`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
devices are now loadable, unloadable, and clonable.

The
`wx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wx&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver is now deprecated; it is now officially unmaintained. Users with
Intel Pro/1000 Gigabit Ethernet interfaces should use either the
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver or the
`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver. (The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver is supported by Intel, but only works on the i386 architecture.
The
`gx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gx&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver was developed by the FreeBSD Project, and is multi-platform.)

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports send- and receive-side TCP/IP checksum offloading
for NICs implementing this feature, such as the 3C905B, 3C905C, and
3C980C.

A bug in the
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver, related to statistics overflow interrupt handling, was causing
slowdowns at medium to high packet rates; this has been fixed.

The per-interface ``ifnet`` structure now has the ability to indicate a
set of capabilities supported by a network interface, and which ones are
enabled.
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
has support for querying these capabilities.

Performance with hosts having a large number of IP aliases has been
improved, by replacing the per-interface ``if_inaddr`` linear list with
a hash table.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4 Network Protocols
~~~~~~~~~~~~~~~~~~~~~~~

The read timeout feature of
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
now works more correctly with
`select(2) <http://www.FreeBSD.org/cgi/man.cgi?query=select&sektion=2&manpath=FreeBSD+4.5-RELEASE>`__/`poll(2) <http://www.FreeBSD.org/cgi/man.cgi?query=poll&sektion=2&manpath=FreeBSD+4.5-RELEASE>`__,
and therefore with pthreads.

`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
and
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
have received some enhancements and bug fixes, and are now loadable
modules.

A bug in the TCP NewReno implementation, which could cause degraded
throughput under certain circumstances, has been fixed.

TCP's default buffer sizes, controlled by the ``net.inet.tcp.sendspace``
and ``net.inet.tcp.recvspace`` sysctl variables, have been increased to
32K and 64K respectively. Previously, the default for both buffer sizes
was 16K. To try to avoid increasing congestion, the default value for
``net.inet.tcp.local_slowstart_flightsize`` has been changed from
infinity to 4.

.. raw:: html

   <div class="NOTE">

    **Note:** On busy hosts, the new larger buffer sizes may require
    manually increasing the ``NMBCLUSTERS`` parameter, either in the
    kernel configuration file or via the ``kern.ipc.nmbclusters`` loader
    tunable. ``netstat                 -mb`` can be used to monitor the
    state of mbuf clusters.

.. raw:: html

   </div>

A bug in the TCP implementation, which could cause connections to stall
if a sender saw a zero-sized window, has been corrected.

The TCP implementation in FreeBSD now implements a cache of outstanding,
received SYN segments. Incoming SYN segments now cause entries to be
placed in the cache until the TCP three-way handshake is complete, at
which point, memory is allocated for the connection as usual. In
addition, all TCP Initial Sequence Numbers (ISNs) are used as cookies,
allowing entries in the cache to be dropped, but still have their
corresponding ACKs accepted later. The combination of the so-called
\`\`syncache'' and \`\`syncookies'' features makes a host much more
resistant to TCP-based Denial of Service attacks. Work on this feature
was sponsored by DARPA and NAI Labs.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5 Disks and Storage
~~~~~~~~~~~~~~~~~~~~~~~

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports a wider variety of chipsets, as listed in the
Hardware Notes.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now has support for 48-bit addressing. Devices larger than 137GB
are now supported.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now contains fixes for some data corruption problems on systems
using the VIA 82C686B Southbridge chip.

Floppy access on the Alphaserver DS10 and DS20 is broken. Use results in
corrupted floppies and/or machine crashes.

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver now supports the Qlogic 2300 and 2312 Optical Fibre Channel PCI
cards.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6 Filesystems
~~~~~~~~~~~~~~~~~

The directory layout preference algorithm for FFS (``dirprefs``) has
been changed. Rather than scattering directory blocks across a disk, it
attempts to group related directory blocks together. Operations
traversing large directory hierarchies, such as the FreeBSD Ports tree,
have shown marked speedups. This change is transparent and automatic for
new directories.

The virtual memory subsystem now backs UFS directory memory requirements
by default (this behavior is controlled via the ``vfs.vmiodirenable``
sysctl variable).

A bug that prevented the root filesystem from being mounted from a SCSI
CDROM has been fixed (ATAPI CDROMs were always supported).

The ``UFS_DIRHASH`` hash-based lookup optimization for large directories
is now enabled by default in the ``GENERIC`` kernel.

A number of bugs in the filesystem code, discovered through the use of
the **fsx** filesystem test tool, have been fixed. Under certain
circumstances (primarily related to use of NFS), these bugs could cause
data corruption or kernel panics.

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

The
`urio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=urio&sektion=4&manpath=FreeBSD+4.5-RELEASE>`__
driver, for the Diamond Rio series of MP3 players, has been added. (For
some reason, a manual page for this driver was committed to FreeBSD
4.3-RELEASE.)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

**IPFilter** now supports IPv6.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Security-Related Changes
----------------------------

Per-user ``~/.login.conf`` files were disabled in FreeBSD 4.4-RELEASE to
avoid a security hole caused by a bug. The bug was fixed and this
feature has been re-enabled.

A security hole in **OpenSSH**, which could allow users to execute code
with arbitrary privileges if ``UseLogin yes`` was set, has been closed.
Note that the default value of this setting is ``UseLogin no``. (See
security advisory
`FreeBSD-SA-01:63 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-01:63.openssh.asc>`__.)

The use of an insecure temporary directory by
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
could permit a local attacker to modify the contents of binary packages
while they were being installed. This hole has been closed. (See
security advisory
`FreeBSD-SA-02:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:01.pkg_add.asc>`__.)

A race condition in
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__,
which could expose the contents of ``/etc/master.passwd``, has been
eliminated. (See security advisory
`FreeBSD-SA-02:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:02.pw.asc>`__.)

A bug in
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
could have allowed a process that had given up superuser privileges to
regain them. This bug has been fixed. (See security advisory
`FreeBSD-SA-02:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:07.k5su.asc>`__.)

A race condition in the
`exec(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exec&sektion=3&manpath=FreeBSD+4.5-RELEASE>`__
system call, which could result in local users obtaining increased
privileges, has been fixed. (See security advisory
`FreeBSD-SA-02:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:08.exec.asc>`__.)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
--------------------

`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now prints the applicable interface name for each ARP entry.

`cat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cat&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now has the ability to read from UNIX-domain sockets.

`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now takes a ``-f`` option to allow limiting the prototype quota
distribution (specified with ``-p``) to a single filesystem.

`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
can now take various units of time to be applied to the ``-[acm]time``
primaries.

`fmt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fmt&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
has been rewritten; the rewrite fixes a number of bugs compared to its
prior behavior.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now supports ``-o`` and ``-O`` options to disable the ``RETR`` command;
the former for everybody, and the latter only for guest users. Coupled
with ``-A`` and appropriate file permissions, these can be used to
create a relatively safe anonymous FTP drop box for others to upload to.

The
`groups(1) <http://www.FreeBSD.org/cgi/man.cgi?query=groups&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
and
`whoami(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whoami&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
shell scripts are now unnecessary; their functionality has been
completely folded into
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
will now avoid the display of dynamic firewall rules unless the ``-d``
flag is passed to it. The ``-e`` option lists expired dynamic rules.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
has a new ``limit`` type of firewall rule, which limits the number of
sessions between address pairs.

`keyinfo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=keyinfo&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
is now a C program, rather than a Perl script.

``libfetch`` has been synchronized to the version in FreeBSD -CURRENT;
among other features, it now has support for an authentication callback.

``libstand`` now has support for filesystems containing
**bzip2**-compressed files.

Locale names have been renamed to improve compatibility with the names
used by X11R6, as well as a number of other UNIX versions. As an
example, the ``en_US.ISO_8859-1`` locale name has been changed to
``en_US.ISO8859-1``. Entries in ``/etc/locale.alias``,
``/etc/man.alias``, and ``/etc/nls.alias`` provide backward
compatibility. The table below summarizes the locale changes:

.. raw:: html

   <div class="INFORMALTABLE">

+-----------------------+---------------------------+
| FreeBSD 4.4-RELEASE   | FreeBSD 4.5-RELEASE       |
+=======================+===========================+
| ``ISO_``\ ``*``       | ``ISO``\ ``*``            |
+-----------------------+---------------------------+
| ``ru_SU``\ ``*``      | ``ru_RU``\ ``*``          |
+-----------------------+---------------------------+
| ``DIS_``\ ``*``       | ``ISO``\ ``*``\ ``-15``   |
+-----------------------+---------------------------+
| ``*``\ ``.ASCII``     | ``*``\ ``.US-ASCII``      |
+-----------------------+---------------------------+

.. raw:: html

   </div>

`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now has some support for ``o``-type print-file actions in its control
files, which allows printing of PostScript files generated by **MacOS**
10.1.

`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-log_ipfw_denied`` option to log packets that cannot be
re-injected because they are blocked by
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
rules.

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now has a ``-z`` flag to reset statistics.

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now has a ``-S`` flag to print addresses numerically but port names
symbolically.

The default number of cylinders per group in
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
is now computed to be the maximum allowable given the current filesystem
parameters. It can be overridden with the ``-c`` option. Formerly, the
default was fixed at 16. This change leads to better
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
performance and reduced fragmentation.

The default block and fragment sizes for new filesystems created by
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
are now 16384 and 2048 bytes, respectively (the old defaults were 8192
and 1024 bytes). This change generally provides increased performance,
at the expense of some wasted disk space.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now has the ability to compress log files using
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__.

`nl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nl&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__,
a line numbering filter program, has been added.

`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-v`` option to display the vendor/device information of
configured devices, in conjunction with the ``-l`` option. The default
vendor/device database can be found at ``/usr/share/misc/pci_vendors``.

`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-A`` option to beep when packets are lost.

`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
is now more verbose when changing indirect routes, in the case of a
gateway route that is the same route as the one being modified.

`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now uses ``host``/``bits`` syntax instead of ``net``/``bits`` syntax,
for compatibility with
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__.

`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
can now create \`\`proxy only'' published ARP entries.

The
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
``add`` command now supports the ``-ifp`` and ``-ifa`` modifiers.

`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now takes a ``-a`` option to include a file into the ``Fix:`` section of
a problem report.

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now implements ``test`` as a built-in command for improved efficiency.

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-e`` option to separate variable names and values by
``=`` rather than ``:``. This feature is useful for producing output
that can be fed back to
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now has the ability to load KLDs as a part of the installation.

When run from the installation media,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
will automatically load any device drivers found in the
``/stand/modules`` directory of the ``mfsroot`` floppy or filesystem
image. Note that any drivers so loaded will not appear in the kernel's
boot messages; the
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
debugging screen will provide additional information.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now enables Soft Updates by default on all filesystems it creates,
except for the root filesystem.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
has received updates for its \`\`auto'' partitioning mode which provide
more reasonable defaults for the sizes of partitions that are created;
auto-sized partitions can now also recover the space that becomes
available when other partitions are deleted.

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now has the ability to bind to a specific address (as opposed to using
every available one) via the ``-b`` option.

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
now accepts a ``-c`` flag to disable repeated line compression.

Previously,
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
was only capable of configuring 16 devices when invoked with the ``-f``
(configuration file) option. This limit has been removed.

`wall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=wall&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-g`` flag to write a message to all users of a given
group.

`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
supports a ``-c`` option to specify a country code to help direct
queries towards a particular whois server.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

The version of **IPFilter** provided with FreeBSD now includes the
`ipfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfs&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__
program, which allows state information created for NAT entries and
stateful rules to be saved to disk and restored after a reboot.
Boot-time configuration of these features is supported by
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+4.5-RELEASE>`__.

The **NTP** suite of programs has been updated to 4.1.0.

**OpenSSH** has been updated to version 2.9, which adds two new
programs,
`sftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sftp&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
and
`ssh-keyscan(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keyscan&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__.
Among the various enhancements: Rekeying of existing SSH sessions is now
supported,
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now supports authentication forwarding for DSA keys, and an experimental
**SOCKS4** proxy has been added to
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__.

.. raw:: html

   <div class="NOTE">

    **Note:** ``Protocol                 1,2`` remains the default
    protocol setting in ``/etc/ssh/ssh_config``. In FreeBSD -CURRENT,
    the default is ``Protocol 2,1``.

.. raw:: html

   </div>

The ``smmsp`` and ``mailnull`` users have been added to
``/etc/master.passwd``. In the absence of a ``confDEF_USER_ID`` setting,
by default, **sendmail** will use the ``mailnull`` user for extra
security. Previously, if the ``mailnull`` user did not exist, the
``daemon`` user was used. This change may generate some permissions
issues when mailing to files or to programs (such as
```mail/majordomo`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/majordomo/pkg-descr>`__).
The previous behavior can be restored by adding the following line to a
system's ``*``.mc configuration file:

.. code:: PROGRAMLISTING

        define(`confDEF_USER_ID', `daemon')

**tcsh** has been updated to version 6.11.

The timezone database has been updated to the ``tzdata2001d`` release.

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.1 CVS
^^^^^^^^^^^

**CVS** has been updated to 1.11.1p1.

`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-T`` option to update a sandbox's ``CVS/Template`` file
from the repository.

`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
``diff`` now supports the ``-j`` option to perform differences against a
revision relative to a branch tag.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2 Ports/Packages Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Due to delays in the certification process, native **JDK** support for
FreeBSD will be released shortly after 4.5-RELEASE. An announcement will
be made on the FreeBSD Web site, as well as the FreeBSD announcements
mailing list ``<freebsd-announce@FreeBSD.org>``, when the distribution
is available.

`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-b`` option to create a package file from a
locally-installed package.

`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1&manpath=FreeBSD+4.5-RELEASE>`__
now supports a ``-r`` option for recursive package removal.

Version 4.2.0 of **XFree86** was released just a few days before the
shipping date for FreeBSD 4.5-RELEASE. As a result, the FreeBSD team did
not have time to test and evaluate the new version for inclusion in the
release. Therefore, FreeBSD 4.5-RELEASE includes the older 4.1.0 version
of the **XFree86** package. Installing a newer version of **XFree86**
can be done using an up-to-date (post-release) copy of the FreeBSD Ports
Collection; instructions for doing so can be found in the `Using the
Ports
Collection <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
section of the `FreeBSD Handbook <http://www.FreeBSD.org/handbook/>`__.

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
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.5-RELEASE>`__.
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
-STABLE'' <http://www.FreeBSD.org/handbook/current-stable.html>`__
section of the `FreeBSD Handbook <http://www.FreeBSD.org/handbook/>`__.

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
ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
