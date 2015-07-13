=======================================
8.?Using vinum for the Root File System
=======================================

.. raw:: html

   <div class="navheader">

8.?Using ``vinum`` for the Root File System
`Prev <vinum-config.html>`__?
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

8.?Using ``vinum`` for the Root File System
-------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For a machine that has fully-mirrored file systems using ``vinum``, it
is desirable to also mirror the root file system. Setting up such a
configuration is less trivial than mirroring an arbitrary file system
because:

.. raw:: html

   <div class="itemizedlist">

-  The root file system must be available very early during the boot
   process, so the ``vinum`` infrastructure must already be available at
   this time.

-  The volume containing the root file system also contains the system
   bootstrap and the kernel. These must be read using the host system's
   native utilities, such as the BIOS, which often cannot be taught
   about the details of ``vinum``.

.. raw:: html

   </div>

In the following sections, the term “root volume” is generally used to
describe the ``vinum`` volume that contains the root file system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.?Starting up ``vinum`` Early Enough for the Root File System
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``vinum`` must be available early in the system boot as
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
must be able to load the vinum kernel module before starting the kernel.
This can be accomplished by putting this line in ``/boot/loader.conf``:

.. code:: programlisting

    geom_vinum_load="YES"

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

8.2.?Making a ``vinum``-based Root Volume Accessible to the Bootstrap
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The current FreeBSD bootstrap is only 7.5 KB of code and does not
understand the internal ``vinum`` structures. This means that it cannot
parse the ``vinum`` configuration data or figure out the elements of a
boot volume. Thus, some workarounds are necessary to provide the
bootstrap code with the illusion of a standard ``a`` partition that
contains the root file system.

For this to be possible, the following requirements must be met for the
root volume:

.. raw:: html

   <div class="itemizedlist">

-  The root volume must not be a stripe or RAID-5.

-  The root volume must not contain more than one concatenated subdisk
   per plex.

.. raw:: html

   </div>

Note that it is desirable and possible to use multiple plexes, each
containing one replica of the root file system. The bootstrap process
will only use one replica for finding the bootstrap and all boot files,
until the kernel mounts the root file system. Each single subdisk within
these plexes needs its own ``a`` partition illusion, for the respective
device to be bootable. It is not strictly needed that each of these
faked ``a`` partitions is located at the same offset within its device,
compared with other devices containing plexes of the root volume.
However, it is probably a good idea to create the ``vinum`` volumes that
way so the resulting mirrored devices are symmetric, to avoid confusion.

In order to set up these ``a`` partitions for each device containing
part of the root volume, the following is required:

.. raw:: html

   <div class="procedure">

#. The location, offset from the beginning of the device, and size of
   this device's subdisk that is part of the root volume needs to be
   examined, using the command:

   .. code:: screen

       # gvinum l -rv root

   ``vinum`` offsets and sizes are measured in bytes. They must be
   divided by 512 in order to obtain the block numbers that are to be
   used by ``bsdlabel``.

#. Run this command for each device that participates in the root
   volume:

   .. code:: screen

       # bsdlabel -e devname

   *``devname``* must be either the name of the disk, like ``da0`` for
   disks without a slice table, or the name of the slice, like
   ``ad0s1``.

   If there is already an ``a`` partition on the device from a
   pre-\ ``vinum`` root file system, it should be renamed to something
   else so that it remains accessible (just in case), but will no longer
   be used by default to bootstrap the system. A currently mounted root
   file system cannot be renamed, so this must be executed either when
   being booted from a “Fixit” media, or in a two-step process where, in
   a mirror, the disk that is not been currently booted is manipulated
   first.

   The offset of the ``vinum`` partition on this device (if any) must be
   added to the offset of the respective root volume subdisk on this
   device. The resulting value will become the ``offset`` value for the
   new ``a`` partition. The ``size`` value for this partition can be
   taken verbatim from the calculation above. The ``fstype`` should be
   ``4.2BSD``. The ``fsize``, ``bsize``, and ``cpg`` values should be
   chosen to match the actual file system, though they are fairly
   unimportant within this context.

   That way, a new ``a`` partition will be established that overlaps the
   ``vinum`` partition on this device. ``bsdlabel`` will only allow for
   this overlap if the ``vinum`` partition has properly been marked
   using the ``vinum`` fstype.

#. A faked ``a`` partition now exists on each device that has one
   replica of the root volume. It is highly recommendable to verify the
   result using a command like:

   .. code:: screen

       # fsck -n /dev/devnamea

.. raw:: html

   </div>

It should be remembered that all files containing control information
must be relative to the root file system in the ``vinum`` volume which,
when setting up a new ``vinum`` root volume, might not match the root
file system that is currently active. So in particular, ``/etc/fstab``
and ``/boot/loader.conf`` need to be taken care of.

At next reboot, the bootstrap should figure out the appropriate control
information from the new ``vinum``-based root file system, and act
accordingly. At the end of the kernel initialization process, after all
devices have been announced, the prominent notice that shows the success
of this setup is a message like:

.. code:: screen

    Mounting root from ufs:/dev/gvinum/root

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

8.3.?Example of a ``vinum``-based Root Setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After the ``vinum`` root volume has been set up, the output of
``gvinum l -rv       root`` could look like:

.. code:: screen

    ...
    Subdisk root.p0.s0:
            Size:        125829120 bytes (120 MB)
            State: up
            Plex root.p0 at offset 0 (0  B)
            Drive disk0 (/dev/da0h) at offset 135680 (132 kB)

    Subdisk root.p1.s0:
            Size:        125829120 bytes (120 MB)
            State: up
            Plex root.p1 at offset 0 (0  B)
            Drive disk1 (/dev/da1h) at offset 135680 (132 kB)

The values to note are ``135680`` for the offset, relative to partition
``/dev/da0h``. This translates to 265 512-byte disk blocks in
``bsdlabel``'s terms. Likewise, the size of this root volume is 245760
512-byte blocks. ``/dev/da1h``, containing the second replica of this
root volume, has a symmetric setup.

The bsdlabel for these devices might look like:

.. code:: screen

    ...
    8 partitions:
    #        size   offset    fstype   [fsize bsize bps/cpg]
      a:   245760      281    4.2BSD     2048 16384     0   # (Cyl.    0*- 15*)
      c: 71771688        0    unused        0     0         # (Cyl.    0 - 4467*)
      h: 71771672       16     vinum                        # (Cyl.    0*- 4467*)

It can be observed that the ``size`` parameter for the faked ``a``
partition matches the value outlined above, while the ``offset``
parameter is the sum of the offset within the ``vinum`` partition ``h``,
and the offset of this partition within the device or slice. This is a
typical setup that is necessary to avoid the problem described in
`Section?8.4.3, “Nothing Boots, the Bootstrap
Panics” <vinum-root.html#vinum-root-panic>`__. The entire ``a``
partition is completely within the ``h`` partition containing all the
``vinum`` data for this device.

In the above example, the entire device is dedicated to ``vinum`` and
there is no leftover pre-\ ``vinum`` root partition.

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

8.4.?Troubleshooting
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following list contains a few known pitfalls and solutions.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.1.?System Bootstrap Loads, but System Does Not Boot
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If for any reason the system does not continue to boot, the bootstrap
can be interrupted by pressing **space** at the 10-seconds warning. The
loader variable ``vinum.autostart`` can be examined by typing ``show``
and manipulated using ``set`` or ``unset``.

If the ``vinum`` kernel module was not yet in the list of modules to
load automatically, type ``load geom_vinum``.

When ready, the boot process can be continued by typing ``boot -as``
which ``-as`` requests the kernel to ask for the root file system to
mount (``-a``) and make the boot process stop in single-user mode
(``-s``), where the root file system is mounted read-only. That way,
even if only one plex of a multi-plex volume has been mounted, no data
inconsistency between plexes is being risked.

At the prompt asking for a root file system to mount, any device that
contains a valid root file system can be entered. If ``/etc/fstab`` is
set up correctly, the default should be something like
``ufs:/dev/gvinum/root``. A typical alternate choice would be something
like ``ufs:da0d`` which could be a hypothetical partition containing the
pre-\ ``vinum`` root file system. Care should be taken if one of the
alias ``a`` partitions is entered here, that it actually references the
subdisks of the ``vinum`` root device, because in a mirrored setup, this
would only mount one piece of a mirrored root device. If this file
system is to be mounted read-write later on, it is necessary to remove
the other plex(es) of the ``vinum`` root volume since these plexes would
otherwise carry inconsistent data.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.2.?Only Primary Bootstrap Loads
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If ``/boot/loader`` fails to load, but the primary bootstrap still loads
(visible by a single dash in the left column of the screen right after
the boot process starts), an attempt can be made to interrupt the
primary bootstrap by pressing **space**. This will make the bootstrap
stop in `stage
two <../../../../doc/en_US.ISO8859-1/books/handbook/boot.html#boot-boot1>`__.
An attempt can be made here to boot off an alternate partition, like the
partition containing the previous root file system that has been moved
away from ``a``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.3.?Nothing Boots, the Bootstrap Panics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This situation will happen if the bootstrap had been destroyed by the
``vinum`` installation. Unfortunately, ``vinum`` accidentally leaves
only 4 KB at the beginning of its partition free before starting to
write its ``vinum`` header information. However, the stage one and two
bootstraps plus the bsdlabel require 8 KB. So if a ``vinum`` partition
was started at offset 0 within a slice or disk that was meant to be
bootable, the ``vinum`` setup will trash the bootstrap.

Similarly, if the above situation has been recovered, by booting from a
“Fixit” media, and the bootstrap has been re-installed using
``bsdlabel -B`` as described in
`../../../../doc/en\_US.ISO8859-1/books/handbook/boot.html#boot-boot1 <../../../../doc/en_US.ISO8859-1/books/handbook/boot.html#boot-boot1>`__,
the bootstrap will trash the ``vinum`` header, and ``vinum`` will no
longer find its disk(s). Though no actual ``vinum`` configuration data
or data in ``vinum`` volumes will be trashed, and it would be possible
to recover all the data by entering exactly the same ``vinum``
configuration data again, the situation is hard to fix. It is necessary
to move the entire ``vinum`` partition by at least 4 KB, in order to
have the ``vinum`` header and the system bootstrap no longer collide.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-----+
| `Prev <vinum-config.html>`__?   | ?                       | ?   |
+---------------------------------+-------------------------+-----+
| 7.?Configuring ``vinum``?       | `Home <index.html>`__   | ?   |
+---------------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
