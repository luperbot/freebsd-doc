==========================
FreeBSD 4.9-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.9-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.122 2004/03/30 18:18:34 kensmith Exp $

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

    This document lists errata items for FreeBSD 4.9-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 4.9-RELEASE will be maintained
    until the release of FreeBSD 4.10-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains \`\`late-breaking news'' about FreeBSD
4.9-RELEASE. Before installing this version, it is important to consult
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

(5 Dec 2003) **BIND** contains the potential for a denial-of-service
attack. This vulnerability has been addressed by a vendor patch on the
4.9-RELEASE security fix branch and by the import of a new version to
the 4-STABLE development branch. For more information, see
`FreeBSD-SA-03:19 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:19.bind.asc>`__.

(8 Feb 2004) A bug with the System V Shared Memory interface
(specifically the
`shmat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmat&sektion=2&manpath=FreeBSD+4.8-stable>`__
system call) can cause a shared memory segment to reference unallocated
kernel memory. In turn, this can permit a local attacker to gain
unauthorized access to parts of kernel memory, possibly resulting in
disclosure of sensitive information, bypass of access control
mechanisms, or privilege escalation. More details, including bugfix and
workaround information, can be found in security advisory
`FreeBSD-SA-04:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:02.shmat.asc>`__.

(4 Mar 2004) It is possible for a remote attacker to conduct a
low-bandwidth denial-of-service attack against a machine providing
TCP-based services, filling up the target's memory buffers and
potentially leading to a system crash. This vulnerability has been
addressed on the FreeBSD 4.9-RELEASE security fix branch. Security
advisory
`FreeBSD-SA-04:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:04.tcp.asc>`__
contains more details, as well as information on patching existing
systems.

(17 Mar 2004) By performing a specially crafted SSL/TLS handshake with
an application that uses OpenSSL a null pointer may be dereferenced.
This may in turn cause the application to crash, resulting in a denial
of service attack. For more information see the Security Advisory
`FreeBSD-SA-04:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:05.openssl.asc>`__
which contains more details and instructions on how to patch existing
systems.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Late-Breaking News
--------------------

(28 Oct 2003) Very late in the release cycle, a change was made to the
HyperThreading (HTT) support on Intel® processors. HTT support is now
enabled by default on SMP-capable kernels; as a result, the HTT kernel
option is unnecessary and has been removed. The extra logical CPUs are
always started so that they can handle interrupts, but are prevented
from executing user processes by default. To enable the logical CPUs,
change the value of the machdep.hlt\_logical\_cpus
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+4.8-stable>`__
variable from 1 to 0. This value can also be set from the loader as a
tunable of the same name. This behavior is now identical to FreeBSD 5.X.

(29 Oct 2003) Some of the packages contained in the first CD-ROM depend
on different versions of the **OpenLDAP** packages, which cannot
co-exist on the same host. One manifestation of this problem is that it
is not possible to install both the
```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__
and
```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__
packages.

(30 Oct 2003) It appears that the ``crypto`` distribution is required
for correct functioning of the FreeBSD base system. At the very least,
the libraries contained in the ``crypto`` distribution are required for
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.8-stable>`__.

(30 Oct 2003) There are known cases of fairly-recent i386 machines with
BIOSes that do not support booting from emulation mode El Torito CDROMs.
This prevents booting from the FreeBSD 4.9-STABLE CDROMs. As a
workaround, download the floppy disk images, use them to boot the
machine into
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.8-stable>`__,
and then do a CDROM install. This problem does not seem to be
wide-spread as of this writing.

.. raw:: html

   <div class="NOTE">

    **Note:** FreeBSD 5.X uses non-emulation El Torito booting on its
    CDROM releases by default. These, of course, cannot be booted on
    very old i386 machines that only support emulation mode.

.. raw:: html

   </div>

(10 Nov 2003) An update was made to the xterm entry in the
`termcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=termcap&sektion=5&manpath=FreeBSD+4.8-stable>`__
database which, among other things, removed the (already deprecated) bs
backspacing capability. The
`hack(6) <http://www.FreeBSD.org/cgi/man.cgi?query=hack&sektion=6&manpath=FreeBSD+4.8-stable>`__
game appears to depend on this capability and hence fails when run from
inside a window with a terminal type of xterm.

(10 Nov 2003) Tagged queueing in the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.8-stable>`__
driver is broken and appears to cause kernel panics.

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
