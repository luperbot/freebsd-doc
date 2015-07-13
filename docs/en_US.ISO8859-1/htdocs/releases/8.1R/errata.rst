==========================
FreeBSD 8.1-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 8.1-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2010 The FreeBSD Documentation Project

| $FreeBSD: stable/8/release/doc/en\_US.ISO8859-1/errata/article.sgml
  210450 2010-07-24 18:05:10Z hrs $

.. raw:: html

   <div class="LEGALNOTICE">

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
or the “®” symbol.

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 8.1-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 8.1-RELEASE will be maintained
    until the release of FreeBSD 8.2-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
8.1-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 8-STABLE also contain up-to-date
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

No advisory.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

No open issues.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News and Corrections
------------------------------------

A deadlock can occur in UFS with the QUOTA enabled due to a lock order
reversal. This problem has been fixed in `r209367
(HEAD) <http://svn.freebsd.org/changeset/base/209367>`__. An Errata
Notice for 8.1-RELEASE is planned.

A legacy device detection in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+8.1-RELEASE>`__
can fail in some cases. Specifically, Marvell 88SX6141 controllers can
cause attach failure or panic. This problem has been fixed in `r210168
(HEAD) <http://svn.freebsd.org/changeset/base/210168>`__. An Errata
Notice for 8.1-RELEASE is planned.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
ftp://ftp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
