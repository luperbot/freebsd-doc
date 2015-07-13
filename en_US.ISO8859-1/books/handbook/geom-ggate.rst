=======================
19.6.?GEOM Gate Network
=======================

.. raw:: html

   <div class="navheader">

19.6.?GEOM Gate Network
`Prev <geom-graid.html>`__?
Chapter?19.?GEOM: Modular Disk Transformation Framework
?\ `Next <geom-glabel.html>`__

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

19.6.?GEOM Gate Network
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GEOM provides a simple mechanism for providing remote access to devices
such as disks, CDs, and file systems through the use of the GEOM Gate
network daemon, ggated. The system with the device runs the server
daemon which handles requests made by clients using ggatec. The devices
should not contain any sensitive data as the connection between the
client and the server is not encrypted.

Similar to NFS, which is discussed in `Section?29.3, “Network File
System (NFS)” <network-nfs.html>`__, ggated is configured using an
exports file. This file specifies which systems are permitted to access
the exported resources and what level of access they are offered. For
example, to give the client ``192.168.1.5`` read and write access to the
fourth slice on the first SCSI disk, create ``/etc/gg.exports`` with
this line:

.. code:: programlisting

    192.168.1.5 RW /dev/da0s4d

Before exporting the device, ensure it is not currently mounted. Then,
start ggated:

.. code:: screen

    # ggated

Several options are available for specifying an alternate listening port
or changing the default location of the exports file. Refer to
`ggated(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggated&sektion=8>`__
for details.

To access the exported device on the client machine, first use
``ggatec`` to specify the IP address of the server and the device name
of the exported device. If successful, this command will display a
``ggate`` device name to mount. Mount that specified device name on a
free mount point. This example connects to the ``/dev/da0s4d`` partition
on ``192.168.1.1``, then mounts ``/dev/ggate0`` on ``/mnt``:

.. code:: screen

    # ggatec create -o rw 192.168.1.1 /dev/da0s4d
    ggate0
    # mount /dev/ggate0 /mnt

The device on the server may now be accessed through ``/mnt`` on the
client. For more details about ``ggatec`` and a few usage examples,
refer to
`ggatec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ggatec&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The mount will fail if the device is currently mounted on either the
server or any other client on the network. If simultaneous access is
needed to network resources, use NFS instead.

.. raw:: html

   </div>

When the device is no longer needed, unmount it with ``umount`` so that
the resource is available to other clients.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------------+
| `Prev <geom-graid.html>`__?    | `Up <geom.html>`__      | ?\ `Next <geom-glabel.html>`__   |
+--------------------------------+-------------------------+----------------------------------+
| 19.5.?Software RAID Devices?   | `Home <index.html>`__   | ?19.7.?Labeling Disk Devices     |
+--------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
