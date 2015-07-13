===============
26.3.?Terminals
===============

.. raw:: html

   <div class="navheader">

26.3.?Terminals
`Prev <serial.html>`__?
Chapter?26.?Serial Communications
?\ `Next <dialup.html>`__

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

26.3.?Terminals
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Sean Kelly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Terminals provide a convenient and low-cost way to access a FreeBSD
system when not at the computer's console or on a connected network.
This section describes how to use terminals with FreeBSD.

The original UNIX? systems did not have consoles. Instead, users logged
in and ran programs through terminals that were connected to the
computer's serial ports.

The ability to establish a login session on a serial port still exists
in nearly every UNIX?-like operating system today, including FreeBSD. By
using a terminal attached to an unused serial port, a user can log in
and run any text program that can normally be run on the console or in
an ``xterm`` window.

Many terminals can be attached to a FreeBSD system. An older spare
computer can be used as a terminal wired into a more powerful computer
running FreeBSD. This can turn what might otherwise be a single-user
computer into a powerful multiple-user system.

FreeBSD supports three types of terminals:

.. raw:: html

   <div class="variablelist">

Dumb terminals
    Dumb terminals are specialized hardware that connect to computers
    over serial lines. They are called “dumb” because they have only
    enough computational power to display, send, and receive text. No
    programs can be run on these devices. Instead, dumb terminals
    connect to a computer that runs the needed programs.

    There are hundreds of kinds of dumb terminals made by many
    manufacturers, and just about any kind will work with FreeBSD. Some
    high-end terminals can even display graphics, but only certain
    software packages can take advantage of these advanced features.

    Dumb terminals are popular in work environments where workers do not
    need access to graphical applications.

Computers Acting as Terminals
    Since a dumb terminal has just enough ability to display, send, and
    receive text, any spare computer can be a dumb terminal. All that is
    needed is the proper cable and some *terminal emulation* software to
    run on the computer.

    This configuration can be useful. For example, if one user is busy
    working at the FreeBSD system's console, another user can do some
    text-only work at the same time from a less powerful personal
    computer hooked up as a terminal to the FreeBSD system.

    There are at least two utilities in the base-system of FreeBSD that
    can be used to work through a serial connection:
    `cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1>`__
    and
    `tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1>`__.

    For example, to connect from a client system that runs FreeBSD to
    the serial connection of another system:

    .. code:: screen

        # cu -l serial-port-device

    Replace *``serial-port-device``* with the device name of the
    connected serial port. These device files are called ``/dev/cuauN``
    on FreeBSD versions 10.x and higher and ``/dev/cuadN`` on FreeBSD
    versions 9.x and lower. In either case, *``N``* is the serial port
    number, starting from zero. This means that ``COM1`` is
    ``/dev/cuau0`` or ``/dev/cuad0`` in FreeBSD.

    Additional programs are available through the Ports Collection, such
    as
    `comms/minicom <http://www.freebsd.org/cgi/url.cgi?ports/comms/minicom/pkg-descr>`__.

X Terminals
    X terminals are the most sophisticated kind of terminal available.
    Instead of connecting to a serial port, they usually connect to a
    network like Ethernet. Instead of being relegated to text-only
    applications, they can display any Xorg application.

    This chapter does not cover the setup, configuration, or use of X
    terminals.

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

26.3.1.?Terminal Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how to configure a FreeBSD system to enable a
login session on a serial terminal. It assumes that the system
recognizes the serial port to which the terminal is connected and that
the terminal is connected with the correct cable.

In FreeBSD, ``init`` reads ``/etc/ttys`` and starts a ``getty`` process
on the available terminals. The ``getty`` process is responsible for
reading a login name and starting the ``login`` program. The ports on
the FreeBSD system which allow logins are listed in ``/etc/ttys``. For
example, the first virtual console, ``ttyv0``, has an entry in this
file, allowing logins on the console. This file also contains entries
for the other virtual consoles, serial ports, and pseudo-ttys. For a
hardwired terminal, the serial port's ``/dev`` entry is listed without
the ``/dev`` part. For example, ``/dev/ttyv0`` is listed as ``ttyv0``.

The default ``/etc/ttys`` configures support for the first four serial
ports, ``ttyu0`` through ``ttyu3``:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty std.9600"   dialup  off secure
    ttyu1   "/usr/libexec/getty std.9600"   dialup  off secure
    ttyu2   "/usr/libexec/getty std.9600"   dialup  off secure
    ttyu3   "/usr/libexec/getty std.9600"   dialup  off secure

When attaching a terminal to one of those ports, modify the default
entry to set the required speed and terminal type, to turn the device
``on`` and, if needed, to change the port's ``secure`` setting. If the
terminal is connected to another port, add an entry for the port.

`Example?26.1, “Configuring Terminal Entries” <term.html#ex-etc-ttys>`__
configures two terminals in ``/etc/ttys``. The first entry configures a
Wyse-50 connected to ``COM2``. The second entry configures an old
computer running Procomm terminal software emulating a VT-100 terminal.
The computer is connected to the sixth serial port on a multi-port
serial card.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?26.1.?Configuring Terminal Entries

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    ttyu1  "/usr/libexec/getty std.38400"  wy50  on  insecure
    ttyu5   "/usr/libexec/getty std.19200"  vt100  on insecure

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ttys-line1col1>`__         | The first field specifies the device |
|                                      | name of the serial terminal.         |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ttys-line1col2>`__         | The second field tells ``getty`` to  |
|                                      | initialize and open the line, set    |
|                                      | the line speed, prompt for a user    |
|                                      | name, and then execute the ``login`` |
|                                      | program. The optional *getty type*   |
|                                      | configures characteristics on the    |
|                                      | terminal line, like bps rate and     |
|                                      | parity. The available getty types    |
|                                      | are listed in ``/etc/gettytab``. In  |
|                                      | almost all cases, the getty types    |
|                                      | that start with ``std`` will work    |
|                                      | for hardwired terminals as these     |
|                                      | entries ignore parity. There is a    |
|                                      | ``std`` entry for each bps rate from |
|                                      | 110 to 115200. Refer to              |
|                                      | `gettytab(5) <http://www.FreeBSD.org |
|                                      | /cgi/man.cgi?query=gettytab&sektion= |
|                                      | 5>`__                                |
|                                      | for more information.                |
|                                      |                                      |
|                                      | When setting the getty type, make    |
|                                      | sure to match the communications     |
|                                      | settings used by the terminal. For   |
|                                      | this example, the Wyse-50 uses no    |
|                                      | parity and connects at 38400?bps.    |
|                                      | The computer uses no parity and      |
|                                      | connects at 19200?bps.               |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ttys-line1col3>`__         | The third field is the type of       |
|                                      | terminal. For dial-up ports,         |
|                                      | ``unknown`` or ``dialup`` is         |
|                                      | typically used since users may dial  |
|                                      | up with practically any type of      |
|                                      | terminal or software. Since the      |
|                                      | terminal type does not change for    |
|                                      | hardwired terminals, a real terminal |
|                                      | type from ``/etc/termcap`` can be    |
|                                      | specified. For this example, the     |
|                                      | Wyse-50 uses the real terminal type  |
|                                      | while the computer running Procomm   |
|                                      | is set to emulate a VT-100.          |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ttys-line1col4>`__         | The fourth field specifies if the    |
|                                      | port should be enabled. To enable    |
|                                      | logins on this port, this field must |
|                                      | be set to ``on``.                    |
+--------------------------------------+--------------------------------------+
| `|5| <#co-ttys-line1col5>`__         | The final field is used to specify   |
|                                      | whether the port is secure. Marking  |
|                                      | a port as ``secure`` means that it   |
|                                      | is trusted enough to allow ``root``  |
|                                      | to login from that port. Insecure    |
|                                      | ports do not allow ``root`` logins.  |
|                                      | On an insecure port, users must      |
|                                      | login from unprivileged accounts and |
|                                      | then use ``su`` or a similar         |
|                                      | mechanism to gain superuser          |
|                                      | privileges, as described in          |
|                                      | `Section?4.3.1.3, “The Superuser     |
|                                      | Account” <users-synopsis.html#users- |
|                                      | superuser>`__.                       |
|                                      | For security reasons, it is          |
|                                      | recommended to change this setting   |
|                                      | to ``insecure``.                     |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After making any changes to ``/etc/ttys``, send a SIGHUP (hangup) signal
to the ``init`` process to force it to re-read its configuration file:

.. code:: screen

    # kill -HUP 1

Since ``init`` is always the first process run on a system, it always
has a process ID of ``1``.

If everything is set up correctly, all cables are in place, and the
terminals are powered up, a ``getty`` process should now be running on
each terminal and login prompts should be available on each terminal.

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

26.3.2.?Troubleshooting the Connection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Even with the most meticulous attention to detail, something could still
go wrong while setting up a terminal. Here is a list of common symptoms
and some suggested fixes.

If no login prompt appears, make sure the terminal is plugged in and
powered up. If it is a personal computer acting as a terminal, make sure
it is running terminal emulation software on the correct serial port.

Make sure the cable is connected firmly to both the terminal and the
FreeBSD computer. Make sure it is the right kind of cable.

Make sure the terminal and FreeBSD agree on the bps rate and parity
settings. For a video display terminal, make sure the contrast and
brightness controls are turned up. If it is a printing terminal, make
sure paper and ink are in good supply.

Use ``ps`` to make sure that a ``getty`` process is running and serving
the terminal. For example, the following listing shows that a ``getty``
is running on the second serial port, ``ttyu1``, and is using the
``std.38400`` entry in ``/etc/gettytab``:

.. code:: screen

    # ps -axww|grep ttyu
    22189  d1  Is+    0:00.03 /usr/libexec/getty std.38400 ttyu1

If no ``getty`` process is running, make sure the port is enabled in
``/etc/ttys``. Remember to run ``kill -HUP 1`` after modifying
``/etc/ttys``.

If the ``getty`` process is running but the terminal still does not
display a login prompt, or if it displays a prompt but will not accept
typed input, the terminal or cable may not support hardware handshaking.
Try changing the entry in ``/etc/ttys`` from ``std.38400`` to
``3wire.38400``, then run ``kill -HUP       1`` after modifying
``/etc/ttys``. The ``3wire`` entry is similar to ``std``, but ignores
hardware handshaking. The baud rate may need to be reduced or software
flow control enabled when using ``3wire`` to prevent buffer overflows.

If garbage appears instead of a login prompt, make sure the terminal and
FreeBSD agree on the bps rate and parity settings. Check the ``getty``
processes to make sure the correct *``getty``* type is in use. If not,
edit ``/etc/ttys`` and run ``kill       -HUP 1``.

If characters appear doubled and the password appears when typed, switch
the terminal, or the terminal emulation software, from “half duplex” or
“local echo” to “full duplex.”

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-----------------------------+-----------------------------+
| `Prev <serial.html>`__?                  | `Up <serialcomms.html>`__   | ?\ `Next <dialup.html>`__   |
+------------------------------------------+-----------------------------+-----------------------------+
| 26.2.?Serial Terminology and Hardware?   | `Home <index.html>`__       | ?26.4.?Dial-in Service      |
+------------------------------------------+-----------------------------+-----------------------------+

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
