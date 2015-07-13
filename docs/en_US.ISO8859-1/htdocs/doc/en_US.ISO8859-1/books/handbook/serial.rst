=====================================
26.2.?Serial Terminology and Hardware
=====================================

.. raw:: html

   <div class="navheader">

26.2.?Serial Terminology and Hardware
`Prev <serialcomms.html>`__?
Chapter?26.?Serial Communications
?\ `Next <term.html>`__

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

26.2.?Serial Terminology and Hardware
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following terms are often used in serial communications:

.. raw:: html

   <div class="variablelist">

bps
    Bits per Second (bps) is the rate at which data is transmitted.

DTE
    Data Terminal Equipment (DTE) is one of two endpoints in a serial
    communication. An example would be a computer.

DCE
    Data Communications Equipment (DTE) is the other endpoint in a
    serial communication. Typically, it is a modem or serial terminal.

RS-232
    The original standard which defined hardware serial communications.
    It has since been renamed to TIA-232.

.. raw:: html

   </div>

When referring to communication data rates, this section does not use
the term *baud*. Baud refers to the number of electrical state
transitions made in a period of time, while bps is the correct term to
use.

To connect a serial terminal to a FreeBSD system, a serial port on the
computer and the proper cable to connect to the serial device are
needed. Users who are already familiar with serial hardware and cabling
can safely skip this section.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.2.1.?Serial Cables and Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are several different kinds of serial cables. The two most common
types are null-modem cables and standard RS-232 cables. The
documentation for the hardware should describe the type of cable
required.

These two types of cables differ in how the wires are connected to the
connector. Each wire represents a signal, with the defined signals
summarized in `Table?26.1, “RS-232C Signal
Names” <serial.html#serialcomms-signal-names>`__. A standard serial
cable passes all of the RS-232C signals straight through. For example,
the “Transmitted Data” pin on one end of the cable goes to the
“Transmitted Data” pin on the other end. This is the type of cable used
to connect a modem to the FreeBSD system, and is also appropriate for
some terminals.

A null-modem cable switches the “Transmitted Data” pin of the connector
on one end with the “Received Data” pin on the other end. The connector
can be either a DB-25 or a DB-9.

A null-modem cable can be constructed using the pin connections
summarized in `Table?26.2, “DB-25 to DB-25 Null-Modem
Cable” <serial.html#nullmodem-db25>`__, `Table?26.3, “DB-9 to DB-9
Null-Modem Cable” <serial.html#nullmodem-db9>`__, and `Table?26.4, “DB-9
to DB-25 Null-Modem Cable” <serial.html#nullmodem-db9-25>`__. While the
standard calls for a straight-through pin 1 to pin 1 “Protective Ground”
line, it is often omitted. Some terminals work using only pins 2, 3, and
7, while others require different configurations. When in doubt, refer
to the documentation for the hardware.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?26.1.?RS-232C Signal Names

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------+-----------------------+
| Acronyms   | Names                 |
+============+=======================+
| RD         | Received Data         |
+------------+-----------------------+
| TD         | Transmitted Data      |
+------------+-----------------------+
| DTR        | Data Terminal Ready   |
+------------+-----------------------+
| DSR        | Data Set Ready        |
+------------+-----------------------+
| DCD        | Data Carrier Detect   |
+------------+-----------------------+
| SG         | Signal Ground         |
+------------+-----------------------+
| RTS        | Request to Send       |
+------------+-----------------------+
| CTS        | Clear to Send         |
+------------+-----------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?26.2.?DB-25 to DB-25 Null-Modem Cable

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+---------+---------------+---------+----------+
| Signal   | Pin #   | ?             | Pin #   | Signal   |
+==========+=========+===============+=========+==========+
| SG       | 7       | connects to   | 7       | SG       |
+----------+---------+---------------+---------+----------+
| TD       | 2       | connects to   | 3       | RD       |
+----------+---------+---------------+---------+----------+
| RD       | 3       | connects to   | 2       | TD       |
+----------+---------+---------------+---------+----------+
| RTS      | 4       | connects to   | 5       | CTS      |
+----------+---------+---------------+---------+----------+
| CTS      | 5       | connects to   | 4       | RTS      |
+----------+---------+---------------+---------+----------+
| DTR      | 20      | connects to   | 6       | DSR      |
+----------+---------+---------------+---------+----------+
| DTR      | 20      | connects to   | 8       | DCD      |
+----------+---------+---------------+---------+----------+
| DSR      | 6       | connects to   | 20      | DTR      |
+----------+---------+---------------+---------+----------+
| DCD      | 8       | connects to   | 20      | DTR      |
+----------+---------+---------------+---------+----------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?26.3.?DB-9 to DB-9 Null-Modem Cable

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+---------+---------------+---------+----------+
| Signal   | Pin #   | ?             | Pin #   | Signal   |
+==========+=========+===============+=========+==========+
| RD       | 2       | connects to   | 3       | TD       |
+----------+---------+---------------+---------+----------+
| TD       | 3       | connects to   | 2       | RD       |
+----------+---------+---------------+---------+----------+
| DTR      | 4       | connects to   | 6       | DSR      |
+----------+---------+---------------+---------+----------+
| DTR      | 4       | connects to   | 1       | DCD      |
+----------+---------+---------------+---------+----------+
| SG       | 5       | connects to   | 5       | SG       |
+----------+---------+---------------+---------+----------+
| DSR      | 6       | connects to   | 4       | DTR      |
+----------+---------+---------------+---------+----------+
| DCD      | 1       | connects to   | 4       | DTR      |
+----------+---------+---------------+---------+----------+
| RTS      | 7       | connects to   | 8       | CTS      |
+----------+---------+---------------+---------+----------+
| CTS      | 8       | connects to   | 7       | RTS      |
+----------+---------+---------------+---------+----------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?26.4.?DB-9 to DB-25 Null-Modem Cable

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+---------+---------------+---------+----------+
| Signal   | Pin #   | ?             | Pin #   | Signal   |
+==========+=========+===============+=========+==========+
| RD       | 2       | connects to   | 2       | TD       |
+----------+---------+---------------+---------+----------+
| TD       | 3       | connects to   | 3       | RD       |
+----------+---------+---------------+---------+----------+
| DTR      | 4       | connects to   | 6       | DSR      |
+----------+---------+---------------+---------+----------+
| DTR      | 4       | connects to   | 8       | DCD      |
+----------+---------+---------------+---------+----------+
| SG       | 5       | connects to   | 7       | SG       |
+----------+---------+---------------+---------+----------+
| DSR      | 6       | connects to   | 20      | DTR      |
+----------+---------+---------------+---------+----------+
| DCD      | 1       | connects to   | 20      | DTR      |
+----------+---------+---------------+---------+----------+
| RTS      | 7       | connects to   | 5       | CTS      |
+----------+---------+---------------+---------+----------+
| CTS      | 8       | connects to   | 4       | RTS      |
+----------+---------+---------------+---------+----------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When one pin at one end connects to a pair of pins at the other end, it
is usually implemented with one short wire between the pair of pins in
their connector and a long wire to the other single pin.

.. raw:: html

   </div>

Serial ports are the devices through which data is transferred between
the FreeBSD host computer and the terminal. Several kinds of serial
ports exist. Before purchasing or constructing a cable, make sure it
will fit the ports on the terminal and on the FreeBSD system.

Most terminals have DB-25 ports. Personal computers may have DB-25 or
DB-9 ports. A multiport serial card may have RJ-12 or RJ-45/ ports. See
the documentation that accompanied the hardware for specifications on
the kind of port or visually verify the type of port.

In FreeBSD, each serial port is accessed through an entry in ``/dev``.
There are two different kinds of entries:

.. raw:: html

   <div class="itemizedlist">

-  Call-in ports are named ``/dev/ttyuN`` where *``N``* is the port
   number, starting from zero. If a terminal is connected to the first
   serial port (``COM1``), use ``/dev/ttyu0`` to refer to the terminal.
   If the terminal is on the second serial port (``COM2``), use
   ``/dev/ttyu1``, and so forth. Generally, the call-in port is used for
   terminals. Call-in ports require that the serial line assert the
   “Data Carrier Detect” signal to work correctly.

-  Call-out ports are named ``/dev/cuauN`` on FreeBSD versions 10.x and
   higher and ``/dev/cuadN`` on FreeBSD versions 9.x and lower. Call-out
   ports are usually not used for terminals, but are used for modems.
   The call-out port can be used if the serial cable or the terminal
   does not support the “Data Carrier Detect” signal.

.. raw:: html

   </div>

FreeBSD also provides initialization devices (``/dev/ttyuN``.init and
``/dev/cuauN``.init or ``/dev/cuadN``.init) and locking devices
(``/dev/ttyuN``.lock and ``/dev/cuauN``.lock or ``/dev/cuadN``.lock).
The initialization devices are used to initialize communications port
parameters each time a port is opened, such as ``crtscts`` for modems
which use ``RTS/CTS`` signaling for flow control. The locking devices
are used to lock flags on ports to prevent users or programs changing
certain parameters. Refer to
`termios(4) <http://www.FreeBSD.org/cgi/man.cgi?query=termios&sektion=4>`__,
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__, and
`stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1>`__
for information on terminal settings, locking and initializing devices,
and setting terminal options, respectively.

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

26.2.2.?Serial Port Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, FreeBSD supports four serial ports which are commonly known
as ``COM1``, ``COM2``, ``COM3``, and ``COM4``. FreeBSD also supports
dumb multi-port serial interface cards, such as the BocaBoard 1008 and
2016, as well as more intelligent multi-port cards such as those made by
Digiboard. However, the default kernel only looks for the standard
``COM`` ports.

To see if the system recognizes the serial ports, look for system boot
messages that start with ``uart``:

.. code:: screen

    # grep uart /var/run/dmesg.boot

If the system does not recognize all of the needed serial ports,
additional entries can be added to ``/boot/device.hints``. This file
already contains ``hint.uart.0.*`` entries for ``COM1`` and
``hint.uart.1.*`` entries for ``COM2``. When adding a port entry for
``COM3`` use ``0x3E8``, and for ``COM4`` use ``0x2E8``. Common IRQ
addresses are ``5`` for ``COM3`` and ``9`` for ``COM4``.

To determine the default set of terminal I/O settings used by the port,
specify its device name. This example determines the settings for the
call-in port on ``COM2``:

.. code:: screen

    # stty -a -f /dev/ttyu1

System-wide initialization of serial devices is controlled by
``/etc/rc.d/serial``. This file affects the default settings of serial
devices. To change the settings for a device, use ``stty``. By default,
the changed settings are in effect until the device is closed and when
the device is reopened, it goes back to the default set. To permanently
change the default set, open and adjust the settings of the
initialization device. For example, to turn on ``CLOCAL`` mode, 8 bit
communication, and ``XON/XOFF`` flow control for ``ttyu5``, type:

.. code:: screen

    # stty -f /dev/ttyu5.init clocal cs8 ixon ixoff

To prevent certain settings from being changed by an application, make
adjustments to the locking device. For example, to lock the speed of
``ttyu5`` to 57600?bps, type:

.. code:: screen

    # stty -f /dev/ttyu5.lock 57600

Now, any application that opens ``ttyu5`` and tries to change the speed
of the port will be stuck with 57600?bps.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-----------------------------+---------------------------+
| `Prev <serialcomms.html>`__?         | `Up <serialcomms.html>`__   | ?\ `Next <term.html>`__   |
+--------------------------------------+-----------------------------+---------------------------+
| Chapter?26.?Serial Communications?   | `Home <index.html>`__       | ?26.3.?Terminals          |
+--------------------------------------+-----------------------------+---------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
