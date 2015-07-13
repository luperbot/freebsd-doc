===================================
How to Write FreeBSD Status Reports
===================================

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

-  `About <../../about.html>`__
-  `Features <../../features.html>`__
-  `Applications <../../applications.html>`__
-  `Advocacy <../../advocacy/>`__
-  `Marketing <../../marketing/>`__
-  `Administration <../../administration.html>`__
-  `News <../../news/newsflash.html>`__
-  `Events <../../events/events.html>`__
-  `Press <../../news/press.html>`__
-  `Multimedia <../../multimedia/multimedia.html>`__
-  `Artwork <../../art.html>`__
-  `Logo <../../logo.html>`__
-  `Donations <../../donations/>`__
-  `Legal Notices <../../copyright/>`__
-  `Privacy Policy <../../privacy.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

How to Write FreeBSD Status Reports
===================================

FreeBSD status reports are published quarterly and provide the general
public with a view of what is going on in the Project, and they are
often augmented by special reports from Developer Summits. As they are
one of our most visible forms of communication, they are very important.
This page will provide some advice on writing status report entries from
`David Chisnall <mailto:theraven@FreeBSD.org>`__, experienced in
technical writing.

*Do not worry if you are not a native English speaker. The team handling
status reports, ``monthly@FreeBSD.org``, will check your entries for
spelling and grammar, and fix it for you.*

Introduce Your Work
-------------------

*Do not assume that the person reading the report knows about your
project.*

The status reports have a wide distribution. They are often one of the
top news items on the FreeBSD web site and are one of the first things
that people will read if they want to know a bit about what FreeBSD is.
Consider this example:

::

    abc(4) support was added, including frobnicator compatibility.

Someone reading this, if they are familiar with UNIX man pages, will
know that ``abc(4)`` is some kind of device. But why should the reader
care? What kind of device is it? Compare with this version:

::

    A new driver, abc(4), was added to the tree, bringing support for
    Yoyodyne's range Frobnicator of network interfaces.

Now the reader knows that abc is a network interface driver. Even if
they do not use any Yoyodyne products, you have communicated that
FreeBSD's support for network devices is improving.

Show the Importance of Your Work
--------------------------------

*Status reports are not just about telling everyone that things were
done, they also need to explain why they were done.*

Carry on with the previous example. Why is it interesting that we now
support Yoyodyne Frobnicator cards? Are they widespread? Are they used
in a specific popular device? Are they used in a particular niche where
FreeBSD has (or would like to have) a presence? Are they the fastest
network cards on the planet? Status reports often say things like this:

::

    We imported Cyberdyne Systems T800 into the tree.

And then they stop. Maybe the reader is an avid Cyberdyne fan and knows
what exciting new features the T800 brings. This is unlikely. It is far
more likely that they have vaguely heard of whatever you have imported
(especially into the ports tree: remember that there are 20,000 other
things there too...). List some of the new features, or bug fixes. Tell
them why it is a good thing that we have the new version.

Tell Us Something New
---------------------

*Do not recycle the same status report items.*

Bear in mind that status reports are not just reports on the status of
the project, they are reports on the change of status of the project. If
there is an ongoing project, spend a couple of sentences introducing it,
but then spend the rest of the report talking about the new work. What
progress have been made since the last report? What is left to do? When
is it likely to be finished (or, if “finished” does not really apply,
when is it likely to be ready for wider use, for testing, for deployment
in production, and so on)?

Sponsorship
-----------

*Do not forget about your sponsors.*

If you or your project has received sponsorship, a scholarship from
somebody or you have been already working as a contractor or an employee
for a company, please include it. Sponsors always certainly appreciate
if you thank them for their funding, but it is also beneficial for them
to show that they are actively supporting the Project this way. Last,
but not least, this helps FreeBSD to learn more about its important
consumers.

Open Items
----------

*If help is needed, make this explicit!*

Is there any help needed with something? Are there tasks other people
can do? There are two ways in which you can use the open items part of
the status report: to solicit help, or to give a quick overview of the
amount of work left. If there is already enough people working on the
project, or it is in a state where adding more people would not speed it
up, then the latter is better. Give some big work items that are in
progress, and maybe indicate who is focussing on each one.

List tasks, with enough detail that people know if they are likely to be
able to do them, and invite people to get in contact.

`Back to the main page <status.html>`__

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
