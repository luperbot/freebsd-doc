=================================
3.12.?Advanced Installation Guide
=================================

.. raw:: html

   <div class="navheader">

3.12.?Advanced Installation Guide
`Prev <install-trouble.html>`__?
Chapter?3.?Installing FreeBSD?8.\ *``X``*
?\ `Next <install-diff-media.html>`__

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

3.12.?Advanced Installation Guide
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Valentino Vaschetto.

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how to install FreeBSD in exceptional cases.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.12.1.?Installing FreeBSD on a System Without a Monitor or Keyboard
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This type of installation is called a “headless install” because the
machine to be installed does not have either an attached monitor or a
VGA output. This type of installation is possible using a serial
console, another machine which acts as the main display and keyboard. To
do this, follow the steps to create an installation USB stick, explained
in `Section?3.3.7, “Prepare the Boot
Media” <install-pre.html#install-boot-media>`__, or download the correct
installation ISO image as described in `Section?3.13.1, “Creating an
Installation ISO” <install-diff-media.html#install-cdrom>`__.

To modify the installation media to boot into a serial console, follow
these steps. If using a CD/DVD media, skip the first step):

.. raw:: html

   <div class="procedure">

#. **Enabling the Installation USB Stick to Boot into a Serial Console**

   By default, booting into the USB stick boots into the installer. To
   instead boot into a serial console, mount the USB disk onto a FreeBSD
   system using
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__:

   .. code:: screen

       # mount /dev/da0a /mnt

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Adapt the device node and the mount point to the situation.

   .. raw:: html

      </div>

   Once the USB stick is mounted, set it to boot into a serial console.
   Add this line to ``/boot/loader.conf`` on the USB stick:

   .. code:: screen

       # echo 'console="comconsole"' >> /mnt/boot/loader.conf

   Now that the USB is stick configured correctly, unmount the disk
   using
   `umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__:

   .. code:: screen

       # umount /mnt

   Now, unplug the USB stick and jump directly to the third step of this
   procedure.

#. **Enabling the Installation CD/DVD to Boot into a Serial Console**

   By default, when booting into the installation CD/DVD, FreeBSD boots
   into its normal install mode. To instead boot into a serial console,
   extract, modify, and regenerate the ISO image before burning it to
   the CD/DVD media.

   From the FreeBSD system with the saved installation ISO image, use
   `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
   to extract all the files:

   .. code:: screen

       # mkdir /path/to/headless-iso
       # tar -C /path/to/headless-iso -pxvf FreeBSD-10.1-RELEASE-i386-disc1.iso

   Next, set the installation media to boot into a serial console. Add
   this line to the ``/boot/loader.conf`` of the extracted ISO image:

   .. code:: screen

       # echo 'console="comconsole"' >> /path/to/headless-iso/boot/loader.conf

   Then, create a new ISO image from the modified tree. This example
   uses
   `mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
   from the
   `sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
   package or port:

   .. code:: screen

       # mkisofs -v -b boot/cdboot -no-emul-boot -r -J -V "Headless_install" \
               -o Headless-FreeBSD-9.3-RELEASE-i386-disc1.iso /path/to/headless-iso

   Now that the ISO image is configured correctly, burn it to a CD/DVD
   media using a burning application.

#. **Connecting the Null-modem Cable**

   Connect a `null-modem cable <serial.html#term-cables-null>`__ to the
   serial ports of the two machines. *A normal serial cable will not
   work*. A null-modem cable is required.

#. **Booting Up for the Install**

   It is now time to go ahead and start the install. Plug in the USB
   stick or insert the CD/DVD media in the headless install machine and
   power it on.

#. **Connecting to the Headless Machine**

   Next, connect to that machine with
   `cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1>`__:

   .. code:: screen

       # cu -l /dev/cuau0

.. raw:: html

   </div>

The headless machine can now be controlled using
`cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1>`__. It
will load the kernel and then display a selection of which type of
terminal to use. Select the FreeBSD color console and proceed with the
installation.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+----------------------------------------------+
| `Prev <install-trouble.html>`__?   | `Up <install.html>`__   | ?\ `Next <install-diff-media.html>`__        |
+------------------------------------+-------------------------+----------------------------------------------+
| 3.11.?Troubleshooting?             | `Home <index.html>`__   | ?3.13.?Preparing Custom Installation Media   |
+------------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
