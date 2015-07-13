============================
FreeBSD 5.2.1-RELEASE README
============================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.2.1-RELEASE README
============================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/readme/article.sgml,v
  1.27.2.1 2004/01/25 18:50:50 bmah Exp $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of Wind River Systems, Inc. This is
expected to change soon.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

Motif, OSF/1, and UNIX are registered trademarks and IT DialTone and The
Open Group are trademarks of The Open Group in the United States and
other countries.

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

    This document gives a brief introduction to FreeBSD 5.2.1-RELEASE.
    It includes some information on how to obtain FreeBSD, a listing of
    various ways to contact the FreeBSD Project, and pointers to some
    other sources of information.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
--------------

This distribution is a release of FreeBSD 5.2.1-RELEASE. This is a
\`\`point release''. It exists primarily to address some specific issues
found (after-the-fact) in the FreeBSD 5.2-RELEASE distribution. Changes
made for this point release are described, in the release notes.
Generally speaking, the features of this release are unchanged compared
to FreeBSD 5.2-RELEASE.

.. raw:: html

   <div class="SECT2">

--------------

1.1 About FreeBSD
~~~~~~~~~~~~~~~~~

FreeBSD is an operating system based on 4.4 BSD Lite for Intel, AMD,
Cyrix or NexGen \`\`x86'' based PC hardware (i386™), NEC PC-9801/9821
series PCs and compatibles (pc98), DEC/Compaq/HP Alpha computers
(alpha), and UltraSPARC® machines (Sparc64®). Versions for the IA64
(ia64), PowerPC® (PowerPC), and AMD \`\`Hammer'' (amd64) architectures
are currently under development as well. FreeBSD works with a wide
variety of peripherals and configurations and can be used for everything
from software development to games to Internet Service Provision.

This release of FreeBSD contains everything you need to run such a
system, including full source code for the kernel and all utilities in
the base distribution. With the source distribution installed, you can
literally recompile the entire system from scratch with one command,
making it ideal for students, researchers, or users who simply want to
see how it all works.

A large collection of third-party ported software (the \`\`Ports
Collection'') is also provided to make it easy to obtain and install all
your favorite traditional UNIX® utilities for FreeBSD. Each \`\`port''
consists of a set of scripts to retrieve, configure, build, and install
a piece of software, with a single command. Over 10,000 ports, from
editors to programming languages to graphical applications, make FreeBSD
a powerful and comprehensive operating environment that extends far
beyond what's provided by many commercial versions of UNIX. Most ports
are also available as pre-compiled \`\`packages'', which can be quickly
installed from the installation program.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.2 Target Audience
~~~~~~~~~~~~~~~~~~~

This release of FreeBSD is suitable for all users. It has undergone a
period of testing and quality assurance checking to ensure the highest
reliability and dependability.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Obtaining FreeBSD
-------------------

FreeBSD may be obtained in a variety of ways. This section focuses on
those ways that are primarily useful for obtaining a complete FreeBSD
distribution, rather than updating an existing installation.

.. raw:: html

   <div class="SECT2">

--------------

2.1 CDROM and DVD
~~~~~~~~~~~~~~~~~

FreeBSD -RELEASE distributions may be ordered on CDROM or DVD from
several publishers. This is frequently the most convenient way to obtain
FreeBSD for new installations, as it provides a convenient way to
quickly reinstall the system if necessary. Some distributions include
some of the optional, precompiled \`\`packages'' from the FreeBSD Ports
Collection.

A list of the CDROM and DVD publishers known to the project are listed
in the `\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
appendix to the Handbook.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 FTP
~~~~~~~

You can use FTP to retrieve FreeBSD and any or all of its optional
packages from ftp://ftp.FreeBSD.org/, which is the official FreeBSD
release site, or any of its \`\`mirrors''.

Lists of locations that mirror FreeBSD can be found in the `FTP
Sites <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__
section of the Handbook, or on the http://mirrorlist.FreeBSD.org/ Web
pages. Finding a close (in networking terms) mirror from which to
download the distribution is highly recommended.

Additional mirror sites are always welcome. Contact
``<freebsd-admin@FreeBSD.org>`` for more details on becoming an official
mirror site. You can also find useful information for mirror sites at
the `Mirroring
FreeBSD <http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/hubs/>`__
article.

Mirrors generally contain the floppy disk images necessary to begin an
installation, as well as the distribution files needed for the install
process itself. Many mirrors also contain the ISO images necessary to
create a CDROM of a FreeBSD release.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Contacting the FreeBSD Project
--------------------------------

.. raw:: html

   <div class="SECT2">

3.1 Email and Mailing Lists
~~~~~~~~~~~~~~~~~~~~~~~~~~~

For any questions or general technical support issues, please send mail
to the `FreeBSD general questions mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.

If you're tracking the 5-CURRENT development efforts, you *must* join
the `FreeBSD-CURRENT mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__, in
order to keep abreast of recent developments and changes that may affect
the way you use and maintain the system.

Being a largely-volunteer effort, the FreeBSD Project is always happy to
have extra hands willing to help--there are already far more desired
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
Page <http://www.FreeBSD.org/mailman/listinfo>`__. This will give you
more information on joining the various lists, accessing archives, etc.
There are a number of mailing lists targeted at special interest groups
not mentioned here; more information can be obtained either from the
Mailman pages or the `mailing lists
section <http://www.FreeBSD.org/support.html#mailing-list>`__ of the
FreeBSD Web site.

.. raw:: html

   <div class="IMPORTANT">

    **Important:** Do *not* send email to the lists asking to be
    subscribed. Use the Mailman interface instead.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2 Submitting Problem Reports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Suggestions, bug reports and contributions of code are always
valued--please do not hesitate to report any problems you may find. Bug
reports with attached fixes are of course even more welcome.

The preferred method to submit bug reports from a machine with Internet
mail connectivity is to use the
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+5.2.1-RELEASE>`__
command. \`\`Problem Reports'' (PRs) submitted in this way will be filed
and their progress tracked; the FreeBSD developers will do their best to
respond to all reported bugs as soon as possible. `A list of all active
PRs <http://www.FreeBSD.org/cgi/query-pr-summary.cgi>`__ is available on
the FreeBSD Web site; this list is useful to see what potential problems
other users have encountered.

Note that
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+5.2.1-RELEASE>`__
itself is a shell script that should be easy to move even onto a
non-FreeBSD system. Using this interface is highly preferred. If, for
some reason, you are unable to use
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+5.2.1-RELEASE>`__
to submit a bug report, you can try to send it to the `FreeBSD problem
reports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__.

For more information, `\`\`Writing FreeBSD Problem
Reports'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/problem-reports/>`__,
available on the FreeBSD Web site, has a number of helpful hints on
writing and submitting effective problem reports.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4 Further Reading
-----------------

There are many sources of information about FreeBSD; some are included
with this distribution, while others are available on-line or in print
versions.

.. raw:: html

   <div class="SECT2">

--------------

4.1 Release Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~

A number of other files provide more specific information about this
release distribution. These files are provided in various formats. Most
distributions will include both ASCII text (``.TXT``) and HTML
(``.HTM``) renditions. Some distributions may also include other formats
such as PostScript (``.PS``) or Portable Document Format (``.PDF``).

-  ``README.TXT``: This file, which gives some general information about
   FreeBSD as well as some cursory notes about obtaining a distribution.

-  ``EARLY.TXT``: A guide for early adopters of FreeBSD 5.2.1-RELEASE.
   Highly recommended reading for users new to FreeBSD 5-CURRENT and/or
   the 5.X series of releases.

-  ``RELNOTES.TXT``: The release notes, showing what's new and different
   in FreeBSD 5.2.1-RELEASE compared to the previous release (FreeBSD
   5.1-RELEASE).

-  ``HARDWARE.TXT``: The hardware compatibility list, showing devices
   with which FreeBSD has been tested and is known to work.

-  ``INSTALL.TXT``: Installation instructions for installing FreeBSD
   from its distribution media.

-  ``ERRATA.TXT``: Release errata. Late-breaking, post-release
   information can be found in this file, which is principally
   applicable to releases (as opposed to snapshots). It is important to
   consult this file before installing a release of FreeBSD, as it
   contains the latest information on problems which have been found and
   fixed since the release was created.

.. raw:: html

   <div class="NOTE">

    **Note:** Several of these documents (in particular,
    ``RELNOTES.TXT``, ``HARDWARE.TXT``, and ``INSTALL.TXT``) contain
    information that is specific to a particular hardware architecture.
    For example, the alpha release notes contain information not
    applicable to the i386, and vice versa. The architecture for which
    each document applies will be listed in that document's title.

.. raw:: html

   </div>

On platforms that support
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2.1-RELEASE>`__
(currently alpha, i386, ia64, pc98, and Sparc64), these documents are
generally available via the Documentation menu during installation. Once
the system is installed, you can revisit this menu by re-running the
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2.1-RELEASE>`__
utility.

.. raw:: html

   <div class="NOTE">

    **Note:** It is extremely important to read the errata for any given
    release before installing it, to learn about any \`\`late-breaking
    news'' or post-release problems. The errata file accompanying each
    release (most likely right next to this file) is already out of date
    by definition, but other copies are kept updated on the Internet and
    should be consulted as the \`\`current errata'' for this release.
    These other copies of the errata are located at
    http://www.FreeBSD.org/releases/ (as well as any sites which keep
    up-to-date mirrors of this location).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

4.2 Manual Pages
~~~~~~~~~~~~~~~~

As with almost all UNIX like operating systems, FreeBSD comes with a set
of on-line manual pages, accessed through the
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+5.2.1-RELEASE>`__
command or through the `hypertext manual pages
gateway <http://www.FreeBSD.org/cgi/man.cgi>`__ on the FreeBSD Web site.
In general, the manual pages provide information on the different
commands and APIs available to the FreeBSD user.

In some cases, manual pages are written to give information on
particular topics. Notable examples of such manual pages are
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7&manpath=FreeBSD+5.2.1-RELEASE>`__
(a guide to performance tuning),
`security(7) <http://www.FreeBSD.org/cgi/man.cgi?query=security&sektion=7&manpath=FreeBSD+5.2.1-RELEASE>`__
(an introduction to FreeBSD security), and
`style(9) <http://www.FreeBSD.org/cgi/man.cgi?query=style&sektion=9&manpath=FreeBSD+5.2.1-RELEASE>`__
(a style guide to kernel coding).

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

4.3 Books and Articles
~~~~~~~~~~~~~~~~~~~~~~

Two highly-useful collections of FreeBSD-related information, maintained
by the FreeBSD Project, are the FreeBSD Handbook and FreeBSD FAQ
(Frequently Asked Questions document). On-line versions of the
`Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__
and `FAQ <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/faq/>`__ are
always available from the `FreeBSD Documentation
page <http://www.FreeBSD.org/docs.html>`__ or its mirrors. If you
install the ``doc`` distribution set, you can use a Web browser to read
the Handbook and FAQ locally.

A number of on-line books and articles, also maintained by the FreeBSD
Project, cover more-specialized, FreeBSD-related topics. This material
spans a wide range of topics, from effective use of the mailing lists,
to dual-booting FreeBSD with other operating systems, to guidelines for
new committers. Like the Handbook and FAQ, these documents are available
from the FreeBSD Documentation Page or in the ``doc`` distribution set.

A listing of other books and documents about FreeBSD can be found in the
`bibliography <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/bibliography.html>`__
of the FreeBSD Handbook. Because of FreeBSD's strong UNIX heritage, many
other articles and books written for UNIX systems are applicable as
well, some of which are also listed in the bibliography.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

5 Acknowledgments
-----------------

FreeBSD represents the cumulative work of many hundreds, if not
thousands, of individuals from around the world who have worked
countless hours to bring about this release. For a complete list of
FreeBSD developers and contributors, please see `\`\`Contributors to
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/contributors/>`__
on the FreeBSD Web site or any of its mirrors.

Special thanks also go to the many thousands of FreeBSD users and
testers all over the world, without whom this release simply would not
have been possible.

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
