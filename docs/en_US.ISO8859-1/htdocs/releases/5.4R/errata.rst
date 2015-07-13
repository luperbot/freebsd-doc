==========================
FreeBSD 5.4-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.4-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.69.2.32 2006/02/05 20:45:04 bmah Exp $

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
of the trademark claim, the designations have been followed by the
\`\`™'' or the \`\`®'' symbol.

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 5.4-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 5.4-RELEASE will be maintained
    until the release of FreeBSD 5.5-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains \`\`late-breaking news'' about FreeBSD
5.4-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the \`\`current errata'' for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 5-STABLE also contain up-to-date
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

The following security advisories pertain to FreeBSD 5.4-RELEASE. For
more information, consult the individual advisories available from
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/.

.. raw:: html

   <div class="INFORMALTABLE">

+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                                | Date              | Topic                                                                                                                              |
+=========================================================================================================+===================+====================================================================================================================================+
| `06:07.pf <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:07.pf.asc>`__                | 25 January 2006   | IP fragment handling panic in `pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-stable>`__         |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:03.cpio <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:03.cpio.asc>`__            | 11 January 2006   | Multiple vulnerabilities in `cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+5.3-stable>`__       |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:02.eex <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:02.ee.asc>`__               | 11 January 2006   | `ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+5.3-stable>`__ temporary file privilege escalation   |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `06:01.texindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:01.texindex.asc>`__    | 11 January 2006   | Texindex temporary file privilege escalation                                                                                       |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:09.htt <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:09.htt.asc>`__           | 22 May 2005       | information disclosure when using HTT                                                                                              |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:10.tcpdump <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:10.tcpdump.asc>`__   | 9 Jun 2005        | Infinite loops in tcpdump protocol decoding                                                                                        |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:11.gzip <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:11.gzip.asc>`__         | 9 Jun 2005        | gzip directory traversal and permission race vulnerabilities                                                                       |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:13.ipfw <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:13.ipfw.asc>`__         | 29 Jun 2005       | ipfw packet matching errors with address tables                                                                                    |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:14.bzip2 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:14.bzip2.asc>`__       | 29 Jun 2005       | bzip2 denial of service and permission race vulnerabilities                                                                        |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:15.tcp <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:15.tcp.asc>`__           | 29 Jun 2005       | TCP connection stall denial of service                                                                                             |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:16.zlib <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:16.zlib.asc>`__         | 6 Jul 2005        | Buffer overflow in zlib                                                                                                            |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:17.devfs <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:17.devfs.asc>`__       | 20 Jul 2005       | devfs ruleset bypass                                                                                                               |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:18.zlib <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:18.zlib.asc>`__         | 27 Jul 2005       | Buffer overflow in zlib                                                                                                            |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+
| `SA-05:19.ipsec <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:19.ipsec.asc>`__       | 27 Jul 2005       | IPsec incorrect key usage in AES-XCBC-MAC                                                                                          |
+---------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

No issues.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News
--------------------

(6 May 2005) An error in the default permissions on the ``/dev/iir``
device node, which allowed unprivileged local users to send commands to
the hardware supported by the
`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.3-stable>`__
driver. Although the error was fixed prior to 5.4-RELEASE, it was
applied too late in the release cycle to be mentioned in the release
notes. For more information, see security advisory
`FreeBSD-SA-05:06.iir <ftp://ftp.freebsd.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:06.iir.asc>`__.

(6 May 2005) A bug in the validation of
`i386\_get\_ldt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=i386_get_ldt&sektion=2&manpath=FreeBSD+5.3-stable>`__
system call input arguments, which may allow kernel memory may be
disclosed to the user process, has been fixed. This bug was fixed prior
to 5.4-RELEASE, although not in time to be mentioned in the release
notes. For more information, see security advisory
`FreeBSD-SA-05:07.ldt <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:07.ldt.asc>`__.

(6 May 2005) Several information disclosure vulnerabilities in various
parts of the kernel have been fixed in 5.4-RELEASE, although too late to
be mentioned in the release notes. For more information, see security
advisory
`FreeBSD-SA-05:08.kmem <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:08.kmem.asc>`__.

(24 Jun 2005) The FreeBSD/sparc64 5.4-RELEASE should have stated that
the FreeBSD/sparc64 GENERIC kernel prior to the upcoming 6.0-RELEASE
officially only supports serial consoles. This is especially true for
the FreeBSD/sparc64 5.4-RELEASE GENERIC kernel because the
ofw\_console(4) driver which also provides limited indirect support for
graphical consoles has been replaced with the
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+5.3-stable>`__
driver in favor better serial support.

Due to this limitation to serial consoles the screen will stop working
after the message \`\`jumping to kernel entry at...'' is displayed when
trying to use the FreeBSD/sparc64 5.4-RELEASE GENERIC kernel with a
graphical console, while FreeBSD itself continues working actually.

If you want to use FreeBSD/sparc64 with a graphical console anyway you
can do one of the following:

-  In case your machine is equipped with a Sun Creator, Sun Creator3D,
   or Sun Elite3D frame buffer card and a Sun RS232 keyboard you can
   install FreeBSD/sparc64 5.4-RELEASE with a serial console and
   afterwards compile a custom kernel with the following additional
   options:

   .. code:: PROGRAMLISTING

       device          sc
       device          creator
       options         KBD_INSTALL_CDEV

   Additionally you have to enable the ``tty[1-7]`` entries in
   ``/etc/ttys`` like so:

   .. code:: PROGRAMLISTING

       ttyv0   "/usr/libexec/getty Pc"         cons25  on  secure
       # Virtual terminals
       ttyv1   "/usr/libexec/getty Pc"         cons25  on  secure
       ttyv2   "/usr/libexec/getty Pc"         cons25  on  secure
       ttyv3   "/usr/libexec/getty Pc"         cons25  on  secure
       ttyv4   "/usr/libexec/getty Pc"         cons25  on  secure
       ttyv5   "/usr/libexec/getty Pc"         cons25  on  secure
       ttyv6   "/usr/libexec/getty Pc"         cons25  on  secure
       ttyv7   "/usr/libexec/getty Pc"         cons25  on  secure

   This will yield native support for these keyboards and frame buffers
   including VTY switching and X Window System. Note that this really
   requires at least FreeBSD/sparc64 5.4-RELEASE otherwise it will not
   work on most of the UltraSPARC models.

-  In case your machine is equipped with a ATI Mach64 frame buffer
   (found on-board in e.g. Sun Blade 100/150 and Sun Ultra 5/10 as well
   as on Sun PGX8 and Sun PGX64 add-on cards) or a PS/2 or a USB
   keyboard update to a FreeBSD/sparc64 6.0 from June 10 2005 or later.
   If you use the stock GENERIC kernel and ``/etc/ttys`` from there no
   further action is required.

   This will yield native support for these keyboards and frame buffers
   including VTY switching and X Window System.

-  In case your machine is equipped with hardware other than those
   mentioned above or you refuse to update to FreeBSD/sparc64 6.0 you
   can re-enable the ofw\_console(4) driver as a last resort. To do so
   build a custom kernel with the following additional options:

   .. code:: PROGRAMLISTING

       device          ofw_console
       device          sab
       device          zs

   and make sure to comment out the following kernel option:

   .. code:: PROGRAMLISTING

       device          uart

   This will yield limited indirect support for any graphical console
   hardware, however with poor performance, and VTY switching as well as
   X Window System do not work with this. Note that ofw\_console(4) is
   not really MPSAFE and therefore can result in panics under certain
   conditions.

For more details of how to recompile your kernel or update to FreeBSD
6.0, see `Configuring the FreeBSD
Kernel <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/kernelconfig.html>`__
and `The Cutting
Edge <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/cutting-edge.html>`__
sections in the FreeBSD Handbook, respectively.

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

All users of FreeBSD 5-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
