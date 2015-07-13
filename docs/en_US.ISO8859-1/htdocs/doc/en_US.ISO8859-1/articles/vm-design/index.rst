========================================
Design elements of the FreeBSD VM system
========================================

.. raw:: html

   <div class="navheader">

Design elements of the FreeBSD VM system
?
?
?\ `Next <vm-objects.html>`__

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

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Matthew Dillon
~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| 
|  ????\ ``<dillon@apollo.backplane.com>``
|  ??

.. raw:: html

   </div>

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

`Legal Notice <legalnotice.html>`__

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

The title is really just a fancy way of saying that I am going to
attempt to describe the whole VM enchilada, hopefully in a way that
everyone can follow. For the last year I have concentrated on a number
of major kernel subsystems within FreeBSD, with the VM and Swap
subsystems being the most interesting and NFS being “a necessary chore”.
I rewrote only small portions of the code. In the VM arena the only
major rewrite I have done is to the swap subsystem. Most of my work was
cleanup and maintenance, with only moderate code rewriting and no major
algorithmic adjustments within the VM subsystem. The bulk of the VM
subsystem's theoretical base remains unchanged and a lot of the credit
for the modernization effort in the last few years belongs to John Dyson
and David Greenman. Not being a historian like Kirk I will not attempt
to tag all the various features with peoples names, since I will
invariably get it wrong.

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

`1. Introduction <index.html#introduction>`__
`2. VM Objects <vm-objects.html>`__
`3. SWAP Layers <swap-layers.html>`__
`4. When to free a page <freeing-pages.html>`__
`5. Pre-Faulting and Zeroing
Optimizations <prefault-optimizations.html>`__
`6. Page Table Optimizations <page-table-optimizations.html>`__
`7. Page Coloring <page-coloring-optimizations.html>`__
`8. Conclusion <conclusion.html>`__
`9. Bonus QA session by Allen Briggs
``<briggs@ninthwonder.com>`` <allen-briggs-qa.html>`__

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

Before moving along to the actual design let's spend a little time on
the necessity of maintaining and modernizing any long-living codebase.
In the programming world, algorithms tend to be more important than code
and it is precisely due to BSD's academic roots that a great deal of
attention was paid to algorithm design from the beginning. More
attention paid to the design generally leads to a clean and flexible
codebase that can be fairly easily modified, extended, or replaced over
time. While BSD is considered an “old” operating system by some people,
those of us who work on it tend to view it more as a “mature” codebase
which has various components modified, extended, or replaced with modern
code. It has evolved, and FreeBSD is at the bleeding edge no matter how
old some of the code might be. This is an important distinction to make
and one that is unfortunately lost to many people. The biggest error a
programmer can make is to not learn from history, and this is precisely
the error that many other modern operating systems have made.
Windows?NT? is the best example of this, and the consequences have been
dire. Linux also makes this mistake to some degree—enough that we BSD
folk can make small jokes about it every once in a while, anyway.
Linux's problem is simply one of a lack of experience and history to
compare ideas against, a problem that is easily and rapidly being
addressed by the Linux community in the same way it has been addressed
in the BSD community—by continuous code development. The Windows?NT?
folk, on the other hand, repeatedly make the same mistakes solved by
UNIX? decades ago and then spend years fixing them. Over and over again.
They have a severe case of “not designed here” and “we are always right
because our marketing department says so”. I have little tolerance for
anyone who cannot learn from history.

Much of the apparent complexity of the FreeBSD design, especially in the
VM/Swap subsystem, is a direct result of having to solve serious
performance issues that occur under various conditions. These issues are
not due to bad algorithmic design but instead rise from environmental
factors. In any direct comparison between platforms, these issues become
most apparent when system resources begin to get stressed. As I describe
FreeBSD's VM/Swap subsystem the reader should always keep two points in
mind:

.. raw:: html

   <div class="orderedlist">

#. The most important aspect of performance design is what is known as
   “Optimizing the Critical Path”. It is often the case that performance
   optimizations add a little bloat to the code in order to make the
   critical path perform better.

#. A solid, generalized design outperforms a heavily-optimized design
   over the long run. While a generalized design may end up being slower
   than an heavily-optimized design when they are first implemented, the
   generalized design tends to be easier to adapt to changing conditions
   and the heavily-optimized design winds up having to be thrown away.

.. raw:: html

   </div>

Any codebase that will survive and be maintainable for years must
therefore be designed properly from the beginning even if it costs some
performance. Twenty years ago people were still arguing that programming
in assembly was better than programming in a high-level language because
it produced code that was ten times as fast. Today, the fallibility of
that argument is obvious ?—?as are the parallels to algorithmic design
and code generalization.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------------+
| ?   | ?   | ?\ `Next <vm-objects.html>`__   |
+-----+-----+---------------------------------+
| ?   | ?   | ?2.?VM Objects                  |
+-----+-----+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
