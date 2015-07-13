===========================
FreeBSD Release Engineering
===========================

.. raw:: html

   <div class="navheader">

FreeBSD Release Engineering
?
?
?\ `Next <release-proc.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

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

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Murray Stokely
~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| ``<murray@FreeBSD.org>``
|  ????????????http://www.FreeBSD.org/~murray/
|  ??????????

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

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

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

2013/02/26: This document is partially outdated and does not accurately
describe the current release procedures of the FreeBSD Release
Engineering team. The FreeBSD Release Engineering team is currently
reviewing this document and will publish updated content soon.

.. raw:: html

   </div>

This paper describes the approach used by the FreeBSD release
engineering team to make production quality releases of the FreeBSD
Operating System. It details the methodology used for the official
FreeBSD releases and describes the tools available for those interested
in producing customized FreeBSD releases for corporate rollouts or
commercial productization.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

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

`1. Introduction <index.html#introduction>`__
`2. Release Process <release-proc.html>`__
`3. Release Building <release-build.html>`__
`4. Distribution <distribution.html>`__
`5. Extensibility <extensibility.html>`__
`6. Lessons Learned from FreeBSD?4.4 <lessons-learned.html>`__
`7. Future Directions <future.html>`__
`8. Acknowledgements <ackno.html>`__

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

The development of FreeBSD is a very open process. FreeBSD is comprised
of contributions from thousands of people around the world. The FreeBSD
Project provides Subversion `:sup:`[1]` <#ftn.idp63653328>`__ access to
the general public so that others can have access to log messages, diffs
(patches) between development branches, and other productivity
enhancements that formal source code management provides. This has been
a huge help in attracting more talented developers to FreeBSD. However,
I think everyone would agree that chaos would soon manifest if write
access to the main repository was opened up to everyone on the Internet.
Therefore only a “select” group of nearly 300 people are given write
access to the Subversion repository. These
`committers <../../../../doc/en_US.ISO8859-1/articles/contributors/article.html#staff-committers>`__
`:sup:`[2]` <#ftn.idp63659344>`__ are usually the people who do the bulk
of FreeBSD development. An elected `Core
Team <../../../../administration.html#t-core>`__
`:sup:`[3]` <#ftn.idp63663824>`__ of developers provide some level of
direction over the project.

The rapid pace of ``FreeBSD`` development makes the main development
branch unsuitable for the everyday use by the general public. In
particular, stabilizing efforts are required for polishing the
development system into a production quality release. To solve this
conflict, development continues on several parallel tracks. The main
development branch is the *HEAD* or *trunk* of our Subversion tree,
known as “FreeBSD-CURRENT” or “-CURRENT” for short.

A set of more stable branches are maintained, known as “FreeBSD-STABLE”
or “-STABLE” for short. All branches live in a master Subversion
repository maintained by the FreeBSD Project. FreeBSD-CURRENT is the
“bleeding-edge” of FreeBSD development where all new changes first enter
the system. FreeBSD-STABLE is the development branch from which major
releases are made. Changes go into this branch at a different pace, and
with the general assumption that they have first gone into
FreeBSD-CURRENT and have been thoroughly tested by our user community.

The term *stable* in the name of the branch refers to the presumed
Application Binary Interface stability, which is promised by the
project. This means that a user application compiled on an older version
of the system from the same branch works on a newer system from the same
branch. The ABI stability has improved greatly from the compared to
previous releases. In most cases, binaries from the older *STABLE*
systems run unmodified on newer systems, including *HEAD*, assuming that
the system management interfaces are not used.

In the interim period between releases, weekly snapshots are built
automatically by the FreeBSD Project build machines and made available
for download from ``ftp://ftp.FreeBSD.org/pub/FreeBSD/snapshots/``. The
widespread availability of binary release snapshots, and the tendency of
our user community to keep up with -STABLE development with Subversion
and “``make`` ``buildworld``” `:sup:`[4]` <#ftn.idp63694032>`__ helps to
keep FreeBSD-STABLE in a very reliable condition even before the quality
assurance activities ramp up pending a major release.

In addition to installation ISO snapshots, weekly virtual machine images
are also provided for use with VirtualBox, qemu, or other popular
emulation software. The virtual machine images can be downloaded from
``ftp://ftp.FreeBSD.org/pub/FreeBSD/snapshots/VM-IMAGES/``.

The virtual machine images are approximately 150MB
`xz(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xz&sektion=1>`__
compressed, and contain a 10GB sparse filesystem when attached to a
virtual machine.

Bug reports and feature requests are continuously submitted by users
throughout the release cycle. Problems reports are entered into our
Bugzilla database through the web interface provided at
``https://www.freebsd.org/support/bugreports.html``.

To service our most conservative users, individual release branches were
introduced with FreeBSD?4.3. These release branches are created shortly
before a final release is made. After the release goes out, only the
most critical security fixes and additions are merged onto the release
branch. In addition to source updates via Subversion, binary patchkits
are available to keep systems on the *releng/\ *``X``*.\ *``Y``**
branches updated.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1.?What this article describes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following sections of this article describe:

.. raw:: html

   <div class="variablelist">

`Section?2, “Release Process” <release-proc.html>`__
    The different phases of the release engineering process leading up
    to the actual system build.

`Section?3, “Release Building” <release-build.html>`__
    The actual build process.

`Section?5, “Extensibility” <extensibility.html>`__
    How the base release may be extended by third parties.

`Section?6, “Lessons Learned from FreeBSD?4.4” <lessons-learned.html>`__
    Some of the lessons learned through the release of FreeBSD?4.4.

`Section?7, “Future Directions” <future.html>`__
    Future directions of development.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp63653328" class="footnote">

`:sup:`[1]` <#idp63653328>`__ Subversion,
``http://subversion.apache.org``

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp63659344" class="footnote">

`:sup:`[2]` <#idp63659344>`__ `FreeBSD
committers <../../../../doc/en_US.ISO8859-1/articles/contributors/article.html#staff-committers>`__

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp63663824" class="footnote">

`:sup:`[3]` <#idp63663824>`__ `FreeBSD Core
Team <../../../../administration.html#t-core>`__

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp63694032" class="footnote">

`:sup:`[4]` <#idp63694032>`__ `Rebuilding
"world" <../../../../doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------+
| ?   | ?   | ?\ `Next <release-proc.html>`__   |
+-----+-----+-----------------------------------+
| ?   | ?   | ?2.?Release Process               |
+-----+-----+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
