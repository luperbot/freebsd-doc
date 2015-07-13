===================================
Chapter?17.?Security Event Auditing
===================================

.. raw:: html

   <div class="navheader">

Chapter?17.?Security Event Auditing
`Prev <mac-troubleshoot.html>`__?
Part?III.?System Administration
?\ `Next <audit-inline-glossary.html>`__

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

Chapter?17.?Security Event Auditing
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes and Robert Watson.

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

`17.1. Synopsis <audit.html#audit-synopsis>`__
`17.2. Key Terms <audit-inline-glossary.html>`__
`17.3. Audit Configuration <audit-config.html>`__
`17.4. Working with Audit Trails <audit-administration.html>`__

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

17.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD operating system includes support for security event
auditing. Event auditing supports reliable, fine-grained, and
configurable logging of a variety of security-relevant system events,
including logins, configuration changes, and file and network access.
These log records can be invaluable for live system monitoring,
intrusion detection, and postmortem analysis. FreeBSD implements Sun™'s
published Basic Security Module (BSM) Application Programming Interface
(API) and file format, and is interoperable with the Solaris™ and
Mac?OS? X audit implementations.

This chapter focuses on the installation and configuration of event
auditing. It explains audit policies and provides an example audit
configuration.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  What event auditing is and how it works.

-  How to configure event auditing on FreeBSD for users and processes.

-  How to review the audit trail using the audit reduction and review
   tools.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand UNIX? and FreeBSD basics (`Chapter?4, *UNIX
   Basics* <basics.html>`__).

-  Be familiar with the basics of kernel configuration/compilation
   (`Chapter?9, *Configuring the FreeBSD
   Kernel* <kernelconfig.html>`__).

-  Have some familiarity with security and how it pertains to FreeBSD
   (`Chapter?14, *Security* <security.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

The audit facility has some known limitations. Not all security-relevant
system events are auditable and some login mechanisms, such as
Xorg-based display managers and third-party daemons, do not properly
configure auditing for user login sessions.

The security event auditing facility is able to generate very detailed
logs of system activity. On a busy system, trail file data can be very
large when configured for high detail, exceeding gigabytes a week in
some configurations. Administrators should take into account the disk
space requirements associated with high volume audit configurations. For
example, it may be desirable to dedicate a file system to ``/var/audit``
so that other file systems are not affected if the audit file system
becomes full.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------------------+--------------------------------------------+
| `Prev <mac-troubleshoot.html>`__?          | `Up <system-administration.html>`__   | ?\ `Next <audit-inline-glossary.html>`__   |
+--------------------------------------------+---------------------------------------+--------------------------------------------+
| 16.8.?Troubleshooting the MAC Framework?   | `Home <index.html>`__                 | ?17.2.?Key Terms                           |
+--------------------------------------------+---------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
