==========================
12.7.?Do Things Rationally
==========================

.. raw:: html

   <div class="navheader">

12.7.?Do Things Rationally
`Prev <dads-sh-exec.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-cc.html>`__

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

12.7.?Do Things Rationally
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``Makefile`` should do things in a simple and reasonable manner.
Making it a couple of lines shorter or more readable is always better.
Examples include using a make ``.if`` construct instead of a shell
``if`` construct, not redefining ``do-extract`` if redefining
``EXTRACT*`` is enough, and using ``GNU_CONFIGURE`` instead of
``CONFIGURE_ARGS     += --prefix=${PREFIX}``.

If a lot of new code is needed to do something, there may already be an
implementation of it in ``bsd.port.mk``. While hard to read, there are a
great many seemingly-hard problems for which ``bsd.port.mk`` already
provides a shorthand solution.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------+------------------------------+------------------------------------------+
| `Prev <dads-sh-exec.html>`__?                          | `Up <porting-dads.html>`__   | ?\ `Next <dads-cc.html>`__               |
+--------------------------------------------------------+------------------------------+------------------------------------------+
| 12.6.?Use the ``exec`` Statement in Wrapper Scripts?   | `Home <index.html>`__        | ?12.8.?Respect Both ``CC`` and ``CXX``   |
+--------------------------------------------------------+------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
