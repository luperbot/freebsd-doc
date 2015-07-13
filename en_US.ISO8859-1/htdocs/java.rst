=====================
FreeBSD Java? Project
=====================

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

FreeBSD Java? Project
=====================

|Jump to Java?|
Getting Java
------------

There are two choices of Java Development Kits on FreeBSD:

-  OpenJDK
   ~~~~~~~

   The OpenJDK? project provides a native open-source implementation of
   the Java? SE Platform and is available in versions 6 and 7 for all
   supported FreeBSD releases on the i386 and amd64 platforms. Both
   versions can be installed using the usual methods of package
   installation (``openjdk6`` and ``openjdk7``)

   To install OpenJDK? 7 package use the pkg(8) utility:

   | ``pkg install openjdk7``
   |  or
   |  ``cd /usr/ports/java/openjdk7       make install clean       ``

   OpenJDK? 7 is frequently updated, and it is suggested to refer to a
   `revision
   log <http://svnweb.freebsd.org/ports/head/java/openjdk7/Makefile?view=log>`__
   for detailed release history. Additionally, one may choose to review
   more information at
   `FreshPorts <http://www.freshports.org/java/openjdk7>`__.

   OpenJDK? 6 is frequently updated, and it is suggested to refer to a
   `revision
   log <http://svnweb.freebsd.org/ports/head/java/openjdk6/Makefile?view=log>`__
   for detailed release history. Additionally, one may choose to review
   more information at
   `FreshPorts <http://www.freshports.org/java/openjdk6>`__.

-  Oracle JDK for Linux
   ~~~~~~~~~~~~~~~~~~~~

   This port installs the Java Development Kit from Oracle which was
   built for Linux. It will run under FreeBSD using the Linux
   compatibility.

   ``cd /usr/ports/java/linux-sun-jdk17     make install clean     ``

   **Note:** Please note that due to the current licensing policy the
   Oracle JDK on FreeBSD binaries can not be distributed and you are
   only permitted to use them personally. For the same reason, the
   sources must be fetched manually.

-  Legacy Native JDK
   ~~~~~~~~~~~~~~~~~

   The FreeBSD Foundation is no longer providing supported Java? JDK?
   and JRE? packages based on Sun's partner sources. Older packages for
   Java? JDK? and JRE? 5.0 and 6.0 are still available below for
   reference and legacy use only, but are no longer supported.

   Further information about downloading the unsupported binaries is
   available from the `FreeBSD Foundation Java?
   Downloads <http://www.FreeBSDFoundation.org/java>`__ page.

Documentation
-------------

-  `Creating
   Ports <../../doc/en_US.ISO8859-1/books/porters-handbook/using-java.html>`__

I want to help by...
--------------------

... testing
~~~~~~~~~~~

The best thing you can do is download the latest release, install it,
and try all your favorite Java applications. If they don't work, see
below.

... reporting a bug
~~~~~~~~~~~~~~~~~~~

If you find an application that does not work, or crashes, here are the
steps you should follow before reporting it:

#. Try it again.
#. Check your settings for this application. Check to see if you made a
   mistake in starting it up.
#. Try it on a different platform. If you have access to a reference
   platform, try it there. (We need to determine if it is an application
   error, a Java bug, or a FreeBSD specific bug.)
#. Narrow down the problem. If it is your own code, narrow down the bug
   to the offending code. Otherwise, determine the steps required to
   reproduce the problem.
#. Notify the JDK porting team. Send email to freebsd-java@FreeBSD.org.
   Be sure to include the steps you have followed.
#. Finally, and most importantly, be willing to work with the team to
   fix the problem.

...writing documentation
~~~~~~~~~~~~~~~~~~~~~~~~

Everyone can help here. If you have a suggestion to add to the
documentation, write it up and send it to freebsd-java@FreeBSD.org

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
.. |Jump to Java?| image:: j2j.gif
   :target: http://java.sun.com/
