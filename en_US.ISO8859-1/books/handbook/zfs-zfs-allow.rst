==============================
20.5.?Delegated Administration
==============================

.. raw:: html

   <div class="navheader">

20.5.?Delegated Administration
`Prev <zfs-zfs.html>`__?
Chapter?20.?The Z File System (ZFS)
?\ `Next <zfs-advanced.html>`__

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

20.5.?Delegated Administration
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A comprehensive permission delegation system allows unprivileged users
to perform ZFS administration functions. For example, if each user's
home directory is a dataset, users can be given permission to create and
destroy snapshots of their home directories. A backup user can be given
permission to use replication features. A usage statistics script can be
allowed to run with access only to the space utilization data for all
users. It is even possible to delegate the ability to delegate
permissions. Permission delegation is possible for each subcommand and
most properties.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.5.1.?Delegating Dataset Creation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``zfs allow       someuser`` create *``mydataset``* gives the specified
user permission to create child datasets under the selected parent
dataset. There is a caveat: creating a new dataset involves mounting it.
That requires setting the FreeBSD ``vfs.usermount``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
to ``1`` to allow non-root users to mount a file system. There is
another restriction aimed at preventing abuse: non-\ ``root`` users must
own the mountpoint where the file system is to be mounted.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.5.2.?Delegating Permission Delegation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``zfs allow       someuser`` allow *``mydataset``* gives the specified
user the ability to assign any permission they have on the target
dataset, or its children, to other users. If a user has the ``snapshot``
permission and the ``allow`` permission, that user can then grant the
``snapshot`` permission to other users.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+-----------------------------------+
| `Prev <zfs-zfs.html>`__?          | `Up <zfs.html>`__       | ?\ `Next <zfs-advanced.html>`__   |
+-----------------------------------+-------------------------+-----------------------------------+
| 20.4.?\ ``zfs`` Administration?   | `Home <index.html>`__   | ?20.6.?Advanced Topics            |
+-----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
