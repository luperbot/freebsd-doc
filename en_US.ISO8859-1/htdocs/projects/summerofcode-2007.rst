===========================
FreeBSD Summer of Code 2007
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

FreeBSD Summer of Code 2007
===========================

The FreeBSD Project is proud to have taken part in the Google `Summer of
Code 2007 <http://code.google.com/soc>`__. We received more high quality
applications this year than ever before. In the end it was a very tough
decision to narrow it down to the 25 students selected for funding by
Google. These student projects included security research, improved
installation tools, new utilities, and more. Many of the students have
continued working on their FreeBSD projects even after the official
close of the program.

We are happy to report that all students made some progress towards
their goals for the summer, and the 22 students listed below completed
the program successfully.

Information about the student projects is available from our `Summer of
Code wiki <http://wiki.freebsd.org/SummerOfCode2007>`__ and all of the
code is checked into
`Perforce <http://perforce.freebsd.org/depotTreeBrowser.cgi?FSPC=//depot/projects/soc2007/>`__.
The summaries below were submitted by the individual students and their
mentors with minor editing for consistency.

2007 Student Projects
---------------------

-  | **Project:** GNOME front-end to freebsd-update(8)
   |  **Student:** Andrew Turner
   |  **Mentor:** Joe Marcus Clarke
   |  **Summary:**

   The FreeBSD update front-end is a GTK+ interface to freebsd-update.
   It is split into a GUI to allow system administrators to select the
   binary patches to update or rollback and a back-end that communicates
   with freebsd-update. Development of both parts has moved to Berlios
   at http://developer.berlios.de/projects/facund/.

   | **Ready to enter CVS:** The back-end is not yet ready to enter CVS,
     but a port is being made for the front-end

-  | **Project:** Multicast DNS responder (BSD-licensed)
   |  **Student:** Fredrik Lindberg
   |  **Mentor:** Bruce M. Simpson
   |  **Summary:**

   Multicast DNS (mDNS) is a part of Zero Configuration Networking
   (Zeroconf) and provides the ability to address hosts using DNS-like
   names without the need of an existing (unicast), managed DNS server.

   The Multicast DNS responder (mdnsd), is more or less feature complete
   and is currently in a bug fixing and testing phase. A few more
   features are planned, most notably mdns proxy support. The daemon
   performs multicast dns queries on behalf of clients and acts as a
   unified cache to all clients. Provides the ability to announce its
   own mdns records onto the network.

   The daemons abilities are exposed to clients through libmdns, it
   provides an API to do mDNS queries and to add/remove/list records and
   view/flush cache. Two consumers exists, one console based basic
   debugging and administrative utility (mdns) which simply provides
   whatever libmdns provides and a NSS module (nss\_mdns) which
   integrates mDNS lookups with the systems name lookup routines.

   | **Ready to enter CVS:** after testing and reviewing

-  | **Project:** Unified ports / package system database backend
   |  **Student:** Garrett Cooper
   |  **Mentor:** Kirill Ponomarew
   |  **Summary:**

   This project revised FreeBSD's package tools
   (/usr/src/usr.sbin/pkg\_install) to use Berkeley DB files for storing
   information held in /var/db/pkg/\*, and use Hash table structures. It
   also aims to devise a frontend for dealing with package and ports
   installation and management and insert virtuals into ports
   infrastructure to support modular components functionality, for
   dealing with ports installed components vs base installed components
   (OpenSSL, OpenSSH, Kerberos).

   | **Ready to enter CVS:** not determined yet

-  | **Project:** Super Tunnel Daemon
   |  **Student:** Matus Harvan
   |  **Mentor:** Max Laier
   |  **Summary:**

   The project implements the Super Tunnel Daemon, a tunneling daemon
   using plugins for different encapsulations and automagically
   selecting the best encapsulation in each environment. When the
   environment changes, the user should not notice the transition to a
   different encapsulation except for a small delay. Connections
   established within the tunnel shall seamlessly migrate to a different
   encapsulation. In this way, mobility is supported as well, even to
   the extent of changing between different physical network interfaces,
   e.g. disabling the wireless interface and plugging in an ethernet
   cable. New encapsulations can easily be added in the future using the
   plugin interface.

   The daemon and several plugins have been written. The daemon now has
   multi-user support, i.e., one server supports multiple clients.
   Plugins implemented so far are UDP, TCP, ICMP, DNS. There are also
   sys patches allowing it to listen on all unused UDP and TCP ports as
   well as processing ICMP echo requests in the user space.

   Missing features:

   -  more plugins (HTTP, SSH,...)
   -  config file format and parsing
   -  and some more...

   More details are available at http://wiki.freebsd.org/mtund

   | **Ready to enter CVS:** after some additional features as part of
     the Ports Collection

-  | **Project:** Rewriting lockmgr(9)
   |  **Student:** Attilio Rao
   |  **Mentor:** Jeff Roberson
   |  **Summary:**

   This project involved rewriting the lockmgr synchronization primitive
   since recent efforts (in particular sun4v porting) evicted that this
   is a strong bottleneck for fs workloads (due to its spreadness in VFS
   land). One of the main goals of the rewriting was offering a more
   customized interface, trimming all unused (and possibly bugged)
   features of lockmgr and offering a more intelligent interface (that
   would help a lot in debugging and lock assertions).

   | **Ready to enter CVS:** not determined yet

-  | **Project:** Apple's MacBook on FreeBSD
   |  **Student:** Rui Paulo
   |  **Mentor:** Andre Oppermann
   |  **Summary:**

   Apple's MacBook computers are nicely designed and have neat features
   that other laptops don't. While Mac OS X is a nice operating system,
   UNIX folks (like me) would prefer to run other operating systems like
   FreeBSD. This project brings bug fixes and new drivers to FreeBSD
   that help running this OS on this platform.

   | **Ready to enter CVS:** some parts committed already

-  | **Project:** Security regression tests
   |  **Student:** Zhouyi ZHOU
   |  **Mentor:** Robert Watson
   |  **Summary:**

   This project involved testing the correctness of FreeBSD Mandatory
   Access Control Framework including correctly passing the security
   label from userland to kernel and non-bypassibility of Mandatory
   Access Control Hooks. Specific contributions include:

   #. A pair of pseudo ethernet drivers used for testing network related
      hooks. To avoid the packet go through the lo interface, the IP
      address in the packet is twisted in the driver.
   #. A framework for logging Mandatory Access Control hooks which is
      called during a period of time.

      -  In kernel, every non-null label is got externalized into human
         readable string and recorded in a tail queue together with the
         name of hook that got called and possible flags or modes (etc.
         VREAD/VWRITE for mac\_check\_vnode\_open hook). There is a
         thread much like audit subsystem's audit\_worker logging the
         queue into a userspace file. The userland program use open,
         ioctl and close the /dev/mactest node to trigger and stop the
         logging. The logging file is truncated to zero every time the
         logging mechanism is triggered.
      -  In userland, a bison based parsing tool is used to parse the
         logged file and reconstruct the record chain which will be
         compared with testsuite supplied configuration file to examine
         if expected hooks is got called and the label/flags/modes are
         correct. The testsuite mainly follows
         src/tools/regression/fstest, modified to adapt to test
         Mandatory Access Control Framework and include tests for
         signals

   #. The test cases about mandatory access control hooks for fifo,
      link, mdconfig, netinet, open, pipe, rename, rmdir, signal,
      symlink, sysvshm and truncate are written. Two security
      vulnerabilities where found during the test case writing.

   | **Ready to enter CVS:** not determined yet

-  | **Project:** GVinum Enhancements
   |  **Student:** Ulf Lilleengen
   |  **Mentor:** Lukas Ertl
   |  **Summary:**

   The project schedule was a bit changed in the start, because there
   were some rewriting of some internal parts of gvinum. Much of the
   time went to adapt the rest of gvinum to this new event-based system.
   This rewrite made gvinum less vulnerable to race bugs, and made it
   much easier for a developer to reason about the code.

   Improvements were made to the rebuild and syncing process of volumes,
   so that one could still use the volume (e.g. have it mounted) while
   rebuilding or syncing gvinum plexes.

   The growing of striped volumes (includes RAID-5) in the background
   was also implemented. Perhaps most important, is that most important
   gvinum features were implemented, and many bugs were fixed. A lot of
   testing has been done to make gvinum more robust.

   | **Ready to enter CVS:** yes

-  | **Project:** TCP/IP regression test suite
   |  **Student:** Nanjun Li
   |  **Mentor:** George V. Neville-Neil
   |  **Summary:**

   The project was about a testing suite for any host's perform-ability
   in TCP/IP networks. N. Li implemented it on a FreeBSD machine using
   libpcap (a library of BSD Packet Filter) to sniff frames on MAC
   layer, decode them into human-readable format, and send crafted ones
   to examinate if the target host follows RFC793's requirements.

   | **Ready to enter CVS:** no

-  | **Project:** Avoiding syscall overhead
   |  **Student:** Jesper Brix Rosenkilde
   |  **Mentor:** Scott Long
   |  **Summary:**

   In FreeBSD the setproctitle call is implemented with a sysctl, this
   has the unfortunate side effect that this simple call locks the
   Giant-lock. As this call is a simple matter of setting a value, it
   could be better implemented with shared memory between the kernel and
   user-space.

   This project proposes a scheme to securely share process specific
   data between the kernel and a user-space process. This is done by
   having each process allocate a special memory page, in which the
   kernel and user-space process can share data. This will give the
   security needed, as the VM-system will make sure that no outside
   processes can fiddle with a process' data. As everything is going on
   in user-space, there is no concern about a rogue process could write
   inside the kernel memory. There is still a locking concern, which
   will be addressed either by locking the entire page, or micro-locking
   each data field on the page.

   A suggestion by Howard Su is a multi page scheme, where a read/write
   page is used for things like get/setproctitle and a read-only page
   for things like getpid. And maybe a system wide read-only page for
   things like getdomain, gethostname etc.

   | **Ready to enter CVS:** not determined yet

-  | **Project:** Port OpenBSD's sysctl Hardware Sensors framework
   |  **Student:** Constantine A. Murenin
   |  **Mentor:** Shteryana Shopova
   |  **Summary:**

   The GSoC2007/cnst-sensors project was about porting the sysctl
   hw.sensors framework from OpenBSD to FreeBSD. The project was
   successfully completed, and is pending final `review and
   integration <http://lists.freebsd.org/pipermail/freebsd-hackers/2007-September/021722.html>`__
   into the CVS tree.

   The sensors framework provides a unified interface for storing,
   registering and accessing information about hardware monitoring
   sensors. Sensor types include, but are not limited to, temperature,
   voltage, fan RPM, time offset and logical drive status. In the
   OpenBSD base system, the framework spans sensor\_attach(9),
   sysctl(3), sysctl(8), systat(1), sensorsd(8), ntpd(8), and more than
   50 drivers, ranging from I2C temperature sensors and Super I/O
   hardware monitors to ipmi(4) and RAID controllers. Several
   third-party tools are also available, for example, a plug-in for
   Nagios and ports/sysutils/symon.

   As a part of this project, all major parts of the framework were
   ported, including sysctl, systat and sensorsd. Some drivers for most
   popular Super I/O Hardware Monitors were ported, too: it(4),
   supporting most contemporary ITE Tech Super I/O, and lm(4),
   supporting most contemporary Winbond Super I/O. Moreover, some
   existing FreeBSD drivers were modified to use the new framework, for
   example, coretemp(4).

   | **Ready to enter CVS:** after more testing and review

-  | **Project:** Distributed audit daemon
   |  **Student:** Alexey Mikhailov
   |  **Mentor:** Bjoern A. Zeeb
   |  **Summary:**

   The basic idea of this project was to implement secure and reliable
   log file shipping to remote hosts. While the implementation focuses
   on audit logs, the goal was to build tools that will make it possible
   to perform distributed logging for any application by using a simple
   API and linking with a shared library. The audit logs served as a
   testbed, other logs can be adopted.

   | **Ready to enter CVS:** not yet, needs further work

-  | **Project:** Generic input device layer
   |  **Student:** Maxim Zhuravlev
   |  **Mentor:** Philip Paeps
   |  **Summary:**

   Originally selected to design and implement a common way to retrieve
   and process data from input devices, the project resulted in a code
   base of a bigger and more generic project -- **Enhanced NewBus**. The
   following features are introduced by now: basic functional devices
   support, filter drivers and NewBus input/output subsystem. Functional
   devices (ex. demuxing, muxing, terminals) are supposed to coordinate
   real devices. Each device is handled by a stack of drivers (low-level
   and filters). Filter drivers are to simplify code reuse. The NewBus
   input/output subsystem is designed to push io requests through the
   NewBus graph.

   | **Ready to enter CVS:** not determined yet

-  | **Project:** bus\_alloc\_resources() Code Update
   |  **Student:** Christopher Davis
   |  **Mentor:** Warner Losh
   |  **Summary:**

   Currently, many devices in FreeBSD's source tree use the excessively
   verbose methods of resource allocation and deallocation. Numerous
   calls to bus\_alloc\_resource() or bus\_alloc\_resource\_any() are
   used to allocate resources, and subsequently, multiple calls to
   bus\_release\_resource() are used to free the resources after an
   error in allocation or when the device is detached.

   Recently, however, the bus\_alloc\_resources() and
   bus\_release\_resources() functions have been added. These simple
   wrappers around bus\_alloc\_resource\_any() and
   bus\_release\_resource() both operate on the same resource
   description, so that much of the repetition once needed to allocate
   and free resources can be mitigated.

   This project updated driver source code where necessary using the new
   functions to make the code related to allocation and deallocation
   simpler and clearer, while making other refinements as needed.
   Approximately 40 drivers were updated during SoC, although testing is
   still needed. There are likely 25 or more other drivers that could be
   updated as well, and these are listed on the wiki.

   | **Ready to enter CVS:** not determined yet

-  | **Project:** BSD bintools project (Part I)
   |  **Student:** Kai Wang
   |  **Mentor:** Joseph Koshy
   |  **Summary:**

   This project re-implemented part of the GNU binutils based on the
   libelf and libarchive libraries. It will bring FreeBSD a BSD Licensed
   toolchain for processing ELF binary files. The project mainly
   concentrated on re-implementing the tools ar(1), ranlib(1),
   objcopy(1), strip(1) and composing corresponding manual pages.

   | **Ready to enter CVS:** soon

-  | **Project:** Update of Linuxulator for Linux 2.6
   |  **Student:** Roman Divacky
   |  **Mentor:** Konstantin Belousov
   |  **Summary:**

   This is a continuation of the same project of the last GSoC. While
   the last year the focus was to bring basic 2.6 compatibility to
   FreeBSD, this year was focused on bug fixing and implementing epoll()
   and \*at().

   | **Ready to enter CVS:** after a final review

-  | **Project:** FreeBSD 'safety net' IO logging utility
   |  **Student:** Sonja Milicic
   |  **Mentor:** Lukas Ertl
   |  **Summary:**

   Some administrative operations like filesystem or partition table
   debugging/repair would benefit from an "Undo" function, so they can
   be performed without putting vital data at risk. This project's goal
   was to implement a module which plugs into the GEOM framework and
   allows copy-on-write style logging of I/O requests to one or more
   snapshot files, including the possibility to rollback, replay or
   analyze their effects.

   The core functionality of this module and a userland tool was
   finished, but will need more testing/bug fixing.

   | **Ready to enter CVS:** not determined yet

-  | **Project:** Provide an audit log analysis tool
   |  **Student:** Liu Dongmei
   |  **Mentor:** Robert Watson
   |  **Summary:**

   A GUI audit log analysis tool which can display audit log in tree
   view and list view and analyze audit log lively. It is important to
   provide a intuitionistic and visualize audit log to administrator.
   This program's intention is to provide a totally GUI audit log
   display, filter and statistic, in addition provide expandability when
   a new type of token added. The Glib library is used as a basic
   platform abstraction library and GTK are used to build
   AuditAnalyzer's GUI.

   | **Ready to enter CVS:** not determined yet

-  | **Project:** Improve the FreeBSD Ports Collection Infrastructure
   |  **Student:** G?bor K?vesd?n
   |  **Mentor:** Andrew Pantyukhin
   |  **Summary:**

   This project reimplemented the DESTDIR support from the last GSoC by
   the same student in a technically better way. Additionally, the PERL
   support was refactored from bsd.port.mk into its own file and
   enhanced to provide more features.

   | **Ready to enter CVS:** already committed

-  | **Project:** http support for PXE
   |  **Student:** Alexey Tarasov
   |  **Mentor:** Ed Maste
   |  **Summary:**

   The goal of this project was to write extendable code wrappers (as
   much as possible in C) to provided by PXE and UNDI APIs to support
   downloading of files via TCP-based protocols in the preboot
   environment. This allows to download and prepare the booting of a
   FreeBSD kernel from a remote server via a direct connection or a http
   proxy.

   | **Ready to enter CVS:** not determined yet

-  | **Project:** Graphical installer for FreeBSD (finstall)
   |  **Student:** Ivan Voras
   |  **Mentor:** Murray Stokely
   |  **Summary:**

   This project aims to create a user-friendly graphical installer for
   FreeBSD & FreeBSD-derived systems. The project should yield something
   usable for 7.x-RELEASE, but the intention is to keep it as a "second"
   installer system during 7.x, alongside sysinstall. In any case,
   sysinstall will be kept for architectures not supported by finstall
   (e.g. currently all except i386 and amd64).

   | **Ready to enter CVS:** ready to enter the Ports Collection after
     some src patches

-  | **Project:** Porting Linux KVM to FreeBSD
   |  **Student:** Fabio Checconi
   |  **Mentor:** Luigi Rizzo
   |  **Summary:**

   Linux KVM is a Virtual Machine Monitor, part of the Linux kernel,
   that uses Intel VT-x or AMD-V extensions for x86 processors to create
   a full virtualization environment. This project consists in porting
   Linux KVM to the FreeBSD kernel.

   Since Linux KVM has a structure similar to that of a device driver
   (actually, it is a device driver, from many points of view) core
   kernel changes are not required to support it, so it is an external
   loadable kernel module, exporting an interface based on ioctl() calls
   to a device descriptor. Part of the project was also the porting of
   the userspace client for that interface, a modified qemu that uses
   KVM to execute its guests.

   A project snapshot at the end of the Summer of Code is available. It
   supports only AMD-V (SVM) on amd64, as this was the hardware used
   during the development (adding support for other platforms is in
   progress); it is still highly experimental code, but it can boot
   FreeBSD guests.

   For code, further details, and future developments, please refer to:
   http://feanor.sssup.it/~fabio/soc07/

   | **Ready to enter CVS:** no

FreeBSD Summer of Code Links
----------------------------

-  `FreeBSD Summer of Code 2007
   Wiki <http://wiki.freebsd.org/moin.cgi/SummerOfCode2007>`__ - with
   links to student project pages.

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
