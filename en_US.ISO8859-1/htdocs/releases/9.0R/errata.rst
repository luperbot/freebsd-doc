==========================
FreeBSD 9.0-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 9.0-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2012 The FreeBSD Documentation Project

| $FreeBSD: stable/9/release/doc/en\_US.ISO8859-1/errata/article.sgml
  230254 2012-01-17 02:49:23Z hrs $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

SPARC, SPARC64, SPARCengine, and UltraSPARC are trademarks of SPARC
International, Inc in the United States and other countries. SPARC
International, Inc owns all of the SPARC trademarks and under licensing
agreements allows the proper use of these trademarks by its members.

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

    This document lists errata items for FreeBSD 9.0-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 9.0-RELEASE will be maintained
    until the release of FreeBSD 9.1-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This errata document contains “late-breaking news” about FreeBSD
9.0-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the “current errata” for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 9.0-STABLE also contain
up-to-date copies of this document (as of the time of the snapshot).

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

Problems described in the following security advisories have been fixed
in 9.0-RELEASE. For more information, consult the individual advisories
available from http://security.FreeBSD.org/.

.. raw:: html

   <div class="INFORMALTABLE">

+----------------+----------------+---------------------------------------------+
| Advisory       | Date           | Topic                                       |
+================+================+=============================================+
| `SA-11:01.moun | 20 April 2011  | Network ACL mishandling in                  |
| td <http://sec |                | `mountd(8) <http://www.FreeBSD.org/cgi/man. |
| urity.freebsd. |                | cgi?query=mountd&sektion=8&manpath=FreeBSD+ |
| org/advisories |                | 9.0-RELEASE>`__                             |
| /FreeBSD-SA-11 |                |                                             |
| :01.mountd.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:02.bind | 28 May 2011    | BIND remote DoS with large RRSIG RRsets and |
|  <http://secur |                | negative caching                            |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-11:0 |                |                                             |
| 2.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:04.comp | 28 September 2 | Errors handling corrupt compress file in    |
| ress <http://s | 011            | `compress(1) <http://www.FreeBSD.org/cgi/ma |
| ecurity.freebs |                | n.cgi?query=compress&sektion=1&manpath=Free |
| d.org/advisori |                | BSD+9.0-RELEASE>`__                         |
| es/FreeBSD-SA- |                | and                                         |
| 11:04.compress |                | `gzip(1) <http://www.FreeBSD.org/cgi/man.cg |
| .asc>`__       |                | i?query=gzip&sektion=1&manpath=FreeBSD+9.0- |
|                |                | RELEASE>`__                                 |
+----------------+----------------+---------------------------------------------+
| `SA-11:05.unix | 28 September 2 | Buffer overflow in handling of UNIX socket  |
|  <http://secur | 011            | addresses                                   |
| ity.freebsd.or |                |                                             |
| g/advisories/F |                |                                             |
| reeBSD-SA-11:0 |                |                                             |
| 5.unix.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:06.bind | 23 December 20 | Remote packet Denial of Service against     |
|  <http://secur | 11             | `named(8) <http://www.FreeBSD.org/cgi/man.c |
| ity.freebsd.or |                | gi?query=named&sektion=8&manpath=FreeBSD+9. |
| g/advisories/F |                | 0-RELEASE>`__                               |
| reeBSD-SA-11:0 |                | servers                                     |
| 6.bind.asc>`__ |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:07.chro | 23 December 20 | Code execution via chrooted ftpd            |
| ot <http://sec | 11             |                                             |
| urity.freebsd. |                |                                             |
| org/advisories |                |                                             |
| /FreeBSD-SA-11 |                |                                             |
| :07.chroot.asc |                |                                             |
| >`__           |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:08.teln | 23 December 20 | telnetd code execution vulnerability        |
| etd <http://se | 11             |                                             |
| curity.freebsd |                |                                             |
| .org/advisorie |                |                                             |
| s/FreeBSD-SA-1 |                |                                             |
| 1:08.telnetd.a |                |                                             |
| sc>`__         |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:09.pam\ | 23 December 20 | pam\_ssh improperly grants access when user |
| _ssh <http://s | 11             | account has unencrypted SSH private keys    |
| ecurity.freebs |                |                                             |
| d.org/advisori |                |                                             |
| es/FreeBSD-SA- |                |                                             |
| 11:09.pam_ssh. |                |                                             |
| asc>`__        |                |                                             |
+----------------+----------------+---------------------------------------------+
| `SA-11:10.pam  | 23 December 20 | ``pam_start()`` does not validate service   |
| <http://securi | 11             | names                                       |
| ty.freebsd.org |                |                                             |
| /advisories/Fr |                |                                             |
| eeBSD-SA-11:10 |                |                                             |
| .pam.asc>`__   |                |                                             |
+----------------+----------------+---------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Open Issues
-------------

-  In some releases prior to 9.0-RELEASE, upgrading by using
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   can fail. This issue has been fixed by a change in Errata Notice
   EN-12:01. For more information, see
   http://security.freebsd.org/advisories/FreeBSD-EN-12:01.freebsd-update.asc

-  [amd64, i386] FreeBSD 9.0-RELEASE includes several changes to improve
   resource management of PCI devices. Some x86 machines may not boot or
   may have devices that no longer attach when using ACPI as a result of
   these changes. This can be worked around by setting a
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   tunable ``debug.acpi.disabled`` to ``hostres``. To do this, enter the
   following lines at the loader prompt:

   .. code:: SCREEN

       set debug.acpi.disabled="hostres"
       boot

   Or, put the following line into ``/boot/loader.conf``:

   .. code:: PROGRAMLISTING

       debug.acpi.disabled="hostres"

-  A
   `devctl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=devctl&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   event upon arrival of a
   `ugen(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ugen&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   device has been changed. The event now includes ``ugen`` and ``cdev``
   variables instead of ``device-name``. This change can prevent the
   following
   `devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   rule which worked in a previous releases from working:

   .. code:: PROGRAMLISTING

       attach 0 {
           match "device-name" "ugen[0-9]+.[0-9]+";
           action "/path/to/script /dev/$device-name";
       }

   This should be updated to the following:

   .. code:: PROGRAMLISTING

       attach 0 {
           match "subsystem" "DEVICE";
           match "type" "ATTACH";
           match "cdev" "ugen[0-9]+.[0-9]+";
           action "/path/to/script /dev/$cdev";
       }

-  The FreeBSD 9.0-RELEASE Release Notes should have mentioned that SSM
   (Source-Specific Multicast) MLDv2 now uses ``ALLOW_NEW_SOURCES`` and
   ``BLOCK_OLD_SOURCES`` record types to signal a join or a leave by
   default. This conforms RFC 4604, “Using Internet Group Management
   Protocol Version 3 (IGMPv3) and Multicast Listener Discovery Protocol
   Version 2 (MLDv2) for Source-Specific Multicast”. A new
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   variable ``net.inet6.mld.use_allow`` which controls the behavior has
   been added. The default value is ``1`` (use ``ALLOW_NEW_SOURCES`` and
   ``BLOCK_OLD_SOURCES``).

-  9.0-RELEASE fails to configure an interface specified in the
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+9.0-RELEASE>`__
   variable ``ipv6_prefix_IF`` when the interface does not have a
   corresponding ``ifconfig_IF_ipv6`` variable. This problem will be
   fixed in the future releases. To work around this problem on
   9.0-RELEASE, add an ``ifconfig_IF_ipv6`` line for each interface
   specified in ``ipv6_prefix_IF`` as the following:

   .. code:: PROGRAMLISTING

       ipv6_prefix_em0="2001:db8:1:0 2001:db8:2:0"
       ifconfig_em0_ipv6="inet6 auto_linklocal"

-  In 9.0-RELEASE the FreeBSD USB subsystem supports USB 3.0 by the
   `xhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xhci&sektion=4&manpath=FreeBSD+9.0-RELEASE>`__
   driver. However, a bug that could prevent it from working with a USB
   3.0 hub has been found and fixed after the release date. This means
   9.0-RELEASE and prior do not work with a USB 3.0 hub. This problem
   has been fixed in HEAD and will be merged into the 9-STABLE branch.

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
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 9.0-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
