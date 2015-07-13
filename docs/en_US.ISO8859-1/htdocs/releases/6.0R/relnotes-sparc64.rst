=========================================
FreeBSD/sparc64 6.0-RELEASE Release Notes
=========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/sparc64 6.0-RELEASE Release Notes
=========================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.883.2.7.2.1 2005/10/21 16:01:46 yar Exp $

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

The release notes for FreeBSD 6.0-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 6-STABLE development
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
2.2.6 `Contributed Software <#AEN874>`__
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

This document contains the release notes for FreeBSD 6.0-RELEASE on the
UltraSPARC hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

This distribution of FreeBSD 6.0-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
6.0-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 5.4-RELEASE. In general, changes described here are unique
to the 6-STABLE branch unless specifically marked as [MERGED] features.

Typical release note items document recent security advisories issued
after 5.4-RELEASE, new drivers or hardware support, new commands or
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

A bug in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility, which allows a malicious HTTP server to cause arbitrary
portions of the client's memory to be overwritten, has been fixed. For
more information, see security advisory
`FreeBSD-SA-04:16.fetch <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:16.fetch.asc>`__.
[MERGED]

A bug in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__
and
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__
which could allow a malicious local user to read parts of kernel memory
or perform a local denial of service attack by causing a system panic,
has been fixed. For more information, see security advisory
`FreeBSD-SA-04:17.procfs <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:17.procfs.asc>`__.
[MERGED]

Two buffer overflows in the TELNET client program have been corrected.
They could have allowed a malicious TELNET server or an active network
attacker to cause
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
to execute arbitrary code with the privileges of the user running it.
More information can be found in security advisory
`FreeBSD-SA-05:01.telnet <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:01.telnet.asc>`__.
[MERGED]

An information disclosure vulnerability in the
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__
system call, which could permit it to transmit random parts of kernel
memory, has been fixed. More details are in security advisory
`FreeBSD-SA-05:02.sendfile <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:02.sendfile.asc>`__.
[MERGED]

An information leak vulnerability in the ``SIOCGIFCONF``
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__,
which leaked 12 bytes of kernel memory, has been fixed. More details are
in security advisory
`FreeBSD-SA-05:04.ifconf <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:04.ifconf.asc>`__.
[MERGED]

Several programming errors in
`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__,
which could potentially cause arbitrary code to be executed on CVS
servers, have been corrected. Further information can be found in
security advisory
`FreeBSD-SA-05:05.cvs <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:05.cvs.asc>`__.
[MERGED]

An error in the default permissions on the ``/dev/iir`` device node,
which allowed unprivileged local users can send commands to the hardware
supported by the
`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver, has been fixed. For more information, see security advisory
`FreeBSD-SA-05:06.iir <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:06.iir.asc>`__.
[MERGED]

A bug in the validation of
`i386\_get\_ldt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=i386_get_ldt&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__
system call input arguments, which may allow kernel memory to be
disclosed to a user process, has been fixed. For more information, see
security advisory
`FreeBSD-SA-05:07.ldt <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:07.ldt.asc>`__.
[MERGED]

Several information disclosure vulnerabilities in various parts of the
kernel have been fixed. For more information, see security advisory
`FreeBSD-SA-05:08.kmem <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:08.kmem.asc>`__.
[MERGED]

A bug in the
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility which allows a malicious remote user to cause a
denial-of-service by using specially crafted packets, has been fixed.
For more information, see security advisory
`FreeBSD-SA-05:10.tcpdump <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:10.tcpdump.asc>`__.
[MERGED]

Two problems in the
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility have been fixed. These may allow a local user to modify
permissions of arbitrary files and overwrite arbitrary local files when
uncompressing a file. For more information, see security advisory
`FreeBSD-SA-05:11.gzip <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:11.gzip.asc>`__.
[MERGED]

A bug in **BIND 9** DNSSEC has been fixed. When DNSSEC is enabled, this
bug may allow a remote attacker to inject a specially crafted packet
which will cause
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
to terminate. For more information, see security advisory
`FreeBSD-SA-05:12.bind9 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:12.bind9.asc>`__.
[MERGED]

A bug has been fixed in
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
that could cause packets to be matched incorrectly against a lookup
table. This bug only affects SMP machines or UP machines that have the
``PREEMPTION`` kernel option enabled. More information is contained in
security advisory
`FreeBSD-SA-05:13.ipfw <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:13.ipfw.asc>`__.
[MERGED]

Two security-related problems have been fixed in
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__.
These include a potential denial of service and unauthorized
manipulation of file permissions. For more information, see security
advisory
`FreeBSD-SA-05:14.bzip2 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:14.bzip2.asc>`__.
[MERGED]

Two problems in FreeBSD's TCP stack have been fixed. They could allow
attackers to stall existing TCP connections, creating a
denial-of-service situation. More information is contained in security
advisory
`FreeBSD-SA-05:15.tcp <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:15.tcp.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The kernel debugger
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
now supports a ``show alllocks`` command, which dumps a list of
processes and threads currently holding sleep mutexes (and spin mutexes
for the current thread). [MERGED]

The
`ichsmb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ichsmb&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now available as a loadable kernel module.

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
feature now supports a new sysctl ``security.jail.chflags_allowed``,
which controls the behavior of
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
within a jail. If set to ``0`` (the default), then a jailed ``root``
user is treated as an unprivileged user; if set to ``1``, then a jailed
root user is treated the same as an unjailed ``root`` user. [MERGED]

A sysctl ``security.jail.getfsstatroot_only`` has been renamed to
``security.jail.enforce_statfs`` and now supports the following
policies:

.. raw:: html

   <div class="INFORMALTABLE">

+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Value   | Policy                                                                                                                                                                                                                                  |
+=========+=========================================================================================================================================================================================================================================+
| 0       | Show all mount-points without any restrictions.                                                                                                                                                                                         |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1       | Show only mount-points below jail's chroot and show only part of the mount-point's path (for example, if the jail's chroot directory is ``/jails/foo`` and mount-point is ``/jails/foo/usr/home``, only ``/usr/home`` will be shown).   |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 2       | Show only mount-point where jail's chroot directory is placed.                                                                                                                                                                          |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

The loader tunable ``debug.mpsafevm`` has been enabled by default.
[MERGED]

`memguard(9) <http://www.FreeBSD.org/cgi/man.cgi?query=memguard&sektion=9&manpath=FreeBSD+6.0-RELEASE>`__,
a kernel memory allocator designed to help detect “tamper-after-free”
scenarios, has been added. This must be explicitly enabled via
``options DEBUG_MEMGUARD``, plus small kernel modifications. It is
generally intended for use by kernel developers.

``struct ifnet`` and the network interface API have been changed. Due to
ABI incompatibility, all drivers not in the FreeBSD base system need to
be updated to use the new API and recompiled.

A number of bugs have been fixed in the ULE scheduler. [MERGED]

Fine-grained locking to allow much of the VFS stack to run without the
Giant lock has been added. This is enabled by default on the alpha,
amd64, and i386 architectures, and can be disabled by setting the loader
tunable (and sysctl variable) ``debug.mpsafevfs`` to ``0``.

System V IPC objects (message queues, semaphores, and shared memory) now
have support for Mandatory Access Control policies, notably
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`mac\_stub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_stub&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
and
`mac\_test(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_test&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.

The
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
MIBs beginning with “debug” now require the kernel option
``options SYSCTL_DEBUG``. This option is disabled by default.

The generic
`tty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tty&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver interface has been added and many device drivers including
`cx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cx&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}x``),
`cy(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cy&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}c``),
`digi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=digi&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}D``),
`rc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}m``),
`rp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rp&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}R``),
`sab(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sab&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}z``),
`si(4) <http://www.FreeBSD.org/cgi/man.cgi?query=si&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}A``),
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}d``), sx (``{tty,cua}G``),
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}u``),
`ubser(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubser&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}y``),
`ucom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucom&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}U``), and
`ucycom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucycom&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(``{tty,cua}y``) have been rewritten to use it. Note that
``/etc/remote`` and ``/etc/ttys`` have been updated as well.

The
`vkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vkbd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver has been added. This driver provides a software loopback
mechanism that can implement a virtual AT keyboard similar to what the
`pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver does for terminals.

The maximum length of shell commands has changed from 128 bytes to
``PAGE_SIZE``. By default, this value is either 4KB (i386, pc98, amd64,
and powerpc) or 8KB (sparc64 and ia64). As a result, compatibility
modules need to be rebuilt to stay synchronized with data structure
changes in the kernel.

A new tunable ``vm.blacklist`` has been added. This can hold a space or
comma separated list of physical addresses. The pages containing these
physical addresses will not be added to the free list and thus will
effectively be ignored by the FreeBSD VM system. The physical addresses
of any ignored pages are listed in the message buffer as well.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

The ``autoboot`` loader command now supports the prompt parameter.

The ``autoboot`` loader command will now prevent the user from
interrupting the boot process at all if the ``autoboot_delay`` variable
is set to ``-1``. [MERGED]

A loader menu option to set ``hint.atkbd.0.flags=0x1`` has been added.
This setting allows USB keyboards to work if no PS/2 keyboard is
attached.

The beastie boot menu has been disabled by default.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The
`atkbdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbdc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
and
`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
drivers have been rewritten in more bus-independent way, and now support
the EBus found on the sparc64 platform.

The following device drivers have been added and enabled by default in
the ``GENERIC`` kernel:
`atkbdc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbdc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
creator(4), machfb(4),
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`ukbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ukbd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`ums(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ums&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
and
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.

The
`auxio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=auxio&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver has been added; it supports some auxiliary I/O functions found on
various SBus/EBus UltraSPARC® models. [MERGED]

The clkbrd driver has been added to support the ``clock-board`` device
frequently found on Sun E\ ``xx``\ 00 servers.

A framework for flexible processor speed control has been added. It
provides methods for various drivers to control CPU power utilization by
adjusting the processor speed. More details can be found in the
`cpufreq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpufreq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
manual page. [MERGED] Currently supported drivers include ichss (Intel
SpeedStep for ICH), acpi\_perf (ACPI CPU performance states), and
acpi\_throttle (ACPI CPU throttling). The latter two drivers are
contained in the
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver. These can individually be disabled by setting device hints such
as ``hint.ichss.0.disabled="1"``.

Support for the PadLock Security Co-processor in VIA C3 processors has
been added to the
`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+6.0-RELEASE>`__
subsystem.

The
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
hardware performance monitoring counter driver has been added. This
driver virtualizes the hardware performance monitoring facilities in
modern CPUs and provides support for using these facilities from user
level processes. For more details, see manual pages of
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
associated libraries, and associated userland utilities.

The pcii driver has been added to support GPIB-PCIIA IEEE-488 cards.
[MERGED]

The
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports a ``0x8`` (bit 3) flag to disable testing the
keyboard port during the device probe as this can cause hangs on some
machines, specifically Compaq R3000Z series amd64 laptops.

The
`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now has improved support for Synaptics Touchpad users. It now has
better tracking of slow-speed movement and support for various extra
buttons and dials. These features can be tuned with the
``hw.psm.synaptics.*`` hierarchy of sysctl variables.

The rtc driver has been added to support the MC146818-compatible clock
found on some UltraSPARC II and III models. [MERGED]

The
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now enabled in the ``GENERIC`` kernel, and is now the default
driver for serial ports. The
`ofw\_console(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ofw_console&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
and
`sab(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sab&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
drivers are now disabled in the ``GENERIC`` kernel. [MERGED]

The
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports the FTDI FT2232C chip.

The
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports handling of the ``CTS`` signal.

The
`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver has been improved.

The zs driver has been removed in favor of the
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The
`snd\_audiocs(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_audiocs&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver has been added to support the Crystal Semiconductor CS4231 audio
controller found on UltraSPARC workstations. [MERGED]

The
`snd\_csa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_csa&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports suspend and resume operation.

The
`uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uaudio&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now has some added functionality, including volume control on
more inputs and recording capability on some devices. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver has been updated to split the transmit rate control algorithm
into a separate module. One of ``device ath_rate_onoe``,
``device ath_rate_amrr``, or ``device ath_rate_sample`` must be included
in the kernel configuration when using the
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports the
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
framework, as well as the BCM5714, 5721, 5750, 5751, 5751M and 5789
chips. [MERGED]

The
`cdce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cdce&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
USB Communication Device Class Ethernet driver has been added. [MERGED]

The
`cp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE. [MERGED]

The
`ctau(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ctau&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE. [MERGED]

The
`cx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cx&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE. [MERGED]

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports the
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
framework and is MPSAFE. [MERGED]

The
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE.

The
`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports the
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
framework. [MERGED]

The
`ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE.

In the
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver, hardware support for VLAN tagging is now disabled by default due
to some interactions between this feature and promiscuous mode. [MERGED]

Ethernet flow control is now disabled by default in the
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver, to prevent problems on a subnet when a system panics or is left
in the kernel debugger. [MERGED]

The gx(4) driver has been removed because it is no longer maintained
actively and the
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver supports all of the supported hardware.

The
`hme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hme&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE. [MERGED]

The
`ipw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(for Intel PRO/Wireless 2100),
`iwi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwi&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(for Intel PRO/Wireless 2200BG/2225BG/2915ABG),
`ral(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ral&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(for Ralink Technology RT2500), and
`ural(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ural&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
(for Ralink Technology RT2500USB) drivers have been added.

The
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE. [MERGED]

The musycc driver, for the LanMedia LMC1504 T1/E1 network interface
card, has been removed due to disuse.

The
`my(4) <http://www.FreeBSD.org/cgi/man.cgi?query=my&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE.

The
`pcn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcn&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports the
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
framework. [MERGED]

The
`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now has support for device polling and
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
and is MPSAFE. [MERGED]

Several programming errors in the
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver have been corrected. These bugs were particular to SMP systems,
and could cause panics, page faults, aborted SSH connections, or
corrupted file transfers. More details can be found in errata note
`FreeBSD-EN-05:02.sk <ftp://ftp.FreeBSD.org/pub/FreeBSD/ERRATA/notices/FreeBSD-EN-05:02.sk.asc>`__.
[MERGED]

The
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now has support for
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.
This driver also now supports jumbo frames on Yukon-based interfaces.
[MERGED]

The
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now has support for
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.

The
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now has support for device polling
(`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__).

Support for 802.11 devices in the
`wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
framework has been greatly overhauled. In addition to architectural
changes, it includes completed 802.11g, WPA, 802.11i, 802.1x, WME/WMM,
AP-side power-saving, and plugin frameworks for cryptography modules,
authenticators, and access control. Note in particular that WEP now
requires the ``wlan_wep`` module to be loaded (or compiled) into the
kernel.

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now supports
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.
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

The MTU feedback in IPv6 has been disabled when the sender writes data
that must be fragmented. [MERGED]

The Common Address Redundancy Protocol (CARP) has been implemented. CARP
comes from OpenBSD and allows multiple hosts to share an IP address,
providing high availability and load balancing. For more information,
see the
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
manual page. [MERGED]

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
network bridging implementation, originally from NetBSD, has been added.
It supports the IEEE 802.1D Spanning Tree Protocol, individual interface
devices for each bridge, and filtering of bridged packets. The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports configuration of
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
``IPDIVERT`` option is now available as a kernel loadable module. If
this module is not loaded,
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
will refuse to install ``divert`` rules and
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
will return the error message “protocol not supported”.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
system can work with ``debug.mpsafenet``\ =\ ``1`` (this tunable is
``1`` by default) when the ``gid``, ``jail``, and/or ``uid`` rule
options are used. [MERGED]

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
and
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
systems now support IPv6.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
now supports classification and tagging of
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
packets via a divert socket. It is also possible to specify rules that
match TCP packets with specific payload sizes.

The
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
``ipfw fwd`` rule now supports the full packet destination manipulation
when the kernel option ``options IPFIREWALL_FORWARD_EXTENDED`` is
specified in addition to ``options IPFIRWALL_FORWARD``. This kernel
option disables all restrictions to ensure proper behavior for locally
generated packets and allows redirection of packets destined to locally
configured IP addresses. Note that
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
rules have to be carefully crafted to make sure that things like PMTU
discovery do not break. [MERGED]

The
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
system now supports IPv4 only rules.

`ipnat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipnat&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
now allows redirect rules to work for non-TCP/UDP packets. [MERGED]

Ongoing work is reducing the use of the Giant lock by the network
protocol stack and improving the locking strategies.

The ``libalias`` library can now be built as a kernel module.

The link state change notifications of network interfaces are sent to
``/dev/devctl`` now.

A new
`ng\_ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ipfw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
NetGraph node provides a simple interface between the
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
and
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
facilities.

A new
`ng\_nat(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_nat&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
NetGraph node has been added to perform NAT functions.

A new
`ng\_netflow(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_netflow&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
NetGraph node allows a router running FreeBSD to do NetFlow version 5
exports. [MERGED]

A new
`ng\_tcpmss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_tcpmss&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
NetGraph node has been added. This supports altering MSS options of TCP
packets.

The
`sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now includes Frame Relay support. [MERGED]

The
`sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now MPSAFE.

The FreeBSD routing table now requires gateways for routes to be of the
same address family as the route itself. The
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now rejects a combination of different address families. For
example:

.. code:: SCREEN

    # route add 10.1.1.1 -inet6 fe80::1%fxp0

The new sysctl ``net.link.tap.user_open`` has been implemented. This
allows unprivileged access to
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
device nodes based on file system permissions.

A bug in TCP that sometimes caused RST packets to be ignored if the
receive window was zero bytes has been fixed. [MERGED]

The ``RST`` handling of the FreeBSD TCP stack has been improved to make
reset attacks as difficult as possible while maintaining compatibility
with the widest range of TCP stacks. The algorithm is as follows: For
connections in the ``ESTABLISHED`` state, only resets with sequence
numbers exactly matching ``last_ack_sent`` will cause a reset; all other
segments will be silently dropped. For connections in all other states,
a reset anywhere in the window will cause the connection to be reset.
All other segments will be silently dropped. Note that this behavior
technically violates the RFC 793 specification; the conventional (but
less secure) behavior can be restored by setting a new sysctl
``net.inet.tcp.insecure_rst`` to ``1``. [MERGED]

Several bugs in the TCP SACK implementation have been fixed. [MERGED]

RFC 1644 T/TCP support has been removed. This is because the design is
based on a weak security model that can easily permit denial-of-service
attacks. This TCP extension has been considered a defective one in a
recent Internet Draft.

The KAME IPv4 IPsec implementation integrated in FreeBSD now supports
TCP-MD5. [MERGED]

Random ephemeral port number allocation has led to some problems with
port reuse at high connection rates. This feature is now disabled during
periods of high connection rates; whenever new connections are created
faster than ``net.inet.ip.portrange.randomcps`` per second, port number
randomization is disabled for the next
``net.inet.ip.portrange.randomtime`` seconds. The default values for
these two sysctl variables are ``10`` and ``45``, respectively. [MERGED]

Fine-grained locking has been applied to many of the data structures in
the IPX/SPX protocol stack. While not fully MPSAFE at this point, it is
generally safe to use IPX/SPX without the Giant lock (in other words,
the ``debug.mpsafenet`` sysctl variable may be set to ``1``).

Unix domain sockets now support the ``LOCAL_CREDS`` and
``LOCAL_CONNWAIT`` options. The ``LOCAL_CREDS`` option provides a
mechanism for the receiver to receive the credentials of the process as
a
`recvmsg(2) <http://www.FreeBSD.org/cgi/man.cgi?query=recvmsg&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__
control message. The ``LOCAL_CONNWAIT`` option causes the
`connect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=connect&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__
function to block until
`accept(2) <http://www.FreeBSD.org/cgi/man.cgi?query=accept&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__
has been called on the listening socket. For more details, see the
`unix(4) <http://www.FreeBSD.org/cgi/man.cgi?query=unix&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
manual page.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver is now safe for use on systems using
`pae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pae&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.
[MERGED]

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
family of drivers has been overhauled and updated. It has been split
into modules that can be loaded and unloaded independently (the
``atapci`` and ``ata`` modules are prerequisites for the device
subdrivers, which are ``atadisk``, ``atapicd``, ``atapifd``,
``atapist``, and ``ataraid``). On supported SATA controllers, devices
can be hot inserted/removed. ATA RAID support has been rewritten and
supports a number of new metadata formats. The ``atapicd`` driver no
longer supports CD changers. This update has been referred to as “ATA
mkIII”.

The SHSEC GEOM class has been added. It provides for the sharing of a
secret between multiple GEOM providers. All of these providers must be
present in order to reveal the secret. This feature is controlled by the
`gshsec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gshsec&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility. [MERGED]

A new GEOM-based disk encryption facility, GEOM\_ELI, has been added. It
uses the
`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+6.0-RELEASE>`__
framework for hardware acceleration and supports different cryptographic
algorithms. See
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
for more information. [MERGED]

The
`hptmv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptmv&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver, which supports the HighPoint RocketRAID 182x series, has been
added. [MERGED]

The
`ips(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ips&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver now support kernel crash dumps on some modern ServeRAID models.
[MERGED]

The
`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver has been removed. [MERGED]

The default SCSI boot-time probe delay in the ``GENERIC`` kernel has
been reduced from fifteen seconds to five seconds.

The old vinum(4) subsystem has been removed in favor of the new
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__-based
version.

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
driver has been updated to the 9.2 release (for FreeBSD 5.2.1)
distributed from the 3ware website.

Information about newly-mounted cd9660 file systems (such as the
presence of RockRidge extensions) is now only printed if the kernel was
booted in verbose mode. This change was made to reduce the amount of
(generally unnecessary) kernel log messages. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

Recomputing the summary information for “dirty” UFS and UFS2 file
systems is no longer done at mount time, but is now done by background
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__.
This change improves the startup speed when mounting large file systems
after a crash. The prior behavior can be restored by setting the
``vfs.ffs.compute_summary_at_mount`` sysctl variable to a non-zero
value. [MERGED]

A kernel panic in the NFS server has been fixed. More details can be
found in errata note
`FreeBSD-EN-05:01.nfs <ftp://ftp.FreeBSD.org/pub/FreeBSD/ERRATA/notices/FreeBSD-EN-05:01.nfs.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6 Contributed Software
^^^^^^^^^^^^^^^^^^^^^^^^^^

**ACPI-CA** has been updated from 20040527 to 20041119. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

The
`bsdiff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdiff&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
and
`bspatch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bspatch&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
binary diff and binary patching tools have been added.

The
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now allows commands (such as ``eject``) to take place after
fixating a disk.

The
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports the ``-h`` flag, which supports changing flags on
symbolic links.

The
`env(1) <http://www.FreeBSD.org/cgi/man.cgi?query=env&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
program now supports a ``-v`` flag to write the command to standard
error before it is executed.

The
`env(1) <http://www.FreeBSD.org/cgi/man.cgi?query=env&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
program now supports a ``-S string`` option to split the ``string`` and
pass them to the command as the command-line arguments.

The
`env(1) <http://www.FreeBSD.org/cgi/man.cgi?query=env&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
program now supports a ``-P altpath`` option to set the command search
path used to look for the command.

The
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
program now uses the ``212`` and ``213`` status codes for directory and
file status correctly (``211`` was used in the previous versions). This
behavior is described in RFC 959. [MERGED]

The ``create`` command of the
`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-f`` command-line flag to force creation of a
GPT even when there is an MBR record on a disk. [MERGED]

The
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
function now queries ``A`` DNS resource records before ``AAAA`` records
when ``AF_UNSPEC`` is specified. Some broken DNS servers return
``NXDOMAIN`` against non-existent ``AAAA`` queries, even when it should
return ``NOERROR`` with empty return records. This is a problem for an
IPv4/IPv6 dual stack node because the ``NXDOMAIN`` returned by the first
query of an ``AAAA`` record makes the querying server stop attempting to
resolve the ``A`` record if any. Also, this behavior has been recognized
as a potential denial-of-service attack (see
http://www.kb.cert.org/vuls/id/714121 for more details). Note that
although the query order has been changed, the returned result still
includes ``AF_INET6`` records before ``AF_INET`` records. [MERGED]

The
`gethostbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyname&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`gethostbyname2(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyname2&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
and
`gethostbyaddr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyaddr&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
functions are now thread-safe. [MERGED]

The
`getnetent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetent&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`getnetbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetbyname&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
and
`getnetbyaddr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetbyaddr&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
functions are now thread-safe. [MERGED]

The
`getprotoent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprotoent&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`getprotobyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprotobyname&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
and
`getprotobynumber(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprotobynumber&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
functions are now thread-safe. [MERGED]

The
`getservent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getservent&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`getservbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getservbyname&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
and
`getservbyport(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getservbyport&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
functions are now thread-safe. [MERGED]

For conformation to IEEE Std 1003.1-2001 (also known as POSIX 2001), the
``n_net`` member of ``struct netent`` and the first argument of
`getnetbyaddr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetbyaddr&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
has been changed to an ``uint32_t``. Due to these changes, the ABI on
64-bit platforms is incompatible with previous releases of FreeBSD and
the major version number of the ``libpcap`` shared library has been
bumped. On 64-bit platforms being upgraded from older FreeBSD versions,
all userland programs that use
`getnetbyaddr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetbyaddr&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`getnetbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetbyname&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`getnetent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetent&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
and/or ``libpcap`` have to be recompiled.

The gvinum(8) utility now supports the ``checkparity``,
``rebuildparity``, and ``setstate`` subcommands. [MERGED]

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility has been restructured. It is now more modular and flexible with
respect to supporting interface-specific functionality. The 802.11
support has been updated to support recent changes to the 802.11
subsystem and drivers.

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-tunnel`` parameter, which is just an alias for
``deletetunnel``, yet is more convenient and easier to type.

The ``-vlandev`` parameter to
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
no longer requires a network interface as its argument. The argument
still is supported for backward compatibility, but now it is deprecated
and its use is discouraged.

Support for abbreviated forms of a number of
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
options has been deprecated. Warnings are printed to stderr indicating
the correct full form when one of these abbreviations is detected.

The
`kldstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldstat&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-m`` option to return the status of a specific
kernel module. [MERGED]

The on-disk format of ``LC_CTYPE`` files has been changed to be
machine-independent.

The **libkvm** now supports ELF crash dumps on amd64 and i386 platforms,
large crash dumps (more than 4GB) on 32-bit platforms, and PAE crash
dumps on i386 platform.

The
`mixer(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mixer&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports the ``-S`` option. This is the same as the ``-s``
option but does not output mixing field separators.

A bug in the ``libalias`` library which causes a core dump when the
``-reverse`` option is specified in
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
has been fixed.

The ``libarchive`` library (as well as the
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
command that uses it) now has support for reading ISO images (with
optional RockRidge extensions) and ZIP archives (with ``deflate`` and
``none`` compression). [MERGED]

The ``libarchive`` library now supports handling a ZIP archive entry
with more than 4GB compressed size (ZIP64 extension) and Unix extension.

The ``libgpib`` library has been added to give userland access to GPIB
devices (using the the pcii driver) via the ``ibfoo`` API. [MERGED]

The default stack sizes in ``libpthread``, ``libthr``, and ``libc_r``
have been increased. On 32-bit platforms, the main thread receives a 2MB
stack size by default, with other threads receiving a 1MB stack size by
default. On 64-bit platforms, the default stack sizes are 4MB and 2MB
respectively. [MERGED]

The ``libxpg4`` library has been removed because all of its
functionality was long ago merged into ``libc``. All binaries linked
with ``libxpg4`` must be recompiled or use
`libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__.
Note that the FreeBSD base system has no such binaries.

The
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
program now checks to make sure the data file has been completely
transfered before starting to print it when a data file received from
some other host. Some implementations of
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
send the control file for a print job before sending the matching data
files, which can cause problems if the receiving host is a busy
print-server. [MERGED]

A number of new functions have been implemented in the
`math(3) <http://www.FreeBSD.org/cgi/man.cgi?query=math&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
library. These include
`ceill(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ceill&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`floorl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=floorl&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`ilogbl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ilogbl&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`fma(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fma&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
and variants,
`lrint(3) <http://www.FreeBSD.org/cgi/man.cgi?query=lrint&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
and variants, and
`lround(3) <http://www.FreeBSD.org/cgi/man.cgi?query=lround&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
and variants. [MERGED]

The
`mknod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mknod&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility is now deprecated. Device nodes have been managed by the
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__
device file system since FreeBSD 5.0.

The
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
daemon now supports “virtual scrolling”, in which mouse motions made
while holding down the middle mouse button are interpreted as scrolling.
This feature is enabled with the ``-V`` flag. [MERGED]

A separate directory has been added for
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
dynamic zones which is owned by the ``bind`` user (for creation of the
zone journal file). For more detail, see an example dynamic zone in the
sample
`named.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=named.conf&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__.
[MERGED]

The
`ncal(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ncal&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-m`` flag to generate a calendar for a
specified month in the current year. [MERGED]

The
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-n`` flag to suppress the creation of a
``.snap`` directory on new file systems. This feature is intended for
use on memory or vnode file systems that will not require snapshot
support. [MERGED]

The
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now emits a warning when creating a UFS or UFS2 file system that
cannot support snapshots. This situation can occur in the case of very
large file systems with small block sizes. [MERGED]

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-d`` option to specify an alternate root for
log files similar to ``DESTDIR`` in the BSD make process. This only
affects log file paths, not configuration file (``-f``) or archive
directory (``-a``) paths.

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a option ``-N`` that causes it not to rotate any
files.

The ``NO_NIS`` compile-time knob for userland has been added. As its
name implies, enabling this ``Makefile`` variable will cause NIS support
to be excluded from various programs and will cause the NIS utilities to
not be built. [MERGED]

For years, FreeBSD has used ``Makefile`` variables of the form ``NOFOO``
and ``NO_FOO``. For consistency, those variables using the former naming
convention have been converted to the ``NO_FOO`` form. The file
``/usr/share/mk/bsd.compat.mk`` has a complete list of these variables;
it also implements some temporary backward compatibility for the old
names.

The
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
security output now supports the display of information about blocked
packet counts from
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.
[MERGED]

The
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
command now supports a ``-S`` option which allows matching system
processes (kernel threads).

The
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
and
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
commands now support a ``-F`` option, which matches a process whose PID
is stored in a file.

The
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
and
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
commands now support a ``-i`` option to ignore case in the process
match.

The
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
and
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
commands now support a ``-j`` option that matches processes based on
their
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__
ID.

The
`pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
and
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
commands now support a ``-o`` option which matches only the oldest
(least recently started) of the matching processes.

The
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility for downloading, updating, and extracting compressed snapshots
of the FreeBSD ports tree has been added.

The
`powerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=powerd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
program for managing power consumption has been added.

The
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
program now implements an ``echo`` parameter, which allows LCP ECHOs to
be enabled independently of LQR reports. Older versions of
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
would revert to LCP ECHO mode on negotiation failure. It is now
necessary to specify ``enable echo`` to get this behavior. [MERGED]

The ``disable NAS-IP-Address`` and ``disable NAS-Identifier`` options,
which support pre-RFC 2865 RADIUS servers have been added to the
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
program.

Two bugs in the
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
program have been fixed. They may result in an incorrect CBCP response,
which violates the Microsoft PPP Callback Control Protocol section 3.2.
[MERGED]

The
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``jid`` keyword in the ``-o`` option. It displays
the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+6.0-RELEASE>`__
ID of each process.

The
`pstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pstat&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
program now supports a ``-h`` option to print swap sizes with SI
prefixes such as K, M, and G, which are used to form binary multiples.

The
`rescue(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rescue&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utilities in the ``/rescue`` directory now include
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
instead of GNU tar.

The
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility has regained the ability to read FreeBSD version 1 dump tapes.
[MERGED]

A bug of the
`rexecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rexecd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility which results in it behaving as if the ``-i`` option is always
specified has been fixed. [MERGED]

The
`rexecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rexecd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility has been removed. There are no rexec clients in the FreeBSD
tree, and the client function
`rexec(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rexec&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
is present only in ``libcompat``.

The
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports an ``-I`` option that asks for confirmation (once)
if recursively removing directories or if more than 3 files are listed
in the command line. [MERGED]

The
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now suppresses diagnostic messages when it attempts to remove a
non-existent directory with the ``-r`` and ``-f`` options specified.
This behavior is required by Version 3 of the Single UNIX Specification
(SUSv3).

The following ISO/IEC 9899:1999 standard functions have been
implemented: ``roundl()``, ``lroundl()``, ``llroundl()``, ``truncl()``,
and ``floorl()``.

An
`rpmatch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rpmatch&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
library function has been added to check a string for being an
affirmative or negative response in the current locale.

The
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
dynamic linker now supports specifying library replacements via the
``LD_LIBMAP`` environment variable. This variable will override the
entries in
`libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__.
[MERGED]

The rune(3) non-standard multibyte and wide character support interface
has been removed.

`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
now supports a ``-l`` option to make its output line-buffered. [MERGED]

The
`strftime(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strftime&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
function now supports some GNU extensions such as ``-`` (no padding),
``_`` (use space as padding), and ``0`` (zero padding). [MERGED]

The
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__
function is now thread-safe. [MERGED]

The
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now opens an additional domain socket (``/var/run/logpriv`` by
default), with ``0600`` permissions to be used by privileged programs.
This prevents privileged programs from locking when the domain sockets
run out of buffer space due to a local denial-of-service attack.
[MERGED]

The
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
now supports the ``-S`` option, which changes the pathname of the
privileged socket. This is useful for preventing the daemon from
receiving any messages from the local sockets (``/var/run/log`` and
``/var/run/logpriv`` are used by default). [MERGED]

The
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility now allows ``:`` and ``%`` characters in the hostname
specifications. These characters are used in IPv6 addresses and scope
IDs. [MERGED]

The
`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
``-netstat`` display is now IPv6-aware. [MERGED]

The ``-f`` option of
`tail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tail&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports more than one file at a time. [MERGED]

The
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
and
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
programs now support the ``-S`` option for specifying a numeric TOS
byte.

Prepending a ``+`` character to port numbers passed to
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
program will now disable option negotiation and allow the transfer of
characters with the high bit set. This feature is intended to support
the fairly common use of
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
as a protocol tester.

The
`tcpdrop(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdrop&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
command, which closes a selected TCP connection, has been added. It was
obtained from OpenBSD. [MERGED]

`what(1) <http://www.FreeBSD.org/cgi/man.cgi?query=what&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
now supports a ``-q`` flag, which causes it to print matching text, but
not format it.

`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
now supports a ``-k`` flag for querying ``whois.krnic.net`` (the
National Internet Development Agency of Korea), which holds details of
IP address allocations within Korea. [MERGED]

The ``-I`` option of the
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
command has been changed to conform to IEEE Std 1003.1-2004. The
standard requires that the constructed arguments cannot grow larger than
255 bytes.

A bug, which caused the last line of configuration files such as
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__,
`services(5) <http://www.FreeBSD.org/cgi/man.cgi?query=services&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__,
and so on to be ignored if it did not end in a newline character, has
been fixed. [MERGED]

A new system user/group ``_dhcp`` has been added to support
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
from OpenBSD.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``rc.d/bsnmpd`` startup script for
`bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
has been added.

The ``rc.d/jail`` startup script now supports ``jail_name_flags``
variable which allows to specify
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
flags. [MERGED]

`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__
now supports changes of network interface names at boot time. [MERGED]
For example:

.. code:: PROGRAMLISTING

    ifconfig_fxp0_name="net0"
    ifconfig_net0="inet 10.0.0.1/16"

The ``rc.d/moused`` script now starts/stops/checks a specific device
when the device name is given as the second argument to the script:

.. code:: SCREEN

    # /etc/rc.d/moused start ums0

To use different
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__
knobs with different mice, use the device name as part of the knob. For
example, if the mouse device is ``/dev/ums0`` the following lines can be
used:

.. code:: PROGRAMLISTING

    moused_ums0_enable=yes
    moused_ums0_flags="-z 4"
    moused_ums0_port="/dev/ums0"

`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__
now supports the ``tmpmfs_flags`` and ``varmfs_flags`` variables. These
can be used to pass extra options to the
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__
utility, to customize the finer details of the
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__
file system creation, such as to turn on/off softupdates, to specify a
default owner for the file system, and so on. [MERGED]

The following scripts have been removed because they were NetBSD
specific and never used in FreeBSD: ``altqd``, ``dhcpd``, ``dhcrelay``,
``downinterfaces``, ``gated``, ``ifwatchd``, ``kdc``, ``lkm1``,
``lkm2``, ``lkm3``, ``mixerctl``, ``mopd``, ``mountall``, ``ndbootd``,
``network``, ``poffd``, ``postfix``, ``ppp``, ``racoon``, ``raidframe``,
``rbootd``, ``rtsold``, ``screenblank``, ``swap2``, ``sysdb``,
``wscons``, ``xdm``, and ``xfs``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**awk** has been updated from the 7 February 2004 release to the 24
April 2005 release.

**BIND** has been updated from version 9.3.0 to version 9.3.1. [MERGED]

**bsnmp** has been updated from 1.7 to 1.10.

**bzip2** has been updated from 1.0.2 to 1.0.3.

**OpenBSD dhclient** as of OpenBSD 3.7 has been imported. It replaces
the ISC DHCP client used in prior versions of FreeBSD.

**FILE** has been updated from 4.10 to 4.12.

**GNU GCC** has been updated from from 3.4.2-prerelease as of 28 July,
2004 to 3.4.4.

A number of bug fixes and performance enhancements have been added to
**GNU grep** in the form of patches from Fedora's grep-2.5.1-48 source
RPM.

**GNU readline** has been updated from version 4.3 to version 5.0.

**IPFilter** has been updated from 3.4.35 to 4.1.18.

**Heimdal** has been updated from 0.6.1 to 0.6.3. [MERGED]

The **hostapd** v0.3.9 has been imported. This is a user space IEEE
802.11 AP and IEEE 802.1X/WPA/WPA2/EAP Authenticator and RADIUS
authentication server. For more details, see
`hostapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hostapd&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__.

**libpcap** has been updated from v0.8.3 to v0.9.1 (alpha 096).

**libregex** has been updated from a snapshot from **GNU grep** 2.5.1 to
a snapshot from the ``fedora-glibc-2_3_4-21`` tag in the **glibc** CVS
repository.

**libz** has been updated from 1.2.1 to 1.2.2.

**lukemftp** has been updated from a 26 April 2004 snapshot from
NetBSD's sources to a snapshot as of 16 May 2005.

A snapshot of **netcat** from OpenBSD as of 4 February 2005 has been
added. More information can be found in the
`nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
manual page. [MERGED]

**NgATM** has been updated from 1.0 to 1.2.

**OpenPAM** has been updated from the Eelgrass release to the Figwort
release.

**OpenSSH** has been updated from 3.8p1 to 4.1p1.

**OpenSSL** has been updated from 0.9.7d to 0.9.7e. [MERGED]

**pf** has been updated from the version included with **OpenBSD** 3.5
to the version included with **OpenBSD** 3.7.

**sendmail** has been updated from version 8.13.3 to version 8.13.4. It
now supports ``OSTYPE(freebsd6)``.

**tcpdump** has been updated from v3.8.3 to v3.9.1 (alpha 096).

**tcsh** has been updated from 6.13.00 to 6.14.00.

**texinfo** has been updated from 4.6 to 4.8.

The timezone database has been updated from the **tzdata2004e** release
to the **tzdata2004g** release. [MERGED]

The **WPA Supplicant** v0.3.9 has been imported. This provides WPA
Supplicant component of WPA/IEEE 802.11i features. For more details, see
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8&manpath=FreeBSD+6.0-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-R`` flag. When creating a package file from
the locally installed package, it creates package files for all packages
on which that locally installed package depends if this flag is
specified.

The
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-q`` flag to suppress the output of the port
version comparison characters ``<``, ``=``, and ``>``.

The
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+6.0-RELEASE>`__
utility now supports a ``-I`` flag, which causes only the ``INDEX`` file
to be used for determining if a package is out of date. [MERGED]

The ``ports/INDEX*`` files, which kept an index of all of the entries in
the ports collection, have been removed from the CVS repository.
[MERGED] These files were generated only infrequently, and therefore
were usually out-of-date and inaccurate. Users requiring an index file
(such as for use by programs such as
`portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__)
have two alternatives for obtaining a copy:

-  Build an index file based on the current ports tree by running
   ``make index`` from the top of the ``ports/`` tree.

-  Fetch an index file over the network by running ``make fetchindex``
   from the top of the ``ports/`` tree. This index file will (typically)
   be accurate to within a day.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In prior FreeBSD releases, the ``disc1`` CD-ROM (or ISO image) was a
bootable installation disk containing the base system, ports tree, and
common packages. The ``disc2`` CD-ROM (or ISO image) was a bootable “fix
it” disk with a live filesystem, to be used for making emergency
repairs. This layout has now changed. For all architectures except ia64,
the ``disc1`` image now contains the base system distribution files,
ports tree, and the live filesystem, making it suitable for both an
initial installation and repair purposes. (On the ia64, the live
filesystem is on a separate disk due to its size.) Packages appear on
separate disks; in particular, the ``disc2`` image contains commonly
packages such as desktop environments. Documents from the FreeBSD
Documentation Project also appear on ``disc2``. [MERGED]

The supported version of the **GNOME** desktop environment has been
updated from 2.6.2 to 2.10.2. More information about running **GNOME**
on FreeBSD can be found on the `FreeBSD GNOME
Project <http://www.FreeBSD.org/gnome/>`__ Web page. [MERGED]

.. raw:: html

   <div class="NOTE">

    **Note:** Users of older versions of the **GNOME** desktop
    (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
    must take particular care in upgrading. Simply upgrading it from the
    FreeBSD Ports Collection with
    `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__
    (```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__)
    will cause serious problems. **GNOME** desktop users should read the
    instructions carefully at
    http://www.FreeBSD.org/gnome/docs/faq210.html and use the
    ```gnome_upgrade.sh`` <http://www.FreeBSD.org/gnome/gnome_upgrade.sh>`__
    script to properly upgrade to **GNOME** 2.10.

.. raw:: html

   </div>

The supported version of the **KDE** desktop environment has been
updated from 3.3.0 to 3.4.2. More information regarding running **KDE**
on FreeBSD can be found on the `KDE on
FreeBSD <http://freebsd.kde.org/>`__ Web page. [MERGED]

.. raw:: html

   <div class="NOTE">

    **Note:** Users of older versions of **KDE** should follow the
    upgrading procedure documented on the `KDE on
    FreeBSD <http://freebsd.kde.org/>`__ Web page or in
    ``ports/UPDATING``.

.. raw:: html

   </div>

The supported version of **Xorg** has been updated from 6.7.0 to 6.8.2.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7 Documentation
~~~~~~~~~~~~~~~~~

Documentation of existing functionality has been improved by the
addition of the following manual pages:
`acpi\_ibm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_ibm&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`acpi\_sony(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_sony&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`bus\_space(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_space&sektion=9&manpath=FreeBSD+6.0-RELEASE>`__,
`central(4) <http://www.FreeBSD.org/cgi/man.cgi?query=central&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`clkbrd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=clkbrd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`creator(4) <http://www.FreeBSD.org/cgi/man.cgi?query=creator&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`devfs.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.conf&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__,
`devfs.rules(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.rules&sektion=5&manpath=FreeBSD+6.0-RELEASE>`__,
`ebus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ebus&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`eeprom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=eeprom&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`fhc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fhc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`machfb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=machfb&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`ofw\_console(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ofw_console&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`openfirm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=openfirm&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`openprom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=openprom&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`pmap\_page\_init(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pmap_page_init&sektion=9&manpath=FreeBSD+6.0-RELEASE>`__,
`pthread\_atfork(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread_atfork&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`rtc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rtc&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`sbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sbus&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`sched\_4bsd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_4bsd&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`snd\_fm801(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_fm801&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`snd\_neomagic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_neomagic&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`snd\_t4dwave(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_t4dwave&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`snd\_via8233(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_via8233&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
`snd\_via82c686(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_via82c686&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
and
`snd\_vibes(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_vibes&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.

Manual pages in the base system have received a number of cleanups, both
for content and presentation. Cross-references are more correct and
consistent, standard section headings are now used throughout, and
markup has been cleaned up.

The following manual pages, which were derived from RFCs and possibly
violate the IETF's copyrights, have been replaced:
`gai\_strerror(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gai_strerror&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`inet6\_opt\_init(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet6_opt_init&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`inet6\_option\_space(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet6_option_space&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`inet6\_rth\_space(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet6_rth_space&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`inet6\_rthdr\_space(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet6_rthdr_space&sektion=3&manpath=FreeBSD+6.0-RELEASE>`__,
`icmp6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=icmp6&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__,
and
`ip6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6&sektion=4&manpath=FreeBSD+6.0-RELEASE>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

Source upgrades to FreeBSD 6.0-RELEASE are only supported from FreeBSD
5.3-RELEASE or later. Users of older systems wanting to upgrade
6.0-RELEASE will need to update to FreeBSD 5.3 or newer first, then to
FreeBSD 6.0-RELEASE.

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
