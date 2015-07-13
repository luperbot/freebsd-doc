=======================
3.?Preparation - mfsBSD
=======================

.. raw:: html

   <div class="navheader">

3.?Preparation - mfsBSD
`Prev <intro.html>`__?
?
?\ `Next <installation.html>`__

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

3.?Preparation - mfsBSD
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before FreeBSD may be installed on the target system, it is necessary to
build the minimal FreeBSD operating system image which will boot from
the hard drive. This way the new system can be accessed from the
network, and the rest of the installation can be done without remote
access to the system console.

The mfsBSD tool-set can be used to build a tiny FreeBSD image. As the
name of mfsBSD suggests (“mfs” means “memory file system”), the
resulting image runs entirely from a ramdisk. Thanks to this feature,
the manipulation of hard drives will not be limited, therefore it will
be possible to install a complete FreeBSD operating system. The mfsBSD
``home page`` includes pointers to the latest release of the toolset.

Please note that the internals of mfsBSD and how it all fits together is
beyond the scope of this article. The interested reader should consult
the original documentation of mfsBSD for more details.

Download and extract the latest mfsBSD release and change your working
directory to the directory where the mfsBSD scripts will reside:

.. code:: screen

    # fetch http://mfsbsd.vx.sk/release/mfsbsd-2.1.tar.gz
    # tar xvzf mfsbsd-2.1.tar.gz
    # cd mfsbsd-2.1/

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Configuration of mfsBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before booting mfsBSD, a few important configuration options have to be
set. The most important that we have to get right is, naturally, the
network setup. The most suitable method to configure networking options
depends on whether we know beforehand the type of the network interface
we will use, and the network interface driver to be loaded for our
hardware. We will see how mfsBSD can be configured in either case.

Another important thing to set is the ``root`` password. This can be
done by editing ``conf/loader.conf``. Please see the included comments.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.1.?The ``conf/interfaces.conf`` method
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the installed network interface card is unknown, it is possible to
use the auto-detection features of mfsBSD. The startup scripts of mfsBSD
can detect the correct driver to use, based on the MAC address of the
interface, if we set the following options in ``conf/interfaces.conf``:

.. code:: programlisting

    mac_interfaces="ext1"
    ifconfig_ext1_mac="00:00:00:00:00:00"
    ifconfig_ext1="inet 192.168.0.2/24"

Do not forget to add the ``defaultrouter`` information to
``conf/rc.conf``:

.. code:: programlisting

    defaultrouter="192.168.0.1"

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

3.1.2.?The ``conf/rc.conf`` Method
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the network interface driver is known, it is more convenient to use
``conf/rc.conf`` for networking options. The syntax of this file is the
same as the one used in the standard
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
file of FreeBSD.

For example, if you know that a
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4>`__
network interface is going to be available, you can set the following
options in ``conf/rc.conf``:

.. code:: programlisting

    defaultrouter="192.168.0.1"
    ifconfig_re0="inet 192.168.0.2/24"

.. raw:: html

   </div>

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

3.2.?Building an mfsBSD Image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The process of building an mfsBSD image is pretty straightforward.

The first step is to mount the FreeBSD installation CD, or the
installation ISO image to ``/cdrom``. For the sake of example, in this
article we will assume that you have downloaded the FreeBSD 10.1-RELEASE
ISO. Mounting this ISO image to the ``/cdrom`` directory is easy with
the
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
utility:

.. code:: screen

    # mdconfig -a -t vnode -u 10 -f FreeBSD-10.1-RELEASE-amd64-disc1.iso
    # mount_cd9660 /dev/md10 /cdrom

Since the recent FreeBSD releases do not contain regular distribution
sets, it is required to extract the FreeBSD distribution files from the
distribution archives located on the ISO image:

.. code:: screen

    # mkdir DIST
    # tar -xvf /cdrom/usr/freebsd-dist/base.txz -C DIST
    # tar -xvf /cdrom/usr/freebsd-dist/kernel.txz -C DIST

Next, build the bootable mfsBSD image:

.. code:: screen

    # make BASE=DIST

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The above ``make`` has to be run from the top level of the mfsBSD
directory tree, for example ``~/mfsbsd-2.1/``.

.. raw:: html

   </div>

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

3.3.?Booting mfsBSD
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now that the mfsBSD image is ready, it must be uploaded to the remote
system running a live rescue system or pre-installed Linux?
distribution. The most suitable tool for this task is scp:

.. code:: screen

    # scp disk.img root@192.168.0.2:.

To boot mfsBSD image properly, it must be placed on the first (bootable)
device of the given machine. This may be accomplished using this example
providing that ``sda`` is the first bootable disk device:

.. code:: screen

    # dd if=/root/disk.img of=/dev/sda bs=1m

If all went well, the image should now be in the MBR of the first device
and the machine can be rebooted. Watch for the machine to boot up
properly with the
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
tool. Once it has came back on-line, it should be possible to access it
over `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
as user ``root`` with the configured password.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+----------------------------------------------------+
| `Prev <intro.html>`__?   | ?                       | ?\ `Next <installation.html>`__                    |
+--------------------------+-------------------------+----------------------------------------------------+
| 2.?Introduction?         | `Home <index.html>`__   | ?4.?Installation of the FreeBSD Operating System   |
+--------------------------+-------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
