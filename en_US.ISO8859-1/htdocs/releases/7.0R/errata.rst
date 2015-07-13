==========================
FreeBSD 7.0-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.0-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2008 The FreeBSD Documentation Project

| $FreeBSD: stable/7/release/doc/en\_US.ISO8859-1/errata/article.sgml
  186442 2008-12-23 17:55:07Z hrs $

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

    This document lists errata items for FreeBSD 7.0-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 7.0-RELEASE will be maintained
    until the release of FreeBSD 7.1-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
7.0-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 7-STABLE also contain up-to-date
copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
http://www.FreeBSD.org/security/ or
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Security Advisories
---------------------

The following security advisories pertain to FreeBSD 7.0-RELEASE. For
more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                           | Date               | Topic                                                                                                                                             |
+====================================================================================================+====================+===================================================================================================================================================+
| `SA-08:05.openssh <http://security.freebsd.org/advisories/FreeBSD-SA-08:05.openssh.asc>`__         | 17 April 2008      | OpenSSH X11-forwarding privilege escalation                                                                                                       |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:06.bind <http://security.freebsd.org/advisories/FreeBSD-SA-08:06.bind.asc>`__               | 13 July 2008       | DNS cache poisoning                                                                                                                               |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:07.amd64 <http://security.freebsd.org/advisories/FreeBSD-SA-08:07.amd64.asc>`__             | 3 September 2008   | amd64 swapgs local privilege escalation                                                                                                           |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:08.nmount <http://security.freebsd.org/advisories/FreeBSD-SA-08:08.nmount.asc>`__           | 3 September 2008   | `nmount(2) <http://www.FreeBSD.org/cgi/man.cgi?query=nmount&sektion=2&manpath=FreeBSD+7.0-stable>`__ local arbitrary code execution               |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:09.icmp6 <http://security.freebsd.org/advisories/FreeBSD-SA-08:09.icmp6.asc>`__             | 3 September 2008   | Remote kernel panics on IPv6 connections                                                                                                          |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:10.nd6 <http://security.freebsd.org/advisories/FreeBSD-SA-08:10.nd6.asc>`__                 | 1 October 2008     | IPv6 Neighbor Discovery Protocol routing vulnerability                                                                                            |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:11.arc4random <http://security.freebsd.org/advisories/FreeBSD-SA-08:11.arc4random.asc>`__   | 24 November 2008   | `arc4random(9) <http://www.FreeBSD.org/cgi/man.cgi?query=arc4random&sektion=9&manpath=FreeBSD+7.0-stable>`__ predictable sequence vulnerability   |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:12.ftpd <http://security.freebsd.org/advisories/FreeBSD-SA-08:12.ftpd.asc>`__               | 23 December 2008   | Cross-site request forgery in `ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+7.0-stable>`__                    |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:13.protosw <http://security.freebsd.org/advisories/FreeBSD-SA-08:13.protosw.asc>`__         | 23 December 2008   | netgraph / bluetooth privilege escalation                                                                                                         |
+----------------------------------------------------------------------------------------------------+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

[20080229]
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+7.0-stable>`__
does not correctly print the TX/RX rates for 802.11 frames. This issue
has been fixed on the HEAD and RELENG\_7 branches.

[20080229] A bug in Linux emulation may cause segmentation faults for
some Linux programs using
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+7.0-stable>`__.
This issue has been fixed on the HEAD and RELENG\_7 branches.

[20080229] Instances of packet corruption and instability have been
observed with the
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+7.0-stable>`__
network driver. Some users have reported that using a newer version of
this driver (on HEAD) has solved their problems, or at least mitigated
them.

[20080229, updated 20080817] A change in the way that FreeBSD sends TCP
options has been reported to cause connectivity issues. This problem has
been corrected on HEAD and the RELENG\_7 and RELENG\_7\_0 branches..
Further details are contained in errta notice
`FreeBSD-EN-08:02.tcp <http://security.FreeBSD.org/advisories/FreeBSD-EN-08:02.tcp.asc>`__.

[20080307] The FreeBSD implementation of SCTP currently depends on
having ``INET6`` support compiled into the kernel. This requirement is
planned to be removed in future releases.

[20080307] Source upgrades from FreeBSD 6.\ ``X`` to FreeBSD 7.0-RELEASE
will generate warnings from
`kldxref(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldxref&sektion=8&manpath=FreeBSD+7.0-stable>`__
during the ``installkernel`` step. These warnings are harmless and can
be ignored.

[20080307] The
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+7.0-stable>`__
driver, which is required for IPsec functionality, has severe problems
on FreeBSD/powerpc (a kernel with ``device crypto`` included in its
configuration will be non-functional).

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News and Corrections
------------------------------------

[20080229] The FreeBSD 7.0-RELEASE release documentation (release notes,
hardware notes, and so forth) all contained a note that users of FreeBSD
7-STABLE should be subscribed to the ``freebsd-current`` mailing list.
This note should not have appeared.

[20080229] The release notes gave an incorrect version number for KDE.
The correct version number is 3.5.8.

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

All users of FreeBSD 7-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
