============
12.2.?WRKDIR
============

.. raw:: html

   <div class="navheader">

12.2.?\ ``WRKDIR``
`Prev <porting-dads.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <porting-wrkdirprefix.html>`__

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

12.2.?\ ``WRKDIR``
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do not write anything to files outside ``WRKDIR``. ``WRKDIR`` is the
only place that is guaranteed to be writable during the port build (see
`installing ports from a
CDROM <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html#PORTS-CD>`__
for an example of building ports from a read-only tree). The ``pkg-*``
files can be modified by `redefining a variable <pkg-names.html>`__
rather than overwriting the file.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+------------------------------+-------------------------------------------+
| `Prev <porting-dads.html>`__?   | `Up <porting-dads.html>`__   | ?\ `Next <porting-wrkdirprefix.html>`__   |
+---------------------------------+------------------------------+-------------------------------------------+
| Chapter?12.?Dos and Don'ts?     | `Home <index.html>`__        | ?12.3.?\ ``WRKDIRPREFIX``                 |
+---------------------------------+------------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
