==========================
FreeBSD 6.0-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 6.0-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.73.2.13 2006/02/05 20:41:34 bmah Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of the FreeBSD Foundation.

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

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 6.0-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 6.0-RELEASE will be maintained
    until the release of FreeBSD 6.1-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
6.0-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 6-STABLE also contain up-to-date
copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
http://www.FreeBSD.org/security/ or
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Update Information
--------------------

No news.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Security Advisories
---------------------

The following security advisories pertain to FreeBSD 6.0-RELEASE. For
more information, consult the individual advisories available from
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/.

.. raw:: html

   <div class="INFORMALTABLE">

+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                               | Date              | Topic                                                                                                                              |
+========================================================================================================+===================+====================================================================================================================================+
| `06:07.pf <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:07.pf.asc>`__               | 25 January 2006   | IP fragment handling panic in `pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+6.0-stable>`__         |
+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:06.kmem <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:06.kmem.asc>`__           | 25 January 2006   | Local kernel memory disclosure                                                                                                     |
+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:05.80211 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:05.80211.asc>`__         | 18 January 2006   | IEEE 802.11 buffer overflow                                                                                                        |
+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:04.ipfw <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:04.ipfw.asc>`__           | 11 January 2006   | `ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__ IP fragment denial of service     |
+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:03.cpio <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:03.cpio.asc>`__           | 11 January 2006   | Multiple vulnerabilities in `cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+6.0-stable>`__       |
+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:02.eex <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:02.ee.asc>`__              | 11 January 2006   | `ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+6.0-stable>`__ temporary file privilege escalation   |
+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:01.texindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:01.texindex.asc>`__   | 11 January 2006   | Texindex temporary file privilege escalation                                                                                       |
+--------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Known Problems and Solutions
------------------------------

(2005/11/26) On 6.0-RELEASE, the following
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
rule is interpreted in a different way from the previous releases:

.. code:: PROGRAMLISTING

    allow ipv6 from 192.168.0.2 to me

When
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
does not support IPv6 (see the next entry for the details),
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-stable>`__
accepts this rule and this blocks an IPv6 packet encapsulated in an IPv4
packet (IPv6-over-IPv4 tunneling, protocol number 41) whose source
address is ``192.168.0.2``. When it supports IPv6, on the other hand,
this means a rule to allow an IPv6 packet from ``192.168.0.2``, and
actually
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-stable>`__
rejects this rule because the syntax is incorrect (“an IPv6 packet from
an IPv4 address” never happens). Unfortunately there is no simple
workaround for this problem.

The
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
IPv6 support still has rough edges and there are other problems due to
incompatibility between the two. As a workaround for them, you can use a
combination of IPv4-only
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
and
`ip6fw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6fw&sektion=8&manpath=FreeBSD+6.0-stable>`__,
which is almost compatible with the prior releases, instead of
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
with IPv6 support. To disable IPv6 support of
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__,
use the ``ipfw.ko`` kernel module and do not use the kernel option
``IPFIREWALL``.

(2005/11/19) Although the FreeBSD 6.0-RELEASE Release Notes states that
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
subsystem now supports IPv6, the combination of the ``GENERIC`` kernel
and a kernel module ``ipfw.ko`` does not support the ``ip6`` protocol
keyword for packet filtering rule. This is because the kernel option
``INET6`` in the kernel configuration file is not recognized when the
``ipfw.ko`` is built. To enable IPv6 support of
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__,
rebuild the kernel with kernel options ``INET6`` and ``IPFIREWALL``
instead of using the ``ipfw.ko`` module.

(2005/11/16) Using
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+6.0-stable>`__
in combination with a packet filter such as
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
and
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+6.0-stable>`__
can prevent the network stack from working and/or lead to a system panic
after a certain period of time. This is because it allocates
`mbuf(9) <http://www.FreeBSD.org/cgi/man.cgi?query=mbuf&sektion=9&manpath=FreeBSD+6.0-stable>`__
buffers for network packets and never releases a part of them, so
eventually all of the buffer memory will be exhausted. This problem has
been fixed in the HEAD and the RELENG\_6 branch after 10:17:15
2005/11/16 UTC.

(2005/11/16, updated on 2005/11/19) When an
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+6.0-stable>`__
``divert`` rule is specified with the protocol keyword ``ip`` or
``all``, IPv6 packets are silently discarded at that rule since the
`divert(4) <http://www.FreeBSD.org/cgi/man.cgi?query=divert&sektion=4&manpath=FreeBSD+6.0-stable>`__
socket does not support IPv6. This can be a problem especially for an
IPv4 and IPv6 dual-stack host with
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+6.0-stable>`__
enabled. **Note that the kernel module ``ipfw.ko`` does not have this
problem because it does not support IPv6.** To avoid this problem, use
an IPv4 specific divert rule such as ``divert natd ipv4`` instead of
``divert natd all``.

(2005/11/6) The FreeBSD 6.0-RELEASE Release Notes wrongly states a
kernel option related to
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+6.0-stable>`__
as ``IPFIRWALL_FORWARD``. The correct option keyword is
``IPFIREWALL_FORWARD``.

(2005/11/5) The FreeBSD 6.0-RELEASE Release Notes wrongly states the
version number of OpenSSH and IPFilter integrated into FreeBSD as 4.1p1
and 4.1.18. The correct versions are 4.2p1 and 4.1.8 respectively.

(2005/11/5) Distribution of 6.0-RELEASE contains ``CHECKSUM.MD5`` and
``CHECKSUM.SHA256`` files for protecting the integrity of data. However,
these files in 6.0-RELEASE erroneously include checksums for the
checksum files themselves. Although the checksums look like wrong, they
can be safely ignored because a checksum for the checksum file never
corresponds to one in the file. This problem will be fixed in the next
releases.

(2005/11/5, FreeBSD/amd64 specific) The
`pmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcstat&sektion=8&manpath=FreeBSD+6.0-stable>`__
utility cannot yet handle 32-bit executables when converting
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+6.0-stable>`__
log files to
`gprof(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gprof&sektion=1&manpath=FreeBSD+6.0-stable>`__
format.

(2005/11/5, FreeBSD/powerpc specific) The following panic may occur at
boot-time on some older PowerMac G4 systems:

.. code:: SCREEN

    ...
    KDB: current backend: ddb
    panic: Assertion curthread != NULL failed at
    /usr/src/sys/kern/kern_mutex.c:268
    KDB: enter panic

This is a known problem with no workaround, and will be fixed in the
next release.

(2005/11/5) Changes of on-disk format of ``/usr/share/locale/*/LC_*``
files in 6.0-RELEASE prevent third-party software which uses
`setlocale(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setlocale&sektion=3&manpath=FreeBSD+6.0-stable>`__
for its localization from working after a 5.x system upgraded. The
software includes ones installed into the 5.x system by using FreeBSD
Ports Collection and so on. To solve this problem, perform one of the
following:

-  Install misc/compat5x package into the upgraded 6.0 system. This
   package installs a library ``lib/compat/libc.so.5`` which makes the
   software complied in a 5.x system use the old locale files to keep
   compatibility. Note that you need to remove ``/lib/libc.so.5`` after
   upgrading.

   This package is available only for Tier-1 platforms.

-  Recompile the software on the 6.0 system.

(2005/10/3) At boot time the FreeBSD/sparc64 GENERIC kernel may output
the following messages when the machine has no framebuffer:

.. code:: SCREEN

    Aug 26 19:31:27 hostname getty[429]: open /dev/ttyv1: No such file or directory

This is because the machine with no supported graphics hardware does not
recognize
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4&manpath=FreeBSD+6.0-stable>`__
and ``/dev/ttyv*`` device nodes are not created. This is not a harmful
error and can be suppressed by disabling ``/dev/ttyv*`` entries in
``/etc/ttys``.

(2005/10/3) Kernel modules do not work on FreeBSD/sparc64 when the
machine has more than 4GB memory. There is no workaround for this issue
except for compiling the modules statically into your custom kernel in
advance.

(2005/10/3) The
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1&manpath=FreeBSD+6.0-stable>`__
utility does not work properly on FreeBSD/sparc64 for debugging panics
which include traps. As a workaround you can use ``devel/gdb53``.

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

All users of FreeBSD 6-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
