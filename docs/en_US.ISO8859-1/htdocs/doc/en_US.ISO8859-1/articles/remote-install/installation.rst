===============================================
4.?Installation of the FreeBSD Operating System
===============================================

.. raw:: html

   <div class="navheader">

4.?Installation of the FreeBSD Operating System
`Prev <preparation.html>`__?
?
?\ `Next <zfs.html>`__

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

4.?Installation of the FreeBSD Operating System
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The mfsBSD has been successfully booted and it should be possible to log
in through
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__.
This section will describe how to create and label slices, set up
gmirror for RAID-1, and how to use sysinstall to install a minimal
distribution of the FreeBSD operating system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Preparation of Hard Drives
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first task is to allocate disk space for FreeBSD, i.e.: to create
slices and partitions. Obviously, the currently running system is fully
loaded in system memory and therefore there will be no problems with
manipulating hard drives. To complete this task, it is possible to use
either sysinstall or
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__
in conjunction to
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__.

At the start, mark all system disks as empty. Repeat the following
command for each hard drive:

.. code:: screen

    # dd if=/dev/zero of=/dev/ad0 count=2

Next, create slices and label them with your preferred tool. While it is
considered easier to use sysinstall, a powerful and also probably less
buggy method will be to use standard text-based UNIX? tools, such as
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__
and
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__,
which will also be covered in this section. The former option is well
documented in the `Installing
FreeBSD <../../../../doc/en_US.ISO8859-1/books/handbook/install-steps.html>`__
chapter of the FreeBSD Handbook. As it was mentioned in the
introduction, this article will present how to set up a system with
RAID-1 and ZFS capabilities. Our set up will consist of a small
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
mirrored ``/`` (root), ``/usr`` and ``/var`` dataset, and the rest of
the disk space will be allocated for a
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__
mirrored ZFS file system. Please note, that the ZFS file system will be
configured after the FreeBSD operating system is successfully installed
and booted.

The following example will describe how to create slices and labels,
initialize
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
on each partition and how to create a UFS2 file system in each mirrored
partition:

.. code:: screen

    # fdisk -BI /dev/ad0 
    # fdisk -BI /dev/ad1
    # bsdlabel -wB /dev/ad0s1 
    # bsdlabel -wB /dev/ad1s1
    # bsdlabel -e /dev/ad0s1 
    # bsdlabel /dev/ad0s1 > /tmp/bsdlabel.txt && bsdlabel -R /dev/ad1s1 /tmp/bsdlabel.txt 
    # gmirror label root /dev/ad[01]s1a 
    # gmirror label var /dev/ad[01]s1d
    # gmirror label usr /dev/ad[01]s1e
    # gmirror label -F swap /dev/ad[01]s1b 
    # newfs /dev/mirror/root 
    # newfs /dev/mirror/var
    # newfs /dev/mirror/usr

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#fdisk>`__                     | Create a slice covering the entire   |
|                                      | disk and initialize the boot code    |
|                                      | contained in sector 0 of the given   |
|                                      | disk. Repeat this command for all    |
|                                      | hard drives in the system.           |
+--------------------------------------+--------------------------------------+
| `|2| <#bsdlabel-writing>`__          | Write a standard label for each disk |
|                                      | including the bootstrap code.        |
+--------------------------------------+--------------------------------------+
| `|3| <#bsdlabel-editing>`__          | Now, manually edit the label of the  |
|                                      | given disk. Refer to the             |
|                                      | `bsdlabel(8) <http://www.FreeBSD.org |
|                                      | /cgi/man.cgi?query=bsdlabel&sektion= |
|                                      | 8>`__                                |
|                                      | manual page in order to find out how |
|                                      | to create partitions. Create         |
|                                      | partitions ``a`` for ``/`` (root)    |
|                                      | file system, ``b`` for swap, ``d``   |
|                                      | for ``/var``, ``e`` for ``/usr`` and |
|                                      | finally ``f`` which will later be    |
|                                      | used for ZFS.                        |
+--------------------------------------+--------------------------------------+
| `|4| <#bsdlabel-restore>`__          | Import the recently created label    |
|                                      | for the second hard drive, so both   |
|                                      | hard drives will be labeled in the   |
|                                      | same way.                            |
+--------------------------------------+--------------------------------------+
| `|5| <#gmirror1>`__                  | Initialize                           |
|                                      | `gmirror(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=gmirror&sektion=8> |
|                                      | `__                                  |
|                                      | on each partition.                   |
+--------------------------------------+--------------------------------------+
| `|6| <#gmirror2>`__                  | Note that ``-F`` is used for the     |
|                                      | swap partition. This instructs       |
|                                      | `gmirror(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=gmirror&sektion=8> |
|                                      | `__                                  |
|                                      | to assume that the device is in the  |
|                                      | consistent state after the           |
|                                      | power/system failure.                |
+--------------------------------------+--------------------------------------+
| `|7| <#newfs>`__                     | Create a UFS2 file system on each    |
|                                      | mirrored partition.                  |
+--------------------------------------+--------------------------------------+

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

4.2.?System Installation
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is the most important part. This section will describe how to
actually install the minimal distribution of FreeBSD on the hard drives
that we have prepared in the previous section. To accomplish this goal,
all file systems need to be mounted so sysinstall may write the contents
of FreeBSD to the hard drives:

.. code:: screen

    # mount /dev/mirror/root /mnt
    # mkdir /mnt/var /mnt/usr
    # mount /dev/mirror/var /mnt/var
    # mount /dev/mirror/usr /mnt/usr

When you are done, start
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__.
Select the Custom installation from the main menu. Select Options and
press **Enter**. With the help of arrow keys, move the cursor on the
``Install Root`` item, press **Space** and change it to ``/mnt``. Press
**Enter** to submit your changes and exit the Options menu by pressing
**q**.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Note that this step is very important and if skipped, sysinstall will be
unable to install FreeBSD.

.. raw:: html

   </div>

Go to the Distributions menu, move the cursor with the arrow keys to
``Minimal``, and check it by pressing **Space**. This article uses the
Minimal distribution in order to save network traffic, because the
system itself will be installed over ftp. Exit this menu by choosing
``Exit``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The Partition and Label menus will be skipped, as these are useless now.

.. raw:: html

   </div>

In the Media menu, select ``FTP``. Select the nearest mirror and let
sysinstall assume that the network is already configured. You will be
returned back to the Custom menu.

Finally, perform the system installation by selecting the last option,
Commit. Exit sysinstall when it finishes the installation.

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

4.3.?Post Installation Steps
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD operating system should be installed now; however, the
process is not finished yet. It is necessary to perform some post
installation steps in order to allow FreeBSD to boot in the future and
to be able to log in to the system.

You must now
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
into the freshly installed system in order to finish the installation.
Use the following command:

.. code:: screen

    # chroot /mnt

To complete our goal, perform these steps:

.. raw:: html

   <div class="itemizedlist">

-  Copy the ``GENERIC`` kernel to the ``/boot/kernel`` directory:

   .. code:: screen

       # cp -Rp /boot/GENERIC/* /boot/kernel

-  Create the ``/etc/rc.conf``, ``/etc/resolv.conf`` and ``/etc/fstab``
   files. Do not forget to properly set the network information and to
   enable sshd in ``/etc/rc.conf``. The contents of ``/etc/fstab`` will
   be similar to the following:

   .. code:: programlisting

       # Device                Mountpoint      FStype  Options         Dump    Pass#
       /dev/mirror/swap        none            swap    sw              0       0
       /dev/mirror/root        /               ufs     rw              1       1
       /dev/mirror/usr         /usr            ufs     rw              2       2
       /dev/mirror/var         /var            ufs     rw              2       2
       /dev/cd0                /cdrom          cd9660  ro,noauto       0       0

-  Create ``/boot/loader.conf`` with the following contents:

   .. code:: programlisting

       geom_mirror_load="YES"
       zfs_load="YES"

-  Perform the following command, which will make ZFS available on the
   next boot:

   .. code:: screen

       # echo 'zfs_enable="YES"' >> /etc/rc.conf 

-  Add additional users to the system using the
   `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
   tool. Do not forget to add a user to the ``wheel`` group so you may
   obtain root access after the reboot.

-  Double-check all your settings.

.. raw:: html

   </div>

The system should now be ready for the next boot. Use the
`reboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=reboot&sektion=8>`__
command to reboot your system.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+--------------------------+
| `Prev <preparation.html>`__?   | ?                       | ?\ `Next <zfs.html>`__   |
+--------------------------------+-------------------------+--------------------------+
| 3.?Preparation - mfsBSD?       | `Home <index.html>`__   | ?5.?ZFS                  |
+--------------------------------+-------------------------+--------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
