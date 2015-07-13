==========================
FreeBSD 7.3-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.3-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2010 The FreeBSD Documentation Project

| $FreeBSD: stable/7/release/doc/en\_US.ISO8859-1/errata/article.sgml
  206131 2010-04-03 10:07:10Z hrs $

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

    This document lists errata items for FreeBSD 7.3-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 7.3-RELEASE will be maintained
    until the release of FreeBSD 7.4-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
7.3-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 7.3-STABLE also contain
up-to-date copies of this document (as of the time of the snapshot).

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

No issue.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News and Corrections
------------------------------------

[20100402] The FreeBSD 7.3-RELEASE Release Notes incorrectly mentioned
that a ``-p`` flag has been added to the
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+7.3-stable>`__
utility. It should have been a ``-d`` flag. The correct entry is:

    The
    `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+7.3-stable>`__
    command now supports a new flag ``-d``. This displays descendant
    info with the output similar to Linux's ``-H`` (or ``-f``).

[20100330] The ``libc`` of FreeBSD 7.3-RELEASE has the
`fdopendir(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fdopendir&sektion=3&manpath=FreeBSD+7.3-stable>`__
function but ``<dirent.h>`` header file does not contain the function
prototype. This could cause programs compiled on the system to crash on
platforms such as FreeBSD/amd64, where ``sizeof(void *)`` is greater
than ``sizeof(int)``. This problem has been fixed in `r205265
(RELENG\_7) <http://svn.freebsd.org/changeset/base/205265>`__. An Errata
Notice for 7.3-RELEASE is planned.

[20100330] It turns out that the ``zfsloader`` in 7.3-RELEASE, a new
boot loader similar to
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+7.3-stable>`__
but it supports ZFS, does not work properly. This problem has been fixed
in `r205539
(RELENG\_7) <http://svn.freebsd.org/changeset/base/205539>`__. An Errata
Notice for 7.3-RELEASE is planned.

[20100323] The FreeBSD 7.3-RELEASE Release Notes incorrectly mentioned
that the
`hwpmc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hwpmc&sektion=4&manpath=FreeBSD+7.3-stable>`__
driver has been added though this driver has already been added in
7.0-RELEASE. The changes in 7.3-RELEASE are that
`pmcannotate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pmcannotate&sektion=8&manpath=FreeBSD+7.3-stable>`__
utility and support for Intel Core 2 and Core i7 have been added.

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

All users of FreeBSD 7.3-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
