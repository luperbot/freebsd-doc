==========================
FreeBSD 9.1-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2012 The FreeBSD Documentation Project

| $FreeBSD: stable/9/release/doc/en\_US.ISO8859-1/errata/article.xml
  244671 2012-12-25 06:07:34Z hrs $

.. raw:: html

   <div class="legalnotice">

FreeBSD is a registered trademark of the FreeBSD Foundation.

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

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="abstract">

    This document lists errata items for FreeBSD 9.1-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 9.1-RELEASE will be maintained
    until the release of FreeBSD 9.2-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="sect1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
9.1-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 9.1-STABLE also contain
up-to-date copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
http://www.FreeBSD.org/security/ or
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

--------------

2 Security Advisories
---------------------

Problems described in the following security advisories have been fixed
in 9.1-RELEASE. For more information, consult the individual advisories
available from http://security.FreeBSD.org/.

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

   <div class="sect1">

--------------

3 Late-Breaking News
--------------------

[November 2, 2012] The current
`mfi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mfi&sektion=4&manpath=FreeBSD+9.1-RELEASE>`__
driver has an overflow bug when handling disks larger than 2^32 sectors
in SYSPD volumes, also known as JBODs, which will cause data corruption.
This bug has been fixed on this FreeBSD-CURRENT but was too late for
inclusion in this release. An Errata Notice for 9.1-RELEASE is planned.

[December 25, 2012] The Installtion Instructions had the following wrong
information about upgrading procedure. All of them have been fixed in
the online version.

-  The link URL of “upgrading section in the Release Notes”, branch
   names where upcoming Security Advisories or Errata Notices will be
   applied, and a command line argument of
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   were ones for 9.0-RELEASE, not for 9.1-RELEASE.

-  The list of releases supported by
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.1-RELEASE>`__
   utility were incorrect. For 9.X, The following versions are
   supported: ``9.0-RELEASE``, ``9.1-BETA1``, and ``9.1-RC[123]``.

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
