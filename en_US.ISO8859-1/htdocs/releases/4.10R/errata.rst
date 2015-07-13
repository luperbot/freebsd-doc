===========================
FreeBSD 4.10-RELEASE Errata
===========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.10-RELEASE Errata
===========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.123.2.2 2004/05/25 15:47:50 bmah Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of Wind River Systems, Inc. This is
expected to change soon.

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

    This document lists errata items for FreeBSD 4.10-RELEASE,
    containing significant information discovered after the release or
    too late in the release cycle to be otherwise included in the
    release documentation. This information includes security
    advisories, as well as news relating to the software or
    documentation that could affect its operation or usability. An
    up-to-date version of this document should always be consulted
    before installing this version of FreeBSD.

    This errata document for FreeBSD 4.10-RELEASE will be maintained
    until the release of FreeBSD 4.11-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains \`\`late-breaking news'' about FreeBSD
4.10-RELEASE. Before installing this version, it is important to consult
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
http://www.FreeBSD.org/security/ or
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Security Advisories
---------------------

No active security advisories.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Late-Breaking News
--------------------

(20 May 2004) A security problem was discovered in **CVS** but the
release notes did not state that since it was very late in the release
cycle. FreeBSD 4.10-RELEASE includes a fix for it and is not vulnerable.
For the details, see the security advisory
`FreeBSD-SA-04:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:10.cvs.asc>`__.

(23 May 2004) As a side effect of closing a security problem related to
`msync(2) <http://www.FreeBSD.org/cgi/man.cgi?query=msync&sektion=2&manpath=FreeBSD+4.10-RELEASE>`__,
the MS\_INVALIDATE flag no longer guarantees that all pages in the range
are invalidated. This can cause problems when pages are backed by a
remote file (e.g. via NFS) where other machines can write to the
permanent storage since the local pages not being invalidated might then
contain stale data. The security problem being addressed is a strictly
local exploit, and only allows a local user to block the writing of data
to a file under certain circumstances. Users who require the old
semantics of MS\_INVALIDATE and are not concerned with the security
issue being fixed can set the vm.old\_msync sysctl to 1 which will
revert to the old (insecure) behavior.

(25 May 2004) The
`twe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twe&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver was recently updated by the vendor. Problems have been reported
in rare circumstances under conditions that are hard to reproduce. Work
is ongoing to isolate these problems and determine their source.

(27 May 2004) The
`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver for Broadcom BCM4401 based Fast Ethernet adapters has been added
but the release notes did not mention that.

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

|
