=====================
Chapter?30.?Firewalls
=====================

.. raw:: html

   <div class="navheader">

Chapter?30.?Firewalls
`Prev <network-iscsi.html>`__?
Part?IV.?Network Communication
?\ `Next <firewalls-concepts.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?30.?Firewalls
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Joseph J. Barbish.

.. raw:: html

   </div>

.. raw:: html

   <div>

Converted to SGML and updated by Brad Davis.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`30.1. Synopsis <firewalls.html#firewalls-intro>`__
`30.2. Firewall Concepts <firewalls-concepts.html>`__
`30.3. PF <firewalls-pf.html>`__
`30.4. IPFW <firewalls-ipfw.html>`__
`30.5. IPFILTER (IPF) <firewalls-ipf.html>`__

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

30.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Firewalls make it possible to filter the incoming and outgoing traffic
that flows through a system. A firewall can use one or more sets of
“rules” to inspect network packets as they come in or go out of network
connections and either allows the traffic through or blocks it. The
rules of a firewall can inspect one or more characteristics of the
packets such as the protocol type, source or destination host address,
and source or destination port.

Firewalls can enhance the security of a host or a network. They can be
used to do one or more of the following:

.. raw:: html

   <div class="itemizedlist">

-  Protect and insulate the applications, services, and machines of an
   internal network from unwanted traffic from the public Internet.

-  Limit or disable access from hosts of the internal network to
   services of the public Internet.

-  Support network address translation (NAT), which allows an internal
   network to use private IP addresses and share a single connection to
   the public Internet using either a single IP address or a shared pool
   of automatically assigned public addresses.

.. raw:: html

   </div>

FreeBSD has three firewalls built into the base system: PF, IPFW, and
IPFILTER, also known as IPF. FreeBSD also provides two traffic shapers
for controlling bandwidth usage:
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__
and
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__.
ALTQ has traditionally been closely tied with PF and dummynet with IPFW.
Each firewall uses rules to control the access of packets to and from a
FreeBSD system, although they go about it in different ways and each has
a different rule syntax.

FreeBSD provides multiple firewalls in order to meet the different
requirements and preferences for a wide variety of users. Each user
should evaluate which firewall best meets their needs.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  How to define packet filtering rules.

-  The differences between the firewalls built into FreeBSD.

-  How to use and configure the PF firewall.

-  How to use and configure the IPFW firewall.

-  How to use and configure the IPFILTER firewall.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand basic FreeBSD and Internet concepts.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Since all firewalls are based on inspecting the values of selected
packet control fields, the creator of the firewall ruleset must have an
understanding of how TCP/IP works, what the different values in the
packet control fields are, and how these values are used in a normal
session conversation. For a good introduction, refer to `Daryl's TCP/IP
Primer <http://www.ipprimer.com/overview.cfm>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+---------------------------------------+-----------------------------------------+
| `Prev <network-iscsi.html>`__?                     | `Up <network-communication.html>`__   | ?\ `Next <firewalls-concepts.html>`__   |
+----------------------------------------------------+---------------------------------------+-----------------------------------------+
| 29.12.?iSCSI Initiator and Target Configuration?   | `Home <index.html>`__                 | ?30.2.?Firewall Concepts                |
+----------------------------------------------------+---------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
