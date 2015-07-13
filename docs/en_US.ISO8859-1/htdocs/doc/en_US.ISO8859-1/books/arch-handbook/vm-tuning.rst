=================================
7.6.?Tuning the FreeBSD VM System
=================================

.. raw:: html

   <div class="navheader">

7.6.?Tuning the FreeBSD VM System
`Prev <vm-kvm.html>`__?
Chapter?7.?Virtual Memory System
?\ `Next <smp.html>`__

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

7.6.?Tuning the FreeBSD VM System
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A concerted effort has been made to make the FreeBSD kernel dynamically
tune itself. Typically you do not need to mess with anything beyond the
``maxusers`` and ``NMBCLUSTERS`` kernel config options. That is, kernel
compilation options specified in (typically)
``/usr/src/sys/i386/conf/CONFIG_FILE``. A description of all available
kernel configuration options can be found in
``/usr/src/sys/i386/conf/LINT``.

In a large system configuration you may wish to increase ``maxusers``.
Values typically range from 10 to 128. Note that raising ``maxusers``
too high can cause the system to overflow available KVM resulting in
unpredictable operation. It is better to leave ``maxusers`` at some
reasonable number and add other options, such as ``NMBCLUSTERS``, to
increase specific resources.

If your system is going to use the network heavily, you may want to
increase ``NMBCLUSTERS``. Typical values range from 1024 to 4096.

The ``NBUF`` parameter is also traditionally used to scale the system.
This parameter determines the amount of KVA the system can use to map
filesystem buffers for I/O. Note that this parameter has nothing
whatsoever to do with the unified buffer cache! This parameter is
dynamically tuned in 3.0-CURRENT and later kernels and should generally
not be adjusted manually. We recommend that you *not* try to specify an
``NBUF`` parameter. Let the system pick it. Too small a value can result
in extremely inefficient filesystem operation while too large a value
can starve the page queues by causing too many pages to become wired
down.

By default, FreeBSD kernels are not optimized. You can set debugging and
optimization flags with the ``makeoptions`` directive in the kernel
configuration. Note that you should not use ``-g`` unless you can
accommodate the large (typically 7 MB+) kernels that result.

.. code:: programlisting

    makeoptions      DEBUG="-g"
    makeoptions      COPTFLAGS="-O -pipe"

Sysctl provides a way to tune kernel parameters at run-time. You
typically do not need to mess with any of the sysctl variables,
especially the VM related ones.

Run time VM and system tuning is relatively straightforward. First, use
Soft Updates on your UFS/FFS filesystems whenever possible.
``/usr/src/sys/ufs/ffs/README.softupdates`` contains instructions (and
restrictions) on how to configure it.

Second, configure sufficient swap. You should have a swap partition
configured on each physical disk, up to four, even on your “work” disks.
You should have at least 2x the swap space as you have main memory, and
possibly even more if you do not have a lot of memory. You should also
size your swap partition based on the maximum memory configuration you
ever intend to put on the machine so you do not have to repartition your
disks later on. If you want to be able to accommodate a crash dump, your
first swap partition must be at least as large as main memory and
``/var/crash`` must have sufficient free space to hold the dump.

NFS-based swap is perfectly acceptable on 4.X or later systems, but you
must be aware that the NFS server will take the brunt of the paging
load.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-------------------------------------+
| `Prev <vm-kvm.html>`__?    | `Up <vm.html>`__        | ?\ `Next <smp.html>`__              |
+----------------------------+-------------------------+-------------------------------------+
| 7.5.?KVM Memory Mapping?   | `Home <index.html>`__   | ?Chapter?8.?SMPng Design Document   |
+----------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
