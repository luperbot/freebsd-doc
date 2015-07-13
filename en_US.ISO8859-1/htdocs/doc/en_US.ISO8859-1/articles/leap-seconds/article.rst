================================
FreeBSD Support for Leap Seconds
================================

.. raw:: html

   <div class="article">

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

Last modified on by .

.. raw:: html

   </div>

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

`1. Introduction <#leapseconds-definition>`__
`2. Default Leap Second Handling on FreeBSD <#leapseconds-posix>`__
`3. Cautions <#leapseconds-cautions>`__
`4. Testing <#leapseconds-testing>`__
`5. Conclusion <#leapseconds-conclusion>`__

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

A *leap second* is an ad-hoc one-second correction to synchronize atomic
timescales with Earth rotation. This article describes how FreeBSD
interacts with leap seconds.

As of this writing, the next leap second will occur at 2015-Jun-30
23:59:60 UTC. This leap second will occur during a business day for
North and South America and the Asia/Pacific region.

Leap seconds are announced by `IERS <http://datacenter.iers.org/>`__ on
`Bulletin
C <http://datacenter.iers.org/web/guest/bulletins/-/somos/5Rgv/product/16>`__.

Standard leap second behavior is described in `RFC
7164 <https://tools.ietf.org/html/rfc7164#section-3>`__. Also see
`time2posix(3) <http://www.FreeBSD.org/cgi/man.cgi?query=time2posix&sektion=3>`__.

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

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.?Testing
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to test whether a leap second will be used. Due to the
nature of NTP, the test might work up to 24 hours before the leap
second. Some major reference clock sources only announce leap seconds
one hour ahead of the event. Query the NTP daemon:

.. code:: screen

    % ntpq -c 'rv 0 leap'

Output that includes ``leap_add_sec`` indicates proper support of the
leap second. Before the 24 hours leading up to the leap second, or after
the leap second has passed, ``leap_none`` will be shown.

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

5.?Conclusion
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In practice, leap seconds are usually not a problem on FreeBSD. We hope
that this overview helps clarify what to expect and how to make the leap
second event proceed more smoothly.

.. raw:: html

   </div>

.. raw:: html

   </div>
