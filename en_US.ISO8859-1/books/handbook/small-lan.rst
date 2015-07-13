====================================
24.7.?Tracking for Multiple Machines
====================================

.. raw:: html

   <div class="navheader">

24.7.?Tracking for Multiple Machines
`Prev <makeworld.html>`__?
Chapter?24.?Updating and Upgrading FreeBSD
?\ `Next <dtrace.html>`__

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

24.7.?Tracking for Multiple Machines
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Mike Meyer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When multiple machines need to track the same source tree, it is a waste
of disk space, network bandwidth, and CPU cycles to have each system
download the sources and rebuild everything. The solution is to have one
machine do most of the work, while the rest of the machines mount that
work via NFS. This section outlines a method of doing so. For more
information about using NFS, refer to `Section?29.3, “Network File
System (NFS)” <network-nfs.html>`__.

First, identify a set of machines which will run the same set of
binaries, known as a *build set*. Each machine can have a custom kernel,
but will run the same userland binaries. From that set, choose a machine
to be the *build machine* that the world and kernel are built on.
Ideally, this is a fast machine that has sufficient spare CPU to run
``make     buildworld`` and ``make     buildkernel``.

Select a machine to be the *test machine*, which will test software
updates before they are put into production. This *must* be a machine
that can afford to be down for an extended period of time. It can be the
build machine, but need not be.

All the machines in this build set need to mount ``/usr/obj`` and
``/usr/src`` from the build machine via NFS. For multiple build sets,
``/usr/src`` should be on one build machine, and NFS mounted on the
rest.

Ensure that ``/etc/make.conf`` and ``/etc/src.conf`` on all the machines
in the build set agree with the build machine. That means that the build
machine must build all the parts of the base system that any machine in
the build set is going to install. Also, each build machine should have
its kernel name set with ``KERNCONF`` in ``/etc/make.conf``, and the
build machine should list them all in its ``KERNCONF``, listing its own
kernel first. The build machine must have the kernel configuration files
for each machine in its ``/usr/src/sys/arch``/conf.

On the build machine, build the kernel and world as described in
`Section?24.6, “Rebuilding World” <makeworld.html>`__, but do not
install anything on the build machine. Instead, install the built kernel
on the test machine. On the test machine, mount ``/usr/src`` and
``/usr/obj`` via NFS. Then, run ``shutdown now`` to go to single-user
mode in order to install the new kernel and world and run
``mergemaster`` as usual. When done, reboot to return to normal
multi-user operations.

After verifying that everything on the test machine is working properly,
use the same procedure to install the new software on each of the other
machines in the build set.

The same methodology can be used for the ports tree. The first step is
to share ``/usr/ports`` via NFS to all the machines in the build set. To
configure ``/etc/make.conf`` to share distfiles, set ``DISTDIR`` to a
common shared directory that is writable by whichever user ``root`` is
mapped to by the NFS mount. Each machine should set ``WRKDIRPREFIX`` to
a local build directory, if ports are to be built locally. Alternately,
if the build system is to build and distribute packages to the machines
in the build set, set ``PACKAGES`` on the build system to a directory
similar to ``DISTDIR``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+------------------------------------+-----------------------------+
| `Prev <makeworld.html>`__?   | `Up <updating-upgrading.html>`__   | ?\ `Next <dtrace.html>`__   |
+------------------------------+------------------------------------+-----------------------------+
| 24.6.?Rebuilding World?      | `Home <index.html>`__              | ?Chapter?25.?DTrace         |
+------------------------------+------------------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
