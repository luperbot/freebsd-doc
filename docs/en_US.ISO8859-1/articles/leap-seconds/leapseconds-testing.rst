==========
4.?Testing
==========

.. raw:: html

   <div class="navheader">

4.?Testing
`Prev <leapseconds-cautions.html>`__?
?
?\ `Next <leapseconds-conclusion.html>`__

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

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+---------------------------------------------+
| `Prev <leapseconds-cautions.html>`__?   | ?                       | ?\ `Next <leapseconds-conclusion.html>`__   |
+-----------------------------------------+-------------------------+---------------------------------------------+
| 3.?Cautions?                            | `Home <index.html>`__   | ?5.?Conclusion                              |
+-----------------------------------------+-------------------------+---------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
