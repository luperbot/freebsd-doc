======================
7.4.?The Sockets Model
======================

.. raw:: html

   <div class="navheader">

7.4.?The Sockets Model
`Prev <sockets-protocols.html>`__?
Chapter?7.?Sockets
?\ `Next <sockets-essential-functions.html>`__

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

7.4.?The Sockets Model
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD sockets are built on the basic UNIX? model: *Everything is a file.*
In our example, then, sockets would let us receive an *HTTP file*, so to
speak. It would then be up to us to extract the *PNG file* from it.

Because of the complexity of internetworking, we cannot just use the
``open`` system call, or the ``open()`` C function. Instead, we need to
take several steps to “opening” a socket.

Once we do, however, we can start treating the *socket* the same way we
treat any *file descriptor*: We can ``read`` from it, ``write`` to it,
``pipe`` it, and, eventually, ``close`` it.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+--------------------------------------------------+
| `Prev <sockets-protocols.html>`__?   | `Up <sockets.html>`__   | ?\ `Next <sockets-essential-functions.html>`__   |
+--------------------------------------+-------------------------+--------------------------------------------------+
| 7.3.?Protocols?                      | `Home <index.html>`__   | ?7.5.?Essential Socket Functions                 |
+--------------------------------------+-------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
