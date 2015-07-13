=======================================
14.4.?The FreeBSD Port Building Cluster
=======================================

.. raw:: html

   <div class="navheader">

14.4.?The FreeBSD Port Building Cluster
`Prev <ports-mailing-list.html>`__?
Chapter?14.?Keeping Up
?\ `Next <distfile-survey.html>`__

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

14.4.?The FreeBSD Port Building Cluster
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the least-publicized strengths of FreeBSD is that an entire
cluster of machines is dedicated to continually building the Ports
Collection, for each of the major OS releases and for each Tier-1
architecture.

Individual ports are built unless they are specifically marked with
``IGNORE``. Ports that are marked with ``BROKEN`` will still be
attempted, to see if the underlying problem has been resolved. (This is
done by passing ``TRYBROKEN`` to the port's ``Makefile``.)

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------+--------------------------------------------------------+
| `Prev <ports-mailing-list.html>`__?     | `Up <keeping-up.html>`__   | ?\ `Next <distfile-survey.html>`__                     |
+-----------------------------------------+----------------------------+--------------------------------------------------------+
| 14.3.?The FreeBSD Ports Mailing List?   | `Home <index.html>`__      | ?14.5.?Portscout: the FreeBSD Ports Distfile Scanner   |
+-----------------------------------------+----------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
