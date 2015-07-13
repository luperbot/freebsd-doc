=========================
FreeBSD Snapshot Releases
=========================

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

-  `Get FreeBSD <../where.html>`__
-  `Release Information <../releases/>`__

   -  Production Release:
      `10.1 <../releases/10.1R/announce.html>`__
   -  Production Release:
      `9.3 <../releases/9.3R/announce.html>`__
   -  Production Release:
      `8.4 <../releases/8.4R/announce.html>`__

-  `Snapshot Releases <../snapshots/>`__

   -  Upcoming Release:
      `10.2 <../releases/10.2R/schedule.html>`__

-  `Ported Applications <../ports/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Snapshot Releases
=========================

What Are Snapshots?
-------------------

As part of an ongoing effort to improve the overall release process
*before* a release actually slips out the door with problems, we are now
periodically producing interim test releases called *snapshots*. These
snapshots will be very similar to full releases, except that they might
not include all the bits included in a full release (such as packages
and updated documentation).

Getting Snapshots
-----------------

The latest snapshots made available can be found on the FreeBSD FTP
mirrors at the address ftp://ftp.freebsd.org/pub/FreeBSD/snapshots. They
can also be found in the same directory on other FTP `mirror
sites <../doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__.

Please note that sometimes the snapshots available to download may be
somewhat outdated.

Currently the snapshots of
`11-CURRENT <../doc/en_US.ISO8859-1/books/handbook/current-stable.html#CURRENT>`__,
`10-STABLE <../doc/en_US.ISO8859-1/books/handbook/current-stable.html#STABLE>`__,
and
`9-STABLE <../doc/en_US.ISO8859-1/books/handbook/current-stable.html#STABLE>`__,
are available in directories whose URLs have the format
``ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/<target>/<target_arch>/``
where ``<target>`` and ``<target_arch>`` represent the architecture for
which the snapshot was built. For each supported platform, the snapshot
includes ISO images of the ``bootonly``, ``release``, and ``memstick``
images.

Things You Might Want to Know
-----------------------------

In particular, before getting and installing a snapshot release, be
aware of following:

-  The snapshots are primarily for testing purposes and not fully tested
   compared to the releases. They may include experimental or degraded
   features that can corrupt your existing system.
-  The major release number will not be changed in the main distribution
   for each snapshot. It will *only* be changed on the installation
   medium so that you know when the snapshot was made. These are *not*
   releases, these are *snapshots*, and it is important that this
   distinction be preserved. Although people can and will, of course,
   refer to snapshots by date in email, do not confuse them.
-  Snapshots might not include package sets, but will generally include
   a ports tree.
-  Finally, we will not necessarily update the documentation. For
   example, ``README`` may still refer to a previous release. This is
   because that is much less important than getting the real bug fixes
   and new features out for testing. Please do not send a bug report
   about version numbers.

Your feedback on these snapshots is greatly welcome. They are not just
for our benefit - those who are coming to rely on FreeBSD for mission
critical applications should welcome a chance to get at more updated
bits in a structured fashion. You can also use these snapshots as
tangible evidence that your feedback is getting incorporated and that
you (hopefully) will not have any unpleasant surprises in the next
release. On the other hand, if you do send us hate mail next release and
it turns out that you never even tried the snapshots, well, it cuts both
ways!

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
