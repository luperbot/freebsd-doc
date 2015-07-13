=================================
FreeBSD 7.0-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.0-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 The
FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/article.sgml,v
  1.1068.2.20.2.3 2008/02/16 16:03:48 bmah Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of the FreeBSD Foundation.

IBM, AIX, EtherJet, Netfinity, OS/2, PowerPC, PS/2, S/390, and ThinkPad
are trademarks of International Business Machines Corporation in the
United States, other countries, or both.

IEEE, POSIX, and 802 are registered trademarks of Institute of
Electrical and Electronics Engineers, Inc. in the United States.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

Sparc, Sparc64, SPARCEngine, and UltraSPARC are trademarks of SPARC
International, Inc in the United States and other countries. Products
bearing SPARC trademarks are based upon architecture developed by Sun
Microsystems, Inc.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “®” symbol.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 7.0-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 7-STABLE development
line. This document lists applicable security advisories that were
issued since the last release, as well as significant changes to the
FreeBSD kernel and userland. Some brief remarks on upgrading are also
presented.

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
1 `Introduction <#INTRO>`__
2 `What's New <#NEW>`__
2.1 `Security Advisories <#SECURITY>`__
2.2 `Kernel Changes <#KERNEL>`__
2.2.1 `Boot Loader Changes <#BOOT>`__
2.2.2 `Hardware Support <#PROC>`__
2.2.3 `Network Protocols <#NET-PROTO>`__
2.2.4 `Disks and Storage <#DISKS>`__
2.2.5 `File Systems <#FS>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 ```/etc/rc.d`` Scripts <#RC-SCRIPTS>`__
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Ports/Packages Collection Infrastructure <#PORTS>`__
2.6 `Release Engineering and Integration <#RELENG>`__
2.7 `Documentation <#DOC>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 7.0-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 7.0-RELEASE is a snapshot distribution. It
can be found at http://www.FreeBSD.org/snapshots/ or any of its mirrors.
More information on obtaining this (or other) snapshot distributions of
FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
7.0-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 6.0-RELEASE. In general, changes described here are unique
to the 7-STABLE branch unless specifically marked as [MERGED] features.

Typical release note items document recent security advisories issued
after 6.0-RELEASE, new drivers or hardware support, new commands or
options, major bug fixes, or contributed software upgrades. They may
also list changes to major ports/packages or release engineering
practices. Clearly the release notes cannot list every single change
made to FreeBSD between releases; this document focuses primarily on
security advisories, user-visible changes, and major architectural
improvements.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

Two remote denials of service in BIND (one involving DNSSEC and one
involving recursive DNS queries) have been fixed. For more information,
see security advisory
`FreeBSD-SA-07:02.bind <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:02.bind.asc>`__.
[MERGED]

Processing of IPv6 type 0 Routing Headers is now controlled by the
``net.inet6.ip6.rthdr0_allowed`` sysctl variable, which defaults to
``0`` (off). For more information, see security advisory
`FreeBSD-SA-07:03.ipv6 <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:03.ipv6.asc>`__.
[MERGED]

A potential heap overflow in the
`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility (and the
`libmagic(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libmagic&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
library on which it relies) has been fixed. More details can be found in
security advisory
`FreeBSD-SA-07:04.file <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:04.file.asc>`__.
[MERGED]

Problems with
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
and
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
handling corrupted
`tar(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
archive files have been fixed. More details can be found in security
advisory
`FreeBSD-SA-07:05.libarchive <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:05.libarchive.asc>`__.
[MERGED]

A buffer overflow in
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
has been corrected. More information can be found in security advisory
`FreeBSD-SA-07:06.tcpdump <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:06.tcpdump.asc>`__.
[MERGED]

A bug in
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__,
which could result in an attacker being able to poison a resolver's DNS
cache, has been fixed. More details are included in security advisory
`FreeBSD-SA-07:07.bind <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:07.bind.asc>`__.
[MERGED]

A buffer overflow in OpenSSL (fixed incorrectly in a previously security
patch) has been corrected. More details can be found in security
advisory
`FreeBSD-SA-07:08.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:08.openssl.asc>`__.
[MERGED]

An flaw that could lead to the disclosure of previously-generated
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
data has been corrected. Information regarding this issue can be found
in security advisory
`FreeBSD-SA-07:09.random <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:09.random.asc>`__.
[MERGED]

Information disclosure issues found in
`openpty(3) <http://www.FreeBSD.org/cgi/man.cgi?query=openpty&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
and
`ptsname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ptsname&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
have been corrected. Information regarding this issue can be found in
security advisory
`FreeBSD-SA-08:01.pty <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:01.pty.asc>`__.
[MERGED]

A programming error in the
`inet\_network(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet_network&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
Internet address manipulation function that could lead to overwriting a
region of memory with user defined data has been corrected. Information
regarding this issue can be found in security advisory
`FreeBSD-SA-08:02.libc <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:02.libc.asc>`__.
[MERGED]

An error that could allow
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__
to inappropriately access the contents of a file has been fixed. For
more information, see security advisory
`FreeBSD-SA-08:03.sendfile <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:03.sendfile.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
now has support for the HPET time counter. [MERGED]

The
`acpi\_ibm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_ibm&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports setting the fan control mode to manual or automatic,
and adjusting the fan speed if the fan control mode is manual. To enable
manual control of the fan speed, the sysctl variable
``dev.acpi_ibm.0.fan`` needs to be set to zero (manual). This should
only be used with extreme precaution, as disabling automatic fan control
might overheat the hardware and lead to permanent damage.

The
`apm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=apm&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
suspend/resume support has been improved.

The
`cpufreq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpufreq&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
CPU frequency control framework is now enabled in the ``GENERIC``
kernel.

Support for the Camellia block cipher has been added to the FreeBSD
kernel. It can now be specified as a cipher in
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.
More information on Camellia can be found in RFC 4132.

The ``options COMPAT_43`` kernel configuration option has been deemed
unnecessary and has been removed from ``GENERIC`` and related kernel
configurations. This change may result in a small performance increase
for some workloads.

The dumb console driver
(`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__)
is now enabled in the ``GENERIC`` kernel.

The
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
debugger now provides the ``show sleepq`` command. This takes a wait
channel as an argument and looks for a sleep queue associated with that
wait channel.

A bug in file descriptor handling such that a simple
``close(0); dup(fd)`` sequence does not return descriptor ``0`` in some
cases, has been fixed.

The
`gdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gdb&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
remote debugging interface now supports copying console messages to a
remote debugger instance. To enable this, set ``debug.gdbcons="1"`` in
``loader.conf``, enter ``boot -d; gdb; step`` from the loader prompt,
then attach
`gdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gdb&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
from a remote machine. The sysctl variable ``debug.gdbcons`` can be used
to turn on/off this functionality.

`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
now support profiling of dynamically loaded kernel modules and shared
objects loaded with
`dlopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=dlopen&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__.

A new ``kern.hostuuid`` sysctl variable has been added to hold a host's
Universally Unique Identifier (UUID). This UUID is computed or generated
by a new ``rc.d/hostid`` startup script and, where possible, is saved to
disk to be persistent across reboots.

The ``INCLUDE_CONFIG_FILE`` kernel configuration option has been
improved. The full configuration of a running kernel can now be obtained
via ``sysctl -b kern.conftxt``. It can also be extracted from a kernel
file via ``config -x kernelfile``. To preserve the literal kernel
configuration with all the comments included, the ``-C`` option of
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
can be used.

Support for Kernel Scheduled Entities (KSE) is now a kernel option
(previously it was a mandatory feature in the kernel). It is enabled in
the GENERIC kernel (thus there is no change in functionality) for all
platforms except sun4v.

The Linux ABI support was enhanced to support emulation of Linux 2.6.16.
This is not enabled by default. To turn it on the
``compat.linux.osrelease`` sysctl variable has to be set to ``2.6.16``.
Note that this support is still experimental.

Support for Message Signaled Interrupts (MSI) and Extended Message
Signaled Interrupts (MSI-X) has been added to the kernel's PCI support
code. [MERGED]

The
`priv(9) <http://www.FreeBSD.org/cgi/man.cgi?query=priv&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
kernel interface has been added. Its purpose is checking the
availability of privilege for threads and credentials. Unlike the
existing
`suser(9) <http://www.FreeBSD.org/cgi/man.cgi?query=suser&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
interface,
`priv(9) <http://www.FreeBSD.org/cgi/man.cgi?query=priv&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
exposes a named privilege identifier to the privilege checking code,
allowing more complex policies regarding the granting of privilege to be
expressed.

FreeBSD now supports concurrent
`read(2) <http://www.FreeBSD.org/cgi/man.cgi?query=read&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__/`readv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=readv&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__
access to a file.

The kernel's
`sx(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sx&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
locks have been optimized to use simple atomic operations for the common
cases of obtaining and releasing shared and exclusive locks. While this
change is not generally user-visible, it is the basis for some
substantial performance improvements.

The ULE process scheduler has been revised to improve its behavior, in
particular interactivity under load, for both uniprocessor and
multiprocessor machines. This implementation has commonly been referred
to as “ULE 3.0”. (ULE 3.0 was formerly known as SCHED\_SMP, which in
turn was based on version 2.0 of the ULE scheduler. ULE 2.0 was never a
part of any FreeBSD release, however it was the subject of many
development, testing, and benchmarking efforts.)

The ``SIGCHLD`` signal queuing has been added. For each child process
whose status has been changed, a ``SIGCHLD`` instance is queued. If the
signal is still pending, and the process changed status several times,
the signal information is updated to reflect the latest process status.
There is a loader tunable ``kern.sigqueue.queue_sigchild`` which can
control the behavior, setting it to zero disables the ``SIGCHLD``
queuing feature.

A new sysctl variable ``kern.malloc_stats`` has been added. This allows
exporting of kernel malloc statistics via a binary structure stream.

A new sysctl variable ``kern.forcesigexit`` has been added. This forces
a process to sigexit if a trap signal is being held by the current
thread or ignored by the current process. It is enabled by default.

The pcvt(4) driver, an alternative to
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
has been removed, as it had fallen out of sync with the rest of the
kernel.

RedZone, a buffer corruption protection for the kernel
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
facility has been implemented. This detects both buffer underflows and
overflows at runtime on
`free(9) <http://www.FreeBSD.org/cgi/man.cgi?query=free&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
and
`realloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=realloc&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__,
and prints backtraces from where memory was allocated and from where it
was freed. For more details, see the
`redzone(9) <http://www.FreeBSD.org/cgi/man.cgi?query=redzone&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
manual page.

A new loader tunable ``vm.kmem_size_min`` has been added. This allows to
specify a minimal size for ``vm.kmem_size``.

A new sysctl variable ``vm.zone_stats`` has been added. This allows to
export
`uma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=uma&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
allocator statistics via a binary structure stream.

The sysctl variable ``hw.pci.do_powerstate`` has been split into two
sysctl variables ``hw.pci.do_powerstate_nodriver`` and
``hw.pci.do_powerstate_resume``. Also, these variables have been changed
from a boolean to a range. ``0`` means no power management, ``1`` means
conservative power management which any device class that has caused
problems is added to the watch list, ``2`` means aggressive power
management where any device class that is not fundamental to the system
is added to the list, and ``3`` means power them all down
unconditionally. The default values are ``0`` for
``hw.pci.do_powerstate_nodriver`` and ``1`` for
``hw.pci.do_powerstate_resume``.

[ia64] The ``GENERIC`` kernel now enables SMP support by default.

Sample kernel configuration files ``src/sys/arch``/conf/MAC for the
Mandatory Access Control framework have been added.

``POSIX_TIMERS`` support has been updated to 200112L.

An experimental support for POSIX message queue has been implemented.

The locking strategy for UNIX domain sockets has been revised to improve
concurrency; this change has yielded substantial performance
improvements on various SMP workloads (in particular, MySQL on 8-way
amd64 systems) with little or no measured overhead on UP systems.

Several minor but widespread changes to the Newbus API have been made In
order to support some on-going work with interrupt filtering. Because
this change also breaks the kernel ABI, all third-party device drivers
will need to be modified and recompiled.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

A new option ``-S``, which allows setting the ``boot2`` serial console
speed in the ``/boot.config`` file or on the boot: prompt line, has been
added.

[amd64, i386]
`firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?query=firewire&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
support has been added to the boot loader. To enable it,
``LOADER_FIREWIRE_SUPPORT=yes`` has to be added to ``/etc/make.conf``
and the loader be rebuilt.

[pc98] The **IPLware** support in boot0.5 has been enhanced to support
version 3.33.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
`pccard(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pccard&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
`pccbb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pccbb&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
and
`ex(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ex&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
drivers are now buildable as kernel modules.

An
`acpi\_dock(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_dock&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added to provide support for controlling laptop docking
station functions via ACPI. [MERGED]

The
`acpi\_thermal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_thermal&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports overriding the ``_PSV``, ``_HOT``, and ``_CRT``
temperature values.

Support for the alpha architecture has been removed. Alpha support will
remain on the RELENG\_5 and RELENG\_6 codelines.

The
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports ``/dev/cardbus%d``.cis.

[i386, amd64] The
`coretemp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=coretemp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added to provide temperature readings on Intel® Core™
processors. [MERGED]

The ``est``
`cpufreq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpufreq&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports frequency control for the VIA C7-M family of
processors.

The
`firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?query=firewire&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
code is now MPSAFE.

icee(4), a generic I2C EEPROM driver, has been added.

A bug which prevented the
`ichsmb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ichsmb&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
kernel module from unloading has been fixed.

[amd64, i386] Dual-core processors (such as the Intel Core Duo) now have
both cores available for use by default in SMP-enabled kernels. [MERGED]

[ia64, powerpc] The loader tunable ``debug.mpsafevfs`` is set to ``1``
by default.

The
`sab(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sab&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been removed (it has been superceded by the
`scc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scc&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver).

The
`scc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scc&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. This provides generic support for serial
communications controllers and delegates the control over each channel
and mode to a subordinate driver such as
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.

[amd64] The smbios(4) driver support for amd64 has been added.

[sun4v] FreeBSD now has preliminary support for the Sun Microsystems
UltraSPARC-T1 architecture. FreeBSD/sun4v has been demonstrated to run
on the Sun Fire T1000 and Sun Fire T2000 servers. More information can
be found on the `sun4v
Project <http://www.FreeBSD.org/platforms/sun4v.html>`__ page.

The tnt4882(4) driver, which supports the National Instruments PCI-GPIB
card, has been added.

[amd64, i386, ia64, sparc64] The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been included in the ``GENERIC`` kernel by default. When both
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
can handle a given serial port,
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
will claim it.

The
`uark(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uark&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, which supports the Arkmicro Technologies ARK3116-based USB
serial adapter, has been added.

The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports LOM (Lights Out Management) and RSC (Remote System
Control) devices as consoles.

The zs driver has been removed. Its functionality has been superceded by
that of the
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver.

[i386] A new loader tunable ``hw.apic.enable_extint`` has been added.
This tunable can be used to disable masking of the ExtINT pin on the
first I/O APIC. At least one chipset for the Intel Pentium III seems to
need this, even though all of the pins in the 8259As are masked. The
default is still to mask the ExtINT pin.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The new midi(4) driver which is based on NetBSD's one has been added.
This supports
`snd\_cmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cmi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`snd\_emu10k1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10k1&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
drivers.

The
`snd\_cmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cmi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE.

The
`snd\_emu10kx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10kx&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. It supports Creative SoundBlaster Live! and
Audigy series sound cards with optional pseudo-multichannel playback.

The
`snd\_envy24(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_envy24&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added to support the Envy24 series of audio chips.
[MERGED]

The
`snd\_envy24ht(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_envy24ht&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added to support the VIA Envy24HT series of audio chips.
[MERGED]

The
`snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. It supports devices that conform to revision 1.0
of the Intel High Definition Audio specification. [MERGED]

The
`snd\_solo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_solo&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE. [MERGED]

The
`snd\_spicds(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_spicds&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added to support I2S SPI audio codec chips. [MERGED]

The
`uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uaudio&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports 24/32 bit audio formats and conversion.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been updated to HAL version 0.9.20.3. [MERGED]

The
`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.
[MERGED]

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver's Jumbo frame support is now MPSAFE.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports big-endian architectures such as sparc64.

The
`cm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cm&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE.

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. It provides support for 10 Gigabit Ethernet
adapters based on the Chelsio T3 and T3B chipsets. [MERGED]

The
`edsc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=edsc&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, which provides Ethernet discard network interfaces, has been
added. [MERGED]

The
`el(4) <http://www.FreeBSD.org/cgi/man.cgi?query=el&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been removed due to lack of use.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been updated to version 6.7.3 from Intel. Among other
changes, it now supports 80003, 82571, 82571EB, 82572 and 82575 based
adapters, as well as onboard-NICs on ICH8-based motherboards. [MERGED]

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now includes initial support for suspend and resume features.

The performance of the
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been improved by using a fast interrupt handler and taskqueue
instead of ithread handler. This change can be disabled by defining
``NO_EM_FASTINTR`` kernel option for debugging purpose.

The IP over FireWire
(`fwip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwip&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__)
driver is now enabled in the ``GENERIC`` kernel.

The
`gem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gem&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.

The firmware images needed by the
`ipw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipw&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver are now part of the FreeBSD base system. For the loaded firmware
to work the license at ``/usr/share/doc/legal/intel_ipw/LICENSE`` must
be agreed to and ``legal.intel_ipw.license_ack=1`` has to be added to
``/boot/loader.conf``. Prior versions of the driver used the firmware
image in the
```net/ipw-firmware-kmod`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/ipw-firmware-kmod/pkg-descr>`__
port/package or the
```net/ipw-firmware`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/ipw-firmware/pkg-descr>`__
port/package.

The
`iwi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports big-endian architectures such as sparc64.

The firmware images needed by the
`iwi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver are now part of the FreeBSD base system. For the loaded firmware
to work the license at ``/usr/share/doc/legal/intel_iwi/LICENSE`` must
be agreed to and ``legal.intel_iwi.license_ack=1`` has to be added to
``/boot/loader.conf``. Prior versions of the driver used the firmware
image in the
```net/iwi-firmware-kmod`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/iwi-firmware-kmod/pkg-descr>`__
port/package or the
```net/iwi-firmware`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/iwi-firmware/pkg-descr>`__
port/package.

The ixgbe driver, which supports the Intel 10G PCI-Express adapter
(82598), has been added.

The lnc(4) driver has been removed. The
`le(4) <http://www.FreeBSD.org/cgi/man.cgi?query=le&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
drivers support all devices that were supported by lnc(4).

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. It supports network interfaces using the
Marvell/SysKonnect Yukon II Gigabit Ethernet controller. [MERGED]

[amd64, i386] The
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, which supports Myricom Myri10GE 10 Gigabit Ethernet adapters,
has been added. For more details, see
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.
[MERGED]

[amd64, i386] The
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, an open-source driver for nForce Ethernet devices, has been
added, originally from OpenBSD. This driver has replaced the
`nve(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nve&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver in the ``GENERIC`` kernel.

[arm] The
`npe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=npe&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, which supports the Intel XScale Network Processing Engine, has
been added. [MERGED]

The
`nxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nxge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, which supports the Neterion Xframe 10 Gigabit Ethernet adapter,
has been added.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports the D-Link DGE-528(T) Gigabit Ethernet card.

The
`rum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rum&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. It supports WLAN adapters based on the Ralink
RT2501USB and RT2601USB chipsets.

The
`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports big-endian architectures such as sparc64.

The
`ufoma(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ufoma&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver for FOMA (third generation mobile phone system by NTT DoCoMo,
Inc. in Japan) has been added. This should support other third
generation mobile phones since the driver is based on USB Implementation
Guideline from MCPC (Mobile Computing Promotion Consortium) in Japan.

The vgapci(4) driver has been added. This is a stub device driver for
VGA PCI devices and serves as a bus so that other drivers such as
drm(4),
`acpi\_video(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_video&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
and
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
can attach to it thus allowing multiple drivers for the same device.

The
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.
[MERGED]

The
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now buildable as a kernel module.

[amd64, i386, pc98] The
`wlan\_wep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_wep&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
`wlan\_ccmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_ccmp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
and
`wlan\_tkip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_tkip&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
drivers have been included in the ``GENERIC`` kernel by default.

[amd64, i386] The
`wpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wpi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added to support the Intel 3945 Wireless LAN Controller.

[amd64, i386] The
`zyd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=zyd&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. It provides support for ZyDAS ZD1211/ZD1211B USB
IEEE 802.11 b/g wireless network devices.

The network interface groups feature has been imported from OpenBSD.
This feature allows an administrator to, for example, apply firewall
rules to an entire group of interfaces. More information can be found in
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.

The 802.11 protocol stack has been significantly reworked. Among the new
features are support for background scanning and roaming between APs, as
well as support that will be required by 802.11n-capable devices.

The 802.11 protocol stack now has support for 900 MHz cards, as well as
quarter- and half-channel support for 802.11a. [MERGED]

The FreeBSD network stack now runs entirely free of the Giant kernel
lock, and relies solely on the kernel's fine-grained locking primitives
to manage parallelism. This significantly improves the network stack's
performance on multi-processor systems; uni-processor systems could also
see performance gains. ISDN4BSD and netatm have been temporarily
disconnected from the build. These modules all require the Giant kernel
lock for their operation; disconnecting them allows the removal of the
NET\_NEEDS\_GIANT compatability shim. It is planned to convert these
modules to fine-grained kernel locking and re-connect them for FreeBSD
7.1-RELEASE.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

[amd64, i386, pc98] An experimental BPF Just-In-Time compiler has been
implemented for both
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`ng\_bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bpf&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.
To enable this, the ``options BPF_JITTER`` kernel option is needed. The
``net.bpf_jitter.enable`` can be used to disable this feature.

The
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
device now supports several new
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__
calls to allow examining inbound vs. outbound packets, as well as
packets that have been injected onto the network.

The bridge(4) driver has been removed from the tree. Its functionality
has been completely replaced by
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.

The
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, which is for GRE encapsulation found in RFC 1701 and RFC 1702,
now supports IPv6 over GRE.

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports RSTP, the Rapid Spanning Tree Protocol (802.1w).
[MERGED]

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports a ``private`` flag on bridge ports; no private port
on a bridge can communicate with any other private port. This
functionlity is useful in scenarios such as number of customers VLANs
bridged with a server network; it might be desirable to prevent the
customer VLANs from communicating with each other but allow all of them
to access the server network. The private flag on a bridge port can be
set or cleared via
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.

A hard-coded limit on the number of IPv4 multicast group memberships
(formerly 20) has been removed.

IPv6 multicast forwarding is now dynamically loadable, via the
``ip_mroute.ko`` module.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
packet filter now supports filtering on Routing Header Type 0 and Mobile
IPv6 Routing Header Type 2 in addition to filtering on the
non-differentiated presence of any Routing Header.

The ip6fw(8) packet filter has been removed. Since
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
has gained IPv6 support, it should be used instead. Please note that
some rules might need to be adjusted.

The KAME IPsec implementation has been removed. In its place,
``FAST_IPSEC`` is now the only IPsec implementation supported by the
FreeBSD kernel. The ``IPSEC`` kernel configuration option, which
formerly enabled KAME IPsec, now enables ``FAST_IPSEC``. ``FAST_IPSEC``
now supports both IPv4 and IPv6, uses fine-grained kernel locking, and
supports hardware cryptographic acceleration.

Support for tunneling IPX over IP has been removed.

The
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, ported from OpenBSD and NetBSD, has been added to support a
variety of protocols and algorithms for link aggregation, failover, and
fault tolerance. [MERGED]

The
`natm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=natm&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
Native Mode ATM protocol layer is now MPSAFE.

The
`ng\_car(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_car&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
Netgraph node has been added. It implements various traffic shaping and
rate limiting algorithms.

A new
`ng\_deflate(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_deflate&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
Netgraph node type has been added. It implements Deflate PPP
compression. [MERGED]

The
`ng\_h4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_h4&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
Netgraph node is now MPSAFE.

The
`ng\_ppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ppp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
Netgraph node is now MPSAFE. [MERGED]

A new
`ng\_pred1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_pred1&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
Netgraph node type has been added to implement Predictor-1 PPP
compression. [MERGED]

The default retransmit timer for NFS over TCP is now 60 seconds. This
change prevents the unnecessary retransmission of non-idempotent NFS
requests. The ``nfs_access_cache`` variable in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
has also been changed to 60.

The default minimum number of nfsiod kernel threads
(`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
variable ``vfs.nfs.iodmin``) has been changed from 4 to 0.

A new sysctl variable ``net.inet.icmp.reply_from_interface`` has been
added. This allows the
`icmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=icmp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
reply to non-local packets to be generated with the IP address the
packet came through in. This is useful for routers to show in
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
the actual path a packet has taken instead of the possibly different
return path.

A new sysctl variable ``net.inet.icmp.quotelen`` has been added. This
allows to change length of the quotation of the original packet in an
ICMP reply. The minimum of 8 bytes is internally enforced. The maximum
quotation is the remaining space in the reply mbuf. This option is added
in response to the issues raised in I-D
``draft-gont-icmp-payload-00.txt``.

The
`icmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=icmp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
now always quotes the entire TCP header when responding and allocate an
mbuf cluster if needed. This change fixes the TCP issues raised in I-D
``draft-gont-icmp-payload-00.txt``.

A new socket option ``IP_MINTTL`` has been added. This may be used to
set the minimum acceptable TTL a packet must have when received on a
socket. All packets with a lower TTL are silently dropped. This works on
already connected/connecting and listening sockets for RAW, UDP, and
TCP. This option is only really useful when set to ``255``, preventing
packets from outside the directly connected networks reaching local
listeners on sockets. Also, this option allows userland implementation
of “The Generalized TTL Security Mechanism (GTSM)” found in RFC 3682.

The kernel
`ppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports IPv6.

Stealth forwarding now supports IPv6 as well as IPv4. This behavior can
be controlled by using a new sysctl variable ``net.inet6.ip6.stealth``.

The ``PIM`` kernel option has been removed. The corresponding code is
now included in the ``MROUTING`` kernel option.

Support has been added for the RFC 3678 Source-Specific Multicast (SSM)
socket API. More details can be found in the
`sourcefilter(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sourcefilter&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
manual page.

Support has been added for the Stream Control Transmission Protocol
(SCTP). SCTP implements a reliable, message-oriented transport protocol,
and is defined in RFC 4960. It is enabled in FreeBSD with the ``SCTP``
kernel option and is part of the ``GENERIC`` kernel. More information
can be found in the
`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
manual page.

The ``IPV6_V6ONLY`` socket option now works for UDP.

The ``TCP_DROP_SYNFIN`` kernel option is now included in the kernel by
default. The ``net.inet.tcp.drop_synfin`` sysctl variable still defaults
to ``0``.

The FreeBSD network stack now has support for TCP Segmentation Offload
(TSO). TSO reduces the overhead of sending bulk TCP data by allowing a
network interface to convert a large data transfer into multiple TCP
segments to be sent on the network. This functionality can be enabled or
disabled on a per-interface basis with the ``tso`` and ``-tso`` flags to
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.
Network interfaces and drivers supporting TSO currently include
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
and
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__.

FreeBSD now supports auto-sizing of TCP socket buffers. This allows the
socket buffer sizes to adapt dynamically to network conditions, rather
than being set statically. The behavior of this feature can be
controlled using the ``net.inet.tcp.sendbuf_*`` and
``net.inet.tcp.recvbuf_*`` sysctl variables.

The ``net.link.tap.up_on_open`` sysctl variable has been added to the
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver. If enabled, new tap devices will marked ``up`` upon creation.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports the Adaptec 2610SA SATA-RAID controller in some
Hewlett-Packard machines.

The
`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE.

The
`ahd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahd&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE.

The CAM subsystem is now MPSAFE.

The
`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE.

A new ``GEOM_JOURNAL`` class has been added to the GEOM storage
transformation system. It supports block-level journaling operations,
which can be used by file system modules to perform file system
journaling and to keep file systems in a consistent state. (Currently,
only UFS file systems are supported.) Its operation can be controlled
using the
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility.

A new GEOM\_MULTIPATH class has been added to support multiple access
paths to disk devices. The
`gmultipath(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmultipath&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility has been added to control the behavior of disk devices using
this feature.

A new ``GEOM_VIRSTOR`` class has been added to provide virtual storage
devices of arbitrary size with physical devices as backing store. More
information can be found in the manual page for its control utility,
`gvirstor(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvirstor&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.

The GEOM class kernel module ``g_md.ko`` has been renamed to
``geom_md.ko`` for consistency.

[amd64, i386] The
`hptiop(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptiop&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added. It supports the Highpoint RocketRAID 3xxx and
4xxx series of SAS and SATA RAID controllers.

[amd64, i386] The
`hptrr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptrr&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been added, to support several HighPoint RocketRAID
controllers (more details can be found in the manual page). [MERGED]

[amd64, i386] The
`hptmv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptmv&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been updated and now supports amd64 as well as PAE.

The
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE.

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been updated to support various new features such as RAID
volume and RAID member state/settings reporting, periodic volume
re-synchronization status reporting, and sysctl variables for volume
re-synchronization rate, volume member write cache status, and volume
transaction queue depth. [MERGED]

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports SAS HBA (partially), 64-bit PCI, and large data
transfer. [MERGED]

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver is now MPSAFE.

The rr232x(4) driver, which appeared in some older versions of FreeBSD,
is no longer supported, and has been superceded by the
`hptrr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptrr&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver. At the request of Highpoint, the rr232x(4) driver has been
removed. [MERGED]

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver has been updated to the 3.70.03.007 release on the 3ware Web
site. It now supports AMCC's 3ware 9650 series of SATA controllers.
[MERGED]

The
`iscsi\_initiator(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iscsi_initiator&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver, a kernel driver for the Internet SCSI (iSCSI) protocol, has been
added. This driver allows access to remote SCSI devices over TCP/IP
networks. The
`iscontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iscontrol&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
userland utility is used to control the operation of the driver.

The scsi\_sg driver, which emulates a significant subset of the Linux
SCSI SG passthrough device API, has been added. It is intended to allow
programs running under Linux emulation (as well as native FreeBSD
applications) to access the ``/dev/sg*`` devices supported by Linux.
[MERGED]

The
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
driver now supports ``PLAY_MSF``, ``PLAY_TRACK``, ``PLAY_TRACK_REL``,
``PAUSE``, ``PLAY_12`` commands so that the
`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility can handle a USB CD drive.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

A part of the FreeBSD NFS subsystem (the interface with the protocol
stack and callouts, the NFS client side) is now MPSAFE.

The
`pseudofs(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pseudofs&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__
pseudo file system construction kit and all of its consumers
(`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__,
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
and
`linsysfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linsysfs&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__),
are now MPSAFE.

[amd64, i386] Experimental support for the TMPFS file system has been
added. TMPFS is an efficient memory file system originally developed for
the NetBSD project during the Google Summer of Code. More information
can be found in the
`tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
manual page.

The unionfs file system has been re-implemented. This version solves
many crashing and locking issues compared to the previous
implementation. It also adds new “transparent” and “masquerade” modes
for automatically creating files in the upper file system layer of
unions. More information can be found in the
`mount\_unionfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_unionfs&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
manual page. [MERGED]

[amd64, i386, pc98] Support for Sun's ZFS has been added. More
information about this file system can be found in the
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
manual page or on the `OpenSolaris ZFS
page <http://www.opensolaris.org/os/community/zfs/>`__.

Initial (read-only) support for SGI's XFS file system has been added.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

The addr2ascii() and ascii2addr() library calls, originally introduced
by the INRIA IPv6 implementation, have been removed from ``libc``. They
have no consumers in the FreeBSD base system. In a related change,
support for ``AF_LINK`` addresses has been added to
`getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__.

Padding of ``ai_addrlen`` in ``struct addrinfo`` has been removed, which
was originally for the ABI compatibility. For example, this change
breaks the ABI compatibility of the
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
function on 64-bit architectures, including FreeBSD/amd64, FreeBSD/ia64,
and FreeBSD/sparc64.

The
`atrun(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atrun&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility has gained PAM support. Before running a job for a user account,
it will check the account status with PAM and refuse to run the job if
the account is unavailable. The default definition of an unavailable
account includes those expired and administratively locked out with
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.

The
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``readcap`` command to display the size of
devices. [MERGED]

The
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
daemon has gained PAM support. Before running a command from account's
private
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
file, it will check the account status with PAM and skip the command if
the account is unavailable. The default definition of an unavailable
account includes those expired and administratively locked out with
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.
In addition,
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
will skip commands from private
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
files if a
`nologin(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
file exists, unless the
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
owner's login class is exempt from
`nologin(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
restriction. Commands from the system file ``/etc/crontab`` are not
subject to the PAM check.

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
program now supports the Classless Static Route option as described in
RFC 3442.

The
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
programs now attempt to save and restore extended attribute information
on files.

A **libelf** library implementing the SVR4
`elf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=elf&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
/
`gelf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gelf&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
API for manipulating ELF files has been added.

The
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
program now supports a ``-p`` flag to print the slice table in fdisk
configuration format. [MERGED]

T/TCP support in
`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
(and the ``-T`` flag used to enable it) has been removed.

A bug in the
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
program which prevents numeric arguments for ``-user`` and ``-group``
from working as expected has been fixed.

The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
command now supports an ``upgrade`` command to perform binary upgrades
between different versions of FreeBSD. [MERGED]

The
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now has support for RFC2389 (FEAT) and rudimentary support for
RFC2640 (UTF8). The RFC2640 support is optional and can be enabled using
the new ``-8`` flag. More information can be found in the
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
manual page. [MERGED]

The
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
SSP (Stack-Smashing Protector) support is now enabled by default.

The
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports ``-k`` and ``-K`` options to specify a key file in
addition to a passphrase.

The
`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports setting GPT partition labels.

The
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports the ``resetconfig`` sub-command.

An implementation of Generic Security Service API (GSS-API) version 2
and its C binding described in RFC2743 and RFC2744 has been added. This
is a new extensible GSS-API layer which can support GSS-API plugins,
similar to the Solaris implementation, and the Kerberos 5 GSS mechanism
has been rewritten as a plugin library for the new implementation.

The
`hccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hccontrol&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports HCI node autodetection.

The
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now prints the effective user ID after the group ID.

The
`ipfwpcap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfwpcap&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility has been added; it captures packets on a
`divert(4) <http://www.FreeBSD.org/cgi/man.cgi?query=divert&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
socket and writes them as
`pcap(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pcap&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
(also known as
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__)
format data to a file or pipe. [MERGED]

The
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
program now supports printing flags in a system call argument by using
symbol names.

The
`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``-q`` flag to suppress warnings.

`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
now supports a ``-w`` option to open kmem-based targets in read-write
mode. This allows one to use kgdb on ``/dev/mem`` and be able to patch
memory on a live system.

The
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
library now supports POSIX.1e-style Extended Attributes.

The
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
library now contains support for
`ar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ar&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__-style
archives.

The **libc** library now includes initial implementation of symbol maps
and symbol version definitions.

The **libedit** library has been updated from the NetBSD source tree as
of August 2005.

The **libm** library now includes initial implementation of symbol maps
and symbol version definitions.

A new
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
implementation has been introduced. This implementation, sometimes
referred to as “jemalloc”, was designed to improve the performance of
multi-threaded programs, particularly on SMP systems, while preserving
the performance of single-threaded programs. Due to the use of different
algorithms and data structures, jemalloc may expose some
previously-unknown bugs in userland code, although most of the FreeBSD
base system and common ports have been tested and/or fixed. Note that
jemalloc uses
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__
to obtain memory and only uses
`sbrk(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sbrk&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__
under limited circumstances (and then only for 32-bit architectures). As
a result, the ``datasize`` resource limit has little practical effect
for typical applications. The ``vmemoryuse`` resource limit, however,
can be used to bound the total virtual memory used by a process, as
described in
`limits(1) <http://www.FreeBSD.org/cgi/man.cgi?query=limits&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__.

The
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports producing device listings formatted as XML.
Currently, the ``list`` and ``query`` sub-commands support this feature.

The
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility's ``-u`` option now supports specifying multiple devices
separated by comma character.

The
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``-P`` flag to allow skipping the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
process when using a vnode-backed disk.

The
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``-E`` flag to allow to specify location of the
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility instead of using the default one (``/sbin/mdconfig``).

A new function
`memmem(3) <http://www.FreeBSD.org/cgi/man.cgi?query=memmem&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
has been implemented in ``libc``. This is the binary equivalent to
`strstr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strstr&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
and found in ``glibc``.

The
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
``dev`` and ``nodev`` options have been removed.

The
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports
`mqueuefs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=mqueuefs&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__.

A bug which prevents the
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility from converting a read-only mount to read-write via
``mount -u -o rw``, has been fixed.

A number of the file system-specific ``mount_*`` utilities have been
removed, in favor of the more general
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
command with a ``-t`` option. Specifically, these commands are:
``mount_devfs``, ``mount_ext2fs``, ``mount_fdescfs``,
``mount_linprocfs``, ``mount_procfs``, ``mount_std``,
``mount_linsysfs``, ``mount_reiserfs``, and ``mount_umapfs``.

The mrouted(8) multicast routing daemon has been removed from the
FreeBSD base system. It implements the DVMRP multicast routing protocol,
which has largely been replaced by PIM in many multicast installations.
The related map-mbone(8) and mrinfo(8) utilities have also been removed.
These programs are now available in the FreeBSD Ports Collection as
```net/mrouted`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/mrouted/pkg-descr>`__.

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports printing
`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
protocol statistics.

The ``/etc/nsswitch.conf`` file is now installed statically instead of
being generated on every reboot.

The objformat(1) utility and getobjformat(3) library (the last remnants
of a.out object file support) have been removed.

The
`pam\_nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_nologin&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
module no longer provides an authentication function; instead it now
provides an account management function. Third-party files in
``/usr/local/etc/pam.d`` may need manual editing; specifically, lines in
these files of the form:

.. code:: SCREEN

    auth    required        pam_nologin.so  no_warn

These lines need to have the word ``auth`` replaced with the word
``account``.

`nscd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nscd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
has been added. It is a daemon that caches the results of nsswitch
lookups (such as those to the password, group, and services databases)
for improved performance.

The
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``-F`` option which allows to restrict matches to
a process whose PID is stored in the pidfile file. When another new
option ``-L`` is also specified, the pidfile file must be locked with
the
`flock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=flock&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__
syscall or created with
`pidfile(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pidfile&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__.

The
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``-I`` flag which works like ``-i`` of
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__.
When this flag is specified,
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
will ask for confirmation before sending a signal to each matching
process.

The
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
program has seen several enhancements: It can now log over a network
socket to a remote host. The ``-c`` now takes a comma-seperated list of
CPUs to configure for PMC allocation. The ``-t`` option has been
enhanced to take a regular expression for selecting processes based on
their command names.
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
now allocates system PMCs on all CPUs by default, not just CPU 0.

The
`powerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=powerd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
program now supports a ``-P`` option, which specifies a pidfile to use.

The
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
program now supports a ``-M`` option to set the permissions of a user's
newly created home directory. [MERGED]

The DNS resolver library in FreeBSD's **libc** has been updated to that
from BIND 9.4.1.

The
`rpcbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcbind&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
program can now bind its TCP listening socket to an IP address other
than INADDR\_ANY using the ``-h`` flag. The new ``-6`` flag allows it to
bind to IPv6 addresses only.

The
`rpcgen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcgen&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now generates headers and stub files that can be used with ANSI
C compilers by default.

The
`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
and
`rpc.statd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.statd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
programs now accept ``-p`` options to indicate which port they should
bind to. [MERGED]

The
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
runtime linker now supports ELF symbol versioning using GNU semantics.
This implementation aims to be compatible with symbol versioning support
as implemented by GNU libc and documented in
http://people.redhat.com/~drepper/symbol-versioning and LSB 3.0. Also,
``dlvsym()`` function has been added to allow lookups for a specific
version of a given symbol.

The
`sa(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports ``-U`` and ``-P`` flags. They can be used to
specify the per-user and per-process summary file location,
respectively.

The
`sade(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sade&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
disk partitioning and labeling utility has been added. This utility is
based on the partition editing bits of
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.

A bug in the
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility which can cause incorrect calculation of pattern space length in
some cases has been fixed.

The
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports case-insensitive pattern matching; this feature can
be enabled by using the ``I`` flag after the closing delimiter for a
regular expression.

The behavior of the
`setenv(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setenv&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__
family of library calls has been changed from the historic BSD API to
the behavior mandated by POSIX. As a result, several base system utility
that relied on the old API have been updated to track this change.

The ``-h`` flag to
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
now properly sets the ACL on a symbolic link, not the link target.

The
`sockstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sockstat&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility, which shows connected and listening network sockets, now
supports a new ``-P`` command-line option, which can be used to filter
displayed sockets by protocol name (as listed in
`protocols(5) <http://www.FreeBSD.org/cgi/man.cgi?query=protocols&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__).

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``-q`` flag to suppress a limited set of warnings
and errors.

The version of tcpslice in the FreeBSD base system has been removed due
to obsolescence. A more up-to-date version can be found in the Ports
Collection as
```net/tcpslice`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/tcpslice/pkg-descr>`__.

The
`time(1) <http://www.FreeBSD.org/cgi/man.cgi?query=time&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now prints the time that a given command has been running if
sent a ``SIGINFO`` signal.

The
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
program now supports a ``-a`` flag to display process titles from their
argument vectors; this feature is useful for watching processes that
change their titles via
`setproctitle(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setproctitle&sektion=3&manpath=FreeBSD+7.0-RELEASE>`__.

The
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
program now supports a ``-j`` flag to display the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
ID for each process. [MERGED]

The
`touch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=touch&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports a ``-A`` flag that allows the access and
modification times of a file to be adjusted by a specified value.
[MERGED]

The
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports an ``-s`` flag for the same functionality as the
strace utility
(```devel/strace`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/strace/pkg-descr>`__).

The
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility no longer depends on the availability of the
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
file system; it uses the
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2&manpath=FreeBSD+7.0-RELEASE>`__
interface instead for controlling a traced process.

[powerpc] The
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility now supports FreeBSD/powerpc.

The usbd(8) utility has been removed. The
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility and its configuration file now support functionality which is
equivalent to it.

The
`uuidgen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuidgen&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
utility has been moved from ``/usr/bin`` to ``/bin``.

The vnconfig(8) utility, which was long ago replaced by
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__,
has been removed.

The wicontrol(8) utility has been removed. Configuration functions for
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
interfaces should be performed using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__.

The shared library version number of all libraries has been updated due
to some possible ABI changes. The libraries include: snmp\_\ ``*``,
libdialog, libg2c, libobjc, libreadline, libregex, libstdc++, libkrb5,
libalias, libarchive, libbegemot, libbluetooth, libbsnmp, libbz2,
libc\_r, libcrypt, libdevstat, libedit, libexpat, libfetch, libftpio,
libgpib, libipsec, libkiconv, libmagic, libmp, libncp, libncurses,
libnetgraph, libngatm, libopie, libpam, libpthread, libradius, libsdp,
libsmb, libtacplus, libthr, libthread\_db, libugidfw, libusbhid,
libutil, libvgl, libwrap, libypclnt, libm, libcrypto, libssh, and
libssl.

The ``wcsdup()`` function has been implemented. This function is popular
in Microsoft and GNU systems.

The
`wlandebug(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wlandebug&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility has been added to the main FreeBSD source tree (it previously
lived in a tools area). It provides control over a number of types of
debugging output in the
`wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
module and related drivers, and can be useful for debugging wireless
issues.

The
`wpa\_passphrase(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_passphrase&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility has been added. It generates a 256-bit pre-shared WPA key from
an ASCII passphrase. [MERGED]

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``ftpd`` script for stand-alone
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
has been added.

The ``gbde_swap`` script has been removed in favor a new ``encswap``
script which also supports
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
for swap encryption.

The ``geli`` and ``geli2`` scripts has been added for
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
device configuration on boot.

The ``ike`` script for IPsec IKE daemon has been removed because no such
daemon is included in the base system.

The ``mdconfig`` script to handle vnode backed
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__
devices has been added. This is a replacement of the ``ramdisk`` script,
and all of variables in ``ramdisk_*`` have been changed to
``mdconfig_*``. Also, two new
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
variables ``mdconfig_*_files`` and ``mdconfig_*_cmd`` have been added.
For example:

.. code:: PROGRAMLISTING

    mdconfig_md0="-t malloc -s 10m"
    mdconfig_md1="-t vnode -f /var/foo.img"

The ``rcconf.sh`` script in ``/etc/rc.d`` has been removed and a
variable ``early_late_divider``, which designates the script to separate
the early and late stages of the boot process, has been added.

The ``rc.initdiskless`` script now uses
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
instead of
`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
because
`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1&manpath=FreeBSD+7.0-RELEASE>`__
needs a writable temporary directory that may not be available when this
script runs.

The ``pccard`` script has been removed since OLDCARD is deprecated.

The ``sendmail`` script no longer rebuilds the aliases database if it is
missing or older than the aliases file. [MERGED] If desired, set the new
rc.conf option ``sendmail_rebuild_aliases`` to "YES" to restore that
functionality.

The ``removable_interfaces`` variable has been removed.

A new keyword ``NOAUTO`` in ``ifconfig_ifn`` has been added. This
prevents configuration of an interface at boot time or via
``/etc/pccard_ether``, and allows ``/etc/rc.d/netif`` to be used to
start and stop an interface on a purely manual basis.

The ``/etc/rc.d/nfslocking`` script has been deprecated and will be
removed in a future release. It has been replaced by the
``/etc/rc.d/lockd`` and ``/etc/rc.d/statd`` scripts. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**Intel ACPI-CA** has been updated to 20070320.

**awk** has been updated from the 24 April 2005 release to the 1 May
2007 release. [MERGED]

**BIND** has been updated from 9.3.3 to 9.4.2.

**BSNMPD** has been updated from 1.11 to 1.12.

**BZIP2** has been updated from 1.0.3 to 1.0.4. [MERGED]

GNU **Diffutils** has been updated from 2.7 to 2.8.7. [MERGED]

**DRM** has been updated to a snapshot from DRI CVS as of 20060517.
[MERGED]

The Forth Inspired Command Language (**FICL**) used in the boot loader
has been updated to 3.03.

**FILE** has been updated from 4.12 to 4.23.

**GCC** has been updated from 3.4.6 to 4.2.1.

**GNU Readline library** has been updated from 5.0 to 5.2 patch 2.
[MERGED]

The GNU version of **gzip** has been replaced with a modified version of
gzip ported from NetBSD. [MERGED]

**IPFilter** has been updated from 4.1.13 to 4.1.28. [MERGED]

**less** has been updated from v394 to v416. [MERGED]

**libpcap** has been updated from 0.9.4 to 0.9.8.

**netcat** has been updated from the version included in OpenBSD 3.9 to
the version included in OpenBSD 4.1. [MERGED]

**OpenSSL** has been updated from 0.9.7e to 0.9.8e.

**ncurses** has been updated from 5.2-20020615 to 5.6-20061217. ncurses
now also has wide character support. [MERGED]

**hostapd** has been updated from version 0.3.9 to version 0.5.8.

**PF** has been updated from OpenBSD version 3.7 to OpenBSD version 4.1.
This update includes a number of functional enhancements. Two notable
changes are that ``keep state`` is now the default behavior for rules in
`pf.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=pf.conf&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__
and that ``flags S/SA`` is now the default flags setting for TCP rules.
The options ``no state`` and ``flags any`` can be used to disable
stateful filtering or TCP flags checking, respectively.

**sendmail** has been updated from 8.13.8 to 8.14.2. [MERGED]

**tcpdump** has been updated from 3.9.4 to 3.9.8.

The timezone database has been updated from the **tzdata2006g** release
to the **tzdata2007k** release. [MERGED]

**tip** has been updated to a snapshot from OpenBSD as of 20060831.

TrustedBSD **OpenBSM**, has been updated from version 1.0 alpha 12 to
version 1.0.

**WPA Supplicant** has been updated from version 0.3.9 to version 0.5.8.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The default partition sizing algorithm of the
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility has been changed.

-  On systems where the disk capacity is larger than (3 \* RAMsize +
   10GB), the default sizes will now be as follows:

   .. raw:: html

      <div class="INFORMALTABLE">

   +-------------+--------------------------+
   | Partition   | Size                     |
   +=============+==========================+
   | swap        | RAMsize \* 2             |
   +-------------+--------------------------+
   | ``/``       | 512 MB                   |
   +-------------+--------------------------+
   | ``/tmp``    | 512 MB                   |
   +-------------+--------------------------+
   | ``/var``    | 1024 MB + RAMsize        |
   +-------------+--------------------------+
   | ``/usr``    | the rest (8GB or more)   |
   +-------------+--------------------------+

   .. raw:: html

      </div>

-  On systems where the disk capacity is larger than (RAMsize / 8 + 2
   GB), the default sizes will be in the following ranges, with space
   allocated proportionally:

   .. raw:: html

      <div class="INFORMALTABLE">

   +-------------+------------------------------------+
   | Partition   | Size                               |
   +=============+====================================+
   | swap        | from RAMsize / 8 to RAMsize \* 2   |
   +-------------+------------------------------------+
   | ``/``       | from 256MB to 512MB                |
   +-------------+------------------------------------+
   | ``/tmp``    | from 128MB to 512MB                |
   +-------------+------------------------------------+
   | ``/var``    | from 128MB to 1024MB               |
   +-------------+------------------------------------+
   | ``/usr``    | from 1536MB to 8192MB              |
   +-------------+------------------------------------+

   .. raw:: html

      </div>

-  On systems with even less disk space, the existing behavior is not
   changed.

A new ``showconfig`` target has been added in ``src/Makefile`` to show
the build configuration of the FreeBSD source tree.

The ``src.conf`` file, which contains settings that will apply to every
build involving the FreeBSD source tree, has been added. For details,
see
`build(7) <http://www.FreeBSD.org/cgi/man.cgi?query=build&sektion=7&manpath=FreeBSD+7.0-RELEASE>`__
and
`src.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=src.conf&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__.

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.16.1 to 2.20.1. [MERGED]

The supported version of the **KDE** desktop environment
(```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
has been updated from 3.5.4 to 3.5.7. [MERGED]

The supported version of the **Xorg** windowing system
(```x11/xorg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__)
has been updated from 6.9.0 to 7.3.0. [MERGED]

The default value of ``X11BASE`` has been changed from ``/usr/X11R6`` to
``/usr/local``, the default value of ``LOCALBASE``. [MERGED]

The ISO images for FreeBSD are now sized for 700MB CDROM media. For most
prior versions of FreeBSD, they assumed 650MB CDROM media. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7 Documentation
~~~~~~~~~~~~~~~~~

Documentation of existing functionality has been improved by the
addition of the following manual pages:
`acpi\_sony(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_sony&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
`device\_get\_sysctl(9) <http://www.FreeBSD.org/cgi/man.cgi?query=device_get_sysctl&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__,
`ext2fs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ext2fs&sektion=5&manpath=FreeBSD+7.0-RELEASE>`__,
`mca(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mca&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__,
`nanobsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nanobsd&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__,
`snd\_mss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_mss&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
`snd\_t4dwave(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_t4dwave&sektion=4&manpath=FreeBSD+7.0-RELEASE>`__,
`sysctl(9) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=9&manpath=FreeBSD+7.0-RELEASE>`__.

Initial support for kernel subsystem API documentation generating
framework using
```devel/doxygen`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/doxygen/pkg-descr>`__
has been added into ``src/sys/doc/subsys``. To generate the API
document, type ``make doxygen`` in ``src/`` directory.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

[i386, amd64] Beginning with FreeBSD 6.2-RELEASE, binary upgrades
between RELEASE versions (and snapshots of the various security
branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC or SMP kernels distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
utility requires that the host being upgraded have Internet
connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.0-RELEASE>`__
menu on CDROM distribution media. This type of binary upgrade may be
useful on non-i386, non-amd64 machines or on systems with no Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported, according
to the instructions in ``/usr/src/UPDATING``.

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
http://www.FreeBSD.org/snapshots/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 7-STABLE should subscribe to the
<current@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
