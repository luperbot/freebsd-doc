=======================================
FreeBSD/alpha 4.7-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.7-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.22.2.300 2002/09/30 19:03:49 dd Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 4.7-RELEASE contain a summary of the
changes made to the FreeBSD base system since 4.6-RELEASE. Both changes
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
1 `Introduction <#AEN13>`__
2 `What's New <#AEN21>`__
2.1 `Kernel Changes <#KERNEL>`__
2.1.1 `Processor/Motherboard Support <#AEN60>`__
2.1.2 `Boot Loaders <#AEN65>`__
2.1.3 `Network Interface Support <#AEN68>`__
2.1.4 `Network Protocols <#AEN78>`__
2.1.5 `Disks and Storage <#AEN125>`__
2.1.6 `Filesystems <#AEN151>`__
2.1.7 `PCCARD Support <#AEN154>`__
2.1.8 `Multimedia Support <#AEN157>`__
2.1.9 `Contributed Software <#AEN165>`__
2.2 `Security Advisories <#SECURITY>`__
2.3 `Userland Changes <#USERLAND>`__
2.3.1 `Contributed Software <#AEN480>`__
2.3.2 `Ports/Packages Collection <#AEN562>`__
2.4 `Release Engineering and Integration <#AEN569>`__
3 `Upgrading from previous releases of FreeBSD <#AEN577>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This document contains the release notes for FreeBSD 4.7-RELEASE on the
Alpha/AXP hardware platform. It describes new features of FreeBSD that
have been added (or changed) since 4.6-RELEASE. It also provides some
notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 4.7-RELEASE is a release distribution. It
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
============

This section describes the most user-visible new or changed features in
FreeBSD since 4.6-RELEASE. Typical release note items document new
drivers or hardware support, new commands or options, major bugfixes, or
contributed software upgrades. Security advisories for the base system
that were issued after 4.6-RELEASE are also listed.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Kernel Changes
------------------

`acct(2) <http://www.FreeBSD.org/cgi/man.cgi?query=acct&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
has been changed to open the accounting file in append mode, so that
`accton(8) <http://www.FreeBSD.org/cgi/man.cgi?query=accton&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
can be used to enable accounting to an append-only file.

``RLIMIT_VMEM`` support has been added. This feature defines a new
resource limit that covers a process's entire virtual memory space,
including
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
space. This limit can be configured in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
via the new ``vmemoryuse`` variable.

A bug in the
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
system call, in which headers counted against the size of the file to be
sent, has been fixed.

The
`ucom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucom&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
device driver has been added, to support USB modems, serial devices, and
other programs that need to look like a tty. The related
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
and
`uvscom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvscom&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
drivers provide specific support for the Prolific PL-2303 serial adapter
and the SUNTAC Slipper U VS-10U, respectively.

The
`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
driver for connecting Handspring Visors via USB has been added.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1 Processor/Motherboard Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Support for the AlphaServer 8200/8400 TurboLaser is broken, the install
kernel causes a machine check during startup.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2 Boot Loaders
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3 Network Interface Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4 Network Protocols
~~~~~~~~~~~~~~~~~~~~~~~

A new version of
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
(commonly referred to as \`\`IPFW2'') has been added as an option. It
now uses variable-sized representation of rules in the kernel, similar
to
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
instructions. Most of the externally-visible behavior (i.e. through
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__)
should be unchanged., although
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now supports ``or`` connectives between match fields. This new version
is *not* enabled by default. To use it:

.. raw:: html

   <div class="PROCEDURE">

#. Add ``options IPFW2`` (undocumented) to the kernel configuration.

#. Compile and install ``libalias`` and
   `ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
   with the ``-DIPFW2`` option specified to
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__.

.. raw:: html

   </div>

A new
`ng\_l2tp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2tp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
netgraph node type, which implements the encapsulation layer of the L2TP
protocol as described in RFC 2661, has been added.

The
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
protocol's retransmission timer can now be manipulated with two sysctl
variables, ``net.inet.tcp.rexmit_min`` and ``net.inet.tcp.rexmit_slop``.

The
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
protocol now has the ability to dynamically limit the send-side window
to maximize bandwidth and minimize round trip times. The feature can be
enabled via the ``net.inet.tcp.inflight_enable`` sysctl.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5 Disks and Storage
~~~~~~~~~~~~~~~~~~~~~~~

A bug which sometimes prevented
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
tagged queueing from working correctly has been corrected.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
driver now computes maximum transfer sizes correctly. This fixes
numerous ``READ_BIG`` and other errors that occurred when accessing
certain ATA devices.

The
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
driver now has support for the Sil 0680 and VIA 8233/8235 controllers.

The mpt driver, for supporting the LSI Logic Fusion/MP architecture
Fiber Channel controllers, has been added.

The floppy disk drive on the AlphaStation / AlphaServer DS10 does not
work with FreeBSD due to unfound bugs.

When installing on alphas that have QLogic Fibrechannel cards installed,
disable recognition of these cards from the loader. This to avoid very
long
`isp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=isp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
timeouts during kernel startup. For example, assume you have a system
with a QLogic Fiberchannel card that would show up as isp1. You would
enter at the 'ok ' prompt: set isp\_disable=0x2

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6 Filesystems
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7 PCCARD Support
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8 Multimedia Support
~~~~~~~~~~~~~~~~~~~~~~~~

The uaudio driver, for USB audio devices, has been added.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

**IPFilter** has been updated to 3.4.29.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Security Advisories
-----------------------

The original fix for security advisory SA-02:23 (which addressed the use
of file descriptors by set-user-id or set-group-id programs) contained
an error. It was still possible for systems using
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
or
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
to be exploited. This error has now been corrected; a revised version of
security advisory
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__
contains more details.

A buffer overflow in the resolver, which could be exploited by a
malicious domain name server or an attacker forging DNS messages, has
been fixed. See security advisory
`FreeBSD-SA-02:28 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:28.resolv.asc>`__
for more details.

A buffer overflow in
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__,
which could be triggered by badly-formed NFS packets, has been fixed.
See security advisory
`FreeBSD-SA-02:29 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:29.tcpdump.asc>`__
for more details.

`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
can no longer trace the operation of formerly privileged processes; this
prevents the leakage of sensitive information that the process could
have obtained before abandoning its privileges. For a discussion of this
issue, see security advisory
`FreeBSD-SA-02:30 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:30.ktrace.asc>`__
for more details.

A race condition in
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__,
which could be used to change the permissions of an arbitrary file, has
been corrected. For more information, see security advisory
`FreeBSD-SA-02:32 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:32.pppd.asc>`__.

Multiple buffer overflows in **OpenSSL** have been corrected, by way of
an upgrade to the base system version of **OpenSSL**. More details can
be found in security advisory
`FreeBSD-SA-02:33 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:33.openssl.asc>`__.

A heap buffer overflow in the XDR decoder has been fixed. For more
details, see security advisory
`FreeBSD-SA-02:34 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:34.rpc.asc>`__.

A bug that could allow local users to read and write arbitrary blocks on
an FFS filesystem has been corrected. More details can be found in
security advisory
`FreeBSD-SA-02:35 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:35.ffs.asc>`__.

A bug in the NFS server code, which could allow a remote denial of
service attack, has been fixed. Security advisory
`FreeBSD-SA-02:36 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:36.nfs.asc>`__
has more details.

A bug that could allow local users to panic a system using the
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
mechanism has been fixed. More information is contained in security
advisory
`FreeBSD-SA-02:37 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:37.kqueue.asc>`__.

Several bounds-checking bugs in system calls, which could result in some
system calls returning a large portion of kernel memory, have been
fixed. More information can be found in security advisory
`FreeBSD-SA-02:38 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:38.signed-error.asc>`__.

A bug that could allow applications using ``libkvm`` to leak sensitive
file descriptors has been corrected. (See security advisory
`FreeBSD-SA-02:39 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:39.libkvm.asc>`__
for more details.)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
--------------------

`biff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=biff&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now accepts a ``b`` argument to enable \`\`bell notification'' of new
mail (which does not disturb the terminal contents as ``biff y`` would).

`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now takes a (nonstandard) ``-n`` option to automatically answer \`\`no''
when it would ask to overwrite a file.

The
`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
program, a command-line interface to
`daemon(3) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=3&manpath=FreeBSD+4.7-RELEASE>`__,
has been added. It detaches itself from its controlling terminal and
executes a program specified on the command line. This allows the user
to run an arbitrary program as if it were written to be a daemon.

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now supports a new ``-S`` flag to allow it to just print out the dump
size estimates and exit.

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now has support for a ``.pubkey`` file.

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``-g`` flag to restrict the printing of GECOS information
to the user's full name only.

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports the ``-4`` and ``-6`` flags to specify an address family
for remote queries.

`fold(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fold&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``-b`` flag to break at byte positions and a ``-s`` flag
to break at word boundaries.

`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports the ``epsv4`` command to switch between using the new
EPSV/EPRT and plain old PASV/PORT requests when talking over IPv4. This
command is intended to remedy the problem arising when running
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
through **IPFilter** or another firewall not supporting the newer FTP
requests.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now supports the ``-m`` option to permit guest users to modify existing
files if allowed by filesystem permissions. In particular, this enables
guest users to resume uploads.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now supports the ``-M`` option to prevent guest users from creating
directories.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now supports the ``-W`` option to disable logging FTP sessions to
`wtmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmp&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``eui64`` command to fill in the lowermost 64 bits of an
IPv6 address automatically. This makes
`prefix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=prefix&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
obsolete.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now has the ability to set promiscuous mode on an interface, via the new
``promisc`` flag.

`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
now has the capability for limiting the maximum number of simultaneous
invocations of each service from a single IP address.

`lock(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lock&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now accepts a ``-v`` to disable switching VTYs while the current
terminal is locked. This permits locking the entire console from a
single terminal.

The
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
program now supports a ``-m`` flag to list files across a page, a ``-p``
flag to force printing of a ``/`` after directories, and a ``-x`` flag
to sort filenames across a page.

`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now takes a (nonstandard) ``-n`` option to automatically answer \`\`no''
when it would ask to overwrite a file.

`nice(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nice&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now uses the ``-n`` option to specify the \`\`niceness'' of the utility
being run.

`od(1) <http://www.FreeBSD.org/cgi/man.cgi?query=od&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports the ``-A`` option to specify the input address base, the
``-N`` option to specify the number of bytes to dump, the ``-j`` option
to specify the number of bytes to skip, the ``-s`` option to output
signed decimal shorts, and the ``-t`` option to specify output type.

`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
no longer emits fake challenges when the ``no_fake_prompts`` variable is
specified.

A
`pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
module has been added.

`pam\_radius(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_radius&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__,
`pam\_ssh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ssh&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__,
and
`pam\_tacplus(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_tacplus&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
have been synchronized with the versions in FreeBSD -CURRENT as of 3
July 2002.

`pam\_unix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_unix&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
has been synchronized with the version in FreeBSD -CURRENT as of 9 March
2002 (pre-**OpenPAM**).

`pwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pwd&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports the ``-L`` flag to print the logical current working
directory.

The
`renice(8) <http://www.FreeBSD.org/cgi/man.cgi?query=renice&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
command implements a ``-n`` option, which specifies an increment to be
applied to the priority of a process.

`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now takes a ``-i`` option to enable in-place editing of files.

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``-C`` option to prevent existing regular files from
being overwritten by output redirection, and a ``-u`` to give an error
if an unset variable is expanded.

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
built-in ``cd`` command now supports ``-L`` and ``-P`` flags to invoke
logical or physical modes of operation, respectively. Logical mode is
the default, but the default can be changed with the ``physical``
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
option.

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
built-in ``jobs`` command now supports a ``-s`` flag to output PIDs only
and a ``-l`` flag to add PIDs to the output.

The
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
built-in ``export`` and ``readonly`` commands now support a ``-p`` flag
to print their output in \`\`portable'' format.

`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
no longer accepts invalid constructs as ``command`` & && ``command``,
``&& command``, or ``|| command``.

`split(1) <http://www.FreeBSD.org/cgi/man.cgi?query=split&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``-a`` option to specify the number of letters to use for
the suffix of split files.

`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now has support for Kerberos V authentication.

`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now has basic support for equivalence classes for locales that support
them.

`unexpand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unexpand&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``-t`` to specify tabstabs analogous to
`expand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expand&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__.

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now accepts a ``-S`` to allow the user to disable VTY switching.

`who(1) <http://www.FreeBSD.org/cgi/man.cgi?query=who&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now has a number of new options: ``-H`` shows column headings; ``-T``
shows
`mesg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mesg&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
state; ``-m`` is an equivalent to ``am i``; ``-u`` shows idle time;
``-q`` to list names in columns.

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``-I`` ``replstr`` option that allows the user to tell
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
to insert the data read from standard input at specific points in the
command line arguments rather than at the end. (A FreeBSD-specific
``-J`` option is similar, but is now deprecated in favor of the more
portable ``-I`` option.)

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
now supports a ``-L`` option to force its utility argument to be called
after some number of lines.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~~~

**BIND** has been updated to 8.3.3.

**Binutils** has been updated to 2.12.1 (specifically, a post-release
snapshot from 20 July 2002).

**gcc** has been updated to a snapshot from the GCC 2.95 CVS branch from
20 March 2002. It carries the unofficial version number of 2.95.4.

**Heimdal Kerberos** has been updated to a pre-0.5 snapshot from 29
August 2002.

**libpcap** has been updated to 0.7.1.

The FTP daemon from NetBSD, otherwise known as **lukemftpd** 1.2 beta 1,
has been imported and is available as
`lukemftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lukemftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__.

`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
has been imported from OpenBSD, as of 26 April 2002.

The **OPIE** one-time-password suite has been updated to 2.4.

**OpenSSH** has been updated to version 3.4p1. Among the changes:

-  The ``*2`` files are obsolete (for example, ``~/.ssh/known_hosts``
   can hold the contents of ``~/.ssh/known_hosts2``).

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   can import and export keys using the SECSH Public Key File Format,
   for key exchange with several commercial SSH implementations.

-  `ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   now adds all three default keys.

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   no longer defaults to a specific key type; one must be specified with
   the ``-t`` option.

-  A \`\`privilege separation'' feature, which uses unprivileged
   processes to contain and restrict the effects of future compromises
   or programming errors.

-  Several bugfixes, including closure of a security hole that could
   lead to an integer overflow and undesired privilege escalation.

-  The default SSH protocol to use is now Version 2 (with a fallback to
   Version 1), rather than Version 1 (with a fallback to Version 2).

**OpenSSL** has been updated to 0.9.6g.

**sendmail** has been updated from version 8.12.3 to version 8.12.6.

**GNU tar** has been updated to 1.13.25.

**tcsh** has been updated to version 6.12.

**texinfo** has been updated to 4.2.

The contributed version of **tcp\_wrappers** now includes the
`tcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
helper daemon. While not strictly necessary in a standard FreeBSD
installation (because
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
already incorporates this functionality), this may be useful for
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
replacements such as **xinetd**.

**tcpdump** has been updated to 3.7.1.

**top** has been updated to version 3.5b12.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2 Ports/Packages Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The libraries installed by the
```emulators/linux_base`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
port (required for Linux emulation) have been updated; they now
correspond to those included with **Red Hat Linux** 7.1.

**XFree86** has been updated to 4.2.1. This version provides some
security and bug fixes over version 4.2.0.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Release Engineering and Integration
---------------------------------------

A bug that caused ``/usr/share/examples`` to be incompletely populated
on fresh installs has been fixed.

It is now possible to make releases of FreeBSD 5-CURRENT on a FreeBSD
4-STABLE host and vice versa. Cross-architecture (building a release for
a target architecture on a host of a different architecture) releases
are also possible. See
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7&manpath=FreeBSD+4.7-RELEASE>`__
for details.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Upgrading from previous releases of FreeBSD
=============================================

If you're upgrading from a previous release of FreeBSD, you generally
will have three options:

-  Using the binary upgrade option of
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__.
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
   ``make             world``'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__
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
