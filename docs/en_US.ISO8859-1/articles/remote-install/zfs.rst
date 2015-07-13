======
5.?ZFS
======

.. raw:: html

   <div class="navheader">

5.?ZFS
`Prev <installation.html>`__?
?
?

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

5.?ZFS
------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If your system survived the reboot, it should now be possible to log in.
Welcome to the fresh FreeBSD installation, performed remotely without
the use of a remote console!

The only remaining step is to configure
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__
and create some
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__ file
systems. Creating and administering ZFS is very straightforward. First,
create a mirrored pool:

.. code:: screen

    # zpool create tank mirror /dev/ad[01]s1f

Next, create some file systems:

.. code:: screen

    # zfs create tank/ports
    # zfs create tank/src
    # zfs set compression=gzip tank/ports
    # zfs set compression=on tank/src
    # zfs set mountpoint=/usr/ports tank/ports
    # zfs set mountpoint=/usr/src tank/src

That is all. If you are interested in more details about ZFS on FreeBSD,
please refer to the `ZFS <http://wiki.freebsd.org/ZFS>`__ section of the
FreeBSD Wiki.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+-------------------------+-----+
| `Prev <installation.html>`__?                      | ?                       | ?   |
+----------------------------------------------------+-------------------------+-----+
| 4.?Installation of the FreeBSD Operating System?   | `Home <index.html>`__   | ?   |
+----------------------------------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
