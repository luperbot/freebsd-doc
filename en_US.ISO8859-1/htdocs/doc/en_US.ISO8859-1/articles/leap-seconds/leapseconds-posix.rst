==========================================
2.?Default Leap Second Handling on FreeBSD
==========================================

.. raw:: html

   <div class="navheader">

2.?Default Leap Second Handling on FreeBSD
`Prev <index.html>`__?
?
?\ `Next <leapseconds-cautions.html>`__

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

2.?Default Leap Second Handling on FreeBSD
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The easiest way to handle leap seconds is with the POSIX time rules
FreeBSD uses by default, combined with
`NTP <../../../../doc/en_US.ISO8859-1/books/handbook/network-ntp.html>`__.
When
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__ is
running and the time is synchronized with upstream NTP servers that
handle leap seconds correctly, the leap second will cause the system
time to automatically repeat the last second of the day. No other
adjustments are necessary.

If the upstream NTP servers do not handle leap seconds correctly,
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
will step the time by one second after the errant upstream server has
noticed and stepped itself.

If NTP is not being used, manual adjustment of the system clock will be
required after the leap second has passed.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-------------------------------------------+
| `Prev <index.html>`__?              | ?                       | ?\ `Next <leapseconds-cautions.html>`__   |
+-------------------------------------+-------------------------+-------------------------------------------+
| FreeBSD Support for Leap Seconds?   | `Home <index.html>`__   | ?3.?Cautions                              |
+-------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
