=====================================
Policies of the Ports Management Team
=====================================

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

-  `Home <../>`__

-  `About <../about.html>`__

   -  `Introduction <../projects/newbies.html>`__
   -  `Features <../features.html>`__
   -  `Advocacy <../advocacy/>`__
   -  `Marketing <../marketing/>`__
   -  `Privacy Policy <../privacy.html>`__

-  `Get FreeBSD <../where.html>`__

   -  `Release Information <../releases/>`__
   -  `Release Engineering <../releng/>`__

-  `Documentation <../docs.html>`__

   -  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../docs/books.html>`__

-  `Community <../community.html>`__

   -  `Mailing Lists <../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../usergroups.html>`__
   -  `Events <../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../support.html>`__

   -  `Vendors <../commercial/commercial.html>`__
   -  `Security Information <../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../donations/>`__

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

-  `About <../about.html>`__
-  `Features <../features.html>`__
-  `Applications <../applications.html>`__
-  `Advocacy <../advocacy/>`__
-  `Marketing <../marketing/>`__
-  `Administration <../administration.html>`__
-  `News <../news/newsflash.html>`__
-  `Events <../events/events.html>`__
-  `Press <../news/press.html>`__
-  `Multimedia <../multimedia/multimedia.html>`__
-  `Artwork <../art.html>`__
-  `Logo <../logo.html>`__
-  `Donations <../donations/>`__
-  `Legal Notices <../copyright/>`__
-  `Privacy Policy <../privacy.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Policies of the Ports Management Team
=====================================

In accordance with its `Charter <charter.html>`__, the Ports Management
Team has adopted certain policies to try to meet each of its goals.

`EOL Policies of Ports and Ports Intrastructure <policies_eol.html>`__

Assure The Integrity Of The Ports Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To help assure the integrity of the Ports Collection, portmgr acts as
sole committer for certain files that are integral to it, such as
``bsd.port.mk``. Since the ports tree is not branched (unlike some of
the other BSD projects), any fatal error in these files will be quickly
picked up by the many users who run automated updates of their ports.

portmgr also runs periodic builds of proposed large changes to the Ports
Collection on a dedicated area of the automated `ports building
cluster <http://pointyhat.FreeBSD.org>`__. Examples of changes that
should be tested here before committing include:

-  changes to ``bsd.port.mk``

-  changes to packages with many dependencies, including X11 servers,
   GNOME, KDE, autotools, and so forth

-  changes that change the "accepted best practice" for ports Makefiles,
   such as definitions or usage of common make variables (or
   ``Makevar``\ s). (e.g. consolidation of various implementations of
   USE\_\*, WITH\_\*, and so forth)

-  large repocopies (such as when an existing port category is divided
   up)

Again, since the ports tree is not branched, any large-scale failures
that might be caused by any of the above need to be caught first before
a large number of user installations are affected.

At other times, especially during the preparations for a new release,
there are `other restrictions on when commits are
allowed <policies_committing.html>`__.

portmgr reserves the right to act as final arbiter of other commits in
certain unusual cases, such as: commits that in their opinion
destabilize the Ports Collection; violate the Principle Of Least
Astonishment for FreeBSD's users; or in cases of inter-committer
disputes that can not be solved among the committers themselves.

Maintain The Automated `Ports Building Cluster <http://pointyhat.FreeBSD.org>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

portmgr maintains a set of machines that automatically build packages on
combinations of FreeBSD source tree versus CPU architecture (in our
terminology, ``build environments`` or ``buildenv``\ s). Where license
distribution permits, the resulting packages are regularly uploaded to
the main FTP mirror as the "new latest package" so that they are
available for download by FreeBSD users. Port build failures are
reported to the responsible maintainers and/or committers for the
appropriate corrective action.

In some cases ports may become broken by changes to the FreeBSD base
system (src/ tree). In such a case, the Ports Management Team expects
the responsible Source Committer to develop fixes to the affected ports,
in consultation with the relevant port maintainers.

Work With The FreeBSD Security Team
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Work with FreeBSD Ports and Documentation Committers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

portmgr will attempt to help keep the `FreeBSD Porter's
Handbook <../doc/en_US.ISO8859-1/books/porters-handbook/index.html>`__
up to date with what it believes to be the "best practices" for
individual ports.

(The intent is not just to lay down 'rules' but to say 'here is why
something that we advocate as The Right Thing in the ports Makefiles is
done.' In particular, there are a number of "edge cases" that
``bsd.*.mk`` has some very convoluted code to handle -- such as ensuring
that ports can be installed from CD-ROM, over NFS, and so forth -- and
failing to understand these issues can lead to maintainers using
shortcuts that will not work in these edge cases.)

portmgr is not the sole owner of the Porter's Handbook, as it is
actually in the ``doc/`` tree. We welcome PR submitters and ``doc``
committers to work on it to add documentation that helps to clarify
existing practice. However, we would like to request, as a courtesy, the
right to review any changes that would seem to change existing practice.

In addition, there has been recent discussion about creating a "Rights
And Responsibilities of FreeBSD Ports Maintainers and Committers"
document. portmgr supports this effort and looks forward to being able
to review any drafts.

portmgr also is responsible for certain other documentation such as the
`ports-specific portions of the Committer's
Guide <../doc/en_US.ISO8859-1/articles/committers-guide/ports.html>`__
and the `Contributing to the FreeBSD Ports
Collection <../doc/en_US.ISO8859-1/articles/contributing-ports/>`__
article.

Respect The Legal Rights Of Authors Whose Works Are Installed Via The Ports Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To the extent possible with a volunteer project, portmgr will work to
ensure that the legal rights of authors whose works are installed via
the Ports Collection are respected. This includes making sure that the
appropriate entries are made to ``ports/LEGAL`` and to the ``makevars``
that control package building and thus automated distribution of
binaries.

In rare cases this may also require removing a port and all distfiles
and binaries if the original author demands it.

portmgr asks our volunteer committers to carefully consider authors'
licensing restrictions when committing new ports, since it is infeasible
for the members of portmgr to do so themselves due to the huge number of
ports.

Act As Arbiter Of First Resort For Disputes Between FreeBSD Community Members Such As Maintainers And Committers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

portmgr encourages members of the FreeBSD community to work together in
accordance with the principles set out in the Committer's Guide. In case
of disputes, it reserves the right to abitrate, subject to review by the
Core Team.

Manage Commit Access To The Ports Tree
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The FreeBSD Core Team has delegated the responsibility to manage commit
access to the ``ports/`` tree to portmgr. Core reviews granting and
revocation of commit bits and has final authority over all the entire
FreeBSD repositories.

New Ports Committers are proposed by an existing Ports Committer who
wishes to act as a mentor. The proposals should include a brief summary
of the history of contributions made by the proposed new committer such
as number of PRs submitted, number of ports currently maintained, and
existing commit bits in other trees, if any.

In its votes the team will consider that history as well as any other
relevant factors. The results of the votes are made available to the
FreeBSD developer community.

In accordance with practice elsewhere in the project, inactive Ports
Committers are `periodically
contacted <policies_contributors.html#commit_privileges>`__ to enquire
about their status and interest in continuing to work with the ports
tree. Committers who do not respond to such email, or who respond in the
negative, have their commit bits reclaimed for safekeeping. Currrently,
this period is one year.

In unusual cases it may become necessary to remove Ports Committers for
other reasons. This will only be done after serious deliberation, and is
subject to review by Core.

Establish Guidelines And Policies Governing The Rights And Responsibilities Of Ports Committers And Maintainers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

portmgr has the responsibility to establish guidelines and policies
governing the rights and responsibilities of Ports Committers and
maintainers, such as expected standards of maintainership, conditions
under which maintainers may be overridden or removed, and other
policies.

To ensure that ports Problem Reports are handled in a timely manner,
portmgr has established a guideline about how long a PR assigned to a
committer may remain open before being eligible for being committed by
another committer via a `"maintainer
timeout" <policies_contributors.html#pr_timeout>`__. This time period
applies to such things as updates that do not require a regression run;
for other updates, please contact portmgr directly. The time period does
not count ports freezes and generally recognized holidays.

In addition, to ensure that ports are maintained in a timely fashion,
portmgr has established a guideline about how long a port maintainer may
be inactive before `forfeiting
maintainership <policies_contributors.html#maintainer_reset>`__.
"inactive" is not interpreted strictly, but is intended to encompass
such things as unresolved open PRs, commits made by others via
maintainer timeouts, and unresolved build problems.

The intent of these policies is not to assign punishment or blame, but
to reflect the fact that the software installed by the Ports Collection
undergoes rapid development that is outside FreeBSD's control. Part of
the responsibility that a ports maintainer accepts is to try to keep a
port working and as up-to-date as feasible. It is unfair to our users to
let unfixed problems languish and stale versions remain. However, we
also recognize that all of our maintainers and committers are volunteers
just as we are, and that as with any volunteer project, it is easy to
overcommit, or lose interest in a particular port.

Maintainers and committers who feel overcommitted or have lost interest
in any particular port should feel free to ask for new volunteers and/or
reassignment of the port back to the general pool. Not only will this
help keep the Ports Collection current, but hopefully will help prevent
volunteer burnout.

Help Prioritize Future Directions For The Overall Ports Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

portmgr recognizes that the development and evolution of the Ports
Collection is primarily driven by the work of community members.
However, due to the unbranched nature of the Ports Collection, it is
sometimes necessary to coordinate, or even choose among, any proposed
changes.

To some extent this involves choosing which patches are adopted for
testing on the build cluster, but it also involves such issues as
working to build consensus over architectural decisions, creating lists
of "interesting projects", and so forth.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../search/index-site.html>`__ \| `Legal
Notices <../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../layout/images/logo-red.png
   :target: ..
