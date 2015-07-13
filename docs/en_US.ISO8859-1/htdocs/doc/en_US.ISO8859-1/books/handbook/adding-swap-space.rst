========================
12.12.?Adding Swap Space
========================

.. raw:: html

   <div class="navheader">

12.12.?Adding Swap Space
`Prev <configtuning-kernel-limits.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <acpi-overview.html>`__

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

12.12.?Adding Swap Space
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes a system requires more swap space. This section describes two
methods to increase swap space: adding swap to an existing partition or
new hard drive, and creating a swap file on an existing partition.

For information on how to encrypt swap space, which options exist, and
why it should be done, refer to `Section?18.13, “Encrypting
Swap” <swap-encrypting.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.12.1.?Swap on a New Hard Drive or Existing Partition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adding a new hard drive for swap gives better performance than using a
partition on an existing drive. Setting up partitions and hard drives is
explained in `Section?18.2, “Adding Disks” <disks-adding.html>`__ while
`Section?2.6.1, “Designing the Partition
Layout” <bsdinstall-partitioning.html#configtuning-initial>`__ discusses
partition layouts and swap partition size considerations.

Use ``swapon`` to add a swap partition to the system. For example:

.. code:: screen

    # swapon /dev/ada1s1b

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

It is possible to use any partition not currently mounted, even if it
already contains data. Using ``swapon`` on a partition that contains
data will overwrite and destroy that data. Make sure that the partition
to be added as swap is really the intended partition before running
``swapon``.

.. raw:: html

   </div>

To automatically add this swap partition on boot, add an entry to
``/etc/fstab``:

.. code:: programlisting

    /dev/ada1s1b    none    swap    sw  0   0

See
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
for an explanation of the entries in ``/etc/fstab``. More information
about ``swapon`` can be found in
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8>`__.

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

12.12.2.?Creating a Swap File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These examples create a 64M swap file called ``/usr/swap0`` instead of
using a partition.

Using swap files requires that the module needed by
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ has
either been built into the kernel or has been loaded before swap is
enabled. See `Chapter?9, *Configuring the FreeBSD
Kernel* <kernelconfig.html>`__ for information about building a custom
kernel.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?12.2.?Creating a Swap File on FreeBSD?10.\ *``X``* and Later

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. raw:: html

   <div class="procedure">

#. Create the swap file:

   .. code:: screen

       # dd if=/dev/zero of=/usr/swap0 bs=1m count=64

#. Set the proper permissions on the new file:

   .. code:: screen

       # chmod 0600 /usr/swap0

#. Inform the system about the swap file by adding a line to
   ``/etc/fstab``:

   .. code:: programlisting

       md99 none    swap    sw,file=/usr/swap0  0   0

   The `md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
   device ``md99`` is used, leaving lower device numbers available for
   interactive use.

#. Swap space will be added on system startup. To add swap space
   immediately, use
   `swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8>`__:

   .. code:: screen

       # swapon -aq

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?12.3.?Creating a Swap File on FreeBSD?9.\ *``X``* and Earlier

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. raw:: html

   <div class="procedure">

#. Create the swap file, ``/usr/swap0``:

   .. code:: screen

       # dd if=/dev/zero of=/usr/swap0 bs=1m count=64

#. Set the proper permissions on ``/usr/swap0``:

   .. code:: screen

       # chmod 0600 /usr/swap0

#. Enable the swap file in ``/etc/rc.conf``:

   .. code:: programlisting

       swapfile="/usr/swap0"   # Set to name of swap file

#. Swap space will be added on system startup. To enable the swap file
   immediately, specify a free memory device. Refer to `Section?18.9,
   “Memory Disks” <disks-virtual.html>`__ for more information about
   memory devices.

   .. code:: screen

       # mdconfig -a -t vnode -f /usr/swap0 -u 0 && swapon /dev/md0

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------+-----------------------------------------+
| `Prev <configtuning-kernel-limits.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <acpi-overview.html>`__        |
+-----------------------------------------------+-------------------------------+-----------------------------------------+
| 12.11.?Tuning Kernel Limits?                  | `Home <index.html>`__         | ?12.13.?Power and Resource Management   |
+-----------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
