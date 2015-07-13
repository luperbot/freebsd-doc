======================================
FreeBSD/i386 5.5-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/i386 5.5-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005, 2006 The FreeBSD
Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.761.2.59.2.2 2006/05/22 17:05:47 bmah Exp $

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
of the trademark claim, the designations have been followed by the
\`\`™'' or the \`\`®'' symbol.

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 5.5-RELEASE contain a summary of the
changes made to the FreeBSD base system since 5.4-RELEASE. This document
lists applicable security advisories that were issued since the last
release, as well as significant changes to the FreeBSD kernel and
userland. Some brief remarks on upgrading are also presented.

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
2.2.5 `File Systems <#FS>`__
2.2.6 `Contributed Software <#AEN229>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 ```/etc/rc.d`` Scripts <#RC-SCRIPTS>`__
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Ports/Packages Collection Infrastructure <#PORTS>`__
2.6 `Release Engineering and Integration <#RELENG>`__
2.7 `Documentation <#DOC>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 5.5-RELEASE on the
i386 hardware platform. It describes recently added, changed, or deleted
features of FreeBSD. It also provides some notes on upgrading from
previous versions of FreeBSD.

This distribution of FreeBSD 5.5-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `\`\`Obtaining FreeBSD''
appendix <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
to the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

All users are encouraged to consult the release errata before installing
FreeBSD. The errata document is updated with \`\`late-breaking''
information discovered late in the release cycle or after the release.
Typically, it contains information on known bugs, security advisories,
and corrections to documentation. An up-to-date copy of the errata for
FreeBSD 5.5-RELEASE can be found on the FreeBSD Web site.

FreeBSD 5.5-RELEASE is the last planned release on the 5.5-STABLE
branch. The FreeBSD development community is currently focusing its
efforts on the 6-STABLE and CURRENT codelines. No new major features are
planned for the 5.5-STABLE branch, although minor updates and bugfixes
may be merged at the discretion of individual developers. The FreeBSD
security team will support the 5.5-RELEASE-based security branch with
advisories and security patches until the end-of-life date documented at
http://security.freebsd.org/ (as of this writing, 31 May 2008).

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 5.4-RELEASE.

Typical release note items document recent security advisories issued
after 5.4-RELEASE, new drivers or hardware support, new commands or
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

Because of an information disclosure vulnerability on processors using
Hyper-Threading Technology (HTT), the ``machdep.hyperthreading_allowed``
sysctl variable has been added. It defaults to ``1`` (HTT enabled) on
FreeBSD CURRENT, and ``0`` (HTT disabled) on the 4-STABLE and 5-STABLE
development branches and supported security fix branches. More
information can be found in security advisory
`FreeBSD-SA-05:09.htt <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:09.htt.asc>`__.

A bug in the
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility which allows a malicious remote user to cause a
denial-of-service by using specially crafted packets, has been fixed.
For more information, see security advisory
`FreeBSD-SA-05:10.tcpdump <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:10.tcpdump.asc>`__.

Two problems in the
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility have been fixed. These may allow a local user to modify
permissions of arbitrary files and overwrite arbitrary local files when
uncompressing a file. For more information, see security advisory
`FreeBSD-SA-05:11.gzip <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:11.gzip.asc>`__.

A bug has been fixed in
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
that could cause packets to be matched incorrectly against a lookup
table. This bug only affects SMP machines or UP machines that have the
``PREEMPTION`` kernel option enabled. More information is contained in
security advisory
`FreeBSD-SA-05:13.ipfw <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:13.ipfw.asc>`__.

Two security-related problems have been fixed in
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__.
These include a potential denial of service and unauthorized
manipulation of file permissions. For more information, see security
advisory
`FreeBSD-SA-05:14.bzip2 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:14.bzip2.asc>`__.

Two problems in FreeBSD's TCP stack have been fixed. They could allow
attackers to stall existing TCP connections, creating a
denial-of-service situation. More information is contained in security
advisory
`FreeBSD-SA-05:15.tcp <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:15.tcp.asc>`__.

Two buffer overflows in the zlib library has been corrected. More
information can be found in security advisory
`FreeBSD-SA-05:16.zlib <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:16.zlib.asc>`__
and
`FreeBSD-SA-05:18.zlib <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:18.zlib.asc>`__.

A security vulnerability that could allow processes running inside a
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2&manpath=FreeBSD+5.5-RELEASE>`__
to gain access to hidden
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.5-RELEASE>`__
file nodes has been corrected, as described in security advisory
`FreeBSD-SA-05:17.devfs <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:17.devfs.asc>`__.

A programming error in the
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
implementation, which resulted in AES-XCBC-MAC authentication using a
constant key, has been corrected. More details are in security advisory
`FreeBSD-SA-05:19.ipsec <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:19.ipsec.asc>`__.

A temporary file vulnerability in
`cvsbug(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cvsbug&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__,
which could allow an attacker to modify or overwrite files with the
permissions of a user running the
`cvsbug(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cvsbug&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
utility, has been fixed. More details can be found in security advisory
`FreeBSD-SA-05:20.cvsbug <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:20.cvsbug.asc>`__.

A bug in OpenSSL that could allow an attacker to force an use older
version of the SSL (with known weakensses) has been corrected. Details
can be found in security advisory
`FreeBSD-SA-05:21.openssl <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-05:21.openssl.asc>`__.

A temporary file vulnerability in
`texindex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=texindex&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__,
which could allow a local attacker to overwrite files in the context of
a user running the
`texindex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=texindex&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility, has been fixed. For more details see security advisory
`FreeBSD-SA-06:01.texindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:01.texindex.asc>`__.

A temporary file vulnerability in the
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
text editor, which could allow a local attacker to overwrite files in
the context of a user running
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__,
has been fixed. For more details see security advisory
`FreeBSD-SA-06:02.ee <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:02.ee.asc>`__.

Several vulnerabilities in the
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility have been corrected. For more details see security advisory
`FreeBSD-SA-06:03.cpio <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:03.cpio.asc>`__.

Two instances in which portions of kernel memory could be disclosed to
users have been fixed. For more details see security advisory
`FreeBSD-SA-06:06.kmem <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:06.kmem.asc>`__.

A logic bug in the IP fragment handling in
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__,
which could cause a crash under certain circumstances, has been fixed.
For more details see security advisory
`FreeBSD-SA-06:07.pf <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:07.pf.asc>`__.

An error in Selective Acknowledgement (SACK) support in the TCP/IP
stack, which could cause an infinite loop upon reception of a particular
series of packets, has been corrected. More details are contained in
security advisory
`FreeBSD-SA-06:08.sack <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:08.sack.asc>`__.

A logic bug in the OpenSSH performs internal accounting, which could
cause the master decides that it is overloaded and stops accepting
client connections, has been fixed. For more details see security
advisory
`FreeBSD-SA-06:09.openssh <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:09.openssh.asc>`__.

A logic bug in the NFS server code, which could cause a crash when the
server received a message with a zero-length payload, has been fixed.
For more details see security advisory
`FreeBSD-SA-06:10.nfs <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:10.nfs.asc>`__.

A programming error in the
`fast\_ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fast_ipsec&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
implementation results in the sequence number associated with a Security
Association not being updated, allowing packets to unconditionally pass
sequence number verification checks, has been fixed. For more details
see security advisory
`FreeBSD-SA-06:11.ipsec <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:11.ipsec.asc>`__.

A logic bug that could cause
`opiepasswd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=opiepasswd&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
to allow an unprivileged user to configure OPIE authentication for the
root user under certain circumstances, has been fixed. For more details
see security advisory
`FreeBSD-SA-06:12.opie <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:12.opie.asc>`__.

An asynchronous signal handling vulnerability in
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__,
which could allow a remote attacker to execute arbitrary code with the
privileges of the user running sendmail, typically root, has been fixed.
For more details see security advisory
`FreeBSD-SA-06:13.sendmail <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:13.sendmail.asc>`__.

An information disclosure issue found in FreeBSD kernel running on 7th
and 8th generation of AMD processors has been fixed. For more details
see security advisory
`FreeBSD-SA-06:14.fpu <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-06:14.fpu.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

The ``autoboot`` command will now prevent the user from interrupting the
boot process at all if the ``autoboot_delay`` variable is set to ``-1``.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Hardware Support
^^^^^^^^^^^^^^^^^^^^^^

The
`ce(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ce&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
driver has been added to support Cronyx Tau32-PCI adapters.

Dual-core processors (such as the Intel Core Duo) now have both cores
available for use by default in SMP-enabled kernels.

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.1 Multimedia Support
''''''''''''''''''''''''''

The
`uaudio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uaudio&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
driver now has some added functionality, including volume control on
more inputs and recording capability on some devices.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.2.2.2 Network Interface Support
'''''''''''''''''''''''''''''''''

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
driver now supports the BCM5714 and 5789 chips.

The
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
driver is now MPSAFE.

Drivers using the
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
device driver wrapper mechanism are now built and loaded differently.
The
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
driver can now be pre-built as module or statically compiled into a
kernel. Individual drivers can now be built with the
`ndisgen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndisgen&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
utility; the result is a kernel module that can be loaded into a running
kernel using
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__.

Many (but not all) changes to the
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
system were merged from HEAD.

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
driver now supports
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__.

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
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
network bridging implementation, originally from NetBSD, has been added.
It supports the IEEE 802.1D Spanning Tree Protocol, individual interface
devices for each bridge, filtering of bridged packets, and span ports
(which transmit a copy of every frame received by the bridge). The
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports configuration of
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`twa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twa&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
driver has been updated to the 9.3.0.1 release on the 3ware Web site.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 File Systems
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6 Contributed Software
^^^^^^^^^^^^^^^^^^^^^^^^^^

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
`bsdiff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdiff&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
and
`bspatch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bspatch&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utilities have been added. These are tools for constructing and applying
binary patches.

The
`cmp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cmp&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports an ``-h`` flag to compare the symbolic link itself
rather than the file that the link points to.

The
`gethostbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyname&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
`gethostbyname2(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyname2&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
and
`gethostbyaddr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=gethostbyaddr&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__
functions are now thread-safe.

The
`getnetent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetent&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
`getnetbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetbyname&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
and
`getnetbyaddr(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnetbyaddr&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__
functions are now thread-safe.

The
`getprotoent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprotoent&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
`getprotobyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprotobyname&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
and
`getprotobynumber(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprotobynumber&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__
functions are now thread-safe.

The
`getservent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getservent&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
`getservbyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getservbyname&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__,
and
`getservbyport(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getservbyport&sektion=3&manpath=FreeBSD+5.5-RELEASE>`__
functions are now thread-safe.

The
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
program now supports a ``-s`` flag to suppress the display of I/O data.

The
`kldstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldstat&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports a ``-m`` option to return the status of a specific
kernel module.

The default stack sizes in ``libpthread``, ``libthr``, and ``libc_r``
have been increased. On 32-bit platforms, the main thread receives a 2MB
stack size by default, with other threads receiving a 1MB stack size by
default. On 64-bit platforms, the default stack sizes are 4MB and 2MB
respectively.

The
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports an ``-h`` flag for interface stats mode, which
prints all interface statistics in human readable form.

The
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports a \`\`sweeping ping'' in which
`icmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=icmp&sektion=4&manpath=FreeBSD+5.5-RELEASE>`__
payload of packets being sent is increased with given step. This is
useful for testing problematic channels, MTU issues or traffic policing
functions in networks.

The
`powerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=powerd&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
program for managing power consumption has been added.

The
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
program now supports service names in addition to ``-c`` option with
channel number. The supported names are: DUN (Dial-Up Networking), FAX
(Fax), LAN (LAN Access Using PPP), and SP (Serial Port).

The
`rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports an ``-I`` option that asks for confirmation (once)
if recursively removing directories or if more than 3 files are listed
in the command line.

`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
now supports a ``-l`` option to make its output line-buffered.

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports the ``times`` built-in command.

The
`snapinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=snapinfo&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
utility, which shows snapshot locations on UFS filesystems, has been
added.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 ``/etc/rc.d`` Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``bluetooth`` script has been added. This script will be called from
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
in response to device attachment/detachment events and to stop/start
particular device without unplugging it by hand. The configuration
parameters are in ``/etc/defaults/bluetooth.device.conf``, and can be
overridden by using ``/etc/bluetooth/$device``.conf (where ``$device``
is ``ubt0``, ``btcc0``, and so on.) For more details, see
`bluetooth.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=bluetooth.conf&sektion=5&manpath=FreeBSD+5.5-RELEASE>`__.

The ``rc.d/jail`` startup script now supports ``jail_name_flags``
variable which allows to specify
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
flags.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**BIND** has been updated from 9.3.1 to 9.3.2.

**sendmail** has been updated from version 8.13.3 to version 8.13.6.

The timezone database has been updated from the **tzdata2005g** release
to the **tzdata2006g** release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
program now supports an ``-P`` flag, which is the same as the ``-p``
flag except that the given prefix is also used recursively for the
dependency packages if any.

The
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
and
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utilities now support a ``-K`` flag to save packages to the current
directory (or ``PKGDIR`` if defined) by default.

The
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
program now supports an ``-x`` flag to support basic regular expressions
for package name, an ``-E`` flag for extended regular expressions, and a
``-G`` for exact matching.

The
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports a ``-I`` flag, which causes only the ``INDEX`` file
to be used for determining if a package is out of date.

The
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1&manpath=FreeBSD+5.5-RELEASE>`__
utility now supports an ``-o`` flag to show the origin recorded on
package generation instead of the package name, and an ``-O`` flag to
list packages whose registered origin is origin only.

The
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
utility (``sysutils/portsnap``) has been added into the FreeBSD base
system. This is a secure, easy to use, fast, lightweight, and generally
good way for users to keep their ports trees up to date.

The suffix of startup scripts from the Ports Collection has been
removed. This means ``foo.sh`` is renamed to ``foo``, and now scripts
whose name is something like ``foo.ORG`` will also be invoked. You are
recommended to reinstall packages which install such scripts and remove
extra files in the ``local_startup`` directory.

New ``rc.conf`` variables, ``ldconfig_local_dirs`` and
``ldconfig_local32_dirs`` have been added. These hold lists of local
`ldconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ldconfig&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__
directories.

The ``@cwd`` command in ``pkg-plist`` now allows no directory argument.
If no directory argument is given, it will set current working directory
to the first prefix given by the ``@cwd`` command.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported version of the **GNOME** desktop environment
(```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__)
has been updated from 2.10.2 to 2.12.3.

The supported version of the **KDE** desktop environment
(```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__)
has been updated from 3.4.2 to 3.5.1.

The supported version of the **Perl** interpreter
(```lang/perl5.8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/lang/perl5.8/pkg-descr>`__)
has been updated from 5.8.7 to 5.8.8.

The supported version of the **Xorg** windowing system
(```x11/xorg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__)
has been updated from 6.8.2 to 6.9.0.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7 Documentation
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
---------------------------------------------

If you're upgrading from a previous release of FreeBSD, you generally
will have three options:

-  Using the binary upgrade option of
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.5-RELEASE>`__.
   This option is perhaps the quickest, although it presumes that your
   installation of FreeBSD uses no special compilation options.

-  Performing a complete reinstall of FreeBSD. Technically, this is not
   an upgrading method, and in any case is usually less convenient than
   a binary upgrade, in that it requires you to manually backup and
   restore the contents of ``/etc``. However, it may be useful in cases
   where you want (or need) to change the partitioning of your disks.

-  From source code in ``/usr/src``. This route is more flexible, but
   requires more disk space, time, and technical expertise. More
   information can be found in the `\`\`Using
   ``make world``'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__
   section of the `FreeBSD
   Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.
   Upgrading from very old versions of FreeBSD may be problematic; in
   cases like this, it is usually more effective to perform a binary
   upgrade or a complete reinstall.

Please read the ``INSTALL.TXT`` file for more information, preferably
*before* beginning an upgrade. If you are upgrading from source, please
be sure to read ``/usr/src/UPDATING`` as well.

Finally, if you want to use one of various means to track the -STABLE or
-CURRENT branches of FreeBSD, please be sure to consult the
`\`\`-CURRENT vs.
-STABLE'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/current-stable.html>`__
section of the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

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
