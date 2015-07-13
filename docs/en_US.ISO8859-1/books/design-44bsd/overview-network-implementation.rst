============================
2.13.?Network Implementation
============================

.. raw:: html

   <div class="navheader">

2.13.?Network Implementation
`Prev <overview-network-communication.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-operation.html>`__

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

2.13.?Network Implementation
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first protocol suite implemented in 4.2BSD was DARPA's Transmission
Control Protocol/Internet Protocol (TCP/IP). The CSRG chose TCP/IP as
the first network to incorporate into the socket IPC framework, because
a 4.1BSD-based implementation was publicly available from a
DARPA-sponsored project at Bolt, Beranek, and Newman (BBN). That was an
influential choice: The 4.2BSD implementation is the main reason for the
extremely widespread use of this protocol suite. Later performance and
capability improvements to the TCP/IP implementation have also been
widely adopted. The TCP/IP implementation is described in detail in
Chapter 13.

The release of 4.3BSD added the Xerox Network Systems (XNS) protocol
suite, partly building on work done at the University of Maryland and at
Cornell University. This suite was needed to connect isolated machines
that could not communicate using TCP/IP.

The release of 4.4BSD added the ISO protocol suite because of the
latter's increasing visibility both within and outside the United
States. Because of the somewhat different semantics defined for the ISO
protocols, some minor changes were required in the socket interface to
accommodate these semantics. The changes were made such that they were
invisible to clients of other existing protocols. The ISO protocols also
required extensive addition to the two-level routing tables provided by
the kernel in 4.3BSD. The greatly expanded routing capabilities of
4.4BSD include arbitrary levels of routing with variable-length
addresses and network masks.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+--------------------------+-----------------------------------------+
| `Prev <overview-network-communication.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-operation.html>`__   |
+---------------------------------------------------+--------------------------+-----------------------------------------+
| 2.12.?Network Communication?                      | `Home <index.html>`__    | ?2.14.?System Operation                 |
+---------------------------------------------------+--------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
