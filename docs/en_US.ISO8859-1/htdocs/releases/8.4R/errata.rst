==========================
FreeBSD 8.4-RELEASE Errata
==========================

.. raw:: html

   <div class="article">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

 The FreeBSD Project 
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2015 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, Centrino, Core, EtherExpress, i386, i486, Itanium,
Pentium, and Xeon are trademarks or registered trademarks of Intel
Corporation or its subsidiaries in the United States and other
countries.

SPARC, SPARC64, and UltraSPARC are trademarks of SPARC International,
Inc in the United States and other countries. SPARC International, Inc
owns all of the SPARC trademarks and under licensing agreements allows
the proper use of these trademarks by its members.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on 2015-02-05 by gjb.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

This document lists errata items for FreeBSD 8.4-RELEASE, containing
significant information discovered after the release or too late in the
release cycle to be otherwise included in the release documentation.
This information includes security advisories, as well as news relating
to the software or documentation that could affect its operation or
usability. An up-to-date version of this document should always be
consulted before installing this version of FreeBSD.

This errata document for FreeBSD 8.4-RELEASE will be maintained until
the FreeBSD 8.4-RELEASE end of life.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <#intro>`__
`2. Security Advisories <#security>`__
`3. Errata Notices <#errata>`__
`4. Open Issues <#open-issues>`__
`5. Late-Breaking News and Corrections <#late-news>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This errata document contains “late-breaking news” about FreeBSD
8.4-RELEASE Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at
``http://www.FreeBSD.org/releases/``, plus any sites which keep
up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 8.4-STABLE also contain
up-to-date copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
``http://www.FreeBSD.org/security/`` or
``ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.?Security Advisories
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Problems described in the following security advisories have been fixed
in 8.4-RELEASE. For more information, consult the individual advisories
available from ``http://security.FreeBSD.org/``.

.. raw:: html

   <div class="informaltable">

+------------------------------+-----------------------+-----------------------+
| Advisory                     | Date                  | Topic                 |
+==============================+=======================+=======================+
| `FreeBSD-SA-13:07.bind <http | 26?July?2013          | Denial of Service     |
| s://www.FreeBSD.org/security |                       | vulnerability in      |
| /advisories/FreeBSD-SA-13:07 |                       | `named(8) <http://www |
| .bind.asc>`__                |                       | .FreeBSD.org/cgi/man. |
|                              |                       | cgi?query=named&sekti |
|                              |                       | on=8>`__              |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-13:09.ip\_multic | 21?August?2013        | Integer overflow in   |
| ast <https://www.FreeBSD.org |                       | computing the size of |
| /security/advisories/FreeBSD |                       | a temporary buffer    |
| -SA-13:09.ip_multicast.asc>` |                       | can result in a       |
| __                           |                       | buffer which is too   |
|                              |                       | small for the         |
|                              |                       | requested operation   |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-13:10.sctp <http | 21?August?2013        | Fix a bug that could  |
| s://www.FreeBSD.org/security |                       | lead to kernel memory |
| /advisories/FreeBSD-SA-13:10 |                       | disclosure with SCTP  |
| .sctp.asc>`__                |                       | state cookie          |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-13:12.ifioctl <h | 10?September?2013     | In IPv6 and NetATM,   |
| ttps://www.FreeBSD.org/secur |                       | stop ``SIOCSIFADDR``, |
| ity/advisories/FreeBSD-SA-13 |                       | ``SIOCSIFBRDADDR``,   |
| :12.ifioctl.asc>`__          |                       | ``SIOCSIFDSTADDR``    |
|                              |                       | and                   |
|                              |                       | ``SIOCSIFNETMASK`` at |
|                              |                       | the socket layer      |
|                              |                       | rather than pass them |
|                              |                       | on to the link layer  |
|                              |                       | without validation or |
|                              |                       | credential checks     |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-13:13.nullfs <ht | 10?September?2013     | Prevent cross-mount   |
| tps://www.FreeBSD.org/securi |                       | hardlinks between     |
| ty/advisories/FreeBSD-SA-13: |                       | different nullfs      |
| 13.nullfs.asc>`__            |                       | mounts of the same    |
|                              |                       | underlying filesystem |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:01.bsnmpd <ht | 14?January?2014       | bsnmpd remote denial  |
| tps://www.FreeBSD.org/securi |                       | of service            |
| ty/advisories/FreeBSD-SA-14: |                       | vulnerability         |
| 01.bsnmpd.asc>`__            |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:02.ntpd <http | 14?January?2014       | ntpd distributed      |
| s://www.FreeBSD.org/security |                       | reflection Denial of  |
| /advisories/FreeBSD-SA-14:02 |                       | Service vulnerability |
| .ntpd.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:04.bind <http | 14?January?2014       | BIND remote denial of |
| s://www.FreeBSD.org/security |                       | service vulnerability |
| /advisories/FreeBSD-SA-14:04 |                       |                       |
| .bind.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:05.nfsserver  | 8?April?2014          | NFS deadlock          |
| <https://www.FreeBSD.org/sec |                       | vulnerability         |
| urity/advisories/FreeBSD-SA- |                       |                       |
| 14:05.nfsserver.asc>`__      |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:06.openssl <h | 8?April?2014          | ECDSA Cache           |
| ttps://www.FreeBSD.org/secur |                       | Side-channel Attack   |
| ity/advisories/FreeBSD-SA-14 |                       | in OpenSSL            |
| :06.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:08.tcp <https | 30?April?2014         | TCP reassembly        |
| ://www.FreeBSD.org/security/ |                       | vulnerability         |
| advisories/FreeBSD-SA-14:08. |                       |                       |
| tcp.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:11.sendmail < | 5?June?2014           | sendmail improper     |
| https://www.FreeBSD.org/secu |                       | close-on-exec flag    |
| rity/advisories/FreeBSD-SA-1 |                       | handling              |
| 4:11.sendmail.asc>`__        |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:12.ktrace <ht | 5?June?2014           | ktrace memory         |
| tps://www.FreeBSD.org/securi |                       | disclosure            |
| ty/advisories/FreeBSD-SA-14: |                       |                       |
| 12.ktrace.asc>`__            |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:14.openssl <h | 5?June?2014           | OpenSSL multiple      |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities       |
| ity/advisories/FreeBSD-SA-14 |                       |                       |
| :14.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:16.file <http | 5?June?2014           | Multiple              |
| s://www.FreeBSD.org/security |                       | vulnerabilities in    |
| /advisories/FreeBSD-SA-14:16 |                       | `file(1) <http://www. |
| .file.asc>`__                |                       | FreeBSD.org/cgi/man.c |
|                              |                       | gi?query=file&sektion |
|                              |                       | =1>`__                |
|                              |                       | and                   |
|                              |                       | `libmagic(3) <http:// |
|                              |                       | www.FreeBSD.org/cgi/m |
|                              |                       | an.cgi?query=libmagic |
|                              |                       | &sektion=3>`__        |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:17.kmem <http | 8?July?2014           | kernel memory         |
| s://www.FreeBSD.org/security |                       | disclosure in control |
| /advisories/FreeBSD-SA-14:17 |                       | message and SCTP      |
| .kmem.asc>`__                |                       | notifications         |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:18.openssl <h | 9?September?2014      | Multiple              |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities in    |
| ity/advisories/FreeBSD-SA-14 |                       | OpenSSL               |
| :18.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:19.tcp <https | 16?September?2014     | Denial of Service in  |
| ://www.FreeBSD.org/security/ |                       | TCP packet processing |
| advisories/FreeBSD-SA-14:19. |                       |                       |
| tcp.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:21.routed <ht | 21?October?2014       | `routed(8) <http://ww |
| tps://www.FreeBSD.org/securi |                       | w.FreeBSD.org/cgi/man |
| ty/advisories/FreeBSD-SA-14: |                       | .cgi?query=routed&sek |
| 21.routed.asc>`__            |                       | tion=8>`__            |
|                              |                       | denial of service     |
|                              |                       | vulnerability         |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:23.openssl <h | 21?October?2014       | Multiple              |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities in    |
| ity/advisories/FreeBSD-SA-14 |                       | OpenSSL               |
| :23.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:25.setlogin < | 4?November?2014       | kernel stack          |
| https://www.FreeBSD.org/secu |                       | disclosure in         |
| rity/advisories/FreeBSD-SA-1 |                       | `setlogin(2) <http:// |
| 4:25.setlogin.asc>`__        |                       | www.FreeBSD.org/cgi/m |
|                              |                       | an.cgi?query=setlogin |
|                              |                       | &sektion=2>`__        |
|                              |                       | and                   |
|                              |                       | `getlogin(2) <http:// |
|                              |                       | www.FreeBSD.org/cgi/m |
|                              |                       | an.cgi?query=getlogin |
|                              |                       | &sektion=2>`__        |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:26.ftp <https | 4?November?2014       | Remote command        |
| ://www.FreeBSD.org/security/ |                       | execution in          |
| advisories/FreeBSD-SA-14:26. |                       | `ftp(1) <http://www.F |
| ftp.asc>`__                  |                       | reeBSD.org/cgi/man.cg |
|                              |                       | i?query=ftp&sektion=1 |
|                              |                       | >`__                  |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:28.file <http | 10?December?2014      | Multiple              |
| s://www.FreeBSD.org/security |                       | vulnerabilities in    |
| /advisories/FreeBSD-SA-14:28 |                       | `file(1) <http://www. |
| .file.asc>`__                |                       | FreeBSD.org/cgi/man.c |
|                              |                       | gi?query=file&sektion |
|                              |                       | =1>`__                |
|                              |                       | and                   |
|                              |                       | `libmagic(3) <http:// |
|                              |                       | www.FreeBSD.org/cgi/m |
|                              |                       | an.cgi?query=libmagic |
|                              |                       | &sektion=3>`__        |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:29.bind <http | 10?December?2014      | BIND remote denial of |
| s://www.FreeBSD.org/security |                       | service vulnerability |
| /advisories/FreeBSD-SA-14:29 |                       |                       |
| .bind.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:31.ntp <https | 23?December?2014      | Multiple              |
| ://www.FreeBSD.org/security/ |                       | vulnerabilities in    |
| advisories/FreeBSD-SA-14:31. |                       | NTP suite             |
| ntp.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:01.ntp <https | 14?January?2015       | Multiple              |
| ://www.FreeBSD.org/security/ |                       | vulnerabilities in    |
| advisories/FreeBSD-SA-15:01. |                       | OpenSSL               |
| openssl.asc>`__              |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:02.kmem <http | 27?January?2015       | Fix SCTP              |
| s://www.FreeBSD.org/security |                       | SCTP\_SS\_VALUE       |
| /advisories/FreeBSD-SA-15:02 |                       | kernel memory         |
| .kmem.asc>`__                |                       | corruption and        |
|                              |                       | disclosure            |
|                              |                       | vulnerability         |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:03.sctp <http | 27?January?2015       | Fix SCTP stream reset |
| s://www.FreeBSD.org/security |                       | vulnerability         |
| /advisories/FreeBSD-SA-15:03 |                       |                       |
| .sctp.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:04.igmp <http | 25?February?2015      | Integer overflow in   |
| s://www.FreeBSD.org/security |                       | IGMP protocol         |
| /advisories/FreeBSD-SA-15:04 |                       |                       |
| .igmp.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:05.igmp <http | 25?February?2015      | Remote denial of      |
| s://www.FreeBSD.org/security |                       | service vulnerability |
| /advisories/FreeBSD-SA-15:05 |                       |                       |
| .bind.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:06.openssl <h | 19?March?2015         | Multiple              |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities       |
| ity/advisories/FreeBSD-SA-15 |                       |                       |
| :06.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:07.ntp <https | 7?April?2015          | Multiple              |
| ://www.FreeBSD.org/security/ |                       | vulnerabilities       |
| advisories/FreeBSD-SA-15:07. |                       |                       |
| ntp.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:09.ipv6 <http | 7?April?2015          | Router advertisement  |
| s://www.FreeBSD.org/security |                       | Denial of Service     |
| /advisories/FreeBSD-SA-15:09 |                       |                       |
| .ipv6.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:10.openssl <h | 16?June?2015          | Multiple              |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities       |
| ity/advisories/FreeBSD-SA-15 |                       |                       |
| :10.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:11.bind <http | 7?July?2015           | Resolver remote       |
| s://www.FreeBSD.org/security |                       | denial of service     |
| /advisories/FreeBSD-SA-15:11 |                       |                       |
| .bind.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.?Errata Notices
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------------------+-----------------------+-----------------------+
| Errata                       | Date                  | Topic                 |
+==============================+=======================+=======================+
| `FreeBSD-EN-13:01.fxp <https | 28?June?2013          | Fixed a problem where |
| ://www.FreeBSD.org/security/ |                       | `dhclient(8) <http:// |
| advisories/FreeBSD-EN-13:01. |                       | www.FreeBSD.org/cgi/m |
| fxp.asc>`__                  |                       | an.cgi?query=dhclient |
|                              |                       | &sektion=8>`__        |
|                              |                       | would infinitely try  |
|                              |                       | to intialize          |
|                              |                       | `fxp(4) <http://www.F |
|                              |                       | reeBSD.org/cgi/man.cg |
|                              |                       | i?query=fxp&sektion=4 |
|                              |                       | >`__                  |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-13:02.vtnet <htt | 28?June?2013          | Fixed a problem       |
| ps://www.FreeBSD.org/securit |                       | frames sent to        |
| y/advisories/FreeBSD-EN-13:0 |                       | additional MAC        |
| 2.vtnet.asc>`__              |                       | addresses are not     |
|                              |                       | forwarded to the      |
|                              |                       | `vtnet(4) <http://www |
|                              |                       | .FreeBSD.org/cgi/man. |
|                              |                       | cgi?query=vtnet&sekti |
|                              |                       | on=4>`__              |
|                              |                       | interface             |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-13:04.freebsd-up | 26?October?2013       | Multiple fixes        |
| date <https://www.FreeBSD.or |                       |                       |
| g/security/advisories/FreeBS |                       |                       |
| D-EN-13:04.freebsd-update.as |                       |                       |
| c>`__                        |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-13:05.freebsd-up | 28?November?2013      | Fix INDEX generation  |
| date <https://www.FreeBSD.or |                       |                       |
| g/security/advisories/FreeBS |                       |                       |
| D-EN-13:05.freebsd-update.as |                       |                       |
| c>`__                        |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:01.random <ht | 14?January?2014       | Disable hardware RNGs |
| tps://www.FreeBSD.org/securi |                       | by default            |
| ty/advisories/FreeBSD-EN-14: |                       |                       |
| 01.random.asc>`__            |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:02.mmap <http | 14?January?2014       | Fix incorrect         |
| s://www.FreeBSD.org/security |                       | coalescing of stack   |
| /advisories/FreeBSD-EN-14:02 |                       | entry                 |
| .mmap.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:03.pkg <https | 15?May?2014           | Add pkg               |
| ://www.FreeBSD.org/security/ |                       | bootstrapping,        |
| advisories/FreeBSD-EN-14:03. |                       | configuration and     |
| pkg.asc>`__                  |                       | public keys           |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:04.kldxref <h | 15?May?2014           | Improve build         |
| ttps://www.FreeBSD.org/secur |                       | repeatability for     |
| ity/advisories/FreeBSD-EN-14 |                       | `kldxref(8) <http://w |
| :04.kldxref.asc>`__          |                       | ww.FreeBSD.org/cgi/ma |
|                              |                       | n.cgi?query=kldxref&s |
|                              |                       | ektion=8>`__          |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:06.exec <http | 3?June?2014           | Fix triple-fault when |
| s://www.FreeBSD.org/security |                       | executing from a      |
| /advisories/FreeBSD-EN-14:06 |                       | threaded process      |
| .exec.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:08.heimdal <h | 24?June?2014          | Fix                   |
| ttps://www.FreeBSD.org/secur |                       | ``gss_pseudo_random() |
| ity/advisories/FreeBSD-EN-14 |                       | ``                    |
| :08.heimdal.asc>`__          |                       | interoperability      |
|                              |                       | issue                 |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:09.jail <http | 8?July?2014           | Fix jail fails to     |
| s://www.FreeBSD.org/security |                       | start if              |
| /advisories/FreeBSD-EN-14:09 |                       | WITHOUT\_INET/WITHOUT |
| .jail.asc>`__                |                       | \_INET6               |
|                              |                       | is use                |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:10.tzdata <ht | 21?October?2014       | Time zone data file   |
| tps://www.FreeBSD.org/securi |                       | update                |
| ty/advisories/FreeBSD-EN-14: |                       |                       |
| 10.tzdata.asc>`__            |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:12.zfs <https | 4?November?2014       | Fix NFSv4 and ZFS     |
| ://www.FreeBSD.org/security/ |                       | cache consistency     |
| advisories/FreeBSD-EN-14:12. |                       | issue                 |
| zfs.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-14:13.freebsd-up | 23?December?2014      | Fix directory         |
| date <https://www.FreeBSD.or |                       | deletion issue        |
| g/security/advisories/FreeBS |                       |                       |
| D-EN-14:13.freebsd-update.as |                       |                       |
| c>`__                        |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:02.openssl <h | 25?February?2015      | OpenSSL update        |
| ttps://www.FreeBSD.org/secur |                       |                       |
| ity/advisories/FreeBSD-EN-15 |                       |                       |
| :02.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:03.freebsd-up | 25?February?2015      | `freebsd-update(8) <h |
| date <https://www.FreeBSD.or |                       | ttp://www.FreeBSD.org |
| g/security/advisories/FreeBS |                       | /cgi/man.cgi?query=fr |
| D-EN-15:03.freebsd-update.as |                       | eebsd-update&sektion= |
| c>`__                        |                       | 8>`__                 |
|                              |                       | updates libraries in  |
|                              |                       | suboptimal order      |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:04.freebsd-up | 13?May?2015           | `freebsd-update(8) <h |
| date <https://www.FreeBSD.or |                       | ttp://www.FreeBSD.org |
| g/security/advisories/FreeBS |                       | /cgi/man.cgi?query=fr |
| D-EN-15:04.freebsd-update.as |                       | eebsd-update&sektion= |
| c>`__                        |                       | 8>`__                 |
|                              |                       | does not ensure the   |
|                              |                       | previous upgrade has  |
|                              |                       | completed             |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:06.file <http | 9?June?2015           | Multiple denial of    |
| s://www.FreeBSD.org/security |                       | service issues        |
| /advisories/FreeBSD-EN-15:06 |                       |                       |
| .file.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:08.sendmail < | 30?June?2015          | Sendmail TLS/DH       |
| https://www.FreeBSD.org/secu | (revised)             | interoperability      |
| rity/advisories/FreeBSD-EN-1 |                       | improvement           |
| 5:08.sendmail.asc>`__        |                       |                       |
+------------------------------+-----------------------+-----------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.?Open Issues
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

[20130613] The
`vtnet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vtnet&sektion=4>`__
network interface driver displays the following message upon
configuration when using QEMU 1.4.1 and later:

.. code:: screen

    vtnet0: error setting host MAC filter table

This message is harmless when the interface has only one MAC address.
The patch for this issue is filed to a PR
`kern/178955 <http://www.FreeBSD.org/cgi/query-pr.cgi?pr=178955>`__.

[20130609] There is incompatibility in
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
configuration because the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
utility and ``rc.d/jail`` script has been changed. More specifically,
the following
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variables cannot be used to set the default parameters for jails:

.. code:: programlisting

    security.jail.mount_zfs_allowed
    security.jail.mount_procfs_allowed
    security.jail.mount_nullfs_allowed
    security.jail.mount_devfs_allowed
    security.jail.mount_allowed
    security.jail.chflags_allowed
    security.jail.allow_raw_sockets
    security.jail.sysvipc_allowed
    security.jail.socket_unixiproute_only
    security.jail.set_hostname_allowed

These could be set by manually using
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
utility, the
`sysctl.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl.conf&sektion=5>`__
file, or for some of them the following variables in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__:

.. code:: programlisting

    jail_set_hostname_allow="yes"
    jail_socket_unixiproute_only="yes"
    jail_sysvipc_allow="yes"

These parameters must now be specified in ``jail_parameters`` (or
``jail_jailname``\ \_parameters for per-jail configuration) in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.
For example:

.. code:: programlisting

    jail_parameters="allow.sysvipc allow.raw_sockets"

The valid keywords are the following. For more detail, see
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
manual page.

.. code:: programlisting

    allow.set_hostname
    allow.sysvipc
    allow.raw_sockets
    allow.chflags
    allow.mount
    allow.mount.devfs
    allow.mount.nullfs
    allow.mount.procfs
    allow.mount.zfs
    allow.quotas
    allow.socket_af

[20130608] FreeBSD 8.4-RELEASE no longer supports FreeBSD CVS
repository. Some documents mistakenly refer to ``RELENG_8_4_0_RELEASE``
as CVS tag for the release and ``RELENG_8_4`` as CVS branch tag for the
8.4-RELEASE security branch. However, FreeBSD Project no longer supports
FreeBSD CVS repository and 8.4-RELEASE has been released by using
FreeBSD subversion repository instead. ``RELENG_8_4`` corresponds to
``svn://svn.FreeBSD.org/base/releng/8.4``, and ``RELENG_8_4_0_RELEASE``
corresponds to ``svn://svn.FreeBSD.org/base/release/8.4.0``. Please note
that FreeBSD source tree for 8.4-RELEASE and its security branch cannot
be updated by using official CVSup servers.

[20130607] (removed about a
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4>`__
network interface driver issue because it was incorrect)

[20130606] The
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4>`__
network interface driver may not work well with the
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
utility. More specifically, if the ``/etc/rc.conf`` has the following
line:

.. code:: programlisting

    ifconfig_fxp0="DHCP"

to activate a DHCP client to configure the network interface, the
following notification messages are displayed and the
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
utility keeps trying to initialize the network interface forever.

.. code:: screen

    kernel: fxp0: link state changed to UP
    kernel: fxp0: link state changed to DOWN

A patch to fix this issue will be released as an Errata Notice.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.?Late-Breaking News and Corrections
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

[20130606] As described in FreeBSD 8.4-RELEASE Release Notes, FreeBSD
ZFS subsystem has been updated to support feature flags for ZFS pools.
However, the default version number of a newly created ZFS pool is still
``28``.

This is because FreeBSD 9.0 and 9.1 do not support the feature flags.
This means ZFS pools with feature flag support cannot be used on FreeBSD
9.0 and 9.1. An 8.X system with v28 ZFS pools can be upgraded to 9.X
with no problem. Note that
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
``send`` and ``receive`` commands do not work between pools with
different versions. Once a ZFS pool is upgraded from v28, there is no
way to upgrade the system to FreeBSD 9.0 and 9.1. FreeBSD 9.2 and later
will support ZFS pools with feature flags.

To create a ZFS pool with feature flag support, use the
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__
``create`` command and then the
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__
``upgrade`` command.

.. raw:: html

   </div>

.. raw:: html

   </div>
