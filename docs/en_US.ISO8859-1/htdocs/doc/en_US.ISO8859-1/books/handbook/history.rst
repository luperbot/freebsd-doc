==============================
1.3.?About the FreeBSD?Project
==============================

.. raw:: html

   <div class="navheader">

1.3.?About the FreeBSD?Project
`Prev <nutshell.html>`__?
Chapter?1.?Introduction
?\ `Next <bsdinstall.html>`__

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

1.3.?About the FreeBSD?Project
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following section provides some background information on the
project, including a brief history, project goals, and the development
model of the project.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.3.1.?A Brief History of FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD?Project had its genesis in the early part of 1993, partially
as an outgrowth of the Unofficial 386BSDPatchkit by the patchkit's last
3 coordinators: Nate Williams, Rod Grimes and Jordan Hubbard.

The original goal was to produce an intermediate snapshot of 386BSD in
order to fix a number of problems with it that the patchkit mechanism
just was not capable of solving. The early working title for the project
was 386BSD 0.5 or 386BSD Interim in reference of that fact.

386BSD was Bill Jolitz's operating system, which had been up to that
point suffering rather severely from almost a year's worth of neglect.
As the patchkit swelled ever more uncomfortably with each passing day,
they decided to assist Bill by providing this interim “cleanup”
snapshot. Those plans came to a rude halt when Bill Jolitz suddenly
decided to withdraw his sanction from the project without any clear
indication of what would be done instead.

The trio thought that the goal remained worthwhile, even without Bill's
support, and so they adopted the name "FreeBSD" coined by David
Greenman. The initial objectives were set after consulting with the
system's current users and, once it became clear that the project was on
the road to perhaps even becoming a reality, Jordan contacted Walnut
Creek CDROM with an eye toward improving FreeBSD's distribution channels
for those many unfortunates without easy access to the Internet. Walnut
Creek CDROM not only supported the idea of distributing FreeBSD on CD
but also went so far as to provide the project with a machine to work on
and a fast Internet connection. Without Walnut Creek CDROM's almost
unprecedented degree of faith in what was, at the time, a completely
unknown project, it is quite unlikely that FreeBSD would have gotten as
far, as fast, as it has today.

The first CD-ROM (and general net-wide) distribution was FreeBSD?1.0,
released in December of 1993. This was based on the 4.3BSD-Lite
(“Net/2”) tape from U.C. Berkeley, with many components also provided by
386BSD and the Free Software Foundation. It was a fairly reasonable
success for a first offering, and they followed it with the highly
successful FreeBSD 1.1 release in May of 1994.

Around this time, some rather unexpected storm clouds formed on the
horizon as Novell and U.C. Berkeley settled their long-running lawsuit
over the legal status of the Berkeley Net/2 tape. A condition of that
settlement was U.C. Berkeley's concession that large parts of Net/2 were
“encumbered” code and the property of Novell, who had in turn acquired
it from AT&T some time previously. What Berkeley got in return was
Novell's “blessing” that the 4.4BSD-Lite release, when it was finally
released, would be declared unencumbered and all existing Net/2 users
would be strongly encouraged to switch. This included FreeBSD, and the
project was given until the end of July 1994 to stop shipping its own
Net/2 based product. Under the terms of that agreement, the project was
allowed one last release before the deadline, that release being
FreeBSD?1.1.5.1.

FreeBSD then set about the arduous task of literally re-inventing itself
from a completely new and rather incomplete set of 4.4BSD-Lite bits. The
“Lite” releases were light in part because Berkeley's CSRG had removed
large chunks of code required for actually constructing a bootable
running system (due to various legal requirements) and the fact that the
Intel port of 4.4 was highly incomplete. It took the project until
November of 1994 to make this transition, and in December it released
FreeBSD?2.0 to the world. Despite being still more than a little rough
around the edges, the release was a significant success and was followed
by the more robust and easier to install FreeBSD?2.0.5 release in June
of 1995.

Since that time, FreeBSD has made a series of releases each time
improving the stability, speed, and feature set of the previous version.

For now, long-term development projects continue to take place in the
10.X-CURRENT (trunk) branch, and snapshot releases of 10.X are
continually made available from `the snapshot
server <ftp://ftp.FreeBSD.org/pub/FreeBSD/snapshots/>`__ as work
progresses.

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

1.3.2.?FreeBSD?Project Goals
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Jordan Hubbard.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The goals of the FreeBSD?Project are to provide software that may be
used for any purpose and without strings attached. Many of us have a
significant investment in the code (and project) and would certainly not
mind a little financial compensation now and then, but we are definitely
not prepared to insist on it. We believe that our first and foremost
“mission” is to provide code to any and all comers, and for whatever
purpose, so that the code gets the widest possible use and provides the
widest possible benefit. This is, I believe, one of the most fundamental
goals of Free Software and one that we enthusiastically support.

That code in our source tree which falls under the GNU General Public
License (GPL) or Library General Public License (LGPL) comes with
slightly more strings attached, though at least on the side of enforced
access rather than the usual opposite. Due to the additional
complexities that can evolve in the commercial use of GPL software we
do, however, prefer software submitted under the more relaxed BSD
copyright when it is a reasonable option to do so.

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

1.3.3.?The FreeBSD Development Model
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Satoshi Asami.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The development of FreeBSD is a very open and flexible process, being
literally built from the contributions of thousands of people around the
world, as can be seen from our `list of
contributors <../../../../doc/en_US.ISO8859-1/articles/contributors/article.html>`__.
FreeBSD's development infrastructure allow these thousands of
contributors to collaborate over the Internet. We are constantly on the
lookout for new developers and ideas, and those interested in becoming
more closely involved with the project need simply contact us at the
`FreeBSD technical discussions mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__. The
`FreeBSD announcements mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__ is
also available to those wishing to make other FreeBSD users aware of
major areas of work.

Useful things to know about the FreeBSD?Project and its development
process, whether working independently or in close cooperation:

.. raw:: html

   <div class="variablelist">

The SVN repositories
     For several years, the central source tree for FreeBSD was
    maintained by `CVS <http://www.nongnu.org/cvs/>`__ (Concurrent
    Versions System), a freely available source code control tool. In
    June 2008, the Project switched to using
    `SVN <http://subversion.tigris.org>`__ (Subversion). The switch was
    deemed necessary, as the technical limitations imposed by CVS were
    becoming obvious due to the rapid expansion of the source tree and
    the amount of history already stored. The Documentation Project and
    Ports Collection repositories also moved from CVS to SVN in May 2012
    and July 2012, respectively. Please refer to the `Synchronizing your
    source tree <synching.html>`__ section for more information on
    obtaining the FreeBSD ``src/`` repository and `Using the Ports
    Collection <ports-using.html>`__ for details on obtaining the
    FreeBSD Ports Collection.

The committers list
    The *committers* are the people who have *write* access to the
    Subversion tree, and are authorized to make modifications to the
    FreeBSD source (the term “committer” comes from the source control
    ``commit`` command, which is used to bring new changes into the
    repository). The best way of making submissions for review is to use
    the
    `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
    command, which is included in releases prior to FreeBSD?10.1, or
    submit issues using the `problem report
    form <https://bugs.FreeBSD.org/submit/>`__. If a problem report has
    not received any attention, please engage the `community mailing
    lists <../../../..community/mailinglists.html>`__.

The FreeBSD core team
    The *FreeBSD core team* would be equivalent to the board of
    directors if the FreeBSD?Project were a company. The primary task of
    the core team is to make sure the project, as a whole, is in good
    shape and is heading in the right directions. Inviting dedicated and
    responsible developers to join our group of committers is one of the
    functions of the core team, as is the recruitment of new core team
    members as others move on. The current core team was elected from a
    pool of committer candidates in July 2014. Elections are held every
    2 years.

    .. raw:: html

       <div class="note" xmlns="">

    Note:
    ~~~~~

    Like most developers, most members of the core team are also
    volunteers when it comes to FreeBSD development and do not benefit
    from the project financially, so “commitment” should also not be
    misconstrued as meaning “guaranteed support.” The “board of
    directors” analogy above is not very accurate, and it may be more
    suitable to say that these are the people who gave up their lives in
    favor of FreeBSD against their better judgement!

    .. raw:: html

       </div>

Outside contributors
    Last, but definitely not least, the largest group of developers are
    the users themselves who provide feedback and bug fixes to us on an
    almost constant basis. The primary way of keeping in touch with
    FreeBSD's more non-centralized development is to subscribe to the
    `FreeBSD technical discussions mailing
    list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__
    where such things are discussed. See `Appendix?C, *Resources on the
    Internet* <eresources.html>`__ for more information about the
    various FreeBSD mailing lists.

    *`The FreeBSD Contributors
    List <../../../../doc/en_US.ISO8859-1/articles/contributors/article.html>`__*
    is a long and growing one, so why not join it by contributing
    something back to FreeBSD today?

    Providing code is not the only way of contributing to the project;
    for a more complete list of things that need doing, please refer to
    the `FreeBSD?Project web site <../../../../index.html>`__.

.. raw:: html

   </div>

In summary, our development model is organized as a loose set of
concentric circles. The centralized model is designed for the
convenience of the *users* of FreeBSD, who are provided with an easy way
of tracking one central code base, not to keep potential contributors
out! Our desire is to present a stable operating system with a large set
of coherent `application programs <ports.html>`__ that the users can
easily install and use — this model works very well in accomplishing
that.

All we ask of those who would join us as FreeBSD developers is some of
the same dedication its current people have to its continued success!

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

1.3.4.?Third Party Programs
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In addition to the base distributions, FreeBSD offers a ported software
collection with thousands of commonly sought-after programs. At the time
of this writing, there were over 24,000 ports! The list of ports ranges
from http servers, to games, languages, editors, and almost everything
in between. The entire Ports Collection requires approximately 500?MB.
To compile a port, you simply change to the directory of the program you
wish to install, type ``make install``, and let the system do the rest.
The full original distribution for each port you build is retrieved
dynamically so you need only enough disk space to build the ports you
want. Almost every port is also provided as a pre-compiled “package”,
which can be installed with a simple command (``pkg install``) by those
who do not wish to compile their own ports from source. More information
on packages and ports can be found in `Chapter?5, *Installing
Applications: Packages and Ports* <ports.html>`__.

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

1.3.5.?Additional Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All recent FreeBSD versions provide an option in the installer (either
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
or
`bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__)
to install additional documentation under
``/usr/local/share/doc/freebsd`` during the initial system setup.
Documentation may also be installed at any later time using packages as
described in `Section?24.3.2, “Updating Documentation from
Ports” <updating-upgrading-documentation.html#doc-ports-install-package>`__.
You may view the locally installed manuals with any HTML capable browser
using the following URLs:

.. raw:: html

   <div class="variablelist">

The FreeBSD Handbook
    ```/usr/local/share/doc/freebsd/handbook/index.html`` <file://localhost/usr/local/share/doc/freebsd/handbook/index.html>`__

The FreeBSD FAQ
    ```/usr/local/share/doc/freebsd/faq/index.html`` <file://localhost/usr/local/share/doc/freebsd/faq/index.html>`__

.. raw:: html

   </div>

You can also view the master (and most frequently updated) copies at
``http://www.FreeBSD.org/``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+------------------------------+--------------------------------------------------------+
| `Prev <nutshell.html>`__?   | `Up <introduction.html>`__   | ?\ `Next <bsdinstall.html>`__                          |
+-----------------------------+------------------------------+--------------------------------------------------------+
| 1.2.?Welcome to FreeBSD!?   | `Home <index.html>`__        | ?Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later   |
+-----------------------------+------------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
