======================================
18.?Support for Multiple Architectures
======================================

.. raw:: html

   <div class="navheader">

18.?Support for Multiple Architectures
`Prev <rules.html>`__?
?
?\ `Next <ports.html>`__

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

18.?Support for Multiple Architectures
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is a highly portable operating system intended to function on
many different types of hardware architectures. Maintaining clean
separation of Machine Dependent (MD) and Machine Independent (MI) code,
as well as minimizing MD code, is an important part of our strategy to
remain agile with regards to current hardware trends. Each new hardware
architecture supported by FreeBSD adds substantially to the cost of code
maintenance, toolchain support, and release engineering. It also
dramatically increases the cost of effective testing of kernel changes.
As such, there is strong motivation to differentiate between classes of
support for various architectures while remaining strong in a few key
architectures that are seen as the FreeBSD “target audience”.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.1.?Statement of General Intent
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD Project targets "production quality commercial off-the-shelf
(COTS) workstation, server, and high-end embedded systems". By retaining
a focus on a narrow set of architectures of interest in these
environments, the FreeBSD Project is able to maintain high levels of
quality, stability, and performance, as well as minimize the load on
various support teams on the project, such as the ports team,
documentation team, security officer, and release engineering teams.
Diversity in hardware support broadens the options for FreeBSD consumers
by offering new features and usage opportunities (such as support for
64-bit CPUs, use in embedded environments, etc.), but these benefits
must always be carefully considered in terms of the real-world
maintenance cost associated with additional platform support.

The FreeBSD Project differentiates platform targets into four tiers.
Each tier includes a specification of the requirements for an
architecture to be in that tier, as well as specifying the obligations
of developers with regards to the platform. In addition, a policy is
defined regarding the circumstances required to change the tier of an
architecture.

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

18.2.?Tier 1: Fully Supported Architectures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tier 1 platforms are fully supported by the security officer, release
engineering, and toolchain maintenance staff. New features added to the
operating system must be fully functional across all Tier 1
architectures for every release (features which are inherently
architecture-specific, such as support for hardware device drivers, may
be exempt from this requirement). In general, all Tier 1 platforms must
have build and Tinderbox support either in the FreeBSD.org cluster, or
be easily available for all developers. Embedded platforms may
substitute an emulator available in the FreeBSD cluster for actual
hardware.

Tier 1 architectures are expected to be Production Quality with respects
to all aspects of the FreeBSD operating system, including installation
and development environments.

Tier 1 architectures are expected to be completely integrated into the
source tree and have all features necessary to produce an entire system
relevant for that target architecture. Tier 1 architectures generally
have at least 6 active developers.

Tier 1 architectures are expected to be fully supported by the ports
system. All the ports should build on a Tier 1 platform, or have the
appropriate filters to prevent the inappropriate ones from building
there. The packaging system must support all Tier 1 architectures. To
ensure an architecture's Tier 1 status, proponents of that architecture
must show that all relevant packages can be built on that platform.

Tier 1 embedded architectures must be able to cross-build packages on at
least one other Tier 1 architecture. The packages must be the most
relevant for the platform, but may be a non-empty subset of those that
build natively.

Tier 1 architectures must be fully documented. All basic operations need
to be covered by the handbook or other documents. All relevant
integration documentation must also be integrated into the tree, or
readily available.

Current Tier 1 platforms are i386 and amd64.

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

18.3.?Tier 2: Developmental Architectures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tier 2 platforms are not supported by the security officer and release
engineering teams. Platform maintainers are responsible for toolchain
support in the tree. The toolchain maintainers are expected to work with
the platform maintainers to refine these changes. Major new toolchain
components are allowed to break support for Tier 2 architectures if the
FreeBSD-local changes have not been incorporated upstream. The toolchain
maintainers are expected to provide prompt review of any proposed
changes and cannot block, through their inaction, changes going into the
tree. New features added to FreeBSD should be feasible to implement on
these platforms, but an implementation is not required before the
feature may be added to the FreeBSD source tree. New features that may
be difficult to implement on Tier 2 architectures should provide a means
of disabling them on those architectures. The implementation of a Tier 2
architecture may be committed to the main FreeBSD tree as long as it
does not interfere with production work on Tier 1 platforms, or
substantially with other Tier 2 platforms. Before a Tier 2 platform can
be added to the FreeBSD base source tree, the platform must be able to
boot multi-user on actual hardware. Generally, there must be at least
three active developers working on the platform.

Tier 2 architectures are usually systems targeted at Tier 1 support, but
that are still under development. Architectures reaching end of life may
also be moved from Tier 1 status to Tier 2 status as the availability of
resources to continue to maintain the system in a Production Quality
state diminishes. Well supported niche architectures may also be Tier 2.

Tier 2 architectures have basic support for them integrated into the
ports infrastructure. They may have cross compilation support added, at
the discretion of portmgr. Some ports must built natively into packages
if the package system supports that architecture. If not integrated into
the base system, some external patches for the architecture for ports
must be available.

Tier 2 architectures can be integrated into the FreeBSD handbook. The
basics for how to get a system running must be documented, although not
necessarily for every single board or system a Tier 2 architecture
supports. The supported hardware list must exist and should be
relatively recent. It should be integrated into the FreeBSD
documentation.

Current Tier 2 platforms are arm, ia64 (through FreeBSD 10), pc98,
powerpc, and sparc64.

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

18.4.?Tier 3: Experimental Architectures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tier 3 platforms are not supported by the security officer and release
engineering teams. At the discretion of the toolchain maintainers, they
may be supported in the toolchain. Tier 3 platforms are architectures in
the early stages of development, for non-mainstream hardware platforms,
or which are considered legacy systems unlikely to see broad future use.
Initial support for Tier 3 platforms should be worked on in external SCM
repositories. The transition to FreeBSD's subversion should take place
after the platform boots multi-user on hardware; sharing via subversion
is needed for wider exposure; and multiple developers are actively
working on the platform. Platforms that transition to Tier 3 status may
be removed from the tree if they are no longer actively supported by the
FreeBSD developer community at the discretion of the release engineer.

Tier 3 platforms may have ports support, either integrated or external,
but do not require it.

Tier 3 platforms must have the basics documented for how to build a
kernel and how to boot it on at least one target hardware or emulation
environment. This documentation need not be integrated into the FreeBSD
tree.

Current Tier 3 platforms are mips.

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

18.5.?Tier 4: Unsupported Architectures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tier 4 systems are not supported in any form by the project.

All systems not otherwise classified into a support tier are Tier 4
systems. The ia64 platform is transitioning to Tier 4 status in FreeBSD
11.

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

18.6.?Policy on Changing the Tier of an Architecture
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Systems may only be moved from one tier to another by approval of the
FreeBSD Core Team, which shall make that decision in collaboration with
the Security Officer, Release Engineering, and toolchain maintenance
teams.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+-------------------------+----------------------------+
| `Prev <rules.html>`__?                           | ?                       | ?\ `Next <ports.html>`__   |
+--------------------------------------------------+-------------------------+----------------------------+
| 17.?The FreeBSD Committers' Big List of Rules?   | `Home <index.html>`__   | ?19.?Ports Specific FAQ    |
+--------------------------------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
