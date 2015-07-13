=======================================
FreeBSD/i386 4.11-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/i386 4.11-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004, 2005 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.22.2.419.2.9 2005/01/21 11:16:10 hrs Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 4.11-RELEASE contain a summary of the
changes made to the FreeBSD base system since 4.10-RELEASE. Both changes
for kernel and userland are listed, as well as applicable security
advisories for the base system that were issued since the last release.
Some brief remarks on upgrading are also presented.

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
2.2.1 `Platform-Specific Hardware Support <#PROC>`__
2.2.2 `Network Interface Support <#NET-IF>`__
2.2.3 `Network Protocols <#NET-PROTO>`__
2.2.4 `Disks and Storage <#DISKS>`__
2.3 `Userland Changes <#USERLAND>`__
2.4 `Contributed Software <#CONTRIB>`__
2.5 `Release Engineering and Integration <#RELENG>`__
3 `Upgrading from previous releases of FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

This document contains the release notes for FreeBSD 4.11-RELEASE on the
i386 hardware platform. It describes new features of FreeBSD that have
been added (or changed) since 4.10-RELEASE. It also provides some notes
on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 4.11-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
appendix in the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 4.10-RELEASE. Typical release note items document new
drivers or hardware support, new commands or options, major bugfixes, or
contributed software upgrades. Security advisories for the base system
that were issued after 4.10-RELEASE are also listed.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

A programming error in the FreeBSD Linux binary compatibility which
allows a local attacker to read or write portions of the kernel memory
has been fixed. For more details, see security advisory
`FreeBSD-SA-04:13.linux <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:13.linux.asc>`__.

Various remotely-exploitable vulnerabilities of **CVS**'s server mode
including double-free, integer overflow, and buffer overflow which can
result in information disclosure, denial-of-service, and/or possibly
arbitrary code execution, have been fixed via an upgrade to **CVS**
1.11.17. For more details, see security advisory
`FreeBSD-SA-04:14 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:14.cvs.asc>`__.

A bug in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+4.11-RELEASE>`__
utility which allows a malicious HTTP server to cause arbitrary portions
of the client's memory to be overwritten, has been fixed. For more
information, see security advisory
`FreeBSD-SA-04:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:16.fetch.asc>`__.

A bug in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.11-RELEASE>`__
and
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.11-RELEASE>`__
which could cause a malicious local user could perform a local denial of
service attack by causing a system panic, or the user could read parts
of kernel memory, has been fixed. For more information, see security
advisory
`FreeBSD-SA-04:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:17.procfs.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The
`cp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver has been added for Cronyx Tau-PCI synchronous serial adapters.

A bug in
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+4.11-RELEASE>`__
that pages marked as PROT\_NONE may become readable under certain
circumstances, has been fixed.

Bugs in ``vm_object_madvise()``, ``vm_object_sync()``, and
``contigmalloc()`` functions in the FreeBSD virtual memory subsystem
have been fixed. The bugs in ``vm_object_madvise()`` and
``vm_object_sync()`` could cause memory corruption in a variety of
contexts, and one in ``contigmalloc()`` could cause a system panic.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Platform-Specific Hardware Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`pbio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pbio&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver, which supports direct access to the Intel 8255A programmable
peripheral interface (PPI) chip running in mode 0 (simple I/O) has been
added.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Network Interface Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`axe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=axe&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver, which supports ASIX Electronics AX88172 USB 2.0 Ethernet chipset
has been added.

The
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver now supports BCM5750 and BCM5751.

The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver now supports 82541ER and 82546GB dual port PCI Express adapter.

The
`ixgb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ixgb&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver, which supports PCI Gigabit Ethernet adapters based on the Intel
82597EX Ethernet controller chips, has been added.

The
`ng\_hub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hub&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
Netgraph node type, which supports a simple packet distribution that
acts like an Ethernet hub has been added.

A bug of jumbo frame handling in the
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver has been fixed.

The
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver now supports
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__.

The per-interface
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
support has been implemented. All of the network drivers that support
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
(`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__,
and
`vr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vr&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__)
now also support this capability and it can be controlled via
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__.

A system panic which occurs when net.inet.ip.rtexpire and/or
net.inet6.ip6.rtexpire are set to 0 has been fixed.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

The random ephemeral port allocation, which come from OpenBSD has been
implemented. This is enabled by default and can be disabled using the
net.inet.ip.portrange.randomized sysctl. Note that the randomization can
lead to extremely fast port reuse at high connection rates, which is
causing problems for some users. To retain the security advantage of
random ports and ensure correct operation, it is disabled during periods
of high connection rates. More specifically, when the connection rate
exceeds the value of the net.inet.ip.portrange.randomcps sysctl (10 by
default), the randomization will be disabled for seconds specified in
the net.inet.ip.portrange.randomtime sysctl (45 by default).

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
now supports lookup tables. This feature is useful for handling large
sparse address sets.

`ipnat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipnat&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
now allows redirect rules to work for non-TCP/UDP packets.

The RST handling of the FreeBSD TCP stack has been improved to make
reset attacks as difficult as possible while maintaining compatibility
with the widest range of TCP stacks. The algorithm is as follows. For
connections in the ESTABLISHED state, only resets with sequence numbers
exactly matching last\_ack\_sent will cause a reset, all other segments
will be silently dropped. For connections in all other states, a reset
anywhere in the window will cause the connection to be reset. All other
segments will be silently dropped. Note that this breaks the RFC 793
specification and you can still disable this and use the conventional
behavior by setting a new sysctl net.inet.tcp.insecure\_rst to 1.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`ips(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ips&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver, which supports IBM/Adaptec ServeRAID controller has been added.

The
`mpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mpt&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver now supports LSI Logic FC929X Dual 2Gb/s Fibre Channel card.

The
`trm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=trm&sektion=4&manpath=FreeBSD+4.11-RELEASE>`__
driver now supports the DC395U2W adapters and problems under heavy load
have been fixed.

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
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
daemon now accepts two new options, -j and -J, to enable time jitter for
jobs to run as unprivileged users and the superuser, respectively. Time
jitter means that
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
will sleep for a small random period of time in the specified range
before executing a job. This feature is intended to smooth load peaks
appearing when a lot of jobs are scheduled for a particular moment.

The
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
now supports a -m option to set the default fwmem target.

The -C 60 option is now used in the default $inetd\_flags variable in
``/etc/rc.conf``.

The **libc** now supports
`eui64(3) <http://www.FreeBSD.org/cgi/man.cgi?query=eui64&sektion=3&manpath=FreeBSD+4.11-RELEASE>`__
functions.

The
`ngctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ngctl&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
now supports ``dot`` command to produce a **GraphViz** (.dot) of the
entire Netgraph.

The LQM, Link Quality Monitoring support in
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
has been reimplemented. The LQM, which is described in RFC 1989, allows
PPP to keep track of the quality of a running connection.

The userland
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
implementation now supports a \`\`set rad\_alive N'' command to enable
periodic RADIUS accounting information being sent to the RADIUS server.

A bug in
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
that prevents it from working properly when a interface has more than
one IP address has been fixed.

`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__
now supports LOG\_NTP facility.

Several off-by-one errors and potential buffer overruns in
`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1&manpath=FreeBSD+4.11-RELEASE>`__
have been fixed.

`whois(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whois&sektion=1&manpath=FreeBSD+4.11-RELEASE>`__
now supports NORID (Norwegian top level registry) handles, the German
whois nameserver, and a -k flag for querying ``whois.krnic.net`` (the
National Internet Development Agency of Korea) which hold details of IP
address allocations within Korea.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**CVS** has been updated from version 1.11.5 to version 1.11.17.

**sendmail** has been updated from version 8.12.11 to version 8.13.1.

**GNU patch** source files in ``src/contrib/patch`` has been removed.
FreeBSD have used the
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1&manpath=FreeBSD+4.11-RELEASE>`__
sources in ``src/gnu/usr.bin/patch`` for nearly seven years.

The timezone database has been updated from the **tzdata2004e** release
to the **tzdata2004g** release.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported release of **GNOME** has been updated from 2.6 to 2.8.2.
The list of changes for each component can be found at
http://mail.gnome.org/archives/gnome-announce-list/2004-December/msg00026.html.

The supported release of **KDE** has been updated from 3.2.2 to 3.3.2.

The supported userland package for Linux binary compatibility has been
updated from
```linux_base-6`` <http://www.FreeBSD.org/cgi/url.cgi?ports/linux_base-6/pkg-descr>`__
(based on Red Hat Linux 7.1) to
```linux_base-8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/linux_base-8/pkg-descr>`__
(based on Red Hat Linux 8.0).

The supported release of **X Window System** has been updated to
**XFree86** 4.4.0. Note that Xorg X11R6.8.1 is also available in the
FreeBSD Ports Collection
(```x11/xorg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__).

The NOSECURE variable in ``make.conf`` has been removed because it is
broken and no longer supported. If you had been using the NOSECURE,
please now use the NOCRYPT instead.

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
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.11-RELEASE>`__.
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

|
