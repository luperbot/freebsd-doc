=================
Working with Hats
=================

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

-  `Documentation <../docs.html>`__
-  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
-  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
-  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
-  `Books and Articles Online <../docs/books.html>`__
-  `Publications <../publish.html>`__
-  `Web Resources <../docs/webresources.html>`__
-  `For Newbies <../projects/newbies.html>`__
-  `Documentation Project <../docproj/>`__
-  `Archive <https://docs.freebsd.org/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Working with Hats
=================

Warner Losh, member of the core team as of the writing of the lines
below, points out the following considerations and practices when
working with hats:

This is not an official statement from core, but rather one core
member's personal interpretation of core's position, both as a sitting
member of core and as a former security officer. This is only a
guideline, not as a cudgel for grievances. Much like style(9) is a
guideline for the source code, this document is not intended as an
absolute straight jacket.

When core appoints someone to a hat, they expect that person to be
responsible for an area of the source code tree. Core expects that
person to be the final authority in that area of the tree, or have
enough self knowledge to know that they are not and to seek qualified
help. Core expects that person to guide development in that area of the
tree. Sometimes this means taking an pro-active role in day to day
affairs, while other times this means taking a reactive role in
reviewing committed code.

When people submit patches that potentially impact this area of the
tree, core expects the hat or his appointed deputies to review the
patches appropriately. Core expects that the hat will work with the
patch submitter to correct issues that there may be with the patches.
Core expects the hat to offer solutions and work with the submitter to
reach a compromise. Core expects the hat to be courteous. It is
reasonable for hats to request that normal project rules be followed
when reviewing patches (for example, that they generally conform to
style(9) or the prevailing style of the file, that style and content
changes be separated.).

When a dispute arises, core expects the hat to make his or her best
efforts to compromise or otherwise resolve the dispute. The hat is
expected to be courteous to all parties involved. In extreme cases, core
recognizes that hats may need to wield a big stick and say "no, that is
not acceptable and cannot go in (or must be backed out)." Core views
this last power as one of last resort, and would frown on hats using
that either too often or as the first response.

Often real life interferes with a hat's ability to perform their duties.
A condition that core generally imposes upon the hats of the world is
that they have a deputy that can act in their absence. This deputy is
expected to be an active participant in the team that the hat puts
together and should be conversant with all the issues that surround the
part of the tree that the hat is guiding. The deputy is expected to be
able to act in the absence of the hat. For example, the security officer
deputies send out security advisories when the SO is not around. In
extreme cases, the deputy can defer an issue until the hat returns, but
that is expected to be the exception rather than the rule, especially if
the hat's return is far in the future.

Hats are answerable to core. If they are doing good jobs, core will
leave them alone. If they are doing a bad job, core has the option to
remove them. Hats are expected to work with core if core has issues with
their performance of their duties. They serve at the pleasure of core.

Core sometimes will impose additional, specific requirements for a given
hat that do not apply to all hats. These conditions may change over
time.

Committers and others working with hats are expected to use common
sense, and be polite to the hats. They are expected to work with the hat
and his team to come to a solution acceptable to everybody. In the event
that no compromise can be reached, the committers are expected to accept
the decisions of the hat with good grace. In exceptional cases, these
decisions can be appealed to core. However, core generally will not
override the decisions of the hats that it appoints unless the hat acted
in bad faith or arbitrarily. Core is not a technical review board, and
has created the hats as mini-TRBs to give dispute resolution a proper
framework.

If a committer feels that a hat is abusing his or her power, or being
regularly rude to contributors, then they should bring the matter to
core. This problem can be technical, social, procedural, or some
combination or subset of these. Core will hear the case and reach a
decision, and expects both sides to abide by their decision. Core
appreciates specific complaints rather than general ones as those are
easier to resolve.

Core expects committers to work together in the appropriate mailing
lists to resolve their issues. The hat and his team should be relatively
rarely involved in their role as hat, and instead should usually be just
another committer. (The one exception to this is the security officer
hat, which needs to secretly solve vulnerabilities before they are
announced.) The hat should be a "first among equals," not a chairman.

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
