=================================
FreeBSD 9.0-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 9.0-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2012 The FreeBSD Documentation Project

| $FreeBSD: stable/9/release/doc/en\_US.ISO8859-1/relnotes/article.sgml
  230006 2012-01-12 05:51:11Z hrs $

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

SPARC, SPARC64, SPARCengine, and UltraSPARC are trademarks of SPARC
International, Inc in the United States and other countries. SPARC
International, Inc owns all of the SPARC trademarks and under licensing
agreements allows the proper use of these trademarks by its members.

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

The release notes for FreeBSD 9.0-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 9.0-STABLE development
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
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Release Engineering and Integration <#RELENG>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__
3.1 `Upgrading using freebsd-update(8) or a source-based
procedure <#AEN1251>`__
3.2 `User-visible incompatibilities <#AEN1267>`__
3.2.1 `Update of ``dialog`` <#AEN1272>`__
3.2.2 `Partition Metadata Integrity Check <#AEN1277>`__
3.2.3 `ATA/SATA subsystem now cam(4)-based <#AEN1308>`__
3.2.4 `Network Configuration Changes in ``/etc/rc.conf`` <#AEN1395>`__
3.2.5 `Openresolv and ``/etc/resolv.conf`` <#AEN1613>`__
3.2.6 `Disk Partition Management Utilities <#AEN1630>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 9.0-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 9.0-RELEASE is a release distribution. It
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
9.0-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 8.2-RELEASE.

Typical release note items document recent security advisories issued
after 8.2-RELEASE, new drivers or hardware support, new commands or
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

Problems described in the following security advisories have been fixed.
For more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+----------------+----------------+---------------------------------------------+
| Advisory       | Date           | Topic                                       |
+================+================+=============================================+
| `SA-11:01.moun | 20 April 2011  | Network ACL mishandling in                  |
| td <http://sec |                | `mountd(8) <http://www.FreeBSD.org/cgi/man. |
| urity.freebsd. |                | cgi?query=mountd&sektion=8&manpath=FreeBSD+ |
| org/advisories |                | 9.0-RELEASE>`__                             |
| /FreeBSD-SA-11 |                |                                             |
| :01.mountd.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:02.bind | 28 May 2011    | BIND remote DoS with large RRSIG RRsets and |
|  <http://secur |                | negative caching                            |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-11:0 |                |                                             |
| 2.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:04.comp | 28 September 2 | Errors handling corrupt compress file in    |
| ress <http://s | 011            | `compress(1) <http://www.FreeBSD.org/cgi/ma |
| ecurity.freebs |                | n.cgi?query=compress&sektion=1&manpath=Free |
| d.org/advisori |                | BSD+9.0-RELEASE>`__                         |
| es/FreeBSD-SA- |                | and                                         |
| 11:04.compress |                | `gzip(1) <http://www.FreeBSD.org/cgi/man.cg |
| .asc>`__       |                | i?query=gzip&sektion=1&manpath=FreeBSD+9.0- |
|                |                | RELEASE>`__                                 |
+----------------+----------------+---------------------------------------------+
| `SA-11:05.unix | 28 September 2 | Buffer overflow in handling of UNIX socket  |
|  <http://secur | 011            | addresses                                   |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-11:0 |                |                                             |
| 5.unix.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:06.bind | 23 December 20 | Remote packet Denial of Service against     |
|  <http://secur | 11             | `named(8) <http://www.FreeBSD.org/cgi/man.c |
| ity.freebsd.or |                | gi?query=named&sektion=8&manpath=FreeBSD+9. |
| g/advisories/F |                | 0-RELEASE>`__                               |
| reeBSD-SA-11:0 |                | servers                                     |
| 6.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:07.chro | 23 December 20 | Code execution via chrooted ftpd            |
| ot <http://sec | 11             |                                             |
| urity.freebsd. |                |                                             |
| org/advisories |                |                                             |
| /FreeBSD-SA-11 |                |                                             |
| :07.chroot.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:08.teln | 23 December 20 | telnetd code execution vulnerability        |
| etd <http://se | 11             |                                             |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 1:08.telnetd.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:09.pam\ | 23 December 20 | pam\_ssh improperly grants access when user |
| _ssh <http://s | 11             | account has unencrypted SSH private keys    |
| ecurity.freebs |                |                                             |
| d.org/advisori |                |                                             |
| es/FreeBSD-SA- |                |                                             |
| 11:09.pam_ssh. |                |                                             |
| asc>`__        |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:10.pam  | 23 December 20 | ``pam_start()`` does not validate service   |
| <http://securi | 11             | names                                       |
| ty.freebsd.org |                |                                             |
| /advisories/Fr |                |                                             |
| eeBSD-SA-11:10 |                |                                             |
| .pam.asc>`__   |                |                                             |
+----------------+----------------+---------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The FreeBSD kernel now supports Capsicum Capability Mode. Capsicum is a
set of features for sandboxing support, using a capability model in
which the capabilities are file descriptors. Two new kernel options
``CAPABILITIES`` and ``CAPABILITY_MODE`` have been added to the
``GENERIC`` kernel. For more information about Capsicum, see
http://www.cl.cam.ac.uk/research/security/capsicum/.[`r219129 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219129>`__\ ]

[amd64, i386] The FreeBSD
`dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
framework now supports ``systrace`` for system calls of ``linux32`` and
``freebsd32`` on FreeBSD/amd64. Two new ``systrace_linux32`` and
``systrace_freebsd32`` kernel modules provide support for tracing compat
system calls in addition to the native system call tracing provided by
the ``systrace``
module.[\ `r219559 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219559>`__,
`r219561 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219561>`__]

[amd64, i386, powerpc] The FreeBSD ELF image activator now supports the
``PT_GNU_STACK`` program header. This is disabled by default. New
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variables ``kern.elf32.nxstack`` and ``kern.elf64.nxstack`` allow
enabling ``PT_GNU_STACK`` for the specified ABIs (e.g. ``elf32`` for
32-bit
ABI).[\ `r217152 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217152>`__,
`r217396 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217396>`__]

The
`hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
(Helper Hook) and
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
(Kernel Helpers) KPIs have been implemented. These are a kind of
superset of
`pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
framework for more general use in the kernel. The
`hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
KPI provides a way for kernel subsystems to export hook points that
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
modules can hook to provide enhanced or new functionality to the kernel.
The
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
KPI provides a framework for managing
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
modules, which indirectly use the
`hhook(9) <http://www.FreeBSD.org/cgi/man.cgi?query=hhook&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
KPI to register their hook functions with hook points of interest within
the kernel. These allow a structured way to dynamically extend the
kernel at runtime in an ABI preserving
manner.[\ `r216758 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216758>`__,
`r216615 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216615>`__]

[amd64, i386, pc98] A
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
tunable ``hw.memtest.tests`` has been added. This controls whether to
perform memory testing at boot time or not. The default value is ``1``
(perform a memory
test).[`r224516 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224516>`__\ ]

A new resource accounting API has been implemented. It can keep
per-process, per-jail, and per-loginclass resource accounting
information. Note that this is not built nor installed by default. To
build and install them, specify ``options RACCT`` in the kernel
configuration file and rebuild the base system as described in the
`FreeBSD
Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r220137 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220137>`__\ ]

A new resource-limiting API has been implemented. It works in
conjunction with the ``RACCT`` resource accounting implementation and
takes user-configurable actions based on the set of rules it maintains
and the current resource usage. The
`rctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility has been added to manage the rules in userland. Note that this
is not built nor installed by default. To build and install them,
specify ``options RCTL`` in the kernel configuration file and rebuild
the base system as described in the `FreeBSD
Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r220163 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220163>`__\ ]

The
`sendmsg(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmsg&sektion=2&manpath=FreeBSD+9.0-RELEASE>`__
and
`recvmsg(2) <http://www.FreeBSD.org/cgi/man.cgi?query=recvmsg&sektion=2&manpath=FreeBSD+9.0-RELEASE>`__
system calls in the FreeBSD Linux ABI compatibility have been
improved.[`r220031 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220031>`__\ ]

The
`open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=open&sektion=2&manpath=FreeBSD+9.0-RELEASE>`__
and
`fhopen(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fhopen&sektion=2&manpath=FreeBSD+9.0-RELEASE>`__
system calls now support the ``O_CLOEXEC`` flag, which allows setting
the ``FD_CLOEXEC`` flag for the newly created file descriptor. This is
standardized in IEEE Std 1003.1-2008 (POSIX, Single UNIX Specification
Version
4).[`r219999 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219999>`__\ ]

The
`posix\_fallocate(2) <http://www.FreeBSD.org/cgi/man.cgi?query=posix_fallocate&sektion=2&manpath=FreeBSD+9.0-RELEASE>`__
system call has been implemented. This is a function in POSIX to ensure
that a part of the storage for regular file data is allocated on the
file system storage
media.[`r220791 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220791>`__\ ]

Two new system calls ``setloginclass(2)`` and ``getloginclass(2)`` have
been added. This makes it possible for the kernel to track the login
class a process is assigned to, which is required for the ``RCTL``
resource limiting
framework.[`r219304 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219304>`__\ ]

[amd64] FreeBSD now supports executing FreeBSD 1/i386 a.out binaries on
FreeBSD/amd64. Note that this is not built nor installed by default. To
build and install them, specify ``options COMPAT_43`` in the kernel
configuration file and rebuild the base system as described in the
`FreeBSD
Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r220238 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220238>`__\ ]

The following
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variables have been added to show the availability of various kernel
features:[\ `r218485 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218485>`__,
`r219028 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219028>`__,
`r219029 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219029>`__]

.. raw:: html

   <div class="INFORMALTABLE">

+--------------------+--------------------------------------------------------+
| `sysctl(8) <http:/ | Description                                            |
| /www.FreeBSD.org/c |                                                        |
| gi/man.cgi?query=s |                                                        |
| ysctl&sektion=8&ma |                                                        |
| npath=FreeBSD+9.0- |                                                        |
| RELEASE>`__        |                                                        |
| variable name      |                                                        |
+====================+========================================================+
| ``kern.features.uf | ACL (Access Control List) support in UFS               |
| s_acl``            |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.uf | journaling support through                             |
| s_gjournal``       | `gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query |
|                    | =gjournal&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__    |
|                    | for UFS                                                |
+--------------------+--------------------------------------------------------+
| ``kern.features.uf | UFS disk quotas support                                |
| s_quota``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.uf | 64-bit UFS disk quotas support                         |
| s_quota64``        |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.so | FFS soft-updates support                               |
| ftupdates``        |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ff | FFS snapshot support                                   |
| s_snapshot``       |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.nf | NFS client (old implementation)                        |
| sclient``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.nf | NFS client (new implementation)                        |
| scl``              |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.nf | NFS server (old implementation)                        |
| sserver``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.nf | NFS server (new implementation)                        |
| sd``               |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.kd | Kernel DTrace hooks which are required to load DTrace  |
| trace_hooks``      | kernel modules                                         |
+--------------------+--------------------------------------------------------+
| ``kern.features.kt | Kernel support for KTR kernel tracing facility         |
| r``                |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.kt | Kernel support for system call tracing                 |
| race``             |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.hw | Kernel support for HW PMC                              |
| pmc_hooks``        |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.sy | System V message queues support                        |
| sv_msg``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.sy | System V semaphores support                            |
| sv_sem``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.p1 | POSIX P1003.1B message queues support                  |
| 003_1b_mqueue``    |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.p1 | POSIX P1003.1B semaphores support                      |
| 003_1b_semaphores` |                                                        |
| `                  |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.kp | POSIX P1003.1B real-time extensions                    |
| osix_priority_sche |                                                        |
| duling``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.st | Support for capturing the kernel stack                 |
| ack``              |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.sy | System V shared memory segments support                |
| sv_shm``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.pp | Support usage of external PPS signal by kernel PLL     |
| s_sync``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.re | Kernel support for interfaces necessary for regression |
| gression``         | testing                                                |
+--------------------+--------------------------------------------------------+
| ``kern.features.in | Support for modules compiled with the INVARIANTS       |
| variant_support``  | option                                                 |
+--------------------+--------------------------------------------------------+
| ``kern.features.ze | Zero copy sockets support                              |
| ro_copy_sockets``  |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.li | mchain library                                         |
| bmchain``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.sc | SCSI devices support                                   |
| bus``              |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ma | Mandatory Access Control Framework support             |
| c``                |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.au | BSM audit support                                      |
| dit``              |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM Gate module                                       |
| om_gate``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM uzip read-only compressed disks support           |
| om_uzip``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM cache module                                      |
| om_cache``         |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM mirroring support                                 |
| om_mirror``        |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM striping support                                  |
| om_stripe``        |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM concatenation support                             |
| om_concat``        |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM RAID-3 functionality                              |
| om_raid3``         |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM FOX redundant path mitigation support             |
| om_fox``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM multipath support                                 |
| om_multipath``     |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.g_ | GEOM virtual storage support                           |
| virstor``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM-based Disk Encryption                             |
| om_bde``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM crypto module                                     |
| om_eli``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM journaling support                                |
| om_journal``       |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM shared secret device support                      |
| om_shsec``         |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM support for volume names from UFS superblocks     |
| om_vol``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM labeling support                                  |
| om_label``         |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM Sun/Solaris partitioning support                  |
| om_sunlabel``      |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM BSD disklabels support                            |
| om_bsd``           |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM NEC PC9800 partitioning support                   |
| om_pc98``          |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM Linux LVM partitioning support                    |
| om_linux_lvm``     |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM partitioning class for PC-9800 disk partitions    |
| om_part_pc98``     |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM partitioning class for SMI VTOC8 disk labels      |
| om_part_vtoc8``    |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM partitioning class for BSD disklabels             |
| om_part_bsd``      |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM partitioning class for extended boot records      |
| om_part_ebr``      | support                                                |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM EBR partitioning class: backward-compatible       |
| om_part_ebr_compat | partition names                                        |
| ``                 |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM partitioning class for GPT partitions support     |
| om_part_gpt``      |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM partitioning class for Apple-style partitions     |
| om_part_apm``      |                                                        |
+--------------------+--------------------------------------------------------+
| ``kern.features.ge | GEOM partitioning class for MBR support                |
| om_part_mbr``      |                                                        |
+--------------------+--------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

The default boot loader menu has been
updated.[`r222417 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222417>`__\ ]

[ia64] The
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
loader now supports PBVM (Pre-Boot Virtual Memory). This allows linking
the kernel at a fixed virtual address without having to make any
assumptions about the physical memory layout. The PBVM also allows fine
control of the address where the kernel and its modules are to be
loaded.[`r219541 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219541>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

[powerpc] FreeBSD/powerpc now supports Sony Playstation 3 using the
OtherOS feature available on firmwares 3.15 and
earlier.[`r217044 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217044>`__\ ]

A new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
tunable ``machdep.disable_tsc`` has been added. Setting this to a
non-zero value disables use of TSC (Time Stamp Counter) by turning off
boot-time CPU frequency calibration, DELAY(9) with TSC, and using TSC as
a CPU ticker. Another new
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
tunable ``machdep.disable_tsc_calibration`` allows to skip the TSC
frequency calibration only. This is useful when one wants to use the
nominal frequency of the chip in Intel processors, for
example.[\ `r219473 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219473>`__,
`r220577 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220577>`__]

[amd64, i386] The FreeBSD
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
subsystem now supports USB 3.0 by
default.[`r223098 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223098>`__\ ]

The FreeBSD
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
subsystem now supports USB packet filter. This allows to capture packets
which go through each USB host controller. The implementation is almost
based on
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
code. The userland program
`usbdump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdump&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
has been
added.[`r215649 <http://svn.freebsd.org/viewvc/base?view=revision&revision=215649>`__\ ]

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Network Interface Support
'''''''''''''''''''''''''''''''''

A bug in the
`alc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=alc&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver which could make AR8152-based network interfaces stop working has
been
fixed.[`r217649 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217649>`__\ ]

A bxe(4) driver for Broadcom NetXtreme II 10GbE controllers (BCM57710,
BCM57711, BCM57711E) has been
added.[`r219647 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219647>`__\ ]

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been updated to version
7.11.0.[`r220009 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220009>`__\ ]

A
`cxgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgbe&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver for Chelsio T4 (Terminator 4) based 10Gb/1Gb adapters has been
added.[`r218794 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218794>`__\ ]

[i386] The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now works correctly in kernels with the ``PAE``
option.[`r218832 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218832>`__\ ]

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been updated to version
7.3.2.[`r219753 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219753>`__\ ]

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been updated to version
2.2.5.[`r223350 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223350>`__\ ]

The
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports Intel I350 PCIe Gigabit Ethernet
controllers.[`r218530 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218530>`__\ ]

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been updated to version
2.3.8.[`r217593 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217593>`__\ ]

Firmware images in the
`iwn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iwn&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver for 1000, 5000, 6000, and 6500 series cards have been
updated.[`r220892 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220892>`__\ ]

A bug in the
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been fixed. It could prevent RX checksum offloading from
working.[`r216860 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216860>`__\ ]

A bug in the
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver which could prevent reinitialization after changing the MTU has
been
fixed.[`r217794 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217794>`__\ ]

A bug in the
`ral(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ral&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
and
`run(4) <http://www.FreeBSD.org/cgi/man.cgi?query=run&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
drivers which could prevent ``hostap`` mode from working has been
fixed.[`r217511 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217511>`__\ ]

A rdcphy(4) driver for RDC Semiconductor R6040 10/100 PHY has been
added.[`r216828 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216828>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports RTL8168E/8111E-VL PCIe Gigabit Ethernet controllers
and RTL8401E PCIe Fast Ethernet
controllers.[\ `r217498 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217498>`__,
`r218760 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218760>`__]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports TX interrupt moderation on RTL810xE PCIe Fast
Ethernet
controllers.[`r217766 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217766>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports another mechanism for RX interrupt moderation
because of performance problems. A
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variable ``dev.re.N.int_rx_mod`` has been added to control amount of
time to delay RX interrupt processing, in units of microsecond. Setting
it to ``0`` completely disables RX interrupt moderation. A
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
tunable ``hw.re.intr_filter`` controls whether the old mechanism
utilizing MSI/MSI-X capability on supported controllers is used or not.
When set to a non-zero value, the
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver uses the old mechanism. The default value is ``0`` and this
tunable has no effect on controllers without MSI/MSI-X
capability.[`r217902 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217902>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports TSO (TCP Segmentation Offload) on RealTek
RTL8168/8111 C or later controllers. Note that this is disabled by
default because broken frames can be sent under certain
conditions.[\ `r217246 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217246>`__,
`r217832 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217832>`__]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports enabling TX and/or RX checksum offloading
independently from each other. Note that TX IP checksum is disabled on
some RTL8168C-based network interfaces because it can generate an
incorrect IP checksum when the packet contains IP
options.[\ `r217381 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217381>`__,
`r218289 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218289>`__]

A bug in the
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been fixed. It could cause a panic when receiving a jumbo
frame on an RTL8169C, 8169D, or 8169E controller-based network
interface.[`r217296 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217296>`__\ ]

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports RTL8105E PCIe Fast Ethernet
controllers.[`r217911 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217911>`__\ ]

The rlphy(4) driver now supports the Realtek RTL8201E 10/100 PHY found
in RTL8105E
controllers.[`r217910 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217910>`__\ ]

A bug in the
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been fixed. It could prevent a proper reinitialization on
DP83815, DP83816, and SiS 900/7016 controllers when the configuration of
multicast packet handling and/or promiscuous mode is
changed.[`r217548 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217548>`__\ ]

A bug in the
`vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vlan&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
pseudo interface han been fixed. It could have a random interface
identifier in an automatically configured IPv6 link-local address,
instead of one generated with the parent interface's IEEE 802 48-bit MAC
address and an algorithm described in RFC
4291.[`r216650 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216650>`__\ ]

A
`vte(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vte&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver for RDC R6040 Fast Ethernet controllers, which are commonly found
on the Vortex86 System On a Chip, has been
added.[`r216829 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216829>`__\ ]

A
`vxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vxge&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver for the Neterion X3100 10GbE Server/Storage adapter has been
added.[`r221167 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221167>`__\ ]

A bug in the
`wpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wpi&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been fixed. It could display the following error messages and
result in the device being
unusable:[`r216824 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216824>`__\ ]

.. code:: SCREEN

    wpi0: could not map mbuf (error 12)
    wpi0: wpi_rx_intr: bus_dmamap_load failed, error 12

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
now supports IPv6 in the ``fwd``
action.[`r225044 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225044>`__\ ]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
now supports the ``call`` and ``return`` actions. Upon the
``call number`` action, the current rule number is saved in the internal
stack and ruleset processing continues with the first rule numbered
``number`` or higher. The ``return`` action takes the rule number saved
to internal stack by the latest ``call`` action and returns ruleset
processing to the first rule with number greater than that saved
number.[`r223666 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223666>`__\ ]

FreeBSD's
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
support now uses half of the hash size as the authenticator hash size in
Hashed Message Authentication Mode (HMAC-SHA-256, HMAC-SHA-384, and
HMAC-SHA-512) as described in RFC 4868. This was a fixed 96-bit length
in prior releases because the implementation was based on an old
Internet draft draft-ietf-ipsec-ciph-sha-256-00. Note that this means
9.0-RELEASE and later are no longer interoperable with the older FreeBSD
releases.[`r218794 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218794>`__\ ]

For Infiniband support, OFED (OpenFabrics Enterprise Distribution)
version 1.5.3 has been imported into the base system. Note that this is
not built nor installed by default. To build and install them, specify
``WITH_OFED=yes`` in ``/etc/src.conf`` and rebuild the base system as
described in the `FreeBSD
Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r219820 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219820>`__\ ]

The FreeBSD TCP/IP network stack now supports IPv4 prefixes with /31 as
described in RFC 3021, “Using 31-Bit Prefixes on IPv4 Point-to-Point
Links”.[`r226572 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226572>`__\ ]

A bug in the FreeBSD TCP/IP network stack has been fixed. Source address
selection could not be performed when multicast options were present but
without an interface being
specified.[`r217169 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217169>`__\ ]

A bug in the ``IPV6_PKTINFO`` option used in
`sendmsg(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmsg&sektion=2&manpath=FreeBSD+9.0-RELEASE>`__
has been fixed. The ``IPV6_USE_MIN_MTU`` state set by
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2&manpath=FreeBSD+9.0-RELEASE>`__
was
ignored.[`r225682 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225682>`__\ ]

The FreeBSD TCP/IP network stack now supports the
`mod\_cc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
pluggable congestion control framework. This allows TCP congestion
control algorithms to be implemented as dynamically loadable kernel
modules. The following kernel modules are available as of 9.0-RELEASE:
`cc\_chd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_chd&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
for the CAIA-Hamilton-Delay algorithm,
`cc\_cubic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_cubic&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
for the CUBIC algorithm,
`cc\_hd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_hd&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
for the Hamilton-Delay algorithm,
`cc\_htcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_htcp&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
for the H-TCP algorithm,
`cc\_newreno(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_newreno&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
for the NewReno algorithm, and
`cc\_vegas(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cc_vegas&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
for the Vegas algorithm. The default algorithm can be set by a new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variable ``net.inet.tcp.cc.algorithm``. The value must be set to one of
the names listed by ``net.inet.tcp.cc.available``, and ``newreno`` is
the default set at boot time. For more detail, see the
`mod\_cc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
and
`mod\_cc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mod_cc&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
manual
pages.[\ `r216109 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216109>`__,
`r216114 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216114>`__,
`r216115 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216115>`__,
`r218152 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218152>`__,
`r218153 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218153>`__,
`r218155 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218155>`__]

An
`h\_ertt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=h_ertt&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
(Enhanced Round Trip Time)
`khelp(9) <http://www.FreeBSD.org/cgi/man.cgi?query=khelp&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
module has been added. This module allows per-connection, low noise
estimates of the instantaneous RTT in the TCP/IP network stack with a
robust implementation even in the face of delayed acknowledgments and/or
TSO (TCP Segmentation Offload) being in use for a
connection.[`r217806 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217806>`__\ ]

A new
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
socket option ``TCP_CONGESTION`` has been added. This allows to select
or query the congestion control algorithm that the TCP/IP network stack
will use for connections on the
socket.[`r218912 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218912>`__\ ]

The
`ng\_ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ipfw&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
node now supports
IPv6.[`r225586 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225586>`__\ ]

The
`ng\_one2many(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_one2many&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
node now supports the ``XMIT_FAILOVER`` transmit algorithm. This makes
packets deliver out of the first active ``many``
hook.[`r219127 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219127>`__\ ]

The
`ng\_netflow(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_netflow&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
node now supports NetFlow version 9. A new ``export9`` hook has been
added for NetFlow v9 data. Note that data export can be done
simultaneously in both version 5 and version
9.[`r219183 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219183>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ada(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ada&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver now supports write cache control. A new
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variable ``kern.cam.ada.write_cache`` determines whether the write cache
of
`ada(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ada&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
devices is enabled or not. Setting to ``1`` enables and ``0`` disables
the write cache, and ``-1`` leaves the device default behavior.
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variables ``kern.cam.ada.N.write_cache`` can override the configuration
in a per-device basis (the default value is ``-1``, which means to use
the global setting). Note that the value can be changed at runtime, but
it takes effect only after a device
reset.[`r220412 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220412>`__\ ]

The
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been updated to version
1.20.00.22.[`r224905 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224905>`__\ ]

The
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
subsystem now supports the descriptor format sense data of the SPC-3
(SCSI Primary Commands 3)
specification.[`r226067 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226067>`__\ ]

The
`geom\_map(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom_map&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
GEOM class has been added. This allows to generate multiple geom
providers based on a hard-coded layout of a device with no explicit
partition table such as embedded flash storage. For more information,
see the
`geom\_map(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom_map&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
manual
page.[`r220559 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220559>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
GEOM class now supports the following aliases for the MBR and EBR
schemes: ``fat32``, ``ebr``, ``linux-data``, ``linux-raid``, and
``linux-swap``.[`r218014 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218014>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
GEOM class now supports ``bios-boot`` GUID for the GPT scheme which is
used in GRUB 2
loader.[`r218014 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218014>`__\ ]

The
`graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
GEOM class has been added. This is a replacement of the
`ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver supporting various BIOS-based software
RAID.[`r219974 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219974>`__\ ]

The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variable ``kern.geom.confxml`` now contains information about disk
identification in an ``<ident>`` tag and disk model strings in a
``<descr>``
tag.[`r219056 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219056>`__\ ]

The
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
memory-backed pseudo disk device driver now supports a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variable ``vm.md_malloc_wait`` to specify whether a malloc-backed disk
will use ``M_WAITOK`` or ``M_NOWAIT`` for
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9&manpath=FreeBSD+9.0-RELEASE>`__
calls. The ``M_WAITOK`` setting can prevent memory allocation failure
under high load. If it is set to ``0``, a malloc-backed disk uses
``M_NOWAIT`` for memory allocation. The default value is
``0``.[`r216793 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216793>`__\ ]

A bug in the
`mmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mmc&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver that could cause device detection to fail has been
fixed.[\ `r216941 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216941>`__,
`r217509 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217509>`__]

The
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver has been
updated.[`r223958 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223958>`__\ ]

A
`tws(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tws&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
driver for 3ware 9750 SATA+SAS 6Gb/s RAID controllers has been
added.[`r226115 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226115>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The FreeBSD Fast File System now supports softupdates journaling. It
introduces a intent log into a softupdates-enabled file system which
eliminates the need for background
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
even on unclean shutdown. This can be enabled in a per-filesystem basis
by using the ``-j`` flag of the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility or the ``-j enable`` option of the
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility. Note that the 9.0-RELEASE installer automatically enables
softupdates journaling for newly-created UFS file
systems.[\ `r207141 <http://svn.freebsd.org/viewvc/base?view=revision&revision=207141>`__,
`r218726 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218726>`__]

The FreeBSD Fast File System now supports the ``TRIM`` command when
freeing data blocks. A new flag ``-t`` in the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
and
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utilities sets the TRIM-enable flag for a file system. The TRIM-enable
flag makes the file system send a delete request to the underlying
device for each freed block. The ``TRIM`` command is specified as a Data
Set Management Command in the ATA8-ACS2 standard to carry the
information related to deleted data blocks to a device, especially for a
SSD (Solid-State Drive) for
optimization.[`r216796 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216796>`__\ ]

A new flag ``-E`` has been added to the
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
and
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utilities. This clears unallocated blocks, notifying the underlying
device that they are not used and that their contents may be discarded.
This is useful in
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
for file systems which have been mounted on systems without ``TRIM``
support, or with ``TRIM`` support disabled, as well as filesystems which
have been copied from one device to
another.[`r221233 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221233>`__\ ]

The FreeBSD NFS subsystem has been updated. The new implementation
supports NFS version 4 in addition to 2 and 3. The kernel options for
the NFS server and client are changed from ``NFSSERVER`` and
``NFSCLIENT`` to ``NFSD`` and ``NFSCL``.
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variables which start with ``vfs.nfssrv.`` have been renamed to
``vfs.nfsd.``. The NFS server now supports
``vfs.nfsd.server_max_nfsvers`` and ``vfs.nfsd.server_min_nfsvers``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
variables to specify the maximum and the minimum NFS version number
which the server accepts. The default value is set to ``3`` and ``2``,
respectively.[`r221124 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221124>`__\ ]

To enable NFSv4, the following variables are needed on the server side
in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__:

.. code:: PROGRAMLISTING

    nfsv_server_enable="YES"
    nfsv4_server_enable="YES"
    nfsuserd_enable="YES"

and the following line is needed in ``/etc/exports``:

.. code:: PROGRAMLISTING

    V4: /

For more information about NFSv4 and its configuration, see the
`nfsv4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsv4&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
and
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
manual pages.

The FreeBSD NFS subsystem now supports a ``nocto`` mount option. This
disables the close-to-open cache coherency check at open time. This
option may improve performance for read-only mounts, but should only be
used only if the data on the server changes rarely. The
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now also supports this flag
keyword.[`r221436 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221436>`__\ ]

A
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
tunable ``vfs.typenumhash`` has been added and set to ``1`` by default.
This enables to use a hash calculation on the file system identification
number internally used in the kernel. This fixes the “Stale NFS file
handle” error on NFS clients when upgrading or rebuilding the kernel on
the NFS server due to unexpected change of these identification number
values.[`r225537 <http://svn.freebsd.org/viewvc/base?view=revision&revision=225537>`__\ ]

The FreeBSD ZFS subsystem has been updated to the SPA (Storage Pool
Allocator, also known as zpool) version 28. It now supports data
deduplication, triple parity RAIDZ (raidz3), snapshot holds, log device
removal, zfs diff, zpool split, zpool import ``-F``, and read-only zpool
import.[`r219089 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219089>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

Complex exponential functions
`cexp(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cexp&sektion=3&manpath=FreeBSD+9.0-RELEASE>`__
and
`cexpf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cexpf&sektion=3&manpath=FreeBSD+9.0-RELEASE>`__,
and cube root function
`cbrtl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cbrtl&sektion=3&manpath=FreeBSD+9.0-RELEASE>`__
have been added to
**libm**.[\ `r219359 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219359>`__,
`r219571 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219571>`__]

The
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
and
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utilities are now based on **libarchive** version
2.8.4.[\ `r224152 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224152>`__,
`r224153 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224153>`__,
`r224154 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224154>`__]

The
`cpuset(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuset&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports a ``-C`` flag to create a new cpuset and assign an
existing process into that set, and an ``all`` keyword in the
``-l cpu-list`` option to specify all CPUs in the
system.[`r217416 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217416>`__\ ]

The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now uses
`resolvconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=resolvconf&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
to manage the
`resolv.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=resolv.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
file by default. A ``resolvconf_enable`` variable in
``/etc/dhclient-enter-hooks`` controls the
behavior.[`r219739 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219739>`__\ ]

A bug in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utility which could prevent the ``STAT`` FTP command from working
properly has been
fixed.[`r217505 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217505>`__\ ]

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports a ``-p`` flag to the ``show`` subcommand. This
allows showing providers' names of partitions instead of the partitions'
indexes.[`r219415 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219415>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now drops ``root`` privileges of the worker processes to the
``hast``
user.[`r218049 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218049>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports a ``checksum`` keyword to specify the checksum
algorithm in a ``resource`` section. As of 9.0-RELEASE, ``none``,
``sha256``, and ``crc32`` are
supported.[`r219351 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219351>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports a ``compression`` keyword to specify the
compression algorithm in a ``resource`` section. As of 9.0-RELEASE,
``none``, ``hole`` and ``lzf`` are
supported.[`r219354 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219354>`__\ ]

The
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports a ``source`` keyword to specify the local address
to bind to before connecting the remote
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
daemon.[`r219818 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219818>`__\ ]

An implementation of ``iconv()`` API libraries and utilities which are
standardized in Single UNIX Specification has been imported. These are
based on NetBSD's Citrus implementation. Note that these are not built
nor installed by default. To build and install them, specify
``WITH_ICONV=yes`` in ``/etc/src.conf`` and rebuild the base system as
described in the `FreeBSD
Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__.[`r219019 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219019>`__\ ]

The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports ``fdx``, ``flow``, ``hdx``, and ``loop`` keywords
as aliases of ``full-duplex``, ``flowcontrol``, ``half-duplex``, and
``loopback``,
respectively.[`r217013 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217013>`__\ ]

A
`readline(3) <http://www.FreeBSD.org/cgi/man.cgi?query=readline&sektion=3&manpath=FreeBSD+9.0-RELEASE>`__
API set has been imported into **libedit**. This is based on NetBSD's
implementation and BSD licensed utilities now use it instead of GNU
**libreadline**.[`r220370 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220370>`__\ ]

The
`makefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=makefs&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports the ISO 9660
format.[`r224762 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224762>`__\ ]

**libmd** and **libcrypt** now support the SHA-256 and SHA-512
algorithms.[\ `r220496 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220496>`__,
`r220497 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220497>`__]

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utility now does not expose the internal scope address representation
used in the FreeBSD kernel, which is derived from KAME IPv6 stack, in
the results of ``netstat -ani`` and
``netstat -nr``.[`r217642 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217642>`__\ ]

The
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports
`xz(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xz&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
compression. An ``X`` flag in the optional field has been added to
specify the
compression.[`r218127 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218127>`__\ ]

The
`pam\_group(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_group&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
module now supports ``ruser`` and ``luser`` options. The ``ruser`` make
it accept or reject based on the supplicant's group membership and this
is the default behavior. The ``luser`` checks the target user's group
membership instead of the supplicant's one. If neither option was
specified,
`pam\_group(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_group&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
assumes ``ruser`` and issues a
warning.[`r219563 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219563>`__\ ]

A
`poweroff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poweroff&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility has been added. This is equivalent
to:[`r216823 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216823>`__\ ]

.. code:: SCREEN

    # shutdown -p now

The
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports ``iface name name`` and
``iface description description`` commands. These have the same
functionalities as the ``name`` and ``description`` subcommands of the
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility.[`r218397 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218397>`__\ ]

The
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utility now supports an ``-o class`` option to display the login class
information of each process, and ``-o usertime`` and ``-o systime``
options for accumulated system and user CPU time,
respectively.[\ `r219307 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219307>`__,
`r219713 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219713>`__]

The
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
daemon now supports a ``noifprefix`` keyword to disable gathering
on-link prefixes from interfaces when no ``addr`` keyword is specified.
An entry in ``/etc/rtadvd.conf`` with ``noifprefix`` and no ``addr``
generates an RA message with no prefix information
option.[`r222732 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222732>`__\ ]

The
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
and
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
daemons now support the RDNSS and DNSSL options described in RFC 6106,
“IPv6 Router Advertisement Options for DNS Configuration”. A
`rtadvctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility to control the
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
daemon has been
added.[\ `r222732 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222732>`__,
`r224006 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224006>`__]

The
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
runtime linker now supports shared objects as filters in ELF shared
libraries. Both standard and auxiliary filtering have been supported.
The
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
linker's processing of a filter defers loading a filtee until a filter
symbol is referenced unless the ``LD_LOADFLTR`` environment variable is
defined or a ``-z loadfltr`` option was specified when the filter was
created.[`r216695 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216695>`__\ ]

A race condition in the
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utility has been fixed. When an ``-i`` option is specified, there could
be a short time window with no file with the original file
name.[`r217133 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217133>`__\ ]

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
program now supports ``kill`` as a built-in command. This allows
specifying ``%job`` which is equivalent to the corresponding process
group. Note that this built-in command returns the exit status ``2``
instead of ``1`` if a fatal error occurs as other built-in commands
do.[`r216629 <http://svn.freebsd.org/viewvc/base?view=revision&revision=216629>`__\ ]

A bug in the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
program has been fixed for POSIX conformance. It could return an
incorrect exit status when an ``exit`` command with no parameter is
specified in the ``EXIT trap`` handler, which is triggered when the
shell terminates. In trap actions for other signals, an ``exit`` command
with no parameter returns an exit status corresponding to the received
signal.[\ `r217176 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217176>`__,
`r217472 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217472>`__]

A bug in the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
program has been fixed. When a foreground job exits on a signal, a
message is printed to ``stdout`` about this. The buffer was not flushed
after printing which could result in the message being written to the
wrong file if the next command was a built-in and had ``stdout``
redirected.[`r217557 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217557>`__\ ]

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
program now supports a ``--`` flag in ``trap`` command to stop the
option
processing.[`r217461 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217461>`__\ ]

The ``%builtin`` keyword support in the ``$PATH`` variable has been
removed from the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
program. All built-in commands are always found before looking up
directories in
``$PATH``.[`r217206 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217206>`__\ ]

Arithmetic expression handling code in the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
program has been updated by importing code from **dash**. It now
supports the conditional operator (``?:``) and a bug in evaluation of &&
and \|\| around an arithmetic expression has been
fixed.[`r218466 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218466>`__\ ]

A bug in the
`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
daemon has been fixed. It had an interoperability issue when
transferring a large
file.[`r224536 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224536>`__\ ]

The
`utmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=utmp&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
user accounting database has been replaced by
`utmpx(3) <http://www.FreeBSD.org/cgi/man.cgi?query=utmpx&sektion=3&manpath=FreeBSD+9.0-RELEASE>`__.
User accounting utilities will now use ``utmpx`` database files
exclusively. The
`wtmpcvt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmpcvt&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utility can be used to convert ``wtmp`` files to the new format, making
it possible to read them using the updated
utilities.[`r202188 <http://svn.freebsd.org/viewvc/base?view=revision&revision=202188>`__\ ]

A
`utxrm(8) <http://www.FreeBSD.org/cgi/man.cgi?query=utxrm&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility has been added. This allows one to remove an entry from the
``utmpx`` database by hand. This is useful when a login daemon crashes
or fails to remove the entry during
shutdown.[`r218847 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218847>`__\ ]

The
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__:
utility now supports a ``zpool labelclear`` command. This allows to wipe
the label data from a drive that is not active in a
pool.[`r224171 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224171>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

``ACPI CA`` has been updated to version
20110527.[`r222544 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222544>`__\ ]

The **awk** has been updated to the 7 August 2011
release.[`r224731 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224731>`__\ ]

**ISC BIND** has been updated to version
9.8.1-P1.[`r228189 <http://svn.freebsd.org/viewvc/base?view=revision&revision=228189>`__\ ]

**GNU binutils** has been updated to 2.17.50 (as of 3 July 2007), which
is the last available version under
GPLv2.[`r218822 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218822>`__\ ]

The **compiler-rt** library, which provides low-level target-specific
interfaces such as functions in **libgcc**, has been
imported.[`r222656 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222656>`__\ ]

``dialog`` has been updated to version
1.1-20110707.[`r224014 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224014>`__\ ]

The ``netcat`` utility has been updated to version
4.9.[`r221793 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221793>`__\ ]

The **tnftp** (formerly known as **lukemftp**) has been updated to
tnftp-20100108.[`r223328 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223328>`__\ ]

**GNU GCC** and **libstdc++** have been updated to rev 127959 of
``gcc-4_2-branch`` (the last GPLv2-licensed
version).[`r220150 <http://svn.freebsd.org/viewvc/base?view=revision&revision=220150>`__\ ]

**gdtoa**, a set of binary from/to decimal number conversion routines
used in FreeBSD's **libc** library has been updated to a snapshot as of
4 March,
2011.[`r219557 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219557>`__\ ]

The **LESS** program has been updated to version
v444.[`r222906 <http://svn.freebsd.org/viewvc/base?view=revision&revision=222906>`__\ ]

The **LLVM** compiler infrastructure and **clang**, a C language family
front-end, version 3.0 have been imported. Note that it is not used for
building the FreeBSD base system by default. In the FreeBSD build
infrastructure, the
`clang(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__,
`clang++(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang++&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__,
and
`clang-cpp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang-cpp&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utilities can be used in ``CC``, ``CXX``, and ``CPP``
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
variables,
respectively.[`r208954 <http://svn.freebsd.org/viewvc/base?view=revision&revision=208954>`__\ ]

**Openresolv** version 3.4.4 has been imported. The
`resolvconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=resolvconf&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility now manages the
`resolv.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=resolv.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
file.[`r219734 <http://svn.freebsd.org/viewvc/base?view=revision&revision=219734>`__\ ]

The **OpenSSH** utility has been updated to 5.8p2, and optimization for
large bandwidth-delay product connection and ``none`` cipher support
have been
merged[\ `r221484 <http://svn.freebsd.org/viewvc/base?view=revision&revision=221484>`__,
`r224638 <http://svn.freebsd.org/viewvc/base?view=revision&revision=224638>`__]

The **pf** packet filter has been updated to version
4.5.[`r223637 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223637>`__\ ]

**sendmail** has been updated to version
8.14.5.[`r223067 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223067>`__\ ]

The **timezone** database has been updated to the **tzdata2011m**
release.[`r226750 <http://svn.freebsd.org/viewvc/base?view=revision&revision=226750>`__\ ]

The
`unifdef(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unifdef&sektion=1&manpath=FreeBSD+9.0-RELEASE>`__
utility has been updated to version
2.5.6.[`r217698 <http://svn.freebsd.org/viewvc/base?view=revision&revision=217698>`__\ ]

The **xz** program has been updated from 5.0.0 to a snapshot as of 11
July,
2011.[`r223935 <http://svn.freebsd.org/viewvc/base?view=revision&revision=223935>`__\ ]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A new installer
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
has been added and integrated into installation ISO images. The
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility is also available for configuration after the
installation.[`r218799 <http://svn.freebsd.org/viewvc/base?view=revision&revision=218799>`__\ ]

The supported version of the **KDE** desktop environment
(```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__)
has been updated from 4.5.5 to 4.7.3.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

.. raw:: html

   <div class="SECT2">

3.1 Upgrading using freebsd-update(8) or a source-based procedure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[amd64, i386] Beginning with FreeBSD 6.2-RELEASE, binary upgrades
between RELEASE versions (and snapshots of the various security
branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as a unmodified GENERIC kernel distributed as a part
of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility requires that the host being upgraded have Internet
connectivity.

Source-based upgrades (those based on recompiling the FreeBSD base
system from source code) from previous versions are supported, according
to the instructions in ``/usr/src/UPDATING``.

For more specific information about upgrading instructions, see
http://www.FreeBSD.org/releases/9.0R/installation.html.

.. raw:: html

   <div class="IMPORTANT">

    **Important:** Upgrading FreeBSD should, of course, only be
    attempted after backing up *all* data and configuration files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2 User-visible incompatibilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section describes notable incompatibilities which you might want to
know before upgrading your system. *Please read this section and the
`Errata document <http://www.FreeBSD.org/releases/9.0R/errata.html>`__
carefully before submitting a problem report and/or posting a question
to the FreeBSD mailing lists.*

.. raw:: html

   <div class="SECT3">

--------------

3.2.1 Update of ``dialog``
^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``dialog`` library is used in FreeBSD's new installer and the
FreeBSD Ports Collection to display a dialog window and allow users to
select various options. Note that it is updated in 9.0-RELEASE and there
are several differences in key operations which might confuse users who
are familiar with releases prior to 9.0-RELEASE. For example, pushing
the enter key in a checklist window will no longer check an item. The
new version consistently uses space bar for selecting an item and the
enter key for OK/Cancel selection.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.2 Partition Metadata Integrity Check
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD now checks the integrity of partition metadata when a partition
table is found on a disk though the GEOM **PART** subsystem. This
detection is automatically performed when a disk device is ready. The
GEOM **PART** class in the kernel verifies all generic partition
parameters obtained from the disk metadata, and if some inconsistency is
detected, the partition table will be rejected with the following
diagnostic message:

.. code:: SCREEN

    GEOM_PART: Integrity check failed

This integrity check is enabled by default. On a system prior to
9.0-RELEASE, the inconsistencies were silently ignored. Therefore, there
is a possibility that this prevents a system from booting after
upgrading it to 9.0-RELEASE. More specifically, the kernel cannot mount
the system partition at boot time in some cases.

If this happens, a
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
tunable ``kern.geom.part.check_integrity`` can be used as a workaround.
Enter the following lines in the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
prompt at boot time:

.. code:: SCREEN

    set kern.geom.part.check_integrity="0"
    boot

These commands temporarily disable the integrity check. If it was the
cause of the boot failure, the FreeBSD kernel should detect the
partitions as the prior release did, after entering the commands. This
configuration can be added into ``/boot/loader.conf`` as follows:

.. code:: PROGRAMLISTING

    kern.geom.part.check_integrity="0"

To check inconsistent metadata after booting on the system, use the
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility on the system. A corrupted entry will be displayed like the
following:

.. code:: SCREEN

    % gpart show
    =>        63  1953525104  mirror/gm0  MBR  (931G) [CORRUPT]
              63  1953525105           1  freebsd  [active]  (931G)

For more information, see the
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
manual page.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.3 ATA/SATA subsystem now cam(4)-based
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In 9.0-RELEASE, the FreeBSD ATA/SATA disk subsystem has been replaced
with a new
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__-based
implementation.
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
stands for Common Access Method, which is an implementation of an API
set originally for SCSI-2 and standardized as "SCSI-2 Common Access
Method Transport and SCSI Interface Module". FreeBSD has used the
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
subsystem to handle SCSI devices since 3.X.

Although the new
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__-based
ATA/SATA subsystem provides various functionality which the old
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
did not have, it also has some incompatibilities:

-  An ATA/SATA disk is now recognized as a device node with a name
   ``ada0`` instead of ``ad0``. Currently, a symbolic link ``/dev/ad0``
   is automatically generated for ``/dev/ada0`` to keep backward
   compatibility. This symbolic link generation can be controlled by a
   ``kern.cam.ada.legacy_aliases`` (enabled by default). You might want
   to update ``/etc/fstab`` and/or consider using volume labels (see
   `glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   for more details) for specifying each file system to be mounted.

-  The
   `atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility cannot be used for
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__-based
   devices. The
   `camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility is a replacement.

-  `ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   software RAID is now supported by the
   `graid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   GEOM class. It generates a device node with a name ``/dev/raid/r0``
   if you previously had ``/dev/ar0``. Note that this is not enabled by
   default. To enable it, enter the following line in the
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   prompt:

   .. code:: SCREEN

       set geom_raid_load="YES"
       boot

   or add the following line to ``/boot/loader.conf``:

   .. code:: PROGRAMLISTING

       geom_raid_load="YES"

   and reboot the system. A symbolic link like ``/dev/ar0`` will NOT be
   generated for ``/dev/raid/r0``. Therefore, if your system used
   ``/dev/ar0`` as the root partition, mounting local file systems will
   fail because it is renamed to ``/dev/raid/r0``. You need to update
   ``/etc/fstab`` manually in that case.

-  The
   `burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility does not work with
   `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__-based
   devices. Use the cdrecord(1) utility in
   ```sysutils/cdrtools`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
   instead.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.4 Network Configuration Changes in ``/etc/rc.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Although variables in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
are basically compatible with earlier releases, ones related to network
configuration are changed because of reorganization of the
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
scripts.

-  An address configuration now always needs an address family keyword.
   For example, the following line

   .. code:: PROGRAMLISTING

       ifconfig_em0="192.168.2.1 netmask 255.255.255.0"

   should be

   .. code:: PROGRAMLISTING

       ifconfig_em0="inet 192.168.2.1 netmask 255.255.255.0"

   Although the old convention is still supported in the existing
   variables for backward compatibility, some new variables do not
   support it.

-  The ``ifconfig_IF_alias0`` variable now requires an address family
   keyword to support non-IPv4 address families. For instance,

   .. code:: PROGRAMLISTING

       ifconfig_em0_alias0="192.168.2.10 netmask 255.255.255.255"

   should be

   .. code:: PROGRAMLISTING

       ifconfig_em0_alias0="inet 192.168.2.10 netmask 255.255.255.255"

   Different address families can coexist like the following:

   .. code:: PROGRAMLISTING

       ifconfig_em0_alias0="inet 192.168.2.10 netmask 255.255.255.255"
       ifconfig_em0_alias1="inet6 2001:db8:1::1 prefixlen 64"

   Note that IPv6 alias configurations in ``ifconfig_IF_aliasN`` will be
   ignored when no ``ifconfig_IF_ipv6`` variable is defined because it
   determines whether IPv6 functionality is enabled on that interface or
   not (this variable will be explained later).

-  All alias and static routing configurations through
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
   variables will be deactivated when invoking
   `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   scripts or the
   `service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   command with the ``stop`` keyword.

   .. code:: SCREEN

       # service netif stop em0

   stops the interface ``em0``.

   .. code:: SCREEN

       # service routing stop

   deactivates all static route configurations.

   Releases prior to FreeBSD 9.0-RELEASE did not support this
   functionality properly for non-IPv4 protocols.

-  IPv6 configuration handling has been changed in the following way.
   Before in-depth explanations, here is a before-and-after example.
   What was previously:

   .. code:: PROGRAMLISTING

       ifconfig_em0="192.168.2.1 netmask 255.255.255.0"
       ifconfig_em0_alias0="192.168.2.2 netmask 255.255.255.255"

       ipv6_enable="YES"
       ipv6_ifconfig_em0="2001:db8:1::1 prefixlen 64"
       ipv6_ifconfig_em0_alias0="2001:db8:2::1 prefixlen 64"
       # em1 uses SLAAC for IPv6 address configuration

   should be in 9.0-RELEASE:

   .. code:: PROGRAMLISTING

       ifconfig_em0="inet 192.168.2.1 netmask 255.255.255.0"
       ifconfig_em0_ipv6="inet6 2001:db8:1::1 prefixlen 64 accept_rtadv"
       ifconfig_em0_alias0="inet 192.168.2.2 netmask 255.255.255.255"
       ifconfig_em0_alias1="inet6 2001:db8:2::1 prefixlen 64"

       ifconfig_em1_ipv6="inet6 accept_rtadv"

   More specific explanations of the changes are as follows:

   -  The ``ipv6_enable`` variable is deprecated. IPv6 functionality on
      the system is enabled by default. No IPv6 communication will
      happen if you configure no IPv6 address.

      9.0-RELEASE now supports intermediate configurations between a
      host and a router IPv6 node. The ``ipv6_enable`` variable assumed
      that the system was a host node when ``ipv6_gateway_enable`` was
      set to ``NO`` (default), and a router node if not. A host node
      always accepted ICMPv6 Router Advertise messages, and a router did
      not.

      In 9.0-RELEASE, this model is still applied but on a per-interface
      basis, not a system-wide basis. Specifically, if an interface has
      an ``ACCEPT_RTADV`` flag, RA messages will be accepted on that
      interface for SLAAC (StateLess Address AutoConfiguration)
      regardless of whether the packet forwarding is enabled or not.

      In addition to them, a per-interface flag ``NO_RADR`` and a
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      variable ``net.inet6.ip6.rfc6204w3`` have been added. This
      controls whether default router list information via RA messages
      on an RA-accepting interface should be ignored or not. In an IPv6
      router model, it is not supposed to accept RA messages as an
      information source for the default router list. Because of that,
      FreeBSD 9.0-RELEASE ignores the default router list part when IPv6
      packet forwarding is enabled, even if the interface has an
      ``ACCEPT_RTADV`` flag. However, this can make for a difficult
      situation when the system has to work as a CPE (Customer Premises
      Equipment) which needs RA messages from the upstream network for
      network configuration and acts as a router for the LAN
      simultaneously. For more information about this kind of
      configuration, see RFC 6204.

      To support this kind of configuration, the ``ipv6_cpe_wanif``
      variable in
      `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
      can be used.

      .. code:: PROGRAMLISTING

          ipv6_gateway_enable="YES"
          ipv6_cpe_wanif="em0"

      means the ``em0`` interface accepts RA messages and the default
      router information in them, and the other interfaces ignore the
      default router information part even when the ``ACCEPT_RTADV``
      flag is set on them.

      ``ipv6_cpe_wanif`` handling internally sets the
      ``net.inet6.ip6.rfc6204w3`` and the ``net.inet6.ip6.no_radr``
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      variables to ``1``. Note that both are set to ``0`` by default.
      When the former is set to ``1``, FreeBSD accepts the default
      router list even when IPv6 packet forwarding is enabled. Note that
      a system administrator needs to set a ``NO_RADR`` flag on the
      other RA-accepting interfaces, if any, to prevent it from
      accepting unexpected default router information. The latter
      variable means the ``NO_RADR`` flag is automatically set on them.

      If ``ipv6_enable="YES"`` is defined in FreeBSD 9.0-RELEASE, it
      sets ``ipv6_activate_all_interfaces="YES"`` in ``/etc/rc.conf``
      and the ``inet6 accept_rtadv``
      `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      option on all network interfaces. Note that this is only for
      backward compatibility. The ``ipv6_enable`` should not be used in
      FreeBSD 9.0-RELEASE.

   -  The ``ipv6_ifconfig_IF`` variable is renamed to
      ``ifconfig_IF_ipv6``. This variable controls whether IPv6
      functionality should be enabled on that interface or not. If
      ``ifconfig_IF_ipv6``, is not set, there is no IPv6 functionality
      on the interface ``IF``.

      Note that the ``ifconfig_IF_ipv6`` variable always needs the
      address family keyword ``inet6``. If you need an automatic
      link-local address only, the following line is enough:

      .. code:: PROGRAMLISTING

          ifconfig_em0_ipv6="inet6 auto_linklocal"

      If you need full-blown IPv6 functionality on all interfaces like
      prior releases with ``ipv6_enable="YES"``, including ones with no
      ``ifconfig_IF_ipv6 line``, you might want to use the
      ``ipv6_activate_all_interfaces`` variable as explained later.

      If ``ipv6_ifconfig_IF``\ ="..." is defined in FreeBSD 9.0-RELEASE,
      it means ``ifconfig_IF``\ \_ipv6="inet6 ...". Note that this is
      only for backward compatibility. The ``inet6`` address family
      keyword is required for ``ifconfig_IF_ipv6``, but was NOT required
      for ``ipv6_ifconfig_IF``. The ``ipv6_ifconfig_IF`` variables
      should not be used in 9.0-RELEASE.

   -  An interface with no corresponding ``ifconfig_IF_ipv6`` variable
      is marked with an ``IFDISABLED`` flag by
      `devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      daemon. This flag means IPv6 communication is disabled on that
      interface. This can also be found in output of
      `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__:

      .. code:: SCREEN

          % ifconfig em0
          em0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
                  options=9b<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,VLAN_HWCSUM>
                  ether xx:xx:xx:xx:xx:xx
                  inet 192.168.2.1 netmask 0xffffff00 broadcast 192.168.2.255
                  nd6 options=3<PERFORMNUD,IFDISABLED,ACCEPT_RTADV>
                  media: Ethernet autoselect (1000baseT <full-duplex>)
                  status: active

      To enable IPv6 functionality, this flag should be removed first.
      There are several ways to do so. Adding an IPv6 address
      automatically removes this flag. It is possible to remove this
      flag explicitly by using the following command:

      .. code:: SCREEN

          # ifconfig em0 inet6 -ifdisabled

      Note that defining an ``ifconfig_IF_ipv6`` is the most reasonable
      way to activate IPv6 functionality on that interface. This
      ``IFDISABLED`` flag is to prevent unintended IPv6 communications
      in an IPv4-only environment even when the interface has an IPv6
      link-local address. If you need full-blown IPv6 functionality on
      all interfaces, you might want to use the
      ``ipv6_activate_all_interfaces`` variable as explained later.

   -  The
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      variable ``net.inet6.ip6.accept_rtadv`` has been changed. It was a
      system-wide configuration knob which controlled whether the system
      accepts ICMPv6 Router Advertisement messages or not. In FreeBSD
      9.0-RELEASE, this knob is converted into a per-interface
      ``inet6 accept_rtadv``
      `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      option. Although the
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      variable is available still in FreeBSD 9.0-RELEASE, it now
      controls whether the per-interface option is set by default or
      not. The default value is ``0`` (not accept the RA messages).

   -  The
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      variable ``net.inet6.ip6.auto_linklocal`` has been changed. It was
      a system-wide configuration knob which controlled whether an IPv6
      link-local address was generated on a network interface when it
      became up. In FreeBSD 9.0-RELEASE, this knob is converted into a
      per-interface ``inet6 auto_linklocal``
      `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      option. Although the
      `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
      variable is still available in FreeBSD 9.0-RELEASE, it now
      controls whether the per-interface option is set by default or
      not. The default value is ``1`` (generate a link-local
      automatically).

   -  The functionality of ``ipv6_ifconfig_IF_alias0`` is integrated
      into ``ifconfig_IF_alias0``. Note that address family keywords are
      always required:

      .. code:: PROGRAMLISTING

          ifconfig_em0_alias0="inet 192.168.2.10 netmask 255.255.255.255"
          ifconfig_em0_alias1="inet6 2001:db8:1::1 prefixlen 64

      Although ``ipv6_ifconfig_IF_aliasN`` is still usable in FreeBSD
      9.0-RELEASE, it is only for backward compatibility.

   -  A new ``ipv6_activate_all_interfaces`` variable has been added. If
      this variable is set to ``YES``, the ``IFDISABLED`` option will
      not be added even if ``ifconfig_IF_ipv6`` variables are not
      defined. This can prevent ``IFDISABLED`` on dynamically-added
      interfaces such as
      `ppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__,
      `tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__,
      and
      `ng\_iface(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_iface&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
      where defining ``ifconfig_IF_ipv6`` in advance is difficult.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.5 Openresolv and ``/etc/resolv.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`resolvconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=resolvconf&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility has been added and it now handles updating the
`resolv.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=resolv.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
file. Direct modifications to ``/etc/resolv.conf`` can be overwritten by
network configuration utilities such as
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
and
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.6 Disk Partition Management Utilities
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In earlier releases various utilities were available to manage disk
partition information. They are deprecated in favor of the
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility. Specifically, the
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__,
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__,
and
`sunlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sunlabel&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utilities are no longer supported actively though these are still
available for backward compatibility.

.. raw:: html

   </div>

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

All users of FreeBSD 9.0-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
