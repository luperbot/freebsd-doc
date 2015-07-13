=========================
FreeBSD IPv6-only Support
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

FreeBSD IPv6-only Support
=========================

.. raw:: html

   <div id="catnav">

Category Navigation
^^^^^^^^^^^^^^^^^^^

-  `IPv6 in FreeBSD <../ipv6/>`__
-  `No-IPv4 support (IPv6-only) <../ipv6/ipv6only.html>`__
-  `World IPv6 Launch <../ipv6/w6l.html>`__
-  `World IPv6 Day <../ipv6/w6d.html>`__
-  

   -  `www stats <../ipv6/w6d-www-stats.html>`__

.. raw:: html

   </div>

IPv4, Dual-Stack and what is "IPv6-only"?
-----------------------------------------

For multiple decades the Internet has been running on the Internet
Protocol version 4 (IPv4). You may know IPv4 addresses like 192.0.2.1.
IPv6, the Internet Protocol version 6, is the successor to that and has
a larger address space and longer addresses like
2001:db8:4672:6565:2026:5043:2d42:5344. A dual-stack (DS) system
supports both address families, IPv4 and IPv6. Dual-stack is the default
for FreeBSD releases shipping at this time and has been since 2003. An
IPv6-only system is one that has been configured to use only IPv6
support; IPv4 support is completely removed from the system. Providing
IPv6-only snapshots of FreeBSD shows that it has no strict internal
dependence on Internet Protocol version 4, and is ready to run in a pure
IPv6 environment.

IPv6-only history
-----------------

The IPv6 only kernel has started as a research project in 2008 when
FreeBSD `Jails <../doc/en_US.ISO8859-1/books/handbook/jails.html>`__
gained IPv6 support and it became possible to have jails without IPv4.

The FreeBSD kernel has long been able to be compiled for dual-stack or
without INET6 support. It was time for feature parity in that area as
well. As an intermediate step there were efforts to get the kernel
compiling without any IP support at all, which helped to narrow down the
problematic cases.

As of `SVN r221353 <http://svn.freebsd.org/changeset/base/221353>`__ it
is now possible to compile the kernel without INET but with INET6
support.

How can I get a system without INET support?
--------------------------------------------

There are two ways to get this:

-  The easy way is to download an IPv6-only snapshot we provide and test
   that put. See the `IPv6-only <http://wiki.freebsd.org/IPv6Only>`__
   wiki page for the latest snapshot builds and download links.
-  Alternatively you can install any FreeBSD HEAD (9.x or later) as of
   May 2nd 2011 or later and compile your own kernel. See the
   `Handbook <../doc/en_US.ISO8859-1/books/handbook/kernelconfig.html>`__
   for how to do this.

Doing IPv6-only when the world tries to get to dual-stack?
----------------------------------------------------------

In a time where you hear numbers that about 4% of end users could
actually successfully access IPv6-only services it may indeed sound
strange. The BSD network stack however was used as a reference
implementation for the first time of TCP/IP and again was for IPv6 and
there are some parts of the world already that are limited to IPv6-only.
Over time, as IPv6 deployment proceeds, we expect to see a lot more of
this.

On the other hand having the IPv4 fall back option of dual-stack hides a
lot of IPv6 errors and omissions. Supposedly IPv6-ready software breaks
when running without IPv4. We want to help early in the process to catch
and fix these problems and want to encourage other software developers
to do the same. FreeBSD is used in embedded device and targeting servers
while at the same time people build desktop systems with it. This
entirety allows us to provide a turnkey solution, an ideal platform for
thorough testing.

FAQ
---

Do you have a sample kernel configuration for me?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Yes we do. It is as simple as:

::

    include GENERIC
    ident GENERIC-IPV6ONLY
    makeoptions MKMODULESENV+="WITHOUT_INET_SUPPORT="
    nooptions INET
    nodevice gre
        

I am not doing kernels but desktop applications. What about me?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD ships with a lot of applications running fine on command line.
If you prefer to test on a preconfigured graphical desktop,
`PC-BSD <http://www.pcbsd.org/>`__, a FreeBSD derived desktop
distribution is providing IPv6-only snapshots as well.

Is this limited to FreeBSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~

No. While we provide the kernel and parts of user space for you to start
with, a lot of open sources and commercial software running on a UNIX?
or UNIX?-like operating system (e.g. ?Linux) should be able to compile
and run on FreeBSD with minimal efforts. Also see the next question.

Does everything just work on IPv6-only in FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

While are doing our best, some things are not yet working without IPv4.
Very few parts of the kernel still depend on IPv4 and we are working on
these. In user space you can find three different categories:

#. Software that is maintained as FreeBSD base. We are actively working
   on these as we find problems. Patches from the community are always
   welcome.
#. Software that is shipped with FreeBSD base but imported from a 3rd
   party project. We are trying our best to get any problems solved and
   are working with upstream vendors.
    If you are part of such a project you may want to test on IPv6-only
   yourself to be really IPv6-ready with your next release! Try our
   snapshots.
#. Software that is part of FreeBSD `ports <../ports/>`__ or any other
   open source or commercial software running on FreeBSD. We will lend a
   hand if needed and possible but are hoping for the community to make
   best use of our snapshots and improve the overall IPv6 readiness of
   software.

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
