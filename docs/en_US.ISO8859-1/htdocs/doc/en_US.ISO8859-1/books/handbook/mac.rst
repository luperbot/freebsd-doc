====================================
Chapter?16.?Mandatory Access Control
====================================

.. raw:: html

   <div class="navheader">

Chapter?16.?Mandatory Access Control
`Prev <jails-ezjail.html>`__?
Part?III.?System Administration
?\ `Next <mac-inline-glossary.html>`__

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

Chapter?16.?Mandatory Access Control
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

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

`16.1. Synopsis <mac.html#mac-synopsis>`__
`16.2. Key Terms <mac-inline-glossary.html>`__
`16.3. Understanding MAC Labels <mac-understandlabel.html>`__
`16.4. Planning the Security Configuration <mac-planning.html>`__
`16.5. Available MAC Policies <mac-policies.html>`__
`16.6. User Lock Down <mac-userlocked.html>`__
`16.7. Nagios in a MAC Jail <mac-implementing.html>`__
`16.8. Troubleshooting the MAC Framework <mac-troubleshoot.html>`__

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

16.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD supports security extensions based on the POSIX?.1e draft. These
security mechanisms include file system Access Control Lists
(`Section?14.9, “Access Control Lists” <fs-acl.html>`__) and Mandatory
Access Control (MAC). MAC allows access control modules to be loaded in
order to implement security policies. Some modules provide protections
for a narrow subset of the system, hardening a particular service.
Others provide comprehensive labeled security across all subjects and
objects. The mandatory part of the definition indicates that enforcement
of controls is performed by administrators and the operating system.
This is in contrast to the default security mechanism of Discretionary
Access Control (DAC) where enforcement is left to the discretion of
users.

This chapter focuses on the MAC framework and the set of pluggable
security policy modules FreeBSD provides for enabling various security
mechanisms.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  The terminology associated with the MAC framework.

-  The capabilities of MAC security policy modules as well as the
   difference between a labeled and non-labeled policy.

-  The considerations to take into account before configuring a system
   to use the MAC framework.

-  Which MAC security policy modules are included in FreeBSD and how to
   configure them.

-  How to implement a more secure environment using the MAC framework.

-  How to test the MAC configuration to ensure the framework has been
   properly implemented.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand UNIX? and FreeBSD basics (`Chapter?4, *UNIX
   Basics* <basics.html>`__).

-  Have some familiarity with security and how it pertains to FreeBSD
   (`Chapter?14, *Security* <security.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Improper MAC configuration may cause loss of system access, aggravation
of users, or inability to access the features provided by Xorg. More
importantly, MAC should not be relied upon to completely secure a
system. The MAC framework only augments an existing security policy.
Without sound security practices and regular security checks, the system
will never be completely secure.

The examples contained within this chapter are for demonstration
purposes and the example settings should *not* be implemented on a
production system. Implementing any security policy takes a good deal of
understanding, proper design, and thorough testing.

.. raw:: html

   </div>

While this chapter covers a broad range of security issues relating to
the MAC framework, the development of new MAC security policy modules
will not be covered. A number of security policy modules included with
the MAC framework have specific characteristics which are provided for
both testing and new module development. Refer to
`mac\_test(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_test&sektion=4>`__,
`mac\_stub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_stub&sektion=4>`__
and
`mac\_none(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_none&sektion=4>`__
for more information on these security policy modules and the various
mechanisms they provide.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------------+------------------------------------------+
| `Prev <jails-ezjail.html>`__?       | `Up <system-administration.html>`__   | ?\ `Next <mac-inline-glossary.html>`__   |
+-------------------------------------+---------------------------------------+------------------------------------------+
| 15.6.?Managing Jails with ezjail?   | `Home <index.html>`__                 | ?16.2.?Key Terms                         |
+-------------------------------------+---------------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
