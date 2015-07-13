======================================
FreeBSD/pc98 6.3-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 6.3-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 The
FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.883.2.87.2.7 2008/01/15 02:34:11 hrs Exp $

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

The release notes for FreeBSD 6.3-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 6.3-STABLE development
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

This document contains the release notes for FreeBSD 6.3-RELEASE on the
NEC PC-98x1 hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

This distribution of FreeBSD 6.3-RELEASE is a release distribution. It
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
6.3-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 6.2-RELEASE.

Typical release note items document recent security advisories issued
after 6.2-RELEASE, new drivers or hardware support, new commands or
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

Processing of IPv6 type 0 Routing Headers is now controlled by the
``net.inet6.ip6.rthdr0_allowed`` sysctl variable, which defaults to
``0`` (off). For more information, see security advisory
`FreeBSD-SA-07:03.ipv6 <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:03.ipv6.asc>`__.

Problems with
`libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+6.3-RELEASE>`__
and
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+6.3-RELEASE>`__
handling corrupted
`tar(5) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=5&manpath=FreeBSD+6.3-RELEASE>`__
archive files have been fixed. More details can be found in security
advisory
`FreeBSD-SA-07:05.libarchive <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:05.libarchive.asc>`__.

A buffer overflow in OpenSSL (fixed incorrectly in a previously security
patch) has been corrected. More details can be found in security
advisory
`FreeBSD-SA-07:08.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:08.openssl.asc>`__.

An flaw that could lead to the disclosure of previously-generated
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
data has been corrected. Information regarding this issue can be found
in security advisory
`FreeBSD-SA-07:09.random <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:09.random.asc>`__.

Information disclosure issues found in
`openpty(3) <http://www.FreeBSD.org/cgi/man.cgi?query=openpty&sektion=3&manpath=FreeBSD+6.3-RELEASE>`__
and
`ptsname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ptsname&sektion=3&manpath=FreeBSD+6.3-RELEASE>`__
have been corrected. Information regarding this issue can be found in
security advisory
`FreeBSD-SA-08:01.pty <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:01.pty.asc>`__.

A programming error in
`inet\_network(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet_network&sektion=3&manpath=FreeBSD+6.3-RELEASE>`__
Internet address manipulation function that could lead to overwriting a
region of memory with user defined data has been corrected. Information
regarding this issue can be found in security advisory
`FreeBSD-SA-08:02.libc <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:02.libc.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
now has support for the HPET time counter.

Support for Message Signaled Interrupts (MSI) and Extended Message
Signaled Interrupts (MSI-X) has been added to the kernel's PCI support
code.

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

An
`acpi\_dock(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_dock&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been added to provide support for controlling laptop docking
station functions via ACPI.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The
`snd\_envy24(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_envy24&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been added to support the Envy24 series of audio chips.

The
`snd\_envy24ht(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_envy24ht&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been added to support the VIA Envy24HT series of audio chips.

The
`snd\_hda(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_hda&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been added. It supports devices that conform to revision 1.0
of the Intel High Definition Audio specification.

The
`snd\_spicds(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_spicds&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been added to support I2S SPI audio codec chips.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been updated to HAL version 0.9.20.3.

The
`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__.

The
`cxgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cxgb&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been added. It provides support for 10 Gigabit Ethernet
adapters based on the Chelsio T3 and T3B chipsets.

The
`edsc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=edsc&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver, which provides Ethernet discard network interfaces, has been
added.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been updated to version 6.7.2 from Intel.

The
`msk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=msk&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been added. It supports network interfaces using the
Marvell/SysKonnect Yukon II Gigabit Ethernet controller.

The
`vge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vge&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__.

The 802.11 protocol stack now has support for 900 MHz cards, as well as
quarter- and half-channel support for 802.11a.

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
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver now supports RSTP, the Rapid Spanning Tree Protocol (802.1w).

The
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver, ported from OpenBSD and NetBSD, has been added to support a
variety of protocols and algorithms for link aggregation, failover, and
fault tolerance.

A new
`ng\_deflate(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_deflate&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
NetGraph node type has been added. It implements Deflate PPP
compression.

The
`ng\_ppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ppp&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
Netgraph node is now MPSAFE.

A new
`ng\_pred1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_pred1&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
NetGraph node type has been added to implement Predictor-1 PPP
compression.

A bug which prevented FreeBSD 6.2-RELEASE from running IPv6 correctly
over
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
tunnels has been fixed.

The ``net.link.tap.up_on_open`` sysctl variable has been added to the
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver. If enabled, new tap devices will marked ``up`` upon creation.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been updated to support various new features such as RAID
volume and RAID member state/settings reporting, periodic volume
re-synchronization status reporting, and sysctl variables for volume
re-synchronization rate, volume member write cache status, and volume
transaction queue depth.

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver now supports SAS HBA (partially), 64-bit PCI, and large data
transfer.

The scsi\_sg driver, which emulates a significant subset of the Linux
SCSI SG passthrough device API, has been added. It is intended to allow
programs running under Linux emulation (as well as native FreeBSD
applications) to access the ``/dev/sg*`` devices supported by Linux.

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
driver has been updated to the 3.60.03.006 release on the 3ware Web
site. It now supports AMCC's 3ware 9650 series of SATA controllers.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

The unionfs file system has been re-implemented. This version solves
many crashing and locking issues compared to the previous
implementation. It also adds new “transparent” and “masquerade” modes
for automatically creating files in the upper file system layer of
unions. More information can be found in the
`mount\_unionfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_unionfs&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
manual page.

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
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
utility now supports a ``readcap`` command to display the size of
devices.

A bug in
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__,
which caused it not to update SMP kernels correctly, has been fixed.

The
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
program now supports a ``-p`` flag to print the slice table in fdisk
configuration format.

The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
utility now supports an ``upgrade`` command to perform binary upgrades
between different versions of FreeBSD.

The
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
utility now has support for RFC2389 (FEAT) and rudimentary support for
RFC2640 (UTF8). The RFC2640 support is optional and can be enabled using
the new ``-8`` flag. More information can be found in the
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
manual page.

The
`ipfwpcap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfwpcap&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
utility has been added; it captures packets on a
`divert(4) <http://www.FreeBSD.org/cgi/man.cgi?query=divert&sektion=4&manpath=FreeBSD+6.3-RELEASE>`__
socket and writes them as
`pcap(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pcap&sektion=3&manpath=FreeBSD+6.3-RELEASE>`__
(also known as
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+6.3-RELEASE>`__)
format data to a file or pipe.

The
`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
and
`rpc.statd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.statd&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
programs now accept ``-p`` options to indicate which port they should
bind to.

The
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
program now supports a ``-M`` option to set the permissions of a user's
newly created home directory.

The
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+6.3-RELEASE>`__
program now supports a ``-j`` flag to display the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
ID for each process.

The
`touch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=touch&sektion=1&manpath=FreeBSD+6.3-RELEASE>`__
utility now supports a ``-A`` flag that allows the access and
modification times of a file be adjusted by a specified value.

The
`wpa\_passphrase(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_passphrase&sektion=8&manpath=FreeBSD+6.3-RELEASE>`__
utility has been added. It generates a 256-bit pre-shared WPA key from
an ASCII passphrase.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``sendmail`` script can be instructed not to rebuild the aliases
database if it is missing or older than the aliases file. If desired,
set the new rc.conf option ``sendmail_rebuild_aliases`` to "NO" to turn
off that functionality.

The ``/etc/rc.d/nfslocking`` script has been deprecated and will be
removed in a future release. It has been replaced by the
``/etc/rc.d/lockd`` and ``/etc/rc.d/statd`` scripts.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**awk** has been updated from the 24 April 2005 release to the 1 May
2007 release.

**BIND** has been updated from 9.3.3 to 9.3.4-p1.

**BZIP2** has been updated from 1.0.3 to 1.0.4.

GNU **Diffutils** has been updated from 2.7 to 2.8.7.

The GNU version of **gzip** has been replaced with a modified version of
gzip ported from NetBSD.

**IPFilter** has been updated from 4.1.13 to 4.1.28.

**less** has been updated from v381 to v416.

**ncurses** has been updated from 5.2-20020615 to 5.6-20061217. ncurses
now also has wide character support.

**netcat** has been updated from the version in a 4 February 2005
OpenBSD snapshot to the version included in OpenBSD 4.1.

**GNU Readline library** has been updated from 5.0 to 5.2 patch 2.

**sendmail** has been updated from 8.13.8 to 8.14.2.

The timezone database has been updated from the **tzdata2006g** release
to the **tzdata2007k** release.

TrustedBSD **OpenBSM** has been updated from 1.0 alpha 12 to 1.0.

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

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.16.1 to 2.20.1.

The supported version of the **KDE** desktop environment
(```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
has been updated from 3.5.4 to 3.5.7.

The supported version of the **Xorg** windowing system
(```x11/xorg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__)
has been updated from 6.9.0 to 7.3.0.

The default value of ``X11BASE`` has been changed from ``/usr/X11R6`` to
``/usr/local``, the default value of ``LOCALBASE``.

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

Source upgrades to FreeBSD 6.3-RELEASE are only supported from FreeBSD
5.3-RELEASE or later. Users of older systems wanting to upgrade
6.3-RELEASE will need to update to FreeBSD 5.3 or newer first, then to
FreeBSD 6.3-RELEASE.

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
