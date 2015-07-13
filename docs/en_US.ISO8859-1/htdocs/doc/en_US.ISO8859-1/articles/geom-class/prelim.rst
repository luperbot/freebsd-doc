================
2.?Preliminaries
================

.. raw:: html

   <div class="navheader">

2.?Preliminaries
`Prev <index.html>`__?
?
?\ `Next <kernelprog.html>`__

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

2.?Preliminaries
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The best way to do kernel development is to have (at least) two separate
computers. One of these would contain the development environment and
sources, and the other would be used to test the newly written code by
network-booting and network-mounting filesystems from the first one.
This way if the new code contains bugs and crashes the machine, it will
not mess up the sources (and other “live” data). The second system does
not even require a proper display. Instead, it could be connected with a
serial cable or KVM to the first one.

But, since not everybody has two or more computers handy, there are a
few things that can be done to prepare an otherwise “live” system for
developing kernel code. This setup is also applicable for developing in
a `VMWare <http://www.vmware.com/>`__ or `QEmu <http://www.qemu.org/>`__
virtual machine (the next best thing after a dedicated development
machine).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Modifying a System for Development
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For any kernel programming a kernel with ``INVARIANTS`` enabled is a
must-have. So enter these in your kernel configuration file:

.. code:: programlisting

    options INVARIANT_SUPPORT
    options INVARIANTS

For more debugging you should also include WITNESS support, which will
alert you of mistakes in locking:

.. code:: programlisting

    options WITNESS_SUPPORT
    options WITNESS

For debugging crash dumps, a kernel with debug symbols is needed:

.. code:: programlisting

      makeoptions    DEBUG=-g

With the usual way of installing the kernel
(``make       installkernel``) the debug kernel will not be
automatically installed. It is called ``kernel.debug`` and located in
``/usr/obj/usr/src/sys/KERNELNAME/``. For convenience it should be
copied to ``/boot/kernel/``.

Another convenience is enabling the kernel debugger so you can examine a
kernel panic when it happens. For this, enter the following lines in
your kernel configuration file:

.. code:: programlisting

    options KDB
    options DDB
    options KDB_TRACE

For this to work you might need to set a sysctl (if it is not on by
default):

.. code:: programlisting

      debug.debugger_on_panic=1

Kernel panics will happen, so care should be taken with the filesystem
cache. In particular, having softupdates might mean the latest file
version could be lost if a panic occurs before it is committed to
storage. Disabling softupdates yields a great performance hit, and still
does not guarantee data consistency. Mounting filesystem with the “sync”
option is needed for that. For a compromise, the softupdates cache
delays can be shortened. There are three sysctl's that are useful for
this (best to be set in ``/etc/sysctl.conf``):

.. code:: programlisting

    kern.filedelay=5
    kern.dirdelay=4
    kern.metadelay=3

The numbers represent seconds.

For debugging kernel panics, kernel core dumps are required. Since a
kernel panic might make filesystems unusable, this crash dump is first
written to a raw partition. Usually, this is the swap partition. This
partition must be at least as large as the physical RAM in the machine.
On the next boot, the dump is copied to a regular file. This happens
after filesystems are checked and mounted, and before swap is enabled.
This is controlled with two ``/etc/rc.conf`` variables:

.. code:: programlisting

    dumpdev="/dev/ad0s4b"
    dumpdir="/usr/core 

The ``dumpdev`` variable specifies the swap partition and ``dumpdir``
tells the system where in the filesystem to relocate the core dump on
reboot.

Writing kernel core dumps is slow and takes a long time so if you have
lots of memory (>256M) and lots of panics it could be frustrating to sit
and wait while it is done (twice — first to write it to swap, then to
relocate it to filesystem). It is convenient then to limit the amount of
RAM the system will use via a ``/boot/loader.conf`` tunable:

.. code:: programlisting

      hw.physmem="256M"

If the panics are frequent and filesystems large (or you simply do not
trust softupdates+background fsck) it is advisable to turn background
fsck off via ``/etc/rc.conf`` variable:

.. code:: programlisting

      background_fsck="NO"

This way, the filesystems will always get checked when needed. Note that
with background fsck, a new panic could happen while it is checking the
disks. Again, the safest way is not to have many local filesystems by
using another computer as an NFS server.

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

2.2.?Starting the Project
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For the purpose of creating a new GEOM class, an empty subdirectory has
to be created under an arbitrary user-accessible directory. You do not
have to create the module directory under ``/usr/src``.

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

2.3.?The Makefile
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is good practice to create ``Makefile``\ s for every nontrivial
coding project, which of course includes kernel modules.

Creating the ``Makefile`` is simple thanks to an extensive set of helper
routines provided by the system. In short, here is how a minimal
``Makefile`` looks for a kernel module:

.. code:: programlisting

    SRCS=g_journal.c
    KMOD=geom_journal

    .include <bsd.kmod.mk>

This ``Makefile`` (with changed filenames) will do for any kernel
module, and a GEOM class can reside in just one kernel module. If more
than one file is required, list it in the ``SRCS`` variable, separated
with whitespace from other filenames.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+-------------------------------------+
| `Prev <index.html>`__?   | ?                       | ?\ `Next <kernelprog.html>`__       |
+--------------------------+-------------------------+-------------------------------------+
| Writing a GEOM Class?    | `Home <index.html>`__   | ?3.?On FreeBSD Kernel Programming   |
+--------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
