===========================
Linux? emulation in FreeBSD
===========================

.. raw:: html

   <div class="navheader">

Linux? emulation in FreeBSD
?
?
?\ `Next <inside.html>`__

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

Roman Divacky
~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<rdivacky@FreeBSD.org>``

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

This masters thesis deals with updating the Linux? emulation layer (the
so called *Linuxulator*). The task was to update the layer to match the
functionality of Linux? 2.6. As a reference implementation, the Linux?
2.6.16 kernel was chosen. The concept is loosely based on the NetBSD
implementation. Most of the work was done in the summer of 2006 as a
part of the Google Summer of Code students program. The focus was on
bringing the *NPTL* (new POSIX? thread library) support into the
emulation layer, including *TLS* (thread local storage), *futexes* (fast
user space mutexes), *PID mangling*, and some other minor things. Many
small problems were identified and fixed in the process. My work was
integrated into the main FreeBSD source repository and will be shipped
in the upcoming 7.0R release. We, the emulation development team, are
working on making the Linux? 2.6 emulation the default emulation layer
in FreeBSD.

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

`1. Introduction <index.html#intro>`__
`2. A look inside… <inside.html>`__
`3. Emulation <freebsd-emulation.html>`__
`4. Linux? emulation layer -MD part <md.html>`__
`5. Linux? emulation layer -MI part <mi.html>`__
`6. Conclusion <conclusion.html>`__
`7. Literatures <literatures.html>`__

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

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In the last few years the open source UNIX? based operating systems
started to be widely deployed on server and client machines. Among these
operating systems I would like to point out two: FreeBSD, for its BSD
heritage, time proven code base and many interesting features and Linux?
for its wide user base, enthusiastic open developer community and
support from large companies. FreeBSD tends to be used on server class
machines serving heavy duty networking tasks with less usage on desktop
class machines for ordinary users. While Linux? has the same usage on
servers, but it is used much more by home based users. This leads to a
situation where there are many binary only programs available for Linux?
that lack support for FreeBSD.

Naturally, a need for the ability to run Linux? binaries on a FreeBSD
system arises and this is what this thesis deals with: the emulation of
the Linux? kernel in the FreeBSD operating system.

During the Summer of 2006 Google Inc. sponsored a project which focused
on extending the Linux? emulation layer (the so called Linuxulator) in
FreeBSD to include Linux? 2.6 facilities. This thesis is written as a
part of this project.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------+
| ?   | ?   | ?\ `Next <inside.html>`__   |
+-----+-----+-----------------------------+
| ?   | ?   | ?2.?A look inside…          |
+-----+-----+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
