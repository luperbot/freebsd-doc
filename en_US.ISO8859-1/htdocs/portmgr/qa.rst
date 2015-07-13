=====================================================
Quality Assurance Tasks for the Ports Management Team
=====================================================

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

Quality Assurance Tasks for the Ports Management Team
=====================================================

There are a number of tasks that the Ports Management Team undertakes to
try to improve the quality of the Ports Collection. These fall into two
main categories: `activities during a release
cycle <#qa-before-release>`__ and `activities between release
cycles <#qa-between-releases>`__.

Activities During a Release Cycle
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Work with the `Release Engineering Team <../releng/index.html>`__ to
   coordinate the release schedule.

-  Work with the RE team to determine which pre-built packages can be
   included on the default install ISOs.

-  Manage commits to the CVS tree for package builds via the following
   steps:

   #. Institute a freeze and produce packages for all the appropriate
      architectures. Often this process has to be repeated because
      either bugs are identified in various ports, or changes to the src
      tree create a risk that the packages that have already been built
      would not work with those changes.

      To make sure that package builds are consistent and correct, *all*
      commits must be approved by portmgr during a freeze. Changes that
      are generally approved are:

      -  fixes to make a package build at all;

      -  security fixes to critical packages;

      -  problems that are noticed with licensing issues.

      Unfortunately, due to the sheer size of the Ports Collection and
      the speed that applications are developed, it is impossible to fix
      every single problem for a release.

   #. The tree is then locked for all commits and a CVS tag is laid
      down.

   #. The tree is then unlocked and a ``slush`` is announced. The intent
      of this state is to allow routine changes to be made to the Ports
      Collection, but with the note that these changes will not ship on
      the release ISOs. What we particularly want to avoid is `sweeping
      changes <implementation.html#sweeping_changes>`__.

      The reason we want to avoid these commits is if some kind of
      show-stopper problem is found (either security- or license-
      related) such that we need to make a change that can go on the
      release ISOs, we will need to slip the CVS tag on the changed
      file(s). By allowing unlimited commits, the risk is high that any
      such change would involve having to recreate all the packages all
      over again, resulting in an endless release cycle.

   Only once the RE team and portmgr are happy with the final state of
   the release ISOs is the ports tree completely available for commits
   again.

Activities Between Release Cycles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Manage the `Ports Build Cluster <http://pointyhat.FreeBSD.org>`__
   machines. These machines continually build packages on all possible
   combinations of OS release and CPU architecture (in our terminology,
   ``build environments``.)

   These builds also produce error logs for packages that do not build
   correctly (see the above URL). Periodically, the team marks these
   ports as BROKEN so that maintainers may be notified. (See below.)

   Successfully built packages (at least, the ones that are freely
   redistributable) are also copied to the master FTP server and thus
   become the default "latest package" for installations that use
   packages rather than ports.

-  Notify the FreeBSD community of problems within the Ports Collection
   so that problems do not get overlooked. To do this, there are a
   number of emailed reports. Ones marked ``public`` are posted to
   freebsd-ports.

   -  a public list of all ports to be removed due to security problems,
      build failures, or general obsolescence, unless they are fixed
      first.

   -  private email to all maintainers of the affected ports (including
      ports dependent on the above).

   -  private email to all maintainers of ports that are already marked
      BROKEN and/or FORBIDDEN.

   -  private email to maintainers who are not committers, who have PRs
      filed against their ports (to flag PRs that might never have been
      Cc:ed to them).

   -  public email about port commits that break building of INDEX.

   -  public email about port commits that send the revision metadata
      backwards (and thus confuse tools like portupgrade).

   -  a public list of all ports that have at least one file that fails
      to fetch from any non-FreeBSD mastersite. For the complete list of
      results for all files versus all mastersites, see `Emanuel Haupt's
      port survey <http://people.freebsd.org/~ehaupt/distilator/>`__.

   -  private email to an affected port maintainer when a port is about
      to be marked BROKEN, Cc:ed to the last committer to the port.
      (This email is not automated but it should be sent as a courtesy.)

-  Remove expired ports. Ports that have been marked BROKEN for some
   time are marked DEPRECATED (with an EXPIRATION\_DATE) and then are
   removed if no one has fixed them by that time. The intent of this
   this process is to try to insure that if a user installs a port,
   there is the best possible change that it can be made to work.

   In other cases, ports are marked DEPRECATED when they have been
   replaced by a newer version and the older version is no longer
   maintained by the authors. The EXPIRATION\_DATE should generally be
   set at least two months in the future to allow everyone sufficient
   time to upgrade.

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
