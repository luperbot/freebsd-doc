=================
Committer's Guide
=================

.. raw:: html

   <div class="navheader">

Committer's Guide
?
?
?\ `Next <pgpkeys.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1999-2015 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

This document provides information for the FreeBSD committer community.
All new committers should read this document before they start, and
existing committers are strongly encouraged to review it from time to
time.

Almost all FreeBSD developers have commit rights to one or more
repositories. However, a few developers do not, and some of the
information here applies to them as well. (For instance, some people
only have rights to work with the Problem Report database). Please see
`Section?20, “Issues Specific to Developers Who Are Not
Committers” <non-committers.html>`__ for more information.

This document may also be of interest to members of the FreeBSD
community who want to learn more about how the project works.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Administrative Details <index.html#admin>`__
`2. OpenPGP Keys for FreeBSD <pgpkeys.html>`__
`3. Kerberos and LDAP web Password for FreeBSD
Cluster <kerberos-ldap.html>`__
`4. Commit Bit Types <committer.types.html>`__
`5. Subversion Primer <subversion-primer.html>`__
`6. Setup, Conventions, and Traditions <conventions.html>`__
`7. Commit Log Messages <commit-log-message.html>`__
`8. Preferred License for New Files <pref-license.html>`__
`9. Keeping Track of Licenses Granted to the FreeBSD
Project <tracking.license.grants.html>`__
`10. Developer Relations <developer.relations.html>`__
`11. If in Doubt... <if-in-doubt.html>`__
`12. Bugzilla <bugzilla.html>`__
`13. Phabricator <ar01s13.html>`__
`14. Who's Who <people.html>`__
`15. SSH Quick-Start Guide <ssh.guide.html>`__
`16. Coverity? Availability for FreeBSD Committers <coverity.html>`__
`17. The FreeBSD Committers' Big List of Rules <rules.html>`__
`18. Support for Multiple Architectures <archs.html>`__
`19. Ports Specific FAQ <ports.html>`__
`20. Issues Specific to Developers Who Are Not
Committers <non-committers.html>`__
`21. Information About Google Analytics <google-analytics.html>`__
`22. Miscellaneous Questions <misc.html>`__

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

1.?Administrative Details
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *Login Methods*                           | `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__, protocol 2 only                                                                                                                                                                                                                                                                                                                                          |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *Main Shell Host*                         | ``freefall.FreeBSD.org``                                                                                                                                                                                                                                                                                                                                                                                                      |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *``src/`` Subversion Root*                | ``svn+ssh://``\ ``svn.FreeBSD.org``\ ``/base`` (see also `Section?5.2.3, “\ ``RELENG_*`` Branches and General Layout” <subversion-primer.html#svn-getting-started-base-layout>`__).                                                                                                                                                                                                                                           |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *``doc/`` Subversion Root*                | ``svn+ssh://``\ ``svn.FreeBSD.org``\ ``/doc`` (see also `Section?5.2.4, “FreeBSD Documentation Project Branches and Layout” <subversion-primer.html#svn-getting-started-doc-layout>`__).                                                                                                                                                                                                                                      |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *``ports/`` Subversion Root*              | ``svn+ssh://``\ ``svn.FreeBSD.org``\ ``/ports`` (see also `Section?5.2.5, “FreeBSD Ports Tree Branches and Layout” <subversion-primer.html#svn-getting-started-ports-layout>`__).                                                                                                                                                                                                                                             |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *Internal Mailing Lists*                  | developers (technically called all-developers), doc-developers, doc-committers, ports-developers, ports-committers, src-developers, src-committers. (Each project repository has its own -developers and -committers mailing lists. Archives for these lists may be found in files ``/home/mail/repository-name``-developers-archive and ``/home/mail/repository-name``-committers-archive on the ``FreeBSD.org`` cluster.)   |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *Core Team monthly reports*               | ``/home/core/public/monthly-reports`` on the ``FreeBSD.org`` cluster.                                                                                                                                                                                                                                                                                                                                                         |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *Ports Management Team monthly reports*   | ``/home/portmgr/public/monthly-reports`` on the ``FreeBSD.org`` cluster.                                                                                                                                                                                                                                                                                                                                                      |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| *Noteworthy ``src/`` SVN Branches*        | ``stable/8`` (8.X-STABLE), ``stable/9`` (9.X-STABLE), ``stable/10`` (10.X-STABLE), ``head`` (-CURRENT)                                                                                                                                                                                                                                                                                                                        |
+-------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ is
required to connect to the project hosts. For more information, see
`Section?15, “SSH Quick-Start Guide” <ssh.guide.html>`__.

Useful links:

.. raw:: html

   <div class="itemizedlist">

-  `FreeBSD Project Internal Pages <../../../../internal/>`__

-  `FreeBSD Project Hosts <../../../../internal/machines.html>`__

-  `FreeBSD Project Administrative
   Groups <../../../../administration.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+--------------------------------+
| ?   | ?   | ?\ `Next <pgpkeys.html>`__     |
+-----+-----+--------------------------------+
| ?   | ?   | ?2.?OpenPGP Keys for FreeBSD   |
+-----+-----+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
