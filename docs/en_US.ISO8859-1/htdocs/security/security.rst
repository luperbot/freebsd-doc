============================
FreeBSD Security Information
============================

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

FreeBSD Security Information
============================

Introduction
------------

FreeBSD takes security very seriously and its developers are constantly
working on making the operating system as secure as possible. This page
will provide information about what to do in the event of a security
vulnerability affecting your system

Reporting FreeBSD security incidents
------------------------------------

FreeBSD security issues specific to the operating system should be
reported to the `FreeBSD Security Team <mailto:secteam@FreeBSD.org>`__
or, if a higher level of confidentiality is required, PGP encrypted to
the `Security Officer Team <mailto:security-officer@FreeBSD.org>`__
using the `Security Officer PGP key <so_public_key.asc>`__. Additional
information can be found at the `reporting FreeBSD security
incidents <reporting.html>`__ page.

Table of Contents
-----------------

-  `Recent FreeBSD security vulnerabilities <#recent>`__
-  `How to update your system <#how>`__

Recent FreeBSD security vulnerabilities
---------------------------------------

A full list of all security vulnerabilities can be found `on this
page <advisories.html>`__.

How to update your system
-------------------------

For most users, the easiest way to update your supported FreeBSD 10.1 or
9.3 system is to use the following commands:

``# freebsd-update fetch     # freebsd-update install``
If that fails, follow the other instructions in the security advisory
you care about.

Supported FreeBSD releases
--------------------------

The designation and expected lifetime of all currently supported
branches are given below. The *Expected EoL (end-of-life)* column
indicates the earliest date on which support for that branch or release
will end. Please note that these dates may be pushed back if
circumstances warrant it.

+---------------+----------------+------------+---------------------+--------------------------+
| Branch        | Release        | Type       | Release Date        | Expected EoL             |
+===============+================+============+=====================+==========================+
| stable/8      | n/a            | n/a        | n/a                 | August 1, 2015           |
+---------------+----------------+------------+---------------------+--------------------------+
| releng/8.4    | 8.4-RELEASE    | Extended   | June 9, 2013        | August 1, 2015           |
+---------------+----------------+------------+---------------------+--------------------------+
| stable/9      | n/a            | n/a        | n/a                 | December 31, 2016        |
+---------------+----------------+------------+---------------------+--------------------------+
| releng/9.3    | 9.3-RELEASE    | Extended   | July 16, 2014       | December 31, 2016        |
+---------------+----------------+------------+---------------------+--------------------------+
| stable/10     | n/a            | n/a        | n/a                 | last release + 2 years   |
+---------------+----------------+------------+---------------------+--------------------------+
| releng/10.1   | 10.1-RELEASE   | Extended   | November 14, 2014   | December 31, 2016        |
+---------------+----------------+------------+---------------------+--------------------------+

Older releases are not maintained and users are strongly encouraged to
upgrade to one of the supported releases mentioned above. A list of
unsupported releases can be found `here <unsupported.html>`__.

Advisories are sent to the following FreeBSD mailing lists:

-  FreeBSD-security-notifications@FreeBSD.org
-  FreeBSD-security@FreeBSD.org
-  FreeBSD-announce@FreeBSD.org

The list of released advisories can be found on the `FreeBSD Security
Advisories <advisories.html>`__ page.

Advisories are always signed using the FreeBSD Security Officer `PGP
key <so_public_key.asc>`__ and are archived, along with their associated
patches, at the http://security.FreeBSD.org/ web server in the
`advisories <http://security.FreeBSD.org/advisories/>`__ and
`patches <http://security.FreeBSD.org/patches/>`__ subdirectories.

The FreeBSD Security Officer provides security advisories for *-STABLE
Branches* and the *Security Branches*. (Advisories are not issued for
the *-CURRENT Branch*.)

-  The -STABLE branch tags have names like ``stable/10``. The
   corresponding builds have names like ``FreeBSD 10.1-STABLE``.

-  Each FreeBSD Release has an associated Security Branch. The Security
   Branch tags have names like ``releng/10.1``. The corresponding builds
   have names like ``FreeBSD       10.1-RELEASE-p4``.

Issues affecting the FreeBSD Ports Collection are covered in `the
FreeBSD VuXML document <http://vuxml.FreeBSD.org/>`__.

Each branch is supported by the Security Officer for a limited time
only, and is designated as either *Normal* or *Extended*. The
designation is used as a guideline for determining the lifetime of the
branch as follows:

Normal
    Releases which are published from a -STABLE branch will be supported
    by the Security Officer for a minimum of 12 months after the
    release, and for sufficient additional time (if needed) to ensure
    that there is a newer release for at least 3 months before the older
    Normal release expires.
Extended
    Selected releases (normally every second release plus the last
    release from each -STABLE branch) will be supported by the Security
    Officer for a minimum of 24 months after the release, and for
    sufficient additional time (if needed) to ensure that there is a
    newer Extended release for at least 3 months before the older
    Extended release expires.

In the run-up to a Normal or Extended release, a number of -BETA and -RC
releases may be published. These releases are only supported for a few
weeks, as resources permit, and will not be listed as supported on this
page. Users are strongly discouraged from running these releases on
production systems.

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
