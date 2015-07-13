========================================
FreeBSD/alpha 4.10-RELEASE Release Notes
========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.10-RELEASE Release Notes
========================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/relnotes/common/new.sgml,v
  1.22.2.410.2.3 2004/05/22 00:22:41 hrs Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

The release notes for FreeBSD 4.10-RELEASE contain a summary of the
changes made to the FreeBSD base system since 4.9-RELEASE. Both changes
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
2.2.2 `Boot Loader Changes <#BOOT>`__
2.2.3 `Network Interface Support <#NET-IF>`__
2.2.4 `Network Protocols <#NET-PROTO>`__
2.2.5 `Disks and Storage <#DISKS>`__
2.2.6 `File Systems <#FS>`__
2.2.7 `PCCARD Support <#PCCARD>`__
2.2.8 `Multimedia Support <#MM>`__
2.3 `Userland Changes <#USERLAND>`__
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

This document contains the release notes for FreeBSD 4.10-RELEASE on the
Alpha/AXP hardware platform. It describes new features of FreeBSD that
have been added (or changed) since 4.9-RELEASE. It also provides some
notes on upgrading from previous versions of FreeBSD.

This distribution of FreeBSD 4.10-RELEASE is a release distribution. It
can be found at ftp://ftp.FreeBSD.org/ or any of its mirrors. More
information on obtaining this (or other) release distributions of
FreeBSD can be found in the `\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
appendix in the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

For significant information discovered after the release or last-minute
changes in the release cycle to be otherwise included in the release
documentation, please read
`Errata <http://www.FreeBSD.org/releases/4.10R/errata.html>`__ document.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 What's New
------------

This section describes the most user-visible new or changed features in
FreeBSD since 4.9-RELEASE. Typical release note items document new
drivers or hardware support, new commands or options, major bugfixes, or
contributed software upgrades. Security advisories for the base system
that were issued after 4.9-RELEASE are also listed.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Security Advisories
~~~~~~~~~~~~~~~~~~~~~~~

A potential denial of service in **BIND** has been fixed. For more
information, see security advisory
`FreeBSD-SA-03:19 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:19.bind.asc>`__.

A bug with the System V Shared Memory interface (specifically the
`shmat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmat&sektion=2&manpath=FreeBSD+4.10-RELEASE>`__
system call) has been fixed. This bug can cause a shared memory segment
to reference unallocated kernel memory. In turn, this can permit a local
attacker to gain unauthorized access to parts of kernel memory, possibly
resulting in disclosure of sensitive information, bypass of access
control mechanisms, or privilege escalation. More details can be found
in security advisory
`FreeBSD-SA-04:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:02.shmat.asc>`__.

A potential low-bandwidth denial-of-service attack against the FreeBSD
TCP stack has been prevented by limiting the number of out-of-sequence
TCP segments that can be held at one time. More details can be found in
security advisory
`FreeBSD-SA-04:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:04.tcp.asc>`__.

A bug in **OpenSSL**'s SSL/TLS ChangeCipherSpec message processing could
result in a null pointer dereference, has been fixed. This could allow a
remote attacker to crash an **OpenSSL**-using application and cause a
denial-of-service on the system. More details can be found in security
advisory
`FreeBSD-SA-04:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:05.openssl.asc>`__.

Two programming errors in **CVS** have been fixed. They allow a server
to overwrite arbitrary files on the client, and a client to read
arbitrary files on the server when accessing remote CVS repositories.
More details can be found in security advisory
`FreeBSD-SA-04:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:07.cvs.asc>`__.

A bugfix for **Heimdal** rectifies a problem in which it would not
perform adequate checking of authentication across autonomous realms.
For more information, see security advisory
`FreeBSD-SA-04:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:08.heimdal.asc>`__.

A fix in
`kadmind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kadmind&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
closes a potential buffer overflow. Details can be found in security
advisory
`FreeBSD-SA-04:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:09.kadmind.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Kernel Changes
~~~~~~~~~~~~~~~~~~

The
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
\`\`dumb console'' driver has been added to provide a local and remote
console. It can be accessed over FireWire using the
`dcons\_crom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons_crom&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver. A
`dconschat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dconschat&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
utility provides user access to
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
devices.

A bug in
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+4.10-RELEASE>`__
that pages marked as PROT\_NONE may become readable under certain
circumstances, has been fixed.

The
`stl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=stl&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver has been updated to version 5.6.0b1.

The
`umct(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umct&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver, which provides support for USB to RS-232 converters based on the
Magic Control Technology USB-232 has been added.

The
`usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
support has been improved, which includes a lot of bug fixes and early
support for some USB2 devices.

.. raw:: html

   <div class="NOTE">

    **Note:**
    `umodem(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umodem&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
    now uses ``/dev/ucom*`` instead of ``/dev/umodem*`` device nodes.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.1 Platform-Specific Hardware Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2 Boot Loader Changes
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3 Network Interface Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A short hiccup in the
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
during parameter reconfiguration, has been fixed.

A bug, which prevents VLAN support in the
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver from working has been fixed.

Several bugs related to
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
support in the
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver have been fixed.

The
`ste(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ste&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver now supports
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__.

The hardware TX checksum support of the
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver has been disabled as it does not work correctly and slows down
the transmission rate.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4 Network Protocols
^^^^^^^^^^^^^^^^^^^^^^^

The DA\_OLD\_QUIRKS kernel option, which is for the CAM SCSI disk driver
(`cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__)
has been removed.

The TCP implementation now includes partial (output-only) support for
RFC 2385 (TCP-MD5) digest support. This feature, enabled with the
TCP\_SIGNATURE and FAST\_IPSEC kernel options, is a TCP option for
authenticating TCP sessions.
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
now includes support for the TCP-MD5 class of security associations.

The random ephemeral port allocation, which come from OpenBSD has been
implemented. This is enabled by default and can be disabled using the
net.inet.ip.portrange.randomized sysctl.

The
`ng\_vlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_vlan&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
NetGraph node type, which supports IEEE 802.1Q VLAN tagging has been
added.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5 Disks and Storage
^^^^^^^^^^^^^^^^^^^^^^^

The
`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver now has system crashdump support.

The
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
driver now supports the missing ATAPI MMC commands and handles the
timeout properly.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6 File Systems
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.7 PCCARD Support
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.8 Multimedia Support
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3 Userland Changes
~~~~~~~~~~~~~~~~~~~~

`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
now supports a -f option to work on regular files which contain disk
images.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
now supports a staticarp option for an interface, which disables the
sending of ARP requests for that interface.

`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
now prints the
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.10-RELEASE>`__
status on the interface.

`killall(1) <http://www.FreeBSD.org/cgi/man.cgi?query=killall&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__
now supports a -e flag to make the -u operate on effective, rather than
real, user IDs.

The default mode for the ``lost+found`` directory of
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
is now 0700 instead of 01777.

The ``libalias`` library,
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__,
and
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
now support Cisco Skinny Station protocol, which is the protocol used by
Cisco IP phones to talk to Cisco Call Managers. Note that currently
having the Call Manager behind the NAT gateway is not supported.

`makewhatis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=makewhatis&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__,
formerly a Perl script, has been reimplemented in C.

`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__
compatibility with POSIX/SUSv3 has been improved. The changes include -p
for a list of process IDs, -t for a list of terminal names, -A which is
equivalent to -ax, -G for a list of group IDs, -X which is the opposite
of -x, and some minor improvements. For more information, see
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__.

`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__
now supports a -H option, which accepts an encrypted password on a file
descriptor.

`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__
now has support for the dynamic mapping of shared object dependencies.
More information on using this feature can be found in
`libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+4.10-RELEASE>`__.

`stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__
from **NetBSD**, as of 5 June 2002 has, been imported.

`which(1) <http://www.FreeBSD.org/cgi/man.cgi?query=which&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__,
formerly a Perl script, has been reimplemented in C.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4 Contributed Software
~~~~~~~~~~~~~~~~~~~~~~~~

**BIND** has been updated from version 8.3.4 to version 8.3.7.

**OpenSSL** has been updated from version 0.9.7c to version 0.9.7d.

**sendmail** has been updated from version 8.12.9 to version 8.12.11.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5 Ports/Packages Collection Infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The SIZE attribute for distfiles, which can be used for checking file
sizes before fetching, has been added and enabled by default.
DISABLE\_SIZE is a user control knob to disable the distfile size
checking. This is especially useful on old FreeBSD versions which didn't
have
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+4.10-RELEASE>`__
support for this, and for some FTP proxies which always report incorrect
or bogus sizes.

Two new files have been added to the ports tree to track note-worthy
changes: ``ports/CHANGES`` lists major changes to the Ports Collection
and its infrastructure. ``ports/UPDATING`` describes some potential
pitfalls that can be encountered when updating certain ports, analogous
to ``src/UPDATING`` for the base system.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6 Release Engineering and Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The supported release of **GNOME** has been updated from 2.4 to 2.6.

.. raw:: html

   <div class="NOTE">

    **Note:** If you are using the older **GNOME** desktop itself
    (```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__),
    simply upgrading it from the FreeBSD Ports Collection with
    `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__
    (```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__)
    will cause serious problems. If you are a **GNOME** desktop user,
    please read the instructions carefully at
    http://www.FreeBSD.org/gnome/docs/faq26.html, and use the
    ``gnome_upgrade.sh`` script to properly upgrade to **GNOME** 2.6.

    Note that if you are just a casual user of some of the **GNOME**
    libraries,
    `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1&manpath=FreeBSD+Ports>`__
    should be sufficient to update your ports.

.. raw:: html

   </div>

The supported release of **KDE** has been updated from 3.1.4 to 3.2.2.

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
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.10-RELEASE>`__.
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
