==========================
FreeBSD 6.3-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 6.3-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 The
FreeBSD Documentation Project

| $FreeBSD: stable/6/release/doc/en\_US.ISO8859-1/errata/article.sgml
  181797 2008-08-17 13:01:37Z bmah $

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

    This document lists errata items for FreeBSD 6.3-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 6.3-RELEASE will be maintained
    until the release of FreeBSD 6.4-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
6.3-RELEASE. Before installing this version, it is important to consult
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
http://security.FreeBSD.org/ or ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Late-Breaking News and Corrections
------------------------------------

[20080204] The ISO images of FreeBSD 6.3-RELEASE are sized for 700MB
CD-ROM media (ISO images of all prior versions assumed 650MB media).
This fact should have been mentioned in the release notes.

[20080204] Contrary to the release notes, ipfwpcap(8) is *not* a feature
included in FreeBSD 6.3-RELEASE. It was merged to the 6-STABLE codeline
after the release branch was created. This utility will be included in
subsequent snapshots of 6-STABLE and in 6.4-RELEASE.

[20080229] The release notes gave an incorrect version number for KDE.
The correct version number is 3.5.8.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Security Advisories
---------------------

The following security advisories pertain to FreeBSD 6.3-RELEASE. For
more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                       | Date               | Topic                                                                                                                                        |
+================================================================================================+====================+==============================================================================================================================================+
| `SA-08:03.sendfile <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:03.sendfile.asc>`__   | 14 February 2008   | `sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+6.3-stable>`__ write-only file permission bypass   |
+------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:05.openssh <http://security.freebsd.org/advisories/FreeBSD-SA-08:05.openssh.asc>`__     | 17 April 2008      | OpenSSH X11-forwarding privilege escalation                                                                                                  |
+------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:06.bind <http://security.freebsd.org/advisories/FreeBSD-SA-08:06.bind.asc>`__           | 13 July 2008       | DNS cache poisoning                                                                                                                          |
+------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Known Problems and Solutions
------------------------------

[20080229] A bug in Linux emulation may cause segmentation faults for
some Linux programs using
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+6.3-stable>`__.
This issue has been fixed on the HEAD and RELENG\_6 branches.

[20080229, updated 20080420] Multithreaded programs that perform a
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2&manpath=FreeBSD+6.3-stable>`__
operation may crash due to a race condition in the threading library.
This problem has been fixed on the HEAD, RELENG\_6, and RELENG\_6\_3
branches, and is addressed by errata notice
`FreeBSD-EN-08:01.libpthread <http://security.FreeBSD.org/advisories/FreeBSD-EN-08:01.libpthread.asc>`__.

[20080307] When using
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+6.3-stable>`__
to install the X.org packages, selecting only specific components to be
installed may result in the
```x11/xorg-drivers`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/xorg-drivers/pkg-descr>`__
package not being installed, and a corresponding failure of X.org server
to configure itself correctly. The recommended way to a functioning
X.org installation is simply to select All from the Distributions menu.

[20080420] A reference counting bug in the IP multicast code could cause
kernel panics under some circumstances. It has been fixed on the
RELENG\_6 branch by revision ``1.85.2.10`` of ``sys/netinet/in.c``.

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
