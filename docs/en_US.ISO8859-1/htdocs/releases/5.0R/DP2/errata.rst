======================
FreeBSD 5.0-DP2 Errata
======================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.0-DP2 Errata
======================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v 1.9
  2002/03/14 21:52:01 bmah Exp $

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists known issues for FreeBSD 5.0-DP2. This
    information includes information relating to the software or
    documentation that could affect its operation or usability. Also
    included is a list of areas of the base system that could benefit
    from some extra testing.

    Please note that FreeBSD 5.0-DP2 is not an officially supported
    release of FreeBSD. Unlike supported releases, this errata file will
    not be updated. Testers of FreeBSD 5.0-DP2 should subscribe to the
    FreeBSD-CURRENT mailing list ``<freebsd-current@FreeBSD.org>`` to
    stay informed about late-breaking issues and developments.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This errata document lists known problems relating to FreeBSD 5.0-DP2.
Before installing this version, it is important to consult this document
to learn about any post-release discoveries or problems that may already
have been found and fixed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Known Problems
================

This section describes some known issues and problems with FreeBSD
5.0-DP2. The Release Engineering Team ``<re@FreeBSD.org>`` intends to
address these problems in some manner before FreeBSD 5.0-RELEASE. All
users of FreeBSD 5.0-DP2 should be subscribed to the FreeBSD-CURRENT
mailing list ``<freebsd-current@FreeBSD.org>`` to remain informed about
developments regarding these and other issues.

Packages in FreeBSD 5.0-RELEASE will be compressed using
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.0-current>`__.
In some cases,
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.0-current>`__
has some difficulties working with packages compressed using
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.0-current>`__
(typical cases are from within
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__,
and when using the ``-r`` flag). This does not affect the default
package sets provided with snapshots.

The ``NWFS`` feature is broken.

Various documents may not reflect differences between the line of
FreeBSD 4-STABLE releases and FreeBSD 5.0-DP2. In addition, the
architecture-specific files in the release documentation are likely
incomplete for new architectures (sparc64 and ia64).

Installations from boot floppies are no longer supported on the alpha
platform. The combination of the boot loader and a (highly
stripped-down) kernel is too large to fit on a 1.44 MB floppy disk. Some
work in this area is ongoing; this feature *may* return before FreeBSD
5.0-RELEASE.

The ``__sF`` symbol in ``libc`` has been made static, as part of work to
make ``FILE`` expandable. Applications built on FreeBSD 4-STABLE-based
systems on on FreeBSD -CURRENT systems before 13 August 2001 may need to
be recompiled. Due to previously unforseen compatability problems, this
change *may* be reverted prior to 5.0-RELEASE and postponed for another
release or two.

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

All users of FreeBSD 5-CURRENT should subscribe to the
<current@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
