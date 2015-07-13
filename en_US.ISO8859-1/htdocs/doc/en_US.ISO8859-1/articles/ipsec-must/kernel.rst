===============================
7.?src/sys/i386/conf/KERNELNAME
===============================

.. raw:: html

   <div class="navheader">

7.?src/sys/i386/conf/KERNELNAME
`Prev <ipsec-install.html>`__?
?
?\ `Next <code.html>`__

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

7.?src/sys/i386/conf/KERNELNAME
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This needs to be present in the kernel config file in order to capture
network data with
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__.
Be sure to run
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
after adding this, and rebuild and reinstall.

.. code:: programlisting

    device  bpf

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-------------------------------------------------------------------+
| `Prev <ipsec-install.html>`__?   | ?                       | ?\ `Next <code.html>`__                                           |
+----------------------------------+-------------------------+-------------------------------------------------------------------+
| 6.?Installing IPsec?             | `Home <index.html>`__   | ?8.?Maurer's Universal Statistical Test (for block size=8 bits)   |
+----------------------------------+-------------------------+-------------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
