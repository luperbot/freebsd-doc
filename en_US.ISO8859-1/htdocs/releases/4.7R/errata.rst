==========================
FreeBSD 4.7-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.7-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.97 2003/03/20 20:03:52 bmah Exp $

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 4.7-RELEASE, containing
    significant information discovered after the release. This
    information includes security advisories, as well as news relating
    to the software or documentation that could affect its operation or
    usability. An up-to-date version of this document should always be
    consulted before installing this version of FreeBSD.

    This errata document for FreeBSD 4.7-RELEASE will be maintained
    until the release of FreeBSD 4.8-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This errata document contains \`\`late-breaking news'' about FreeBSD
4.7-RELEASE. Before installing this version, it is important to consult
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
=====================

Buffer overflows in kadmind(8) and k5admin could potentially cause the
administrative server to execute arbitrary code. Bugfix and workaround
information can be found in security advisory
`FreeBSD-SA-02:40 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:40.kadmind.asc>`__.

Errors in
`smrsh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=smrsh&sektion=8&manpath=FreeBSD+4.7-stable>`__,
which could allow users to circumvent restrictions on what programs can
be executed, were fixed in FreeBSD 4.7-RELEASE. Because the applicable
security advisory
(`FreeBSD-SA-02:41 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:41.smrsh.asc>`__)
was not issued after the release, this fact was not included in the
release notes.

Buffer overflows in the DNS
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+4.7-stable>`__,
which could cause some applications to fail, have been corrected. This
change was not mentioned in the release notes, as the applicable
security advisory
(`FreeBSD-SA-02:42 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:42.resolv.asc>`__)
was not issued until after the release.

Several vulnerabilities exist in the version of **BIND** included with
FreeBSD 4.7-RELEASE. More information, including bugfixes and workaround
suggestions, can be found in security advisory
`FreeBSD-SA-02:43 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:43.bind.asc>`__.

A file descriptor leak in the
`fpathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fpathconf&sektion=2&manpath=FreeBSD+4.7-stable>`__
system call, can allow a local user to crash the system or cause a
privilege escalation. Bugfix information can be found in security
advisory
`FreeBSD-SA-02:44 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:44.filedesc.asc>`__.

Remotely exploitable vulnerabilities in **CVS** could allow an attacker
to execute arbitrary comands on a CVS server. More details can be found
in security advisory
`FreeBSD-SA-03:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:01.cvs.asc>`__.

A timing-based attack on **OpenSSL**, could allow a very powerful
attacker access to plaintext under certain circumstances. This problem
has been corrected in FreeBSD 4.8-RC with an upgrade to **OpenSSL**
0.9.7. On supported security fix branches, this problem has been
corrected with the import of **OpenSSL** 0.9.6i. See security advisory
`FreeBSD-SA-03:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:02.openssl.asc>`__
for more details.

It may be possible to recover the shared secret key used by the
implementation of the \`\`syncookies'' feature. This reduces its
effectiveness in dealing with TCP SYN flood denial-of-service attacks.
Workaround information and fixes are given in security advisory
`FreeBSD-SA-03:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:03.syncookies.asc>`__.

Due to a buffer overflow in header parsing in **sendmail**, a remote
attacker can create a specially-crafted message that may cause
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.7-stable>`__
to execute arbitrary code with the privileges of the user running it,
typically ``root``. More information, including pointers to patches, can
be found in security advisory
`FreeBSD-SA-03:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:04.sendmail.asc>`__.

The XDR encoder/decoder does incorrect bounds-checking, which could
allow a remote attacker to cause a denial-of-service. For bugfix
information, see security advisory
`FreeBSD-SA-03:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:05.xdr.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Late-Breaking News
====================

Due to concerns over the licensing terms for the
`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+4.7-stable>`__
driver uncovered late in FreeBSD 4.7-RELEASE's release cycle, the
`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+4.7-stable>`__
driver was removed. These issues are being addressed and this driver may
reappear in a future release of FreeBSD.

The ``srelease`` distribution contains object files for
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-stable>`__
in the ``release/sysinstall`` directory. These files were generated
during the release building process but, for some reason, were not
removed from the distribution files. They are harmless.

The
```databases/rdfdb`` <http://www.FreeBSD.org/cgi/url.cgi?ports/databases/rdfdb/pkg-descr>`__
and
```mail/ssmtp`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
packages included in the 4.7-RELEASE package set cannot be installed
correctly. A workaround is to build and install these programs using the
Ports Collection.

The
```net/gnomeicu`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnomeicu/pkg-descr>`__
package included in the 4.7-RELEASE package set may not run correctly,
due to a missing dependency on the
```net/gnet`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnet/pkg-descr>`__
package. To work around this problem, install
```net/gnet`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnet/pkg-descr>`__
either from a package or the Ports Collection, preferably before
installing
```net/gnomeicu`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnomeicu/pkg-descr>`__.

The release notes for FreeBSD 4.7-RELEASE incorrectly stated that the
``-J`` option to
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.7-stable>`__
is deprecated. In fact, there are no plans to remove this option.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.7-stable>`__
has a bug in its virtual hosting function triggered if ``/etc/ftphosts``
defines a virtual host whose IP address can resolve back to a hostname.
In that case the daemon will be exiting on ``SIGSEGV`` (signal 11) if
started from
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.7-stable>`__,
or may malfunction unpredictably if running stand-alone. This bug has
been fixed in FreeBSD 4.8-RC.

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
