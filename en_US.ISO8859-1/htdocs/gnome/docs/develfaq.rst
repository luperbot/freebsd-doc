===================================================
FreeBSD GNOME Project: GNOME Development Branch FAQ
===================================================

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

FreeBSD GNOME Project: GNOME Development Branch FAQ
===================================================

Contents
--------

#. `What are development versions of GNOME all about? <#q1>`__
#. `Should I track development versions? <#q2>`__
#. `How do I obtain development versions of GNOME stuff? <#q3>`__
#. `How do I keep everything up-to-date and in sync? <#q4>`__
#. `What should I do when something does not work? <#q5>`__
#. `How can I help with the development versions? <#q6>`__
#. `What is the current state of development GNOME on FreeBSD <#q7>`__

Full Text
---------

#. 

   **What are development versions of GNOME all about?**

   The development versions are the packages released by the GNOME
   project that will eventually become the stable (release) versions.
   There are three working branches of GNOME development:

   #. **STABLE** - The applications and libraries in the stable branch
      are considered "release quality," and are the versions that appear
      in the FreeBSD ports tree. The current stable version is GNOME
      2.32.
   #. **DEVELOPMENT** - In between stable releases are development
      releases. Traditionally, GNOME development releases have odd minor
      numbers (e.g. 2.3, 3.6, 3.(n\*2)-1). Development releases will
      become stable releases, and move from alpha to beta quality during
      their lifecycle. The development releases need testing by FreeBSD
      users to minimize the number of surprises when the new stable
      versions are committed to the FreeBSD SVN tree. This document is
      about the development branch. At any time the development branch
      for FreeBSD might be based of a stable GNOME release. However it
      will be tagged "development" here if it is the version that is
      work in progress by the FreeBSD GNOME team. The current
      development branch for FreeBSD is GNOME 3.6.
   #. **GIT** - Often newer-than-new, the GIT master versions of GNOME
      applications and libraries are alpha quality, or often completely
      unbuildable. The FreeBSD GNOME project pays attention to, but does
      not track the alpha quality code.

#. 

   **Should I track GNOME development versions?**

   If you are looking for a stable environment, absolutely not. Please
   only track the GNOME 3.6 branch if you wish to help identify bug and
   improve the FreeBSD GNOME project. You will find little sympathy if a
   development-quality GNOME application eats your homework.

#. 

   **How do I obtain the development versions of GNOME stuff?**

   `Marcus <mailto:marcus@FreeBSD.org>`__ maintains a SVN repository
   where all the development versions of the GNOME components for
   FreeBSD are housed. Instructions for how to check out the development
   ports module and how to merge it into the FreeBSD ports tree reside
   on the entrance page to his SVN repository. Please read carefully the
   instructions at
   http://www.marcuscom.com/viewvc/viewvc.cgi/marcuscom/.

   During the development cycle, FreeBSD-specific caveats and other
   useful information will be sent to marcuscom-devel@marcuscom.com. If
   you are tracking the GNOME development branch, you **must**
   `subscribe <http://www.marcuscom.com/mailman/listinfo/marcuscom-devel>`__
   to this list. You should also consider
   `subscribing <http://lists.freebsd.org/mailman/listinfo/freebsd-gnome>`__
   to freebsd-gnome@FreeBSD.org.

   In order to help with bug reports, be sure to add the following to
   ``/etc/make.conf`` so that gdb back traces contain useful
   information:

   ::

       WITH_DEBUG="yes"

   GNOME has an excellent guide for getting `useful back
   traces <https://wiki.gnome.org/GettingTraces>`__.

#. 

   **How do I keep everything up-to-date and in sync?**

   The short answer is that you need to use the ``marcusmerge`` script
   to merge the development tree with the FreeBSD ports tree. The
   ``marcusmerge`` script is available
   `here <http://www.marcuscom.com/downloads/marcusmerge>`__, and a man
   page on using the script is available
   `here <http://www.marcuscom.com/marcusmerge.8.html>`__. This script
   will merge the development ports tree into your main ports tree. From
   there, you can use ``portupgrade`` or ``portmaster`` to upgrade from
   2.32 to 3.6 and stay up-to-date afterwards.

   The long answer is that keeping up-to-date with the GNOME development
   branch is complicated. Sometimes components change in a way that
   makes ``portupgrade`` or ``portmaster`` fail, or causes strange end
   results. If you plan to track the development branch, it is a good
   idea to join the
   `freebsd-gnome <http://lists.FreeBSD.org/mailman/listinfo/freebsd-gnome>`__
   mailing list, as well as to join the *#freebsd-gnome* IRC channel on
   FreeNode (``irc.freenode.net``).

   If all of this sounds scary, or you need a desktop that "Just Works,"
   you should stick with the 2.32 version that is available in the
   FreeBSD ports tree.

#. 

   **What should I do when something does not work?**

   It depends. If you think the problem is truly a bug with the GNOME
   component, you can report a bug using **bug-buddy** or the GNOME
   `Bugzilla <http://bugzilla.gnome.org>`__ interface. If you think the
   problem lies in a FreeBSD port, or is FreeBSD-specific, send email to
   freebsd-gnome@FreeBSD.org, or report the problem on the
   *#freebsd-gnome* IRC channel on FreeNode.

   Please forward all relevant bug IDs to freebsd-gnome@FreeBSD.org so
   we can keep track of known issues. Thanks!

#. 

   **How can I help with the development versions?**

   Now that work on 3.6 has started, we need people to install it, and
   test things. If you are compiling 3.6 by hand, be sure to build
   `debugging symbols <../../gnome/docs/bugging.html>`__. Package users
   will have these symbols already.

#. 

   **What is the current state of development GNOME on FreeBSD?**

   2.32 is the latest version that was merged into the FreeBSD ports
   tree. Work is currently underway to make 3.6 stable.

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
