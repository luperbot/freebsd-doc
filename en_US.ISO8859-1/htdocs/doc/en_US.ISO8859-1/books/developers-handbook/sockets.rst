==================
Chapter?7.?Sockets
==================

.. raw:: html

   <div class="navheader">

Chapter?7.?Sockets
`Prev <ipc.html>`__?
Part?II.?Interprocess Communication
?\ `Next <sockets-diversity.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?7.?Sockets
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by G. Adam Stanislav.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`7.1. Synopsis <sockets.html#sockets-synopsis>`__
`7.2. Networking and Diversity <sockets-diversity.html>`__
`7.3. Protocols <sockets-protocols.html>`__
`7.4. The Sockets Model <sockets-model.html>`__
`7.5. Essential Socket Functions <sockets-essential-functions.html>`__
`7.6. Helper Functions <sockets-helper-functions.html>`__
`7.7. Concurrent Servers <sockets-concurrent-servers.html>`__

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

7.1.?Synopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD sockets take interprocess communications to a new level. It is no
longer necessary for the communicating processes to run on the same
machine. They still *can*, but they do not have to.

Not only do these processes not have to run on the same machine, they do
not have to run under the same operating system. Thanks to BSD sockets,
your FreeBSD software can smoothly cooperate with a program running on a
Macintosh?, another one running on a Sun™ workstation, yet another one
running under Windows? 2000, all connected with an Ethernet-based local
area network.

But your software can equally well cooperate with processes running in
another building, or on another continent, inside a submarine, or a
space shuttle.

It can also cooperate with processes that are not part of a computer (at
least not in the strict sense of the word), but of such devices as
printers, digital cameras, medical equipment. Just about anything
capable of digital communications.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+----------------------------------------+
| `Prev <ipc.html>`__?                   | `Up <ipc.html>`__       | ?\ `Next <sockets-diversity.html>`__   |
+----------------------------------------+-------------------------+----------------------------------------+
| Part?II.?Interprocess Communication?   | `Home <index.html>`__   | ?7.2.?Networking and Diversity         |
+----------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
