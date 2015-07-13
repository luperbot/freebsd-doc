=================================
FreeBSD 7.2-RELEASE Release Notes
=================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.2-RELEASE Release Notes
=================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009
The FreeBSD Documentation Project

| $FreeBSD:
  releng/7.2/release/doc/en\_US.ISO8859-1/relnotes/article.sgml 191705
  2009-04-30 21:20:09Z hrs $

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

Microsoft, IntelliMouse, MS-DOS, Outlook, Windows, Windows Media and
Windows NT are either registered trademarks or trademarks of Microsoft
Corporation in the United States and/or other countries.

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

The release notes for FreeBSD 7.2-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 7.2-STABLE development
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
2.5 `Ports/Packages Collection Infrastructure <#PORTS>`__
2.6 `Release Engineering and Integration <#RELENG>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 7.2-RELEASE. It
describes recently added, changed, or deleted features of FreeBSD. It
also provides some notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 7.2-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
7.2-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 7.1-RELEASE.

Typical release note items document recent security advisories issued
after 7.1-RELEASE, new drivers or hardware support, new commands or
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

Advisory
Date
Topic
`SA-09:01.lukemftpd <http://security.freebsd.org/advisories/FreeBSD-SA-09:01.lukemftpd.asc>`__
07 January 2009
Cross-site request forgery in
`lukemftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lukemftpd&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__

`SA-09:02.openssl <http://security.freebsd.org/advisories/FreeBSD-SA-09:02.openssl.asc>`__
07 January 2009
OpenSSL incorrectly checks for malformed signatures

`SA-09:03.ntpd <http://security.freebsd.org/advisories/FreeBSD-SA-09:03.ntpd.asc>`__
13 January 2009
ntpd cryptographic signature bypass

`SA-09:04.bind <http://security.freebsd.org/advisories/FreeBSD-SA-09:04.bind.asc>`__
13 January 2009
BIND DNSSEC incorrect checks for malformed signatures

`SA-09:05.telnetd <http://security.freebsd.org/advisories/FreeBSD-SA-09:05.telnetd.asc>`__
16 February 2009
telnetd code execution vulnerability

`SA-09:06.ktimer <http://security.freebsd.org/advisories/FreeBSD-SA-09:06.ktimer.asc>`__
23 March 2009
Local privilege escalation

`SA-09:07.libc <http://security.freebsd.org/advisories/FreeBSD-SA-09:07.libc.asc>`__
04 April 2009
Information leak in
`db(3) <http://www.FreeBSD.org/cgi/man.cgi?query=db&sektion=3&manpath=FreeBSD+7.2-RELEASE>`__

`SA-09:08.openssl <http://security.freebsd.org/advisories/FreeBSD-SA-09:08.openssl.asc>`__
22 April 2009
Remotely exploitable crash in OpenSSL

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
kernel debugger now supports a ``show mount`` subcommand.

The FreeBSD DTrace subsystem now supports a probe for process execution.

[amd64] The FreeBSD kernel virtual address space has been increased to
6GB. This allows subsystems to use larger virtual memory space than
before. For example,
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
adaptive replacement cache (ARC) requires large kernel memory space to
cache file system data, so it benefits from the increased address space.
Note that the ceiling on the kernel map size is now 60% of the size
rather than an absolute quantity.

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
subsystem has been updated. Changes include:

-  Multiple addresses of both IPv4 and IPv6 per jail has been supported.
   It is even possible to have jails without an IP address at all, which
   basically gives one a chrooted environment with restricted process
   view and no networking.

-  SCTP
   (`sctp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sctp&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__)
   with IPv6 in jails has been implemented.

-  Specific CPU binding by using
   `cpuset(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuset&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
   has been implemented. Note that the current implementation allows the
   superuser inside of the jail to change the CPU bindings specified.
   This behavior will be fixed in the next release.

-  A
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   can start with a specific route FIB now.

-  A ``show jails`` subcommand in
   `ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   has been added.

-  Compatibility support which permits 32-bit jail binaries to be used
   on 64-bit systems to manage jails has been added.

-  Note that both version numbers of ``jail`` and ``prison`` in the
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   have been updated for the new features.

The
`kld(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kld&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
now supports installing 32-bit system calls to the FreeBSD system call
translation layer from kernel modules.

The
`ktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ktr&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
now supports a new KTR tracepoint in the ``KTR_CALLOUT`` class to note
when a callout routine finishes executing.

Types of variables used to track the amount of allocated System V shared
memory have been changed from ``int`` to ``size_t``. This makes it
possible to use more than 2 GB of memory for shared memory segments on
64-bit architectures. Please note the new BUGS section in
`shmctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmctl&sektion=2&manpath=FreeBSD+7.2-RELEASE>`__
and ``/usr/src/UPDATING`` for limitations of this temporary solution.

The
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3&manpath=FreeBSD+7.2-RELEASE>`__
leaf nodes have a flag to tag themselves as MPSAFE now.

The FreeBSD 32-bit system call translation layer now supports installing
32-bit system calls for ``VFS_AIO``.

[amd64, i386] The FreeBSD virtual memory subsystem now supports fully
transparent use of **superpages** for application memory; application
memory pages are dynamically promoted to or demoted from superpages
without any modification to application code. This change offers the
benefit of large page sizes such as improved virtual memory efficiency
and reduced TLB (translation lookaside buffer) misses without downsides
like application changes and virtual memory inflexibility. This is
disabled by default and can be enabled by setting a loader tunable
``vm.pmap.pg_ps_enabled`` to ``1``.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

The
`boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
now supports 4-byte volume ID that certain versions of Windows® put into
the MBR and invoking PXE by pressing F6 key on some supported BIOSes.

[i386] The
`boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
BTX loader has been improved. This fixes several boot issues on recent
machines reported for 7.1-RELEASE and before.

The
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
is now able to obtain DHCP options from network boot via
`kenv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=2&manpath=FreeBSD+7.2-RELEASE>`__
variables.

A bug in the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
has been fixed. Now the following line works as expected:

.. code:: PROGRAMLISTING

    loader_conf_files="foo bar ${variable}"

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

[sparc64] The FreeBSD now supports Ultra SPARC III (Cheetah) processor
family.

The
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
subsystem now supports a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
variable ``debug.batt.batt_sleep_ms``. On some laptops with smart
batteries, enabling battery monitoring software causes keystrokes from
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
to be lost. This sysctl variable adds a delay in millisecond to the
status checking code as a workaround.

The
`acpi\_asus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_asus&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports Asus A8Sr notebooks.

[powerpc] Support for the AltiVec, a floating point and integer SIMD
instruction set has been added.

The
`cpuctl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuctl&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver, which provides a special device ``/dev/cpuctl`` as an interface
to the system CPU has been added. The
`cpuctl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpuctl&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
functionality includes the ability to retrieve CPUID information,
read/write machine specific registers (MSR), and perform CPU firmware
updates.

The
`cpufreq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cpufreq&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports an ``hw.est.msr_info`` loader tunable. When this is
set to ``1``, it attempts to build a simple list containing just the
high and low frequencies if it cannot obtain a frequency list from
either ACPI or the static tables. This is disabled by default.

[amd64, i386] CPU frequency change notifiers are now disabled when the
TSC is P-state invariant. Also, a new loader tunable
``kern.timecounter.invariant_tsc`` has been added to force this behavior
by setting it to non-zero.

The
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now disables the interrupt handler which is called from the
keyboard callback function when polled mode is enabled. This fixes the
problem of duplicated/missing characters at the mountroot prompt on
multi CPU systems while
`kbdmux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmux&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
is enabled.

In the
`pci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pci&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
subsystem INTx is now disabled when MSI/MSIX is enabled. This change
fixes interrupt storm related issues.

[sparc64] The schizo(4) driver for Schizo Fireplane/Safari to PCI 2.1
and Tomatillo JBus to PCI 2.2 bridges has been added.

The
`u3g(4) <http://www.FreeBSD.org/cgi/man.cgi?query=u3g&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver for USB based 3G cards and dongles including Vodafone Mobile
Connect Card 3G, Qualcomm CDMA MSM, Huawei E220, Novatel U740, Sierra
MC875U, and so on has been added. This provides support for the multiple
USB-to-serial interfaces exposed by many 3G USB/PC Card modems, and the
device is accessed through the
`ucom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucom&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver which makes it behave like a
`tty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tty&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__.

The
`sched\_ule(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_ule&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
scheduler now supports a loader tunable
``machdep.hyperthreading_enabled`` as the
`sched\_4bsd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sched_4bsd&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
does. Note that it cannot be modified at run-time.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports Intel G4X series graphics chipsets.

The DRM, a kernel module named Direct Rendering Manager that gives
direct hardware access to DRI clients, has been updated. Support for
AMD/ATI r500, r600, r700, and IGP based chips, XGI V3XE/V5/V8, and Intel
i915 chipsets has been improved.

A new loader tunable ``hw.drm.msi`` has been added to control if DRM
uses MSI or not. This is set to ``1`` (enabled) by default.

The snd\_au88x0(4) driver for Aureal Vortex 1/2/Advantage PCI has been
removed because this was broken for a long time.

The
`snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been updated. This changes include support for multiple codec
per HDA bus, multiple functional groups per codec, multiple audio
devices per functional group, digital (SPDIF/HDMI) audio input/output,
suspend/resume, and part of multichannel audio.

Note that due to added HDMI audio and logical audio devices support, the
updated driver often provides several PCM devices. This means that in
some cases the system default audio device no longer corresponds to the
users's habitual audio connectors. In such cases the default device can
be specified in audio applications' setup or defined globally via
``hw.snd.default_unit sysctl``, as described in the
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
manual page.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ae&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports WoL (Wake on LAN).

[amd64, i386] The
`ale(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ale&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver is now included in the ``GENERIC`` kernel.

The
`ath\_hal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath_hal&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
Atheros Hardware Access Layer, has been updated to the open source
version.

The
`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been improved in performance by eliminating extra context
switches and now supports Apple USB Ethernet adapter.

The
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver's firmware has been updated to the latest version (4.6.X).

The ciphy(4) driver now supports Vitesse VSC8211 PHY.

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been updated to firmware revision 4.7 and now supports
hardware MAC statistics.

The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been improved. Changes include:

-  The checksum offload feature can be controlled by
   `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
   now.

-  Rx checksum offload support for 82559 or later controllers has been
   added.

-  TSO (TCP Segmentation Offload) support for 82550 and 82551
   controllers has been added.

-  WoL (Wake on LAN) support for 82550, 82551, 82558, and 82559-based
   controllers has been added. Note that ICH based controllers are
   treated as 82559, and 82557, earlier revisions of 82558, and 82559ER
   have no WoL capability.

-  VLAN hardware tag insertion/stripping support and Tx/Rx checksum
   offload for VLAN frames support have been added. Note that the VLAN
   hardware assistance is available only on 82550 or 82551-based
   controllers.

A bug in the
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver, which prevents the loader tunable ``hw.igb.ave_latency`` from
working, has been fixed.

The
`ixgbe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgbe&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been updated to version 1.7.4.

The
`jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports newer JMicron JMC250/JMC260 revisions.

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been improved. An issue which makes it hang up in a certain
condition has been fixed. Hardware MAC statistics support has been added
and users can get the information via sysctl variables named
``dev.msk.N.stats``.

The
`mxge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mxge&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports some newer revisions and 10GBASE-LRM and
10GBASE-Twinax media types.

The
`nfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nfe&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports hardware MAC statistics.

The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been improved. It now detects the link status. A new loader
tunable ``hw.re.prefer_iomap`` has been added, to disable memory
register mapping. This tunable is ``0`` for all controllers except
RTL8169SC family.

The
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been improved. It now detects the link status and a bug which
prevents it from working on systems with more than 4GB memory has been
fixed.

A bug in
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
on VLAN tagged frame handling has been fixed.

The
`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now works on all supported architectures. Support has been added
for
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
WoL, checksum offload when VLAN enabled, and link state change handling
has been improved, and new sysctl variables ``dev.txp.N.stats`` for MAC
statistics have been added. New sysctl variables
``dev.txp.N.process_limit`` has been added, to control how many received
frames should be served in Rx handler (set to 64 by default and valid
ranges are 16 to 128 in unit of frames). The firmware has been updated
to the latest version.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

IPv4 source address selection for unbound sockets has been implemented
as follows:

#. If we found a route, use the address corresponding to the outgoing
   interface.

#. Otherwise we assume the foreign address is reachable on a directly
   connected network and try to find a corresponding interface to take
   the source address from.

#. As a last resort use the default jail address.

This also changes the semantics of selecting the IP for processes within
a
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
as it now uses the same logic as outside the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__.

The TCP MD5 Signature Option (RFC 2385) for IPv6 has been implemented in
the same way it has been implemented for IPv4.

The
`ng\_netflow(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_netflow&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
Netgraph node now includes support for generating egress netflow instead
or in addition to ingress. An ``NGM_NETFLOW_SETCONFIG`` control message
has been added to control the new functionality.

The
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
Ethernet tunnel software network interface now supports a new
``TAPGIFNAME`` character device ioctl. This is a convenient shortcut to
obtain the network interface name using a file descriptor to a character
device.

The
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
now supports ``SIOCSIFMTU`` ioctl to set a higher MTU than 1500
(ETHERMTU). This allows
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
devices to be added to the same bridge (which requires all interface
members to have the same MTU) with an interface configured for jumbo
frames.

The domains list for handling the list of supported domains in the
`unix(4) <http://www.FreeBSD.org/cgi/man.cgi?query=unix&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
(UNIX domain protocol family) subsystem is now MPSAFE.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports Marvell PATA M88SX6121.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now recognizes nForce MCP67 and MCP73 SATA controllers as AHCI.

The
`ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now includes preliminary support for DDF metadata found on
Adaptec HostRAID controllers. Note that spares and rebuilds are not
supported yet.

The
`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
SCSI subsystem now supports a new sysctl variable
``kern.cam.cd.retry_count``. This controls the number of retries for the
CD media. When trying to read scratched or damaged CDs and DVDs, the
default mechanism is sub-optimal, and programs like **ddrescue** do much
better if you turn off the retries entirely since their algorithms do it
by themselves. This value is set to ``4`` (for a total of 5 attempts) by
default. Setting it to ``0`` turns off all retry attempts.

A bug in the
`ciss(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ciss&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver which caused low “max device openings” count and led to poor
performance has been fixed.

The
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
GEOM class now supports a new UFS-based label called ``ufsid`` that can
be used to reference UFS-carrying devices by the unique file system ID.
This file system ID is automatically generated and detected when the
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
GEOM class is enabled. An example of this new label is:
``/dev/ufsid/48e69c8b5c8e1b43``. The benefit of using GEOM labels in
general is to avoid problems of device renaming when shifting drives or
controllers.

The
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
GEOM class now supports the root file system. Previously, an unclean
shutdown would make it impossible to mount the root file system at boot.

The
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility has been updated. The APM scheme now supports Tivo Series 1
partitions (read only), a new EBR scheme to support Extended Boot
Records has been added, the BSD scheme now support bootcode, and bugs in
the PC98 and VTOC8 schemes have been fixed.

An issue in
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
with access permissions to underlying disks used by a gvinum plex has
been fixed. If the plex is a raid5 plex and is being written to, parity
data might have to be read from the underlying disks, requiring them to
be opened for reading as well as writing.

The
`hptmv(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hptmv&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been updated to version 1.16 from the vendor.

The
`mmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mmc&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
and
`mmcsd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mmcsd&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
drivers now support MMC and SDHC cards, high speed timing, wide bus, and
multiblock transfers.

[sparc64] The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver is now in the ``GENERIC`` kernel.

The
`sdhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sdhci&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver has been added. This supports PCI devices with class 8 and
subclass 5 according to the SD Host Controller Specification.

The
`sdhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sdhci&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports kernel dumping and a sysctl variable
``hw.sdhci.debug`` for debug level.

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver now supports 64-bit DMA.

The
`mmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mmc&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
`mmcsd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mmcsd&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__,
and
`sdhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sdhci&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
driver are now included as kernel modules.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The semantics of
`acl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=acl&sektion=3&manpath=FreeBSD+7.2-RELEASE>`__
extended access control lists has been changed as follows:

-  The inode modification time (mtime) is not updated when extended
   attributes are added, modified, or removed.

-  The inode access time (atime) is not updated when extended attributes
   are queried.

The FreeBSD NFS file system now supports a sysctl variable
``vfs.nfs.prime_access_cache`` to determine whether or not
``nfs_getattr()`` will use an ACCESS RPC to prime the access cache
instead of a simple GETATTR RPC. This is because on many NFS servers an
ACCESS RPC is much more expensive to service than a GETATTR RPC for
files in an NFSv3 mount. The sysctl variable is enabled by default to
maintain the previous behavior.

The FreeBSD UDF file system now supports a fifo.

The shared vnode locking for pathname lookups in the
`VFS(9) <http://www.FreeBSD.org/cgi/man.cgi?query=VFS&sektion=9&manpath=FreeBSD+7.2-RELEASE>`__
subsystem has been improved. This is disabled by default. Setting a
sysctl variable ``vfs.lookup_shared`` to ``1`` enables it for better
performance. Note that the ``LOOKUP_SHARED`` kernel option equivalent to
the sysctl variable has been removed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

A bug in the
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility, which prevents it from working when ``/usr`` is not mounted or
invoked from ``/rescue``, has been fixed.

The
`btpand(8) <http://www.FreeBSD.org/cgi/man.cgi?query=btpand&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
daemon from NetBSD has been added. This daemon provides support for
Bluetooth Network Access Point (NAP), Group Ad-hoc Network (GN) and
Personal Area Network User (PANU) profiles.

The
`ncal(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ncal&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports multibyte characters.

The
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports multiple ``makeoption`` lines.

The
`csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports CVSMode to fetch a complete CVS repository. Note
that the rsync transfer mode is currently disabled.

The
`dirname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dirname&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now accepts multiple arguments in the same way that
`basename(1) <http://www.FreeBSD.org/cgi/man.cgi?query=basename&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
does.

The
`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports an ``-l`` flag. When specified, the
`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility counts a file with multiple hard links as multiple different
files.

The
`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports an ``-A`` flag to display the apparent size instead
of the disk usage. This can be helpful when operating on compressed
volumes or sparse files.

The
`du(1) <http://www.FreeBSD.org/cgi/man.cgi?query=du&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports a ``-B blocksize`` option to calculate block counts
in blocks of ``blocksize`` bytes. This is different from the ``-k`` or
``-m`` options or setting ``BLOCKSIZE`` and gives an estimate of how
much space the examined file hierarchy would require on a file system
with the given ``blocksize``. Unless in ``-A`` mode, ``blocksize`` is
rounded up to the next multiple of 512.

The
`dumpfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dumpfs&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports an ``-f`` flag, which causes it to list all free
fragments in the file system by fragment (block) number. This new mode
does the necessary arithmetic to generate absolute fragment numbers
rather than the cg-relative numbers printed in the default mode.

If ``-f`` is passed once, contiguous fragment ranges are collapsed into
an X-Y format as free block lists are currently printed in regular
dumpfs output. If specified twice, all block numbers are printed
individually, allowing both compact and more script-friendly
representation.

The
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports an ``-i`` flag which supports the If-Modified-Since
HTTP 1.1 request. If specified it will cause the file to be downloaded
only if it is more recent than the mtime of the local file. Also,
**libfetch** now accepts the mtime in the url structure and a flag to
indicate when this behavior is desired.

The
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports a ``-C`` flag for ``check clean`` mode. This checks
if the file system was dismounted cleanly first and then skip file
system checks if true. Otherwise it does full checks.

The
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports a ``-D`` flag for damaged recovery mode, which will
enable certain aggressive operations that can make
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
to survive with file systems that has very serious data damage. This is
a useful last resort when on disk data damage is very serious and causes
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
to crash.

The
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3&manpath=FreeBSD+7.2-RELEASE>`__
function now supports SCTP.

A bug was fixed in the
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility which displays extra messages for a NAT rule even when a ``-q``
flag is specified.

The
`ln(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ln&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports a ``-w`` flag to check if the source file actually
exists. When the flag is specified and the file does not exist,
`ln(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ln&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
will issue a warning message.

The
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports a ``-p`` flag to print the input graph only,
without executing any commands. The output is the same as ``-d g1``.
When combined with ``-f /dev/null``, only the built-in rules of make are
displayed.

The
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports a ``-Q`` flag to cause file banners not to be
generated in addition to the same effect of a ``-q`` flag when a ``-j``
option is specified.

The
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports the ``.MAKE.JOB.PREFIX`` variable. If ``-j`` and
``-v`` are specified, its output for each target is prefixed with a
token ``--- target`` --- the first part of which can be controlled via
the variable.

The
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports ``.MAKE.PID`` and ``.MAKE.PPID`` variable. These
are set to process ID of the
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
process and its parent process respectively.

The
`makefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=makefs&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility to create a file system image from a directory tree has been
added.

The
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports an ``-F`` option to automatically install files
that differ only in their version control ID strings.

The
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports an ``-o mountprog=/somewhere/mount_xxx`` option to
force it to use the specified program to mount the file system instead
of calling
`nmount(2) <http://www.FreeBSD.org/cgi/man.cgi?query=nmount&sektion=2&manpath=FreeBSD+7.2-RELEASE>`__
directly. This is useful when you want to use third party programs such
as FUSE, for example.

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now reports
`unix(4) <http://www.FreeBSD.org/cgi/man.cgi?query=unix&sektion=4&manpath=FreeBSD+7.2-RELEASE>`__
sockets' listen queue statistics when an ``-L`` flag is specified.

A bug in the
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility has been fixed. It crashed with the following options in the
previous versions:

.. code:: SCREEN

    % netstat -m -N foo

A bug in the
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility has been fixed. The ``-ss`` option now works in the icmp6
section as expected.

The
`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports a ``-b`` flag, which lists any base address
registers (BAR) that are assigned resources for each device.

The
`powerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=powerd&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
program has been improved. Changes include reasonable CPU load
estimation on SMP systems and a new mode named as ``hiadaptive`` for
AC-powered systems. The ``hiadaptive`` mode raises the CPU frequency
twice as fast as ``adaptive``, it drops the CPU frequency 4 times
slower, prefers twice lower CPU load and has an additional delay before
leaving the highest frequency after the period of maximum load.

The
`stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now displays an octal representation of suid, sgid and sticky
bits when the ``-x`` flag is specified.

The
`strndup(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strndup&sektion=3&manpath=FreeBSD+7.2-RELEASE>`__
function has been added.

The
`wc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=wc&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility now supports an ``-L`` flag to output the number of characters
in the longest input line.

A bug in the
`rpc.yppasswdd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.yppasswdd&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
program, which causes it to leave a zombie process when a password or
default shell is changed, has been fixed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**ISC BIND** has been updated to version 9.4.3-P2.

The timezone database has been updated from the **tzdata2008h** release
to the **tzdata2009f** release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A bug in the
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
utility, which prevents the ``-n`` flag from working has been fixed.

The FreeBSD Ports Collection now supports multiple
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
jobs in some supported ports. This is automatically enabled when a port
is marked as ``MAKE_JOBS_SAFE`` and improves CPU utilization at the
build stage by passing an option ``-jX`` to the top level ``Makefile``
from the vendor. The number ``X`` is set to the number of CPUs by
default, and can be set by users via a
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+7.2-RELEASE>`__
variable ``MAKE_JOBS_NUMBER``. For more details, see
``ports/Mk/bsd.port.mk``.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.22 to 2.26.

The supported version of the **KDE** desktop environment has been
updated from 3.5.10
(```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
to 4.2.2
(```x11/kde4`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde4/pkg-descr>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

[amd64, i386] Beginning with FreeBSD 6.2-RELEASE, binary upgrades
between RELEASE versions (and snapshots of the various security
branches) are supported using the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility. The binary upgrade procedure will update unmodified userland
utilities, as well as unmodified GENERIC or SMP kernels distributed as a
part of an official FreeBSD release. The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
utility requires that the host being upgraded has Internet connectivity.

An older form of binary upgrade is supported through the ``Upgrade``
option from the main
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.2-RELEASE>`__
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
ftp://ftp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
