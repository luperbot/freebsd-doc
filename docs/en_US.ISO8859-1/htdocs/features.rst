======================================
About FreeBSD's Technological Advances
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

-  `Home <./>`__

-  `About <./about.html>`__

   -  `Introduction <./projects/newbies.html>`__
   -  `Features <./features.html>`__
   -  `Advocacy <./advocacy/>`__
   -  `Marketing <./marketing/>`__
   -  `Privacy Policy <./privacy.html>`__

-  `Get FreeBSD <./where.html>`__

   -  `Release Information <./releases/>`__
   -  `Release Engineering <./releng/>`__

-  `Documentation <./docs.html>`__

   -  `FAQ <./doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <./doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <./doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <./doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <./doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <./docs/books.html>`__

-  `Community <./community.html>`__

   -  `Mailing Lists <./community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <./usergroups.html>`__
   -  `Events <./events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <./projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <./support.html>`__

   -  `Vendors <./commercial/commercial.html>`__
   -  `Security Information <./security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <./donations/>`__

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

-  `About <./about.html>`__
-  `Features <./features.html>`__
-  `Applications <./applications.html>`__
-  `Advocacy <./advocacy/>`__
-  `Marketing <./marketing/>`__
-  `Administration <./administration.html>`__
-  `News <./news/newsflash.html>`__
-  `Events <./events/events.html>`__
-  `Press <./news/press.html>`__
-  `Multimedia <./multimedia/multimedia.html>`__
-  `Artwork <./art.html>`__
-  `Logo <./logo.html>`__
-  `Donations <./donations/>`__
-  `Legal Notices <./copyright/>`__
-  `Privacy Policy <./privacy.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

About FreeBSD's Technological Advances
======================================

FreeBSD offers many unique features.
====================================

No matter what the application, an operating system should take
advantage of every resource available. FreeBSD's focus on performance,
networking, and storage combines with ease of system administration and
comprehensive documentation to realize the full potential of any
computer.

A complete operating system based on 4.4BSD.
--------------------------------------------

FreeBSD's distinguished roots derive from the **BSD** software releases
from the Computer Systems Research Group at the University of
California, Berkeley. Over twenty years of work have been put into
enhancing FreeBSD, adding industry-leading scalability, network
performance, management tools, file systems, and security features. As a
result, FreeBSD may be found across the Internet, in the operating
system of core router products, running root name servers, hosting major
web sites, and as the foundation for widely used desktop operating
systems. This is only possible because of the diverse and world-wide
membership of the volunteer FreeBSD Project.

**FreeBSD?10.X** introduced many new features and replaces many legacy
tools with updated versions.

-  **bhyve**: A new BSD licensed, legacy-free hypervisor has been
   imported to the FreeBSD base system. It is currently able to run all
   supported versions of FreeBSD, and with the help of the grub-bhyve
   port, OpenBSD and Linux.
-  **KMS And New drm2 Video Drivers**: The new drm2 driver provides
   support for AMD GPUs up to the Radeon HD 6000 series and provides
   partial support for the Radeon HD 7000 family. FreeBSD now also
   supports Kernel Mode Setting for AMD and Intel GPUs.
-  **Capsicum Enabled By Default**: Capsicum has been enabled in the
   kernel by default, allowing sandboxing of several programs that work
   within the "capabilities mode", such as:

   -  tcpdump
   -  dhclient
   -  hast
   -  rwhod
   -  kdump

-  **New Binary Packaging System**: FreeBSD now uses pkg, a vastly
   improved package management system that supports multiple
   repositories, signed packages, and safe upgrades. The improved system
   is combined with more frequent official package builds for all
   supported platforms and a new stable branch of the ports tree for
   better long term support.
-  **Unmapped I/O**: The newly implemented concept of unmapped VMIO
   buffers eliminates the need to perform costly TLB shootdowns for
   buffer creation and reuse, reducing system CPU time by up to 25-30%
   on large SMP machines under heavy I/O load.

**FreeBSD?9.X** brought many new features and performance enhancements
with a special focus on desktop support and security.

-  **OpenZFS**: FreeBSD 9.2 includes OpenZFS v5000 (Feature Flags),
   including the feature flags:

   -  async\_destroy
   -  empty\_bpobj
   -  lz4\_compress

   which allow ZFS destroy operations to happen in the background, make
   snapshots consume less disk space, and offers a better compression
   algorithm for compressed datasets.
-  **Capsicum Capability Mode**: Capsicum is a set of features for
   sandboxing support, using a capability model in which the
   capabilities are file descriptors. Two new kernel options
   CAPABILITIES and CAPABILITY\_MODE have been added to the GENERIC
   kernel.
-  **Hhook**: (Helper Hook) and khelp(9) (Kernel Helpers) KPIs have been
   implemented. These are a superset of pfil(9) framework for more
   general use in the kernel. The hhook(9) KPI provides a way for kernel
   subsystems to export hook points that khelp(9) modules can hook to
   provide enhanced or new functionality to the kernel. The khelp(9) KPI
   provides a framework for managing khelp(9) modules, which indirectly
   use the hhook(9) KPI to register their hook functions with hook
   points of interest within the kernel. These allow a structured way to
   dynamically extend the kernel at runtime in an ABI preserving manner.
-  **Accounting API** has been implemented. It can keep per-process,
   per-jail, and per-login class resource accounting information. Note
   that this is neither built nor installed by default. To build and
   install this, specify the option RACCT in the kernel configuration
   file and rebuild the base system as described in the FreeBSD
   Handbook.
-  **Resource-limiting API** has been implemented. It works in
   conjunction with the RACCT resource accounting implementation and
   takes user-configurable actions based on the set of rules it
   maintains and the current resource usage. The rctl(8) utility has
   been added to manage the rules in userland. Note that this is neither
   built nor installed by default.
-  **USB** subsystem now supports USB packet filter. This allows
   capturing packets which go through each USB host. The architecture of
   the packet filter is similar to that of bpf. The userland program
   usbdump(8) has been added.
-  **Infiniband support**: OFED (OpenFabrics Enterprise Distribution)
   version 1.5.3 has been imported into the base system.
-  **TCP/IP network** stack now supports the mod\_cc(9) pluggable
   congestion control framework. This allows TCP congestion control
   algorithms to be implemented as dynamically loadable kernel modules.
   Many kernel modules are available: cc\_chd(4) for the
   CAIA-Hamilton-Delay algorithm, cc\_cubic(4) for the CUBIC algorithm,
   cc\_hd(4) for the Hamilton-Delay algorithm, cc\_htcp(4) for the H-TCP
   algorithm, cc\_newreno(4) for the NewReno algorithm, and cc\_vegas(4)
   for the Vegas algorithm. The default algorithm can be set by a new
   sysctl(8) variable net.inet.tcp.cc.algorithm.
-  **SU+J**: FreeBSD's Fast File System now supports soft updates with
   journaling. It introduces an intent log into a softupdates-enabled
   file system which eliminates the need for background fsck(8) even on
   unclean shutdowns.

FreeBSD includes a number of other great features:

-  **Firewalls:** The base system includes IPFW and IPFilter, as well as
   a modified version of the popular pf with improved SMP performance.
   IPFW also includes the dummynet feature, allowing network
   administrators to simular adverse network conditions, including
   latency, jitter, packet loss and limited bandwidth.
-  **Jails** are a light-weight alternative to virtualization. Allowing
   processes to be restricted to a namespace with access only to the
   file systems and network addresses assigned to that namespace. Jails
   are also Hierarchical, allowing jails-within-jails.
-  **Linux emulation** provides a system call translation layer that
   allows unmodified Linux binaries to be run on FreeBSD systems.
-  **DTrace** provides a comprehensive framework for tracing and
   troubleshooting kernel and application performance issues while under
   live load.
-  **The Ports Collection** is a set of more than 23,000 third party
   applications that can be easily installed and run on FreeBSD. The
   ports architecture also allows for easy customization of the compile
   time options of many of the applications.
-  **Network Virtualization:** A container ("vimage") has been
   implemented, extending the FreeBSD kernel to maintain multiple
   independent instances of networking state. Vimage facilities can be
   used independently to create fully virtualized network topologies,
   and jail(8) can directly take advantage of a fully virtualized
   network stack.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <./search/index-site.html>`__ \| `Legal
Notices <./copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All rights
reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ./layout/images/logo-red.png
   :target: .
