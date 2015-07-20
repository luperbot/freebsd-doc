=================================
19.14. Encrypting Disk Partitions
=================================

.. raw:: html

   <div class="navheader">

19.14. Encrypting Disk Partitions
`????? <quotas.html>`__?
???????? 19. ???????????? ????
?\ `??????? <swap-encrypting.html>`__

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

19.14. Encrypting Disk Partitions
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Lucky Green.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD offers excellent online protections against unauthorized data
access. File permissions and `Mandatory Access Control <mac.html>`__
(MAC) help prevent unauthorized users from accessing data while the
operating system is active and the computer is powered up. However, the
permissions enforced by the operating system are irrelevant if an
attacker has physical access to a computer and can move the computer's
hard drive to another system to copy and analyze the data.

Regardless of how an attacker may have come into possession of a hard
drive or powered-down computer, both the GEOM Based Disk Encryption
(``gbde``) and ``geli`` cryptographic subsystems in FreeBSD are able to
protect the data on the computer's file systems against even
highly-motivated attackers with significant resources. Unlike cumbersome
encryption methods that encrypt only individual files, ``gbde`` and
``geli`` transparently encrypt entire file systems. No cleartext ever
touches the hard drive's platter.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.14.1. Disk Encryption with gbde
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Configuring gbde requires superuser privileges.

   .. code:: screen

       % su -
       Password:

#. If using a custom kernel configuration file, ensure it contains this
   line:

   ``options GEOM_BDE``

   If the kernel already contains this support, use ``kldload`` to load
   `gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__:

   .. code:: screen

       # kldload geom_bde

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

19.14.1.1. Preparing the Encrypted Hard Drive
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following example demonstrates adding a new hard drive to a system
that will hold a single encrypted partition. This partition will be
mounted as ``/private``. gbde can also be used to encrypt ``/home`` and
``/var/mail``, but this requires more complex instructions which exceed
the scope of this introduction.

.. raw:: html

   <div class="procedure">

#. **Add the New Hard Drive**

   Install the new drive to the system as explained in `??????19.3,
   ?Adding Disks? <disks-adding.html>`__. For the purposes of this
   example, a new hard drive partition has been added as ``/dev/ad4s1c``
   and ``/dev/ad0s1*`` represents the existing standard FreeBSD
   partitions.

   .. code:: screen

       # ls /dev/ad*
       /dev/ad0        /dev/ad0s1b     /dev/ad0s1e     /dev/ad4s1
       /dev/ad0s1      /dev/ad0s1c     /dev/ad0s1f     /dev/ad4s1c
       /dev/ad0s1a     /dev/ad0s1d     /dev/ad4

#. **Create a Directory to Hold ``gbde`` Lock Files**

   .. code:: screen

       # mkdir /etc/gbde

   The gbde lock file contains information that gbde requires to access
   encrypted partitions. Without access to the lock file, gbde will not
   be able to decrypt the data contained in the encrypted partition
   without significant manual intervention which is not supported by the
   software. Each encrypted partition uses a separate lock file.

#. **Initialize the ``gbde`` Partition**

   A gbde partition must be initialized before it can be used. This
   initialization needs to be performed only once:

   .. code:: screen

       # gbde init /dev/ad4s1c -i -L /etc/gbde/ad4s1c.lock

   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   will open the default editor, in order to set various configuration
   options in a template. For use with UFS1 or UFS2, set the
   sector\_size to 2048:

   .. code:: programlisting

       # $FreeBSD: src/sbin/gbde/template.txt,v 1.1.36.1 2009/08/03 08:13:06 kensmith Exp $
       #
       # Sector size is the smallest unit of data which can be read or written.
       # Making it too small decreases performance and decreases available space.
       # Making it too large may prevent filesystems from working.  512 is the
       # minimum and always safe.  For UFS, use the fragment size
       #
       sector_size =   2048
       [...]

   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   will ask the user twice to type the passphrase used to secure the
   data. The passphrase must be the same both times. The ability of gbde
   to protect data depends entirely on the quality of the passphrase.
   For tips on how to select a secure passphrase that is easy to
   remember, see the `Diceware
   Passphrase <http://world.std.com/~reinhold/diceware.html>`__ website.

   ``gbde init``\ creates a lock file for the gbde partition. In this
   example, it is stored as ``/etc/gbde/ad4s1c.lock``. gbde lock files
   must end in ?.lock? in order to be correctly detected by the
   ``/etc/rc.d/gbde`` start up script.

   .. raw:: html

      <div class="caution" xmlns="">

   ???????:
   ~~~~~~~~

   gbde lock files *must* be backed up together with the contents of any
   encrypted partitions. While deleting a lock file alone cannot prevent
   a determined attacker from decrypting a gbde partition, without the
   lock file, the legitimate owner will be unable to access the data on
   the encrypted partition without a significant amount of work that is
   totally unsupported by
   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__.

   .. raw:: html

      </div>

#. **Attach the Encrypted Partition to the Kernel**

   .. code:: screen

       # gbde attach /dev/ad4s1c -l /etc/gbde/ad4s1c.lock

   This command will prompt to input the passphrase that was selected
   during the initialization of the encrypted partition. The new
   encrypted device will appear in ``/dev`` as ``/dev/device_name.bde``:

   .. code:: screen

       # ls /dev/ad*
       /dev/ad0        /dev/ad0s1b     /dev/ad0s1e     /dev/ad4s1
       /dev/ad0s1      /dev/ad0s1c     /dev/ad0s1f     /dev/ad4s1c
       /dev/ad0s1a     /dev/ad0s1d     /dev/ad4        /dev/ad4s1c.bde

#. **Create a File System on the Encrypted Device**

   Once the encrypted device has been attached to the kernel, a file
   system can be created on the device using
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__.
   This example creates a UFS2 file system with soft updates enabled.

   .. code:: screen

       # newfs -U /dev/ad4s1c.bde

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
   must be performed on an attached gbde partition which is identified
   by a ``*.bde`` extension to the device name.

   .. raw:: html

      </div>

#. **Mount the Encrypted Partition**

   Create a mount point for the encrypted file system:

   .. code:: screen

       # mkdir /private

   Mount the encrypted file system:

   .. code:: screen

       # mount /dev/ad4s1c.bde /private

#. **Verify That the Encrypted File System is Available**

   The encrypted file system should now be visible to
   `df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1>`__ and
   be available for use.

   .. code:: screen

       % df -H
       Filesystem        Size   Used  Avail Capacity  Mounted on
       /dev/ad0s1a      1037M    72M   883M     8%    /
       /devfs            1.0K   1.0K     0B   100%    /dev
       /dev/ad0s1f       8.1G    55K   7.5G     0%    /home
       /dev/ad0s1e      1037M   1.1M   953M     0%    /tmp
       /dev/ad0s1d       6.1G   1.9G   3.7G    35%    /usr
       /dev/ad4s1c.bde   150G   4.1K   138G     0%    /private

.. raw:: html

   </div>

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

19.14.1.2. Mounting Existing Encrypted File Systems
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After each boot, any encrypted file systems must be re-attached to the
kernel, checked for errors, and mounted, before the file systems can be
used. The required commands must be executed as ``root``.

.. raw:: html

   <div class="procedure">

#. **Attach the ``gbde`` Partition to the Kernel**

   .. code:: screen

       # gbde attach /dev/ad4s1c -l /etc/gbde/ad4s1c.lock

   This command will prompt for the passphrase that was selected during
   initialization of the encrypted gbde partition.

#. **Check the File System for Errors**

   Since encrypted file systems cannot yet be listed in ``/etc/fstab``
   for automatic mounting, the file systems must be checked for errors
   by running
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   manually before mounting:

   .. code:: screen

       # fsck -p -t ffs /dev/ad4s1c.bde

#. **Mount the Encrypted File System**

   .. code:: screen

       # mount /dev/ad4s1c.bde /private

   The encrypted file system is now available for use.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.14.1.2.1. Automatically Mounting Encrypted Partitions
''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to create a script to automatically attach, check, and
mount an encrypted partition, but for security reasons the script should
not contain the
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
password. Instead, it is recommended that such scripts be run manually
while providing the password via the console or
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__.

As an alternative, an ``rc.d`` script is provided. Arguments for this
script can be passed via
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__:

.. code:: programlisting

    gbde_autoattach_all="YES"
    gbde_devices="ad4s1c"
    gbde_lockdir="/etc/gbde"

This requires that the gbde passphrase be entered at boot time. After
typing the correct passphrase, the gbde encrypted partition will be
mounted automatically. This can be useful when using gbde on laptops.

.. raw:: html

   </div>

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

19.14.1.3. Cryptographic Protections Employed by ``gbde``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
encrypts the sector payload using 128-bit AES in CBC mode. Each sector
on the disk is encrypted with a different AES key. For more information
on the cryptographic design, including how the sector keys are derived
from the user-supplied passphrase, refer to
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__.

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

19.14.1.4. Compatibility Issues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
is incompatible with gbde-encrypted devices. All ``*.bde`` devices must
be detached from the kernel before starting
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
or it will crash during its initial probing for devices. To detach the
encrypted device used in the example, use the following command:

.. code:: screen

    # gbde detach /dev/ad4s1c

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

19.14.2. Disk Encryption with ``geli``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An alternative cryptographic GEOM class is available through
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__.
``geli`` differs from ``gbde``; offers different features, and uses a
different scheme for doing cryptographic work.

`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
provides the following features:

.. raw:: html

   <div class="itemizedlist">

-  Utilizes the
   `crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9>`__
   framework and, when cryptographic hardware is available, ``geli``
   uses it automatically.

-  Supports multiple cryptographic algorithms such as AES, Blowfish, and
   3DES.

-  Allows the root partition to be encrypted. The passphrase used to
   access the encrypted root partition will be requested during system
   boot.

-  Allows the use of two independent keys such as a ?key? and a ?company
   key?.

-  ``geli`` is fast as it performs simple sector-to-sector encryption.

-  Allows backup and restore of master keys. If a user destroys their
   keys, it is still possible to get access to the data by restoring
   keys from the backup.

-  Allows a disk to attach with a random, one-time key which is useful
   for swap partitions and temporary file systems.

.. raw:: html

   </div>

More ``geli`` features can be found in
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__.

This section describes how to enable support for ``geli`` in the FreeBSD
kernel and explains how to create and use a ``geli`` encryption
provider.

Superuser privileges are required since modifications to the kernel are
necessary.

.. raw:: html

   <div class="procedure">

#. **Adding ``geli`` Support to the Kernel**

   For a custom kernel, ensure the kernel configuration file contains
   these lines:

   .. code:: programlisting

       options GEOM_ELI
       device crypto

   Alternatively, the ``geli`` module can be loaded at boot time by
   adding the following line to ``/boot/loader.conf``:

   .. code:: programlisting

       geom_eli_load="YES"

   `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
   should now be supported by the kernel.

#. **Generating the Master Key**

   The following example describes how to generate a key file which will
   be used as part of the master key for the encrypted provider mounted
   under ``/private``. The key file will provide some random data used
   to encrypt the master key. The master key will also be protected by a
   passphrase. The provider's sector size will be 4kB. The example will
   describe how to attach to the ``geli`` provider, create a file system
   on it, mount it, work with it, and finally, how to detach it.

   It is recommended to use a bigger sector size, such as 4kB, for
   better performance.

   The master key will be protected with a passphrase and the data
   source for the key file will be ``/dev/random``. The sector size of
   the provider ``/dev/da2.eli`` will be 4kB.

   .. code:: screen

       # dd if=/dev/random of=/root/da2.key bs=64 count=1
       # geli init -s 4096 -K /root/da2.key /dev/da2
       Enter new passphrase:
       Reenter new passphrase:

   It is not mandatory to use both a passphrase and a key file as either
   method of securing the master key can be used in isolation.

   If the key file is given as ?-?, standard input will be used. This
   example shows how more than one key file can be used:

   .. code:: screen

       # cat keyfile1 keyfile2 keyfile3 | geli init -K - /dev/da2

#. **Attaching the Provider with the Generated Key**

   .. code:: screen

       # geli attach -k /root/da2.key /dev/da2
       Enter passphrase:

   The new plaintext device will be named ``/dev/da2.eli``.

   .. code:: screen

       # ls /dev/da2*
       /dev/da2  /dev/da2.eli

#. **Creating the New File System**

   .. code:: screen

       # dd if=/dev/random of=/dev/da2.eli bs=1m
       # newfs /dev/da2.eli
       # mount /dev/da2.eli /private

   The encrypted file system should now be visible to
   `df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1>`__ and
   be available for use:

   .. code:: screen

       # df -H
       Filesystem     Size   Used  Avail Capacity  Mounted on
       /dev/ad0s1a    248M    89M   139M    38%    /
       /devfs         1.0K   1.0K     0B   100%    /dev
       /dev/ad0s1f    7.7G   2.3G   4.9G    32%    /usr
       /dev/ad0s1d    989M   1.5M   909M     0%    /tmp
       /dev/ad0s1e    3.9G   1.3G   2.3G    35%    /var
       /dev/da2.eli   150G   4.1K   138G     0%    /private

#. **Unmounting and Detaching the Provider**

   Once the work on the encrypted partition is done, and the
   ``/private`` partition is no longer needed, it is prudent to consider
   unmounting and detaching the ``geli`` encrypted partition from the
   kernel:

   .. code:: screen

       # umount /private
       # geli detach da2.eli

.. raw:: html

   </div>

More information about the use of
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
can be found in its manual page.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.14.2.1. Using the ``geli`` ``rc.d`` Script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``geli`` comes with a ``rc.d`` script which can be used to simplify the
usage of ``geli``. An example of configuring ``geli`` through
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
follows:

.. code:: programlisting

    geli_devices="da2"
    geli_da2_flags="-p -k /root/da2.key"

This configures ``/dev/da2`` as a ``geli`` provider of which the master
key file is located in ``/root/da2.key``. ``geli`` will not use a
passphrase when attaching to the provider if ``-P`` was given during the
``geli init`` phase. The system will detach the ``geli`` provider from
the kernel before the system shuts down.

More information about configuring ``rc.d`` is provided in the
`rc.d <configtuning-rcd.html>`__ section of the Handbook.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+-----------------------------------------+
| `????? <quotas.html>`__?     | `???? <disks.html>`__   | ?\ `??????? <swap-encrypting.html>`__   |
+------------------------------+-------------------------+-----------------------------------------+
| 19.13. File System Quotas?   | `???? <index.html>`__   | ?19.15. Encrypting Swap Space           |
+------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
