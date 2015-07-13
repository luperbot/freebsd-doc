===========================
19.7.?Labeling Disk Devices
===========================

.. raw:: html

   <div class="navheader">

19.7.?Labeling Disk Devices
`Prev <geom-ggate.html>`__?
Chapter?19.?GEOM: Modular Disk Transformation Framework
?\ `Next <geom-gjournal.html>`__

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

19.7.?Labeling Disk Devices
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

During system initialization, the FreeBSD kernel creates device nodes as
devices are found. This method of probing for devices raises some
issues. For instance, what if a new disk device is added via USB? It is
likely that a flash device may be handed the device name of ``da0`` and
the original ``da0`` shifted to ``da1``. This will cause issues mounting
file systems if they are listed in ``/etc/fstab`` which may also prevent
the system from booting.

One solution is to chain SCSI devices in order so a new device added to
the SCSI card will be issued unused device numbers. But what about USB
devices which may replace the primary SCSI disk? This happens because
USB devices are usually probed before the SCSI card. One solution is to
only insert these devices after the system has been booted. Another
method is to use only a single ATA drive and never list the SCSI devices
in ``/etc/fstab``.

A better solution is to use ``glabel`` to label the disk devices and use
the labels in ``/etc/fstab``. Because ``glabel`` stores the label in the
last sector of a given provider, the label will remain persistent across
reboots. By using this label as a device, the file system may always be
mounted regardless of what device node it is accessed through.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``glabel`` can create both transient and permanent labels. Only
permanent labels are consistent across reboots. Refer to
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8>`__
for more information on the differences between labels.

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

19.7.1.?Label Types and Examples
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Permanent labels can be a generic or a file system label. Permanent file
system labels can be created with
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
or
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__.
These types of labels are created in a sub-directory of ``/dev``, and
will be named according to the file system type. For example, UFS2 file
system labels will be created in ``/dev/ufs``. Generic permanent labels
can be created with ``glabel label``. These are not file system specific
and will be created in ``/dev/label``.

Temporary labels are destroyed at the next reboot. These labels are
created in ``/dev/label`` and are suited to experimentation. A temporary
label can be created using ``glabel create``.

To create a permanent label for a UFS2 file system without destroying
any data, issue the following command:

.. code:: screen

    # tunefs -L home /dev/da3

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

If the file system is full, this may cause data corruption.

.. raw:: html

   </div>

A label should now exist in ``/dev/ufs`` which may be added to
``/etc/fstab``:

.. code:: programlisting

    /dev/ufs/home        /home            ufs     rw              2      2

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The file system must not be mounted while attempting to run ``tunefs``.

.. raw:: html

   </div>

Now the file system may be mounted:

.. code:: screen

    # mount /home

From this point on, so long as the ``geom_label.ko`` kernel module is
loaded at boot with ``/boot/loader.conf`` or the ``GEOM_LABEL`` kernel
option is present, the device node may change without any ill effect on
the system.

File systems may also be created with a default label by using the
``-L`` flag with ``newfs``. Refer to
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
for more information.

The following command can be used to destroy the label:

.. code:: screen

    # glabel destroy home

The following example shows how to label the partitions of a boot disk.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?19.1.?Labeling Partitions on the Boot Disk

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

By permanently labeling the partitions on the boot disk, the system
should be able to continue to boot normally, even if the disk is moved
to another controller or transferred to a different system. For this
example, it is assumed that a single ATA disk is used, which is
currently recognized by the system as ``ad0``. It is also assumed that
the standard FreeBSD partition scheme is used, with ``/``, ``/var``,
``/usr`` and ``/tmp``, as well as a swap partition.

Reboot the system, and at the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
prompt, press **4** to boot into single user mode. Then enter the
following commands:

.. code:: screen

    # glabel label rootfs /dev/ad0s1a
    GEOM_LABEL: Label for provider /dev/ad0s1a is label/rootfs
    # glabel label var /dev/ad0s1d
    GEOM_LABEL: Label for provider /dev/ad0s1d is label/var
    # glabel label usr /dev/ad0s1f
    GEOM_LABEL: Label for provider /dev/ad0s1f is label/usr
    # glabel label tmp /dev/ad0s1e
    GEOM_LABEL: Label for provider /dev/ad0s1e is label/tmp
    # glabel label swap /dev/ad0s1b
    GEOM_LABEL: Label for provider /dev/ad0s1b is label/swap
    # exit

The system will continue with multi-user boot. After the boot completes,
edit ``/etc/fstab`` and replace the conventional device names, with
their respective labels. The final ``/etc/fstab`` will look like this:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/label/swap         none            swap    sw              0       0
    /dev/label/rootfs       /               ufs     rw              1       1
    /dev/label/tmp          /tmp            ufs     rw              2       2
    /dev/label/usr          /usr            ufs     rw              2       2
    /dev/label/var          /var            ufs     rw              2       2

The system can now be rebooted. If everything went well, it will come up
normally and ``mount`` will show:

.. code:: screen

    # mount
    /dev/label/rootfs on / (ufs, local)
    devfs on /dev (devfs, local)
    /dev/label/tmp on /tmp (ufs, local, soft-updates)
    /dev/label/usr on /usr (ufs, local, soft-updates)
    /dev/label/var on /var (ufs, local, soft-updates)

.. raw:: html

   </div>

.. raw:: html

   </div>

Starting with FreeBSD?7.2, the
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8>`__
class supports a new label type for UFS file systems, based on the
unique file system id, ``ufsid``. These labels may be found in
``/dev/ufsid`` and are created automatically during system startup. It
is possible to use ``ufsid`` labels to mount partitions using
``/etc/fstab``. Use ``glabel       status`` to receive a list of file
systems and their corresponding ``ufsid`` labels:

.. code:: screen

    % glabel status
                      Name  Status  Components
    ufsid/486b6fc38d330916     N/A  ad4s1d
    ufsid/486b6fc16926168e     N/A  ad4s1f

In the above example, ``ad4s1d`` represents ``/var``, while ``ad4s1f``
represents ``/usr``. Using the ``ufsid`` values shown, these partitions
may now be mounted with the following entries in ``/etc/fstab``:

.. code:: programlisting

    /dev/ufsid/486b6fc38d330916        /var        ufs        rw        2      2
    /dev/ufsid/486b6fc16926168e        /usr        ufs        rw        2      2

Any partitions with ``ufsid`` labels can be mounted in this way,
eliminating the need to manually create permanent labels, while still
enjoying the benefits of device name independent mounting.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+--------------------------------------+
| `Prev <geom-ggate.html>`__?   | `Up <geom.html>`__      | ?\ `Next <geom-gjournal.html>`__     |
+-------------------------------+-------------------------+--------------------------------------+
| 19.6.?GEOM Gate Network?      | `Home <index.html>`__   | ?19.8.?UFS Journaling Through GEOM   |
+-------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
