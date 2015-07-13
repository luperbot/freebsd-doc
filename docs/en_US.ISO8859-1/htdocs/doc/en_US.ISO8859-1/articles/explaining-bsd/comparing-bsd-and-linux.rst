==========================
4.?Comparing BSD and Linux
==========================

.. raw:: html

   <div class="navheader">

4.?Comparing BSD and Linux
`Prev <why-is-bsd-not-better-known.html>`__?
?
?

--------------

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

4.?Comparing BSD and Linux
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

So what is really the difference between, say, Debian Linux and FreeBSD?
For the average user, the difference is surprisingly small: Both are
UNIX? like operating systems. Both are developed by non-commercial
projects (this does not apply to many other Linux distributions, of
course). In the following section, we will look at BSD and compare it to
Linux. The description applies most closely to FreeBSD, which accounts
for an estimated 80% of the BSD installations, but the differences from
NetBSD, OpenBSD and DragonFlyBSD are small.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Who owns BSD?
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

No one person or corporation owns BSD. It is created and distributed by
a community of highly technical and committed contributors all over the
world. Some of the components of BSD are Open Source projects in their
own right and managed by different project maintainers.

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

4.2.?How is BSD developed and updated?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The BSD kernels are developed and updated following the Open Source
development model. Each project maintains a publicly accessible *source
tree* under the `Concurrent Versions System <http://www.cvshome.org/>`__
(CVS), which contains all source files for the project, including
documentation and other incidental files. CVS allows users to “check
out” (in other words, to extract a copy of) any desired version of the
system.

A large number of developers worldwide contribute to improvements to
BSD. They are divided into three kinds:

.. raw:: html

   <div class="itemizedlist">

-  *Contributors* write code or documentation. They are not permitted to
   commit (add code) directly to the source tree. In order for their
   code to be included in the system, it must be reviewed and checked in
   by a registered developer, known as a *committer*.

-  *Committers* are developers with write access to the source tree. In
   order to become a committer, an individual must show ability in the
   area in which they are active.

   It is at the individual committer's discretion whether they should
   obtain authority before committing changes to the source tree. In
   general, an experienced committer may make changes which are
   obviously correct without obtaining consensus. For example, a
   documentation project committer may correct typographical or
   grammatical errors without review. On the other hand, developers
   making far-reaching or complicated changes are expected to submit
   their changes for review before committing them. In extreme cases, a
   core team member with a function such as Principal Architect may
   order that changes be removed from the tree, a process known as
   *backing out*. All committers receive mail describing each individual
   commit, so it is not possible to commit secretly.

-  The *Core team*. FreeBSD and NetBSD each have a core team which
   manages the project. The core teams developed in the course of the
   projects, and their role is not always well-defined. It is not
   necessary to be a developer in order to be a core team member, though
   it is normal. The rules for the core team vary from one project to
   the other, but in general they have more say in the direction of the
   project than non-core team members have.

.. raw:: html

   </div>

This arrangement differs from Linux in a number of ways:

.. raw:: html

   <div class="orderedlist">

#. No one person controls the content of the system. In practice, this
   difference is overrated, since the Principal Architect can require
   that code be backed out, and even in the Linux project several people
   are permitted to make changes.

#. On the other hand, there *is* a central repository, a single place
   where you can find the entire operating system sources, including all
   older versions.

#. BSD projects maintain the entire “Operating System”, not only the
   kernel. This distinction is only marginally useful: neither BSD nor
   Linux is useful without applications. The applications used under BSD
   are frequently the same as the applications used under Linux.

#. As a result of the formalized maintenance of a single CVS source
   tree, BSD development is clear, and it is possible to access any
   version of the system by release number or by date. CVS also allows
   incremental updates to the system: for example, the FreeBSD
   repository is updated about 100 times a day. Most of these changes
   are small.

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

4.3.?BSD releases
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD, NetBSD and OpenBSD provide the system in three different
“releases”. As with Linux, releases are assigned a number such as 1.4.1
or 3.5. In addition, the version number has a suffix indicating its
purpose:

.. raw:: html

   <div class="orderedlist">

#. The development version of the system is called *CURRENT*. FreeBSD
   assigns a number to CURRENT, for example FreeBSD 5.0-CURRENT. NetBSD
   uses a slightly different naming scheme and appends a single-letter
   suffix which indicates changes in the internal interfaces, for
   example NetBSD 1.4.3G. OpenBSD does not assign a number
   (“OpenBSD-current”). All new development on the system goes into this
   branch.

#. At regular intervals, between two and four times a year, the projects
   bring out a *RELEASE* version of the system, which is available on
   CD-ROM and for free download from FTP sites, for example OpenBSD
   2.6-RELEASE or NetBSD 1.4-RELEASE. The RELEASE version is intended
   for end users and is the normal version of the system. NetBSD also
   provides *patch releases* with a third digit, for example NetBSD
   1.4.2.

#. As bugs are found in a RELEASE version, they are fixed, and the fixes
   are added to the CVS tree. In FreeBSD, the resultant version is
   called the *STABLE* version, while in NetBSD and OpenBSD it continues
   to be called the RELEASE version. Smaller new features can also be
   added to this branch after a period of test in the CURRENT branch.

.. raw:: html

   </div>

*By contrast, Linux maintains two separate code trees: the stable
version and the development version. Stable versions have an even minor
version number, such as 2.0, 2.2 or 2.4. Development versions have an
odd minor version number, such as 2.1, 2.3 or 2.5. In each case, the
number is followed by a further number designating the exact release. In
addition, each vendor adds their own userland programs and utilities, so
the name of the distribution is also important. Each distribution vendor
also assigns version numbers to the distribution, so a complete
description might be something like “TurboLinux 6.0 with kernel 2.2.14”*

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

4.4.?What versions of BSD are available?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In contrast to the numerous Linux distributions, there are only four
major open source BSDs. Each BSD project maintains its own source tree
and its own kernel. In practice, though, there appear to be fewer
divergences between the userland code of the projects than there is in
Linux.

It is difficult to categorize the goals of each project: the differences
are very subjective. Basically,

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD aims for high performance and ease of use by end users, and
   is a favourite of web content providers. It runs on a `number of
   platforms <../../../../platforms/>`__ and has significantly more
   users than the other projects.

-  NetBSD aims for maximum portability: “of course it runs NetBSD”. It
   runs on machines from palmtops to large servers, and has even been
   used on NASA space missions. It is a particularly good choice for
   running on old non-Intel? hardware.

-  OpenBSD aims for security and code purity: it uses a combination of
   the open source concept and rigorous code reviews to create a system
   which is demonstrably correct, making it the choice of
   security-conscious organizations such as banks, stock exchanges and
   US Government departments. Like NetBSD, it runs on a number of
   platforms.

-  DragonFlyBSD aims for high performance and scalability under
   everything from a single-node UP system to a massively clustered
   system. DragonFlyBSD has several long-range technical goals, but
   focus lies on providing a SMP-capable infrastructure that is easy to
   understand, maintain and develop for.

.. raw:: html

   </div>

There are also two additional BSD UNIX? operating systems which are not
open source, BSD/OS and Apple's Mac?OS? X:

.. raw:: html

   <div class="itemizedlist">

-  BSD/OS was the oldest of the 4.4BSD derivatives. It was not open
   source, though source code licenses were available at relatively low
   cost. It resembled FreeBSD in many ways. Two years after the
   acquisition of BSDi by Wind River Systems, BSD/OS failed to survive
   as an independent product. Support and source code may still be
   available from Wind River, but all new development is focused on the
   VxWorks embedded operating system.

-  `Mac?OS? X <http://www.apple.com/macosx/server/>`__ is the latest
   version of the operating system for Apple?'s Mac? line. The BSD core
   of this operating system,
   `Darwin <http://developer.apple.com/darwin/>`__, is available as a
   fully functional open source operating system for x86 and PPC
   computers. The Aqua/Quartz graphics system and many other proprietary
   aspects of Mac?OS? X remain closed-source, however. Several Darwin
   developers are also FreeBSD committers, and vice-versa.

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

4.5.?How does the BSD license differ from the GNU Public license?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux is available under the `GNU General Public
License <http://www.fsf.org/copyleft/gpl.html>`__ (GPL), which is
designed to eliminate closed source software. In particular, any
derivative work of a product released under the GPL must also be
supplied with source code if requested. By contrast, the `BSD
license <http://www.opensource.org/licenses/bsd-license.html>`__ is less
restrictive: binary-only distributions are allowed. This is particularly
attractive for embedded applications.

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

4.6.?What else should I know?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since fewer applications are available for BSD than Linux, the BSD
developers created a Linux compatibility package, which allows Linux
programs to run under BSD. The package includes both kernel
modifications, in order to correctly perform Linux system calls, and
Linux compatibility files such as the C library. There is no noticeable
difference in execution speed between a Linux application running on a
Linux machine and a Linux application running on a BSD machine of the
same speed.

The “all from one supplier” nature of BSD means that upgrades are much
easier to handle than is frequently the case with Linux. BSD handles
library version upgrades by providing compatibility modules for earlier
library versions, so it is possible to run binaries which are several
years old with no problems.

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

4.7.?Which should I use, BSD or Linux?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

What does this all mean in practice? Who should use BSD, who should use
Linux?

This is a very difficult question to answer. Here are some guidelines:

.. raw:: html

   <div class="itemizedlist">

-  “If it ain't broke, don't fix it”: If you already use an open source
   operating system, and you are happy with it, there is probably no
   good reason to change.

-  BSD systems, in particular FreeBSD, can have notably higher
   performance than Linux. But this is not across the board. In many
   cases, there is little or no difference in performance. In some
   cases, Linux may perform better than FreeBSD.

-  In general, BSD systems have a better reputation for reliability,
   mainly as a result of the more mature code base.

-  BSD projects have a better reputation for the quality and
   completeness of their documentation. The various documentation
   projects aim to provide actively updated documentation, in many
   languages, and covering all aspects of the system.

-  The BSD license may be more attractive than the GPL.

-  BSD can execute most Linux binaries, while Linux can not execute BSD
   binaries. Many BSD implementations can also execute binaries from
   other UNIX? like systems. As a result, BSD may present an easier
   migration route from other systems than Linux would.

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

4.8.?Who provides support, service, and training for BSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSDi / `FreeBSD Mall, Inc. <http://www.freebsdmall.com>`__ have been
providing support contracts for FreeBSD for nearly a decade.

In addition, each of the projects has a list of consultants for hire:
`FreeBSD <../../../../commercial/consult_bycat.html>`__,
`NetBSD <http://www.netbsd.org/gallery/consultants.html>`__, and
`OpenBSD <http://www.openbsd.org/support.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------+-----+
| `Prev <why-is-bsd-not-better-known.html>`__?   | ?                       | ?   |
+------------------------------------------------+-------------------------+-----+
| 3.?Why is BSD not better known??               | `Home <index.html>`__   | ?   |
+------------------------------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
