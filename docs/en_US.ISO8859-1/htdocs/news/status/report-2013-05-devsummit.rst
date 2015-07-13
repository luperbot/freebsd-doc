===============================
FreeBSD Quarterly Status Report
===============================

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

BSDCan 2013 DevSummit Special Status Report
===========================================

This special status report contains a summary of the discussions from
the various working groups at the BSDCan 2013 DevSummit. The FreeBSD
Project organizes DevSummits at various events, typically at the major
BSD conferences, so that developers can meet and discuss matters in
person.

--------------

-  `Beyond Buildworld... <#Beyond-Buildworld...>`__
-  `Documentation <#Documentation>`__
-  `Network Receive Performance <#Network-Receive-Performance>`__
-  `Ports and Packages <#Ports-and-Packages>`__
-  `UEFI <#UEFI>`__
-  `Virtualization <#Virtualization>`__

--------------

Beyond Buildworld...
--------------------

Contact: Brooks Davis <brooks@FreeBSD.org\ >

Buildworld is the target for building the base system in the venerable
FreeBSD build system. This session aimed to investigate the current
limitations, discuss recent improvements, and propose future directions
for this process.

Over recent years, FreeBSD has been used increasingly in embedded
systems and so cross development has become a lot more important. One of
the changes recently committed by Brooks Davis now permits building the
entire base system and creating a disk image without root privileges.
This makes embedded development easier, as a number of users can now
share an expensive development box, capable of performing builds
quickly, without having to give all of them root.

This session also discussed the bmake import, which brings in NetBSD's
make along with some improvements from Juniper, which should allow much
more accurate dependency tracking and faster parallel and incremental
builds. This should have some additional benefits to the rest of the
project, for example by making our tinderbox infrastructure, which
notifies developers if the have broken the build, able to report
failures much more quickly.

One frequently requested capability, which is now being investigated by
Marcel Moolenar, is the ability to build FreeBSD from other platforms.
Currently, developing a FreeBSD-based embedded system requires a FreeBSD
host system for building, which is a barrier to entry that we would like
to avoid.

There are a number of changes to our toolchain planned for the 10.x and
11.x timescales, including replacing GNU binutils with LLVM-based tools
and importing MCLinker. These are unlikely to be the default in 10.0,
but we hope to be able to provide a GPL-free base system as a functional
option this year.

--------------

Documentation
-------------

| Contact: Dru Lavigne <dru@FreeBSD.org\ >
|  Contact: Benedict Reuschling <bcr@FreeBSD.org\ >

The documentation working group met during the main sessions and also
had several productive evenings improving the state of FreeBSD
documentation.

The FreeBSD Handbook has undergone some significant updates recently and
there is work underway to create a snapshot that will be available as a
professionally published print edition. There are still some sections in
need of updates before this can happen and the documentation team is
working on engaging the relevant developers to review this content.

The FreeBSD web site redesign was discussed. Currently, many of the most
commonly accessed pages are difficult to navigate to. Its visual design
is also somewhat dated. The documentation team is working to design an
improved structure and has several offers of assistance with the
appearance.

The FreeBSD Project is international and many of the contributors do not
have English as their first language. To encourage more participation
from the rest of the world, it is important to have high-quality
translations of the documentation. PC-BSD uses pootle (available from
the FreeBSD ports tree) to assist with keeping translations consistent
and up to date and we are evaluating doing the same for FreeBSD.

The documentation team plans to have a Docs Hackathon colocated with the
Cambridge DevSummit in August.

--------------

Network Receive Performance
---------------------------

Contact: George Neville-Neil <gnn@FreeBSD.org\ >

FreeBSD has traditionally been a platform with support for very high
performance networking. This is one of the main reasons why it was
selected for the Netflix streaming appliance, which is currently
responsible for over 20% of the Internet traffic in the USA. The goal of
this session was to discuss current bottlenecks at the receiving end of
connections.

Modern network cards support multiple receive queues and can deliver
packets into them depending on various criteria. The design of a good
API for accessing this functionality is very important, as it shortens
the path between a packet arriving in the card and it being delivered
into a userspace process. In an extreme case, for example with cluster
applications or virtual machines, the receive queue may be accessed
directly from a process bypassing the kernel. In a more conventional
setting, the packets should be delivered to a kernel thread on the same
CPU as the receiving process, so that the copy to userspace is cheap.

The group examined a number of different proposals, including some
patches, and discussed the requirements for a general API. This work is
ongoing.

--------------

Ports and Packages
------------------

| URL: http://people.freebsd.org/~bdrewery/poudriere-0515.pdf
|  URL:
  http://people.freebsd.org/~sson/imgact_binmisc/20130515-bsdcan-xbuild-ports.pdf

Contact: Erwin Lansing <erwin@FreeBSD.org\ >

The working group on ports and packages discussed the fallout from the
security incident and the lessons learned. Old-style binary package
building is now online and the infrastructure for building them is in a
much more maintainable state. Building ``pkg(8)`` (new-style) packages
should be possible soon.

Bryan Drewery presented a short talk on the status of Poudriere, the new
package builder. This is usable for building package sets for local
deployment and for the official FreeBSD packages. When the original
package building infrastructure was designed, it took most of a day to
build a large port like Mozilla on a high-end machine. Now, we have
single machines in the FreeBSD cluster that can build the entire ports
tree in a day. Poudriere is designed for this model and does not rely on
ports supporting parallel builds internally. Instead, it builds each
port in a separate jail, with ports that do not depend on each other
being built in parallel when there are spare CPUs.

Moving forward, the project plans to decouple package releases from base
system releases. Each base system release is intended to be backwards
compatible within that release series and so any packages for N.x should
work on N.x+1. The project will build weekly package sets for each
branch that will be retained for two weeks, with no QA, and monthly sets
that will undergo QA and will be available for 12 months.

Stacy Son and Brooks Davis talked about packages for less common
architectures. Stacy has worked to bring QEMU usermode support to
FreeBSD. This means that MIPS or ARM FreeBSD binaries can run on an x86
FreeBSD system. The kernel will detect the foreign binary and launch it
in the emulator. Stacy has been using this to create jails containing a
cross compiler and shell for the host architecture, but native libraries
for the target. This allows ports that are not cross-build aware to run
configure scripts that do things like compile executables and run them,
but still has the most processor-intensive part of the build (compiling
and linking) running outside of emulation. With this approach, we are
easily able to build weekly package sets for MIPS and ARM on a single
x86 box. For installing onto embedded systems, there are still some open
problems. The ``pkg(8)`` infrastructure can install many packages onto a
disk image, but will not be able to run complex post-install scripts
without the target system booting.

--------------

UEFI
----

Contact: Benno Rice <benno@FreeBSD.org\ >

UEFI is the new boot firmware standard pushed by Intel. It comes with a
number of challenges, including the SecureBoot restriction, that
prevents the firmware from booting unsigned kernels and bootloaders.
This is not currently a problem, as most systems either do not enable
this restriction by default, or make it easy to disable, but it will be
more important in the future.

The goal for UEFI support in FreeBSD is to merge the bootloader that is
currently in the projects branch, which will perform signature
verification and then hand off to the more conventional FreeBSD
bootloader. This loader will be very simple and so will need changing
(and re-signing) fairly infrequently. The FreeBSD Foundation will be
responsible for ensuring that the bootloader is signed and so will work
with SecureBoot.

There are a number of restructuring and refactoring tasks that will need
to be done over the next few months to ensure that the FreeBSD boot
process works cleanly with UEFI. These include removing some code
duplication between various platforms that use UEFI, removing some
legacy support from the i386 kernel, and restructuring how some of the
bootloader code is built. Interaction with UEFI will be simplified once
clang supports the MS Windows calling convention (used by UEFI) when
generating UNIX binaries. Benno Rice has been working on this, with some
assistence from David Chisnall, and this support should appear soon.

--------------

Virtualization
--------------

| URL: http://people.freebsd.org/~grehan/bsdcan13_virt_ext.pdf
|  URL: http://people.freebsd.org/~gibbs/XenStatusBSDCan2013.pdf
|  URL: http://people.freebsd.org/~bryanv/pdfs/bsdcan2013_virtio.pdf
|  URL: http://people.freebsd.org/~grehan/bsdcan13_bhyve.pdf

Contact: Peter Grehan <grehan@FreeBSD.org\ >

Virtualization is an increasingly important topic, with large providers
like Amazon deploying huge numbers of VMs and many users deploying VMs
on desktop systems for testing and backwards compatibility. Today,
FreeBSD supports a wide variety of virtualization options. This working
group discussed the current status and future directions of several of
them.

Xen is the de-facto standard for large-scale virtualization and FreeBSD
has supported running as a guest for some time. SpectraLogic has funded
recent work on improving this, with two overlapping goals. The first is
to allow FreeBSD to run as the Domain 0 operating system. This is the
operating system that runs with elevated privilege and is allowed to
talk directly to the hardware and which must provide the virtualized
devices to the guests. This requires full paravirtualization support.
Related to this is the ability to use more paravirtualized hardware when
booting as a hardware virtualized guest. This includes support for the
new PVH mode, which uses hardware support for memory operations but
paravirtualized drivers for everything else, giving the best performance
possible with Xen.

The FreeBSD VirtualBox port is progressing well, with preliminary
support for 3D accleration in guests. The patches for Microsoft's
HyperV, provided by Microsoft, are currently being tested with a view to
incorporating them into FreeBSD 10.

FreeBSD also includes its own virtualization infrastructure, bhyve
(pronounced beehive), which is designed to support hardware-assisted
virtualization. This has made significant progress over the past year,
including now supporting AMD's virtualization extensions as well as
those from Intel. With so many options, FreeBSD is now very well placed
in terms of virtualization, both as a host and a guest.

--------------

`News Home <../news.html>`__ \| `Status Home <status.html>`__

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
