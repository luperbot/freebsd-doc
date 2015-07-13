======================
12.16.?Usage of sysctl
======================

.. raw:: html

   <div class="navheader">

12.16.?Usage of ``sysctl``
`Prev <dads-dot-error.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-rerolling-distfiles.html>`__

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

12.16.?Usage of ``sysctl``
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The usage of ``sysctl`` is discouraged except in targets. This is
because the evaluation of any ``makevar``\ s, such as used during
``make index``, then has to run the command, further slowing down that
process.

Only use
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
through ``SYSCTL``, as it contains the fully qualified path and can be
overridden, if one has such a special need.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+------------------------------+-----------------------------------------------+
| `Prev <dads-dot-error.html>`__?                 | `Up <porting-dads.html>`__   | ?\ `Next <dads-rerolling-distfiles.html>`__   |
+-------------------------------------------------+------------------------------+-----------------------------------------------+
| 12.15.?Avoid Use of the ``.error`` Construct?   | `Home <index.html>`__        | ?12.17.?Rerolling Distfiles                   |
+-------------------------------------------------+------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
