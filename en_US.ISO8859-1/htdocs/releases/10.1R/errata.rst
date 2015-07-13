===========================
FreeBSD 10.1-RELEASE Errata
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

Copyright ? 2015 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, Centrino, Core, EtherExpress, i386, i486, Itanium,
Pentium, and Xeon are trademarks or registered trademarks of Intel
Corporation or its subsidiaries in the United States and other
countries.

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

Last modified on 2015-04-01 by gjb.

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

This document lists errata items for FreeBSD 10.1-RELEASE, containing
significant information discovered after the release or too late in the
release cycle to be otherwise included in the release documentation.
This information includes security advisories, as well as news relating
to the software or documentation that could affect its operation or
usability. An up-to-date version of this document should always be
consulted before installing this version of FreeBSD.

This errata document for FreeBSD 10.1-RELEASE will be maintained until
the release of FreeBSD 10.2-RELEASE.

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
`3. Errata Notices <#errata>`__
`4. Open Issues <#open-issues>`__
`5. Late-Breaking News <#late-news>`__

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
10.1-RELEASE Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 10.1-STABLE also contain
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

+------------------------------+-----------------------+-----------------------+
| Advisory                     | Date                  | Topic                 |
+==============================+=======================+=======================+
| `FreeBSD-SA-14:27.stdio <htt | 10?December?2014      | Buffer overflow in    |
| ps://www.FreeBSD.org/securit |                       | stdio                 |
| y/advisories/FreeBSD-SA-14:2 |                       |                       |
| 7.stdio.asc>`__              |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:28.file <http | 10?December?2014      | Multiple              |
| s://www.FreeBSD.org/security |                       | vulnerabilities in    |
| /advisories/FreeBSD-SA-14:28 |                       | `file(1) <http://www. |
| .file.asc>`__                |                       | FreeBSD.org/cgi/man.c |
|                              |                       | gi?query=file&sektion |
|                              |                       | =1>`__                |
|                              |                       | and                   |
|                              |                       | `libmagic(3) <http:// |
|                              |                       | www.FreeBSD.org/cgi/m |
|                              |                       | an.cgi?query=libmagic |
|                              |                       | &sektion=3>`__        |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:30.unbound <h | 17?December?2014      | Remote denial of      |
| ttps://www.FreeBSD.org/secur |                       | service vulnerability |
| ity/advisories/FreeBSD-SA-14 |                       |                       |
| :30.unbound.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-14:31.ntp <https | 23?December?2014      | Multiple              |
| ://www.FreeBSD.org/security/ |                       | vulnerabilities in    |
| advisories/FreeBSD-SA-14:31. |                       | NTP suite             |
| ntp.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:01.openssl <h | 14?January?2015       | Multiple              |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities in    |
| ity/advisories/FreeBSD-SA-15 |                       | OpenSSL               |
| :01.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:02.kmem <http | 27?January?2015       | SCTP kernel memory    |
| s://www.FreeBSD.org/security |                       | corruption and        |
| /advisories/FreeBSD-SA-15:02 |                       | disclosure            |
| .kmem.asc>`__                |                       | vulnerability         |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:03.sctp <http | 27?January?2015       | SCTP stream reset     |
| s://www.FreeBSD.org/security |                       | vulnerability         |
| /advisories/FreeBSD-SA-15:03 |                       |                       |
| .sctp.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:04.igmp <http | 25?February?2015      | Integer overflow in   |
| s://www.FreeBSD.org/security |                       | IGMP protocol         |
| /advisories/FreeBSD-SA-15:04 |                       |                       |
| .igmp.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:06.openssl <h | 19?March?2015         | Multiple              |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities       |
| ity/advisories/FreeBSD-SA-15 |                       |                       |
| :06.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:07.ntp <https | 7?April?2015          | Multiple              |
| ://www.FreeBSD.org/security/ |                       | vulnerabilities       |
| advisories/FreeBSD-SA-15:07. |                       |                       |
| ntp.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:08.bsdinstall | 7?April?2015          | Insecure default GELI |
|  <https://www.FreeBSD.org/se |                       | key file permissions  |
| curity/advisories/FreeBSD-SA |                       |                       |
| -15:08.bsdinstall.asc>`__    |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:09.ipv6 <http | 7?April?2015          | Router advertisement  |
| s://www.FreeBSD.org/security |                       | Denial of Service     |
| /advisories/FreeBSD-SA-15:09 |                       |                       |
| .ipv6.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:10.openssl <h | 16?June?2015          | Multiple              |
| ttps://www.FreeBSD.org/secur |                       | vulnerabilities       |
| ity/advisories/FreeBSD-SA-15 |                       |                       |
| :10.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-SA-15:12.openssl <h | 9?July?2015           | OpenSSL alternate     |
| ttps://www.FreeBSD.org/secur |                       | chains certificate    |
| ity/advisories/FreeBSD-SA-15 |                       | forgery vulnerability |
| :12.openssl.asc>`__          |                       | (Note: This does not  |
|                              |                       | affect                |
|                              |                       | FreeBSD?10.1-RELEASE) |
+------------------------------+-----------------------+-----------------------+

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

3.?Errata Notices
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------------------+-----------------------+-----------------------+
| Errata                       | Date                  | Topic                 |
+==============================+=======================+=======================+
| `FreeBSD-EN-14:13.freebsd-up | 23?December?2014      | Fixed directory       |
| date <https://www.FreeBSD.or |                       | deletion issue in     |
| g/security/advisories/FreeBS |                       | `freebsd-update(8) <h |
| D-EN-14:13.freebsd-update.as |                       | ttp://www.FreeBSD.org |
| c>`__                        |                       | /cgi/man.cgi?query=fr |
|                              |                       | eebsd-update&sektion= |
|                              |                       | 8>`__                 |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:01.vt <https: | 25?February?2015      | `vt(4) <http://www.Fr |
| //www.FreeBSD.org/security/a |                       | eeBSD.org/cgi/man.cgi |
| dvisories/FreeBSD-EN-15:01.v |                       | ?query=vt&sektion=4>` |
| t.asc>`__                    |                       | __                    |
|                              |                       | crash with improper   |
|                              |                       | ioctl parameters      |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:02.openssl <h | 25?February?2015      | OpenSSL update        |
| ttps://www.FreeBSD.org/secur |                       |                       |
| ity/advisories/FreeBSD-EN-15 |                       |                       |
| :02.openssl.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:03.freebsd-up | 25?February?2015      | `freebsd-update(8) <h |
| date <https://www.FreeBSD.or |                       | ttp://www.FreeBSD.org |
| g/security/advisories/FreeBS |                       | /cgi/man.cgi?query=fr |
| D-EN-15:03.freebsd-update.as |                       | eebsd-update&sektion= |
| c>`__                        |                       | 8>`__                 |
|                              |                       | updates libraries in  |
|                              |                       | suboptimal order      |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:04.freebsd-up | 13?May?2015           | `freebsd-update(8) <h |
| date <https://www.FreeBSD.or |                       | ttp://www.FreeBSD.org |
| g/security/advisories/FreeBS |                       | /cgi/man.cgi?query=fr |
| D-EN-15:04.freebsd-update.as |                       | eebsd-update&sektion= |
| c>`__                        |                       | 8>`__                 |
|                              |                       | does not ensure the   |
|                              |                       | previous upgrade has  |
|                              |                       | completed             |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:05.ufs <https | 13?May?2015           | Deadlock on reboot    |
| ://www.FreeBSD.org/security/ |                       | with UFS tuned with   |
| advisories/FreeBSD-EN-15:05. |                       | SU+J                  |
| ufs.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:06.file <http | 9?June?2015           | Multiple denial of    |
| s://www.FreeBSD.org/security |                       | service issues        |
| /advisories/FreeBSD-EN-15:06 |                       |                       |
| .file.asc>`__                |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:07.zfs <https | 9?June?2015           | ZFS reliability       |
| ://www.FreeBSD.org/security/ |                       | improvements          |
| advisories/FreeBSD-EN-15:07. |                       |                       |
| zfs.asc>`__                  |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:08.sendmail < | 30?June?2015          | Sendmail TLS/DH       |
| https://www.FreeBSD.org/secu | (revised)             | interoperability      |
| rity/advisories/FreeBSD-EN-1 |                       | improvement           |
| 5:08.sendmail.asc>`__        |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:09.xlocale <h | 30?June?2015          | Fix inconsistency     |
| ttps://www.FreeBSD.org/secur |                       | between locale and    |
| ity/advisories/FreeBSD-EN-15 |                       | rune locale states    |
| :09.xlocale.asc>`__          |                       |                       |
+------------------------------+-----------------------+-----------------------+
| `FreeBSD-EN-15:10.iconv <htt | 30?June?2015          | Improved              |
| ps://www.FreeBSD.org/securit |                       | `iconv(3) <http://www |
| y/advisories/FreeBSD-EN-15:1 |                       | .FreeBSD.org/cgi/man. |
| 0.iconv.asc>`__              |                       | cgi?query=iconv&sekti |
|                              |                       | on=3>`__              |
|                              |                       | UTF-7 support         |
+------------------------------+-----------------------+-----------------------+

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

4.?Open Issues
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD/i386 10.1-RELEASE running as a guest operating system on
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

-  FreeBSD/i386?10.1-RELEASE configured with a multi-disk ZFS dataset
   (mirror, raidz1, raidz2, raidz3) may crash during boot when the ZFS
   pool mount is attempted while booting an unmodified ``GENERIC``
   kernel.

   As described in ``/usr/src/UPDATING`` entry ``20121223``, rebuilding
   the kernel with ``options KSTACK_PAGES=4`` has been observed to
   resolve the boot-time crash. This, however, is not an ideal solution
   for inclusion in the ``GENERIC`` kernel configuration, as increasing
   ``KSTACK_PAGES`` implicitly decreases available usermode threads in
   an environment that is already resource-starved.

   Taking into account the heavy resource requirements of ZFS, in
   addition to the i386-specific tuning requirements for general
   workloads, using ZFS with the FreeBSD/i386?\ ``GENERIC`` kernel is
   strongly discouraged.

   .. raw:: html

      <div class="warning" xmlns="">

   Warning:
   ~~~~~~~~

   It is extremely important to take note that, by default,
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
   will install the ``GENERIC`` kernel configuration, and as such,
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
   consumers are strongly encouraged to avoid FreeBSD-provided kernel
   binary upgrades with such configurations.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Although there is slight change in how the crash manifests on
   FreeBSD/i386 between 10.0-RELEASE and 10.1-RELEASE, and given the
   date of the ``/usr/src/UPDATING`` entry, there is no evidence
   suggesting this is a regression between FreeBSD?10.0-RELEASE and
   FreeBSD?10.1-RELEASE directly.

   .. raw:: html

      </div>

-  Due to an incompatibility between
   `bsdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdconfig&sektion=8>`__
   and
   `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__?version
   1.3, packages included on the FreeBSD?dvd installer will not be
   recognized by
   `bsdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdconfig&sektion=8>`__.

   To install packages from the ``dvd1.iso`` installer, create the
   ``/dist`` target directory, and manually mount the ``dvd1.iso`` ISO:

   .. code:: screen

       # mkdir -p /dist
       # mount -t cd9660 /dev/cd0 /dist

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Be sure to use the correct ``/dev`` device path for the ``dvd1.iso``
   ISO installer.

   .. raw:: html

      </div>

   Next, set ``REPOS_DIR`` to the path of the ``repos/`` directory
   within the installer so
   `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
   will use the correct repository metadata.

   If using
   `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__:

   .. code:: screen

       # export REPOS_DIR=/dist/packages/repos

   If using
   `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__:

   .. code:: screen

       # setenv REPOS_DIR /dist/packages/repos

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Keep in mind that ``REPOS_DIR`` will need to be set again after the
   current shell session is terminated, if continuing to use the
   packages provided on the ``dvd1.iso`` installer.

   .. raw:: html

      </div>

   Finally, bootstrap
   `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
   from the ISO, and install required packages:

   .. code:: screen

       # pkg bootstrap
       # pkg install xorg-server xorg gnome2 [...]

-  [2015-02-06] *Affects binary upgrade users:* The second phase of
   ``freebsd-update install``, the phase where the running userland is
   upgraded, fails on systems deployed with ``nss_ldap`` enabled in
   `nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5>`__
   when upgrading from 10.0-RELEASE to 10.1-RELEASE.

   A workaround is to disable ``nss_ldap`` in
   `nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5>`__
   prior to running ``freebsd-update install`` to upgrade the userland,
   after which it can be enabled again when the upgrade process is
   completed.

   The problem is being investigated, and an Errata Notice is expected
   to be issued when a solution to the problem is identified.

-  [2015-03-31] Several reports were received regarding the QCOW2
   FreeBSD?virtual machine images crashing on boot. As result of this,
   these images have been removed from the FTP mirrors, and the hashes
   removed from ``CHECKSUM.SHA256`` and ``CHECKSUM.MD5`` in the
   ``VM-IMAGES/`` directory on the FTP mirrors.

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

5.?Late-Breaking News
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
https://www.FreeBSD.org/snapshots/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 10.1-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
