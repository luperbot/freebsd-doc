==========================
FreeBSD 6.1-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 6.1-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.73.2.37 2007/01/11 20:11:49 bmah Exp $

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

    This document lists errata items for FreeBSD 6.1-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 6.1-RELEASE will be maintained
    until the release of FreeBSD 6.2-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
6.1-RELEASE. Before installing this version, it is important to consult
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

The following security advisories pertain to FreeBSD 6.1-RELEASE. For
more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                       | Date                | Topic                                                                                                                                              |
+================================================================================================+=====================+====================================================================================================================================================+
| `SA-06:15.ypserv <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:15.ypserv.asc>`__       | 31 May 2006         | Inoperative access controls in `ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8&manpath=FreeBSD+6.0-stable>`__                |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:16.smbfs <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:16.smbfs.asc>`__         | 31 May 2006         | smbfs chroot escape                                                                                                                                |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:17.sendmail <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:17.sendmail.asc>`__   | 14 June 2006        | Incorrect multipart message handling in Sendmail                                                                                                   |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:18.ppp <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:18.ppp.asc>`__             | 23 August 2006      | Buffer overflow in `sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+6.0-stable>`__                                |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:19.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:19.openssl.asc>`__     | 06 September 2006   | Incorrect PKCS#1 v1.5 padding validation in `crypto(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=3&manpath=FreeBSD+6.0-stable>`__   |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:20.bind <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:20.bind.asc>`__           | 06 September 2006   | Denial of Service in `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+6.0-stable>`__                            |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:21.gzip <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:21.gzip.asc>`__           | 19 September 2006   | Multiple vulnerabilities in `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+6.0-stable>`__                       |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:22.openssh <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:22.openssh.asc>`__     | 30 September 2006   | Multiple vulnerabilities in OpenSSH                                                                                                                |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:23.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:23.openssl.asc>`__     | 28 September 2006   | Multiple problems in `crypto(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=3&manpath=FreeBSD+6.0-stable>`__                          |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:25.kmem <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:25.kmem.asc>`__           | 6 December 2006     | Kernel memory disclosure in `firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?query=firewire&sektion=4&manpath=FreeBSD+6.0-stable>`__               |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:01.jail <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:01.jail.asc>`__           | 11 January 2007     | Jail rc.d script privilege escalation                                                                                                              |
+------------------------------------------------------------------------------------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Known Problems and Solutions
------------------------------

(2006/05/10) The errata file distributed with FreeBSD 6.1-RELEASE
mistakenly contained the errata applicable to FreeBSD 6.0-RELEASE.

(2006/05/10) The release notes for FreeBSD 6.1-RELEASE gave the wrong
name for the KDE port in the item documenting the KDE upgrade. The
correct name is
```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__.

(2006/05/10) The release notes for FreeBSD 6.1-RELEASE should have
mentioned changes that enable the second core of dual-core i386 and
amd64 CPUs by default when running an SMP kernel.

(2006/05/13) A change in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.0-stable>`__
driver in FreeBSD 6.1-RELEASE modified a software interface visible from
userland programs. Programs that use the ``IOCATAREQUEST``
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2&manpath=FreeBSD+6.0-stable>`__
interface will need to be recompiled. Typically, these programs
communicate directly with ATA and ATAPI drives, such as CDROM burning or
ripping tools, or monitoring utilities. One known example is ``smartd``
from the
```sysutils/smartmontools`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/smartmontools/pkg-descr>`__
port.

(2006/05/27, updated 2006/06/01) On FreeBSD/alpha,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.0-stable>`__
sometimes does not allow a disk to be labeled. The disk is presented in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.0-stable>`__
but actions like Auto do not result in a disklabel being presented. One
workaround is to boot the install CD, then select Fixit. From the Fixit#
prompt, run
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+6.0-stable>`__
manually. For example: ``disklabel -rw da1 auto`` ensures a valid
disklabel is written onto ``da1``. Reboot from the install media.
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.0-stable>`__
will now detect a valid disklabel on the disk and allow it to be
partitioned to your preference.

(2006/05/27) FreeBSD 6.1-RELEASE includes a change to some definitions
in ``src/sys/net/if_media.h`` (revision 1.30.2.1). This could break
source-level compatibility with externally-maintained 10Gb Ethernet
network drivers written for FreeBSD 6.0-RELEASE. This change should have
been documented in the release notes.

(2006/06/01, updated 2006/07/07) A bug in the ``rc.d/jail`` startup
script could cause various problems for users attempting to configure
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+6.0-stable>`__
environments at system startup time. A fix has been committed to HEAD,
RELENG\_6, and RELENG\_6\_1. More details can be found in errata notice
`FreeBSD-EN-06:01.jail <ftp://ftp.FreeBSD.org/pub/FreeBSD/ERRATA/notices/FreeBSD-EN-06:01.jail.asc>`__.

(2006/06/01, updated 2006/08/30) Deadlocks have been observed (and can
be reproduced) in some cases where snapshots and quotas are both being
used on a file system. This problem has been fixed on the HEAD and
RELENG\_6 branches.

(2006/06/01, updated 2006/08/28) A bug in the Neighbor Discovery
Protocol (NDP) implementation causes spurious error messages for
point-to-point IPv6 links on FreeBSD 6.1-RELEASE. This behavior is a
regression from FreeBSD 6.0-RELEASE. A solution for this problem has
been committed to HEAD, RELENG\_6, and RELENG\_6\_1. Further details can
be found in errata notice
`FreeBSD-EN-06:02.net <ftp://ftp.FreeBSD.org/pub/FreeBSD/ERRATA/notices/FreeBSD-EN-06:02.net.asc>`__.

(2006/06/01, updated 2006/11/22) Problems have been observed when trying
to load packages from multiple CDROMs inside the
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.0-stable>`__
environment. Specifically, the disk-switching functionality in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.0-stable>`__
seems to become confused about the contents of a disk that has just been
requested. This situation has been seen primarily when installing the
base system without Xorg (which lives on the first CDROM of a multi-disk
set), and then later using
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.0-stable>`__
to load some packages (such as the GNOME or KDE desktop environments)
from a subsequent CDROM that depend on Xorg. As a workaround during a
new install, one should try to install Xorg along with the base system,
or at least before any other packages that depend on it. This problem
has been corrected on HEAD and RELENG\_6.

(2006/06/01, updated 2006/08/28) An error in the statistics-keeping
logic in the UMA kernel memory allocator has led to the number of
``requests for mbufs denied`` (as reported by ``netstat -m``) to
increase erroneously. A fix for this problem has been committed to HEAD,
RELENG\_6, and RELENG\_6\_1. More information is contained in errata
notice
`FreeBSD-EN-06:02.net <ftp://ftp.FreeBSD.org/pub/FreeBSD/ERRATA/notices/FreeBSD-EN-06:02.net.asc>`__.

(2006/06/01, update 2006/10/07) A longstanding bug in the i386
bootloader can cause root file system corruption when the
`nextboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nextboot&sektion=8&manpath=FreeBSD+6.0-stable>`__
utility is used and the ``/boot/nextboot.conf`` configuration file
happens to be located after cylinder 1023 on the boot disk. A bugfix has
been committed to HEAD and has been merged to RELENG\_6.

(2006/06/16, updated 2006/10/07) A locking-related bug has been observed
to cause noticeable slowdowns in NFS server performance. A fix has been
committed to HEAD and RELENG\_6.

(2006/08/28) A local kernel panic in the network stack could be caused
by not checking the validity of a pointer before use. This problem has
been fixed on HEAD, RELENG\_6, and RELENG\_6\_1, as described in
`FreeBSD-EN-06:02.net <ftp://ftp.FreeBSD.org/pub/FreeBSD/ERRATA/notices/FreeBSD-EN-06:02.net.asc>`__.

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
