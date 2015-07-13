==================
Chapter?25.?DTrace
==================

.. raw:: html

   <div class="navheader">

Chapter?25.?DTrace
`Prev <small-lan.html>`__?
Part?III.?System Administration
?\ `Next <dtrace-implementation.html>`__

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

Chapter?25.?DTrace
------------------

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

`25.1. Synopsis <dtrace.html#dtrace-synopsis>`__
`25.2. Implementation Differences <dtrace-implementation.html>`__
`25.3. Enabling DTrace Support <dtrace-enable.html>`__
`25.4. Using DTrace <dtrace-using.html>`__

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

25.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DTrace, also known as Dynamic Tracing, was developed by Sun™ as a tool
for locating performance bottlenecks in production and pre-production
systems. In addition to diagnosing performance problems, DTrace can be
used to help investigate and debug unexpected behavior in both the
FreeBSD kernel and in userland programs.

DTrace is a remarkable profiling tool, with an impressive array of
features for diagnosing system issues. It may also be used to run
pre-written scripts to take advantage of its capabilities. Users can
author their own utilities using the DTrace D Language, allowing them to
customize their profiling based on specific needs.

The FreeBSD implementation provides full support for kernel DTrace and
experimental support for userland DTrace. Userland DTrace allows users
to perform function boundary tracing for userland programs using the
``pid`` provider, and to insert static probes into userland programs for
later tracing. Some ports, such as
`databases/postgres-server <http://www.freebsd.org/cgi/url.cgi?ports/databases/postgres-server/pkg-descr>`__
and
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__
have a DTrace option to enable static probes. FreeBSD 10.0-RELEASE has
reasonably good userland DTrace support, but it is not considered
production ready. In particular, it is possible to crash traced
programs.

The official guide to DTrace is maintained by the Illumos project at
``DTrace Guide``.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  What DTrace is and what features it provides.

-  Differences between the Solaris™ DTrace implementation and the one
   provided by FreeBSD.

-  How to enable and use DTrace on FreeBSD.

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

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------------------+--------------------------------------------+
| `Prev <small-lan.html>`__?              | `Up <system-administration.html>`__   | ?\ `Next <dtrace-implementation.html>`__   |
+-----------------------------------------+---------------------------------------+--------------------------------------------+
| 24.7.?Tracking for Multiple Machines?   | `Home <index.html>`__                 | ?25.2.?Implementation Differences          |
+-----------------------------------------+---------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
