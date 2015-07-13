======================
2.?What, a real UNIX??
======================

.. raw:: html

   <div class="navheader">

2.?What, a real UNIX??
`Prev <index.html>`__?
?
?\ `Next <why-is-bsd-not-better-known.html>`__

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

2.?What, a real UNIX??
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The BSD operating systems are not clones, but open source derivatives of
AT&T's Research UNIX? operating system, which is also the ancestor of
the modern UNIX? System V. This may surprise you. How could that happen
when AT&T has never released its code as open source?

It is true that AT&T UNIX? is not open source, and in a copyright sense
BSD is very definitely *not* UNIX?, but on the other hand, AT&T has
imported sources from other projects, noticeably the Computer Sciences
Research Group (CSRG) of the University of California in Berkeley, CA.
Starting in 1976, the CSRG started releasing tapes of their software,
calling them *Berkeley Software Distribution* or *BSD*.

Initial BSD releases consisted mainly of user programs, but that changed
dramatically when the CSRG landed a contract with the Defense Advanced
Research Projects Agency (DARPA) to upgrade the communications protocols
on their network, ARPANET. The new protocols were known as the *Internet
Protocols*, later *TCP/IP* after the most important protocols. The first
widely distributed implementation was part of 4.2BSD, in 1982.

In the course of the 1980s, a number of new workstation companies sprang
up. Many preferred to license UNIX? rather than developing operating
systems for themselves. In particular, Sun Microsystems licensed UNIX?
and implemented a version of 4.2BSD, which they called SunOS™. When AT&T
themselves were allowed to sell UNIX? commercially, they started with a
somewhat bare-bones implementation called System III, to be quickly
followed by System V. The System V code base did not include networking,
so all implementations included additional software from the BSD,
including the TCP/IP software, but also utilities such as the *csh*
shell and the *vi* editor. Collectively, these enhancements were known
as the *Berkeley Extensions*.

The BSD tapes contained AT&T source code and thus required a UNIX?
source license. By 1990, the CSRG's funding was running out, and it
faced closure. Some members of the group decided to release the BSD
code, which was Open Source, without the AT&T proprietary code. This
finally happened with the *Networking Tape 2*, usually known as *Net/2*.
Net/2 was not a complete operating system: about 20% of the kernel code
was missing. One of the CSRG members, William F. Jolitz, wrote the
remaining code and released it in early 1992 as *386BSD*. At the same
time, another group of ex-CSRG members formed a commercial company
called `Berkeley Software Design Inc. <http://www.bsdi.com/>`__ and
released a beta version of an operating system called
`BSD/386 <http://www.bsdi.com/>`__, which was based on the same sources.
The name of the operating system was later changed to BSD/OS.

386BSD never became a stable operating system. Instead, two other
projects split off from it in 1993: `NetBSD <http://www.NetBSD.org/>`__
and `FreeBSD <../../../../index.html>`__. The two projects originally
diverged due to differences in patience waiting for improvements to
386BSD: the NetBSD people started early in the year, and the first
version of FreeBSD was not ready until the end of the year. In the
meantime, the code base had diverged sufficiently to make it difficult
to merge. In addition, the projects had different aims, as we will see
below. In 1996, `OpenBSD <http://www.OpenBSD.org/>`__ split off from
NetBSD, and in 2003, `DragonFlyBSD <http://www.dragonflybsd.org/>`__
split off from FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+--------------------------------------------------+
| `Prev <index.html>`__?   | ?                       | ?\ `Next <why-is-bsd-not-better-known.html>`__   |
+--------------------------+-------------------------+--------------------------------------------------+
| Explaining BSD?          | `Home <index.html>`__   | ?3.?Why is BSD not better known?                 |
+--------------------------+-------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
