=======================================
FreeBSD/alpha 6.4-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 6.4-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 The
FreeBSD Documentation Project

| $FreeBSD:
  releng/6.4/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml
  185279 2008-11-25 02:19:13Z hrs $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of the FreeBSD Foundation.

IBM, AIX, EtherJet, Netfinity, OS/2, PowerPC, PS/2, S/390, and ThinkPad
are trademarks of International Business Machines Corporation in the
United States, other countries, or both.

IEEE, POSIX, and 802 are registered trademarks of Institute of
Electrical and Electronics Engineers, Inc. in the United States.

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

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 6.4-RELEASE contain a summary of the
changes made to the FreeBSD base system on the 6.4-STABLE development
line. This document lists applicable security advisories that were
issued since the last release, as well as significant changes to the
FreeBSD kernel and userland. Some brief remarks on upgrading are also
presented.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Table of Contents**
1 `Introduction <#INTRO>`__
2 `What's New <#NEW>`__
2.1 `Security Advisories <#SECURITY>`__
2.2 `Kernel Changes <#KERNEL>`__
2.2.1 `Boot Loader Changes <#BOOT>`__
2.2.2 `Hardware Support <#PROC>`__
2.2.3 `Network Protocols <#NET-PROTO>`__
2.2.4 `Disks and Storage <#DISKS>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 ```/etc/rc.d`` Scripts <#RC-SCRIPTS>`__
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Ports/Packages Collection Infrastructure <#PORTS>`__
2.6 `Release Engineering and Integration <#RELENG>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 6.4-RELEASE on the
Alpha/AXP hardware platform. It describes recently added, changed, or
deleted features of FreeBSD. It also provides some notes on upgrading
from previous versions of FreeBSD.

This distribution of FreeBSD 6.4-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `“Obtaining FreeBSD”
appendix <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with “late-breaking” information
discovered late in the release cycle or after the release. Typically, it
contains information on known bugs, security advisories, and corrections
to documentation. An up-to-date copy of the errata for FreeBSD
6.4-RELEASE can be found on the FreeBSD Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 6.3-RELEASE.

Typical release note items document recent security advisories issued
after 6.3-RELEASE, new drivers or hardware support, new commands or
options, major bug fixes, or contributed software upgrades. They may
also list changes to major ports/packages or release engineering
practices. Clearly the release notes cannot list every single change
made to FreeBSD between releases; this document focuses primarily on
security advisories, user-visible changes, and major architectural
improvements.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

Problems described in the following security advisories has been fixed.
For more information, consult the individual advisories available from
http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| Advisory                                                                                           | Date               | Topic                                                                                                                                              |
+====================================================================================================+====================+====================================================================================================================================================+
| `SA-08:03.sendfile <http://security.FreeBSD.org/advisories/FreeBSD-SA-08:03.sendfile.asc>`__       | 14 February 2008   | `sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+6.4-RELEASE>`__ write-only file permission bypass        |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:05.openssh <http://security.freebsd.org/advisories/FreeBSD-SA-08:05.openssh.asc>`__         | 17 April 2008      | OpenSSH X11-forwarding privilege escalation                                                                                                        |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:06.bind <http://security.freebsd.org/advisories/FreeBSD-SA-08:06.bind.asc>`__               | 13 July 2008       | DNS cache poisoning                                                                                                                                |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:07.amd64 <http://security.freebsd.org/advisories/FreeBSD-SA-08:07.amd64.asc>`__             | 3 September 2008   | amd64 swapgs local privilege escalation                                                                                                            |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:09.icmp6 <http://security.freebsd.org/advisories/FreeBSD-SA-08:09.icmp6.asc>`__             | 3 September 2008   | Remote kernel panics on IPv6 connections                                                                                                           |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:10.nd6 <http://security.freebsd.org/advisories/FreeBSD-SA-08:10.nd6.asc>`__                 | 1 October 2008     | IPv6 Neighbor Discovery Protocol routing vulnerability                                                                                             |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
| `SA-08:11.arc4random <http://security.freebsd.org/advisories/FreeBSD-SA-08:11.arc4random.asc>`__   | 24 November 2008   | `arc4random(9) <http://www.FreeBSD.org/cgi/man.cgi?query=arc4random&sektion=9&manpath=FreeBSD+6.4-RELEASE>`__ predictable sequence vulnerability   |
+----------------------------------------------------------------------------------------------------+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The opencrypto framework
(`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+6.4-RELEASE>`__)
and
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
subsystem now support Camellia block cipher.

The FreeBSD kernel
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9&manpath=FreeBSD+6.4-RELEASE>`__
now supports buffer corruption protection (RedZone). This detects both
buffer underflow and buffer overflow bugs at runtime on
`free(9) <http://www.FreeBSD.org/cgi/man.cgi?query=free&sektion=9&manpath=FreeBSD+6.4-RELEASE>`__
and
`realloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=realloc&sektion=9&manpath=FreeBSD+6.4-RELEASE>`__
and prints backtraces from where memory was allocated and from where it
was freed. For more details, see ``DEBUG_REDZONE`` kernel option.

The client side functionality of
`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
has been implemented in FreeBSD kernel. This implementation provides the
correct semantics for
`flock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=flock&sektion=2&manpath=FreeBSD+6.4-RELEASE>`__
style locks which are used by the
`lockf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lockf&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
command line tool and the
`pidfile(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pidfile&sektion=3&manpath=FreeBSD+6.4-RELEASE>`__
library. It also implements recovery from server restarts and ensures
that dirty cache blocks are written to the server before obtaining locks
(allowing multiple clients to use file locking to safely share data).
Also, a new kernel option ``options NFSLOCKD`` has been added and
enabled by default. If the kernel support is enabled,
`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
automatically detects and uses the functionality.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD now support booting from GPT-labeled disks from the BIOS.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The
`acpi\_asus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_asus&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
driver now supports Asus EeePC backlight control.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The ``DRM`` driver now supports i915 GME device.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
driver now supports BCM5906-based adapters.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

The
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
subsystem now supports ``fast`` mode operation which allows certain
packets to bypass the dummynet scheduler. This can achieve lower latency
and lower overhead when the packet flow is under the pipe bandwidth, and
eliminate recursion in the subsystem. The new sysctl variable
``net.inet.ip.dummynet.io_fast`` has been added to enable this feature.

The
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+6.4-RELEASE>`__
now allows underscore in domain names. Although this is a violation of
RFC 1034 [STD 13], it is accepted by certain name servers as well as
other popular operating systems' resolver library.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`aac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=aac&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
driver now supports 64-bit array support for RAIDs larger than 2TB and
simultaneous opens of the device for issuing commands to the controller.

A data corruption problem of the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
driver on ServerWorks HT1000 chipsets has been fixed.

Stability of the
`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
driver has been improved.

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
driver now supports ``mpt_user`` personality.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

The
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
utility now supports the following options: ``--numeric-owner``, ``-S``,
and ``-s``.

A bug in
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
utility which prevents POSIX.1e ACL (see also
`acl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=acl&sektion=3&manpath=FreeBSD+6.4-RELEASE>`__)
from copying properly has been fixed.

The
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
utility now supports ``-m`` flag which overrides the default mail
recipient for cron mails unless explicitly provided by ``MAILTO=`` line
in ``crontab`` file.

The
`cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
now supports ``-n`` flag which is the opposite of ``-N`` flag.

The
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
and
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
utility now support extended attributes (see also
`extattr(9) <http://www.FreeBSD.org/cgi/man.cgi?query=extattr&sektion=9&manpath=FreeBSD+6.4-RELEASE>`__).

The
`fortune(6) <http://www.FreeBSD.org/cgi/man.cgi?query=fortune&sektion=6&manpath=FreeBSD+6.4-RELEASE>`__
program now supports ``FORTUNE_PATH`` environment variable to specify
search path of the fortune files.

A bug in the
`fortune(6) <http://www.FreeBSD.org/cgi/man.cgi?query=fortune&sektion=6&manpath=FreeBSD+6.4-RELEASE>`__
program that prevents ``-e`` option with multiple files from working has
been fixed.

The
`freebsd-update.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update.conf&sektion=5&manpath=FreeBSD+6.4-RELEASE>`__
now supports ``IDSIgnorePaths`` statement.

The
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
utility now supports ``-f node`` option which specifies ``node`` as the
root node on the next bus reset.

The
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
utility now supports ``:u`` variable modifier which removes adjacent
duplicate words.

The incorrect output grammer of
`morse(6) <http://www.FreeBSD.org/cgi/man.cgi?query=morse&sektion=6&manpath=FreeBSD+6.4-RELEASE>`__
program has been fixed.

The
`mountd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mountd&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
utility now supports ``-h bindip`` option which specifies IP addresses
to bind to for TCP and UDP requests. This option may be specified
multiple times. If no ``-h`` option is specified, ``INADDR_ANY`` will be
used. Note that when specifying IP addresses with this option, it will
automatically add ``127.0.0.1`` and if IPv6 is enabled, ``::1`` to the
list.

The
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
utility now supports ``-L`` flag which changes the speed of scrolling
and changes ``-U`` option behavior to only affect the scroll threshold.

The
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
now support POSIX specification when moving a directory to an existing
directory across devices.

The
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
now supports ``daily_status_mail_rejects_shorten`` configuration
variable in
`periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5&manpath=FreeBSD+6.4-RELEASE>`__.
This allows the rejected mail reports to tally the rejects per blacklist
without providing details about individual sender hosts. The default
configuration keeps the reports in their original form.

The
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
now uses exit status of ``0`` and ``2`` in the same manner as
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__.

A bug in
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
that it attempts authentication even when ``-a all`` option is specified
has been fixed.

The
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
and
`vmstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vmstat&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
now support ``-P`` flag which displays per-CPU statistics.

The
`watch(8) <http://www.FreeBSD.org/cgi/man.cgi?query=watch&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
utility now supports more than 10
`snp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snp&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
devices at a time.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``ike``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
script has been removed.

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.4-RELEASE>`__
now supports ``dummynet_enable`` variable which allow
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4&manpath=FreeBSD+6.4-RELEASE>`__
kernel module to be loaded when ``firewall_enable`` is ``YES``.

The ``ppp``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
script now supports multiple instances. For more details, see
description of ``ppp_profile`` variable in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.4-RELEASE>`__.

The ``rfcomm_pppd_server``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
script which allows start
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
in server mode at boot time, has been added. Multiple profiles can be
started at the same time. For more details, see
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.4-RELEASE>`__.

The ``sysctl``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+6.4-RELEASE>`__
script now supports loading ``/etc/sysctl.conf.local`` in addition to
``/etc/sysctl.conf``.

The
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+6.4-RELEASE>`__
now supports configuration of interfaces and attached networks for
firewall rule set by ``rc.firewall`` when ``firewall_type`` is
``simple`` or ``client``. See ``firewall_client_net``,
``firewall_simple_iif``, ``firewall_simple_inet``,
``firewall_simple_oif``, and ``firewall_simple_onet``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**am-utils** has been updated to version 6.1.5.

**ISC BIND** has been updated to version 9.3.5-P2.

**bzip2** has been updated from 1.0.4 to 1.0.5.

**NTP** has been updated to version 4.2.4p5.

**FILE** has been updated to version 4.21.

``libarchive`` has been virtually updated to 2.5.4b. Note that the
internal version number remains 1.9.25 because the API/ABI compatibility
is preserved.

**ncurses** library has been updated to version 5.6-20080503.

**OpenPAM** has been updated to Hydrangea release.

**sendmail** has been updated from 8.14.2 to 8.14.3.

**tcsh** has been updated to version 6.15.00.

The timezone database has been updated from the **tzdata2007k** release
to the **tzdata2008e** release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``pkg_install`` utilities have been upgraded to snapshot on
8.0-CURRENT as of May 30, 2008.

The
`pkg\_sign(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_sign&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
and the
`pkg\_check(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_check&sektion=1&manpath=FreeBSD+6.4-RELEASE>`__
utility have been removed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.20.1 to 2.22.3.

The supported version of the **KDE** desktop environment
(```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
has been updated from 3.5.8 to 3.5.10.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

Source upgrades to FreeBSD 6.4-RELEASE are only supported from FreeBSD
5.3-RELEASE or later. Users of older systems wanting to upgrade
6.4-RELEASE will need to update to FreeBSD 5.3 or newer first, then to
FreeBSD 6.4-RELEASE.

.. raw:: html

   <div class="IMPORTANT">

    **Important:** Upgrading FreeBSD should, of course, only be
    attempted after backing up *all* data and configuration files.

.. raw:: html

   </div>

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
