===============
9.3.?Port Tools
===============

.. raw:: html

   <div class="navheader">

9.3.?Port Tools
`Prev <testing-portlint.html>`__?
Chapter?9.?Testing the Port
?\ `Next <porting-prefix.html>`__

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

9.3.?Port Tools
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`ports-mgmt/porttools <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/porttools/pkg-descr>`__
program is part of the Ports Collection.

``port`` is the front-end script, which can help simplify the testing
job. Whenever a new port or an update to an existing one needs testing,
use ``port test`` to test the port, including the
```portlint`` <testing-portlint.html>`__ checking. This command also
detects and lists any files that are not listed in ``pkg-plist``. For
example:

.. code:: screen

    # port test /usr/ports/net/csup

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+--------------------------------------+
| `Prev <testing-portlint.html>`__?   | `Up <testing.html>`__   | ?\ `Next <porting-prefix.html>`__    |
+-------------------------------------+-------------------------+--------------------------------------+
| 9.2.?Portlint?                      | `Home <index.html>`__   | ?9.4.?\ ``PREFIX`` and ``DESTDIR``   |
+-------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
