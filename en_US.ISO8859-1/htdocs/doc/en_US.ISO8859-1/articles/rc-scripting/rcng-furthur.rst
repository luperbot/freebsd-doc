==================
9.?Further reading
==================

.. raw:: html

   <div class="navheader">

9.?Further reading
`Prev <rcng-args.html>`__?
?
?

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

9.?Further reading
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

\ `The original article by Luke
Mewburn <http://www.mewburn.net/luke/papers/rc.d.pdf>`__ offers a
general overview of ``rc.d`` and detailed rationale for its design
decisions. It provides insight on the whole ``rc.d`` framework and its
place in a modern BSD operating system.

The manual pages
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__,
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__,
and
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
document the ``rc.d`` components in great detail. You cannot fully use
the ``rc.d`` power without studying the manual pages and referring to
them while writing your own scripts.

The major source of working, real-life examples is ``/etc/rc.d`` in a
live system. Its contents are easy and pleasant to read because most
rough corners are hidden deep in
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__.
Keep in mind though that the ``/etc/rc.d`` scripts were not written by
angels, so they might suffer from bugs and suboptimal design decisions.
Now you can improve them!

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-------------------------+-----+
| `Prev <rcng-args.html>`__?                      | ?                       | ?   |
+-------------------------------------------------+-------------------------+-----+
| 8.?Giving more flexibility to an rc.d script?   | `Home <index.html>`__   | ?   |
+-------------------------------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
