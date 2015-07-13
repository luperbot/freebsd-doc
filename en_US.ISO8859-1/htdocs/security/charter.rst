================================
FreeBSD Security Officer Charter
================================

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

-  `Support <../support.html>`__
-  `Vendors <../commercial/>`__

   -  `Software <../commercial/software_bycat.html>`__
   -  `Hardware <../commercial/hardware.html>`__
   -  `Consulting <../commercial/consult_bycat.html>`__
   -  `Internet Service Providers <../commercial/isp.html>`__
   -  `Miscellaneous <../commercial/misc.html>`__

-  `Security Information <../security/index.html>`__

   -  `Advisories <../security/advisories.html>`__
   -  `Errata Notices <../security/notices.html>`__
   -  `Supported Releases <../security/index.html#sup>`__
   -  `Unsupported Releases <../security/unsupported.html>`__
   -  `How to read FreeBSD Security
      Advisories <../doc/en_US.ISO8859-1/books/handbook/security-advisories.html>`__
   -  `Charter for the Security Officer and
      Team <../security/charter.html>`__

-  `Bug Reports <../support/bugreports.html>`__

   -  `Submit a Problem Report <https://bugs.FreeBSD.org/submit/>`__

-  `Web Resources <../support/webresources.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Security Officer Charter
================================

[?Accepted by -core February 2002?]

1. Introduction
~~~~~~~~~~~~~~~

The FreeBSD Security Officer's mission is to protect the FreeBSD user
community by keeping the community informed of bugs, exploits, popular
attacks, and other risks; by acting as a liaison on behalf of the
FreeBSD Project with external organizations regarding sensitive,
non-public security issues; and by promoting the distribution of
information needed to safely run FreeBSD systems, such as system
administration and programming tips.

2. Responsibilities
~~~~~~~~~~~~~~~~~~~

The responsibilities of the Security Officer include:

-  Resolving disputes involving security.
-  Resolving software bugs that affect the security of FreeBSD in a
   timely fashion.
-  Issuing security advisories for FreeBSD.
-  Responding to vendor inquiries regarding security issues.
-  Auditing as much code as possible, but particularly security- and
   network- related code.
-  Monitoring the appropriate channels for reports of bugs, exploits,
   and other circumstances that may affect the security of a FreeBSD
   system.
-  Participating in the architecture of FreeBSD in order to influence a
   positive impact on system security.
-  The Security Officer maintains the FreeBSD Security Officer PGP key.

3. Authorities
~~~~~~~~~~~~~~

The FreeBSD Core Team has delegated authority to the Security Officer in
matters of security, and the Security Officer is accountable to the Core
Team in the use of this authority. He is expected to act with common
sense and use appropriate discretion when using any of the appointed
powers. Any actions that conflict with the committers' guidelines
require particularly careful judgment.

Specifically, subject to the accountability constraints, the Security
Officer is granted the following powers:

-  Expedited commits: The Security Officer may forgo the usual
   committers' guidelines in areas of security.
-  Veto: The Security Officer has the final say in security matters, and
   may request the back-out of any commits or elimination of any
   subsystems that they consider detrimental to the security of FreeBSD.
-  Team: The Security Officer may maintain a Security Officer Team and
   delegate these powers and responsibilities at their discretion.
   Membership is selected by the Security Officer, but always includes
   emeritus security officers --- just when they thought they had paid
   their dues.
-  Mailing list: The security-officer@FreeBSD.org mailing list is
   administrated by the Security Officer.

4. Structure
~~~~~~~~~~~~

A new Security Officer is appointed by the previous Security Officer and
ratified by the Core Team. The Security Officer is accountable to the
Core Team.

The Security Officer Team members are selected by the Security Officer,
and they are accountable to the Security Officer and to the Core Team.
Security Officer Team members are expected to assist the Security
Officer in fulfilling their responsibilities and otherwise participate
in protecting the FreeBSD user community.

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
