==========================
FreeBSD 7.2-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.2-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2008, 2009 The FreeBSD Documentation Project

| $FreeBSD: stable/7/release/doc/en\_US.ISO8859-1/errata/article.sgml
  193687 2009-06-08 05:11:35Z hrs $

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

    This document lists errata items for FreeBSD 7.2-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 7.2-RELEASE will be maintained
    until the release of FreeBSD 7.3-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
7.2-RELEASE. Before installing this version, it is important to consult
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

No advisories.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

[20090501] Some machines do not recognize the i386 disc1 as bootable and
fall through to booting off the next boot device. All affected machines
did see the other discs as bootable. As a workaround, you can boot using
the bootonly or livefs CDROM and then swap in disc1 once
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+7.2-stable>`__
starts.

[20090504] A lock handling error has been found in interaction between
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+7.2-stable>`__
implementation and threading library. When a multi-threaded process
calls the
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2&manpath=FreeBSD+7.2-stable>`__
system call in a thread and the
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+7.2-stable>`__
function in another thread, it can cause a deadlock in the child
process. An Errata Notice to fix this problem is planned after the
release.

[20090505] A bug was found in the
`bce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bce&sektion=4&manpath=FreeBSD+7.2-stable>`__
driver. This prevents it from working with the
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4&manpath=FreeBSD+7.2-stable>`__
driver in the LACP (IEEE 802.3ad Link Aggregation Control Protocol)
mode. An Errata Notice to fix this problem is planned after the release.

[20090507] A bug was found in the
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.2-stable>`__
driver. This would cause poor TCP performance when TSO is enabled, and
the receiver has a smaller MSS than the interface MTU setting. To
workaround this issue, one can disable TSO by using
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+7.2-stable>`__
``-tso`` parameter (per interface basis) or setting ``net.inet.tcp.tso``
to ``0`` (globally on the system). An Errata Notice to fix this problem
is planned after the release.

[20090608] An issue was found in the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+7.2-stable>`__
driver that it can cause a system panic upon reboot with heavy network
traffic. A fix has been committed to RELENG\_7 (r192127).

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News and Corrections
------------------------------------

[20090504] A patch to solve the locking issue in the
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+7.2-stable>`__
implementation and threading library has been committed to the
``RELENG_7`` branch for public testing.

[20090507] A patch to solve the bug in the
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+7.2-stable>`__
driver that caused poor TCP performance has been committed to the
``RELENG_7`` branch for public testing.

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
