=======================
The FreeBSD.org Network
=======================

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

The FreeBSD.org Network
=======================

This page documents, for those with accounts on the FreeBSD.org network,
just what machine resources are currently available and the sorts of
jobs they are being provided for.

For a list of SSH host keys and their fingerprints for the public
FreeBSD.org machines, please see `this file <ssh-keys.asc>`__.

Developer FreeBSD.org hosts
---------------------------

These systems are available for FreeBSD developer / committer use.
Reference systems can be used for build tests etc.

+-----------------------+--------------+-----------+----------------------+
| Host                  | OS           | Type      | Purpose              |
+=======================+==============+===========+======================+
| eris                  | 10-STABLE    | ia64      | Reference machine.   |
+-----------------------+--------------+-----------+----------------------+
| flame                 | 10-STABLE    | sparc64   | Reference machine.   |
+-----------------------+--------------+-----------+----------------------+
| freefall              | 11-CURRENT   | amd64     | Shell Logins.        |
+-----------------------+--------------+-----------+----------------------+
| pluto                 | 10-STABLE    | ia64      | Reference machine.   |
+-----------------------+--------------+-----------+----------------------+
| ref[10\|9\|8]-amd64   | X-STABLE     | amd64     | Reference machine.   |
+-----------------------+--------------+-----------+----------------------+
| ref[11\|10]-i386      | X-STABLE     | i386      | Reference machine.   |
+-----------------------+--------------+-----------+----------------------+

Administrative FreeBSD.org hosts
--------------------------------

These systems perform various administrative services. Most have
restricted access.

+--------------+---------------------------------+
| Host         | Purpose                         |
+==============+=================================+
| ftp-master   | FTP Master (stage server).      |
+--------------+---------------------------------+
| skunkworks   | Perforce server.                |
+--------------+---------------------------------+
| svn          | Subversion master repository.   |
+--------------+---------------------------------+

Ports building cluster
----------------------

The ports building cluster is primarily managed by the Ports Management
team (portmgr).

+------------------+-----------------------------+
| Host             | Purpose                     |
+==================+=============================+
| beefy\ *[1-8]*   | Package building machines   |
+------------------+-----------------------------+

Hardware configurations
-----------------------

+-----------------------+-----------------------+
| Host                  | Hardware              |
+=======================+=======================+
| freefall              | Check ``dmesg(8)``.   |
+-----------------------+-----------------------+
| ref\ *[8-11]*-amd64   | Check ``dmesg(8)``.   |
+-----------------------+-----------------------+
| ref\ *[10-11]*-i386   | Check ``dmesg(8)``.   |
+-----------------------+-----------------------+

Machines are generally connected at 1Gbit/sec full-duplex to a dedicated
switch with redundant gigabit uplinks. All systems have logged serial
consoles and remote power management.

Administrative Policies
-----------------------

If the machine in question is "owned" by someone specific, please direct
queries to them first when asking about administrative issues, this
includes changes to user accounts or filesystem layout.

All new user accounts must be cleared with the admin staff, and are
given only to FreeBSD developers, either in the docs, ports or general
src hacking category. Accounts may be given to non-project developers if
they have a specific need to test something of a truly experimental
nature and need access to a FreeBSD machine for the purpose. See `New
Account Creation Procedure page <new-account.html>`__ for details on new
accounts. Accounts are not given to the general public for "vanity
domain" mail or other such uses. It would be a waste of time to ask.
Thanks.

`FreeBSD Internal Home <internal.html>`__

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
