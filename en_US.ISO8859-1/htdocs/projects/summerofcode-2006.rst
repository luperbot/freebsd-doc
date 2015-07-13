===========================
FreeBSD Summer of Code 2006
===========================

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

FreeBSD Summer of Code 2006
===========================

The FreeBSD Project is proud to have taken part in the Google `Summer of
Code <http://code.google.com/summerofcode.html>`__ again in 2006. By all
accounts, the FreeBSD participation in this program was an unqualified
success. We received over 150 applications for student projects, amongst
which 14 were selected for funding. These student projects included
security research, improved installation tools, new utilities, and more.
Many of the students have continued working on their FreeBSD projects
even after the official close of the program.

We are happy to report than all 14 of our students this year
successfully completed the program. There were many other strong
applications which we unfortunately couldn't fund and many of these
students also spent the summer working on FreeBSD. We are happy to see
continued development in our source code repository by these talented
young programmers and we look forward to working with more students in
the future.

Information about the student projects is available from our `Summer of
Code wiki <http://wiki.freebsd.org/SummerOfCode2006>`__ and all of the
code is checked into
`Perforce <http://perforce.freebsd.org/depotTreeBrowser.cgi?FSPC=//depot/projects/soc2006/>`__.
The summaries below were submitted by the individual students and their
mentors.

2006 Student Projects
---------------------

Student:
Clement Lecigne
Summary:
IPv6 stack vulnerabilities
Mentor:
George V. Neville-Neil <gnn@FreeBSD.org\ >
Summary:
The focus of this project was to review past vulnerabilities, create
vulnerability testing tools and to discover new vulnerabilities in the
FreeBSD IPv6 stack which is derived from the KAME project code. During
the summer Clement took two libraries, the popular libnet, and his
mentor's Packet Construction Set (PCS) and created tools to find
security problems in the IPv6 code. Several issues were found, bugs
filed, and patches created. At the moment Clement and George are editing
a 50 page paper that describes the project which will be submitted for
conference publication.

All of the code from the project, including the tools, is on line and is
described in the paper.

By all measures, this was a successful project. Both student and mentor
gained valuable insight into a previously externally maintained set of
code. In addition to the new tools development in this effort, the
FreeBSD Project now also has a new engineer to help work on the code.

?
Student:
Chris Jones
Summary:
Jail Resource Limits
Mentor:
Kip Macy <kmacy@FreeBSD.org\ >
Summary:
Chris added support for limiting CPU and memory use by jails. This
allows fairer sharing of systems' resources between divergent uses by
preventing one jail from monopolizing the available memory and CPU time,
if other users and jails have processes to run.

The code is currently available as patches against ``RELENG_6``, and
Chris is in the process of applying it to -CURRENT. More details can be
found at
`JailResourceLimits <http://wiki.freebsd.org/JailResourceLimits>`__.

?
Student:
Ivan Voras
Summary:
GEOM storage virtualization (gvirstor)
Mentor:
Pawel Jakub Dawidek <pjd@FreeBSD.org\ >
Summary:
The goal of this project was to create a virtual storage class for the
GEOM framework in FreeBSD that would allow creating "overcommitted"
storage devices, with a size larger than that of available physical
storage (e.g. hard drives). The project was completed successfully, and
the result is available on the project's home page. It's expected the
project will be included in FreeBSD CVS after it gets more testing or
after FreeBSD 6.2 is released, whichever comes first.

Working on the project was very pleasant, there was enough documentation
and the mentor was very helpful and responsive. Google's team was apt
and provided ample support to the participants of the project. The
project will help both OEMs of embedded devices (such as NAS devices)
and big users to make use of FreeBSD for large storage projects.

?
Student:
Paolo Pisati
Summary:
Study analyze and improve the interrupt handling infrastructure
Mentor:
John Baldwin <jhb@FreeBSD.org\ >
Summary:
This project consisted in the improvement of the interrupt handling
system in FreeBSD: while retaining backward compatibility with the
previous models (FAST and ITHREAD), a new method called 'Interrupt
filtering' was added. With interrupt filtering, the interrupt handler is
divided into 2 parts: the filter (that checks if the actual interrupt
belong to this device) and the ithread (that is scheduled in case some
blocking work has to be done). The main benefits of interrupt filtering
are:

-  feedback from filters (the system finally knows if any handler has
   serviced an interrupt or not, and can react consequently).
-  lower latency/overhead for shared interrupt line.
-  previous experiments with interrupt filtering showed an increase in
   performance against the plain ithread model

Moreover, during the development of interrupt filtering, some MD
dependent code was converted into MI code, PPC was fixed to support
multiple FAST handlers per line and an interrupt stray storm detection
logic was added. While the framework is done, there are still machine
dependent bits to be written (the support for ppc, sparc64, arm and
itanium has to be written/reviewed) and a serious analysis of the
performance of this model against the previous one is a WIP.

?
Student:
Yuan Jue
Summary:
Porting Xen to FreeBSD.
Mentor:
Kip Macy <kmacy@FreeBSD.org\ >
Summary:
Successfully got a domU kernel usable for installation. dom0 support
still in progress. Kip and Yuan Jue are continuing to work together on
this project after the official end of SoC. Yuan Jue has published a
more comprehensive FreeBSD/Xen howto
`here <http://www.yuanjue.net/xen/howto.html>`__.

?
Student:
Adam David Alan Martin
Summary:
AutoFS - An Automounting Filesystem implementation for FreeBSD
Mentor:
Benno Rice <benno@FreeBSD.org\ >
Summary:
Adam used PseudoFS as a starting point for an in-memory representation
of an Automounter Filesystem. This involved making a few tweaks to
PseudoFS to allow AutoFS to detect lookups. At this time, the filesystem
works and sends signals up to a userland program. Adam plans to continue
working on this, with Benno and Erez, to get AutoFS working with Erez
Zadok's AMD. The goal is to merge this work into -CURRENT.

?
Student:
Ryan Beasley
Summary:
OSSV4 Sound support
Mentor:
Ariff Abdullah <ariff@FreeBSD.org\ >, Alexander Leidinger
<netchild@FreeBSD.org\ >
Summary:
This summer was spent adding support for 4Front's OSSV4 API to FreeBSD.
A large number of audio
`ioctls <http://wiki.freebsd.org/RyanBeasley/ioctlref>`__ were added,
with a few pending, and there is still work left to do with mixers/mixer
extensions (4Front's specs are still in flux) and MIDI (low priority
because, IIRC, MIDI still needs maintainership). Ryan plans to continue
work related to the mixer extensions as best he can while attending
university full-time. All of the code is committed to FreeBSD-current.

?
Student:
Markus Boelter
Summary:
Bundled PXE Installer
Mentor:
Paul Saab <ps@FreeBSD.org\ >
Summary:
For me, Google Summer of Code was a new and very exciting experience. I
got actively involved in doing Open Source Software and giving something
back to the community. Facing to some challenges within the project
forced me to look behind the scenery of FreeBSD. The result was a better
understanding of the overall system. Getting in touch with a lot of
developers directly also gave a very special spirit to the Summer of
Code.

I really enjoyed the time and will continue to work on the project also
after the deadline. For me, it was a great chance to get involved in
active development and not just doing some scripts and hacks at home.
Getting paid for the work was just a small part of the overall feeling.

Thanks people at FreeBSD and Google for the really, really great time!

?
Student:
Shteryana Sotirova Shopova
Summary:
Integrated SNMP monitoring
Mentor:
Bjoern A. Zeeb <bz@FreeBSD.org\ >
Summary:
After working on bsnmptools last year, Shteryana concentrated on the
server side this year. An implementation for if\_vlan(4) monitoring was
dropped from the original proposal in favor of extended support for the
new if\_bridge(4) network bridge device monitoring module. In addition
to RFC 4188 single bridge support and extending the kernel to get access
to all the information a private MIB was designed. This was needed to be
able to monitor multiple bridges supported by FreeBSD and adding an
extended bridge management interface and definitely was the greatest
technical challenge of the project.

The project was successfully completed - including code review - and the
kernel part has already been committed to CURRENT. User space part will
follow soon. For STABLE a patch is available too (see wiki). Shteryana
is going to continue her work on bsnmpd and is already planning support
for if\_vlan(4) and jails monitoring modules. We are happy that she will
stay with the FreeBSD project and continue to work on bsnmp and FreeBSD
after SoC.

See also `ShteryanaShopova <http://wiki.freebsd.org/ShteryanaShopova>`__
and `SnmpBridgeModule <http://wiki.freebsd.org/SnmpBridgeModule>`__.

?
Student:
Michael Bushkov
Summary:
Nss-LDAP importing and nsswitch subsystem improvement
Mentor:
Hajimu UMEMOTO <ume@FreeBSD.org\ >
Summary:
The project consisted of 5 parts:

#. Nsswitch modules and libc separation. The idea was to move the source
   code for different nsswitch sources (such as "files", "dns", "nis")
   out of the libc into the separate shared libraries. This task was
   successfully finished (the patch is available).
#. Regression tests for nsswitch. A set of regression tests to test the
   correctness of all nsswitch-related functions and the invariance of
   their behavior between system upgrades. I think that task can be
   considered successfully completed (the patch is available).
#. nss\_ldap rewriting. Though, this task was not clearly mentioned in
   the original proposal, during the SoC we found reasonable not to
   simply import PADL's nss\_ldap, but to rewrite it from scratch
   (licensing issues were among the basic reasons for this). The
   resulting nss\_ldap nsswitch module, though, behaves mostly similar
   to the PADL's one, has different (I believe - more flexible)
   architecture. Though it's basically finished, several useful features
   from the PADL's nss\_ldap still need to be implemented. But, despite
   the lack of some features, I believe, that this task can be
   considered to be successfully completed. (Missing features will be
   implemented ASAP - hopefully during the September).
#. nss\_ldap importing into the base. The task was to prepare a patch,
   that will allow users to use nss\_ldap from the base system. The task
   was successfully completed (the patch is available), but required to
   import OpenLDAP into the base in order for nss\_ldap to work
   properly, and it had led to a long discussion in the mailing list.
   This discussion, however, have concluded with mostly positive
   opinions about nss\_ldap and OpenLDAP importing.
#. cached performance optimization. The caching daemon performance needs
   to be as high as possible in order for cached to be as close (in
   terms of speed) to "files" nsswitch source as possible. Cached's
   performance analysis was made and nsswitch database precaching was
   introduced as the optimization. This task was completed (the patch is
   available). However there is an area for improvements - more precise
   and extensive performance analysis should be made and more
   optimizations need to be introduces. This will be done in the nearest
   future.

Though none of the code was committed yet into the main, official
FreeBSD tree, my experience from the previous year makes me think that
this situation is normal. I hope, that the code will be reviewed and
committed in the coming months.

More detailed information about the project can be found at
`LdapCachedDetailedDescription <http://wiki.freebsd.org/LdapCachedDetailedDescription>`__.

?
Student:
Roman Divacky
Summary:
Linux emulation layer update
Mentor:
Alexander Leidinger <netchild@FreeBSD.org\ >
Summary:
The goal was to implement the basics of 2.6.16 support. This has been
implemented, and several programs from Fedora Core 4 work now with
osrelease="2".6.16. More complex applications do expose some bugs,
however. All of Roman's SoC work is in FreeBSD-current (the default
compatibility is still 2.4.2) and his current focus is to fix the
remaining bugs as time permits while attending university full-time. A
more detailed status of what is supported and what is not can be found
in the `linux kernel project
wiki <http://wiki.FreeBSD.org/linux-kernel>`__.

?
Student:
Spencer Whitman
Summary:
K Kernel Meta-Language
Mentor:
Poul-Henning Kamp <phk@FreeBSD.org\ >
Summary:
Spencer investigated implementing CPP macros in the first stage of the
prototype 'K' compiler. Spencer has expressed interest to continue
working with us on the 'K' project.

?
Student:
Dongmei Liu
Summary:
Porting the seref policy and setools to SEBSD
Mentor:
Christian S.J. Peron <csjp@FreeBSD.org\ >
Summary:
Dongmei Liu spent the summer working on the basic footwork required to
port the SEREF policy to SEBSD. This work has been submitted and can be
viewed in the soc2006/dongmei\_sebsd Perforce branch. This work was
originated from the sebsd branch: //depot/projects/trustedbsd/sebsd.
Additionally setools-2.3 was ported from Linux and can be found in
contrib/sebsd/setools directory. It is hoped that this work will be
merged into the main SEBSD development branch.
?
Student:
G?bor K?vesd?n
Summary:
Improving FreeBSD Ports Collection Infrastructure
Mentor:
Erwin Lansing <erwin@FreeBSD.org\ >
Summary:
This project consists of the following tasks:

#. New handling for i386 binary ports
#. Cleanup: use ECHO\_CMD and ECHO\_MSG in bsd.port.mk properly
#. Add a basic infrastructure support for debugging
#. Installing ports with different destination (DESTDIR macro)
#. Cleanup: Move fetch shell scripts out of bsd.port.mk
#. Make ports respect CC and CFLAGS
#. Cross-compiling Ports
#. Plist generator tool

The first three items are completed and the next two items are being
worked on. The DESTDIR support was more complicated than presumed, so it
took more time and the student didn't have time to finish the other
items. G?bor will continue working on these and other ports related
tasks and FreeBSD is happy to have interested him to keep working on
ports and ports infrastructure.

More details can be found at `G?bor's Wiki
page <http://wiki.freebsd.org/G%C3%A1borK%C3%B6vesd%C3%A1n>`__.

?

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
