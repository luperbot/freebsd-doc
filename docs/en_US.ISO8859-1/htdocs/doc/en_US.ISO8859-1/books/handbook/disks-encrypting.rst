=================================
18.12.?Encrypting Disk Partitions
=================================

.. raw:: html

   <div class="navheader">

18.12.?Encrypting Disk Partitions
`Prev <quotas.html>`__?
Chapter?18.?Storage
?\ `Next <swap-encrypting.html>`__

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

18.12.?Encrypting Disk Partitions
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
drive or powered-down computer, the GEOM-based cryptographic subsystems
built into FreeBSD are able to protect the data on the computer's file
systems against even highly-motivated attackers with significant
resources. Unlike encryption methods that encrypt individual files, the
built-in ``gbde`` and ``geli`` utilities can be used to transparently
encrypt entire file systems. No cleartext ever touches the hard drive's
platter.

This chapter demonstrates how to create an encrypted file system on
FreeBSD. It first demonstrates the process using ``gbde`` and then
demonstrates the same example using ``geli``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.12.1.?Disk Encryption with gbde
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The objective of the
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__
facility is to provide a formidable challenge for an attacker to gain
access to the contents of a *cold* storage device. However, if the
computer is compromised while up and running and the storage device is
actively attached, or the attacker has access to a valid passphrase, it
offers no protection to the contents of the storage device. Thus, it is
important to provide physical security while the system is running and
to protect the passphrase used by the encryption mechanism.

This facility provides several barriers to protect the data stored in
each disk sector. It encrypts the contents of a disk sector using
128-bit AES in CBC mode. Each sector on the disk is encrypted with a
different AES key. For more information on the cryptographic design,
including how the sector keys are derived from the user-supplied
passphrase, refer to
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__.

FreeBSD provides a kernel module for gbde which can be loaded with this
command:

.. code:: screen

    # kldload geom_bde

If using a custom kernel configuration file, ensure it contains this
line:

``options GEOM_BDE``

The following example demonstrates adding a new hard drive to a system
that will hold a single encrypted partition that will be mounted as
``/private``.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?18.3.?Encrypting a Partition with gbde

.. raw:: html

   </div>

#. **Add the New Hard Drive**

   Install the new drive to the system as explained in `Section?18.2,
   “Adding Disks” <disks-adding.html>`__. For the purposes of this
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
   initialization needs to be performed only once. This command will
   open the default editor, in order to set various configuration
   options in a template. For use with the UFS file system, set the
   sector\_size to 2048:

   .. code:: screen

       # gbde init /dev/ad4s1c -i -L /etc/gbde/ad4s1c.lock# $FreeBSD: src/sbin/gbde/template.txt,v 1.1.36.1 2009/08/03 08:13:06 kensmith Exp $
       #
       # Sector size is the smallest unit of data which can be read or written.
       # Making it too small decreases performance and decreases available space.
       # Making it too large may prevent filesystems from working.  512 is the
       # minimum and always safe.  For UFS, use the fragment size
       #
       sector_size =   2048
       [...]

   Once the edit is saved, the user will be asked twice to type the
   passphrase used to secure the data. The passphrase must be the same
   both times. The ability of gbde to protect data depends entirely on
   the quality of the passphrase. For tips on how to select a secure
   passphrase that is easy to remember, see
   `http://world.std.com/~reinhold/diceware.htm <http://world.std.com/~reinhold/diceware.html>`__.

   This initialization creates a lock file for the gbde partition. In
   this example, it is stored as ``/etc/gbde/ad4s1c.lock``. Lock files
   must end in “.lock” in order to be correctly detected by the
   ``/etc/rc.d/gbde`` start up script.

   .. raw:: html

      <div class="caution" xmlns="">

   Caution:
   ~~~~~~~~

   Lock files *must* be backed up together with the contents of any
   encrypted partitions. Without the lock file, the legitimate owner
   will be unable to access the data on the encrypted partition.

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
   system can be created on the device. This example creates a UFS file
   system with soft updates enabled. Be sure to specify the partition
   which has a ``*``.bde extension:

   .. code:: screen

       # newfs -U /dev/ad4s1c.bde

#. **Mount the Encrypted Partition**

   Create a mount point and mount the encrypted file system:

   .. code:: screen

       # mkdir /private
       # mount /dev/ad4s1c.bde /private

#. **Verify That the Encrypted File System is Available**

   The encrypted file system should now be visible and available for
   use:

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

After each boot, any encrypted file systems must be manually re-attached
to the kernel, checked for errors, and mounted, before the file systems
can be used. To configure these steps, add the following lines to
``/etc/rc.conf``:

.. code:: programlisting

    gbde_autoattach_all="YES"
    gbde_devices="ad4s1c"
    gbde_lockdir="/etc/gbde"

This requires that the passphrase be entered at the console at boot
time. After typing the correct passphrase, the encrypted partition will
be mounted automatically. Additional gbde boot options are available and
listed in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

sysinstall is incompatible with gbde-encrypted devices. All ``*.bde``
devices must be detached from the kernel before starting sysinstall or
it will crash during its initial probing for devices. To detach the
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

18.12.2.?Disk Encryption with ``geli``
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

An alternative cryptographic GEOM class is available using ``geli``.
This control utility adds some features and uses a different scheme for
doing cryptographic work. It provides the following features:

.. raw:: html

   <div class="itemizedlist">

-  Utilizes the
   `crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9>`__
   framework and automatically uses cryptographic hardware when it is
   available.

-  Supports multiple cryptographic algorithms such as AES, Blowfish, and
   3DES.

-  Allows the root partition to be encrypted. The passphrase used to
   access the encrypted root partition will be requested during system
   boot.

-  Allows the use of two independent keys.

-  It is fast as it performs simple sector-to-sector encryption.

-  Allows backup and restore of master keys. If a user destroys their
   keys, it is still possible to get access to the data by restoring
   keys from the backup.

-  Allows a disk to attach with a random, one-time key which is useful
   for swap partitions and temporary file systems.

.. raw:: html

   </div>

More features and usage examples can be found in
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__.

The following example describes how to generate a key file which will be
used as part of the master key for the encrypted provider mounted under
``/private``. The key file will provide some random data used to encrypt
the master key. The master key will also be protected by a passphrase.
The provider's sector size will be 4kB. The example describes how to
attach to the ``geli`` provider, create a file system on it, mount it,
work with it, and finally, how to detach it.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?18.4.?Encrypting a Partition with ``geli``

.. raw:: html

   </div>

#. **Load ``geli`` Support**

   Support for ``geli`` is available as a loadable kernel module. To
   configure the system to automatically load the module at boot time,
   add the following line to ``/boot/loader.conf``:

   .. code:: programlisting

       geom_eli_load="YES"

   To load the kernel module now:

   .. code:: screen

       # kldload geom_eli

   For a custom kernel, ensure the kernel configuration file contains
   these lines:

   .. code:: programlisting

       options GEOM_ELI
       device crypto

#. **Generate the Master Key**

   The following commands generate a master key (``/root/da2.key``) that
   is protected with a passphrase. The data source for the key file is
   ``/dev/random`` and the sector size of the provider
   (``/dev/da2.eli``) is 4kB as a bigger sector size provides better
   performance:

   .. code:: screen

       # dd if=/dev/random of=/root/da2.key bs=64 count=1
       # geli init -s 4096 -K /root/da2.key /dev/da2
       Enter new passphrase:
       Reenter new passphrase:

   It is not mandatory to use both a passphrase and a key file as either
   method of securing the master key can be used in isolation.

   If the key file is given as “-”, standard input will be used. For
   example, this command generates three key files:

   .. code:: screen

       # cat keyfile1 keyfile2 keyfile3 | geli init -K - /dev/da2

#. **Attach the Provider with the Generated Key**

   To attach the provider, specify the key file, the name of the disk,
   and the passphrase:

   .. code:: screen

       # geli attach -k /root/da2.key /dev/da2
       Enter passphrase:

   This creates a new device with an ``.eli`` extension:

   .. code:: screen

       # ls /dev/da2*
       /dev/da2  /dev/da2.eli

#. **Create the New File System**

   Next, format the device with the UFS file system and mount it on an
   existing mount point:

   .. code:: screen

       # dd if=/dev/random of=/dev/da2.eli bs=1m
       # newfs /dev/da2.eli
       # mount /dev/da2.eli /private

   The encrypted file system should now be available for use:

   .. code:: screen

       # df -H
       Filesystem     Size   Used  Avail Capacity  Mounted on
       /dev/ad0s1a    248M    89M   139M    38%    /
       /devfs         1.0K   1.0K     0B   100%    /dev
       /dev/ad0s1f    7.7G   2.3G   4.9G    32%    /usr
       /dev/ad0s1d    989M   1.5M   909M     0%    /tmp
       /dev/ad0s1e    3.9G   1.3G   2.3G    35%    /var
       /dev/da2.eli   150G   4.1K   138G     0%    /private

.. raw:: html

   </div>

Once the work on the encrypted partition is done, and the ``/private``
partition is no longer needed, it is prudent to put the device into cold
storage by unmounting and detaching the ``geli`` encrypted partition
from the kernel:

.. code:: screen

    # umount /private
    # geli detach da2.eli

A ``rc.d`` script is provided to simplify the mounting of
``geli``-encrypted devices at boot time. For this example, add these
lines to ``/etc/rc.conf``:

.. code:: programlisting

    geli_devices="da2"
    geli_da2_flags="-p -k /root/da2.key"

This configures ``/dev/da2`` as a ``geli`` provider with a master key of
``/root/da2.key``. The system will automatically detach the provider
from the kernel before the system shuts down. During the startup
process, the script will prompt for the passphrase before attaching the
provider. Other kernel messages might be shown before and after the
password prompt. If the boot process seems to stall, look carefully for
the password prompt among the other messages. Once the correct
passphrase is entered, the provider is attached. The file system is then
mounted, typically by an entry in ``/etc/fstab``. Refer to `Section?4.7,
“Mounting and Unmounting File Systems” <mount-unmount.html>`__ for
instructions on how to configure a file system to mount at boot time.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+--------------------------------------+
| `Prev <quotas.html>`__?   | `Up <disks.html>`__     | ?\ `Next <swap-encrypting.html>`__   |
+---------------------------+-------------------------+--------------------------------------+
| 18.11.?Disk Quotas?       | `Home <index.html>`__   | ?18.13.?Encrypting Swap              |
+---------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
