===========================
FreeBSD 10.0-RELEASE Errata
===========================

.. raw:: html

   <div class="article">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

SPARC, SPARC64, and UltraSPARC are trademarks of SPARC International,
Inc in the United States and other countries. SPARC International, Inc
owns all of the SPARC trademarks and under licensing agreements allows
the proper use of these trademarks by its members.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on 2014-09-16 by gjb.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

This document lists errata items for FreeBSD 10.0-RELEASE, containing
significant information discovered after the release or too late in the
release cycle to be otherwise included in the release documentation.
This information includes security advisories, as well as news relating
to the software or documentation that could affect its operation or
usability. An up-to-date version of this document should always be
consulted before installing this version of FreeBSD.

This errata document for FreeBSD 10.0-RELEASE will be maintained until
the release of FreeBSD 10.1-RELEASE.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <#intro>`__
`2. Security Advisories <#security>`__
`3. Open Issues <#open-issues>`__
`4. Late-Breaking News <#late-news>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This errata document contains “late-breaking news” about FreeBSD
10.0-RELEASE Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 10.0-STABLE also contain
up-to-date copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
http://www.FreeBSD.org/security/ or
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.?Security Advisories
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| Advisory                                                                                             | Date                | Topic                                                                 |
+======================================================================================================+=====================+=======================================================================+
| `SA-13:14.openssh <http://www.freebsd.org/security/advisories/FreeBSD-SA-13:14.openssh.asc>`__       | 19?November?2013    | OpenSSH AES-GCM memory corruption vulnerability                       |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:01.bsnmpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:01.bsnmpd.asc>`__         | 14?January?2014     | bsnmpd remote denial of service vulnerability                         |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:02.ntpd <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:02.ntpd.asc>`__             | 14?January?2014     | ntpd distributed reflection Denial of Service vulnerability           |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:03.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:03.openssl.asc>`__       | 14?January?2014     | OpenSSL multiple vulnerabilities                                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:04.bind <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:04.bind.asc>`__             | 14?January?2014     | BIND remote denial of service vulnerability                           |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:05.nfsserver <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:05.nfsserver.asc>`__   | 8?April?2014        | Deadlock in the NFS server                                            |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:06.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:06.openssl.asc>`__       | 8?April?2014        | OpenSSL multiple vulnerabilities                                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:07.devfs <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:07.devfs.asc>`__           | 30?April?2014       | Fix devfs rules not applied by default for jails                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:08.tcp <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:08.tcp.asc>`__               | 30?April?2014       | Fix TCP reassembly vulnerability                                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:09.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:09.openssl.asc>`__       | 30?April?2014       | Fix OpenSSL use-after-free vulnerability                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:10.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:10.openssl.asc>`__       | 15?May?2014         | Fix OpenSSL NULL pointer deference vulnerability                      |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:11.sendmail <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:11.sendmail.asc>`__     | 3?June?2014         | Fix sendmail improper close-on-exec flag handling                     |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:13.pam <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:13.pam.asc>`__               | 3?June?2014         | Fix incorrect error handling in PAM policy parser                     |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:14.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:14.openssl.asc>`__       | 5?June?2014         | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:15.iconv <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:15.iconv.asc>`__           | 24?June?2014        | NULL pointer dereference and out-of-bounds array access               |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:16.file <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:16.file.asc>`__             | 24?June?2014        | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:17.kmem <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:17.kmem.asc>`__             | 8?July?2014         | Kernel memory disclosure in control messages and SCTP notifications   |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:18.openssl <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:18.openssl.asc>`__       | 9?September?2014    | Multiple vulnerabilities                                              |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+
| `SA-14:19.tcp <http://www.freebsd.org/security/advisories/FreeBSD-SA-14:19.tcp.asc>`__               | 16?September?2014   | Denial of Service in TCP packet processing.                           |
+------------------------------------------------------------------------------------------------------+---------------------+-----------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.?Open Issues
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD/i386 10.0-RELEASE running as a guest operating system on
   VirtualBox can have a problem with disk I/O access. It depends on
   some specific hardware configuration and does not depend on a
   specific version of VirtualBox or host operating system.

   It causes various errors and makes FreeBSD quite unstable. Although
   the cause is still unclear, disabling unmapped I/O works as a
   workaround. To disable it, choose ``Escape to loader prompt`` in the
   boot menu and enter the following lines from
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
   prompt, after an ``OK``:

   .. code:: screen

       set vfs.unmapped_buf_allowed=0
       boot

   Note that the following line has to be added to ``/boot/loader.conf``
   after a boot. It disables unmapped I/O at every boot:

   .. code:: programlisting

       vfs.unmapped_buf_allowed=0

   [2014-04-03 update] It has been reported that instability may be
   present on virtual machines running on other hypervisors, such as Xen
   or KVM.

-  A bug in Heimdal (an implementation of Kerberos authentication in
   FreeBSD base system) has been fixed. It could cause an
   interoperability issue between Heimdal and the other implementations
   including MIT Kerberos. However, due to this fix, Heimdal and some
   applications which depend on it in the previous FreeBSD releases do
   not work with one in 10.0-RELEASE in certain cases. Errata Notice for
   the supported releases to fix it will be released.

-  A bug in
   `killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1>`__
   has been discovered. It makes **``killall -INT``** to deliver
   ``SIGTERM`` rather than the desired ``SIGINT``, and may cause
   blocking behavior for scripts that uses it, as ``-I`` means
   “interactive”. A workaround of this would be to use ``-SIGINT``
   instead. This bug has been fixed on FreeBSD-CURRENT and will be fixed
   in FreeBSD 10.0-STABLE.

-  The
   `bxe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bxe&sektion=4>`__
   driver can cause packet corruption when TSO (TCP Segmentation
   Offload) feature is enabled. This feature is enabled by default and
   can be disabled by using a ``-tso`` parameter of
   `ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
   It can be specified in
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   like the following:

   .. code:: programlisting

       ifconfig_bxe0="DHCP -tso"

   This bug has been fixed on FreeBSD 10.0-STABLE.

-  Due to a minor incompatibility with
   `pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__
   version ``1.2.x``,
   `bsdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdconfig&sektion=8>`__
   will duplicate the list of available packages for installation. This
   is due to the ``PACKAGESITE`` environment variable being set for
   backwards compatibility with older versions of
   `pkg(7) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=7>`__.
   This affects generation of the available package list only, and does
   not affect the behavior when processing packages for installation.

-  A regression in
   `pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__
   does not remove a user from groups not specified in the provided
   group list when the ``-G`` flag is used. This is expected to be
   corrected in FreeBSD-CURRENT and FreeBSD 10.0-STABLE.

-  `ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
   ``fwd`` action can send packets to the correct interface with a wrong
   link-layer address when the route is updated. This bug has been fixed
   on FreeBSD-CURRENT and will be fixed in FreeBSD 10.0-STABLE.

-  The
   `mount\_udf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_udf&sektion=8>`__
   utility has a bug which prevents it from mounting any UDF file
   system. This has been fixed in FreeBSD-CURRENT and FreeBSD
   10.0-STABLE.

-  Updating LSI firmware on
   `mps(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mps&sektion=4>`__
   controllers with the sas2flash utility may cause the system to hang,
   or may cause the system to panic. This is fixed in the ``stable/10``
   branch with revisions ``r262553`` and ``r262575``, and will be
   included in FreeBSD?10.1-RELEASE.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.?Late-Breaking News
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

No news.

.. raw:: html

   </div>

.. raw:: html

   </div>

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/snapshots/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 10.0-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
