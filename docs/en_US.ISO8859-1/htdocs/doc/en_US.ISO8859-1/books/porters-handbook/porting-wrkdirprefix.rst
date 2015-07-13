==================
12.3.?WRKDIRPREFIX
==================

.. raw:: html

   <div class="navheader">

12.3.?\ ``WRKDIRPREFIX``
`Prev <porting-wrkdir.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <porting-versions.html>`__

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

12.3.?\ ``WRKDIRPREFIX``
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Make sure the port honors ``WRKDIRPREFIX``. Most ports do not have to
worry about this. In particular, when referring to a ``WRKDIR`` of
another port, note that the correct location is
``WRKDIRPREFIXPORTSDIR/subdir``/*``name``*/work not
``PORTSDIR/subdir``/*``name``*/work or
``.CURDIR/../../subdir``/*``name``*/work or some such.

Also, if defining ``WRKDIR``, make sure to prepend
``${WRKDIRPREFIX}${.CURDIR}`` in the front.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+------------------------------+------------------------------------------------------------+
| `Prev <porting-wrkdir.html>`__?   | `Up <porting-dads.html>`__   | ?\ `Next <porting-versions.html>`__                        |
+-----------------------------------+------------------------------+------------------------------------------------------------+
| 12.2.?\ ``WRKDIR``?               | `Home <index.html>`__        | ?12.4.?Differentiating Operating Systems and OS Versions   |
+-----------------------------------+------------------------------+------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
