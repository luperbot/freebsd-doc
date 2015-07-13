===========
3.?Cautions
===========

.. raw:: html

   <div class="navheader">

3.?Cautions
`Prev <leapseconds-posix.html>`__?
?
?\ `Next <leapseconds-testing.html>`__

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

3.?Cautions
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Leap seconds are inserted at the same instant all over the world: UTC
midnight. In Japan that is mid-morning, in the Pacific mid-day, in the
Americas late afternoon, and in Europe at night.

We believe and expect that FreeBSD, if provided correct and stable NTP
service, will work as designed during this leap second, as it did during
the previous ones.

However, we caution that practically no applications have ever asked the
kernel about leap seconds. Our experience is that, as designed, leap
seconds are essentially a replay of the second before the leap second,
and this is a surprise to most application programmers.

Other operating systems and other computers may or may not handle the
leap-second the same way as FreeBSD, and systems without correct and
stable NTP service will not know anything about leap seconds at all.

It is not unheard of for computers to crash because of leap seconds, and
experience has shown that a large fraction of all public NTP servers
might handle and announce the leap second incorrectly.

Please try to make sure nothing horrible happens because of the leap
second.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------+------------------------------------------+
| `Prev <leapseconds-posix.html>`__?            | ?                       | ?\ `Next <leapseconds-testing.html>`__   |
+-----------------------------------------------+-------------------------+------------------------------------------+
| 2.?Default Leap Second Handling on FreeBSD?   | `Home <index.html>`__   | ?4.?Testing                              |
+-----------------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
