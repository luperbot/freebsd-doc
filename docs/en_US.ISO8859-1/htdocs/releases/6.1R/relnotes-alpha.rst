=======================================
FreeBSD/alpha 6.1-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 6.1-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.883.2.15.2.7 2006/05/05 17:07:14 hrs Exp $

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

The release notes for FreeBSD 6.1-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 6.1-STABLE development
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
2.2.6 `Contributed Software <#AEN392>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 ```/etc/rc.d`` Scripts <#RC-SCRIPTS>`__
2.4 `Contributed Software <#AEN580>`__
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

This document contains the release notes for FreeBSD 6.1-RELEASE on the
Alpha/AXP hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

This distribution of FreeBSD 6.1-RELEASE is a snapshot distribution. It
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
6.1-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 6.0-RELEASE.

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

A temporary file vulnerability in
`texindex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=texindex&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__,
which could allow a local attacker to overwrite files in the context of
a user running the
`texindex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=texindex&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility, has been fixed. For more details see security advisory
`FreeBSD-SA-06:01.texindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:01.texindex.asc>`__.

A temporary file vulnerability in the
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
text editor, which could allow a local attacker to overwrite files in
the context of a user running
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__,
has been fixed. For more details see security advisory
`FreeBSD-SA-06:02.ee <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:02.ee.asc>`__.

Several vulnerabilities in the
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility have been corrected. For more details see security advisory
`FreeBSD-SA-06:03.cpio <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:03.cpio.asc>`__.

An error in
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
IP fragment handling, which could cause a crash, has been fixed. For
more details see security advisory
`FreeBSD-SA-06:04.ipfw <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:04.ipfw.asc>`__.

A potential buffer overflow in the IEEE 802.11 scanning code has been
corrected. For more details see security advisory
`FreeBSD-SA-06:05.80211 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:05.80211.asc>`__.

Two instances in which portions of kernel memory could be disclosed to
users have been fixed. For more details see security advisory
`FreeBSD-SA-06:06.kmem <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:06.kmem.asc>`__.

A logic bug in the IP fragment handling in
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__,
which could cause a crash under certain circumstances, has been fixed.
For more details see security advisory
`FreeBSD-SA-06:07.pf <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:07.pf.asc>`__.

A logic bug in the NFS server code, which could cause a crash when the
server received a message with a zero-length payload, has been fixed.
For more details see security advisory
`FreeBSD-SA-06:10.nfs <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:10.nfs.asc>`__.

A programming error in the
`fast\_ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fast_ipsec&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
implementation results in the sequence number associated with a Security
Association not being updated, allowing packets to unconditionally pass
sequence number verification checks, has been fixed. For more details
see security advisory
`FreeBSD-SA-06:11.ipsec <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:11.ipsec.asc>`__.

A logic bug that could cause
`opiepasswd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=opiepasswd&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
to allow an unprivileged user to configure OPIE authentication for the
root user under certain circumstances, has been fixed. For more details
see security advisory
`FreeBSD-SA-06:12.opie <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:12.opie.asc>`__.

An asynchronous signal handling vulnerability in
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__,
which could allow a remote attacker to execute arbitrary code with the
privileges of the user running sendmail, typically ``root``, has been
fixed. For more details see security advisory
`FreeBSD-SA-06:13.sendmail <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:13.sendmail.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
debugger now supports the ``show lock`` command. If the argument has a
valid lock class, this displays various information about the lock and
calls a new function pointer in lock\_class (lc\_ddb\_show) to dump
class-specific information about the lock as well (such as the owner of
a mutex or xlock'ed sx lock).

``DEFAULTS`` kernel configuration files for each platform have been
added.

The
`firmware(9) <http://www.FreeBSD.org/cgi/man.cgi?query=firmware&sektion=9&manpath=FreeBSD+6.1-RELEASE>`__
subsystem has been added. This allows to load binary data into the
kernel via a specially crafted module.

The
`random(4) <http://www.FreeBSD.org/cgi/man.cgi?query=random&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
entropy device driver is now MPSAFE.

A new sysctl variable ``security.mac.biba.interfaces_equal`` which makes
all network interfaces be created with the label
``biba/equal(equal-equal)``, has been added. This is useful where
programs such as
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
and
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__.
which initialize network interfaces do not have any labeling support.
This variable is set as ``0``\ (disabled) by default.

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
`acpi\_thermal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_thermal&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports passive cooling.

The
`kbdmux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmux&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver has been integrated into
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
and the ``kbd`` device driver. By default
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
will look for the
`kbdmux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmux&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
keyboard first, and then, if not found, look for any keyboard. Switching
to
`kbdmux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmux&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
can be done at boot time by loading the ``kbdmux`` kernel module via
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__,
or at runtime via
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
and releasing the active keyboard.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports ATI IGP chipsets.

The
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver has been updated in various aspects including fixing lock-related
bugs that could cause system panics in the previous releases and some
performance improvements. Also this driver now supports wider range
sampling rate, multiple precisions choice, and 24/32-bit PCM format
conversion.

The
`snd\_atiixp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_atiixp&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver has been added. This supports ATI IXP 200/300/400 series audio
controllers.

The
`snd\_als4000(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_als4000&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver is now MPSAFE.

The
`snd\_es137x(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_es137x&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver is now MPSAFE.

The
`snd\_ich(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_ich&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver is now MPSAFE.

The
`snd\_solo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_solo&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver is now MPSAFE.

The
`snd\_via8233(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_via8233&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver is now MPSAFE.

The
`snd\_via82c686(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_via82c686&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver is now MPSAFE.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver has been updated to version 0.9.16.16.

A bug which prevents the
`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver from working on a system with over 1GB RAM has been fixed.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
mode.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports big-endian architectures such as sparc64.

The
`le(4) <http://www.FreeBSD.org/cgi/man.cgi?query=le&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver, which supports AMD Am7900 LANCE and Am79C9xx PCnet NICs and is
based on NetBSD's implementation, has been added. While the
`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver also supports these NICs, this driver has several advantages over
it such as MPSAFE, ALTQ, VLAN\_MTU, ifmedia, and 32-bit DMA for PCI
variants.

The
`lge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lge&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver is now MPSAFE.

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
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
retransmission algorithm has been rewritten as that ARP requests are
retransmitted without suppression, while there is demand for such ARP
entry. Due to this change, a sysctl variable
``net.link.ether.inet.host_down_time`` has been removed.

The
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
now supports a sysctl variable
``net.link.ether.inet.log_arp_permanent_modify`` to suppress logging of
attempts to modify permanent ARP entries.

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
bridge driver now supports creating span ports, which transmit a copy of
every frame received by the bridge. This feature can be enabled by using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__.

The
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
bridge driver now supports RFC 3378 EtherIP. This change makes it
possible to add
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
interfaces to bridges, which will then send and receive IP protocol 97
packets. Packets are Ethernet frames with an EtherIP header prepended.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
IP packet filter now supports IPv6. The
`ip6fw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6fw&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
packet filter is deprecated and will be removed in the future releases.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
now supports substitution of the action argument with the value obtained
from table lookup, which allows some optimization of rulesets. This is
now applicable only to ``pipe``, ``queue``, ``divert``, ``tee``,
``netgraph``, and ``ngtee`` rules. For example, the following rules will
throw different packets to different pipes:

.. code:: PROGRAMLISTING

    pipe 1000 config bw 1000Kbyte/s
    pipe 4000 config bw 4000Kbyte/s
    table 1 add x.x.x.x 1000
    table 1 add x.x.x.y 4000
    pipe tablearg ip from table(1) to any

A bug has been fixed in which NFS over TCP would not reconnect when the
server sent a FIN. This problem had occurred with Solaris NFS servers.

The
`ng\_iface(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_iface&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
Netgraph node now supports
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__.

The path MTU discovery for multicast packets in the FreeBSD
`ip6(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
stack has been disabled by default because notifying path MTU by a lot
of routers in multicast can be a kind of distributed Denial-of-Service
attack to a router. This feature can be re-enabled by using a new sysctl
variable ``net.inet6.ip6.mcast_pmtu``.

The TCP bandwidth-delay product limiting feature has been disabled when
the RTT is below a certain threshold. This optimization does not make
sense on a LAN as it has trouble figuring out the maximal bandwidth due
to the coarse tick granularity. A new sysctl variable
``net.inet.tcp.inflight.rttthresh`` specifies the threshold in
milliseconds below which this feature will disengage. It defaults to
10ms.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver has been improved on its performance and now supports full 64-bit
DMA. While this feature is enabled by default, this can be forced off by
setting the ``hw.amr.force_sg32`` loader tunable for debugging purpose.

The
`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2&manpath=FreeBSD+6.1-RELEASE>`__
requests necessary for Linux LSI MegaRaid tools on FreeBSD's Linux
emulation environment.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports a workaround for some controllers whose DMA does not
work properly in 48bit mode. For the suspicious controllers the PIO mode
will be used for access to over 137GB areas.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports the ITE IT8211F IDE controller, and Promise PDC40718
and PDC40719 chip found in Promise Fasttrak TX4300.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports DMA for kernel crash dump and crash dumping to
`ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
device.

The
`ataraid(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ataraid&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver now supports JMicron ATA RAID metadata.

The ``GEOM_LABEL`` class now supports Ext2FS, NTFS, and ReiserFS.

The ``GEOM_MIRROR`` class now supports kernel crash dump to the GEOM
providers.

The ``GEOM_MIRROR`` and ``GEOM_RAID3`` classes now support sysctl
variables ``kern.geom.mirror.disconnect_on_failure`` and
``kern.geom.graid3.disconnect_on_failure`` to control whether failed
components will be disconnected or not. The default value is ``1`` to
preserve the current behavior, and if it is set to ``0`` such components
are not disconnected and the kernel will try to still use them (only
first error will be logged). This is helpful for the case of multiple
broken components (in different places), so actually all data is
available. The broken components will be visible in ``gmirror list`` or
``graid3 list`` output with flag ``BROKEN``.

The ``GEOM_MIRROR`` and ``GEOM_RAID3`` classes now use parallel I/O
request for synchronization to improve the performance. New sysctl
variables ``kern.geom.mirror.sync_requests`` and
``kern.geom.raid3.sync_requests`` define how many parallel I/O requests
should be used. Also, sysctl variables
``kern.geom.mirror.reqs_per_sync``, ``kern.geom.mirror.syncs_per_sec``,
``kern.geom.raid3.reqs_per_sync``, and ``kern.geom.raid3.syncs_per_sec``
are deprecated and have been removed.

A new GEOM class ``GEOM_ZERO`` has been added. It creates very huge
provider (41PB) ``/dev/gzero`` and mainly for performance testing. On
``BIO_READ`` request it zero-fills ``bio_data`` and on ``BIO_WRITE`` it
does nothing.

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver has been updated to the 9.3.0.1 release on the 3ware Web site.

The
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
now supports loading keyfiles before root file system is mounted. For
example, the following entries can be used in ``/boot/loader.conf`` to
enable it:

.. code:: PROGRAMLISTING

    geli_da0_keyfile0_load="YES"
    geli_da0_keyfile0_type="da0:geli_keyfile0"
    geli_da0_keyfile0_name="/boot/keys/da0.key0"
    geli_da0_keyfile1_load="YES"
    geli_da0_keyfile1_type="da0:geli_keyfile1"
    geli_da0_keyfile1_name="/boot/keys/da0.key1"
    geli_da0_keyfile2_load="YES"
    geli_da0_keyfile2_type="da0:geli_keyfile2"
    geli_da0_keyfile2_name="/boot/keys/da0.key2"

    geli_da1s3a_keyfile0_load="YES"
    geli_da1s3a_keyfile0_type="da1s3a:geli_keyfile0"
    geli_da1s3a_keyfile0_name="/boot/keys/da1s3a.key"

The
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver, which supports the LSI MegaRAID SAS controller family, has been
added.

The
`rr232x(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rr232x&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
driver, which supports HighPoint's RocketRAID 232x series of RAID
controllers, has been added.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6 Contributed Software
^^^^^^^^^^^^^^^^^^^^^^^^^^

**DRM** has been updated to a snapshot from DRI CVS as of 20051202.

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
`bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports the Host Resources MIB described in RFC 2790.

The
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports the ``nocpu`` directive, which cancels the effect
of a previous ``cpu`` directive.

The
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility now reads ``DEFAULTS`` kernel configuration file if it exists in
the current directory before the specified configuration file.

The
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports NLS catalog. Note that this requires installing the
```shells/tcsh_nls`` <http://www.FreeBSD.org/cgi/url.cgi?ports/shells/tcsh_nls/pkg-descr>`__
port.

The
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports a ``-f`` option to specify a configuration file.

The
`ln(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ln&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports an ``-F`` flag which allows to delete existing
empty directories, when creating symbolic links.

The
`locate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locate&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports a ``-0`` flag to make this utility interoperable
with
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__'s
``-0`` flag.

The
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports an ``-I`` flag to disable the automatic ``-A`` flag
for the superuser.

The
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility now creates a PID file ``/var/run/ftpd.pid`` even when no ``-p``
option is specified.

The
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports a ``-q`` flag to suppress the per-file header
comment listing the file name, owner, and group.

The
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports commands to rename objects and to move a subdisk
from one drive to another.

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility supports a ``-J jid_file`` option to write out a JidFile,
similar to a PidFile, containing the jailid, path, hostname, IP and the
command used to start the jail.

The
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports a ``-H`` flag, which causes kdump to print an
additional field holding the threadid.

The
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
program now supports a ``-s`` flag to suppress the display of I/O data.

The
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports an ``-A`` option to explicitly specify an
architecture to pass through to the underlying makefiles.

The
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
daemon now supports an ``-H`` flag to enable horizontal virtual
scrolling similar to a ``-V`` flag for vertical virtual scrolling.

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports printing
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+6.1-RELEASE>`__
protocol statistics if the kernel was compiled with ``FAST_IPSEC``
rather than the KAME IPSEC stack. Note that the output of
``netstat -s -p ipsec`` differs depending on which stack is compiled
into the kernel since they each keep different statistics.

The
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
daily script now supports display of the status of
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__,
`graid3(8) <http://www.FreeBSD.org/cgi/man.cgi?query=graid3&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__,
`gstripe(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gstripe&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__,
and
`gconcat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gconcat&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
devices. Note that these are disabled by default.

A new function,
`pidfile(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pidfile&sektion=3&manpath=FreeBSD+6.1-RELEASE>`__,
which provides reliable pidfiles handling, has been implemented in
``libutil``.

The
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
now supports service name in addition to ``-c`` option with channel
number. The supported names are: DUN (Dial-Up Networking), FAX (Fax),
LAN (LAN Access Using PPP), and SP (Serial Port).

The
`snapinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=snapinfo&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility, which shows snapshot locations on UFS filesystems, has been
added.

The
`strtonum(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strtonum&sektion=3&manpath=FreeBSD+6.1-RELEASE>`__
library function has been implemented based on OpenBSD's implementation.
This is an improved version of
`strtoll(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strtoll&sektion=3&manpath=FreeBSD+6.1-RELEASE>`__.

A bug in the
`ypwhich(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypwhich&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility which causes the ``-m`` option to produce an incorrect list of
available named maps has been fixed.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``bluetooth`` script has been added. This script will be called from
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
in response to device attachment/detachment events and to stop/start
particular device without unplugging it by hand. The configuration
parameters are in ``/etc/defaults/bluetooth.device.conf``, and can be
overridden by using ``/etc/bluetooth/$device``.conf (where ``$device``
is ``ubt0``, ``btcc0``, and so on.) For more details, see
`bluetooth.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=bluetooth.conf&sektion=5&manpath=FreeBSD+6.1-RELEASE>`__.

The ``hcsecd`` and ``sdpd`` scripts have been added for
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
and
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
daemons. These daemons can run even if no Bluetooth devices are attached
to the system, but both daemons depend on Bluetooth socket layer and
thus disabled by default. Bluetooth sockets layer must be either loaded
as a module or compiled into kernel before the daemons can run.

The ``hostapd`` script for
`hostapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hostapd&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
has been added.

The ``jail`` script now supports the ``jail_interface`` option and the
``jail_jid_interface`` option which create an IP alias on the given
interface.

The ``netif`` script now supports ``ipv4_addrs_ifn``, which adds one or
more IPv4 address from a ranged list in CIRD notation. For example:

.. code:: PROGRAMLISTING

    ipv4_addrs_ed0="192.168.0.1/24 192.168.1.1-5/28"

The ``ppp-user`` script has been renamed to ``ppp``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**BIND** has been updated from 9.3.1 to 9.3.2.

**hostapd** has been updated from version 0.3.9 to version 0.4.8.

**GNU Troff** has been updated from version 1.19 to version 1.19.2.

**sendmail** has been updated from 8.13.4 to 8.13.6.

The timezone database has been updated from the **tzdata2005l** release
to the **tzdata2005r** release.

**WPA Supplicant** has been updated from version 0.3.9 to version 0.4.8.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
command now supports an ``-P`` flag, which is the same as the ``-p``
flag except that the given prefix is also used recursively for the
dependency packages if any.

The
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
and
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utilities now support a ``-K`` flag to save packages to the current
directory (or ``PKGDIR`` if defined) by default.

The
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
program now supports an ``-x`` flag to support basic regular expressions
for package name, an ``-E`` flag for extended regular expressions, and a
``-G`` for exact matching.

The
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+6.1-RELEASE>`__
utility now supports an ``-o`` flag to show the origin recorded on
package generation instead of the package name, and an ``-O`` flag to
list packages whose registered origin is origin only.

The
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility (``sysutils/portsnap``) has been added into the FreeBSD base
system. This is a secure, easy to use, fast, lightweight, and generally
good way for users to keep their ports trees up to date.

A incorrect handling of ``HTTP_PROXY_AUTH`` in the
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
utility has been fixed.

The startup scripts from the ``local_startup`` directory now evaluated
by using
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
with scripts in the base system.

The suffix of startup scripts from the Ports Collection has been
removed. This means ``foo.sh`` is renamed to ``foo``, and now scripts
whose name is something like ``foo.ORG`` will also be invoked. You are
recommended to reinstall packages which install such scripts and remove
extra files in the ``local_startup`` directory.

New ``rc.conf`` variables, ``ldconfig_local_dirs`` and
``ldconfig_local32_dirs`` have been added. These hold lists of local
`ldconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ldconfig&sektion=8&manpath=FreeBSD+6.1-RELEASE>`__
directories.

The ``@cwd`` command in ``pkg-plist`` now allows no directory argument.
If no directory argument is given, it will set current working directory
to the first prefix given by the ``@cwd`` command.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``/var/audit`` directory and ``audit`` group have been added. These
are for the TrustedBSD **OpenBSM** distribution, which will be imported
in the future releases.

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.10.2 to 2.12.3.

The supported version of the **KDE** desktop environment
(```x11/kde2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde2/pkg-descr>`__)
has been updated from 3.4.2 to 3.5.1.

The supported version of the **Perl** interpreter
(```lang/perl5.8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/lang/perl5.8/pkg-descr>`__)
has been updated from 5.8.7 to 5.8.8.

The supported version of the **Xorg** windowing system
(```x11/xorg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__)
has been updated from 6.8.2 to 6.9.0.

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

Source upgrades to FreeBSD 6.1-RELEASE are only supported from FreeBSD
5.3-RELEASE or later. Users of older systems wanting to upgrade
6.1-RELEASE will need to update to FreeBSD 5.3 or newer first, then to
FreeBSD 6.1-RELEASE.

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

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
