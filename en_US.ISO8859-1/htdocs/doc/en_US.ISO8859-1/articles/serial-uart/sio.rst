=============================
2.?Configuring the sio driver
=============================

.. raw:: html

   <div class="navheader">

2.?Configuring the ``sio`` driver
`Prev <index.html>`__?
?
?\ `Next <cy.html>`__

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

2.?Configuring the ``sio`` driver
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``sio`` driver provides support for NS8250-, NS16450-, NS16550 and
NS16550A-based EIA RS-232C (CCITT V.24) communications interfaces.
Several multiport cards are supported as well. See the
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__
manual page for detailed technical documentation.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Digi International (DigiBoard) PC/8
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Contributed by Andrew Webster ``<awebster@pubnix.net>``. 26 August
1995.*

Here is a config snippet from a machine with a Digi International PC/8
with 16550. It has 8 modems connected to these 8 lines, and they work
just great. Do not forget to add ``options COM_MULTIPORT`` or it will
not work very well!

.. code:: programlisting

    device          sio4    at isa? port 0x100 flags 0xb05
    device          sio5    at isa? port 0x108 flags 0xb05
    device          sio6    at isa? port 0x110 flags 0xb05
    device          sio7    at isa? port 0x118 flags 0xb05
    device          sio8    at isa? port 0x120 flags 0xb05
    device          sio9    at isa? port 0x128 flags 0xb05
    device          sio10   at isa? port 0x130 flags 0xb05
    device          sio11   at isa? port 0x138 flags 0xb05 irq 9

The trick in setting this up is that the MSB of the flags represent the
last SIO port, in this case 11 so flags are 0xb05.

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

2.2.?Boca 16
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Contributed by Don Whiteside ``<whiteside@acm.org>``. 26 August 1995.*

The procedures to make a Boca 16 port board with FreeBSD are pretty
straightforward, but you will need a couple things to make it work:

.. raw:: html

   <div class="orderedlist">

#. You either need the kernel sources installed so you can recompile the
   necessary options or you will need someone else to compile it for
   you. The 2.0.5 default kernel does *not* come with multiport support
   enabled and you will need to add a device entry for each port
   anyways.

#. Two, you will need to know the interrupt and IO setting for your Boca
   Board so you can set these options properly in the kernel.

.. raw:: html

   </div>

One important note — the actual UART chips for the Boca 16 are in the
connector box, not on the internal board itself. So if you have it
unplugged, probes of those ports will fail. I have never tested booting
with the box unplugged and plugging it back in, and I suggest you do not
either.

If you do not already have a custom kernel configuration file set up,
refer to `Kernel
Configuration <../../../../doc/en_US.ISO8859-1/books/handbook/kernelconfig.html>`__
chapter of the FreeBSD Handbook for general procedures. The following
are the specifics for the Boca 16 board and assume you are using the
kernel name MYKERNEL and editing with vi.

.. raw:: html

   <div class="procedure">

#. Add the line

   .. code:: programlisting

       options COM_MULTIPORT

   to the config file.

#. Where the current ``device           sion`` lines are, you will need
   to add 16 more devices. The following example is for a Boca Board
   with an interrupt of 3, and a base IO address 100h. The IO address
   for Each port is +8 hexadecimal from the previous port, thus the
   100h, 108h, 110h... addresses.

   .. code:: programlisting

       device sio1 at isa? port 0x100 flags 0x1005
       device sio2 at isa? port 0x108 flags 0x1005
       device sio3 at isa? port 0x110 flags 0x1005
       device sio4 at isa? port 0x118 flags 0x1005
       …
       device sio15 at isa? port 0x170 flags 0x1005
       device sio16 at isa? port 0x178 flags 0x1005 irq 3

   The flags entry *must* be changed from this example unless you are
   using the exact same sio assignments. Flags are set according to
   0x\ *``M``\ ``YY``* where *``M``* indicates the minor number of the
   master port (the last port on a Boca 16) and *``YY``* indicates if
   FIFO is enabled or disabled(enabled), IRQ sharing is used(yes) and if
   there is an AST/4 compatible IRQ control register(no). In this
   example,

   .. code:: programlisting

        flags
                 0x1005

   indicates that the master port is sio16. If I added another board and
   assigned sio17 through sio28, the flags for all 16 ports on *that*
   board would be 0x1C05, where 1C indicates the minor number of the
   master port. Do not change the 05 setting.

#. Save and complete the kernel configuration, recompile, install and
   reboot. Presuming you have successfully installed the recompiled
   kernel and have it set to the correct address and IRQ, your boot
   message should indicate the successful probe of the Boca ports as
   follows: (obviously the sio numbers, IO and IRQ could be different)

   .. code:: screen

       sio1 at 0x100-0x107 flags 0x1005 on isa
       sio1: type 16550A (multiport)
       sio2 at 0x108-0x10f flags 0x1005 on isa
       sio2: type 16550A (multiport)
       sio3 at 0x110-0x117 flags 0x1005 on isa
       sio3: type 16550A (multiport)
       sio4 at 0x118-0x11f flags 0x1005 on isa
       sio4: type 16550A (multiport)
       sio5 at 0x120-0x127 flags 0x1005 on isa
       sio5: type 16550A (multiport)
       sio6 at 0x128-0x12f flags 0x1005 on isa
       sio6: type 16550A (multiport)
       sio7 at 0x130-0x137 flags 0x1005 on isa
       sio7: type 16550A (multiport)
       sio8 at 0x138-0x13f flags 0x1005 on isa
       sio8: type 16550A (multiport)
       sio9 at 0x140-0x147 flags 0x1005 on isa
       sio9: type 16550A (multiport)
       sio10 at 0x148-0x14f flags 0x1005 on isa
       sio10: type 16550A (multiport)
       sio11 at 0x150-0x157 flags 0x1005 on isa
       sio11: type 16550A (multiport)
       sio12 at 0x158-0x15f flags 0x1005 on isa
       sio12: type 16550A (multiport)
       sio13 at 0x160-0x167 flags 0x1005 on isa
       sio13: type 16550A (multiport)
       sio14 at 0x168-0x16f flags 0x1005 on isa
       sio14: type 16550A (multiport)
       sio15 at 0x170-0x177 flags 0x1005 on isa
       sio15: type 16550A (multiport)
       sio16 at 0x178-0x17f irq 3 flags 0x1005 on isa
       sio16: type 16550A (multiport master)

   If the messages go by too fast to see,

   .. code:: screen

       # dmesg | more

   will show you the boot messages.

#. Next, appropriate entries in ``/dev`` for the devices must be made
   using the ``/dev/MAKEDEV`` script. This step can be omitted if you
   are running FreeBSD?5.X with a kernel that has
   `devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
   support compiled in.

   If you do need to create the ``/dev`` entries, run the following as
   ``root``:

   .. code:: screen

       # cd /dev
       # ./MAKEDEV tty1
       # ./MAKEDEV cua1
       (everything in between)
       # ./MAKEDEV ttyg
       # ./MAKEDEV cuag

   If you do not want or need call-out devices for some reason, you can
   dispense with making the ``cua*`` devices.

#. If you want a quick and sloppy way to make sure the devices are
   working, you can simply plug a modem into each port and (as root)

   .. code:: screen

       # echo at > ttyd*

   for each device you have made. You *should* see the RX lights flash
   for each working port.

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

2.3.?Support for Cheap Multi-UART Cards
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Contributed by Helge Oldach ``<hmo@sep.hamburg.com>``, September 1999*

Ever wondered about FreeBSD support for your 20$ multi-I/O card with two
(or more) COM ports, sharing IRQs? Here is how:

Usually the only option to support these kind of boards is to use a
distinct IRQ for each port. For example, if your CPU board has an
on-board ``COM1`` port (aka ``sio0``–I/O address 0x3F8 and IRQ 4) and
you have an extension board with two UARTs, you will commonly need to
configure them as ``COM2`` (aka ``sio1``–I/O address 0x2F8 and IRQ 3),
and the third port (aka ``sio2``) as I/O 0x3E8 and IRQ 5. Obviously this
is a waste of IRQ resources, as it should be basically possible to run
both extension board ports using a single IRQ with the ``COM_MULTIPORT``
configuration described in the previous sections.

Such cheap I/O boards commonly have a 4 by 3 jumper matrix for the COM
ports, similar to the following:

.. code:: programlisting

                o  o  o  *
    Port A               |
                o  *  o  *
    Port B         |
                o  *  o  o
    IRQ         2  3  4  5

Shown here is port A wired for IRQ 5 and port B wired for IRQ 3. The IRQ
columns on your specific board may vary—other boards may supply jumpers
for IRQs 3, 4, 5, and 7 instead.

One could conclude that wiring both ports for IRQ 3 using a handcrafted
wire-made jumper covering all three connection points in the IRQ 3
column would solve the issue, but no. You cannot duplicate IRQ 3 because
the output drivers of each UART are wired in a “totem pole” fashion, so
if one of the UARTs drives IRQ 3, the output signal will not be what you
would expect. Depending on the implementation of the extension board or
your motherboard, the IRQ 3 line will continuously stay up, or always
stay low.

You need to decouple the IRQ drivers for the two UARTs, so that the IRQ
line of the board only goes up if (and only if) one of the UARTs asserts
a IRQ, and stays low otherwise. The solution was proposed by Joerg
Wunsch ``<j@ida.interface-business.de>``: To solder up a wired-or
consisting of two diodes (Germanium or Schottky-types strongly
preferred) and a 1 kOhm resistor. Here is the schematic, starting from
the 4 by 3 jumper field above:

.. code:: programlisting

                              Diode
                    +---------->|-------+
                   /                    |
                o  *  o  o              |     1 kOhm
    Port A                              +----|######|-------+
                o  *  o  o              |                   |
    Port B          `-------------------+                 ==+==
                o  *  o  o              |                 Ground
                    \                   |
                     +--------->|-------+
    IRQ         2  3  4  5    Diode

The cathodes of the diodes are connected to a common point, together
with a 1 kOhm pull-down resistor. It is essential to connect the
resistor to ground to avoid floating of the IRQ line on the bus.

Now we are ready to configure a kernel. Staying with this example, we
would configure:

.. code:: programlisting

    # standard on-board COM1 port
    device          sio0    at isa? port "IO_COM1" flags 0x10
    # patched-up multi-I/O extension board
    options         COM_MULTIPORT
    device          sio1    at isa? port "IO_COM2" flags 0x205
    device          sio2    at isa? port "IO_COM3" flags 0x205 irq 3

Note that the ``flags`` setting for ``sio1`` and ``sio2`` is truly
essential; refer to
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__ for
details. (Generally, the ``2`` in the "flags" attribute refers to
``sio``\ 2 which holds the IRQ, and you surely want a ``5`` low nibble.)
With kernel verbose mode turned on this should yield something similar
to this:

.. code:: screen

    sio0: irq maps: 0x1 0x11 0x1 0x1
    sio0 at 0x3f8-0x3ff irq 4 flags 0x10 on isa
    sio0: type 16550A
    sio1: irq maps: 0x1 0x9 0x1 0x1
    sio1 at 0x2f8-0x2ff flags 0x205 on isa
    sio1: type 16550A (multiport)
    sio2: irq maps: 0x1 0x9 0x1 0x1
    sio2 at 0x3e8-0x3ef irq 3 flags 0x205 on isa
    sio2: type 16550A (multiport master)

Though ``/sys/i386/isa/sio.c`` is somewhat cryptic with its use of the
“irq maps” array above, the basic idea is that you observe ``0x1`` in
the first, third, and fourth place. This means that the corresponding
IRQ was set upon output and cleared after, which is just what we would
expect. If your kernel does not display this behavior, most likely there
is something wrong with your wiring.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+-------------------------------------+
| `Prev <index.html>`__?      | ?                       | ?\ `Next <cy.html>`__               |
+-----------------------------+-------------------------+-------------------------------------+
| Serial and UART Tutorial?   | `Home <index.html>`__   | ?3.?Configuring the ``cy`` driver   |
+-----------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
