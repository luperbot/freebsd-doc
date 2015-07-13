====================
7.?Future Directions
====================

.. raw:: html

   <div class="navheader">

7.?Future Directions
`Prev <lessons-learned.html>`__?
?
?\ `Next <ackno.html>`__

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

7.?Future Directions
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is imperative for our release engineering activities to scale with
our growing userbase. Along these lines we are working very hard to
document the procedures involved in producing FreeBSD releases.

.. raw:: html

   <div class="itemizedlist">

-  *Parallelism* - Certain portions of the release build are actually
   “embarrassingly parallel”. Most of the tasks are very I/O?intensive,
   so having multiple high-speed disk drives is actually more important
   than using multiple processors in speeding up the
   ``make         release`` process. If multiple disks are used for
   different hierarchies in the
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
   environment, then the CVS checkout of the ``ports`` and ``doc`` trees
   can be happening simultaneously as the ``make         world`` on
   another disk. Using a RAID solution (hardware or software) can
   significantly decrease the overall build time.

-  *Cross-building releases* - Building IA-64 or Alpha release on x86
   hardware? ``make         TARGET=ia64 release``.

-  *Regression Testing* - We need better automated correctness testing
   for FreeBSD.

-  *Installation Tools* - Our installation program has long since
   outlived its intended life span. Several projects are under
   development to provide a more advanced installation mechanism. The
   libh project was one such project that aimed to provide an
   intelligent new package framework and GUI installation program.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+----------------------------+
| `Prev <lessons-learned.html>`__?       | ?                       | ?\ `Next <ackno.html>`__   |
+----------------------------------------+-------------------------+----------------------------+
| 6.?Lessons Learned from FreeBSD?4.4?   | `Home <index.html>`__   | ?8.?Acknowledgements       |
+----------------------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
