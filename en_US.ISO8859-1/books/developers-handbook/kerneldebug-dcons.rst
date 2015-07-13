=================================
10.8.?Kernel debugging with Dcons
=================================

.. raw:: html

   <div class="navheader">

10.8.?Kernel debugging with Dcons
`Prev <kerneldebug-deadlocks.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <kerneldebug-options.html>`__

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

10.8.?Kernel debugging with Dcons
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
is a very simple console driver that is not directly connected with any
physical devices. It just reads and writes characters from and to a
buffer in a kernel or loader. Due to its simple nature, it is very
useful for kernel debugging, especially with a FireWire? device.
Currently, FreeBSD provides two ways to interact with the buffer from
outside of the kernel using
`dconschat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dconschat&sektion=8>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.8.1.?Dcons over FireWire?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most FireWire? (IEEE1394) host controllers are based on the OHCI
specification that supports physical access to the host memory. This
means that once the host controller is initialized, we can access the
host memory without the help of software (kernel). We can exploit this
facility for interaction with
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__.
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
provides similar functionality as a serial console. It emulates two
serial ports, one for the console and DDB, the other for GDB. Because
remote memory access is fully handled by the hardware, the
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
buffer is accessible even when the system crashes.

FireWire? devices are not limited to those integrated into motherboards.
PCI cards exist for desktops, and a cardbus interface can be purchased
for laptops.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.8.1.1.?Enabling FireWire? and Dcons support on the target machine
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable FireWire? and Dcons support in the kernel of the *target
machine*:

.. raw:: html

   <div class="itemizedlist">

-  Make sure your kernel supports ``dcons``, ``dcons_crom`` and
   ``firewire``. ``Dcons`` should be statically linked with the kernel.
   For ``dcons_crom`` and ``firewire``, modules should be OK.

-  Make sure physical DMA is enabled. You may need to add
   ``hw.firewire.phydma_enable=1`` to ``/boot/loader.conf``.

-  Add options for debugging.

-  Add ``dcons_gdb=1`` in ``/boot/loader.conf`` if you use GDB over
   FireWire?.

-  Enable ``dcons`` in ``/etc/ttys``.

-  Optionally, to force ``dcons`` to be the high-level console, add
   ``hw.firewire.dcons_crom.force_console=1`` to ``loader.conf``.

.. raw:: html

   </div>

To enable FireWire? and Dcons support in
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
on i386 or amd64:

Add ``LOADER_FIREWIRE_SUPPORT=YES`` in ``/etc/make.conf`` and rebuild
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__:

.. code:: screen

    # cd /sys/boot/i386 && make clean && make && make install

To enable
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
as an active low-level console, add ``boot_multicons="YES"`` to
``/boot/loader.conf``.

Here are a few configuration examples. A sample kernel configuration
file would contain:

.. code:: screen

    device dcons
    device dcons_crom
    options KDB
    options DDB
    options GDB
    options ALT_BREAK_TO_DEBUGGER

And a sample ``/boot/loader.conf`` would contain:

.. code:: screen

    dcons_crom_load="YES"
    dcons_gdb=1
    boot_multicons="YES"
    hw.firewire.phydma_enable=1
    hw.firewire.dcons_crom.force_console=1

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

10.8.1.2.?Enabling FireWire? and Dcons support on the host machine
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable FireWire? support in the kernel on the *host machine*:

.. code:: screen

    # kldload firewire

Find out the EUI64 (the unique 64 bit identifier) of the FireWire? host
controller, and use
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8>`__
or ``dmesg`` to find the EUI64 of the target machine.

Run
`dconschat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dconschat&sektion=8>`__,
with:

.. code:: screen

    # dconschat -e \# -br -G 12345 -t 00-11-22-33-44-55-66-77

The following key combinations can be used once
`dconschat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dconschat&sektion=8>`__
is running:

.. raw:: html

   <div class="informaltable">

+------------------------+---------------------+
| **~** **.**            | Disconnect          |
+------------------------+---------------------+
| **~** **Ctrl**+**B**   | ALT BREAK           |
+------------------------+---------------------+
| **~** **Ctrl**+**R**   | RESET target        |
+------------------------+---------------------+
| **~** **Ctrl**+**Z**   | Suspend dconschat   |
+------------------------+---------------------+

.. raw:: html

   </div>

Attach remote GDB by starting
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1>`__
with a remote debugging session:

.. code:: screen

    kgdb -r :12345 kernel

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

10.8.1.3.?Some general tips
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here are some general tips:

To take full advantage of the speed of FireWire?, disable other slow
console drivers:

.. code:: screen

    # conscontrol delete ttyd0      # serial console
    # conscontrol delete consolectl # video/keyboard

There exists a GDB mode for
`emacs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=emacs&sektion=1>`__;
this is what you will need to add to your ``.emacs``:

.. code:: screen

    (setq gud-gdba-command-name "kgdb -a -a -a -r :12345")
    (setq gdb-many-windows t)
    (xterm-mouse-mode 1)
    M-x gdba

And for DDD (``devel/ddd``):

.. code:: screen

    # remote serial protocol
    LANG=C ddd --debugger kgdb -r :12345 kernel
    # live core debug
    LANG=C ddd --debugger kgdb kernel /dev/fwmem0.2

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

10.8.2.?Dcons with KVM
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We can directly read the
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
buffer via ``/dev/mem`` for live systems, and in the core dump for
crashed systems. These give you similar output to ``dmesg -a``, but the
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
buffer includes more information.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.8.2.1.?Using Dcons with KVM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To use
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
with KVM:

Dump a
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
buffer of a live system:

.. code:: screen

    # dconschat -1

Dump a
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__
buffer of a crash dump:

.. code:: screen

    # dconschat -1 -M vmcore.XX

Live core debugging can be done via:

.. code:: screen

    # fwcontrol -m target_eui64
    # kgdb kernel /dev/fwmem0.2

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-----------------------------+---------------------------------------------------+
| `Prev <kerneldebug-deadlocks.html>`__?   | `Up <kerneldebug.html>`__   | ?\ `Next <kerneldebug-options.html>`__            |
+------------------------------------------+-----------------------------+---------------------------------------------------+
| 10.7.?Debugging Deadlocks?               | `Home <index.html>`__       | ?10.9.?Glossary of Kernel Options for Debugging   |
+------------------------------------------+-----------------------------+---------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
