==================
19.3. Adding Disks
==================

.. raw:: html

   <div class="navheader">

19.3. Adding Disks
`????? <disks-naming.html>`__?
???????? 19. ???????????? ????
?\ `??????? <usb-disks.html>`__

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

19.3. Adding Disks
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally contributed by David O'Brien.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how to add a new SATA disk to a machine that
currently only has a single drive. First, turn off the computer and
install the drive in the computer following the instructions of the
computer, controller, and drive manufacturers. Reboot the system and
become ``root``.

Inspect ``/var/run/dmesg.boot`` to ensure the new disk was found. In
this example, the newly added SATA drive will appear as ``ada1``.

For this example, a single large partition will be created on the new
disk. The `GPT <http://en.wikipedia.org/wiki/GUID_Partition_Table>`__
partitioning scheme will be used in preference to the older and less
versatile MBR scheme.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

If the disk to be added is not blank, old partition information can be
removed with ``gpart delete``. See
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__
for details.

.. raw:: html

   </div>

The partition scheme is created, and then a single partition is added:

.. code:: screen

    # gpart create -s GPT ada1
    # gpart add -t freebsd-ufs ada1

Depending on use, several smaller partitions may be desired. See
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__
for options to create partitions smaller than a whole disk.

A file system is created on the new blank disk:

.. code:: screen

    # newfs -U /dev/ada1p1

An empty directory is created as a *mountpoint*, a location for mounting
the new disk in the original disk's file system:

.. code:: screen

    # mkdir /newdisk

Finally, an entry is added to ``/etc/fstab`` so the new disk will be
mounted automatically at startup:

.. code:: programlisting

    /dev/ada1p1  /newdisk    ufs rw  2   2

The new disk can be mounted manually, without restarting the system:

.. code:: screen

    # mount /newdisk

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-----------------------------------+
| `????? <disks-naming.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <usb-disks.html>`__   |
+----------------------------------+-------------------------+-----------------------------------+
| 19.2. Device Names?              | `???? <index.html>`__   | ?19.4. USB Storage Devices        |
+----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
