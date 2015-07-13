==============================
FreeBSD 5.3 Code Freeze Policy
==============================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header And Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

.. raw:: html

   <div class="frontdonateroundbox">

.. raw:: html

   <div class="frontdonatetop">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatecontent">

`Donate to FreeBSD <https://www.FreeBSDFoundation.org/donate/>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatebot">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Peripheral Links
----------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

Search
------

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Site Navigation
---------------

.. raw:: html

   <div id="menu">

-  `Home <../../>`__

-  `About <../../about.html>`__

   -  `Introduction <../../projects/newbies.html>`__
   -  `Features <../../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Get FreeBSD <../../where.html>`__

   -  `Release Information <../../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Documentation <../../docs.html>`__

   -  `FAQ <../../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../../docs/books.html>`__

-  `Community <../../community.html>`__

   -  `Mailing Lists <../../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../../support.html>`__

   -  `Vendors <../../commercial/commercial.html>`__
   -  `Security Information <../../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Get FreeBSD <../../where.html>`__
-  `Release Information <../../releases/>`__

   -  Production Release:
      `10.1 <../../releases/10.1R/announce.html>`__
   -  Production Release:
      `9.3 <../../releases/9.3R/announce.html>`__
   -  Production Release:
      `8.4 <../../releases/8.4R/announce.html>`__

-  `Snapshot Releases <../../snapshots/>`__

   -  Upcoming Release:
      `10.2 <../../releases/10.2R/schedule.html>`__

-  `Ported Applications <../../ports/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD 5.3 Code Freeze Policy
==============================

Introduction
============

The following is the general policy for submitting and granting
approvals for committing during the code freeze for FreeBSD 5.3.
Flexibility will be granted when deemed appropriate by the Release
Engineering Team. The ultimate purpose of this policy, however, is to
minimize risks to the release process and help encourage good release
engineering practices.

This policy applies to the BETA1 - BETA4, RC1 - RC2, and RELEASE release
engineering cycles for the RELENG\_5 and RELENG\_5\_3 branches. During
the BETA cycle, the RELENG\_5 branch will be frozen and under strict
control of the Release Engineering team. The HEAD branch will be used to
validate changes that are intended for this branch. Once the
RELENG\_5\_3 branch is created, the RELENG\_5 branch will become
unfrozen and will be the validation ground for RELENG\_5\_3 changes.
Changes should be committed to all branches in sequence as appropriate.

Procedures
==========

When a branch is frozen by the release engineering team, all commits to
it must be approved by the team. This applies also to release
engineering team members as well as the rest of the developer community.
In other words, approval is mandatory. This largely applies to the src/
tree, as ports/, doc/ and www/ tree management is handled separately by
the ports and docs teams as appropriate.

To apply for a commit approval, a message must be sent to re@FreeBSD.org
with the description of exactly what files need to change and why.
Including a diff is encouraged, as is sending a copy of the commit
message from the parent branch if appropriate. A response should usually
be expected within 24 hours for less. Once approval is granted, the
commit should be done as soon as possible. Approved commits may be
canceled or overridden by the release engineering team if needed.

Blanket approvals are a special case that can be requested and granted
in certain circumstances. With a blanket approval, the release
engineering team is granting an individual the permission to do commits
without specific approval in a well defined and controlled area of the
tree. They are typically granted to those who are working on tier-2 and
tier-3 platforms or on features that are not fully integrated into the
tree. Blanket approvals are completely at the discretion of the release
engineering team and may be revoked or suspended as needed.

Policy
======

Build fixes
-----------

These are defined as changes that fix source files, makefiles, or other
build components so that the system can be compiled. This does not
include bug fixes to tools or compilers except in rare circumstances.
Build fixes must be committed to the parent branch first, if applicable,
and be tested in all default build configurations. For kernel sources,
this means testing on both GENERIC and LINT kernels. For userland
sources, this means completing and installing the build of the 'world'
target. For both userland and kernel sources, compiling on both 32-bit
and 64-bit platforms is mandatory for machine-independent code. There is
no minimum wait period for these fixes once testing is complete.

Bug fixes
---------

These are defined as changes that fix incorrect behavior in an existing
piece of code or subsystem in the src/ tree. All bugs must have a PR
number, a review by a senior member of the project, and be vetted
through the parent branch for at least 3 full days. We are often
pressured to skirt the rules and put high-priority fixes in early, but
we must resist that and rely on other tools like Perforce and diff/patch
to get early testing before committing to the tree.

Documentation fixes
-------------------

These are defined as changes to existing documentation in manual pages,
release notes, and doc articles and books. This does **not** generally
include comments in source files. Documentation fixes are classified
into trivial and content fixes. Trivial fixes are defined as changes
which do not need a technical review such as fixing a typo, wording,
markup error, and so on. Content fixes are defined as ones which need a
technical review, such as changes to the contents of documentation and
build infrastructure.

Documentation fixes for the src/ tree
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All changes must be committed to the parent branch first, vetted through
that branch for 2 days. Content fixes must be sent with a PR number when
the changes are large or involve one of the TODO items (these are
periodically posted to the freebsd-doc@ mailing list during the release
cycle, and should also be filed as PRs). When the changes are
self-explaining, send them to re@ as an MFC request. Changes that are
widespread or cover significant technical information should be reviewed
without exception.

Documentation fixes for the doc/ tree
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Similar policy is applied to the doc/ tree, but since doc/ is not
branched and is not frozen, trivial fixes are allowed to be committed
without explicit approval before BETA4. Content fixes must be committed
with a PR number when the changes are large or involve one of the TODO
items (these are periodically posted to the freebsd-doc@ mailing list
during the release cycle, and should also be filed as PRs). When the
changes are self-explaining, you can commit them into the doc/ tree.
When you are not sure if committing your patch without approval is
reasonable or not, please ask doceng@. Documentation Engineering Team
reserves the right to reject and back out your change. After BETA4, doc/
slush begins and non-critical changes to English documents are
discouraged.

Translations
~~~~~~~~~~~~

The above two policies also apply to translations, but all changes are
considered as trivial changes during the period before the doc/ slush is
over.

Feature additions and modifications
-----------------------------------

These are defined as changes that add new features to the system or
significantly change or improve existing features and behaviors, but are
not strictly bug fixes. These will only be considered for inclusion if
prior notice is given to the re@ and arch@ mail aliases and the work is
publically available in either patch form or in the FreeBSD Perforce
repository. We reserve the right to reject feature requests based on
risk to stability and risk to the published release schedule. Those that
are allowed need at least 7 days in the parent branch and a thorough
review by at least two parties. Mitigation of risk is highly important
here, so developers are highly encouraged to make their work be modular
and able to be removed or turned off to restore previous behavior.
Feature additions will not be allowed after BETA4.

Performance improvements
------------------------

These are defined as changes that are designed to optimize performance
in a measurable way. Any proposal here must be accompanied by documented
performance and regression testing on all affected arches. On arches
with a clear runtime distinction between UP and SMP, the testing must
include both. Thorough review by two or more senior people is also a
firm requirement. Performance improvements will not be allowed after
BETA3.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ../..
