=================================
FreeBSD 9.1-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2012 The FreeBSD Documentation Project

| $FreeBSD: stable/9/release/doc/en\_US.ISO8859-1/relnotes/article.xml
  244869 2012-12-30 17:54:25Z hrs $

.. raw:: html

   <div class="legalnotice">

FreeBSD is a registered trademark of the FreeBSD Foundation.

IBM, AIX, EtherJet, Netfinity, OS/2, PowerPC, PS/2, S/390, and ThinkPad
are trademarks of International Business Machines Corporation in the
United States, other countries, or both.

IEEE, POSIX, and 802 are registered trademarks of Institute of
Electrical and Electronics Engineers, Inc. in the United States.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

SPARC, SPARC64, SPARCengine, and UltraSPARC are trademarks of SPARC
International, Inc in the United States and other countries. SPARC
International, Inc owns all of the SPARC trademarks and under licensing
agreements allows the proper use of these trademarks by its members.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract">

The release notes for FreeBSD 9.1-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 9.1-STABLE development
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
1 `Introduction <#intro>`__
2 `What's New <#new>`__
2.1 `Security Advisories <#security>`__
2.2 `Kernel Changes <#kernel>`__
2.2.1 `Boot Loader Changes <#boot>`__
2.2.2 `Hardware Support <#proc>`__
2.2.3 `Network Protocols <#net-proto>`__
2.2.4 `Disks and Storage <#disks>`__
2.2.5 `File Systems <#fs>`__
2.3 `Userland Changes <#userland>`__
2.3.1
` <#periodic-scripts>`__\ `periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
Scripts
2.3.2
` <#rc-scripts>`__\ `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
Scripts
2.4 `Contributed Software <#contrib>`__
2.5 `Release Engineering and Integration <#releng>`__
3 `Upgrading from previous releases of FreeBSD <#upgrade>`__
3.1 `Upgrading
using <#AEN1113>`__\ `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
or a source-based procedure
3.2 `User-visible incompatibilities <#AEN1133>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 9.1-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 9.1-RELEASE is a release distribution. It
can be found at http://www.FreeBSD.org/releases/ or any of its mirrors.
More information on obtaining this (or other) release distributions of
FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
9.1-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 9.0-RELEASE.

Typical release note items document recent security advisories issued
after 9.0-RELEASE, new drivers or hardware support, new commands or
options, major bug fixes, or contributed software upgrades. They may
also list changes to major ports/packages or release engineering
practices. Clearly the release notes cannot list every single change
made to FreeBSD between releases; this document focuses primarily on
security advisories, user-visible changes, and major architectural
improvements.

.. raw:: html

   <div class="sect2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

Problems described in the following security advisories have been fixed.
For more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="informaltable">

+----------------+----------------+---------------------------------------------+
| Advisory       | Date           | Topic                                       |
+================+================+=============================================+
| `SA-12:01.open | 3?May?2012     | OpenSSL multiple vulnerabilities            |
| ssl <http://se |                |                                             |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 2:01.openssl.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:02.cryp | 30?May?2012    | Incorrect ``crypt()`` hashing               |
| t <http://secu |                |                                             |
| rity.freebsd.o |                |                                             |
| rg/advisories/ |                |                                             |
| FreeBSD-SA-12: |                |                                             |
| 02.crypt.asc>` |                |                                             |
| __             |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:03.bind | 12?June?2012   | Incorrect handling of zero-length RDATA     |
|  <http://secur |                | fields in                                   |
| ity.freebsd.or |                | `named(8) <http://www.FreeBSD.org/cgi/man.c |
| g/advisories/F |                | gi?query=named&sektion=8&manpath=FreeBSD+9. |
| reeBSD-SA-12:0 |                | 1-RELEASE>`__                               |
| 3.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:04.sysr | 12?June?2012   | Privilege escalation when returning from    |
| et <http://sec |                | kernel                                      |
| urity.freebsd. |                |                                             |
| org/advisories |                |                                             |
| /FreeBSD-SA-12 |                |                                             |
| :04.sysret.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:05.bind | 6?August?2012  | `named(8) <http://www.FreeBSD.org/cgi/man.c |
|  <http://secur |                | gi?query=named&sektion=8&manpath=FreeBSD+9. |
| ity.freebsd.or |                | 1-RELEASE>`__                               |
| g/advisories/F |                | DNSSEC validation Denial of Service         |
| reeBSD-SA-12:0 |                |                                             |
| 5.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:06.bind | 22?November?20 | Multiple Denial of Service vulnerabilities  |
|  <http://secur | 12             | with                                        |
| ity.freebsd.or |                | `named(8) <http://www.FreeBSD.org/cgi/man.c |
| g/advisories/F |                | gi?query=named&sektion=8&manpath=FreeBSD+9. |
| reeBSD-SA-12:0 |                | 1-RELEASE>`__                               |
| 6.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:07.host | 22?November?20 | Insufficient message length validation for  |
| apd <http://se | 12             | EAP-TLS messages                            |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 2:07.hostapd.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-12:08.linu | 22?November?20 | Linux compatibility layer input validation  |
| x <http://secu | 12             | error                                       |
| rity.freebsd.o |                |                                             |
| rg/advisories/ |                |                                             |
| FreeBSD-SA-12: |                |                                             |
| 08.linux.asc>` |                |                                             |
| __             |                |                                             |
+----------------+----------------+---------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The FreeBSD Jail subsystem now supports mounting
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__,
`nullfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nullfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__,
and ZFS filesystem inside a jail. New
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
parameters ``allow.mount.devfs``, ``allow.mount.nullfs``, and
``allow.mount.zfs`` to control the per-jail capabilities have been
added. All of them are disabled by
default.[`r232728 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232728>`__\ ]

A new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
tunable ``kern.eventtimer.activetick`` has been added. This tunable
specifies whether each hardclock tick should be run on every active CPU
or only one. By setting it to ``0``, the total number of interrupts can
be reduced on SMP machines. The default value is
``1``.[`r234167 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234167>`__\ ]

The
`posix\_fadvise(2) <http://www.FreeBSD.org/cgi/man.cgi?query=posix_fadvise&sektion=2&manpath=FreeBSD+9.1-RELEASE>`__
system call has been implemented. This is a function similar to
`madvise(2) <http://www.FreeBSD.org/cgi/man.cgi?query=madvise&sektion=2&manpath=FreeBSD+9.1-RELEASE>`__
except that it operates on a file descriptor instead of a memory
region.[`r229723 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229723>`__\ ]

The
`filemon(4) <http://www.FreeBSD.org/cgi/man.cgi?query=filemon&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
pseudo-device has been added. This allows a process to collect file
operations data of its
children.[`r237795 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237795>`__\ ]

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable ``kern.stop_scheduler_on_panic`` is now set to ``1`` by
default.[`r235413 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235413>`__\ ]

[powerpc] FreeBSD/powerpc64 now supports kernel profiling by using
`kgmon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kgmon&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__.[`r231907 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231907>`__\ ]

The FreeBSD Linux ABI compatibility layer now supports the
``linux_fadvise64()`` and ``linux_fadvise64_64()`` system
calls.[`r231145 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231145>`__\ ]

The default value of the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
tunable ``hw.memtest.tests`` is now automatically set to ``0`` when
FreeBSD is running on a virtual
machine.[`r230266 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230266>`__\ ]

A new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
tunable ``kern.msgbuf_show_timestamp`` has been added. When it is
enabled, a timestamp is added to each line of the system message buffer.
The default value is ``0``
(disabled).[`r234075 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234075>`__\ ]

The
`null(4) <http://www.FreeBSD.org/cgi/man.cgi?query=null&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
and
`zero(4) <http://www.FreeBSD.org/cgi/man.cgi?query=zero&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
pseudo device driver now supports non-blocking mode via the
`fcntl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fcntl&sektion=2&manpath=FreeBSD+9.1-RELEASE>`__
system
call.[`r230320 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230320>`__\ ]

The FreeBSD
`sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
scheduler has been improved for CPU load balancing on SMT (Simultaneous
MultiThreading) CPUs. It gives a 10-15% performance improvement when the
number of threads is lesser than the number of logical
CPUs.[`r233599 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233599>`__\ ]

[sparc64] The ``PREEMPTION`` kernel option is now enabled in the
``GENERIC``
kernel.[`r235992 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235992>`__\ ]

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable ``security.bsd.unprivileged_idprio`` has been added. This
variable controls whether non-root users can set an idle priority or
not. This is disabled by
default.[`r230039 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230039>`__\ ]

The
`splash(4) <http://www.FreeBSD.org/cgi/man.cgi?query=splash&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
screen interface now supports ASCII art in **TheDraw**
format.[`r228445 <http://svn.freebsd.org/viewvc/base?view=revision&revision=228445>`__\ ]

.. raw:: html

   <div class="sect3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

The
`boot0cfg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot0cfg&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports configuration of PXE boot via the ``boot0`` boot
block temporarily on the next boot. The slice number ``6`` or a keyword
``PXE`` can be specified to enable PXE boot using the ``-s``
option.[`r230065 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230065>`__\ ]

The FreeBSD
`boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
block now supports ``/boot/config`` in addition to ``/boot.config`` as
the boot block parameter file. When both of them exist, the former will
be
used.[`r231287 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231287>`__\ ]

The ``gptboot`` boot block now reads the backup GPT header from the last
LBA only when the primary GPT header and tables are invalid. This
mitigates interoperability issues with some
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
providers like ``MIRROR`` which use the last LBA for the
metadata.[`r234693 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234693>`__\ ]

The ``zfsboot`` boot block and ``zfsloader`` support filesystems within
a ZFS storage pool. In ``zfsloader``, the ZFS device name format is now
``zfs:pool``/``fs`` and the fully qualified file path format is
``zfs:pool``/``fs``:/``path/to/file``. The ``zfsboot`` boot block
accepts the kernel/loader name in the format
``pool``:``fs``:``path/to/file`` or, as before,
``pool``:``path/to/file``. In the latter case a default filesystem is
used (the pool root or a filesystem with the ``bootfs`` property). The
``zfsboot`` boot block passes the GUIDs of the selected storage pool and
dataset to ``zfsloader`` to be used as its
defaults.[`r237766 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237766>`__\ ]

[sparc64] FreeBSD/sparc64 now supports booting from ZFS via the
``zfsboot`` boot block and ``zfsloader``. For example, the following
commands create a mirrored storage pool ``rpool`` consisting of ``da0a``
and ``da0b`` and configure the storage pool as the root
filesystem:[`r236076 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236076>`__\ ]

.. code:: screen

    # gpart create -s vtoc8 da0
    # gpart add -t freebsd-zfs -s 10g da0
    # gpart add -t freebsd-swap -s 10g da0
    # gpart add -t freebsd-zfs -s 10g da0
    # zpool create rpool mirror da0a da0b
    # zpool set bootfs=rpool rpool
    # zpool export rpool
    # gpart bootcode -p /boot/zfsboot da0
    # sysctl kern.geom.debugflags=0x10
    # dd if=/boot/zfsloader of=/dev/da0a bs=512 oseek=1024 conv=notrunc
    # dd if=/boot/zfsloader of=/dev/da0b bs=512 oseek=1024 conv=notrunc
    # zpool import rpool
    # cp -p /boot/zfs/zpool.cache /rpool/boot/zfs/zpool.cache
    # zfs set mountpoint=/ rpool

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

[powerpc] The
`abtn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=abtn&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver, which supports ADB keyboards found on Apple laptops, has been
added.[`r230751 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230751>`__\ ]

[amd64] A workaround for Erratum 721 for AMD Processor Family 10h and
12h has been implemented. Under a highly specific and detailed set of
internal timing conditions, the processor may incorrectly update the
stack pointer after a long series of push and/or near-call instructions,
or a long series of pop and/or near-return
instructions.[`r233798 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233798>`__\ ]

[powerpc] The atibl(4) driver, which supports backlight control of ATI
graphics chips on PowerBooks and iBooks, has been
added.[`r232677 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232677>`__\ ]

The
`acpi\_wmi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_wmi&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports attaching multiple
instances.[`r229858 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229858>`__\ ]

[powerpc] The adm1030(4) driver for G4 MDD fans now shows its PWM
parameter in the device's
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable.[`r230290 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230290>`__\ ]

[arm] The cesa(4) driver for the Marvell crypto engine and security
accelerator has been
added.[`r234559 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234559>`__\ ]

[powerpc] The
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports PowerPC G4+
(MPC745x/MPC744x).[`r230305 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230305>`__\ ]

[amd64, i386] The
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports the Intel Sandy Bridge
microarchitecture.[`r234046 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234046>`__\ ]

The
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports software events. Simultaneous usage of software PMC
and hardware PMC is
allowed.[`r236238 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236238>`__\ ]

The pcf8563(4) driver for the NXP (Philips) PCF8563 RTC has been
added.[`r236078 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236078>`__\ ]

[powerpc] FreeBSD/powerpc now supports the PWM-controlled fans found on
the PowerMac SMU (System Management
Unit).[`r233471 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233471>`__\ ]

[arm] FreeBSD/arm now supports the Atmel SAM9XE family of
microcontrollers.[`r236081 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236081>`__\ ]

The following
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variables have been added: ``kern.proc.env`` for environment strings,
``kern.proc.auxv`` for ELF auxiliary vectors from a process's stack,
``kern.proc.groups`` for process groups, ``kern.proc.rlimit`` for
process resource limits, ``kern.proc.ps_strings`` for the ps\_strings
location, and ``kern.proc.osrel`` for the osreldate of the process's
binary.[\ `r230754 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230754>`__,
`r233950 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233950>`__]

The
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now handles suspend and resume correctly with no need to reload
the kernel
module.[\ `r229100 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229100>`__,
`r229369 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229369>`__]

A bug in the
`xhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xhci&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
(USB 3.0) driver has been fixed. It did not work with USB 3.0
hubs.[`r230302 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230302>`__\ ]

The
`viawd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=viawd&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver, which supports the watchdog timer found in VIA south bridges
(VT8251, CX700, VX800, VX855, VX900), has been
added.[`r229927 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229927>`__\ ]

The
`wbwd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wbwd&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver, which supports the watchdog timer found in Winbond Super I/O
chips, has been
added.[`r235926 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235926>`__\ ]

.. raw:: html

   <div class="sect4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The drm2(4) Intel GPU driver, which supports GEM and KMS and works with
new generations of GPUs such as IronLake, SandyBridge, and IvyBridge,
has been added. The
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports SandyBridge and IvyBridge CPU
northbridges.[\ `r236926 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236926>`__,
`r236927 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236927>`__,
`r239965 <http://svn.freebsd.org/viewvc/base?view=revision&revision=239965>`__]

The
`snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been updated. It now supports and provides HDMI, new volume
control, automatic recording source selection, runtime reconfiguration,
more then 4 PCM devices on a controller, multichannel recording,
additional playback/record streams, higher bandwidth, and more
informative device
names.[`r232798 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232798>`__\ ]

The
`snd\_hdspe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hdspe&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been added. This supports RME HDSPe AIO and RayDAT sound
cards.[`r233165 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233165>`__\ ]

GPL-licensed headers in the
`snd\_emu10kx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10kx&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__,
`snd\_maestro3(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_maestro3&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__,
and
`snd\_csa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_csa&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
drivers have been replaced with BSD-licensed one. These drivers are now
fully BSD-licensed and included in the ``GENERIC`` kernel on
FreeBSD/amd64 and
FreeBSD/i386.[\ `r230964 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230964>`__,
`r230985 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230985>`__,
`r231047 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231047>`__,
`r235769 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235769>`__]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

A bug in the
`ae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ae&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver which could prevent it from working under certain conditions has
been
fixed.[`r229520 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229520>`__\ ]

The
`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports TX/RX checksum offloading support for the ASIX
AX88772B
controller.[`r229106 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229106>`__\ ]

The
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been improved:

-  Unnecessary link up/down has been
   eliminated.[`r229864 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229864>`__\ ]

-  A bug has been fixed which could prevent IPMI from working when the
   interface was marked as
   down.[`r236216 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236216>`__\ ]

-  It now supports remote PHYs, which allow the controller to perform
   MDIO type accesses to a remote transceiver by using message pages
   defined through MRBE (MultiRate Backplane Ethernet). This is found on
   machines such as the Dell PowerEdge M610
   Blade.[`r235818 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235818>`__\ ]

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
and brgphy(4) drivers have been improved:

-  A bug which could prevent DMA functionality from working correctly
   has been
   fixed.[`r229350 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229350>`__\ ]

-  It now works with a PCI-X BCM 5704 controller that is connected to
   AMD-8131 PCI-X
   bridge.[`r233495 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233495>`__\ ]

-  It now supports the BCM 5720 and BCM 5720C PHY, and the BCM 57780
   1000BASE-T media
   interface.[\ `r229357 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229357>`__,
   `r229867 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229867>`__,
   `r232134 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232134>`__]

-  It now supports a
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   tunable ``dev.bge.N.msi`` to control the use of MSI. The default
   value is ``1``
   (enabled).[`r231734 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231734>`__\ ]

The
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
and
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
drivers have been updated to firmware version 1.5.2.0. They now support
device configuration via a plain text configuration file, IPv6 hardware
checksumming, IPv6 TSO and LRO, a ``loadfw`` command in the cxgbetool(8)
utility which allows installing a firmware to the card, and
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variables under ``dev.t4nex.N.misc`` for various
information.[\ `r231093 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231093>`__,
`r237925 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237925>`__]

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports NVIDIA (ULi) M5261/M5263 PCI FastEthernet
controllers, which are found on the ULi M1563 South Bridge and M1689
Bridge.[`r229334 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229334>`__\ ]

The
`et(4) <http://www.FreeBSD.org/cgi/man.cgi?query=et&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now works on all platforms. A bug which could prevent
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
support from working has been fixed. A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable under ``dev.et.N.stats`` has been added for hardware MAC
statistics.[\ `r229711 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229711>`__,
`r229717 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229717>`__,
`r229720 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229720>`__]

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been updated to version 2.3.4. It now supports newer
i210/i211
devices.[`r238262 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238262>`__\ ]

The
`iwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwn&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports Intel Centrino Wireless-N + WiMAX 6150 and
Wireless-N 100/130
series.[\ `r233838 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233838>`__,
`r235843 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235843>`__]

The
`miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
bus driver now supports device hints ``hint.miibus.N.phymask`` for PHY
addresses being probed. This is useful to manually probe PHYs which do
not implement basic the register set of IEEE 802.3. Also, the
`miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been changed to a hinted bus, allowing to add child devices
via hints and to set their attach arguments in addition to
automatically-probed
PHYs.[`r230709 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230709>`__\ ]

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now uses 64-bit DMA addressing on 64-bit
platforms.[`r229524 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229524>`__\ ]

The
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been updated to firmware version 1.4.55 from
Myricom.[`r236413 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236413>`__\ ]

The nsphyter(4) driver now supports National
DP83849.[`r232137 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232137>`__\ ]

The
`oce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=oce&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver, which supports Emulex OneConnect 10Gbit Ethernet cards, has been
added.[`r231663 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231663>`__\ ]

The
`ral(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ral&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports Ralink RT2800 and RT3000
chipsets.[`r236004 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236004>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports the RTL8411 PCIe Gigabit Ethernet controller. A bug
which could prevent WoL (Wake-on-LAN) from working on RTL8168E has been
fixed.[\ `r229529 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229529>`__,
`r231731 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231731>`__]

The
`runfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=runfw&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
firmware has been updated to version
0.236.[`r234028 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234028>`__\ ]

The
`sfxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sfxge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver, which supports 10Gb Ethernet adapters based on Solarflare
SFC9000 family controllers, has been
added.[`r228100 <http://svn.freebsd.org/viewvc/base?view=revision&revision=228100>`__\ ]

The smcphy(4) driver now supports the Seeq Technology 80220 PHY. This is
found on Adaptec AIC-6915 Starfire Ethernet controllers supported by the
`sf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sf&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver.[`r233485 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233485>`__\ ]

The
`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports the
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
framework, reporting link-state changes, and
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variables under ``dev.ti.N`` for interrupt moderation
parameters.[\ `r229417 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229417>`__,
`r229438 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229438>`__]

A bug in the
`ti(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ti&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver which could prevent it from working correctly with the ``PAE``
kernel option has been
fixed.[`r229441 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229441>`__\ ]

The
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been updated to improve its link establishment and link-state
detection.[`r229540 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229540>`__\ ]

The
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now enables flow control capability in the PHY
drivers.[`r229641 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229641>`__\ ]

The
`xnb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xnb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
Xen Paravirtualized Backend Ethernet Driver (netback) has been updated.
This is attached via the newbus framework and works properly in both HVM
and PVM
mode.[`r231697 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231697>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
pseudo-interface now supports reporting link-state changes depending on
the status of the member
interfaces.[`r236051 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236051>`__\ ]

The ``table`` argument in the
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
packet filter rule syntax now supports IP address, interface name, port
number, and jail ID. The following syntax is
valid:[`r234597 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234597>`__\ ]

.. code:: programlisting

    skipto tablearg ip from any to any via table(42) in

The FreeBSD
`ip6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
protocol stack has been improved in terms of its performance.
Benchmarking can be found at http://people.freebsd.org/~bz/bench/.

The FreeBSD
`ip6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
protocol stack now supports multiple
FIBs.[`r232292 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232292>`__\ ]

An IPv6 default route configured via Router Advertisement messages is
now reinstalled correctly when the default route is manually removed and
then another RA message is received for the same
route.[`r230604 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230604>`__\ ]

A bug which could return an incorrect value for the
``IPV6_MULTICASE_HOPS`` socket option has been
fixed.[`r227885 <http://svn.freebsd.org/viewvc/base?view=revision&revision=227885>`__\ ]

A new
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3&manpath=FreeBSD+9.1-RELEASE>`__
name ``NET_RT_IFLISTL`` has been added. This queries the address list
and works on extended and extensible structures ``if_msghdrl`` and
``ifa_msghdrl`` without breaking the
ABI.[`r231768 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231768>`__\ ]

The
`netmap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netmap&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
fast packet I/O framework has been added. The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__,
lem(4),
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__,
and
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
drivers now support this framework. The technical details can be found
at
http://info.iet.unipi.it/~luigi/netmap/.[\ `r231650 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231650>`__,
`r235527 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235527>`__]

The FreeBSD
`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
protocol stack now supports a new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable ``net.inet.sctp.blackhole``. If this is set to ``1``, no
``ABORT`` is sent back in response to an incoming ``INIT``. If this is
set to ``2``, no ``ABORT`` is sent back in response to an
out-of-the-blue packet. If set to ``0`` (the default), ``ABORT``\ s are
sent.[`r231045 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231045>`__\ ]

A bug which could cause a system panic when ``SCTP_RECVINFO`` or
``SCTP_NXTINFO`` is specified to the
`getsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=getsockopt&sektion=2&manpath=FreeBSD+9.1-RELEASE>`__
system call has been
fixed.[`r231049 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231049>`__\ ]

The FreeBSD
`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
protocol stack now supports the ``SCTP_REMOTE_UDP_ENCAPS_PORT`` socket
option.[\ `r231070 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231070>`__,
`r231140 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231140>`__]

The ``SO_PROTOCOL`` and ``SO_PROTOTYPE`` socket options have been added.
These return the socket protocol
number.[`r232805 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232805>`__\ ]

The ``TCP_KEEPINIT``, ``TCP_KEEPIDLE``, ``TCP_KEEPINTVL``, and
``TCP_KEEPCNT`` socket options have been added. These allow controlling
initial timeout, idle time, idle resend interval, and idle send count on
a per-socket
basis.[`r232945 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232945>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been updated to version
1.20.00.25.[`r240758 <http://svn.freebsd.org/viewvc/base?view=revision&revision=240758>`__\ ]

The
`ahci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahci&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports a new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
tunable ``hw.ahci.force``. This controls whether it attempts to attach
an AHCI-capable device even if it is configured to use legacy emulation.
This is enabled by
default.[`r229291 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229291>`__\ ]

The new
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__-based
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports old
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
tunables ``hw.ata.ata_dma`` and ``hw.ata.atapi_dma``, for backward
compatibility.[`r231251 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231251>`__\ ]

The
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports SEMB (SATA Enclosure Management Bridge) devices,
which are equivalent to the SCSI SES/SAF-TE
devices.[`r236778 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236778>`__\ ]

A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable ``kern.cam.pmp.hide_special`` has been added. This controls
whether special PMP ports such as PMP (Port MultiPlier) configuration or
SEMB (SATA Enclosure Management Bridge) will be exposed or hidden. The
default value is ``1``
(hidden).[`r236765 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236765>`__\ ]

The ctl(4) driver, which supports
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
Target Layer and
`ctladm(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctladm&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__,
a userland control utility, have been added. ctl(4) is a disk and
processor device emulation subsystem supporting tagged queuing, SCSI
task attribute, SCSI implicit command ordering, full task management,
multiple ports, multiple simultaneous initiators, multiple simultaneous
backing stores, mode sense/select, and error injection
support.[`r231772 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231772>`__\ ]

The
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports Audio CDs in the same way as
`acd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acd&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
did. It will report a 2352-byte sector size to the
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
subsystem and use the ``READ CD`` command for reading the data. This
fixes an interoperability issue with
```multimedia/vlc`` <http://svnweb.FreeBSD.org/ports/head/multimedia/vlc/pkg-descr?revision=HEAD>`__.[`r230014 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230014>`__\ ]

The
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports ``BIO_DELETE``. To select the method, a new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable ``kern.cam.da.N.delete_method`` has been added for each device
instance. The following values are
supported:[`r236677 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236677>`__\ ]

.. raw:: html

   <div class="informaltable">

+-----------+--------------------------------------------------------------+
| Value     | Method                                                       |
+===========+==============================================================+
| NONE      | no provisioning support reported by the device               |
+-----------+--------------------------------------------------------------+
| DISABLE   | provisioning support was disabled because of errors          |
+-----------+--------------------------------------------------------------+
| ZERO      | WRITE SAME (10) command to write zeroes                      |
+-----------+--------------------------------------------------------------+
| WS10      | WRITE SAME (10) command with UNMAP bit set                   |
+-----------+--------------------------------------------------------------+
| WS16      | use WRITE SAME (16) command with UNMAP bit set               |
+-----------+--------------------------------------------------------------+
| UNMAP     | use UNMAP command (equivalent of the ATA DSM TRIM command)   |
+-----------+--------------------------------------------------------------+

.. raw:: html

   </div>

When it was ``NONE``, the device did not report logical block
provisioning support via respective VPD pages. One can set a specific
method for testing and it will be disabled automatically when not
supported on the device.

The **MIRROR**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class now supports ``BIO_DELETE``. This means the ``TRIM`` command will
be issued on supported devices when deleting
data.[`r238500 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238500>`__\ ]

The **MULTIPATH**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class has been updated. It now supports Active/Active mode, Active/Read
mode as hybrid of Active/Active and Active/Passive, keeping a failed
path without removing the geom provider, manual configuration without
on-disk metadata, and ``add``, ``remove``, ``fail``, ``restore``,
``configure`` subcommands in the
`gmultipath(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmultipath&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility to manage the configured
paths.[\ `r229303 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229303>`__,
`r234916 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234916>`__]

The **PART\_LDM**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class has been added. This partition scheme has support for Logical Disk
Manager, which is also known as dynamic volumes in Microsoft Windows NT.
Note that JBOD, RAID0, and RAID5 volumes are not supported
yet.[`r234406 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234406>`__\ ]

The **PART\_MBR**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class now allows a primary or extended Linux swap partition to be used
as the system dump
device.[`r230763 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230763>`__\ ]

[amd64, i386] The **RAID**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class is now included in the ``GENERIC``
kernel.[`r235877 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235877>`__\ ]

The **RAID**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class now supports disks with over 2TB capacity for the Intel metadata
format.[`r230244 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230244>`__\ ]

The **RAID**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class now supports the DDF metadata format, which is defined in the SNIA
Common RAID Disk Data Format Specification
v2.0.[`r235874 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235874>`__\ ]

The **UNCOMPRESS**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class and the
`mkulzma(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkulzma&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility have been added. This class supports lzma compressed images like
the **UZIP**
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
class and the
`mkuzip(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkuzip&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility.[`r235483 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235483>`__\ ]

[amd64, i386] The
`hpt27xx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hpt27xx&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been added. This supports HighPoint RocketRAID 27xx-based SAS
6Gb/s
HBA.[`r229975 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229975>`__\ ]

[amd64, i386] The
`isci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isci&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver, which supports the integrated SAS controller in the Intel C600
(Patsburg) chipset, has been
added.[`r231689 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231689>`__\ ]

Bugs in
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
target mode have been
fixed.[`r230019 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230019>`__\ ]

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports the Intel X540
adapter.[`r230775 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230775>`__\ ]

A bug in the
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been fixed. It could cause some inconsistencies due to missed
interrupt acknowledgements and output the following log
message:[`r227533 <http://svn.freebsd.org/viewvc/base?view=revision&revision=227533>`__\ ]

.. code:: screen

    mfi0: COMMAND 0xffffffXXXXXXXXXX TIMEOUT AFTER XX SECONDS

The
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver now supports single-message MSI, and Drake Skinny and Thunderbolt
cards. The
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
tunable ``hw.mfi.msi`` has been added and it is enabled by
default.[\ `r229611 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229611>`__,
`r234429 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234429>`__]

The
`mps(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mps&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been updated to version 14.00.00.01-fbsd. This now supports
Integrated RAID, WarpDrive controllers, WRITE12 and READ12 for direct
I/O, SCSI protection information (EEDP), Transport Level Retries (TLR)
for tape drives, and LSI's userland
utility.[\ `r230920 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230920>`__,
`r231679 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231679>`__,
`r237876 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237876>`__]

A bug in the
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has been fixed. It could attempt to attach MegaRAID cards which
should be handled by the
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver.[`r232562 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232562>`__\ ]

The
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
storage device driver now enables power save mode by
default.[`r229107 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229107>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The FreeBSD NFS filesystem has been improved:

-  It now supports a timeout on positive name cache entries on the
   client side. A new mount option ``nametimeo`` has been added and set
   to ``60`` (in seconds) by
   default.[`r233326 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233326>`__\ ]

-  A memory leak when a ZFS volume is exported via the FreeBSD NFS
   server has been
   fixed.[`r234740 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234740>`__\ ]

-  A bug has been fixed. When a process writes to an mmap-backed file on
   an NFS filesystem, flushing changes to the data could fail under some
   circumstances such as errors due to permission mismatch, and this
   failure could not be detected as an error. A new
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   variable ``vfs.nfs.nfs_keep_dirty_on_error`` has been added to
   control the behavior on the client side related to this issue. When
   this is set to ``1``, the pages where a write operation failed are
   kept dirty. The default value is set to
   ``0``.[`r233730 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233730>`__\ ]

-  The
   `nfsv4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsv4&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
   filesystem now supports a
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   variable ``vfs.nfsd.disable_checkutf8``. This disables the check for
   UTF-8 compliance in filenames. This is disabled by default. Note that
   enabling this may help wht some interoperability issues but results
   in an NFSv4 server that is not RFC 3530
   compliant.[`r229799 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229799>`__\ ]

The
`tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
filesystem is not an experimental implementation
anymore.[`r234511 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234511>`__\ ]

The
`tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
filesystem now supports a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable ``vfs.tmpfs.memory_reserved`` to set the amount of required
free pages when
`tmpfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tmpfs&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
attempts to allocate a new
node.[`r234849 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234849>`__\ ]

FreeBSD's ZFS filesystem has been updated by merging improvements from
the illumos project. The following changes are
made:[\ `r229578 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229578>`__,
`r232328 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232328>`__]

-  New properties, ``clones`` and ``written``, have been added.

-  The
   `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   ``send`` command now reports an estimated size of the stream.

-  The
   `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   ``destroy`` command now reports an estimate of the space which would
   be reclaimed, when ``-n`` is specified.

-  The
   `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   ``get`` command now supports the ``-t type`` flag to specify the data
   type.

A simple script ``zfsboottest.sh`` has been added to the source tree.
This checks if the system is configured correctly when using ZFS as the
root filesystem. The script is located at
``/usr/src/tools/tools/zfsboottest.sh`` and it uses the ``zfsboottest``
binary program in the same
directory.[`r227705 <http://svn.freebsd.org/viewvc/base?view=revision&revision=227705>`__\ ]

The binary program can be built and installed by the following command:

.. code:: screen

    # cd /usr/src/tools/tools/zfsboottest
    # make
    # make install

After that, the following command can be used to check the system.
``poolname`` is the ZFS storage pool name to boot:

.. code:: screen

    # sh /usr/src/tools/tools/zfsboottest/zfsboottest.sh poolname

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable ``vfs.zfs.txg.timeout`` has been changed from read-only to
writable.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

`auth.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=auth.conf&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
has been removed because it was deprecated years
ago.[`r238481 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238481>`__\ ]

The
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``fwdownload`` subcommand for firmware update on
SCSI devices from Hitachi, HP, IBM, Plextor, Quantum, and Seagate. This
subcommand will reprogram the firmware on devices connected over an
ATA/SATA
transport.[`r237740 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237740>`__\ ]

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports ``domain-search`` (option number 119, described in
RFC 3397). This allows a DHCP server to publish a list of implicit
domain suffixes used during name lookup. If this option is specified, a
``search`` keyword will be added to
``/etc/resolv.conf``.[`r230597 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230597>`__\ ]

The
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now uses 53 characters for the device names in
``/etc/dumpdates``. This was previously limited to 32
characters.[`r230047 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230047>`__\ ]

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now correctly supports a percent-encoded user and password part
in a
URL.[`r235253 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235253>`__\ ]

The
`fdlopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fdlopen&sektion=3&manpath=FreeBSD+9.1-RELEASE>`__
function has been implemented. This is an interface for
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
to load a shared object by file
descriptor.[`r230410 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230410>`__\ ]

The
`fopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fopen&sektion=3&manpath=FreeBSD+9.1-RELEASE>`__
function now supports the ``x`` (an exclusive create-and-open mode)
option in the ISO/IEC 9899:2011 and C11
standards.[`r229845 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229845>`__\ ]

A bug in the
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
compiler has been fixed. It could lead to incorrect calculations when
``-ffast-math`` is
specified.[`r234023 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234023>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
daemon now supports specifying the filename of its process ID file in
`hast.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hast.conf&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__.[`r229509 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229509>`__\ ]

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``vlanhwcsum`` parameter to set or reset checksum
offloading capability on
VLANs.[`r231221 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231221>`__\ ]

A bug in the
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility which could display an error message in a jail with no IPv6
support has been
fixed.[`r238872 <http://svn.freebsd.org/viewvc/base?view=revision&revision=238872>`__\ ]

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``carp state state`` parameter to set the state
to ``backup`` or ``master``
forcibly.[`r232486 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232486>`__\ ]

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a configuration file
(`jail.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=jail.conf&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__)
for complex
configurations.[`r235839 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235839>`__\ ]

The
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``-p pid`` option to accept either a process ID
or a thread
ID.[`r237789 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237789>`__\ ]

The
`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``-v`` flag to display an entry in ``name=value``
format, and a ``-N`` flag to display only the
name.[`r236118 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236118>`__\ ]

The
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``-n`` flag to ignore the error status when the
specified module is already
loaded.[`r233560 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233560>`__\ ]

**libedit** has been updated to a NetBSD snapshot as of 28 December,
2009.[`r237738 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237738>`__\ ]

`libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+9.1-RELEASE>`__
now supports ``include`` and ``includedir`` directives. They allow to
include specified files for the
configuration.[`r236523 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236523>`__\ ]

Lock handling performance in the **libthr** pthread library has been
improved. It now works 10 times faster especially under the condition
that a mutex is heavily
contested.[`r234372 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234372>`__\ ]

A new C++ stack has been imported. This consists of **libcxxrt**,
originally developed by a FreeBSD developer under contract by PathScale
and open sourced by the FreeBSD and NetBSD foundations, and **libc++**
from the LLVM project. **libcxxrt** is a drop-in replacement for GNU
**libsupc++**, which implements the C++ runtime support for features
such as run-time type information, dynamic casting, thread-safe static
initializer, and exceptions. **libc++** implements the C++11 standard
library, and will replace GNU **libstdc++** in a future release. In
9.1-RELEASE, **libstdc++** is still installed as standard and now
dynamically links against **libsupc++**. This allows libraries linking
**libstdc++** and **libc++** to both be used in the same program, to aid
migration.[`r235798 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235798>`__\ ]

The
`limits(1) <http://www.FreeBSD.org/cgi/man.cgi?query=limits&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``-P pid`` option to control limits for the
specified
process.[`r230919 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230919>`__\ ]

The
`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``-e`` flag to display PCI error details in
listing mode. When this is specified, the status of any error bits in
the PCI status register and PCI-express device status register will be
displayed. It also lists any errors indicated by version 1 of
PCI-express Advanced Error Reporting
(AER).[`r237731 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237731>`__\ ]

The
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now shows the superpage mapping flag when displaying process
virtual memory
mappings.[`r229710 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229710>`__\ ]

The
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports an ``-e`` flag to display process environment
variables, an ``-x`` flag to display ELF auxiliary vectors, and an
``-l`` flag to display resource
limits.[\ `r230917 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230917>`__,
`r230918 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230918>`__]

A bug in the
`remquo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=remquo&sektion=3&manpath=FreeBSD+9.1-RELEASE>`__
functions where the quotient did not always have the correct sign when
the remainder was ``0``, and another bug that the remainder and quotient
were both off by a bit in certain cases involving subnormal remainders,
have been fixed. Note that these bugs affected all platforms except
amd64 and
i386.[`r234535 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234535>`__\ ]

The
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
run-time linker now supports GCC's RELRO (RElocation Read-Only). This
prevents the GOT (Global Offset Table) from being
overwritten.[`r231579 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231579>`__\ ]

The
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
run-time linker now supports a GNU hash section (``DT_GNU_HASH``), which
is a replacement of optional ELF hash
section.[`r235396 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235396>`__\ ]

The
`setbuf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setbuf&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility and **libstdbuf** library have been added. This controls the
default buffering behavior of standard stdio
streams.[`r235139 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235139>`__\ ]

The
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now correctly supports per-thread I/O statistics of ZFS in the
``-m 	io``
option.[`r227702 <http://svn.freebsd.org/viewvc/base?view=revision&revision=227702>`__\ ]

The
`unzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unzip&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
utility now supports a ``-Z`` option for
zipinfo.[`r234330 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234330>`__\ ]

The
`xlocale(3) <http://www.FreeBSD.org/cgi/man.cgi?query=xlocale&sektion=3&manpath=FreeBSD+9.1-RELEASE>`__
API has been implemented. This consists of ``_l``-suffixed versions of
various standard library functions that use the global locale, making
them take an explicit locale parameter and allowing thread-safe extended
locale support. Most of these APIs are required for IEEE Std 1003.1-2008
(POSIX.1-2008 or ISO/IEC 9945:2009) compatibility, and are required by
**libc++** and recent versions of **GNOME**. This implementation also
supports several extensions for compatibility with Apple
**Darwin**.[`r235785 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235785>`__\ ]

.. raw:: html

   <div class="sect3">

--------------

2.3.1 `periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__ Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A new variable ``daily_status_zfs_zpool_list_enable`` has been added. It
controls whether or not to list all of the ZFS pools in
``periodic/daily/404.status-zfs``. The default value is
``YES``.[`r231721 <http://svn.freebsd.org/viewvc/base?view=revision&revision=231721>`__\ ]

The default value of ``daily_scrub_zfs_default_threshold`` used in
``periodic/daily/800.scrub-zfs`` is now set to 35
days.[`r229381 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229381>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

--------------

2.3.2 `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__ Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``rc.d/nfsd`` script now sets the ``vfs.nfsd.server_max_nfsvers``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
variable to ``4`` when ``nfsv4_server_enable`` is set to
``YES``.[`r227607 <http://svn.freebsd.org/viewvc/base?view=revision&revision=227607>`__\ ]

A backwards compatibility issue when both ``ipv6_enable=YES`` and
``ipv6_gateway_enable=YES`` are defined at the same time has been
fixed.[`r242189 <http://svn.freebsd.org/viewvc/base?view=revision&revision=242189>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**ISC BIND** has been updated to version
9.8.3-P4.[`r241417 <http://svn.freebsd.org/viewvc/base?view=revision&revision=241417>`__\ ]

The **compiler-rt** library, which provides low-level target-specific
interfaces such as functions in **libgcc**, has been updated to revision
147467.[`r236018 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236018>`__\ ]

**file**
(`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__)
has been updated to version
5.11.[`r237983 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237983>`__\ ]

GNU
`gperf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gperf&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
has been updated to version 3.0.3 (the latest GPLv2-licensed
version).[`r230237 <http://svn.freebsd.org/viewvc/base?view=revision&revision=230237>`__\ ]

**libarchive**,
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__,
and
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__
have been updated to version
2.8.5.[`r229588 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229588>`__\ ]

The **libpcap** library has been updated to
1.2.1.[`r236167 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236167>`__\ ]

**libstdc++** has been updated to revision 135556 of the
``gcc-4_2-branch`` (the last LGPLv2-licensed
version).[`r229551 <http://svn.freebsd.org/viewvc/base?view=revision&revision=229551>`__\ ]

The **LLVM** compiler infrastructure and **clang**, a C language family
front-end, version 3.1 have been imported. Note that it is not used for
building the FreeBSD base system by
default.[`r236144 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236144>`__\ ]

The ``netcat`` utility has been updated to version
5.1.[`r235971 <http://svn.freebsd.org/viewvc/base?view=revision&revision=235971>`__\ ]

**OpenSSL** has been updated to version
0.9.8x.[`r237998 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237998>`__\ ]

The **tcpdump**
(`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__)
utility has been updated to version
4.2.1.[`r236192 <http://svn.freebsd.org/viewvc/base?view=revision&revision=236192>`__\ ]

The **TENEX C shell**
(`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1&manpath=FreeBSD+9.1-RELEASE>`__)
has been updated to version
6.18.01.[`r232633 <http://svn.freebsd.org/viewvc/base?view=revision&revision=232633>`__\ ]

The **timezone** database has been updated to the **tzdata2012a**
release.[`r233447 <http://svn.freebsd.org/viewvc/base?view=revision&revision=233447>`__\ ]

The **zlib** library has been updated to version
1.2.7.[`r237691 <http://svn.freebsd.org/viewvc/base?view=revision&revision=237691>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

2.5 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported version of the **KDE** desktop environment
(```x11/kde4`` <http://svnweb.FreeBSD.org/ports/head/x11/kde4/pkg-descr?revision=HEAD>`__)
has been updated to 4.8.4.

[powerpc] Issues where the FreeBSD installation CDROM image caused a
panic, and was not recognized on OpenBIOS-based environments like QEMU,
have been
fixed.[`r234055 <http://svn.freebsd.org/viewvc/base?view=revision&revision=234055>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

.. raw:: html

   <div class="sect2">

3.1 Upgrading using `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__ or a source-based procedure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[amd64, i386] Beginning with FreeBSD 6.2-RELEASE, binary upgrades
between RELEASE versions (and snapshots of the various security
branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as an unmodified ``GENERIC`` kernel, distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
utility requires that the host being upgraded have Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported using to
the instructions in ``/usr/src/UPDATING``.

For more specific information about upgrading instructions, see
http://www.FreeBSD.org/releases/9.1R/installation.html.

.. raw:: html

   <div class="important">

    **Important:** Upgrading FreeBSD should, of course, only be
    attempted after backing up *all* data and configuration files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

--------------

3.2 User-visible incompatibilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD 9.0 and later have several incompatibilities in system
configuration which you might want to know before upgrading your system.
*Please read this section and the `Upgrading Section in 9.0-RELEASE
Release
Notes <http://www.freebsd.org/releases/9.0R/relnotes-detailed.html#UPGRADE>`__
carefully before submitting a problem report and/or posting a question
to the FreeBSD mailing lists.*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 9.1-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
