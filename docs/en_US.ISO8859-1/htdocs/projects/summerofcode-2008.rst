===========================
FreeBSD Summer of Code 2008
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

FreeBSD Summer of Code 2008
===========================

The FreeBSD Project is proud to have taken part in the Google `Summer of
Code 2008 <http://code.google.com/soc>`__. We received more high quality
applications this year than ever before. In the end it was a very tough
decision to narrow it down to the 21 students selected for funding by
Google. These student projects included security research, improved
installation tools, new utilities, and more. Many of the students have
continued working on their FreeBSD projects even after the official
close of the program.

We are happy to report that the 19 students listed below completed the
program successfully.

Information about the student projects is available from our `Summer of
Code wiki <http://wiki.freebsd.org/SummerOfCode2008>`__ and all of the
code is checked into
`Perforce <http://perforce.freebsd.org/depotTreeBrowser.cgi?FSPC=//depot/projects/soc2008/>`__.
The summaries below were submitted by the individual students and their
mentors with minor editing for consistency.

2008 Student Projects
---------------------

-  | **Project:** Implementation of MPLS in FreeBSD
   |  **Student:** Ryan French
   |  **Mentor:** Andre Oppermann
   |  **Summary:**

   MPLS is a networking protocol used for routing information quickly
   and efficiently. It is used extensively in the internet's backbone
   networks. Over the course of the program, code has been ported to
   FreeBSD from the OpenBSD/NetBSD operating systems. Basic
   functionality of sending and receiving packets was the main goal of
   the project, but unfortunately this was not achieved. It is very
   close to having this functionality, but there are a few minor bugs
   preventing the code from integrating fully with the FreeBSD
   networking stack.

   This project will continue to be worked on until sending, receiving,
   label swapping, tunnels, and the LDP daemon has been successfully
   implemented.

   **Ready to enter CVS/SVN:** No.

-  | **Project:** TCP/IP regression test suite (tcptest)
   |  **Student:** Victor Hugo Bilouro
   |  **Mentor:** George V. Neville-Neil
   |  **Summary:**

   As a testing tool, it can perform regression, protocol conformance,
   and fuzz tests. The tool may also be employed as an aid to protocol
   developers and both testing and debugging of firewalls/routers.

   It is built on top of PCS(Packet Construction Set) "PCS is a set of
   Python modules and objects that make building network protocol code
   easier for the protocol developer. PCS enables testing at OSI layers
   3, 4, and 5."

   Tcptest mainly is a python module and one script for each test
   covered (more then one per script often) The module count with
   methods acting as fasteners, doing things like (a)three way
   handshake, (b)active/passive close and (c)several createXX and
   assertXX, where XX=(ip, tcp, rst, urg, fin, syn, psh, so on...) As
   the tests are being created, the number of 'fasteners' are growing,
   turning each moment easier to create new tests.

   Use of small tests. So we can cover a wide range of traffics, events
   and transitions predetermined separately. The development would be
   like a protocol, but without covering all possible events and
   transitions, only traffic previously determined. Instead of targeting
   a TCP Finite State Machine (FSM) like the implementation of TCP/IP
   protocols, the development will be based towards flow of packets,
   where traffic is composed of packets that are sent and received in a
   previously registered way.

   Links: `project
   wiki <http://wiki.freebsd.org/VictorBilouro/TCP-IP_regression_test_suite>`__
   `FreeBSD Perforce project
   repository <http://perforce.freebsd.org/depotTreeBrowser.cgi?FSPC=//depot/projects/soc2008/bilouro_tcptest/src>`__
   `source code download <http://code.google.com/p/tcptest/>`__ `source
   code documentation <http://bilouro.com/tcptest>`__ `Packet
   Construction Set <http://pcs.sf.net>`__

-  | **Project:** Porting Open Solaris Dtrace Toolkit to FreeBSD
   |  **Student:** Liqun Li
   |  **Mentor:** John Birrell
   |  **Summary:**

   Sun Open Solaris Dtrace is pretty useful feature. Users can find
   performance bottlenecks with Dtrace in real production environment.
   Since many probes implemented in Open Solaris are not supported in
   FreeBSD, the Open Solaris Dtrace Toolkit should be ported to FreeBSD.
   Its main job is to find whether a given probe is supported by
   FreeBSD, if so, find it; if not, develop one to support this
   function. This summer, at first, I went through all DTK script
   commands, found some of them work directly. But most do not. Under my
   mentor John Birrell careful help, I retrieved the respective FreeBSD
   kernel variables, and ended up making system/uname.d work. In
   addition, I tried to make sar-c.d work under FreeBSD. Since we need
   to investigate in Sun Open Solaris Kernel how Open Solaris defines
   the probe and what probes it needs, this work is really time
   consuming, and not done yet. From this project, I got to know much
   about FreeBSD kernel and Dtrace probes. I found kernel hacking/coding
   pretty interesting.

   **Ready to enter CVS/SVN:** not decided

-  | **Project:** Adding .db support to pkg\_tools --> pkg\_improved
   |  **Student:** Anders Nore
   |  **Mentor:** Florent Thoumie
   |  **Summary:**

   This project is a replication of the pkg\_install tools with several
   new features and speed improvements due to the caching of some
   package-information to a B-Tree Berkeley DB file. Some of the new
   features is the adding of installtime to the installed packages
   +CONTENTS file, human-readable size-output in pkg\_info(1), progress
   indication to pkg\_add's remote option. Installtime range searches
   with pkg\_info(1) and pkg\_delete(1) similar to that of version
   search is now available using the -M option.

   A new tool pkg\_convert(1), caches some parts of the existing
   /var/db/pkg/ flat database into a Berkeley DB file, and the tools
   check for this file and uses it for speed improvements if it is
   available and updates it according to pkg\_{add\|delete}'s. You can
   also use pkg\_convert(1) to view the entries in the cache. The tools
   will give you an indication if the database is corrupt, and it is
   fully recoverable by using pkg\_convert(1).

   Two bugs in the existing pkg\_tools have also been discovered and
   fixed, everything is of course backwards-compatible with the
   older/original pkg\_install tools.

-  | **Project:** Porting BSD-licensed text-processing tools from
     OpenBSD
   |  **Student:** Gabor Kovesdan
   |  **Mentor:** Max Khon
   |  **Summary:**

   At the moment, BSD grep seems to be ready and highly compatible with
   the GNU version. However, there are differences in the regex
   handling, which is a result of the different interpretations, that
   the different regex libraries use and thus it is not really possible
   to fix at the level of grep. As for diff, some progress has been
   made, but some important features are still missing. The sort utility
   seemed to be badly constructed concerning the wide character support
   and the overall implementation. Because of these difficulties, the
   efforts were prioritized for grep and diff. Probably sort needs a
   complete rewrite or at least an extreme amount of modifications.

   **Ready to enter CVS/SVN:** If we can accept the regex differences in
   grep, it is ready to enter SVN after some thorough testing. As for
   diff and sort, they can be installed via the Ports Collection.

-  | **Project:** Multibyte collation support
   |  **Student:** Konrad Jankowski
   |  **Mentor:** Diomidis D. Spinellis
   |  **Summary:**

   Collation is what allows for current language/encoding correct
   sorting/ordering of strings. This project aimed to add proper
   collation in UTF-8 encodings for all languages for FreeBSD. This
   summer I have accomplished:

   -  imported data from the Unicode Consortium: POSIX locale files and
      regression test data
   -  written converter scripts to extract collation data from this
      files
   -  ported Apple's version of colldef (which is our version, but much
      extended by them)
   -  extended the colldef even more, to work on collation data from the
      Unicode Consortium
   -  added some performance improvements, the biggest one not used by
      default now (no time to test yet) - reading the charmap only once
      for all languages
   -  ported Apple version of strcoll, wcscoll, strxfrm, wcsxfrm and
      locale/collate.c, taking out xlocale (rationale on wiki)
   -  Written regression test scripts. It appeared that Apple's code
      doesn't full Unicode Collation Algorithm - the part which deals
      with expansions. It is needed for half of languages to pass the
      more advanced regression tests.
   -  for last few days I am working on implementing expansions, I will
      not rest until they work
   -  I was not able to start writing manpages and create a megapatch
      against HEAD, I'll do that when the algorithm is 100% correct for
      all the languages.

   Current information will be available on my wiki:
   http://wiki.freebsd.org/KonradJankowski/Collation

   **Ready to enter CVS/SVN:** After finishing expansion support and
   cleanup.

-  | **Project:** VM Algorithm Improvement
   |  **Student:** Mayur Shardul
   |  **Mentor:** Jeff Roberson
   |  **Summary:**

   A new data structure, viz. radix tree, was implemented and used for
   management of the resident pages. The objective is efficient use of
   memory and faster performance. The biggest challenge was to service
   insert requests on the data structure without blocking. Because of
   this constraint the memory allocation failures were not acceptable,
   to solve the problem the required memory was allocated at the boot
   time. Both the data structures were used in parallel to check the
   correctness and we also benchmarked the data structures and found
   that radix trees gave much better performance over splay trees.

   **Ready to enter CVS/SVN:** We will investigate some more approaches
   to handle allocation failures before the new data structure goes in
   CVS.

-  | **Project:** TCP anomaly detector
   |  **Student:** Rui Paulo
   |  **Mentor:** Andre Oppermann
   |  **Summary:**

   The TCP Anomaly Detector (tcpad, for short) project went reasonably
   well. I am currently tracking some bugs and lowering the number of
   false positives.

   tcpad tries to monitor TCP connections and detect non-conformant
   hosts. It does this by sniffing packets on the wire and creating,
   what I would like to call, a virtual TCP stack on each end. When an
   error is detected, tcpad creates a pcap file with all the packets
   exchanged between the two hosts and the state of each virtual TCP
   stack.

   tcpad is still being developed, so expect it to "detect" dozens of
   "problems" after running for some minutes.

   I was a bit late developing results because the SoC began before my
   exams did (I was still having classes), but now, that "damage" is
   partly fixed. ;-) Overall, this SoC was a really interesting learning
   experience. I must say that my TCP knowledge has increased a few
   points. :-)

   Andre Oppermann is my mentor. I blogged a bit about this project at
   `my blog <http://blogs.freebsdish.org/rpaulo/>`__. The wiki page is
   located `here <http://wiki.freebsd.org/RuiPaulo/TCPAnomaly>`__.

   **Ready to enter CVS/SVN:** No.

-  | **Project:** FreeBSD auditing system testing
   |  **Student:** Vincenzo Iozzo
   |  **Mentor:** Attilio Rao
   |  **Summary:**

   The project was focused on testing the audit system. The first part
   of the project consisted of writing a patch for /dev/auditpipe in
   order to preselect events by process' pid. The second half was
   focused on creating a testing framework for audit. Some auxiliary
   functions and modules were written. What is missing: - More
   abstraction in the framework - More tests for events

-  | **Project:** Dynamic memory allocation for dirhash in UFS2
   |  **Student:** Nick Barkas
   |  **Mentor:** David Malone
   |  **Summary:**

   Modified dirhash code in perforce is now able to free up memory used
   by older dirhashes when the VM system invokes vm\_lowmem events. This
   will allow the default dirhash\_maxmem value to be increased,
   improving performance on large directory lookups when there is memory
   to spare on they system. There are versions of the low memory event
   handling code for both -CURRENT and 7-STABLE. A number of tests have
   been run showing the new event handler seems to work properly.

   I intend to do further testing and benchmarking to find the best
   default values to use for vfs.ufs.dirhash\_reclaimage (the number of
   seconds a dirhash can sit unused before the dirhash low memeory event
   handler will unconditionally delete it) and the minimum percentage of
   memory that will be freed upon vm\_lowmem events even if there are
   not enough hashes older than dirhash\_reclaimage (currently this is
   hard coded to 10%). I would also like to add some code to choose a
   reasonable new default vfs.ufs.dirhash\_maxmem value based upon the
   amount of memory in the system, set automatically at boot time and
   tunable via sysctl. Once these tweaks have been made I plan to ask
   for testing from more users to shake out any bugs or potential
   workloads where the new code may hurt overall performance.

   Current details about status are on the
   `wiki <http://wiki.freebsd.org/DirhashDynamicMemory>`__.

-  | **Project:** Reference implementation of the SNTP client
   |  **Student:** Johannes Maximilian Kohn
   |  **Mentor:** Harlan Stenn
   |  **Summary:**

   A reference implementation of the SNTP client based on the latest
   ntpv4 document. SNTP is a lightweight client that enables admins to
   synchronize with NTP servers. SNTP's networking code is written
   protocol independent and should work with almost any protocol like
   IPv4 or IPv6. SNTP supports MD5 authentication to verify the
   authenticity of the queried server.

   **Ready to enter CVS/SVN:** Not determined yet.

-  | **Project:** NFSv4 ACLs
   |  **Student:** Edward Tomasz Napierala
   |  **Mentor:** Robert Watson
   |  **Summary:**

   The aim of my GSoC project was to implement NFSv4 ACLs in a similar
   way POSIX.1e ACLs are supported. That was done by extending user
   utilities (setfacl(1)/getfacl(1)), libc API and adding necessary
   kernel stuff, for ACL storage and enforcement on both UFS and ZFS.
   Regression tests were implemented to ensure correct operation.
   Semantics is supposed to be identical to the one in SunOS. There is
   also a wrapper (distributed separately) that implements
   SunOS-compatible acl(2)/facl(2) API, to make porting applications
   like Samba easier.

   **Ready to enter CVS/SVN:** not yet

-  | **Project:** Enhancing FreeBSD's Libarchive
   |  **Student:** Anselm Strauss
   |  **Mentor:** Tim Kientzle
   |  **Summary:**

   The idea was to work on some missing parts of Libarchive. Despite the
   many goals, only few of them could be implemented. So far the project
   contributed a ZIP writer with tests. It supports basic functionality,
   except compression, ZIP64 and some fancy features of the ZIP
   specification. Work will now continue free from GSOC. It will include
   finishing the ZIP writer, and working a bit on the other goals, like
   PAX frontend, and others.

   **Ready to enter CVS/SVN:** not yet

-  | **Project:** Allowing for parallel builds in the FreeBSD Ports
   |  Collection **Student:** David Forsythe
   |  **Mentor:** Mark Linimon
   |  **Summary:**

   This project added locks to targets taken from bsd.port.mk that could
   perform conflicting operations if multiple builds were running at the
   same time. First, fake-pkg was modified to obtain a lock over
   PKG\_DBDIR to prevent clobbering of the database in case more than
   one port tries to register at a time. Next, a lock called BASE\_LOCK
   was added for every port to obtain at the beginning of a build. This
   lock is located in a ports directory, and prevents any port from
   being built by multiple make processes. Locks were then added for
   other sensitive targets, and the pkg\_install tools were modified to
   honor locks on PKG\_DBDIR.

   Once these locks were added, a new variable, FAKE\_J, to take
   advantage of makes -j flag. This allows make to fork multiple
   processes to handle dependencies and fetching, without passing the -j
   flag onto the actual build of a port.

   **Ready to enter CVS/SVN:** Probably not.

-  | **Project:** Ports license auditing infrastructure
   |  **Student:** Alejandro Pulver
   |  **Mentor:** Brooks Davis
   |  **Summary:**

   This project is about adding license support to the Ports Collection,
   so ports with certain licenses can be identified. The ports makefile
   part is functional (may need some adjustments though): definition of
   licenses by port, notions of permissions (sell and redistribute, for
   distfiles and packages) replacing NO\_{PACKAGE,CDROM} and RESTRICTED,
   configuration (one-time, and saved; with checksum in case the license
   changes), verbose/diagnostic output of the internal processing logic
   (how it is accepted or rejected, if by the user, by default or by
   saved configuration), registration of license information and license
   itself in the package (so that both packages and ports can be
   searched for properties such as license types or restrictions), and
   more can be easily added to the current code.

   The license database (a list of them and their properties) was going
   to be mirrored from FOSSology: a tool to analyze software licenses.
   We are working on getting FOSSology to automatically classify ports
   (I've sent suggestions and patches to the developers, who accepted
   them and provided very good support). So for the moment it is not
   usable (at least licenses/properties are defined manually, and each
   port is marked manually to indicate its license).

   I will continue working on the FOSSology's port, and on the missing
   features such as multiple licenses support (AND, OR, etc). For more
   information see the wiki page: Ports license auditing infrastructure

   **Ready to enter CVS/SVN:** not yet

-  | **Project:** Improving layer2 filtering
   |  **Student:** Gleb Kurtsou
   |  **Mentor:** Andrew Thompson
   |  **Summary:**

   Project aimed to improve layer2 filtering in ipfw and pf. All of the
   project goals are achieved: pfil framework is extended to handle
   ethernet packets, ipfw layer2 filtering is greatly simplified, added
   l2filter and l2tag per interface flags. Both ipfw and pf firewalls
   support filtering by ethernet addresses, support stateful filtering
   with ethernet addresses and firewall's lookup tables are extended to
   contain ethernet addresses.

   ipfw was extended to perform arp packet filtering: arp-op, src-arp
   and dst-arp options added.

   Details and usage examples are on my
   `blog <http://blogs.freebsdish.org/gleb/>`__.

   **Ready to enter CVS/SVN:** Not yet, diff is submitted to
   freebsd-net@ for public review.

-  | **Project:** Porting FreeBSD to Efika (PPC bring up)
   |  **Student:** Przemek Witaszczyk (vi0@)
   |  **Mentor:** Rafal Jaworowski
   |  **Summary:**

   The main aim of the project is to port FreeBSD operating system to
   MPC5200B evaluation board. Among subleading tasks, there were
   objectives such as making kernel proceed to device drivers
   initialization, modelling newbus hierarchy of devices, writing the
   programmable interrupt controller driver, writing the PCI driver. The
   ultimate goal is reaching multiuser mode.

   As for now, half of the project is realized. After solving a few
   difficult problems at the basic level (binary interface issues with
   entry point to the SmartFirmware on the device), the boot procedure
   reaches the device drivers initialization stage, and hits the PIC
   driver init. At this point, the driver skeleton is constructed and is
   called. The driver uses ofwbus bus driver which intermediates between
   the openfirmware and the FreeBSD newbus devices hierarchy. After
   completing the PIC driver, I'll be in the position to write the
   remaining drivers for peripherals integrated on the MPC5200B chip
   using the newbus architecture.

   I am determined to continue the work on the project after the formal
   GSoC end date in order to bring at least the interrupt controller
   driver to operation.

   More info available at project's wiki :
   http://wiki.freebsd.org/PrzemekWitaszczyk and at my GSoC 2008 blog:
   http://bitbay.blogspot.com/

   **Ready to enter CVS/SVN:** not yet, at least PIC driver required.

-  | **Project:** Audit Firewall Events from Kernel
   |  **Student:** Diego Giagio (diego@)
   |  **Mentor:** Christian S.J. Peron
   |  **Summary:**

   This project is part of TrustedBSD project and aims to provide
   auditing support to security-related events generated by various
   firewall implementations on FreeBSD such as IPFW, PF and IPFILTER.

   Currently both administrative events (such as add/remove rules) and
   network events (such as network connection establishment) are being
   audited on IPFW. This means that all IPFW security-related events are
   already being audited the way we planned it to. Although PF and
   IPFILTER auditing support aren't yet finished, all the hard
   infrastructure work needed to implement that is already committed.

   The next step is basically finish implementing PF and IPFILTER's
   auditing support. On the IPFW side, my research showed that the way
   it handles stateful connections (even before my work) needs
   improvement. I will also work on this. I will keep working on this
   project in order to polish every rough edge we might find. Once this
   is finished, I'll probably begin working on other interesting
   TrustedBSD projects.

   More information can be found here:
   http://wiki.freebsd.org/DiegoGiagio/Audit\_Firewall\_Events\_from\_Kernel

   **Ready to enter CVS/SVN:** Not determined yet, perhaps parts of it.

-  | **Project:** Create a tiny operating system from FreeBSD
   |  **Student:** James Harrison
   |  **Mentor:** Warner Losh
   |  **Summary:**

   This project was a success and a failure at the same time. I started
   work imagining that I would be creating, genuinely creating, a new
   tiny operating system from FreeBSD. This was to be a worthy goal, a
   challenging goal, and overall a fun goal. I imagined it would involve
   making a bunch of shell scripts for stripping out various parts of
   the OS, integrate a custom kernel, and bob's your mother's brother,
   everything's done. This was even reflected in the name of the
   project; it's the same approach as TinyBSD, so I called mine ShinyBSD
   as a kind of homage.

   Instead, I gained respect for TinyBSD, which is a fantastic tool. A
   truly, truly, fantastic tool. Ultimately, with just a few tweaks, it
   could do exactly what I needed it to do; building a small OS has been
   completed for some time.

   The second portion was to cross compile and boot an arm device. I had
   more hardware issues than you can shake a large stick at, so though I
   can verify that I was working hard on cross compiling, I cannot
   verify that the cross compiled product I had made sense as a bootable
   image. I've started configuring qemu now to see if I can verify via
   that. In discussion with my mentor, I believe a profitable method of
   applying my knowledge post-GSOC is to get a Makefile prepared for
   TinyBSD that cross compiles out of the box.

   **Ready to enter CVS/SVN:** Not yet, though when the Makefile is
   complete it would be good to offer it up for inclusion in base.

FreeBSD Summer of Code Links
----------------------------

-  `FreeBSD Summer of Code 2008
   Wiki <http://wiki.freebsd.org/moin.cgi/SummerOfCode2008>`__ - with
   links to student project pages.
-  `Perforce Directory for 2008
   Projects <http://perforce.freebsd.org/depotTreeBrowser.cgi?FSPC=//depot/projects/soc2008/>`__.

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
