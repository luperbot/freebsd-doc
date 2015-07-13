=========================================
Ports and Packages for Supported Releases
=========================================

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

Ports and Packages for Supported Releases
=========================================

Support of FreeBSD releases by ports and the ports infrastructure
matches the `policies set out by the FreeBSD Security
Officer <../security/#sup>`__. Once a major branch X reaches its EOL
date, the "last known good" ports tree will be tagged with the
``RELEASE_X_EOL`` tag as a convenience to those remaining users who
intend to self-support their installations. This tag is not supported in
any way and security fixes will not be applied. Usage is therefore
highly discouraged and should only be used as a last resort.

For all supported major src branches, all ports will be included in an
automated quality assurance procedure which will build, install,
package, and deinstall each port on all `Tier 1
platforms <../doc/en_US.ISO8859-1/articles/committers-guide/archs.html#AEN1259>`__.
Maintainers and committers are notified of failures detected during
testing. Ports that are known not to build or run on a given supported
branch or platform will be marked as such.

Prebuilt binary packages will also be provided for all major branches
and Tier 1 platforms and will be made available via anonymous FTP from
`a worldwide set of mirror
sites <../doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__.
Package builds will use the oldest supported minor release within each
major branch to ensure ABI and KBI backwards compatibility within each
major branch, and support all minor versions of each major branch,
including ``-RELEASE`` and ``-STABLE``.

The current package sets and estimated lifetimes of the currently
supported branches are given below. The *Estimated EoL (end-of-life)*
column gives the earliest date on which that branch is likely to be
dropped.

+----------------+---------------+------------------+-----------------------+--------------------------+
| Branch         | Release       | Package Branch   | Package Set           | Estimated EoL            |
+================+===============+==================+=======================+==========================+
| RELENG\_8      | n/a           | RELENG\_8\_3     | packages-8-stable     | last release + 2 years   |
+----------------+---------------+------------------+-----------------------+--------------------------+
| RELENG\_8\_4   | 8.4-RELEASE   | RELENG\_8\_4     | packages-8-stable     | June 30, 2015            |
+----------------+---------------+------------------+-----------------------+--------------------------+
| RELENG\_9      | n/a           | RELENG\_9\_1     | packages-9-stable     | last release + 2 years   |
+----------------+---------------+------------------+-----------------------+--------------------------+
| RELENG\_9\_1   | 9.1-RELEASE   | RELENG\_9\_1     | packages-9-stable     | December 31, 2014        |
+----------------+---------------+------------------+-----------------------+--------------------------+
| HEAD           | n/a           | HEAD             | packages-10-current   | Best Effort              |
+----------------+---------------+------------------+-----------------------+--------------------------+

Older releases are not maintained, ports and packages may not be able to
install or run. Users are strongly encouraged to upgrade to one of the
supported releases mentioned above.

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
