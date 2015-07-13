===================================
26.6.?Setting Up the Serial Console
===================================

.. raw:: html

   <div class="navheader">

26.6.?Setting Up the Serial Console
`Prev <dialout.html>`__?
Chapter?26.?Serial Communications
?\ `Next <ppp-and-slip.html>`__

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

26.6.?Setting Up the Serial Console
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Kazutaka YOKOTA.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on a document by Bill Paul.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD has the ability to boot a system with a dumb terminal on a
serial port as a console. This configuration is useful for system
administrators who wish to install FreeBSD on machines that have no
keyboard or monitor attached, and developers who want to debug the
kernel or device drivers.

As described in `Chapter?13, *The FreeBSD Booting
Process* <boot.html>`__, FreeBSD employs a three stage bootstrap. The
first two stages are in the boot block code which is stored at the
beginning of the FreeBSD slice on the boot disk. The boot block then
loads and runs the boot loader as the third stage code.

In order to set up booting from a serial console, the boot block code,
the boot loader code, and the kernel need to be configured.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.6.1.?Quick Serial Console Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides a fast overview of setting up the serial console.
This procedure can be used when the dumb terminal is connected to
``COM1``.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?26.1.?Configuring a Serial Console on ``COM1``

.. raw:: html

   </div>

#. Connect the serial cable to ``COM1`` and the controlling terminal.

#. To configure boot messages to display on the serial console, issue
   the following command as the superuser:

   .. code:: screen

       # echo 'console="comconsole"' >> /boot/loader.conf

#. Edit ``/etc/ttys`` and change ``off`` to ``on`` and ``dialup`` to
   ``vt100`` for the ``ttyu0`` entry. Otherwise, a password will not be
   required to connect via the serial console, resulting in a potential
   security hole.

#. Reboot the system to see if the changes took effect.

.. raw:: html

   </div>

If a different configuration is required, see the next section for a
more in-depth configuration explanation.

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

26.6.2.?In-Depth Serial Console Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides a more detailed explanation of the steps needed to
setup a serial console in FreeBSD.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?26.2.?Configuring a Serial Console

.. raw:: html

   </div>

#. Prepare a serial cable.

   Use either a null-modem cable or a standard serial cable and a
   null-modem adapter. See `Section?26.2.1, “Serial Cables and
   Ports” <serial.html#term-cables-null>`__ for a discussion on serial
   cables.

#. Unplug the keyboard.

   Many systems probe for the keyboard during the Power-On Self-Test
   (POST) and will generate an error if the keyboard is not detected.
   Some machines will refuse to boot until the keyboard is plugged in.

   If the computer complains about the error, but boots anyway, no
   further configuration is needed.

   If the computer refuses to boot without a keyboard attached,
   configure the BIOS so that it ignores this error. Consult the
   motherboard's manual for details on how to do this.

   .. raw:: html

      <div class="tip" xmlns="">

   Tip:
   ~~~~

   Try setting the keyboard to “Not installed” in the BIOS. This setting
   tells the BIOS not to probe for a keyboard at power-on so it should
   not complain if the keyboard is absent. If that option is not present
   in the BIOS, look for an “Halt on Error” option instead. Setting this
   to “All but Keyboard” or to “No Errors” will have the same effect.

   .. raw:: html

      </div>

   If the system has a PS/2? mouse, unplug it as well. PS/2? mice share
   some hardware with the keyboard and leaving the mouse plugged in can
   fool the keyboard probe into thinking the keyboard is still there.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   While most systems will boot without a keyboard, quite a few will not
   boot without a graphics adapter. Some systems can be configured to
   boot with no graphics adapter by changing the “graphics adapter”
   setting in the BIOS configuration to “Not installed”. Other systems
   do not support this option and will refuse to boot if there is no
   display hardware in the system. With these machines, leave some kind
   of graphics card plugged in, even if it is just a junky mono board. A
   monitor does not need to be attached.

   .. raw:: html

      </div>

#. Plug a dumb terminal, an old computer with a modem program, or the
   serial port on another UNIX? box into the serial port.

#. Add the appropriate ``hint.sio.*`` entries to ``/boot/device.hints``
   for the serial port. Some multi-port cards also require kernel
   configuration options. Refer to
   `sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__
   for the required options and device hints for each supported serial
   port.

#. Create ``boot.config`` in the root directory of the ``a`` partition
   on the boot drive.

   This file instructs the boot block code how to boot the system. In
   order to activate the serial console, one or more of the following
   options are needed. When using multiple options, include them all on
   the same line:

   .. raw:: html

      <div class="variablelist">

   ``-h``
       Toggles between the internal and serial consoles. Use this to
       switch console devices. For instance, to boot from the internal
       (video) console, use ``-h`` to direct the boot loader and the
       kernel to use the serial port as its console device.
       Alternatively, to boot from the serial port, use ``-h`` to tell
       the boot loader and the kernel to use the video display as the
       console instead.

   ``-D``
       Toggles between the single and dual console configurations. In
       the single configuration, the console will be either the internal
       console (video display) or the serial port, depending on the
       state of ``-h``. In the dual console configuration, both the
       video display and the serial port will become the console at the
       same time, regardless of the state of ``-h``. However, the dual
       console configuration takes effect only while the boot block is
       running. Once the boot loader gets control, the console specified
       by ``-h`` becomes the only console.

   ``-P``
       Makes the boot block probe the keyboard. If no keyboard is found,
       the ``-D`` and ``-h`` options are automatically set.

       .. raw:: html

          <div class="note" xmlns="">

       Note:
       ~~~~~

       Due to space constraints in the current version of the boot
       blocks, ``-P`` is capable of detecting extended keyboards only.
       Keyboards with less than 101 keys and without F11 and F12 keys
       may not be detected. Keyboards on some laptops may not be
       properly found because of this limitation. If this is the case,
       do not use ``-P``.

       .. raw:: html

          </div>

   .. raw:: html

      </div>

   Use either ``-P`` to select the console automatically or ``-h`` to
   activate the serial console. Refer to
   `boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8>`__
   and
   `boot.config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=boot.config&sektion=5>`__
   for more details.

   The options, except for ``-P``, are passed to the boot loader. The
   boot loader will determine whether the internal video or the serial
   port should become the console by examining the state of ``-h``. This
   means that if ``-D`` is specified but ``-h`` is not specified in
   ``/boot.config``, the serial port can be used as the console only
   during the boot block as the boot loader will use the internal video
   display as the console.

#. Boot the machine.

   When FreeBSD starts, the boot blocks echo the contents of
   ``/boot.config`` to the console. For example:

   .. code:: screen

       /boot.config: -P
       Keyboard: no

   The second line appears only if ``-P`` is in ``/boot.config`` and
   indicates the presence or absence of the keyboard. These messages go
   to either the serial or internal console, or both, depending on the
   option in ``/boot.config``:

   .. raw:: html

      <div class="informaltable">

   +----------------------------+--------------------------------+
   | Options                    | Message goes to                |
   +============================+================================+
   | none                       | internal console               |
   +----------------------------+--------------------------------+
   | ``-h``                     | serial console                 |
   +----------------------------+--------------------------------+
   | ``-D``                     | serial and internal consoles   |
   +----------------------------+--------------------------------+
   | ``-Dh``                    | serial and internal consoles   |
   +----------------------------+--------------------------------+
   | ``-P``, keyboard present   | internal console               |
   +----------------------------+--------------------------------+
   | ``-P``, keyboard absent    | serial console                 |
   +----------------------------+--------------------------------+

   .. raw:: html

      </div>

   After the message, there will be a small pause before the boot blocks
   continue loading the boot loader and before any further messages are
   printed to the console. Under normal circumstances, there is no need
   to interrupt the boot blocks, but one can do so in order to make sure
   things are set up correctly.

   Press any key, other than **Enter**, at the console to interrupt the
   boot process. The boot blocks will then prompt for further action:

   .. code:: screen

       >> FreeBSD/i386 BOOT
       Default: 0:ad(0,a)/boot/loader
       boot:

   Verify that the above message appears on either the serial or
   internal console, or both, according to the options in
   ``/boot.config``. If the message appears in the correct console,
   press **Enter** to continue the boot process.

   If there is no prompt on the serial terminal, something is wrong with
   the settings. Enter ``-h`` then **Enter** or **Return** to tell the
   boot block (and then the boot loader and the kernel) to choose the
   serial port for the console. Once the system is up, go back and check
   what went wrong.

.. raw:: html

   </div>

During the third stage of the boot process, one can still switch between
the internal console and the serial console by setting appropriate
environment variables in the boot loader. See
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
for more information.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This line in ``/boot/loader.conf`` or ``/boot/loader.conf.local``
configures the boot loader and the kernel to send their boot messages to
the serial console, regardless of the options in ``/boot.config``:

.. code:: programlisting

    console="comconsole"

That line should be the first line of ``/boot/loader.conf`` so that boot
messages are displayed on the serial console as early as possible.

If that line does not exist, or if it is set to
``console="vidconsole"``, the boot loader and the kernel will use
whichever console is indicated by ``-h`` in the boot block. See
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
for more information.

At the moment, the boot loader has no option equivalent to ``-P`` in the
boot block, and there is no provision to automatically select the
internal console and the serial console based on the presence of the
keyboard.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

While it is not required, it is possible to provide a ``login`` prompt
over the serial line. To configure this, edit the entry for the serial
port in ``/etc/ttys`` using the instructions in `Section?26.3.1,
“Terminal Configuration” <term.html#term-config>`__. If the speed of the
serial port has been changed, change ``std.9600`` to match the new
setting.

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

26.6.3.?Setting a Faster Serial Port Speed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, the serial port settings are 9600 baud, 8 bits, no parity,
and 1 stop bit. To change the default console speed, use one of the
following options:

.. raw:: html

   <div class="itemizedlist">

-  Edit ``/etc/make.conf`` and set ``BOOT_COMCONSOLE_SPEED`` to the new
   console speed. Then, recompile and install the boot blocks and the
   boot loader:

   .. code:: screen

       # cd /sys/boot
       # make clean
       # make
       # make install

   If the serial console is configured in some other way than by booting
   with ``-h``, or if the serial console used by the kernel is different
   from the one used by the boot blocks, add the following option, with
   the desired speed, to a custom kernel configuration file and compile
   a new kernel:

   .. code:: programlisting

       options CONSPEED=19200

-  Add the ``-S19200`` boot option to ``/boot.config``, replacing
   *``19200``* with the speed to use.

-  Add the following options to ``/boot/loader.conf``. Replace
   *``115200``* with the speed to use.

   .. code:: programlisting

       boot_multicons="YES"
       boot_serial="YES"
       comconsole_speed="115200"
       console="comconsole,vidconsole"

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

26.6.4.?Entering the DDB Debugger from the Serial Line
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To configure the ability to drop into the kernel debugger from the
serial console, add the following options to a custom kernel
configuration file and compile the kernel using the instructions in
`Chapter?9, *Configuring the FreeBSD Kernel* <kernelconfig.html>`__.
Note that while this is useful for remote diagnostics, it is also
dangerous if a spurious BREAK is generated on the serial port. Refer to
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__ and
`ddb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=8>`__ for
more information about the kernel debugger.

.. code:: programlisting

    options BREAK_TO_DEBUGGER
    options DDB

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-----------------------------+-----------------------------------+
| `Prev <dialout.html>`__?   | `Up <serialcomms.html>`__   | ?\ `Next <ppp-and-slip.html>`__   |
+----------------------------+-----------------------------+-----------------------------------+
| 26.5.?Dial-out Service?    | `Home <index.html>`__       | ?Chapter?27.?PPP                  |
+----------------------------+-----------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
