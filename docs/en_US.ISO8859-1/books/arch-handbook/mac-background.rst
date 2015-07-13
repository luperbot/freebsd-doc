======================
6.4.?Policy Background
======================

.. raw:: html

   <div class="navheader">

6.4.?Policy Background
`Prev <mac-introduction.html>`__?
Chapter?6.?The TrustedBSD MAC Framework
?\ `Next <mac-framework-kernel-arch.html>`__

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

6.4.?Policy Background
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mandatory Access Control (MAC), refers to a set of access control
policies that are mandatorily enforced on users by the operating system.
MAC policies may be contrasted with Discretionary Access Control (DAC)
protections, by which non-administrative users may (at their discretion)
protect objects. In traditional UNIX systems, DAC protections include
file permissions and access control lists; MAC protections include
process controls preventing inter-user debugging and firewalls. A
variety of MAC policies have been formulated by operating system
designers and security researches, including the Multi-Level Security
(MLS) confidentiality policy, the Biba integrity policy, Role-Based
Access Control (RBAC), Domain and Type Enforcement (DTE), and Type
Enforcement (TE). Each model bases decisions on a variety of factors,
including user identity, role, and security clearance, as well as
security labels on objects representing concepts such as data
sensitivity and integrity.

The TrustedBSD MAC Framework is capable of supporting policy modules
that implement all of these policies, as well as a broad class of system
hardening policies, which may use existing security attributes, such as
user and group IDs, as well as extended attributes on files, and other
system properties. In addition, despite the name, the MAC Framework can
also be used to implement purely discretionary policies, as policy
modules are given substantial flexibility in how they authorize
protections.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+------------------------------------------------+
| `Prev <mac-introduction.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-framework-kernel-arch.html>`__   |
+-------------------------------------+-------------------------+------------------------------------------------+
| 6.3.?Introduction?                  | `Home <index.html>`__   | ?6.5.?MAC Framework Kernel Architecture        |
+-------------------------------------+-------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
