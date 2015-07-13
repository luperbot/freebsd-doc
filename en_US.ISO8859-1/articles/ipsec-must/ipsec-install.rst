===================
6.?Installing IPsec
===================

.. raw:: html

   <div class="navheader">

6.?Installing IPsec
`Prev <IPsec.html>`__?
?
?\ `Next <kernel.html>`__

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

6.?Installing IPsec
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most of the modern versions of FreeBSD have IPsec support in their base
source. So you will need to include the ``IPSEC`` option in your kernel
config and, after kernel rebuild and reinstall, configure IPsec
connections using
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8>`__
command.

A comprehensive guide on running IPsec on FreeBSD is provided in
`FreeBSD
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/ipsec.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+------------------------------------+
| `Prev <IPsec.html>`__?   | ?                       | ?\ `Next <kernel.html>`__          |
+--------------------------+-------------------------+------------------------------------+
| 5.?IPsec---Definition?   | `Home <index.html>`__   | ?7.?src/sys/i386/conf/KERNELNAME   |
+--------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
