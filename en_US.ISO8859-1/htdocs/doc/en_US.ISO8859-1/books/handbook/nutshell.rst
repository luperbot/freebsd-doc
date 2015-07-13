========================
1.2.?Welcome to FreeBSD!
========================

.. raw:: html

   <div class="navheader">

1.2.?Welcome to FreeBSD!
`Prev <introduction.html>`__?
Chapter?1.?Introduction
?\ `Next <history.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.2.?Welcome to FreeBSD!
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is a 4.4BSD-Lite based operating system for Intel (x86 and
Itanium?), AMD64, Sun UltraSPARC? computers. Ports to other
architectures are also underway. You can also read about `the history of
FreeBSD <history.html>`__, or the `current
release <history.html#relnotes>`__. If you are interested in
contributing something to the Project (code, hardware, funding), see the
`Contributing to
FreeBSD <../../../../doc/en_US.ISO8859-1/articles/contributing/index.html>`__
article.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.2.1.?What Can FreeBSD Do?
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD has many noteworthy features. Some of these are:

.. raw:: html

   <div class="itemizedlist">

-  *Preemptive multitasking* with dynamic priority adjustment to ensure
   smooth and fair sharing of the computer between applications and
   users, even under the heaviest of loads.

-  *Multi-user facilities* which allow many people to use a FreeBSD
   system simultaneously for a variety of things. This means, for
   example, that system peripherals such as printers and tape drives are
   properly shared between all users on the system or the network and
   that individual resource limits can be placed on users or groups of
   users, protecting critical system resources from over-use.

-  Strong *TCP/IP networking* with support for industry standards such
   as SCTP, DHCP, NFS, NIS, PPP, SLIP, IPsec, and IPv6. This means that
   your FreeBSD machine can interoperate easily with other systems as
   well as act as an enterprise server, providing vital functions such
   as NFS (remote file access) and email services or putting your
   organization on the Internet with WWW, FTP, routing and firewall
   (security) services.

-  *Memory protection* ensures that applications (or users) cannot
   interfere with each other. One application crashing will not affect
   others in any way.

-  The industry standard *X Window System* (X11R7) can provide a
   graphical user interface (GUI) on any machine and comes with full
   sources.

-   *Binary compatibility* with many programs built for Linux, SCO,
   SVR4, BSDI and NetBSD.

-  Thousands of *ready-to-run* applications are available from the
   FreeBSD *ports* and *packages* collection. Why search the net when
   you can find it all right here?

-  Thousands of additional and *easy-to-port* applications are available
   on the Internet. FreeBSD is source code compatible with most popular
   commercial UNIX? systems and thus most applications require few, if
   any, changes to compile.

-  Demand paged *virtual memory* and “merged VM/buffer cache” design
   efficiently satisfies applications with large appetites for memory
   while still maintaining interactive response to other users.

-  *SMP* support for machines with multiple CPUs.

-   A full complement of *C* and *C++* development tools. Many
   additional languages for advanced research and development are also
   available in the ports and packages collection.

-  *Source code* for the entire system means you have the greatest
   degree of control over your environment. Why be locked into a
   proprietary solution at the mercy of your vendor when you can have a
   truly open system?

-  Extensive *online documentation*.

-  *And many more!*

.. raw:: html

   </div>

FreeBSD is based on the 4.4BSD-Lite release from Computer Systems
Research Group (CSRG) at the University of California at Berkeley, and
carries on the distinguished tradition of BSD systems development. In
addition to the fine work provided by CSRG, the FreeBSD?Project has put
in many thousands of hours in fine tuning the system for maximum
performance and reliability in real-life load situations. FreeBSD offers
performance and reliability on par with commercial offerings, combined
with many cutting-edge features not available anywhere else.

The applications to which FreeBSD can be put are truly limited only by
your own imagination. From software development to factory automation,
inventory control to azimuth correction of remote satellite antennae; if
it can be done with a commercial UNIX? product then it is more than
likely that you can do it with FreeBSD too! FreeBSD also benefits
significantly from literally thousands of high quality applications
developed by research centers and universities around the world, often
available at little to no cost. Commercial applications are also
available and appearing in greater numbers every day.

Because the source code for FreeBSD itself is generally available, the
system can also be customized to an almost unheard of degree for special
applications or projects, and in ways not generally possible with
operating systems from most major commercial vendors. Here is just a
sampling of some of the applications in which people are currently using
FreeBSD:

.. raw:: html

   <div class="itemizedlist">

-  *Internet Services:* The robust TCP/IP networking built into FreeBSD
   makes it an ideal platform for a variety of Internet services such
   as:

   .. raw:: html

      <div class="itemizedlist">

   -  World Wide Web servers (standard or secure [SSL])

   -  IPv4 and IPv6 routing

   -  Firewalls and NAT (“IP masquerading”) gateways

   -  FTP servers

   -   Electronic Mail servers

   -  And more...

   .. raw:: html

      </div>

-  *Education:* Are you a student of computer science or a related
   engineering field? There is no better way of learning about operating
   systems, computer architecture and networking than the hands on,
   under the hood experience that FreeBSD can provide. A number of
   freely available CAD, mathematical and graphic design packages also
   make it highly useful to those whose primary interest in a computer
   is to get *other* work done!

-  *Research:* With source code for the entire system available, FreeBSD
   is an excellent platform for research in operating systems as well as
   other branches of computer science. FreeBSD's freely available nature
   also makes it possible for remote groups to collaborate on ideas or
   shared development without having to worry about special licensing
   agreements or limitations on what may be discussed in open forums.

-  *Networking:* Need a new router? A name server (DNS)? A firewall to
   keep people out of your internal network? FreeBSD can easily turn
   that unused PC sitting in the corner into an advanced router with
   sophisticated packet-filtering capabilities.

-  *Embedded:* FreeBSD makes an excellent platform to build embedded
   systems upon. With support for the ARM?, MIPS? and PowerPC?
   platforms, coupled with a robust network stack, cutting edge features
   and the permissive `BSD
   license <../../../../doc/en_US.ISO8859-1/books/faq/introduction.html#bsd-license-restrictions>`__
   FreeBSD makes an excellent foundation for building embedded routers,
   firewalls, and other devices.

-   *Desktop:* FreeBSD makes a fine choice for an inexpensive desktop
   solution using the freely available X11 server. FreeBSD offers a
   choice from many open-source desktop environments, including the
   standard GNOME and KDE graphical user interfaces. FreeBSD can even
   boot “diskless” from a central server, making individual workstations
   even cheaper and easier to administer.

-  *Software Development:* The basic FreeBSD system comes with a full
   complement of development tools including a full C/C++ compiler and
   debugger suite. Support for many other languages are also available
   through the ports and packages collection.

.. raw:: html

   </div>

FreeBSD is available to download free of charge, or can be obtained on
either CD-ROM or DVD. Please see `Appendix?A, *Obtaining
FreeBSD* <mirrors.html>`__ for more information about obtaining FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.2.2.?Who Uses FreeBSD?
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD's advanced features, proven security, predictable release cycle,
and permissive license have led to its use as a platform for building
many commercial and open source appliances, devices, and products. Many
of the world's largest IT companies use FreeBSD:

.. raw:: html

   <div class="itemizedlist">

-  `Apache <http://www.apache.org/>`__ - The Apache Software Foundation
   runs most of its public facing infrastructure, including possibly one
   of the largest SVN repositories in the world with over 1.4 million
   commits, on FreeBSD.

-  `Apple <http://www.apple.com/>`__ - OS X borrows heavily from FreeBSD
   for the network stack, virtual file system, and many userland
   components. Apple iOS also contains elements borrowed from FreeBSD.

-  `Cisco <http://www.cisco.com/>`__ - IronPort network security and
   anti-spam appliances run a modified FreeBSD kernel.

-  `Citrix <http://www.citrix.com/>`__ - The NetScaler line of security
   appliances provide layer 4-7 load balancing, content caching,
   application firewall, secure VPN, and mobile cloud network access,
   along with the power of a FreeBSD shell.

-  `Dell KACE <http://www.dell.com/KACE>`__ - The KACE system management
   appliances run FreeBSD because of its reliability, scalability, and
   the community that supports its continued development.

-  `Experts Exchange <http://www.experts-exchange.com/>`__ - All public
   facing web servers are powered by FreeBSD and they make extensive use
   of jails to isolate development and testing environments without the
   overhead of virtualization.

-  `Isilon <http://www.isilon.com/>`__ - Isilon's enterprise storage
   appliances are based on FreeBSD. The extremely liberal FreeBSD
   license allowed Isilon to integrate their intellectual property
   throughout the kernel and focus on building their product instead of
   an operating system.

-  `iXsystems <http://www.ixsystems.com/>`__ - The TrueNAS line of
   unified storage appliances is based on FreeBSD. In addition to their
   commercial products, iXsystems also manages development of the open
   source projects PC-BSD and FreeNAS.

-  `Juniper <http://www.juniper.net/>`__ - The JunOS operating system
   that powers all Juniper networking gear (including routers, switches,
   security, and networking appliances) is based on FreeBSD. Juniper is
   one of many vendors that showcases the symbiotic relationship between
   the project and vendors of commercial products. Improvements
   generated at Juniper are upstreamed into FreeBSD to reduce the
   complexity of integrating new features from FreeBSD back into JunOS
   in the future.

-  `McAfee <http://www.mcafee.com/>`__ - SecurOS, the basis of McAfee
   enterprise firewall products including Sidewinder is based on
   FreeBSD.

-  `NetApp <http://www.netapp.com/>`__ - The Data ONTAP GX line of
   storage appliances are based on FreeBSD. In addition, NetApp has
   contributed back many features, including the new BSD licensed
   hypervisor, bhyve.

-  `Netflix <http://www.netflix.com/>`__ - The OpenConnect appliance
   that Netflix uses to stream movies to its customers is based on
   FreeBSD. Netflix has made extensive contributions to the codebase and
   works to maintain a zero delta from mainline FreeBSD. Netflix
   OpenConnect appliances are responsible for delivering more than 32%
   of all Internet traffic in North America.

-  `Sandvine <http://www.sandvine.com/>`__ - Sandvine uses FreeBSD as
   the basis of their high performance realtime network processing
   platforms that make up their intelligent network policy control
   products.

-  `Sony <http://www.sony.com/>`__ - The PlayStation 4 gaming console
   runs a modified version of FreeBSD.

-  `Sophos <http://www.sophos.com/>`__ - The Sophos Email Appliance
   product is based on a hardened FreeBSD and scans inbound mail for
   spam and viruses, while also monitoring outbound mail for malware as
   well as the accidental loss of sensitive information.

-  `Spectra Logic <http://www.spectralogic.com/>`__ - The nTier line of
   archive grade storage appliances run FreeBSD and OpenZFS.

-  `The Weather Channel <http://www.weather.com/>`__ - The IntelliStar
   appliance that is installed at each local cable providers headend and
   is responsible for injecting local weather forecasts into the cable
   TV network's programming runs FreeBSD.

-  `Verisign <http://www.verisign.com/>`__ - Verisign is responsible for
   operating the .com and .net root domain registries as well as the
   accompanying DNS infrastructure. They rely on a number of different
   network operating systems including FreeBSD to ensure there is no
   common point of failure in their infrastructure.

-  `Voxer <http://www.voxer.com/>`__ - Voxer powers their mobile voice
   messaging platform with ZFS on FreeBSD. Voxer switched from a Solaris
   derivative to FreeBSD because of its superior documentation, larger
   and more active community, and more developer friendly environment.
   In addition to critical features like ZFS and DTrace, FreeBSD also
   offers TRIM support for ZFS.

-  `WhatsApp <http://www.whatsapp.com/>`__ - When WhatsApp needed a
   platform that would be able to handle more than 1 million concurrent
   TCP connections per server, they chose FreeBSD. They then proceeded
   to scale past 2.5 million connections per server.

-  `Wheel Systems <http://wheelsystems.com/en/>`__ - The FUDO security
   appliance allows enterprises to monitor, control, record, and audit
   contractors and administrators who work on their systems. Based on
   all of the best security features of FreeBSD including ZFS, GELI,
   Capsicum, HAST, and auditdistd.

.. raw:: html

   </div>

FreeBSD has also spawned a number of related open source projects:

.. raw:: html

   <div class="itemizedlist">

-  `BSD Router <http://bsdrp.net/>`__ - A FreeBSD based replacement for
   large enterprise routers designed to run on standard PC hardware.

-  `FreeNAS <http://www.freenas.org/>`__ - A customized FreeBSD designed
   to be used as a network file server appliance. Provides a python
   based web interface to simplify the management of both the UFS and
   ZFS file systems. Includes support for NFS, SMB/CIFS, AFP, FTP, and
   iSCSI. Includes an extensible plugin system based on FreeBSD jails.

-  `GhostBSD <http://www.ghostbsd.org/>`__ - A desktop oriented
   distribution of FreeBSD bundled with the Gnome desktop environment.

-  `mfsBSD <http://mfsbsd.vx.sk/>`__ - A toolkit for building a FreeBSD
   system image that runs entirely from memory.

-  `NAS4Free <http://www.nas4free.org/>`__ - A file server distribution
   based on FreeBSD with a PHP powered web interface.

-  `PC-BSD <http://www.pcbsd.org/>`__ - A customized version of FreeBSD
   geared towards desktop users with graphical utilities to exposing the
   power of FreeBSD to all users. Designed to ease the transition of
   Windows and OS X users.

-  `pfSense <http://www.pfsense.org/>`__ - A firewall distribution based
   on FreeBSD with a huge array of features and extensive IPv6 support.

-  `m0n0wall <http://m0n0.ch/wall/>`__ - A stripped down version of
   FreeBSD bundled with a web server and PHP. Designed as an embedded
   firewall appliance with a footprint of less than 12?MB.

-  `ZRouter <http://zrouter.org/>`__ - An open source alternative
   firmware for embedded devices based on FreeBSD. Designed to replace
   the proprietary firmware on off-the-shelf routers.

.. raw:: html

   </div>

FreeBSD is also used to power some of the biggest sites on the Internet,
including:

.. raw:: html

   <div class="itemizedlist">

-  `Yahoo! <http://www.yahoo.com/>`__

-  `Yandex <http://www.yandex.ru/>`__

-  `Rambler <http://www.rambler.ru/>`__

-  `Sina <http://www.sina.com/>`__

-  `Pair Networks <http://www.pair.com/>`__

-  `Sony Japan <http://www.sony.co.jp/>`__

-  `Netcraft <http://www.netcraft.com/>`__

-  `Netflix <https://signup.netflix.com/openconnect>`__

-  `NetEase <http://www.163.com/>`__

-  `Weathernews <http://www.weathernews.com/>`__

-  `TELEHOUSE America <http://www.telehouse.com/>`__

.. raw:: html

   </div>

and many more. Wikipedia also maintains a `list of products based on
FreeBSD <http://en.wikipedia.org/wiki/List_of_products_based_on_FreeBSD>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+------------------------------+-----------------------------------+
| `Prev <introduction.html>`__?   | `Up <introduction.html>`__   | ?\ `Next <history.html>`__        |
+---------------------------------+------------------------------+-----------------------------------+
| Chapter?1.?Introduction?        | `Home <index.html>`__        | ?1.3.?About the FreeBSD?Project   |
+---------------------------------+------------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
