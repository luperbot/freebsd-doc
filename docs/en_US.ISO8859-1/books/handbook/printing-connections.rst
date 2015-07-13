=========================
10.2.?Printer Connections
=========================

.. raw:: html

   <div class="navheader">

10.2.?Printer Connections
`Prev <printing.html>`__?
Chapter?10.?Printing
?\ `Next <printing-pdls.html>`__

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

10.2.?Printer Connections
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Printers are connected to computer systems in a variety of ways. Small
desktop printers are usually connected directly to computer's USB port.
Older printers are connected to a parallel or “printer” port. Some
printers are directly connected to a network, making it easy for
multiple computers share them. A few printers use a much less common
serial port connection.

FreeBSD can communicate with all of these types of printers.

.. raw:: html

   <div class="variablelist">

USB
    USB printers can be connected to any available USB port on the
    computer.

    When FreeBSD detects a USB printer, two device entries are created:
    ``/dev/ulpt0`` and ``/dev/unlpt0``. Data sent to either device will
    be relayed to the printer. After each print job, ``ulpt0`` resets
    the USB port. Resetting the port can cause problems with some
    printers, so the ``unlpt0`` device is used instead. ``unlpt0`` does
    not reset the USB port at all.

Parallel (IEEE-1284)
    The parallel port device is ``/dev/lpt0``. This device appears
    whether a printer is attached or not, it is not autodetected.

    Vendors have largely moved away from these “legacy” ports, and many
    computers no longer have them. Adapters can be used to connect a
    parallel printer to a USB port. With such an adapter, the printer
    can be treated as if it were actually a USB printer. Devices called
    *print servers* can also be used to connect parallel printers
    directly to a network.

Serial (RS-232)
    Serial ports are another legacy port, rarely used for printers
    except in certain niche applications. Cables, connectors, and
    required wiring vary widely.

    For serial ports built into a motherboard, the serial device name is
    ``/dev/cuau0`` or ``/dev/cuau1``. Serial USB adapters can also be
    used, and these will appear as ``/dev/cuaU0``.

    Several communication parameters must be known to communicate with a
    serial printer. The most important are *baud rate* and *parity*.
    Values vary, but typical serial printers often use a baud rate of
    9600 and no parity.

Network
    Network printers are connected directly to the local computer
    network.

    The DNS hostname of the printer must be known. If the printer is
    assigned a dynamic address by DHCP, DNS should be dynamically
    updated so that the host name always has the correct IP address.
    Network printers are often given static IP addresses to avoid this
    problem.

    Most network printers understand print jobs sent with the LPD
    protocol. A print queue name can also be specified. Some printers
    process data differently depending on which queue is used. For
    example, a ``raw`` queue prints the data unchanged, while the
    ``text`` queue adds carriage returns to plain text.

    Many network printers can also print data sent directly to port
    9100.

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

10.2.1.?Summary
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wired network connections are usually the easiest to set up and give the
fastest printing. For direct connection to the computer, USB is
preferred for speed and simplicity. Parallel connections work but have
limitations on cable length and speed. Serial connections are more
difficult to configure. Cable wiring differs between models, and
communication parameters like baud rate and parity bits must add to the
complexity. Fortunately, serial printers are rare.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+--------------------------+--------------------------------------------+
| `Prev <printing.html>`__?   | `Up <printing.html>`__   | ?\ `Next <printing-pdls.html>`__           |
+-----------------------------+--------------------------+--------------------------------------------+
| Chapter?10.?Printing?       | `Home <index.html>`__    | ?10.3.?Common Page Description Languages   |
+-----------------------------+--------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
