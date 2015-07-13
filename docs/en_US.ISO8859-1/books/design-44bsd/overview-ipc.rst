================================
2.11.?Interprocess Communication
================================

.. raw:: html

   <div class="navheader">

2.11.?Interprocess Communication
`Prev <overview-terminal.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-network-communication.html>`__

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

2.11.?Interprocess Communication
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Interprocess communication in 4.4BSD is organized in *communication
domains*. Domains currently supported include the *local domain*, for
communication between processes executing on the same machine; the
*internet domain*, for communication between processes using the TCP/IP
protocol suite (perhaps within the Internet); the ISO/OSI protocol
family for communication between sites required to run them; and the
*XNS domain*, for communication between processes using the XEROX
Network Systems (XNS) protocols.

Within a domain, communication takes place between communication
endpoints known as *sockets*. As mentioned in Section 2.6, the *socket*
system call creates a socket and returns a descriptor; other IPC system
calls are described in Chapter 11. Each socket has a type that defines
its communications semantics; these semantics include properties such as
reliability, ordering, and prevention of duplication of messages.

Each socket has associated with it a *communication protocol*. This
protocol provides the semantics required by the socket according to the
latter's type. Applications may request a specific protocol when
creating a socket, or may allow the system to select a protocol that is
appropriate for the type of socket being created.

Sockets may have addresses bound to them. The form and meaning of socket
addresses are dependent on the communication domain in which the socket
is created. Binding a name to a socket in the local domain causes a file
to be created in the filesystem.

Normal data transmitted and received through sockets are untyped.
Data-representation issues are the responsibility of libraries built on
top of the interprocess-communication facilities. In addition to
transporting normal data, communication domains may support the
transmission and reception of specially typed data, termed *access
rights*. The local domain, for example, uses this facility to pass
descriptors between processes.

Networking implementations on UNIX before 4.2BSD usually worked by
overloading the character-device interfaces. One goal of the socket
interface was for naive programs to be able to work without change on
stream-style connections. Such programs can work only if the *read* and
*write* systems calls are unchanged. Consequently, the original
interfaces were left intact, and were made to work on stream-type
sockets. A new interface was added for more complicated sockets, such as
those used to send datagrams, with which a destination address must be
presented with each *send* call.

Another benefit is that the new interface is highly portable. Shortly
after a test release was available from Berkeley, the socket interface
had been ported to System III by a UNIX vendor (although AT&T did not
support the socket interface until the release of System V Release 4,
deciding instead to use the Eighth Edition stream mechanism). The socket
interface was also ported to run in many Ethernet boards by vendors,
such as Excelan and Interlan, that were selling into the PC market,
where the machines were too small to run networking in the main
processor. More recently, the socket interface was used as the basis for
Microsoft's Winsock networking interface for Windows.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+--------------------------+-----------------------------------------------------+
| `Prev <overview-terminal.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-network-communication.html>`__   |
+--------------------------------------+--------------------------+-----------------------------------------------------+
| 2.10.?Terminals?                     | `Home <index.html>`__    | ?2.12.?Network Communication                        |
+--------------------------------------+--------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
