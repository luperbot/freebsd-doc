==========================
FreeBSD 5.5-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.5-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.69.2.53 2008/04/17 19:10:57 delphij Exp $

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
of the trademark claim, the designations have been followed by the
\`\`™'' or the \`\`®'' symbol.

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 5.5-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 5.5-RELEASE will be maintained
    until the end-of-life date for the 5-STABLE branch. As of the
    release date, this date was estimated to be 31 May 2008. The current
    end-of-life state for the various FreeBSD branches can be found at
    http://security.freebsd.org/.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains \`\`late-breaking news'' about FreeBSD
5.5-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the \`\`current errata'' for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 5-STABLE also contain up-to-date
copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
http://security.FreeBSD.org/ or ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Security Advisories
---------------------

The following security advisories pertain to FreeBSD 5.5-RELEASE. For
more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                           | Date                | Topic                                                                                                                                               |
+====================================================================================================+=====================+=====================================================================================================================================================+
| `SA-06:15.ypserv <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:15.ypserv.asc>`__           | 31 May 2006         | Inoperative access controls in `ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8&manpath=FreeBSD+5.5-stable>`__                 |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:16.smbfs <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:16.smbfs.asc>`__             | 31 May 2006         | smbfs chroot escape                                                                                                                                 |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:17.sendmail <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:17.sendmail.asc>`__       | 14 June 2006        | Incorrect multipart message handling in Sendmail                                                                                                    |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:18.ppp <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:18.ppp.asc>`__                 | 23 August 2006      | Buffer overflow in `sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+5.5-stable>`__                                 |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:19.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:19.openssl.asc>`__         | 06 September 2006   | Incorrect PKCS#1 v1.5 padding validation in `crypto(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=3&manpath=FreeBSD+5.5-stable>`__    |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:20.bind <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:20.bind.asc>`__               | 06 September 2006   | Denial of Service in `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.5-stable>`__                             |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:21.gzip <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:21.gzip.asc>`__               | 19 September 2006   | Multiple vulnerabilities in `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.5-stable>`__                        |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:22.openssh <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:22.openssh.asc>`__         | 30 September 2006   | Multiple vulnerabilities in OpenSSH                                                                                                                 |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:23.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:23.openssl.asc>`__         | 28 September 2006   | Multiple problems in `crypto(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=3&manpath=FreeBSD+5.5-stable>`__                           |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:25.kmem <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:25.kmem.asc>`__               | 6 December 2006     | Kernel memory disclosure in `firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?query=firewire&sektion=4&manpath=FreeBSD+5.5-stable>`__                |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:26.gtar <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:26.gtar.asc>`__               | 6 December 2006     | `gtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gtar&sektion=1&manpath=FreeBSD+5.5-stable>`__ name mangling symlink vulnerability                |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:01.jail <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:01.jail.asc>`__               | 11 January 2007     | Jail rc.d script privilege escalation                                                                                                               |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:02.bind <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:02.bind.asc>`__               | 9 February 2007     | Multiple Denial of Service vulnerabilities in `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.5-stable>`__    |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:03.ipv6 <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:03.ipv6.asc>`__               | 26 April 2007       | IPv6 Routing Header 0 is dangerous                                                                                                                  |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:05.libarchive <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:05.libarchive.asc>`__   | 12 July 2007        | Errors handling corrupt tar files in `libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+5.5-stable>`__   |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:09.random <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:09.random.asc>`__           | 29 November 2007    | Random value disclosure                                                                                                                             |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:10.gtar <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:10.gtar.asc>`__               | 29 November 2007    | `gtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gtar&sektion=1&manpath=FreeBSD+5.5-stable>`__ directory traversal vulnerability                  |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:01.pty <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:01.pty.asc>`__                 | 14 January 2008     | pty snooping                                                                                                                                        |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:03.sendfile <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:03.sendfile.asc>`__       | 14 February 2008    | `sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+5.5-stable>`__ write-only file permission bypass          |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:04.ipsec <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:04.ipsec.asc>`__             | 14 February 2008    | IPsec null pointer dereference panic                                                                                                                |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:05.openssh <http://security.freebsd.org/advisories/FreeBSD-SA-08:05.openssh.asc>`__         | 17 April 2008       | OpenSSH X11-forwarding privilege escalation                                                                                                         |
+----------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

(24 May 2006) The NFSv4 client in 5.5-RELEASE is an unfinished
prototype, and there are a number of issues with it (many documented in
the FreeBSD GNATS database) that make it unusable in many situations.
Given the state of 5-STABLE development, it is unlikely that these will
be resolved on this development branch.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News
--------------------

(31 May 2006) Thanks to the efforts of Paul Saab, torrents for the
various FreeBSD 5.5-RELEASE ISO images are now available at
http://torrents.freebsd.org:8080/.

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

All users of FreeBSD 5-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
