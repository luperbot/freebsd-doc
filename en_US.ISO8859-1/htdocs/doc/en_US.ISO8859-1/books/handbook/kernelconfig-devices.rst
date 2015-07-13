================================
9.3.?Finding the System Hardware
================================

.. raw:: html

   <div class="navheader">

9.3.?Finding the System Hardware
`Prev <kernelconfig-custom-kernel.html>`__?
Chapter?9.?Configuring the FreeBSD Kernel
?\ `Next <kernelconfig-config.html>`__

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

9.3.?Finding the System Hardware
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before editing the kernel configuration file, it is recommended to
perform an inventory of the machine's hardware. On a dual-boot system,
the inventory can be created from the other operating system. For
example, Microsoft?'s Device Manager contains information about
installed devices.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some versions of Microsoft??Windows? have a System icon which can be
used to access Device Manager.

.. raw:: html

   </div>

If FreeBSD is the only installed operating system, use
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
to determine the hardware that was found and listed during the boot
probe. Most device drivers on FreeBSD have a manual page which lists the
hardware supported by that driver. For example, the following lines
indicate that the
`psm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=psm&sektion=4>`__
driver found a mouse:

.. code:: screen

    psm0: <PS/2 Mouse> irq 12 on atkbdc0
    psm0: [GIANT-LOCKED]
    psm0: [ITHREAD]
    psm0: model Generic PS/2 mouse, device ID 0

Since this hardware exists, this driver should not be removed from a
custom kernel configuration file.

If the output of ``dmesg`` does not display the results of the boot
probe output, instead read the contents of ``/var/run/dmesg.boot``.

Another tool for finding hardware is
`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8>`__,
which provides more verbose output. For example:

.. code:: screen

    % pciconf -lv
    ath0@pci0:3:0:0:        class=0x020000 card=0x058a1014 chip=0x1014168c rev=0x01 hdr=0x00
        vendor     = 'Atheros Communications Inc.'
        device     = 'AR5212 Atheros AR5212 802.11abg wireless'
        class      = network
        subclass   = ethernet

This output shows that the ``ath`` driver located a wireless Ethernet
device.

The ``-k`` flag of
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__ can
be used to provide useful information. For example, to display a list of
manual pages which contain the specified word:

.. code:: screen

    # man -k Atheros

.. code:: programlisting

    ath(4)                   - Atheros IEEE 802.11 wireless network driver
    ath_hal(4)               - Atheros Hardware Access Layer (HAL)

Once the hardware inventory list is created, refer to it to ensure that
drivers for installed hardware are not removed as the custom kernel
configuration is edited.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+------------------------------+------------------------------------------+
| `Prev <kernelconfig-custom-kernel.html>`__?   | `Up <kernelconfig.html>`__   | ?\ `Next <kernelconfig-config.html>`__   |
+-----------------------------------------------+------------------------------+------------------------------------------+
| 9.2.?Why Build a Custom Kernel??              | `Home <index.html>`__        | ?9.4.?The Configuration File             |
+-----------------------------------------------+------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
