========================================
Charter for the Release Engineering Team
========================================

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

-  `Developers <../projects/index.html>`__
-  `Developer's
   Handbook <../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Porter's Handbook <../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Source code repositories <../developers/cvs.html>`__
-  `Release Engineering <../releng/index.html>`__
-  `Platforms <../platforms/>`__
-  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
-  `Contributing <../doc/en_US.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Charter for the Release Engineering Team
========================================

The Release Engineering Team has the following responsibilities :

-  Setting and publishing the release schedule for Official Project
   releases of FreeBSD.

-  Documenting and formalizing the RE procedures, so that the process
   can continually be reviewed and improved. This includes more
   documentation about the ports cluster and package split procedures.

-  Setting and publishing "Code Freeze" dates, and acting as a
   change-review committee to decide which changes may be made to a
   branch during a code freeze. This includes freezes for HEAD when
   approaching a .0 release as well as the traditional ``releng/*`` code
   freeze pending a -STABLE release.

-  Creation and maintenance of ``releng/*`` branches of the ``src/``
   tree. This includes final authority over what commits are made (and
   remain in) the -STABLE branch prior to the branching of a release
   branch.

-  Working with core and/or the FreeBSD Foundation to codify a set of
   guidelines that vendors must meet if they are to be allowed to call a
   product "FreeBSD", or an "Official FreeBSD release".

-  Testing and integrating required packages from the ports collection
   onto the official project release media. Portmgr@ is responsible for
   managing the ``ports/`` code freeze and providing a complete package
   build of the re-distributable ports. re@ is then responsible for
   splitting those packages onto different ISOs as required by the
   release media. re@ is ultimately responsible for ensuring that all of
   the required packages are available on the FreeBSD release media, but
   portmgr@ cooperation is essential.

-  Coordinating with the FreeBSD Documentation Project, to ensure that a
   consistent set of documentation is provided for the release. This
   includes the ability to request that large disruptive changes not be
   made to the documentation set in the weeks leading up to a release.

-  Coordinating with the security officer team to ensure that pending
   FreeBSD releases are not affected by recently disclosed
   vulnerabilities. Also, approximately 1 week after a release, change
   approval control of release branches (``releng/X.Y/``) is transfered
   from the release engineers to the security-officer team. The exact
   transfer date is to be worked out by the two parties once it is clear
   that the release was a success. A heads up message should be sent to
   developers@ at that time.

-  Sending out messages to announce@FreeBSD.org on behalf of the project
   to announce new releases of FreeBSD.

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
