==========================
FreeBSD 6.2-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 6.2-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.73.2.51 2007/11/30 05:55:05 bmah Exp $

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

    This document lists errata items for FreeBSD 6.2-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 6.2-RELEASE will be maintained
    until the release of FreeBSD 6.3-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
6.2-RELEASE. Before installing this version, it is important to consult
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

[20070116] The release notes should have mentioned that a separate ISO
image has been created with readable documentation files. It contains
renderings of the documention for all supported languages; the last
several FreeBSD releases only contained English documents due to space
limitations.

[20070116] Some versions of the release announcement contained an
incorrect manual page reference for the GELI disk encryption subsystem.
The correct manual page is
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8&manpath=FreeBSD+6.3-stable>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Security Advisories
---------------------

The following security advisories pertain to FreeBSD 6.2-RELEASE. For
more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+----------------------------------------------------------------------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                           | Date               | Topic                                                                                                                                               |
+====================================================================================================+====================+=====================================================================================================================================================+
| `SA-07:02.bind <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:02.bind.asc>`__               | 9 February 2007    | Multiple Denial of Service vulnerabilities in `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+6.3-stable>`__    |
+----------------------------------------------------------------------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:03.ipv6 <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:03.ipv6.asc>`__               | 26 April 2007      | IPv6 Routing Header 0 is dangerous                                                                                                                  |
+----------------------------------------------------------------------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:05.libarchive <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:05.libarchive.asc>`__   | 12 July 2007       | Errors handling corrupt tar files in `libarchive(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libarchive&sektion=3&manpath=FreeBSD+6.3-stable>`__   |
+----------------------------------------------------------------------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-07:09.random <http://security.FreeBSD.org/advisories/FreeBSD-SA-07:09.random.asc>`__           | 29 November 2007   | Random value disclosure                                                                                                                             |
+----------------------------------------------------------------------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Known Problems and Solutions
------------------------------

[20070116] As mentioned in the release notes, the
`arcmsr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=arcmsr&sektion=4&manpath=FreeBSD+6.3-stable>`__
driver was updated for FreeBSD 6.2-RELEASE. Some isolated crash problems
were noted after this update, although the driver in general tends to
work quite well for many testers, and it seems to be “better” in general
in terms of functionality and supported hardware. Users having problems
may wish to consider backing out the driver update or installing a
version of this driver `directly from
Areca <ftp://ftp.areca.com.tw/RaidCards/AP_Drivers/FreeBSD/DRIVER/SourceCode/>`__.
Further investigation is continuing into these issues.

[20070116] FreeBSD 6.2-RELEASE has been diagnosed with kernel bug
related to UNIX-domain sockets. A
`patch <http://people.FreeBSD.org/~jhb/patches/unp_gc.patch>`__ for this
problem has been committed to HEAD and RELENG\_6, and is a candidate for
an errata patch to RELENG\_6\_2 after further testing.

[20070116, update 20070212] Systems with very heavy network activity
have been observed to have some problems with the kernel memory
allocator. Symptoms are processes that get stuck in zonelimit state, or
system livelocks. One partial workaround for this problem is to add the
following line to ``/boot/loader.conf`` and reboot:

.. code:: SCREEN

    kern.ipc.nmbclusters="0"

Other workarounds have been discussed on the ``freebsd-current@`` and
``freebsd-stable@`` mailing lists.

A bugfix has been committed to HEAD and has been merged to RELENG\_6.

[20070123, updated 20070307 FreeBSD 6.2-RELEASE does not properly add a
host route to the destination of a
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+6.3-stable>`__
interface configured as an IPv6 point-to-point interface. This makes it
impossible to send traffic across the tunnel. A workaround is to add the
required route manually. If the
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+6.3-stable>`__
interface was configured as:

.. code:: SCREEN

    # ifconfig gif0 ADDRESS/128 DESTINATION

then the correct route can be added with this command:

.. code:: SCREEN

    # route add -host -inet6 DESTINATION -iface gif0 -llinfo -nostatic

A fix for this problem has been committed to HEAD, RELENG\_6, and
RELENG\_6\_2. Further details are given in FreeBSD Errata Notice
`EN-07:02.net <http://security.FreeBSD.org/advisories/FreeBSD-EN-07:02.net.asc>`__.

[20070307] Under certain circumstances, a failed
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+6.3-stable>`__
startup may cause some undesired changes to a host's network interface
configuration, due to a bug in the ``rc.d/jail`` startup script. This
problem has been corrected on HEAD, RELENG\_6, and RELENG\_6\_2, and is
documented in FreeBSD Errata Notice
`EN-07:03.rc.d\_jail <http://security.FreeBSD.org/advisories/FreeBSD-EN-07:03.rc.d_jail.asc>`__.

[20070318] The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+6.3-stable>`__
client included in FreeBSD 6.2-RELEASE does not properly update SMP
kernels. This bug has been fixed on HEAD, RELENG\_6, and RELENG\_6\_2,
as described in FreeBSD Errata Notice
`EN-07:05.freebsd-update <http://security.FreeBSD.org/advisories/FreeBSD-EN-07:05.freebsd-update.asc>`__.

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
