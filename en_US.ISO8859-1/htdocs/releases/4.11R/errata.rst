===========================
FreeBSD 4.11-RELEASE Errata
===========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.11-RELEASE Errata
===========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.136 2007/03/07 20:00:32 bmah Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

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

    This document lists errata items for FreeBSD 4.11-RELEASE,
    containing significant information discovered after the release or
    too late in the release cycle to be otherwise included in the
    release documentation. This information includes security
    advisories, as well as news relating to the software or
    documentation that could affect its operation or usability. An
    up-to-date version of this document should always be consulted
    before installing this version of FreeBSD.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains \`\`late-breaking news'' about FreeBSD
4.11-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the \`\`current errata'' for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 4-STABLE also contain up-to-date
copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
http://security.FreeBSD.org/ or ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   <div class="NOTE">

    **Note:** FreeBSD 4.11-RELEASE, as well as the FreeBSD 4-STABLE
    branch from which it comes, have reached \`\`End of Life'' status
    and are no longer supported as of 1 February 2007. Specifically, the
    Security Officer Team will no longer be issuing advisories against
    FreeBSD 4-STABLE. In addition, the Ports Manager Team will no longer
    perform package builds for 4-STABLE, and building ports from source
    on 4-STABLE is no longer supported.

    Additional information on this topic can be found in `a
    posting <http://lists.freebsd.org/pipermail/freebsd-stable/2007-February/032766.html>`__
    to the `FreeBSD-STABLE mailing
    list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Security Advisories
---------------------

The following security advisories pertain to FreeBSD 4.11-RELEASE. For
more information, consult the individual advisories available from
http://security.FreeBSD.org/advisories/.

.. raw:: html

   <div class="INFORMALTABLE">

+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                       | Date                | Topic                                                                                                                                               |
+================================================================================================+=====================+=====================================================================================================================================================+
| `SA-05:01.telnet <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:01.telnet.asc>`__       | 28 March 2005       | telnet client buffer overflows                                                                                                                      |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:02.sendfile <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:02.sendfile.asc>`__   | 4 April 2005        | sendfile kernel memory disclosure                                                                                                                   |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:04.ifconf <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:04.ifconf.asc>`__       | 15 April 2005       | Kernel memory disclosure in ifconf()                                                                                                                |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:05.cvs <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:05.cvs.asc>`__             | 22 April 2005       | Multiple vulnerabilities in CVS                                                                                                                     |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:06.iir <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:06.iir.asc>`__             | 6 May 2005          | Incorrect permissions on /dev/iir                                                                                                                   |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:07.ldt <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:07.ldt.asc>`__             | 6 May 2005          | Local kernel memory disclosure in i386\_get\_ldt                                                                                                    |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:08.kmem <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:08.kmem.asc>`__           | 6 May 2005          | Local kernel memory disclosure                                                                                                                      |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:09.htt <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:09.htt.asc>`__             | 13 May 2005         | information disclosure when using HTT                                                                                                               |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:11.gzip <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:11.gzip.asc>`__           | 9 June 2005         | gzip directory traversal and permission race vulnerabilities                                                                                        |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:14.bzip2 <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:14.bzip2.asc>`__         | 29 June 2005        | bzip2 denial of service and permission race vulnerabilities                                                                                         |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:15.tcp <http://security.FreeBSD.org/advisories/FreeBSD-SA-05:15.tcp.asc>`__             | 29 June 2005        | TCP connection stall denial of service                                                                                                              |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:16.smbfs <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:16.smbfs.asc>`__         | 31 May 2006         | smbfs chroot escape                                                                                                                                 |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:17.sendmail <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:17.sendmail.asc>`__   | 14 June 2006        | Incorrect multipart message handling in Sendmail                                                                                                    |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:18.ppp <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:18.ppp.asc>`__             | 23 August 2006      | Buffer overflow in `sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4&manpath=FreeBSD+4.11-stable>`__                                |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:19.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:19.openssl.asc>`__     | 06 September 2006   | Incorrect PKCS#1 v1.5 padding validation in `crypto(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=3&manpath=FreeBSD+4.11-stable>`__   |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:21.gzip <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:21.gzip.asc>`__           | 19 September 2006   | Multiple vulnerabilities in `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+4.11-stable>`__                       |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:22.openssh <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:22.openssh.asc>`__     | 30 September 2006   | Multiple vulnerabilities in OpenSSH                                                                                                                 |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:23.openssl <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:23.openssl.asc>`__     | 28 September 2006   | Multiple problems in `crypto(3) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=3&manpath=FreeBSD+4.11-stable>`__                          |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:25.kmem <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:25.kmem.asc>`__           | 6 December 2006     | Kernel memory disclosure in `firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?query=firewire&sektion=4&manpath=FreeBSD+4.11-stable>`__               |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-06:26.gtar <http://security.FreeBSD.org/advisories/FreeBSD-SA-06:26.gtar.asc>`__           | 6 December 2006     | `gtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gtar&sektion=1&manpath=FreeBSD+4.11-stable>`__ name mangling symlink vulnerability               |
+------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Late-Breaking News
--------------------

No news.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
http://snapshots.jp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 4-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
