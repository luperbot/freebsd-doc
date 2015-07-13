===============================
Practical rc.d scripting in BSD
===============================

.. raw:: html

   <div class="navheader">

Practical rc.d scripting in BSD
?
?
?\ `Next <rcng-task.html>`__

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

Yar Tikhiy
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<yar@FreeBSD.org>``

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

Copyright ? 2005-2006, 2012 The FreeBSD Project

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

Beginners may find it difficult to relate the facts from the formal
documentation on the BSD ``rc.d`` framework with the practical tasks of
``rc.d`` scripting. In this article, we consider a few typical cases of
increasing complexity, show ``rc.d`` features suited for each case, and
discuss how they work. Such an examination should provide reference
points for further study of the design and efficient application of
``rc.d``.

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

`1. Introduction <index.html#rcng-intro>`__
`2. Outlining the task <rcng-task.html>`__
`3. A dummy script <rcng-dummy.html>`__
`4. A configurable dummy script <rcng-confdummy.html>`__
`5. Startup and shutdown of a simple daemon <rcng-daemon.html>`__
`6. Startup and shutdown of an advanced daemon <rcng-daemon-adv.html>`__
`7. Connecting a script to the rc.d framework <rcng-hookup.html>`__
`8. Giving more flexibility to an rc.d script <rcng-args.html>`__
`9. Further reading <rcng-furthur.html>`__

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

The historical BSD had a monolithic startup script, ``/etc/rc``. It was
invoked by
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__ at
system boot time and performed all userland tasks required for
multi-user operation: checking and mounting file systems, setting up the
network, starting daemons, and so on. The precise list of tasks was not
the same in every system; admins needed to customize it. With few
exceptions, ``/etc/rc`` had to be modified, and true hackers liked it.

The real problem with the monolithic approach was that it provided no
control over the individual components started from ``/etc/rc``. For
instance, ``/etc/rc`` could not restart a single daemon. The system
admin had to find the daemon process by hand, kill it, wait until it
actually exited, then browse through ``/etc/rc`` for the flags, and
finally type the full command line to start the daemon again. The task
would become even more difficult and prone to errors if the service to
restart consisted of more than one daemon or demanded additional
actions. In a few words, the single script failed to fulfil what scripts
are for: to make the system admin's life easier.

Later there was an attempt to split out some parts of ``/etc/rc`` for
the sake of starting the most important subsystems separately. The
notorious example was ``/etc/netstart`` to bring up networking. It did
allow for accessing the network from single-user mode, but it did not
integrate well into the automatic startup process because parts of its
code needed to interleave with actions essentially unrelated to
networking. That was why ``/etc/netstart`` mutated into
``/etc/rc.network``. The latter was no longer an ordinary script; it
comprised of large, tangled
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
functions called from ``/etc/rc`` at different stages of system startup.
However, as the startup tasks grew diverse and sophisticated, the
“quasi-modular” approach became even more of a drag than the monolithic
``/etc/rc`` had been.

Without a clean and well-designed framework, the startup scripts had to
bend over backwards to satisfy the needs of rapidly developing BSD-based
operating systems. It became obvious at last that more steps are
necessary on the way to a fine-grained and extensible ``rc`` system.
Thus BSD ``rc.d`` was born. Its acknowledged fathers were Luke Mewburn
and the NetBSD community. Later it was imported into FreeBSD. Its name
refers to the location of system scripts for individual services, which
is in ``/etc/rc.d``. Soon we will learn about more components of the
``rc.d`` system and see how the individual scripts are invoked.

The basic ideas behind BSD ``rc.d`` are *fine modularity* and *code
reuse*. *Fine modularity* means that each basic “service” such as a
system daemon or primitive startup task gets its own
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ script
able to start the service, stop it, reload it, check its status. A
particular action is chosen by the command-line argument to the script.
The ``/etc/rc`` script still drives system startup, but now it merely
invokes the smaller scripts one by one with the ``start`` argument. It
is easy to perform shutdown tasks as well by running the same set of
scripts with the ``stop`` argument, which is done by
``/etc/rc.shutdown``. Note how closely this follows the Unix way of
having a set of small specialized tools, each fulfilling its task as
well as possible. *Code reuse* means that common operations are
implemented as
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
functions and collected in ``/etc/rc.subr``. Now a typical script can be
just a few lines' worth of
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ code.
Finally, an important part of the ``rc.d`` framework is
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__,
which helps ``/etc/rc`` to run the small scripts orderly with respect to
dependencies between them. It can help ``/etc/rc.shutdown``, too,
because the proper order for the shutdown sequence is opposite to that
of startup.

The BSD ``rc.d`` design is described in `the original article by Luke
Mewburn <rcng-furthur.html#lukem>`__, and the ``rc.d`` components are
documented in great detail in `the respective manual
pages <rcng-furthur.html#manpages>`__. However, it might not appear
obvious to an ``rc.d`` newbie how to tie the numerous bits and pieces
together in order to create a well-styled script for a particular task.
Therefore this article will try a different approach to describe
``rc.d``. It will show which features should be used in a number of
typical cases, and why. Note that this is not a how-to document because
our aim is not at giving ready-made recipes, but at showing a few easy
entrances into the ``rc.d`` realm. Neither is this article a replacement
for the relevant manual pages. Do not hesitate to refer to them for more
formal and complete documentation while reading this article.

There are prerequisites to understanding this article. First of all, you
should be familiar with the
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
scripting language in order to master ``rc.d``. In addition, you should
know how the system performs userland startup and shutdown tasks, which
is described in
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__.

This article focuses on the FreeBSD branch of ``rc.d``. Nevertheless, it
may be useful to NetBSD developers, too, because the two branches of BSD
``rc.d`` not only share the same design but also stay similar in their
aspects visible to script authors.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+--------------------------------+
| ?   | ?   | ?\ `Next <rcng-task.html>`__   |
+-----+-----+--------------------------------+
| ?   | ?   | ?2.?Outlining the task         |
+-----+-----+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
