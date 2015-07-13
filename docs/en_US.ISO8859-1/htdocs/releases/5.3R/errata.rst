==========================
FreeBSD 5.3-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.3-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003, 2004 The FreeBSD Documentation
Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.69.2.15 2004/11/22 17:20:42 hrs Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of The FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

AMD, Athlon, Opteron, and Geode are trademarks or registered trademarks
of Advanced Micro Devices, Inc. in the United States and other
countries.

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

    This document lists errata items for FreeBSD 5.3-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 5.3-RELEASE will be maintained
    until the release of FreeBSD 5.4-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains \`\`late-breaking news'' about FreeBSD
5.3-RELEASE. Before installing this version, it is important to consult
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

(1 Dec 2004) A bug in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.3-stable>`__
and
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+5.3-stable>`__
which could cause a malicious local user could perform a local denial of
service attack by causing a system panic, or the user could read parts
of kernel memory, has been fixed. For more information, see security
advisory
`FreeBSD-SA-04:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:17.procfs.asc>`__.

(18 Nov 2004) A bug in the
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+5.3-stable>`__
utility which allows a malicious HTTP server to cause arbitrary portions
of the client's memory to be overwritten, has been fixed. For more
information, see security advisory
`FreeBSD-SA-04:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:16.fetch.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

(31 Oct 2004) The
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.3-stable>`__
and
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-stable>`__
drivers may behave poorly under heavy load. In particular, there are
reports of
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-stable>`__
on the IBM ThinkPad T40 locking up under such conditions.

(31 Oct 2004) There are reports of the
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.3-stable>`__
driver locking up under heavy load, especially when ASUStek on-board
NICs are used. To clear the condition, bringing the interface down then
back up and/or rebooting the system may be needed.

(31 Oct 2004) The
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.3-stable>`__
utility is functional but may behave erratically on some systems.
Reported symptoms include that
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.3-stable>`__
can appear to hang and never complete while the operation actually does
complete, and the progress indicator does not show the correct value.
Workarounds include:

-  Eject and re-insert the media after burning a CD.

-  Press Ctrl-C when
   `burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.3-stable>`__
   appears to hang up while the access LED goes inactive.

(31 Oct 2004) When the user/group rule clauses in
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-stable>`__
and
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-stable>`__
are used, the loader tunable debug.mpsafenet must be set to 0 (this is 1
by default). For example, the following rules are affected:

for
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-stable>`__:

.. code:: PROGRAMLISTING

    count ip from any to 192.168.2.1 uid root

for
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-stable>`__:

.. code:: PROGRAMLISTING

    block log quick proto { tcp, udp } all user root

To set debug.mpsafenet to 0 on every boot, add the following line into
``/boot/loader.conf``:

.. code:: PROGRAMLISTING

    debug.mpsafenet=0

More specifically, the group and user filter parameters in
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-stable>`__,
and the gid, jail, and uid rule options in
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-stable>`__
are affected. If debug.mpsafenet is set to 1, the system can hang when
the rule is evaluated due to a lock order reversal with the socket
layer. More details can be found in the
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.3-stable>`__
and
`pf.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=pf.conf&sektion=5&manpath=FreeBSD+5.3-stable>`__
manual pages.

(31 Oct 2004, updated on 12 Nov 2004) The
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-stable>`__
subsystem works on 5.3, but it can cause a system panic at boot time. As
a workaround you can add vinum\_load="YES" to ``/boot/loader.conf``.

As an alternative you can also use the new
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-based
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-stable>`__
subsystem. To activate the
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-aware
vinum at boot time, add geom\_vinum\_load="YES" to ``/boot/loader.conf``
and remove start\_vinum="YES" in ``/etc/rc.conf`` if it exists.

While some uncommon configurations, such as multiple vinum drives on a
disk, are not supported, it is generally backward compatible. Note that
for the
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-aware
vinum, its new userland control program, ``gvinum``, should be used, and
it is not yet feature-complete.

(31 Oct 2004) The results of ``netstat -m`` can become incorrect on SMP
systems when debug.mpsafenet is set to 1 (default). This is an error in
the statistics gathering because of a race condition in the counters,
not an actual memory leak.

(31 Oct 2004, updated on 5 Nov 2004) For FreeBSD/i386 and FreeBSD/amd64,
when installing FreeBSD 5.3 using an USB keyboard the keyboard will stop
working once the kernel boots, because a PS/2 keyboard is always
considered to be attached. As a workaround, select \`\`Escape to loader
prompt'' in the boot loader menu and enter the following lines at the
prompt:

.. code:: SCREEN

    set hint.atkbd.0.flags="0x1"
    boot

Note that if you use the boot floppies, this is set by default.

After the installation, add the following line to ``/boot/loader.conf``:

.. code:: PROGRAMLISTING

    hint.atkbd.0.flags="0x1"

(1 Nov 2004) The ULE scheduler described in the release notes has been
completely disabled to discourage its use because it has stability
problems.

(1 Nov 2004) Programs linked with **libpthread** may not report any CPU
usage statistics according to
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.3-stable>`__,
while those linked with **libthr** show the correct statistics.

(1 Nov 2004) ATA RAID support for the CMD649 and SiI0680 ATA controllers
is non-functional in this release. When such a controller is brough up
under
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-stable>`__
(ataraid) on 5.3, the RAID configuration stored under 5.2 or prior may
be corrupted.

(3 Nov 2004) For FreeBSD/i386 and FreeBSD/amd64, SMP support in the
``GENERIC`` kernel has been disabled by default because the SMP kernel
can degrade the performance on UP machines. A kernel configuration file
``SMP``, which can be used to enable SMP support, has been added. More
details on building the custom kernel can be found at
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/kernelconfig.html.

(4 Nov 2004) The
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.3-stable>`__
utility (also known as
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+5.3-stable>`__)
does not detect the end of media such as tape and floppy disk properly
when it is specified with the -f option. As an alternative
`gtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gtar&sektion=1&manpath=FreeBSD+5.3-stable>`__
(**GNU tar**) can be used.

(9 Nov 2004) The
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-aware
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-stable>`__
subsystem does not work for RAID5 volumes on machines with a single
processor. The configurations other than RAID5 (such as RAID1) should
work correctly. This problem has been fixed on the RELENG\_5 branch.

(9 Nov 2004) The FreeBSD 5.3-RELEASE Migration Guide should have stated
that ``/usr/sbin/nslookup`` and ``/usr/sbin/nsupdate`` included in
**BIND 8** have to be removed during the source-based upgrade procedure.

(9 Nov 2004) The FreeBSD 5.3-RELEASE Release Notes should have stated
that
```net/mpd`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/mpd/pkg-descr>`__
which was compiled on the old systems prior to 5.3-RELEASE must be
recompiled.

(10 Nov 2004) The FreeBSD 5.3-RELEASE Release Notes should have stated
explicitly that ports/packages which were built on the old systems prior
to 5.3-RELEASE and linked with the old POSIX thread libraries
(**libc\_r** or **libkse**) can cause an error \`\`Spinlock called when
not threaded.'' at run time. This happens when the program is linked
with multiple different threading libraries (typically the older ports
will be linked with **libc\_r**, while newer ports will be linked with
**libpthread**). Either recompile the ports/packages or add the
necessary lines to ``/etc/libmap.conf``. More details can be found in
``/usr/src/UPDATING`` (20040303 and 20040130).

(12 Nov 2004) The
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-stable>`__
driver behaves incorrectly when the VLAN support and promiscuous mode
are enabled at the same time. A fix is being tested and will be merged
to the 5.3 errata branch.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News
--------------------

No news.

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

All users of FreeBSD 5-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
