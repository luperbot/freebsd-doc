===========================
FreeBSD 10.0-RELEASE README
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

Copyright ? 2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

Motif, OSF/1, and UNIX are registered trademarks and IT DialTone and The
Open Group are trademarks of The Open Group in the United States and
other countries.

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

Last modified on 2014-01-14 by hrs.

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

This document gives a brief introduction to FreeBSD 10.0-RELEASE. It
includes some information on how to obtain FreeBSD, a listing of various
ways to contact the FreeBSD Project, and pointers to some other sources
of information.

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
`2. Obtaining FreeBSD <#obtain>`__
`3. Contacting the FreeBSD Project <#contacting>`__
`4. Further Reading <#seealso>`__
`5. Acknowledgments <#acknowledgements>`__

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

This distribution is a release of FreeBSD 10.0-RELEASE, the latest point
along the 10.0-STABLE branch.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1.?About FreeBSD
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is an operating system based on 4.4 BSD Lite for AMD64 and Intel
EM64T based PC hardware (amd64), Intel, AMD, Cyrix or NexGen “x86” based
PC hardware (i386), Intel Itanium Processor based computers (ia64), NEC
PC-9801/9821 series PCs and compatibles (pc98), and UltraSPARC? machines
(sparc64). Versions for the ARM? (arm), MIPS? (mips), and PowerPC?
(powerpc) architectures are currently under development as well. FreeBSD
works with a wide variety of peripherals and configurations and can be
used for everything from software development to games to Internet
Service Provision.

This release of FreeBSD contains everything you need to run such a
system, including full source code for the kernel and all utilities in
the base distribution. With the source distribution installed, you can
literally recompile the entire system from scratch with one command,
making it ideal for students, researchers, or users who simply want to
see how it all works.

A large collection of third-party ported software (the “Ports
Collection”) is also provided to make it easy to obtain and install all
your favorite traditional UNIX? utilities for FreeBSD. Each “port”
consists of a set of scripts to retrieve, configure, build, and install
a piece of software, with a single command. Over 24,000 ports, from
editors to programming languages to graphical applications, make FreeBSD
a powerful and comprehensive operating environment that extends far
beyond what's provided by many commercial versions of UNIX?. Most ports
are also available as pre-compiled “packages”, which can be quickly
installed from the installation program.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.2.?Target Audience
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This release of FreeBSD is suitable for all users. It has undergone a
period of testing and quality assurance checking to ensure the highest
reliability and dependability.

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

2.?Obtaining FreeBSD
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD may be obtained in a variety of ways. This section focuses on
those ways that are primarily useful for obtaining a complete FreeBSD
distribution, rather than updating an existing installation.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?CDROM and DVD
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD -RELEASE distributions may be ordered on CDROM or DVD from
several publishers. This is frequently the most convenient way to obtain
FreeBSD for new installations, as it provides a convenient way to
quickly reinstall the system if necessary. Some distributions include
some of the optional, precompiled “packages” from the FreeBSD Ports
Collection, or other extra material.

A list of the CDROM and DVD publishers known to the project are listed
in the `“Obtaining
FreeBSD” <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
appendix to the Handbook.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.?FTP
~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You can use FTP to retrieve FreeBSD and any or all of its optional
packages from ``ftp://ftp.FreeBSD.org/``, which is the official FreeBSD
release site, or any of its “mirrors”.

Lists of locations that mirror FreeBSD can be found in the `FTP
Sites <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__
section of the Handbook. Finding a close (in networking terms) mirror
from which to download the distribution is highly recommended.

Additional mirror sites are always welcome. Contact
``<freebsd-admin@FreeBSD.org>`` for more details on becoming an official
mirror site. You can also find useful information for mirror sites at
the `Mirroring
FreeBSD <../../../../doc/en_US.ISO8859-1/articles/hubs/>`__ article.

Mirrors generally contain the ISO images generally used to create a
CDROM of a FreeBSD release. They usually also contain floppy disk images
(for applicable platforms), as well as the files necessary to do an
installation over the network. Finally mirrors sites usually contain a
set of packages for the most current release.

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

3.?Contacting the FreeBSD Project
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Email and Mailing Lists
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For any questions or general technical support issues, please send mail
to the `FreeBSD general questions mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.

If you're tracking the 10.0-STABLE development efforts, you *must* join
the `FreeBSD-STABLE mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__, in
order to keep abreast of recent developments and changes that may affect
the way you use and maintain the system.

Being a largely-volunteer effort, the FreeBSD Project is always happy to
have extra hands willing to help—there are already far more desired
enhancements than there is time to implement them. To contact the
developers on technical matters, or with offers of help, please send
mail to the `FreeBSD technical discussions mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__.

Please note that these mailing lists can experience *significant*
amounts of traffic. If you have slow or expensive mail access, or are
only interested in keeping up with major FreeBSD events, you may find it
preferable to subscribe instead to the `FreeBSD announcements mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__.

All of the mailing lists can be freely joined by anyone wishing to do
so. Visit the `FreeBSD Mailman Info
Page <../../../../mailman/listinfo>`__. This will give you more
information on joining the various lists, accessing archives, etc. There
are a number of mailing lists targeted at special interest groups not
mentioned here; more information can be obtained either from the Mailman
pages or the `mailing lists
section <../../../../support.html#mailing-list>`__ of the FreeBSD Web
site.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Do *not* send email to the lists asking to be subscribed. Use the
Mailman interface instead.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.?Submitting Problem Reports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Suggestions, bug reports and contributions of code are always
valued—please do not hesitate to report any problems you may find. Bug
reports with attached fixes are of course even more welcome.

The preferred method to submit bug reports from a machine with Internet
mail connectivity is to use the
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
command. “Problem Reports” (PRs) submitted in this way will be filed and
their progress tracked; the FreeBSD developers will do their best to
respond to all reported bugs as soon as possible. `A list of all active
PRs <http://www.FreeBSD.org/cgi/query-pr-summary.cgi>`__ is available on
the FreeBSD Web site; this list is useful to see what potential problems
other users have encountered.

Note that
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
itself is a shell script that should be easy to move even onto a
non-FreeBSD system. Using this interface is highly preferred. If, for
some reason, you are unable to use
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
to submit a bug report, you can try to send it to the `FreeBSD problem
reports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__.

For more information, `“Writing FreeBSD Problem
Reports” <../../../../doc/en_US.ISO8859-1/articles/problem-reports/>`__,
available on the FreeBSD Web site, has a number of helpful hints on
writing and submitting effective problem reports.

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

4.?Further Reading
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are many sources of information about FreeBSD; some are included
with this distribution, while others are available on-line or in print
versions.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Release Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A number of other files provide more specific information about this
release distribution. These files are provided in various formats. Most
distributions will include both ASCII text (``.TXT``) and HTML
(``.HTM``) renditions. Some distributions may also include other formats
such as Portable Document Format (``.PDF``).

.. raw:: html

   <div class="itemizedlist" xmlns="http://www.w3.org/1999/xhtml">

-  ``README.TXT``: This file, which gives some general information about
   FreeBSD as well as some cursory notes about obtaining a distribution.

-  ``RELNOTES.TXT``: The release notes, showing what's new and different
   in FreeBSD 10.0-RELEASE compared to the previous release (FreeBSD
   9.2-RELEASE).

-  ``HARDWARE.TXT``: The hardware compatibility list, showing devices
   with which FreeBSD has been tested and is known to work.

-  ``ERRATA.TXT``: Release errata. Late-breaking, post-release
   information can be found in this file, which is principally
   applicable to releases (as opposed to snapshots). It is important to
   consult this file before installing a release of FreeBSD, as it
   contains the latest information on problems which have been found and
   fixed since the release was created.

.. raw:: html

   </div>

On platforms that support
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__
(currently amd64, i386, ia64, pc98, and sparc64), these documents are
generally available via the Documentation menu during installation. Once
the system is installed, you can revisit this menu by re-running the
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__
utility.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is extremely important to read the errata for any given release
before installing it, to learn about any “late-breaking news” or
post-release problems. The errata file accompanying each release (most
likely right next to this file) is already out of date by definition,
but other copies are kept updated on the Internet and should be
consulted as the “current errata” for this release. These other copies
of the errata are located at ``../../../../releases/`` (as well as any
sites which keep up-to-date mirrors of this location).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.?Manual Pages
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As with almost all UNIX? like operating systems, FreeBSD comes with a
set of on-line manual pages, accessed through the
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__
command or through the `hypertext manual pages
gateway <http://www.FreeBSD.org/cgi/man.cgi>`__ on the FreeBSD Web site.
In general, the manual pages provide information on the different
commands and APIs available to the FreeBSD user.

In some cases, manual pages are written to give information on
particular topics. Notable examples of such manual pages are
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7>`__
(a guide to performance tuning),
`security(7) <http://www.FreeBSD.org/cgi/man.cgi?query=security&sektion=7>`__
(an introduction to FreeBSD security), and
`style(9) <http://www.FreeBSD.org/cgi/man.cgi?query=style&sektion=9>`__
(a style guide to kernel coding).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.?Books and Articles
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Two highly-useful collections of FreeBSD-related information, maintained
by the FreeBSD Project, are the FreeBSD Handbook and FreeBSD FAQ
(Frequently Asked Questions document). On-line versions of the
`Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/>`__ and
`FAQ <../../../../doc/en_US.ISO8859-1/books/faq/>`__ are always
available from the `FreeBSD Documentation
page <../../../../docs.html>`__ or its mirrors. If you install the
``doc`` distribution set, you can use a Web browser to read the Handbook
and FAQ locally. In particular, note that the Handbook contains a
step-by-step guide to installing FreeBSD.

A number of on-line books and articles, also maintained by the FreeBSD
Project, cover more-specialized, FreeBSD-related topics. This material
spans a wide range of topics, from effective use of the mailing lists,
to dual-booting FreeBSD with other operating systems, to guidelines for
new committers. Like the Handbook and FAQ, these documents are available
from the FreeBSD Documentation Page or in the ``doc`` distribution set.

A listing of other books and documents about FreeBSD can be found in the
`bibliography <../../../../doc/en_US.ISO8859-1/books/handbook/bibliography.html>`__
of the FreeBSD Handbook. Because of FreeBSD's strong UNIX? heritage,
many other articles and books written for UNIX? systems are applicable
as well, some of which are also listed in the bibliography.

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

5.?Acknowledgments
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD represents the cumulative work of many hundreds, if not
thousands, of individuals from around the world who have worked
countless hours to bring about this release. For a complete list of
FreeBSD developers and contributors, please see `“Contributors to
FreeBSD” <../../../../doc/en_US.ISO8859-1/articles/contributors/>`__ on
the FreeBSD Web site or any of its mirrors.

Special thanks also go to the many thousands of FreeBSD users and
testers all over the world, without whom this release simply would not
have been possible.

.. raw:: html

   </div>

.. raw:: html

   </div>

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD release should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
