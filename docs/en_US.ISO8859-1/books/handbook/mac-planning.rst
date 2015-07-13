=========================================
16.4.?Planning the Security Configuration
=========================================

.. raw:: html

   <div class="navheader">

16.4.?Planning the Security Configuration
`Prev <mac-understandlabel.html>`__?
Chapter?16.?Mandatory Access Control
?\ `Next <mac-policies.html>`__

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

16.4.?Planning the Security Configuration
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before implementing any MAC policies, a planning phase is recommended.
During the planning stages, an administrator should consider the
implementation requirements and goals, such as:

.. raw:: html

   <div class="itemizedlist">

-  How to classify information and resources available on the target
   systems.

-  Which information or resources to restrict access to along with the
   type of restrictions that should be applied.

-  Which MAC modules will be required to achieve this goal.

.. raw:: html

   </div>

A trial run of the trusted system and its configuration should occur
*before* a MAC implementation is used on production systems. Since
different environments have different needs and requirements,
establishing a complete security profile will decrease the need of
changes once the system goes live.

Consider how the MAC framework augments the security of the system as a
whole. The various security policy modules provided by the MAC framework
could be used to protect the network and file systems or to block users
from accessing certain ports and sockets. Perhaps the best use of the
policy modules is to load several security policy modules at a time in
order to provide a MLS environment. This approach differs from a
hardening policy, which typically hardens elements of a system which are
used only for specific purposes. The downside to MLS is increased
administrative overhead.

The overhead is minimal when compared to the lasting effect of a
framework which provides the ability to pick and choose which policies
are required for a specific configuration and which keeps performance
overhead down. The reduction of support for unneeded policies can
increase the overall performance of the system as well as offer
flexibility of choice. A good implementation would consider the overall
security requirements and effectively implement the various security
policy modules offered by the framework.

A system utilizing MAC guarantees that a user will not be permitted to
change security attributes at will. All user utilities, programs, and
scripts must work within the constraints of the access rules provided by
the selected security policy modules and control of the MAC access rules
is in the hands of the system administrator.

It is the duty of the system administrator to carefully select the
correct security policy modules. For an environment that needs to limit
access control over the network, the
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__,
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__,
and
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
policy modules make good starting points. For an environment where
strict confidentiality of file system objects is required, consider the
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
and
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
policy modules.

Policy decisions could be made based on network configuration. If only
certain users should be permitted access to
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__, the
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
policy module is a good choice. In the case of file systems, access to
objects might be considered confidential to some users, but not to
others. As an example, a large development team might be broken off into
smaller projects where developers in project A might not be permitted to
access objects written by developers in project B. Yet both projects
might need to access objects created by developers in project C. Using
the different security policy modules provided by the MAC framework,
users could be divided into these groups and then given access to the
appropriate objects.

Each security policy module has a unique way of dealing with the overall
security of a system. Module selection should be based on a well thought
out security policy which may require revision and reimplementation.
Understanding the different security policy modules offered by the MAC
framework will help administrators choose the best policies for their
situations.

The rest of this chapter covers the available modules, describes their
use and configuration, and in some cases, provides insight on applicable
situations.

.. raw:: html

   <div class="caution" xmlns="">

Caution:
~~~~~~~~

Implementing MAC is much like implementing a firewall since care must be
taken to prevent being completely locked out of the system. The ability
to revert back to a previous configuration should be considered and the
implementation of MAC over a remote connection should be done with
extreme caution.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+-----------------------------------+
| `Prev <mac-understandlabel.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-policies.html>`__   |
+----------------------------------------+-------------------------+-----------------------------------+
| 16.3.?Understanding MAC Labels?        | `Home <index.html>`__   | ?16.5.?Available MAC Policies     |
+----------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
