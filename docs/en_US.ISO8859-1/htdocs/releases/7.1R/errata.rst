==========================
FreeBSD 7.1-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 7.1-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2008, 2009 The FreeBSD Documentation Project

| $FreeBSD: stable/7/release/doc/en\_US.ISO8859-1/errata/article.sgml
  186782 2009-01-05 15:38:45Z hrs $

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

    This document lists errata items for FreeBSD 7.1-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 7.1-RELEASE will be maintained
    until the release of FreeBSD 7.2-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
7.1-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 7-STABLE also contain up-to-date
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

No advisories.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

[20090105] As in the Announcement of 7.1-RELEASE, certain Intel NICs
will come up as
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+7.1-stable>`__
instead of
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.1-stable>`__
in this release. There are only 3 PCI ID's that should have their name
changed from
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+7.1-stable>`__
to
`igb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=igb&sektion=4&manpath=FreeBSD+7.1-stable>`__:

-  0x10A78086

-  0x10A98086

-  0x10D68086

You should be able to determine if your card will change names by
running the following command:

.. code:: SCREEN

    % pciconf -l
    . . .
    em0@pci0:0:25:0: class=0x020000 card=0x02381028 chip=0x10c08086 rev=0x02 hdr=0x00

and for the line representing your NIC (should be named *em* on older
systems, e.g. *em0* or *em1*, etc) check the fourth column. If that says
``chip=0x10a78086`` (or one of the other two IDs given above) you will
have the adapter's name change.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Late-Breaking News and Corrections
------------------------------------

[20090105] The Release Notes for 7.1-RELEASE should have mentioned that
the
`procstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=procstat&sektion=1&manpath=FreeBSD+7.1-stable>`__
utility has been added. This is a process inspection utility which
provides both some of the missing functionality from
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+7.1-stable>`__
and new functionality for monitoring and debugging specific processes.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned
changes that the
`ae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ae&sektion=4&manpath=FreeBSD+7.1-stable>`__
driver has been added to provide support for the Attansic/Atheros L2
FastEthernet controllers. This driver is not enabled in ``GENERIC``
kernels for this release.

[20090105] The Release Notes for 7.1-RELEASE included the following
misdescriptions:

-  In the entry of
   `linux(4) <http://www.FreeBSD.org/cgi/man.cgi?query=linux&sektion=4&manpath=FreeBSD+7.1-stable>`__
   ABI support, ``get_setaffinity()`` should have been
   ``sched_setaffinity()``.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned
changes that the
`jme(4) <http://www.FreeBSD.org/cgi/man.cgi?query=jme&sektion=4&manpath=FreeBSD+7.1-stable>`__
driver has been added to provide support for PCIe adapters based on
JMicron JMC250 gigabit Ethernet and JMC260 fast Ethernet controllers.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned
changes that the
`age(4) <http://www.FreeBSD.org/cgi/man.cgi?query=age&sektion=4&manpath=FreeBSD+7.1-stable>`__
driver has been added to provide support for Attansic/Atheros L1 gigabit
Ethernet controller.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned
changes that the
`malo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=malo&sektion=4&manpath=FreeBSD+7.1-stable>`__
driver has been added to provide support for Marvell Libertas 88W8335
based PCI network adapters.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned
changes that the bm(4) driver has been added to provide support for
Apple Big Mac (BMAC) Ethernet controller, found on various Apple G3
models.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned
changes that the et(4) driver has been added to provide support for
Agere ET1310 10/100/Gigabit Ethernet controller.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned
changes that the
`glxsb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=glxsb&sektion=4&manpath=FreeBSD+7.1-stable>`__
driver has been added to provide support for the Security Block in AMD
Geode LX processors.

[20090105] The Release Notes for 7.1-RELEASE should have mentioned that
FreeBSD now supports multiple routing tables. To enable this, the
following steps are needed:

-  Add the following kernel configuration option and rebuild the kernel.
   The ``2`` is the number of FIB (Forward Information Base, synonym for
   a routing table here). The maximum value is 16.

   .. code:: PROGRAMLISTING

       options    ROUTETABLES=2

   The procedure for rebuilding the FreeBSD kernel is described in the
   `FreeBSD
   Handbook <http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html#AEN30408>`__.

   This number can be modified on boot time. To do so, add the following
   to ``/boot/loader.conf`` and reboot the system:

   .. code:: PROGRAMLISTING

       net.fibs=6

-  Set a loader tunable ``net.my_fibnum`` if needed. This means the
   default number of routing tables. If not specified, ``0`` will be
   used.

-  Set a loader tunable ``net.add_addr_allfibs`` if needed. This enables
   to add routes to all FIBs for new interfaces by default. When this is
   set to ``0``, it will only allocate routes on interface changes for
   the FIB of the caller when adding a new set of addresses to an
   interface. Note that this tunable is set to ``1`` by default.

To select one of the FIBs, the new
`setfib(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfib&sektion=1&manpath=FreeBSD+7.1-stable>`__
utility can be used. This set an associated FIB with the process. For
example:

.. code:: SCREEN

    # setfib -3 ping target.example.com

The FIB #3 will be used for the
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8&manpath=FreeBSD+7.1-stable>`__
command.

The FIB which the packet will be associated with will be determined in
the following rules:

-  All packets which have a FIB associated with them will use the FIB.
   If not, FIB #0 will be used.

-  A packet received on an interface for forwarding uses FIB #0.

-  A TCP listen socket associated with an FIB will generate accept
   sockets which are associated with the same FIB.

-  A packet generated in response to other packet uses the FIB
   associated with the packet being responded to.

-  A packet generated on tunnel interfaces such as
   `gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4&manpath=FreeBSD+7.1-stable>`__
   and
   `tun(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tun&sektion=4&manpath=FreeBSD+7.1-stable>`__
   will be encapsulated using the FIB of the process which set up the
   tunnel.

-  Routing messages will be associated with the process's FIB.

Also, the
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+7.1-stable>`__
now supports an action rule ``setfib``. The following action:

.. code:: PROGRAMLISTING

    setfib fibnum

will make the matched packet use the FIB specified in ``fibnum``. The
rule processing continues at the next rule.

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

All users of FreeBSD 7-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
