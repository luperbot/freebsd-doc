======================================
FreeBSD/pc98 5.3-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 5.3-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.761.2.12.2.3 2004/11/03 10:12:51 hrs Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 5.3-RELEASE contain a summary of the
changes made to the FreeBSD base system since 5.2.1-RELEASE. This
document lists applicable security advisories that were issued since the
last release, as well as significant changes to the FreeBSD kernel and
userland. Some brief remarks on upgrading are also presented.

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
2.2.6 `Contributed Software <#AEN925>`__
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

This document contains the release notes for FreeBSD 5.3-RELEASE on the
NEC PC-98x1 hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

This distribution of FreeBSD 5.3-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `\`\`Obtaining FreeBSD''
appendix <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with \`\`late-breaking''
information discovered late in the release cycle or after the release.
Typically, it contains information on known bugs, security advisories,
and corrections to documentation. An up-to-date copy of the errata for
FreeBSD 5.3-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 5.2.1-RELEASE. In general, changes described here are
unique to the 5-STABLE branch unless specifically marked as [MERGED]
features.

Typical release note items document recent security advisories issued
after 5.3-RELEASE, new drivers or hardware support, new commands or
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

A bug in
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
has been fixed; it caused the creation of a file system snapshot to
reset the flags on the file system to their default values. The possible
consequences depended on local usage, but could include disabling
extended access control lists or enabling the use of setuid executables
stored on an untrusted file system. This bug also affected the
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
-L option, which uses
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.
Note that
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
is normally only available to the superuser and members of the
``operator`` group. For more information, see security advisory
`FreeBSD-SA-04:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:01.mksnap_ffs.asc>`__.

A bug with the System V Shared Memory interface (specifically the
`shmat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmat&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
system call) has been fixed. This bug can cause a shared memory segment
to reference unallocated kernel memory. In turn, this can permit a local
attacker to gain unauthorized access to parts of kernel memory, possibly
resulting in disclosure of sensitive information, bypass of access
control mechanisms, or privilege escalation. More details can be found
in security advisory
`FreeBSD-SA-04:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:02.shmat.asc>`__.
[MERGED]

A programming error in the
`jail\_attach(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail_attach&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
system call has been fixed. This error could allow a process with
superuser privileges inside a
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
environment to change its root directory to that of a different jail,
and thus gain full read and write access to files and directories within
the target jail. More information can be found in security advisory
`FreeBSD-SA-04:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:03.jail.asc>`__.

A potential low-bandwidth denial-of-service attack against the FreeBSD
TCP stack has been prevented by limiting the number of out-of-sequence
TCP segments that can be held at one time. More details can be found in
security advisory
`FreeBSD-SA-04:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:04.tcp.asc>`__.
[MERGED]

A bug in **OpenSSL**'s SSL/TLS ChangeCipherSpec message processing that
could result in a null pointer dereference has been fixed. This could
allow a remote attacker to crash an **OpenSSL**-using application and
cause a denial-of-service on the system. More details can be found in
security advisory
`FreeBSD-SA-04:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:05.openssl.asc>`__.
[MERGED]

A programming error in the handling of some IPv6 socket options within
the
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
system call has been fixed. This allows a local attacker to cause a
system panic, and may allow unauthorized access to parts of kernel
memory, possibly resulting in disclosure of sensitive information,
bypass of access control mechanisms, or privilege escalation. More
details can be found in security advisory
`FreeBSD-SA-04:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:06.ipv6.asc>`__.

Two programming errors in **CVS** have been fixed. They allow a server
to overwrite arbitrary files on the client, and a client to read
arbitrary files on the server when accessing remote CVS repositories.
More details can be found in security advisory
`FreeBSD-SA-04:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:07.cvs.asc>`__.
[MERGED]

A bugfix for **Heimdal** rectifies a problem in which it would not
perform adequate checking of authentication across autonomous realms.
For more information, see security advisory
`FreeBSD-SA-04:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:08.heimdal.asc>`__.
[MERGED]

A programming error in **CVS** which could allow a malicious client to
overwrite arbitrary portions of the server's memory has been fixed. For
more information, see security advisory
`FreeBSD-SA-04:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:10.cvs.asc>`__.
[MERGED]

A potential cache consistency problem of the implementation of the
`msync(2) <http://www.FreeBSD.org/cgi/man.cgi?query=msync&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
system call involving the MS\_INVALIDATE operation has been fixed.
However, as a side effect of closing this security problem, the
MS\_INVALIDATE flag no longer guarantees that all pages in the range are
invalidated. Users who require the old semantics of MS\_INVALIDATE and
are not concerned with the security issue being fixed can set the
vm.old\_msync sysctl to 1 which will revert to the old (insecure)
behavior. For more information, see security advisory
`FreeBSD-SA-04:11 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:11.msync.asc>`__.
[MERGED]

A programming error in the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
system call which results in a failure to verify that an attempt to
manipulate routing tables originated from a non-jailed process has been
fixed. For more information, see security advisory
`FreeBSD-SA-04:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:12.jail.asc>`__.
[MERGED]

A programming error in the handling of some Linux system calls which may
result in memory locations being accessed without proper validation has
been fixed. For more information, see security advisory
`FreeBSD-SA-04:13 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:13.linux.asc>`__.
[MERGED]

A number of programming errors in **CVS** which allow information
disclosure, denial-of-service, or possibly arbitrary code execution,
have been fixed via an upgrade to **CVS** 1.11.17. For more information,
see security advisory
`FreeBSD-SA-04:14 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:14.cvs.asc>`__.

A bug in the CONS\_SCRSHOT
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
has been fixed; it may allow unauthorized access to parts of kernel
memory, possibly resulting in disclosure of sensitive information,
bypass of access control mechanisms, or privilege escalation. For more
information, see security advisory
`FreeBSD-SA-04:15 <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:15.syscons.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

ADAPTIVE\_MUTEXES has been added and enabled by default. This changes
the behavior of blocking mutexes to spin if the thread that currently
owns the mutex is executing on another CPU. This feature can be disabled
explicitly by setting a kernel option NO\_ADAPTIVE\_MUTEXES.

A kernel option ADAPTIVE\_GIANT, which causes the Giant lock to also be
treated in an adaptive fashion when adaptive mutexes are enabled, has
been added. This improves the performance of SMP machines and is enabled
by default on the i386.

The
`bus\_dma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_dma&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
interface now supports transparently honoring the alignment and boundary
constraints in the DMA tag when loading buffers, and
``bus_dmamap_load()`` will automatically use bounce buffers when needed.
In addition, a set of sysctls hw.busdma.\* for
`bus\_dma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_dma&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
statistics has been added.

The
`contigmalloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=contigmalloc&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
function has been reimplemented with an algorithm which stands a
greatly-improved chance of working despite pressure from running
programs. The old algorithm can be used by setting a sysctl
vm.old\_contigmalloc. More details can be found in the
`contigmalloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=contigmalloc&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
manual page.

The
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
path rules now work correctly on directories.

The
`getvfsent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getvfsent&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
API has been removed.

The hw.pci.allow\_unsupported\_io\_range loader tunable has been
removed.

`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
now supports the use of raw sockets from within a jail. This feature is
disabled by default, and controlled by using the
security.jail.allow\_raw\_sockets sysctl.

`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
now supports a new filter EVFILT\_FS to be used to signal generic file
system events to the user space. Currently, mount, unmount, and up/down
status of NFS are signaled.

KDB, a new debugger framework, has been added. This consists of a new
GDB backend, which has been rewritten to support threading, run-length
encoding compression, and so on, and the frontend that provides a
framework in which multiple, different debugger backends can be
configured and which provides basic services to those backends. The
following options have been changed:

-  KDB is enabled by default via the kernel options options KDB, options
   GDB, and options DDB. Both DDB and GDB specify which KDB backends to
   include.

-  WITNESS\_DDB has been renamed to WITNESS\_KDB.

-  DDB\_TRACE has been renamed to KDB\_TRACE.

-  DDB\_UNATTENDED has been renamed to KDB\_UNATTENDED.

-  SC\_HISTORY\_DDBKEY has been renamed to SC\_HISTORY\_KDBKEY.

-  DDB\_NOKLDSYM has been removed. The new DDB backend supports
   pre-linker symbol lookups as well as KLD symbol lookups at the same
   time.

-  GDB\_REMOTE\_CHAT has been removed. The GDB protocol hacks to allow
   this are FreeBSD specific. At the same time, the GDB protocol has
   packets for console output.

KDB also serves as the single point of contact for any and all code that
wants to make use of the debugger functions, such as entering the
debugger or handling of the alternate break sequence. For this purpose,
the frontend has been made non-optional. All debugger requests are
forwarded or handed over to the current backend, if applicable.
Selection of the current backend is done by the debug.kdb.current
sysctl. A list of configured backends can be obtained with the
debug.kdb.available sysctl. One can enter the debugger by writing to the
debug.kdb.enter sysctl.

A new sysctl debug.kdb.stop\_cpus has been added. This controls whether
or not IPI (Inter Processor Interrupts) to other CPUs will be delivered
when entering the debugger, in order to stop them while in the debugger.

A new kernel option MAC\_STATIC which disables internal MAC Framework
synchronization protecting against dynamic load and unload of MAC
policies, has been added.

The
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
policy can now apply only the first matching rule instead of all
matching rules. This feature can be enabled by setting a new sysctl
mac\_bsdextended\_firstmatch\_enabled.

The
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
policy can now log failed attempts to syslog's AUTHPRIV facility. This
feature can be enabled by setting a new sysctl
mac\_bsdextended\_logging.

mballoc has been replaced with mbuma, an Mbuf and Cluster allocator
built on top of a number of extensions to the UMA framework. Due to this
change, the NMBCLUSTERS kernel option is no longer used. The maximum
number of the clusters is still capped off according to maxusers, but it
can be made unlimited by setting the kern.ipc.nmbclusters loader tunable
to zero.

``/dev/kmem``, ``/dev/mem``, and ``/dev/io`` are also provided as kernel
loadable modules now.

A bug in
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
that could cause pages marked as PROT\_NONE to become readable under
certain circumstances has been fixed. [MERGED]

A new kernel option MP\_WATCHDOG has been added; it allows one of the
logical CPUs on a system to be used as a dedicated watchdog to cause a
drop to the debugger and/or generate an NMI to the boot processor if the
kernel ceases to respond. Several sysctls are available to enable the
watchdog running out of the processor's idle thread; a callout is
launched to reset a timer in the watchdog. If the callout fails to reset
the timer for ten seconds, the timeout process will take place. The
debug.watchdog\_cpu sysctl selects which CPU will run the watchdog.

A sysctl debug.leak\_schedlock has been added. This causes a sysctl
handler that incorrectly leaks the holding sched lock, to spin the lock
in order to trigger the watchdog provided by the MP\_WATCHDOG option.

A new loader tunable debug.mpsafenet has been added and enabled by
default. This causes the FreeBSD network stack to operate without the
Giant lock, resulting in performance improvement by increasing
parallelism and decreasing latency in network processing. Note that
enabling one of the
`ng\_tty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_tty&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph node type, KAME IPsec, and IPX/SPX subsystem results in a
boot-time restoration of Giant-enabled network operation, or run-time
warning on dynamic load as these components require Giant lock for
correct operation.

A new kernel option NET\_WITH\_GIANT has been added. This restores the
default value of debug.mpsafenet to 0, and is intended for use on
systems compiled with known unsafe components, or where a more
conservative configuration is desired.

A new loader tunable debug.mpsafevm has been added. This currently
results in almost Giant-free execution of zero-fill page faults.

A devclass level has been added to the dev sysctl tree, in order to
support per-class variables in addition to per-device variables. This
means that dev.foo0.bar is now called dev.foo.0.bar, and it is possible
to to have dev.foo.bar as well.

A new sysctl, kern.always\_console\_output, has been added. It makes
output from the kernel go to the console despite the use of TIOCCONS.

A sysctl kern.sched.name which has the name of the scheduler currently
in use, has been added, and the kern.quantum sysctl has been moved to
kern.sched.quantum for consistency.

The
`pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
bus resource and power management have been updated.

.. raw:: html

   <div class="NOTE">

    **Note:** Although the
    `pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
    bus power state management has been enabled by default, it may cause
    problems on some systems. This can be disabled by setting the
    tunable hw.pci.do\_powerstate to 0.

.. raw:: html

   </div>

The ULE scheduler has been added as an additional scheduler. Note that
the conventional one, which is called 4BSD, is still used as the default
scheduler in the ``GENERIC`` kernel. For the average user, interactivity
is reported to be better in many cases. This means less \`\`skipping''
and \`\`jerking'' in interactive applications while the machine is very
busy. This will not prevent problems due to overloaded disk subsystems,
but it does help with overloaded CPUs. On SMP machines, ULE has per-CPU
run queues which allow for CPU affinity, CPU binding, and advanced
HyperThreading support, as well as providing a framework for more
optimizations in the future. As fine-grained kernel locking continues,
the scheduler will be able to make more efficient use of the available
parallel resources.

A linear search algorithm used in
`vm\_map\_findspace(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vm_map_findspace&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
has been replaced with an O(log n) algorithm built into the map entry
splay tree. This significantly reduces the overhead in
`vm\_map\_findspace(9) <http://www.FreeBSD.org/cgi/man.cgi?query=vm_map_findspace&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__
for applications that
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
many hundreds or thousands of regions.

The loader tunables debug.witness\_\* have been renamed to
debug.witness.\*.

The FreeBSD dynamic and static linker now support Thread Local Storage
(TLS), a **GCC** feature which supports a \_\_thread modifier to the
declaration of global and static variables. This extra modifier means
that the variable's value is thread-local; one thread changing its value
will not affect the value of the variable in any other thread.

The kernel's file descriptor allocation code has been updated, and is
now derived from similar code in OpenBSD.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The
`acpi\_video(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_video&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver has been added to control display switching and backlight
brightness using the ACPI Video Extensions.

The
`cp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver has been added for Cronyx Tau-PCI synchronous serial adapters.

The ``dgb`` (DigiBoard intelligent serial card) driver has been removed
due to breakage. Its replacement is the
`digi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=digi&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver, which supports all the hardware of the ``dgb`` driver.

The
`nmdm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nmdm&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver has been rewritten to improve its reliability.

The ``raid(4)`` driver (RAIDframe disk driver from NetBSD) has been
removed. It is currently non-functional, and would require some amount
of work to make it work under the
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
API in 5-CURRENT.

The
`pcic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcic&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver is no longer maintained and has been removed from the ``GENERIC``
kernel configuration file. The entry had actually been commented out for
a long time.

The ``sx`` driver, which supports Specialix I/O8+ and I/O4+ intelligent
multiport serial controllers, has been added.

The
`ubser(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubser&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
device driver has been added to support BWCT console management serial
adapters.

`ucycom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucycom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver has been added for the Cypress CY7C637xx and CY7C640/1xx families
of USB to RS232 bridges, such as the one found in the DeLorme Earthmate
USB GPS receiver (which is the only device currently supported by this
driver). This driver is not complete because there is no support yet for
flow control and output.

The device driver infrastructure and many drivers have been updated.
Among the changes: many more drivers now use automatically-assigned
major numbers (instead of the old static major numbers); enhanced
functions have been added to support cloning of pseudo-devices; several
changes have been made to the driver API, including a new d\_version
field in struct cdevsw. Note that third-party device drivers will
require recompiling after this change.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The ``meteor`` (video capture) driver has been removed due to breakage
and lack of maintainership.

The Direct Rendering Manager (DRM) code has been updated from the DRI
Project CVS tree as of 26 May 2004. This update includes new PCI IDs and
a new packet for Radeon.

The drivers for various sound cards have been reorganized; device sound
is the generic sound driver, and device snd\_\* are device-specific
sound drivers now. The ``midi`` driver, which supports serial port and
several sound cards, has been removed. More details can be found in the
related manual pages:
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_ad1816(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_ad1816&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_als4000(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_als4000&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_cmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cmi&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_cs4281(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_cs4281&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_csa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_csa&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_ds1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_ds1&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_emu10k1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10k1&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_es137x(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_es137x&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_gusc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_gusc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_maestro3(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_maestro3&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`snd\_solo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_solo&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
and
`snd\_uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_uaudio&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

The
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
(formerly
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__)
driver has been modified to read ``/boot/device.hints`` on startup, to
allow setting of default values for mixer channels. Note that currently
the device driver's name used in ``/boot/device.hints`` is still pcm.
More detailed information and examples can be found in the
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
manual page.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

A short hiccup in the
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver during parameter reconfiguration has been fixed. [MERGED]

The
`fwip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwip&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver, which supports IP over FireWire, has been added. Note that
currently the broadcast channel number is hardwired and MCAP for
multicast channel allocation is not supported. This driver is intended
to conform to the RFC 2734 and RFC 3146 standard for IP over FireWire
and eventually replace the
`fwe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fwe&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver.

`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
now uses the device sysctl tree such as dev.fxp0, and those sysctls can
be set on a per-device basis.

`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
now provides actual control over its capability to receive extended
Ethernet frames, indicated by the VLAN\_MTU interface capability. It can
be toggled from userland with the aid of the vlanmtu and -vlanmtu
options to
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

The ``hea`` (Efficient Networks, Inc. ENI-155p ATM adapter) driver has
been removed due to breakage. Its functionality has been subsumed into
the
`en(4) <http://www.FreeBSD.org/cgi/man.cgi?query=en&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver.

The
`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now natively supports long frames, so it can be used for
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
with full Ethernet MTU size.

The
`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now supports TCP/UDP Transmit/Receive checksum offload. Since
`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
does not compensate the checksum for UDP datagram which can yield to
0x0, UDP transmit checksum offload is disabled by default. This can be
reactivated by setting the special link option link0 with
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

The
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver, which supports Intel PRO/10GBE 10 Gigabit Ethernet cards, has
been added. [MERGED]

A bug that prevents VLAN support in the
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver from working has been fixed. [MERGED]

Several bugs related to
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
support in the
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver have been fixed. [MERGED]

Several bugs related to multicast and promiscuous mode handling in the
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver have been fixed.

The
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now supports
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.
[MERGED]

The
`udav(4) <http://www.FreeBSD.org/cgi/man.cgi?query=udav&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver has been added. It provides support for USB Ethernet adapters
based on the Davicom DM9601 chipset.

The
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver, which supports the VIA Networking Technologies VT6122 Gigabit
Ethernet chip and integrated 10/100/1000 copper PHY, has been added.

The
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now supports
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.
[MERGED]

The hardware TX checksum support in the
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver has been disabled as it does not work correctly and slows down
the transmission rate. [MERGED]

Interface
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
support can now be enabled on a per-interface basis. The following
network drivers support
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__:
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
and
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.
And they now also support this capability and it can be controlled via
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
except for
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

The
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
tunnel driver now supports WCCP version 2.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
rules now support the versrcreach option to verify that a valid route to
the source address of a packet exists in the routing table. This option
is very useful for routers with a complete view of the Internet (BGP) in
the routing table to reject packets with spoofed or unroutable source
addresses. For example,

.. code:: PROGRAMLISTING

    deny ip from any to any not versrcreach

is equivalent to the following in Cisco IOS syntax:
.. code:: PROGRAMLISTING

    ip verify unicast source reachable-via any

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
rules now support the antispoof option to verify that an incoming
packet's source address belongs to a directly connected network. If the
network is directly connected, then the interface on which the packet
came in is compared to the interface to which the network is connected.
When the incoming interface and the directly connected interface are not
the same, the packet does not match. For example:

.. code:: PROGRAMLISTING

    deny ip from any to any not antispoof in

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
rules now support the jail option to associate the rule with a specific
prison ID. For example:

.. code:: PROGRAMLISTING

    count ip from any to any jail 2

Note that this rule currently applies for TCP and UDP packets only.
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
now supports lookup tables. This feature is useful for handling large
sparse address sets. [MERGED]

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
forward rule has to be compiled into the kernel with a kernel option
IPFIREWALL\_FORWARD to enable it.

A new sysctl net.inet.ip.process\_options has been added to control the
processing of IP options. When this sysctl is set to 0, IP options are
ignored and passed unmodified; set to 1, all IP options are processed
(default); and set to 2, all packets with IP options are rejected with
an ICMP filter prohibited message.

Some bugs in the IPsec implementation from the KAME Project have been
fixed. These bugs were related to freeing memory objects before all
references to them were removed, and could cause erratic behavior or
kernel panics after flushing the Security Policy Database (SPD).

`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports multiple instances via a new option globalports. This
allows
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
to bind to different network interfaces and share load.

The
`ng\_atmllc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_atmllc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph node type, which handles RFC 1483 ATM LLC encapsulation, has
been added.

The
`ng\_hub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hub&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph node type, which supports a simple packet distribution that
acts like an Ethernet hub, has been added. [MERGED]

The
`ng\_rfc1490(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_rfc1490&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph node type now supports Cisco style encapsulation, which is
often used alongside RFC 1490 in frame relay links.

The
`ng\_sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_sppp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph node type, which is a
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
interface to the original
`sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
network module for synchronous lines, has been added.

A new Netgraph method has been added to restore some behavior lost in
the change from 4.X style
`ng\_tee(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_tee&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph nodes.

The
`ng\_vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_vlan&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph node type, which supports IEEE 802.1Q VLAN tagging, has been
added. [MERGED]

PFIL\_HOOKS support is now always compiled into the kernel, and the
associated kernel compile options have been removed. All of the packet
filter subsystems that FreeBSD supports now use the PFIL\_HOOKS
framework.

The link state change notification of Ethernet media support has been
added to the routing socket.

Link Quality Monitoring (LQM) support in
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
has been reimplemented. LQM, which is described in RFC 1989, allows PPP
to keep track of the quality of a running connection. [MERGED]

The pseudo-interface cloning has been updated and the match function to
allow creation of
`stf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
interfaces named ``stf0``, ``stf``, or ``6to4``. Note that this breaks
backward compatibility; for example, ``ifconfig stf`` now creates the
interface named ``stf``, not ``stf0``, and does not print ``stf0`` to
stdout.

The following TCP features are now enabled by default: RFC 3042 (Limited
Retransmit), RFC 3390 (increased initial congestion window sizes), TCP
bandwidth-delay product limiting. The sysctls net.inet.tcp.rfc3042,
net.inet.tcp.rfc3390, and net.inet.tcp.inflight.enable for these
features are available. More information can be found in
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

FreeBSD's TCP implementation now includes support for a minimum MSS
(settable via the net.inet.tcp.minmss sysctl variable) and a rate limit
on connections that send many small TCP segments within a short period
of time (via the net.inet.tcp.minmssoverload sysctl variable).
Connections exceeding this limit may be reset and dropped. This feature
provides protection against a class of resource exhaustion attacks.

The TCP implementation now includes partial (output-only) support for
RFC 2385 (TCP-MD5) digest support. This feature, enabled with the
TCP\_SIGNATURE and FAST\_IPSEC kernel options, is a TCP option for
authenticating TCP sessions.
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now includes support for the TCP-MD5 class of security associations.
[MERGED]

The TCP connection reset handling has been improved to make several
reset attacks as difficult as possible while maintaining compatibility
with the widest range of TCP stacks.

The implementation of RFC 1948 has been improved. The time offset
component of an Initial Sequence Number (ISN) now includes random
positive increments between clock ticks so that ISNs will always be
increasing, no matter how quickly the port is recycled.

The random ephemeral port allocation, which comes from OpenBSD, has been
implemented. This is enabled by default and can be disabled by using the
net.inet.ip.portrange.randomized sysctl. [MERGED]

TCP Selective Acknowledgements (SACK) as described in RFC 2018 have been
added. This improves TCP performance over connections with heavy packet
loss. SACK can be enabled with the sysctl net.inet.tcp.sack.enable.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now supports
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
ATA/SATA controllers.

A number of bugs in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver have been fixed. Most notably, master/slave device detection
should work better, and some problems with timeouts should be resolved.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now supports the Promise command sequencer present on all modern
Promise controllers (PDC203\*\* PDC206\*\*).

.. raw:: html

   <div class="NOTE">

    **Note:** This also adds preliminary support for the Promise
    SX4/SX4000 as a \`\`normal'' Promise ATA controller; ATA RAID's are
    supported, but only RAID0, RAID1, and RAID0+1.

.. raw:: html

   </div>

The DA\_OLD\_QUIRKS kernel option, which is for the CAM SCSI disk driver
(`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__),
has been removed. [MERGED]

A bug of the automatic density selection code in the
`fd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fd&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver has been fixed.

A bug in
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
that could result in I/O hangs in some rare cases has been fixed.

A new GEOM\_CONCAT
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class has been added to concatenate multiple disks to appear as a single
larger disk.

A new GEOM\_NOP
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class for various testing purposes has been added.

A new GEOM\_RAID3
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class for RAID3 transformation and
`graid3(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid3&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
userland utility have been added.

A new GEOM\_STRIPE
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class which implements RAID0 transformation has been added. This class
has two modes: \`\`fast'' and \`\`economic''. In fast mode, when very
small stripe size is used, only one I/O request will be sent to every
disk in a stripe; it performs about 10 times faster for small stripe
sizes than economic mode and other RAID0 implementations. While fast
mode is used by default, it consumes more memory than economic mode,
which sends requests each time. Economic mode can be enabled by setting
a loader tunable kern.geom.stripe.fast to 0. It is also possible to
specify the maximum memory that fast mode can consume, by setting the
loader tunable kern.geom.stripe.maxmem.

GEOM Gate, which consists of a new GEOM\_GATE
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class and several GEOM Gate userland utilities
(`ggatel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggatel&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
`ggatec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggatec&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
and
`ggated(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggated&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__),
has been added. It supports exporting devices, including non
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__-aware
devices, through the network.

A new GEOM\_LABEL
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class to detect volume labels on various file systems, such as UFS,
MSDOSFS (FAT12, FAT16, FAT32), and ISO9660, has been added.

A new GEOM\_GPT
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class, which supports GUID Partition Table (GPT) partitions and the
ability to have a large number of partitions on a single disk, has been
added into ``GENERIC`` by default.

A new GEOM\_MIRROR
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class to support RAID1 functionality has been added. The
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
utility can be used for control of this class.

A new GEOM\_UZIP
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class to implement read-only compressed disks has been added. This
currently supports cloop V2.0 disk compression format.

A new GEOM\_VINUM
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
class to support cooperation between
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
and
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
has been added.

The
`ips(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ips&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now supports the recent Adaptec ServeRAID series SCSI controller
cards.

The
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
driver now supports the missing ATAPI MMC commands and handles the
timeout properly. [MERGED]

The
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
volume manager has been updated to use the
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
disk I/O request transformation framework. A ``gvinum`` userland utility
has been added.

Support for LSI-type software RAID has been added.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The EXT2FS file system code now includes partial support for large (>
4GB) files. This support is partial in that it will refuse to create
large files on file systems that have not been upgraded to
EXT2\_DYN\_REV or that do not have the
EXT2\_FEATURE\_RO\_COMPAT\_LARGE\_FILE flag set in the superblock.

A panic in the NFSv4 client has been fixed; this occurred when
attempting operations against an NFSv3/NFSv2-only server.

The MSDOSFS\_LARGE kernel option has been added to support FAT32 file
systems bigger than 128GB. This option is disabled by default. It uses
at least 32 bytes of kernel memory for each file on disk; furthermore it
is only safe to use in certain controlled situations, such as read-only
mount with less than 1 million files and so on. Exporting these large
file systems over NFS is not supported.

The SMBFS client now has support for SMB request signing, which prevents
\`\`man in the middle'' attacks and is required in order to connect to
Windows 2003 servers in their default configuration. As signing each
message imposes a significant performance penalty, this feature is only
enabled if the server requires it; this may eventually become an option
to
`mount\_smbfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_smbfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6 Contributed Software
^^^^^^^^^^^^^^^^^^^^^^^^^^

The **ALTQ framework** has been imported from a KAME snapshot as of 7
June 2004. This import breaks ABI compatibility of struct ifnet and
requires all network drives to be recompiled. Additionally, some of the
networking drivers have been modified to support the ALTQ framework.
Updated drivers are
`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`tun(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tun&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
and
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__.

**IPFilter** has been updated from version 3.4.31 to version 3.4.35
[MERGED].

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

`acpidump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports SSDT tables. Dumping or disassembling the DSDT will now
include the contents if there are any SSDT table as well.

`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -f option to work on files instead of disk partitions.

`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
is now the default
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
utility in the FreeBSD base system. ``/usr/bin/tar`` is a symlink
pointing to ``/usr/bin/bsdtar`` by default. To return to using
``/usr/bin/gtar`` by default, the WITH\_GTAR make variable can be used.

The ``bthidcontrol`` and ``bthidd`` commands, which support Bluetooth
HIDs (Human Interface Devices), have been added.

`col(1) <http://www.FreeBSD.org/cgi/man.cgi?query=col&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`colcrt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=colcrt&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`colrm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=colrm&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`column(1) <http://www.FreeBSD.org/cgi/man.cgi?query=column&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`fmt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fmt&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`join(1) <http://www.FreeBSD.org/cgi/man.cgi?query=join&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`rev(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rev&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
and
`ul(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ul&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now support multibyte characters.

`conscontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=conscontrol&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports set and unset commands which set/unset the virtual console.
unset makes output from the system, such as the kernel
`printf(9) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=9&manpath=FreeBSD+5.3-RELEASE>`__,
always go to the real main console. This is an interface to the tty
ioctl TIOCCONS.

The
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
daemon accepts two new options, -j and -J, to enable time jitter for
jobs to run as unprivileged users and the superuser, respectively. Time
jitter means that
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
will sleep for a small random period of time in the specified range
before executing a job. This feature is intended to smooth load peaks
appearing when a lot of jobs are scheduled for a particular moment.
[MERGED]

`cut(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cut&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__'s
-c, -d, and -f options now work correctly in locales with multibyte
characters.

`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports an iso8601 option keyword to print dates in ISO 8601
format.

`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -p option to create a PID file.

`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a fillchar option to specify an alternative padding
character when using a conversion mode, or when using noerror with sync
and an input error occurs.

`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -c option to display a grand total of statistics for file
systems.

A bug in
`df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
which can print invalid information when a -t option is specified and a
mount point is not accessible by the calling user, has been fixed.

The ``doscmd`` utility has been removed from the FreeBSD base system. It
is now available via the
```emulators/doscmd`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/doscmd/pkg-descr>`__
port in the FreeBSD Ports Collection.

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now support a -P option to specify backup methods other than files and
tapes. The argument is passed to a normal
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
pipeline with either the $DUMP\_VOLUME or $RESTORE\_VOLUME environment
variable defined, respectively. For more information, see
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

The
`eeprom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=eeprom&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
utility to display and modify system configurations stored in EEPROM or
NVRAM has been added. The current implementation supports systems
equipped with Open Firmware.

The
`fdcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdcontrol&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
`fdformat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdformat&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
and
`fdread(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdread&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
utilities now work on FreeBSD/pc98.

`fgetwln(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fgetwln&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
function, a wide character version of
`fgetln(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fgetln&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__,
has been added.

The
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
utility now supports a -acl primary to locate files with
`acl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=acl&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__.

The
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
utility now supports a new primary -depth n which tests whether the
depth of the current file relative to the starting point of the
traversal is n. [MERGED]

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now opens a socket for a data transfer in active mode using the
effective UID of the current user, not ``root``. This is useful for
matching anonymous FTP data traffic with a single
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
rule with uid.

The
`ftw(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ftw&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
and
`nftw(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nftw&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
functions to traverse a directory hierarchy have been implemented.

The
`geom(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
utility for operating on
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
classes from the userland has been added.

`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
a GUID partition table maintenance utility, now supports a remove
command. Its add command now supports a -i option, which allows the user
to specify the partition number of a new partition.

`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -M option to print the MAC label of the current process.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports renaming of network interfaces at run-time using the name
parameter.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now prints the
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
status on the interface. [MERGED]

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now provides the vlanmtu and -vlanmtu options, which control the
capability of some Ethernet interfaces to receive extended frames (i.e.
frames containing more than 1500 bytes of payload).

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now provides the vlanhwtag and -vlanhwtag options, which control the
capability of some Ethernet interfaces to process VLAN tags in the
hardware.

`indent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=indent&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -ldi option to control indentation of local variables. A
number of other tunings were made to this utility.

`indent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=indent&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports -fbs and -ut for function declarations with the opening
brace on the same line as the declaration of arguments all spaces and no
tabs in order to fix problem when non-8 space tabs are used.

`ip6fw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6fw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -n flag to stop it from making any changes to the rules
in the kernel.

`ipcs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ipcs&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -u option to display information about IPC mechanisms
owned by the specified user.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -b flag to print only the action and comment for each
rule, thus omitting the rule body.

`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -U option to run a command as a user which exists only in
the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
environment.

`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -l option to clean the environment. All environment
variables are discarded except for HOME, SHELL, PATH, TERM, and USER
before running the jailed program under a specific user's credentials.
This behavior is similar to that provided by the
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
-l option.

`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
a kernel debugging utility which uses **libgdb** and understands kernel
threads, kernel modules, and
`kvm(3) <http://www.FreeBSD.org/cgi/man.cgi?query=kvm&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__,
has been added.

`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -e flag to make the -u operate on effective, rather than
real, user IDs. [MERGED]

`libalias(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libalias&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
now has support (and a new API) for multiple aliasing instances in a
single process. The existing API has been reimplemented in terms of the
new one to preserve compatibility.

A **libarchive** library for manipulation of compressed and uncompressed
archive files has been added. More details can be found in
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__.

**libdisk** now uses the correct PC98 disk partition value for FreeBSD.
This permits the
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
disk partition editor to correctly create a single FreeBSD partition
covering the entire disk. [MERGED]

**libdisk** now uses d\_addr\_t for disk addresses. This allows
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
to properly handle disks and file systems more than 1 TB.

The library formerly known as **libkse** has been renamed **libpthread**
and is now the default threading library on the i386, amd64, and ia64
platforms. **GCC**'s -pthread option has been changed to use
**libpthread** rather than **libc\_r**.

.. raw:: html

   <div class="NOTE">

    **Note:** Users with older binaries (for example, ports compiled
    before this change was made) should use
    `libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
    to map **libc\_r** and/or **libkse** to **libpthread**.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Note:** Users with NVIDIA-supplied drivers and libraries may need
    to use a
    `libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
    that maps **libpthread** references to the older **libc\_r** since
    these drivers and utilities do not work with **libpthread**.

.. raw:: html

   </div>

**libpthread** now supports a LIBPTHREAD\_SYSTEM\_SCOPE environment
variable to force 1:1 mode (using system scope threads). Note that
building **libpthread** with -DSYSTEM\_SCOPE\_ONLY flag also forces 1:1
mode, and that this option is set by default for architectures that do
not support M:N mode yet. In addition, a LIBPTHREAD\_PROCESS\_SCOPE
environment variable can be used to force M:N mode (using process scope
threads). For example:

.. code:: SCREEN

    % env LIBPTHREAD_SYSTEM_SCOPE=yes threaded_app

forces the application threaded\_app to use system scope threads, and

.. code:: SCREEN

    % env LIBPTHREAD_PROCESS_SCOPE=yes threaded_app

forces it to use process scope threads.

A bug in the -d option of
`look(1) <http://www.FreeBSD.org/cgi/man.cgi?query=look&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
has been fixed. Also,
`look(1) <http://www.FreeBSD.org/cgi/man.cgi?query=look&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now works correctly in locales with multibyte characters.

`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now treats filenames as multibyte character strings according to the
current LC\_CTYPE when determining which characters are printable.

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports the new .warning directive.

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports the POSIX-compatible + flag in ``Makefile`` command lines,
which causes a line to be executed even when -n is specified. This is
useful for calls to submakes, for example.

`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now puts variable assignments from the command line into the MAKEFLAGS
variable as required by POSIX. This causes such variables to be pushed
into all sub-makes called by the
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
(except when the MAKEFLAGS variable is explicitly changed in the
sub-make's environment). This makes them also mostly un-overrideable in
sub-makes except on the sub-make's command line.

The
`nearbyint(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nearbyint&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
and
`nearbyintf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nearbyintf&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
C99 functions have been implemented.

The ``tgmath.h`` C99 header has been implemented. This provides
type-generic macros for the ``math.h`` and ``complex.h`` functions that
have float, double and long double implementations.

The GNU extensions of
`mbsnrtowcs(3) <http://www.FreeBSD.org/cgi/man.cgi?query=mbsnrtowcs&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
and
`wcsnrtombs(3) <http://www.FreeBSD.org/cgi/man.cgi?query=wcsnrtombs&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
have been implemented.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now allows users to set a debugging option via the ``newsyslog.conf``
file.

`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
uses a new order when processing files to rotate. It first rotates all
files that need to be rotated, then sends a single signal to each
process which needs to be signaled, and finally compresses all the files
that were rotated.

A
`nextwctype(3) <http://www.FreeBSD.org/cgi/man.cgi?query=nextwctype&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
function to iterate over all characters in a particular character class
has been added.

Initial support for UTF-8 versions of all the currently supported system
locales has been added. This is primarily for the benefit of the
```misc/utf8locale`` <http://www.FreeBSD.org/cgi/url.cgi?ports/misc/utf8locale/pkg-descr>`__
port.

An Israel Hebrew locale he\_IL.UTF-8 has been added.

The
`logins(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logins&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
utility has been added to display information about user and system
accounts.

`mountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mountd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports the -p option, which allows users to specify a known port
for use in firewall rulesets.

`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now displays the multicast group memberships present in the system.

`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
and
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now support a -l flag to enable them to set the MAC multilabel flag on
new file systems without requiring the use of
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

`nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now reports login attempts via
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.

`nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
has been moved from ``/sbin/nologin`` to ``/usr/sbin/nologin``.
``/sbin/nologin`` remains as a symbolic link for backward compatibility.

A bugfix has been applied to NSS support, which fixes problems when
using third-party NSS modules (such as
```net/nss_ldap`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/nss_ldap/pkg-descr>`__)
and groups with large membership lists.

`od(1) <http://www.FreeBSD.org/cgi/man.cgi?query=od&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now has POSIX-style support for multibyte characters.

`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
has been replaced with a BSD-licensed version from OpenBSD. This
includes a --posix option for strict POSIX conformance.

The
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
and
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
commands, which come from NetBSD, have been added. They also support a
-M option to extract values associated with the name list from the
specified core instead of the default ``/dev/kmem``, and a -N option to
extract the name list from the specified system instead of the default
kernel.

`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a \`\`set rad\_alive N'' command to enable periodic RADIUS
accounting information being sent to the RADIUS server. [MERGED]

`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a \`\`set pppoe [standard\|3Com]'' command to configure the
operating mode of an underlying
`ng\_pppoe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_pppoe&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
Netgraph node.

`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
compatibility with POSIX/SUSv3 has been improved. The changes include -p
for a list of process IDs, -t for a list of terminal names, -A which is
equivalent to -ax, -G for a list of group IDs, -X which is the opposite
of -x, and some minor improvements. For more information, see
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__.
[MERGED]

`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -O emul format option, which prints the name of the
system call emulation environment the process is in.

`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -H option, which accepts an encrypted password on a file
descriptor. [MERGED]

A bug in
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
that prevents it from working properly when a interface has more than
one IP address has been fixed. [MERGED]

`regex(3) <http://www.FreeBSD.org/cgi/man.cgi?query=regex&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
now supports regular expression matching aware of multibyte characters.

The configuration files used by the
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
now support the timeout: and attempts: keywords.

The
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
and associated interfaces are now much more reentrant and thread-safe.
Multiple DNS lookups can now be run at the same time, showing major
improvements in the performance of some multi-threaded applications.
Some multi-threaded programs need to be recompiled; examples from the
Ports Collection are
```www/mozilla`` <http://www.FreeBSD.org/cgi/url.cgi?ports/www/mozilla/pkg-descr>`__
and variants,
```mail/evolution`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/evolution/pkg-descr>`__,
```devel/gnomevfs`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs/pkg-descr>`__,
and
```devel/gnomevfs2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs2/pkg-descr>`__.

`rmdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rmdir&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -v flag, which makes it verbose.

`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now works correctly for dump files larger than 2GB.

A bug in
`script(1) <http://www.FreeBSD.org/cgi/man.cgi?query=script&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
has been fixed so that it now works correctly if the standard input is
closed. This fix prevents a potentially dangerous interaction with the
```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__
package; if it was run non-interactively, it could remove all
out-of-date ports without reinstalling them.

The
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
Bluetooth Service Discovery Protocol daemon has been added.

`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__'s
y (translate) command now supports multibyte characters.

The
`sha1(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha1&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
and
`rmd160(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rmd160&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
utilities have been added. Similar to
`md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__,
they calculate a message digest of their inputs. [MERGED]

`smbmsg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=smbmsg&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
a small utility to send/receive SMBus messages, has been added.

`talk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=talk&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now uses ``localhost`` as a default machine name in
`talkd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=talkd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
request packets when the destination and source are local. This makes
`talk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=talk&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
dependent on a valid host entry for ``localhost`` in ``/etc/hosts`` or
the DNS.

`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
now supports two new options: a -w option allows new files to be
created, and a -U option allows the umask to be set.

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
can now display the current amount of I/O. This feature can be enabled
by hitting \`\`m'' or passing the command line option -m io.

Many userland utilities in the base system (mostly GNU contributed
utilities) now use the system version of
`getopt\_long(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getopt_long&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__,
rather than the GNU version.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``diskless`` script has been split out into ``hostname``,
``resolve``, ``tmp``, and ``var`` scripts.

The ``gbde_swap`` script, which supports gbde-enabled swap devices, has
been added. When the gbde\_swap\_enable variable is specified in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__,
a swap device named ``/dev/foo.bde`` in
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
is automatically attached at boot time with the device ``/dev/foo`` and
a random key, which is generated by computing the MD5 checksum of 512
bytes read from ``/dev/random``. Note that this prevents recovery of
kernel dumps.

The ip6addrctl\_enable and ip6addrctl\_verbose variables have been
added. When ip6addrctl\_enable is set to YES, the address selection
policy is installed into the kernel. If ``/etc/ip6addrctl.conf`` exists,
it will be used; otherwise, a default policy will be installed. The
default policy is one described in RFC 3484 when ipv6\_enable is set to
YES. Otherwise, the priority policy for IPv4 address will be used as a
default policy.

The ``mixer`` script has been added. It saves the current settings of
all audio mixers present in the system on shutdown and restores the
settings on boot.

The ``named`` script has been updated to support **BIND 9** in the base
system. The changes include:

-  `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   runs in a
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
   directory ``/var/named`` by default. The named\_chrootdir variable
   can be used to disable this behavior or to change the
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+5.3-RELEASE>`__
   directory.

-  When the named\_chroot\_autoupdate variable is set to YES (the
   default), the chroot directory is automatically configured at the
   boot time. A symbolic link which points to ``/var/named/etc/namedb``
   is created as ``/etc/namedb``, and a symbolic link which points to
   ``/var/named/var/run/named/pid`` is created as
   ``/var/run/named/pid``. The latter can be disabled by using the
   named\_symlink\_enable variable in ``rc.conf``.

-  The ``rndc.key`` file is automatically created if it does not exist.

The ``pf`` and ``pflog`` scripts for
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
have been added.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

The **ACPI-CA** code has been updated from the 20030619 snapshot to the
20040527 snapshot.

The **AMD (am-utils)** has been updated from version 6.0.9 to version
6.0.10p1.

**awk** from Bell Labs has been updated from the 29 July 2003 release to
the 7 February 2004 release.

**BIND** has been updated from version 8.3.1-REL to version 9.3.0.

**CVS** has been updated from version 1.11.15 to version 1.11.17.
[MERGED]

The **FILE** has been updated from version 3.41 to version 4.10.

**gdtoa** (a library that performs conversions of numbers between binary
and decimal form) has been updated from version 20030324 to version
20040118.

**GDB** has been updated to version 6.1.1.

**GNU Binutils** has been updated to a 23 May 2004 snapshot from the FSF
2.15 branch.

**GNU GCC** has been updated from 3.3.3-prerelease as of 6 November 2003
to 3.4.2-prerelease as of 28 July 2004.

**GNU grep** has been updated from version 2.4d to version 2.5.1.

**GNU less** has been updated from version 371 to version 381.

**GNU readline** 4.3 has been updated with official patches 001 through
005.

The **GNU regex** library has been updated to the version included with
**GNU grep** 2.5.1.

**GNU sort** has been updated from textutils 2.1 to a coreutils snapshot
as of 12 August 2004.

The **GNU tar** implementation in the base system is now called
``gtar``.

**Heimdal Kerberos** has been updated from version 0.6 to version 0.6.1.

The **ISC DHCP** client has been updated from version 3.0.1 RC10 to
version 3.0.1.

**libpcap** has been updated from version 0.7.1 to version 0.8.3.

**lukemftpd** has been updated from a snapshot as of 3 November 2003 to
one as of 9 August 2004.

**NTP** has been updated from version 4.1.1a to version 4.2.0.

**OpenPAM** has been updated from the Dogwood release to the Eelgrass
release.

**OpenSSH** has been updated from version 3.6.1p1 to version 3.8.1p1.

.. raw:: html

   <div class="NOTE">

    **Note:** The configuration defaults for
    `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
    have been changed. SSH protocol version 1 is no longer enabled by
    default. In addition, password authentication over SSH is disabled
    by default if PAM is enabled.

.. raw:: html

   </div>

**OpenSSL** has been updated from version 0.9.7c to version 0.9.7d.
[MERGED]

**OpenSSL** VIA C3 Nehemiah PadLock ACE (Advanced Cryptography Engine)
crypto support, which provides Advanced Encryption Standard (AES)
encryption, has been imported from a prerelease version of **OpenSSL**.

**pf**, OpenBSD's packet filter as of OpenBSD 3.5-stable, has been
imported into the FreeBSD source tree and is now installed by default.
Two new users (``proxy`` and ``_pflogd``) and three new groups
(``authpf``, ``proxy``, and ``_pflogd``), which **pf** needs, have been
added as well.

.. raw:: html

   <div class="NOTE">

    **Note:** On upgrading from source, these user accounts must be
    added in advance. mergemaster -p can be used to assist in creating
    the proper entries in the
    `passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
    and
    `group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
    files. The NO\_PF variable in ``make.conf`` can be used to prevent
    **pf** from building.

.. raw:: html

   </div>

Several userland utilities of OpenBSD's **pf** have been imported.
`ftp-proxy(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp-proxy&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
is an ftp proxy for
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__,
`pfctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pfctl&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
is an equivalent to
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
`pflogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pflogd&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
is a daemon which logs packets via if\_pflog in
`pcap(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pcap&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
format, and
`authpf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=authpf&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
is an authentication shell to modify
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
rulesets.

**routed** has been updated from release 2.22 to release 2.27 from
rhyolite.com. Note that for users relying on RIP's MD5 authentication
feature,
`routed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=routed&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
routed is now incompatible with previous versions of FreeBSD; however,
it is now compatible with implementations from Sun, Cisco and other
vendors.

**sendmail** has been updated from version 8.12.10 to version 8.13.1.
[MERGED]

**tcpdump** has been updated from version 3.7.1 to version 3.8.3.

**tcsh** has been updated from version 6.11 to version 6.13.00.

The timezone database has been updated from ``tzdata2003a`` to
``tzdata2004e``.

**zlib** has been updated from version 1.1.4 to version 1.2.1.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Most of the startup/shutdown scripts installed by various ports now use
the new
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
framework introduced in FreeBSD 5.X, while some ports still use the
old-style scripts. On startup, the new
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
style scripts are executed before the old-style scripts. On shutdown,
exactly the reverse happens.

The SIZE attribute for distfiles, which can be used for checking file
sizes before fetching, has been added and enabled by default.
DISABLE\_SIZE is a user control knob to disable the distfile size
checking. This is especially useful on old FreeBSD versions which did
not have
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
support for this, and for some FTP proxies which always report incorrect
or bogus sizes.

Two new files have been added to the ports tree to track noteworthy
changes: ``ports/CHANGES`` lists major changes to the Ports Collection
and its infrastructure. ``ports/UPDATING`` describes some potential
pitfalls that can be encountered when updating certain ports, analogous
to ``src/UPDATING`` for the base system.

The version number parsing code has been rewritten in the system
``pkg_*`` tools, restoring compatibility with 4.x and
```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__.

The package tools can now match packages with relational operators and
csh-style {...} choices. For example:

.. code:: SCREEN

    # pkg_info -I 'docbook>=3.0'

will list (all) docbook DTDs with at least version 3.0. Additional
command line options have also been added to aid pattern matching.

The package tools have improved handling of corrupt package databases.

`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -S option to make all @cwd paths be prefixed during
package creation.

`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
now supports a -j option to show the requirements script for each
package.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The building process for boot floppy images has been completely
overhauled. The most significant change is that the loader now boots a
stock ``GENERIC`` kernel split across multiple disks (two at the time of
this writing). This greatly improves installations that begin with a
boot from floppy disk, because they now use exactly the same kernel (and
thus support the same hardware) as CDROM installations. The
stripped-down ``MFSROOT`` kernel is no longer needed, and the
``mfsroot`` image no longer requires kernel modules. The ``boot.flp``
and ``driver.flp`` images are also obsolete and no longer built.

FreeBSD cryptography support is no longer an optional component of
releases, and the crypto release distribution is now part of base. Note
that the -DNOCRYPT build option still exists for anyone who really wants
to build non-cryptographic binaries.

The supported release of **GNOME** has been updated from version 2.4 to
version 2.6.2.

.. raw:: html

   <div class="NOTE">

    **Note:** If you are using the older **GNOME** desktop itself
    (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__),
    simply upgrading it from the FreeBSD Ports Collection with
    `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__
    (```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__)
    will cause serious problems. If you are a **GNOME** desktop user,
    please read the instructions carefully at
    http://www.FreeBSD.org/gnome/docs/faq26.html, and use the
    ``gnome_upgrade.sh`` script to properly upgrade to **GNOME** 2.6.

    Note that if you are just a casual user of some of the **GNOME**
    libraries,
    `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__
    should be sufficient to update your ports.

.. raw:: html

   </div>

The supported release of **KDE** has been updated from version 3.1.4 to
version 3.3.0.

The
```security/portaudit`` <http://www.FreeBSD.org/cgi/url.cgi?ports/security/portaudit/pkg-descr>`__
utility has been added to the FreeBSD Ports Collection. This utility
will read a database containing known ports vulnerabilities and report
them to the administrator.

FreeBSD now uses **Xorg** instead of **XFree86** as the default X Window
System. The supported release is **Xorg** X11R6.7.0. Note that
**XFree86** is also available in the FreeBSD Ports Collection
(```x11/XFree86-4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/XFree86-4/pkg-descr>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7 Documentation
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

Users with existing FreeBSD systems are *highly* encouraged to read the
\`\`FreeBSD 5.3-RELEASE Migration Guide''. This document generally has
the filename ``MIGRATE5.TXT`` on the distribution media, or any other
place that the release notes can be found. It offers some notes on
migrating from FreeBSD 4.X, but more importantly, also discusses some of
the relative merits of upgrading to FreeBSD 5.X versus running FreeBSD
4.X.

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
ftp://ftp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
