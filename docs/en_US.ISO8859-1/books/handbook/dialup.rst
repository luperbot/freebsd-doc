=====================
26.4.?Dial-in Service
=====================

.. raw:: html

   <div class="navheader">

26.4.?Dial-in Service
`Prev <term.html>`__?
Chapter?26.?Serial Communications
?\ `Next <dialout.html>`__

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

26.4.?Dial-in Service
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Guy Helmer.

.. raw:: html

   </div>

.. raw:: html

   <div>

Additions by Sean Kelly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuring a FreeBSD system for dial-in service is similar to
configuring terminals, except that modems are used instead of terminal
devices. FreeBSD supports both external and internal modems.

External modems are more convenient because they often can be configured
via parameters stored in non-volatile RAM and they usually provide
lighted indicators that display the state of important RS-232 signals,
indicating whether the modem is operating properly.

Internal modems usually lack non-volatile RAM, so their configuration
may be limited to setting DIP switches. If the internal modem has any
signal indicator lights, they are difficult to view when the system's
cover is in place.

When using an external modem, a proper cable is needed. A standard
RS-232C serial cable should suffice.

FreeBSD needs the RTS and CTS signals for flow control at speeds above
2400?bps, the CD signal to detect when a call has been answered or the
line has been hung up, and the DTR signal to reset the modem after a
session is complete. Some cables are wired without all of the needed
signals, so if a login session does not go away when the line hangs up,
there may be a problem with the cable. Refer to `Section?26.2.1, “Serial
Cables and Ports” <serial.html#term-cables-null>`__ for more information
about these signals.

Like other UNIX?-like operating systems, FreeBSD uses the hardware
signals to find out when a call has been answered or a line has been
hung up and to hangup and reset the modem after a call. FreeBSD avoids
sending commands to the modem or watching for status reports from the
modem.

FreeBSD supports the NS8250, NS16450, NS16550, and NS16550A-based
RS-232C (CCITT V.24) communications interfaces. The 8250 and 16450
devices have single-character buffers. The 16550 device provides a
16-character buffer, which allows for better system performance. Bugs in
plain 16550 devices prevent the use of the 16-character buffer, so use
16550A devices if possible. Because single-character-buffer devices
require more work by the operating system than the 16-character-buffer
devices, 16550A-based serial interface cards are preferred. If the
system has many active serial ports or will have a heavy load,
16550A-based cards are better for low-error-rate communications.

The rest of this section demonstrates how to configure a modem to
receive incoming connections, how to communicate with the modem, and
offers some troubleshooting tips.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.4.1.?Modem Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As with terminals, ``init`` spawns a ``getty`` process for each
configured serial port used for dial-in connections. When a user dials
the modem's line and the modems connect, the “Carrier Detect” signal is
reported by the modem. The kernel notices that the carrier has been
detected and instructs ``getty`` to open the port and display a
``login:`` prompt at the specified initial line speed. In a typical
configuration, if garbage characters are received, usually due to the
modem's connection speed being different than the configured speed,
``getty`` tries adjusting the line speeds until it receives reasonable
characters. After the user enters their login name, ``getty`` executes
``login``, which completes the login process by asking for the user's
password and then starting the user's shell.

There are two schools of thought regarding dial-up modems. One
confiuration method is to set the modems and systems so that no matter
at what speed a remote user dials in, the dial-in RS-232 interface runs
at a locked speed. The benefit of this configuration is that the remote
user always sees a system login prompt immediately. The downside is that
the system does not know what a user's true data rate is, so full-screen
programs like Emacs will not adjust their screen-painting methods to
make their response better for slower connections.

The second method is to configure the RS-232 interface to vary its speed
based on the remote user's connection speed. Because ``getty`` does not
understand any particular modem's connection speed reporting, it gives a
``login:`` message at an initial speed and watches the characters that
come back in response. If the user sees junk, they should press
**Enter** until they see a recognizable prompt. If the data rates do not
match, ``getty`` sees anything the user types as junk, tries the next
speed, and gives the ``login:`` prompt again. This procedure normally
only takes a keystroke or two before the user sees a good prompt. This
login sequence does not look as clean as the locked-speed method, but a
user on a low-speed connection should receive better interactive
response from full-screen programs.

When locking a modem's data communications rate at a particular speed,
no changes to ``/etc/gettytab`` should be needed. However, for a
matching-speed configuration, additional entries may be required in
order to define the speeds to use for the modem. This example configures
a 14.4?Kbps modem with a top interface speed of 19.2?Kbps using 8-bit,
no parity connections. It configures ``getty`` to start the
communications rate for a V.32bis connection at 19.2?Kbps, then cycles
through 9600?bps, 2400?bps, 1200?bps, 300?bps, and back to 19.2?Kbps.
Communications rate cycling is implemented with the ``nx=`` (next table)
capability. Each line uses a ``tc=`` (table continuation) entry to pick
up the rest of the settings for a particular data rate.

.. code:: programlisting

    #
    # Additions for a V.32bis Modem
    #
    um|V300|High Speed Modem at 300,8-bit:\
            :nx=V19200:tc=std.300:
    un|V1200|High Speed Modem at 1200,8-bit:\
            :nx=V300:tc=std.1200:
    uo|V2400|High Speed Modem at 2400,8-bit:\
            :nx=V1200:tc=std.2400:
    up|V9600|High Speed Modem at 9600,8-bit:\
            :nx=V2400:tc=std.9600:
    uq|V19200|High Speed Modem at 19200,8-bit:\
            :nx=V9600:tc=std.19200:

For a 28.8?Kbps modem, or to take advantage of compression on a
14.4?Kbps modem, use a higher communications rate, as seen in this
example:

.. code:: programlisting

    #
    # Additions for a V.32bis or V.34 Modem
    # Starting at 57.6 Kbps
    #
    vm|VH300|Very High Speed Modem at 300,8-bit:\
            :nx=VH57600:tc=std.300:
    vn|VH1200|Very High Speed Modem at 1200,8-bit:\
            :nx=VH300:tc=std.1200:
    vo|VH2400|Very High Speed Modem at 2400,8-bit:\
            :nx=VH1200:tc=std.2400:
    vp|VH9600|Very High Speed Modem at 9600,8-bit:\
            :nx=VH2400:tc=std.9600:
    vq|VH57600|Very High Speed Modem at 57600,8-bit:\
            :nx=VH9600:tc=std.57600:

For a slow CPU or a heavily loaded system without 16550A-based serial
ports, this configuration may produce sio “silo” errors at 57.6?Kbps.

The configuration of ``/etc/ttys`` is similar to `Example?26.1,
“Configuring Terminal Entries” <term.html#ex-etc-ttys>`__, but a
different argument is passed to ``getty`` and ``dialup`` is used for the
terminal type. Replace *``xxx``* with the process ``init`` will run on
the device:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty xxx"   dialup on

The ``dialup`` terminal type can be changed. For example, setting
``vt102`` as the default terminal type allows users to use VT102
emulation on their remote systems.

For a locked-speed configuration, specify the speed with a valid type
listed in ``/etc/gettytab``. This example is for a modem whose port
speed is locked at 19.2?Kbps:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty std.19200"   dialup on

In a matching-speed configuration, the entry needs to reference the
appropriate beginning “auto-baud” entry in ``/etc/gettytab``. To
continue the example for a matching-speed modem that starts at
19.2?Kbps, use this entry:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty V19200"   dialup on

After editing ``/etc/ttys``, wait until the modem is properly configured
and connected before signaling ``init``:

.. code:: screen

    # kill -HUP 1

High-speed modems, like V.32, V.32bis, and V.34 modems, use hardware
(``RTS/CTS``) flow control. Use ``stty`` to set the hardware flow
control flag for the modem port. This example sets the ``crtscts`` flag
on ``COM2``'s dial-in and dial-out initialization devices:

.. code:: screen

    # stty -f /dev/ttyu1.init crtscts
    # stty -f /dev/cuau1.init crtscts

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

26.4.2.?Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides a few tips for troubleshooting a dial-up modem
that will not connect to a FreeBSD system.

Hook up the modem to the FreeBSD system and boot the system. If the
modem has status indication lights, watch to see whether the modem's DTR
indicator lights when the ``login:`` prompt appears on the system's
console. If it lights up, that should mean that FreeBSD has started a
``getty`` process on the appropriate communications port and is waiting
for the modem to accept a call.

If the DTR indicator does not light, login to the FreeBSD system through
the console and type ``ps ax`` to see if FreeBSD is running a ``getty``
process on the correct port:

.. code:: screen

      114 ??  I      0:00.10 /usr/libexec/getty V19200 ttyu0

If the second column contains a ``d0`` instead of a ``??`` and the modem
has not accepted a call yet, this means that ``getty`` has completed its
open on the communications port. This could indicate a problem with the
cabling or a misconfigured modem because ``getty`` should not be able to
open the communications port until the carrier detect signal has been
asserted by the modem.

If no ``getty`` processes are waiting to open the port, double-check
that the entry for the port is correct in ``/etc/ttys``. Also, check
``/var/log/messages`` to see if there are any log messages from ``init``
or ``getty``.

Next, try dialing into the system. Be sure to use 8 bits, no parity, and
1 stop bit on the remote system. If a prompt does not appear right away,
or the prompt shows garbage, try pressing **Enter** about once per
second. If there is still no ``login:`` prompt, try sending a ``BREAK``.
When using a high-speed modem, try dialing again after locking the
dialing modem's interface speed.

If there is still no ``login:`` prompt, check ``/etc/gettytab`` again
and double-check that:

.. raw:: html

   <div class="itemizedlist">

-  The initial capability name specified in the entry in ``/etc/ttys``
   matches the name of a capability in ``/etc/gettytab``.

-  Each ``nx=`` entry matches another ``gettytab`` capability name.

-  Each ``tc=`` entry matches another ``gettytab`` capability name.

.. raw:: html

   </div>

If the modem on the FreeBSD system will not answer, make sure that the
modem is configured to answer the phone when DTR is asserted. If the
modem seems to be configured correctly, verify that the DTR line is
asserted by checking the modem's indicator lights.

If it still does not work, try sending an email to the `FreeBSD general
questions mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
describing the modem and the problem.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------+-----------------------------+------------------------------+
| `Prev <term.html>`__?   | `Up <serialcomms.html>`__   | ?\ `Next <dialout.html>`__   |
+-------------------------+-----------------------------+------------------------------+
| 26.3.?Terminals?        | `Home <index.html>`__       | ?26.5.?Dial-out Service      |
+-------------------------+-----------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
