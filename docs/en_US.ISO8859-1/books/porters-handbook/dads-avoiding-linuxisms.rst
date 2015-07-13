=========================
12.18.?Avoiding Linuxisms
=========================

.. raw:: html

   <div class="navheader">

12.18.?Avoiding Linuxisms
`Prev <dads-rerolling-distfiles.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-misc.html>`__

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

12.18.?Avoiding Linuxisms
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do not use ``/proc`` if there are any other ways of getting the
information. For example, ``setprogname(argv[0])`` in ``main()`` and
then
`getprogname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getprogname&sektion=3>`__
to know the executable name>.

Do not rely on behavior that is undocumented by POSIX.

Do not record timestamps in the critical path of the application if it
also works without. Getting timestamps may be slow, depending on the
accuracy of timestamps in the OS. If timestamps are really needed,
determine how precise they have to be and use an API which is documented
to just deliver the needed precision.

A number of simple syscalls (for example
`gettimeofday(2) <http://www.FreeBSD.org/cgi/man.cgi?query=gettimeofday&sektion=2>`__,
`getpid(2) <http://www.FreeBSD.org/cgi/man.cgi?query=getpid&sektion=2>`__)
are much faster on Linux? than on any other operating system due to
caching and the vsyscall performance optimizations. Do not rely on them
being cheap in performance-critical applications. In general, try hard
to avoid syscalls if possible.

Do not rely on Linux?-specific socket behaviour. In particular, default
socket buffer sizes are different (call
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2>`__
with ``SO_SNDBUF`` and ``SO_RCVBUF``, and while Linux?'s
`send(2) <http://www.FreeBSD.org/cgi/man.cgi?query=send&sektion=2>`__
blocks when the socket buffer is full, FreeBSD's will fail and set
``ENOBUFS`` in errno.

If relying on non-standard behaviour is required, encapsulate it
properly into a generic API, do a check for the behaviour in the
configure stage, and stop if it is missing.

Check the `man pages <http://www.freebsd.org/cgi/man.cgi>`__ to see if
the function used is a POSIX interface (in the “STANDARDS” section of
the man page).

Do not assume that ``/bin/sh`` is bash. Ensure that a command line
passed to
`system(3) <http://www.FreeBSD.org/cgi/man.cgi?query=system&sektion=3>`__
will work with a POSIX compliant shell.

A list of common bashisms is available
`here <https://wiki.ubuntu.com/DashAsBinSh>`__.

Check that headers are included in the POSIX or man page recommended
way. For example, ``sys/types.h`` is often forgotten, which is not as
much of a problem for Linux? as it is for FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+------------------------------+--------------------------------+
| `Prev <dads-rerolling-distfiles.html>`__?   | `Up <porting-dads.html>`__   | ?\ `Next <dads-misc.html>`__   |
+---------------------------------------------+------------------------------+--------------------------------+
| 12.17.?Rerolling Distfiles?                 | `Home <index.html>`__        | ?12.19.?Miscellanea            |
+---------------------------------------------+------------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
