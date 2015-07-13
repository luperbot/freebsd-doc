======================================
FreeBSD GNOME Project: Reporting a Bug
======================================

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

-  `Home <../../>`__

-  `About <../../about.html>`__

   -  `Introduction <../../projects/newbies.html>`__
   -  `Features <../../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Get FreeBSD <../../where.html>`__

   -  `Release Information <../../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Documentation <../../docs.html>`__

   -  `FAQ <../../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../../docs/books.html>`__

-  `Community <../../community.html>`__

   -  `Mailing Lists <../../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../../support.html>`__

   -  `Vendors <../../commercial/commercial.html>`__
   -  `Security Information <../../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../../donations/>`__

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

-  `FreeBSD/GNOME <../../gnome/index.html>`__

   -  `Installation Instructions <../../gnome/docs/faq2.html#q1>`__
   -  `Upgrade Instructions <../../gnome/docs/faq232.html#q2>`__
   -  `Available Applications <../../gnome/../ports/gnome.html>`__
   -  `How to Help <../../gnome/docs/volunteer.html>`__
   -  `Reporting a Bug <../../gnome/docs/bugging.html>`__
   -  `Screenshots <../../gnome/screenshots.html>`__
   -  `Contact Us <../../gnome/contact.html>`__

-  `Documentation <../../gnome/index.html>`__

   -  `FAQ <../../gnome/docs/faq2.html>`__
   -  `HAL FAQ <../../gnome/docs/halfaq.html>`__
   -  `2.30 to 2.32 Upgrade FAQ <../../gnome/docs/faq232.html>`__
   -  `Development Branch FAQ <../../gnome/docs/develfaq.html>`__
   -  `Creating Ports <../../gnome/docs/porting.html>`__
   -  `Known Issues <../../gnome/docs/faq232.html#q4>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD GNOME Project: Reporting a Bug
======================================

1. When should I make a bug report?
-----------------------------------

-  ***After*** running any build failure output through
   `gnomelogalyzer.sh </gnome/gnomelogalyzer.sh>`__.
-  ***After*** running ``portsnap`` to obtain the most recent ports
   tree.
-  ***After*** running ``portupgrade?-a`` or ``portmaster?-a`` to ensure
   that all applications are up-to-date. Do not forget to read in
   ``/usr/ports/UPDATING`` first before you upgrade those installed
   ports.
-  ***After*** searching through the FreeBSD GNOME `Mailing list
   archives <../../gnome/index.html#search>`__ to see if the problem has
   already been reported.
-  ***After*** deciding whether the problem is FreeBSD-specific, or is a
   bug in an application that would affect all users, on all operating
   systems. If you cannot determine if the problem is FreeBSD-specific
   or not, then send your problem to the `freebsd-gnome mailing
   list <mailto:freebsd-gnome@FreeBSD.org>`__, and we can help decide
   where the problem lies.

2. What to report?
------------------

Always report as much information as you can. Too much information is
always preferable to too little information. Superfluous information can
be filtered out; developers like to play guessing games with code, not
with bug reports.

A good bug report should at least include the following information:

-  Exact version of the operating system (usually output of
   ``uname -a``).

-  List of all packages installed on your system (output of
   ``pkg_info``).

-  Your environment (output of ``/usr/bin/env``).

-  If you are building from ports, note approximately how long it has
   been since you last updated your ports tree. If it has been more than
   a day, or if you have not run ``portupgrade?-a`` or
   ``portmaster?-a``, do not bother sending a bug report until you have
   run ``portsnap`` and ``portupgrade/portmaster``.

-  Information specific for each type of breakage:

   -  If a port will not build, provide a full log of the unsuccessful
      build by uploading it to any website or copy-and-paste to
      http://freebsd-gnome.pastebin.com. Try to avoid sending any
      attachments to the mailing list, because attachments sent to
      FreeBSD mailing lists are usually discarded by the mailing list
      software.
   -  If a program produces a core dump, provide a back trace. Back
      traces are only useful if the application (and possibly its
      dependencies) are compiled with debugging symbols. See these
      `instructions <http://live.gnome.org/GettingTraces>`__ for more
      information on obtaining useful back traces. In general, though,
      you can build and install your port with the following command to
      produce binaries that will have useful debugging symbols:
      ``make WITH_DEBUG="yes" install``
   -  If an application produces unexpected behavior, provide a clear
      and detailed description, including a description of the behavior
      that you were expecting.

If you have a solution or a workaround for the problem, then include it
into your report as well, even if you are not quite sure that it is a
proper fix. Even if the fix is not quite right, it could still point
others in the right direction.

3. Where to report?
-------------------

Once you are sure it is a new problem, there are several ways to report
a bug in GNOME running on FreeBSD: you could send a report to the
`freebsd-gnome mailing list <mailto:freebsd-gnome@FreeBSD.org>`__, file
a problem report in the `FreeBSD bug reporting
system <http://www.FreeBSD.org/support.html>`__, send your report to the
application's developers via the GNOME `bug tracking
system <http://bugzilla.gnome.org/>`__, or any combination of those.

-  If the problem is FreeBSD-specific (usually, this means a problem
   with building or upgrading), then report to the `freebsd-gnome
   mailing list <mailto:freebsd-gnome@FreeBSD.org>`__, or file a bug
   report through the `FreeBSD bug reporting
   system <http://www.FreeBSD.org/support.html>`__.

-  If the problem has to do with an application's behavior, report the
   problem directly to the application's developers through the GNOME
   project's `bug tracking system <http://bugzilla.gnome.org/>`__

-  If the problem is quite serious, not necessarily FreeBSD-specific,
   *and* you have a fix available, report it to both the FreeBSD GNOME
   team and the application's developers. This way, the application's
   developers can apply the patch upstream, and the FreeBSD GNOME team
   can apply the patch immediately to the ports tree without needing to
   wait for the next release.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ../..
