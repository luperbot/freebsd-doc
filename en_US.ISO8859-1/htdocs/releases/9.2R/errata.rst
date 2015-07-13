==========================
FreeBSD 9.2-RELEASE Errata
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

Copyright ? 2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

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

Last modified on 2014-07-08 by gjb.

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

This document lists errata items for FreeBSD 9.2-RELEASE, containing
significant information discovered after the release or too late in the
release cycle to be otherwise included in the release documentation.
This information includes security advisories, as well as news relating
to the software or documentation that could affect its operation or
usability. An up-to-date version of this document should always be
consulted before installing this version of FreeBSD.

This errata document for FreeBSD 9.2-RELEASE will be maintained until
the release of FreeBSD 9.3-RELEASE.

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
`3. Late-Breaking News <#late-news>`__

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
9.2-RELEASE Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at
``http://www.FreeBSD.org/releases/``, plus any sites which keep
up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 9.3-STABLE also contain
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
in 9.3-RELEASE. For more information, consult the individual advisories
available from ``http://security.FreeBSD.org/``.

.. raw:: html

   <div class="informaltable">

+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| Advisory                                                                                             | Date             | Topic                                                                 |
+======================================================================================================+==================+=======================================================================+
| `SA-14:01.bsnmpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:01.bsnmpd.asc>`__         | 1?January?2014   | Fix bsnmpd remote denial of service vulnerability                     |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:02.ntpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:02.ntpd.asc>`__             | 1?January?2014   | Fix ntpd distributed reflection Denial of Service vulnerability       |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:03.ntpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:03.bind.asc>`__             | 1?January?2014   | Fix BIND remote denial of service vulnerability                       |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:05.nfsserver <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:05.nfsserver.asc>`__   | 8?April?2014     | Fix NFS deadlock vulnerability                                        |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:06.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:06.openssl.asc>`__       | 8?April?2014     | Fix ECDSA Cache Side-channel Attack                                   |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:08.tcp <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:08.tcp.asc>`__               | 30?April?2014    | Fix TCP reassembly vulnerability                                      |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:11.sendmail <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:11.sendmail.asc>`__     | 3?June?2014      | Fix sendmail improper close-on-exec flag handling                     |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:12.ktrace <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:12.ktrace.asc>`__         | 3?June?2014      | Fix ktrace memory disclosure                                          |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:13.pam <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:13.pam.asc>`__               | 3?June?2014      | Fix incorrect error handling in PAM policy parser                     |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:14.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:14.openssl.asc>`__       | 5?June?2014      | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:16.file <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:16.file.asc>`__             | 24?June?2014     | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+
| `SA-14:17.kmem <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:17.kmem.asc>`__             | 8?July?2014      | Kernel memory disclosure in control messages and SCTP notifications   |
+------------------------------------------------------------------------------------------------------+------------------+-----------------------------------------------------------------------+

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

3.?Late-Breaking News
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

No late-breaking news.

.. raw:: html

   </div>

.. raw:: html

   </div>

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 9.3-STABLE should subscribe to the
<current@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
