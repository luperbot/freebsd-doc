==================================
22.4.?FreeBSD as a Host with bhyve
==================================

.. raw:: html

   <div class="navheader">

22.4.?FreeBSD as a Host with bhyve
`Prev <virtualization-host-virtualbox.html>`__?
Chapter?22.?Virtualization
?\ `Next <l10n.html>`__

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

22.4.?FreeBSD as a Host with bhyve
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Starting with FreeBSD 10.0-RELEASE, the bhyve BSD-licensed hypervisor is
part of the base system. This hypervisor supports a number of guests,
including FreeBSD, OpenBSD, and many Linux? distributions. Currently,
bhyve only supports a serial console and does not emulate a graphical
console. As a legacy-free hypervisor, it relies on the virtualization
offload features of newer CPUs, instead of translating instructions and
manually managing memory mappings.

Due to the design of bhyve, it requires a computer with a newer
processor that supports Intel? Extended Page Tables (EPT) or AMD? Rapid
Virtualization Indexing (RVI), also known as Nested Page Tables (NPT).
Most newer processors, specifically the Intel??Core™ i3/i5/i7 and
Intel??Xeon™ E3/E5/E7, support this feature. For a complete list of
Intel? processors that support EPT, refer to
http://ark.intel.com/search/advanced?s=t&ExtendedPageTables=true. RVI is
found on the 3rd generation and later of the AMD?Opteron™ (Barcelona)
processors. The easiest way to check for support of EPT or RVI is to
look for the ``POPCNT`` processor feature flag on the ``Features2`` line
in ``dmesg`` or ``/var/run/dmesg.boot``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.4.1.?Preparing the Host
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first step to creating a virtual machine in bhyve is configuring the
host system. First, load the bhyve kernel module:

.. code:: screen

    # kldload vmm

Then, create a ``tap`` interface for the network device in the virtual
machine to attach to. In order for the network device to participate in
the network, also create a bridge interface containing the ``tap``
interface and the physical interface as members. In this example, the
physical interface is *``igb0``*:

.. code:: screen

    # ifconfig tap0 create
    # sysctl net.link.tap.up_on_open=1
    net.link.tap.up_on_open: 0 -> 1
    # ifconfig bridge0 create
    # ifconfig bridge0 addm igb0 addm tap0
    # ifconfig bridge0 up

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

22.4.2.?Creating a FreeBSD Guest
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Create a file to use as the virtual disk for the guest machine. Specify
the size and name of the virtual disk:

.. code:: screen

    # truncate -s 16G guest.img

Download an installation image of FreeBSD to install:

.. code:: screen

    # fetch ftp://ftp.freebsd.org/pub/FreeBSD/ISO-IMAGES-amd64/10.0/FreeBSD-10.0-RELEASE-amd64-bootonly.iso
    FreeBSD-10.0-RELEASE-amd64-bootonly.iso       100% of  209 MB  570 kBps 06m17s

FreeBSD comes with an example script for running a virtual machine in
bhyve. The script will start the virtual machine and run it in a loop,
so it will automatically restart if it crashes. The script takes a
number of options to control the configuration of the machine: ``-c``
controls the number of virtual CPUs, ``-m`` limits the amount of memory
available to the guest, ``-t`` defines which ``tap`` device to use,
``-d`` indicates which disk image to use, ``-i`` tells bhyve to boot
from the CD image instead of the disk, and ``-I`` defines which CD image
to use. The last parameter is the name of the virtual machine, used to
track the running machines. This example starts the virtual machine in
installation mode:

.. code:: screen

    # sh /usr/share/examples/bhyve/vmrun.sh -c 4 -m 1024M -t tap0 -d guest.img -i -I FreeBSD-10.0-RELEASE-amd64-bootonly.iso guestname

The virtual machine will boot and start the installer. After installing
a system in the virtual machine, when the system asks about dropping in
to a shell at the end of the installation, choose Yes. A small change
needs to be made to make the system start with a serial console. Edit
``/etc/ttys`` and replace the existing ``ttyu0`` line with:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty 3wire"   xterm  on secure

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Beginning with FreeBSD?9.3-RELEASE and 10.1-RELEASE the console is
configured automatically.

.. raw:: html

   </div>

Reboot the virtual machine. While rebooting the virtual machine causes
bhyve to exit, the ``vmrun.sh`` script runs ``bhyve`` in a loop and will
automatically restart it. When this happens, choose the reboot option
from the boot loader menu in order to escape the loop. Now the guest can
be started from the virtual disk:

.. code:: screen

    # sh /usr/share/examples/bhyve/vmrun.sh -c 4 -m 1024M -t tap0 -d guest.img guestname

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

22.4.3.?Creating a Linux? Guest
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to boot operating systems other than FreeBSD, the
`sysutils/grub2-bhyve <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/grub2-bhyve/pkg-descr>`__
port must be first installed.

Next, create a file to use as the virtual disk for the guest machine:

.. code:: screen

    # truncate -s 16G linux.img

Starting a virtual machine with bhyve is a two step process. First a
kernel must be loaded, then the guest can be started. The Linux? kernel
is loaded with
`sysutils/grub2-bhyve <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/grub2-bhyve/pkg-descr>`__.
Create a ``device.map`` that grub will use to map the virtual devices to
the files on the host system:

.. code:: programlisting

    (hd0) ./linux.img
    (cd0) ./somelinux.iso

Use
`sysutils/grub2-bhyve <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/grub2-bhyve/pkg-descr>`__
to load the Linux? kernel from the ISO image:

.. code:: screen

    # grub-bhyve -m device.map -r cd0 -M 1024M linuxguest

This will start grub. If the installation CD contains a ``grub.cfg``, a
menu will be displayed. If not, the ``vmlinuz`` and ``initrd`` files
must be located and loaded manually:

.. code:: screen

    grub> ls
    (hd0) (cd0) (cd0,msdos1) (host)
    grub> ls (cd0)/isolinux
    boot.cat boot.msg grub.conf initrd.img isolinux.bin isolinux.cfg memtest
    splash.jpg TRANS.TBL vesamenu.c32 vmlinuz
    grub> linux (cd0)/isolinux/vmlinuz
    grub> initrd (cd0)/isolinux/initrd.img
    grub> boot

Now that the Linux? kernel is loaded, the guest can be started:

.. code:: screen

    # bhyve -AI -H -P -s 0:0,hostbridge -s 1:0,lpc -s 2:0,virtio-net,tap1 -s 3:0,virtio-blk,./linux.img \
    -s 4:0,ahci-cd,./somelinux.iso -l com1,stdio -c 4 -m 1024M linuxguest

The system will boot and start the installer. After installing a system
in the virtual machine, reboot the virtual machine. This will cause
bhyve to exit. The instance of the virtual machine needs to be destroyed
before it can be started again:

.. code:: screen

    # bhyvectl --destroy --vm=linuxguest

Now the guest can be started directly from the virtual disk. Load the
kernel:

.. code:: screen

    # grub-bhyve -m device.map -r hd0,msdos1 -M 1024M linuxguest
    grub> ls
    (hd0) (hd0,msdos2) (hd0,msdos1) (cd0) (cd0,msdos1) (host)
    (lvm/VolGroup-lv_swap) (lvm/VolGroup-lv_root)
    grub> ls (hd0,msdos1)/
    lost+found/ grub/ efi/ System.map-2.6.32-431.el6.x86_64 config-2.6.32-431.el6.x
    86_64 symvers-2.6.32-431.el6.x86_64.gz vmlinuz-2.6.32-431.el6.x86_64
    initramfs-2.6.32-431.el6.x86_64.img
    grub> linux (hd0,msdos1)/vmlinuz-2.6.32-431.el6.x86_64 root=/dev/mapper/VolGroup-lv_root
    grub> initrd (hd0,msdos1)/initramfs-2.6.32-431.el6.x86_64.img
    grub> boot

Boot the virtual machine:

.. code:: screen

    # bhyve -AI -H -P -s 0:0,hostbridge -s 1:0,lpc -s 2:0,virtio-net,tap1 \
    -s 3:0,virtio-blk,./linux.img -l com1,stdio -c 4 -m 1024M linuxguest

Linux? will now boot in the virtual machine and eventually present you
with the login prompt. Login and use the virtual machine. When you are
finished, reboot the virtual machine to exit bhyve. Destroy the virtual
machine instance:

.. code:: screen

    # bhyvectl --destroy --vm=linuxguest

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

22.4.4.?Virtual Machine Consoles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is advantageous to wrap the bhyve console in a session management
tool such as
`sysutils/tmux <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/tmux/pkg-descr>`__
or
`sysutils/screen <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/screen/pkg-descr>`__
in order to detach and reattach to the console. It is also possible to
have the console of bhyve be a null modem device that can be accessed
with ``cu``. To do this, load the ``nmdm`` kernel module and replace
``-l com1,stdio`` with ``-l com1,/dev/nmdm0A``. The ``/dev/nmdm``
devices are created automatically as needed, where each is a pair,
corresponding to the two ends of the null modem cable (``/dev/nmdm1A``
and ``/dev/nmdm1B``). See
`nmdm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nmdm&sektion=4>`__
for more information.

.. code:: screen

    # kldload nmdm
    # bhyve -AI -H -P -s 0:0,hostbridge -s 1:0,lpc -s 2:0,virtio-net,tap1 -s 3:0,virtio-blk,./linux.img \
    -l com1,/dev/nmdm0A -c 4 -m 1024M linuxguest
    # cu -l /dev/nmdm0B -s 9600
    Connected

    Ubuntu 13.10 handbook ttyS0

    handbook login:

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

22.4.5.?Managing Virtual Machines
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A device node is created in ``/dev/vmm`` for each virtual machine. This
allows the administrator to easily see a list of the running virtual
machines:

.. code:: screen

    # ls -al /dev/vmm
    total 1
    dr-xr-xr-x   2 root  wheel    512 Mar 17 12:19 ./
    dr-xr-xr-x  14 root  wheel    512 Mar 17 06:38 ../
    crw-------   1 root  wheel  0x1a2 Mar 17 12:20 guestname
    crw-------   1 root  wheel  0x19f Mar 17 12:19 linuxguest
    crw-------   1 root  wheel  0x1a1 Mar 17 12:19 otherguest

A specified virtual machine can be destroyed using ``bhyvectl``:

.. code:: screen

    # bhyvectl --destroy --vm=guestname

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

22.4.6.?Persistent Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to configure the system to start bhyve guests at boot time, add
the following entries to in the following files:

.. raw:: html

   <div class="procedure">

#. **``/etc/sysctl.conf``**

   .. code:: programlisting

       net.link.tap.up_on_open=1

#. **``/boot/loader.conf``**

   .. code:: programlisting

       vmm_load="YES"
       nmdm_load="YES"
       if_bridge_load="YES"
       if_tap_load="YES"

#. **``/etc/rc.conf``**

   .. code:: programlisting

       cloned_interfaces="bridge0 tap0"
       ifconfig_bridge0="addm igb0 addm tap0"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+--------------------------------+---------------------------------------------------------+
| `Prev <virtualization-host-virtualbox.html>`__?   | `Up <virtualization.html>`__   | ?\ `Next <l10n.html>`__                                 |
+---------------------------------------------------+--------------------------------+---------------------------------------------------------+
| 22.3.?FreeBSD as a Host with VirtualBox?          | `Home <index.html>`__          | ?Chapter?23.?Localization - i18n/L10n Usage and Setup   |
+---------------------------------------------------+--------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
