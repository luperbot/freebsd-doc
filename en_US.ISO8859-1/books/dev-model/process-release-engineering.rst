========================
6.8.?Release engineering
========================

.. raw:: html

   <div class="navheader">

6.8.?Release engineering
`Prev <process-reactions.html>`__?
Chapter?6.?Processes
?\ `Next <tools.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.8.?Release engineering
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD project has a Release Engineering team with a principal
release engineer that is responsible for creating releases of FreeBSD
that can be brought out to the user community via the net or sold in
retail outlets. Since FreeBSD is available on multiple platforms and
releases for the different architectures are made available at the same
time, the team has one person in charge of each architecture. Also,
there are roles in the team responsible for coordinating quality
assurance efforts, building a package set and for having an updated set
of documents. When referring to the release engineer, a representative
for the release engineering team is meant.

When a release is coming, the FreeBSD project changes shape somewhat. A
release schedule is made containing feature- and code-freezes, release
of interim releases and the final release. A feature-freeze means no new
features are allowed to be committed to the branch without the release
engineers' explicit consent. Code-freeze means no changes to the code
(like bugs-fixes) are allowed to be committed without the release
engineers explicit consent. This feature- and code-freeze is known as
stabilising. During the release process, the release engineer has the
full authority to revert to older versions of code and thus "back out"
changes should he find that the changes are not suitable to be included
in the release.

There are three different kinds of releases:

.. raw:: html

   <div class="orderedlist">

#. .0 releases are the first release of a major version. These are
   branched of the -CURRENT branch and have a significantly longer
   release engineering cycle due to the unstable nature of the -CURRENT
   branch

#. .X releases are releases of the -STABLE branch. They are scheduled to
   come out every 4 months.

#. .X.Y releases are security releases that follow the .X branch. These
   come out only when sufficient security fixes have been merged since
   the last release on that branch. New features are rarely included,
   and the security team is far more involved in these than in regular
   releases.

.. raw:: html

   </div>

For releases of the -STABLE-branch, the release process starts 45 days
before the anticipated release date. During the first phase, the first
15 days, the developers merge what changes they have had in -CURRENT
that they want to have in the release to the release branch. When this
period is over, the code enters a 15 day code freeze in which only bug
fixes, documentation updates, security-related fixes and minor device
driver changes are allowed. These changes must be approved by the
release engineer in advance. At the beginning of the last 15 day period
a release candidate is created for widespread testing. Updates are less
likely to be allowed during this period, except for important bug fixes
and security updates. In this final period, all releases are considered
release candidates. At the end of the release process, a release is
created with the new version number, including binary distributions on
web sites and the creation of a CD-ROM images. However, the release is
not considered "really released" until a `PGP <tool-pgp.html>`__-signed
message stating exactly that, is sent to the mailing list
freebsd-announce; anything labelled as a "release" before that may well
be in-process and subject to change before the PGP-signed message is
sent. `:sup:`[11]` <#ftn.idp64465360>`__.

The releases of the -CURRENT-branch (that is, all releases that end with
“.0”) are very similar, but with twice as long timeframe. It starts 8
weeks prior to the release with announcement of the release time line.
Two weeks into the release process, the feature freeze is initiated and
performance tweaks should be kept to a minimum. Four weeks prior to the
release, an official beta version is made available. Two weeks prior to
release, the code is officially branched into a new version. This
version is given release candidate status, and as with the release
engineering of -STABLE, the code freeze of the release candidate is
hardened. However, development on the main development branch can
continue. Other than these differences, the release engineering
processes are alike.

.0 releases go into their own branch and are aimed mainly at early
adopters. The branch then goes through a period of stabilisation, and it
is not until the `Release Engineering
Team <official-hats.html#role-releng>`__ decides the demands to
stability have been satisfied that the branch becomes -STABLE and
-CURRENT targets the next major version. While this for the majority has
been with .1 versions, this is not a demand.

Most releases are made when a given date that has been deemed a long
enough time since the previous release comes. A target is set for having
major releases every 18 months and minor releases every 4 months. The
user community has made it very clear that security and stability cannot
be sacrificed by self-imposed deadlines and target release dates. For
slips of time not to become too long with regards to security and
stability issues, extra discipline is required when committing changes
to -STABLE.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?6.8.?Process summary: release engineering

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Process summary: release engineering|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

These are the stages in the release engineering process. Multiple
release candidates may be created until the release is deemed stable
enough to be released.

[`FreeBSD, 2002E <bibliography.html#freebsd-releng>`__]

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64465360" class="footnote">

`:sup:`[11]` <#idp64465360>`__ Many commercial vendors use these images
to create CD-ROMs that are sold in retail outlets.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------+----------------------------+
| `Prev <process-reactions.html>`__?   | `Up <model-processes.html>`__   | ?\ `Next <tools.html>`__   |
+--------------------------------------+---------------------------------+----------------------------+
| 6.7.?Reacting to misbehaviour?       | `Home <index.html>`__           | ?Chapter?7.?Tools          |
+--------------------------------------+---------------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Process summary: release engineering| image:: proc-releng.png
