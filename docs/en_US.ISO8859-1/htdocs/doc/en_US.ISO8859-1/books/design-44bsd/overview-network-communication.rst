===========================
2.12.?Network Communication
===========================

.. raw:: html

   <div class="navheader">

2.12.?Network Communication
`Prev <overview-ipc.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-network-implementation.html>`__

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

2.12.?Network Communication
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some of the communication domains supported by the *socket* IPC
mechanism provide access to network protocols. These protocols are
implemented as a separate software layer logically below the socket
software in the kernel. The kernel provides many ancillary services,
such as buffer management, message routing, standardized interfaces to
the protocols, and interfaces to the network interface drivers for the
use of the various network protocols.

At the time that 4.2BSD was being implemented, there were many
networking protocols in use or under development, each with its own
strengths and weaknesses. There was no clearly superior protocol or
protocol suite. By supporting multiple protocols, 4.2BSD could provide
interoperability and resource sharing among the diverse set of machines
that was available in the Berkeley environment. Multiple-protocol
support also provides for future changes. Today's protocols designed for
10- to 100-Mbit-per-second Ethernets are likely to be inadequate for
tomorrow's 1- to 10-Gbit-per-second fiber-optic networks. Consequently,
the network-communication layer is designed to support multiple
protocols. New protocols are added to the kernel without the support for
older protocols being affected. Older applications can continue to
operate using the old protocol over the same physical network as is used
by newer applications running with a newer network protocol.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+--------------------------+------------------------------------------------------+
| `Prev <overview-ipc.html>`__?       | `Up <overview.html>`__   | ?\ `Next <overview-network-implementation.html>`__   |
+-------------------------------------+--------------------------+------------------------------------------------------+
| 2.11.?Interprocess Communication?   | `Home <index.html>`__    | ?2.13.?Network Implementation                        |
+-------------------------------------+--------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
