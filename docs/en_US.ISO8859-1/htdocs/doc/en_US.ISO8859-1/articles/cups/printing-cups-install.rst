===================================
2.?Installing the CUPS Print Server
===================================

.. raw:: html

   <div class="navheader">

2.?Installing the CUPS Print Server
`Prev <index.html>`__?
?
?\ `Next <printing-cups-configuring-server.html>`__

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

2.?Installing the CUPS Print Server
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To install CUPS using a precompiled binary, issue the following command
from a root terminal:

.. code:: screen

    # pkg install cups

Other optional, but recommended, packages are
`print/gutenprint-cups <http://www.freebsd.org/cgi/url.cgi?ports/print/gutenprint-cups/pkg-descr>`__
and
`print/hplip <http://www.freebsd.org/cgi/url.cgi?ports/print/hplip/pkg-descr>`__,
both of which add drivers and utilities for a variety of printers. Once
installed, the CUPS configuration files can be found in the directory
``/usr/local/etc/cups``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+-------------------------------------------------------+
| `Prev <index.html>`__?   | ?                       | ?\ `Next <printing-cups-configuring-server.html>`__   |
+--------------------------+-------------------------+-------------------------------------------------------+
| CUPS on FreeBSD?         | `Home <index.html>`__   | ?3.?Configuring the CUPS Print Server                 |
+--------------------------+-------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
