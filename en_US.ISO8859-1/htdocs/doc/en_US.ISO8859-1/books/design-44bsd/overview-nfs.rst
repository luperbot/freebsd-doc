=======================
2.9.?Network Filesystem
=======================

.. raw:: html

   <div class="navheader">

2.9.?Network Filesystem
`Prev <overview-filestore.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?\ `Next <overview-terminal.html>`__

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

2.9.?Network Filesystem
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Initially, networking was used to transfer data from one machine to
another. Later, it evolved to allowing users to log in remotely to
another machine. The next logical step was to bring the data to the
user, instead of having the user go to the data -- and network
filesystems were born. Users working locally do not experience the
network delays on each keystroke, so they have a more responsive
environment.

Bringing the filesystem to a local machine was among the first of the
major client-server applications. The *server* is the remote machine
that exports one or more of its filesystems. The *client* is the local
machine that imports those filesystems. From the local client's point of
view, a remotely mounted filesystem appears in the file-tree name space
just like any other locally mounted filesystem. Local clients can change
into directories on the remote filesystem, and can read, write, and
execute binaries within that remote filesystem identically to the way
that they can do these operations on a local filesystem.

When the local client does an operation on a remote filesystem, the
request is packaged and is sent to the server. The server does the
requested operation and returns either the requested information or an
error indicating why the request was denied. To get reasonable
performance, the client must cache frequently accessed data. The
complexity of remote filesystems lies in maintaining cache consistency
between the server and its many clients.

Although many remote-filesystem protocols have been developed over the
years, the most pervasive one in use among UNIX systems is the Network
Filesystem (NFS), whose protocol and most widely used implementation
were done by Sun Microsystems. The 4.4BSD kernel supports the NFS
protocol, although the implementation was done independently from the
protocol specification `[Macklem,
1994] <overview.html#biblio-macklem>`__. The NFS protocol is described
in Chapter 9.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------+----------------------------------------+
| `Prev <overview-filestore.html>`__?   | `Up <overview.html>`__   | ?\ `Next <overview-terminal.html>`__   |
+---------------------------------------+--------------------------+----------------------------------------+
| 2.8.?Filestores?                      | `Home <index.html>`__    | ?2.10.?Terminals                       |
+---------------------------------------+--------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
