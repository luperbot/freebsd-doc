===================================
FreeBSD 5.3-RELEASE Migration Guide
===================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.3-RELEASE Migration Guide
===================================

.. raw:: html

   <div class="AUTHORGROUP">

The FreeBSD Release Engineering Team
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

Copyright © 2002, 2003, 2004 The FreeBSD Release Engineering Team

| $FreeBSD:
  src/release/doc/en\_US.ISO8859-1/early-adopter/article.sgml,v 1.21.2.4
  2004/10/06 05:55:51 bmah Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of Wind River Systems, Inc. This is
expected to change soon.

Apple, FireWire, Mac, Macintosh, Mac OS, Quicktime, and TrueType are
trademarks of Apple Computer, Inc., registered in the United States and
other countries.

IBM, AIX, EtherJet, Netfinity, OS/2, PowerPC, PS/2, S/390, and ThinkPad
are trademarks of International Business Machines Corporation in the
United States, other countries, or both.

IEEE, POSIX, and 802 are registered trademarks of Institute of
Electrical and Electronics Engineers, Inc. in the United States.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

AMD, Athlon, Opteron, and Geode are trademarks or registered trademarks
of Advanced Micro Devices, Inc. in the United States and other
countries.

Microsoft, IntelliMouse, MS-DOS, Outlook, Windows, Windows Media and
Windows NT are either registered trademarks or trademarks of Microsoft
Corporation in the United States and/or other countries.

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

This article describes major differences between FreeBSD 4.X and FreeBSD
5.3-RELEASE, from the viewpoint of a user or administrator upgrading an
existing system. It provides a brief overview of FreeBSD release
engineering. It then describes some of the new features in FreeBSD 5.X,
as well as some changes that might be of particular interest to users
accustomed to working with the 4.X series of releases. This article also
describes binary- and source-based upgrading procedures for existing
systems. An earlier version of this article appeared in prior FreeBSD
5.X releases as the \`\`Early Adopters Guide''.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1 Introduction
--------------

FreeBSD 5.3-RELEASE marks the beginning of a new \`\`FreeBSD-STABLE''
series of releases. This and future releases in the 5.X series will be
targeted toward production usage in much the same way as the prior 4.X
series of releases.

This article addresses a number of topics and issues of interest to
users updating from a 4.X release to 5.3-RELEASE. It begins with a brief
overview of current release engineering practices and then describes
some of the new features available with the FreeBSD 5.X series. Perhaps
the most important section lists issues where major changes have taken
place, user-visible behavior has changed, or external software
interfaces have been modified. Last are some notes on upgrading existing
FreeBSD 4.X systems to FreeBSD 5.3-RELEASE, from binaries or from
source.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 An Overview of the FreeBSD Release Process
--------------------------------------------

FreeBSD employs a development model relying on multiple branches within
the source code repository. The main branch is called \`\`CURRENT'', and
is referred to in the CVS repository with the HEAD tag. New features are
committed first to this branch; although CURRENT is the first to see new
functionality, it also occasionally suffers from breakages as new
features are added and debugged.

Most FreeBSD releases are made from one of several \`\`STABLE''
branches. Features are added to these branches only after some amount of
testing in CURRENT. For the past two years, the only STABLE branch under
active development was known as \`\`4-STABLE'', and all of the FreeBSD
4.X releases were based on it. This branch has the tag RELENG\_4 in the
CVS repository.

The past two stable branches (3-STABLE and 4-STABLE) were created very
early in their development cycles (their branchpoints were 3.1 and 4.0,
respectively). In hindsight, this practice did not give sufficient time
for either CURRENT to stabilize before the new branches were created.
This in turn resulted in wasted effort porting bug fixes between
branches, as well as creating some architectural changes that could not
be ported between branches at all.

The 5.X releases have been handled slightly differently. FreeBSD 5.0,
5.1, and 5.2 were based on the CURRENT branch. The first of these
releases was made after over two years of development (prior to these,
the last release from HEAD was FreeBSD 4.0, in March 2000).

Unlike prior \`\`STABLE'' branches, the \`\`5-STABLE'' branch in CVS
(with the branch tag RELENG\_5) was created more than a year after the
first 5.X release (specifically, during the 5.3 release cycle). This
delay gave time for the development team to complete needed
architectural changes, stabilize the system, finalize various
interfaces, and create a good starting point for the remaining 5.X
releases.

Aside from general improvements and bug fixes, a major priority for
development on the 5-STABLE branch is the preservation of Application
Binary Interface (ABI) and Application Program Interface (API)
compatibility. Any changes that could break backward compatibility
(including kernel or library interfaces) are strongly discouraged, and
will not be permitted except as a last-resort solution to a critical
problem.

The next release from CURRENT will likely be 6.0-RELEASE, created from
CVS HEAD. There is no firm date for 6.0, as of the 5.3 release date,
although it is expected sometime in 2006.

A limited amount of development will continue on the 4-STABLE
development branch, with at least one more release (4.11) planned at
some point after 5.3-RELEASE. For especially conservative users, it may
be reasonable to continue using the 4.X releases for a time. The
Security Officer Team ``<security-officer@FreeBSD.org>`` will continue
to support releases made from the 4-STABLE branch in accordance with
their published policies, which can be found on the `Security
page <http://www.FreeBSD.org/security/index.html>`__ on the FreeBSD web
site.

More information on FreeBSD release engineering processes can be found
on the `Release Engineering Web
pages <http://www.FreeBSD.org/releng/index.html>`__ and in the
`\`\`FreeBSD Release
Engineering'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/releng/index.html>`__
article.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 New Features
--------------

A major attraction of FreeBSD 5.X is a number of new features, generally
involving large architectural changes that were not feasible to port
back to the FreeBSD 4-STABLE development branch. (By contrast, many
self-contained enhancements, such as new device drivers or updates to
userland utilities, have already been ported.) A brief, but not
exhaustive list includes:

-  SMPng: The \`\`next generation'' support for Symmetric MultiProcessor
   (SMP) machines. Ongoing work aims to perform fine-grained locking of
   various kernel subsystems to increase the number of threads of
   execution that can be running in the kernel. Particular attention has
   been paid to the performance of the network stack.

-  KSE: Kernel Scheduled Entities allow a single process to have
   multiple kernel-level threads, similar to Scheduler Activations. The
   ``libpthread`` and ``libthr`` threading libraries make this feature
   available to multi-threaded userland programs, using the
   `pthread(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pthread&sektion=3&manpath=FreeBSD+5.3-RELEASE>`__
   API. ``libpthread`` is now the default threading library.

-  New architectures: Support for the amd64, ia64, pc98, and sparc64
   architectures, in addition to the i386 and alpha. Other platforms
   under development include powerpc (which runs on many PowerPC®-based
   Macintosh® platforms) and arm.

-  GCC: The compiler toolchain is now based on GCC 3.4.X, rather than
   GCC 2.95.X.

-  MAC: Support for extensible, loadable Mandatory Access Control
   policies.

-  GEOM: A flexible, modular framework for transformation of disk I/O
   requests. This system supports a number of features related to disks
   and volumes, such as: recognition of disk partitions, the
   `gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
   disk encryption facility, various levels of RAID functionality,
   network export of disk devices (with
   `ggated(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggated&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   and related utilities), and transparent disk decompression.

-  FFS: The FFS file system now supports background
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   operations (for faster crash recovery) and file system snapshots.

-  UFS2: A new UFS2 on-disk format has been added, which supports
   extended per-file attributes and larger file sizes. UFS2 is now the
   default format for
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.
   On all platforms except pc98, file systems created from within
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   will use UFS2 by default.

-  New networking features: A number of new networking features have
   made their debut in 5.X releases, including support for TCP SACK
   (selective acknowledgements), the
   `pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
   packet filter from OpenBSD, and the ALTQ packet queueing system.

-  New hardware support: Support for more hardware devices, such as
   Cardbus, Bluetooth devices, and IEEE 802.11a/b/g network interfaces
   based on Atheros chipsets. Also, on the i386 architecture, some
   network devices not explicitly supported by FreeBSD drivers may be
   supported using vendor drivers for Microsoft® Windows® and the
   `ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4&manpath=FreeBSD+5.3-RELEASE>`__
   compatibility layer.

A more comprehensive list of new features can be found in the release
notes for the various FreeBSD 5.X releases.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Notable Changes
-----------------

Some of the differences between FreeBSD 4.X and 5.X deserve special
mention because they involve major architectural changes, or break
backwards compatibility in some way. While these changes are unlikely to
cause a loss of data, they could cause some confusion for the unwary.
Some notable examples are:

-  Several parts of FreeBSD's base system functionality have been moved
   to the FreeBSD Ports Collection, usually because they are easier to
   maintain in that form or because they were not really essential parts
   of the system. The most noticeable example of this is **Perl**
   (available in the FreeBSD Ports Collection as
   ```lang/perl5.8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/lang/perl5.8/pkg-descr>`__),
   whose former location in the base system made upgrades problematic.
   Utilities in the base system that formerly relied on **Perl** have
   been either rewritten (if still applicable) or removed (if obsolete).

   Other examples include **UUCP** (available in the Ports Collection as
   ```net/freebsd-uucp`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/freebsd-uucp/pkg-descr>`__),
   the ``doscmd`` utility
   (```emulators/doscmd`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/doscmd/pkg-descr>`__),
   and many of the traditional games
   (```games/freebsd-games`` <http://www.FreeBSD.org/cgi/url.cgi?ports/games/freebsd-games/pkg-descr>`__).

-  Changes in kernel data structures and ABIs/APIs meant many
   third-party binary device drivers had to be modified before they
   would work correctly under FreeBSD 5.X. In some (hopefully rare)
   cases, user-visible data structures have changed, requiring
   recompilation of applications or reinstallation of ports/packages. As
   with the 4.X series, the FreeBSD development team has the goal of not
   allowing incompatible changes in future releases on the 5.X branch.

-  A shortage of users and maintainers caused some parts of the FreeBSD
   base system to fall into disrepair. These have been removed. Examples
   include the generation of ``a.out``-style executables,
   `[1] <#FTN.AEN159>`__ XNS networking support, and the X-10 controller
   driver. A number of other drivers for old ISA-based devices have been
   discovered to be non-working and have been removed. More details are
   given in the release notes.

-  On FreeBSD/i386 4.X, the configuration of ISA devices was initially
   specified in the kernel configuration. These could be modified at
   boot-time with an interactive **UserConfig** utility. On FreeBSD 5.X,
   both of these mechanisms have been replaced by the
   `device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
   mechanism, which eliminates the need to hard-code ISA configuration
   parameters in the kernel. Boot-time ISA configuration is no longer
   menu-driven, but is performed by entering new parameters to the boot
   loader command line prompt.

-  ``MAKEDEV`` is no longer available, nor is it required. FreeBSD 5.X
   uses a device file system, which automatically creates device nodes
   on demand. Configuration of the entries in the device filesystem can
   be performed with the
   `devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   utility or with the ``/etc/devfs.conf`` mechanism. More information
   can be found in the
   `devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
   manual page.

-  UFS2 is the default on-disk format for file systems created using
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.
   For all platforms except pc98, it is also the default for file
   systems created using the disk labeling screen within
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.
   Because FreeBSD 4.X only understands UFS1 (not UFS2), disk partitions
   that must be accessed by both 5.X and 4.X must be created with UFS1.
   This can be specified using the -O1 option to
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
   or on the disk labeling screen in
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__.
   This situation most often arises with a a single machine that
   dual-boots FreeBSD 4.X and FreeBSD 5.X. Note that there is no way to
   convert file systems between the two on-disk formats (other than
   backing up, re-creating the file system, and restoring).

-  Due to the upgraded **GCC** compiler, C++ programs generally need to
   be recompiled and reinstalled. This requirement comes from changes in
   the C++ ABI.

-  Running executables compiled for FreeBSD 4.X may be possible with the
   aid of the ``compat4x`` distribution (or the equivalent
   ```misc/compat4x`` <http://www.FreeBSD.org/cgi/url.cgi?ports/misc/compat4x/pkg-descr>`__
   package/port). However, if any of the ports or packages on a system
   require upgrading, rebuilding and reinstalling *all* of the installed
   ports on a system is generally advised. This will prevent problems
   that can occur with programs being linked against some combination of
   old and new libraries. The
   ```sysutils/portupgrade`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/portupgrade/pkg-descr>`__
   utility may be helpful in reinstalling ports.

   Note that in any case, there are a number of known instances of
   backward incompatibility. For example, the
   ```devel/gnomevfs2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs2/pkg-descr>`__,
   ```mail/postfix`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/postfix/pkg-descr>`__,
   and
   ```security/cfs`` <http://www.FreeBSD.org/cgi/url.cgi?ports/security/cfs/pkg-descr>`__
   ports need to be recompiled due to changes in the statfs structure.

-  The ``host.conf`` resolver services configuration file has been
   replaced by the (much more general)
   `nsswitch.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=nsswitch.conf&sektion=5&manpath=FreeBSD+5.3-RELEASE>`__
   name-service switch configuration mechanism.

-  **BIND** has been updated from version 8 to version 9. There are
   numerous differences between BIND 8 and 9. Users with critical
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   installations should read the migration documentation in
   ``/usr/share/doc/bind9/misc/migration``. There is also a new
   instruction manual in ``/usr/share/doc/bind9/arm``. On systems that
   run
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
   it now runs by default in a
   `chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   environment in ``/var/named``. Users with existing
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   configurations in ``/var/named`` should back up the contents of this
   directory before upgrading to avoid them being overwritten by the
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   startup script.

-  The **Xorg** implementation of the X Window System is the default for
   FreeBSD 5.X beginning with 5.3-RELEASE. As of this writing,
   **XFree86™** remains the default for FreeBSD 4.X. More information on
   the differences between these versions, as well as upgrade
   information for existing systems, can be found in the `X Window
   System <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/x11.html>`__
   chapter in the FreeBSD Handbook.

-  Documentation (such as the FreeBSD
   `Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/index.html>`__
   and
   `FAQ <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/faq/index.html>`__)
   is still being updated to reflect changes recently made to FreeBSD
   5.X.

More information can be found in the release notes for the various
FreeBSD 5.X releases, as well as the ``src/UPDATING`` file in the
FreeBSD source tree. Notable changes to the FreeBSD Ports Collection are
listed in the ``ports/UPDATING`` and ``ports/CHANGES`` files in the
ports tree.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

5 Notes on Upgrading from FreeBSD 4.X
-------------------------------------

For those users with existing FreeBSD systems, this section offers a few
notes on upgrading a FreeBSD 4.X system to 5.X. As with any FreeBSD
upgrade, it is crucial to read the release notes and the errata for the
version in question, as well as ``src/UPDATING`` in the case of source
upgrades.

.. raw:: html

   <div class="SECT2">

--------------

5.1 Binary Upgrades
~~~~~~~~~~~~~~~~~~~

Probably the most straightforward approach is that of \`\`backup
everything, reformat, reinstall, and restore user data''. This
eliminates problems of incompatible or obsolete executables and
configuration files polluting the new system. It allows new file systems
to be created to take advantage of new functionality (most notably, the
UFS2 defaults).

As of this writing, the binary upgrade option in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
has not been well-tested for cross-major-version upgrades. Use of this
feature is not recommended.

Several changes may be of interest to those users accustomed to the
FreeBSD 4.X boot media. Installation floppies (on platforms that support
them, such as i386), are organized somewhat differently than on prior
releases. On 4.X releases, the floppy set contained a stripped-down
kernel with just enough functionality to install the system. This
arrangement allowed the kernel to fit on a single floppy disk, but it
lacked the device drivers required by certain hardware configurations.
Beginning with FreeBSD 5.3-RELEASE, the installation floppies contain a
standard GENERIC kernel segmented across multiple disks, with a much
more complete set of drivers and features. The boot loader prompts for
the insertion of additional disks as required. Users downloading floppy
images (perhaps to perform a network-based installation) should note
that the floppy disk set now includes three disks: ``boot.flp``,
``kern1.flp``, and ``kern2.flp``.

The installation CDROMs for the i386 architecture now use a
\`\`no-emulation'' boot loader. This allows, among other things, the use
of a GENERIC kernel, rather than the stripped-down kernels used on the
floppy images in previous versions. Generally, any system capable of
booting the Microsoft Windows NT® 4, Windows 2000, or Windows XP
installation CDROMs should be able to boot the FreeBSD 5.X CDROMs.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

5.2 Source Upgrades
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="NOTE">

    **Note:** Many users and developers have found it easier to backup
    all their data and configuration files (a wise precaution in any
    case), perform a binary installation (such as from CDROM), and
    restore their data. Compared to a source upgrade, the binary upgrade
    removes the need to deal with leftover files and programs on the
    disk, and allows the system to take advantage of new file system
    features such as the UFS2 file system layout.

    Users unfamiliar with the buildworld/installworld procedures for
    updating FreeBSD from source should *not* attempt a source upgrade,
    but should instead perform a binary installation after backing up
    all data.

.. raw:: html

   </div>

A source-based upgrade procedure builds and installs a set of binaries
compiled from source on the local machine. It is based on the
buildworld/installworld procedure often used by advanced FreeBSD users
to track changes along a development branch (such as FreeBSD-STABLE or
FreeBSD-CURRENT). In general, this procedure involves more effort than
the binary upgrade procedure, but may be useful when a system's
configuration files are complex or have been highly customized. A source
upgrade can also be useful for a remote system where an administrator
has remote console access but no physical access (and therefore cannot
insert installation media).

Reading ``src/UPDATING`` is absolutely essential. The section entitled
\`\`To upgrade in-place from 4.x-stable to current'' contains a
step-by-step update procedure, which must be followed exactly, without
making use of the \`\`shortcuts'' that some users occasionally employ.
An annotated list of these steps is presented below:

#. Make backups.

   The importance of this step cannot be overstated. It is important to
   make backups of all user data and configuration files. Level zero
   dumps with
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   are an excellent way to do this, although there are of course many
   workable alternatives.

#. Ensure that there is about 30MB of free disk space on the ``/`` file
   system.

   FreeBSD 5.X uses more space than FreeBSD 4.X. If the ``/tmp``
   directory resides on the ``/`` file system (as is frequently the
   case), deleting all of the content from this directory may help to
   free up needed space.

#. Fix ``/etc/fstab`` if required.

   This item probably only affects older FreeBSD/i386 systems. On
   systems that use MBR-style disk slices, FreeBSD used to support
   \`\`compatibility slices'', where disk partition names could take the
   form ``/dev/ad0a`` (without specifying a slice name explicitly).
   These are no longer supported; disk partitions must be named
   according to the form ``/dev/ad0s1a``. In other words, disk
   partitions must now completely specify a disk device, a slice number,
   and a partition letter.

   Note that \`\`compatibility slices'' have generally not been used by
   default since FreeBSD 2.2.6-RELEASE. This item does not apply to
   FreeBSD/alpha at all, or to systems using \`\`dangerously dediated''
   mode.

#. Using
   `cvs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvs&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
   or other means, obtain a copy of the FreeBSD base system sources (the
   ``src/`` module). To check out 5.3-RELEASE from the FreeBSD CVS
   repository, use the RELENG\_5\_3\_0\_RELEASE tag. For the 5.3 release
   and security fix branch, use the RELENG\_5\_3 tag. To track the
   FreeBSD 5-STABLE development branch, use the RELENG\_5 branch tag.
   When using CVS to check out the source tree, it is important to pass
   the -P flag to CVS so that it prunes away empty directories.

#. FreeBSD 5.X requires some new entries in the system password and
   group files, corresponding to various system services. They should be
   installed by running:

   .. code:: SCREEN

       # mergemaster -p

   This step must be performed to give some new files the correct
   usernames and groupnames.

   Note that in FreeBSD 5.X, the location of the
   `nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   utility has moved from ``/sbin/nologin`` to ``/usr/sbin/nologin``.
   Because a number of pseudo-users have
   `nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   as their login shell, this change generates additional differences in
   ``/etc/passwd``.

#. Build the new userland using:

   .. code:: SCREEN

       # cd /usr/src
       # make buildworld

   If CPUTYPE is defined in ``/etc/make.conf``, it should be defined
   using the ?= operator, so the buildworld process can override this
   variable if necessary.

   Note that the MAKEOBJDIRPREFIX must *not* be defined in
   ``/etc/make.conf``.

   In general, most of the build \`\`knobs'' defined in
   ``/etc/make.conf`` should be commented out or removed. This statement
   especially applies to those that directly affect the build or basic
   operation of FreeBSD, such as NO\_TOOLCHAIN.

#. Build and install a new kernel using:

   .. code:: SCREEN

       # make buildkernel

   Note that the buildkernel
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+5.3-RELEASE>`__
   target must be used in order to ensure that the resulting kernel is
   compiled with the toolchain built in the buildworld step above.
   Manually using
   `config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   to set up a kernel build area and attempting to build a kernel will
   not work.

   Although building (and later installing) a custom kernel at this
   point is feasible, upgrading using the GENERIC kernel and installing
   a custom kernel configuration later may be less error-prone. When
   trying to build a custom kernel for the first time, using the GENERIC
   kernel from FreeBSD 5.X as a template is highly recommended, due to
   the number of device and options that have been added or changed
   since 4.X. In any case, including the COMPAT\_FREEBSD4 kernel
   configuration option is crucial for a successful upgrade.

#. Set up a device hints file for ISA devices with a variant of the
   following command. Substitute the appropriate architecture name (e.g.
   i386) for MACHINE.

   .. code:: SCREEN

       # cp sys/MACHINE/conf/GENERIC.hints /boot/device.hints

   While an empty device hint file may be sufficient for modern
   hardware, ISA hints are needed for systems with custom ISA non-PNP
   cards (with custom hints being needed), for non-PNPBIOS systems, or
   for floppy disks to work correctly on PNPBIOS systems.

#. Install the new kernel with:

   .. code:: SCREEN

       # make installkernel

   Note that while the FreeBSD 4.X kernel installs to ``/kernel`` by
   default, the FreeBSD 5.X kernel installs to ``/boot/kernel/kernel``.
   Kernel modules under 4.X normally install to the ``/modules``
   directory, whereas under 5.X they install to ``/boot/kernel``.

#. Install the FreeBSD 5.X boot loader with:

   .. code:: SCREEN

       # cd /usr/src/sys/boot
       # make STRIP="" install

   This step, though optional, is highly recommended.

#. Disable third-party modules (such as those for VMware) to prevent
   crashes caused by changes in kernel ABIs or other incompatibilities.

#. Reboot to single-user mode. Rebooting at this point is absolutely
   required because the new kernel must be running to install the new
   userland. Being in single-user mode will drastically decrease the
   potential for unexpected things to happen during the upgrade because
   there will be no other programs running.

#. Mount the required file systems using:

   .. code:: SCREEN

       # fsck -p
       # mount -uw /
       # mount -at ufs

   Note that the
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   invocation is necessary to update certain fields in the file system
   superblocks for FreeBSD 5.X. If the system clock tracks local time
   rather than UTC time, also perform:

   .. code:: SCREEN

       # adjkerntz -i

   During this step, the following warning message may appear on the
   console (numerous times).

   .. code:: SCREEN

       WARNING: userland calling deprecated sysctl, please rebuild world

   This message can be safely ignored.

#. Delete the C++ header files with:

   .. code:: SCREEN

       # rm -rf /usr/include/g++

   This step keeps future compilations from accidentally picking up old
   header files from the **GCC** 2.95 C++ compiler.

#. Install the new userland utilities with:

   .. code:: SCREEN

       # cd /usr/src
       # make installworld

#. On systems running
   `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
   its configuration files need to be moved into a
   `chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__
   area in ``/var/named``. If any files exist in ``/var/named``, they
   should be backed up at this point.

   .. code:: SCREEN

       # cd /etc
       # mv named named.bak
       # mkdir -p /var/named/etc/namedb
       # cp -Rp named.bak/* /var/named/etc/namedb

   If the configuration uses the generated ``localhost`` files, the
   following steps may be needed to regenerate them:

   .. code:: SCREEN

       # cd /var/named/etc/namedb
       # /bin/sh make-localhost
       # rm -f localhost-v6.rev localhost.rev

#. Update the system configuration files by running:

   .. code:: SCREEN

       # mergemaster -i

   This step is non-optional. It is required to make the startup and
   configuration files in ``/etc`` consistent with the new kernel and
   world.

   After invoking
   `mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+5.3-RELEASE>`__,
   it is a good idea to inspect (and possibly modify) ``/etc/rc.conf``.
   A number of default values for the variables defined in this file
   have changed; in particular, some services that were enabled by
   default in 4.X are now disabled by default in 5.X.

#. Remove leftover **BIND 8** files:

   .. code:: SCREEN

       # rm /usr/bin/dnskeygen /usr/bin/dnsquery
       # rm /usr/libexec/named-xfer
       # rm /usr/sbin/named.restart /usr/sbin/ndc
       # rm /usr/sbin/nslookup /usr/sbin/nsupdate

#. Reboot.

After upgrading the base system, upgrades to some non-base-system
components are generally needed to restore normal functionality.
**Perl** is no longer a part of the base system and should be installed
from the Ports Collection (specifically, the
```lang/perl5.8`` <http://www.FreeBSD.org/cgi/url.cgi?ports/lang/perl5.8/pkg-descr>`__
port) or from a package. After this installation, all ports and/or
packages depending on **Perl** need to be reinstalled.

Running FreeBSD 4.X binaries requires a set of compatability libraries.
These are available by installing the
```misc/compat4x`` <http://www.FreeBSD.org/cgi/url.cgi?ports/misc/compat4x/pkg-descr>`__
package/port.

As mentioned in a prior section, **Xorg** is the default implementation
of the X Window System. The Ports Collection (as well as packages) rely
on this change to satisfy dependencies. To convert the installed
windowing system from **XFree86** to **Xorg**, refer to the `Installing
X11 <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/x-install.html>`__
section in the FreeBSD Handbook.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

6 Summary
---------

This article presents some of the more notable new features in FreeBSD
5.X, and lists some areas of particular concern to those users upgrading
existing FreeBSD 4.X systems. It also presents two sets of upgrade
instructions, one using binaries from installation media and one based
on recompiling the base system from source code.

.. raw:: html

   </div>

.. raw:: html

   </div>

Notes
~~~~~

+--------------------------------------+--------------------------------------+
| `[1] <#AEN159>`__                    | Note that execution of ``a.out``     |
|                                      | executables on the i386 and pc98 is  |
|                                      | still supported with the             |
|                                      | COMPAT\_AOUT kernel option. Some of  |
|                                      | the compilers in the Ports           |
|                                      | Collection (for example,             |
|                                      | ```lang/gcc28`` <http://www.FreeBSD. |
|                                      | org/cgi/url.cgi?ports/lang/gcc28/pkg |
|                                      | -descr>`__)                          |
|                                      | are still capable of generating      |
|                                      | ``a.out`` format executables.        |
+--------------------------------------+--------------------------------------+

--------------

This file, and other release-related documents, can be downloaded from
ftp://ftp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
