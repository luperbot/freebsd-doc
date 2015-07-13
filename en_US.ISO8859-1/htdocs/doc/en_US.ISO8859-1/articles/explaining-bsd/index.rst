==============
Explaining BSD
==============

.. raw:: html

   <div class="navheader">

Explaining BSD
?
?
?\ `Next <what-a-real-unix.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Greg Lehey
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<grog@FreeBSD.org>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

In the open source world, the word “Linux” is almost synonymous with
“Operating System”, but it is not the only open source UNIX? operating
system. According to the `Internet Operating System
Counter <http://www.leb.net/hzo/ioscount/data/r.9904.txt>`__, as of
April 1999 31.3% of the world's network connected machines run Linux.
14.6% run BSD UNIX?. Some of the world's largest web operations, such as
`Yahoo! <http://www.yahoo.com/>`__, run BSD. The world's busiest FTP
server of 1999 (now defunct), `ftp.cdrom.com <ftp://ftp.cdrom.com/>`__,
used BSD to transfer 1.4 TB of data a day. Clearly this is not a niche
market: BSD is a well-kept secret.

So what is the secret? Why is BSD not better known? This white paper
addresses these and other questions.

Throughout this paper, differences between BSD and Linux will be noted
*like this*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. What is BSD? <index.html#what-is-bsd>`__
`2. What, a real UNIX?? <what-a-real-unix.html>`__
`3. Why is BSD not better known? <why-is-bsd-not-better-known.html>`__
`4. Comparing BSD and Linux <comparing-bsd-and-linux.html>`__

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

1.?What is BSD?
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD stands for “Berkeley Software Distribution”. It is the name of
distributions of source code from the University of California,
Berkeley, which were originally extensions to AT&T's Research UNIX?
operating system. Several open source operating system projects are
based on a release of this source code known as 4.4BSD-Lite. In
addition, they comprise a number of packages from other Open Source
projects, including notably the GNU project. The overall operating
system comprises:

.. raw:: html

   <div class="itemizedlist">

-  The BSD kernel, which handles process scheduling, memory management,
   symmetric multi-processing (SMP), device drivers, etc.

   *Unlike the Linux kernel, there are several different BSD kernels
   with differing capabilities.*

-  The C library, the base API for the system.

   *The BSD C library is based on code from Berkeley, not the GNU
   project.*

-  Utilities such as shells, file utilities, compilers and linkers.

   *Some of the utilities are derived from the GNU project, others are
   not.*

-  The X Window system, which handles graphical display.

   The X Window system used in most versions of BSD is maintained by the
   `X.Org project <http://www.X.org/>`__. FreeBSD allows the user to
   choose from a variety of desktop environments, such as Gnome, KDE, or
   Xfce; and lightweight window managers like Openbox, Fluxbox, or
   Awesome.

-  Many other programs and utilities.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------------------+
| ?   | ?   | ?\ `Next <what-a-real-unix.html>`__   |
+-----+-----+---------------------------------------+
| ?   | ?   | ?2.?What, a real UNIX??               |
+-----+-----+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
